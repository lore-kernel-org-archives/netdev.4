Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794657899;
	b=c1gCwTyKl8xozRteSCgYR7MJ/G8b9POd6bbhzrfCEGjqzV9A2Gzan6vUrUWvgiu7f5cF
	 rY/T1Eft0EjWPBiiMC2n/HiCkMisnc0ICNwwseH7CQCtu3IgMbHb9snO+V/IUULKy58bn
	 bxnHiWyZWxPqEfjtN2JAgO0R47N1sg2Sv1+r97uXdc/iCByMwGjWBdJBIBGPz2tcxdyk7
	 un+9JLFMUiltxj2nfUWNG2WwUzELwNWnfzUGIVRQuERYLTYYd5c4QfoOOHcsQFc17Yx1o
	 tXPRaz0F/iOa1omebJMEex+uEpSq58LTWkKqV5Bq0dS9fB3/imBMisfvXJ/+fUKTluQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
	b=VVIQ99syWov/A7pBJVVs58ut3D65BmgZrk466ncz4lgn+BokMiS8YABSTifCd1S8f6Qu
	 sZotFjXrl7yRl294pHmuXBzsr8frChOpI2p4PKU/EelcxClWfMz6r1NZgCbO3gVzxg1cI
	 4kWdqG9h7ul6mKgxHE2i3xTFdSE2AcIbvoBKr9KtIH3Z+ZIRlbrCjHHV7xkbgScNvFJ2a
	 H06DrjgGjJ2wVE6e0Lc3fUC7aaBIjkLQZV0OFhFofxf4bPhQ9eLpXsFkeZJ6d1fbyrunr
	 Sqa0pfQZd0LJWB/mF36O2xRFbRkaEAN0/s/7zl9H10v/BcLfS970c+uD4tHHx2WAE+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=t8fY95lo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E0606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=t8fY95lo
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so958503b3a.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657898; cv=none;
        d=google.com; s=arc-20260327;
        b=KyuDwh7FomLELWjtAuXQjj7D4kpg3NqL2p0fCQC9HsQOwvPHAfkspD4h5ZoMNvk1HD
         GrByRkHMMOuOBGf8YvaQyECz+zmSFzAd5ZJPbXu2/MEo989eBHzW9NM8jp/Tk6jRb094
         ecPz2q8kvtNqlGls3IPl4cjutSU7/f2++IYnfFo4w36f1vgyVAVdH2k4MfSxDqA8gkNA
         Q2G3O7acod5LBBzbSsLCg8xZIW2A/Ze6geASR53bqV2z/bMgdGH0MCw2t7v9QmD5owcQ
         iCvSDtgKJ/xj3oBBGp4zJBN7J9744AbbMfs1lWsOpTPabzIV0vutEAWm5e2E3KOeIa5H
         6RNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        fh=rt2bBtfPTBjsa1SR4isBQmBEoLq90E9Z9XMTQkUv2DI=;
        b=qqtIszBc5kdz5AiiBoKIYCi12/brtHjUIhC7bt71KeFMRdX4Q5TFQeUUffeQ8OpVsi
         IjHk31OXCiJTUXTenMUDh5RRFz6WCOW+BOasV560JiRkXIyDzfYWc9M6uBLotQHML8N0
         DltQ8o25jLQkKJnaVA/zp62/+bcG0eneVZgKF1GWYufDjX2MinZL0r8tSQ3UnOFfRfTT
         b1m11IKGsZoUEC8sf5K21cJqWtU47EE+ebh0xLWoVgSm/oo0SNqRFN2725qbTJMmIAis
         K2yeRb24ygMZpbMPa9cfNisqw+CEM/IYN7qtuAf6clJRGzOuIOTR9YYjkiGzBZDCqf2h
         r2xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794657898; x=1795262698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        b=t8fY95louL73YALHqWLdAldiJ/r4amI16c1eqOrXx3jcxfMoZqAtjWM75h5sjD1Mpp
         lMgAUBaz5oH5XGG95vbTUw6EcYJB1G6zGGuvqnJ2snSxN7Pvp385ga6Xft+w3+RcOsPK
         KyVCico6t7O6BtTDrKWFmk1JK1g553StTKLZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657898; x=1795262698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKJ+mTdGFKhhnohs/NLJjgkzp0d0JdJ5SvOCcapXCp4=;
        b=g7o3ORMummmsNLD8S7sDyKlnhCgkSwj/NlsgcCJ4s3QAGzPh8T5PN4GQ3U3PkAb6HB
         7fLoSlpXmQYQavJwGdBTZvSrMEPT2BIPxhLEyxHvHrrQUHTyDJzuSMjvYNnFuYgIzbzm
         vHr3/c5AC8a5/Lt5ttgORddfzb4xOxxV/0jACZePyPgNzltchhPiLHTt+vyhFZroW++m
         crH+Ha0vI7nU0gTBE8/lbSSr6oxZZNvl+wRu+pon1fUvxXVTZhCSR+n4ZWctIhWJpZ4W
         ABKrVV0a1gZ2DTUVA2haytnpQ81cqJkjIMZybCS80U+XjaZsg+72fjdXRKt2QpWbgOav
         ikoQ==
X-Gm-Message-State: APuU4Z/adH+45N1lLa40xAOT/iv6H9FzYpJMW4ilEymyeh2MUjfvj5+8
	g8teLN7uAYlS7q60DMkcyoxY51AStlI/73vU9yu62519jAwd8RetHGy9LqjJP1CQ161ev22R+wu
	b4OZ0cUhemqPwjaFGj9yCN9284hBjxNQqCoAjNoAk
X-Gm-Gg: AYBFou2nh2KdINY/fjbLYRIxvK9DfqD+tKULYj6PON/rwxbRu6tC6f7juenREbC4l3g
	1yM7+RVPPjAj2MRHzk5yrKRchAKn1AhK3j0aXUcuM/amfRHfDkd2vhex2z6RZs44oFZx3ONzt9C
	zZQP4C6Zv1rA1dK7z7w10Nnuun46y4SiIYN8x2IkcRVJ2HegAWJAgX7O7Gcm9ZA2XoV2ZiuDzSo
	tKUCQRbMSSwNOhXmnYyE3VSF8NTW66fCQmResI4m83rZwfZeJw1JWAoE2gzlBQ2l6+PlbZOzb2H
	N0ZSH9Dzn1fbE2EslLhJ7viyuWQabKIObrHIv57BK/58EBWpWfT1tTSyIC2d+BR+TERUQRPR8K4
	WxArjHJ/xR9ylKCaCuHlKgdfn6ABgtsBdKn6g7CMdl2s++J+iYq3JCZp+jyvSMXavssX0tM4mkv
	qA8advOCTNWKyHXvw=
X-Received: by 2002:a05:6a00:188e:b0:8b0:4e79:b3b7 with SMTP id
 d2e1a72fcca58-8beb63a2bd2mr4941673b3a.31.1794657897786; Sat, 14 Nov 2026
 04:04:57 -0800 (PST)
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
In-Reply-To: <20261113185553.171059-2-toddfreed@meta.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 14 Nov 2026 07:04:46 -0500
X-Gm-Features: AclHuK-HzRxyaz50x2QBJn-n5uNP2J1O-ML4FbLSRGjiewNn8xPID_Ky1F0Sj0M
Message-ID: <CAM0EoMnJEGweo2oxJsgAjuwLDHrMAEEwuisFX-CDSbj+TvK3PQ@mail.gmail.com>
Subject: Re: [PATCH net 1/3] net/sched: act_mirred: don't send decrypted skbs
 from egress to ingress
To: Todd Freed <toddfreed@meta.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Wei Wang <weiwan@google.com>, 
	Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Sabrina Dubroca <sd@queasysnail.net>, Boris Pismenny <borisp@nvidia.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:56=E2=80=AFPM Todd Freed <toddfreed@meta.com> wro=
te:
>
> On transmit, skb->decrypted means that the device must encrypt the
> packet, e.g. a packet of a kTLS or PSP device offload socket.
>
> On receive, skb->decrypted means that the device decrypted the packet,
> and kTLS device offload trusts it as such (tls_device_decrypted()).
>
> A packet which mirred redirects or mirrors from egress to ingress keeps
> the bit. On ingress, it then claims to have been decrypted by the device,
> although it was never encrypted, and its payload, which was to be
> encrypted before leaving the host, could then be forwarded in cleartext.
>
> Clearing skb->decrypted would not work, because that is what indicates
> intent to encrypt the packet.
>
> Don't send decrypted skbs from egress to ingress: a redirected one is
> dropped, a mirrored one isn't copied.
>
> Fixes: 414776621d10 ("net/tls: prevent skb_orphan() from leaking TLS plai=
n text with offload")
> Signed-off-by: Todd Freed <toddfreed@meta.com>

Missing Cc: stable other than that:
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

unrelated - are you sure patch 3 belongs in net? Feels more like net-next.
psp_reply_set_decrypted() only sets the bit when the association has a
Tx key (which you are testing here).

cheers,
jamal

PS:- on your question regarding sashiko-nipa reviews: They show up on
the mailing list - but sometimes its unreliable so an alternative is
to visit the website: https://netdev-ai.bots.linux.dev/sashiko
> ---
>  net/sched/act_mirred.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/sched/act_mirred.c b/net/sched/act_mirred.c
> index 1c98e4d81ebe..52c3eeab381a 100644
> --- a/net/sched/act_mirred.c
> +++ b/net/sched/act_mirred.c
> @@ -285,6 +285,12 @@ static int tcf_mirred_to_dev(struct sk_buff *skb, st=
ruct tcf_mirred *m,
>                 goto err_cant_do;
>         }
>
> +       /* On transmit, decrypted asks the device to encrypt the packet. =
Sent
> +        * to ingress, the packet would read as decrypted by the device.
> +        */
> +       if (unlikely(want_ingress && !at_ingress && skb_is_decrypted(skb)=
))
> +               goto err_cant_do;
> +
>         /* we could easily avoid the clone only if called by ingress and =
clsact;
>          * since we can't easily detect the clsact caller, skip clone onl=
y for
>          * ingress - that covers the TC S/W datapath.
> --
> 2.53.1-Meta
>
