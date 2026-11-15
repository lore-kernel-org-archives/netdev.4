Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750569;
	b=qiqTNVUp5mMMxswFf41sKrONKtEBzF14LlROd6tkWuskL8mnNdiVs2CHz5mUNlshgJxj
	 3S5YmR7+31jiQ9e3C2JaFWuy/ROI5ENR6yhc2rrrX0bztSMv6irMJE+xTUszDPUW1kKM1
	 WnNVERD7qno4xOntlWRz0op8Nwdik71f+/K6PUhxZG2N2yVcrKOP8/F9Tzv5pK4V79Bew
	 MZUq2UKBW9E5WRV3PRL6r+knr3SHZkSuoJIzGbpWoiLmwd/gROM0+aTvSaG0ucMht2ER9
	 QXr1BPzvrjXpqRpvNlmpUdJ85DRrR4YRiBNo0tGwsRtDkuJmH7iASzipVjU+88W2hEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
	b=0TgzCWdTB+ON6ESNzoAdPHJufYAdKepN1n9cksUGd6gCEIh7XYPNm0/VyZkmHjKav2Wt
	 QZ8rfOPof1qZlJa5Y9ZjpIFAjuE2DGYjRvzGW/NPFq7mzqfS9fi8cp83Tg7QBKBPLilbd
	 UVCCkaCMJ7r1WGNm/CCeCEQIrOKJ6Kc+/G+yhNWTTpbsx97IyT9ACoeNbbH4RMcUJ4xHG
	 3lybfmy93D03Jl2GksW7e2x6L838BK6eLMuHHFFjJlHXxWy9Nyrtw+v06tT1tXtDWUS45
	 zkg+0vRk+6O5vHbkT9vdjkBinid4UfawMO6SGHsjeHj8bKT8iulkyQC3nf4FT0B/YWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnOtCXqi;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9A606A881
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D9A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnOtCXqi
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4426367a12.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750567; x=1795355367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
        b=AnOtCXqim/fJfNWxuMpDEXkZ4wmtzv8RFwJ30ImPROwIedf9E2qrWRopIrtzvpUp3b
         585athtjSaQvFX90AYqLOI8FPluQISyBIRQbO+2HrmJj+fXYYDIT2hSIKvp6eyu4dQxC
         sab1WyIKsWjfbR0vZ0lhLKE/S378NjgadqXqkG24WAhAoOpV50ZHpVzSF5bZl1HYupo3
         nse53SoYQpPS1RXhUqKlaaIaKABt3jWmiJ9bvDcmXbnF5pMrV2EtbNj5nejxAt+H8/M8
         JMR5SG/93IzwJ0GThy4qyKjt5mzpGDerfb6ZIgqrlO9Wto+D2tVuo88IMqEjaz1CkXQI
         PMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750567; x=1795355367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
        b=j4c+nyO5zvNKMr5UwlJLxRSBQpbN2XWNWqyfMBzHMxM7+Y5qhJJVA4wCTAVstHQ/tU
         k33YsdsogZVV4Zl+QkHu7HnwDDe4Ahwu/kmVqwGj1avUKFS1DVaqfvFAm34GjZk3eL5j
         g/B/Cys2tgm6AALwVbNDsLwdK9q5An7DNlQdbYfmg/X+thuIKEjCJaW1tvznoBSjPzu1
         KI2UhjpBvHrsknCChpVsWzYiWRHdmXOgczChjJTJeioBnLyrigcJH6oKcHezRJPWTIYf
         9tamM3DP4fkCRNttq+Ye56cirRkeMY1TRygUP6xwjJIFJXxo8rt7gZ8DqSvcRcZUG0QK
         fkNg==
X-Gm-Message-State: APuU4Z862IR8FY/cEHIVRNnN1aAc6b8Ap0rE8e4jQdhkfmo6Q9QyWWTF
	VJHKEAP7iXuNOkLK4FSpxcoFOzQ0KnhdOCBmb6ok0tp7HOxb5yzFoBtv0AKn3MRd
X-Gm-Gg: AYBFou2H2Zpems2FLCmneYE1nlWKEjXxuPv3mphx7MP/orlqbvU9wBd5wRMzkH4xeUd
	EjkkJ10LN1Aq2uXxOdlOT1QgByUjU2CD0pTgtPlrp500Gx9ELhWGV13qnurlH1ZhcIaaXJxAUzY
	xtS7Pv8YYQveaqAUv/cZBG6skpc6oueLHxuq6O/luBLdHtMg9L1BDYC72s3L2dUf6avUn7nwmLg
	R9q7JuEC1KzaC7Ppvyxh7Y/ky7yMCbj+zhLuVH4PoFGddqEtXJfmUziv4P9pgxmSPSGn4mMjKrJ
	Uas8jna0jmRwHqR7YNcA3P8SGbr+BO+ExE9hcG1OpW7Y5NPvltEGeqr3pQenH3geOyuNaJlH74w
	36Le/f0SHU6hxWmamQU03nQDOVzT+QDn8z3HewKV0dI1WDCSkcpFgUP6AIIIJHdWFlyfXlywhnI
	/4AKXeKQbPXLdKUI6E/nJGDQ/cL8ggjZNBzmJdkUUe0ZG6ITYJQjYt7wnJpWBtTmljSNiKlbXSf
	pVjX2C1gJYGAUdhok90nm3+2INcnRliM17hjM0eoU038BkcmwuhHENh/Zctz6sjY/ulPB0Th1ai
	i1Hae1j9thtA4xyU7C0ORq8S1xMVjmbfxa0yQjLcjL0/ikx6A9zbPW3vtH2wEw==
X-Received: by 2002:aa7:cc03:0:b0:6b7:28f:a3ac with SMTP id 4fb4d7f45d1cf-6b7c0957d81mr4194728a12.7.1794750566981;
        Sun, 15 Nov 2026 05:49:26 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c60c::8f9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25deb10sm3386556a12.30.2026.11.15.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:49:26 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 3/7] net: bcm4908_enet: release the TX ring on stop
Date: Sun, 15 Nov 2026 14:49:23 +0100
Message-ID: <20261115134923.55351-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-4-kudzo51@gmail.com>
References: <20261113235847.517308-4-kudzo51@gmail.com>
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

Sashiko's review of this patch [1] attributes one Medium point to it:
when the TX channel does not stop in time, the skbs left in the ring
leak, and on unbind bcm4908_enet_dma_free() frees the slots and the
descriptor ring while the channel may still be running. It suggests
forcing the channel idle with ENET_DMA_CTRL_CHANNEL_RESET or by clearing
MASTER_EN, and then cleaning the ring.

The leak after a timeout is on purpose, and the changelog says so. The
review of v2 suggested either forcing a reset or leaking the buffers.
I don't know what a channel reset does to a transfer in flight, so I
chose the leak: it costs memory, but the DMA never reads a freed skb.
The timeout never fired in my tests; every stop, all made while the
router was sending at line rate, finished in time. The unbind path is
older than this patch: before it, stop() did not wait for the TX
channel at all, and bcm4908_enet_dma_free() kfree()d the slot array
with the skbs still in it.

The review also points out that RX has the same problem the other way
round: bcm4908_enet_dma_rx_ring_disable() only warns on a timeout, and
stop() frees the RX buffers anyway, while the DMA may still write into
them. That one is older too, and I'll add it to the follow-ups, next to
the ignored dma_init() error in open().

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
