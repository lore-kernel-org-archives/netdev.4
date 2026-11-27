Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806226;
	b=vfeoFf6EiaWHGdF2WHzer9B95lEW8+3L95GQDg0IQVy0Dr55Jb4ZIu4zioQtXwdE15s1
	 XCdIamUstcieTqBdQPqezQXj4kZX6NqV5YxZNUEMZJmwLLdAHshLiQXJKFhpJzjTf0xmI
	 cwz+iuFtQZz0tuDsUrri9sV/rrEgQ4py1c4L9fUccOsXDixegfsfiakC5apnjrfyvxlhe
	 eFvTVQbOW3+soVyl1sWIG5BuSF+67w8qa4uVIz+mc9Pl9LJLJ6Hwki1EO3t7mtuAQWcbR
	 ODBZ48aNMUEsrQ6sTj3TzdRClb/LNT1jIW+aGaxw38r57i8VNgxDQE1YEnyQa2Cs/JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806226;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sh53ElcPrxXMqpfaM+scQ0n1Yr1piuqY/R2KAkhxLOE=;
	b=ngWq2hxuyXqP9CVk0NBCvLAkzXXQN83Y2vNi7KvEZ/Zm4E/FM4WsgdsKfYtSj4Ak+GoZ
	 iIETJ+048aLaV4l7/DrHttC4YmJDv4chadxLbHExGJKu5l3P0Oc3FOpFfs6Crf7v/c/im
	 JRs7b3hScAq9+mIeYcMFrdCt3jSnsxYT8d9LR2hhAoQap6oY+lNpVxsissvXBQ5qi4F8x
	 s6t3zIcXB6lJHwVe/Tv62ouGnkl/rIhUCH+kmdgri/AQ+GV9hH2WM5mlrXcmr/F7A+uSG
	 XpAA3uMUk49jwSXm1rfKLbKHsEJ5IdD6UUiJMugu1lAwzaZIOsYbNftwqU9FdivC72Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBkxANxi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8D606A684;
	Fri, 27 Nov 2026 19:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBkxANxi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD971F000C1;
	Fri, 27 Nov 2026 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795806226;
	bh=sh53ElcPrxXMqpfaM+scQ0n1Yr1piuqY/R2KAkhxLOE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oBkxANxip2zbCnd3ReEepEdxBNPQRWrgSjgJRBKj+EePob/yJZWlE4ZPRrp+apRUf
	 76z6r3D6WhLW8mwcFlreLEgNFqSTw9tFA2RQiLl5i9+z8F3A2ZbQfOJGGgUK4A9RrO
	 EJzgfsztt15lAIWPgF26esgTMqG2uJVLEneGA2uDDz8KDxuT3ev/cyq9ONsUenaS4n
	 J55/QXb6D+khYxjxwCsSDwFOc86HQ/T+ohY/+iwuGTXiqag+zdxYVIOMFemSya+McB
	 8MoWKs8JT7zFMe2d0IpTLnCHQGY1E8ibP8LEuE6L1JVGYzUT75B7tZ8XLpuyL7JFME
	 wi2Um6vddHWbA==
Subject: Re: [PATCH net-next V3 5/5] net/mlx5: nodnic: Add health monitoring
From: netdev-bot+sashiko@kernel.org
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 cjubran@nvidia.com, gal@nvidia.com, linux-kernel@vger.kernel.org,
 shshitrit@nvidia.com, horms@kernel.org
Date: Fri, 27 Nov 2026 19:03:45 +0000
Message-ID: <179580622522.3135.9739046341225289422@kernel.org>
In-Reply-To: <20261126182448.707782-6-tariqt@nvidia.com>
References: <20261126182448.707782-6-tariqt@nvidia.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When mlx5_nodnic_poll_health()
  (drivers/net/ethernet/mellanox/mlx5/nodnic/health.c) detects a fatal…
- [Low] The commit message does not spell out several behaviours.
- [Low] mlx5_nodnic_printk() in
  drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h is a variadic…

--

net/mlx5: nodnic: Add health monitoring

This commit adds a timer-based health poller to the mlx5 nodnic driver.
The poller reads the health buffer in the initialization segment and
detects fatal PCI/FW conditions, health counter stalls and syndrome
changes. It logs them with a severity and moves the device to
INTERNAL_ERROR on fatal conditions. Polling starts in probe and stops in
remove.

> Detect fatal device conditions, firmware health counter stalls, and
> syndrome changes. Report health errors together with their severity
> and mark the device as unhealthy on fatal conditions.

[Severity: Low]
Could the commit message say more about what "mark the device as
unhealthy" means in practice?

After the first fatal event, mlx5_nodnic_poll_health() returns without
calling mod_timer(), so health polling stops for good.

The INTERNAL_ERROR state is never cleared. From then on,
mlx5_nodnic_open_locked() returns -EIO for the rest of the driver's
lifetime.

The patch also adds a new severity-aware logging helper,
mlx5_nodnic_printk() / mlx5_nodnic_log(), to nodnic.h, and the message
doesn't mention it.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
> new file mode 100644
> index 0000000000000..a2038eea9717f
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
> @@ -0,0 +1,303 @@

[ ... ]

> +static void mlx5_nodnic_poll_health(struct timer_list *t)
> +{
> +	struct mlx5_nodnic_priv *priv = timer_container_of(priv, t,
> +							   health.timer);
> +	struct mlx5_nodnic_core_dev *dev = priv->core_dev;
> +	struct mlx5_nodnic_health *health = &priv->health;
> +	struct health_buffer __iomem *h = health->health;
> +	u32 fatal_error, count;
> +	u8 prev_synd;
> +
> +	if (READ_ONCE(dev->state) == NODNIC_DEVICE_STATE_INTERNAL_ERROR)
> +		return;
> +
> +	fatal_error = mlx5_nodnic_health_check_fatal_sensors(dev);
> +
> +	if (fatal_error && !health->fatal_error) {
> +		mlx5_nodnic_core_err(dev, "fatal error detected: %s (%u)\n",
> +				     mlx5_nodnic_fatal_error_str(fatal_error),
> +				     fatal_error);
> +		priv->health.fatal_error = fatal_error;
> +		WRITE_ONCE(dev->state, NODNIC_DEVICE_STATE_INTERNAL_ERROR);
> +		if (fatal_error != MLX5_NODNIC_SENSOR_PCI_COMM_ERR &&
> +		    fatal_error != MLX5_NODNIC_SENSOR_PCI_ERR)
> +			mlx5_nodnic_print_health_info(dev);
> +		return;
> +	}

[Severity: Medium]
When a fatal sensor fires, this branch sets dev->state to INTERNAL_ERROR
and returns. Is anything else supposed to happen to an interface that is
already open?

As far as I can see, the only reader of the new state is the check added
to mlx5_nodnic_open_locked(). Carrier stays on, the TX queue is not
stopped and the netdev is not detached.

mlx5_nodnic_xmit() never looks at dev->state, so it keeps building WQEs,
updating the DBR and ringing the UAR doorbell of a device that has just
been declared dead:

drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c:mlx5_nodnic_xmit() {
    ...
    mlx5_write64((__be32 *)ctrl, uar_base + MLX5_BF_OFFSET);
    ...
}

The close and remove paths also ignore the state:

  mlx5_nodnic_close_locked()
    -> deactivate/close queue VSC commands

  mlx5_nodnic_remove_one()->mlx5_nodnic_dev_cleanup()
    -> mlx5_nodnic_write_nic_interface(dev, DISABLED)
    -> mlx5_nodnic_wait_fw_init(dev, "teardown")

With all-ones reads, the VSC gateway lock gives up with -EBUSY after
VSC_MAX_RETRIES sleeps, so each access is bounded to a few seconds.

What if config space still works but FW keeps the initializing bit set,
for example during SW_RESET or RFR? Could the teardown wait then run up to
MLX5_NODNIC_FW_INIT_TIMEOUT_MS?

Because the state is never cleared, a down/up cycle then fails in
mlx5_nodnic_open_locked() with -EIO, and only unbind/rebind recovers the
interface.

Should the fatal path drop carrier and stop or detach the netdev? Should
xmit, close and remove also skip device access once the state is
INTERNAL_ERROR?

[ ... ]

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
> index c44b0fdbe601b..6f8677bf1aaef 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
> @@ -78,6 +78,31 @@ struct mlx5_nodnic_core_dev {
>  	enum mlx5_nodnic_device_state	state;
>  };
>  
> +static inline void mlx5_nodnic_printk(struct mlx5_nodnic_core_dev *dev,
> +				      int level, const char *format, ...)

[Severity: Low]
This isn't a bug, but could mlx5_nodnic_printk() be annotated with
__printf(3, 4)? Without it, -Wformat can't check the format strings
passed through mlx5_nodnic_log().

All current callers in mlx5_nodnic_print_health_info() use matching
formats and arguments. mlx5_printk() in mlx5/core/mlx5_core.h is declared
the same way without __printf, so this follows the existing pattern.

> +{
> +	struct device *device = dev->device;
> +	struct va_format vaf;
> +	va_list args;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182448.707782-1-tariqt%40nvidia.com
