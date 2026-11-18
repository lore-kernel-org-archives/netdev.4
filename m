Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981764;
	b=GfAjnWbkjJZE8hdW1NsCtEdrJBFEMu7Z1hyObXejWb3R3lhLZGl9o6/YjQ7kzThe474n
	 N/2tKPanLa44XeEOz1nDjOkd/dLxU3FIffQAX028/GFtWrimIwfwEY3PImgs+HWYpSwX4
	 0QnMdEba+M5z+Sq9oMxgcvwezn8VHHFWefytHpIWVwTy7pi+ggHBGjI1KtKWRTuGxNPxg
	 ohelWH8IvU1soFjm6/aRrZ7sm9t7vlfLq1mMdQIekL84lYNOTpmMMCUi+G/drdQ1BuVwv
	 BGs100LycoKCxVvK0TMkq5YTbvYNRU9bAt2aAefQjIdid1R4ZLO78dli0z0MkmtkCsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
	b=xFRsASgmDuUZ/XLkfUzMgxyYlEknHZGQk/Q5rKGa9pkBbMFDe8ZIfwWkEPy+GcpS3Tx5
	 eY/lywzYSWGdxeDXM9lBg0YKsopEciJkc4nvmPV808SSzkP3iTXYloNktY3nePLCi57Jb
	 5u79lJGRBdTS2BkZ+dVYFF9L8NaTthF8CqwcQlr4SgjyNVf58aZcZKpibbMTme8IgWJk6
	 E1JHZKGraCx+RHbXs+L+BJpHC53hcOflJhxxwRLwDYS/2qGmkGrNQ4zv+r+LhbDWb3vrB
	 u3r6hUi0+V3Ck10MN7oeXxBiYfOrAmH2oGG4Ju1UbK7AjwxW97ESKM2bWuowHeCtYIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cB/JEdTm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138D606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8138D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+ITdzay;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cB/JEdTm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UttN1959667
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D17HvPwn7mDck1Dt1HtFj3
	YompRsTaqBaJD/AohEDDY=; b=D+ITdzayM+s2wKHuDSXbK8cMjnpDTmzflD85/4
	7TItZOOytJgZ9SBAgBDc5GT7lWdjCi9h82mb2FHplgGKWH/9oJpMOSRz3YR3l29J
	oTEnWdbgLYwknsazq8jPHi3OuksbvdH0AbjxfGaOalgFlcctYA52q19pvjfPzV1w
	Vt4ZgfFqWMKQRxFP1rd0SS5lDvV/zzvj4cftAKZjYiu8YUsiXlPgeBVGEvU9+BCb
	BBcEu4Em+UykCAwPPg7qgXOsrsOFnaRBUE0Fnhvk9MLkwAct+JlB+q/IVsA1Nm3B
	sbA4JVNq+wJtb01huP8yrK4aSfAGOakNAsh/YDBWGEhHU9oQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9heu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:02:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda2c6605so3987485ad.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981762; x=1795586562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=cB/JEdTmAcKMGdEIJAK2EP/dhzizK2NaqhyIyWy3RdyaGwWuw397bkO/Pl9mubSz17
         /9f1G1Ug5m8u5k2JrXHxPz+Zv0DqtnVPZgJoRuvVim44PcuIt1R6UyynZQEqAxeSuF5k
         6wB2JYBezC33xYKvy6Z36wEMibthW9xg/PrGdcWTyZT9DmDNn0eQKJ5U6doQkZNc2fbf
         mV0OsIelTOgenBv8iikfj77JEgPTlwc3pJbhltn9o01CgwLk1R53T4La/NGQeP87FU/c
         EJe+kk7BK4h1TUyTglmCvlomV/5LS275O8FmnY3UJe/u83HGXsS/SLYUpOmAJrshV8Z2
         TImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981762; x=1795586562;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D17HvPwn7mDck1Dt1HtFj3YompRsTaqBaJD/AohEDDY=;
        b=f9fkLkGy5G/v56A6yOSmNxh0G+eMtku5NQMcD3g+3DWZo7OmZzTTic6obqcDTR34Ag
         EOtax3UuxW8WlE4s+jRtGQAl0glfifgTk6HUvLSR73KEYB6ZjOoNBklN+L5pIf7gEbiL
         24mRy0O7lNTBlUInJg3Il4tug6yK+inPd0EwJrP67/9kr1ZRoXpRtinbjFO4figiuYCw
         /eMosHAFO4AR6FHHzb5awG5EpNGYHgcFGqByH/WJj1vKjDJwDFbThSBdVhsSMpfSP/zS
         FcdPKKd/FdiAgo0v8C7DCsUVFhSwjr1HSCEXWBZnfOz5A/6PbcjinQhcU+4jqamB1PEU
         Aprg==
X-Forwarded-Encrypted: i=1; AL+hErEI3Jgzc6hdxqj44bR8e7JFKAJqvPlkwGfGTfbroSqAUbC6BBl06UxfkDqzyKCF65IeSeqTmig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lXc0F6amuyG0V93lYllGIyMyXTUT/g9R8wBy9rPI3NW8H7pk1
	rXrErXR1Qp9lKnDLyoNJj1YLrzCQtyuIFjX7LYz29kpa9e0c+EVdsawPAHVOIj+Zrcgp2Ia0TTU
	I+oiCR8BkjjBuAVUpAGd2Tqpa5MS4rQMQy4rvhGQgxyDzzjXIrkgGjknDbts=
X-Gm-Gg: AZFdTZdQTq7A9YDkDP9xX7jETfXsTa7wZOwo94O6dP/Ak16NnfX8UWEoOKeijEhvxe1
	/2Y3GTyxi+MFYpx2wSdP6msqX3sX6XHpahmz/J4Z0fU7I/yVmiyd7lG19H6ysj9Mu9JwnHJ2/Z6
	113JpqP09eeKC+ne3hAjayhNGMYWEE19Jp47tnufsyp80uBNEMRxcEi6Ti+3aN6Q1fx4AHjBwLi
	DF895NrBaDpmKKzaKVISdGxWe8M92+4R7Rtzcd3BY8EL6qbBOWZk44J3Nvn4PE4t93u33gm7TMa
	hJzshLNcjzvNLHZWZx9ZCw+6wx+E6ZrtyrG3T3v9t01eVirFXUI5lfLxHNp2EcH6Y9N2xEJvBU6
	+3CuMzqn3Z4X2JdERduX/fxZ5Ae5EBylDILMpfPAzJblKjfEVfbT9jWnn0/hreABTqqALeR36SQ
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900965ad.63.1794981761635;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14900605ad.63.1794981761122;
        Tue, 17 Nov 2026 22:02:41 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across
 Qualcomm TLMM blocks
Date: Wed, 18 Nov 2026 11:32:31 +0530
Message-Id: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHc//WoC/x3MTQqAIBBA4avErBOa/oiuEiFhYw2kiVoE0t2Tl
 t/ivQSBPFOAsUjg6ebAp83AsgC1L3YjwWs21FXdI+IgNieNlfEwRobLudNHgbS0lVYNdo2GHDp
 Pmp9/Os3v+wFffdrOZAAAAA==
X-Change-ID: 20261118-gp_mn_tlmm_support-1ea40fc3153f
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3f82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tUJcrGGC8pjJoxVLki4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uZ8-Wn-9EcHSbB1796G6kS73qgZCQc4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2SlcLEevf7Cv
 XH6C1ZcJ/HRUM8OPeT9tGW3ET2T9xVngXPyRT5etu6j5rnheM5OBJtpbM4+Q0rw/jAJ63vTjpRb
 iintD2vBVYRhgCHKHrS4/gZsIMcSWjYLHlMrkBN5iWHe9+BG/R0baI+zLd3k+/JS7yiJLYMpFje
 ZqwpuHM9Gd8K7IDMbp0oCjdf8WWMoKrxWvfQ9w8611wEzx8f8lPzjSgomcg3H1bYdw7SP2Vjtrw
 qN7wTjtnF0g5aXCbiUTOfZPuVyA6OFiNXyoV9g6xcGZeZ3e6nKivL/4SXgzYMEqZc1JqPYnKomJ
 OuoLWLYSuox97THJTUWv5q2hTpY5MSr/65U0aRmuwkSaaS+9vI4H4m8QMcAYoI3qIxaF4rfLbOg
 DH1HYpN5Pe+GuqxuN4v+EpgUL/tlycfNb9rL9JkQdiDq0HuY+2u7p7ZXPk9RJc4T+qHVUTto61d
 kRBWieg9I15g6BKOoQw==
X-Proofpoint-GUID: uZ8-Wn-9EcHSbB1796G6kS73qgZCQc4f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX25uQwDbbpolt
 7RXuS5d+ZJN6ZonfmxnKOikee53TBQmR/kOHxfnpXmJ5Y7npp8aWdesQxuqS6N9rqBXu9zV8nZo
 VPW262EhpY3rv043WipF3T5DQezLpYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

The GP M/N divider generates a clock output that can be routed to a TLMM
pin via the gp_mn pinmux function. This series adds the gp_mn function to
the Qualcomm TLMM pin control drivers that expose it.

The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
part of the PDM GP_MN clock series, where only the drivers were posted.
This series adds the matching gp_mn entry to each of those TLMM bindings as
well, so the binding and driver stay self-consistent. The remaining patches
extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
to its TLMM binding enum first, followed by the driver change.

Merging strategy: this addresses the questions raised on the PDM GP_MN v2
series about how these should be merged [1][2]. The pin control changes
have no dependency on the clock portion of that series, and Qualcomm pin
control patches are now collected and integrated by Bartosz Golaszewski.
They are therefore split out from the clock series and resent here as a
standalone pin control series, intended to be picked up through the
Qualcomm pin control tree independently of the clock and DT patches.

[1] https://lore.kernel.org/lkml/CAD++jLmA65GL4xxFNSHr-j=Xo2o3dNmEcKjpNEkECXb5bOX8TA@mail.gmail.com/
[2] https://lore.kernel.org/lkml/CAMRc=MeK=BV6WEQNVC5wXo8giAgnrjtdROswXF8Py3BMDLZa2A@mail.gmail.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (18):
      dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
      pinctrl: qcom: sm8750: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
      pinctrl: qcom: kaanapali: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: glymur: add gp_mn function
      pinctrl: qcom: glymur: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: shikra: add gp_mn function
      pinctrl: qcom: shikra: Add gp_mn mux function
      dt-bindings: pinctrl: qcom: nord: add gp_mn function
      pinctrl: qcom: nord: Add gp_mn mux function

 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml         | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml    | 3 ++-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml         | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml  | 3 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c                         | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-nord.c                              | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c                           | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sc7280.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-shikra.c                            | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sm8750.c                            | 8 +++++++-
 18 files changed, 77 insertions(+), 18 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-gp_mn_tlmm_support-1ea40fc3153f

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

