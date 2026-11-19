Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097434;
	b=gtnBInzqBDUCTpEQFr7iIgvuFnscLYQ/WdqzvHNFUFG1rpeKewb119+oOCmGv1QxPMlp
	 2Ou+d2DGDOgQXnvpfbHBSIpvZdhuVThbQ70eRgmPG6UvqzmbBSY0jzCkdIkSQVwMiEAF0
	 ajy4a/7tGIDDTlykyzccXCwetf+6p9ytalxyncIO6ExAHGsoqDN77CWlNHw/f6UbN9vbU
	 Vu0Qu+hhiKZVidBJ6I33jKyuVdF7a8Qv7xklw5/c+whztqwjsBfhJtWl/S0mlelkLX8Ws
	 SxiQdmfyoVeCJaQiCFd1VN1ONXbtC1TxkwkAL1WH237O6iB6rWwl2zq49WVubzpcXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097434;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7VWEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=;
	b=E7wvvWhZnHm3cBbZf8oYsZaCKaNRyrrsOtjO8dAMHaWDfNIlXHfGMh40vfHxFBYGvTEs
	 BgZO6qiFct8eO6p9Wvf/NaLgkzv2Rl5Jzlonwdu7ZdrXzS/Guy6EHJQqa7hOAdBEU1wV7
	 qXqAyE11UozOPLbnDosvJjgdj1TjSbjesxclIYdRmZUMKXHHuT0NZWgsS7XfPbpeop6YU
	 N306OS5ii/qh3PyJUTNUCAR5TnbiZcZJY2A0PWZcXFtWiRhKTf6MdxCRzkQLHdHXgA0zj
	 1XzIXf57upLtxnp+Pg8EK5o2dSWkmjjGhPMmh/vw2cshL3jg+d8gCB5C3pSCuFCflXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N4jfmheK;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87D606A325;
	Thu, 19 Nov 2026 14:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE87D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N4jfmheK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7V
	WEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=; b=N4jfmheKU8J7Ko8Ir2
	4WvCdbsALllVXMJjCyEreqGAppHJba1QcaWDKYOFz8FVuhI7CNUEMg00+lxC8is8
	KbIjEipCdhPtY6H2Y1QdzBikuBIV3fKaHJuIdJ5Yc89x8XEcI+qaAuBy/jZvoZM9
	fGDlkK4hlHnYci0JQ8TJviRLo=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3Zjj_Av9qQc93Iw--.13924S3;
	Thu, 19 Nov 2026 22:09:24 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com,
	fujiahui@lixiang.com,
	zhoujing3@lixiang.com
Subject: [PATCH net v8 1/4] net: stmmac: honor allocation flags when initializing RX buffers
Date: Thu, 19 Nov 2026 22:08:57 +0800
Message-Id: <fb64c1eec47363e697f640834e249a047ca7f58c.1795096430.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795096430.git.dinghui@lixiang.com>
References: <cover.1795096430.git.dinghui@lixiang.com>
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
X-CM-TRANSID:_____wB3Zjj_Av9qQc93Iw--.13924S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4Dtw1rZrWxWr17WrWxWFg_yoW8GrWfpa
	9rAa4j9r1kXr17Jw4DGw4xuFW3KayUKFW5uw4xGFW3ZF4xKF90qryaqFyUZr1xCr48ZFWS
	qr4jk3s8uF1UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b8FAJUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9BRgjGr-AxQ-IwAA3S

From: Ding Hui <dinghui@lixiang.com>

stmmac_init_rx_buffers() accepts allocation flags but stopped using them
when RX buffers were converted to page_pool. As a result, callers passing
GFP_KERNEL still allocate with GFP_ATOMIC | __GFP_NOWARN and cannot use
reclaim to satisfy an allocation.

Use the supplied flags while retaining GFP_DMA32 for hardware without
64-bit DMA addressing. This also allows the resume path to allocate
missing RX pages with GFP_KERNEL.

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..8bd244046195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1689,7 +1689,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
+	gfp_t gfp = flags;
 
 	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
-- 
2.34.1

