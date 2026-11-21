Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231945;
	b=th/RsyRpW4GxU9cS7Ka7rjK7kYAiSDOZaGhETw5VSv2pYvLT7fX4Ijrd0Wrc2MfUOwYb
	 fdy2qEUUzDFyIodDvxXeWS7nYf7LEp30dfDeq7yDyt6AL8buoZo1XEBIyMaCoImfHt4yi
	 0rtcbwnqT7HY+jSbQ7JoKuHlHXUUdJix5k38LD77IQorx3WaVm8fNZGYH6LWJkSXs1CVp
	 5vY6LBhWaTV+vlV4cvZW9bvFqWMJHmlBfxR1RpBeVsS5DQdiiD9Winh61XHsKlrGMsPxm
	 Xn/6MvNC1WEG7kSS9BsWukDhtjystQX7c0LqVnG6Uhom39BeJaRK/q12Sad0tKLQU0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OFDri0UyRAP3wGFRIcdH4k8juV8Vp7q5ixeYNyrnwww=;
	b=DxTe9ZI0HdXVhKYdsHk7rfnS2BNjxDDYscR5KoDgeVcsMj3CNceuPBQSt0bnBDHNBPz2
	 dX8ksvWyJcKOyahZ/SgiTveIAzjr7zxQx4JmeITfFjkQjnQHemaqGqclmvVGXFEWwOR2Q
	 tQWQN13lTcnNGI65eLmMp5TVGdpUXl9GPVAqTEXvZhnDkCc+0Lo0q5NOoQuhsrih7cYIk
	 /vx4bu+q2oqIoNFS+k4bI9BHnA/hFXUw8wRXAnyF8/LHOUAfcidPAmYIt6AinDocZHQ92
	 YMqXaI6FMudcRBsw5Yw2I+yZ43NBheK//4hlZy+2CvLfs5zCyK0khlfd8Vc/Eo5awVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsvNnMGJ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B782606A691
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B782606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsvNnMGJ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1573518a12.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231942; x=1795836742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFDri0UyRAP3wGFRIcdH4k8juV8Vp7q5ixeYNyrnwww=;
        b=fsvNnMGJgCyNufxEYRkG7xIICFlr0ulG1+Hqx4L+kBNUoAYtC5eVawZ9WE6CcLdGPC
         BejJfG3EUCHJ5LFQKZWwwg1nG89wizo5++nG8Jm1UVqQI3OLykKgullreVbx9qVV5Yxl
         +loFq78mtbywtMpp+5eYpkh0riuu/GG7s0nHHL4IAgRa+E1G36RGaVhQv9oqRwuDzbbQ
         RcnPOExlNv2b6ph96twEDy2LSCxDltfO1dHOmYZnDovDvG4wQ4ZNibS3/+gkfbiWu4q3
         uKbBpdQRnb09f4HZWakrm6wSDY9byWhxhDFfjdzFp4O9y0iqBoBUH/xCbEuzR0AqugCe
         ud+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231942; x=1795836742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFDri0UyRAP3wGFRIcdH4k8juV8Vp7q5ixeYNyrnwww=;
        b=Ew5995SMiEpRtc07rXTt1qI3EK+mTQ+X5k1OzTVmNdRktBDuNZ/gakhvj6uyAbKTxg
         bVKUxOPTIebB3nuQcEuTSz7XKjnA4x7JuzPobF9OH6rlg2Oi1ThU0pcggduZ7WTmYgon
         8gf5Pihmrpc+epy9LPHI7yF2bv6ZRnaWAd9sn0+dMjuTUxDU/l2mBLYQyb5O+923zuCK
         OzTUDD93KwCpArZB4CyFpLbgVtNPN3hLqdkIJUIQnw8YDSVXeOp+UN5h7KjMdgWrSCg3
         dTBNrANh7VyIE+RhghkLhW8bBNoPu+OepLfHUNGIh4ocRnP2ehS7H/hx81zD0/yjAgSu
         2p2A==
X-Forwarded-Encrypted: i=1; AL+hErGz1WENsqRLd2TTiemRq65sAZm4ylB1BULW0ticHi/J6HI6LTG4eOVn0d8SlHYY1kaRRDqmly4=@vger.kernel.org
X-Gm-Message-State: APuU4Z//q+qNqgu3T1tXXFPzlIF9R20a48nv/KzhzVprjizL3eV32u5a
	SSjxl+UgZKkb58CjJtoNN2VM2bJxhKfyG1XgaI8eJemg6sbrQpe0lZAc
X-Gm-Gg: AZFdTZfYobUD4NKzdhAsgVp0b2hTP1U+arB1egOl1G/ijZr3H+7Lx5ZEbfn0JEed6gf
	o0wP44SN7Zh4WQ0o41FDyT73v4KDxXiVT7EjnrJtsWtTRK3Sq4G+pEGNzSoIjDHCLHU9rgtzIRi
	96CLMYIQaf8o/2mCnwmZ+mWsUYdGIYCJZz+4mdE0r8RxVM71HHAq43+yheE2VU2nltQuHrs2/pz
	WfKRVTt/oNuqbQbHOGYBIqWXCAvTijuf/6qGbd1mDcp0PErgkqRRvQtnkHVrgQfPDixaya5sr46
	ild1n07O4R5U5/E+pDq638KIRBpI97bHz4bSb9FgV5wzastgmFNjmAlKLaaCx6grvvfRccpwj78
	evTH7ldahT5MkRvoQV1kSvAQW+bO4+8a9oLtNpBkfpnunLl+HSG2Cs3LFYgtbM98y/v15iY3lrK
	E74ucRdwZzH5ajstnmfo77a97eHuAUufdnw8fi29zwEyZ/v9JS8nxJdIbqWItm05mhkcmr5OzzN
	8lyDVob4V4rJzQs9LpaFcsJevheAAquGVFJQDjZAmg0rZMcEW56jQSy1bjGMUHmvZF9h3vd6ofc
	Sur981xKTFYgfRz0BHeWceMxS1VqMLh3yQE=
X-Received: by 2002:a17:90b:2c84:b0:3b4:409:f173 with SMTP id 98e67ed59e1d1-3b41c7b6060mr5182254a91.5.1795231942484;
        Fri, 20 Nov 2026 19:32:22 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm927346a91.1.2026.11.20.19.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:21 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 2/4] net: add netif_disable_subqueue()
Date: Fri, 20 Nov 2026 19:32:13 -0800
Message-ID: <20261121033215.1020506-3-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

netif_tx_stop_queue() does not wait for xmit to finish, and with
queue API disabling a single queue is becoming more common.
Add a helper like netif_tx_disable() (which drivers commonly use
when stopping the interface) but for one queue.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 include/linux/netdevice.h | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e..e716b98e8b4c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4980,23 +4980,33 @@ static inline void netif_tx_unlock_bh(struct net_device *dev)
 	}						\
 }
 
+/**
+ * netif_disable_subqueue() - stop subqueue and wait for xmit to finish
+ * @dev: network device
+ * @queue_index: sub queue index
+ *
+ * Stop the subqueue like netif_stop_subqueue(), but also make sure that
+ * ndo_start_xmit() is not running on it once this function returns.
+ * Does not synchronize with xmit of lltx devices.
+ */
+static inline void
+netif_disable_subqueue(struct net_device *dev, u16 queue_index)
+{
+	struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_index);
+
+	__netif_tx_lock_bh(txq);
+	netif_tx_stop_queue(txq);
+	__netif_tx_unlock_bh(txq);
+}
+
 static inline void netif_tx_disable(struct net_device *dev)
 {
 	unsigned int i;
-	int cpu;
 
-	local_bh_disable();
-	cpu = smp_processor_id();
-	spin_lock(&dev->tx_global_lock);
-	for (i = 0; i < dev->num_tx_queues; i++) {
-		struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
-
-		__netif_tx_lock(txq, cpu);
-		netif_tx_stop_queue(txq);
-		__netif_tx_unlock(txq);
-	}
-	spin_unlock(&dev->tx_global_lock);
-	local_bh_enable();
+	spin_lock_bh(&dev->tx_global_lock);
+	for (i = 0; i < dev->num_tx_queues; i++)
+		netif_disable_subqueue(dev, i);
+	spin_unlock_bh(&dev->tx_global_lock);
 }
 
 #ifndef CONFIG_PREEMPT_RT
-- 
2.52.1

