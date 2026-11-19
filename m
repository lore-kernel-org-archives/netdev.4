Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048243;
	b=Q96hTxTf7EqxQI9jaBSUCaEEYSsqCc8xH3mODsp+lKFNsusNnGx/UmBzLvVTxcVh0BWe
	 slO8jJjbuTD2m5juhBMFML4uNS4lF0i9AMxAzxPg+9pVa7TTWyMU9LGFxrt9fNSAVQj7i
	 vJsWOsueSEga2KpFJUrhcpX3WwW4+VyqgShBtU8VMYmJagYz+g+mZqZjLKc/CTu9J7nU8
	 raAZA7Wmh+vO9RDaWl2ReFicogkSkJSvdGB70DcoI6dwSe/gZxGTCZVj5wetTj9k0EEPW
	 +p59UmwiDxriO6DA77G2agixQfNUb/SFjRXpAEO/n5MjOjDk4o8JI8z5YqFxeQBYlZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
	b=CAag608RBpGklU1reJgSAMTYCbSmjpfxUdKS3YUifpy25lvfzshIXdU/HyQARmIjjFsl
	 l0zSAPdYZY3W986xyY/yvvfgo6B1ZTk8CZSD/BG/g8eu66VAVInRR/7qRiv2PnBnc7t+n
	 BWsPqSaLMe1mbsNUNj6TXmj0THo2tpFA5IQfM9zSqhNgcnmMxPm//XATArKvjS9lY1hJn
	 pMaQ/c3wPquz1kl/munmuSONbPO4ajkOMt/LDgZfTaRtWH9z0Dn4cPwzjSIkax2m+kkQN
	 aDKquuaJiH8FWDDvm4xZXCNxzjQ0RTDykMfqyP/sQxLVZQqiennRdwX2Pq3uoiX+lvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDE606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DDE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b54c019db4so246740a12.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048241; x=1795653041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=DA7ly8QklzTVI7vPByhXLORbOFKqcXC58tufHLEdaxrOBAgryP/bxMy8mJSB2CBH/8
         ado34FlA3guZ02gcBVrHlUq0WnZCAr9MTeyv9c//VuYh0Rjht8q2cqzQseKZ2UakxqDC
         py2sLEVftQnh7sMRtlOe+3Q33a+VTzYGzFL73vTTAt2BkjaS9KZeU2O2EHm8+I3a4SK2
         AuulkU7iy32PXxQbvH8aJfbM8R+Yy6Twtcd6eoXg8JYDXAqZE5K6CUPSbF8vkX5rZu5Y
         af9FdJpKLabOZkxQrTEds7KXKdFETs6vAz7Y/OoDQUHbEtMi7TF9djIVNa8O+k0K4x1a
         V2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048241; x=1795653041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=xwn6kJP3FIbyjZoxmy2JCsbEYFY294v5Xi0NTeFuMCzcX+KwkEoP4ezC6KSTkJ6b1N
         XeWCiAiiDHQxQ6gZNOk5Hb9ngo8Xaf7QOnm6zIds9256DG7CxvbmZK7zeBgrS/yPrkPg
         l+ii2KppYmIu7SFnO1Hs+fFXMxVHzUXnHm9AF9Apvlu4Z6tZgv7MSz54Dgp33M0mc4Qe
         iwQ0B+n6HJALkf/FOwF0VkJepsFbp32iqbN0WlwrAGjwq0r0njPgj2WuB2PPwJC6c0i/
         Vjs6lO4hZN1RrgexHM7NZ4yghnaiosVnIGSB58OxIJ4bAO+n7Bvo3KlWZLDw80jHS2Fq
         hTZA==
X-Forwarded-Encrypted: i=1; AL+hErH4Yj6JLB3UoB7UeYQPfS/N3oCgcsMSz7OkPUvm71yEZHMAR/lLlPduaS35HtuszpUA1N5L4Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NflquODL/APiynLxaK39LNQle2f1l+DY6IChYAPr2dSu9Tuzr
	EDgfImAiVieRcvulT7DTQTGaaU8oKe5fLqukbhnG3iALr2ohq9Cdgw11
X-Gm-Gg: AYBFou2qgP2fCnaAaWBLZ7ET+BMjiLJimvLWWVlDMVtW1IKpYrzf3ELQ19dfMXGsupO
	LwKbjV6joJnZ9TJkXYS7PwtbO0mP7yjz0gp1qT0U8CQKibQ/vaZJ78pT1H7gFCtGcX8JIDDH2qD
	+p4ISgAZz9Vsa5eCS/WDSwLDak9l3qMFsVRUkkSoMjPwOQWJDfE2JaspIkx18n0yGq+ubptlQHp
	7v+2Kf5x1EKE7g1+pJIXL6VaXpXFAxnvHl9WgS4mhQqxdF+7Rg83/6Lph6e4ueeLqPGk5FXOWqc
	UM0imzCYiSIpdzOnsD1eoovjqJCG9kH6pHzSpaif/WmMGglpba8HGb0SLoI6FJwFc+UlmWnITVJ
	5WqNmYZgS4VNT5kAaSwMi191aeWDL8bMnUblR4h4UyVp2HBrOeT/MMkMwhUAUT3hi0EhIlQv+hL
	ffZrftfeM/74U1RKMRCsiSLGxlYkIj0kyDlXtt0nGCRs1AZZUSbIQPp0PxyAvZegbFuLHPq/AAV
	Xa470Oub15ON99QAj2sqXirqAWviT/yutjUqNQPSMfcfulQj3qHWxVQgg3gSlrA4KalnRWPf6GI
	rYV7WGtTTpSCMyO8kMg3xpv+AUgFcc0W0rxKvQbqRwx4gqBbhY+W
X-Received: by 2002:a05:6402:3137:b0:6b7:aca7:4cee with SMTP id 4fb4d7f45d1cf-6b887eac9d2mr3678935a12.3.1795048241161;
        Wed, 18 Nov 2026 16:30:41 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:40 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Thu, 19 Nov 2026 01:30:02 +0100
Message-ID: <20261119003003.40482-4-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "setting invalid channels nr" check treats CPUS+1 (CPUS=`nproc`)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 2a37d21f97da5..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -464,7 +464,9 @@ fi
 ip netns exec $NS_DST ethtool -L veth$DST combined 2 2>/dev/null
 chk_channels "bad setting: combined channels" $DST $CUR_RX $CUR_TX
 
-ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
+MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
+	grep TX: | head -n 1 | awk '{print $2}'`
+ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
 chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX
 
 if [ $CPUS -gt 1 ]; then
-- 
2.43.0

