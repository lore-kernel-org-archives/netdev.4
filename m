Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594722;
	b=16F9ElH4XoGQnfq+3zJcWFqwG5Zgcj0wziYbIOzvhFRJXPLnBBfCfnLPT0ISJyr1zSFZ
	 SQ+k3s/jHZSkdfz1xEBxyFvU4JxQnBGnoPykXmOVDW/hMTmkaBGdSXVBERH8wmi7zBH/p
	 X1j/hH6Zb7KCOeJDrFu2lSWDJCcFPLtArCyxrkvswbLmLnMjOGk1SO0cLioq0BDOqfKpe
	 51/sIHVyC6lM9MAdzHvx9KSJDLk3xWSOIBDYNowwgixWlF3aEKCQA9/HYc18B/quWF4nR
	 dcnRxfXNXY/FHd8p3YcGz/zU7iF/hQMr8Yc32Hr6g3Ox6DTEu1uwrGDvqL8/Nz9P0dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
	b=NiODCi+bKpN0mqDz//xIeayVXIFUYv7J0kZyxqLJU3USUUP3AIw6q0w+5OOjFomPpxr7
	 mpRFFgOD/N/3VOlqInVPj9V72Tiw5Re/K91eRyY05t6oSK8rqvTqcUaOsvytJkHjLATOk
	 /ODWZUaRnFe0WheL9IbhGl3eTpp0TV2HAxJXTuzBdTBmqxLtPGRcYmueLRhgnbK3Fw6ej
	 L+bLDtR/iPe+7iavRreVtvUkE7xq5OXcL0B/3ozt1DBBJn0CG3iqvlwodm9y4raevi5Gh
	 s1A6KNv2q7P4gfbpFc1ShA20buMKxoMRN7iN20pPP5CHR0YwlVwmRY9LpnOmR9RW4hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5Ff+Aog;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACBF606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACBF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5Ff+Aog
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-55650fe1f0dso3039486b6e.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594721; x=1796199521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=e5Ff+AoglWwtIN9aVn20XOyrBqnZiTmcKZSasE0tAym8AFP/FBtBBPVPl785Tt2O7P
         Qe49FoPzCt99Q7wWT9VWQAPVyOAUCEDgXMaayj0tZcbBARiDEOKjRjqfT0m1/h+KltG7
         cnWdwioI34ST1y7flkOl/8nt7wUuN7v/0+E9FlURfw3hMn3TVKPnRQ1kTZ0zG0Wx6Vyt
         UYIrSsNWZMG6srAVou1YLExtI1ONE7w0T5R80DnfxCmFViRkFbCI328x8UDruRDQjZBm
         DJajDeQ+uHPIr75zRZxrhVdFDQiyiJg0Ji2OyiQC2uRztFEZ66mg33H9TX6dGwTJGwfi
         WIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594721; x=1796199521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP5KvBLLujm3tot/u72/GiMQgb/Q4eLbGpnw4Ysyfns=;
        b=vqE8LBXqrfju0TM+sWTxXN4CYWrVNxAcaVcLNvNaMslK8gZeYyVv6uDUFr2ThMyIhL
         1tXoOYfPAYbB8eOIpMJdpgoZkcWx0faZqkTWbdvVOrmmRExizoUoZx6uLhtI7GLMqgHr
         ow8zVHjQ10nKLAkuslT3urKwbokYYO0uWWl9xcdqfxkXyp2buKDZVmoMHg0jJvTBdC7L
         7M+lSRZkiDZ0CvQhoGByfPJtfVh3J/FdAPM5aRT6CGEDpxv9ux+8Leb/P/fZmzaKGHnN
         x7l8e5ILPStF3p5w4WNY76wqSjkzT3rK43bEJkWG1amXfWJ1YVEProbWNTyvNMJqCaLb
         h+xA==
X-Gm-Message-State: APuU4Z9KDZhazDlOoiF8Uihn3pVHJ/bV/M+NCOEeTmFbb5e2Yjr+eAln
	ma8eki/dp0CeTwCH9vCHl1GDyAKm1+JjsnftK3f58vEsguZ0qs8BEKMd
X-Gm-Gg: AZFdTZddeQwKpPRES8JdEGuSXuUjsV7MuoFqy1nhTK1NXih2qsvoAC6VmlHYEYaxBHF
	sslqVbMuOZ5hCwDCa4svvAuZZMXjxNqRCBMW93mi3zlJF6Z2HRmJy9E/3zcEtU6IyJCWx0NCWXE
	kdYod+KZVZeUV4017rEpOFw2651xI0PJYLNUCQVr4IOBhX5wLioxP1sXX9fQqaasrYC5kJGsrUb
	ku21E065yv9gUnD7cxIBIWor5TwoT3+CQdlkfzpFaNvqDixkfJjxqYL8MrNplRLU94XJgKNyAR8
	qVuACTSbTNbmseVWTh0hKMLf7+8Y+w9JUg28Q0Qvwqd57DuHAro6KhZOn753pQEiFd52IJj6Abg
	zhxPbSfKGapftZBbX2L01v1V70blXHhrBcERe9SMczEsnl4K3UMGwKkgF5CcPne9XF4c7lEJQBt
	P+poQEwGwv7UZIJJoOXRxyt0s/KgcrfVAooSmkurY4lU9wK8fbBx9w9WlfCupcOLHsfnar+rmTg
	0P+xNQblzcqiyzIcrmirmi7cwXPLbFROy9gDny2ijTtxzP5GKJqfXB6TTKwDBSOG54N+qg0fcYB
	o9QUhHyM1iNaEVj6NukRdSR/jbzNTHLP2MWS4MKIBz5cq/BnCQesSkmg/yHKhJY6FiEPovp3Ook
	wsC0m6pd02Cekr6YtNvBdxnxcxRMzpxPI8KrCorstbIiYz0+ASmMKVPNd90VnCHxxgGvqu2nDt/
	gJ3e/o01k3I57+A30GYHKcfESuhkFugq+4939XHBhSGVLxYtoW3oQ=
X-Received: by 2002:a05:6808:14c5:b0:4d6:90d3:e189 with SMTP id 5614622812f47-57a0b750822mr17691751b6e.50.1795594720871;
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:32 -0700
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-3-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Allow packet captures to see complete frames that the sun8i MAC
forwards with wire errors. Mark these frames, including runts, as
errored with an unverified checksum so stmmac can deliver them when
rx-all is enabled. Incomplete frames and DMA errors still require a
drop.

Set runt forwarding from the rx-all setting at initialization and
update that bit when the setting changes on a running interface.
RX_CTL1 also controls DMA, but RTNL serializes the ethtool update with
open, close and reset. System suspend freezes userspace before stopping
DMA, and the sun8i interrupt handler does not change the RX threshold.
The setter can therefore update the register directly. Keep error
forwarding enabled in both modes for RX checksum handling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 379108e3da32..a008ce1f7882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -198,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD		BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -648,7 +649,21 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	u32 v = readl(priv->ioaddr + EMAC_RX_CTL1);
+
+	if (enable)
+		v |= EMAC_RX_RUNT_FRM;
+	else
+		v &= ~EMAC_RX_RUNT_FRM;
+	writel(v, priv->ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1053,6 +1068,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
 	.get_umac_addr = sun8i_dwmac_get_umac_addr,
@@ -1126,7 +1142,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */

-- 
2.53.0

