Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981868;
	b=sb/+7fOinI+Q9uI4IvAwuM6WIOWbi9snwJcuxBNK5mK8AHxCrZ8WAP0teTtrcxJyVxEb
	 XUKnsu3DcJFCFjjV/nDOgtHmwp9i5AtpDbJL0Q6I/xDwJvgxF2KENz3y0KrUo82Q77jpj
	 vhOUMtPMOxo8r5CawXmJKWq6UeXcNzbPCjVkzpIb6TXHWYebCRt35oD6QBRXAHucYsl+g
	 VcCJcWGWrHtvaDrcLhMSObEg1tzqKejMGHzugVZiPi6jQ8RSgsY9Bf28PbfUHgJ0g5kEZ
	 uDNGkbSBFCLaZfQcbWp3xGXu28W9Df+co3iJE/OwGHIUEW6NiTNn5eIdaH/g1/JtMVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
	b=OVtz6g32ewxH0ojgRzU5MgUnepJlg4njlvBd7nbpou29x4WiwPn0ErPxZRajiIoLHL5h
	 7cbiNwbPiHLBY/55BBq2Q/NffHFYXqKW2ryyjDcLrqv1c/1gCcWcsUCK58Q1G2gioLjWO
	 hGH2jz3QIAbzjgHMIF099sKasEaWxmuLu17dIY/pqFARkvSgfT6mHlk276JS9FwgwJ5w+
	 yaWTPf4Vnb0M2qx51+umE8CShO4ob3ZIkKz9Ca/ucjbi430IvvQHNrv4h/klHzQI406dR
	 s1AbjVszM2UAOQ8II2+dm05ALu3KfBSOTYxtS1NXdmwV6NNu4iykaPnaDu7daO4EwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gN0tiXrv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hst6/+4M";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C58606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gN0tiXrv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hst6/+4M
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uttn1959667
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=; b=gN0tiXrv0I9d5IMg
	qXHnkdD/PHLzQx4tufE2N1HKe64qmUQClg+khKuViP5+vk0LqmZ1B3uo50L/R8GE
	SdJznqDM+LmJHhJTGnnm1zNCaWixB5GdzNmOfVxcMN5yesOH/Nl99WjjWT7yi/ct
	8cvyTcUoKUK/oumDe5TdM3ksbs/METpC6bcemyDQKnAo2Qx/luNqsH+4K7kVKds2
	0KDUrBf8MeE9EFfJt+86ae2FxAeFkwEgdgCIbRDK5bbwT7oVs8AnpuKrKpgMn6GO
	AQ27Vkp8T/bvp1/i4VS4dmGRSp5F8zihtgIGCmoBTYNkLM1XNT4xkzXmPec0xZuM
	ww9Hxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hf3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eced5a4cb9so5923145ad.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981866; x=1795586666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
        b=hst6/+4MuHv81jqJuS8NnxsIpUzblIesLBPP/2FxmgBz0lynUWa0C0AXczE11N90N2
         D1Sn7RC981VDBqtSzLewQIOtZzjts+EXYKNhkutuG82uuOHWv0Lm8YUz5uPsmpXmJ21w
         5VmtKASzI0koqgZm3e10sShRgToCVSQAFOpqGtEH72gBWQbGJnLCvMcJge5SzpNQ7JH/
         p7VidhcJr1cgzpHW9lXKO3xCh645N6EwZFcRALha2ecGRDXcUDLriQTOWgg3FBfTEU9d
         Hwy44NK+Pbo3lIs9Kdigy36A8zDJE4846BoIAL/XY5kxi77QkZFqW6IsgDlXXF+RDup7
         lmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981866; x=1795586666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
        b=EN1HAMxqOqjtPDNe1jIVJw3hOT3Zeaq3I7goGuQQOGlxoHLGH8yB0M3mG7AOx0MsSC
         u3VckjnlsoTebct/BuU6MAdB/N2cUH69zAmClL7cDaXI/nQyzND2LZzqnOeSRAfqNK1z
         ocmUUvqlZWqjVYhQ0pEWDfe0QU7Mufl4NndZv765Tl4pYzXRqn3TFKS9CIv9W1c8S/Qj
         G2YPAZRB7AZZ6z2xphMRRDnlUESQ1xSZNn5yC6BUnB7MfFEyKokTucuDGpJyI1gXO73M
         eQ2UHGiUz4FF8PugMQP34HYtiym0FikHHpu+fD87RFUQx0HVmfqNI9NQe9icSyhkxvEG
         cy9w==
X-Forwarded-Encrypted: i=1; AL+hErFvZne3GPkJlZFM2UWaK8y73gnGHTvB+PiksKpBVL/GHOdGTA2nO1ITcZudIGJp43c4mPJZGUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S3I61DME8lsMIOEcP4WK9G8k5ZIf+l/cVqKa5zN3Jc2nHScXG
	VprgyC84xBZJs66Lz5tPRGyxqywbNG+Ud/hbOqUpXPLN/XZiuILje9aSuohixcquzxn6USs9ZDZ
	6YZHEf0Rat8RN8BhuPKYD3YKWAQIssf9xpZto/OmCKRmZsQbvPGOxyurSQvo=
X-Gm-Gg: AZFdTZegm7G7msEoQ2rklNvjJ/OzvxDczKzXEA0kh2oY2kYAP5UHu51n6cnm248MHlV
	OkXXjZ8K0SqLfqqQ+A66WPqd3v8N/EdWwJLISYnklMuIo9MAHljytptMMbARcevjHzffGNZSgMV
	kh/nEIKma3fUUBxbAvb/LIWsLQeN5XEyFPerZ2GdBRQWpswjhhmbjwhm/FjmUv26RWBWVbJ/ijV
	QSLL9aeaqdQgatZxL8JEGWg0Z7KNK3CaiE3iaUlJyRvd3mv28PMOvrUAebn2g/CNqxoGM+eMzKN
	D/YQwE/g7R/piVyvnPcOY9Z+TqCSMJqFPolF4+PFQ0x7How0IQ8KH6ADF7C3c4MWudnCWOU+fxX
	h2bSM9WdWfI+E1Lqk+zFQ3nFSrOoeJdRYYyRSaBE7uX5hNbKf5XfFniiU6Au1jtUYn5OpCO9TMw
	==
X-Received: by 2002:a17:903:2b0d:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2eff757e23amr14324675ad.73.1794981866245;
        Tue, 17 Nov 2026 22:04:26 -0800 (PST)
X-Received: by 2002:a17:903:2b0d:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2eff757e23amr14324555ad.73.1794981865796;
        Tue, 17 Nov 2026 22:04:25 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:25 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:48 +0530
Subject: [PATCH 17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-17-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3fea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SiF2Do7RkXdkjwmSuS8B0QIuCXfhBJQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4XCHkpytBsaR
 qY1aeEqwj9gmZFvbcMxa/GdEUU+5XMcHEBA/o1ztJzwRwPasDz27Ib47CXU6lEwBO8ODzqarmpx
 iPBHaZ2P0zv4NS80fDUrEhFRXL+opVw0H8x60uVPbQpqYqUyKygYzZAX4jCkmFQLG4xOD4Z5cXM
 3irVU9UxYAU+VNnyc1+ov5hd0Qn8osSt7QxidAuH3wOKd7yVRbaOE6xlRT/XpxAdX9h6Ik7XJ+y
 k15k/guyUbiTeLWd6sn8/68dcixnTLPnIz4xrArJzqtVc7uN7Ikkhr7lt8ZPbaKKuIwZY19/WEA
 9SOWuAOa60T/Idbh7YTX6Dc8VrSLajQrEgIUu10bgnNLhyh/X9eLjRSSjX2FA/PwcE4LJPV1kkW
 +uJBXFubzjCN0zc6TcpeAPOLEfPJnD9y4SnQC1CNcB2VD02UgNSvlmCqoQjJoshNRSDifKkYdcR
 5Gt3xbDveg/JyeTy1tA==
X-Proofpoint-GUID: SiF2Do7RkXdkjwmSuS8B0QIuCXfhBJQW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3JEcBkbhIDg2
 WGaA6ppKS/XVmocVktfGxcAEsR1QLA0AirElgr7QlUgnAkNegXL5BxAfNl4J/3EqBNZ6D1D29l/
 qe5eHxQKu/uifkQKtVbKQZ/mW9WtvPE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Nord TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
index 56758a85ead8d03be8067a133e6ee2cdd9cf644b..25a831d8b83e6cfaa73f990e80d03d1f269674ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -91,7 +91,8 @@ $defs:
                 emac0_mcg, emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg,
                 emac1_mdc, emac1_mdio, emac1_ptp,
                 gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
-                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, gp_mn, jitter_bist,
+                lbist_pass,
                 mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
                 mdp_vsync_p, mdp_vsync_s,
                 pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,

-- 
2.34.1

