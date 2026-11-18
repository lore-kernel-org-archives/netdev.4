Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981862;
	b=VOBu5z61TZsqwLvK2diwfv5ECnaCy5vncrPZzvFpKOg7lSIVbAATULowp2JWs4paWKXW
	 H3CxiHfoQjGBhNX6iYwKRIYk5PIRS+cDxESLTisx9cVVXmVmuZhHsiuJNRtqtW0aTGLyc
	 Hb3oRU8uzGREerzOAOJK4ilbATaMj0T1VfOa5xMx809SYf34Psi+q6wuBgvuvulbfdRFA
	 xfiiNzJ5tnNmR9+L0y6sQw9uYt4v6UIynRZueYyfMJCUTLHnZMdV5slcSNurYx1jTNnX9
	 dpNxCSzN1SNSkZxBsWi3Nsits5u4Vmo/3djXt55JqUSQBPdQwPETnLiwwA3hkAxgtjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
	b=gsxfbNfsgGWioMFxoVoZzls6rnPFo7BZ8yhA2hhAOIIh1mzwCk8WtfdM7B7U4oqBznU/
	 iNaC1pQGoLCJYtShUMDCi5QkWc2vd0SfGrziaKCdu8hub1WX5d5gipnc/OJCqLdG3RwrY
	 3mu9AG+BCRmJiKByQT06x1jOikRrhCnQZboenMFRLrX0Sgz9v4+wyOFZ8Yc40hCj9z4zZ
	 i6ABmkXM9QRLhWh3BF3z7FEDS3K95Y6wrUvkHq6hq877S15qoy1yqA5xI4UCkkbCaAA12
	 R7h3xNpY3uKJkKfd1ZyGxWKMriL7LlroRWopPiXrgwSS4PzZtzERrGjH6eSYlR9vZ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzvZ3Hc7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvFB11KD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4B606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A4B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzvZ3Hc7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvFB11KD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Upib2383028
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=; b=IzvZ3Hc7sXEM2y9w
	B22i3q526s2eXREC7kxz3jbD5rEGH8XIfcKwHa8detlRbx2BTRfjyAgHQXWLYW1v
	rWQdxbPMdJf3QnUZT+DD9c5XeBERiG5zJC9jh/YJAaHZ59ePld+YvH1VTF829cyF
	SpIme9FDRytTX4G2ErhWumnVPC7sp2wHjjmCKarupF2zzW5unckiA5iT6pIqkT3k
	XNmvjextAoYrYhaNlXk55hr/3mjQ369lv6r1gNTtXzQU0I16cXRpwNxDbgoQUcGm
	5GkpBFSFCEQGiokx/KtbCJXN4oJTbwE4eTi6Rimg7qjv67Q1e6DfoI8+6dvR5iYW
	QJQFLw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasgdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed00709df0so5698255ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981860; x=1795586660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
        b=GvFB11KD/TVzLGvtw6X8tCBXRqE7F8u74TxjI3n2yGgyECQT5LbRZxi/ikT0tKrfgE
         ZJ+V4ohzOrupaf8YJNmlwpZJgXHNOzP86FjSOW7QfXaeA4dN2cA89spL+ou6u4yWEPGR
         XPVkHoISL0XYgXhzl/8Q8aMAk1cKUFV0cMqUuvfgAq2i8jzsmjU13aV9TA3K7I07QT3L
         PxYpuHxmPwp2RcrFzii8oj7LEoPQ2QmnfFy7kIUGj2Vlx1PEjMGoMpE7I6qbue9RzIP0
         3bUKMg2b9tFtrzvUOTz5C5prmXHh0Vb4JtnB9Fa4dD7HVQU/z9CRIbSZCDW4l+1lZPsH
         e0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981860; x=1795586660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
        b=Z1v42KLlYvwQ4lpChBjM04DWrPpGG8cazHw+X1R9E9v7yRpCSCwk9uC2eefjVryIQq
         K19gWhbzzzN117K3oHJFxokMA86CitCiYtKHk2z3b0J3Mka5+5njDpjjvNUq0W663F0h
         O2YL2B+gwvGfksRPe49ewq+Iy01UOaZ6RvyIYC7NLjbwYody+menJdiInEhXmWCzodmT
         LH3NYWsp0C9XxVF/3PkK0CcdynJDup2+D/5xEKKFyeqtrXh+5R+sb22CoPjJaRZfxDN9
         CaXINGiTC8XOIhD3dJSM0Zqv4TA6d93+bCNSa0t5GnRZixhof7Fui6wtmmwkE12ERepD
         YIcg==
X-Forwarded-Encrypted: i=1; AL+hErEYkIIewMwAdGi1z3Mub451dmapbZYYro992qemGv4+7Zt7OmA7PT1lJ3iCCOsn1qCKa8CgJBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qgBZnioSBJHC6rBWEqfwUoLrx/X3VNFK98aPAY23wO2dsFbdK
	7617Fk2aEMGcU2NbPT4inn8k/KVc6ighSKa1chMvDVMlrb9lh/MRvCZA7wTVM+xTYoRoAVH87+n
	YqRoYpMvntipqJzHxGUUaOve9UCz5RQL+osYfSGTP8JYVm0kUW5u9f5AwA04=
X-Gm-Gg: AZFdTZe/hOvJyUG//vnCtc/ymg6rrwZoXeejkgoFR/y1wI8/8ZgHM4R6MMY6JSXemrs
	PAQ5RaLD6OT2X+l/JvN+sinUo3JoqG+JppEFXaa1VBodoVbYJ1v1UcpJxRA31RhGhe4EDh71uac
	HUuwYI9dDRHgM2URY8yvGsMP4SQdt76kz9i0Gu1iCDJczGW9oAAyJyusmjjhXiBPwmX80h8UqAi
	A59E4LIkEXOH2z8cyjX3GhtUlN1WRNKiv9iuXwH3q3LAjWasXNA+O19VRUrHIrDACdgpU/2GBLy
	AJKD2QbPYCDZnMFCoP+ZHwNnmdtOu64dd/VXIM8AJSu3X37hcl5PDjWmsAQUP9ZlTpwYFR6fPLF
	Vu1V0zVJ9swW8poviBs/bk5TmhmeUk6eGM+JV5UOpIwazjRXF+iKAdrJBDURsUfcTLG9vviIYRQ
	==
X-Received: by 2002:a17:903:41cd:b0:2e9:9a19:c4f with SMTP id d9443c01a7336-2eff76a8118mr15550005ad.61.1794981860192;
        Tue, 17 Nov 2026 22:04:20 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:2e9:9a19:c4f with SMTP id d9443c01a7336-2eff76a8118mr15549805ad.61.1794981859733;
        Tue, 17 Nov 2026 22:04:19 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:19 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:47 +0530
Subject: [PATCH 16/18] pinctrl: qcom: shikra: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd3fe4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SNAIMBdX3Vl3zSUm9DOe-TNiYW2n-U_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX6u/AfZ9AGVWy
 JMHCvl/3awD64kLgVMgA7LvTavWviWdXgxS0DK9kOIy8NzodqRiWUU8yyJ16p9/t+oNxKvjd+PQ
 Ff5tdSbIMsqxp3Qj7UfWQKQtmJeVUxcr8mOj5fbfVx7oFkagrKrF2Y342TMBSummDK2ZUmrbqOL
 b31iIIIMH4iYfZA/EeB8jB9NQ3xwhYkgclc76W/9HmQPfO/acLqkMIVqnQzE6Snb2981wFUjLI7
 5e3cipr+gcCIalefML7l1zG7de5SPUsYsT66/xD0YhLWsRa1Dv2Cz6tpPsOSHqUWU7l7KzGz9mf
 axA2FW43vWdht3udpWscwPuP9VuJzb71ir4+VK/1eoglitc1FnpC6aLeeEIKwx9SWJ6nJ5ghBSo
 FkZ5VZKaNmxsPDCvY9ZRBa/mw0PcPNYUvkoS+N4O/0QR9Kmb2xC4cZl7LcUnPpbTVLcor30KV1F
 YQco9Kc24n/6b7C//DA==
X-Proofpoint-ORIG-GUID: SNAIMBdX3Vl3zSUm9DOe-TNiYW2n-U_E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX24DAkF9AdvgN
 A93UHSF7J6G9bdLVdZlF6n7IBhzjQTi0we8rgn4m23oiJYzX6sutplpBA61/r7vn4rtNnvs9FNS
 K7SumevNm2Gko7l2zzJCtwlJcQuxe5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio87 of Shikra. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-shikra.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
index 55aec2f675e6b0953c6a7ed1d9c33e85a47bfbe3..c411ddc48440db732712220b57be6ad1278fafe1 100644
--- a/drivers/pinctrl/qcom/pinctrl-shikra.c
+++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
@@ -459,6 +459,7 @@ enum shikra_functions {
 	msm_mux_emac1_ptp_pps,
 	msm_mux_ext_mclk,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gsm0_tx,
 	msm_mux_i2s0,
 	msm_mux_i2s1,
@@ -666,6 +667,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio45", "gpio53", "gpio61", "gpio88", "gpio89", "gpio110",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio87",
+};
+
 static const char *const gsm0_tx_groups[] = {
 	"gpio75",
 };
@@ -945,6 +950,7 @@ static const struct pinfunction shikra_functions[] = {
 	MSM_PIN_FUNCTION(emac1_ptp_pps),
 	MSM_PIN_FUNCTION(ext_mclk),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(i2s0),
 	MSM_PIN_FUNCTION(i2s1),
@@ -1103,7 +1109,7 @@ static const struct msm_pingroup shikra_groups[] = {
 	[84] = PINGROUP(84, uim1, _, _, _, _, _, _, _, _, _, _),
 	[85] = PINGROUP(85, emac0_ptp_aux, emac0_ptp_pps, _, _, _, _, _, _, _, _, _),
 	[86] = PINGROUP(86, mdp_vsync_p, mdp_vsync_out0, mdp_vsync_out1, _, _, _, _, _, _, _, _),
-	[87] = PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
+	[87] = PINGROUP(87, gp_mn, pwm, _, _, _, _, _, _, _, _, _),
 	[88] = PINGROUP(88, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
 	[89] = PINGROUP(89, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
 	[90] = PINGROUP(90, usb0_phy_ps, _, dac_calib, _, _, _, _, _, _, _, _),

-- 
2.34.1

