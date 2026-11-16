Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867988;
	b=G12bfJm6VaHGsqDvoex/qhHE6Ci43jcEN8+/SgjTDAQ8v8CmKTgDtELv5G+BHpV3Dn+k
	 wmUDyWTs2L52b4k6YTrPkWfYlMmnuAFr2ZlOfq/WmYaee1BQTfxmmi+PtL1j3a2gT9HHn
	 9j0/CawpIuTEZPKXnF2KoIHIw6l8NTx9nIKvq1MfVXaO/sRa9LRvL5ywI7+z+D8bxpF5f
	 OHeD13qnniMuJQYEtTxVveKe0gRu8sKldjEP4oPNi+pCfhRo/tSlpXwTl7PyezbjFExjX
	 HJVQMU0GQeU8PCxj2Qu92bHJbxj40+6fgmD1ns+5M6fYaRaxqxqCMBvA9yYWdhey0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867988;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
	b=slGNIYSQVUoRuWMDiMv41ZBf6q3w5axY2xffbqskNYRcMiAp5OojKLFkzKq6d85QSzKr
	 A/zAtqW1f+WD5hrgGDRBOCsppviYWc5ohXRCTh8iKY04nrwploW8Ae6Jam+2kUlThDJcH
	 k6GpUy9zwLlKspIWC9613H3paMog7ksiM3XPz8EGu0+YudNFBT/RJE1dTX6HwHJCTUcfS
	 SUjzg7EBoVKK0YQ9JGpN7R0ErtpcnyR+chCkQvjoD/fzZVWPccxPqijufHc5PQPmoVHKV
	 CBlHGZVk+XKcKxcYTy/O6T1eClRFPp27PO4alAgmiMNTzcyA1jkaOQRArGJLxwJhIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D4606A880
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3D4606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-949680e6d83so227233285a.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867987; x=1795472787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=MI5MZxgTaWPAxHXgmEQSSvzfTSb0pk1e+VwXjbXC/UtW0q0VkCBAaM6mSbKyaUaU8l
         JJ24ygcVAoLowv1nDZVGtX19ooPb3CP+x+a/5F965vYa1tJhjVfV2jgaEEDBN6hwgmDT
         w0uWjAykA6I1/DEiG0+DJVvinCI2uP9aoFPBa/eizGPa3EK3MCD7xZU2SdPRTkFrBDm3
         E25Gq3mUd08KgL1ev2j+ppS1gwpp7xEiyAs7Z5BLl1DQ3jcGyRVNHbuvdJ4umPcfMfsN
         AdJiH019+6WOEoImOc5C4TyjNDio6h6doGHeXq6l2ziXtgQsJq2N6IEYZc85O7tpPag/
         SZvw==
X-Gm-Message-State: APuU4Z+fbVw9nhD+QiJlYdb9DS+p3wN43Ee4S0hcNyBVkMozFOGOrJkK
	HUGITMDMIsoFP4ActazLBzDHiEsD38kaM/aXMu1AJ115/Tgy26nrF3ZqI7o0tm2vNm+opiR1GFa
	cS3claI6D7xnQousIher7xL4wDuqKqJTrB7gFCw5Scnxlt6rJQflBs9fIVnqdBTeTC9F6Djp60i
	rP5Q3U5vP8V/QtVdAt0oFkac9q/ESnnUfz7I5+XUh2MTkaOtNFHvb7HB2yzwITg20Wxb9s4Bcu4
	cywMJ3+BRw1JxLN
X-Gm-Gg: AYBFou1EtLWTrJ/Bf8Eb24RCa/5YUcCpDfEcSEslkj9Mc5qjG4H48yYiCSQBHuJ8+OA
	DElZ/Oij8+40JeeKkOJMXk8bFQxDKoW3IoRn+YrOh/efbv4NDxB4VvbEij7dCGjEFLqrZ7g69cs
	hLZO/4/ORPGOST2KuSfx2oR/7SlAEKRU/rjrtzqZjLloIzPfvumJR6Zn1abI6EJcu1aI/ug/dA2
	kjnLqf4Bl0abJjSDYJ9zW2HE24aKuRoQDcuctbhzG1M0tqzWgNWRaE4R21dv4DYYNUCAqGFukSP
	CqlV1Wdx4YFPSiYBGHgegJ/xHsa3RcXZosP1HMbR0IU3MguayM6TLOxf+FMQ73BLz2L0wgix7g2
	LYWX4d/W6DMEL66FZLdtJ3JQt51VxkyzXP4P8dOuUwevp/lw38nWMqYA9fWX8Q9T78XF91TJs21
	3Cr7ppWX/Bjv8JIB8LyTCKk/QYdnvvMjFHSxFAzqlL
X-Received: by 2002:a05:620a:454a:b0:949:74d8:46fb with SMTP id af79cd13be357-94974d84ca8mr951481785a.41.1794867987415;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b4f07sm127381485a.12.2026.11.16.14.26.26
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5701579eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867986; x=1795472786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=hIr7GbNKjnkH64q1lev2y9rJOLQcydbwnhEJDdjupN7FrF65IFq5tz989yBs8FlD9d
         AabbxRwDuxspnkmJ8wZT712jZAvhMJC8PhTpx31Cxka+9lU6PftW3I5RpQOlxIOvtezQ
         FwSfVad6aXjf8Aj2VEO2p21k+taX1sctFnZz0=
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994377eec.22.1794867985758;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994310eec.22.1794867984774;
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 1/9] net: ethernet: bgmac: validate RX length against the DMA packet capacity
Date: Mon, 16 Nov 2026 14:25:11 -0800
Message-ID: <20261116222519.1416501-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BGMAC_RX_ALLOC_SIZE includes skb_shared_info and alignment space beyond
the DMA receive buffer. An invalid completion length can pass that check
and reach skb_put() with more data than the skb tailroom permits.

Limit received frames to BGMAC_RX_MAX_FRAME_SIZE and reject lengths too
short for the FCS subtraction. Keep invalid DMA completions visible
through rate-limited diagnostics and RX error counters.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef239bc487d..1c502bd64d7d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -457,10 +457,14 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			/* The allocation also contains headroom and skb_shared_info;
+			 * only the mapped packet area may be supplied by the DMA.
+			 */
+			if (unlikely(len > BGMAC_RX_MAX_FRAME_SIZE || len < ETH_FCS_LEN)) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev,
+						   "Invalid RX length %u at slot %d (flags %#x)\n",
+						   len, ring->start, flags);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.53.0

