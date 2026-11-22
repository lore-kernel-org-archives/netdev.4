Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389222;
	b=fxj1bcl376yrrTMqHINOcmCB53g06EmAYmsyjzEloQz/+q8iYX2DYLLPRJmApa2fso6Y
	 YFGc+DO/j1KPO5I6jMbgZNiv3FPORVWwbi2uPUiL6uBt/415fIxx2TPqFGebO2pbXwjPb
	 TabBhX5pkZR0wmVTTATYHH6WJpYk53iW0dkwJjwj8bNxO0KxiUWGyaya3sc9A6RCmtBR2
	 G9nD7O6v1O+ib3lDGUIgKS/gI2Pq3lBnbiEUtQ5FmpfV8ZWEihgUGWEbbHHIFKYqAfLyO
	 7C2VO9dhpTvuL2yFeWB4fLEy1pgQZgX1d0/7BP5/o+0qK2oInqBaLwtajBiNntxIJhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RPH9ZfMAk6/3lg3j+TqcCI1Xuk/6fEF5sowIRUk1hSE=;
	b=e+fvj70y33WEdFKqV4gU2I6CotyEpiZhWXjgCYnGN4q8gDyJ2ZJEsISi5BYBn+vykSB3
	 OPvAwyBvs62dREHTges3GWv+Hg2aQXFzdFQ2l/xDb+Q+RBnzhtUERw1XZNec0KLNMCzNO
	 XjBsMmhjCWUQfOeBWUxC0dQKq836yR4NPfIu9RQ6dLYvVwCP57hZmNvJv2gXPfcsIe6Wg
	 4V/Fudj1/UfCpzETQFc6m4HwQB2omByo6woip7Jg2glwfEXyltZjAo5rADWszrcInX2aF
	 s4FQZvH1pr76J+yseUg57JRigv+ss395D0WiUuAPS6lT9nrayBHI4NUJGz5GGixfggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=uFI9vQxB;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E4606A31E;
	Sun, 22 Nov 2026 23:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B74E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=uFI9vQxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795389217; bh=RPH9ZfMAk6/3lg3j+TqcCI1Xuk/6fEF5sowIRUk1hSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uFI9vQxBHNyD17DlmTDh9cNCVclrNR1Vjs3dU4kEaGiofwyIYl+Bsf133oKBoNYg2
	 HYUp1x1Vvp3LdTxBSdkxWiy4BO3VHRPe5VwuI0FyGLF5hGOz3Ul/wkK5GWpaz11T4N
	 vQrOOjp4Tzlvl5bgM7UmiNK3q+/Ot3AaML4JSmqfNBKTRjNJSYLe2R5qS3CpeZ6Byz
	 Wsz94y/WhXXLoiIj78wxZLh4jRNDYeANyH7wCaN7pO/NTaTn8sm4p3BDCAaTKPrPar
	 QMc4WyC8FaFv2a2nDNSE1GYh2Ytswtai+p/0AvE+1WcBQYybcexpBN8AAkhgHk5OCH
	 g3enRqeuRC4Cw==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id 0E2BB27A360D;
	Mon, 23 Nov 2026 01:13:37 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 2/3] net: ethernet: mtk_eth_soc: skip page_pool
Date: Mon, 23 Nov 2026 01:13:31 +0200
Message-Id: <patch-512286e3bf3d34c81957126ab22d02fe@loljews.com>
In-Reply-To: <patch-51fa5ed3bc801edb3f29b61ca7888382@loljews.com>
References: <patch-51fa5ed3bc801edb3f29b61ca7888382@loljews.com>
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

