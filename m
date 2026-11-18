Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981843;
	b=J9dJqiE+d4r+2MKiWH4qIKgc8+nZdrXKZxHPAYu/+/S72wtFcjkcS2p6GekLFM4msz36
	 HFxYlWkGiQaos4qIUBLX5jch7OWykp3szLOZYt3EDPJ49RNJmzQX74k3obEioS1ZusWF2
	 pk9Cb3r9HzAAuvHRjbdFeEHH1+2p/+OcJoh7LVNeiHXOYqSehz3IgQkf1MyM19petILoW
	 VW2AhPe/tiz5qDUJpiCrKiCJDuv8fNdyaT0GFWHC+Wf5kNEp76vh9vw2Y7z9BlpcJa5m9
	 hrmnpkbU0AjhNva3p8x2dX3/lkpJlgKyK+psRuZQodlaM0BA7cpmD88oigZaauGT/Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
	b=vVAzuRM8JVwx6hLmfupkP2qffwaX60ldrI1FoiNtbe2r97b+0Pszl0avKPAa1xYKo/Lc
	 RFvlUHZGefbtx1u4B1DxYN4vYEveI+UVQ6NsEaekpR+KcfQBvwSaQbZ6NxQEStDpidaI2
	 sgwpccM31oIRyuyvUkXebZnPACracLvHlr+/S6Csyi024Qo9zpKqbezktunZy66Ud4tZR
	 ZXlhcFmvBa6IvkrsIyNU+jk37ZBXejR0WsoGiGTDj6ru4urXVOBXRNmaCkGPU3gTme3To
	 3UX+BhMFk8up1JGW2tn1/cFIU0qGpvYO7kmSNwPZOmDvqS9kTl8Zdzsa59SZKtnsqXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C2606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuwA1959677
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=; b=ODLzB9NzsoR0lNEF
	ZzoB+jPo4bPp/S9ZPjHgDQfiR8lRs4YfiF6K9wgkdfE4voD+Tn5MEngRfXWG0OEe
	or1JoL3J0BO/86N4h2fmbMrFJRDgePzcDrEuq2ijOLzMqW9svSyq9lFl6lqaTEd4
	jR4pTs+yGsBh1TOg4LYOlZuaOZ+esBe/EDvHHzcg87BnYpvsJt3EphedWoFfupDD
	N/Xivm7+zxJQcIXXaUAAzHRs/DnGddEYiE5TKrO+mfUE/FLWPDc8xbD9jbOEpCJL
	syPP1P8OLo0Tx4izNSaskD+SVptgji8jo33RwaXQvZOuSeRPN16hEeN+mFvw2ITv
	6rGWCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hf21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:04:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efdd509c6bso8232165ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981842; x=1795586642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=kKFJ1+8p8sfR5rqK/G824nBJF6Lwj1LHFDtBJbRxlL1Yxo7VEFIDJ5HH48iNTnqzK7
         bS6qDTcPaGHDvTwbKOd+1M/RCOujeuJzBCUkBaxNClp3SWas/mCde04S/DavsrgFAR8z
         K+ssWDPEswSu7Lhscb77VcXtfjuiMFrCFT0U8n+u5JClNSXZYOX3TGeJQaUaudDzM5cR
         WKDj4xXOQTGHTPOBbVsIroR3JVjl7J8m3lDqcawv51DmVI/8N086UHp9t6BFWjKB4Vc3
         3uEWmKwHU7VgehrYjcWshcCBU8hWI2jBlhYV4UdVkJSZjfydfV0M9RWxJx8L7KsbRg82
         AOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981842; x=1795586642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=mTEJDopszYVOOoHPCxDJBXiEExAKXeXlLoRxp0MZ2EQhzJovSbwqrJyIzATTNSQF36
         02LcqUI6KkmJP5QcK6PevGSFnMTURptsPZajgCrtjhLF60eGfbmLJLIM/DRfzQp+eOw8
         FKu8hZ9AG/PHJeMEcV4oxUUh0zfFir1QwDCnkbvfJXWKVbqO+jqo+LWwdZcVqmA9H+X3
         7MgswT+lWNGlzdfqqcuDLlPs7XYpM0lQM587K7yvAg5xMBNfXH/JB5P+eru/0l7ErAWU
         BQdjLrCEv5u4zmN3CXK7r6cKeXU2fDWzzg+A+H94Wx4zVUyUi72txpE85aFeSDLQd+wY
         6hSg==
X-Forwarded-Encrypted: i=1; AL+hErFdSKIdI3j8/vIid0sah4ZM5bwA+i02DWwbQUmRqKY1bDDUHSBoeOO0cLWhuytaK9mQ6zwMCyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eK2XyC8pEnQroJV91o9zxhPSbrJaziJmmtOYaQS1nknZ4Gg+w
	on4Yzb4Kugou76tVO9MngbOMaEMQ5ZeVEO502uV5sRj+pv+IvjI9+d7tUJ1DazuPuXA9b/8fQ9O
	P7Z5poHjffPH+N5nipg+xoTaDzKHNf1EpJkFeCqFr8D4Bv39K1LkkUWyOJ+A=
X-Gm-Gg: AZFdTZft3HGC+mIjMWvVbcUg4HsSjU+wefc10rmuO612j7ze4v0vdxWLMXp9Ch5gpt+
	OP+P/rgNhAInd2aQbsC9/7TTli95Tcl9IaHpwmG/uiXtxl4jIUQjIDdlBBKNS7tbYElv3ISSByt
	rAWL5oQvLvo0fh7AhjSZonsWPtEjpNQbbdakFGOOmbGx1NOTID8vWxGNVSrSNFdV4sokjCLW1Nz
	fUC5+uCElpj+ebpb11OddNAyMCzGAZ8RpaI2e3kFIfqC94Twt5cr+goj6YeRSc0KuV8SwScNbHg
	2T02ImQ5q+JoJ57zNIb3Vw5fDSbCtDFSeIWKS5euh3RUCz4eVzTGZc+l2EaOdAonoJU2rWj1Nrn
	vW7zMhLtsueZwfyEWR/VyHixRRT0O1AyRivuQu2EVasXUEb2GXbETcGu383ya+iOBgfkuPPac2g
	==
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415545ad.53.1794981842031;
        Tue, 17 Nov 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415195ad.53.1794981841573;
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:44 +0530
Subject: [PATCH 13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3fd2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 8VmLQ2KntnfKwIhuW4Vq0SJLaAq9kfzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7HC5NgRXp/p/
 gjggKNEmomxbn5TzZ8fu5UwaaVYdh0LUnoG6+Y9OkSKQWhbl1oJe/W7t4I+eSWC6hSu/cACk9AN
 X3BclSfLMGkVJ0K3q3Z9N2ii3/DlZS8y2CweQ+/WH/6APpSFNwnCnrfRcquDgwXxxITd2meeyGO
 sFhLkNeUFXfZUo+TC8mMPfwtytITCZEkYtZa0r4Prqfn7zlillS9f54Mo9XGGXlbPSN4oB0t71g
 Fbmb7l+w14WLNkLWKsdxDQzjnkL3nbD4tQODN5VPxGWDrasd0ZH2EtKezRpibF88oDMuEEYhRL9
 POALN3y4Ieg2/1a9rNE4H4iTnLp3fVntpmbWWVj+VCMOyhUDNTkb+v81Pcs78JEqGVhpDfysH/Z
 03GwD5YqWnuKIFoUKqbCsDz7uQX2FOFfvgRjNKyj9+Il5RQD51Lj4orN9/Rk5mqLLJ0G5xQv97J
 x9WRw/p6Ic5iWrnGbwg==
X-Proofpoint-GUID: 8VmLQ2KntnfKwIhuW4Vq0SJLaAq9kfzT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX90wHjpt5UYxE
 A7MPjvgRv3y2WFvtJUOwy1gRYV9lMwRnqbA7bBYvuimZV14i+9hOnQTjfCjEN5+h0r/LxwBYpzB
 YUvHtB+giVzQyfRewsJ5m3e3DcijdsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Glymur TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index 2836a1a105798a8bb5a38244f7cbf8db350b755e..6bb572640256d3cba2a6dc7571acba85dae57440 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -75,7 +75,7 @@ $defs:
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
                 eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
-                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                gcc_gp2, gcc_gp3, gp_mn, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
                 i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
                 ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
                 mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,

-- 
2.34.1

