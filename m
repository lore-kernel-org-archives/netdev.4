Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981837;
	b=MdFcs8MP73FZ0rU+RfnrdvDR1C063ICW/ZIztAVSA4FtGOjrb2TOJGZX6/K5g3z7kvXy
	 Ex8cMZYrIm9XB9OI2VMXdE2nPcYxNDxcaITDLKyVUTa9q028C2tE5hiUqwI0Q+A5eOt35
	 I3VEncGxf+CKTUX5c7Q3iL4N6CGSAIKDHO381Fec7I8Ea7rDTEANA4OJLShf8MRDoJONP
	 1srIXb1hy18912fJu/Dq/gYoLiEBbEPtkIorY4mk3D4syfAGKjzXYFjODzYho10UtxtG+
	 ZhE8jvIHlINBdybTd4CtxMaEGbHHAPsPaMeNBsv9Y8IPtejh3zC+70NrZn9GLudVVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
	b=tCbll/1OzqS3BNTMeF8mlPwIjSd81/ivj0ube4w62MvVBsmyIa1Z8r6zKzEkvhqfG29o
	 SkfPT7ShL7lbgFpwneet9seL0+4sVQcBHIa1R8a/CGaBJRXqBJ6tGhq1cXq0ton5HUbzj
	 hGVTD4ynUhh1GJGthp1KViEO1elksr5trIBTl1wbReMPpx1WT8Yn1E7h36G/DvmAePmOy
	 PlwP2TE7HskU2gPPncxbqyuDSyy/JxIGO+AbYJ7xdSJn53D3zkRxN7BcU6V1lQendCtpk
	 tLUkxT/Pv8nEl726YuQh5rkyAHAf/hG/4rSUaSRTvsEwAGZNIB7mCke7u/FQZOkztKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB15606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB15606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uuw71959677
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=; b=WJmtjKPM+Gt06NeY
	NK7I4LsMjwV/jDaDyAhLIdsLORSo/rqYaQiWaSpWB1twDhUQU7Q7LoqUnhuJvt6T
	gTR94IzfM4MkFCmoqopU6DRc4hgRbrPqWEmweAg7Gy1FKuF0zNlmE8GK0nODLdlx
	nuZUvE7A0Efgf7GVTsuSfdDwix92zi6fjBC08pxTpZ818C7ilLL/v6bbIVLPJpE6
	hPbDy3tIHc7p8PycgCpsX7ATS6VHVM42Fj18LPPS3ln1M9zCR22qeySm+TYFCgI8
	whC8OLWaUGz7iN6epytNG4S18wzeCdDzv42umwUspnl+wocUtOXfxEVHy119jNNK
	JE6yfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hf1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so8981645ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981836; x=1795586636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=QVYrrSCaPKymmKhsag1F7lcVJDX4nu5h6tSbiitjTfL93GhD/9gkWb4dh844lxz4lU
         ZOJ+EktTuJxn6p3rLj5eS5RnitlxVm+V2FdEDvPmUhlbSk1ks6XLRQ7hqAWYkfiyeVGb
         n6CyE9b20SE6643AI9V/k0PffFSFo6YnUDqKoR8DGk+XaBZn8siTEJRzLjTWvKo6tQZ5
         OzGWaGKXqrZT27EoH4NH68lfSoqkUw+BvdC5195FNugQxTiawn5f90t91qWIePCZ48I/
         TKx9E633YnAGTzFHF2nYWRxmQ9lvFPDTX36mpsiat9qZWH2wUaFfVVIY3OKtI+U7hpUf
         9kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981836; x=1795586636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=GJ1OIKSFF4hCiJbuqIpDAWe83NCqDOeqBgyXbfkDEGt9aJFkLjsFFp6EXDzCKC7R+H
         PssL29Cb4/uFO4up9D3StEkz0lQ6wyj9kPVDSRLvVryovyvHXv4MMnzeUfmgqWyu7Ysj
         fjcC/bHJoW5990E21PXpHiLShxkWyeJ9mhVUHVUxMM+y5kDOZ75NaFx6dW9ulIS2nhdd
         9Kbgl6QMVG/99aZ5SmHhqOWGGmoxyCdAD032pgErBtZ2CM0RM7L0LKAofV51fvE1Hh1R
         YE9Z8djtQmc+IRrxa5TE0n/NeAAyivVd50MbV5OCytYDHgGFaPQKGOv3bYbwQm9wq4Kn
         SXNw==
X-Forwarded-Encrypted: i=1; AL+hErED3ywJnmqMYeXy/mmWs3fxboOykPk0+CC26pfHusmlY9cLGZAQ3rkC6GHwyhFhtSyk0MRHM9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z84njfJHhdlzjES1APTjm6yIBZ8k1Elv6ulwSV+J6L8psPNHtlL
	rzSDybQMsRLneEd8VGNrgbo5OseDHj9DWISKDHi6svZpc3IpXFgFa6SyAEyli8pbgXDxzz7vk7y
	0QLjjW27DpHK7SOAyLB3vfw8UnwoiMQVdxmo9ztgY+VYP3JyBSRzPrS6ep5c=
X-Gm-Gg: AZFdTZeWYVXpFEXnrK050PbFNuQE34hrf4OdR7EQ0vID3Z0RcHggBvlFl6oTwNNqDRT
	s8J9y1UbHSWmBFjRauxDJ8yQTvG18idGOp6E86qf7Lmr/TGSIndPkr/Mwng6c7VoSCWcZbZzjs/
	qb0lae7tcctsGX0OjkM4CJNyRCvi6Iawlr3uVzU54u3KtLhm7sePbumZJcj+uLycnFxwDYVtRR/
	D9vcWmzyQvPr0bpCyaZv+zq/0VJmdYkgbpxx49F12COJ9vYqiQzLxqHudI1WdAABI3geencpIxM
	YWeIBVsWWl+1dSzHgwO8hScE4xbzg+b3lZCFgE496is6jawDgiq8R5AFrGoN8A+Bq01WSPbcsKR
	Zww5pCh9JjnzjGLKP9T9z+piLK7juu2tUJqUPBJEO+XFg/jkTdksfUcQ1NSm5TXN/RpVn/GYStg
	==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345515ad.27.1794981835853;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345315ad.27.1794981835507;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:43 +0530
Subject: [PATCH 12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-12-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3fcc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: CFKA_PXiktcnH3BV7Kw1SA-Vim4YmDFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXz9//iSVtu8pV
 gULL5U9u/KtroMWI8OIQpGrPkfvxrImVGC+Qb+qe2LQSGv5OO7taxExwOFXCMw99wuzd78hCn57
 KPY9FPdXGT9o59XQMO6TuqixW2Vp2uWTz2XwsqIi6k1wkfO2TijPd+MDpc2LP1KlCMgCUnSkIS9
 yUZJ5+1x6beZW1GfPmUBfZOahhllawr81vmvAYakBa1axVqe94aC/m864cA4IYCk2NfNyMNi32m
 CbcYH/rzJbEJGRpq0cvZa4zjCdP58mcoNbNiYR3uZGC4cHxHSy9T7vx4VjZrzMxzKZ6JpNvldiO
 C4vbPAps6LFZHeRGR5t/sxUxlwk1myrrd4Zb0JsRjfskWXVnmWcjaLgpha09UJyKx4pCGC7fOYd
 umUGMViUPWvJodJBg6yHjgayKp4IwgjN7mVAGGBl18QcfJtgWE3SjbkRxGuMwJIZg8HNmCKyqH+
 84gzizjq4Y74D+QwBbg==
X-Proofpoint-GUID: CFKA_PXiktcnH3BV7Kw1SA-Vim4YmDFb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX0E48+ICEDPLf
 HLxIih+W4gAre7Mb8dYXD/juuA1SsZ3fkmJqAFCEtQcR7944c188j/i3h8JRiL2BS9xPrURMRXU
 PNLNFml9QmG0PAZ0hzJpcvaqLZ3JEDw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Kaanapali. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..2c27eb2255c30777310e6280f6767b426b12fc79 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -588,6 +588,7 @@ enum kaanapali_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -890,6 +891,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio42", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio66", "gpio67",
 };
@@ -1380,6 +1385,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1555,7 +1561,7 @@ static const struct msm_pingroup kaanapali_groups[] = {
 	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[52] = PINGROUP(52, qup1_se5, ddr_pxi2, _, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, _, ddr_pxi3, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, gp_mn, ddr_pxi3, _, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, uim1_data, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, uim1_reset, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

