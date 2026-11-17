Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951478;
	b=pG/ka0nBpD4MwUp8FvONfSBIin6sDfu0HIFOMuMqjxIVIX3YorJbCS6aRHbbqCsRFwcS
	 mC9sxPwWp+0KPNALRKTd1E/LUUyQxZzAD+qX4V9PlRDNKeLEZpjDcST8SssiPa9Yv+Trd
	 OPD3N/BPZu/kP6lzXLGh+mVxAS2sbVI2OmXZI98Y8td8MNYJmBAdTZAyoMzPsAAp003lY
	 xEnqFiTIM95n5zR2QEDgdIZle0gc+CqcrmJv+LPpNT2Jdst1jRCLeAqFsKJTuaTHc3qMy
	 x4lZoeGMqdOfKboggMhpDrCfcgpHT6bzoyZTOY0VD87cZMPBlXSDvze2hr8JFy2IJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951478;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=43QFFgwzukS6yZXLYhZVbDexLmF7PKGNOsnRTi6FpR0=;
	b=15E0z4Nc/zbGoYWa4DR0DnUbJTGvMHaUY8NyPP5I+uVTPQ6sWO8upf50B1pNTAnHBj3F
	 4IoxPVxBmb74Ragp5RcC4q7Rl2kuJxLtuWUSp6wsx18hshKejgbPPOzIsDlDzcSEU4z5z
	 yGn5WOeX2RTqx3SoPgS9MkBx3loBlv0Yby4Hn/a0BJlviEMK43iOJg3ovEVc6rgCB8l49
	 zPnDmP/bDFDA8hTv1f8xP1kl4dVSxtYpu7cff8LhPsF7cO5gvgbK6GvGsjmyqSej9lMXq
	 LogkHu2NtybcsNxtIu04SQk+7LKmI1YfRkEVPi8eur9tdmMfi6n0ghKmR8bnyUoS/kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciudnLAv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA48606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciudnLAv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FC51F000D0
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794951477;
	bh=43QFFgwzukS6yZXLYhZVbDexLmF7PKGNOsnRTi6FpR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ciudnLAvHlTz/pkvaO3mVSNytfC2Xd/M8nBp8rOsJDKgki1AwqhOgOpe+GgeqRdmX
	 BS4/93t6Dzt3cQvUrwMqTHI6/tKG1otW4QpgsavG2L7IZJIZ5AEHC8vHQkM5q8fF2p
	 CppMoj0//1c/edMc3nGCfXyWIQS9jJTKqm/OOVhhm6gH3ZNY7d4BdfZ2Yrp6NVFwNw
	 h8/mP2X5xq9MwNwT8+dXZQrevlvU7gVVPUJsrH6utRXIf5UplbLKxD6mQHA3huXFqG
	 NXD1DK3eDiMnPw15vgIYslsIBgeWMUPgqSp2t431IWH/WgrqBLL6+Xpv3oBCco2Cfn
	 VY3MVNQCKqLrg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso248043e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHU+FWY8bYTZJPTlxp5bNOkOEcjSWnZ8IxOq9kI1RAUnuhi+AONbVEzaLFPxsWIwA5Pkdhbwsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zp92v2H7MsgcWgqlh4/bxrN7jJp6bgSxLC5GW2I/gbnj0OJub
	nVmN7ZJ7wupyQOI/pDpMZg/yf+5DafmK6U8/ZD0h8oANA9YcUNe4VFt9uszSvYOt1cW34LdKs0Z
	6iJQrNgTpyLD2TSQMohTL+4veSH2jeEE=
X-Received: by 2002:a05:6512:2313:b0:5c1:4bcd:c316 with SMTP id
 2adb3069b0e04-5c1aa0705c5mr133596e87.10.1794951476413; Tue, 17 Nov 2026
 13:37:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de> <20261117-ksz-stp-ageing-v3-2-135de6b9f8ad@pengutronix.de>
In-Reply-To: <20261117-ksz-stp-ageing-v3-2-135de6b9f8ad@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:37:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLn2szo5NY7zqwCyRAkdNJQ60DcMnQUbjf+L_w-+MkBHYA@mail.gmail.com>
X-Gm-Features: Aa3M54o0xRQuY3uXAHxYl11MpuvPvx6L6rwTSmOyLONxxLvVQa0OV7NqUKk9kts
Message-ID: <CAD++jLn2szo5NY7zqwCyRAkdNJQ60DcMnQUbjf+L_w-+MkBHYA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net: dsa: ignore the old ageing time of
 the port being changed
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Arun Ramadoss <arun.ramadoss@microchip.com>, Jiri Pirko <jiri@resnulli.us>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
	=?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:02=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Pass the port to the ageing time notifier. When
> dsa_switch_fastest_ageing_time() takes the minimum, skip the cached
> dp->ageing_time of that port and use the requested value instead. DSA
> updates the cache only after the notifier.
>
> Without this, the minimum includes the port's old ageing time. During
> an STP topology change, the bridge lowers the ageing time to
> 2 x forward_delay (8 s with forward_delay 4 s). When it restores the
> configured value, DSA programs the cached 8 s again, and the switch
> keeps ageing at 8 s.
>
> An automated review of the lan9645x bridge series pointed this out [1].
> I reproduced it on a KSZ9893 and tested the fix there.
>
> Fixes: 77b61365ecef ("net: dsa: remove the transactional logic from agein=
g time notifiers")
> Link: https://lore.kernel.org/netdev/179180428624.434549.1442562388422379=
5761@kernel.org/ [1]
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

This looks right to me, good find from Sashiko!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
