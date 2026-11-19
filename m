Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795096769;
	b=jTVs3FeHNGCH4RbndUqIm62/MiprUFe1DMWGyN59vFSG0ThqQYedGk9AmuijahN0aEUm
	 gjrUcx/P1t0u4xo0KHGT3jKf8npKrX2LUWXWM1SQVi4CCnyiAfJBf59EHIzAgCzNM0Fg+
	 LAL72GR/B5l8XAxc9y2YC9MTIC1Rne0jsCQA6G3cg7oErw7Mu6Ji/YEWcWK5RRV9iJs4N
	 Z0Hq06Na8Jvgr73VPxGgbp+B21lnqfHAViPPOBHBZ/1Y1C7YqMO8VHucqpknxlHQnLMCn
	 NYjtXgdjX+km26YSNH2YOgjfcubyUaLHaVYAP447ZRNWMargMeTXnqAgPVo3ln1JTIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TcRDSmxP6zrXXOwn1D/JZjQjo+HV2O0dDJiN9wjmZqA=;
	b=VffwrRmR6veLTJGVRj2v2QZa0wu0Ce6cR2lI/N9adjrsV2nXU/+GVx3zt+afWDqaLQg6
	 nVGHBTGRGOQfg3HvFB8hNKwdzGv0/5AGnvhXGDnXQ3mNIn6rqf7I0K1gw3YtnOy+en5zO
	 Osk7JSJPKITcXixrrDk/BWQO83Tjp5YnC+wUaynEjFt3atE4xG2iU1jZ/kLSLg2iaqXFf
	 2/VjFLdqSRV6m6efJWNLkHzreHv1Md18hwRr0/v1nEqLdUKcA/0BCVyOcxIskgKLK3NhV
	 6ru02kBnh+JNM/dOtVSUcXmzqLMN07Z1bX5rf7we7fv99uPO3a3lZFIJe+7RErI8MTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SZ1IVyY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8797E606A339
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8797E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SZ1IVyY/
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14470729eso1687547e87.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795096768; cv=none;
        d=google.com; s=arc-20260327;
        b=a8ATZ9Rph8DcySMX19gDndFzCXtZ/vQTsN5hwBF+CDuw0CcUgnAtbnyiIU0zTYopbk
         +nBvJLH4RVMQG1dEoKW9JYd0AOE+Bl7Se3MTBgAIyE8EKYdRrXk7BhSyldyTo+kGP/+C
         0xSwTbGyl/xRk5CZgs9C+R/sLqhwgJJpEOe91/4H0LdezmpD43Ke4tHYXZaChgBzV6fu
         dyGx5ARyrWZGfy32esvCS11Z8aJZZnBVLJpuxvEWpHAJIFkxUzAunuWZq8TfWxFxXlRa
         l2H7iz8JAZiuTRGpLVBAnT0ELjVNmPE/oWXVqlgVsckjYQ1zaqqJPoBlpIBmnAYjmvzY
         kMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TcRDSmxP6zrXXOwn1D/JZjQjo+HV2O0dDJiN9wjmZqA=;
        fh=K6K1hLtC2XVebXxTc4xOB4QOUSk/bML76ZtLPE77ano=;
        b=eLaynPhEeTuuh+eOXsB0n9F/bVzVZjbUZXqL84msheY4tNE9jLIvKi/XAKonEZMB2V
         GHVrWTL8UF3TLJdG79+wkAF+Ion3076jNk7HtwS9OXu9HjO6rM89/dVDl0RhQOUx5T+v
         Jlrf7bxpjEjYJA5hs38BnqFetQaCwVWsdU8plId4ftc3Lt4/tAx0urTEsuyLzWFvr2d4
         AP6dTv78YRHkriE9pRBLWa+GHUfqZR/Vvby9qBcVvw0vAVoU2Oa89bpaxIS4351vEtDH
         g1nTzewrTkGEm8G97RXZUBf7mxYHjo77ppkw2ljWkP36EVq6sKc3f2yoY2WL05dVXJQm
         uIzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795096768; x=1795701568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TcRDSmxP6zrXXOwn1D/JZjQjo+HV2O0dDJiN9wjmZqA=;
        b=SZ1IVyY/NIo1cO/0Z63rRhIbPTAcktKZBXOjucyYeUpIoEhJdkcZKQOs/JYbmpRS2X
         1mxyAHXce8t5KJqDZTSvLwfMGSlCYv/1cR8E5bz3+uGYJdWxDCGOaeVKIg1nnCZOCfUE
         dBcL6bIxaH/l1xJR/Xzy4Gqz9MBo6WpnLC+IkdiPyZOLJdsgjEK4AUX6qr3YXel6nyzU
         YtPM6+4gI9e88av5HANyVOSoMJBosyF/38mBODeTKXfdDvQ85tmjPX/DcZLzPx9hOtxT
         2IQhpgRCLkZ9zE3FQDkYRKbCRR4ccsB5Sk32fJRqw3g187QtdqXbA4h9L8MNsizHpX4m
         9bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096768; x=1795701568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcRDSmxP6zrXXOwn1D/JZjQjo+HV2O0dDJiN9wjmZqA=;
        b=b9rzmBEIXX5MtG5AYSnXv6X5MFZ0VdnCx9J7Awqx5ckW4VRTu3+q0IlzFqCH0H0lS+
         yZMfsliIRYEyv9cRT7Svydng9AM3MF02IBrzMmfLdjTxEEkUqLaYLJc/THP5kyZFKzN0
         19OQNGHwff6SC3KsAVlYn+pMpILd7WGK1zoaSHSilesj+UNGBZcgzrT6w51qSOgb56bl
         zFMz3ZdILaouEuiFJAED7m9NH5jVrQRXlRX0BRsUWYcGy2KbTNQf5DPWkXSThsiDvkbv
         2jc5ucBUA2+baSxp+FvHcB4XD/JCssJ27SIVWGD0AKtppsUd4Vn00XlF4MwoDtpILZMe
         03Xg==
X-Forwarded-Encrypted: i=1; AL+hErHfdofLjshLgukFlC/RQ+jwNWbPi2jiWkwPuuiedOThi8F4X1yUFmJeChPR/H+5AByNL60hmSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Er3r5EIfMNziceX4uss48C3D7ZFO2Clcysv3j2YtO72rBRHBM
	kBwiakInYZONxJz6KR0R/UzAY0DyxJMhBziAzh1Qac4EtunkCB4AhJJRCJ5J7kyE+/0yv1uciNX
	PdYNokrDuUV7wGVoConEJBJt8c4N5Cbw=
X-Gm-Gg: AYBFou1DrqMf0H7FJfCmyuyNVc6teIj0v4FnkCtHJ29qoLOIhiDJu3EQXTTK6K7SKtY
	n1XMGLUne7Ap8+uvy9fQ1GWgISgn1v6mNFEkM1nn0GnqjV2Y7tEmER4gEJdxLddu2HTc+FgBjwX
	FwiQehosKEEVv/C2DqJIwMH/PgQujathYRICN/xj9Q2jUVqF6rqzDoPVLoT6BcsMTTmeXIyqeBG
	t3LNssW/mzzxElrB7ViB1LLbjw/sl60TrXieA1bh6pOvXkT4VGLXOWLjnlUEvnbUTNtzrakewdz
	XwR2PLrNO0JU/fKHDBhBnGJ7QaCvIAwibMw9I/q3a2gy1Lw388hXTmJxcEZ13VYDsCCTDMa1v87
	CIfXusrupgMMFfouSnnNQmkCTzMzLokTmNWx1yIuKUZVS+JWDjKGUwLzad8ctBSNSd7pw8GHvmX
	fIVbwJQqret1IEwTgzgRdQOJ+UQ+LzisgEFjXofq1+w9QbS1lSfg==
X-Received: by 2002:a05:6512:401a:b0:5c1:a828:499b with SMTP id
 2adb3069b0e04-5c1a9b72935mr2080742e87.2.1795096767511; Thu, 19 Nov 2026
 05:59:27 -0800 (PST)
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
 <CAL+tcoC=w6j+1p8ovjbLxgb1QdL3ipic0nMOvX_9OJrspSQS2Q@mail.gmail.com> <arKm5gCaERk6MaGA@boxer>
In-Reply-To: <arKm5gCaERk6MaGA@boxer>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 19 Nov 2026 21:58:47 +0800
X-Gm-Features: AclHuK_gBSKFSHUhkj4k386tuwTJR3VkWg4umQzAXycz3vO5NDxK_uvKKP_TdM4
Message-ID: <CAL+tcoB8f7H1ptcEk1iVH065AcUNPEL2V1gKoJacwr3zndfPWA@mail.gmail.com>
Subject: Re: [PATCH net v2] xsk: set network header on skb at generic transmit
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, James Sawyer <jamessawyer@outlook.com>, 
	Eric Dumazet <edumazet@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, bjorn@kernel.org, magnus.karlsson@intel.com, 
	jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	aleksander.lobakin@intel.com, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	syzbot+f16c1b285c9f63994eec@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:06=E2=80=AFAM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
...
> > > The minimal reset doesn't help with the checksum problem mentioned ab=
ove.
> > >
> > > Adding simple logic like resetting l2/l3 headers doesn't guarantee
> > > that csum problem won't be triggered. Adding complete probing hurts
> > > perfomance for sure.
> > >
> > > Maybe we can cook two patches:
> > > 1. Fix the current bug syzbot reported as is.
> > > 2. Fix offload logic by adding complete probing
> > >
> > > @Jakub, Maciej, Stan
> > > Do we need a complex logic like af_packet to handle this?
> >
> > Until now, it seems we've got three fixes in the queue:
> > 1. reset mac header:
> > https://lore.kernel.org/all/20260817153957.3177627-1-poros@redhat.com/
> > (commit 35fcde7f8deb "xsk: support for Tx")
>
> Hi!

Hi Maciej,

I'm going to revive this thread since we all received a severe bug
report regarding this patch privately. It points to a potential
information leak.

>
> I'd keep this separate and focus on Eric's hint to fix the drivers so the=
y
> use skb_eth_hdr() consistently
>
> > 2. reset network header like this patch. (commit 3914d88f7608 "xsk:
> > Respect device's headroom and tailroom")
>
> For packets without CHECKSUM_PARTIAL, resetting network_header should be
> enough to fix the negative offset reported by syzbot.

I'll send it as is with the correct commit message by the end of this
week. The blamed commit is 3914d88f7608.

>
> For CHECKSUM_PARTIAL, however, I think we need to establish proper skb
> header metadata. Existing drivers do rely on it. For example, i40e and ic=
e
> use both skb_network_header() and skb_transport_header() in their non-GSO
> checksum offload paths, while ixgbe derives its offsets from
> skb_network_offset() and skb_checksum_start_offset().

The blamed commit is 48eb03dd2630 which is different here since it
should take care of the new network reset/probe logic regardless of
the current patch. Since the blamed commit is not the same, I chose to
send a separate fix after the current one.

cc Eric and James

James, I would add your tested-by/reported-by tag if you don't mind.

Thanks,
Jason


>
> For Ethernet I would avoid depending on mac_header here. The frame can
> also be non-linear with IFF_TX_SKB_NO_LINEAR, so using
> skb_header_pointer() to inspect the Ethernet header and the fragment-safe
> VLAN helpers looks more appropriate than dev_parse_header_protocol().
>
> > 3. handle csum offload issue by adding probing code. (commit
> > 48eb03dd2630 "xsk: Add TX ... checksum offload support")
> >
> > Thanks,
> > Jason
> >
> > >
> > > Thanks,
> > > Jason
> > >
> > > > network_header as a placeholder and drop the claims about the AF_PA=
CKET
> > > > convention and the absence of checksum offload?
> > > >
> > > > --
> > > > Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#=
/patchset/20260901083325.3445-1-kerneljasonxing%40gmail.com
