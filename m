Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222102;
	b=ayn7dxsnbO5UYpnPwvrD3jh10bbwLl9tte0Y18A0MqSZ95PU7VcSJVltUvHnKFv8JFPY
	 KgIrFv3vFppJ8ReHIvH2/J8GxW0oQKIBCo8EoIokhjSlTSyuqOvQ32w11qdJYLPGS4GZX
	 JQ6hL4jRcZM1+Doh7xD9dEa3on89PBko9wHmgCPCgMx6scQpKvJU5rWa+te2DsIk4mHsC
	 MCmOnnlbOXuRaJe7eqFazrS1LrWeUFQHFdMrHRnFWWVDvZjIqwmn1OiQR25ujjAUY8qHw
	 p568jDW72W8dM607taJjbAaIo7khDlH5u6jH73Ix/YcwIQdiaaF9t75arlNHB4ROywQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
	b=La7wLZZlH/odVBOIVtF20FsDFokjDNv0lyQLg5ALuFOUu7vDewxsXktrogSC+Iv2Lt/C
	 MP35pLUK68OBHwk1ZbscMUS2sVAvxecXUC1iTfZgKMHSRY/yI/B2B0Fq1XerWGF6U4ahZ
	 s7fQfzCCTrF7ZYkEyZqhp4m2jrMC9ooIbPkXd9VfloQCJbRYg6ihZB9yqClB+uKuBsThS
	 yXVNZfEnCb9IKqu0PtDG+ZObfiVhhppvgP5A8DJMh6JJqTC/MgbvOOlM/j+daHvnmbZtf
	 NkXLhsQkUuGZGkkCvOLBWMHo3edriq6iiv7l62hs78laXj8bWdD65qUFFxENxY6bl9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotPZOAg;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF1606A69E
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BF1606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotPZOAg
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3869b68caecso395561eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222100; x=1795826900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
        b=HotPZOAgPwOmEcx0nk72FGaClVUjzq46CIKkip8PTCbbKyMQ9dQI+E14RFUzVw9wUa
         f8JsBwbC6gXKsK1vPQ7WJ0aiSwEopeg+M5I9bIPlqCDqLECo4RltNV2WpOUfbNiso4r6
         v1Vuc069dKmjdo29TJz1AeWGNLxw2TwhggyWVzK5VLKa6aBbRBGU0JGWpvJJZTjRIzxi
         9xu0HwJhGhwjQ/ONkvbqonFE6QMJFW86HWBSvKhk3vNv5wRbKfOAFswgz/kK6acVvUUW
         L+tMrfk8LfQ0pk3gVRMzhOFZUvaZeEmsce6iddkjfNGUoJSA9oNdSmbcdPF0zoWjlx98
         i22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222100; x=1795826900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
        b=VEeXsxo1Cw1A7UP0hGrUbNPdrMiTFdZF9bXo7KNFG4GiRRr7CmJANc4Fx9f7BKpflX
         jSx+9LgM6H8/d2ntpDSSFype1G4bBgbKvO5zmnTYE1nqXsCbCHND2mYz9jSXbjVD4VTi
         pPJbFNLm5dddm37Uby4o9MUVRq2ajFPo4pfu2X//2IOYMs7Y9D4zEZcWWC/piChkyYlr
         26zFBrN8tyLbnAkVtZdGP6ry0fiszJ0v2SSd31JzLeVDIzjmo2g6EZFF9imm7QtLHhsR
         vDzW3sV7U/v7fMQUKVaVmrK3wE1edI9bNgvaqTMDUPajYDI0ah+YzbwDh9j1fDCXTyCu
         ZKew==
X-Gm-Message-State: APuU4Z8oia6VtN67CfrBK8ie9wqVWhzRKuiJLNZKWnGwLFitIrF33z7i
	pzgMCQPoK9AB9OH8uPyqYrUGBDOKY6MpkC9H3glevXTvoVYpHLb3KcG4oUChdw==
X-Gm-Gg: AYBFou1Vg4FyIHf/g2aSHrYjgasd40J39A5aNtjkkESHVPS4vsvQVY0DKVNVzcI3u7u
	pTi8tWpmugW/La/bYWpDMAKwMdxiek9MF2wWhY9NMqNd00wn6b1PTMIt8kywA78Lh/uv7Y9sC2y
	q9bsj+7YnJoaJe5Rd+i66lvlOwmIvySx4yymb1qJVGYie0YIL+9lmKop7J52oRE88AYMv8P5IJe
	fwAFdsaxVH0Nc8fHPwW+UJJMLcJxuCkrXxsUs0JXq2cDAEnqtbvpwM+dO6nxY8I7fEs3mWOUfrR
	QOC0bu+2ExfCjxYwOuEMgu4bmonWlFYDkYJIHW0M0sXjcqenLGjPDEgKPP0yOTqlewgy2v/QpKV
	+2juybNYTQnutLe5ibKk0vECqwYNTXjvNBLdIL739gwJcxoTAscH8uxJRH0X6p2j/ujSsaAcgI7
	XjRW5ZK8AHOH00bReY2+SkLSPJ5P5+AkMSsh4Ip87xzeevTsHYYc/ORP702KohwxfZ2oNRlwSAC
	OZ5MX7sQ51EwUNoS84ojIMuNnOFzTWBF856mEuoaVAsKlnuTA3L09FPVgG8sibZGQ7poMWs/U2w
	pvBQqn2O
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr4531507c88.9.1795222100099;
        Fri, 20 Nov 2026 16:48:20 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:17 -0800 (PST)
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
Subject: [PATCH net v4 05/10] net: au1000: serialize TX completion with packet submission
Date: Fri, 20 Nov 2026 16:48:04 -0800
Message-ID: <20261121004809.1690280-6-f.fainelli@gmail.com>
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

TX completion runs in hard IRQ context while ndo_start_xmit updates the
same descriptors and ring state without locking. An interrupt between
netif_stop_queue() and setting tx_full can miss the wakeup and leave the
queue stopped until the watchdog runs. Use the existing IRQ-safe device
lock in both paths to serialize reclamation and queue state changes.
Keep the packet copy and padding outside this lock so uncached DMA
buffer writes do not extend the IRQ-disabled critical section.

When submission reclaims a completed descriptor at tx_head, advance
tx_tail and clear TX_T_DONE before dropping the lock so the interrupt
handler cannot reclaim it twice. The TX queue lock reserves the idle
descriptor while its buffer is filled; completion stops at a descriptor
without TX_T_DONE and never accesses its payload. Reacquire the device
lock to publish the length, DMA ownership and tx_head together. Consume
the copied skb after releasing the lock with dev_consume_skb_any(),
which also handles netpoll entry with hardware interrupts disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 1935b1d4b173..60631f0dce18 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -872,7 +872,9 @@ static void au1000_tx_ack(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	struct tx_dma *ptxd;
+	unsigned long flags;
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_tail];
 
 	while (ptxd->buff_stat & TX_T_DONE) {
@@ -889,6 +891,8 @@ static void au1000_tx_ack(struct net_device *dev)
 			netif_wake_queue(dev);
 		}
 	}
+
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 /*
@@ -972,21 +976,27 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	u32 buff_stat;
 	struct db_dest *pDB;
 	int i;
+	unsigned long flags;
 
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_head];
 	buff_stat = ptxd->buff_stat;
 	if (buff_stat & TX_DMA_ENABLE) {
 		/* We've wrapped around and the transmitter is still busy */
 		netif_stop_queue(dev);
 		aup->tx_full = 1;
+		spin_unlock_irqrestore(&aup->lock, flags);
 		return NETDEV_TX_BUSY;
 	} else if (buff_stat & TX_T_DONE) {
 		au1000_update_tx_stats(dev, ptxd->status);
+		ptxd->buff_stat = buff_stat & ~TX_T_DONE;
 		ptxd->len = 0;
+		wmb(); /* drain writebuffer */
+		aup->tx_tail = (aup->tx_tail + 1) & (NUM_TX_DMA - 1);
 	}
 
 	if (aup->tx_full) {
@@ -995,22 +1005,26 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	pDB = aup->tx_db_inuse[aup->tx_head];
+	/* The TX queue lock reserves this idle descriptor until submission. */
+	spin_unlock_irqrestore(&aup->lock, flags);
+
 	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
 	if (skb->len < ETH_ZLEN) {
 		for (i = skb->len; i < ETH_ZLEN; i++)
 			((char *)pDB->vaddr)[i] = 0;
+	}
 
-		ptxd->len = ETH_ZLEN;
-	} else
-		ptxd->len = skb->len;
+	spin_lock_irqsave(&aup->lock, flags);
+	ptxd->len = max_t(unsigned int, skb->len, ETH_ZLEN);
 
 	ps->tx_packets++;
 	ps->tx_bytes += ptxd->len;
 
 	ptxd->buff_stat = lower_32_bits(pDB->dma_addr) | TX_DMA_ENABLE;
 	wmb(); /* drain writebuffer */
-	dev_kfree_skb(skb);
 	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
+	spin_unlock_irqrestore(&aup->lock, flags);
+	dev_consume_skb_any(skb);
 	return NETDEV_TX_OK;
 }
 
-- 
2.53.0

