Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945370;
	b=mQJuRc0DhsUOuwa7QcpSazc/xKqOumV+Tc0k75XQ1JbkWiZJL8lLTehGIJ8XRDzK5e2y
	 5kpOvvAJHCkXAkNIJligTctywYN3gbyfDJRrRGqrDoloTktV5OCYifWEOxXpyHwWxWUgg
	 k6FMLoxcn/GkrlkhaziIuwmtHrpoNg2jRzz2dVdLzsJsgs2IFhjHXFkOPIe3nSZuCaXh1
	 dJ7BdGgLVFnLkPOrrTajgIbKJ0y4Nv2RjwH308bEElHr2KTK9FKx1bJ687Nto2oSd2tCB
	 JjJsui7fvDh31wQwdg4LMSvNn9v5H4TkkC2nunczFb/s4x4RN1H/YEPDS+2CczbPYig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945370;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3SY2d8TpymV/vz4W1M0rJj5Osf0YRH3Y68+p8Up80KM=;
	b=qSvoDW53KA/LWTzt/0eFliZf7FL3IVM7sOVxKA6wPlFU3YB7KNvp588ChwrMfr2T1Y5q
	 2kQOO5vhBKgYN4pMgtA2uQzQ8+vPD6BMRsw4MLdl94xicxLWyDn+3lnSaTU3f+6fjP5Nj
	 tmBd0bYVOSROu9TqTsONkBbMk4AeHjZ0phjUPLcy9fYIQui0Dw9vdYA+4tqEQ1NZ+9JB+
	 0gGMhc053hcJgcq3m0ci6GJ+6taXubIp13irq+2kBW9FbfoHFzDJJyRE2AwttgETF10Wq
	 vREPlr550Pax1LjsbIN2T+qbaLmKKR49pjB8nOU/O7+BrBVNk5MBuMdkxa3k1+JCcCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=ETVQaVgr;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E8606A32F;
	Tue, 17 Nov 2026 19:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1E8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=ETVQaVgr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1794945359; bh=3SY2d8TpymV/vz4W1M0rJj5Osf0YRH3Y68+p8Up80KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ETVQaVgrpkHx8HWZ+F65FZG0TV0AKkJ9hI/lawmWcO/l3SYBAsnevOO2rEW39deCr
	 xxYBvEfHgMvYRWaJ5vmjALW5dbq3G7a0SObui2gKIx2pa//91mlxlAo7C4Za5RG5rJ
	 WLW6FPb9JcO2Df9S5fVo8vuFaLOSQXOsSkccLlL/pnXA5DqEh4yFKNMYcFchyebYyg
	 FcFuRBElYSyu2g4BFO4s3vg6p3cKJZ1QRBfnnO65m100Khgt7fFdzUMrylJJkHZD4A
	 7u8CYnZOKoHowJtQJliUn7bdL8vW/x/nsUrjL5Rf68u05GYRnM4g6SrOYJh/ZuNR1Q
	 bvUV+e0kLAwng==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id A00BE27A6BB3;
	Tue, 17 Nov 2026 21:55:59 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 2/3] net: ethernet: mtk_eth_soc: skip page_pool
Date: Sat, 14 Nov 2026 00:34:31 +0200
Message-Id: <patch-7f000e4c3d9e69480484b3283b01c6dc@loljews.com>
In-Reply-To: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The page_pool is created with order-0 pages and MTK_PP_MAX_BUF_SIZE as
the maximum DMA length, so it can only back a ring whose descriptor
length fits in that.

Gate the pool on ring->buf_size <= MTK_PP_MAX_BUF_SIZE and let larger
rings use the netdev_alloc_frag()/mtk_max_lro_buf_alloc() path that already
exists.  ring->frag_size cannot serve as the limit: it follows the
netdev_alloc_frag() layout, whose headroom and skb_shared_info footprint
differ from the pool's, so a ring can have frag_size <= PAGE_SIZE while
its descriptor length is already larger than the pool can map.

With the current MTU limits every ring fits and the gate always passes;
it becomes active with the 9K jumbo support that follows, when the
shared rings grow past the limit.

Link: https://github.com/mediatek/mtk-openwrt-feeds
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6c8b039fad..b3a6e57035 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2824,7 +2824,13 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	if (!ring->data)
 		return -ENOMEM;
 
-	if (mtk_page_pool_enabled(eth)) {
+	/* A page_pool hands out order-0 pages and is created with
+	 * MTK_PP_MAX_BUF_SIZE, so it can only back a ring whose descriptor
+	 * length fits.  Larger rings use the netdev_alloc_frag()/
+	 * mtk_max_lro_buf_alloc() path below instead.
+	 */
+	if (mtk_page_pool_enabled(eth) &&
+	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {
 		struct page_pool *pp;
 
 		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,
-- 
2.53.0

