Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981820;
	b=DfNik2zuWdgwjrjTB42AgYeRn7nscE5LVw5qXk9gmS10uauwLTloFcm7TW08zSJaKSc5
	 Mq79bJLzx5mi1CqRkXVGpJetgq1nDSSZES/aVJLLXpDsaee4BbiNxcijxIqZmlgI/Y73y
	 uCCUS89Xz4zhk18kt/HPxFG9gJ2eHIU5RU9V1f7NJLBM1DPnMh2wr9wnUYcBDU1P/P+/Z
	 qq7JGVTi9LPnWYEwwxefG+LrXitLi+ApKLNTTw2MhDKc+NmdAJI8YUJh0CHyZ6XOetRr9
	 tPt+uJv+Fk7/Jcw4MhXveu2ItbeTSDAQgwDMiNW5NOsxotkUlOGW+pOMSEGCw0ckBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
	b=dW8q7Bjo9T+jbK/A3QHk9BHr2QBtAnuWmrWF94u0vCIyaLn9O8l02vFOL/mLrVASzxSK
	 3FlqqVugvYmx+mQYQtoJ9Utk7Wl7wvgpII3YPeNg/Iaa1x24zN6xpzRJd2j49uKfqNxJn
	 JvY5T+sljqAx8RweWMUr2MUA4+qtaAaosCuHEg/8B14nGAfdo8szWCa2wP99T7lOlkQQF
	 Qo7vzCwK6VtdmIova0DA84WMaOk4Vq/RZP4o0jkGww5O4zAvYVkjsxyorpAygrJ5zdxeb
	 CdE50AdRCUP8bzS8oeE3Y+RuMlJe5Pl7YciZy/C+SxPvkan2KhoXcFdgWtNpi5Nr/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC5606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CC5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vfov2107748
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=; b=NuDaoHK7zog9vIxW
	6RSCIIUYrVQ9w0Guy+scyNYEUWoAvqvYyaa3I47zVNGoN3OYis0m8UwYRldXpm7b
	EW+9wx1w3poD7MV6FDVMXj3FWBvIEMv7lDhL0cn8NDztX0BjPiCOJ8U55akGmzXr
	btH2xuKlB+jU/znChMJfQURwipywNPs945gnCV/ffYQcIEYO3i0J1YJYUJWdtk2H
	yLj+uBmaJx345p9Id+bPVhDW7rND5Yh2RaCZazoJMzlZQFZ0YM0Mt7GebraLn07G
	1UFnZtKt9GchjCS98J60FOAUH3fRxiUSQFHXL+jcS55tY0yhJjnZqQBFu/1vSvuT
	ujR/SA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8se9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efdd509c6bso8228435ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981818; x=1795586618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=CspXak3XYuU6eaDrwpVCNIP1TIH/7+vq3VeyXjkGF0Z+68T+VTDgnZIlqw6RP9thA3
         q58dV6916yOoYmUNyxe6B5alk3rXX79Dm5UDCg0rP2lt1RtKIsJ6L5mWRSvGfYGlwkjU
         yMvUDNsLvE5hTIrD3VRJsMP1YSD30Z/2UQMrGLCjyqcfUMjbuXenL0cbfRvWOS7smffE
         D/PSXg7Ov8MNbMQbubkhaUMU2iBJzaJk1flpJ6SbZNmHYZYj8Gii/bHvHSvWTSh9OSC8
         T7D6G2dU8OinZYY69aJ6uIhdK9TGRtf7jBeierZlaFzJfTMj8dQSYs0asjAK+PPrTz7h
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981818; x=1795586618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=a9tIGgfJZyEBCxzSR2y32a6ldNiqD5ebR5Yho0ov3b01Qj2da7SCtRIA2VVPg6JZSe
         3oeKoDR4+VLBOrWBOyzQOqqar3/qyhG9qu8dpaDouhKdCO/7HSHbbsW0Q+H4cmuWVS3O
         aL0Ek9PdamvRAjJ3EjQL2I+0FROeroc/Oa77DIYcNiPoyXhjpfCY2XfgOHdJH5vY+XOg
         gTI/8gx9WLxt/FtbpzoAE/pDNqMswxlkDK6MpK9e6Kc3dn7B/DfTWuAVXMJZSv++GOpy
         bsy5N7Xjb+kY69z1wwNJRVgfu9SVSVNE2lZNtZ9qhizk38lNZ6/LbE8zcdJ/rbH/GNUo
         aO8A==
X-Forwarded-Encrypted: i=1; AL+hErHfN3hPk44N88mLCPgEuN9TIeCoHrSHkxYpCTKs5ihz4FjqIK1P7KkTKWO5Vp5V1HAPV97uAy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p7SNHFDOakiza/wAdifZ3/z0LaGmr42O3H9oNPV1XUiaeYINg
	8ZyaJi6LW3ORIZ1IeGp2oUKHYWlztpeLf+85Z1jKf9R7InzlxcgAZwyOE/xkJ15QreN7Mfb09/F
	t3079s4soCpJVs9I3EbNhn0GPDK1/kz4vesxCkiaERI7wi5Ut8P74/IHN5C8=
X-Gm-Gg: AZFdTZdNwZ/S29BIY2lEhd8syWeQnjrsV+kZpp2fQ9kAem0SuTI9PozMQYbo+0JzTGY
	xfO6d0WiikYZGO2GK7KtG7Y5gdGqwtl6gYaIkj7VdG7N/leDgNTrmjOuXPVi+bR2BJ8SpDVuG8Z
	eFOIexb7UcquBlwvSGfLkr9zsTnwWKbL3xHIXG9QB70XE1HwrVi3IM+bW28yIpcA5JS9WkP0hbV
	vczzaBgYBGxUBDbxEdaPL79NoquyyqXeO8Othyx6fzmBjzelKup+a3CRZTDbrpnj599b0mCUbUJ
	rlREYLWzfookA2ulG9Qy72pDOJxxmlxjVLPGpniikLnyzwJrDhPdDdmHmMWSOT79qMc1cfTa3zS
	qQLmVdTr1byxh9SWq19DqZ2WYpcKb/s7qdfK1xVmbZCBEtKd3lUMczQBKbG8CVu4yBxiyi3u/xw
	==
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948865ad.12.1794981817684;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948655ad.12.1794981817257;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:40 +0530
Subject: [PATCH 09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2HWlgCr24LHEdtldtY1bpmsk6sLQZExq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX50+tVo6fycI/
 L71Ul61q6nk3V+Z3RMZbaOyAD/LA/fPvtDcvJf9bC1gw7E3P5Ncl6e4ajOCQ8HUcY+1na0SYwLF
 lSKugSV5YOat8PEOnvAdMqhYkB5mZE8=
X-Proofpoint-GUID: 2HWlgCr24LHEdtldtY1bpmsk6sLQZExq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5ST/of9J+dnP
 EBPatefM/AEQFiPn+zPL7zRyOAtHySxUtWkj+8iId8FlXg/FLLKGEst68tsCrJpiElDZhctdFYI
 n1sjkCHH43lmk8aRC9eOFq5MAe0MCB01GuDSB4AtZ8EzjC4VaIEz7MTnGb9Y+/b6JGNfeqaVRMJ
 i/NdXG3dSZHIlORrkhIKejuhtnd5UJXncpG1401TIBWxExLSyr/rL7cyzZvDjIwEBtzFLFwVdnj
 c4QBLkjHEFa94+O6I5yn8wTRZ+B3scaL4LEHaOkylUKdS/NGGuHxaKP/tz2Yk7SX2uMkJVPoVWy
 4uh3WyevMaasW7fWKo9ieMV1eKqMnw8vcWMA0zI8d4u+NbUl3nFKNEUiqETklpCiVEDAt84Y0Oc
 lOU2ma+ghQu0cZpKCn1sTJIGJnwb84kxh9ATPtXsQlRoObMK5Zw+9bX3YS+O/xx3s/O0V7GY5aa
 U0GsYUNqo2AQg+7V03Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SM8750 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
index 7aecc97745a8cdffe70720dd2f1f3391ff979ce2..1af098d45c54b99871e81e6576b516ffd0374fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,

-- 
2.34.1

