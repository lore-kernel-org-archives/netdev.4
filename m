Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795115213;
	b=moHxVBRRdwJZhphQAY60ARQ214XtPxLZ1vkvXgmo8YKpRCvnqWc3VA+01NmnFzIv4OGm
	 r2kCgdA0gNuRoFL7/GHvZU0OLXQQtphYt2K9eu0yHtCdvrDy/31qCtQ49qOtXGTvV5rh3
	 3884K8nXoWwFY0OjW2rsA8WF3jQxq97HKsJwKt5qjBr4Wm6SyXqALVN5HorjwJxhoA2L5
	 b6PHz6YU8GauMKGnU0dnLMCr/wU1//FGJINsjpLlt2lyBx8tNSI1KmY4f9INqaUf7zFqA
	 BhuZBoF6imJWR8ZZ4c6GQGirY/SKMgQ86kHRyG/k/Z483Erp+KNfrRvHr59njtYlAeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
	b=FB3UeHpes5NtBMn5NbYYeujAoyX44bTSB1D7kwZ91LOOXq8jx9DIMWszwFwsufCW5Thc
	 +ZmrWzXTyiYPDHxo9YcSKxvcccjLYdkvry4hPXSxd51C4tcCf4V4x5lsDgLXB8LPI70Y3
	 wJW+eE3W9qeoqDCUhonkeAws3ydZKj2ps/yuXOV+cog3y1ctghZhu519xZoB7/QAjd4QA
	 zWZ0bhGK6NeL0BXvYFapQQ8lCfOB8TgpASkNFeKJYUvGDQBvV1UkSy/Cnq4QbxOHhoNFC
	 RA7FE7zSZ0fg9pNg9wAhzsOwKesnbBGMa/2bkjw1kacWcDwEXA0IfKFkqgWWrB8pIJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=FBS35DIl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C93606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C93606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=FBS35DIl
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ14Cg193965
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=7UOIM1gt/HS
	VdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=; b=FBS35DIlYfrNJvTrsnesOsZXjHu
	lShjNbOKcW+4QM1K1aoLTP70qi5tI7RMA2vJwjdT6wVGEM7qbKX7TUCyPn8NYLdN
	w/Nmgi7S2w/MYm2sVSnArpTHYuEgihfprYzgxh5FAlxnM/HsEAdC+iDwpQq8j91D
	5DK3IC6Dq31TEkxovREk9wTM61Ha2trluzl8SPTq3cr+nOiKpROIb3P0l+g+1hNI
	smTrP6XALq2srV1GF94pDR8lBaW/PKZS8xaGmG9b1Y7jfx5W/ycFnN2Xpwp1lGoY
	cjMfYJ9bQqoSqzD9oUEWt7ktQ7AHIi2ub6t9g2Aqv8VWarmC2C4NrUY8Bhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j1x1amsep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800 (PST)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso67156a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795115211; cv=none;
        d=google.com; s=arc-20260327;
        b=klB/z+Ci21sXlY0Q0aKIksm4EbE54yIBQUsJ2Gsae+Ng4je5fWJ/5sRAUf/GQ+HHHq
         PhzI6LjPpIdxMqgApXRCO0qOM3QLoNmXUub6fU0g8UJm2rjtR3/69NP8Wy275/+iq7Nu
         /0Gbg5XTON62pF7WRQH31vqHHp5RaLYY16p7sOFMhiXCzhazx+Qk1S6IqHvrK5HTD5v8
         fZF6HatSDs33ZGArdHyqnBxdVSPg88c4zblSSKvy9lH32b8EtqTV/vyFhO8TexoYxiKa
         Ueymeg6MovTArsHLWkwFBnswkGyARAmzcF3qAOA6J6Ooo/7JhxFXWS0EzVh4nUIaM3Eq
         gE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
        fh=SDIrgXTWabEseLSVvzHFzvh0aU9d3CU2LpIBST3YlUQ=;
        b=LIbmM6/mVBxjeYSgIXL7a2f8iHx36RRMwk0sAtijEDGchWVNCeC+7jwoCeSo56Zp/b
         OfsWbjSnMOOnqsnzeNfIVRYiqtcYeAFoDEa2QnlzOpAKexPaBAQCrpDnWAInsZ9GUEe2
         BFu7f9eCv0Ux0/gegVEYV7WbvWqaG2pcY7Aks2/RREo1Vi8DEEs9zxecSAiVmZtOuA3j
         rRDUMoBnWdRU7bhPXPosTby1lInNDntWFYHCiMt2K10IqHlpZ1Kzx04JEmvrWr2leEg7
         zfSo8B8ErU5902GrFyzwuxr+mzU6VeqfqWWEk3AcwCutiivyGYjZJ9gPyYshFrWqK549
         qPNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115211; x=1795720011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
        b=hafKGyQsTM+37tFWnAtpFITpgXDlf6rEBqtxIJVJlwqE4r/GgHSRNljNYODv6lrfgI
         hTPxpT44ZbGGabgPukH9qyxOOVzja/8tp9xRSi258kB0JvABtD2gAvVHcvMOyiQ24YDW
         Cir8twWRZDwqrAO6yu8jphzI5VZ3i9QV4fU0wWOKGneSYai4SKOPeYBgMj3oH5OW9QEI
         J+TMZv00OiXBzbQVI17Pf3X+pOBGb/lJh53XEEu2mUy2Uhs4SYJ5Y153Yxsn0hqszoRK
         TNmH5oBtJp/uFiCf67WWJcmUhtH2G9U20C/ynoqfXwyGLf5NJikEjzRKMIrkiJvp6x+n
         LhJw==
X-Gm-Message-State: APuU4Z9Y3N7abYEDUZ2q9QPMmktizBzwNwpwJolU3GEV0x1O0AOQIN4s
	cfZGz9dyhcrqFpjCHBpbognu1qqUQtz6dlDuaV8us3F2lNc+EI4R8f+kHI446kZEZZH5wlrY6oC
	w7rZi6YkO9oydA/WCGrUQSXuvSC10H0Bx4zZ99YBVHvES04LF1h0BzaNd3c1MkGvVQEWLAItsa7
	cAnt1J1Vt2+WNtX35uTWPvjtbjVLneUm4=
X-Gm-Gg: AZFdTZeEFT6pk6eHwt9AfPPBuIahtszhZZOfY0LNI3wErmhDUAuovZyOrboWNXiFGYO
	SlXuWqWcKXJbQJLtq1pYVHDaVXUOFMnrd1PTehp/lKwh+q+XbDS/q0z9VOIpK+JscD6lMi8B2F+
	5x/yZLs8Wtg3RYR/2KBis6Hw1vxYgYk+JueZ6GFujM/afl6IkXxRNOSkXDTOxlRDaOdC0xx9/4F
	UkR2onQSWE0iHMvsue4InLYd9lqAEVI
X-Received: by 2002:a17:90b:4a06:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b41caec8a1mr251297a91.40.1795115211588;
        Thu, 19 Nov 2026 11:06:51 -0800 (PST)
X-Received: by 2002:a17:90b:4a06:b0:3a4:9dd7:296f with SMTP id
 98e67ed59e1d1-3b41caec8a1mr251262a91.40.1795115211062; Thu, 19 Nov 2026
 11:06:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113185553.171059-1-toddfreed@meta.com> <20261113185553.171059-2-toddfreed@meta.com>
 <20261118182729.21bcf5f5@kernel.org>
In-Reply-To: <20261118182729.21bcf5f5@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 19 Nov 2026 11:06:40 -0800
X-Gm-Features: AclHuK8MIg7IMlCLvugp4MxnFKNBhzqTy9e8on9cRpXBj8Das6tgcuB0baaIcl4
Message-ID: <CADh2yMx3Fw+Xe3E-hwj_bBMG8Cy_0N8-XfoTZXSxDcQgaSgxuA@mail.gmail.com>
Subject: Re: [PATCH net 1/3] net/sched: act_mirred: don't send decrypted skbs
 from egress to ingress
To: Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Wei Wang <weiwan@google.com>, Jamal Hadi Salim <jhs@mojatatu.com>,
        Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Boris Pismenny <borisp@nvidia.com>, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3NSBTYWx0ZWRfX+LdvHEmqIKM1
 PHaugd83mGDmoSH2eZyyRuvGCu8TXJUk9cwyZbyo0CxzCsR9YEzugsXvHZ7V9KtGVbkiKSUsnqP
 QsIDhq+N6Nq9aJIZu/148NSOB9bERDKcdOcH7zif4TXO6+ASi1R2ENzs2T9WAiRiTlHWWR6lbaG
 Z0Je5G7TyF8mVaI6T6knxf5FL6HkxsnPw1xEp5exzRvoDN1n6azkzMH9J0I/J47tdfmZB42lA/T
 inxiaCyG8GztaNLZrTVX9PqL7nRm7iGOO4zMEkoOQpe7mx83/vacwYDJByz6oNmw5ERhNc+MLAm
 gb+NvcEzxgSN5TOJExTnFDaVT+UP1Zemytjq+LKZWVpYgaB7iOeZfCgCRE6xmg932VCPu0zsW0v
 zqb0esmzmqNjZLNClzzR0DYqracJPia9if582Jyb/sQ7s6UO6BMKN2XBrxJJxuuKy7cxB5Hhrq7
 YU8th04tV8DThbpc3Tw==
X-Proofpoint-GUID: XdG-XIDIIqwBqPab2TsOFxMdf2esOMnN
X-Proofpoint-ORIG-GUID: XdG-XIDIIqwBqPab2TsOFxMdf2esOMnN
X-Authority-Analysis: v=2.4 cv=OvPaWC/t c=1 sm=1 tr=0 ts=6aff48cc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=jjTLAEkg5ClW6PfqSUgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3NSBTYWx0ZWRfXypDGzF9qUK9r
 tCamsbbHS4q6ytYu3At5XOU368DKKGvCw7E6rOWvscwJSHc+127fcwTasU6aP6IohE7Pg/UldBD
 B2FWAc5sjOMomad/mwg5ka1RoUSuCEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01

> > A packet which mirred redirects or mirrors from egress to ingress keeps
> > the bit. On ingress, it then claims to have been decrypted by the device,
> > although it was never encrypted, and its payload, which was to be
> > encrypted before leaving the host, could then be forwarded in cleartext.
>
> I don't get it, TBH. The bit says the data is in cleartext, and as you
> flag we can't forget that. But my understanding was that the only thing
> we have to guarantee about such packet is that never _leaves the host_
> as clear text. Within the host it is clear text, whether its coming in
> or going out. Can you ELI5 what the problem is?

Ok, redirect from egress to ingress can't leak clear text onto the
network. I will drop the mirred and bpf patches.

The clear text leaks have all been fixed in other ways in the net and nf-next
series (extension headers, fragmentation, icmp quoting). This part is
not needed.

-Todd
