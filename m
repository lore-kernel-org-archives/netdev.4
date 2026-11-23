Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463562;
	b=aqMK7LjYwxJIEiT8YuODaRZqvv8HJeuT5JnXbYQ0OP2dw3+4E898FHkz5WmAD7OQNa6O
	 RDCAYxbEwA2s+naLFXZxeSYBvEGMPmAXdWUGGgVNg0obqITIbeh32OKo+pkvNekJ4YE6U
	 XPujMHMq5AWx/kWV2r62GRGt2MOQROFJ1ZJ1zLAXSwFmy+w9B2/TlCtlhAACwEcRH53Rc
	 bW7S2eL/q5/QwU/I/AvGwb3Gh9CJxCmI9QjUMscIJs4tMvyaVX1YDINVlQ38k/tP+l3GE
	 3UWnlf53Lmy22fAw9ZtR8Szdtl5DxvVKy+6KYlIX5b0cgc5YrvNYtUfF6AvrfobQQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
	b=eUOGLTD/B0clHin0uXnoO6tBwL5TSPvwyp80CsE0Wnb4Ppy5dXazHVxXBwRmnC74Tjtr
	 3PUa6lUwpP88mBNfECwsTBHo182jtw5T7unMWJH9ohQLvP9OP5+lXAnlkouw1V/B5dgK9
	 Z+10cLWpdSpxdEy6gqLuiRYLIKcNWFEgWqhQ1jxKjbV7Do1bo4qZMvbr4EzCe2c0fd2sT
	 Zrk2hXFcorFmUiFZzdPSXl8T/wP9bQJUfiK5vQXRMSj7eLA1sa0+MGadda07R+fa58ORJ
	 x8zTfQc3zdW1TDwWpGD0LvFEKgTH3aPJ3pkG3tO9SOwiqnfkfUZZJI+tcKdgtD79LRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B00606A326
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtHQ1861560
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=; b=I1TDKnn7QhMB3PBK
	No8NilYpEKgpq1suagt+vSY0Zndoz2v9cnxfOBRkDUDFDxgeztcxIHprmYU+88mk
	P2d4Fk7zObzRHTTsxOMRVCBQ+xHmPr/9w05OJ0F2XR/C6+ol0XQGRig+2Y/0u+no
	indcRaRuB74V+/Jl+ktGR8Hsq8fsCsJSEnqgbuL3rlOlehQ/leh/Sx5QL1bDxZDL
	sg3jVdRVf61tb6CwajufuM7mLNeuHy/da5V2cLAaIG5BrhGbg4qotPO9b4ExoZOo
	cjfPtI0BxqlTZyiVFljLsQ9vjKpa4CVTyXhDQ/gB0SGaNLXr+6lG2dRonkIuL+lA
	RG+miw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a35nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so150858eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463560; x=1796068360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=PkDTIqSEy6bRPMwGBYNwbhMF05vtOcZjDqvIbI3qKKaVEtRcGBz3JzsNFVan/aYzkj
         dC0RUiWClaNhw2DO0ka6hQnpEamqX86ekSfRj/Ik2JtSIQs9sOj7Lh72O93MU/x/yQhG
         p+eI+Y+AVFaYr+8n2w349bzflzB1jY8Q/WPEV+wG2Dw6WIMOLwuLxQ38C4ba5lQBxR8E
         tM7HgrByYFFi8sh5nDy4YHNQyEwVPV+apE6NKjyk2RhS/oRg74WzaffPTmK2zub9vW+v
         UIHgsU2fffmjonD7QpyQ3TA9u4fgio3aUwrbhKxPfzTT+96leXKRACvB7b869MZ37eKS
         z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463560; x=1796068360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=P37155t18r2v4D4qvoyCeMR20cTWjXM1LRkz8+PATfVaEHi8+DlFMQQQs2NfJU9gtM
         ee7gSEqZTe0JBTMvUxMZzlHWqRRHi9eSFaOyfwSFpN1t6Dpd868msYO2AuS+hbW+JiCF
         Ux8AI74urpOZgMjBbAq2grfQT04r9oF7eNAUAnN5YJe+D6JVgBOvenMGrVTRNAWqgqLJ
         NYNX8xoe5xi+SiLOzTIMQA0bMBWMj2l6Q+yeIGtMrlGtzucuwOuDZAYll5uFlKKkr6Jr
         5c4sG7z2M0WXpyUdMZKuGEf/NXATB8gHS5/osrl9rdg+/2xoKyOvazNgmunP+9BMOezl
         UXQg==
X-Forwarded-Encrypted: i=1; AL+hErGNdI3XsHlqOrFUCkg7WNeGhEnpZiaNiMU/eJNIo6ba6n/E5Mdf3feV0HE8yDqQVyAIQv+WOgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z97xYa6NdVVyNNIcvW+K+fKzgRgH3n2LP4XRzvOGdvDNrQ/UpMX
	qB8JddcMtCkWaULFuFvA6Q2MIbSedu0ikDJuVtCh4Q18T3MePA6fHsuMHefNH1S+HxGKTL+DAUk
	hHVRjZkTbOhmMDC7Q+9Rng8JgUldqzKuo2/bqo5NMxbm9DGfValkuAA/39/Y=
X-Gm-Gg: AZFdTZf/vaRKd6BfMxHcqNQu9Xy7d5/7z/IckK4jWk/hjOCyp+O6MTzJOt5CRrtSLbG
	SzSEq2BQqMahugIWWcDPSaGRnii7mtTp9m6+irESA7zO8r4MZln3heU5am6tSWrv3gheV55s/Zs
	t5pn2uUjCiycFpeZ/fXbw29mjW9acGEAY7vX9cOw88N4Q7dcmOOw5mYiJRvpne4T3y6ZSPcgFRh
	TFNLcD+WAu2qC64/vJWqObTtZiZEqZIqpFjL/2FYwMK6HElciZj9qtQduJ/UUi0vl506P1gtwcl
	Cnm8v3+kXUl2tQx5qUvi5ySOzM53ayZZ9ZV2lKRMq9zTdPKWGd9/l+UglrK79sgyly0fjl728co
	M7fGr3J+5YXDZvtu02Sf4AkNF8fMyBB3NUN+armdYbxFt8SJztywlT5ZOmWC7ABNIVf+XIG7pPw
	==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475651eec.31.1795463560531;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475613eec.31.1795463560078;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:39 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:39 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: qcs615: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4SmFUrJ0EVo1
 rdto4kn1NUVDV8VfKh7SZ44agha8OHWknea2rq7q+Alfy0Z5+LhT8XjCyQxXljwb68NBIPHXNiq
 meTrBV79SCV7wbAwa3wm35A/CyTR1aY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX6Wsj8RHbuhMA
 ZMdIDbhnOW3I1xm1xP/aKa4GTfoKe5fGNHwdZjOg2e5bh6BsRrarfm7PZ+oylOBxxX7p8sv2dBN
 ADiwLG5cr667/nZRT6D3ygINaYIKUKpZ5qof9/zZKDmgHBc1SOEzFWRw8mKI/1ODyPOc00a0r4e
 cltS932lUFbvQNy4OOwzwMmIikgHd4g5Avu0+R7T3Bby57fOmVCvvZTafzt59aBaM8iAM0eyJ9c
 aByRFPNtv5cZb+IlDO+hxo6CtdNFqxpjtVtKGfEFdsKMC05xqauKhZHFclBPntOwkwHPQKV5Jo1
 hr/SYcUa4H+kg45047TUU/NR0sqW5PRm6AuEeBuSbmIPcZbB33WmzDFfUL8mv36F8g2PJo8VhuJ
 CqgPVJEWhggJvkZNgLpLP20XQOSOXG8T7DLF7q6WL4GNkOOR+UxKyaEtbRO77k6tmzMhkAgNi1C
 FkLXmlOtBVxrbZWcnbw==
X-Proofpoint-ORIG-GUID: sDgV5Z1_SBUe2PeKZ2yf1aOLDvdiWa4m
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b049989 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pimPiyicOD4MdmKq59kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sDgV5Z1_SBUe2PeKZ2yf1aOLDvdiWa4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e7aa65296850816dc9ebaddbe3af..a6f195509ac2e27a4862e49e82cd9a0fda67d153 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1626,6 +1626,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";
@@ -4031,6 +4038,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

