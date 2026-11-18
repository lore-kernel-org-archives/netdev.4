Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981788;
	b=l7jmY983gBvhXncuNg3eAULvk+9ZZENqbWtH7Y8k0+8jNh2DlrlunirZJQYbIc3X49be
	 K8/wykmOBa5D5R9cowFnUgxcJgbS3oVoUPrCwqJNU18Bdnxfv03d5hjwJonQLdzCjS3jh
	 NVzSn5gbcSheXaCDSLNUlpHKCSa26Os9LwF9SrOmXIuPwueA32+D0H/F9PgUpFI4Cvirl
	 Wz2ifeMXu+ke2TwPjA0RxtTqIn5Znudxk+Dv9yOqPPskxkUWoHig+DMo56+2D9g8HTmYb
	 FPb2H42J/hcxiOvlpG4EMgnkZMy5MGfwpvPAJ6g4VPsIJ/egIhFf7qmJ84jbRgQXVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=FVdNndt+ELMJFRRJnwwm9XA/MPQw7O7RZ8y++nW84jovSCi6jmMm+6M+ed5Ph9e8euV5
	 uVYCoCrk0PKPAtgoC/eSoBkAUZaimURoyiA8+9mgC1qYHapQGQrNNkTJRRXOej2NExZ8v
	 MeKbECdIBPQv1wXdeGhWUzx5oljn6VKuKViG3JsM6kWWIgZG+5mVDaKtBwiDLV4ND3ilN
	 XkCJ6ZTS7BES24Qb7IZPqozlYrZjey2VVkejZDEx3KfmYxe3sk+HuRRRfZ1gY9tpfYuhj
	 XHfGbA70eEHYCTHactpUicFtrbOK24XIoYtWSdMEVepgiK0vH4qcxFWKFzHX2Hn/FJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8TF4Gzc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D92606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D92606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8TF4Gzc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UumY1959692
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=Pr1t6QGnyFV/mszV
	rMAcKUoJ1E27zdyrXfPBhOJOKo9KLdYdWlmZY2B9yJFip7XDUl5R3d6YQ8aunJMe
	h5y5/7W9iA3Wyg01WraLCs3Q6Qp7R5nDG+iVc09NMxbqliThBVUQRjvih6aZ7wWM
	nqpu8NGcRnEobkwMbIp0xsP0goBMTkpB2dllYylIw+bNAiigiIwQH0C7+a+fVWKk
	lnlYswJN63L3rQiSetVpQlbMNiuMYxJW3awOb0qmijdRpGWjKqXWXPwEEa8Ohyji
	W2uFj9OSY8ie7uGpD4eZduRBdT3S+KbPowgYQK42pZDljyvivDC9OictKy/TGXcF
	tYuCEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efdd509c6bso8221245ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981786; x=1795586586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=Y8TF4Gzco5F4qpAyT0Ry6OaJ2coapu/d5ZLd9hG0WjibzT5kCys4Ll9wm+JnlTcUUW
         vIcBgt/XXIe2eCawkBOKFmWXXRHaCwrbWHCZyewwkTNvaTN7BQqWKMwhe2GKWNUMpxhc
         WPZNwPby/PD+BHcyUTpBtg4v/3UOv+XtQvXxJ5oaFDUuSR4/TR4TmEWATC3OHSZe94X1
         qGIrd3NSykQnp3PD1gQaN5UN0aEWfH/5gl4+X0hhk5Kua2nWOJqqLLaMsPPcS/oR+y+0
         eA8L9yXissmvbcWmv5PbcFIEU6hoMkJipYnuS9ZiL5Y0nlyekbs92hJ5FZRk/HnJR9of
         LQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981786; x=1795586586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=IrMpUtcqipXzVMj46Dv/kKi4286AgCZnosQ/Xxgmo8PFrSfKKC2rrveew6Jz+OLO3D
         l3nJNkjkJJs6N1rhfALb9fUvKchE32idpLxhLv1LwwYIqXKd/xIsLi5m4DNhcsFsVUML
         Bu6qaL+QRpAfDs+6nglV8WQns8X3AePO8Se6rGM9rvpWP8tquVw6zEd0OBT0KGiXR6Pu
         KnyqNQBYNVEkEFihozaOd4COBS8qDxtR2TuGMXugNnCHmqMZFF2t1wgV/C6ttEsxT3ne
         bkWS9IgIqLksiXn/XeXUzxJhDqnkGsqyegRR+TVMGBB2oR8mpdjXSSQzZ/PShbp4eA4K
         JwUA==
X-Forwarded-Encrypted: i=1; AL+hErE/94RD+gl94exaCEAuBoyi1ltSXI8l1QldOaNYWkVP/uViCrS3GRN4pRuGtveYb+Yr7GCZEyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fzuBmJDo4QUzA5VDgHx8rwFwi5aasHurhXjdOB9ciITydquLJ
	dkmtPtN9xSfJDklp5CBlZcUZWckwoSVBE15Wro//LgHnb8q7caRRhv2RS2vjimfrQH2hA14g16l
	vm9evJBhc/CiAUb6JT1y1oV1ThJO1k/0bEvCEYTQMZiLytjOSEvXRjYY+bJI=
X-Gm-Gg: AZFdTZfiPcaMQ6IFGFwGfNXAuF/jTGdW25orv3fDhPgOJQsYPmqKWN8nHFp6B76yFPQ
	wpkl2y8/XHxneG032qD4+K+mC9ogyeuBkjxE+7XHQqhBmBr7V+si/+jeQ9op/6CG6LHJA3UvhXc
	7i2/QCFUS2Zppt3r6mK2Cmy1uDiVH2gknboAfVQKuEcLMvmGuJfze+CcMYxMM3xM5ZAdH7N+QcM
	ObBFwqsF5GARd/kV++YUclPxsFgcezPhEeZXlXZ1q/fwgqe8IcTze9It2oSyEPyq6wzK+oqvjHu
	G5ZkroxjBhBRvLPJrnGDuz0+MHr0oKxa5fyIuHXp0HJRQi9UVkDm0sagCJ3oFvjCmF9WUwcjLKl
	9XLhxa91X0pWwe0ud1JFFDOR1P6yMi35PJ0UOK/nfqpeNrDBVFT+noQ9E64hh8Qwot05DjYkmkg
	==
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16730115ad.14.1794981786497;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16729705ad.14.1794981786017;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:35 +0530
Subject: [PATCH 04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-4-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3f9b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: STnrKn_7nyUW52qmYIu8yy7BHDp9TzmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX866Pn/01cUJU
 j4CL9DuSRj3C2zX2mnRJPDPAK3nFegW/OQNMwga9Pu4sQK429JeMZCtjZcrKldDTL2p7UspWKuI
 aanSQfLSmICHjcE+nJ31tI+yJVEidO5PMkpUvc4zIwK1xC6Qfsodm1BxFXUfBtLtZulDchEJO3o
 ES0bmWcHNnYIUXRSJ5fCaNnAUu8HiOlt0eFpIdotH/YZhDB1jcwiIA5HZU3zcuetV6gBBgkNBmO
 lAjV3r9nQaLNQ1Ias+OEosyRjES9ywwl6gVa3tg+vhwd4Hg0y5OQqSTwwsCh/9n5+bcV1CJlQc8
 kCqTCm/vx/4OJrfRp5xWbmituQbuV5aOXGz3fqOeh9+IzggeWVJpKCYfBmmWPE8xVKx+FNwk0is
 WrsOz3vJ5mAa9jmCnZXnsgLcOg4UPGmlMlGaqUjBrjWj/51wFDqIDjXB3Jx7AIC/+lra4bbVnBS
 NJ1VkLcyku0IyWt9XbA==
X-Proofpoint-GUID: STnrKn_7nyUW52qmYIu8yy7BHDp9TzmI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2dzwzBPUUw+X
 xlIShEek3lHd8anLCJWWhGF43o/qLrDOfLpP4SpDx5xA6Tf6UtYOesbW9qQqVYWA79u9tv7hIZd
 ZdzDNTvbg7jYiTsC6l0TJCFDb04HYtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio35 of SA8775P. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff008a2605876eb329496d305735700..d299f47a0bd4ab1a0cd0e553ba50f9ec1e035686 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -480,6 +480,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -828,6 +829,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1230,6 +1235,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1361,7 +1367,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),

-- 
2.34.1

