Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598834;
	b=i4esH4V16aoGlquuiUVpGj1mR/kJydQkuo0f2diT5GnEfTCtXUcI/216BU/gQXJ1Z9wU
	 cXaX06ZJGhYJGI6JGZh3gJL0FhNfBk6g2YDw3YdVsW2/of5XaoohV9sNZPzN9WH0ne+df
	 8r8WfqbS5bM8m1VX6wv0cf+rixP4h3v9YxGAqSDIyh9mZ5h9Dky4jD/7GKC/ak9rOgo2a
	 e2oMVJQzf8h1B3/DNWbm3iL454mV7n+4k1tN3pRIz9sJZiomdLWn1b3ny0mTA64hfeXkR
	 p/lYe3wun/YjCpR+DnhfKyIBPovxM3b/r+JnqoI/oXMj9vovXsd2sbFqqdW1CKUgL0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598834;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=P8tTFRZKMoV9ILmjWhm/Qj+eqvtd5b4s7jrXn6M6sCA=;
	b=Jt0KzhXtKj6NY1G8AK/kuJwSWva1Q6+EZ6Xa7A2vkoC1VIsBJRxxUp/Ikg1l1bvXMQU5
	 J67iKX5zOCyht/pQRuorUk7ZmqftOR2EbA2qxCTZnhQEq3MiSE0xcyuQ5SbSBzxoAygaD
	 0s0TFPS2dJcN19paiXdcaVXlN7cDhkAyjP6qOmk0O8Mltcn5Ufdl8qqZEt+Ma2NokO2ZQ
	 QclF0Al9UEeRJpyEvPJfeNpz7LAu6Cri9wodVJIkwl1bqUyLnslLTWtsgpopaHCjKYl7V
	 siwuyL2hLg9T99ouW4eyP0DZNV5OP03HrFxYcv1mHkM0OV2P7Ur6ypBl/+g/+Qb2FGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csCgOiTE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B78606A321;
	Wed, 25 Nov 2026 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csCgOiTE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157361F000C0;
	Wed, 25 Nov 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598833;
	bh=P8tTFRZKMoV9ILmjWhm/Qj+eqvtd5b4s7jrXn6M6sCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=csCgOiTEhmqVdAe5KLvf/KId4CUz5vLa16QtG35bS9sZm1GXuijGnS/S3MO+RPaga
	 fxNDCfQFBuxz11T1yQvd/M/+rjHNje5veEhF91UvmTAN+OXyL3lGglzKTrEE11TDps
	 vUP9c4glv6izxOtNJth8c51S6+fW2srjzeSkLLw3GoJtq9UQtODO3dbnXqMcFF+bpR
	 SQBx18Py/YdoKlJtVGC23SmLwKCbkP99fdXgXVy6jCqxESjHTV1RPwRSjkhlu0BqLU
	 wbmXubAMzcyzq+hivj9Iy42i8hmN0J4cnrDUVlH7j0MoQGjf6vxkuqcUeC2w0hx8OJ
	 CPaCPmi8NbQtg==
Subject: Re: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller
 last in setup
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 09:27:12 +0000
Message-ID: <179559883260.3135.17892460412824046133@kernel.org>
In-Reply-To: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
References: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: dsa: mt7530: mt7530_setup_gpio() still runs before
  fallible setup steps

--

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2585,6 +2585,11 @@ mt7530_setup(struct dsa_switch *ds)
>  		}
>  	}
>  
> +	/* Flush the FDB table */
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> +	if (ret < 0)
> +		return ret;
> +
>  #ifdef CONFIG_GPIOLIB
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);

[Severity: Medium]
The commit message says this makes the GPIO controller visible only
once every fallible step of setup has succeeded. However, mt7530_setup()
is only the priv->info->sw_setup() callback. After it returns 0,
mt753x_setup() still calls mt7530_setup_irq() and mt7530_setup_mdio().
Both of those can fail, and mt7530_setup_irq() can also return
-EPROBE_DEFER.

If either of them fails, the gpio_chip that mt7530_setup_gpio()
registered with devm_gpiochip_add_data() on priv->dev stays published.
Once the next patch disables core_pwr and io_pwr on the failure path,
consumers would be left poking MT7530_LED_GPIO_* registers on an
unpowered switch. That is the situation this patch says it prevents.

The same applies to teardown. The chip is tied to devres on priv->dev,
not to the DSA setup/teardown cycle. Consider a multi-switch tree where
a sibling switch fails or defers. mt753x_teardown() then disables the
regulators without unbinding priv->dev, so the chip remains registered.
The next dsa_tree_setup() attempt would run mt7530_setup_gpio() again
and add a second controller.

Should the GPIO registration move to the end of mt753x_setup(), after
mt7530_setup_mdio(), with an explicit gpiochip_remove() in the error
path and in mt753x_teardown()? Or would you rather register it from
probe instead? Either way, the commit message should not claim it is
the last fallible step as things stand.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179550875789.4156.361477684651496992%40mail.zgclab.edu.cn
