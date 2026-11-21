Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222110;
	b=cJrlk2Es3D0wTyGE/LHe4f1KV0C2UW552+U5q49DgJ1AADKK+eQlkpsrMDfgl9R5CiqN
	 eWB1AX09PnPUQAW9fjzlxj7DYZhs8iLJ0i6S3p75I+rbcIPtlyavcmKpy866+dVRR0QkS
	 d5GEr3oqoXHLdHPrue5PpPQsHXRJFvASuLsGjwvKHnJCinaxEcGstDyb6FEcmG07w1pUO
	 6OKsa9HhGL6cDg5rk2tw7EEOO645+ZX+zPfVhx7DqxmkyQC4YrpS/qKIzmAI059a6KvL6
	 hLf75ZTJskDf3oJ0HFAbaCsgvTKpE//ixW8ETveB9nxBpSu0aRgYrn++ZGe2dC2iSaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tc6TK/KBjAbLx58dTXnOJ3m7v5JhUiW0lv9z1swNJhQ=;
	b=1lRxZcbc+yB9HhAritAkf8ZHOXSMUj38Gm9kMwxEBdMI1ovwnpl328Pz4CYNU5yCGFCE
	 qHUzsIh5DinDEQQsAha5imcw9/4cGJ1tkR49xNT9VFJx7WBFbvzzgWkyqUEafb+/xuP72
	 3hRgyWC34Fn3RmGsTMuFWqxzJ/z2gHKaJq7wWrBfS/OryVb1+YdblQOwRjL2MkFfr5lpp
	 icbKhT5swZuEHqx+n1fnaDmow/coKHYjxPA4K8qzDTzVe4eShx4hzTJ3Pk0bJxl4lWvJ9
	 rXBw75mPLjVQBk9FCkvPdrFU7y3E1oN5wxSptGOZPvq37XokzXaYUlym4+ESZZqaz1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg3bBhNj;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D0606A6BC
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642D0606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg3bBhNj
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1903851c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222101; x=1795826901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tc6TK/KBjAbLx58dTXnOJ3m7v5JhUiW0lv9z1swNJhQ=;
        b=vg3bBhNjEB242hXPLqjpLAPp0WhhP66cHZiWpSyyaLm/lNrdllpFMiJ/EC/2dsUW2e
         OK6xnAlKsspPCOMkdwtyqJZzTiTn97XbgIwg5jkZMktUkoG6trJtKoOnQuA2TRMgZvAB
         L4RN9f7kXD3tXFOg5jTt6CgSYGFzYCX77H3inO5gGCjRfeFYVvlZ8IYH9yxJhvsoQIrF
         GUJ+eO0lpKPWpI+STIGLkWNgUiU8LFXfONj5SB3eS+Auj8t/dC7BhXbq8yaPRuS6LkKk
         EJsgohJPaQud4WJwuWGiIIIa8B22aObhAIEq0aJQGXJV2xsFz9VhYKUviBJgdG7rsePt
         wcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222101; x=1795826901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tc6TK/KBjAbLx58dTXnOJ3m7v5JhUiW0lv9z1swNJhQ=;
        b=v7hmiCC0A/dzQ7uFNWu393/+CXGJyY2PqDUtIDp59lQNSSw74TmD85vzODLW/OQbrP
         RWXQ4XK1eysI0r1DRWPqMzQyERTp23FaoFjTrdkNHFl5EaIZCqkaO+A2d3kzniYqvVSt
         zadzoaSY510g5sCRiNw3ec58safa+mmDFHibxID9G3rBSBYmOZqX2S+XQ+tHv7iYbrxm
         xmjZadx0OAkrdrTsMqcW5y+JgSsT5QJpaCFuYjK7UDgZD1G1skSRVYLF1ArJVKBFud86
         hiMcZuC6SzCELiWa/gp0n+RAo0XP+yX5Q/AHszrisJkc33Pune1Yo4aIqZDn51/pc4xX
         FJqw==
X-Gm-Message-State: APuU4Z9dEkVedmkIwq7J3yAP7zT2PNDMko5+ht9EXlhlnhsCaWiqpSSb
	rh3ABabxv3kpwSWLVVn3xzxjO8ICq/pVNga/CnjUKJ+6p/P/EEh0X+2eIdApYw==
X-Gm-Gg: AYBFou1DobKt4F8nO0If8A6fFl6RZoyuQTggXwei0sc36VdUiSRfwk3PwdNh+OysqzA
	0rGGEQT96UoGXbxv6ffYUfrG5XhGRBPYqggnam42cwEUzxoQ6yVRXLNJYgNSA6RQyiwJ7t9NXvQ
	vl7ww0rjCp64obC0gVd/gZ2RXoi+ZKbax9mGY+2YKjVKwWixp/akIToElb1JV4p8hC+gELfU//V
	6JIXZq4jbdIRhPyAMsYRamdA8WLBQfbm21dKhATT+kIZ1EhmHl3OZSF+3uUPLKLDwD9Ypt2GO2c
	ZynH5VSS4rm4pSB8tNCTdNjUkyB2GNOJEhtrQM8+DJL5fQVc3p/2em1ynnqJeSiAgVIPK7bdEMB
	qAi4vpobq/27zD+rpqpbjR1tuuTcM80I6sjDX15VbxE1ABVO95c2EmWrZZuZTNVMcLBk0VH5DE0
	+QJ47sIAcZVUYi/n+pdheOzW+i3A3b67bxaZiAgu7Zk62+1fhI0CWfdmAOCeege2xWnbE0yYjpj
	Mp8fz3UU3zYqbvhk5bdpC7pS903enLevJBz58OmdIVuWqBhu3C8/6url4CImTZDCgUNZdymANlf
	M66CMMJ25GKW9Jv66fZWlJUA0Si7ZQ==
X-Received: by 2002:a05:701b:42c4:20b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b556898c1bmr4575644c88.15.1795222101288;
        Fri, 20 Nov 2026 16:48:21 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:20 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 06/10] net: au1000: restore receive filtering before enabling RX
Date: Fri, 20 Nov 2026 16:48:05 -0800
Message-ID: <20261121004809.1690280-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

MAC initialization overwrites the receive mode, dropping promiscuous and
multicast settings after a watchdog reset without notifying the network
stack. Restore the requested filtering before the control write that
enables RX, avoiding a window with the wrong filter.

Factor receive-mode programming into a helper shared by initialization
and the receive-mode callback. Hold the address-list lock before the
device lock through initialization so the filter snapshot stays current.
Protect callback control-register updates with the device lock as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 60631f0dce18..ea2766343d51 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -685,6 +685,8 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
+
 /*
  * Initialize the interface.
  *
@@ -706,6 +708,7 @@ static int au1000_init(struct net_device *dev)
 	/* bring the device out of reset */
 	au1000_enable_mac(dev, 1);
 
+	netif_addr_lock_bh(dev);
 	spin_lock_irqsave(&aup->lock, flags);
 
 	writel(0, &aup->mac->control);
@@ -738,11 +741,14 @@ static int au1000_init(struct net_device *dev)
 		control |= MAC_FULL_DUPLEX;
 	}
 
+	control = au1000_rx_mode(dev, control);
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
 
 	spin_unlock_irqrestore(&aup->lock, flags);
+	netif_addr_unlock_bh(dev);
 	return 0;
 }
 
@@ -1041,13 +1047,12 @@ static void au1000_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	netif_wake_queue(dev);
 }
 
-static void au1000_multicast_list(struct net_device *dev)
+/* Caller holds the address-list lock and aup->lock. */
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg)
 {
 	struct au1000_private *aup = netdev_priv(dev);
-	u32 reg;
 
 	netif_dbg(aup, drv, dev, "%s: flags=%x\n", __func__, dev->flags);
-	reg = readl(&aup->mac->control);
 	if (dev->flags & IFF_PROMISC) {			/* Set promiscuous. */
 		reg |= MAC_PROMISCUOUS;
 	} else if ((dev->flags & IFF_ALLMULTI)  ||
@@ -1068,7 +1073,19 @@ static void au1000_multicast_list(struct net_device *dev)
 		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
+	return reg;
+}
+
+static void au1000_multicast_list(struct net_device *dev)
+{
+	struct au1000_private *aup = netdev_priv(dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&aup->lock, flags);
+	reg = au1000_rx_mode(dev, readl(&aup->mac->control));
 	writel(reg, &aup->mac->control);
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 static const struct net_device_ops au1000_netdev_ops = {
-- 
2.53.0

