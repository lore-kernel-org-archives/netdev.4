Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184799;
	b=pr8nOLqYzVRQne6JI3Bf+/YRG6RmxshcTpNLmRy2rlyYe0Y2yWaYuNJCVuvLYOzqO1/W
	 0FZjXgLE2thCh34DikfU3ZeZFghSyPWPzNbazsVHvPZown6V3sI2xq4NrFmV2DXEfvmt7
	 1bo80vgM46UtyZSV9/OkkEFrEnCE4guDbq3n0Tkjq2oyW3ghJ3Wo1oPIwFlaUJ/gcEDxg
	 y/Gff3YtBdghqTaEu8F9o1Wz2dS9tK58b5cRLtG8tTq4a877h5hrFNw2MW3iLHSlZrCZi
	 RfbYTLInFA6Klk4tvoTAYeOlzMDL3hOnnA6Bq5nfPVvqM4Vb4rNoSpCAkSmbfh9K2uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=C0hn7BxUfynH0D6hp5wIqTAHOmIKvssBciDk5OTln7U=;
	b=R+azYjKO+nsMI0AWAtiFBgUJKNV5G/uHF9sWpmW7aKj1myemR1V8ZK669o+LDjXdDy/J
	 reD7UrtF0v3wnc9PNrqmR8Zj9/KQqpbFENH2t9Zs6PaJ2pNGc701M7NOPuarsgu8jSt5L
	 ySUrJP1FRouYdAo0GqPpCRZqigLG3QLygHZN7caqh8XWzFR3mzphRuh3Ao6Q99hVk5NIp
	 pvCTNR22GqUvS+mZTsH6C+m7oNJIme7ZpxwZnVi0gFYLC4oc4ZjTlfu6fcB4MKPoqIsAf
	 HLEVRklvi4uPMMIB4S9BNq7Lss5paj74sbtOHk4TwBpKmVxgiVEbdVFoPuj0dwU+SxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNDSWA7A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320FE606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320FE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNDSWA7A
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fc7e0ab25so118494d50.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184798; cv=none;
        d=google.com; s=arc-20260327;
        b=R6TOZgW7F/yk0/VteO78ZuNBx2TYY5PgYstqorzYF2QEPYJg96QteKmEVeq9Skeqdn
         nospEvgDQsEVWIRIduCWazjuE4Eo6sIy23+CQAdbfS18gN87mLEW4EzSfpIwROiE6MXp
         OYbiLh4BCjsl1J18nM9VFTZ+DtKOAWei45GcIQACBuJj2stA6raGaZMnAUq8ObEmfOXn
         xUryFUxaNJOr+zoKLyiXAWK/VGgMN4p0SbJ5It1N/eNiYfq1jMLEpyVHAqIPcmCYFs6Y
         8xVdJq7CaKS8m8a14qGtDAa1elPd/+aEicqBKfpAKQ9Wm0R+yx8wv9MiCK4AC/BeRNpP
         46uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C0hn7BxUfynH0D6hp5wIqTAHOmIKvssBciDk5OTln7U=;
        fh=snrGQ0KISHEq/h7FWAFVvYFhMz6qQe0anSvdRlZ9SHA=;
        b=CXKR3kityPWFTDWHK0IIkQGWQFExYD93N9pF507gdG0mQdPM0Ui9ZIjwv6VHSKlKfj
         TDTJBazKHaWXFPjy5V4eW7xo0ROxE+9emoFOdKSRFv9xxWDIlRcbe82p0Q5HjTTxeMhw
         WxoIwHzJuGTzDTwXh4qNb2XeakqtURMRDZqktWFNpCRmhDA8xAiNplNGH5/M05tXWCI7
         wsXm5SaxqgYo9EeqdLq1ARxeToO6j+r76QEVRi9xJOdNNwENkooIElbhYSmTtv4yHcrF
         tlT3sJrdDW8p3vryoU7K0c9ylXvHEvtfQJhu8sWPUoafXZHkZ5peupzNIB/cylGkH/HJ
         kpKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184798; x=1795789598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0hn7BxUfynH0D6hp5wIqTAHOmIKvssBciDk5OTln7U=;
        b=YNDSWA7AHnhUQ0y8K6nao7g4a5Rx1hcYBaU0qFNN4Nh7UAqtMlfhsb9EIeWr2iQGu1
         EiCdjHWGSKj3jp2so1TuKMdKy+qRWaSeY7HqM3Js3n0sT+CX0x3229kN7E1RWJKIh+aH
         34zFaIusHxFVtWVl7UhjUjXdXyabINjK/Vbr9JGeKZYkjkZHBbIJ9niw1s/2UZraDDow
         XCDN9/3tS7eYMOnysta8D0iRBoCoEDqbahXz9lZn6IRVoFT2MbLMZRpC45IE2Ej1CeoY
         L5XD3gIx1o6MFNRskYQXRzbZNHVVhEPbeKWEqLqZlk4iizCrgXJZRY7a0lC3S/m5yIKu
         z+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184798; x=1795789598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C0hn7BxUfynH0D6hp5wIqTAHOmIKvssBciDk5OTln7U=;
        b=LJGFJeHKr6KuphY2KUzjFfi5ibnLaQnPXFoqpGnQawGbrhvhHR5ES8MtDrmhsGwmRd
         tJFikm82jWP6M6rResilRD10bKSmE0/rK/SUIg1mBxq7apFnnKoq8lWaoVf2eHoz47S5
         vzFE2bGkw5AUL1TRp6sAcl5OlLZLqxWwXKaE/CVkSgzMf/hNm49EJ4z6IXjvK7CQpksm
         KuEqj2a84H0f66z047x+SpK51ObhcrIfVthqIqnQ3it/jxxDAG2/y0GH0f+AF3SppWfI
         uYHGLDNsTD6jkuoenxu8TO8ceiP7J4iuH0SczJXpb6ggFZhxiafH5dsVhAOuclgM4AfT
         NXTg==
X-Forwarded-Encrypted: i=1; AL+hErGrF3mHmLyUqzt6k99jedA0YrsO9owUapH22GFEaV+CafX6rGHBjaZUD5uuiuU1zFEANPBtYg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z96r+DEP6zDqcH1D1MW+2SUws7kllriYSCqbXhvvmKuK0F0RZVN
	jYR2uyfYKPuqJugzU77lnxJQePE0X1MCublRKYnbw7AsO3E8UEDI5rFuzUkvJu4eQ428mI9oGY3
	4SFGs2E+OdujrNqGgT4bQ7/ldkwsUzu4=
X-Gm-Gg: AZFdTZfbPGZGJ8rLWu+ohbAYxUAXwqCGbLj48oDLtkTWOUqOvvFsTVcIpl/e+vL+2TJ
	v1vx65EuEipD8olPDAygwQnAU7wQoTExVwEKiK/DY+PcezyfDSOB4jWGPUeGCloTKFhj4vpEx4e
	DyEZqbuOyPJIPAdxzCmHmBFK5dJhkhnTdTZo8B6XgRdwkyTEt7JQQt4GY3dOkBGY8nOw/q3yRY/
	ZNDPxuQ3J6u1LDscFlGpVQVKB1/lVpPwwwSLdlKaPcJc92eQcFXIh1ACRSm76b2duf4yuurI/qF
	N3M3e573Ucvt2S5CtfqgzrkBLK1Y/oFfpUcczgend+LvZsm3mGBmqbz+sABSqtq9L/l1hYO49gr
	ZH1pbPrqAKab71WkpJW5AiYw2RKUyuRrKeaLBoyx5T0E96lLqcE+/W8r3KB1qQWfTJF1cnGPAEc
	VGJgPT5eFvNJIDGHM=
X-Received: by 2002:a05:690e:191b:b0:675:6a0a:383d with SMTP id
 956f58d0204a3-67df40dcbd6mr2898128d50.0.1795184798260; Fri, 20 Nov 2026
 06:26:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>
 <112154f6-53f9-4cb7-9124-aba263b097b5@lunn.ch>
In-Reply-To: <112154f6-53f9-4cb7-9124-aba263b097b5@lunn.ch>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 20 Nov 2026 16:26:25 +0200
X-Gm-Features: AclHuK-bnfljFOPgRxCAe6UslGe3HEuoBhmEL1577xic6EWvyu9qSiL0MyPdaOY
Message-ID: <CA+h21hq0EqJZFh_Kv64TR-oL4j=n61XK1xzzL_GMXLZr-=4PHQ@mail.gmail.com>
Subject: Re: Proposal: per-lane PHY polarity get/set via ethtool PHY tunables
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Doddagoudar, Susheela M" <susheela.m.doddagoudar@intel.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>, 
	"Lindberg, Magnus" <magnus.k.lindberg@ericsson.com>, 
	"Chintalapalle, Balaji" <balaji.chintalapalle@intel.com>, "D H, Siddaraju" <siddaraju.dh@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 15:29, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 20, 2026 at 12:45:56PM +0000, Doddagoudar, Susheela M wrote:
> > Hi All,
> >
> > I would like feedback on a proposed ethtool netlink interface for getting and setting
> > the polarity of individual PHY lanes.
> >
> > USE CASE
> > This helps debug link-up failures caused by swapped lane polarity. A user can read and flip
> > the polarity of a lane at runtime to see if the link comes up.
>
> Isn't swapped lanes a hardware problem? The PCB layout is wrong. The
> poor person who first brings up the board needs to figure out what the
> PCB designed did, but after that it is just Device Tree properties.
>
> I don't see a need for ethtool.
>
>   Andrew
>

It's not a hardware problem, it's a solution to complex routing.
More details in commit fceb17ac05e772ffc82f1f008e876bf7752f0576.

Anyway, I also don't see a need for ethtool.

To the OP: have you seen
https://elixir.bootlin.com/linux/v7.3.1/source/drivers/phy/phy-common-props.c#L128
https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bindings/phy/phy-common-props.yaml
?

They are already used from some Ethernet PHY drivers.
