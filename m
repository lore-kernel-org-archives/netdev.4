Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795024002;
	b=a0KRVul+h000DTLUCzuen+wlc7wXSEyrK1QtA8H4zcWjXGCwGUkm0Z9u3zVljhpEl8Uo
	 lr27YRJLPILY4MsonPoQhos7G/sppv1n1OjgmZkdaW0w9qmGUluIjxzTrbgbmAkzVXyjf
	 RVsBGrBaQ6V5e0D9hNkn0fRgdiIZ0jJbbTZDIebgB3i+cEtRsSPzIIpiQC8L1NS44so5S
	 rLapdej2p4SOy3eSpET4HfRxj7znmIbJxNNUf81UUu8ZD1TiVPeNEmGEFX7hjdDLLaUTa
	 k/dLDirZ0r4Mf/4F4TRkQVSIy/ehGRvnDZq6SlJo6GQbQgM3w8iVzR8rsf5bF8Oq14Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
	b=DCLskDzf1j3UtYutGbQv9bJ8tlYvQ8+HBsymiR61x6j/mekpzOU1nrB/geMA6BoI+Vb4
	 iche28Ghwj4L8/GAjKOn8vEI8gp2XMeA9JzRI4LzBs4P8pWFP4bvIGAZF/m6cTB2JK0Gi
	 9a3fruVUItI/M3rKb8+E9bkvojwIOUM0Nhxzf1VqosqYJ/XkMqakdcaa1M6vdkDcz7fzm
	 U5wZqBhF9cKRaMzntIe2amdGY/Eb382OoI17lxPxn/hCEXL3CshR9fW+zSPKjgSwv4S2z
	 4CnboOnZsUgJ1YBzeKyaHx9GOLYAoPNpgw4TqAN7b/MJLxswUtVQM88cv3QsjgJ1VZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D6606A334
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0D6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGO61624470
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3ykO91BHuXI
	Q6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=; b=mR5cWZhHSGlgX9Kp6sEX3IH0+vZ
	7DhjCpS6kNifZvDX+8X4OeETq3AcTzE9isy0aS2loX670ry+7TN75kVbI8yRo1Q6
	gq+x5l6yhhuU6Wk3IRlOTXzEW1O8Kj3CPXaW7nmZ2iZTsfulilCriD9DhvSNbOFV
	+LEfsYSD8WgJDdr759A/H/ZR2SrSVA+o6i8qGD/4Jzx/vvk0c2DA1O8WtVgovNWz
	mS4mSF17IRuXojKZUPJgIbCJz3yts0xln4eo1+Af/NfhEOcjMVu4kVfu/pGgrgga
	CqMpmoyU6vuiNbRC90iCXLfbCcUEM1uT0uRPofW0D9uZzMwYVDSoS0KcRNQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu5qf72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:46:40 -0800 (PST)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so960389a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024000; cv=none;
        d=google.com; s=arc-20260327;
        b=mXeGGdqLWbQPEPJcdyZPbEJ3Jucsgc6aEekHfzSlfF5g9Hcg3imM/RDgK0sVFZjEy/
         n+P7u1JQGzngwngJPxpYooMs0Tj/lI90fm90EUkPbMzV0zAUipixhuVF32UiyfC5F+NR
         /GilQoP/0GvR1PZG0quFIW07jOZHhOkgaAYYH6fPRniNnEL97mPl0rw4nPuTJaSOLXir
         LTRll24Xh3H57glcHsGDs7rYIpU12HRzKnS3DolSFFp3w/69KFvgopS48tL9vG8BcgUa
         XWIfya0EfaGu5sbCLB49r/Vf1pjQY9KwJBtAvk7Ivu4UFrlNijIEjJ31RTdyOGC5cjq2
         JO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        fh=Njjltw0gmD6los9ajamLm4lHWMDwcxONTiYbUq5R5q4=;
        b=dG1y7OxrKc8rnYmXBPgZzUiPqXQZKqPxg8PZi4p6Lh3AjZUoXRhBZbvZ/DaqnKvkq3
         gEex26HkvHMio6vsIk2MNUvaXrsvagG7ciudC6KZbGMJ7lGrlISDpa6/liw7XMhbc0U7
         KPJ/RCwd1t5qWeYOnMilEssccgSjtcjq1Y04kbAXLE3cSBlxoQZV7Fx1PmGGSTVYR31y
         ZRI/erM3m9E4EG1CwGCUuFFImXlb7Bw/iC/u41zcNE/9u5jxhNbYHT5Hdli8OyT4NGos
         9ncwsh578y9D1gL6QAqL8zSDXVEWva7ojcgnd+yG2u2HrKn5KjNOzO08gUYqy/T6aUDh
         262Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024000; x=1795628800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        b=lN5vPjsOdcuFpMdtNO4/5ol2isjPXV8J587i0LJpuE71aDDSEFUT1XKZKX6ruFVYU6
         uSHULvTRZac32Klh31O3YDtE+2/k+/YroEEQF82wuol93ILvP82BG9eOac5PEtG8NMSk
         G+wgHild3QfshhGRi0q3F/qHlMax8sQyWI5wYWtoXEHke0nHfMcMuHivP7wtgDdjFigT
         zsrI9Hbt4GcceyaDPadEWSPkKqEZOuua3vmAJ5JMiQGBIDXm0d0vIt9fDvVzLNG/mtom
         eoE65VbiXkUFhNshR7kMu4fsWob8pc1LVBih3NoW4ATmhohuPpl4kE87NTEA0RvcRORC
         2tow==
X-Gm-Message-State: APuU4Z+Q9ywN3+9b4Vmou/MJWUqUuEf44M+3/gQxm9IDnybTtk+06ATV
	EdzgmM8h6d3CmuYN5MVeI0+/1TxQ9HGk6TK8lXChgnFoMg1Aql1zceteQ57UfO7y+6HqAF/rZjj
	5cK/JDM+w6NIirP/aptXzXc81of29o3ncbM1R0lJfjlnZECuCt4GpTE/izae1pi3KbxGoRg5MRN
	luQ2aTtNmai/BL0RlhgLi0kA2XHxzOqCc=
X-Gm-Gg: AYBFou02pCrBq7LPWyKEYinhBKI309zwV4YLd3bQk9767UJAe0rdBCwM6IoE+CTpj4F
	bXI7/cRPwyoDV4mxeH+RSq9SgYychwvPRLtuwZNyVeEkH+C3CPGJPlJEIe+d4NVq1WKepdaaf2r
	37nN3Gdanmo3hC9X0fnGBLTEBwY8C0NTw5Kl0v9hsovTj03H72vOna9aZ6HP1Z46SrccuuYH79l
	9tirWI0P9gHHx10CKJSlbP+XDC3i7F+
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id adf61e73a8af0-3fe970fb016mr3350997637.19.1795024000250;
        Wed, 18 Nov 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id
 adf61e73a8af0-3fe970fb016mr3350979637.19.1795023999775; Wed, 18 Nov 2026
 09:46:39 -0800 (PST)
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
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
In-Reply-To: <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 09:46:29 -0800
X-Gm-Features: AclHuK933nJ--reKuON_iU7qOJYXtOh-j2OhgmEp3HOYoG1ZpPxZFsfMEYfL2v0
Message-ID: <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX/sbsTDRmeJuj
 XX4z1du+n09f4uQJjFiD8HHT3bBsONORwKrrv6BEHT8C3V4nryg/GOgavbmyHvZU1h0ADAUs9Gr
 4YWes9O4QyUsnHLeap9m7vbNzoNtSQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfXwNp5iLLtU0t4
 HWg6G28qbOUM+IML3Dqx9C8vBs8J4CSivq1YoL0ovKYXv+KR7SAujUAwMU4WjkQFmxBRejUsuCy
 XhGbwHnSWjuLfOBHp2qyb7bkpindu2p/X16hoAGfWQHZZTBqUiMIKd9/ZpwJa6Bi5GT3pi93cNQ
 LCciZ7HpVyPilRk0FRyZ1eafHwDzrGchyh3HAfjvDazWoKGysMQ6JFJFu5InQAobBIFE5l2gxg8
 KZ3cJW8JbyN5GHNeBQQYFwzpTWZ2slPOJPxzITWb3VmPXhm2e4MU3k0x7iXJRaFo+0mnmjEsbMU
 AsAGItERSbuK3PRk78MN3CtalkZZmakGReVNS75G+HVyjMABoYnjsvXi0QYfBk9nlvSif6eAJ9y
 J16sJYRcyCHCppETydmLVo5+QkFrX2NBsEJH5QhBCBvDxqQd35KtFM9kMg4WqxPjwx8L8KQpKSt
 UXLzDBSJhv9g9jBMQyQ==
X-Proofpoint-GUID: N21NQ7c3nXGf1TLbiBg9R8nDxZ0TLuCu
X-Proofpoint-ORIG-GUID: N21NQ7c3nXGf1TLbiBg9R8nDxZ0TLuCu
X-Authority-Analysis: v=2.4 cv=ftRJ914f c=1 sm=1 tr=0 ts=6afde480 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=XWTshytv-yXGdKsk3gQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> > +     /* On transmit, decrypted asks the device to encrypt the packet. Sent
> > +      * to ingress, the packet would read as decrypted by the device.
> > +      */
> > +     if (unlikely((flags & BPF_F_INGRESS) && !skb_at_tc_ingress(skb) &&
> > +                  skb_is_decrypted(skb))) {
> > +             kfree_skb(skb);
> > +             return -EINVAL;
>
> This check should rather live in the bpf_redirect (and friends) helper e.g. after
> we check for invalid params, etc, rather than here which feels off. Also, it would
> probably make sense to refactor this condition into a small inline helper so you
> don't have to open code it multiple times.

Sounds good I will move this check into the two callers
(bpf_clone_redirect() and
skb_do_redirect()) under a helper.

FYI this patch was moved to the net series "net: don't redirect
decrypted skbs to
ingress, psp time-wait validator", so you will see this applied to v3 there.

-Todd
