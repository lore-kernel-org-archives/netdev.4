Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199379;
	b=b/8dWgt88hYlGLbIp97Gv48ximwZ+RLHdxKNxrcl3pFn6E3NR29E9CQDbToCvjGjWeAV
	 ZNWeUlFll8e/5TmWX6oITGWQ88rxeeCVq9NlTSz1fRGtH47zckgmHw6OO0T0EepradKlh
	 bDgTlw9LtdzqXJGjCy68db9bF1Eu1/NpRBly3YQjX+vc+1+4gp1ZJyFGKNzHfgrKTgkWq
	 qKaeo3RPxJnHkKu9Bc/ygFFgJkxW9zXlWpTNzSJ4hc3qhxgdt4++ktYla8Fa5F4diIKK1
	 ZwMDZgScrLqFR1NVYhcQbTVtxnnz9K+To7bRKPpHF4MQmfo6p5AAtZ1ODOjQdm7eqmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
	b=bBx1Ggx/wZXjx4+7X3t1XlS9cdVWkfOuhTH59qamdXPF3ufGOXqdQ0bYXvlbt6kZDNmB
	 PFat27yA/sNOOfm4Sm3YhUaWMO5PyOknLG3fsQfsH94yR9QJUInbdER8oeC5GKYkBpN0T
	 kSIdjireEKFFHL5ly63L9E684QaSbk+hkq9QUT6dSbEtmEs0BnYVNTFkHBUSUDU8kF0hs
	 u/pTUI/huVDzxNwTNs9o6actTuoI/7q1d8UzT9gMnf1GJiGSY22x7mhqWbsbfpjfp2HLS
	 dOXPHuHKb1CVr6GSYVRg9/0mtlvpi9BWAbYQOwGDEpyPF/GEreOt5YN4OsodpwDkpxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AD606A337
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92AD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwABIWmP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso691759f8f.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199377; cv=none;
        d=google.com; s=arc-20260327;
        b=r8v5GoLLMqQKb7tcRSVv1Ce2qQkTA96/XdPfwI1uXFpuGTRb4aqTCU2JsofEjNFKpX
         OIbfJ8xfBU/3tCIV4ksBjG/qJ7HECoDVxhz47VjvpDB7s/czwFwnZTfeW2uJ/gwrmByY
         x8FQ+i3Pd2CfNhVEd//9a2w82UYq2qnj0E8kOZtu3ruPy1bEslfI8k+OphNX8wbLYEKJ
         19Jk11O7Ueh4Yf4Xi2j8gqqUICA0FBZW5NypMcdo3TVM35hzzm3aukLLuFomSqLM9uIh
         Bd0YjGeBTcBsd4rL7bDvMkoZYUWhgK+cJ0Vjd0X38Ca72aPJkwRm/ro5HslxGJoQdmlO
         +UeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        fh=AUtNxoQuhumebrA7duGA6NCzNTBZqwU0/+qSUCpHPnA=;
        b=ZhxsoXd3jkpswXiLBWLgw0n7sOhnxf7R8BqcriXCkMe2M26D5/jCUuGd87eXGlS6ki
         2DUdMNYpmlwQk0GtboHDGhbBeMBQn9f6JJJ0GEhpwrVXxsDbAqrZgCyspPurCjPd49Sy
         5+6RVsU+zMaqDHBbcNPfqCjDc7Ks2h3F10qnCZm98koaylQdsqMp7VRSXkGT4tFJWmIe
         hmnI8WaZ54BszAZJlmzaI48F2L0tlkRSk8PFWjWQZTdkBfNRSYtnO0ZR4K1H+BWRmwSz
         BDTnD6BVrSEHxYO0had/0GKVpdOvVVaAZPxFHR72oo5dv5rytU7C9IUU+bLd6UGFoUde
         FMzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199377; x=1795804177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=uwABIWmPL8ufMw3MxhB2hOwlsEmPeYT8AMWdeblvvNQ1+v8MV4AO60p9JPABKcnamE
         9JU6LGYN7Rjwug1zxzVeJfqBL5YXMOmJO0GTOzazp/XoyyrswxdfWvwZfhhafqQqFPPt
         puNGPl19MUAnpekoVGvKRt7Mr5vTe4SQFBbC7jnM/ITYttyruWuBOwQSJ9X52/Wj4iEH
         bosO+SyqUgtYWJAjPH7yYL8doFP9iZQqB2OGnY5zNkhvPXMUmBIgSn+t6PsMJQXz2KOH
         dDNGaZsmXmcj3qC835umHkJbCrs9Bn3d2RCkV/6r68WrFW+s0asEfLgHUq+ZdBKyOpQ4
         CFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199377; x=1795804177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpZL2JSgED1dxCTCDeitpd9jOOz/PRQfRKQZbZU7GDc=;
        b=KIqEZMF58meWpCfE1j986YqZjqNySalbvc//Q0sU/X89JYRtNg8PV7F9s1kjUnmpr5
         f9XgqDwfeh2+pxYC10YvDZSfs+ig4rldtRp7FUU6zwRSC0WgJTs9QEssXsAqk1HB58ag
         khYbDW8D6ZXcsLpaBbmcz6SEmoihuPOsMgFh1QzlEhh3KHrX2Wdok4nTo+ZdULvbx5KQ
         0QtXrH1erNKJrpM32k3NDTCc9BJl1T9cQHKdD4KnXsK0jBlibywYle0QfODbwvBJUKj7
         eAO8X2CRDxPgQXYqf+Fw2+7i6BOi/LWhboNZt4bOGdoPevL+w4p0h/UO12hnmRmXFhux
         ugXw==
X-Forwarded-Encrypted: i=1; AL+hErHeQEBVf+N+glM0D6gmBHGlku6IWv1Sy/+ljumxL5qk3Zz+vIlJZz3Qg8cBg1cD5doXlThOSGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85hH4Z1gubxlssMT8Y/KXVVa6nv5T88jCPfL7sbRNRqPCz7NyH
	tWr9hqBOs5wo6Yh8thN5eQ7Ebt6A7Fhf3+hfZKT4GrTAxDpY9+PbXw0gqbmC6HEvPmUPDuACixi
	h7Z/odSGFzaKgqElR2ztyRobFaG2ZLPM=
X-Gm-Gg: AZFdTZcsYo3FijVBxM45ozZYerVshBCTmOn9zD5OmopnmE9j6rPXdtapeT+XzrTRJ6C
	DU1pZe2ZHQHRrFOyMT7vzIJexWy/yk4XZM9ZyL+YjZEKbr8DJ/0pnHKCEv/BbqRFtmYAfONTIIy
	n4hDiGocXLICoj/DgkdQ+rpvZLeQDURF5GSMDSkQRgaJgPHyRTUkCJegTbyhhqSarffySneRe4g
	fAJj8lVl073b29Dm0snv0WKhyrF0ej4DywsyaIlYw4wOPTdkl+c0g4ALy/EUpn77fl7fMP56CHF
	p8do/0T3Ptd3WIZz92MOWp7V8KUVlxqiSwO2ST6uU6wV8DI+2UoI0Ah3Cv4/eoMaw2aXuxyTc/J
	zSpWcOLN/13NWzma9ELrNMy66IsMiP7q4CQWq9oTmRgb25CpHJaqo1n7p68MN+j+0V2PPQIp3Lf
	3ocj81IYlYPouWVyRGXlpgMhgFqXsLEIELmuqYCWBihrlziySlVzJHzt6dbg==
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id
 ffacd0b85a97d-4abb2dda518mr7812309f8f.29.1795199376768; Fri, 20 Nov 2026
 10:29:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
In-Reply-To: <d0f5f347-a5f6-4e84-b773-f29ffcdab156@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:29:10 +0000
X-Gm-Features: Aa3M54pnhmFSvmvZzRx-r4wW9mEW3Np4iPEWnckhFv_SM03jf-al_Jy7M9nYdCI
Message-ID: <CA+V-a8tQH_aFb871XXJ6QkNUhyXwZo_0RD4j83GbgDpfa=9x0A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT
 write mode encoding
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 6:01=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
> > the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
> > directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
> > and deleting one writes "set LEARNCOUNT to 2", instead of atomically
> > incrementing/decrementing the counter.
> >
> > Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
> > correct bit field.
> >
> > Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index 13c46cf2c420..7fd2652813ac 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -5,6 +5,7 @@
> >    * Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> >    */
> >
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/etherdevice.h>
> >   #include <linux/if_bridge.h>
> > @@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds=
, int port,
> >               goto lk_unlock;
> >
> >       if (inc_learncount) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_INC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_INC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds=
, int port,
> >
> >       /* Decrement LEARNCOUNT */
> >       if (clear) {
> > -             reg =3D A5PSW_LK_LEARNCOUNT_MODE_DEC;
> > +             reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                              A5PSW_LK_LEARNCOUNT_MODE_DEC);
> >               a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >       }
> >
> > @@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
> >       }
> >
> >       /* Reset learn count to 0 */
> > -     reg =3D A5PSW_LK_LEARNCOUNT_MODE_SET;
> > +     reg =3D FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
> > +                      A5PSW_LK_LEARNCOUNT_MODE_SET);
> >       a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
> >
> >       /* Clear VLAN resource table */
>
> Hi Prabhakar,
>
> It could probably be worth it to add a small a5psw_set_learncount()
> helper that contains these the FIELD_PREP + writel.
>
Sure I will do that in the next version.

Cheers,
Prabhakar

> Otherwise, LGTM:
>
> Reviewed-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@linux.dev>
>
> Thanks,
>
> Cl=C3=A9ment
>
