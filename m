Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338709;
	b=wZGZnunXbNPwEL5jHzJ8r7BOsxrgiXt7Sp3VE/24W+WY6Hlb9PiqNLhm8AeODlvIu1Y0
	 jWYc6IzVPS9ZlJgMa/ySxgIR6nQ1lA/Yjsrqtx4NW5KDKEaXhG6OosB1oPr+SaVNUeh4K
	 hn9IZFcLaZGJjsj9aYW2x5XhGekVy995pdNqHM3DzSfnVGbh5Z3loazX141NkzqL504QB
	 odLtr2kLoufVFkGHkeal7xupeXD/MrOnPlh/ZqOgmk8PFOOW+75TeZwXmq2paL/MXkuXH
	 YoO8UNNiDw1i8AOeDL3APWMCCGPCOmnYBFGLkqlM9oSG7j0dwcCj2iGAlcD/YQaCvzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
	b=Tt4BWO5rgs9AGMPphxQpgVXpCq6OzKw2uySld2Kob7NcILnUMq1D9aqgbaAL+hD7y9lR
	 AFGLIXdAqXIWEpWBmgwt6kYQJIaeZ0WONpB/jMJJFoHLuVYb/UIR/8avhmiBC7cSDDlTd
	 ugG526nf98M2LSUZACl9NxBmm8lZzAw54EkGebRCQgod1wq4iCHSB70W5kngh/a9NGYOK
	 HLtulg246LQdPSkIv9t9kBzqum1CEq7oyH3uN8GXt94GL5XJlOzd8QIndUOaSOykT7dwl
	 pWtg0AfqDB8/cmSvt9ZdqM3VWGVOaBUgwI+cCr2AYfRiCZxa2KzYQzCFALt4FaQLbKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uIx3yc/i";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46285606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46285606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIx3yc/i
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso1689881fa.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338707; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4v+fb+FOzlSAlttI0FaCcG3XDQdhyqDlYV28XMvjJ7/sCTwR3qGl6HNpu2s3j0pXo
         IgQfYSrnMfw3rN5AlWKGfFRluy/qTt8CP7gkQlwdbQFiMfwijva+fv2iTzUezBlwD8ja
         gq/uThEO1eOzwk6xSgi90gIX3g1SK9a5aBtCYHFR1l6ODjbtdMXLM9/4nDxsEdFbyKJw
         lRMcaa+98yGmeQhF1eP7xd6DKYsg6h1MjYrs6M+agfUlmNzLIrSwRBIRWWN+u6L/VgdU
         C7a7gjjxAtuUaGuI+4DB1dbpTU6iyipgt9Rsmn36GkjYNcY4+s7vIEKO6Bd2An49iDWL
         qy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        fh=A20NjN0RlREX+RpTOMWluYNAlCikqfdcwqwsKswycNY=;
        b=D3iVdIt0dDRIGqj8ZfR2pCc4ZdRR0sRhxlO2y7ZHECl68/FV7h1zCoWsjkBqrcF9Q/
         bbIZIfTUxSexvsS8HwXSGTvsYiZ9OeUI/gdnx8GMIPIzYj+IVE9O2efrJSpA0uuNMhJ3
         EVm18f115EaKHGCGjydQvLX69vh5KQhiz1FPyluieSQHXOFa1aLKGA0cGxPrb31+TUOq
         GvQlGMEbrZrhj0n2EkNEua5/tHGac6n1+zzRsS8L+MjXroRLmU3rZDDhMPH9LN/1kchw
         X3FN178M8OP8dtgyFjzDxLPP881VInAVnZnLroX4LqmrXD56GWJukGalCASaWEExfytL
         T/KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338707; x=1795943507; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=uIx3yc/iG2W0ZwLaYU4W3A4EJj6GSTn3YJ+PruVOjxG387fRjg+o7faziluMLrMIVO
         vUxVPMTC8bZF43qLDT7lGIny4AzKbI3TSi3zpqm+u7sHn87y/Ji7tbvKA2tl756B6dau
         y/KHufJ4wPsjhCvQpVXrZriNNqGL+7YOQ1Ea/+EkpMvcvEwC6FbxjI0M6eFnf4E5G+lP
         nKhvGK6pznIqsf6LlJufQaF4zUY5PVLrb/MQIRUyQiTB+p1XOvNPF3vxsIBzDAuOOuaK
         ueQvuSsorKvv0M/+whXuBx4MU5k+J3nWigyE1B8Hl2hB7ChY1Li4WCyj3bHmMunhErko
         n0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338707; x=1795943507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=zI2SDUgFcNDj33jbK54KGgLxIJIB/SvzTkhe0kGjm/Bf2iMACTgsQrvb36m0Oq10Aw
         mB9brgUsLmq+eyHC9deqzc7ZFm1YXUABG0/FJEZwt5W6SEmWh9vB4TpRezzcjLYR0RCc
         VrF7bLLtHsW8mNi9tmCWbLwkWenHiJqaJAckLo2mY3j1cC9bg0HmnKRGvwFFGyz93CxF
         /guwQ98mt4VPOPW3VwKRotYZ0c112taRkhI+txv6LAfhOs09TUBBSDdQ4+jT6AbmklG7
         0d7wldWTes6+hP/UeS7Eqy6NB3eCgGWONJoBNwrdys0siAbkZa/ewGSi+mtiuB9jxVJ6
         ExLw==
X-Forwarded-Encrypted: i=1; AL+hErFnO0+uYDHdAITh+YO1TomdlE73YVxec5uqhl3xP5GiqicZn2Yj1VvG+lDRmPJO1pKX1YbZEz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KN0uLdKsclkU0TWrCpYQI44roXSlOt0BGoMyIOSAnDsC+PSez
	t0St76tDMisaW/9RanVu+mvPSn4pLC2WeIHsOg+aFbErwJgBUoyIkyVMlw2rOYywBVi3hb0j6+2
	KvQvm7nnMs3SZkJykJa0SKVA0ropR9dw=
X-Gm-Gg: AZFdTZdDdwce+nGfrN+dBZhl5KotrUIqnXUBLm3OlV06MoVOcWhsiRtaN28Bx7UlTKQ
	zXAQ8k19wb0N7eQvqCxx+SHsc9q14gOLqQh6t3qj+9mZ2U+Y9J8k2NS1U5oZsAnqfh6/mJfKQyS
	amNfHg3hBXdqEYpCU7ZE7pcqEXQXpSi4VAZfFFE8dwgJwEBHAdr4wnHSGTgQ2eB9py/SLB0g8Dg
	lgKpyxd861uf9j3V+pDIXfJOaYj5SzFvWlCRE30FUTh+PStuv0cVzAa23sGsys/6dETBifDNlab
	NZU3q5ouv+QCjr3rdWahkzNt1ZOqYrDWVReB4dIPas6+/XBGMhCN5xTk8wYk+XYlvszblCSSOxh
	aOrEIh3cqxwQaZaJWVD/Hq0kPKEQG8BWMm9/QWHoL/ZXIiLilyOMk9sRd/oiwlZe13/48rnU2
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c1bc75212cmr2114507e87.2.1795338707138; Sun, 22 Nov 2026
 01:11:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
In-Reply-To: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:11:34 -0800
X-Gm-Features: Aa3M54rEVKMx6Ef6xvJSXV2IbIddu5RGXUJDnGgXRbNUM1fhz_Gu6V3X74W1H_Y
Message-ID: <CAEy9hNVJ5NzKQ95gxN6UWxsgy6HFMMFxGYZ_sutmdb0gL3qRbA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: wens@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 3:26 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> So what's the overall plan? Limit it first to make things work, get the
> fix backported, and then fix jumbo frame (>2K) handling so it works
> for any MTU value?

Yes. v2 for net limits normal descriptors to one buffer in the stmmac
core, with the lower sun8i limit on top, for stable. The jumbo series
then goes to net-next on top of it and lifts the limit for sun8i:
https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com
