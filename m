Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550653;
	b=nzRqLVyo4mkd6umsN3JX/1+yNTFuHR7bCShh6kHeKFi0n05RYwC7xTXp9Yd25KiK40st
	 q4c6e8nCbMlFVoakfnBMeo+CGXf9iOogS742ATaTwlb6XigsLVgcBsnxYi2jsazNhHsks
	 04Et911BckUUC37hzEARRaeZrBqo3UD9mdL8lWSFHTnTTVykItUJKU/DzGEqthsEFaCKR
	 OaxnJ7u/KKkNWnUCqNThnvEPCvM4/iArCXiyCs6lULyAIcUnGtfUXVokAhOkn2l7EkMqI
	 MS3gqdvTvu3+LHQCKWdQwHpV0QLD2EcpMZnSIUGjMlPvglCMdpErgvsDIhTK/1mlDQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550653;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7ipmu1RjM6Rh1EJ3Z3e0jsQckbhS/99owpow7ZIHu9I=;
	b=HoWJR/Uz3rwqzdfhxOv1OLQgmbqVPj14Qi8xQcpqjstNZ80QQxgOGwC51kFpgvRipoLp
	 FmYBwarnP2J3K7P2b4GJJfmeFjKFzbLwcsKLouSazmjNwmPfqz/RyVGI0M4fNO10jf+/9
	 vWfbSJ/p/RtvLYi0MWj/WofzrlOZ4CiVYSL6xLQemUAD32bxad9qjHvMVjPcv8hBM1hLY
	 MggniMwLps9wex5mLoFheFs4ySD28LaAsHfmDNgfP0kZATGJ67zrqzS15PYphdKgfRNZ3
	 ii9UCLDzVlR8iDJHIKZNl8kB0kAfZRxx+QVU0amvRtA6RrSHA/7I8v727loHJnXj65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EClf+Go4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69A606A336;
	Tue, 24 Nov 2026 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EClf+Go4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D361F000D4;
	Tue, 24 Nov 2026 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550652;
	bh=7ipmu1RjM6Rh1EJ3Z3e0jsQckbhS/99owpow7ZIHu9I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EClf+Go4PVg7a8mggnTHsDhnMlCNx1v/2yrevK6okbCl9HDr6P09yg7a7ShNqYVIK
	 oo3sGprNkQANpmIcmONSiZUTDQmWmhQdCdMkJtyZEj6QvdmCxl1PXgtZ52FHb5W7AX
	 iOvissy8R4TuqZdAntpszbkhEEcNJFvrSpfLzZ/eewuxmie53/sxnh/8RcTh/svyF7
	 FQHQzCzDjuWYRPZ9wDQv5IPShaxk4BvMf5q1vSx+M+/KOTPnRQsfSuphZ9lGxI3i60
	 gOWHrSYrcMr3z26K9JdRy5qgyFObpophQlvhrsKvIFHkFwnDILlIdOYYWoglgY5ZVl
	 QktbBcP5Q5UwQ==
Subject: Re: [PATCH net-next v5 3/4] net: mdio: mdio-bcm-unimac: Poll for
 completion at 1us granularity
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, nb@tipi-net.de,
 carlos.soto@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Tue, 24 Nov 2026 20:04:11 +0000
Message-ID: <179555065159.3135.7257809284035507896@kernel.org>
In-Reply-To: <20261120194318.3952487-4-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-4-florian.fainelli@broadcom.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern: the commit message and the new comment in
  unimac_mdio_poll() (drivers/net/mdio/mdio-bcm-unimac.c) describe…

--

net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity

This commit drops the fixed 30us udelay() and the 2ms sleeping poll in
unimac_mdio_poll(). It now busy-polls MDIO_START_BUSY every microsecond
with read_poll_timeout_atomic(), and the timeout goes from 100ms down
to 1ms. The goal is to cut per-access latency before Clause 45 support
is added.

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index 5f79f31220f26..f8e5c1811d96b 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -79,14 +86,15 @@ static int unimac_mdio_poll(void *wait_func_data)
>  	struct unimac_mdio_priv *priv = wait_func_data;
>  	u32 val;
>  
> -	/*
> -	 * C22 transactions should take ~25 usec, will need to adjust
> -	 * if C45 support is added.
> +	/* A frame should take ~25 usec. A C22 transaction is a single frame,
> +	 * a C45 transaction is an address frame followed by a data frame and
> +	 * each of them is waited for separately.
>  	 */

[Severity: Low]
This isn't a bug, but the new comment in unimac_mdio_poll() describes C45
address and data frames that are waited for separately. At this commit
there is no C45 path yet. unimac_mdio_probe() only sets bus->read and
bus->write, and only MDIO_RD_C22/MDIO_WR_C22 are defined.

The next patch in the series, "net: mdio: mdio-bcm-unimac: Add Clause 45
support", adds unimac_mdio_addr_c45() and unimac_mdio_do_read()/do_write().
Each of these calls unimac_mdio_wait(), so the comment is accurate once
the series is applied. Would it be clearer to add this comment in that
patch, or to word it so it makes sense for this commit on its own?

The 100ms to 1ms timeout reduction for existing C22 users is stated in
the commit message. The numbers hold up: the largest divider allowed by
MDIO_CLK_DIV_MASK is 128, which gives about 1.95MHz from a 250MHz
reference clock and about 32.8us per 64 bit frame. That is well under
MDIO_POLL_TIMEOUT_US.

> -	udelay(30);
> -
> -	return read_poll_timeout(unimac_mdio_readl, val, !(val & MDIO_START_BUSY),
> -				 2000, 100000, false, priv, MDIO_CMD);
> +	return read_poll_timeout_atomic(unimac_mdio_readl, val,
> +					!(val & MDIO_START_BUSY),
> +					MDIO_POLL_DELAY_US,
> +					MDIO_POLL_TIMEOUT_US, false, priv,
> +					MDIO_CMD);
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120194318.3952487-1-florian.fainelli%40broadcom.com
