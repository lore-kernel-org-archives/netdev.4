Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463555;
	b=oQl55zR8W2iWuM1upAyzzGGP8DVnmTVzIY73Kp4jAUYf5E4UssoBI6K7MeITR4qmUrYX
	 9Q3kY6YIBUoRvX/bSo/Gmy6Q6Ha4fweMvwUyW/S/CuI1yU2rtTRZBwwXV1AYb5WwMQf2P
	 TBgxNR6mr2hJDFL8s9Ca7NajyQ0fsjGO8FoMP+8hxNJDid/S3dXrzGPX7ij3TGnFp4d9q
	 l12+tR4luZMk/dFGgWwSqEr+GRFo5PjwfbX84ab02VtFDJoQc4ao/JRi8GZZlNlu/SDse
	 UHHUigXIVJlLA8qRbO+ct0VLGHG1ldES/rN3T92ZyxB/a07phHf5EQI0+4QoSlIvTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
	b=WlAsvZ+jnhf1hrtycgsAsvLcz5ZzRpfxX0/ZmvhQzsqSBx2tAc9VPW+jPw1V4+RD4i+1
	 XScMLESSHfD0U0blmc5hWAAfiHUrvEVYSLS/+45KHPFmrH5PJr8rTIfqgg/0Pq1rItLIm
	 PcNRfmxz86Dpl0U2QsjKEZBcjtiqbjO2G6Ulwhm6XilkZRCSKivEPZJ2fmzw0dpeiBF/K
	 Jd4agAoxvZdzJqYa9cK/W6aT9npVJKPUobksq6spWY1F4Zf4X3JetHiF8YC157NV6r2vM
	 Z4Ucd3X55HVQGcNtwerrDhlCu6Om1mfMlRAHcCH0sU4Hs66BWgaHCgEHQ6zWixhAfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jxF/MHQN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B1606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5B1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxF/MHQN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtIT2340262
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=; b=jxF/MHQNRK4rlZJC
	uidrjDDFeqZL8iSWhn8PNkEDS7Hgx79vauSEpalFIzPwkujyOatXfBEmhCN8bLYo
	IF/9hKoafE//RYaWdUD5A7u+na6sQgg1fj5lbkPUyDvPDgxY+xgkhSSefAEXX82V
	nG+oXN9KPMzjqvuFdHOFftZVkS8e2nn0HGeVbtGJHsXvogoE3Ti5gsr4ktTYHIIT
	w7G+T90Ta867z4di7fLATnB631mFFTtJ00YQP4qDmgDKkdcK63WosjtBnTjPxGGA
	z7o7oSHypZ2FgIfxcDT6RymzoCQrcFanGA7LB/Hy0sy1D/2Z/7PvWuO1HSssytGn
	JN3CTQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3cu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso4198822eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463554; x=1796068354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=MPcvWDatwtYh6jxBLmMD/rCxLEpOWjqi99GdC4qHws8IQKaPyjrlfTNAIdds4dL6SJ
         uF6dTCwxRggaiHaj/9UhLQ7+YS0Qqrz4NKwRvSm3wQuTzIABkvoa8u+4zF5xEp8iku0q
         phCUv0sI2/7cYbOf8bfFwUb3fnyAnmdFPZ5nLg99tIooYdhRHIIcEzmQgcUpgxXKWVAC
         FWuMNPO+7lwpTekAFiErnPP0Uii1WIkBaJ9KHVXzEHXnyRWwjg9qbPIXAx8L7+qOBeq6
         FW/i0Hf14B0T2geGFsD075VipG73SJThA8g2sbQjwQSyPBj0NjV3erqQ4MF+olIkWCnf
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463554; x=1796068354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=kYrp0uh+d9Xx+y6pZjup48uj550wGn6ODHj1xP7mL99V8P1oUKiKhqgesMvCb1UfLw
         ctnIckVJ9Z9uMIvVMFx7OC4d3CTqGcnmJ6bnFLFzJ79goeDoTruUbmPRQjTzryaSC4Nm
         ntAqGxUITm+g+25Up/HAV6EPMx+hHnnbQOd0J+zi7D5+4cAB+yYaaYH03yo3nuP3LAHx
         XJy1Af2PJM76WWoYw2DOZ5By4sy6E++XGHGmgSvSTGpcaNqQ9SnfsDUawKftcZTUFOtH
         6M/4l7CIJpAuAdgDWHL9Tx+WDYGKLWdHmzhdgnvRXX+bKcjAM/efmf9hH6cUYb1UCYt+
         UCcw==
X-Forwarded-Encrypted: i=1; AL+hErG5yznR/yrlQLsbYhjg3UwqCbC2xgFeBdaa5bATpuu4s7xm7dhhBsZROfgPeRSbrEDBg5wTbjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkNheDbHypQn/IbWNY/pZkZ899UQY6o7/e+h+iyt2ySJNTOIE
	XkHJOineKnJsSL2oHyopu627lCUhNGU5JLksNHFnAzCiimRS188pMvlsGnab3r9C3XMru74AeOT
	V99HNCNHwE3n52FAtP/bVkwrSj+ZygbA94yv+yRCZUhCxvhU8xLv5jJ9OErQ=
X-Gm-Gg: AZFdTZdX6RGhMzUJSnh7sR6Q00dUTcFm1PJarM3DPcHBi5m9/KKliuV3TFtpXnA0k40
	uby+A03xlN/CyBgjK+tul1Ngl1OakKwDX2kxrhznNNf9BtcX6qYxXokkCaskCkKoCc3jW+6Syio
	7l02+aAZug4PFlk41aW3JVqtX997DxBR5nEOHig+mBMJnclnel+TM27NjsbvZvaR4Tp1YiekHtD
	gWMgcEtPcen2LMGKuXSWRl7RAzPlDpG8tSVrOgjyjb6NMAISxQy1bbhJ4VqowcjRMgCDZaJrlmj
	hqFboJuPYo25NG2zKqP6crAgjwn41SKD98oGbNI+sdG+EIlFI0+RXgMNk1DgviEyY6RQmzMgWZg
	0ePasXEnE9IBCuIHcJFTQpU1sqXR65+l6pwNWViwpyW+2Msto9r+uteGMJspKFw38aPz+D4sNaQ
	==
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12179032eec.13.1795463553655;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12178991eec.13.1795463553150;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:32 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:38 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049982 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f-mW_kVclKPPUklfXV8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: bghztBwvi5RcVjkrIHkH1j1EauhWF4TC
X-Proofpoint-GUID: bghztBwvi5RcVjkrIHkH1j1EauhWF4TC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXwggl9jPKgri7
 7yAVc5UWqGngVryWve30quatAEBVeszaiV9sf0g8NJaVwMAu9zRdNfx1BW8Fr6SBX4iD/g55CwZ
 it395kBrMqkf25W1ACR57Q6h/DqUIrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX3dmNx+zg85mR
 hSLl+N1lDaIS5m5uSqN15UqDS5NvXz3Wy2+40QZgt7GfSYT9rnVDUv6uNodRlEAsT0RenMgJf+P
 MgLHDhjiZsciZoor/BiPmrH8IgCIC7CiIl/LEKzhTq3vkoQRP3XYkuzvSmz971f5stBCYIRFYL3
 M4ck2yr4tjXfCe61VE4Qc4NHe9k4xtxkYBOdguCIxS0EEDI4sem6TRI6sEYqgBPETR5VK2zIOPY
 TK4HiiOQyq+4tWviCH/JH2VE1SNuG1gx2w38PhxnNNv7aTineYq7vg7S1fByXStuAbGzoXY26O+
 uipMTc7IgeUim8jXrTZgcGZDaOC8CTB6HXXwotWacsreQDCNuDq5lkSRtbjjWg3mhsrOk6n349h
 R4NSYs/znhYTFClvugVzylB058pI4mzjjX2te/3XPFOqq0Wk4mQLzSW8BozRFYVXCJzs1XxeOUH
 7G4sz85zVON1EHd/ufw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..773f4487d78301a18d5c27e9e97462e60adefd0b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4454,6 +4454,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
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
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
 				function = "mi2s0_ws";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";

-- 
2.34.1

