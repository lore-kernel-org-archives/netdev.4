Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663409;
	b=VijkxeQ0mm3Rk40UuOgnWK454/HVdts4BIVmcB3vx/QZJeiUc3U4PJceCjNmgzV2dFgY
	 c+PG+N29xFuTYlbekiTiPkS6FTL10mBilflro1UmcaqNvjH7rMH923tIBBqg4ZCAywXFc
	 VywSyFL508R6u3QCdvf+oMRBEDHTmQmYiE459sfon8LHMD4J1rqJVGf+5K8VOFp2UPDX/
	 3S0X2/Ut4GHTFDZfrgsEdQnMIfM8tv4JXAtHjtK+aJUwpr9KnLWdxPiTPBpI9qPyUmrZ4
	 CXnWUWVppv+hM0YFeGEZ//mW+jHp5vT49jKZKwAny4ICdpi72b1VRYtL7k20fga/AgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
	b=QP/1lGzFyv97g0j0cSVOFoYKG8F/o7Xoxup2W2mxCaNOIO5SE99II70Ht0oGzNTQ1aCT
	 KiFgbs6Iwl2Guqly+R6tY4CprJUtaHr3VOk7ZisjImHZuAPbkvMLU/jvvOMb83EQNoncr
	 /5IlG4VFQMR7uDMScHikgm9fZveZN6VorJj19+C1Ob8wAV4S3MdafzicySxPg3svuGD3d
	 D3Ka9rLMHnGBiazoiytfXgHyejHbTd4EodywJ3if3308TGyEy5FMyFzAtDrjSuD06EIaZ
	 JJWXMGrAZwwiplbMayBLoYVNCEFTlH2DcYjV2Ur+mDc0M359ZJIA9wwMGU8+E5bNDtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MkOH2p7S;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3697606A8AB
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3697606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MkOH2p7S
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso2136319f8f.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663407; x=1795268207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=MkOH2p7SuwAXsiBq4F55QCEzAIz0+ZP/EFEvsb8IrMkKeZQzocxAzYRj6AE5tUbRi9
         cPaNBaLSJu49yc6AZ9LQSqsDGCJh2XkmMWBonuz2UcF4sWovTmScDqzMTUz/vcorBCM7
         vTTP6IAybe8Wfp0/upllpHC9ycYA+AeL5bVTfkW+vZw0uYO5Ycvzupt1YyzKmhoULi+L
         Bl0Rjq+xfyD+L7awyp3v1oo+EiRPKgeGbHV1TWE5574ikJnN5t86Ks2wkSnz6J7Reysk
         BQlQmiH60b8nOoyZNpkyS3xSI8yOn3CdWUxGw5y+BJeykHjKLqm7UULdot7aCuuK19JP
         ARNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663407; x=1795268207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=LJWwJgo+T8B2tD/loOaWERQOPqedOggeqajVVWSsj2E7MU6TMukdRifQTtjabOUdpt
         FIpCRxZ/rMhO7OLaBrlKmGYhzHeDOMVWs78Bvnj16i9LrOMz2rW00p8ef7UWPIWZUR8F
         rOmNW8JGC1baEj/oxqTA06AZXfNnjAfTG17UPVi2uAHHXuCIBvB3/SviaxjJ4aqJnaxO
         EIL+SCd3EHJ3PmKDqlzS2MFPRRBYVBJdIKIJ6IUynyyfwVd2+ox8TjDZwvv5lGn9W6Mw
         MlyMOLkXgLwQzdIcEpa9+0KZQS/df2oCrh6MXgcTx1VLr6FwakD1vTt4DJuBthmEEPP9
         JSBQ==
X-Gm-Message-State: APuU4Z+Yq7J2cuykpJrrv0OVkplvS+MrQ97i4j/nnADYiL2L/qEx7Bc8
	U+v/NeeoYtGajXceFm5uMcWc8pPMguRtcwwGhIRpgMoKF62tpNv0zGmZq9ZsRoEcV2Z2CCOm6oi
	REuHXtmxQBw==
X-Gm-Gg: AYBFou2dFXyLIdlBWsxdBN4e7Uv6TpKEPHGyXkRuMhee+c1bx0hVwN59xvrPZN9vja8
	n6TsChmCZ3UpOZ87UCUYv5MkguRWx8c81srs33Szxx7f99aOhABpDU6QOpmLY8ipjTUzvhz8gVW
	dy4FRTP+LaunwjtqcREE1MMmnGt5jD0e/BZKLOryKQ42ORO8Wb4HFwyt+net6aWEPDe8+zy+UN8
	68Lzto7jp0+cU/PZgz2sCG921Y4GKvzPHab7Q2DJYEz2lGR06m+XUxfO2GZ4KSQx4IoGLEDXEQv
	YJiomtbotBhZobXJQQ3LgW4Qww6Wc2JjqiDIOy0bF+E/TugAfsXqqSD5auAsJIJpRd5/t8yXbv8
	yXNETZULBpMdNJiR131M2nhJaZwDyY9kGbTb5o1O+SRhMl1p68rscyKFo20eJvYQ25K1yY+gPyd
	7CtVVsjnWI6rxa/EbHRHLRnTH58hVx7N5z+0RJe7RN2zVVdWtQDZNKotd6AdW2V/noL0EPEiPoL
	f6Twu/wS31xyNPqpn6f/VrOptC65JR8XbOSuHMfqlts7kZ0T1HDE3JcweNJMPAtIZuwDxSmgeGj
	zFQ3iiF9jUOFgoxyiTxCofYhnMSHU1XuC3aWKwLs3JbIQV6T
X-Received: by 2002:a05:6000:480e:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-49c7044c40dmr10978358f8f.23.1794663407155;
        Sat, 14 Nov 2026 05:36:47 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:46 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Sat, 14 Nov 2026 14:36:39 +0100
Message-ID: <20261114133640.3285413-4-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
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

When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
silently drops any frame for which the engine detects a checksum error,
before the driver sees it.

This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
RFC 6936 allow for tunnels.

Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") did for dwmac4. CoE remains enabled,
so the driver still sees the error status and marks the skb
CHECKSUM_NONE for the stack to verify.

Set the bit only with enhanced descriptors. The normal descriptor parser
does not report a checksum-only error to the stack, so cores that use
it keep dropping such frames in hardware anyway.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
Depends on patches 1 and 2 of this series.

v3:
- Move code comment of DMA_CONTROL_DT on the line of the define, similar
  to the original version in commit 47dd7a540b8a ("net: add support for
  STMicroelectronics Ethernet controllers.").
v2:
- Set DMA_CONTROL_DT only with enhanced descriptors. The normal
  descriptor parser does not report a checksum-only error, so cores
  with normal descriptors and Type 2 CoE keep the hardware drop.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..55d9c39287f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -162,7 +162,7 @@ enum rx_tx_priority_ratio {
 /* DMA CRS Control and Status Register Mapping */
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
-/* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000	/* Disable Drop of TCP/IP csum errors */
 #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
 #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
 /* Threshold for Activating the FC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3ac7a7949529..31d5f79ef560 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include "dwmac1000.h"
 #include "dwmac_dma.h"
+#include "stmmac.h"
 
 static void dwmac1000_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -129,6 +130,13 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	/* Deliver checksum-error frames only with enhanced
+	 * descriptors, because the normal descriptor parser does not
+	 * report a checksum-only error.
+	 */
+	if (priv->plat->enh_desc)
+		csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0

