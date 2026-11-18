Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981826;
	b=1C9C3EWTRFl8PfmCiD28seb1CeJOfn9FaGSdA2FfkvUr2JriDLWXOZ3je2k26/izf/Ke
	 U5GViNkKZ+iYNpwVikJ9RhRfhgKI0OtJ1c/Vje8WHT4Rz4s+ey643y6eDwEJI8GjjO7o0
	 rBkNu6PTa2gn01LyPMsiMT3qO2SjYlK0dT8m9cQe+MRo+FF9vcnBDfxrdJCbdYApkFp4i
	 wmF6u35aOJgC1fM6NzNL0ZxZcIY9meBeSbS6Z8rMZ/SJbSCAtWuNAG1y77bjaPzWCTGle
	 0xSbBcbsw6whCVkMAEax24ko62Wmg4Rp74ikKPQSrON/yUGOqBWf4VVNqxriDKl+3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
	b=dbXKY5ckSrdt7mg2DEddEUjfWMNhSiq3+BXJZ+mIJGbm7cnP/Hw4YB7w7UArDD+QyZB2
	 uU2dcJ1v+2OCLnqO5R9HL75s42zM+IVwsBmSXIQ8gQKoQldRc2B6kTKUQqcrEVHl4eXZL
	 SWrw3tvZAIESkq+RWsj8RQGT+iBmq0WVvPQ5eG8eg99dmAx+bUZt9lUdHdE9WyM6qryiG
	 jZLF+dDoEqVPQuAHRsJzpvMT1Hvga58hvezQEFqsuL8zNc03gTgdB4oYnXvrJFFL9v9XW
	 NzJFQ5nU8Np5sJVCqhxvbyoqhKC3FsY1TP3th5F7rvlNFYvWX5RuLeyqPvfA6l5PjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57929606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57929606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2nj2106344
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=; b=aNJMXADihIjrDUgZ
	Mgm6RCvO0w5BkQeqPTUTyYZ2DQokogfrClf1EnFLlb8MaBhcvfh/x/m4OY3rBZky
	Lgmqy448K12R1ragzJ3ZzS6r7474G/Gpj6QA/Kfxtz9quslqRhTp45sDyiqnQImI
	Uz6OA5lyXlacBLJY9nZ33Fj7Y5ZfdvfeWy4Zb4M3YaMxC/+X+GFVVBymrDuKJu3o
	2tBA8UiuCpJnHod+qNCcPlgALYlF0kEWiqT2wDfoye1W0guh6Qha8Vi47Dc5zvqf
	liyCajOmQ4wDsIy7vein2St+LJymr+wanWHfpMLVXLSvtNQK32yRL32roorwokcO
	glhCUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sea6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efa9aea3c0so7842895ad.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981824; x=1795586624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=OtChCArWhFcoQUBO2vUjXk36o+oHIWBnh1hEaWJIcH7/OoRy8n3W1j7FLPwROch9WF
         9/Xj3LEZwbgVAEb0gdOQThRpspO0MgDPKLsxCBkQIdIRwCxb7hpu9EUFDL/Wmz1uS8Q5
         uxqq72WBPz1R54bCpgtJsODBf5rA5iVIEuy1fGb2m8mYHP6p1TOVvZBScIgYVO9lagUI
         sKZIwY9MR/YE2Yedoihks6L2/ceCNAswzOHuqbppSERWlqo6F4P3ah2hcQ4p3bRDjGW/
         xwIfdfEC6POS+9jMJPQQcaXM5BfyfEg6wzVGopzxlwLRUQp4w8EOUYhIi0q6g6mpB0EV
         ldmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981824; x=1795586624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=2suIZvJKXhnlY3hGPkBxxlJ/clAA8FQ0TesoYKmBx1hwLcaqUNoAJjvKrPFXfG3z4z
         tD/5MMxMlIBLrXiKIyfrIbVo3eYa90C2didyGuv0ZLtQIwzCGLhIjhKLo2z8sD0CKFRa
         euSUPhbno3yjFAFSRD87/FJxjo8mXiacjF8NbyIu6395n6D6cwTvZOOjOHQgYnvNWKgg
         zvjSUZ2FKJ3eXDJe7bm2ZR4cAIAg99cSAqK6P/uS2BBh+62Tan8vDRpNUTOSlG9X+45f
         8g/ULfStvJ17aKURWVlIIv1sxLfS2IYS/KuC4tNd41EwHidZSEB7ChQJyQsdiXRrwLJc
         YBxw==
X-Forwarded-Encrypted: i=1; AL+hErEyZkDwoNu5khbayZzBC1ol0czPATQtPcMg/RIeQd19xlhFnvaOxtRSEmljbZnw2XT+dNY6Ivc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pH/aWjLFGuFVyZnhg2sC8e/Sp99pOWdslW+fYm0aBsPYSxCp3
	W2z1k0NGf3bg9FTRUqQ59R9+pkSCFSizpNK6ukY8Dxi3Ykyh64zPPPmo1qXR9oUNQXSJSs3tHkB
	xIQFL38IWlQgukq/TjxrjtjsCWdYiC0N4qWQ1oXmyXVgM5/TXgmfJMy5xio0=
X-Gm-Gg: AZFdTZdIA35+nLps/Z2gFJiE3oZoJoGjNnmlU8I6GLazILTytVIGQ9YnxEEFxt+m61n
	PHEBqDBGxjZqBxQf9CCLL3p0SZXt+qqNUS14QtexSzzmL+BcWx5p6xOYCyAw7obBJNSXC3eb2rc
	tvs5E9rjGIB4Au1JESoz8fdAicPoAOuj57xbahen8ArZTawMeCOKQ6wkevfGGw0DPuaf26N8neV
	+vEgVcV4zRPaqaCPjnF1+FFzRN8NlM8XLLf7UJH12juvRPS9B3SOs8u/wbIEih66wy9ghkS/rrH
	6AopkuAGs6C1rghfuHFthWvOZDGh8s5zSOGZa90VAEf+JorYT6WmdvPhKBNc2JUPoa7rSwFbbM2
	rwP3kEXR0UjLSnQfz4HZj4enbvLfpBSGTM0G8NnNpZhOGjID7KpGIr/I9qQHrUxcJskLjWG4etQ
	==
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745545ad.33.1794981823904;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745225ad.33.1794981823454;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:41 +0530
Subject: [PATCH 10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-10-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YuGyJBPycFEdn4D4XQt8-f49c4HIEDZl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXxVBh4e8BSrmi
 vnjqy9WKAMYGHmZ1PM+hu0B228FCauA7y/WpnymykA1IEl4nK4pyR6TaLE3fhO80O5X2eZZ5nBv
 R5J37cGOdz/nfV1nxQU9jBLd+8VHmmg=
X-Proofpoint-GUID: YuGyJBPycFEdn4D4XQt8-f49c4HIEDZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1zkivTQjFb9I
 Sfx//ou2bx3ybHsjFKc3wM/n3WUVzwbTScbSQsntZGPUmcwIcqFtrwjzApUGPnycafE+1f6nQ/J
 8/boM3mWEJ/a53SdBfANZoxAc7KXQJztYs/CYMDL9j7KWxGLB6xcqNWVi8NVmAPva0Un5CJWMTE
 4zwzbWhgtpuxNjS6l+zVLYyOviMdN6Yyje28Re/au1SxWHg6QUoRkGfECOULm26NjDbMihy6Wh7
 1o6O3D6iAJmnUn3qEhkvxiIwpgradJmkIgmTF6DHqwskeCodlyDIqIMm7rGz+gcLSk2IYlxo6Wx
 i6nACQ8xSANXyuhp4AnnXuzkLQolg+JVB/+4w+G9gdokDRx0vPbRaaTLDTrt7GNeGq/P6lz7Qvo
 EzgOBw4u5u70e+NlZBiS1vtoMXl2C7EVXXGWOss23bl3thbP9lwJX4RcJRNot15R9YPbSVVFhqy
 NBSymPJ1XtHh066SM0Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fc1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of SM8750. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index f27e55c088d51becc98d78a87b25e39da565b3f7..9bb280876431f6b22cabe4e9b39780f10494d738 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -584,6 +584,7 @@ enum sm8750_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -875,6 +876,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio77", "gpio99",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio64", "gpio65",
 };
@@ -1322,6 +1327,7 @@ static const struct pinfunction sm8750_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1485,7 +1491,7 @@ static const struct msm_pingroup sm8750_groups[] = {
 	[50] = PINGROUP(50, qup1_se4, aoss_cti, sdc4_clk, _, _, _, _, _, _, _, _),
 	[51] = PINGROUP(51, qup1_se4, aoss_cti, sdc41, _, _, _, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qspi0, ddr_pxi2, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, qspi1, _, ddr_pxi3, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qspi1, gp_mn, ddr_pxi3, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qspi_clk, uim1_data, ddr_pxi0, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qspi2, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, qspi3, uim1_reset, _, _, _, _, _, _, _, _),

-- 
2.34.1

