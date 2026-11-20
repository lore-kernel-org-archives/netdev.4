Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156913;
	b=lZeeInR179VCVr74tDUz9FtAQ7SX0pDaz9+S8yfk1VAwFIGMa6/lJDYb8kRwfVnujjAD
	 fI9gRQnKVW0dotxKFE4qIKwvTq54H6CojI90IHIBypi4cl5SLFDiOqBkfkPtVpKJJaM2O
	 k5P68cMox3P6y3AFznpDf4sNdURML14sUbPu+vgT1aWAFhvUoAEevpphnLtzr+W6LgEyJ
	 RAH5KWclju1SQ68piJ7G1el4BIQUQjsdUlG10g6yGTgB5bNuDZvd3fv5DL/FNGtC6cRLr
	 Y9CMQGHacFucrmJHA+bEFuPjYYyZB7eOy/6moC3HONXyzKK2aGIBBrLzgsefnINq5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156913;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a+t97QNrGhf5xZsDzKEqoB1C08kmYlBXwNUHFEImoS0=;
	b=VV3Dm3QG8Z8HURovIA+LdfPJ0DhrwoIJ+DQzQPCty2nbyaK0e9YyTN5ww46/Dm7v4GM+
	 9W7dbXRXw9yQpfEWbAR3+xfZC7hRpzEVftHa+QQ1s+c8FtqCkaxZIM9MZEsJinj8wnNaT
	 cPrTrtPE1QFoB4Trx/5yivZpWZX66/sgRiUtTTEoh09tf4pIH9ZaMZ6oilD8z1izgPPyg
	 k3YgBK+gxuVeZPJ58zWyHq+f+Wx3hs3loQeKEftDlV9OKF5wa5lQI8gM6ji0wL4CJlYOr
	 4qwkSywOdMaM3B1NPI1hqhOWFmaPhmcNbl1OnE3y+QuyDPg4zHg6DKkHaF1PU8y4PtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NNpG/vLx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627660A261D;
	Fri, 20 Nov 2026 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NNpG/vLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451981F000C4;
	Fri, 20 Nov 2026 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156913;
	bh=a+t97QNrGhf5xZsDzKEqoB1C08kmYlBXwNUHFEImoS0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NNpG/vLxkzYbd6GcEqz1tkyGUnXlCCfJ1X6RzFx3A5wVXiCrEaSk2y3aS/rN0U/ZA
	 XTQyOpJgNV9vGrQzHE18R7xFI9novgzoCmsJ2m1gaRCiOFBYI6yxNvhz/IIn1vp03Q
	 en8MusDuVFadVS5TpHsjfZacT4SqskCY3MqNTfI94dW5awrEoXn4AMRX8F2nvuDlqM
	 bZdkAJac2pJnxGv2s4mh0f6cBdTnK8Vvdi08mS+SxObyOwt432/obfQ+N5zr2pvH62
	 32ZJkreBZNdsLRv94A1ZgPq3++O6RRBKz3/9Apm9pydUW9dUWiYihw/0tewy4Dh+bt
	 1kT9+nq/8zXmA==
Subject: Re: [PATCH net v5 07/14] net: pse-pd: do not tie a shared power
 domain to its creator's devres
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:41:51 +0000
Message-ID: <179515691186.3136.7466953769773810210@kernel.org>
In-Reply-To: <20261118183957.2031311-8-github@szelinsky.de>
References: <20261118183957.2031311-8-github@szelinsky.de>
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

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The shared domain can now outlive its creator, but its supply
  handle still cannot.

Pre-existing issues:
- [Medium] pse_flush_pw_ds() clears pcdev->pi[i].pw_d via
  pse_pi_take_pw_d() and drops the domain reference without first…
- [Low] pse_register_pw_ds() publishes pcdev->pi[i].pw_d at line 997
  (shared-domain branch) and line 1026 (new-domain branch) holding only…

--

net: pse-pd: do not tie a shared power domain to its creator's devres

This patch allocates PSE power domains with kzalloc() instead of devm
memory of the creating controller, and frees them on the last kref_put().
It also unwinds the domains on a partial pse_register_pw_ds() failure
while pse_pw_d_mutex is held. Before dropping the reference it clears
pi[].pw_d under pcdev->lock.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 342fb27e38319..8041ad3e330b9 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -875,17 +875,41 @@ devm_pse_pi_regulator_register(struct pse_controller_dev *pcdev,

[ ... ]

> +/* Clear pi[id].pw_d before the domain's reference is dropped. The PI
> + * regulator ops and pse_isr() hold pcdev->lock while they use it.
> + */
> +static struct pse_power_domain *
> +pse_pi_take_pw_d(struct pse_controller_dev *pcdev, int id)
> +{
> +	struct pse_power_domain *pw_d;
> +
> +	mutex_lock(&pcdev->lock);
> +	pw_d = pcdev->pi[id].pw_d;
> +	pcdev->pi[id].pw_d = NULL;
                ^^^^

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch, but
does pse_flush_pw_ds() leak the PI's reserved power budget on the shared
supply?

After pse_pi_take_pw_d() sets pi[id].pw_d to NULL,
pse_pi_deallocate_pw_budget() does nothing:

static void pse_pi_deallocate_pw_budget(struct pse_pi *pi)
{
	if (!pi->pw_d || !pi->pw_allocated_mW)
		return;
    ...
}

pse_pi_update_pw_budget() also bails out, because
pse_pw_d_is_sw_pw_control(pcdev, NULL) is false.

pse_controller_unregister() does this:

	pse_flush_pw_ds(pcdev);
	pse_release_pis(pcdev);

Nothing on that path returns pi->pw_allocated_mW with
regulator_free_power_budget(). regulator_put() and regulator_unregister()
do not release it either.

Say a controller under software power control unbinds while a PD is
powered. Does the vpwr supply's pw_requested_mW then stay charged? A
sibling controller on the same supply would see less available budget,
and each unbind/rebind would make the drift worse.

The baseline pse_controller_unregister() never released per-PI budgets
either, and the same is true at the end of this series.

> +	mutex_unlock(&pcdev->lock);
> +
> +	return pw_d;
> +}

[ ... ]

> @@ -981,6 +1012,7 @@ static int pse_register_pw_ds(struct pse_controller_dev *pcdev)
>  		supply = regulator_get(&rdev->dev, rdev->supply_name);
                         ^^^^

[Severity: High]
The new kernel-doc for pse_alloc_pw_d() says the domain "must not be tied
to the lifetime of the controller that happened to create it". Does that
hold for pw_d->supply?

The supply handle is taken with the creating controller's own PI
regulator device as the consumer. That rdev comes from
devm_regulator_register() on pcdev->dev, so it is freed when that
controller unbinds.

Take controller A, which creates domain D on supply S, and controller B,
which joins D through kref_get(). When A unbinds, pse_flush_pw_ds() drops
only A's references, so D and D->supply stay alive. Devres still
unregisters and frees A's rdev. D->supply then stays on S's consumer_list
with a stale ->dev.

Can a read of /sys/kernel/debug/regulator/regulator_summary then hit a
use-after-free in regulator_summary_show_subtree()? That function reads
consumer->dev->class and dev_name(consumer->dev).

When B later drops the last reference, this chain passes the same stale
dev to device_link_remove():

pse_pw_d_release_locked()->regulator_put()->destroy_regulator()

The dangling consumer also existed before this patch, back when the whole
domain was freed. The later commit in this series, "net: pse-pd: use
each PI's own supply handle for the power budget", removes pw_d->supply
and uses pi->rdev->supply instead. Its commit message shows this same
KASAN report in regulator_summary_show_subtree().

Could the kernel-doc here be adjusted, or could the commit note that it
depends on that later change for the supply handle?

>  		if (IS_ERR(supply)) {
>  			xa_erase(&pse_pw_d_map, pw_d->id);
> +			kfree(pw_d);
>  			ret = PTR_ERR(supply);
>  			goto out;
>  		}

[ ... ]

> @@ -995,6 +1027,13 @@ static int pse_register_pw_ds(struct pse_controller_dev *pcdev)
>  	}
>  

[Severity: Low]
This isn't a bug introduced by this patch, but the commit message says
the PI regulator ops use pw_d under pcdev->lock. Is the publication side
in pse_register_pw_ds() covered too?

Both the shared-domain branch and the new-domain branch store
pcdev->pi[i].pw_d with only pse_pw_d_mutex held:

		pw_d->supply = supply;
		if (pcdev->supp_budget_eval_strategies)
			pw_d->budget_eval_strategy = pcdev->supp_budget_eval_strategies;
		...
		kref_init(&pw_d->refcnt);
		pcdev->pi[i].pw_d = pw_d;

By this point devm_pse_pi_regulator_register() has already registered
the PI regulators. pse_pi_is_enabled() can be reached through the
regulator sysfs state attribute. It reads pi[id].pw_d and dereferences
budget_eval_strategy under pcdev->lock, which is a different lock from
the writer's.

On a weakly ordered CPU, could a reader see the new pointer before the
budget_eval_strategy store? The impact looks limited to a wrong state
value for a short window during probe, plus a possible KCSAN report.
The pointer only ever goes from NULL to a live object.

>  out:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118183957.2031311-1-github%40szelinsky.de
