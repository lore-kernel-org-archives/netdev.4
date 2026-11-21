Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302174;
	b=Wq9ku0RMfVIAItoaHZLnF3nkjb2NJJlKbzOiHt51o6Oe2DPNXgfDpwSNjbtdfc/AZDJE
	 J33oxQgyQCJS2DMlGTcsQE9G7I2a0sa2ivhdjEmsA3XGZJE9ECQvqlIGVp/LhSuftrPVL
	 Jm3nnzF+F4HhyKbXXVAUabsta7nWRuS9wO+1InNuhB8qR+0KUUA/i9S3J1U35mRT7jg6f
	 b6f+1YVfsF8xEKKUd34l5FDXc0+zUsyKTPEcAnb2Y7tmjx0wAE5dreRAuLHAREN7JXADT
	 R/+zLRGgzADctHASVqAO7VJjosQgVORiijh2DdWWHadDlZy9Zkz5cIMB3pXoz1CL6Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302174;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EiNrcz/ZXxZYdeBH1eFbaY3DbgX+3ZSe+NGOrjnHYG8=;
	b=x45+GymNe3o3C2d/xkCNJh28Puia2fRT9bDSyQGJyzt2Z6pYewbReNGVE3z+0+2dwx1O
	 CnhHneExGW92e3TkTQxXTNuOjVPJ0zHC0HRd0BEUJDd7YnIAlz8ZpdPGWEIkEAIbBgDAI
	 8zCMjbvkkV0eETSwnWxL9Pybe7vwb5EKjfWnhIe/khcpIrJf4Bvjfkbc40pnBtVDygGjd
	 wG6Wm64DCTnc+uF3JuvuVwePb3aJo/SoKf2KHVAfzJjpPSKnvCjeYfzcbE0ER4dMCYLsv
	 4SOK3MI9ME7ivRadTqX+VJw7ZIJTMQwX3CD2XcEf+XLT/cINkQg6vQzSzvFAWpoj2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0yoi6hx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C4606A32A;
	Sat, 21 Nov 2026 23:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0yoi6hx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EE21F000C6;
	Sat, 21 Nov 2026 23:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302174;
	bh=EiNrcz/ZXxZYdeBH1eFbaY3DbgX+3ZSe+NGOrjnHYG8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G0yoi6hx0MOD6satKt+pgRDwxaQp79LhMqTfqOuQUf470Rzob/aqrm9s1uv8O93Cm
	 jtod5Ys+LsiCyS28kNzGEJYFi69aMvklQ05KVlBADQsS/r4usbhYtbkw3XHPIbOc9L
	 HFdnZ596bbgPqafC1ViCbLqDeYXRi89Y3aTGJaL7pRgvO395GnjtBS4MBieuF2fNSD
	 9AICf1Q9MZTgum6jIxn5Na1kUtCsvC2aCWEbEQw4wR5Hnizw48gOTUJ4D6WniWIeUJ
	 fGj/degRcTWlyQ3ql79HbMOobO6xdgXRyyPW8/fW6PQ6CcF+koQjUjWaMYFJl11C1w
	 V3MneLbP8n9pw==
Subject: Re: [PATCH net-next v4 2/6] net: mvneta: fix the removal of the
 mqprio offload
From: netdev-bot+sashiko@kernel.org
To: pepe.schlehofer@gmail.com
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 23:02:53 +0000
Message-ID: <179530217303.3135.1162900771508007234@kernel.org>
In-Reply-To: <20261118093012.90121-3-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-3-pepe.schlehofer@gmail.com>
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

- [Medium] After this patch, every all-zero mqprio teardown runs the full
  device-wide reset in mvneta_setup_mqprio()…

--

net: mvneta: fix the removal of the mqprio offload

This patch changes mvneta_setup_mqprio() so that qopt.hw is checked only
when num_tc is non-zero. The all-zero teardown from
mqprio_disable_offload() can then reach the code that clears the RX prio
map, the per-queue rate limits and the netdev TC state.

> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index c0abc843b1c1a..06b5453543a19 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
>  	int rxq, txq, tc, ret;
>  	u8 num_tc;
>  
> -	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
> -		return 0;
> -
>  	num_tc = mqprio->qopt.num_tc;
>  
> +	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
> +	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
> +		return 0;
> +

[Severity: Medium]
Can this wipe the configuration of a replacement qdisc? Since the hw
check is now skipped when num_tc == 0, every all-zero teardown goes on
to the device-wide reset further down in mvneta_setup_mqprio():

	mvneta_clear_rx_prio_map(pp);

	if (!num_tc) {
		mvneta_disable_per_queue_rate_limit(pp);
		netdev_reset_tc(dev);
		return 0;
	}

The teardown from mqprio_disable_offload() in net/sched/sch_mqprio.c is
an all-zero struct tc_mqprio_qopt_offload. It does not say which qdisc
instance it belongs to.

Take a replace under a new handle, for example:

  tc qdisc replace dev eth2 root handle 200: mqprio ... hw 1

The calls then happen in this order:

qdisc_create()
  mqprio_init()
    mqprio_enable_offload()
      mvneta_setup_mqprio(num_tc=N, hw=1)    <- new config programmed

qdisc_graft()
  rcu_assign_pointer(dev->qdisc, new ? : &noop_qdisc);
  notify_and_destroy(old)
    mqprio_destroy(old)
      mqprio_disable_offload(old)
        mvneta_setup_mqprio(num_tc=0)        <- new config cleared
  new->ops->attach(new)                      <- offload not reprogrammed

A software taprio replacement sets its TCs with netdev_set_num_tc() in
taprio_change() before the old offloaded mqprio is destroyed. The
netdev_reset_tc() above then undoes them.

In that case, would a new offloaded mqprio end up without its traffic
classes, its MVNETA_VLAN_PRIO_TO_RXQ mapping and its TX rate limits,
while its priv->hw_offload still reads 1? And would a taprio left
without TCs stop sending?

Before this patch, the early return on hw != TC_MQPRIO_HW_OFFLOAD_TCS
made this teardown a no-op, so the replacement kept its configuration.

The commit message describes this behaviour. The root cause looks like
it is in the qdisc core: it destroys the old qdisc after the new one is
set up, and its teardown does not name the qdisc.

Several other drivers reset the same way on num_tc == 0:
enetc_setup_tc_mqprio(), ocelot_port_mqprio(), am65_cpsw_setup_mqprio(),
dpaa_setup_tc(), dpaa2_eth_setup_mqprio() and bnx2x_setup_tc().

At the end of the series, mvneta_setup_mqprio() still does the full
reset for every num_tc == 0 call.

Would a proper fix need the core to identify the qdisc in the teardown
call, so the removal fix does not cause a regression on replace?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118093012.90121-1-pepe.schlehofer%40gmail.com
