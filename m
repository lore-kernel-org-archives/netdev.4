Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501941;
	b=ORgp8Hoqp40AoncqNdvhhy3+DooWjdrk4p0KSFbMTc3Tw8SflIbMADH/Q5W2fznaQCfU
	 /IG+g6gbeKNcC5XMiPFlRX9LmieGs6pcl9pS0U+DPDTE0jpa9Fy7IqDcq7EueqSf2LTH7
	 pK9WFjhrOHPSes/EeLaxoby1XqAd/bKN+sFDBGJ2KxD6TDZTyNz3BbewIlxpIP8YfFqpC
	 0IDopDW8xIPYQ3q3YK75MZlyJpyRm7k6o0HAtYytS436B6kzP2cRbrTk9pZpYmu/hVPCp
	 xU3jNDcN4p8or/BRKgHp6E7asrljpkuqEvZ9TgqEz693w8TLanJuXm3AcwlFq/cs6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
	b=KWXGonMH6Id1zSMF5WCbzb1jC1mo+T23mb/FieWXiifA98jnAVGVi6no4ekGUPQlI72t
	 v95FTesSEOwOFUPrjYh70+I80uX6WwRrgQt220mKykhsJPZx4JndaNiWaz5d52ogksoV7
	 +ac/21Nuq/OE/FEQJniQ8mHveGJ1XCmMCdCpUdDJSD+hcFQR11BKO3sfceqkWSId9qjfp
	 YJD7UE33a76kdhuugRxr6g3M35iauJT5JpfV+MaGpLz4ECpDZ8Dy3zy69GienVwaiHGlU
	 xr0bcd7EnaZdTmS6AgsM0e6Ntky1tqwBkzYVnahZgOtjSInPOOtVg1HHQAiOf++C7Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goEHkP3k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWBqSVwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808E606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9808E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goEHkP3k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWBqSVwf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kBRp196993
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=; b=goEHkP3kdmUrkhXc
	GpmDihzUnnvpWxuXOAhv0cKQyPTuR14teZfWtsvcxAt8w3ICkR9cgGy/iNNwCdxV
	EINOj2yu0yTXxqkduUyJeG4tKxxc0+8DTqMyOxMam1I5K/H+5V8mqQx2uDjuxAtP
	f+uCfag5q00jO/Beud0HIo0rLcGPug71DIcDVvLvb3DiyrsRzNFkchpHneqB85de
	vUty7QCxCTgCXkTA9Oox9+XEm9zDm1ORjhPcKsPOvU8kvWShM/9Eh3MOhX1OTcXv
	oMdnZT3PgdmBuoL5q6TgNkBZqSRzqdlIf/DKlpmNGeWDRUByFIMR1nBPaR8prs2k
	FxBkSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukra5fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:32:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so4996982a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795501939; x=1796106739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
        b=kWBqSVwfS12PNVHOfru+hlrW6f5fNbRVeT3pdQaFsYoO9A/x7/TssBcPYmwxLPsLrV
         iiIrEgkq9Ay3M9lGQTP39xU0fdwNQLldVOUe2AWw+7M0kWjzDdyM/2iZ1J3PrxMJ7Xq1
         /XP9plIMUwhNLumb4KJwHUtaU0PMQqqezHzo9Q77fqbpWGgAR7KFAQTagpStV1EZFdoU
         VKqNMLtkoFgaAwF+fSt4OTVi89HKpZFw4w/lDP4csG9w+9o1MF5WqTl2ggUXVeUtSSfr
         jR6v9rToFXrPzQX4eGTLylKt594twMDD2pskoTvUu54V9gippQoeribTsxMdu2lpzk8a
         1rWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501939; x=1796106739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g64eb51ZluzD1abqaA/e/xtKZHHLSlSJSnLWnH9efNE=;
        b=qlf0jePLNFn4T9MWYDmvEQ5z97Ru0QLHnfNJdJz1yvoV9EjK1/5asLvSsg2xMpQbus
         2LAfFsetRt7biSsv1yHtD45f8NiHrbkLnQCq6udwrJkXIRA1THez2AbMA7J4TDp58aiC
         QUORnmkrHFTk18ByMJIJDx6Cuj9tDaaInesaszgAcj19vhMul1A3440nmq/r/094XWqH
         TkIhX3m9KU+pMWza/apma5AZRsiyDC8YHs5dLAFKWybnEFA5ya5z9jn7OeXF7WgVIwYx
         d5Ruv5vNBCjQhdJm733jCq9cLNSYL6hKGEfZbLo6ZZBXkdjckOAj1UwmrR8aPF47cIp+
         cJ0w==
X-Forwarded-Encrypted: i=1; AL+hErHdhwIZ5bhrxZjwnYAw1TW6XdgzYUCYBn/YWDMX5QIZwwg4yECYVLE1RUGoV5vUvPgRZ07fmcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sdh+QeZQxFH/TTMk8DIsFxQ8KnBUXJL9qvYpFC6dP/LNdEYUl
	NZuGbD1Cgfut9RouEooZ7SXO8eH9GcEgo3dTs416DRlcUEdvT713zvqWVIR7CB4WFrBU+C6tie6
	ipgakLtULny7cNFuxXKyp812R4iuBK/xBvMdd0WSHIp9TcqQ+m0mlP5rDQ98=
X-Gm-Gg: AZFdTZfz7U5R3Mkz+Chg3DQOp9RH/GWJoL/3/l6RLfAifP7t5r/sjgDI7l8mf6hd63g
	59tmNCPOjWei412epYxOgl+MDK9J68MUCXU9QV2IEe7+7jCPPMbq93Rda6zRvGutSWmAGWHFfHb
	KJq35DEkH+opjme4HpEoqNWNpJ0N+qoHdd5BFdvChGdkOMyGOQujMe/4Ejmebr7s5lWn+ENSpq4
	iYqaRif/KAu8AW/9sKc4EFiVxcGQu3Z5R1VPSWDRwD8ewLotoHRL4q7Y5o7SU45AeMTXaimQm2Q
	ZzOE3HKFrpB1OUKzMu0NQV3UoHPvjbb3ikao1+au5LqBrXiv5Ik9Vfqd3nqNfNIugkKHuTNiY2/
	BfHcELBwICpex9aiyo1M+otQV+L/OSPIS+lNeAQ7UKjoxhSIHnKfhW3fCpp+7LqJ7S9jfkmrqWO
	Ncfw==
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr13635468a91.66.1795501939013;
        Mon, 23 Nov 2026 22:32:19 -0800 (PST)
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr13635442a91.66.1795501938573;
        Mon, 23 Nov 2026 22:32:18 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm22962174a91.3.2026.11.23.22.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:32:18 -0800 (PST)
Message-ID: <4c568f56-988c-47c9-87f3-2cc616e1044a@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:02:10 +0530
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
Subject: Re: [PATCH 16/18] pinctrl: qcom: shikra: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX3nws0RcVxNeL
 9OmkMHDjRxE+4Prz64M7Iri7FR2WEov9J+OpnVMtEjYYNU0vXs6JLEP85s7zoIBtlsefl0W4VUf
 0zXjU+VANyuCqUxpm9KCUYzuJ6cJ3qc=
X-Proofpoint-ORIG-GUID: 3BWmQvSsb5V5_d2W0MKdPyhlSzwp2PYI
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b052f73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GewgOwSwdJvqOynzejwA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX5OeWgvb5ttg/
 337LZnLQbpnPCYR0/8SlBRQci8XklR74gp5LdOlGCNDLKRjV7i5E6/TvzyGm3sQQ/99rKdjxQO3
 pSke9tt+SjAE7V5ndL5JnVVjpVKXBzxOYWrDAiJck8/jIrqQiD3TtruX3FKa7scrpEf6qL3MrEa
 kysh8/JVlIaLrWP99ubp0Gqm/HPHoZrKxzpoyMBQ9mKcLPkW/UUSMcCMMB8XWaGmsuT9AIZriRm
 zO8Tzs+8Xcfx2R1Mostpu8ZB/LPRwbJTgQHFmhNLmtlj+dmVwBqXswNUzCWifBZwCpYwmcAYF0T
 zko8Cgr51pZ8L+9boJAhIZ1c4xp7SwiOEga4YXqYp1xFyL0I1nEOytmX8aCuadxK0gC0lx//T99
 zsrbx0Jstr3+Y60iXpIvgedbhZ7WtnmRkSM0sj5tQNXzWarsWSNerDvhddIf9QGSf57vznFJn+m
 ZK4/u6aanBOxpNPqsYg==
X-Proofpoint-GUID: 3BWmQvSsb5V5_d2W0MKdPyhlSzwp2PYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240025

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio87 of Shikra. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-shikra.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
> index 55aec2f675e6b0953c6a7ed1d9c33e85a47bfbe3..c411ddc48440db732712220b57be6ad1278fafe1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-shikra.c
> +++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
> @@ -459,6 +459,7 @@ enum shikra_functions {
>   	msm_mux_emac1_ptp_pps,
>   	msm_mux_ext_mclk,
>   	msm_mux_gcc_gp,
> +	msm_mux_gp_mn,
>   	msm_mux_gsm0_tx,
>   	msm_mux_i2s0,
>   	msm_mux_i2s1,
> @@ -666,6 +667,10 @@ static const char *const gcc_gp_groups[] = {
>   	"gpio45", "gpio53", "gpio61", "gpio88", "gpio89", "gpio110",
>   };
>   
> +static const char *const gp_mn_groups[] = {
> +	"gpio87",
> +};
> +
>   static const char *const gsm0_tx_groups[] = {
>   	"gpio75",
>   };
> @@ -945,6 +950,7 @@ static const struct pinfunction shikra_functions[] = {
>   	MSM_PIN_FUNCTION(emac1_ptp_pps),
>   	MSM_PIN_FUNCTION(ext_mclk),
>   	MSM_PIN_FUNCTION(gcc_gp),
> +	MSM_PIN_FUNCTION(gp_mn),
>   	MSM_PIN_FUNCTION(gsm0_tx),
>   	MSM_PIN_FUNCTION(i2s0),
>   	MSM_PIN_FUNCTION(i2s1),
> @@ -1103,7 +1109,7 @@ static const struct msm_pingroup shikra_groups[] = {
>   	[84] = PINGROUP(84, uim1, _, _, _, _, _, _, _, _, _, _),
>   	[85] = PINGROUP(85, emac0_ptp_aux, emac0_ptp_pps, _, _, _, _, _, _, _, _, _),
>   	[86] = PINGROUP(86, mdp_vsync_p, mdp_vsync_out0, mdp_vsync_out1, _, _, _, _, _, _, _, _),
> -	[87] = PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
> +	[87] = PINGROUP(87, gp_mn, pwm, _, _, _, _, _, _, _, _, _),
>   	[88] = PINGROUP(88, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
>   	[89] = PINGROUP(89, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
>   	[90] = PINGROUP(90, usb0_phy_ps, _, dac_calib, _, _, _, _, _, _, _, _),

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
