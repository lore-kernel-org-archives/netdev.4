Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847074;
	b=sfrtrn9acQE/CFEBq7paBLWnGA6fDwnXYXdrrrtM5/yyxOirnpBO6A+lrjNundcTilZS
	 X2FwPXeZQXtGtzfRN48tyFndMIQoOmrfl/SP1IgBl4UkHhz2o+liJOMuBrFSuAi4J8R29
	 JqpmrL1biJkcqM+c0Kct0n6pFcZuykxg+hgGqKozgJ1DYDWz7nKzusRJkvwvQqyeDBixA
	 fGAFFtM474mc7EzKLbqC1uEcObo3Nnxde678R0hcmovj1eMzEfblSokHBRvxZwwYOlXtk
	 J6DO4kG3T8Kkzl6r8wrbY6pfqITBZ6G5Lg1bAoY8TmoDDhLvGJnaQHFgd7rhgQUrGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
	b=R/grfdWfEtGxpog+Er0iwQM4TvigVHLw9gIKr7vnPtlmlTTJNpfv9Q8EMVkgP7yUIeck
	 AOcP6kiUDKAgvjRq/LhBCc3eTFwgsnET5qRwecSRLXPCcShORZsEngFWYq5U5ic+i8u1p
	 0I27JL02e2koOca+Ks3NtqqCHqBnq9IFEaw0sm0htfiU1CMTM0CL+YTIVO3RJkJK2h8G8
	 LnwulGzwjGfCqsd0X+fA6E9/bpsfOXMOb5YlzHOfhDzIk+KdiR747SEZ5cqqAArwGR+zY
	 cltJbBnw2QDjAmKyvWQtWKwrYYs/B2m0Y0ceK7cboS9PDi72iuxtnSVtBh2UEROcR3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93FD606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93FD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1758453f8f.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=eNqMq4pdG7+RtREnW0nLtbAhfw8loOwD8ch/NLM+mhlO9edO9Xpuh8aJi6/ITtGecp
         SN5fptk7D0/UooZZhSLhlEfkd024Hbrq8zj1AoWJH6DXOsRvSXZ7CpdvuM/cLqVATFcx
         2BKKTLjWXhEvZPkxdUO3iReMBvWvi/3LRR+U5SrooY0v1uRabJ+zptC8o7Gt02M3Egis
         TSW9HwosoAUxvxas8Oqp6Wg+kevVJHOZVQqrkA6N7+U/g6/Js/3IkmN1DGa1UQruVY4H
         cpSmDdTkTw+Qf7cBPBY6VP4Ej5rn9x09uZyaCeQql8eSz30sM/zAD9iliCtW1VhTQCl4
         lghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=nTldzV0DVhHzN5BtmeBghcUaGSiWuVXTYhPufk8YzAov5gvyd0WC2nLS2F1D1xzFDV
         SXidTV2xVsVSbLCL3bPs261OvH2WYSmMH5PSD0m3EM0hPCI4MHz0RBetzFx+NUCtv2UO
         4lUNOiNjCXdDZR9UqGw+ZrKrmNGsxH/lqnYrX/3IdMlPKe3ZvbmxqmVDDsOtO7fLgNlE
         7AseQ/0y5cZfmNaRXsHh9Z0StrIW3g7zOrBx8MssAc3l+akkU2dIPe5VIZfIN0q4SSTZ
         r7QbyeigB8zHDqhkH4ItmtyognTKb7oJ6qmqhXEzq6dlJaUyhF9jptXSrGh5502ROT49
         g2Ow==
X-Forwarded-Encrypted: i=1; AL+hErEmTKhRynMU7SaxW4FevWTi/pF80aBylkhEdaFNL031nYgDjcp1/7o1i2lnubc1xRrc7EhoABQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CZjxsslpCD5YspEa5DANtz+/UDwosUcEA0Jr1ASDS7Rnmv7h9
	a2eoSFQ0PfWuEvzWQuiUSbU+eYrXplwoeYxaEsAFojdEVGt3g0Q7EUt7
X-Gm-Gg: AZFdTZf5MT2WeQqBHA1SruAMvpD5dNjnLAImEJGyAJYECEd6vilGLwO8arLuAY+jKk4
	FGBqi90Z1+cjid13I+0vlCzH3OlHOMnICoHWuVBCi5pbdjJJSgVMlAJhyaWWus/CngOU4SRemC2
	/hhmhGzHjWBGJOY9+mJyJi0PnQPU2neldUfqvUqJLn/70rcJrySn4v5K5XSrNrX/0xTuA5bQtaI
	y6JyhWU0CROHA39/e89lgA/BkMxkznx7KW37IIbJ+JRzDTuSqrWBOFlAHGBzxLhiOhmrFD/r0Ft
	4p0ZN9szFIG+InATLCfIAouGVtOrF9FxgbtJY8vFzUqw2sjspi/rnd0rrSVpmiFAHFyDWo+S5f6
	zwHi1tVp4ZaH3s3OMl4fr3RaBYPAXhfjMUlmyu3DlXKQUjBWqCPtCpyenFrYQUWf0ZURaQCOEdE
	l9FqN4TWllveyEIEXmrSRSkCsMdWo8BtxSG+siPSG3458vlUS6LA9BQ1IItmBTubmFmqKRt9ZrR
	HQUfNm6Hoql6KfYS0cyf3+DOxL24NLQ2d+UNCGf2HGHRxAsY4IRVAZ3nRxCaN6K22nSqJ3aA1yF
	spUzeKd3CCd7/gIAiqErJ5EcUFuVNORUGVXnlPCDeWwnWgGG3jdJdT9E8f0/stqQ6Jq1LZhSkx6
	3FF+C2jHnJqEiMM1p
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel
