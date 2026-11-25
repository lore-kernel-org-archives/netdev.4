Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603786;
	b=tVXpPLXw+/P3VRBIm/OgPOZgmjQEgrFY/n+jkViMItxyZSrAMSbIu58snVK/Xs3JS5S4
	 kx3qVumIdDtLWA74hQQQ9vQcbgMkjC8I/cnBxqTR+uNZZ5JDJpynOQqgomeDpgIsb6EBi
	 Ek5EY9XSs4uE9AtaqrvVdftupmwh/Lw/NLpk+SHFOGz4H7Fw6G8mDlT+9GYBMCzseZXpm
	 yYf8BV20oC7lW1Vb5yUpWN62Tfs1FJjlrITTS/0ScsdZjVuxV2DdUozGFfx9XYSzF5CCh
	 1XtmCn6xpelqXlZJfcqrlxfPTTCZn4GwU5G+9+UpH4fVHFHozQy7L1edVhjN1jlp0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
	b=VdRqLn62lnBV0cpW909xCmcmAHt9IglDXvTS43cTjCIe/B02rXSuZU4ZJ0yYxWx2Ks/K
	 ueuPR/qdulJcwFvBEiEEQZsGe1kgHsApqa/08z3aLzXXJos6uLOrALg0YNvPq3a37wDz8
	 0gPS5WzcSU7SJlS6sYZFp5PW0ni8BPyDqkbF+qSdTQgQ7v/Lb5fQ1wwgXA4QF1iyV3C+4
	 Lxmr/fUNgjahBN6eBpF7YCQ6AQussPFLb0udPbqFQrhJGFg4zROAuRL0H6GtBlhxNcT/g
	 PIeGxoHDAMLwK5Vz87WA1tN04AUQwlZjkJ9gIBb+0G7AxtpZnHbqYBD58CTXbf7rn1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HsoW/V8C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EHdRund/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA0606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsoW/V8C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHdRund/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOS3555534
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=; b=HsoW/V8CpuiMFw5D
	wLxNlxpk95W9vXffWpDy80+NWOF2t2SVcVjn8RUZOrz5oMIj/o1yewb2CNMNYcUy
	ybed+vv0a53bCLRiENwkqKSrYe2iKNnSLilwpT69/6m1QcLypDATD/jVxe8IzWKn
	q1Fv51nA2QwMoeeKCs5RpUD0gNKBxx5JNPHQ87KlqEAUjHDmQnWrMhcsJnKZRUiL
	NnU4mQTpSzXaxdv10x6HC0uiFBkwkbb4Hg2JspKZ11qb++8/7TET01t0BwW5zHEP
	4vwgGo1wngVXrWgy/ay4dFl0Cpb6KflzJV0DTG4mOAii97nduYerZcyVdi3kEfh8
	V5IVbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9460411fce4so32638585a.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603783; x=1796208583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=EHdRund/CJcF6w4AGXIYhwxuzOyYvAPHIhF5UhkNeRU2GwX9EGzkonHTvRGkJq4oNN
         WE2tDKUAsdtnY65xSyp6uoboApClU+ujU335geC2nVWxjOZ442B4dcf5CbrNBRtoElDI
         XcTUS6u20wqxdKqZKd03LkrZHs2Q0sAj09cxhwuam0B1/1HegIyVeA2IpQLw/wMXT3cg
         8LJLSIZiqrBMIIgrVZX7F4PsLn96d2I8kRDdXBI802mOgitUOMJIWfAaOWyE7IhOm/j+
         WYL/nkk1jdPbtjlvgJVIr5AsuVfQLqiwiajUBEj7aAhEwuuPPyyQfcyz8WQsTAReji6d
         zPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603783; x=1796208583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=2pdHJVPQqI1xxnmmyJn/oULAz3u9F1/7hhE8serhPxrnMQjGmWAx1fbAIssDdGhSJv
         73dWPZHkNjBsU6vTrwFEedVveBxHfrrQEyrtY6qvapXn+gm3Vv942sBwkW436s1RLbsw
         5ydoKXsE4KJD6yGhzBnaK5Dz8sHNnqXqezAA3mOsv/LkmKkIGh5cGCGAoEctRh9O5fvB
         ApYUr4H+H7RgiECB7YLdq+UlHp6jjEFPORmxqlnK4xkp2kQJlUNkszqJc70sAQjviqsL
         8My4IV+EKbYsRi6kpqCEPP1eRr4AWw1In2dxSpEkcHrdS0YLI4kx3S4kDW6IZ25ElUx4
         tQrQ==
X-Forwarded-Encrypted: i=1; AL+hErG9qMH27CmkNT1qsY4FRBXgIy4UsRlaAJ4WjjGctPC/nHnvFgvs7uc1tcx1Jc2Z10DpoqPlfZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z96s9LH11XsiXuWeiVYgAOSd3zaKCnmMp+dW94MW8I15mjLNG2j
	D98I+9zELVL+C7ySYKjTcHlrWXpJDCHzr98vsYHM4JdewbmOZrf6PfV++WtK++WPUJDNWcaWQGD
	D3cJeZdkl1VomA71be4tJYEWP8tWxEDfJ7H1MUKK75hLsQgQ6zwV24RkEDrs=
X-Gm-Gg: AZFdTZde+sfeBULRQnJv4vrfLHtedPoBeBeFz873aRSK0vzOdVUNn+05bztxgQ+vFT8
	GLGXUyvBItc0E9+n3JdcpCd5hH4exKD3k35w3+lPm8ksLHqXFmwc5memirqhcGQccoo2D72artk
	q/WpvAK5vOfAG2pLO9HvPR+o87E3roPvAUPyFZseJnHWJ131vMmCXBRNbAsxkRAXJb3pP+cHIeo
	SvGf8i8GJa09cy6t3BKKnhCa291zr5aGX8tfEGuwO9yEjXRRP3c2bPXqpJ4nzEUi9MI+O+K2Dtp
	dCsEGDiSUdgWamFn1sjIOlMbQyRer+NSBvb95H5STx1Zi0lZyogzL4Ssry0ToejHcyf4DmxpIU9
	ZnddwXMoSETqBb3XkSFbzhgNPQkfu2Ijl/5GJJfokjjCRobBJpW/I+KJgCRcohn9jAOsw1bc=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323737385a.2.1795603783396;
        Wed, 25 Nov 2026 02:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323733085a.2.1795603782968;
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm618256866b.8.2026.11.25.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Message-ID: <8fa6e8c9-213a-4af3-b1e0-9b6c3aaa2821@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:49:40 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: ipa: add SC8180X (IPA v4.1)
 configuration data
To: robertijtsma@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX1konSjo21DeT
 IfMSQjgsmtV+bPojVh3J6KqgrcGcslA3r4fq/uJwcT583RqFFRL5fdQUMyOdICIutF2uggf0elz
 IV48dPzMjxRjdF7cG9H1mlKarCU6ArFjfMP2yEnh44xo557yulohI9nOdNY06ZW/m+CSTtqiWrl
 FwM3+sZ66K+4BK7FK8cICbOfGhV/fgNpymNeQZg5ov1/YVtzJZMq/wGQJNMUvlMY1w+UnogGNCQ
 QI3Z0VxB1IcrbHFAukUcUokMFQLXbWqMAn+z4/Ht69XhialJ70Hg4BAfDebPkdhYrL261bhJQ/G
 3ZFucdqyZupoKzcsVZv/nQCae8xreV/vRg2oprWJPei0cfuuAgHZKsTYf+19DJ33dUPV0m/g8Jp
 /HwXO4k0UbwJp0JhTfScFH6EJ7sozY6pn6kLKaOF/9MOVSo0p4+QGT4g87f03E+ndhyLM2npMDu
 uYr1B4J3RvEMrwFKJVg==
X-Proofpoint-ORIG-GUID: 25q_8pfe_VvZEwiVDYE9zu4XJjERySEF
X-Proofpoint-GUID: 25q_8pfe_VvZEwiVDYE9zu4XJjERySEF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2cbc45uuSPc2
 GvbbiJVyCQay81ID365T034kr9i1XXS2YK2rs7+AY/XNhezHtb4X3NSu/wHGg6xmrUkyCyy2Vdh
 +fIqpy4UETFtaARSPqsqSuVBOseDuGg=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=wqfpHMpB0Ti-P-UBA1kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/25/26 12:01 AM, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> Add the SC8180X (IPA v4.1) endpoint, resource group, shared memory,
> IMEM (0x146bd000, 8 KiB), and backward-compatibility configuration table
> (ipa_data_v4_1) and bind it to the qcom,sc8180x-ipa compatible.
> 
> Register offsets and endpoint/resource limits are derived from the
> downstream Qualcomm msm-4.14 poipu/sm8150 IPA v4.1 driver and SC8180X
> devicetree tables, adapted to the upstream ipa_mem_data layout.
> 
> Tested on Microsoft Surface Pro X SQ2 (SC8180X, Snapdragon X24 LTE
> modem) with rmnet_ipa0 MAPv4 and ModemManager qcom-soc QMAP bearers.
> 
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

[...]

> +/* Memory configuration data for an SoC having IPA v4.1 */
> +static const struct ipa_mem_data ipa_mem_data = {
> +	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
> +	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146bd000,
> +	.imem_size	= 0x00002000,

Please defer the imem configuration to the device tree, see

6f82cb4ecdb4 ("net: ipa: Grab IMEM slice base/size from DTS")

Konrad
