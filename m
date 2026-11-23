Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449818;
	b=Ql/36rFRLXj9DxHBftI4oMSpd3lr6vXQBZp9Ige3zrMIHqAnlg2JSWZ4ML1KNOUof8h8
	 5ChyBCi23zesa++nK9XdLb7EyJbjr5Q4oh+hcjrPmoeJuUsRU82jAuP8nHhvcs0AlDDkO
	 viArPe2U8GVjDODrVRSn+CfkExMYyj8hF4G3Gybw5D27GATdxbKP9QPZkbW4ZALmcYb5w
	 5D6Kn43dcspGaB9MpTcQgXqOs4cu/0TDnZuRQRXAtx3xYKfwMJ4mDlQs6EnEg+BShT6DG
	 F6GhjOsJ1681RBomPnd484iMbcFfj200ksO717q13TVGL3Vy50fXERsO/H/aON3RmDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
	b=3mc8yOjodbxxajVIZJU8cx0pZDYQUyApM0xwdYljQb2Qn7XrihOGoUrKwgwgLczPjTRV
	 GS3OWD+ST/mHaIrGEIX0HjTNMFK4KCiRTGNB/1inBM/IGv7oRtaXufP/QdDMagWAQLa7v
	 /dAKc0DbvfogmP01ZvcQ9f0npILn4bY+iGD5OE6gsNedZH1mVJwpfqySpAFOhQ0dUz5pQ
	 UO9W8g4qwUxH30+hOtLydXmfSwfL5CfRjkUf9AvfYh8NrCwEZVz9YEruGft/ra8sgnis3
	 N89+V26+CgafRdNHK8OhoPZBYi2EpOEbxXFg+6d3qPqK6c5+BujlFh3e7DzAW1S1vsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B55606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B55606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so569507466b.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449817; cv=none;
        d=google.com; s=arc-20260327;
        b=ctsUD4XHcWJgzIH1QLo2TUv/4Kj3usAkrb0YF2cMt1Zx3uldJjmJl3t1WRv+bmBH4j
         0/sKSUNF8l7eJfmB6II4WdRTL5eJR4Zs8xLdTl8pX1Jrj7AhyB5fjUnNKHhG3S0DsV9h
         YXIK7yn33pOXw2eOKtfHmk8ivmShKvFhRRmzjxQIUq7uFsub0ZzIiL/XW5YEFrw9vIZ6
         ZbPac9zIc5nsqhocF0G7Ti54/9H26HxihXEBZbVMC0Fk4G9T8/IVpdhZ3574eO0tGeX6
         VTZ9Fpg+kKOvOqY2M6DEZ4+WZFS8vlo5KOvO4FjWS2JY7HZPtAY9/SLc0MhfhHkMjpCR
         wVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        fh=wcFC1PD+l1J20jBpLv+bKW7Lwsnyv160I/UR18cR+1U=;
        b=RtY5dQu34Kc0QsiSjGQl4FH85xchETgEDa1rtl2LOJ2UXaNPf9+qzPHV0qTy5/fwGm
         wWdcfsgLM5ROzYET17yDvEVgIEDeqxwTrpgyaD5OTAHMC+j5wxxDYJc4CHtaRX7CK8nZ
         g/zmPtYFLdPMD1kIMYIXvSXk9ap3upHjq20YWOLctKnpqrSZaQ0rb1PZt5vpIc99QXzg
         zzvPGj2DyW/vR/e6seDjNXzcRrhUMvnDtedBNlx2kx8Ayl3uzG16o1Ct8dh4ReDmMCKV
         fBeNnCh2zAErFf335qzEM8+99OAkX9MasL1Zs6qL7YiJDbJYlZqEZQuwlDjTNS+4djpY
         UHPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449817; x=1796054617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=kPxbmlxH36KRhpUs3rX2kF9cu8fs6nKcvV2Ep5Yd1SAPElzfO4U0yee+eyo4yYjKG9
         bVabsqjgWrVObshBsNWmZu0Kc8SGNvonY7/47W6xWPu+XZzUut9DZVDasYOasQeH9Kb/
         cxLOB1EaAVkrHLcauEnwPg9EXJ3MPHywPaLoCpTE0FTTIAii7phK7Avi7MNPjJVN89DP
         s8LFLj0Mqsxb9tOW2pKJn+UDcZJsxmwmdbWgLBk3GXWSXPM0Y4SECfoiTVmHq/AsVfEi
         eK10GDKZe/X/rTJwTT3GnOPtaNslesh71E73eFd/jgj3heXtLGBeR0+t6FPE8tiFDqrG
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449817; x=1796054617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=lYvC8kf56bYsV2N39HyEubpMuQqAIuGeOqbL3S0Wd3dEE+eewzdhYO+DfdHYc2585Q
         2nkMk5H1PHQdzDc+W8zTTGBWZnLHrS48HdlhlBBnHkRG4gBxLKpJUXxpZyzq5rPnDRu/
         Fh9wFpMeYmEgrAoGvEiuK2vaUjfKUJOsvM0xuLeI22J6NYJHu9vQcduPpbFylnyxv4D/
         h8mHA55FBWZ/qB3+CC5J/XmnDx4trIHwvclUy8ye2lypzBcXxOMeQf+O87g0mPOBFIe3
         e++W9tsY3c3orF6OCgRV+NHLRCMBohV45qwpYfXiHl+sFVzrNwj0TKehjcS61WTsDPWp
         Vnrw==
X-Forwarded-Encrypted: i=1; AL+hErFCmAvd/Zg8nEWJ17nTzYhuh5XeUEadBLsfAQeXiCwCBPsFDY2wCzE0+/1I3EBmDmCwmC2H//g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f3QUKzXLdRw8QM+UdUty/LDBHcVstj9SSIKeuMZFtNsnh8dEe
	9+L7CS+VHVwR+M3FkCQ6hXW25JrF4Mhx2pLjtzOGLUmUvD8GGkiqBswxYi6WVt7wI64nw0SbMu/
	xdtqzItuRq3Mmvij7LtjB3P3hZTPsRjA=
X-Gm-Gg: AZFdTZdmLICy4yZ8ufaMhqNYU1SsCV/wDYoGwLQC/DsLjvgl72nHdAeAEs382CSUj/Y
	9tepL4WOsBhDn93BWhmcagRknmoF/XZDr+mqkYH2K+6AYXNIEXnXgONQTejApgBXjxLKpJ9h6G8
	/LBiwgcOuMFmXoBpmcPikFqvIRZ/J8w/An3Wbc/bVdDh12PU0DFcvvWKV7Yyk/VQ90mPumRlLHn
	qUnM0EhcOx37zr+e7n6VLLeb0XmhY2zUxQpHFj3gDmTpkb/HbVJjHRocgBMn4I/ThErZha+XQf0
	Qw3ziMu07vEF1w0AJ+J3rFjVkGRpyM4UW/jKbO+JxL0SC0BTyLEwIIOsJdvAtrLu4/3hcPnayTS
	gzn/h4JpesXU9WQd3UXX2yuwvwmPZvqp9Lpt5U9A=
X-Received: by 2002:a17:906:9555:b0:c50:52b5:e17 with SMTP id
 a640c23a62f3a-c513a5e1d53mr819834666b.13.1795449816568; Mon, 23 Nov 2026
 08:03:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-3-a.shimko.dev@gmail.com> <179543998153.3135.2533998901272176773@kernel.org>
In-Reply-To: <179543998153.3135.2533998901272176773@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:03:25 +0300
X-Gm-Features: Aa3M54qYkFzn2AliFXf9fRcB52n5j1nfOYqfcsg4MxuHxjWphZmjYJahIu9j42A
Message-ID: <CAOPX745BjECumVGmNOg3HqagFVz=Bcz=x8-shzjyGjHmN8+NSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The new `leds` block in
>   Documentation/devicetree/bindings/net/dptel,dap8211r.yaml mostly=E2=80=
=A6
>
> --
>
> dt-bindings: net: dptel,dap8211r: add LED nodes
>
> This commit documents an optional leds node in the DAP8211R PHY binding.
> The PHY has three LED outputs, and each can be given a color, a function
> and a default trigger. The commit also adds an example with two LED nodes=
.
>
> > diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml =
b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > index 4cd0f9730d954..772329feda059 100644
> > --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
>
> [ ... ]
>
> > @@ -45,10 +46,40 @@ properties:
> >      maximum: 2250
> >      default: 1950
> >
> > +  leds:
> > +    type: object
> > +
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
> > +
> > +        $ref: /schemas/leds/common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              maximum: 2
> > +
> > +    additionalProperties: false
> > +
>
> [Severity: Low]
> This isn't a bug, but does most of this block need to be here? The bindin=
g
> already gets a leds definition from allOf: - $ref: ethernet-phy.yaml#:
>
> Documentation/devicetree/bindings/net/ethernet-phy.yaml:
>   leds:
>     type: object
>
>     properties:
>       '#address-cells':
>         const: 1
>
>       '#size-cells':
>         const: 0
>
>     patternProperties:
>       '^led@[a-f0-9]+$':
>         $ref: /schemas/leds/common.yaml#
>         ...
>         required:
>           - reg
>
>         unevaluatedProperties: false
>
>     additionalProperties: false
>
> Most of the new block repeats ethernet-phy.yaml: the type: object keys, t=
he
> cell constraints, the common.yaml $ref and unevaluatedProperties: false.
>
> Only two constraints are new. The '^led@[0-2]$' node name pattern, combin=
ed
> with the local additionalProperties: false, rejects led@3 and above. The
> reg items maximum of 2 limits the LED index.
>
> Could the block be cut down to just the constraints that limit the PHY to
> three LEDs?

ok, i'll fix it.

> The commit message also says:
>
>   Document the optional "leds" node supported by the DAP8211R PHY.
>
> Before this patch, a leds node with LED children already passed validatio=
n
> for this PHY through ethernet-phy.yaml. Would it be clearer for the messa=
ge
> to say that the change limits the LED nodes to indices 0-2?

I'll keep the current wording for now, since
the message describes what the patch does (adds LED nodes and an
example) and the restriction to 0..2 is visible in the diff itself.
If the maintainers prefer a different wording, i'll adjust in a
follow-up.

--
Best regards,
artem
