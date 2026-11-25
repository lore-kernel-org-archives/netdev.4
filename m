Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607454;
	b=ww28E3vZmc8qmCg1hoc0d7XuxCVlgUbvUcQnxFpFpWpadsk8d16Bv/NrYeogi1WmJTvf
	 s6UatOvj1GTdJAs3HFsyPR97yYNW5MaHlTDwTBu4AWj3reWgmz8fxDWPNHncxoXZN8Rcv
	 eoC5U/Y1jPxvac5Li1dRElYdCMA2/Dk6Z+Ar9+pszbmHkGCzyYAoS0ikUkagbltwOsmC6
	 3OoLJFFVFO7v2fBTasAgB486FHzo5Py8ZjCyg1DH8upGjm1Yine1Lr6+g+1vO4mahfNuq
	 EMsPEZRgdgFRq5Na4fmFoJWsKWKXgBoIdQj46C4LV3XQ6159RGlcot4+CTEcj5rcuiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
	b=4KE7DU+NYIi5998domvkD6YZoMAYGHozkDVp0MtO4LCxk7U3o9DA2hnBDo5c/nDg/CVh
	 Pqt5Kk7GDUvxP5HSmeWbEsR6Tr237xXueqrNJVhk0+XYePfS8n2NyEVM05fjrR0yP/bSD
	 onquXwjjO65K6DKVMXmiHHPCgiGyNJroWxgTIcM5GBDT8a3KScTCSYc4uJ9FIL5Hh6hV3
	 Yph6tydHm0KmFfk7g+L0EvH5+XoA3m5n673mEUVULzkJV2haSUi1bMXzfbCB5lDr2Bn5f
	 nHVnYIBdoXCjir2SAd3XH23nMN7Pl04MvV8lDUf4Hz2clUGTEqYJ37XIQoclvcY860Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6C606A33B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF6C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCKrplZv
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50aaad19fbso624213166b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607452; cv=none;
        d=google.com; s=arc-20260327;
        b=NXqXln2i8c4y+gpCJoQvuv7W7d6iNri/cW/GFnD0mWaYFbgVFOWfKgPj4IbwPtRVJ6
         Kbgew2DjlIzE0p2Epe6iWi4HfMNnAJ1M8iD4M86Db6qKyntcw7SErcU3TnKNCH3zs09P
         G2jX2pYuyZBpSjSwRg50RpohQWjYsCy0utlZDSJidGN2RzhxcBxaFcU4mce0y1QXOIBk
         eBzM3+AeA+b+HtlH5AupvDvUHSEf6LmuWxUTnQmaeUftv/iRsjLjgmtJnWcGUZrjlLll
         sCCq41l3AkmIxJj2IFuC2X3GsoecPuTYDRq8IT51WfoKG9OHdO6yv+hgZSspvAkcAlzx
         bFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        fh=SpSH7AHAzo5YSMxPb8+SEgxHD8wjvpphtn6BN5QwFeM=;
        b=BWKBL3X3nTHsF4QKYLU/B+F0aLitqKFvkFmRJEQyvbVhEninfqLAxEsk2wZhtLsFio
         Ph7bxaIahsvlvrZVUz8hnqGtEZjnfHc3paW2toHuMElHpAMrZ5G4POmNf+Vq0LjcL6AQ
         bffMGss8BvUFcmRGlLD0u/jnV4xkbd0YGmfDDcUXxrbC4ldrNTj4UvUWsFvwDlhrvGE/
         IoeukQBMeBZG+QcwIq1RX0zLDQeoGRPC3h4Luqa7F84I8C7w+Ec7TcrGFP6MwyIhq9X4
         oun8RKSQOzXxgneKCmCaoaQ1/lmtOYaNRTj191N36ecv/7TsYXO93MOTMt8LRdoJQfoT
         L4Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607452; x=1796212252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=cCKrplZvKmTmChiU/HWkkzSUlDXxoFNlvdQW5t4JT7LvZaH0zotWEszT5kKBJmcN0m
         vPomZV2tFWvlHcSrTbIAZuo5IG+DDIIhkqdzaluUlsEaQbjEEHWkEha+8MbbvKJfHpNJ
         bXl3xKAlMN3VvWpQbWEtysh7LbJqy03KCAvbBb4/lPCY56uKVSlnQ/rDAF0EPCdFR7da
         whyxBm9WY9e0pNEXmVJmY3HAxKfEu64s8CS2jmMBv4BH0cWdBkWz2XGF5xzGEM5kJXEv
         Equ5HQ0aYS3C+qnGSq1ascS5uzpxPVUWCGsWcVKOYAfoIori+vEAGi22Mpu0Ajet8D72
         wlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607452; x=1796212252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK/FrytH2tf+B+57Lq9wnH5wu00oxO/OQC1ZXkryskE=;
        b=euSLrzG2POke7Vo4prrzIJo6NLuTVDEI1GlTm8vMqszNuJqyurB4DbkOMtnsLUZMAb
         +PF8QVcuzbIFJrxJda0rr4qg9p53fyMptSFnYBAset9+UoAJRgj7zuT/YcgYyxBOKh/8
         Y0fbxskm/MQHptkRXJ+2eloXKb8uemjh5rnFdFPpqNscwKkrHL0e5fMIxP+5dCDanRHV
         y5dZJTysOY+KeZo2z5UWIzgg8oGs7+cDqf/H84TpcP0U0oRX0wXOG0bhQEXAhM0pELd/
         t3esqH+uDZGBA8rlrBTKkPc5UkdVsUfq63Q/y37rZ9aIBK+vtSN9er7qY2hGVFVUdGPJ
         SFaA==
X-Forwarded-Encrypted: i=1; AL+hErGW7kvpor1FgHYg+4fq8nn4Db+zrqxCmDJi/Dxq4iuTdt0WjhLpq5r87gDyBlxwrAHXn5/1+t8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a289+kh48V3ncuIpzm0V7WiWBdEe8HzPKpHfZuh0PTdDrFSSn
	55GTNJC2/uJ7uGCEaBaHGk/UFoeb4PnTh165oLa8+cXDTPVBO/QOZf/loLxEHtKtBYpUhx6/LWI
	XV/Agwep0GPGt55nxM6AeCPHTffK44jVVyQBE
X-Gm-Gg: AZFdTZevYIkTdwnUuXYrf8t/0Xol5vabXcXUHYHRhePgIuojmvfA/RGTIf6hiHvRgUj
	15mRsI8KO/G1tvtdGkbqF9MwQoL/IjEipse/+CZF9iMp0IWucUvz2r5v7f3qEPO1+///HpTZJyM
	sXvdSxA/4ECa+k0YOz8f5JBlDTOwltHjQwndH2quMjES4/HD5lAP5SW8LKXfTk/iuDl3xcTFAUc
	vmTQ4Cir1uBZpb22NUMcy+j8qMg2v0q+YsDoMaHpuFVsYY/QbNgJH1awVX/tmB6M6pCo4ORLf1Q
	n5kH3tHKHV3z0yV8xX2gd1poLAHFCSQ3hufYZ9NGl6rJnkkqfF+duC/jUbxfp9RcM8e9a/ZSk0T
	ja1Y4HNlYTHF2pW1krDUIefSaqgX/ctF/OUiF7uc=
X-Received: by 2002:a17:907:ba01:b0:c50:521f:13de with SMTP id
 a640c23a62f3a-c513a897601mr1361763166b.35.1795607451572; Wed, 25 Nov 2026
 03:50:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com> <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
In-Reply-To: <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:50:39 +0300
X-Gm-Features: Aa3M54oKEgG2JL9N45FOQuqjvfRbhcjaW8XTghdzQJCbxKeIwx-6DyB-aMwShTI
Message-ID: <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 25, 2026 at 12:47=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Nov 24, 2026 at 12:49:12PM +0300, Artem Shimko wrote:
> > Add support for hardware-controlled LEDs and brightness on the DAP8211R
> > PHY. The chip exposes three LEDs that can be programmed to react to lin=
k,
> > speed, duplex, and TX/RX activity or be driven via the force mode.
> >
> > Add the dap8211r_write_ext() helper to access extended registers via th=
e
> > PHY indirect access registers, and implement callbacks for:
> > led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
> > led_hw_control_get().
> >
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

Thank you for the review!

Sashiko AI flagged a Medium issue in dap8211r_led_hw_control_get():
the function returns 0 even when LED_x_CON holds a state that cannot
be expressed as rules (TX/RX without ACT_BLINK, or ACT_BLINK without
TX/RX). I'd like to send a v6 that adds:

if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=3D
   !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
return -EOPNOTSUPP;

May i keep your Reviewed-by tag on
v6, given that this is a small, targeted fix?

--
Best regards,
artem
