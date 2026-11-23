Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463549;
	b=3PwiLVAgqQUcGM+3Lj6MC3aIrx5IxI9VmL5CgmHsoePBbddEcUkfZAf36xgF8aaRhkWV
	 1de8tyhwa5BuVdJBUmkIALUQBfLapV+GivZzXNO12C+w+NjRv9iue4kfwgNhFXSM4ZhSl
	 cs/I+LM9dKJBfFbdlJICJ/DLyFDHEMSw8aPKOiAPdsBfbSvzj2DUgxwTy9bz4kutXvVXD
	 Zft6AWCH8dfFgJBfxa74qCJWNqisz6FiYWr5QtxwPiRjwf2TbpXbkWKOvOW5zRX/AdIHW
	 ghPV4A8rQ50Q9TlpoX/UT6E1ooaf+a7PJmo1lr4VcRDUS0BcEW7c6vjUPSsyLI9XORQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
	b=bvbS6dkqdJv0TCk572ZeHT/AVzte/7RJd4jOhsmm4N/BtY8Fs1ojiLECRTkinHuCYRTi
	 cBzAmt8W5h1Nh0xdh8TYx4N2nf3HjQWv3WbCL7vnZdmhOscDMCT7xT52miIlkIIxhxKbu
	 d/W6EdH5peSIsgyg2ngj6boC5Cprk7brVueslkkRL6Cckp2ys9OB7Jk6OrH7ZlxqeqAhb
	 7Tiz4ZS297x4c4ZJMsnBcwV8ybUrO3ZGY9JGg1RaB4ChpDfaYCyBNoE1+JtqJdyPhober
	 DMbVJ/ttRVYX4vd7+W8JuRZRkK75kFi6bWaeLhf4ShBW1sbhiHs8k2/4cbm5Ap5Ruug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA029606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA029606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxrV2377203
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=; b=SEuoM6vLNzMom+R9
	jHLxOHK0ndtSRUeXl8wV2xIxUa5faQ3dFWkmzJKJsZtxQwAV5as9U9wDAz046fYg
	V6bTnoNjfNH8JOX7NuMp7Yk7O1LJ/usacXy07ZmELCXfRhnYc/tZk9RTx8T84I33
	a3rzuqV+H0tsZalPTvt+uqHUZr8nshLKPvr7qimWEB4tzhklz8foUi1BbvAqXRCv
	h/59mh/yLErvPKfQ/fm7XNFuMB82ts8oU3t7wCj1qa271lckokZHIz1dtaOevRQD
	Xsg/sF6a9+vBSQUIs88t/C8Auehy1Z3LBCFdzYX3ohUqKGrHksVX8dUX//9ifkX1
	OjdV2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a0f79047so3353907eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463547; x=1796068347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=fhCVNVdN2azqQAEFSzQIOZyF5j9or2gDQvyAI1PGSAj9pRGPZ+YXNWvTAQ8+8QMdy7
         gRWifWOXgWG2Xf9rX9FctC+5I7ndHxqSViOIynCt7lj6XPO9J5oRR83T0/3U1pHZ+xJM
         +ZXURDzN6Pw/vnkeoFIZ1Y5lsBrrVH3SVopUlkNsaPTIdwMB4FC/WZtasvtNzYVhIlv3
         LZz61UlX1R4vCBl2s3lqFFs9SQlofBqkpsZFH2zVAFicvAZS78oEmLx1z6/TIroSoRJZ
         d9bEFINZi3ijjVaknXwz5tpRk006Q+xSUzYpW4sIQBkgf8EymtPGfgT1VmesX8Vz+IQb
         c3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463547; x=1796068347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=I0Z6cFTOS63IEh32/Cnwt49ZEyGmwpspyBjxD13OkJ8ggLQZPnAkeiEVpF3Es08qyP
         ae2sII3rbUsQYQDXiJq7DbLyTaMkFQjfNWg/TLNWfpMFEySc/63IEqnkV4v8Jrj9SM4o
         3nf3BoteCumajc4w7/Np7uR27cANxBtGimytNqhhZCSe01QSINrOPd1Li5hTshpNmXYw
         yTwmCmXnN33QQGAm6aZf6LqOHDgqplcQrgnBaQo9i7YqeJ0dC34JnES1JK7T92avIuWy
         Jr4hsHcr/JMtkkTBL0wIPcrBZFZumMYmLJLCU3AtnAkp4BvP5pDOSlXWI1b7WvNUuKxT
         g8wA==
X-Forwarded-Encrypted: i=1; AL+hErHwJdXQ4PVy04zUOnvSQQ6l9MdeosKRwure2v52Tn6sGiiwZ2Whm0ObSQUC7lBvhOOTSnpxWVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9848WoPU6TCPyTFWHpXNCYrVEY7oHMY2xynNW8CKi4kM6baIDe
	seg3hdw5HPgEZBG57JmnziAJSFaL+59rwRxXjQwPyqLLnUvokRsQ6tuIoeIvi23lGAeSBCEHEfU
	gC5bsuASBRbOU4SWrlVAAi85dLUhURaFVgsdAqc00GJB4aw/kGl3Zsxqn8Kw=
X-Gm-Gg: AZFdTZeNrBeilVNVzC3nXVws0EBnaZ35AzUMK4X9Wqf/heRW+FwSAPw4XCVfJ5RmPuO
	bh5ehONM/v9656pVQsTKam+0n2gD///qlsOXe4Sik9lmSKqoc+cj8fTHEE7Eneg/Y4Oj/x5Pz1G
	0SeE0JRmn/XSTUqF+zQBc42j6ykti4MsgeHI0POWhVMPVzEyXsyDJI2gaFP6P+mIrgHY2e9n6WT
	re5/3Ph/KrQF38bBWlNCQtNt+9XgOikVp1BcQdN5VRA9RlOhtiRhpRHOGsfaP5t0wfTNmOsOh67
	ugADHtPL+USe2mrTyMnX2ubNCLIj1RhDtdW/TH4sWEXEJNA31wo4ahs/A+OehS5LZJ4BUc8ONVu
	t/x37i60H0K4nDbRPvewzYDSl/d3AizXrOi3KoolqJ/jAqul/X8sPfsYEloWYFbO+DUv4FTjjEQ
	==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564886eec.24.1795463546841;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564855eec.24.1795463546284;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:37 +0530
Subject: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XIe2It9TV8ZPJzgw2bI60_z6JPHL775u
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04997b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qaJfFEnBwp12TzHMd1oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: XIe2It9TV8ZPJzgw2bI60_z6JPHL775u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4z5+NDaVPsJq
 iD05dUDD55mbDV/Cb3ps6u1Z4+6/XFnXq951js9LjEeG2W+iJqIWMMRc6OptFx6Sxq1YNp251/q
 lIwTiKIoX6Yb9+R+fS9iMJmtFo1ciGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4tD8qPnFubgG
 btrIyO2XnbbZ5I5/bLKhM9goDiummr5XZaLdlSbawNtS1JrvqycLg9MmDB2c7AUGs1V2CBMRmws
 bQ1KY0D5b/35kGPMnqXeBEUgTevIfEPi5lE8TtdFBTba1iOuGW4LSo7C/FLXFEpYJcUQMi/YJlT
 WSoSINvyEe5k55mkvbs07Q2j9aSGVcIw79TkgaiSU6Nm+Dlz4PlDTNWqzQpqjo3kYbkFKE4o1uQ
 8VBMOGl3V4mFWHY9Gt1dbsEKXGif1Cycra6AIoL2h9PWfRtmdHHf92iPde/Z5m+5gLHWeKiXwZH
 HK7Skcu1KZjAV/K2qQoAIsT4ZYY5IGOsPgbPq5S5u/sqDd1E5yPPDlh3cbq6DwwG3HoqbyBBtHu
 68Y4Zqgzm/2W0Ynty0SfbUUiO5avbIKr4nLRWUOnX7mB2je9s9DdIFiQddGs4xf3UNw7An965+J
 w3H8CZugo+5Hw4NXiXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4bba23df8a95d306867e22c49981dd8c22d4a6e4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1849,6 +1849,20 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gp_mn: clock-controller@88d3000 {
+		compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+		reg = <0x0 0x088d3000 0x0 0x1000>;
+		clocks = <&gcc GCC_PDM_XO4_CLK>,
+			 <&gcc GCC_PDM_AHB_CLK>;
+		clock-names = "pdm", "ahb";
+		#clock-cells = <0>;
+		pinctrl-0 = <&gp_mn_active>;
+		pinctrl-names = "default";
+		assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+		assigned-clock-rates = <4800000>;
+		status = "disabled";
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";
@@ -2515,6 +2529,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	gp_mn_active: gp-mn-active-state {
+		pins = "gpio35";
+		function = "gp_mn";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	hs0_mi2s_active: hs0-mi2s-active-state {
 		pins = "gpio114", "gpio115", "gpio116", "gpio117";
 		function = "hs0_mi2s";

-- 
2.34.1

