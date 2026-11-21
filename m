Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795251874;
	b=2RvXnR6nimlvELMgeZZ9SnmOhvL9IJ635rVZYTdWoL82W4meKxbJMrEh1pWXGhKY2sph
	 AjLk0kAmm32I322WKb+x7Nf/b5KHmTiysHthLeSXHvzZ3kiyrRR35UIZ9QLbX+wDV3l2z
	 dPXfb5Fdl9IkGoYOOi9avhg4ub9pzGs04jgeQKc43Q31MxF8CLwaE9lb17Resy8GsyTiQ
	 7JcqRa3QxjuTTssWZsSRQsVT0HA1hyjXcF3a/l5BaRa8kXNEBoGz/SSVUXcj4x9TwmOlb
	 nL9VtvILkZWQ8rypVaumSOPan1VAbmuiqp6N/QsGzXe2PIx/DM3sS2ccqYszo6aJmRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vJzDrAMO1H6ne94tZBu7xLod9E/Xh1z21UKz7nrVjmU=;
	b=FdULsrbx6qOL9tcggmy2P0dO2J2glHI5Z6f0rDKQszsjLNwMS8w/COQBexuqGuZ+gXKb
	 7vxqYC6iM6fVN1A1Y+lLfpdRMslJR7lOI9WU/5UV2NWyYlyrWUK91jjxjwTq1iaKed9Fw
	 AZ4ePpT2XxBiLGcAjl6dUCGYSWUcHZtB0t0JKhwElBo1gBzhzfPEe79k+oMtlRA50I90o
	 adxg9/YHzbWBmQMWIhIeTxIXNZPMZCqF9BEPsQxNp6EGzq5YwTbt9+hg7B3pk+/yaZ3e7
	 JdARbmfxL3H7LIlVayg6pH2Xo4fbIePJ/JM1ruUWJywMFBqUIcRuGezTXUg3FYNF9eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJcs2Nvo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6DD606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJcs2Nvo
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c511c0e2826so208657566b.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795251872; cv=none;
        d=google.com; s=arc-20260327;
        b=VDsoZgccNFPJ/xImSRwzaafVf28EH8JRp2/rMa/6Zu9aRbmP5a9SNbbkZX8Se/aEoi
         3mFGPlRwerAQGFVc9t22VP1M4kWFaBawS3h4yY/pgrF4Q0CISq1XhPPlJo1Shc1ecHhh
         biel+c8SeQW4LM4qU46dsHSI5i3zc+wGc8NuZ5Y4h+tMorMCB6/y3XTqGJdVF7CvoIhS
         VKfkGrBjFpm/hww/GNhxJsWtfnmefpYAMakrfLrbzaGk7yeObXHOj39v+FOj2UeOkLEj
         o0unfmIZGCBDo9rc+1DSK8GXdIuO6eR+W7LAimPx0lP4NueTkvsBccpBUoO6B5fjrx3h
         pKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJzDrAMO1H6ne94tZBu7xLod9E/Xh1z21UKz7nrVjmU=;
        fh=MYyztaY6guunB4mALlQCjCJEQSB5n8WWqn92s4bPNmQ=;
        b=HsPaU6sSAZaV8SNhhrXRHau+eWc3n7mXtLrIDyjowMSGmy0N5zogXXolOg4LlLVn+h
         xIpP7Prumfej5YmDT+SEFCRmahQiQkutimCozg/kjX5WZT8KL3i1bx8noscYNypUdhzn
         18rlOUbAYCfLyqI/gyFVfyx6MftWGO8auoQBTjiN73Hc3Q5TBAEnGWqru6BD8uA2ie3y
         35iGN3Vmvh6OAaIMB1mYIUIhfiReXLsk6wEDY6nyghz46fx9uJ7E494xbIQW83gf6QXV
         VuxhTp8He2p6wtoged6iXUq2U0PNMEL70f5C8o2z+H/0ZcJt9tuDytSTP3dKEPgrCi/i
         ljDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795251872; x=1795856672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJzDrAMO1H6ne94tZBu7xLod9E/Xh1z21UKz7nrVjmU=;
        b=pJcs2NvoF9w4O7/vfEcDkXIXyzNa0ARWTZ0pJwE2SBCVRdcJH5z6B/m3KMclYz9PCw
         OqR5o7ZrQ/kZtTkcysjqkh+j29Vx70DdLsKsw4kBlvKY6+RRxb4wQ1+KHqVyjEjI/HZ6
         0QqpXhjSAVl9jPB1m4+mv1E0ENRlf+KOKMwI7E+jD8wLKUWDtPH1l6LheIn7hKX41r+x
         KYo4XJL/j07idwYDHSAU0ICt71u+BvjJjCOBQalgrnfzcAtf31E1GhCsoe0LAUalp4Sg
         Sbp5eyIPaJmsgv2ncjbX/5eJmmLG5HsohHjn9OLs5Goxk4vflzrvSVFHbkM0cM00FRa3
         fcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251872; x=1795856672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJzDrAMO1H6ne94tZBu7xLod9E/Xh1z21UKz7nrVjmU=;
        b=acjs5mbfwue/LNYWOxbrXjvyAjyROTIK2ipyFVLUTjt+bVU3biYc/JFqwBssSrZh9e
         qS3FgpQaL80jwL77H3rK61i+YxpEpkeilO5C3DH+GcnK/INkRPy1FEwH6zJXhEn0UCF+
         kJ86qEk8bymiBW6aUYkEaj/awlC3y6+O5JfkSRIvHszrbdTtFazbb4mG4HSJdESRkqVI
         kWCwkOPHS19eroTvA9Xz0MfU7cI8Lu9qArqUsJ9BysDdLb5zdH/VI31iY0zQIY2e38RP
         sZc+WPKOwRpz2STgeL7Coj32bEf/Rea4J+njkA+3p1iTlgXOFD+/3fKjiyHcTopkGnoJ
         q3Bg==
X-Forwarded-Encrypted: i=1; AL+hErGcUqgfyF8cHCbUGw43znh6m6lOtvSSRXCajq1nQpNuVJYW1OleTw5GKFy5UiXaCtFNOkr4q1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kkPEWWU0sRwnL5SRgON6BakdL99V9h/5KqCpnPDT2P6W3AKyc
	wm/ubHQ5N7Qf5xj6Va2vv7fqLPQZI57kVK9mzg+CxB0j5pZxMJUox/p9kNLCUqH/k9SejyQLDtM
	Os/QzXNlDFf5ItUWzRJUIr5qvgAVIJCg=
X-Gm-Gg: AZFdTZf76jQK+DmNyPO55eI5/bt4zcJlea5wSMrD3y06vdSVTGjoBfY0V3xYt9mDxDU
	+2z37cqOhLaffXm3BRgcvn4uGPvgAkb5vuUNbIeBx7jUCf/u9vYs3DxjRdVEwErMtDtqN3n3vap
	pBB+th1+q6+K8vdUPHoW4uSJY6f5MqMaWAaf/b6zGVMXcW4WB3DPA3katPEbtqo2ik8Em4WAroQ
	uhPpcpAlVR3oCgrL8Pyc7c6lSOPODHnkmBpA11SvjIoBtGbHZPVD6Xbb8yH9JEHck0z6Ikt19hH
	Ll3VuQnEtotIoKoRPaQyupkFwUC2sXXfK1IYDREwVvgRmksdcBxO0/iDIZf/Nae/LwT7wgAz5a6
	G8geZVurELq9rCCgCka5enxLjElIr6a/XIR44ReYguVCwprBqMyyQwbdnTjGndCX1XJtUICQsC1
	bOjrgmipgNu4U0owKsx6nwOIE=
X-Received: by 2002:a17:906:7d4d:b0:c40:80eb:c54e with SMTP id
 a640c23a62f3a-c513a47e0c1mr406848066b.4.1795251872242; Sat, 21 Nov 2026
 01:04:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120063756.3677554-1-pawlik.dan@gmail.com>
 <20261120063756.3677554-3-pawlik.dan@gmail.com> <8955d9e9-d7fd-4bd1-86d3-d128fbfcbf30@lunn.ch>
In-Reply-To: <8955d9e9-d7fd-4bd1-86d3-d128fbfcbf30@lunn.ch>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Sat, 21 Nov 2026 10:04:19 +0100
X-Gm-Features: Aa3M54pH2OwlyvkW9o30NN7f4WVkWtn-LmuZ4d8d3jRBszry2gTwVWzdGpxI6fs
Message-ID: <CALC2ApjM=ooFdSQ5Wqov=8jPRa5PGGYvBhZ0LpUFnVPvZ9_r+A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kabel@kernel.org, 
	petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, olek2@wp.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 20 lis 2026 o 13:56 Andrew Lunn <andrew@lunn.ch> napisa=C5=82(a):
> Quirks don't print anything. Please change this to dev_debug(), or
> remove it.

Will switch to dev_dbg() in v4, thanks.

Dan

pw-bot: cr

pt., 20 lis 2026 o 13:56 Andrew Lunn <andrew@lunn.ch> napisa=C5=82(a):
>
> > +static void sfp_fixup_oem_10gt(struct sfp *sfp)
> > +{
> > +     char rev =3D sfp->id.base.vendor_rev[0];
> > +
> > +     /* Revisions A and B of this module have no RollBall I2C-to-MDIO
> > +      * bridge (on rev A, page 3 of the 0x51 EEPROM just echoes writte=
n
> > +      * bytes), so every RollBall command times out and the PHY probe
> > +      * keeps retrying for over nine minutes, holding rtnl_lock for ~2=
0
> > +      * seconds per attempt. The PHY is not accessible at all, so use =
the
> > +      * module without one.
> > +      */
> > +     if (sfp_strlen(sfp->id.base.vendor_rev, 4) =3D=3D 1 &&
> > +         (rev =3D=3D 'A' || rev =3D=3D 'B')) {
> > +             dev_info(sfp->dev,
> > +                      "rev %c has no RollBall MDIO bridge, not probing=
 for a PHY\n",
> > +                      rev);
>
>
> Quirks don't print anything. Please change this to dev_debug(), or
> remove it.
>
> Otherwise this looks good.
>
>         Andrew
