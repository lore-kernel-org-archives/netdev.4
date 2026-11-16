Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794796117;
	b=plTTu/2knjSLvDV05X0NEwQgoxpDapKWQTWGvQPUgt90QMB/DFESNpcpyKKEp+NZ5C/M
	 CsXUVIXuNy/6MiE9oUU18e+AFCikcOkfsL7PkW/KAw77eIiHtSWnnv/5NjEMnO7oH9PH7
	 BjHReciCIo7iCbzs3wk3FCnWHThEzVUCmTs7tJGGRwl6VB1fLtbhlx5/VnBiwJc3ikLcL
	 pB3CDKi2ywydgXqwtjjsLshpXrq6FYKzYA1FPzpkeIQChVVC5P81YUZbkwDKtiP8aOm+i
	 Sb238JhKtBQBzQFrY2UI5z1lv5lOkfGO4WJ2t5RBHGYgQgcEYobHPEYhf2p3zRUIMVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
	b=ivfpvQWGvFQtDlxqeairSfGi+JdoqAJQYYKmJIdHa0cHB5FklxH26QGqNzKewg9U+3lF
	 FGuG82gzvY9YIVGwDc5PRryiL+WlHwp0JY6OWZbLI7mdlTnxHHzlfholFK/VINb5+CsX6
	 zzZCM11sWv+5TVHaM0EpF/98lKIXH4gN+1CD5GsNl/ln0dXvagSIE+sLMEUNqSC35iqXY
	 N8tit58J7HJIJ9fSinNNE4WAVWn71KzHig/G0p3Mt1rK6fJjZhf3fvkoyWnflEm4MDEb1
	 lweD5Z0UadjRajDiqtJlFeFo0txyzh7Jikgy9HEJZTntHn5KkXKoKr0Fex/CRI8kYOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUmDmELd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BB3606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUmDmELd
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99e156fe905so465436241.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794796116; cv=none;
        d=google.com; s=arc-20260327;
        b=aQvX6xgxbBwGf70mI5oNVDBjMMMGX7Qq0u1lZo6sILnF0asmASaicIc8/h/MGKeZHp
         spKAKX1Y0LNu6IKA63JrPgdxQ1Z4DTb3IFK8uaO8Di8bhT1cgOwWYouyoUU00Qy2WJ5G
         QwrVvil5KXXr9tlspb2yA0wPYb9ph17mzGt838K5z8hycXuJZJ8NNtUXwKrAsOEozKLV
         WBzwMSRmUNcuwgo6q0B3+JZwBxiOxPy89wDauwb/3HLYC73G3uBcMBMKB07cegnjB6P2
         Ii9N4LHgWz39GqAJC9h0GwQSkAf8Qf4YOUXwH0CY3mM2bMZJxOGNqltKw2gmUzOe7GGe
         dlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        fh=WzQAcg+js5PRHBZczwSuQZLlhLGXMyZkQsus+tNc41g=;
        b=d4j6kV5w7QSKi1+5UMd24oO94BEbZc4Lucrxzgrm3rGo1ShjbpmZJsbca3tzb5F0z2
         DFX2eB3k6KJW5fopsHKE4adE5rL4DJ6GxjeHlQglg/dwpXOlAjhKSNfRw99RwuqtEOcv
         uGG89z8EK1XoPiQ3IOOEwVIsQXLtL3PvbeOzYMFxDGfsPIBK3vLi0pnUMXpuBNExGaSj
         rNGpHrmx3gId+XoJtqHGjJ8MsaCU48bitC24vnJYUZxbt4IuSthHMv+f0FX/gwZSWBXK
         5K9vYsQgA3jQwy4AqJFva238/jQ97K2A/mZxyxjKQv6JljFE+HGjSavlVqQotFPISga6
         1emg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796115; x=1795400915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=lUmDmELdQZAjfTjIbohKB2uN3vEuCte3QBVz5MYmQxTJBT8oDkRCqNaSnjzbvX5dKd
         eBtjUtFt6vJ/+FOrNT+SZaKvvxOpeVXCG0uZXPqwsFimUMIPML9N4zCmHbv2dKXczBmR
         DVsCq0J5fbYrz7PU8gCk/SmeUDsLVq2G1clHFmNPlpcj4lDIhw01hZm0pbf4SEcFUi1F
         A0wAtYY8wF+0LqMgae4iYHnldYcw0bTOtuHiFqZuZpNdy099zqyZP/u/XHaSrajEbTp2
         0k6fDaelLYToBnfRpgdys8ccfFbnot/blZuwlPnVloR6nkttp0ibGF+9WIf6sLFrgEcY
         0Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796115; x=1795400915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7P7iWYujdBH1gFU159EwYceUYsZZdk2tezm9njRHsA=;
        b=UjlEJRyL1koU9+PJlnnxlyhVQP5cxDcH2xy7fquRiq8kJzSVkaXGf125N53KgAzB1I
         DPfdPuuflzLEE6dmzIdI96ei1BroK0tz5jWyqxeV77b/VuLXGgH0LZyToETiR2pu2DK5
         nMhLvfytqY4hFrtIuq9P/6Br3U4og2JJ8ETr43wXjYCjMYJApFowm0Z41E7PSX42/we3
         N/YSQOan+UFgdbShaTTm0inOnfmaMqOhycEX4EgCwGUDUXxSk1iMBtYnTtAo3b7Lbi51
         WhG9rsJcHh80hB4FpHnTiLHrt57b9ueedW1uzratNPWytSjgtgkkw7dCUhJmtFiO36IJ
         HjKw==
X-Gm-Message-State: APuU4Z/siJncsrEVnMToZYYILXMGzqokBLDcURG00KkTchvMQWdH4Q6C
	p2QZkodmtiDOwgZZP3mcr+AJFV+jZpgWf/zzkarzq/+YIWaJ5lDvAJVZkCMaLlqFDgRIB0fa6Uh
	pBRknxczuh85c1XWT0aSvB0D5EJYIKTo=
X-Gm-Gg: AYBFou3CTFGbsR7LJMcLA35iOqJKTSZolk/lS6s40KVbvZbmR5ApVPDZrGiJnHB/GeY
	VXi1+MJJty2qe3gPlPZXSs9h9SooEsBsdC7AEX8kkJkQ/1hDCexKydfr8iZ3Sz8oPvcL1UjFbwx
	NVgN3HnBDCRCKYChVqPaZQ3uwKCS3CfTGe3OU2ALb8kScMOADWa9OiefffP1UIuwooclXQD8SU4
	SVHXfvAuWIOXXEJ0FW6+F3wifyBbDZWi8k5oma7Ej1kK1/pYq+nProoFZTeebyQCYX7PnNFHIX8
	CHIK1gXr/scZT19mxa9/QJGZgbkJHMp6JawH7iZjyjvhq7H5QOTE4GtMt6dVw4S/8+Fzn9/gt3U
	q+ODKetmYJQ0E6C9NyYlLzYVCJke5ag8S/fcX/rqol+XQ0Wizs6dVgxc66FnPJV9JKmMkECmzKZ
	m7fdSsbJt39wB32bxzUkf/ZypXWOMivXYPa9n9cVMYQWqBtTixVAlxfIBg+4jQsmxnnP+3IuTxc
	A9GDgWGH5021VqUIPyMzwt4uqekB2wQGQSgPSepYNX2QpiR7jg=
X-Received: by 2002:a05:6102:6a92:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d64d6c4928mr2278451137.5.1794796115630; Sun, 15 Nov 2026
 18:28:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org> <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
In-Reply-To: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:28:24 -0700
X-Gm-Features: Aa3M54oIQfFIPxOH03SzX-2akhqZowcy4hsXJL6cGaB7t5DHcgJ3SVo0-C72FkU
Message-ID: <CADvTj4pV02w3pQeeVH11L-HOTaEbc-1jE+ErF+z4zU0QRfANUg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:19=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wro=
te:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
> This was found while investigating RX checksum offload behavior on
> H616 and reviewing the shared setup and feature-filtering paths.
>
> >
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by LLM and not proven at runtime). If it was triggered
> >    please include the symptoms, like the stack trace or kernel messages=
.
>
> The capability loss was reproduced in a source-extracted test using the
> actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
> relevant setup and feature-filtering logic.

I mixed up the two threads. That explanation belongs to the
separate checksum-capability fix [0].

For this sun8i patch, the issue was found and reproduced during MAC/PHY
receive testing on an Allwinner H616 board with an AC200 PHY. Even after
ethtool reported RX checksumming disabled, EMAC_RX_DO_CRC remained set
and the hardware kept dropping packets with invalid IP or transport
checksums before they reached an RX descriptor.

With the fix, disabling offload cleared that bit. In steady-state tests,
those packets then reached the host and were rejected by software
checksum validation. Valid traffic continued to work, and Ethernet FCS
rejection remained active.

[0] https://lore.kernel.org/r/20261115-submit-stmmac-rx-checksum-capability=
-v1-v1-1-ea26fa3689be@gmail.com/

>
> With the original code, disabling offload and following the reopen path
> clears plat->rx_coe. The feature filter then prevents offload from being
> enabled again. With the patch, the saved capability survives that
> sequence. A requested enable that fails hardware readback still clears
> the capability.
>
> >
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>
> Tested on an Allwinner H616 board with an AC200 PHY.
>
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account.
> >
> > *IMPORTANT*: If you do repost (for other reasons) - please include
> > the relevant info in the cover letter or commit messages.
> > --
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.
