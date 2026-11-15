Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794764459;
	b=oLL5GqfLUjDfB/yDRsnNkitnHlRg3TW7MO+pKG0Xzn5GJkmH0+6iamrxjS4j6K0US5ZX
	 r7eCOoUzomCmV+/3vy1AHXprMskRgHY2oRX66mDL55WBX36ibdweN+wMJe+mtEnVkALrx
	 XiHZlD/bdyBb4hKA8+LHcy616vyeMfZIVg8ZOaz7+gGXHxX0bBDAGlFx2ka7cv6yVKF+p
	 KXCW3aNMo1l3jQyPnrdb2lSuu+rbTNNMak7RODgFhCswDAF5vJId7q+/pe0z89Y+QCDG+
	 LFrdwonD32GBwZnLKT4RBqBGyJm8GCy9HARrPXz76aBOoryY5+yQjlIK0JJWnA5x0sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
	b=P+Ap9C9qSqRYFIL4KAdrrnnPdj6bSCQfE3ZXQd59+IPYh6RWFwDUpcB8h8u8rPPCNJlJ
	 FA+LaGkGm6R9Rf16ePamRwA7Nyaj4TvfzbtYhHCjEAJmgQCF/Gua4C0u0sPLIONqtvanH
	 hHGHPPlt/3L17x06jLtx2MJ6Pc/JY3vZcLncxFV/+rPdTutDocicAemRblFj+e429nM/6
	 sgDmEF0PJKWqg7f+1poiF4IdGEgHxDH6hBz3APaVp9d80UXXPzFwZQE0irZ5FgDUV8BVN
	 eo8k5cEzAU/11tHTb8kw2+CP0QWtjIwl/4tteHL/emvGa563A0L6QSv++TbiXNOu9eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7237606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7237606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b3402105b9so19602087b3.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764458; cv=none;
        d=google.com; s=arc-20260327;
        b=HvjLaPS6pYJadQo5kWDGHdDsobOW1WPGOIrcAYxwxtcceWv6NA5qMlVPgZ9vjqNcoY
         5sm7eFKj6B5xI7VcZsDagmrbuW4O5zC1tYF1YImhmiN0x1+LJ5+zdzpPhkpj95iV5ffr
         yzdZvv4hLd/S21BEWWbHChUEYj8cUmeeKB8D0Tgs+4MunR4fWBLYyxF1e/ZOL8hohMxR
         jPNkKydI6tg22aXe4uqDLiD/Cuan/y8NpzSZMpJt7jQhfK+ZrDPvZyq/y1e5Fw/XFsT6
         9hCTtE/B9NWpslbq42kZgzMbp7+i2L3oldcge/djViBGFxr6jSEw0mENUbWXYEGMWQbd
         H1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        fh=qUcjo55quoM3Jk/qpI7XSMGTfbNu4jkukP3Dz5Hfxog=;
        b=ha+m4FOCP4yzGKLvOsrzeC+UERnxSXW+STtamSZjFZsJ0jE7wvRF6nGv3FuigxgeWP
         pQpxo/gcL7y7DzycdeQIc7YlItqXPCzsSbUM/eqQuYiN8y/MJhX2NQOBeyKRhDIz09OV
         hKTXos405u4R3HzMkvyk2QWTPm7fmYXNCo9pI4WoLfhPobmvZMsyXFjHk2lAKz8cjsTl
         XySQNZPz7Aag7fkrg67jm1+6F2+2K+iZP7oe7z3o0HcPYJc2vN2n4Xs8WVtgMoh3UGPl
         DWJwa7C2BUTEMOShZeACGd4XFDGhigyUGcQtZ0NJR8mc6xnaXLDaKhKRtpnX3g1uDAy6
         IcXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794764458; x=1795369258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=Jje7TXn5xdDDB+w6rdao9ux0C1IgQ67VAgpVxPFtfOdvlz7lkhl7mP2+tFy0/NbOJU
         Fjc/89LRHU9zMs1/ZAr5Y43zWNnOy3GmRjvXAk4xYDkiKLg3vXg4231YplRheFAdw+hY
         QYFIbQGhfEnoiwW5aE0hz4b3Blj2PUkqt2LZmKn3n+YLKc+X+2JtdTxdAb2vS/n9ONDK
         UQWqgEzMDf3ofcO0sJob905H723CZGmcpuXmrqmA42izlGUuMPWpBOx0Miuax1k0R5vG
         ORTTaUHfDYT3tC8bHYVpXG0y0DQDfEwU3uXCGUHJe0BQsG2g9FHEu9jrpt613ujyvYug
         l5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764458; x=1795369258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=EqOipQwB4hNaKXdJrKxNmi3t9/Ris47OnwCvfm+tz6jwW/C90LoVnsPG58/AFDdNrs
         ToUQzfXVW/P4xt1IgZtFcH1QMDNTAcvzB/2kzCQsA+OlCkA+3fOsjl++sbKDdLvnyzq+
         CpXLoJxy7Nt0SKaejDP6rcOU8/kqsnBvPATaNPULs8ydkYFGduq16Nj5lVwlHneUAUYa
         wCVdtnup3ciWsa5b7B5For2n8eWsOQbcVcE4WvYRX8YauXVbnS1sAvrm0eZCYuvIk5tl
         Im7d9xXgs6Uj4cnrET3SbahTAWVpS2ARBKy2HHajJgEtkCMOYuhqVMmh97OlwblBGYhk
         D0mw==
X-Forwarded-Encrypted: i=1; AL+hErHIds1us1dVMcnSqfVV4NXXC23NVikQm8Zl+eggzSvpvnSEoEvOZRQkPqJpvKc1C1h7sRP1jL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4eBFnGgblMnt725tfol/QL2nycYfO5WWzgKOZj5u/mQmhtAGf
	CqeEWFek14e8B7LIB2qTnbEaNczpVsVIokRmXVjx/fAQYytVfk9DBDVY8sSv7WINR06YyXDVcKS
	CJqgbStFnVTqpeHVQtxnab/035AbI1Ms=
X-Gm-Gg: AYBFou3sA4hie+N6ResevNRmTRx7Lgv9ilhUb3EirmaULZd/dtJ3YwZn83BYNKrUj1U
	FBCDN2ayKLwPzsdXkC0AiWrb5LD/+S3NwQ4BkAuJMsopRJ8DaICE382pjsDv995dYRaCyQ42bJk
	DKrYWOIzczD21vIzUW0EyH24qdCNLm58ZhLm0n9UZL6x7xp4RtIdTqI5ugR9RrIeX8yoz73Gcc2
	y1A+QJYjar50Az37PX18Z2KWhVCWyYZQlH/obVrIY1/GmMzab1qIr/lf6CpFOQNt24FKugxpyFU
	hYbb9ZxrPabq0Bg7FeOn5w3pujXe6tjys67suOtrjvKuFqpfCNrtpD/JelMj3G6UdTrZA4NxMej
	K2uU3PgQv4/jHuYtr3c1nD3bfpBgFnxwJodIxoKyhCRgbZV9aEx8BiOZO9n/nX17/EsE+dw==
X-Received: by 2002:a05:690c:d87:b0:8b3:4911:2dbd with SMTP id
 00721157ae682-8b4aa2f3717mr45349387b3.54.1794764457708; Sun, 15 Nov 2026
 09:40:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-2-tanure@linux.com>
In-Reply-To: <20261113121852.334604-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:40:46 +0100
X-Gm-Features: AclHuK_keCn1frC4iKcAHTa13eQ5wSmPdFzN8zUCJ22f34lvfbzGE6mvQz0vUGQ
Message-ID: <CAFBinCBc6=XPXCuxNLug2mRrvrA0EebNgxgxeNOKgVB7d58o1g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The compatible property only checks that the first entry is an Amlogic
> name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
> the list. It cannot express which fallbacks each SoC takes, so a SoC
> built on a different Synopsys core cannot be added without loosening
> the check for every other one.
>
> List the combinations the device trees use: Meson6 falls back to
> "snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
> reports a 3.70a core too, so it joins that list; its dtsi gets the
> missing entry in a separate patch. The example used a two-entry form no
> device tree has, so give it the Meson GXBB combination.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
