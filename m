Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905215;
	b=REt7LCugloVGtkiA41EBWWxIloMArUruNnB4edxZLjwj05yQwFjD/zXcBAfm3YP0SQoj
	 35BZ4RWSGe7EPDfwbpBREP+XABjbJb+ANLEsIKHGunvLgJHJakdG9ZFh5dP+SMvvIIDnJ
	 R6mV2CQ4f62ZpKOBYi8BI+NLyfXPbZx4YOs12ggj7DWPrifBHwTgxeYYAYWaUcGexqokv
	 RemoDcBewXNyFe+9Xt4Q9y9v8LTT3XiQtti7pTwGBRT5b6yfWjZwu3VLtITURwUzmNK6F
	 3Se8TWQ1f7MJNdkdZBrrPynDU+JwuxWyVcL8cVlkfFxD/RtUVA/kHpcvzv3AMVCIOaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
	b=Ilsap3HGlfSpr2YywpKRNEJQxnHFzPfN7x5UxVVOQrx48Pg4+HPDPJO23s6XVK/KjgQG
	 dO6vfyxuYX+BYxh8bDLSO6YGEK4sF5Xrfbf19bnX8hw8XLoSweq586Ao1EEocHGSsWxwC
	 Gs7nwgo/KaY6eTKEH5T/2gRZhHP0aT8k4JPhf1I65mrdFLzXpzNjn8rHP2oZfTAkozSKX
	 Y0xj4Ob1oy4MbIbiZdJOPpbi3R7veVn/BnJ5EU/euPgl2lD6m3izvJ+7zQe+KzUz8YSlW
	 CSjVk06O//NHvU8ahR6UmMh3G/bBWdXnzemoj4wDpg8z1XvFnVErJewM558sCwinAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83B606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E83B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8jOx82934211
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=NrY26mzQEiC4p5OS
	QrlLTzR7eu+G0a6BDStDdlA6yyJWltOfruzJ5X9OsWQi/RdQaUxQ3GSY93axuTN9
	xOHelC4J0oZ5xhUiool4Uude2cu6gT0HWJ9um6drPk0y+4gHAHKyBl92cXAsr6sO
	gaHSnuvgB0ha8P9MyjqsuCX/zCJPmbDVIRnvkvqbhmH4SIiW16ASEcXlWq+u28+A
	9ojJOzNMro5o3ojWSuUhM/z37achDooJVyJ6N8tYBjf6r2ajKg0MgsEvusWwXbth
	SdMyEAJ274Ix5Uwzt3oxBjg2nt6+JF/TkYeVkF5756I6dzi5Sx1mpkHD+m+l6i1Z
	s2w25g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a730-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so5005454a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905214; x=1795510014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=KgRakVzpMfwbA8NSA2GXLqOZAAA0Pi3a3e2prrO6SFcrLj2vxT7fS+gNq1jm5Mb9pS
         nr7+x9jikZ1hAdNsa8zKemRbt0/gqOv3cYSOJHu8x2c8k8zUIqyR/nk/5ZHFIqCPvwqo
         tijL1bNcc4tEzTdKFi+XWJF6MQOnuEZJ275yIA15WD12vVhw8O13dqzLdEwpEHNbJhpX
         cYq0aKGWGxIwMumXHf07dZzwAlX3gAjf5dIHquvy48LhJFmCRpRpboP4erua2uGJM7lO
         T2COuGiBT3JyVF5MrvEqBsU+ooXWhfKJ7fiBBwNa5pL3PEUJDCaREXgtTLfQCk763JNa
         2PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905214; x=1795510014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=AheWcWLm6+qO2Ptm1AycaZWdMCdREadLWwa8rs+8f3qInFz6rBzUzB6HWz/49RKZg4
         Gcsd3XCWQeAfOC3ltMcqxhwoAOIsCUasNrK6jllcPyyGXmLgxTlP87L8AAIGPsRnJOID
         MDiVS538De52Px3cGaTFhHUlS5EtBxu1PI8DNNb1Rgo+x0fLscFfMb54YH0cbbDJDyXw
         C+CZcE4vrRRZwwKhytWmypsm0DWqwOZjfVQqBA2iUYc4Y+N31rTfW7W/qh5MmIoeWaDH
         jqrP/EGk6gk/Yle0ZVHtlFAH0ic818vRPRsySi5tI8ZDQeyzl98WforQMJqrBbAuMS1s
         yFRA==
X-Gm-Message-State: APuU4Z/pQQZlHQIvhdLeUwrXPB8M5uihOF6j4lasfcva1hH3HddUkb4d
	OceZ7E9kd9RnIvlx1BbqNFUu40fFM6u1pzNnF/BoDEBiRYDsfsKNeO0Bsz7vyNZQnH+edj26AXz
	p4GZXOw1OU2zaBp6+OlCaigQ2RziTLmus4eSq0qRw92zWvetq+OSLkyKiQ8zisWdsJzo=
X-Gm-Gg: AYBFou1NtZf5Ru/8IyB3f/OI6hNrDQv2woIgF02cGhxIcdvGKeD5MqHi3ztQmqCUeEc
	jhwLeenhN4/7E182zW0+fhxSVoScAmBcQ3f+jZpiN4MHmDSXR5L23DukXRlV8ogVFPJd732zybn
	ICk6Ikd99sNsJcfPVplsIKRK1AIqmCKhlnzhKitX6d5LFfuY7jifk4M+yC1EH8Ox8iny9DZZkl+
	a0D2149nLUDFjSPFXNjZp9XmUOqezsHW6wGzWizxwO6535XDU6FN2YMloB680jQMcwnj84Uwwju
	q/YW4tAaiRlElJy3lh7nTmf7OXYVBGUIn/3FfEmqoF+5YTq5RXvzXZczUM4gSAh6rBFM5pE213L
	q92EOHftVQ+o6JO3MfwaJ7c+dNAMFZaQRnqVNF2cguGleHful1i2KytdaEPFCcfRSnwN/1Hc6K6
	ptGg==
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092182637.56.1794905213702;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092149637.56.1794905213189;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:27 +0530
Subject: [PATCH net-next v4 07/10] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
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
Message-Id: <20261117-shikra_ethernet-v4-7-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=n+OVBcpYDnfu1RAZNpTORwUsJk5/4Iz/XkRVvIn0LX8=;
 b=U0W33hjrN/xoSEpZUs1mBMAieyrO6ADIruqEMBfhJQAtg9FHals35UP7LllUCRBIJs2QGASlA
 BADkHSDqHYcDqu/Vh0Cgae7f6aUXUnWpw6HwAu6F4RhjdjIjqI8XA8h
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1fVdvV/HEN4g
 vqMXfyQ2zdG7R9gi5yRz6Yh1/90ZFL+btU1TYUnsjfUgPsk0YyvtE/O7/CfWalK0xxLZzrDOGlu
 shFSKEWTgHmTfYHxLUbabLxtLLOLDhU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXwu/uU795BeFc
 fB+phj312xOhNOu4Nf/3kbtmGHYSW/YwaSX42U1XjFtnrAKJv4NKNbUCrb8T5mWFsNh7hWK2941
 xRb76wO9eFs9rDOnyStQikRPtzd1A4dJDZHA58kzhuK0emKeD/u84b53Lp4G4+Xbuzr8n5c/q+4
 aBLU5zqwH8V3FdTkknd03tj9r+HcAGY749J90lx+qiMzU4ErEJzFUC+kE0QZahvA2APh29MBRsF
 rPVfxQQmQBMZQPnR5hgNF1rKFN78IZd/ziblNHudFC17NE4uJ8JtvE/7n3M5ETQR8FA5PubbJd7
 1/S7BV38dcdv3jSo8F+NGj5dMA5ORcHJBFe8diV18ZjqPF2EQIJWvSGYpF/xubPv/EcHO+r7MOd
 nMKOi5ti6xZ8KHdLlqQcXjScGkCoB6XiddJhktbRp9Oyp8gxzDxm0ObLR5FN4vzPB7L7C3nquV+
 gJJ7aqCeP+Luyi50uVg==
X-Proofpoint-GUID: fZ3mWpU3taTL35j3rShIVecupSLNNuAQ
X-Proofpoint-ORIG-GUID: fZ3mWpU3taTL35j3rShIVecupSLNNuAQ
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc147e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 74 +++++++---------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192788e00dfa..bc443793539b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
@@ -262,6 +262,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -276,22 +293,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -312,22 +314,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -336,22 +323,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.ptp_clk_rate = 230400000,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_scmi_setup,
 };
 
@@ -999,8 +971,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (data->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1

