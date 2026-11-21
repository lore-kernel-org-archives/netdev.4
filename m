Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285611;
	b=LlvzaIa51tNPCJLLH4bkCzbHY7nPNS6mtQ6ucjnKuAHO0p+wni7aiTy9v/6rdScnCU2X
	 pIJjan1q7mXpjYgFehEW27jBPYHcTyPB+++558XSmHffJgrjmt4xsB1/0mdJPHkJzmy9d
	 Q/EM0LJUlNeyjarZc+fmLcsJYkzXnCyxgmbGXg3GmTHb4eOoz743i3Csl8d1Yu8JPp6xn
	 4p8cNQ7euTJfqz7qcTmh/pFax7FfDkP3vnhg7eJWO/sx75Oapw9vuNAT+OYhzvL7QtG4X
	 b7L4pzvClCPnaTyFg6Vvyh5c+oJvpoUNnrv2sBciK3c1CheS+AWQ4GHIE9798ngGvlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
	b=SW9Q9yihEAgc65q+VFCOSgQJAxF5ZfELaA0prpsL/KromzreJm0WgcomtuAScfMyx0tk
	 EvSMbAA7pLV6On39KXweX76fH0rPjVruCL3WOJ6hoVysVsSVIsGCXBhOGtfdLEOzdhV1c
	 BGZ/FRevdq8T7cwbbNP8lqfxGXi+mLLN02JM1qbMBsbCHO+7zgx9E5sEwJTgfWDtPcCqb
	 yGOuNMDCiyqpixSmD7VOKMaY5r6hQ1DcGU7nL0XzFyV+f4u+0PSCEJakuCmaVXkTRu7m5
	 to3fX2TAbNoKJEH7AOQikDnytiQr9gFcMh5v+8p7G9pahO76LEg/USQLeDfES5YB3Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39186606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39186606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5e3cbf45so1616595e9.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285609; x=1795890409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=fKvVJIJ3xbhMBJPHM5lDunHvwr/SsXQmTjyx6iydI08yXI/VFQAys1nPxfXh2/vKId
         /j+pNTygWGLlZbjeaO8Yq02y6RA1fZ02FPFjhA3564s4/koTy8ZvpVZo6uUqgoytzELk
         2ZC3WjtzjDSklWaf0cSW0ELGxJ0Kcf60hxCEJn1ZuxzlGjGZYwhTf5i/4c27bl6e7JLs
         S0AUM7oLy+k0khZvIAu3zCW9H2YhrvOATfEyLUddeVsUB2kBLVROU1D0epJCMUoAsBgc
         2dXeSUGNqUJ7Nc2tXt1cBJdPbHgiTAlX7jMa+ANtAOQk09A0bHT6c1S2HkKmMzjhcE/N
         x/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285609; x=1795890409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=eeWi1VoPcHo6IXieizT0JYEc/aOaJMdcngCAB0DRsxrP01XfDmVJO465I2RARemZnE
         0QUtsQXADiJNlwNB6+RqmFREGMBfjGYohNsv/q+bW96g8tkSDiTXfgqsdVNTcteL6SHF
         BH83UEnWPc352e9S8ryZZRxB8ZJGS8lTxh0dfsVNCFaruOzbcaIgSDS9gx+BDNt5zitb
         St/gOflLdlj3rDY3hKmcf9uRTNThhUDq7s8+j/kfsKLQqUAnLwFUTjbHqVZuTmXNZSFG
         7R6bnmu7tizTjPc2Mw0TkhjbahP4SoxxiHLXWTRUH7By77kQ0l6NXuU48NDXwkmxrlKj
         Z5Nw==
X-Forwarded-Encrypted: i=1; AL+hErGO8hYR9bRQRAEsQLswwzKe5gQNQ0S+ZdEYgIBoCG5CWj3xXb38t84RzxeG0veVrLsg91rUbaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bi4IoJankqaorWeXjMsTpSQCfxorQL9iPX6T4bMbnb0tVFp5q
	mk8CYtny3WYICXYrhjQNh2RgPNZlREekwD4wYsVxoNt2AIw1zeiklukp
X-Gm-Gg: AZFdTZfDl05xmQ0VHTOmAcLzPN2uUxw/WLFn5St8Pg1VUzZYsfwlND/F0YAX1oTe8r1
	1dPq7Pgp3gZ9ZHZoJzCdd/SPjeK6OEFzx0/Wys49y5hp/f5Phj9hzgmyg2hd5pB8s2frdeLZyT6
	Du7C2d/JUiQZhiLuG01P6LLc8WNNnitPRcVvsIM6kM2Z05ZTHl+WH17s6m8ErL1aaZPOUlNaVXj
	SPKZPA04G1BN/5UWACrr/ar5NAtX4hNTnpcrfZ7YDAaubl7mKqFnLsHsFuHXNmiNfb55PqR7Bgk
	g0psXpHTpoWP/kY+mlnkPp6nnC762GgMl6GjsMErtXPCSD8aPHzilias8mFV77D6c30bsauNEFP
	cCgtJeu/YgmwXhsktRCcczwAIodC9rwoKYzne+lrClaEassIh/2r8iXvCCev9G7J6NIv95evVRI
	m5HMdWQBLpBuCdcSanGxCGTcYmxxf0aajTTy4MYdIPrbXhXDkOLmcvFgOlAUggtID4xCbOYyb03
	ztKa1lt0wiZDMygGNNWOH+ATy7aatEIJMZwFwbLOqEHaWK3HIjP+scimoHeU8R97MBmG1KMNxwg
	6+C8NLWlg3qldKxmBlUoG2XbogMAcV/ITOFg5nuZNwnbHFvRpfH0ntYdWRbf+EuTVhpT/g==
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr143498125e9.0.1795285609454;
        Sat, 21 Nov 2026 10:26:49 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:26:48 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Sat, 21 Nov 2026 19:22:15 +0100
Message-ID: <20261121182217.4609-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

