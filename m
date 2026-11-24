Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555044;
	b=njasVaIlqs+BmsSvqjaTja2u2DPx0+lav7Vbmm6/9XBeWYq3El/8tCg2DdqPjFYHZ+7K
	 iEg/34mskKcJH01aaYszalOGL7+eR8oygHaaxS5v18nl21LGkwdqWhROJcD5+NnlOnmEE
	 ibpo7PDeayypPBo63mgv4LCl3j2ypdFil47uR7w2X5Hk2GIq/3e+5YX+IR4q5l9nU5r4j
	 z152niX0m4OIAjSxNn5tLdlScFYK2OUWOK9ayNvxSatyHKZzS/LIY9tbDnG3wyzAx3SUi
	 Zef2eOVZG870ehYwzQ1qxIb1D1hiw9F0dRWHbrKvIiZc+ZTZoJJ61UQFW8JakVFwAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
	b=L9WOuCggYcy6a2pe8jKAtsdAh/XW1sbpGQZPEIolzKrNgGfMl7dnXdI3KSFnh2xiEjp8
	 4dGm6WQHpSut1cnXl+F2THPR6h137VeBd+z0F4e4gLmLjDxQNnAXireYPxiYvN/oa29pG
	 GCRckd0BwI2Zsk0AuQY0cpuZIfNiMfDt34W2NBcEH+ABQWKdUlJRyeYJSOACtXPhDXIgm
	 +ALuKpKuydjiU4Ax9CUsPu8R5qXER0EBzr9PiR5TdFGMZDKKeBq0eGOshKV7Z4msq5av+
	 QT1lgHz7cSAlxrqDqnjeJHjfNKM4/FW2AdJmgYYIbXKB0Huj7LTlMhkZnky9Wr1PqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2635606A6AF
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2635606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb8ecdcbb8so3554145e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555040; x=1796159840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=zQskcA8ZlHw7+1G3I3S8bg8c2UnVXlDZpZFu/cHgKNGJGagbRIqOyY8ZsJbyrXc3gZ
         s4tIZ/+yuoMMpwlJUeGZrac0nZPZTc2nZOorRhGee391KR2ctTyoGtIXZ7o3NSEJxRjc
         m4vcvdkH/VXXFLIiQpsIbfJd5cvuFI3aSATqy6dwE9CDrGlBMc7f2YT3ZLeuP8gnBA90
         7kVR8RjQwfYJQq+Qw3NCCdLS9Q9rOShcLzOfNWvczoRzXOeCMuPdUHYNIpcrXOZV3vf3
         ClZeVw94hZhtQX9wsvJnTTvEMf6F31dOKw5kDD3tOtGEHOWCZhTDg7ROxHfnuJLC5yFC
         CIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555040; x=1796159840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=bcRdd2XgEhcroTc3FN5RiknPmezQih19yaS1CbnWkgbd2axkvJ/RqOfestUDneECNv
         4NRKyd1CWwintMG70EGwYiuyPsfm+fiioRZ7nyMuf/9OH2wbPjbHegkDV7DVHyk6r7Cu
         Xe7h07EcmD+5N4gYu5T7I6Un70ltnvnA93Kxcx4s0tl3qffMQMk6oB3TE0yyaujHqjgz
         5JKU7szH5HKKK7tKfV5/f7TsZKQd/5m4Rb6lgBwkdIafRki+SCAdlmtUugafjuOpF8sr
         wO3Eve+bMXR7LFv60VbnmzXY8t6qSCK0aLH/7Ovk0XIytNi8TCl2MGlKJ8k+zAIsdU8E
         1QCw==
X-Forwarded-Encrypted: i=1; AL+hErHwE5H7+WmjRblooOIHDaHvHz9w/kiykn9HVFm9U1iA0lcHbx7s9pZIbljTshY0PFOrZbEtDGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CQiw/3YXbIa6bbLo/aLbBeMF2MTrSluUJNYhnZrymXbGw0rma
	6/U3+bxUDHC1dCVW2slb2U2/BYRTUPEdfGgyyWx+pNzmqlnxlH5hR6RK
X-Gm-Gg: AZFdTZdmMC7pQOSDLTWvYwL6VWKHGF3NEHHKOOG+c0/pk9LNekCjqqkw2WrQu3HQWdQ
	Cw+pdS+gbFht09Fn7Izy8shTSfJN/Gz/KLRFKcNVPGluq1t5pCTzB/B7O6aSNJ85riouRMR2fPr
	2d+pTMrxxxgwaCB5oEA5BtDuB+D11TpTT30iNkiwrj7b2edWXUhmQrnqddLp35V20NhDvhUeySM
	9aFQXyNfmbUoyh9Fz7Rabci1gQjvR3kRNb4Pg/9DCGxeVmIqPjmSTBSXTQrjBHoYJt0QmHPjL9i
	iw0fypxIn8cUH7JVMjl1rN2mKE/cRM1tjTX8K12gIRkAJio3cT39ciakvdrxQrJ3fvx8ybqI7At
	IOtd3MSN7llPF/koBkUKEn4YjQngj/0i7h1osbMu9kaegmi3dNTyojYAXzJEHV5kyC4MJgo/L8A
	cAO0bP4q1IjXuM/aI6Ulni07Wlug50E+HtNTUkRU1kE0x16Ry7cdcmOzNopndyPLbuF+vmEK4ru
	ThOACnYitysR7e2BINdp7h809CKaBRvu0qYg0DTAXTiOgwGIbl+v0F/bWmdZ/Xph8tREIcnpbq4
	3z/rqB4zAKWvA0bGnOxbqb5pdj8qkl7AmkQdZDfFDJiWfHY+3rss0nVsRf01nfO6dSch
X-Received: by 2002:a05:6000:4812:b0:4a6:bc53:2472 with SMTP id ffacd0b85a97d-4abb3b41cf6mr29086128f8f.5.1795555040099;
        Tue, 24 Nov 2026 13:17:20 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:19 -0800 (PST)
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v6] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:16:44 +0100
Message-ID: <20261124211645.5751-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211645.5751-1-emmaonana18@gmail.com>
References: <20261124211645.5751-1-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=nproc)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..22246278e6049 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -463,7 +463,9 @@ fi
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

