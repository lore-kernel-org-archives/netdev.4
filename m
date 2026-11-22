Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338789;
	b=xz2UMs1nLoNYa8HTHLnJ4bU3KEB6vkeKa7bNmcUwCkNoAEAfyTpvoxfyq71yJjqIaDbi
	 J1hCAiIlWuxR4Tl2FFWShxHDBFUkgq927VuEpPQi2Tyd1E9irAwQnZVuizod35ltjctHv
	 8FK6jTRBU3LeyFIl9QdT+y4HLHH1gy/okpfHTHTbqZEJjwIfczwpSG/nDAvb2KNG+fZ3u
	 xKTOybKm7E0R1EP+1Vn/aF+iyrsTQEx/jkrTVueO50Yj3zE01+FxEDA35YA2Oej5W1nMX
	 9zuRnpZrIwmXZTfrglPus1vRmTxEwempsdFF+3N7Q8YO6A68sYu6k/2Q3UuLb9SDhiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
	b=SHiZXivXz74/c4Iw1R7Da/M83RC7hzDmBz7jAo05AcdVK+bG2nDeK/M4hw7vasi+Ds2D
	 R2/CEruecbXcSGamA+aNWkLRsaWquyXPQA9imN++o5Ov4zk8RmHOjNsy7p5tPuGH29biA
	 wvOOAsfMYNwjCgHnnrazFA2E0+i+NvgAZS0BmMbUsKrMsnQWIErqcStvMOvsE5b6VAxI1
	 jnwBm7UUEKv0w8Z8095MvEOjGB92OMuiLfYYBwo2tF4YuNJq1kzxmEEdv6mttXdVlRl7u
	 g3M+8lbdonBEKTjyAmSIu/Mu9jv1p0nY6ulXmKijivL6FEiqJcnpWSaO2Am86Mwyndw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhix75pl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A91606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A91606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nhix75pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so1803551fa.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338788; cv=none;
        d=google.com; s=arc-20260327;
        b=kbwaSs3EBQDQX9fYhixUQmmE4tMlNuathwmBO3yHM1+Fbi1jioP4UbOkhrT9M5zLqj
         I10+4Qo8yJaHnjAws1L81WhEnpJRaygIsj7gmYzUTBcbFFKMKV+BjCrWaNCBHpO195v7
         AO4qtFkOCCxjaID9UtgbVdSgQfoQh+o5Eg0sO6JvfQzVxQIXjYGa+3azOIUmEu2/T5CK
         dzHPEINw1Zb3+ta938ZOd9MgdQMrJD2CnuseG4/uNT47CTtj9JK8aJkEGAvTPmYp6SLm
         LN2ZXvcoWPeLGcXCJpbayXTrzrKfhVK8ancpFcTf1onStWXP5Her388ytcT+iKupI0x5
         07Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        fh=pQWCqY0anWFFvF/sdaAKw0rqz1Up0BVsJ8zRUYGKr6E=;
        b=X0fjwoHzn+q+1ozZIj4wVfWs5mCdo6PT/3RorFSN9ikYRoq7yetKNmHMbNALgkNpUk
         qFz7IHaqI5/teNsBl0ZEqSvjMviyM/Kb7CrJOsQt8VSYbatqQ9ihdv8dCcs4j8CEbVFn
         CynH22mxxo7ETgIk08aJlQLVHbajk1HSwqx6Bj6Ok09D7eocAxqTCXPX5gQhgJpJjLqV
         3z173rANTjCgkHaNpk5vIYjsTuVyvL/usTcQAtC3z58RWaGymBUuZqH+yWUdP2zz9Zn1
         BieQybSG6iU9qQjyx2x3CqsovCEPrmNaRJginyO7i8wWstGK+VI4oNPuH3KgmWTzXOcA
         GJmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338788; x=1795943588; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=Nhix75plpaCdYQiudOKv0rShuPrvyg53hwlzuk4Dml5eT8xu9SMPaTf+GbNlHPeYD8
         7p4t71dRhnM9DmffJEY4b0u+h3oO1YgqhugpxBFpWgk4AaqZjupXmTxklIZcLY7BHdE+
         P6GLrDXq8buRWmmPL+jwx8Ikog4ZmWeRKXk2Q09O1LG4iD8Ag4w8HMAucLtSRvLLdgyb
         tl3za4m0Vja7nuxGZJgWE+JvKZyuix5P6VKFFlPK6vRbhZciS4fvdlyzTXsxe3h2X8HK
         Zkicap6Jcrfeln/j+/Rj1PsAyGufyu7TTM+4vNIZtMr9xad0P54bU61zzfGFj5LETGfG
         v6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338788; x=1795943588;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=1ol1pPEsnAXHMf9qkSaejgHKT+gTNypqkOCEwyWcg80qyJGSxB32Vp8NhxHH3EiQw6
         3gDaB0Npg9GiH7WDiuX5xMRddpm/ahbK9tUXPsiwp6iLbIHI2jVFkEehTktp3aFIbGKE
         Qpk2smZds/hnCmJ+nKwVkdo/+gdfxsB4crL6OoqjWCGmnc9Iv1aXcxIRUT4vLTLeiZVB
         p7E6w4tSRC6DkxSVh5N98H9HvwlqDp1zvI+LjAVwFWchnevoeK7QPaJ9O5EULXo9tnVE
         eZKdovQto2d9iWPIPsxdU6HDFn5FYNfDY9s9ZDyppkcczP0QCArd/EGVHu7CbBEM2Jgf
         woGw==
X-Forwarded-Encrypted: i=1; AL+hErExzLRoKvOGePQxU0ohnLv0YnSUMPgMrlxkiyC80nFIGYAkbmjE8VneKuo8fjiAjY/h+4J2dUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hBhxttnd2N7QqFeI5M06AvqyA+fipwFNEqGgEzDiecbwlCDtZ
	bmaXEiCcA6gkiuHE5UHlhtPpn8MqT/vz2WeieJO1p5RK40QzLlwvMkijXln9OD9I9l+J5lHRWB+
	gL7suUzD8gwOuPhCu/7S54wRLoX8yDHE=
X-Gm-Gg: AZFdTZfRZ1PJYKRltHyqBDevAX4eCiTB3bc2T+yUCsT6ahV3tzuYUCmAkeZjXA8eMvP
	i+ub33V2khsqZFIWiI613vGPk0VjOqw+9wNgyqmk8gS3SboFde4XaqU4fuZeokCEGkKVT7M81aF
	mAZIU3XXYXHGdVf5Valgi1/afg7ZKIzDb5TNR0qZ9ds6V1MbHuoNTMOemFBOIoLdQZ4BWNSTM4z
	WYcPvwD93bIgUaGpv7v2ITvzfNKlSvmdQWcwbITV2UZUaWGtjfk8p004lvFyTJP+7V9hEFRubv9
	8ngDU/70pD3sL/PvvI1clRJ/LV2JfAD94isHUfE89CuB64Euw/aeapno2GBBX0eCrJJDHTfjtai
	gTDSF4k8pk1K/nMw08GpFlDyeexfXCoG8a6ZdVo83rrjr3ybVHMFNc8oTn4sgpKC3Ie9qYMc=
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c308ed81f9mr799710e87.6.1795338787631; Sun, 22 Nov 2026
 01:13:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
In-Reply-To: <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:55 -0800
X-Gm-Features: Aa3M54p83wm_hVpGZBJqvMK9Qxelv-vsaTFx_mZWuVaXR63vDKf_CE4mO6QIPQ0
Message-ID: <CAEy9hNVmG0FiYWR8ENyQjfnCKrcMrNNJtTMJLZQ226FQjQSUGg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2026 at 07:02:38PM +0100, Andrew Lunn wrote:
> Is this problem specific to the dwmac-sun8i?

No. As Russell wrote in his RFC, every core with normal descriptors
gets max_mtu = SKB_MAX_HEAD() while a descriptor buffer holds 2047
bytes. dwmac-sun8i is the only glue always in chain mode and the only
such hardware I have, so that is where I measured it.

I will send a v2 that limits normal descriptors to one buffer in the
core, with the lower sun8i limit on top, tested on the H616 only.
