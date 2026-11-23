Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459339;
	b=dzPK2zS+OFANn4FFc3obwmDex7K7+WlcWE9fL3qDAK5be8DJoISP7ugEzwnUkmoS1NZI
	 +2mT+jnegQo6ctMPKLx9SNeL5y66osoDA7xCUkY/UcjoDyHkpfguUqrz4lMl1rNuqo9nV
	 fSfmK/btwgyE3V8FFPcTERT12xMbF6p6MMxilp1YUt3iY09GRqrhPnGvkVTkVdAIu0eaw
	 I0QES37ZUIn/leHxGdcJ49iBoU6XiRj31vZMhXokt5wIeBf2ds90vwxyYoG95aG0uFkGk
	 NaZ8GPlGoXQgD/0YHsuW4+eFKyJcX1GrzAaqPdk3df/DmzXcWgXefXfuaXCca6uhh8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
	b=lu/XYe5gRf0VeQKNBv0j+wWADsY9ehWXZWU2dzNQF7zyYigICrbp3w7TO7JZBwCyawGZ
	 RaPtILtTwI/BO8cA1tKD5T1ysBuCGhRqbyUi7O5Tuq/Im9T7NDku8lCtpy4GdWwwvsAbs
	 3hIQLt++loEu0lRR2L7h6JZn3Mf1yWHdidz/72QIZRIinl8GpVYPVL1h/02JDPM+sb7mu
	 T/44+VMKs+0YMSpXxY68flTpUAplAfuFZqYbdIeaP1tRuQiYxqN8ZkGOVX+IY3MuSCeWr
	 TuxVaW4l+iVROdOHEJHyIBoVdpqfqrjUb8u/4GONwJxOVmI2No/u7qv/ra2yCv0eAUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIuBBZlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXbfnadD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614660A2601
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2614660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIuBBZlq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXbfnadD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Tn2487357
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=; b=iIuBBZlqDjeUeJLx
	VzJE/2NGa3n9eGsHohiCG6D4Eb9GjHh9ZipO1MF4siXpONxaq9eTS/HYnmpjKt8k
	80kX2W47Op+MVK+R3f1m3ZpLVY/kS7M6OW22SYnPcsQWMcUPeRr04AsHdZZXl5c+
	9gz+1cUd3WscsLA0kD9GGtSFR67O1RiA2zwyveMD2zZi+aBYyfSGY2fOuLm1xVg/
	nZ6nFOMcArTnmXo4WRSifJnd0OmugNqkUH9Ulhfkmk1RL6MrHB6eyI7hAXXcA4hv
	Mm7ArZKJXRKbvR2gf4YlAs+RykQKa7X3OQsOMMcUb+PhhtuxSY9c/P4siOkFpnep
	XGZf+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02xrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0a5868265so9351245ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459336; x=1796064136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=bXbfnadDsphkPvkSZDc9yY7y1JUgiEgnet8Mqw3cX+c7lu/YxMu3F4Na8Ngh3wgiKH
         84GVn7HcTunQz3qY2M8w8GO67IRMgOnGPEBq1sDKKb5TSUnVhd2/A+guXk7EL7hUwnF4
         S3cN4D2A6DcKN1SJWqH98Fsr817KZwBhSMnrE0MIK07jTrJ40DuHKNZ1rW8KyLyCikRp
         24qfgXxq+d6jZNZV8m4lgwPZoaUl6m/9W88mtuiNXTpQoRyBKefHhDSakeGgIQhn2RN9
         az5N4hq8X+ezN60PuIo3RxNUIygiEfgtH63JVyGZDSn8mkrzu3GlC+2ivPkt78sUW2lV
         l/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459336; x=1796064136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=Z0QGZyJCnZjfSYtp/z9hLHEb1UG2AA/Sbl3qZIp0dT6Hze62ITby7nf37H+AcuygLr
         Atp09sbZVIbfhfyxoso6KOhzHrtuUbzn6t+yiHQ9H4oTJ4vw9zEMg3+lFIT2N9HEaKXf
         zVZ/9S+ytRduVzuHs45FBvQPIxcG3NNMNGW1gGhU7oDEj9nMHiGBM6xqqmfmSWrmufvc
         7VaeaGU8iHZ5wfBxBtjbkyPu0PDCuEtjPJK5JhggRn4MN/rD2OTYmmxgkKkaQlMQUOvd
         yqd4GMXdYfCs/X1P+Ciz1wbV9oxxOFNS+wUlN0DrN1yl1GUJ25YEYHz2El4CQyKpqbfq
         ykaQ==
X-Forwarded-Encrypted: i=1; AL+hErF8khBnImLTQC/Wvt0eL3Psjtj51aXmyjpLynH9RVHwn1cp+3j703Fmc2s+nAf29eTBfrUZGnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GpCq4e7Zjr9/4ny1wTEEP1E8FX6AoRCa50sFNvVPixixZMMgg
	0dBRdoEZAYSv4pkHTquDYTx3xVjKLELkzdCUyuwKntQG8t0raLLliykh70dOg9CS0DK4ItmKaQy
	NlRu5Y9Up1pvfyqOCCgfA4NhEe6dgoEErHzs7RtcqRhL8AAoCd1/K3M9+CVE=
X-Gm-Gg: AZFdTZd9QvNMw+uAu4vL41RZTCKn7OXWTDfB1L+iIriFgkhhsOEw8zCt5tNvx5QZbRy
	qHgbLyGm6ZNsUFbGfDdB/++11zS7yL56NzxQO56s3J0B8u08FbM41b8qFrXFdqgSnLA3ruYdx9P
	9otVJySwdDziTS3WNJPQQWAfd+qUV7Rk7SPBscSbCY9JKV+CQPtilHgaYrOtT/xN0DvNLodTQxs
	rONQpmSCCYTvRsqYOWB+u3hboNu3sXtoPXkx7bz/fxXphKCW9MLKZynlwI0jWctXQE1Ys9VK3OV
	3mu21mG+KutiZ2dBITEZX51Gz6lxnXMApnnZ0ktTK3VbW0rLcAUnisp9sQSzKzv5HqGoYgy0Wy0
	rRSB7t2apfB31mj3lAaMCq/Ac/HQ65zM7zr1qdeSIgO7XGPTgtG+EfBNRR/hk83a7oHmPWTMEkK
	nbAYQ=
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107585ad.4.1795459335941;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107375ad.4.1795459335372;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:46 +0530
Subject: [PATCH RFC net-next 2/2] net: stmmac: qcom-ethqos: add RMII
 support
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
Message-Id: <20261124-ethqos_rmii-v1-2-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=4504;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=kRxGmpwxWiUKde3lWav3sfKZe4+naAB+GV/j9yR3r+0=;
 b=Pdfz7iFpCQkw9TBsYCpYS/k5mJLtRjDjxLB/IUsCxPioLlsre71Li5Y2Kv4ilRh9E8OSSFXTi
 6qCFxJvmEnlBd+ZnizPKBDyZh2nvBJPnINaHmBt5YuprQcwFvoY4bVr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXx1VtoEnFXhcL
 X5JRQveeYSzvyl5K1bOLCOQ1QCy/EAWIJd1S8Qnbm7od71WX9pmyRbNVYbamSZYoPGV/ROfIFzU
 aUUfkpY1eN8KQ3JZiWfby+V6WuxMFUCTi/mqu7ZArftvWJTv213KXFvJgrXUZvptWklfJi/wfag
 M8HN7ohfCE8PNndc9oW7K7hu2UIcMvu9GE3yUhLuB/9xHTHsvYFmou3G5YZ8d6XfkSdDDZKrF+c
 XEmxE1qQKgZihTpJV4AV5qpDezQ/fe9Z+uyJkArmpxMSWMujUxBHxSgnkPIBOTYGAEb2TJKOv99
 9HO08Yh7hdRPXFtJd3OZ8cr5ctqfHbwmZ+MxdTbLAflmSFj5VhJmxRGlST0qVouR0SC/uQf/4C5
 Pcox2BlgwKbWWFhaNO96fseAI737EBSzAlo9F/ljzct6jbxudQBajBbHzdnMGW03lwGQO8hv3yh
 TSjsAmmdAF2VCGwuyRg==
X-Proofpoint-ORIG-GUID: RbF9OHx5xHdp3K53p-YaMZTsqPz_RTXT
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b048909 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DEAQ98Un7x_38zuDVC4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RbF9OHx5xHdp3K53p-YaMZTsqPz_RTXT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX00p33mgc/VkQ
 wB74p59hL9/idPB/B67ZXopHCk+hiOSJiODelEQQH2LKTbIlfceddQf3c9hylORiavnN6dS3pj0
 +0dAZ1n9oGYU1avLTWsOY06LLj7cTGo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

The Qualcomm ETHQOS core supports RMII in MAC master mode. Add support
for it by programming the required IO_MACRO registers and running its
link clock at the 50 MHz reference rate required by RMII.

A brief explanation of the programmed IO_MACRO bitfield configurations:
 - INTF_SEL = 1 selects the RMII interface rather than RGMII (00) /
   MII (10).
 - DDR_MODE = 0 selects SDR rather than DDR.
 - CLK_DIVIDE_SEL = 1 selects TX_CLK as the divider source.
 - TX_CLK_PHASE_SHIFT_EN = 0 implies the use of normal divided clock
   instead of the phase-shifted clock.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..683c6c3f3f37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -71,6 +71,7 @@
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
+#define RGMII_CONFIG2_RGMII_CFG_REV1		BIT(15)
 #define RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN	BIT(13)
 #define RGMII_CONFIG2_CLK_DIVIDE_SEL		BIT(12)
 #define RGMII_CONFIG2_RX_PROG_SWAP		BIT(7)
@@ -81,6 +82,7 @@
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
+#define RMII_REF_CLK_RATE			50000000
 
 struct qcom_ethqos;
 
@@ -182,6 +184,9 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
+	if (interface == PHY_INTERFACE_MODE_RMII)
+		return clk_set_rate(ethqos->link_clk, RMII_REF_CLK_RATE);
+
 	if (!phy_interface_mode_is_rgmii(interface))
 		return 0;
 
@@ -523,6 +528,38 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static void ethqos_rmii_macro_init(struct qcom_ethqos *ethqos)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
+		      FIELD_PREP(RGMII_CONFIG_INTF_SEL, 1),
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CFG_REV1,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_setmask(ethqos, RGMII_CONFIG2_CLK_DIVIDE_SEL,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_fix_mac_speed_rmii(void *bsp_priv,
+				      phy_interface_t interface, int speed,
+				      unsigned int mode)
+{
+	struct qcom_ethqos *ethqos = bsp_priv;
+
+	ethqos_rmii_macro_init(ethqos);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -710,6 +747,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
+
+		/* The RMII PHY has no clock until the I/O macro drives the
+		 * 50 MHz reference, so it needs to be programmed during probe
+		 * itself.
+		 */
+		if (ethqos->phy_mode == PHY_INTERFACE_MODE_RMII)
+			ethqos_rmii_macro_init(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
 	}
@@ -771,6 +815,9 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	ethqos_set_func_clk_en(ethqos);
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rmii;
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
@@ -897,6 +944,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:

-- 
2.34.1

