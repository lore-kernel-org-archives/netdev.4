Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097434;
	b=fIBqu+XLeGL7V2p+4SRSQPM5soJpxv2g5cgJkxiqyJAMEFBK4DbIG0VYHtJL4gCzJ46J
	 q1fzUmhNB1HHFbPpz3Eiwm0orhcJwLI8waW8cv9K3a6Qh5/rxxa0Dxmni2XarvKPU5lM+
	 c5mdeX9OZyw9POtY97n2cwiyB99F6P+97c5k6d542uVMtnrQ8w+PmG/pcqa/RvCycgoSG
	 wAvEnUkvILjItzRbLiOCNd1k/fWBhX/lzrhVeB5bYibNta6ppXc7ejvb1F1B2zo/Yw64H
	 Ea3cKRhjOmoReRw2HJFvOdnxiazCqjY53JgkExUOqMKLFaXw7poqqeo2VHQnq8YfDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097434;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=fi+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=;
	b=BTpo4Q7sPBh1kWpt9DJVUV0dM0ID27Prklgdh7lvoP9UnVaH1FT7S20wgEMSf3bEQWTo
	 k5ssrw+NK4Ca/LRQQ0/FJO3kC6O4uLH8hZwgC/kxLtRjhXBZHc2/oFarngd33Z3xPn5T4
	 9rvBqQ9F85fe43+cCNbpR/QKaQbUnDeg6HfVfH9HPHep9EgzfUiAZL7t6HM4Tu60yRVdp
	 7Y3GswKixP4AhLcm7WeKa2rIEw6vCShX9dK7rzPwXhjci2jxm2msVBhMdOHTtjhZmCEYK
	 lwcQ1EE2Q6AFSodZ4WxG6/JPO2GzDJc8U7CVu7dzN/bwDew2aYx8Q6ubCOEycFDlPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cP4qZpvl;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D221606A320;
	Thu, 19 Nov 2026 14:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D221606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cP4qZpvl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fi
	+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=cP4qZpvlPQHEOs5cBR
	+fooBy8dOadAAELbPLG85uj6SCENDsAt2MBXmQdqVP5T8fWqnbudSBBWfr/9Gjje
	HTUbaX/KA6pNiDOaJmzhqhrED0/vKhpwRX9ETJzkFnacA33kDHPGHyiYQqERgM9y
	5EFH2P3WjXfUQuy5M6X2yfSEI=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3Zjj_Av9qQc93Iw--.13924S6;
	Thu, 19 Nov 2026 22:09:32 +0800 (CST)
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
Subject: [PATCH net v8 4/4] net: stmmac: restore the XSK TX pool on resume
Date: Thu, 19 Nov 2026 22:09:00 +0800
Message-Id: <5874b73b815d2385bbbf5f6988d50b3772fa0ce0.1795096430.git.dinghui@lixiang.com>
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
X-CM-TRANSID:_____wB3Zjj_Av9qQc93Iw--.13924S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48XF1DCw48JrWkAFy7KFg_yoW8ArWxpr
	Z7Cayqywn7tF4xZws8Gw40vFyFyayftF45ua4xJanxZFW7KFZIqr1YvFWYvry8JrWkXr13
	trWjkan8C3W5CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jCpBfUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8x1ijmr-Ax1JngAA3e

From: Ding Hui <dinghui@lixiang.com>

When suspend interrupts AF_XDP zero-copy transmission, resume releases
outstanding TX buffers through dma_free_tx_skbufs(). If it completes XSK
frames, that helper also clears tx_q->xsk_pool even though the socket
remains bound to the queue.

The resume path does not run the TX ring allocation routine that normally
sets this pointer. Consequently, stmmac_tx_clean() skips XSK transmission
and a running TX-only socket can stop sending after resume, despite the
link coming back up.

Restore the TX pool from the queue's existing XSK binding after releasing
TX buffers and before restarting DMA and NAPI. Keep the buffer cleanup
helper's behavior for teardown unchanged.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1508cf08f03b..550a0bd647e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2277,6 +2277,9 @@ static int stmmac_resume_descriptors(struct stmmac_priv *priv)
 	for (queue = 0; queue < priv->plat->tx_queues_to_use; queue++) {
 		stmmac_reset_tx_queue(priv, queue);
 		dma_free_tx_skbufs(priv, dma_conf, queue);
+		/* Buffer cleanup may clear the pool; the socket remains bound. */
+		dma_conf->tx_queue[queue].xsk_pool =
+			stmmac_get_xsk_pool(priv, queue);
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 	}
 
-- 
2.34.1

