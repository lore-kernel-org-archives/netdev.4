Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389222;
	b=3NpzTa3YIrXCFyl2NM+V+WEzkQutNI63aJg2bZKJKlZHwuJi0iR+cVSJ4beURiryG2H9
	 o4H/rHueo/hCDdNWFno/MSVcGwIweIb4vnmKohrVAJ03S3NEObW8FZ2wzqJedm7pprWmg
	 xGyGvPAjq+JTtg9WzJsxhJPwLj1It8JXRL+EqjQFNvwtf2p2O2LQvrHXsMpOeiKFDC6ml
	 47h6cQDieIHbJ7QYrPqVOJOJWkM7Ke7gj9KW1ndTLCZXBLQ6zcX57a0IplAX7rBuBSNnc
	 a38KDTOLUGP6Ozid/lmXvPAVc/AdQGw38tSR+4EsFXzxvQX2+gOasy5NFKfBC9+w4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=atmLLf/NrghE7vi1E0C0B1jlNi40I3lfJXEpESPi88w=;
	b=hLYcPNuef5xTkqUf4Ceb4Oxo+1BrpYZeZxnPAzdJUedz0FHQdaZ97DcksxL8OzIywb8w
	 ENMjxJiikMSO2jtqc5YevlE2v5dfM2ZSpJryWEdQP3KePFGPrmkOKFIrnBVBgycXYhHJp
	 cQDzpJ1Rz0fz0zWm7HsZi4s6Jt+QrBBwZLffEq4peAgoK/Vqmf0i2lvXlm9Z+1+UfzOOu
	 S0V8gb/YGwpCNbc98WN5/QqmJ0Yt9Y8sr0r/DCROTaGMKWb6ZkQW5N+TMSfII1Bn+D3yf
	 LItNHTXhcooV+j0qt3X8w1JhY3alywaZFGy0B7SEH4eW39HsfTfYCOZHQktgiLgSE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b="eeQO2t/d";
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FE1606A320;
	Sun, 22 Nov 2026 23:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FE1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=eeQO2t/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795389216; bh=atmLLf/NrghE7vi1E0C0B1jlNi40I3lfJXEpESPi88w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eeQO2t/da0L0ak8anlbZJXjDWzizQyLd0Kufy2nV2eAFnmRdpEaLsMp0QzlEPvj1A
	 06N4XF0ABWYaEhkptguS8ICLj60lI+MnsIcgF57WCT91vtRNdnP7W9VzewxWV6Ogdv
	 3fqOxhbgw/K+dAPnprYQeECYM8Tni0rZtrKqG9GhzGmMF+IGI1Tau3SNO1Odgf5pIt
	 gBsGUYyDL+dfQ1tJ+LBkP1PpH//FGGsrFDF9RReUNdHTk2Q0VC5CLMUU00ZEN7yYR5
	 M3LVryc6JoRu/Z161lzbFFaN9UmJVEhO05AD0cl5VZDw/74PK0AOIADfmBeYULd98M
	 mUVF2yNJOeUPQ==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id DDD4B27A35BF;
	Mon, 23 Nov 2026 01:13:36 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 1/3] net: ethernet: mtk_eth_soc: reset dma_addr
Date: Mon, 23 Nov 2026 01:13:31 +0200
Message-Id: <patch-154d2fe52d9ef9bfc85e603784552187@loljews.com>
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

mtk_poll_rx() keeps one dma_addr_t across the whole poll loop and only
refreshes it when a replacement buffer was mapped for the descriptor
being processed.  The paths that jump straight to release_desc (no
netdev for the source port, MTK_RESETTING set, or a refill allocation
failure) re-arm the descriptor with the buffer it still holds.  The
address written back must therefore come from the descriptor's own
rxd2, and the release path relies on dma_addr being DMA_MAPPING_ERROR
to select those bits.

The declaration was moved to function scope and initialised to
DMA_MAPPING_ERROR by commit e10a35abb3da ("net: ethernet: mtk_eth_soc:
fix uninitialized variable"), which also added the first check for
that sentinel on the release path.  The check was later replaced with
the FIELD_GET(rxd2) fallback below by commit 6e0490fc36cd ("net:
ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM").  Because the
sentinel is only still true before the first mapping, that fallback
has only ever been taken for the first descriptor of a poll.  From the
second iteration on, the previous descriptor's high address bits are
combined with the current descriptor's low bits in rxd1.  With
MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
frame to an address that is neither buffer, and the driver passes the
stale contents of the untouched buffer up the stack.  mtk_rx_clean()
unmaps the same mismatched address during a SER, which is the panic
that commit was fixing.

Reset dma_addr to DMA_MAPPING_ERROR at the start of every iteration,
so a descriptor that is released without a new mapping keeps its own
address bits.

This change depends on the FIELD_GET(rxd2) fallback, so that commit or
its stable backport has to be present: on a tree without it the
release path would clear the high bits instead of preserving them.

Fixes: 2d75891ebc09 ("net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988")
Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 21abeccfe0..6c8b039fad 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2210,7 +2210,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 	u8 *data, *new_data;
 	struct mtk_rx_dma_v2 *rxd, trxd;
 	int done = 0, bytes = 0;
-	dma_addr_t dma_addr = DMA_MAPPING_ERROR;
+	dma_addr_t dma_addr;
 	int ppe_idx = 0;
 
 	while (done < budget) {
@@ -2219,6 +2219,12 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		u32 hash, reason;
 		int mac = 0;
 
+		/* The release paths below hand the descriptor back with the
+		 * buffer it still holds, so only overwrite its address when
+		 * a new buffer was actually mapped for it.
+		 */
+		dma_addr = DMA_MAPPING_ERROR;
+
 		ring = mtk_get_rx_ring(eth);
 		if (unlikely(!ring))
 			goto rx_done;
-- 
2.53.0

