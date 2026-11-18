Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981875;
	b=30Tb79lctjq0WpLjGg/lKZJWbkK/K/jlDIG17lNk/gibct03L/8WlG0y5Hyde9ZFnAQa
	 SGWwsR6RYqObBzGIc4R4BGcpuqcUkyC2LIucBB6D4NQB7rPcw32JbU/c/1RuZWb4CcyIT
	 Ele5xvSr9KFgzYCYoktAN0YQcZ1ggqBMcuKekxmUc4fuh8B77+YIz+QOWq9Itv5djzsQ/
	 735PlPR/i6aohob/B8rRUNlQb0Afej/vKz35znG+fz9bXdrtLNzWUePsgxCt+FTLDC4+/
	 Qg2sFPA7It35ysoGzW42DD5QtSY8lf46OcKuN8AdEKVe74SHPY4y6smwYT0b7NEPirg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
	b=othT+BWbimMF9i03QOO6uvfBkvDD6k/lIPPBUXBHyiWmPNGClavcwH6ruNlqugYjma7W
	 qb8qi8MK1bA26DdPLv/vGyiI9TeyJbnHMbq/7TRWUtqTMncDlVOWVYE+geIK7iUMdtj29
	 h/Uh8Bq2VZXDqwA7trJTOMMg+7he+Uobjlqy/HIFD95cvsrttLoqPu/sBUTCEH5xCooVf
	 b8MkvxgX9SqhUC70lI6E9FFr2t+D4IIUnD9QWw5LYvgIDeKjjck/wdtKQepT1kQUr4/sh
	 hG+A+nnmRAOwG/XU9oPqmoJSScFKCQ0k4r7MF2Qn7eFtz6j4OFrvfLBrAcQcAZ76ddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7567606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7567606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI60nrU3578780
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=; b=FHNQ3ObhT7bK5/4C
	oqmE4OEjPrUih9E4aKts1y0ItpoMxEikFCn1BgZADzr5epqfDzorCtim103Af4U4
	NfY+VSv+Cwiadyk8QXj6PM0/O6+EDRvDeoeI+Ah/yKGPzZsiFITQ9dlL/LM9iTOv
	LxUoqIO69eeT5DvPP2D2YMPc2zl9dvUyL0NotqnvZBSvDY6KU/6xBZ2hPnXtVTlc
	zYQA7SLMx4vDSkXjDjz8VgLLm6Dty59yKCWGXrjtUHUmzeMIipjyiwhcOJEO85RR
	1jRRHldj4sfNmYNbazIG4BriVdc10E0xt0xSdvqL7kF0cBBycMchzZ8eLnSouBm8
	0r6vbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9heje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so5785265ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981872; x=1795586672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=PJfFLjLp+t42e9u8jOnsmQXqwt3eVACkUPH2B9fO68D8SbRsJBFcTJCKznk3t72gbg
         Ynf8tcMyXuLmtWjNmbhta/7W3eumgHJ1js0kdNAFLhj/DmK/0CoIQzb/bQ2TptgTllIc
         UvcwzWhioZtt1jqtODkmf6gDy4QyzpbFvtyUt7TtBsnAyt2/I3aHHUbGLxAaMvobbCw8
         eYD81oTyWXvl5XqHoDryf6dn83Bfa8qlzJbB1UdILtU4YAWLQc2YSaKqbW8ifbuFnSo+
         By7Ru9Heg4bWHONKElHip5VSafpYz288et8lkW0p+iGsIivL85dmooKLi3ubQkiL7Xqk
         riIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981872; x=1795586672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=2ieZObEOHJ4HI+QUADfWZBvL3YH2wZ9DpkheJ/5xRj2D8iFycpgsXHFCkXiAQW9n1x
         Be08hLKkVPTs1vAUsMUykhLVk3iQefauiIGd8J8OFzEZR6TpgV5smR/doqv1HJgq92UF
         dg1dVetc3VyGjwIokTcyrc7TeYRGYVRagCInbYk4IODoc+ATq7N1Xr9eBLO63x8+hJW4
         COw/tKX1o99yber68DndtwZqSPYnMxjq+sLG/RttLGanGTsG/IkidLH7y9WJ1ySjuq6B
         EKH6W5f7/gmOpW4riYESdzO3Jbmxf95I4l0GGYLp3sCo/nfCkHarJyp3dbGgx0ruh3p2
         Ctog==
X-Forwarded-Encrypted: i=1; AL+hErEUCW+P/TCCmZSIZitlZq8Quib0KkqK3ltTodEpm9V+0W6q7KuVEFXNuzz37/hvKA/XtNl1AQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vbsm2qr8pRh6CkO92J2xuDIZxFpepcIud/oUyt34fiKWgmBPJ
	6ai9pM9OncZVH20fC1xKIWVWAGtYtRS3Cq4rFNIUSf6bRh4lFC4hJzM3LomRBEZ9iCpAoC9H/TX
	cssyQckYxOzRh/F7qti2YliYlGJ4jk4SDDGLNkzDsfSYFXrqTpfTjIaN0fdI=
X-Gm-Gg: AZFdTZcRjaHbUqxpZHPgrekV5oMl33HYp5Fs0Qsx8l1qm7FYpfWZQTsu4P3jrTXwxlo
	qF8twCbCJFTftix7h7QLnnhqSsv2DlWMBAm1y7HRiVTDF6QR29k3Ify7CDML8F/lNCeV0uMkf94
	B5Kl++FaH86+5+yF7DIqLpJaKkVgPwdf6FIkpuDML0OaReGKSv/OTqDLJQtpmrbrrUI5RsfAKpH
	j4KhJcUMAE97mhJv/VGEdaZw5JNEnMSJ246MDUOsTWXZCA3ei6Rw2lomXXYfe+I8ekcXC7ofpM/
	t/B0d6XKqkjyYbve5b+vSrQ1DXq9JGCJeZ/YwJByECRwn73j2/QoZnCFtKUN3O3n//OUDLGNTPo
	7z4T17SjZUVYhi00LLwLNn65LAHFqUnA011YeDDFKVHgPopTeJB0Kls997q6OhkHWedHjKK5O/Q
	==
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464985ad.53.1794981872397;
        Tue, 17 Nov 2026 22:04:32 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464615ad.53.1794981871904;
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:49 +0530
Subject: [PATCH 18/18] pinctrl: qcom: nord: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-18-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: RshyKRTjsRh5DyeK54MQP1pCtik5pJUg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwJKavTn4tqPA
 PwYgcOiitSu1UOW1ZC1qIM2D6YYsNlrXV2DcK3j82eM7KscYbJDtBFqw/SIJXA/s17XTfP9JZo0
 3y+f5VxW0P2mpzNhk5QEquMR83uaqSs=
X-Proofpoint-ORIG-GUID: RshyKRTjsRh5DyeK54MQP1pCtik5pJUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzi0YuECLuQmz
 x/LSgeyvMcJ4zGv6/cwMd6kgc2XhVVREpJHGVZLvoD+ohJu1gWxbgs2yhg7ZnfRlAEGly84sUob
 Puso0bTnyCcOxpzxAWQHcqxw2/2oTB4Cf1Tn3Y98N8KoCOsn3j7/TBGn2yFbybk3sZfPp/Tub5T
 6QvgsnQvYogG7zYlc45FPKrXfpO1fEnUa11ud/MZ02LWW/tIEG0WCxl6dSn+N+uOSW7vCaj8Gt/
 WO54eRdkIbaqNZEoiOo3N9xOzrvdzpW6EQ0zHEZdA52gls8rujDqUuXz6e5z1YpYSaGqOK0Wdlp
 HaAKTufB99gbCWVueH+ribbiLozxUJ9J46+f2LIF0vJrLBLPxnbC4yYxWEfLYGxH6EvtND8mLTr
 Qw7JffkXIniG7baDYcdF5ubGmsWWVrNWr0HBZyWqTWGWv3XbfRsNdCrm4QcCIpyb6/AL7m7hvmd
 RvYbmcrlyL3upAERsNg==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd3ff1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Nq_pnvwty-RK0duK2HsA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn mux function to the Nord TLMM pin control driver. The
GP M/N divider clock output can be routed to gpio35 via this function.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-nord.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index 010760cf0bf5cbbab95f41946f927c7a5f5e76e9..36b0644f041da07673ac82f19392be506df51986 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -542,6 +542,7 @@ enum nord_functions {
 	msm_mux_gcc_gp6_clk,
 	msm_mux_gcc_gp7_clk,
 	msm_mux_gcc_gp8_clk,
+	msm_mux_gp_mn,
 	msm_mux_jitter_bist,
 	msm_mux_lbist_pass,
 	msm_mux_mbist_pass,
@@ -1028,6 +1029,10 @@ static const char *const gcc_gp8_clk_groups[] = {
 	"gpio14",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char *const jitter_bist_groups[] = {
 	"gpio123",
 	"gpio138",
@@ -1410,6 +1415,7 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp6_clk),
 	MSM_PIN_FUNCTION(gcc_gp7_clk),
 	MSM_PIN_FUNCTION(gcc_gp8_clk),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(lbist_pass),
 	MSM_PIN_FUNCTION(mbist_pass),
@@ -1521,7 +1527,7 @@ static const struct msm_pingroup nord_groups[] = {
 	[32] = PINGROUP(32, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
-	[35] = PINGROUP(35, dp_rx0_mute, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, dp_rx0_mute, gp_mn, _, _, _, _, _, _, _, _, _),
 	[36] = PINGROUP(36, dp_rx1_mute, ddr_bist_start, _, _, _, _, _, _, _, _, _),
 	[37] = PINGROUP(37, emac1_ptp, ddr_bist_complete, _, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, emac1_ptp, ddr_bist_stop, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

