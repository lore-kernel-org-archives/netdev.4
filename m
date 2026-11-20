Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156912;
	b=TBOHztlC0KWgmNLYhD3wVk4U5IBluyX7RHvZm8umo0uRT1nPXYVssovzIIGtsKIOZj/I
	 dpQ2+xoEL0PeV74I8lQcZw5sfVYVypDPruBAIEDleXX0OEokx/72NWFauxG17NrjvWhdF
	 Do01E2lL3BZcikcPSGjuQ6i481M8atBEZgYOCxkEs6rfJyRQaAqTKhg8DEo0v/CH7DZJT
	 vz+3dznoTH/UjXRTRNWnphnIdKoeGTyL2lmwM1QUXDH2xbWouMKwkZxdJMeJNx8W5lLjm
	 E4O6g5tTHuXAyA3ESIE94/4wmj7nYzBFEjBqArAqSDfsvYePyP8yeeV/ztE9mYU2Kbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156912;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Mgw3XWwCWgtLNqGSpBZksw7IgPVhXJGfoOp08HyVngA=;
	b=XjEWjY0PdoKturETkobFXYPxirHL67qomUPLnFl9Oxc/l2tzeHvsGnbS5zvajEMcy1oy
	 H9sQcDHcGKk75fbVtDN0VZXAE1kKjvEaXjrr1JbZSt6czUVH+rsdNUVATu71LvbExgtlc
	 Ui8Cr05m6ZoUIeDocW3CJmwrAKWMvfn6WoCQQPMLhZQPB1KnalF3EFoUiQiuVWrPSq9DI
	 D9xIiECow8culwFO3TmBiDHSYH+iUwHOOnQPYopRI+TyyJILgpF4ve7BLD/D3ZTlDEMQs
	 UR3ModWICtaNxzagdkqHWixjWD9ckxDiaJhYXE5h1HqAqq0xoZvwXSIepwugCmYPm9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtBnsxK6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14660A2607;
	Fri, 20 Nov 2026 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtBnsxK6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BEC1F000C4;
	Fri, 20 Nov 2026 06:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156911;
	bh=Mgw3XWwCWgtLNqGSpBZksw7IgPVhXJGfoOp08HyVngA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XtBnsxK6HMOE3b3Xlla7URoLK6E2FCScr1ttMwqYI5yBAltelAiqZt1kEYLiikXsx
	 CghSyBu0Fao5GFjHd95qWNMigi2Z8C5c3h90jRwShqgWnuGEhbJyvxoexmldoIJCry
	 sKXS8Qg0Syp9aWsjKTYfv6ODQOJQKqzpQ538hbP0iNYr/qenoVe5lJsTQQHz/MUm5x
	 ez2tdYmxj/776MGBmduwZ5q1M6YkuJ0nQoCjJ1gXhYcZkUYvNCoGshl9OoeNKIz6t/
	 ETQdBA7ofQXO+uM4Y3yeuqD7zj+rnf2kiZubYFdxe/MQEfnmyFIQFlQlHqiW71VkW5
	 CV/lzfxnksuog==
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:41:50 +0000
Message-ID: <179515691045.3136.13671979747174463292@kernel.org>
In-Reply-To: <20261118183957.2031311-7-github@szelinsky.de>
References: <20261118183957.2031311-7-github@szelinsky.de>
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

- [High] The patch moves the PI-state check into
  pse_pi_update_pw_budget(), under pcdev->lock, but the predicate is…

--

net: pse-pd: check the PI state under the lock when setting a power limit

This patch moves the "PI is enabled and has a PD detected" check from
pse_ethtool_set_pw_limit() into pse_pi_update_pw_budget(), so it runs
under pcdev->lock. It also adds an updated flag, so the rollback after a
failed regulator_set_current_limit() only runs when the budget was
actually changed.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index b8cba6f86a7fd..342fb27e38319 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c

[ ... ]

>  	/* We don't want pw_allocated_mW value change in the middle of an
>  	 * power budget update
>  	 */
>  	mutex_lock(&pcdev->lock);
> +	/* Only a PI under software power control that is enabled and has a
> +	 * PD detected gets a budget. Check this here, as pse_isr() changes
> +	 * it under the same lock.
> +	 */
> +	if (!pse_pw_d_is_sw_pw_control(pcdev, pi->pw_d) ||
> +	    !pi->admin_state_enabled || !pi->isr_pd_detected)
> +		goto out;
> +

[Severity: High]

The check now runs under the lock. Is admin_state_enabled &&
isr_pd_detected enough to show that the PI is powered and has a budget?

pse_pi_is_admin_enable_pending() describes a state where both flags are
set but the PI is off in hardware and pw_allocated_mW is 0:

pse_pi_is_admin_enable_pending() {
	if (!pcdev->pi[id].admin_state_enabled ||
	    !pcdev->pi[id].isr_pd_detected)
		return false;

	ret = pse_pi_is_hw_enabled(pcdev, id);
	if (ret == 1)
		return false;

	return true;
}

It looks like this state can be reached without any race:

- On classification, pse_set_config_isr() sets isr_pd_detected = true.
  If the static allocation then fails, it turns -ERANGE into 0.
  pse_pi_enable() also sets admin_state_enabled = 1 on -ERANGE.

- pse_disable_pi_pol()->_pse_pi_disable() sheds a lower priority PI and
  frees its budget, but leaves both flags set.

- If ops->pi_enable() fails after the budget was allocated, the budget
  is freed but the flags stay set.

In that state, pse_ethtool_set_pw_limit()->pse_pi_update_pw_budget()
passes the new check. pw_diff = pw_limit - 0 is positive, so
regulator_request_power_budget() is called and pi->pw_allocated_mW =
pw_limit is recorded for a port that is not powered.

The voltage == 0 early return in pse_ethtool_set_pw_limit() doesn't
seem to stop this on tps23881, because tps23881_pi_get_voltage() reads
the controller input voltage.

Later, pse_ethtool_set_prio() calls pse_pw_d_retry_power_delivery(), as
does the disable or disconnect of another PI in the same domain. That
function picks exactly these admin enable pending PIs:

pse_pw_d_retry_power_delivery()
  _pse_pi_delivery_power_sw_pw_ctrl()
    pse_pi_allocate_pw_budget_static_prio()

pse_pi_allocate_pw_budget_static_prio() then requests pw_req again and
does:

	pi->pw_allocated_mW = pw_req;
	return 0;

It does not free the reservation made by set_pw_limit first. Doesn't
this leak the power budget on the supply until the controller is bound
again? That is the same leak the commit message describes.

Until that retry runs, shedding can't reclaim the reservation either:
pse_disable_pi_prio() skips PIs where pse_pi_is_hw_enabled() <= 0. As a
result, powered ports could be shed or refused power.

The later patches in the series, such as "use each PI's own supply
handle for the power budget", only change the supply handle in these
functions. The predicate and the overwrite still appear to be there at
the end of the series.

Would it work to check under the lock that the PI is actually powered
or budgeted, for example pse_pi_is_hw_enabled(pcdev, id) == 1 or
pw_allocated_mW != 0? Another option is for
pse_pi_allocate_pw_budget_static_prio() to free an existing
pw_allocated_mW before overwriting it.

>  	previous_pw_allocated = pi->pw_allocated_mW;
>  	pw_diff = pw_req - previous_pw_allocated;
>  	if (!pw_diff) {

[ ... ]

> @@ -1846,6 +1859,7 @@ static int pse_pi_update_pw_budget(struct pse_controller_dev *pcdev, int id,
>  		regulator_free_power_budget(pi->pw_d->supply, -pw_diff);
>  	}
>  	pi->pw_allocated_mW = pw_req;
> +	*updated = true;
>  	ret = previous_pw_allocated;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118183957.2031311-1-github%40szelinsky.de
