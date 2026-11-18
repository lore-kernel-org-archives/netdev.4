Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981857;
	b=1mpkD7b9eA95Hw48gvsYvhDoGQJ23Qr6BOK7vN9hqFb5ly7AAv5F3SdV0PJupVfzAfGd
	 I/DpLwFrxE1sGAm2L/AtS362OA3DIVpL70iOhPK+XZ1DbN9uMbQ/sF56OCgXEwaf0+t1i
	 gDuEEGj/SNB9GbEqUuhIajgj/244PE+OJaR4TqKCQHELDXYQLMWacFcjqFhkoFKJDa7Zc
	 +wdvyTC9xcBbV/7069U2TqPQdldohRHGiV/n0MnYlKZypRr2RdJ9c/oNRdjBpqvwvhpL6
	 YytBd0bOSsqMnEvdFNAzASiFPCxfiUo9Ets3W4Kjmm+2MNFRCgXsZ0R40heaMYrtdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
	b=tVOvAUGTOeourHERGjzvXK8siQhht8svEM28C6nNdgkOLCRj5v3htGYmpgCTX5Bhj2Kf
	 DOuK15IPFL97AJ6yO5nIz1LU+UImZUdPgX27qlvS6JkC37MBv4wUZC+nHtqDOVVHlQoTY
	 nafnyVRhItM9BG4hzFLfO6nlhD8LqiCbMabBDDhIf35g/UU+jqBVBfq68C3Rt44pxMj+N
	 lHW3tbhCFWgo7ngtojYQaZgQdz2CEbARMbV3ZMCcOUwi1VnFn/XCQ+l4IoljX+TMnSixz
	 lukKvtepsDPVTQEmjORPo6rg52vwfX4jiHzdQ2h+vzaILW86Jf3HLBstNuzth4YxNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A51606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A51606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3482453769
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=; b=aIBxJlhBUfMCdaV6
	jD8F9K0/I+x6B19Hzu4zrUUf7D9lennCZygcKOdXpbPaqYe4SdJsJtgURwwevFQL
	kAvVDvFZKFEtZFZ5tp472eDejH0FE1J+oDew8yfZihjGmtZj4o1SUKvXDd9NPm6K
	d5KtqrLsZcNAqg4yorxsagrzndxBKybpSiw83F2stPUR90/pwLvxBTCKkcSoY0s0
	rJR3B6yMTHgi9MG9wJ0Eu0eX984DW0mx15+T0FNJY1qDhH1mD/iXcMaMoN95uwcT
	ig5kkY6zAlMbTNwsY1DsnrWN1qchn5n6YF8DUMZdenfO7lxuDhHNnBuvunGLp8dh
	4y6zMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99euf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb5375cd68so6484605ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981854; x=1795586654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=WJADAJ6oMzy0/U9oV6a5LodDvgwvaykgFSTFK9y85pZovcLAScxNihkrIOP6m6Mc/j
         obZZyY60bfJY7Ulb1Hge2IuGY7Pv8WpIOR4CmjPj3BollB3yxZHDuWsLCKoUYRfuxHjf
         4CisZ+dK3/QvWea/hbH6BK5M6TE8QJv/vxzW57fGi17ragUuCS/cUEP2i7UZgfDOuhy5
         bjqUE/bVgaeIchk8R+Q1IIFYMTlr6DStyyxpE9XBx2mfnVaCYg8p6WODU233lgbXkbZ/
         yEjGN1IpXA1O5dIbwt1nhhSKWukNtBX3MGhOvDHxFASGUHIik2uSAwhLSu8n76h0dkTR
         x8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981854; x=1795586654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=nhwx7AvIwKV1sPhv09SHBtlhI4dznvXPX8oqAFY7pWwKjODzhHtonnlZiE8qdeHXXB
         K5aCIrFPIXhm6XVOJmMg9FL2IUOdfJYo0sEUNtT68A4jpfVdNwpSYtOab8mPig/a9gEz
         9SktkuGqXxlLJNQokeQibdfaY0CaGSr1vtEmDbyBkRqUKN4znePlHqsWUo7yF/OjU0fO
         ypOocxdnPMrzDKQvU3gPiz67dCODiRAT32vY41sNOxqLP2m+QjDxoc/H2I51z6+q1Xhv
         wBWyZwabTcaJVKaluM2ySzTEY371CFRzB4vWqt0cpbi92SzuiPBH7V5AosMCqelANvR4
         cK3A==
X-Forwarded-Encrypted: i=1; AL+hErGjpjIbWw0emUd90aki2MIpNaDwThoQDKUHkbCCydcgukOIEUd52ubX+zhuSsAQyX349nbft4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ri2m2SjZ1EADd8FXe/LbNlsN/5gRTj/YSKpBeEkYPGX1vhUc5
	gROuw3P1ZH/NvjHPlyyUrsWjy9wMQJBlR0AxmyQY8bUSwtASV9yBv8eeJYKa6g9SeqW0Kd3ifLy
	Rtz/bNzlT9lNy5WyxaHVDNMBIqWOAycvUvljLmxznutN5yLMzBOOkTzaRIvM=
X-Gm-Gg: AZFdTZfPLGcUqEWIWoKAttasWIBw/RVnLBiO4NC0lgzHxxNran6UHolUg6VP+0YrvyK
	Qmv/e/NdNlnIB50aO5iDnfIhivc71fXZUbw4xv6DnChOhk+WkK2rvjGKKntmlbW1veJy/wYFf6h
	59i4Dw2+luc2DapmaTo2C+4pOIS1dc6PNBaa5McEmEIuQYJa9c6V/LPyR5cUFQ2H4zoc8xdx/Hn
	vy6EePga6hAoVqGfCkOMbRWT5wALLygU6x3zkXWk4ErBFl0uJACEh7GRAORDr6bHbQKvLoLgXxV
	Ql3TR2sxKX2hwi+qlmsf4aidqRnKgJMwBXy+gRp/RwH5YsqpeyUikJJvce/VicfTkde/1OBBO/e
	D68tGvaNOe7+8pEHqeilADCtydS0NX/dYEAlqZmSAd9qTvWf1+McJcCXoDWaxbboF/L1u4n/LQQ
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933585ad.63.1794981854177;
        Tue, 17 Nov 2026 22:04:14 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933295ad.63.1794981853715;
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:46 +0530
Subject: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5Rgw2kquuggt
 WAIvf6EO3xN2+U9DMq9eBnkPDkRHuEo+A3T8xW2wripq8oHLesIwk9ldZbRdEflExWrfXgCKFst
 FSjSOBLsiaCdo+NzZkKqg/AteC0QXNY=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3fdf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UWeVNdHasT3lCgRpUHEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4Ab83o6AjK7g
 AH0KF22uaUbp3SP2Q5xPkcVZNTOubnNf9uh85r4BCjgVFn9FmJvsLIrOXIrHLsGUmUaQI8XCdHi
 7OIab1BoCSz7qtiWLJIbdzBD3CuORU4z/kgeef4jM+h9i5Kj14+5b5HiU+9MCtAx+oOmxOcUgDT
 UWgfYspQ2liGDemSREFmr5QnU3H/bFj5bBF8cIAnpkjzKOQGFmCVrJd2BJs/i/nR5NsGvxPvG3r
 GlzgEC9Rubct60eGr9JF9ecEtydPxDvb6ftv05rJcLZ2e2AGY1i99rwcMqrNnespU3Y8lGhrNcj
 yxqwSQtD3oQ48JblxWwZfOtS2wxwQ+ORY70P31G3ybJ3q/ICmQ3P+1DJiIAYj7Rxmt65aM5/mqs
 W4BIA18WXPi03IgnL/GTbpboVjRaPFJea05NErmY3zSRK1C3kmZuyuT032gdsd5XWQjJGzLwYQL
 y20uUpw+ELRPFtgjDYg==
X-Proofpoint-ORIG-GUID: QKFHmpJ3uWF6JXAw9CmzoaJ6vC3K3DGi
X-Proofpoint-GUID: QKFHmpJ3uWF6JXAw9CmzoaJ6vC3K3DGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Shikra TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio87.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
                 dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
                 emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
-                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
                 i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
                 mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
                 nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

-- 
2.34.1

