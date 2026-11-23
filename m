Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463541;
	b=dDXyKrewZslvbkzBh6jLh3GHDh/ZZSwkKC0u9+onDzYZJylo05iHPA4px8x/DlZ/HLBz
	 eroRRYATyCvnULcF5tgZvtHh4cTahHkqa+vSWImsUMLTxlccgW2YexDbgKdgOnxpYYsxF
	 MT+U8mSxC5+f6XolohmOay1nUrCu5F8o/Ut9CHDFHaTSeb5sDBRzqdoY78MNk6qs4lump
	 R+u1lGOdhdXIfA6YH65Hnsz0uLyVlbKmr5StWRpmgNOrAlnHytlnm/ay4PQM4Af+5UbX6
	 P6DMyI3sU470Qg3JTIs/Ym5XQjxbJEtBdkgPxda+5WYMYxCBAeGaBXJpFSfV0sT8LYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
	b=KzyLhGaFPW2MvgeMCQwinHSfQhG7BYLk/wFeDOMqcm0o+EobMtezfzo0cJfR3S4bulL1
	 l8dLk2U3EOjlhmwvb6p+wrPfN2r0t7kBMhDz06HyqyNSqooRlUYl33lloa6rAhREb0X9U
	 3fYYFevosl69K6/akO6IrUlaLb9CFlb6uryBnpsWZoC6ai2yfcJYcl8zcVeKhOex37K/C
	 UaSNjp1sQcuP/BPK/GP5UhrgodFlHuRToRmRap7AyqTo8GdCu3t/mhKRhl7mkwt6BGERS
	 UfwTrMQkVR1Y7xouTpqCYjFlP9srTLv1yyUuyC6AiV/G2cYcEBvvt0gaouFr81/D49w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768FB606A326
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3mb1093800
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=; b=f7AoG1YIeupin4O0
	R/5CTQYuKQ8tR1BMuBoq7/tIJlaIR/Tljnz2Ey+Ib9gZcHMBDuUvA+8RF0+4Bn+j
	918ou4ynvY29Vl7SKWmRf2C9kabDXVUi7IB5+YPqRCocHF28v661troUrrKVKcYw
	OM6ak215ha4X57QVVhx/Mrbj5YWMgZd4vknRsp7EvCQ/1/L40SCuhRe3LDX2u9fG
	lcpIyqP+bWyZ5N5TTg01xFRfJ39IhkswoUf1QjiBAC+YwHV+ya1I7XWCfo30+9gK
	vtLBY7AjY++cB4CuL4KnE0z7QbIZmvBl2TT8nAxMfAyyxSzGE9usEh40EvwWijld
	leFTDw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t4bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1201333c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463540; x=1796068340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=E0F8XimtQzAv9D3Fqolp9gXkSX6L4IR3KSy5PXbNAql+WR+fLoDgzmO7gIM4Accl0f
         NwQ5oI3+n8CSHJfxZAy9n4TkQJUjTSJsFUu5t3++PpJ1IzzVV8TgIvigSsfK756HmO8X
         BmKBlewuO1ryWTeQrYIDq7doAajbvDNvCG6/CNi9beQ8zUHtPxp6RqSFwbmXpYEs825p
         dYfzfMp9Ru1PpgLfXOVH/HkwqcepKz4vBs/BtP730mo517ikb47zjec+LrfEFCOSi9BH
         O66F/6sZlkzQT6fa6yrjuDdsA5DTutpVqt6vIoMa0j2T8liTS/r/vJEDD+6d79VgNEAu
         8T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463540; x=1796068340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=yiR946o98IkG0Hqfawp3CQC7A6Pnga7gxCopRu23rZEnWmsoh5UkWtoBGZpgJeUJW1
         bZqrf06daPMRrq7ax+JF2uasSEhckrG5emau58VE+wLhB+g/M+EiFk4+US4S0cSYeyxQ
         L8YAlzCl+pJgZD1WlAYR3TuM+LlzcfWNvTuPWr3H34Es8JMhRnxvpb9wFStlSR6Z5WHq
         S6yxONJP0tIDQ8+X+m/7pWjx5f0adNUBitV76MGeQWtHy5FHHMDU04cn0whGz2c3mAn1
         cs78nEGatmPIfmbsZYdqw80PlwfCh94YAP6rb0bhHd6oewKo5Af80o2jqR69qWSrUdxj
         uL4g==
X-Forwarded-Encrypted: i=1; AL+hErHOVDAf+GPX6NrbogG+mC8QSh/Qqq0bZkJjfyJPn6Vp4BF3wK1LyiruwVIRVqeXTgSVGMu4kD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OJauObtL+TDGXfXUdw/ZQ4mcNtiepCQ/H3JFb7rkqofLCTCfM
	aC1tSmT8jE2RuMLpM8Ru8+3Sat4rOvMvW6BZrzy684knIqd9ASBPlk/03B+44UYQWGw6ayy+oB4
	n7D72dErAbsEGpov7q11yTlAyp+Lcv5Hdf4wkQVfYx8f2BNvvp049BR01SA8=
X-Gm-Gg: AZFdTZexaVfwctyJxyLsTs0X3NoFkAF9dIO9vnNOuiLffalvTYCD+e/p9FzknSWAlnE
	ByoapTj4Rx3WkyrYnnGm+HHoJv9sJrKgNn7OgxFo/VUF+2syWLephUgsttC+zjkMJy0mDV5Xg0c
	swwHjvKE2lkL6mmYCJVtPvi1+mQoXrgJugGrjAoBPLp1NCA5RAJW9udd7+n/lLtYbdY61bOO+Gv
	cNih/ReiBgBxdfVCK4+heia0Nz0VdHy0jx5+M29h/KQ86wWSCBigCctKmss6NJKfEn+ZuuVF7Kh
	dIpIQiDxrupB1L/P5c43wDzEgkZ/qVz3ft3szMj/0K6ay2ONg3ljbbGA+dekEvcz7eCUEw/RJ2c
	qK7kDJPcqFPp0Zlw5TezEjgxYnqjcylZawlMEgF3L5up78fwXPWIBUXXrUw9kqD/fgiqlyCS9XA
	==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298668c88.33.1795463540121;
        Mon, 23 Nov 2026 11:52:20 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298630c88.33.1795463539518;
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:36 +0530
Subject: [PATCH v3 05/10] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-5-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: P60xKbx3O2sfSxuZTAELvYURDI5mjfsn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0UU2smt/MnyR
 eeqKWsdSL7cGXxA3LNltHt1asXGXy7BVXrFYaWw9R3nXNtItnhWdnY8LwSvhoJc7HrLsvxysJdL
 ywhT2O1cppS/cVaP31FmOlKQiSWdpGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXzUpL1zlN/9s2
 vfBnSHXjulGmfms4RTiu3ski0VQC60RYM3nXBhKeRinJwvrBerB4VwoEmA3uFmrHQRJwLUlEaU1
 vj1H0FemLGOSZ6GU981/OTy9iAzowGRB9f4oqLh8Z8vOK1iqxeFrFJGph7xyrzNUfrcgZR6QXHh
 f6mKJBd6K1TUFUaaaFdwCFkf0k68WVml7YMLVZxeJLomvmIZu6pK7G5l6u63Ub8HLdayQDwTF/7
 YQ9coudmIcVAkfFdEUQaD7wjC7Yv0nEIezDw9RLltYG3FteKn/M2Yw7TQuhmVzM6g1RnW/zWNbr
 qbbQuh8/d3GFCfHuMt2uHJj8ek8QTZvIQTbcVomH9nAz0pcRYyvpGduJUJfN7E+IyNv2sgwNWxu
 mjGXKwj/zCme2+JMzihKawY+xYkeD6zsFrvZiHI/NVBz4SSOaIjussm7gJVqnSK4xs/yFz3X08R
 PLkQS/+5ikmF0MH/fiw==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b049974 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sMxVnY04UXhLatCab78A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: P60xKbx3O2sfSxuZTAELvYURDI5mjfsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..3508869ed92b439b35182e94a5b9a24078efbf70 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4892,6 +4892,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6458,6 +6472,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

