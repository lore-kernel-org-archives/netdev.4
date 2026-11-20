Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156915;
	b=Z88s5fqVHIr31pif+a+ie64jTZKK9nR/dFf8LNomPEunwLqQ4gTxcvyax+8II/tx8woj
	 IqZvN3XlSIQlOZGnLtxgyEAYdvBAr1xXUBCWXsn4lHjPINmxzuv0Yy29WNU5NSKkSTCrW
	 KeQsZbj801xPl6XoDdVs7VJVFo+nZ/uFJIlH8zc0ARm3JDDRs60OtIRysNarSOtRc20Yn
	 o92f0IR8/ocLH6cT7+UIVuBXQSuc0J2rLX9d30cYB3z4rW/X+orXImLYPJ8K8fGSe/YE+
	 qHQuz7FqD3kw14B76O4tBLe1ANScgS8Lwshq+aConxR1hQiLp0+xlhb3gejoq2NsHZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156915;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=O7nLJpHLhC9VkFtCHhEbGKZwa8Q+BdlNhtTNSULE8pE=;
	b=xdfemrgP9qwIVe9UNEn2Gn859jMLpFF2w0r9HBoZVyWG8YoA5YgECvmE7CsFrW+6r8NY
	 mmfGlHEyfLtEGahvzYdhqAnIpLHNHTQJW42Ua9zWBb/Gcnd6iJRNfhU51jC57FXwDMAg4
	 jQckRaMjrl4njAepOJFdm5PF7hB1tOiE6ThIEmpXWbUETIEvmw3I3iIK1MV171XAfk8lk
	 zihBLuyevD1p64vbuNknAVnoJ/cb0bax9FDBiyKiS0KWb0DtxDLd/XAiAN18msPxSONj/
	 kRYs2TM+PDgUxUel4H2kG3KSUs7ufbPEzfXMUSxC0l51D8wvRBFMoEQIDGIQ8Ja11LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F4FCb/RK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA560A2633;
	Fri, 20 Nov 2026 06:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4FCb/RK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF011F000D1;
	Fri, 20 Nov 2026 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156914;
	bh=O7nLJpHLhC9VkFtCHhEbGKZwa8Q+BdlNhtTNSULE8pE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F4FCb/RKVMNlVK0KD7AJZLMZEpvz7blP8O9iq4v6i0YgkrXPzLCY7zVoawbr32Rbk
	 HIXm4gWyKKAR0iaDN71zxXwM7TDgoQLrE94TBXTkK0yZ7XA7a1NZ2LwgN3zWQRWVqZ
	 tcpwRhjA4XTG0VI/LDnRYiLJO0FkO6M89nhrdLbc8jqkpHDvlMPpYRFlVqhUxTEft9
	 t+ZNizwjSnuuk22OVFsVISVi8siJCK5uGz0MM/pjBbIFrcbIepCIF/dwEMq5V92INO
	 Muk1f8UkiIGH/Szm8VVpyN0RkSftjO2Pojyftg4li0ENW73k6VafH2Nrd2RoIOriHD
	 WzlWqNfyYBRoQ==
Subject: Re: [PATCH net v5 08/14] net: pse-pd: stop async event sources before
 freeing PI data in unregister
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:41:53 +0000
Message-ID: <179515691327.3136.4761180533573430766@kernel.org>
In-Reply-To: <20261118183957.2031311-9-github@szelinsky.de>
References: <20261118183957.2031311-9-github@szelinsky.de>
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

- [Low] pse_controller_unregister() sets pcdev->unregistering = true and
  nothing ever clears it.

Pre-existing issues:
- [High] At this commit, pse_controller_unregister() still calls
  pse_release_pis(), which does kfree(pcdev->pi), at line 1188.
- [Medium] At this commit, pse_controller_register() returns directly
  after kfifo_alloc() on several failures and leaks ntf_fifo: missing…

--

net: pse-pd: stop async event sources before freeing PI data in unregister

This patch reorders pse_controller_unregister() so that the IRQ is
disabled and the notification worker is drained before the power domains
are flushed and the PI array is freed. It also adds a
pcdev->unregistering flag, set under pcdev->lock. After it is set,
pse_pi_enable() and _pse_pi_delivery_power_sw_pw_ctrl() return -ENODEV,
so the worker can't be queued again after the drain.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 8041ad3e330b9..22f2d8041bd4b 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c

[ ... ]

> @@ -1158,11 +1170,22 @@ EXPORT_SYMBOL_GPL(pse_controller_register);
>   */
>  void pse_controller_unregister(struct pse_controller_dev *pcdev)
>  {
> -	pse_flush_pw_ds(pcdev);
> -	pse_release_pis(pcdev);
> +	/* From now on the PSE core must not power a PI, so nothing queues
> +	 * a new notification once the worker is drained below.
> +	 */
> +	mutex_lock(&pcdev->lock);
> +	pcdev->unregistering = true;
> +	mutex_unlock(&pcdev->lock);

[Severity: Low]
This is the only write to pcdev->unregistering, and nothing clears it
again. pse_controller_register() doesn't reset it either. It only
initializes these:

pse_controller_register() {
	mutex_init(&pcdev->lock);
	INIT_LIST_HEAD(&pcdev->pse_control_head);
	spin_lock_init(&pcdev->ntf_fifo_lock);
	...
}

If the same pse_controller_dev were registered again, wouldn't
pse_pi_enable() and _pse_pi_delivery_power_sw_pw_ctrl() always return
-ENODEV? pse_set_config_isr() would then never power a PI.

No in-tree caller does this. pd692x0, pse_regulator, realtek-pse-mcu,
si3474 and tps23881 all call devm_pse_controller_register() on a struct
allocated with devm_kzalloc. So each bind gets a zeroed pcdev. Other
fields are not reset on register either, for example no_of_pse_pi and
irq.

Could the flag be cleared in pse_controller_register()? Or could the
kernel-doc say that the core expects a zeroed pcdev for each
registration?

> +
> +	/* Stop the IRQ and the notification worker first: pse_isr() uses
> +	 * pcdev->pi and the power domains that pse_flush_pw_ds() drops,
> +	 * and the worker reads the kfifo that is freed below.
> +	 */
>  	if (pcdev->irq)
>  		disable_irq(pcdev->irq);
>  	cancel_work_sync(&pcdev->ntf_work);
> +	pse_flush_pw_ds(pcdev);
> +	pse_release_pis(pcdev);

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.
pse_release_pis() still does kfree(pcdev->pi) while other code can
still reach the array.

The PI regulators were registered with devm_pse_pi_regulator_register().
Devres removes them only after this function returns. pcdev also stays
on pse_controller_list until the list_del() further down.

In that window, can these read or write the freed pcdev->pi[]?

  pse_pi_is_enabled()
  pse_pi_disable()->_pse_pi_disable()
  __pse_control_release()
  of_pse_control_get()->of_pse_match_pi()

For example:

of_pse_control_get() {
	...
	list_for_each_entry(r, &pse_controller_list, list) {
		if (!r->no_of_pse_pi) {
			ret = of_pse_match_pi(r, args.np);
	...
}

__pse_control_release() {
	...
	if (psec->pcdev->pi[psec->id].admin_state_enabled)
		regulator_disable(psec->ps);
	...
}

pse_release_pis() also doesn't take pcdev->lock, and it leaves
pcdev->pi pointing at freed memory.

This patch only moves the free after the IRQ and worker drain. It
doesn't make the window wider.

Later patches in this series fix it:

  "net: pse-pd: unregister from the controller list before freeing PI
  data" moves list_del() ahead of the drain and the frees.

  "net: pse-pd: keep the PI data until the PI regulators are gone"
  removes pse_release_pis() from unregister. The array is then freed
  from a devm_pse_release_pis devres action, which runs after the PI
  regulators are gone.

That later commit also says the series does not fix a consumer that
still holds a pse_control after the controller unbinds.

>  	kfifo_free(&pcdev->ntf_fifo);

[Severity: Medium]
This is also a pre-existing issue and was not introduced by this patch.
Is ntf_fifo leaked when pse_controller_register() fails after
kfifo_alloc()? Several error paths there return directly without
calling kfifo_free():

pse_controller_register() {
	...
	if (!pcdev->ops->pi_get_admin_state ||
	    !pcdev->ops->pi_get_pw_status) {
		dev_err(pcdev->dev,
			"Mandatory status report callbacks are missing");
		return -EINVAL;
	}
	...
	ret = pse_register_pw_ds(pcdev);
	if (ret)
		return ret;
	...
}

The failures of of_load_pse_pis(), setup_pi_matrix(), devm_kzalloc()
and devm_pse_pi_regulator_register() return directly too. The later
failures leak pcdev->pi as well. These paths can be hit repeatedly
during -EPROBE_DEFER retries.

Later patches in this series fix it:

  "net: pse-pd: free the notification kfifo when registration fails"
  sends every error path to a free_kfifo label, which calls
  cancel_work_sync() and kfifo_free().

  "net: pse-pd: keep the PI data until the PI regulators are gone"
  registers devm_pse_release_pis right after of_load_pse_pis()
  succeeds. of_load_pse_pis() already frees the PI array on its own
  errors.

>  	mutex_lock(&pse_list_mutex);
>  	list_del(&pcdev->list);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118183957.2031311-1-github%40szelinsky.de
