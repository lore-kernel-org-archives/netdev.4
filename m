Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662234;
	b=5NCRwyhD6Q3msnSmN5Tch1OV6yz6PAQO0oie/5xEebi0Cho/iDazH3OqRhs0eCUO2duK
	 J4kyOmaBSQmPY5RS75K42T2G47Hq6oZkAfJ1nX1tnveFG6U30Bb2+xdMj0WAQLUP7nwPo
	 kNy0Gh1P6pzgaZ+tRDfleVWlMimAOtocxSZ0G5C/Ke5uN4FF7rZgUvvyotJy5+QBcg11M
	 jk1KCR/r7jGqz9orUuubcxx/hdd2SKox5jsArQpJ8rTV3Sgkk/MmYjR6XqARWugSE3j3i
	 lz9G/kRHrGB3AE2BQXz3EsaTm+KK9+keKzLNll/U07iTE+jE6LwqXY0L3Xbtv87/cfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
	b=DLzNsE5W+8g4NOY4T1SseJDCztITvxmScVBSxt8V/51juWwP0HLeqt8brWQLw6aPsyQW
	 9kOlU/mr3EqQA9ONlpbPy4WzA+Min2FxsPY1fKaAppI/I+PvCPzXELRtnrihFt/0RROAD
	 0xgXvFyb84pgcXIu129bZxRiYEE5EzfDfk1ljjZftARH84Kl6bYjw/JT0+AUSVym3DDsO
	 DtsgaHIpu4Q8iyztQSM0KRP3/TuSGdPmxe8piGKCkr4iG2dmivBI+rkrq7hafuL9EO+vO
	 lxLxI6rlM5PXCFTp0X36tHDeXTRtfU4LM5ZzAwcI0p3z2qtIa6vIwIpigfomqJBDD4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F3606A335
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460F3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so325078066b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662233; cv=none;
        d=google.com; s=arc-20260327;
        b=rp8zJTyfh3h8PRI4VVREt9AG3gVO1pSxZqrkoFc5m4aAHxFIYSUW0An3ArUhTFX5kg
         sNxjjLtrGu11EIX8qijlnCOnWaZZ/3cN4lcaDnmzcUAmOxXzZfD8q1TLhtLuBTBPGd54
         IQdQZEJO0eVgl9uJkRnyKFB1mIYZIvrgTOn7EL/Ts3490Ryk9+mRvm8yUIoiRs38wS8J
         gw80zV9xhb9qdDARbK9ibah+mGGtdNoiTMLo4a8y2Jhlbe/4ZqCQJyQZKsYB97SE1Eei
         DiNFJv0I8LfsYn8FKf9KLP2JcbpNMOesphEnCjEQ2U19zQjnQXwDzsVpLX1n4z7u+Ma2
         gr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        fh=zP2Ztd5nkXUbToAxsnpxzPZMcAZ8Dxt+stu0LyHboPo=;
        b=p9L+Rz4yYgkA0jMvSOXNJHBI/DUru144AUjH/Vi0rUk9a+3Yg+t4ofDcJfcoKMgRsF
         yGsBodpxbH3CPOIjnUiyBikh7FubayMtX9k4lnntaKa0gFxEHy9F+x08mZq53Vvl5xH+
         V91H7N4OCoSpKLVjtLYwNqyAugU46kPB0CvldfvkHz+/pZbdjBsYZQjmpfGPhVNc3ZSH
         1TMKC14i+EU2GtNWXuRBkmhsHrqRPIRUWq+/BYHsF4k2jLDtf5Y3LUut5YlKfyRPUL5h
         FroJlzfSlfeT0z2S/XqE9WqzXYMzbRm6yo+Csc4e87FLU1Bz7cf6XD15gsuY0HS16SDl
         WSag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662233; x=1795267033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=bkBiYsFfmEtp7IJKvH7hEn7KTFWusZlaAuAdlpmYXF803sUqFCC1KYxa9tyrf34zN1
         XEF5zkbgkyIS48qvP5a5GB3ex7t7UtUZYJboxL0XL4tLGHUYaONVZb6rUO8eATYZ1QXL
         8+UQQA+DM8uDBp6Hk2hDrEFaQbRoNXoI4sdU/oLAIoBHSwdiO0Ay272h0WfUXQYhiEyJ
         e2QaMbc1FuXjzS/yNEbZqG1YlIpj/OsymtVLBErLFBFscJ/L9ut44gQSUhbnqudxfjKt
         sK7WJvoJ/AvY0cJmbn/C2ArMEwRPABus1HpWmclIlurEsjmpX9yiYldYqDoxhrn8mpyz
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662233; x=1795267033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=UkCdZidO886MwAPIR/lcHJEC33jLJzAPzqOjueMkTYI1SS89syt0MQl8NhDslNUA2f
         4/fwSmqZHgwWEFirRRJBCdt8MrfVy2baLM1K4Owi/MzzGUHa23hHMj3bsMrfh89BVE2z
         yus8V9u/afsk4GoWZt6aml+WzZY3dAi2rVPsbzQ1/jdj0j/zp/lsKBXukiXuNH64ohbn
         em7/f794zenn6QlRs800+e3g3B5ETb16CYtxa2U4CqJI2ey1Bps1pNG4DA+jho0lV/ix
         4pY1ATv1dQbeOww2kkHpGJtFTWvYQVzMoKFGfGMNhJXN/gjfXjvfsezttHAevzZf25Wa
         688Q==
X-Forwarded-Encrypted: i=1; AL+hErFZKObJFfudUTGtdqZ0kQRhLnDlCGkQAjxDeHkiLfIA0Y8jPiuZSKOedKEHWB6R3n5ZdyixPW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8LKETGy5e1O7exjj7buqirpxv3xpr5fkm2eEBuNIcwidVTnEo
	RhtwpglrB7dyztc4KMSMQLmC+iUrnjThNYeUogMp9GEMEptbXwYTVDOrtnSE5R0bEgCQ8THPr/m
	3K/ERdImvHWFnEKqGrKbS6j/G27LKABs=
X-Gm-Gg: AYBFou0n2qTxqMgU811snIdmeO8Eur6GQ2uY5dZMl2feTtUmorIKJtqthpoUIVIxEip
	BPm5y3NwJI/6ufI/XUkGRyhneY1Z5fKaDSiOT871b7NX+KOE1cwGRsRM4VQA2G4LTz6av31ydQB
	Hu3Gz9fBefqv/FVkmZ6kwnGbEQeW+J7FOTizOb4k5NynzOvEfUjVGM4nxBVK4vxNpufiyjgvCaQ
	zm6kReyb45tzISw5Uq1RGjNd4/sL+OVjLh6+WehgbNchazsjfjWBqoxEW3L2K7BTlVM7wU0RnSs
	TqfW/2nBJEpgw5vI3M4iqkOKYxNbFcQIPA7NvRCadgNvY8yJKHgIwlK+0UYvmj2TpxKD24lRgqg
	xcvyk50D44BVt8BRuVxn1DAbYuMGrL0z30GkJQw==
X-Received: by 2002:a17:906:dc91:b0:c50:5a93:3bd7 with SMTP id
 a640c23a62f3a-c509614d52cmr448037466b.3.1794662232406; Sat, 14 Nov 2026
 05:17:12 -0800 (PST)
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
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <20261113-good-renovator-99924ca0d55b@spud>
In-Reply-To: <20261113-good-renovator-99924ca0d55b@spud>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:17:01 +0300
X-Gm-Features: AclHuK8rhFfFvkBwbKflVQt0QnoMak0rCeWcBpwf3o6KE4ySn9wUi4t5_Sc9CCY
Message-ID: <CAOPX74613tpMONAYkvY+6=UqDtJ7h8r8FmHmnodmNZ3Zi3RBbw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: Conor Dooley <conor@kernel.org>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Nov 13, 2026 at 8:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > +  leds:
> > +    type: object
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
>
> Please add some blank lines here,
>
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
>
> here,
>
> > +        properties:
> > +          reg:
> > +            maxItems: 1
>
> here,
>
> > +        required:
> > +          - reg
>
> and here.
>
> > +        additionalProperties: true
>
> This whole leds node needs to go down below tx-internal-delay-ps, child
> nodes are typically sorted after regular properties.
>
> pw-bot: changes-requested

Thank you for your review, i'll all of the above.

Best regards,
artem
