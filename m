Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794663446;
	b=B4qNKEV0Av1Lxqd6a0tXRynCigQ3bvlkL4W+nDdTvI/et8ev1Zzj6I1kOMaUGBsa0cCi
	 0ZGW4RnI+4EpYUmogbJ/PLv+li5K33rhUmV+0GNqRxGKtsjlDnruXIWwgfCbaWJ3TGvDr
	 EZm4vQ3QFoSwXVkds+E7LatAMzP9gtHS/6ThtugMjfjkm8C4SIQ1+5jbySir43yT3jvp9
	 /TtawL0EYV8k7unLbkxJ/zyFikSbVvYahEUn/qeg2/zSi4Wsom/0KDR6NyAPVOWFGxdXP
	 e57jKOW0a7WcBHxIw6FdJm13KXpwks8sV/i7mePH2a7bQx36S5pUCJMSNcrq1RCoGqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
	b=i2xOrrI4Az0HHBDTpl1UiWO1DoWW0pSNSj7GCmtL0db/ub27XJ4Eeb9WiCSsbExbK92q
	 8LRX83+gZtka/AACW3cRa2TFdMyJ2I6LoCpvjPX9r/8a75kst87yYK5Ct5HHdk5CHKsM1
	 hTyjAriS+4AcYnzWnZcqaBjbK0RHA/0EtZVjjePGa5dm0i++8lb3VN9ql2QFOW33lZl7I
	 oqiS/2n1/0pYRrRkmP8W1Z9NH5jwZ7MAuwn0jqSm7r/R2kx6bSje+wm1rLZkHxwYaTiBg
	 0sz611et7/p39TAjVQ6C6A5VFGkCrUp/6p3idn+7np8jIiOSONTjmoYALaPm7aEhXOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04ED606A333
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04ED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so375576466b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663444; cv=none;
        d=google.com; s=arc-20260327;
        b=os2JWM90rGfApozjK19PG3QfKTbcpr7WzaQxAdeSQN1AHnaTKwf8xR38XWRnd7TZm9
         Vl1VBcv308+7bSSNQ92wyCybjnWV5aGVslZVVrSf9qrPlggycr8sGn+JDnd5sqJ4BIrA
         wOY8QqZ8M4YWJuqpwLkrHh6FeXa4t+PA42O8HQTckcBZjHwJ/Fkdr+JfCfqW2oA/cSwW
         DLeYEnxknnZ1mTaf4xWyFkVX+Ixm0BaN43eq1dc70B/viw4oVdHxL13iJKxYN7Zn2WDP
         2+GOx4O372Su/Fr5GgPDRF7mTba48gvZhSqg3QEoPTaHBQw87vBaoEEXy0e1YVKmPwZi
         e2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        fh=vQrbgOYrRK9zxY3iDyNoUc0Pkl2p5A7XoDZnigS8jhs=;
        b=RJsoFRjXh8zG6lcUuD2O9d8R4OuF76YXH7ZWYbrCIqgWcTGOUdqo3yBpC5zVQN0dMj
         j75mg/KNQBwh+OQhQBVHy1TFH3ay7yuukKCGQCwke03whQmsKxupKA/JUbtd6HMQi/+D
         ycOin0t4NdQyL70Y+O8H9zIPAEY2K1rpkOr4GpAkzfnfGvgCFLRcSSoUSOOjOyOUWj5K
         dxu6fXEVAo3pg8Pdxq/PyeeRm75NFlGHVVS+Q/AQHjj0GthZTVojv2fzwqr2agiDirrZ
         9TIlye2DqxVvFEuZyYTgzFDRf3EsuK9kQfJQ9ITQtRor/1PDe1dY2BzKLEqoue2U+hKq
         4y/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794663444; x=1795268244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=V0DVzrQ3UtNS2CGItTaibnG4J77tS7qMIR3c3C2ZUlh81GURnIp8X/IHvzSGRyT9ls
         zjvCcMSGfVsCr6PaYL7s/vQfBw5Mif7+7tUD0srSf73nlG5orBcEr38slNFK3s40BEI2
         7P3tnLj21L2r9iq1fBalGmh9cWBfRaIGzosEYay/i4E+/pcIFFHj2aP00nst0S6qHd6J
         o/X6UWXAn5i2xjeOmvPTXT6Ku4VxLGqH9IukfZrHdwmQeffXKQ1EEEj4+Y8Ud/51mgzP
         hYSzzU0nDdx3vWOvn6HCLUOcY6VNwAbS3mh+1q0boLKaBCkOkU/W8ctopAqNAKKW/Jrn
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663444; x=1795268244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=VvX00gfn43ZtwmPZ9/fVOYT+KQnWJD8gOS+0q+os4jlEBadeAbXME6qWH77w92IEAk
         vzojGUQtgEJfIWUyaMIOim/W5IwIXr770F5CWmkmYHs0dONlQevm0+SvaaR8E/YVzHh2
         XZnFrQwSPeQv+M83ZyChE72TXr6COQ6/NtL3kcd69fcxldOZpwW43YtaOuRlADgLCLEt
         1vB09dvutHT5+S26CM6I79CrRxBJCt7kaBMrajmep0XC9qg63/C8BDekBPjsGrWnI3nI
         848BRqofW28c397RMOoPrCi8N+u+Abo5DPtBzVenR+AxD4+p705AkZ48PnqHoA28phsz
         lXDg==
X-Forwarded-Encrypted: i=1; AL+hErELZev33jFBWXeoHuWqAAEARCtKksQRRFsEYpuGQHhj1NP+HIY32K5pC0cdazJUculnI+a5Z5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yMIFuSAkgAzrTH9Rc7KvWg6PVk2Nd4gGXTcfzXqQkK7HmOsio
	WFzPC0dek9M48fETI13pcVXFxlPLVR9oCLmDKnPk0ABK3cfblauwFQP2PB+Dq/+sk4oUqLLYdun
	/pPIyoPmcyWmxVsvL2pZ+ZFGaC5PwWcs=
X-Gm-Gg: AYBFou34rCRgD5OqMQ9SzVwGIEAyWim67cnABdZL9BDY1yfxyDoWyGCekE/8N9v3atZ
	lUO5GA0HvMPL3ezmETdp/1JQ8A+fhpqduH9WDOOFubuSH2nzL2Vx9J1ibSl3lyKPMnhrqqnWlHl
	BTplhjPK5zMFn8bT2Oge9Jnt8yc0da1ee8qYTry69YQv0W+6JsMGOvAA4rKvmYOboMEaPJsRxQO
	U823L1ulrqI1ryjdftn+n6PT4yUD/gO/iMGP/t/EcD0EB6dow4skWvkXkZR6lJJEIc7rMKrGGQk
	lbuqXbMfrhdohzz0fmoGXiKSSo5MipftUJIQLvNkzr0BDJ9SpQ0Uy9zELhenRCM1HZ6lsHcrenE
	NzSBL6Ly1jx8HAu0cUvQvJtZ5M6yidar354CKhg==
X-Received: by 2002:a17:907:3e1f:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c5095db45d8mr475395466b.0.1794663443789; Sat, 14 Nov 2026
 05:37:23 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
In-Reply-To: <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:37:12 +0300
X-Gm-Features: AclHuK8XI7bnok_ObDtOfMHWf2vbfB49mnYymQ3JtOPklAmq8NLX7LejygF9N-8
Message-ID: <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
>
> Do any of these bits allow forced on/off?

These bits only control the indication of connection status, speed,
duplex mode, and activity.

The LED_COMCON register does include "force-on/force-off" bits,
but i have intentionally chosen not to use them here.
To be honest, i=E2=80=99m not yet convinced that they need to be added.

In any case, if you think they are needed, i'll add them.

> > +static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 =
index, unsigned long rules)
> > +{
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_1:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_2:
> > +             break;
>
> You can collapse case statements, without fallthrough, if there is no
> code.
>
> It is also possible to do:
>
> case DAP8211R_LED_ID_0..DAP8211R_LED_ID_2:

Agreed =3D)

Thank you for your review.

Best regards,
artem
