Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222316;
	b=l5eTOp21kgd/9VS/avhmOk/w1aNMFkGfdyLjJnpzZrAc8L89BMkeVwOsEB+z4Wfij+4m
	 mTP7Ec0H5KlpTm+2ITLk278IYEN8kgroXQb5Ia4RfieNzBuFwtgRSq8k4sn6VfRXgJTTE
	 s/5xe8MRxCvBuiMu7pKlE8aObVV/7V8Yefhaj+vX5sWQ5cIxwOMlCsCyKX2vBN7Lv7A48
	 iGEWva3XFg9RcS7eu+t8JWv9IX1ch8KlAfWBdoxF09K08pNe8KZmg45zgVrkfUxK3iwRZ
	 0nr3KdllWwybrumcX584qeYXjKKidb7KQCAYW5UxUs7emmVQyd+A3iJuIq7vRZ+X9gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
	b=0px0SB6j0IusGi6PEjJCbFsbnUFImNVB08y47QaWcpDbi5CFuX/H42kluOL1QSgOUhNy
	 smRg2kpkVAiWDvteAj+bZrbcA5SZrR42yNTkWWDicbUfVXUHKkXrselIrJWrWdxvQFCIB
	 zfzCYtCHkkKtYaRe90MEpuPRvC1FXsP5RbLSQ7wBEsVlb84/f2ZBbo+qxwgRo7muoA+v0
	 XT77ExN59COV78j92yeLFYa40t5B/sEjVLVyd95gEc93oycxyMVL4FybPvQORXFk+qtRR
	 aPB+ZNGbBYp0TTPEFZX6dSK41LfLSbUgcDq/XIkeEWTgqvU4dQtQjrVx2toVrRLtU0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFmJXoz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6352606A6B2
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6352606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFmJXoz
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so556487266b.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222314; cv=none;
        d=google.com; s=arc-20260327;
        b=AS8V++ebUNdxswaeLClEpiUUar+V+gwZSt0lucSrAiQ3SlpPslJ9f7lEpblvvy3R1O
         o0Uotm7aayAiL8Sn2glDQYWIrAxEheV9ryl/gCpaoNV/23jLd5r9GH/zfdmMxXixnDHe
         VzK24D/Z3u5mQB2kTdePiT9GMrGVsup+ZfVBZ67wvQ/i81ez7i/ScKSTFDzKaFsPdIX+
         KTtOB78PTg5ao/XVOBOApyn1rV5mhgOunGo4J11NkWYFg2ONepmS8PGOKK9Bv94tHioy
         SulFkV5Kbku6RbW+W/8ObEIc0e1/WgE2uHCzfnT1hweViARHI+ivlZxF5XloBpfmBGZy
         afiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        fh=dfErtALyvvCBCZHQ65f76doTxDiCuWKp4218lN8JJfk=;
        b=G0hb8Qm9q8MbKtMXcHMPAGUa89WayFj0EH/cLBL9pIwB1BF2UR3NID9W75FsNahh2S
         +qKAxu0svDGSd+H5qth3royLUJm069Omfzvx92IroKVmUsqTY7TX3n2Y3DZBlARUZEzO
         YbR2RkfuZhnYF34JGjfOmss9/5eOvZaxoD/OWWAg1ZOYBtBA3C7fPXSYnF9HqRglQXv7
         TeY1TBlM/SarFBuYhKu3BhuS22H9zB8ry2Sz8lo0IPnVj/p4+468iD/Ij1M2zIIsPLgW
         R9R09t8+EtUI+i7zxqhE9KSd56L3l+ZxzFYEyCE3y3T4fUyjqiDeoe+X/uGhfkR8E4qO
         YoOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222314; x=1795827114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        b=eZFmJXoz3LQnfFYSxkf2h29rOg7hsPqKgF1stZF2eSK2R/vJwyp5HIxIYaJAgtXgbu
         QfZiWt4WSJJ3N7wrVKMvYCRI1O9dUkH5IT8FsOASzVefBj8kuus6G5quEFF23q54UJ7C
         rzkcGWSsKydADG9MDyCCRHbo4VtFp+R9jybs0rUQhEFGW7jT8pqG9Mtr0Ovt+FHBbtDl
         mfX+VlZ2Y+BFI1eKAfZd8n8EdFQDKvCz1s8w+LvAnLlFA1j+vddJYg2LUOCOmvtQvRae
         DkQ0J+Jm9pDsMbvytuvFjfeHNf5GqPjBs9z/PPS6X+K03qCaB0ncgc7hCMjmRYXvDWH+
         AJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222314; x=1795827114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        b=Vv2O6jEKwH2FneZi0PjynhSZMl+Bb4ijV+7tsQfZD+/6la0cgbvyVFOvYSstY2kG1J
         9Q5F7T0aYj106KStN5XBmK/Yy6PdZs5TleRqoLE4KsTCRZvN3JXs9SISoypRonBpmz9q
         x353wCir2DUOxdSRuDql/WSPH9spirSV08NVq/QP06OIhC55jhGBjXInKrHyLZXG4nKp
         DtgFzbZHk9XEb68FLhy+bJWt5SgfyAoq3I+LhaeOOOqTQcISLgGFpDxXfmDWTCkaVOAP
         ucCi3jCvJYWFMO8iKpTpx+cmAcG246resrdOx58ylM3b7we8x8DtHjpdyQIzEIvGgFad
         f6BA==
X-Gm-Message-State: APuU4Z9EYZWzJxrjvJZTiC/O0CJBhuji6PyuAZy7fo+gbblX3Upu6WDQ
	ottn6v0xajjZwfSMOxqUalwAWPqYZtC9lrwPtLLlQx+lUPeebXUI7MWwiYgMmJo7TzeEqOlsjWI
	h3uJ+XtZQAe3Gs4EB/UbOzMyf1MQlSr0=
X-Gm-Gg: AZFdTZeEqaycpFp9KR7rGSlE2n68joxF+eVlU6jyzg2RUGFEm5EFapaoIu4XzZ+iXgq
	w8ktsntqwvMrpE+rwxKp0GJjF3t55NU0xx/z+BsIqRFqAFiMthGczh1UmjzLeS++8fXItHbKxFX
	CdR8ttYC2dZQjREG1K+82e8nsw+Rnpu674t6YqlNb4z4xdpCbEqpFQdTLbMoxQ1/XUFEiDdaLRa
	CXRVxZVUIQ5RYXiP6XySOwFDh3n6OonLXZSKlYJD+Ur6Yn1xZ1NmSy9+A7U/7cJRQrzEfZJTqXD
	TpCHHBT2Cobvxf+cPkh4AZqayrcelZI7pvnggL1ZnrG2KL/5WIv8TICYeH2sVVgnUBPAYrnAViU
	HmlmWad8SpjLm0Vv2dPev0TeXTKBy80m1Onga6JMpLceSWkoEzsJ+/+IrfyigTzJe6+gCaPUda7
	E7m7y8XYxELXMYB63nRQdVErqr8b3gihAHERk4CxpLHlJh0PFExP22VM3HSpxMVV5HEuFN/X+fT
	4R8dUF6p3cMAmW9A8sxV0EOexfVDnFvtuf00kcTsbanxv175w==
X-Received: by 2002:a05:6402:14d3:b0:6b3:e4e8:74ba with SMTP id
 4fb4d7f45d1cf-6ba1fb13893mr4063547a12.13.1795222314231; Fri, 20 Nov 2026
 16:51:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029173122.29636-1-rosenp@gmail.com> <0139ac37-fbe7-49fc-ba25-7b32df081920@broadcom.com>
In-Reply-To: <0139ac37-fbe7-49fc-ba25-7b32df081920@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:51:43 -0800
X-Gm-Features: Aa3M54rLr4BLz88l0soc-v3JNg9m31Z8tj3Z9rFtN_CjE4dqfPJMuOMbo9FLveA
Message-ID: <CAKxU2N_jEhHSgtgoM6KP7WeDCP2tXq_krRKN=0tQfvY8DcrQvA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: bgmac: fix RX frame length check
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:18=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 10/29/26 10:31, Rosen Penev wrote:
> > While reviewing commit 77dac783f113
> > ("net: bgmac: rate limit RX error messages"), Florian spotted that the =
RX
> > length sanity check compares the length reported in the RX header again=
st
> > BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including =
the
> > space reserved for struct skb_shared_info. The data area handed to the
> > hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> > BGMAC_RX_FRAME_OFFSET bytes into it, so at most BGMAC_RX_MAX_FRAME_SIZE
> > bytes of a frame fit in one RX buffer.
> >
> > A corrupted length between those two limits passes the check, and the
> > following skb_put() runs past the skb tailroom and calls
> > skb_over_panic() instead of dropping the frame.
> >
> > The check has no lower bound either. A length below ETH_FCS_LEN wraps
> > when the FCS is subtracted, so skb_put() asks for almost 64 KiB and hit=
s
> > the same skb_over_panic(). A length that leaves less than an Ethernet
> > header makes eth_type_trans() parse bytes the hardware never wrote.
> >
> > Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
> > BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.
> >
> > Only compile tested. Not tested on hardware.
> >
> > Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>
> Rosen, can you address Sashiko's feedback and resubmit? This patch
> conflicts with one I have in my tree to support flow accelerator and I
> would prefer to get yours in because it's a tad more complete than mine,
> and yours has precedence.
Sent. I wanted to send these separately, but the bot complains no
matter what. If it still complains (most likey), feel free to send
your work.
>
> Thanks!

> --
> Florian
