Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624415;
	b=vEJT76hhpj2XpgbUNPJuIg7niIurgnaQPWETMPCdbSJXRMfu+yTRCfRsFeQpugnOiqND
	 76uE8Pardw/X4L5s4pNhZZl+21UKC75spkKXiFkMiChQdB7RzTUNF/qcMmA77sF32ul5v
	 mKqGMD3miZLYb9+NnskfIA43NsjMjU3UAXZLvXGHLCl3C398AXMO5yyp9ITBZhjhccCkA
	 DAYavVrPSIpJwFPYX/zuuGF9qZuVv8KkJQuS+XSQCvXFUWoenhqQekpTNSoDwAq+RsXic
	 RRu5TOW2UbkawOJ7ig6juUv0DTlvMU1+Zoc7P4bvehGLKGvv1uhb8s0N7erTRWEkNcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=G8pGBF4gig+42xucKEgB4reT/S4vYsrjWIoua9qgDow=;
	b=mildX3OGr9gr9pEmsIncmH7dgEzClmNwBiQUFnJPa+2SO7D/DVA6WJw3UDxKx+1zRXFv
	 i6RXawCUjoV+AWSVFhsb7R79i/3aLj2gbYI578qFPJL+HIADfuoHJLDc7I6JxcI4v3C1H
	 OF5yJIxYy91OPi8nwNh/rR91U79Zr/wqHiZylFx19z39epO1iv1/ycXAJAb+dbxCYbX/f
	 X+dnI0dbXQBzylDCi+ckP37tjqXPrCmVZrdsPgHrGiKZFOk6Wv1ZttFyJ3dTU5wm1kDbB
	 tmK1IvRC/nkT03ZSTNucnMnvoi8ZQtnU7e9NTXVLt6zaV4Q3QHl//HfZy3jXxZiu7dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rbqg8zfj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD14606A686
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD14606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rbqg8zfj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so59674645e9.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624413; cv=none;
        d=google.com; s=arc-20260327;
        b=gprRu9cbdbVXPqdNmRvrgYJUGn3TDvos1WiIxavQW59RLSReFbjBvMe/YD/Ds26epU
         +MRR6ZXK4L9HNOksYdiFNl5oGR1mzdKj4yU0fRLZNDGe9ffNfpdxDFhrXbAyCWND4E15
         1Eg9EMcPLtDMhdThfpWPqtZvFgM6SLLZsDQpQxl4O2ow5haGW6WBxUo1gcmb56ZU2ZX2
         pI6+fNNe85+aCQHLTbqTpcstHStpbAcK3eLsS4I2IZ9tkvfAYHatNX/tKkapkTe4SwG8
         HDv12l/g4O1xhzF6RVn4g/NKm3SPI31b+A72i+NQ+I5xypK4+LBViTU9FvbYSX2RXlxH
         LhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8pGBF4gig+42xucKEgB4reT/S4vYsrjWIoua9qgDow=;
        fh=typ5iytBFZNAKflRWwlC+FuI/ueGyaCfhJQ9YN1Vy3o=;
        b=l3shX6nUlb46AaxeSaNeQ8HnGVKs42R11BEjRhy0dKnVsfsy+CRT3nI47Qq+RAqXGW
         BO5j8fgf4XBz7lj6Ba3mIo5oJ0wz26SZolfhyLabqZ8Szxn2DToGoPX/wQjx4xJn84nJ
         o4rV/zMb258xtEVR/2y6qS9v8ai3LFij1jwxmr+zQ6kNURet9q+EZ2akG5iEa9fGgyjQ
         b+qIcgCSIJeGlqY3HNSRLmBNV+c3S4YcKeZSE1070J/S4k31y8gyqMwk+Lo8oHh8y3tX
         n1Oh6Mw1ET9wPMuCREo/uf3LtIFa4vFuAluRzi5lqqVuiqhVpV6m76r9QmG85P8PFd+L
         hl/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624413; x=1796229213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8pGBF4gig+42xucKEgB4reT/S4vYsrjWIoua9qgDow=;
        b=Rbqg8zfjfvFC59XPp+SButv8F2T9dDxx2RyvwtNx1mAGakIwMBPuepMlgxF4f+vX+W
         sbwmxXnjHYQsObZystSYwo38AQrBj1Kh3s0bGUFEi9zlxfpKlZkDxoYWSEcDr6/UKU0o
         AHlljwa5KJwq4V3vjl50S3JakI8gNqAjHb4LqNXDXR8++IX7C2z3bAdu90NIMcYqN7O7
         pgxS52kiGgsCoOdHxPofoEgtXl4NLBGYvHS//vqZoeoH4EfUlZMSUTN4OqapTIY2EHfb
         aQfxj/U/8rOAtYu24vxfehm4PHBs736cLOlSQCS60eSnJuisfol8zLOMvsKl0upqhy/N
         0fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624413; x=1796229213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8pGBF4gig+42xucKEgB4reT/S4vYsrjWIoua9qgDow=;
        b=uVzVvre71PUA1Ou3XCtDaYr/J5onq/knudyQpLl9p7dkt0xxJPA5ScRwHQf88IVpTa
         NZxqcjKYBo5uC2rCMF4e1Ld4YPuUz7uZPmdtRmrV/ZxNEnz2/zlH0psmMkc/MTMbc/Z9
         yCzqU2+ZjisQllkrEfh3G/zGNEbeQxuUa5Yrmwh+vgaD5vs1HRV7Kk2qz4aagNoMZUCr
         xzmMhJmVtUOBTSwEsM4/AqNxMRiRo63atb8PVWSKxZsPcZv5JKuMLmonaQpEXZwOSAXU
         X1aJxOCprDex9QN5Z/IutS7syFoHI4Aekhm3WOGC3VfNyddlvu305wtfN50cKPa/eolh
         uJhw==
X-Gm-Message-State: APuU4Z+KDmw/gCwwmpFSawqodLaXbjEwbhc5uLfZ5jFGO+zgEurnMVwS
	5GptfKjjIlqbXGyU7Rt/qnfcrIUw2ElvGUh3HLJBu267r6CRClAAvvOr3bsyjJQOtca/aVJpd/q
	0JPh2CAvWpE4RzOZwZNmYHvOV2uU96LM=
X-Gm-Gg: AZFdTZfoL2sMaNh/g1UX5VT4pUYQBkvB+t4u38EN+xvtZg97RyDWbwKOTFAjWwIhIZG
	CcUXgKz28B5AdvqYcy0NVCVTYcjKCcTU6jhM+oxj2IBh9fwu23ONcO1T9iaUJetGu9jrr1W7K8d
	jC7A0caGP7anJttJq9CphriSyvIGSrTjhu6Lc9gfEEPZkljxZOplCnz8Tq14/RVXggzzEvMMkTT
	6DllOyP61I8biVvb1oFLgExAe9GnJU8M0a/4vGktNY9lZpkAGYGjPKOUy4iSuEGB8Rsd6Dt93iY
	u2zc2HyxWGEHapxteX1bAR7o021EzABhvzupQyhyyS5O9/xRsNaxRKEaGjj2lM9PwR3KGvEGKDs
	bozshorwSzoKC2tUh609kpscjaiUNoLZqI5LsUtrAY9q0hLlEmu/SF0N3aR72QOrBY38d8mnPFy
	AiAWzeCLvh2vDhBe6sjwbTjcsOAyIRZ4ILF1+VE1dC5/xqkUBU2Xx30QRD5EQh5Eu11rU63FZ1s
	Cw=
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id
 5b1f17b1804b1-4bb88816b2bmr398390865e9.27.1795624413003; Wed, 25 Nov 2026
 08:33:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
 <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
 <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
 <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com>
 <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com>
 <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com> <20261125090732.69233-1-tianyi@cloudflare.com>
In-Reply-To: <20261125090732.69233-1-tianyi@cloudflare.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 25 Nov 2026 08:32:56 -0800
X-Gm-Features: Aa3M54pUd6pmzCO8UswpNG_p1Cop8RfCo2MjSO4FX8Mgp7n0ftvtp2HqSVfaiy8
Message-ID: <CAKgT0UcFnSvTO6ATw76qVHYxRusTYXpRVi0_GR5QnMhhoXwXsA@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev, Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:08=E2=80=AFAM Tianyi Gao <tianyi@cloudflare.com> =
wrote:
>
> On Mon, 2026-11-23 at 16:17 -0800, Alexander Duyck wrote:
> > Any reason why you couldn't just strip the GCS enable flags from the
> > rings when you add the XDP program in ndo_bpf instead of having to add
> > a check for every packet if the XDP program is present? That would be
> > closer to what they did for the Mellanox NIC and wouldn't be adding
> > code to the hot path. Then it is just a matter of also adding an info
> > message that you are disabling this in the log so if somebody does
> > have to figure out a regression it should be more obvious.
>
> Thank you for your valuable comments.
>
> Clearing the flag in ndo_bpf alone is not enough, because
> ice_vsi_alloc_rings() sets it again on a VSI rebuild, for example after
> "ethtool -L" or a PF reset, while the program stays attached.
>
> In v2 I will set ICE_RX_FLAGS_RING_GCS in ice_vsi_cfg_rxq(), which runs
> every time a ring comes up, similar to what mlx5 does when it opens the
> RQ.
>
> v2 also logs an info message when a program is attached on a port
> with GCS. I tested it on E830 with attach, detach and "ethtool -L",
> and I will send it soon.
>
> > Thinking in terms of what the final fix for this might look like,
> > currently the drivers are already starting to carry stuff for frags to
> > determine if they support jumbo frames via frags or not. I suspect we
> > will likely need to do something similar when the time comes
> > indicating if the program can avoid corrupting a checksum or not when
> > it is stripping headers.
> >
> > I am not super thrilled with the idea of this becoming standardized.
> > In theory this would be much better if there was some way to pass the
> > data out that the frame was mangled and what the checksum adjustment
> > is to the total frame.
>
> 100% agree. We should be able to tell whether a frame was modified,
> keep CHECKSUM_COMPLETE for the frames that were not, and give XDP
> programs kfuncs to read and set the checksum status.
>
> Unfortunately, today there is a big gap before we start that:
>
> - [1] lets a program read the checksum status, including the
>   CHECKSUM_COMPLETE value.
> - [2] lets a program set CHECKSUM_NONE or CHECKSUM_UNNECESSARY with
>   csum_level on the skb.
> - Nothing lets a program pass a corrected CHECKSUM_COMPLETE value to
>   the skb. [3] lists this as future work.

Realistically speaking there is an easy solution to this in the
program itself. It would be to look at using something like the
REDIRECT action instead of just stripping the tunnels and passing it
back to the original interface. It would then take the frame and stop
processing the remaining descriptor data. As it stands that would be
the more correct solution as you could then just redirect it to the
tunnel interface I assume you have stacked on top of it and have it
receive the frame instead of having received it at the interface that
just head the header stripped.

It would also match up better with how the stack would actually expect
this to work if you didn't have the XDP program in place.
