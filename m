Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795140856;
	b=Xwldr6J7mDu0g0MQjxP0p0rPMsRDChcur12uEXilhQvi+yTCFgluhbtAOuCzcLJef9jA
	 hpXcFhltMlT/ce2q7ZJM/1ME5zbqRG04B6wqOk21dnwMQkP4SZJ7VTLDxUw3bUGgj2CIy
	 GoZBoVhGM0rY2e+RhXsGau4aHcPi4x8/qlq1h4iKNXbC0NbbbkoNq0TqKhDe3kXXr6w8x
	 msA94jy1V967BOeDF9SIHc8jzTb4K/7wIPiZcN6tP42c7OIXoLnyGo57nFM+jE1+K08sx
	 0kCH+06/elpIrU3veApskWJGNDIB6pMyFHMxS2Ix7UPAwGdBA8Rkt/3zZabjBarXqxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qwnuquGI33r38NkoJ7hs4vNmYK6M6vYCCd5IUaSABRI=;
	b=sGF+aRW1tOmPVMytuxnGR46YLkPQkMN+01nC+55uaJyWzqE8T2i5XVD0emY8hSPEF5Ai
	 7jE+i6g5uk+/SrAaE9PunV8u1DmvvDhfBk1Y9QhFPBRdWlYlCt16468IXHUEevHhnEOMu
	 vgR2H2pehUlCyYQ2tuO0mz6xUOyaPkYWcDKZtRjBPeeDfcVP1LpV8F1+zdu19cNTKAop4
	 vOo7AmwJPbM7K4xlw1T8LFk0mzT2UJzQHS3/k8GLX7fsG9vv4LmzBl+UQCb/Is3efQ38c
	 88hWRxWaUyMLthhLLt5/NGfHYbuXyuSGbcu42RrHBl4iB/LMovd/yB0lslryG3dcceA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kW6cvAn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEB606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kW6cvAn
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso2814231fa.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795140854; cv=none;
        d=google.com; s=arc-20260327;
        b=Vl6Hv6t1JEVjzeaiU1RDJ2KBcsOTda0cjeg7tsfB3aB2N0g1cwXRGLKpWcln1cCrpO
         HFiZFQw6LdvNlBJwg13qbMewJmZz78Qxe6p6kSbjvWO650pRRh9s2p4Pq8AIzdpQsdfn
         qvKUMUrLYt6NUCK0T7d/r4Fd3bzd5p9PAPo3kQ1agNNcOIj6HWmnmKXMxh2Kn1F3JlmS
         hJ0op0pYqLLuWjjiXKYdEH2bxh1pOiFts/mUrcc4XRU3XsuMuGiczhb+/9m6VMD00mxz
         xzV1B2P2/DroywnKkNk6KSsufnjl0Cf5xx+pGqv9e+fXxPheUGsnOTspep0cXBKdKPVF
         q+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qwnuquGI33r38NkoJ7hs4vNmYK6M6vYCCd5IUaSABRI=;
        fh=8Usd3OzGvHNPWBLWoyPNQ4ddQawVO1uyQVGHdj0AdgA=;
        b=PXxqF5JkzJ92iIxVMO4TO3vw4rdsbE2iCHylEx/orwLYVaEWt7dTqE977R705uRPlH
         DBgdsqmQ6p8FiqW94qX8vn5ZZJ2DQXKQOGCOAYXouf/Tvn47y88WdH7Wmf28Y/oEpFtO
         yThxZ8vt/Ig5wE4FK3A0F+nf+fckan3yBAgnbsklAGICl1v7kCVTAvQZusgBAOthi5+4
         xSYtnuAjanRBM4bjPfj+pId0HbkSlQDwnDhO5J4sSZrJ3EwK5Y5juIQTdXKxjQ0SL4Q9
         DkHhhWZg8j5BohQevmmpR3QzC3mu/A8ckuyjelnFl0WoRkfu6Slceroe2nke8ltr7ie0
         TMyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795140854; x=1795745654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qwnuquGI33r38NkoJ7hs4vNmYK6M6vYCCd5IUaSABRI=;
        b=0kW6cvAn/u+46Lzn5PS5Ap1ds5CSsxACBzwVNGwMkfr9zxFjcoHXKiffC4lGn8qlQY
         gs7g1FBDGe6wQWann4Oy7uOgIecc8hJkQTZ3qWIkID4t5qKNm/h6wSUI2atR5eOlCecm
         8i1FnV+oBCkpLJjK3JYYTIkD8/nTc5an8UxL63Ga4WvDa2ffgApPIpkMgiuSyymvvW88
         /wD8rfyomJiqtAKs3/N5UlIM1NSfpiLZwWppBVb81NfG6FBXAW88pLA2NsweTADdsNet
         sfXVR128Lbw3O1/hsvm2sQwRPC7J26DbYtfuM0wz+Dr0pMwLL8puyKMlmouaL24huHYV
         2Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140854; x=1795745654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwnuquGI33r38NkoJ7hs4vNmYK6M6vYCCd5IUaSABRI=;
        b=1RIJr5jagi2cF0dozLDNuEZXr/gK5BIhaRvT0TP925/HIBX8qId6YBO7Xu82S/Jo9C
         OO14JkTypI/D/AYXryZXCrN00JbWRchjcy7nde79kjRyCOm4ggFCS+vDAxicmSjlGfyg
         5ef6IqkEKCyuBmoDvEjk+xvpnQ6eB1aY0qDPqZqQBC+VHCp/L/IsLMjACxDf6UiLQa20
         n7KyCOVAf/bpTkT2PjuQXvTpgxgJzPEX7FXEMmLSqAKezI74are5H71ssd/pQyNrUw++
         HkpRl/VTkvt4YJCGbAtEQjXR/S/RIaZ1nydw0axf1Zid6uqnOIIZcwg0PrnBitH4SSSP
         y8ZA==
X-Forwarded-Encrypted: i=1; AL+hErEOrGhG2/+98ULQeWI0s3rrRbuiyctBEObk97DFEsBnceNFKX0JNba8/mpg8rZQIRvVNudshLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z++rLwj17UGej/l95qnbMT7Wv2cK+tgyrlSKdCLn2P6mDsPnVtj
	dB3tAC0y02LlLIJflrvVTnGQBx/TxJZmW7dOcggWKhxTLVQtLvZ3BOJnolzzP4ZumIcKgbi+djx
	9MlvdHB2O01cbFFIbSUG/C75AC9+2jEA=
X-Gm-Gg: AZFdTZeg42R3rsGuk+o8XOyOSQUMlo2VQi3sxsSFWvTt2Q7eehxc1SyZC2iBdX7l41t
	XGabtBo7qeOL+11eLBwaHqMhBz+NIZ8xvln+rXactxDZpg0pszlo+gVEAoZmIBHreNLM+MkzCji
	uxTZs4p6xCJRgGiWq2iBUAUePL9pkyQWexRyL+grCyRmZTdCYOSam8LRon3tb1UF8BoCP/SjkmK
	PXq8OlbK8DI3RCBwd/duxksJ9QMhsMYSuRRsWRqt364rEVJycLM/c9BRW662HSgGSIE50CUo3FN
	YgQhBKj6qYfI8e8I4Tu3GXvz7A4nqC8MRqvc6H7Z2SLumd9j6Re6bxgIgMziQw75BFjp6mrjmL0
	nm95TohDJ54+NzCTbYvEUZtCtER+sp+aJepQvEQOSD7+hlXYBGea5SYcogphB6ni7GP56+/fSyS
	pHLLx7IsYWpbFTTU8BzG8EDoop07hUa44ejteTEOYCr7RCQog+zmuxycQO4J0HS484aGvWeK0=
X-Received: by 2002:a05:6512:3d27:b0:5bf:c2fa:3261 with SMTP id
 2adb3069b0e04-5c1bc8507bbmr399936e87.62.1795140854265; Thu, 19 Nov 2026
 18:14:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260901083325.3445-1-kerneljasonxing@gmail.com>
 <178847847848.4131868.16090144540850507396@kernel.org> <CAL+tcoDpyG-Hy9mtDnLSGu0nvU_VDqTjs-k51r2+OPwVyHtABA@mail.gmail.com>
 <CAL+tcoC=w6j+1p8ovjbLxgb1QdL3ipic0nMOvX_9OJrspSQS2Q@mail.gmail.com>
 <arKm5gCaERk6MaGA@boxer> <CAL+tcoB8f7H1ptcEk1iVH065AcUNPEL2V1gKoJacwr3zndfPWA@mail.gmail.com>
 <DU4P194MB29716D57A08053EAF2AF4F8FA7792@DU4P194MB2971.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: <DU4P194MB29716D57A08053EAF2AF4F8FA7792@DU4P194MB2971.EURP194.PROD.OUTLOOK.COM>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 20 Nov 2026 10:13:35 +0800
X-Gm-Features: Aa3M54pa6BuImF-JDf3h3rfZH2I-9jKwu2Mik1fylUySCS_D0U-LbD7MWemGb7k
Message-ID: <CAL+tcoCKk1kLqYp8DJuVmj3wf--zPDfSkAGPGoJGr5ELR_nmBA@mail.gmail.com>
Subject: Re: [PATCH net v2] xsk: set network header on skb at generic transmit
To: James Sawyer <jamessawyer@outlook.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Bjorn Topel <bjorn@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:10=E2=80=AFPM James Sawyer <jamessawyer@outlook.=
com> wrote:
>
> On Thu, Nov 19, 2026, Jason Xing wrote:
> > James, I would add your tested-by/reported-by tag if you don't mind.
>
> Hi Jason,
>
> Thank you, I'd be glad to. Please use:
>
> Reported-by: James Sawyer <jamessawyer@outlook.com>
>
> I tested the v3 hunk (skb_reset_network_header() at the top of
> xsk_skb_init_misc()) and it closed the issue. I will run v4 through the
> same test when you post it and reply with Tested-by, so the tag matches
> the patch that was actually tested.
>
> Thanks for taking this forward.

Thanks for your report and the careful testing! Will send it by Sunday
this week.

Thanks,
Jason
