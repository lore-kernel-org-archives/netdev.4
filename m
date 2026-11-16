Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824398;
	b=kDcsr4IqYAf+N8i44Bg/xi7TVEob6lQp+1kVt4BfieBfMJ/mZO0mA2n1m77N/TDzeQeB
	 DEbR4L1tIs7pn6opF7V+oXJYV0giR1B1PjwGRFRIWcTRIsR73+W2QP5A7UQQ3BzO0tSJw
	 JxkNZak503W3f9owAS6WuUpaEhxXTqCTVvJF3P1SXYROKYnR2SAMh27nKSj5kGq9sWzfc
	 XMPrLpD4OS7ov1oBe6fG1vvkfE7Fh2UuEr2NaoQYKAgiuBehRznqJ72saa+dhmlgqXVVA
	 CLqwtK7THBB6PKCqnRagskVmlYWi+al6GkNN5qesQH1jwvPF4nE/weJbZ05WmkSKzLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
	b=s6rQe+UM2hSa9JvGfZXsradJvRem+lfcXbdGAtot8zZXKFH+aSWLPC1rVVMk0rVmNmHK
	 c6O1RTFBarMhGmLcumASloQm+NF/gQQm/BVzIS4BFp3Wo5kCrSz032T+j+p0IkLa3/m7G
	 +NnKKLXZ1353NX4h+4AMfuNvsj0fvFONZckOHSl7Py2lcMC6nzNg4+s4HPL++b8Q24g7r
	 x+7MdQSNOUeetN/kg2ZbfvAv7a3BLuX0RNmejQvS8Fg9OdSo9SgDo1Nr/UN3IksxaZ+bI
	 s53oL4CDO2xq6WF7ivZPS7X5Sr4JQRbCCTAFLsJR5KgtVyUmRll+cGPcVbwIoh99ARw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InxAuCdu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHe2RQLM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F627606A33F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F627606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InxAuCdu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHe2RQLM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7eosN1894917
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=; b=InxAuCduqqhr67kM
	4MJPcxWu4F85hnhTRnvzPEvilUprntVB6Kg5G5C0e2j1MukC1gT8XHshX3ZpcSjx
	yZl3CL1jRAawSvzM1+L5yt2X0FfE9++QzR4daG/WynvLzqEtyTmdsDXLuM8cHtuA
	CfFuYt8HtMvFMLCz841idpNhbM+xsGxgPlizvvQCIry8QRVCXEWJx+lz/43WCS4x
	bOWrfxn+kF0f+eQmRQWNfsqslkeTcBj2grCyZ5HS2YzeLp+4BYGtq5qgt4DfNGc+
	6lwsvK0R4cJytb1FSB+OHyg4/jRSNX13WCY9VSkhQpOqkiDfQ4tJI2Sr2hDhXdT7
	ZrsPFA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdwx01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:19:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so1627440eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824396; x=1795429196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
        b=WHe2RQLMJ1UqrhUcVdDirp9poHsvHsIbOr9ZIuYsVnuCHADTBETxx3T4XH4eEjCeyj
         VsHKcBGt3je5IMNYCVCCcq/krX4i8+K0TjgugXwTvB4+3s6uzITzf8Id2JSznvbiF6yu
         aXnxjAbgA6mzoXlGJo8ymKU7heY89CK0nI4CbCUgsQeIgbO7JZpAbzS2DGaiF70w/e95
         oQ2ZP2HYqNfFAaetnPyHBB9dv3WG/OM5hGUox8jxdWgKklHD6x25Pnik4oBpz2SRpTky
         0rCmBH6Bj7ZXVLmo4vgwjRFFVBMmaHCGywnT0abGtQD+fMcKNlPuwbi7LFyFx45mW7jK
         7HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824396; x=1795429196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
        b=gkbYPcFcRAfsIHGDmaBU2h37PGd0+x5OcLtiW5peLzCk+rgk2Aqu9Fwgd4spolg+Ce
         Te4Gh5qm1Uesdjnn32JgG12GSl87/koE3OwIiAUzOeaDRL6BYV07XHCPqYKvUF9FD3/i
         0pbeqh/aeGb0dBs9oiAY7e3+Gg3oiyBEXDwrz2pE2n5hX2QC2IdFlLCDMTpWQp009geG
         +y750K9UGWmziBCLaoiUa/tGGu2v4CvxVjF7wxa7F88eJuEshvoMjuXmtK1FzitfuhOq
         UpspG8BMyCZZAtB34z8lzSiG6vGFA+baJBS2SMLEBrMYk14PjSPBgCcoAGIdhsNlDTgu
         x0XQ==
X-Forwarded-Encrypted: i=1; AL+hErHXsVhNST6UF7CDqEQrYaiwww0ZiPpkA4MxC2QZ8sxV2qUw+NF1ds7hbrAYFvVPvIvLMTF6wDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JCjtudINVzO9/LHNH3q9pGyLzV2/v81vPOFIaILAx+zr3V/Ch
	klWlf8JrCuRv/4V1Dhu4e3RSgcJHag0YrSoy+g6SdouuWBHEgx6CXxpqgZN+/huXUd8tSNG7HAf
	XaeT6Nh/CDECQS5D8jQxrIJ5mk0ftjeZir5emQzO96+ZeolL95Xnc3wM0iT8=
X-Gm-Gg: AYBFou2ojw+3/c0pvQN1v0YwdAJB4VOn1hchlBDbQ/YyG/klznbmlFsMFJdd6reDAxF
	RJHTcsE5wnnDQ0WK2Xu8KYyY45HjPSA6dD6NmtcmepsoVxq/DOvh1Wsl9+VXhGpHvwtaCT5oUJn
	1YKNiY3U3foT77nH6Db3EladReZ5DzHesntpM/gK5G7S/WupTs322qyd7jl0vWeleIgI1acYHPy
	Y5Ci8xZd6Pnmxiv/yowF/QD3PbpDtRMS42WqTYocezH38++j+Aqdvl9lYuoqmG72kDsZFcUq731
	7HXaCTHeYBz0I+eHxcB+be/MgOQ4NB/3W82iCHa3MZ7h4X5aHWktoaGktUIYNlFw8kZHrKv+LKP
	Y7+6JMmROndJQb2B3rwpWYw4EcmNZuTA+fNrAGyEWhr8mviJFAVNutxdqJG+efrxOE3qjAxtwcs
	YDwjxxpsP5lgTJenyp
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9380722eec.0.1794824396190;
        Mon, 16 Nov 2026 02:19:56 -0800 (PST)
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9380690eec.0.1794824395719;
        Mon, 16 Nov 2026 02:19:55 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32599557eec.26.2026.11.16.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:19:55 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 02:19:48 -0800
Subject: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
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
Message-Id: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794824393; l=1065;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Fb14u3Uh0Gv0knlh6Un+7Vkp8cbUQBriP9GOv5lWagI=;
 b=V7YGsYPUpWsnuewY1heonI3tkDNpBSFcmTeztXkuS9EiJLIyVBfXfSuDoPS9v/cGCSKqOYtuH
 0LQ3NeruA1QApWabdBPl+ID0VuXdZVdkjV14rNqW7i9WmV0H9FJlWO3
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afad8cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VEHikqRv1_aYAJNswC8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfXw8ffG0QL/4Ql
 OZ8qTac5ZQF/W5JNCuyPSQQ2Jw3gvg6DpHSoGLzpQDIUgFu47TXvmssXF4AyVIB2VUjNm4lNT23
 joXPTKAR0z6w/f9IPYDWTelDsBTurzg=
X-Proofpoint-ORIG-GUID: blZqvhbosTInkBYcpHNh8EiSq5dBpK3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX+//AhvsrnVSO
 lxzgAKigalKy2MYZRAZhg1Iwny/TFxAl8WE0KxHdMdwXCW4wOAzzS9POukpaJ6ZapX0hpp5A1wB
 sY/yrKBRgIMGyAPficHq5MoW9Is9YDNvtEdaQEQU1BV1VcSrdsH8DqHBEZ5lhUuGsgNvX83rFAb
 H02vgoiSvujRO5jB2XU9bAevmK23j41skYRRQ/L+kZbldFdsuXIbW8aIHmhF5k65InGFcemRRp7
 mmb+SxtRJJYiwaYHGjZeDnHkUA6bK77gQSRxevOjkCjBMESv3Kfy7XN5fQdAF9IGuUUPU08sws3
 MHWZXKYMoRjmtBYL6x13XJBQ2vgSDlFYl+yskPh+/lCI1PkixgJjNCCbnNpMOX/15N4k5rKW2fK
 /WcR60uh/JAQ6APowUF2G6vtsszwcBM7K9Qap03qMlbSL6KiRF4Pvcp8Aj6+zXOmHmbCA8J6vfd
 ur3ECUey64LAsroA7Zw==
X-Proofpoint-GUID: blZqvhbosTInkBYcpHNh8EiSq5dBpK3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160040

xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.

Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.

Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..6e4de7c29d29 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -27,7 +27,7 @@ sleep_clk: sleep-clk {
 
 		xo_board: xo-board-clk {
 			compatible = "fixed-factor-clock";
-			clocks = <&xo_clk>;
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

