Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502078;
	b=L1O+Xx24P/3sAwZKUexNl2OEGkFzyZmiE3q4t3NpFrJQ3s//6LcT3fz/isJdbXdlpxL1
	 ucymHo+WVbGjrQAg9t9iRJplEE1sHnExHIzs3H8t/zDA+8mmuOAUwOLH7616JrYy+RjC5
	 JbTq0K/6kEhOgEqP5fnc6p9uKbzig3Tn449Yd8UR6y4ZZXqumff8V3EJ4rIOzWAkQQIVH
	 CVAawlx1gYWbq1gQd3goF5j9OWZn8XBl8RdnHo4fIDqqf7BvUOAnle/NEtrxclcZsv/GK
	 vC3d1XJkP/Dfa+Omu/DJHTYaxi8sn4haaM/5VKtnXnyEA6AOOqRXvH1CU7E9qS5Azkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
	b=fdYL42X44DeC4bLRAelurTaS4tI0vCbp54Q8dIT8lInmzhyErWQuwdITEY6ZnmMY5C+C
	 niP3OFqhZ+PZtRDpuh+wzs9aP5QPq+VxrvF+Ma2bzrknABF019wJQ48GpocI4NdgSDs1O
	 rEBgccRk+DZv+GNJ3rMby3s8MD22+Oiph3Kb3wgHEoxVF1qyp6fh9LhxALVeLTBPNsBXR
	 Dhhm3YiteXomaw8Jak1MKAmKXaqbHvZQLQST8261x11mO2etSMl3XOX/qcDv2wTxzDcf+
	 V7072t9zVc3gyW6cdFO4ob/DfCgB0Zcjtx62LyZWcSVkHExSZUSZNFXcDfiy4Et7kEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bU8AV/gL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C78606A685
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C78606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bU8AV/gL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7xG9M+p
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6FW901979
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=; b=bU8AV/gLvIZUDnNl
	c4CjPO2uIJtRiXJyfv5g3Q6EL2MLLv4IljP47fXUKnBWemRyn0DKL37raB5tDs8V
	Z+87q/uFrtox7vkUl3K4dmbv9WERxoQPvG+tiUYkO/6/THduz8gHh7dFteAeIuBa
	IN90+KxWpGn52YOdzfjICtdKAzcoqzIG/WV/AWcrqaH8MZGw4ABe3g7V5TlOIxs0
	orGJ7nlzFa/yReRa6bZkgRtjrQqH5s7H11bWBEWtbMErS85X6UnXFkr0xvz9C8co
	SsuD6WPkCM0vTFaz1RDP/9+EkDQ+uRfTNw8ILHn8LCHVrdt+yH8Ow6l1f8qRYPfz
	g+iI4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6ssssk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:34:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b203b0c139so3038121b3a.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502076; x=1796106876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=b7xG9M+pprNtmQA1tDIEYq3rHqtlgfuvY7shGOwkX+Jf1Q7sFWZG/s/SAYdwV2UjuB
         DAIjMvVnRmK0IAWLnOvvS7636IIYmJMFJZxe9rOuw+/OXzfy6U8Hb6KfDnW55qH9Qkba
         FYPs5IL3x40CnEQfjzebmqsyDMx8t7dJQCOFJqBlQBqO/DUX2bjg39UaQe/HxS2brYtb
         DpWr7HU53NiKPtSSKHXgtvyOvThrxz9+olFg0xE3JZEBFoOFfaidcRi817m5fBTdHZFU
         zoZbW8gzYDSXqCjsmjpwz8XPFT9JkJtTVgAmUU03L5PCyo0Zg66Rj3293Bg5MDD7FAon
         ikNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502076; x=1796106876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=947UXbVLxrJULR8svhLGpAbfg1TvUwmh3xE/goLBpn4=;
        b=qrqIw+iwK13JiA5aYiZXbFNExgz5QlVkzhvfydJs2DKpl8K5v5l6rd3uh6/6j+Kki8
         Ee+BeaQZNkoKGfs7xJlfJqdymJlScKkPvDjR/MvPdo6M4PAHtiLyNRneMtTtKf2/B4Qn
         93xjK5MqcCWbjpJvUulJrwJLB0Rn9LeHwxGT6kVfFYUJfYPqGINiRMoKlVKO0cSYV78+
         UoUDlTBZl6FbCT8CpXzZZyspQKcz8SmDNdS8x5NGgOSOKSITvps6tWBhpiPelVzTFPAM
         hrdR2MYEvgeVpQ5fMgK7xGxz0YnnUjFHSzPdlkkVvFp1qAAS5Hud/S1GM1ao0PXYhPiD
         xFqg==
X-Forwarded-Encrypted: i=1; AL+hErEuWoXdnrLoGdU0hB5VKkCBrmjnWnNuRrUSWq1vsoXX2XhH+3EIjnLMZOaTnecEIaKMbGoeJxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6S2ZfgwcZzkF1mwq9OumYOGgP7mw5N6PtdEGlCbLHAK0RY6Yk
	9gsY0mH/fk6+tjo0LF4D2x4OKZ/xkMWb0GayJc7vvQSRU9U37dyY6siGrcWUGq62fAROjnY7DSf
	Y8WudqcRpIsgMDbYTWxhnU0Ys1i7ib4+PnRZYu85ur6s8dj8BE/+nSmZHpiE=
X-Gm-Gg: AZFdTZd5CJM/9RLugq1bJ4F4ZnW9ldx9m67Ytm3FwBSGZOXLhPc08Qju/TNNGAmU/Io
	eK70td65Sy6ZPz7H3s6aSlh3gcQFxoJPGshrhKcIGSyjtWLQjeMASe9WQtUnqMwPEHz1dVmTvLp
	Zp11q5sNOfvrJYdGIjIUXkisbnAk4c2PSmjaIwbEAsGL9llQN8wWrfdOF4IAWt/nb6BmXioGAeD
	WG94+urJJv/mY1RO9fmiqcYIVxP9FLucGo2vRMGFXyzXWLdSTWERV5NbQ0DzlkOvw6rR8dvcMfK
	n/P+DiO5oBWslMVn7CO/RmaT2kMk6CMWAb8kqbK4dTu+yNa0shmTBeX//Gum8aeumSmejCiOV0G
	DZ1N7GAU0k65AgMBBYT8spjfcphTFulqo4TR964THjTxm/4gY4jw25tGoCZW0wNnheIyJ+WWWBg
	cQ
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005116b3a.15.1795502076101;
        Mon, 23 Nov 2026 22:34:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4299:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8c87b8da5a6mr12005091b3a.15.1795502075648;
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm6723898b3a.28.2026.11.23.22.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:34:35 -0800 (PST)
Message-ID: <fe9ca68f-8f3f-4989-b366-38c0cc6c9ea3@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:04:27 +0530
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
Subject: Re: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
 function
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
 <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2COy3LhnBCemVVpAwPVtFjIPydlw0YXI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX5HaETFJkM7il
 4VS+tX/8yCmOaHH/x/vM7G+t0Va+G/pR6Ndnke7kqFWigU2uezjmkpr9nQBmC5ck/GqJ1oZdGOq
 chIr/XIk40vXkbUZ2kQquYItE2/bCVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNSBTYWx0ZWRfX38rLItUBkl4z
 Y/4DByUTMfO6zMkErvyx/OmzRmKzeQoGO5fo0lQhUkbLfTNm0nNWdtrFFddwUrnUQtKJX23qF9X
 90cKdklk520ivJ0QUCM+q2ArvcYC/DGn2+z+LFnu6TD/CAQeeqg2tdTmYMfV8g1ar9gM1MBxYyJ
 fDXzzuUyWDIrQsKSfXOYU/kzhlfGHuCnX8ljiGpGi6EpHYPPXFTKSiPmXKnKv7nrV/DT5HrnIeX
 DNWyl1TEhT0fyIEg0+NqjODlP+S6KnyxstWbBcG/DJfUBa+dAWQcMChACt1PfV4iPWg7QMrprjq
 g8B9gW9ZLh/X5LuD+1amna0JYpxBG6ywoTA7RLJmZheGU2QcRluTq8US+19rwI/fetEU0jG024t
 tYT6Yf1mpKkqfGL9on0gBE7NHcMHNdT17+4H7XmrkTwDoQRL8p2x4takHqf/49A4TAYb4vpISg7
 xwvWBlir3hPnQ12OsUg==
X-Proofpoint-ORIG-GUID: 2COy3LhnBCemVVpAwPVtFjIPydlw0YXI
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b052ffd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ir49MwnX2Lnn_q3bKQIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240025

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function to the Shikra TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio87.
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
> @@ -73,7 +73,7 @@ $defs:
>                   cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
>                   dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
>                   emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
> -                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
> +                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
>                   i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
>                   mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
>                   nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
