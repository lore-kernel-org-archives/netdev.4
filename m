Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107886;
	b=4FMjJGQFhvy69XAkIPvtkr/yx2IBdwfy+ECXaYF1i8WGBG6Z626hJMoTD1xwEi5/+iVT
	 EOD0WH9SbDTKXIXtpN5WIWbQE1B5pamIas78fdPSuqYb8o+038NYZomKWzbFFpLismEaZ
	 44+oC8xFF8e3lpZVKAMISUmXCBnDCVLHYiHTRkQQef4joP4JutAZTGQ261hXax0u4cid3
	 1/oqK/k9A7IzDsokpKYbr1/+x7i6gmfcNtv4YImk5J35f2XvfXc72iTaw3OlevxOlsCLU
	 OOkMFlsvqbVqhiyHqIfT21dBHmlqfsR6YIWQ1+IB3d3VSewGmfT0cKdBZhlr5ixVFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
	b=VV6z7FGqaLzKjN9IcHnthda8hFvAfwKN4R/r6vMLUQoZfrvxC1Bl95d/WrHuWbsrQjzO
	 YaXaAi89Q9vDi5Z6agiJsw2PU/m5hbYkoZ+Mam3mbfnpvIXNjHxqqdc+8/rZmWEJe9h8G
	 aOMMEDd4LPH7uy+O1m0qgNK4EFpdXW61o5r/+6Vmcy1VcQGRJKO11ovuUjsDgSMGL7rrP
	 4HUZ3SWOYiehkkO1C8dkv3agNsUuAREc8g1ofZ42RGq3eq1Y0I7VjLmiPbyYm3mg4Qoqp
	 QlJKHzZ4RWLND1JvHNDpQ2i63DAdvE2mkX8wyRP0IdFVzqly08ohJTj4+TaW95251Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612A60A2625
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E612A60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrlZe1385642
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=; b=Y6Vk1GxXG1cDwK2I
	Ay5onzAoA+VRchaEdcN+T2+HmJKW1e2Mv61Zv1YiVeNf1fAAzpVwKf6Qcszwgjeo
	8SrfWy1No0eHTBNs5qsDwAFVPwMJ9YzhPepPmRWfJExpm96/7OhAQu/lNAbxlwuo
	OzRN0FOH1Y3j5A+J17CDSdf1kTDGyHquIxxHC6uvG+BsbTYmgoGi64xIpA6oL209
	Ks0rxNRakP5UGPCXPB/Mt/rHgr91iQ0gsoiX0qWKUAA15amMIlvhB2fxpR4yhugz
	cuBbM+WdH4xY1EwilCUIyJdxFK11DU8TwMkQIj1yg5WEb7mdX9/szhQQ5OiIEigH
	1/F5Qw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70a3rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08903566dso887865b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107884; x=1795712684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=T4eOZYeZs8XqlzJWEwxtKKBfHHAm2TfYOpEVkafgc06bxHjR8/gCrb2KlhVV7wRKP1
         FMb8uVDJAD5g0xp671cnt6bZ/rfd3Q9IJUjcbCWJKH/LPPE4pQlatGRuuwvdx4gJCfFP
         6ZqwRHgcZ6eIkx9/EAn3cnb5sjqA6CFzycrZQh8UOni2bmRifsbxAGJBhHPGoX6i56bJ
         DpS0OdBrMyeVEzwwpaPTAd2IGPAI5fFcTVwAJGeX8b13FUlJ5Yg3lKVJHxttbtTYxa29
         gOnz/LzTXrlbKmNwf/3yT9xuim6ESopOFBQ8h55Z6wMlFcozzP7vq0FLvdj6JaLuL4fB
         matw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107884; x=1795712684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=LbP+ADVLPD/ZC/doSQQ53JXzDI9/ZPAu1CB5SojyCEwaRnylgX3tzNPYwWfVCBaR1m
         U45f3gKWWA2Pf+U6vlQ8xILWnnVcRsO06zE4kxO7BIjLUv5tWef/s0whAcwA+8sVm+Zl
         Mtn/LjVBolFPe4NA5mISX9ShlD0BM6RV+iNRH+1BqeWLVNOpgSwQiLauAZsJk1ei6ov2
         In0Zm8ShbW0ddBH5eNmstNdAJz6+ncMCPu6RIR9e6EeRt0sRHPfE02Q8njX6xYTqM3UR
         NmVVJ5q/KRQTUgrSYyU3aoC8CEzpfB7sjQpwApav7WoXQmF1FnMz/ev3rwpYSSbYCsTj
         SfMQ==
X-Forwarded-Encrypted: i=1; AL+hErHtdi/0v1RvIxEYpLigZE+N5tgVB5DNT/vkU4RpIP4xFjqRgG06bCzwHty70L3lEnAmhJGgxkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cnc5dAh3wg8s7b54g2Ea4oJoGyJ0GiMdEzisKX/PraV0GTlhz
	9Fbu6V0ImYk4nuvHcfaXvkrLEZsawXb8nEKniVpwY0GGe/cLD0DLWMUEw74pEGxA4QbN0Eg22DQ
	HQmL4fLQlgdRhduNBKWNU/r6KICPUNseTi5JuTWuXyQysL1kEFkBJ/KvjIGM=
X-Gm-Gg: AYBFou11HIQ5V2DlyHTb/52lr68z4PEL7bjPSOXoc+1nSHa8PyABnKJeLEu4nXdgnQI
	/6OsNTyFSRAZZyMmg+/pPxsHaONZSUBps2MUl01MrVeF+jKwD5MwER36LaxJGeVoOj8T75XjFzL
	2/G8Q/J1bn5i5gs4Ks8K3tzfnRCV+JkzcSDAzLnNX98EDYVbwbBkyjenn47dtTe3Iyi+iKG88+U
	hpSUGLJLRvsXqByYjEij011mo23Uj/jZt3borUljgtmY0PuTPwTI2s1at4c5U0AEYmsuC1u+ZsU
	Q1lOIDKpIJtgwqthr9vxQjm3IoVtrpRtnf8WbuLdtN/gigCiBngSBWY+a7jf8rg+q1ehAq/Kyi8
	9OTzex2BASw99uxnCSoTHpanm5IJmDNBN8M4shK034+1wUj1H1fOk5NVEeCOZx1J1FexUUWTNEA
	==
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173051637.13.1795107883681;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173005637.13.1795107883151;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:21 +0530
Subject: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
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
Message-Id: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: ctgxDcQGVYVkyyBJ9tFi6OggH-R-hLr2
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff2c2c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dmjuMl4sYXMLEaQzlHIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX3IEuFn0Ps5OG
 cZm1IMsHU3tfXwd4dEqG2qM8+PyuaaQ/Z9y1XhB+VQnWSKheUXg9ZpqbyUlr92DQSD/zJSYnxQo
 NiGfHm3w3LbV3RM1z3bcNzyrv4Lbyhg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfXyUDd1goKqkFI
 A/pKp0023y9EAEUj+mu4Q06yyyFAt9rI7NVjLd+2YeIGd5ZUAjTC/ykSxwIwjjjEz+O/C7I7IE7
 6U6Glollq1TKhuMTc25aqvM6e0Vrxb1i7PdNJH+J1xyu0Ts4zNVBHns2De3amDGW8hUeKHt09EO
 natpMMqGZYNkyQodymsc63KG2hLx2fq1Pj+yAfAJwpSYKsV8Xl7sqJnJ1NQoBtR7XMvCw4MUYbx
 Nc/L+DPkbvlKKjL3Z7bcKUSbL2edasVT3YoKIzsneHFvTeqDx1S5vXq1On6ySGr2Wdx90Fxhdtx
 PVC5iEtfdFIMjbJB2XnJ20G4jdawKezFdyVQhtsoKtpsp4q3WTLD6BLWkjJAZsliViTKveV5BKa
 ZAjJ8NAXQ+I8tfImYje1vjLFkSTV1gRQv8J/kMUC8z2KiS7VbMLIpVTsHhdy/DXI0TlhscxM5vJ
 yqmDMJdbE3nrCKXEqJg==
X-Proofpoint-GUID: ctgxDcQGVYVkyyBJ9tFi6OggH-R-hLr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190067

Describe the I2C slave and TSC subsystem clocks, reset lines, and
parent PLL needed by the Nord SE GCC. This permits consumers to enable
and reset the hardware through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index ef97da3852e3571db5c34676a8f08b9650d1e4c6..256d3c18201b4fd0e48bef9293cdf78fb329ebe2 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -29,6 +29,7 @@ enum {
 	P_BI_TCXO,
 	P_SE_GCC_GPLL0_OUT_EVEN,
 	P_SE_GCC_GPLL0_OUT_MAIN,
+	P_SE_GCC_GPLL1_OUT_MAIN,
 	P_SE_GCC_GPLL2_OUT_MAIN,
 	P_SE_GCC_GPLL4_OUT_MAIN,
 	P_SE_GCC_GPLL5_OUT_MAIN,
@@ -74,6 +75,23 @@ static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
 	},
 };
 
+static struct clk_alpha_pll se_gcc_gpll1 = {
+	.offset = 0x1000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x57010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
 static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -189,6 +207,20 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
 	{ .index = DT_SLEEP_CLK },
 };
 
+static const struct parent_map se_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll5.clkr.hw },
+	{ .hw = &se_gcc_gpll1.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
 	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
 	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
@@ -670,6 +702,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
 	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
+static struct clk_rcg2 se_gcc_tscss_clk_src = {
+	.cmd_rcgr = 0x2a010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_5,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_tscss_clk_src",
+		.parent_data = se_gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static struct clk_branch se_gcc_eee_emac0_clk = {
 	.halt_reg = 0x240b4,
 	.halt_check = BRANCH_HALT,
@@ -1079,6 +1126,34 @@ static struct clk_branch se_gcc_gp2_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_i2c_slave_ahb_clk = {
+	.halt_reg = 0x2c008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_ahb_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_i2c_slave_xo_clk = {
+	.halt_reg = 0x2c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_xo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
 	.halt_reg = 0x57040,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1456,6 +1531,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_tscss_ahb_clk = {
+	.halt_reg = 0x2a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a00c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_cntr_clk = {
+	.halt_reg = 0x2a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_cntr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_etu_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_etu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc se_gcc_emac0_gdsc = {
 	.gdscr = 0x24004,
 	.en_rest_wait_val = 0x2,
@@ -1520,9 +1646,12 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
 	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
 	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
 	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
 	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
 	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
 	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
@@ -1560,6 +1689,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
 	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
 	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
+	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
+	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
+	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
 };
 
 static struct gdsc *se_gcc_nord_gdscs[] = {
@@ -1570,8 +1703,10 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
 static const struct qcom_reset_map se_gcc_nord_resets[] = {
 	[SE_GCC_EMAC0_BCR] = { 0x24000 },
 	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_I2C_BCR] = { 0x2c000 },
 	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
 	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
 };
 
 static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {

-- 
2.34.1

