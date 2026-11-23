Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463569;
	b=EXoKvdcQ+INojnjxX9shrOM4nRy8j1NNMvrKvZHyEYTaeGMqYN8G9x23UI+IBIHqscGF
	 t3Ee1GNw4fG+RtLvumu8HQvZSjFkBeAappZmJvvIn5Q6prd6tSE16iUUjcCebjXTNEuCc
	 5LStiztl47yO5l5Q/pQFrTGHaJ8xmt7OxXJzqIh/7XeBfPkQugKEG6JgFEmrZBmLJhYSc
	 v75TpYNbfvB6rrf8LItgxY9gr/IOzj+7VRxnJMgQL45q47a6SH6z1ltKOcItxOp5kT6rz
	 lw7T0i9+yV+k4vdUYbIdXby92WCnX+q5DMmYEdxDT/A2KJHoSPoix/dIES7VADTHHQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
	b=4uXjdk1r25rJkLyQeB5GSTiXyU5/cItTnlluAe1RWLnF3CD3swHZV4AhxWE6ECD91V4i
	 4CdCMGJA6PexK/yzcYjktv0+9KbN/x1EG+MpW5s9DYEv0SewkVkEAxQuUYG7Bi8AtYsGa
	 X1llDxZfFXiqwT9SLnuJskd72DVl4YwZgVqx78BGIAtTxkt2vfzmNyM1oaSXR9haSmp2J
	 /RDSDQlOc2EiNspBhSohZsuauPg9dyOZ9sFcYkpf/LPY7capY0hwX86KVxXZrVNJqI4sU
	 InUV4uNjBEKzQGav+USQ95wY2ttq+62n+zIDbWmXpMGaNDXlQV2Z9/7TfzH0lgNNgEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99780606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99780606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNOeq3440723
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=; b=pk5OOLF6DEIadDHg
	RlXb7d7E5t8XB0z+6gUx+XTk4g4tndVYynxJLHXJ3406JJMyjVhNipZvsMqQ5whq
	qxWl2KSc10E4Zj3JuLvUvYOMq8s9xlbhQvfyX0EZFCTYC7rEIOrvzHA13SZ42zOy
	oQyn6MDdBvfdss3jnieqzm5p8YJJtfSl8M8IILqV/7jqtjiiaThWR/f+KT9APKxs
	U4BNUkwPG1oy8K5PFX/k/1iJgEgYDIgX61+RHqTVmcO3JtNWqd1TRCWc9/s7WtOM
	K6vuUOg3wkYYfXld5lOhtesBCCLyj+oICCKZuZ/rNz6vIcKaqfl2Qk+Cv7cwCXDH
	MAIxKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr83tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so1676665eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463567; x=1796068367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=OnDZg4iGAVxr7B9cAwmxCeK7c8SLlFnSFrhFxjIG06TPr4NfgiWE68xrtZrrYTh6NO
         JUnoGr1GJuKxDdswmrwl8+j2YshJ3l9lCbaDvNfquVxjSJt6f2AZsqbV9MxkomkAGWuH
         2FHKcu+yynt82XQ08MEiGmfWSxlYrNaZu0TFY6pyiD5Zbf5/5L98iWWNkNDR2aZS78D8
         gsElgimNLkCRrDQH12EFVwhIr6++iyqQFEe3ZDYN1l0QXmuzfMs4PL9ko+OLAYvcq2uO
         k8esH5/3GzN4PFWelqScIdX75dBazpDAq1PSA7JlZIO7X9I7Xhmpa2oXxPE3oSfntaMN
         P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463567; x=1796068367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=wsK/yEnTN6Sl/H/PNLWmeoowdq0yZnmhJqtNNxCk6gLGwBn8WOKTCBLhjE3e2+lJJV
         Ple5Z1f9pB0kVUI64SSbPl9ii8S4m1Lt7gFFK2+u69sqDXdBE+KdYzTkxbTcRt8r+/Iq
         u+U1yk2rSelA/OS1iHneA6znyUT026Inejob4qOFVpz3kO6VJJ8alYpIrQW3/M1PYKdP
         YV2EIVYOTaYFgAppWDUvu2QnMsr5JhuTvsaM+upUFsxgpFzvjrfj7f+gLvVq9M7fPqps
         dNDH54ZKKCEeq8WDM4Dz2HjW6GUmtWTYCeZewrPvI8P61iFAUT/ctzT81NiWFdgpjpY2
         qRBw==
X-Forwarded-Encrypted: i=1; AL+hErGtq3TxT8zuO5gywBnTwSm0LN8g9oT4hsREMDp9Xzuo6XwuOMi8pgueacAkviLZi7Sg3NHKzo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VehxjhoYa8hiX0sxQU2fPEtv3WsRspEv9UYAh9kHAOk0P2rhN
	CHKlSz2/Yh0SsCspeK69i2wh9iTg1IT54v9x1E6aYItabPZvSevlVzec4lO/cizN1NV/ITT+uO6
	LBXK8LCRQLJvobYiqfVGvjda8LBzvd87HNqOlopIOj1coska7hGpFFM+HpV0=
X-Gm-Gg: AZFdTZc5zqLGO7ymxE1XeaItlrkZcNF7Yq53+pyil7pZHH9lEmwoTI8gDmLSTvhqPrT
	ODhLuX9VfDlDpMNZN9UZFlYNvm81Mdcb1Wckmhm0cHORm3Y236CJ8WVE2sA3qjxCIt3nyC7AFlm
	FDyQIyV33RBIqDfhC6JwjunVghPUK6LFCqQLipX7vEGQkZ8RKNx2zKz3YddtjLDHYsRyXA+dZky
	cmSZ8JIq77dgJ94bqm9fCy6176RhzMEuBrCpx6OdVaU9djSlBSRERJCIVyO7rdSRysQc3rt2ZhZ
	srrTArDu8kXT17PNqpDaHE1AqBW/oVw51D2a0RgXggyj21DxEojKdQpqREJ0XRnVt8+im2AkF9i
	YWC0WG5mN9Ok5Ho1HaFuTcKGl2jIpw/erWaTbf9XhtT2dA6ee4eji7j5wJUrQoHBq67jDD1kMqQ
	==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083777eec.32.1795463567213;
        Mon, 23 Nov 2026 11:52:47 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083765eec.32.1795463566804;
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:40 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXxJ2lHeAu9pRm
 AvI9JTt3U6VpXhwFWl70nVo6nyMNbv7GPj4U0PaLeltDN7qZTWYGKu5yZV+jAnbXRCcwXb5WG+3
 QpASL/DYIphrKS2rjWBBOmtctDqflMo=
X-Proofpoint-ORIG-GUID: LW-34OmKGsPSlILuvAYonynrrGirgKgW
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04998f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hYfjAn83TXJ5YwiWwP8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4hZCa1fRnPYK
 uLBl/WEWRLzrd9lau1nHVjmM8CVvKzzHvDnbcmtjTsTmryL5xV9FDngFOb5RgoA2RECicFVbE5D
 rVQtVhLL5t1AYIzn7yJvqaDW3VADO+0hNxVKb80aEdV/3TSEM0HtqxYkz5555Xg5wu4ewEJi/yf
 9SAVce5+tUI+4B9NsnO8fcAxXr5rKGq1XWvbuUyHg8H4hSunZq/NIfMatBr1H7UOYflkiPXwTEb
 NiRcBQihslWHRtvKzzgsFjYlftf3LWlA/+SY7GPCookmrtHGTPVFn2MRncJvVNMkAMZThHv0iAU
 w0TaqRNXWjjKeU/zUEh5lYLyLyVmN+8yHWgkgLyrwCmNMo+qNDDQKsxraSzQwL6pOmZnwACZbs1
 WA53FDrUyUPo+9eLhBTZMVPWOyHmYO4S04j216vmiV37g3IGZZ/1DnOm+8OZ/McHp4t2olMoeDX
 3YqWdOQNKc96/FqOzFg==
X-Proofpoint-GUID: LW-34OmKGsPSlILuvAYonynrrGirgKgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SM8750.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio53. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fcc78bb3c8334b20561af6be87818af8f5ad461e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3067,6 +3067,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
@@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio53";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

