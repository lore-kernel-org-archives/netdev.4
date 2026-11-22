Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363274;
	b=niC8I6gdUfyC0m0yEu9zrxyU/MaW2lD5AwLGbwsAPsYYqmuo19JjKf/aUFqK64GQiUnG
	 RK5Z2l2GGJeM47Z/RndnaKQ5/UpylxQkHePuST8Td+t9q3zyD3GYBXh4BsnDOczXrB1tz
	 3jEp6X+q1CxEdUl46ae06aMk7D7v9BNmGU2wdNQDBxnErzZB7Aimh7mu5yYMPcFsaJUK+
	 Ib/9Jx/Redvn2A25AeX4bVuAlHZoGIJxXBCWnxunk3hd8iAbQipX6YHS0ggRQwk3hDO7b
	 QxPe9XgnCVQeA0yeEFLd5bcsTGxsrsJk8sFbX2RFPWwUh+XO+7yU9mJ0mjtyFw5Vjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363274;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=;
	b=CDPFp+I6Q2SVocJRKMegtszqKj0Dcdy1WRlUaiCORXLCsrFM9Pj7s0p0uIJxdbdVjjhj
	 65Y4bPK7WHlfSK2o7AvQSXL3Juf+y2Zj2As4lbpvL7Lrei4E6HG2rTLCuL4M4SekEk2An
	 9TEW/7a9k3JmhOeQFILUGlZnmmd2cixevh1WugZlQ+UVVSOUFL16lVY2NaQ46xFH/xIw/
	 Ksi2dSt71dqZUQ363kihH0E7p9yenB08goigmEdrm3HFV3ZKdZbBcDKZPQ9rw4rGSDX3d
	 xV5M0B1dG7iPaOlzII03uk1fwwDWsdtbMRfbIUc4MnzTHQDJJixSG9P0vCGxfCRehVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzfauxW3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E83606A333
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzfauxW3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E19E1F000E1
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363274;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=LzfauxW3rEExAgmdG4kLoxGoYz/MCia8CKAMKl83GyTQO0VtPeGsltO2V+0WDIzWj
	 5iECqnhnsj/kKrsaZZtZk0JF7iqOz3ahCt6gKFZoeCjvUuH4G+mPSe+xwT74u1jd3i
	 QF9gztIjuvKpikuFo71r975dBEJ0kr1hGDuDYjo/O/TRz+k3VHSfQI/wli9qg4Ng+3
	 dBPEhXy5EWxAy6sz9xdKD6tt4S48iLgaF+amu2RYe3stbbjXIWbs98fXr1HI5mxKlg
	 KICpVYQ9w6f7Vj+VrtZPVQwSY+uwspIRjAXPj8v0O4PDsMoo3TwFFPD+0XpeTJTuHV
	 dYP13IXmp+OrA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so19659021fa.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE32WkKNjQy3gXDl3eJhnUdo8tYXIyxMvTmLVgB9DZTUSGCMs2vtjB0NykWC1oGTT7RFZzu6I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WXrxT9jkA7Crk8k7V7KDyMlvJyvc/MKjpVnkx2tMyv/Ci8Lru
	+4PEa5dvTq9kMn6K6AJU409ujPm1UHpbQ8Ipzhx1zCp1ZteGvl5vGof7q28FjSS4CY9QGmiwJc4
	gheYR/CkpLRoc8tTF2gMeWLkDlU6dm28=
X-Received: by 2002:a05:651c:1474:b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ae7fac2697mr24800931fa.29.1795363272768; Sun, 22 Nov 2026
 08:01:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com> <20261122144926.284857-2-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:00:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
X-Gm-Features: Aa3M54qOwDNW1Yljk-lFISp4AdkVQZj8kdy4KwB-RgmQjeLm8Au5CMg40XaXguE
Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:49=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
>
> Allow enabling RX/TX flow control directions separately.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
