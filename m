Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905243;
	b=2VnIzGEQee1GtV3QINSHjIbfN3MiNQzWSjuvRzFu+0aNTNVGx5K/br7g4v5GYFL7Rs6j
	 /GuwBu0uZBq52HzgGWJwCEuONijsbz9hH6/WI6ojy6mBkw+mrerz9MdnK7Y/E0tufoY4y
	 XCTD9+Zj2dw5w7AWKbZ0jE8lhm7DXYDnMF3yEgMltXsvuWDeH3L+MOPGPLHQpLzWxd/UE
	 HUY+kqCWcbDiDdDiTgjrU/FTYl8GDHtVq+rbnIadGIlBX+VrIiYwLlWKVDFYF7V/xjI+Q
	 mJqe2bbhH7Rc7h3oTs3NP+uianfEkg35YOy0RY5rYSPz2tQvLMZiR+SMpX+BWha2zNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
	b=unsUoiorHI60mDelUqthkeOGbkIYjxnR98/jdcsOhfbq1VXI4rYhvWXzYE/OaLwA1UkM
	 WBQmwJlJj6NKKMis/U7X63JCr279VIOaqm7LRfXe6C5jpUxj8RQoV7gGslmHA82NXhNLC
	 zRHScYlsOQxg+R+iWwNNwzsHQUNvgdmRBH86yB/Lv8QZKthUK37Kc8S3sGPvtNXSLQ11w
	 d4Kery5aUxv6taOFipHF0VEHBkRBVzoMWRu3bJDGBxOfNl9z477qgAhsOTQ5+PSvU6bsK
	 s6tb6Ahc9PxtMobqrUswPc9dEUYjOrwcerVx9pqUEHUQpaRzzs+tFKRVv0ak+rLJO4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301FB606A890
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301FB606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5s23NFC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aOYp3408351
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=; b=hRTRieTbN2H71Hcz
	NetHHMXDVeqveZSMQpuoRLzIRQRjusqvuhVwBBbO+zLnMbHfITksAejBbs7je2XI
	dZuCmKSe/LoqBnVhuWGXsQbCgPsoYAyEPSWPnhIMCoO2RxmJXu4L9j2gK39iyev5
	dp3R4AdsH2yqBUyQXFnKYLodioXRTx1Uh9fN/VOluLwurG7pdEIP+AR7OrBZwubq
	Oanb57PZPRFT/4Evn5lpykIEL4hpJL9fWCANcXS8Ruq6+BPNTBxo6TCb5Stkjfi3
	gSM5IHUATEQS3gMD4FT1gYSaceAkaPQtq7grWRnZas0pAXqNEcUYIzTfUnPPgD0I
	17bWrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htj7cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:47:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2566158a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905239; x=1795510039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=U5s23NFCIeut2AkO2rx8uPXX/f5MZsaXruk9eClPaS/wmjKl8ZWxVAOroioFVqOZ9Y
         A1xMqunj/FUsxtoW6svQPRoMuqQJKUPtLaRmtWvur2kbCHFCCHPl8aZijYxdUOtSm5i4
         9doBDH/FpXh808r62mrWKgPLHtuc/BXzE8RfvtwuOg/YCJdNiw0YJYssQSjUvSPaidqm
         H3n/OEqiE5IfKz++DlxO4Sjil0ZXhhnnA+M/AqjotJ0gKgRs+ugeukEv3s25LzOQIA6H
         ep+y2Vpusqy3wtNx6A/n9JN04s0ni3INI60ttRf0kuCdyt0SqpFdiT6OBYBOg8b2BCqN
         JsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905239; x=1795510039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=JAtkOEKY/lU1i/O7msqGaEhJP8a7BObC9XdjcM3CqmmWsKJPgtDQfMXMYnAwUGyiHJ
         whsQYCWlxkzSulD+wi0+mWLSZJf7eGChQTcQ2AyrApO3+WLOtS5wfriDSBn5Y7GkoUiQ
         ynZqDAD4xfZDesd58+UDdqH+eFEwM5M5KaYAovBYS0yEj0lJpr9apyTVQnXayIgfA044
         Sg8K2gvTaXn3UOVpDy39WYL+V54wocfsK/b/32N7FerbzurCY4jz+MiB5xm5itVHHb3B
         lT2e9tbM1+T1RPLV2hIwUqkQ7g/n8Xlv37rftYT3RY/CwLweMw4UXhmESaMbw++y0DWX
         Ik+Q==
X-Gm-Message-State: APuU4Z+QrOxel/6aIeMMiSPjA+urN4d+miL2MXsEtdlw9z20jGB8hwbW
	zBOrZt4mDPf6kJUsioK5qO8i8hhXLPWG275PYGKVIAPnkjIsupZfXcMaXnBzVvDD4BK9NjNW2dF
	WnfXqqVYGAiZKgvY2PTNU4A5+MVNrPcWFJ85jHBxQWMby/J6s2bh+H8fd74xQlwD8Jq4=
X-Gm-Gg: AYBFou2jFVAAo36M+IMaLLnBZl7cguJFF9/+sc3GCVqGZ9xP7tEYaHPj8wkSFEAYa9I
	YvOBWrCoyd9Jx3ezl3Nl8fJkLEiMDH1FRadRPPzx00Vxp9H6bn41Wp2D6BroxYZA7OVJLMwFUhH
	3ymB1si6TP7XIYaPBhJv8Cm/cLH25iS6RKpZ3K5yDetEf6Z3ztKhlKUmslNT+86DLf+Z30LK6Lg
	/jztx8Totcc1/E27IWspczqMhaEaVnIAO6TbqYZnsvWbX25M/udzfUdvCiIH5j1l6xsUcug1VuD
	crfUj7YfNKrd0TOdjh8XOc8Fmf3uhJ0tzFEj27HrPwidUFBZj93uKFxbh9u2GnXTqDDw95GeczD
	EI3wgX0jS77J+9ovlhrfvCwW/ayiA6u1oj8JGpcClS4+vwSFz3VB+l9a/puZOM3jI65usYjTLOh
	GDHQ==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337439637.26.1794905239319;
        Tue, 17 Nov 2026 00:47:19 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337427637.26.1794905238817;
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:30 +0530
Subject: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
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
Message-Id: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2190;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=CFQDYIAl3U52nN9LE0obd03q0TxKqjDn7YTLgvYGBHc=;
 b=fAch74fvJse1lz8Pb00vNJqw+5n6bQH0vo490NO3MVqTDE54OpN0lMvZ607uPvmPjMjjngfa3
 gUWhheLbt9RBHNf+sBwp+FG0Ls3EbFzzZkRAIpHhpTy/lUoczip7j14
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxPKMtsTv2ANE
 xUIRhxM7/8WWgopxLEfHSRqym7kE+3GBms1vAw/KXHgPk9RcgZ3jzLtykAJVK0bUpYGCTWPRkOs
 dqHToRvHE5Pk7vLoQBvJS0Jt1Wwwb1w=
X-Proofpoint-ORIG-GUID: gIELQYkHhgu1qiZP7CkL0-oi_cIwGAff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2D4SKJcdnWDN
 gI6zMYt/xGvUoPIst5lt0yJHHj6gDLQFXL+qi2W+i0wP9/qXXoRdhFF6CWMFCkXGgAFwqfqqV9B
 YPphcYLt0Xpr8IaTkj78zk97tROq1vTGYZFY9D2ez7bQqIkWtqMrB/Ga0f1t/jGs/qbuWriPJBj
 cgS0Mvt/JZ17jCajPxBnk+60jhmFBJulSB72ImUxEu9cauOO+DhmwYCIFBQd55x6ttI+YhhsIap
 53L5cpxEAezw8fsFusXeNsyxcoQOCmP0Wc6C6YTGGsqEoAu/a1p23kb5kZt4UJ84yH/mv+r/THK
 UWx1JjzJMxY/UrJIcOp8AAG+f6Veh8xDZeOwS7x5hlAw9rhWSdgzJFtznrUqiyTcJThOSeshaez
 N9HB9EYJETswtgeKcfmvSm2Z03CjPSNjhrt/45AK1qhQmJOZ1ephDyxYfVSV9lWcUHSuK8ZLJGZ
 SFP3Meo9f111YUMF5rw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc1498 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hVEubRZtVI2ybN1AIPMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: gIELQYkHhgu1qiZP7CkL0-oi_cIwGAff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
the QCS404 version, but unlike QCS404 its RGMII clock source supports
the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
delays.

Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
phy_managed_delays so rgmii-id uses the DLL-bypass configuration.

The bypass sequence has been tested on three QCS615 board designs,
two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
existing compatible binding and qcom,qcs404-ethqos fallback remain
unchanged.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: this is a new commit which ensures that the phy managed delays only
affect actually tested hardware (Shikra and QCS615).
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a7fdba73da2b..790159ae1be7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data qcs615_data = {
+	.rgmii_config_loopback_en = true,
+	.phy_managed_delays = true,
+	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &qcs615_data},
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},

-- 
2.34.1

