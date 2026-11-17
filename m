Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943957;
	b=dRVSMbUv68ua7zpvLLQLE/qR0pxQbGgfJhJ3kY6u9a8AJCjpJe39/TTWHTN4f0Rfn0qi
	 bucHgL/tgsb8rmtG2O6vkfLWH9E7e/AwMzFfKvT/eztIfSpQVOzlBp+QtT6RFeOv4YU7c
	 0DCspTTh3G4o4FRgUmIb0T3TQGPYZyCNp7uSPYZeHyZ8yQ7NAE6n2/Fcl0/hTlkmU9l4a
	 Te22uhUy3f7pUafCygB3zf+SPYrHOvJhzzV6VXee544cP+e0PXrxoxgO7gMI+e2jjGdlC
	 5PXSyS/KhMOJ1eDfhn+tBPjjvamYCPwytIlK3GOj5UKtLprw2Qc5lVCcsUe3NJD+ZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
	b=07UJ1y7xFbwyouVtr1nPOW+GUKAhXv+hdUDB2H/Ru/EmK19z5hMPGY0mMkkQDoreCXnB
	 nIrfOYvzDN0ih1jPcy7dTufptpaU1QJlr1tgWzm1VVhAzSbCWw1TZKUZNEI+kfEUDuo7k
	 n3lZdJaaqdkMoRJ+nMFQ1kImPAKn2d66PPHEosUYY0oTBbzP8gWG7eiE9g/JmF8XjCS3H
	 SXnNP8x0meci5YY80GQnwnmGtrsg9bKlwSTaNdO+4hcvDwtBGeOWuBRnisPuPQASKh5Kz
	 mhN8Vy6vEZo0aaMLeUfHUAl0AhoW264DgNkowEOf17meTRV51jUuGX+9n3seKyc4UTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="glIv/3D5";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A929606A8B4
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A929606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glIv/3D5
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so506537eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943956; x=1795548756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
        b=glIv/3D5/xVwqM++NZBLjPHlif/bKnuLBbYJR/ipw4huxhXQZUWkP4Qt/vcV5fkgYu
         Q+2Eti697jYa4ZXw5YFXx/C4qCJZ6dOTQqAFsBT6cmvrJwj/fFdxzmLO7//Pzb6HVwBJ
         s65B4aQnrCYODREMVZjS288AFeaUI58YN3u46TAR50StA1+4VzQI12Yp8rRHyq1oNZIz
         gYtWxsdF/jxwsx8+9fQVbQxp1RifMZfOBACJ5z6E3+WVz/QDOI8G7RBIkvwR/xE9rZMp
         SWoWG/4JutRdv7+yMRRBWWx5uOvDM4fCTg0RQ11MUrfiEIcsuL/RPFizAw8Neuo5j0py
         4R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943956; x=1795548756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
        b=lFKcqUkPAU8/JF/aiBLV4Z6k5bSnskZED5jNqo9aGanTTCmaWZIsjlQoktq1Z5dMRv
         vfS5msTCT0TFg236bM7DtE3HVRLb7nVAw2xq5ViXw2vTmSWFVtcU1E8KIbMdlnZYcQ0j
         hAjkR6nCCZxfe88qQjLcqPrK2qZCg3pg1ViByQpXdpm5/j1vqPD8n73KqOnugJ61cmlu
         SNHXHOWGFDW39B0QXTFh7J06PajNMvrYBKJQtLpwcLkSwrX9NSaqfSdr2TT/IMOkJmCl
         hmbKlgwlumVV5buM1dP7nLFW6eK+AQuZa/9XoiLZWaPL7iqGt/qnz9NYKUXoAG+AR1cY
         +0oQ==
X-Gm-Message-State: APuU4Z9mKczkpNcuxhdGlWR2oPt1bqP01mA2Mjcpyozc8EX66UD+wvMD
	Pmls1uLJEGrPXiCq4GoUyg5BmLPEAgJSz79j0XxQ7nwsp0IInkLEJF7wbN+c7w==
X-Gm-Gg: AZFdTZcqUY9tHWqMXG4v3M/5MWhCA2XdLyJoZPM//swl4nQ4h9CNb1L1i6YWF+/arpC
	e15//kqGXZSoEAdu/36auUxCfr33/UFObzvGtM77w5EUstUnP4OrtnU/tyv+a4xIJwlHDR2jTZo
	Q+nNuuhVWRHK4QSADmHXCWGHZMromhdS+uRYekCCtyDIsMhoTznResFEa0MkOZZhPmaKO2lWzr4
	KE4tXy2BX3xiFCKWbuolIx9b1XIepGPKzb13pvs7jkymGrYM2ZKx4d+m7mUU8BjYfNogxvWi2do
	QLOzpxt/2BuGXtdJv03MDwM1iTZkW+Sys8h0Pn35aMGYA1TfdVIVLR/tDbtmxtZ0/kR0Y6g+F78
	0hVnx6uWHHPn3QO2Yq1mra3C/xxrgzZgT4b3B82WuSEQayKLcJ3Pn2vpuJb8u3Ba9D3f/Q1X5yA
	/LW9UeI28LVtwsNcoJLs/V2wrLrkmj0ns5MwGAl8lXorvXU+peqxJT1IPbiGFiRWpSeLS6im06/
	jZIk0PmyBYE8JQiSkohTE/OHWAXoKiFMRZ/q8/SKm/0KVkVr7RA+aBAhQae1lWCxlvjwX7lgqkK
	QBSTR90W
X-Received: by 2002:a05:7301:c14:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3827ff7aea7mr364158eec.16.1794943955744;
        Tue, 17 Nov 2026 11:32:35 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:34 -0800 (PST)
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
Subject: [PATCH net v3 05/10] net: au1000: serialize TX completion with packet submission
Date: Tue, 17 Nov 2026 11:32:18 -0800
Message-ID: <20261117193223.2795612-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

When submission reclaims a completed descriptor at tx_head, advance
tx_tail before reusing it so the interrupt handler does not wait on the
new packet while older completions remain pending. Consume the copied
skb after releasing the lock with dev_consume_skb_any(), which also
handles netpoll entry with hardware interrupts disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 1935b1d4b173..805aabc6721b 100644
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
@@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
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
 		ptxd->len = 0;
+		aup->tx_tail = (aup->tx_tail + 1) & (NUM_TX_DMA - 1);
 	}
 
 	if (aup->tx_full) {
@@ -1009,8 +1017,9 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 
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

