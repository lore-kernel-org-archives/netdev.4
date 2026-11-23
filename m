Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433761;
	b=YdqvFN0fSEs9Jyn8ntQOEefbo8uyJewkrinOx4MgEkUg/5COUu6rFxw8FYKT/QZ5kyGk
	 1u+LpQZigarviCTyXFaw+Gyz8oYWvvacKrFALNGSj7XDJ6vkceTg/QqHKudjVdNB8lJu7
	 /4rZADDTS5oUgAWjAwdvkWGtauO0ps1IINBqsJBbCSOgvd6Q/4fATwivbXmFahXivjTfm
	 WON+gmes5PgwO5MV0AvmMgXy7iXBpHXjlYWyxolZewpR6pONa5RajeSiws3dI6W4kUDk9
	 386pxbReL0+yRyxZ6vuhzubRqmQNZOBITk87m/LKQl53inJNqC3gooEWP85YXPwyRkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433761;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PeGmCYBVQQI7hkfHmQc/r9yNXZgIQ3sY2oKMCBPb1+c=;
	b=OMsqDFSEVVjjf/iV7/jMnv+lWqsPZl32IwhnhHrtsDTcT/4Xq3BHvcMqUbyG/mY+IZPB
	 PRB0C8DNZs9uWOtNTWBwjkEtGrMNSNW7bfmlW7djJT+NICvMu1oqo8jVyG3HghCzIEYv/
	 UEig8yh9znMoDBspq80lKJSyYw/wcmXpof+EQ5UvowWG/PTDsXiB8mt8Oy4buEmj4LAfo
	 dhtST+aZmdIJAoII5nMjRxAnuehRdmXEAo9pozDk0JuKMoQ5F1wbMg/vsIkhDHYTErT5r
	 7Fo7T4Oth7ltEJa+/Gmq1eo+YWfSuUqsvBsFDK/BYfXf2jk3iFP4v/wf/PIuaKWpYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jV2dXUSf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B7606A31E;
	Mon, 23 Nov 2026 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jV2dXUSf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C671F000D2;
	Mon, 23 Nov 2026 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433760;
	bh=PeGmCYBVQQI7hkfHmQc/r9yNXZgIQ3sY2oKMCBPb1+c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jV2dXUSf2JMPV59/83jfRfac5Iqp20IvAYReViUv1gFv5UhXhnyIZXCL+o8MkKLfi
	 O/UA/btjlOgbq0t1PM6ONFuaHf7MaUb8liFbwUDHklTzDkHBt56UEZFhVCBt/6mkCT
	 GjV5IrbhP3xZ96i28XkBNdR8b+4aNQp/5D+n2A6YMRxGwuTIIEENNjzBvoyDykPhN+
	 bDlxgaJceMNdVOoXuv0E4ws2jNC6qLfmL5oVNUj2WNpi+6S4WQQfKk/4u/ReI7P5lk
	 mCIdJGKmN8h8CnacheR0n6ou0u43K/GI3KllcUtlmyqKgEAkkiTQ/V1FgN1FcsaAkq
	 HrcRsXfsLWQ6A==
Subject: Re: [PATCH net] net: pse-pd: tps23881: Fix reported power class
From: netdev-bot+sashiko@kernel.org
To: kory.maincent@bootlin.com
Cc: pabeni@redhat.com, o.rempel@pengutronix.de, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org
Date: Mon, 23 Nov 2026 11:35:59 +0000
Message-ID: <179543375923.3135.13985748487135407652@kernel.org>
In-Reply-To: <20261119112511.239208-1-kory.maincent@bootlin.com>
References: <20261119112511.239208-1-kory.maincent@bootlin.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new lookup table in tps23881_pi_get_pw_class()
  (drivers/net/pse-pd/tps23881.c) maps four raw class codes to -ERANGE:…

--

net: pse-pd: tps23881: Fix reported power class

This commit adds a lookup table to tps23881_pi_get_pw_class() that
translates the raw classification register value into the IEEE 802.3
class number. Before this, the raw value was reported directly.

> diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
> index 244ce596d845c..58ea7e0ffa996 100644
> --- a/drivers/net/pse-pd/tps23881.c
> +++ b/drivers/net/pse-pd/tps23881.c
> @@ -402,6 +402,25 @@ tps23881_pi_get_chan_current(struct tps23881_priv *priv, u8 chan)
>  	return (int)tmp_64;
>  }
>  
> +static int tps23881_class_table[] = {
> +	-ERANGE,
> +	1,
> +	2,
> +	3,
> +	4,
> +	0,
> +	0,
> +	-ERANGE,
> +	5,
> +	6,
> +	7,
> +	8,
> +	4,
> +	5,
> +	-ERANGE,
> +	-ERANGE,
> +};
> +

[ ... ]

> @@ -416,7 +435,8 @@ static int tps23881_pi_get_pw_class(struct pse_controller_dev *pcdev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return tps23881_calc_val(ret, chan, 4, 0x0f);
> +	ret = tps23881_calc_val(ret, chan, 4, 0x0f);
> +	return tps23881_class_table[ret];

[Severity: High]
Will this make the whole PSE status query fail on a port with no
classified PD?

The table maps four raw codes to -ERANGE: 0x0 (unknown / not
classified), 0x7 (overcurrent during classification), 0xE (reserved)
and 0xF (class mismatch). Code 0x0 is the register's reset value. It is
what an empty, disabled or still-detecting port normally reads.

pse_ethtool_get_status() in drivers/net/pse-pd/pse_core.c treats any
negative return as fatal:

	if (ops->pi_get_pw_class) {
		ret = ops->pi_get_pw_class(pcdev, psec->id);
		if (ret < 0)
			goto out;

The error then goes back to userspace through this path:

  pse_prepare_data()
    -> pse_get_pse_attributes()
      -> pse_ethtool_get_status()
        -> tps23881_pi_get_pw_class()  /* returns -ERANGE */

The admin state and power status, which were already read, are thrown
away. Actual power, power limit and limit ranges are never read.

Before this patch, raw 0 set c33_pw_class to 0. pse_fill_reply() in
net/ethtool/pse-pd.c then just left the attribute out:

	if (st->c33_pw_class > 0 &&
	    nla_put_u32(skb, ETHTOOL_A_C33_PSE_PW_CLASS,
			st->c33_pw_class))

For the same op, pd692x0_pi_get_pw_class() returns 0 for unknown or
out-of-range classes:

	class = buf.data[3] >> 4;
	if (class <= 8)
		return class;

	return 0;

Could these four entries be 0 instead of -ERANGE, so that ethtool
--show-pse still works on unclassified ports and on ports in the fault
states (0x7, 0xF)?

The commit message also doesn't say that some register values now cause
the status query to fail.

>  }
>  
>  static int

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119112511.239208-1-kory.maincent%40bootlin.com
