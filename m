Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943967;
	b=IrYCr+wDWJRS4jf+pwkt5Q7G70LhDZUl3BiOWfHl9stvJrgw7dNfOJyXoGoc1VVynVZL
	 NLomAhwXn8hHV+0a8zvHcNzhsCae1eh4rMeKKjJ3pgE0Unxj3w2xg57+zldDOwbdY146d
	 mYm1ToCmDpxHh6qauXPWDtF0zINuXmHnY8eQWSo5DC6w2V/R36qMs4FUGUMX1Rn77hgon
	 qP1oEY+ZM7iCf+rE7wz8r6wUmilCAKNpMEgIPLLUf+VrED4lTD3rTdzuvkPQ7hOhDSwy0
	 VGsBwG7v4bj5pCWtcXsZ9+/16OO+uk50+d2Ue+5yiqLY3+vSnB4AxEckpCLzJP4l0Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
	b=WGtEzkywkrXPUEEIkkBjNqW4RKkQP3Fzlw1G7U/uRVdm2doFM2GRMo8O3J2PrPIqRAuK
	 rAhADXWR/i76lxPodns7G+h5A7xzFw6XRHlYBdB1Q/h/lgS8+qAIdV144dYeDfLNWosYH
	 mETnJUCPAjpkDNB8IW+zY3z+WVyynSrDShyVci3EE6Znt9RQROdODwUsKDbxMrjAirOUB
	 AArbxQr7kUmBaPTbbn4C+1gG/7Qd8cOykCZkDDIy+gIfKIYzEX5arpSu+djS3wFOKbcLa
	 w9IBiDgohheqM6z/ZIljFScukWqx+0FsOVgcW+xwKPMv9QIoTNFVyaGUsdTmAyed/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wze86KUH;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6460A6F56
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC6460A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wze86KUH
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so544368eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943966; x=1795548766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
        b=Wze86KUHZm7tmc3gE+xO0FbJsq9sWxaFy3My7WGRits9YWkEpV6xLM4gR4hkGQEmEr
         a+LJXqZF8Nb8bk7GOQ1CWRS3mKKBRLcebet6kcThk/qpGknOqZ+3zsJ8EeLo49OnWzhQ
         J6iDGwx8NjRegJ9ER9zQGW/AGxDetV7ZtjljRKixi0L0FBVTcR4ShNef+kLVZXE/8GC7
         bcF7iFsmgdx5ZkhCU+m0CrQ23He/+VsQD71r5BOfEqe/e3CqUHzxnjq6TRSIDNtj0OdO
         hmPuROhHggxwWkyNodQC3P2qMrI8NFLijMvYPE4IfHg9ciB0D7I38E6Cd/P1mc5pLydq
         BtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943966; x=1795548766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
        b=2MWWV1nZ8cJnkB+etQ7xr6H3+a5RS+F1+FN+YTNwKFQW1oAUAgC25SogUfJtl6UEWL
         3PQcK5be8ZQxGteqURNkyHOEGxdbAo43UYORAqlzO3ohziqvpZBPi7Ln+8Oy5IeMJY0U
         C++WRC/cJJsF7rpl6ozTX/ejyw+2kXuHiPKd6d7GRdihwkJcjZ/XqZLHGB6FKwWEOmR9
         hb7MJfiGuR14Y3GwB06M7kZxhSWWlxEdlbReN7ogrH1+oSWEVUjcziBkXRze9XZ1sHMs
         QVDLx8Mg7AYyuXTnZoB9DGnRQ7X3zBp2YPB12xTP03cnGsoUFcv163GJZSQxlD1zjAnM
         vL9w==
X-Gm-Message-State: APuU4Z8snXWsJqk2blMPImz2l6j4i7JrfrQswuDzvILpCFQjCK+RhrKt
	a4QMJRCSgBq9rNVKP0ntpGai6tctkxaSX6KJAAA8V6v8UyAM7ef+0KvKoeOzrw==
X-Gm-Gg: AZFdTZef95WXGMqePICp5hU1g2m9nhgt1M6KcS4/njO4t4QmCo37bY8ertIRbq3xpvi
	UGLjwqpxcez9IdfegyIoV2Eyq5U6Uf5Coqu1ozlY7Aa5y4FkOU4JW+VvO2eAg4yJoJ9kxb2c/ON
	oCdRYo0uzWboGejxRoEvz3H4PedPsErWTShwm3HazFPZ9AcHXnFkIFI3HIYtYqu8hUh5O2XAVEV
	SWl0Mc9SmPZAgNRfn72133bKAOsft8OqCOrdNpypfn57Z/oGm8j/hfveg+hpBzXzBTTfYnBYcbQ
	C/M5j/V1hVeLDrj+ISYntc+mC6IApLU1HHyxojVuW7b7ipj5ixaf/g6GZeMJj+08ehuQ1FQw+Fj
	99IX/Pcdj8lsPpg5eXUv8t2m8AkG2vxXEklO6r6lblepJGoSpFcLKjXH5Uc5AiSvcxOcpkNDj8g
	j6k+f8MWRR5wAeO7vPHykwv0aqoBx4a7BOZ/cLNrI/0YBMyGzqVKT7dVQ8UUFsJINJrYR5UVNoA
	qUyAR80QgSTvDifQAy78MYZe84t/hV38Ro2ltnnR5MVMZpzUVPtD8aWN81t2wNU97hTXrz8dmGS
	f/e/rdJQMrxV59759dmvjXsa6RV2iA==
X-Received: by 2002:a05:7300:ae1c:b0:372:eab:d700 with SMTP id 5a478bee46e88-3827d71fd36mr461912eec.1.1794943965652;
        Tue, 17 Nov 2026 11:32:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:44 -0800 (PST)
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
Subject: [PATCH net v3 10/10] net: au1000: reject frames larger than the TX bounce buffer
Date: Tue, 17 Nov 2026 11:32:23 -0800
Message-ID: <20261117193223.2795612-11-f.fainelli@gmail.com>
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

au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
without checking the length. The copy can corrupt neighboring DMA
buffers or run beyond the coherent allocation.

AF_PACKET with PACKET_VNET_HDR can deliver oversized frames through
both plain sendmsg() and PACKET_TX_RING. In packet_snd(), a nonzero
virtio GSO type bypasses the MTU checks, even when the supplied gso_size
is large enough that virtio_net_hdr_to_skb() leaves the skb non-GSO.
Genuine GSO packets can also reach the driver as oversized frames:
au1000 has no TSO, and software segmentation using a user-supplied
gso_size can produce segments larger than MAX_BUF_SIZE.

Drop oversized packets before touching the ring or copying any data,
and account them in tx_dropped. Use an IRQ-safe skb free for netpoll.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 98a75aba92e1..3b40843d0499 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1002,6 +1002,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	int i;
 	unsigned long flags;
 
+	if (unlikely(skb->len > MAX_BUF_SIZE)) {
+		dev->stats.tx_dropped++;
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
-- 
2.53.0

