Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029316;
	b=bAXlvIrDfyxDUlg/i9WEpzbPAgtJe0NH4ga8iZ3Cake7ub/LupfhVJM3kM4hHYtFF0pK
	 hbeBMkse90Isxj/FKq5MivIJ+P0Y+MJ3F8f4GQdv9ahR4ZQvcg6iIw0e5cv0XqiH794aR
	 iuGX1+VqKz16y3+MKbzatRnYU+GSupEYDEcSoJ84zYqSLjZKxvaP/f8y+wGsDugOJtGC1
	 OUqBL424HIWDw65s0w7OYRkjdmGt4ak7xSJS91Lw3cPjnnGQ6BWstWa598sC1Az93MpNe
	 U8hbOGFw/rkMNJmp2hQJPTycLCDFIdtcOBfKIQJBc1zMqjBTEXIU4s6qNgAHmZ9qirQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
	b=PGOngxlJn3wf0k8xGHuqX+69NKAGbipmMqbm7sJa16xrWqaqdqyPBgc5UIZ3vX2YXvsP
	 pMCRChsuYhq9rHxhOe/rRNETS6pTqisF7H8BezJw0aHbTloCy7/9xoCfWVJ0zbeVwgOBy
	 GS/5VPVcYJ2dKb8njqiYYVO9ilHMXtanmmnBKpKdZRCUVAANFKHs/YkaQ/90HEgNgiF7s
	 h9x7SLRVo8wKCOIJPZJzRNTBevW9UziLRf37JJ97UHkK/Yk+MLke7dy/RhQl0E2xz9CgE
	 FIB8E10AvIFHVLuNHoeUbFgV8MLe39PwwSb5LAF7uDv4Kiel4ehmuQDA6B66dvAL/ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF63606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF63606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGNMp154276
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=+xA+qBnR4Dh
	GTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=; b=CI0coo5MCl6PeMetoQwNQwkRIbu
	JiJgmxit9cRt2nDJWrdAARftxPhoMHNyIVJskaAed9S2yJwVu7Ra0ZkweQuyB5yF
	guA6b+B7Ror/Ay/Qt7H0gVuOq2ynwudmNifTkBxQAYnk71ts4xr1AaSkk4W+eOa8
	idyTtCCV0m4sS5SbBYGeYAKxD77vl1xiK52a0aXDUovzXZHhLZIrtRdrfVhCe76Q
	12cyZpAXp16EprTl+WZPucOgkRXsuml9kXyb/gOq3sIF+GsDHZrnxqsx5q2OGKk9
	Lta3g/1SFu0Ht7eUlEGwKj9v2nyojzUDtpEBFE/6gMcWgBLoOUalALEMPcw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu808a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800 (PST)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso1026463b3a.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029314; cv=none;
        d=google.com; s=arc-20260327;
        b=fe7K4n/O5WTjY7oCYuC2iJM2jYvGHHlj8eweQ9kn9ow0Md5e6O76flGOxhEBdvxvmm
         UYtcXw6GEY+PHyvXCOS6Rv/Ik7TktYXT8ySnJwlBY3rNET1tYOsPqLnNqWudySf2Yo8G
         SnyFkMMcqRjwju2DDUCELrpwoEcPRJzRUHlf3Wji1Rf87hwYKYQlDIaHvE3Y3VHJrv56
         YssJtriKSZXR6KwCsRPsqjqM8j98/W1h9Mqmq6JwH5YGPWe7S2Xev8nx2/604amO4Xai
         /YTGAG/iLpBdoCBL84t4aX1cCMgXAwWkE0jpzd+mBM1flVj0uW1XAsBXvCzttzriKe5W
         X4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        fh=Njjltw0gmD6los9ajamLm4lHWMDwcxONTiYbUq5R5q4=;
        b=Ti4h4nkfp3ZPwcO56bc/YVRoZ7EuexQnBtDrmPt3QxdyHS03C9iqjLbQx1BFR1QAkp
         Ozuw6MJO327QYQsrhlLP+4Kfs9VVAF3j2cA1jbb+DB4d5BEwQeT8+I9dpKD/+zwfpTAx
         UB5rsdZWDuhgQAoViAxtJHW+YtDgOppJ4vnZZS3qWEDwG69ybz8QiMaYsUw2RCH7N0cz
         mk/KMLlD7m8C+KUujgR7HY+w+M+RYRYjtRBEToBRv4lNCGsBfi41ayGQlaLveilm3vgh
         z10f/Ryq9kbCTAagTxosZX9Za9J+uqwoA47L6XViyXANUGUO8U9hJh9GjoE/MIiu5kRm
         kTEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029314; x=1795634114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        b=WzGvducdcf+qu7SuSXESMfZu/mi28qDkJ0/AAFMZGuV7KOjE/kkfPV3dBDOlTCe076
         db1mCW+2KRbnslHywa2cT/Bqho361k3TINHfnEUHxH+ay39Ni8FIA24/hsglWtnGdVE8
         bStx0ehZvNON2iaJnT6MEnaPcFZayoMsw5xfbfg0Cm7Ukr7FTIuNft1ngpvT13u9SYmD
         U04//LYqlnd0u3X16fl+FawUVJ7jjrcJUGznD9UDLP3EN2tNwH8miIyZFIzr7bUdmDGD
         sBpENHWf7LmhYdGvoQ+XgDafV/tqo06tGn4H57VHmEfasutBLnddXMFyfpmf16vITxuX
         ac6Q==
X-Gm-Message-State: APuU4Z8hsGkyfcybJEehYfPP7/5i+NnENrHj6a6KWni0iSu//kpHvvVY
	eTL3usiGjX+pVb901yvzBNIlBMsKws0cVTykojl0QeZHlVr03gNRrtvOykvQZpsO0ZB1tXbbQ/h
	2XayN+NHpSgA3awN9Hw5YncUtG+tBUqI2AQvoadjCpEHJwZ7yD9yS+tZ4T9VgmRRdYiV/RaGz0K
	T6bNOxGT67QjuXkxQZnD+QmXX4yQRB+y4=
X-Gm-Gg: AYBFou3OWFZN2r4ytNORO9QnrYP6VNhLMqUkKpZ/Gf7lMj4ltKdLPTS/mYeIpLBOaM7
	53EDKuH00/XGt7QkoVRkMSU5TdfT1DSaMYq01me1bs+y38Sfsx2K0nzM2EjccLJccQxP9IDS4Qr
	h9tNWV263JkoVofHq6TvAt/EgsSE5dcGpGFLvAWcYc5jEJ7W+i0xvzyWqyhiRUyCfg7yWvo6Idd
	lX8BjQCxBhvUqEzan8GyXigEz+twseW
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-8c5d46deeffmr3344617b3a.55.1795029313735;
        Wed, 18 Nov 2026 11:15:13 -0800 (PST)
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id
 d2e1a72fcca58-8c5d46deeffmr3344573b3a.55.1795029313133; Wed, 18 Nov 2026
 11:15:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net> <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
 <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
In-Reply-To: <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 11:15:02 -0800
X-Gm-Features: AclHuK-4R9Nf7O3FLY7hrUyXB1KdmwvUFFQk3aRrICEDQQcjmr2v5AAMDg1nX5s
Message-ID: <CADh2yMyo1VCNKC58oJiOLJ2NtGqAFQfxLY3iNbP5mtQhaFsR0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: mBBHzjjhIpEq0V7GEFBt66EKwoPMtYa7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX6RYDj5o6auv1
 oO/7FjJ7M2DPZhKpZmTS150eJKom8D6IEgbij9SmKWo4dgxkmWOAhuYQ4pSRAfHNa1ESfuek3mI
 JGNudj07uF29uFkejwo0nnhj9UaSYjw=
X-Proofpoint-GUID: mBBHzjjhIpEq0V7GEFBt66EKwoPMtYa7
X-Authority-Analysis: v=2.4 cv=MvDHeGae c=1 sm=1 tr=0 ts=6afdf943 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=DIuMb9_t4Eg30DVr1XQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX/UoUPzs4VjfI
 SRL3d6fuiUm82vZ0CBXQ6EYAcvqHh0gKBWNYsRer6u/6owjW6Y5fJATjwRPJtZ2FzwNw5KWoWnn
 qqTRsCy/2sC1QQ/WrjGPZ4MFs5LsMC2VRJHckNmOOB7oKu+2wSDi3U/SEkdplgXrr5ioeGW50A3
 WcGVtDbmoFpPKrdOcmsdeWBr0fYR9ZwfGyrbkowcK3DWN6g6WQXNNFE/8hG43F+dEOYdVzaXQl6
 vv5/8meIYymzCCyWiqAnFF1ntj5rF9kyFw4iEx0IdrZWoALt5O3RHzceRcSE8zY4wyhZt2dL7l7
 n57IkrwwPyBsZ1EyBEwxvLkn07D+HsXznQiOc/hK8SRbFMSLEOHQIzCBzc5n8H6kpeEtrBFKTJm
 6A2c0vV9tAjWLg/WaCQeOdgH7ZG9WqESaSM00Ph3QgYAtsf8VQ21eSW5vrYpf27qqNmydFhKLnv
 W9sd4+aUJakviZw/hjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> But why under skb_do_redirect? I meant just here:
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 532405988fd9..ba112111de22 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2471,6 +2471,8 @@ BPF_CALL_3(bpf_clone_redirect, struct sk_buff *, skb, u32, ifindex, u64, flags)
>
>          if (unlikely(flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL)))
>                  return -EINVAL;
> +       if (...cond...)
> +               return -EOPNOTSUPP;

Yep we are on the same page for this one.

>          /* BPF test infra's convert___skb_to_skb() can create type-less
>           * GSO packets. gso_features_check() will detect this as a bad
> @@ -2563,6 +2565,8 @@ BPF_CALL_2(bpf_redirect, u32, ifindex, u64, flags)
>          if (unlikely(!bpf_net_ctx_get() ||
>                       (flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL))))
>                  return TC_ACT_SHOT;
> +       if (...cond...)
> +               return TC_ACT_SHOT;

bpf_redirect() does not see the skb, so it can't check skb->decrypted.
After the program has returned TC_ACT_REDIRECT and
skb_do_redirect() is called, is the earliest point at which the policy
can be enforced.

-Todd
