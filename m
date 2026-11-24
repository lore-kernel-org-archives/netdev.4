Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553062;
	b=tXUKSpvnt9wqRcrT2vcNT0wePFDQSEkxCiaJkojBiPBh45+38p1Ita5k6lfn3AwGb95v
	 L0V3JMb+pSAwj0F7MpYqpt+4ixUmnVS4YKt2I8/BAqvPvkrQNcGmeJCf0lp2vMneJDPM0
	 Az7+hA8yRq4NyfHfHk64cadgyFXtaETI6j0zi0ToA3ZKePKlz1gA4PNCMhO0RBoJRWCre
	 9LXJ7Atu3XjcUo7yOvJ2aGvoHvctC+8HIiqCcnXDo+XnfNuT9PftTkMNmDH3K+gcfKYlF
	 FiB+V0Y+crH+AnR6tl20q28/gLtfh8ND/eAhGZi/lNX9RPPgT3hgictRIdIgCXS2DlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553062;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=L6k6T4UCg/mlQgXOscfGpTUcZC4AOa82L9wFRM0YO2M=;
	b=yuA79mbvYckUyPq6epJpJ0BtNYhkwbpOPEodEQqkFleQcTqReYxwVoUgUAPO4PZUmVW2
	 ixuJ4AJ5prCn0isqeaCl52mN06pvlfMAlro5EpIETaJq4AjtgmzMYw7UZnY2F+bi8/R9B
	 yu7x/FWeon5pD2dhQy0Fq7YyCEc8tZq6wDaDsu6tg2jBvD+pzyji9cW4QO9wAISO+QJTe
	 9J/GlLCgotPUm2a/k1c0ypMhIDOnhB6B67HIzRd5s55QnlNKD6e3RLW5tjn+Q9XTM0Qy4
	 SD3xQk55FMQjcboPP9VwapTk4twve/ZloB7OA42zkz8r3hcQdZ/ihMUTqVWW0hbqGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDw3RxwD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91D606A32D;
	Tue, 24 Nov 2026 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDw3RxwD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D11E1F000C0;
	Tue, 24 Nov 2026 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553062;
	bh=L6k6T4UCg/mlQgXOscfGpTUcZC4AOa82L9wFRM0YO2M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HDw3RxwDotH+4/n10s0jGDb55Ljb+32sG2LjWP2CrBqVJ3UD8VhxZXZqzhd0c84bw
	 03H5WqZktXTKXTdhzjZr19zrvcpLWiH6hf90LEU6lo+OtH6lRNOg4ASUw8QqDMsuGE
	 FNeIxmuwK5ipCCqX3gmyIz/B2wGeosYVdytpd2VsO0mscfblDGvaI6412LPq9Uhat7
	 gQNH2OZ4SPD3l4fN0G9l/4EG8eAsqF1KgfUy0ar0wEt/+VCjuz0CzXxopj6lYB7BaI
	 kQbKV0WHIf8eDhCXpsj9ig0689nugrxB694CXjeu7XjZlYHblebfaOg1L6IRgyjxw3
	 bR5ZHQTeA6GTQ==
Subject:
 Re: [PATCH net-next v1 2/2] mlxbf_gige: disable MAC after kernel panic
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davthompson@nvidia.com
Date: Tue, 24 Nov 2026 20:44:21 +0000
Message-ID: <179555306172.3135.17558460540880182095@kernel.org>
In-Reply-To: <8fa3f8fcbdc45e58b815261d6c2c1decd884f5d1.1795206150.git.cbabroski@nvidia.com>
References: <8fa3f8fcbdc45e58b815261d6c2c1decd884f5d1.1795206150.git.cbabroski@nvidia.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new MAC quiesce never runs on the kdump path, so after a
  panic the pause-frame storm the commit message describes can still…
- [Medium] The commit message says the notifier "disables MAC RX and
  clears the RX FIFO".
- [Low] The commit fixes a production failure: after a panic, the
  BlueField internal switch stops traffic to the OOB host and DPU-BMC.
- [Low] mlxbf_gige_on_panic() clears MLXBF_GIGE_CONTROL_PORT_EN (in
  mlxbf_gige_disable_port()) and only then calls mlxbf_gige_clean_port().

--

mlxbf_gige: disable MAC after kernel panic

This commit registers a panic notifier at INT_MAX priority from
mlxbf_gige_probe(). On panic, the notifier disables RX DMA, the port and
interrupts, then soft-resets the port with mlxbf_gige_clean_port(). The
goal is to stop the MAC from filling the RX FIFO and sending pause frames
to the internal BlueField switch.

> Register a panic notifier at highest priority that disables MAC RX and
> clears the RX FIFO to ensure that the MAC can no longer receive packets
> or send pause frames.
>
> Signed-off-by: Chris Babroski <cbabroski@nvidia.com>

[Severity: Low]
Should this carry a Fixes: tag, and possibly Cc: stable?

The commit message describes a user-visible failure: after a panic, the
internal switch stops traffic to the OOB host and DPU-BMC. The missing
panic-time quiesce goes back to when the driver was added:

Fixes: f92e1869d74e ("Add Mellanox BlueField Gigabit Ethernet driver")

> diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
> index d1f8a72cae537..76da711083453 100644
> --- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
> +++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c

[ ... ]

> @@ -127,6 +128,27 @@ static int mlxbf_gige_clean_port(struct mlxbf_gige *priv)
>  	return err;
>  }
>  
> +static void mlxbf_gige_disable_port(struct mlxbf_gige *priv)
> +{
> +	u64 control;
> +
> +	/* Disable RX DMA */
> +	control = readq(priv->base + MLXBF_GIGE_RX_DMA);
> +	control &= ~MLXBF_GIGE_RX_DMA_EN;
> +	writeq(control, priv->base + MLXBF_GIGE_RX_DMA);
> +
> +	/* Disable port */
> +	control = readq(priv->base + MLXBF_GIGE_CONTROL);
> +	control &= ~MLXBF_GIGE_CONTROL_PORT_EN;
> +	writeq(control, priv->base + MLXBF_GIGE_CONTROL);
> +
> +	/* Disable interrupts */
> +	writeq(0, priv->base + MLXBF_GIGE_INT_EN);

[Severity: Medium]
The commit message says the notifier "disables MAC RX and clears the RX
FIFO". This code goes further. It clears MLXBF_GIGE_CONTROL_PORT_EN for
the whole port and zeroes MLXBF_GIGE_INT_EN, and then
mlxbf_gige_on_panic() soft-resets the port with mlxbf_gige_clean_port().

Can this break netconsole on this interface during a panic?

netconsole registers as an atomic-unsafe nbcon console:

drivers/net/netconsole.c:
	con->flags = CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE | flags;

During a panic, these consoles only print from nbcon_atomic_flush_unsafe().
vpanic() calls that long after the notifier chain:

kernel/panic.c:vpanic() {
    ...
	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
    ...
	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
	nbcon_atomic_flush_unsafe();
    ...
}

At INT_MAX priority, this notifier runs first in the chain. Suppose a
netconsole target is bound to the mlxbf_gige OOB port. The pending panic
output (the "Kernel panic - not syncing" line, the backtrace, the
panic_print output) then goes out through netpoll ->
mlxbf_gige_start_xmit() on a port that is already disabled and reset.

Wouldn't that output be lost without any warning? This assumes that
clearing PORT_EN and doing the soft reset also stop TX. The commit message
relies on the same assumption when it says the MAC can no longer send
pause frames.

The commit message also doesn't cover the TX side, the netconsole
interaction, or why INT_MAX priority is needed. Could it be updated to
explain these?

[ ... ]

> @@ -382,6 +404,17 @@ static struct mlxbf_gige_link_cfg mlxbf_gige_link_cfgs[] = {
>  	}
>  };
>  
> +static int mlxbf_gige_on_panic(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct mlxbf_gige *priv;
> +
> +	priv = container_of(nb, struct mlxbf_gige, panic_nb);
> +	mlxbf_gige_disable_port(priv);
> +	mlxbf_gige_clean_port(priv);
> +	return NOTIFY_DONE;
> +}

[Severity: Low]
Does the hardware support doing these steps in this order?
mlxbf_gige_disable_port() clears PORT_EN before mlxbf_gige_clean_port()
runs. Until now the driver has always called clean_port with the port
enabled. For example, in mlxbf_gige_open():

	control = readq(priv->base + MLXBF_GIGE_CONTROL);
	control |= MLXBF_GIGE_CONTROL_PORT_EN;
	writeq(control, priv->base + MLXBF_GIGE_CONTROL);

	mlxbf_gige_cache_stats(priv);
	err = mlxbf_gige_clean_port(priv);

mlxbf_gige_stop() also calls mlxbf_gige_clean_port() with PORT_EN still
set.

The CLEAN_PORT_EN soft reset may need the port enabled to flush the RX
FIFO and raise MLXBF_GIGE_STATUS_READY. If so, readq_poll_timeout_atomic()
in mlxbf_gige_clean_port() would spin for 100ms and then return
-ETIMEDOUT.

Because the return value is ignored here, the RX FIFO could stay full
with nothing reported. Would it make sense to clean the port before
clearing PORT_EN, or at least log the timeout?

[ ... ]

> @@ -446,6 +479,10 @@ static int mlxbf_gige_probe(struct platform_device *pdev)
>  	/* Write initial MAC address to hardware */
>  	mlxbf_gige_initial_mac(priv);
>  
> +	priv->panic_nb.priority = INT_MAX;
> +	priv->panic_nb.notifier_call = mlxbf_gige_on_panic;
> +	atomic_notifier_chain_register(&panic_notifier_list, &priv->panic_nb);

[Severity: Medium]
Does this handle the kdump case? Suppose a crash kernel is loaded and
crash_kexec_post_notifiers is left at its default. vpanic() then hands
control to the crash kernel before the panic notifier chain runs:

kernel/panic.c:vpanic() {
    ...
	if (!_crash_kexec_post_notifiers)
		__crash_kexec(NULL);
    ...
	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
    ...
}

In that case mlxbf_gige_on_panic() never runs. PORT_EN, RX_DMA_EN and
the broadcast, local MAC and multicast RX filters all stay enabled. The
RX WQ and CQ still point at the panicked kernel's buffers.

Once those WQEs are used up, wouldn't the RX FIFO fill again and bring
back the pause frame storm the commit message describes?

The crash kernel's mlxbf_gige_probe() only partly helps:

	for (i = 0; i <= MLXBF_GIGE_MAX_FILTER_IDX; i++)
		mlxbf_gige_disable_mac_rx_filter(priv, i);
	mlxbf_gige_disable_multicast_rx(priv);
	mlxbf_gige_disable_promisc(priv);

Probe never clears RX_DMA_EN or PORT_EN and never calls
mlxbf_gige_clean_port(). A FIFO that is already full only gets drained if
the crash kernel opens the interface, or at the reboot after the dump. If
the crash kernel doesn't load this driver at all, nothing quiesces the
port.

Should probe also fully quiesce and clean the port?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795206150.git.cbabroski%40nvidia.com
