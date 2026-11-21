Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289531;
	b=MuBQqFmJ8uVuN8MFESmhgQOV0WBmGZUWGSNGgkDaX/fzhJD0l8Iz63QTP6vEhVZJNpUI
	 nTX+n9ANT6Rn2mqiJiFOY2jgECCubrdG7j5gw8bknHq1AxBOol5HmDB3pPYhQ8qfiWbE+
	 3YDMifIOMlzh0Nj5SfcNrS5dJvnO0nLXct8UWeHzlSEPZI1GLuoiG1dhO+0fnZrYfi42/
	 FCbO1ryZpUaCzBSOvXt87tcTuzO/jw8/TCVoMgFplYkr+rNqNcWTK5x1gG2eCKjf5D+RP
	 4UvAZvbo6OUoNr25HCUU/bM5gNS5QWl+eSbX0Cz8tkKZZ3e3UfciaCb4avyWS625phw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
	b=4fKun4qyQ0Gk0vT+IhrdSiLX8Elze6dHZSUZQcWgLr3gpJGfY6LCH4xKSTVGQJqeuovR
	 Hlmydkt2uPX8Ng6bSDaIsTfFq851kU5qG8lr+Ted46j/kLmfPuSPfcx+TX5cEh5o0O/H8
	 2daCaJ1W1n9zZguJIIJZ8o4wAmRJsWa9m16ukYEwrO8NztZXjQ7gfz5nqhN5VcfiLi4Td
	 x8coPK81rNfFS8+hXPkUl5x/8pK4TxI99DzLEShG8VIi4Z5zhmGMEz3Anx5GssxbfKKT/
	 iYRM65JQjQdYPgzNuREKygPJRttPzCCR3pRZGmYg3TJhsG1guoBBhxjqGCRIbzcKD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goc/tD7G";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F8606A684
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28F8606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goc/tD7G
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69954c755so1513269a12.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289530; x=1795894330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
        b=goc/tD7GgY57pBypEHGEz/djrG91+Qjb6dAF3/xnQIzzue6qu5+03oJ8AzmhyQsyL7
         No9wKtNZtkB6P5JQTfVvtpPNLfBxMiGMI0WusktvGzXzNqZfOrLpFWE928XFa8u+4DpC
         0z4awFPJw09YRNn6pvnitLTdy+nIdqjxL3T8yw9K64HbC25fV+YXNs5Fd/Ip1UuI9xvK
         X+WoYfVKvdFUqVUQBP5vMDENrllPvcFz/mD52qsPofb4PhOsD51iXqn4EIWidMB2k0eP
         Yc+dzFSdivAeNyIx0J6YVGLJoEDrgqskhbx6R+C2+OnqUmtkauP8fkMw8DHgG9LMDYoU
         Edfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289530; x=1795894330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
        b=xPNqlK9k5AiprZU7kWUKIm3e4ArsWBc7Ecsf+Ox741NuaP1xjEJMXGcvjXDK0HFphE
         RbmN6VFEmlimHDq+qNmEmP74VGReXFRGvJ/QAyXNaiN8vWdnIjIhobBsPBDf/zcCysBZ
         +KPlZv7EuZ87gdGDD3cUMv1Eq/KepcVngAMMQNklWL7yj1AOkCUyFIBHwW9fpbRPUxEB
         +ICbFBt7B4xtDL35p7Q22yI0mYbZQdyUmQH1IVsFvoYqVg7/EAo6Xe9yyYaj9d1JMBcz
         pSF9iRTseqb4DFPBLhtdUrUdA6gNWIvLky607ykZxD6TQp4wH0xulttHdwDmwIMGEyM7
         xPbg==
X-Forwarded-Encrypted: i=1; AL+hErFGSGoiiPy98dLVKa3Rndk5XdIhemyA3J8RWzv8I3SnbTOuY9bKY7nkiANpZXFySubs3grZxp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0f0EuRl9V+QZnQ6JuR7yXtmpcnOX9cfP/fWu4g8YEPFYPtQKG
	luLRcUHIT0ysSok00nSSFwa0hSHZwfMBlH7ucBl3Zn3FI0lBMmypLHNV
X-Gm-Gg: AZFdTZd/TZ5pHAYxl18norfGlHE7kcKYNUYbyvS7o/dVySOWsFYuHQ77fmHDnU5s9//
	8HumsFBIKns/9ygSv96vKBiSV9n+5/Bxx0NpZUj3fDdTMRoeudr6T9T3RsH4xEE85sM3GUhasYG
	AlbB8LkDNfXRD9vwnMLBPG0ur7Vvas6oM5DDoz9+R/UbW1rYZF+ZPwh4u8qtEltCkBcU0+SjjPr
	o6k8jo0qhsobcxHch9nz1W5qaKUTxFOuu8oeB0hSdRspJl6ykd8YPIJum3gGfE+S5ZSpCn0NW7o
	Wsh2lR2sjD2H6mLpqYfK60w6dW+7jFXvWn/SP1T6pEPNcAjCcO6WGAXQ/LDH4yhgUeuydIuNu9D
	lWwHJzl6hzWB5OgIghNwz/imr0q53S+ASkLZHiMLgg5aTgLT/PX6hLr6sWol39JpWaNpQ2F6hNg
	TnmONZ5Woow5CnaArtoaslcoYfdk3TIpeDDtd2KizWiA0d6aYh6cPfgabSPDoyS2ZZosf9bxhne
	oWg8KJMQsp62ZN0SVNRidBhxCsnqW10tddUy4evoKAh/1F0I2BX5ovEVTOjzLXETqS0PLaLMb5C
	QKt8/2qJYmIPPA5ww52udLAC2vbW9ZHdP4NCJw69w+DrY4pGx6USJc89zBhHfFdiI8o=
X-Received: by 2002:a17:90b:442c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3b41cb235cbmr6305923a91.59.1795289530104;
        Sat, 21 Nov 2026 11:32:10 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm28591205ad.59.2026.11.21.11.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:32:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/1] netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()
Date: Sun, 22 Nov 2026 04:32:02 +0900
Message-ID: <179528810243.2011658.9050974542546209152@gmail.com>
In-Reply-To: <179528809256.2009509.5007624677973207521@gmail.com>
References: <179528809256.2009509.5007624677973207521@gmail.com>
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

nsim_start_peer_tx_queue() wakes the peer's TX queue with the index of
the RX queue being polled, and only compares this device's TX queue
count with the peer's RX queue count. When the device is relinked to a
peer with fewer TX queues while its RX queues still hold traffic from
the old peer, the index is past the peer's TX queue array:

  BUG: KASAN: slab-out-of-bounds in nsim_poll (include/linux/netdevice.h:3834 drivers/net/netdevsim/netdev.c:60)
  Read of size 8
  Call Trace:
   <IRQ>
   nsim_poll (drivers/net/netdevsim/netdev.c:409)
   __napi_poll.constprop.0 (net/core/dev.c:7997)
   net_rx_action (net/core/dev.c:8217)

Skip the wake-up when the index is not a TX queue of the peer.

Fixes: ff2ac4df58ad ("netdevsim: implement peer queue flow control")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index eebc02ccc4a9..6e287ae692a8 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -53,7 +53,8 @@ static void nsim_start_peer_tx_queue(struct net_device *dev, struct nsim_rq *rq)
 
 	/* TX device */
 	peer_dev = peer_ns->netdev;
-	if (dev->real_num_tx_queues != peer_dev->num_rx_queues)
+	if (dev->real_num_tx_queues != peer_dev->num_rx_queues ||
+	    idx >= peer_dev->real_num_tx_queues)
 		goto out;
 
 	txq = netdev_get_tx_queue(peer_dev, idx);
-- 
2.43.0

