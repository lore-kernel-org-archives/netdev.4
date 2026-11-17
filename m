Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954199;
	b=tD2tPTQL6olTHe1zcm3a3l7RC66P78j8b9AY8r6J9YKBnInpHfk3kVKi6WZ5llzXOKvi
	 z+aNH5X8fpLMCWUJpZ2zaqVqCgG1D9GJUTkz0QoR6DKDMjcBXFiM0YOc+iqahS7S5mPIe
	 2HOGIR7XM5weIGfNKmBpmFP3CrzNFCpE5fKSPymyesnjrrsF6ocS3edt7bpcNx8CGOsEQ
	 MugyQ/ZtApKf1bkZVQ8Bn1dkrUxrh4yOOVpkbwSmtURm1+6hD7RqE/cNdpyriIhemSrVQ
	 oVNxlDbLSgEsnp90tQmGgvo936mk8NbEp9kEWTxswbc+jUqQFa7uDw7zRt6BFDC17kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
	b=YFTccVw+MP5f2Km7M5irDy88W04txT54gww4dwLkkXhO0gcJSqcRIy31FWui4tLT9eKP
	 soPpLeMzRTSGc8N+EYPolmYrlt9AYrg+CIbKSsXNGLebVaJnTS+iEzjdCcCBO2M/Z4Hv1
	 4MNPhI/6svdQCiBJvrLajt9nNwyEFEsu/lF/JZJ/LPYCGyJ/Gn5IEURSGhv8E5ygxbUi5
	 JhTuZBjoq6SmDe39xy6LBAKptbu5KICa3WyzHZJvUoPBhfd7AfjmG5bYX9i9TCYGj3WU8
	 PTNXpIKw8R4Xv2D/dAutyHjK5pPooy4UtQ89lqFnngb9quvkAH5iABrQg8uomHGHzpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABFE606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABFE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PUEFdh7q
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AHM21LD105196
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3q13oIFHchX
	PM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=; b=PUEFdh7q5L2JYPw6JJBaFQxI/Q4
	sFzmHEq56Q7i7DCKlM+eBGQXCRALo2QecCYubDNvHctGTlp0t29rtrCt/ksnr/5v
	MYsaGrCwNt7LmrjIEzawBTBesaGCkpwbxnW9OMdlOtzRsR6B65xN5wcA1TYjTeNv
	lvp1H9CHHcxFrUxTA8y6bT/iQO3GLfcR6TTrPZOk+QAmiPz69IHcxbJ8rSYZuY14
	yvPAyZQf2z+g+EmeMCYhDgdvotkNIEvRlGd7J+d0+0Ok95giN7Lrl4QsrNYzci+E
	Ay8F4cJoZUYPPDUYjGUVg+o/we6jxKs1DNWxx2BDTD8p/yy0EZinKo8C18A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by m0089730.ppops.net (PPS) with ESMTPS id 4j0p7y69kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so193842a91.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954197; cv=none;
        d=google.com; s=arc-20260327;
        b=SBUg6mJBq7AQqtwis+EXQ6HeW6/r0PRe2G+YHeyDdkJU0Q06rPMU3JGUyuRRZvp7Xo
         A42KJamX/uZ47uAhTLQKePN1JsAYAqkvMXNQHz8q5p2hJZ515Y53J0hoHRctt5fnvFm8
         W477XjZXc9K+F/357HXJ1LH9EWj1MGIjnphkcdWOqaelBVFC9zkTFmIYIBs024d/voyW
         d++FRQozt8BaL9Ct0QcA35YEo1FmbSvrq0UCGGD8YNDXHnTM7MC0PfUOLR0yBHjIkyR0
         YZScNFZuayFYAmRwC2XDi2Tn00WxN3dsZcc0p5J2WrkFxNdazIiTQpjauU9Z8qT5pxDw
         P3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=AoaRwNbKLi996/0POBjsPXJSSiuvDFgAN4rDAKPjI36Y/o2qY8NwSHH2LjYal9YyNe
         3Ym+0ZuZnc4WELY+A0wlF0x6CwKdM2rcfcVryEHUX7Ww57xCzXTD70a9TCywFFTTatSR
         utMSihpS9lJquD+csxf/q6D3VawrpwX69I5pSyhsjYFvqIvY0f6NwC9JnSS7tBu1byK7
         Am4dHAPmQKMOdecxIQf2plr8eMcnl+q8LgRoWbg3k4Q4DEqHfQNHbkz2gEjjGfS0jyEo
         ZAok9GQw9F93upi4B66tqsJLG+ItEDIkm3Hd5h+8GxXWBbeVu5eskK8T7fFU/lSVKfyq
         DQMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954197; x=1795558997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3q13oIFHchXPM6DaArLZ3eJnxMU1PA66WCABp41gm7Y=;
        b=tcKJObdbgI/d0cmusIFAvnCjfBLUQEOnb/b4vZPxWQuIp/8yXQg6KP5iI8O81H6ySy
         InpjCJjtJ/upObPMff7zqGCA/wIbQXNNe04I5pZFQIB4+2SJfUxnMEtvVordq7Kez4P3
         eUSToROLlwIGN3nsRPc5ciblaTxGHwFuYs+HHESn5EbX8cu9xBTYz4ODjN29VQ1aFQ0Q
         X0zjHrmqc/6yJX6s6J4OGjAdpfn3435+bOeERN4w+4KJ7s++cvS1jK/wo/jSqrERkaBd
         T5Q2tPDXGPq5dmqpNAcG8Ve7rAzFV6VtOYTNptQaRvnblxIYMdicsSj8PZOprWvDrMfj
         ZmLQ==
X-Gm-Message-State: APuU4Z8JwgiVchFqzfkangFdvPJhYuKWsh7foUGmDjCM3uSshunxN9C+
	Thy/mEKHdLLpJDaOEi9Mj6xcy37rInARlHG+5USoimg9FAeynO59dB3S2uCVjCRCe9gqMrE2ZUM
	iZW/ulioZuWpLh6n/+J1qhzjfZTBK1op5IQHGCenGUF6JsIKNHUu0ElBUmYguQPcxMW6eZ2wRpZ
	2HsuO+3BuvECM3PlQU0r3Eym466Qnfn5/LGkn2cgk=
X-Gm-Gg: AZFdTZdm57MijlaKZ1yh6lVWxDzNXbR5BK89rsnPlIEy2wAoM+0xHhg/ExSIlZmuAlT
	m3lHwy7G2N/MHlUdr3qjjmxvbY6ks6B2twl4VYZFh1Mzp/PZIySMrrgMqo89fdmHOm2fHSAUDB7
	QN8VIzOkA5Qo2ZlWIZmekNa1H3n7sin338/2JUjFT/ZfPjpQk9Yt+H6SIgQBhWDzeb6xrc1iwD6
	MUhZIFiirJNNfl6SkZ/fs+dX9IadFexCbLFEC5eKCRD6FA8LnY=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr668816a91.13.1794954196798;
        Tue, 17 Nov 2026 14:23:16 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr668796a91.13.1794954196341; Tue, 17 Nov 2026
 14:23:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-6-toddfreed@meta.com> <179471269695.2199510.18062590833471363525@kernel.org>
In-Reply-To: <179471269695.2199510.18062590833471363525@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:23:05 -0800
X-Gm-Features: AclHuK_fZNKIqR9h7_djkUI-3BJ-ndjBhRGAOYb0D1EyikjXTaP2ikjH-ZrZrT8
Message-ID: <CADh2yMzkbDDFt00Bnd50HPFJf9-HcKHA8BpfOikBUPHjmdZaAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 05/15] net: add METADATA_PSP dst to carry a
 psp association on an skb
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXwRt4gGP8y8A+
 yR0sDJg7a1FBB0FKPRDr7eVezBsGgO+aXQiPDDYabr2JrIUH05KKu3jN0yLQ/qsjhI7TAokGtWJ
 eSuWnDuLYHu7MH3B0/WAHgmQ06g2RC7X0cB9vkZb0KmOWR6588ipoGoaq6DYr9q5Cnt9BRVZsoG
 gzaVGnz1GpgYiLH7eiK+5j8SqEzPjxogIHBvMIUTDp7HDPS9gJ+Cw2kO/vYBhWlTMLyocjMQn5t
 sd02S/cvgqWlkGpwE5mObabnNV31Vt+2FNrQOuyp0mW5PvRbiyMTbquv4yAHueABoZTtbrwXeM4
 X3XSciXsgBlt1Y9/6Et0qQSv319IiHskp1xKGrNChHNmv+efwnrivW+xIawOFpVJrb9SRTcEk9H
 9XkufZMq3r6fyrpyt+i1UYqh37EbzvAnGLnqz+HwyITRla9m6xAQWNVk+GXEMxWsrkt5TD+PDL0
 Zb6Hz/MIUBnldBc81GQ==
X-Authority-Analysis: v=2.4 cv=bJyDs/+Z c=1 sm=1 tr=0 ts=6afcd3d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=27JUocoGZ6S1wOk3j1gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: XNH48tCsKJ2yCoy7OeUam2Ww8bWNNAdB
X-Proofpoint-ORIG-GUID: XNH48tCsKJ2yCoy7OeUam2Ww8bWNNAdB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX1l2z8ac3KBm5
 PmkPUZHbEUOyhJG+5ByCJdZ0OtuRxrF4PN3uPetyhTClOYP/IqZm16sb0epn5GVcET0T2I5KIgm
 HaQYLVh2mpydgMO8yiCUZNaP5/GxqlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> The commit message says this re-check handles the case where "the psp
> device may have been unregistered while the packet was queued, and its
> keys deleted". Does that still hold for skbs that get requeued?
>
> ...
>
> Can this hand the NIC the id of a DEK that has already been destroyed, and
> that may have been reused for another association? psp_xmit_md() would
> catch the psd mismatch, but it never runs again for this skb.
>
> ...
>
> The socket path through psp_validate_xmit() was already exposed in the same
> way before this patch. The new METADATA_PSP path, however, depends on this
> re-check to handle the unregister case.

This is true, the checks do not handle skbs that get requeued.

As noted, packets of a psp socket have the same gap today with
psp_validate_xmit().
I'll send a separate Fix to net that covers both. v2 will narrow the
commit message
and mention this gap explicitly.

-Todd
