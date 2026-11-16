Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832899;
	b=xC13gjxcPKw8JN3zB8v3kLiXFAYdhTsdzrJkQOjfnyFsZIztRyjtTfYjThyH4xeU5HOx
	 13p/ajUQVX+AprCIfj6+PyhZnCINo8FqTRJNDKGNVn2TnzUqmKJuShA6QoXllQqiYkIaT
	 j+e5iJWF22tuU30b9DggGneNbHlXqPyhqPo8INfhaPvwUFMJw3Ms7nOl2iS9UNZj7CIKZ
	 BvpHuj/DMvcoq0AzhgZ2wrWmbJyyi2qJuTWq6NgYalZhVjSIgLeEhdB5m0BEexTEmq7LG
	 T3uiuab1s8PbckF6XM8Hh+HzY+ZwXDOQq1BZwfHhiRkNolgNO3RlBH6ZZcrf3fKc8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
	b=f6uj+WfxQ2l68ZQuQlYHmaLnmxk3H0P+HMXX4RQM5332Iknen1wmOBg/GiyWS+I1Gvpi
	 7y9YuYAt+TEmXTHuMPG/G6N4kdDy2XcJi6ADM33FQBQT64eBPEpiru2Rbu567T8KieLTN
	 0KvxSUiX9PDe6/EffJrgvf6NOuE/SVkvHSn002a6rE7fOh2Bt2Cm5Zx7CkV3s8w/VAIfD
	 ki37dkLmHywZXCvdY27Vkwk5qC9Y1IC3bAjFpUhaPg/L4RG/g4sHkv3LqsUF7bnRwLcUW
	 f7iK2crXgvEfbEPvz/aKT6RqxN3XdFOpVY/VJ7Ya6xe1hhmuZ0Gx9sNitWrH4XMIxUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN3B7Lud;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E9606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58E9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN3B7Lud
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94961ed97bcso277662985a.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832898; x=1795437698; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
        b=xN3B7LudVvKrw3MwnajaarcX91x2+u1HXG/hvHMEH3ZnHJFdDpZBBcRtAqROyBktko
         X46g4lw7rRY4EZfOp3U9VNr6Ww9uTMObjYHuKm64PuVS6VZiijyYuVGHs7X5V0C9S2sH
         x1mxiPCTUha5+oNdEVrKnYfP19epAeCiRmmWntH6obG78ytEzkwYSmqTjW3Hw4HoLh3X
         A5SxyRIs01z3DowJd6F9SfiCmRrBIb9SignCreduEbMv4AiCUejw40piWsIP9NWhlFMc
         JSmxkHyWstT7aLbb2I7brvegGr9bpfFwWSZB9k+n5CKscylv6nxsyvHA5E8qXKFV3wL4
         fvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832898; x=1795437698;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
        b=EczOVSHMTxfralShFSbjgz9WG4PguKAYMxf7QdEWZsydOrz/NUcpZHVmEm03Fxtmm0
         I/OGHWxTUiODzaU8eNPSVp3mqDejOZTFYb2h3btEfjTwgUH5K6Foy0wtbcLRUGLXR9dh
         lXFEMFQEyLZmyRkpEtGa5i+27p6KXMeB76VjVw2G3LvnMezV5vz1H1fb1/fy2FRtiqt4
         RQptDBaLduCIwIcpSh3qOZAriH2FwhMEtSaM1hVk+McTG9UTtT6Q5ndYipz+s+PQsqhg
         0gkDe86BkggJ/KnPJ9WRCGEScFGIbOtFTkQDqAGZDp8+IIcbPfrlV/zbqnkEcnLfPbaM
         Rppg==
X-Forwarded-Encrypted: i=1; AL+hErHMrhRRSVH0bg9xXVjlDIv3zdZAIHBdRYS6ib9iRFh2APzrruK/Q+Xf9XCXp48fcphh9H+phzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NodGaKQfL8wFsEXMi1ZQS/lSmtQ2xOGVurDRGH6XVXSE/713J
	S4Q/pBCCq88o/GGXxYeaz4HXt4VF556+148xpip/yFGy1p4YYKqSzlNY
X-Gm-Gg: AYBFou0plem3QUvryHUJ5anqIEAJJ5X56uoIV8kbf3+Xljbcmo75NAuwYRoWxkpkt3A
	0KCNdaoSNLNY3W+miYp+QJF2cT358KUfJZQZHM4eKy81824wyYln0noaUmbAAPDYwhwiHXWlwqc
	gpwzYT/ZWYLm2fIRWjVyNroEfYGkGdbw4/NVatDndPdlNZ2X4FUCP8M512x59Jf/Gj9Gfkm+7pB
	EU0zRWcoWztiDFDMRZ/BLq7EkSpeYgfmo7vrtetSIkc+T7O0F33UVlS66Dki4UXj2eXYAJ0AjCz
	T58qjTWxJ5nuaCSq+XCxJzslVHQUcVRHx8Mcxz744dqqBX6tRJstgD5ANSnURj+svX/ItsUa4uu
	2svVaAvbWF4P+wzF+woErYR6O7Dl8VXTrXhM9Dc7/645RutTCIzZU3oZbWOcJJCP7R74Fckywm4
	XfivztmyRDJCzuFbKAxmvGgemfSAV2Z0ZO18r3Yg+xugPgqSNi73L3rGPjUTZeTzBNZmz7oSpyS
	msoXquYlnSq4cx64PVTiYg5cXQjyJgEf8dHHRGpClDKmCrbeVkNPymcdJ1RYoGjaSTEbroHO5DI
	o2zg1OywxeyaH96XFyNwvPzoVT1zU6em1w==
X-Received: by 2002:a05:620a:2903:b0:93c:a40d:e3cf with SMTP id af79cd13be357-9494b9c78a6mr1739169585a.1.1794832897831;
        Mon, 16 Nov 2026 04:41:37 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870ad4sm830567185a.26.2026.11.16.04.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:41:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 07:41:30 -0500
Message-Id: <DMWN5R6QVUPN.1KP7SYYHHU71U@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Daniel Zahka"
 <daniel.zahka@gmail.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "Wei Wang" <weiwan@google.com>, "Jamal
 Hadi Salim" <jhs@mojatatu.com>, "Jiri Pirko" <jiri@resnulli.us>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Sabrina Dubroca"
 <sd@queasysnail.net>, "Boris Pismenny" <borisp@nvidia.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 3/3] psp: only give time-wait sockets of PSP
 connections a validator
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261113185553.171059-1-toddfreed@meta.com>
 <20261113185553.171059-4-toddfreed@meta.com>
In-Reply-To: <20261113185553.171059-4-toddfreed@meta.com>

On Fri Nov 13, 2026 at 1:55 PM EST, Todd Freed wrote:
> psp_twsk_init() sets tw_validate_xmit_skb on TCP time-wait sockets.
> Today, that becomes set whether or not the socket has PSP offload, which
> is not needed but is harmless. psp_validate_xmit() passes such packets.
>
> But a validator makes a socket look like it has an encryption offload of
> its own. The tc psp action in the net-next series "psp: introduce
> socket-less associations" relies on the presence of the validator to
> determine whether the socket has an encryption offload.

I don't think this is relevant.

>
> Set the validator only when the socket has a PSP association with a Tx
> key, as psp_sock_set_tx_key() does for full sockets.
>
> Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  net/psp/psp_sock.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index a6b1c42dd626..1df65505f1c6 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -314,10 +314,13 @@ void psp_twsk_init(struct inet_timewait_sock *tw, c=
onst struct sock *sk)
>  {
>  	struct psp_assoc *pas =3D psp_sk_assoc(sk);
> =20
> -	if (pas)
> +	if (pas) {
>  		refcount_inc(&pas->refcnt);
> +		/* like the full socket case in psp_sock_set_tx_key() */

I'm not a fan of this kind of comment, but that's my own preference.

> +		if (pas->tx.spi)
> +			tw->tw_validate_xmit_skb =3D psp_validate_xmit;
> +	}
>  	rcu_assign_pointer(tw->psp_assoc, pas);
> -	tw->tw_validate_xmit_skb =3D psp_validate_xmit;
>  }
> =20
>  void psp_twsk_assoc_free(struct inet_timewait_sock *tw)

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
