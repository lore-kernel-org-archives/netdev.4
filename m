Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302175;
	b=Iuy/d1nNsj6zFP98lZUe8sMSY58pXs4tj9Mg6gZ3EsKvkO2uul8V2YCQa4BVcTvW+5L8
	 4varhjxngBktvIji9+G2kySA99ZLq1g7wDdLw52surpz2XmJQFCJ/f17T2plIzpqqQUf+
	 2wZDj+QKfJVXpTfiTzRld6aJXjPeY4G3wvM344uGH7FifxNPu9n5sq063XbjW4CxiBYii
	 hEIFFLhfpzESlfilyy+LCq58z5nv8ZzOdeord/7arQ1dpsKDOvU7XtXpyLy5ExrsR81iJ
	 EM0T1BriIIlBRTLWP00e3bw6ahjmG46D8uZ02AoZsWyrDevm040sH7CrKkRCi+STRjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302175;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BcwfrCF7f7T5NQYQ4yDuCUyKOzQJSTxR3lI9Uml7xAg=;
	b=1J7U5SZT1JExbedEMity3KTi/dUWJeizRcBfV6p31fteYcnkNjj0KSqDlh077Y/nR7mU
	 BfXyYhoeDRg8vFCYhiqm5PHksERxYj4JwudEIHxxVJL9omx04kzkZcG3j3OhmAUsUNvwY
	 qJUR9r+8QShqjuL7qg+uDJDZybbWp9mHeGRfr1WRe57fn1SUH9iSmCYMcHvsJca2plIqO
	 gBjFstOAUFPAK2HYdq8IV0JKK6pWEIKq0dnQ0FRWQc8s2DlzKnzJarsMuFyjMMy3HQd9N
	 svX73yaBmuuL5CrkzXqkuctgHlXCw7r6MsM/dMm8xYohLp2t+lkzuMEkV89ONHCZi/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFCFmOi+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821EB606A33E;
	Sat, 21 Nov 2026 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFCFmOi+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53DF1F000C6;
	Sat, 21 Nov 2026 23:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302175;
	bh=BcwfrCF7f7T5NQYQ4yDuCUyKOzQJSTxR3lI9Uml7xAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KFCFmOi++nS91OlAYII9Okgq0ZwLlUgi8yRP2FFDoU0WUKA00+bNCHKa6kgrTjshN
	 sNKw0hcEh63MyA1b2u3smhvQGM7EcGpZcKLmJaUkTbdV2XKJan0aZuA+wr9ZsIqtZT
	 lOlAEHt7BJLHxZEYEo1My8K9VNdo4tMfXliwCOLbG4iFung8jXiyJfJqTnn0JfaCtC
	 2UYP1Ygmq3tEoBCFcnSZkoIo0DpRIjLsejSjuztYzm4IgltN8XcO50ugXMMnm6F3If
	 kU++mtWx1WbPoHtgbeS4Paw24aThJ/SxXUfgNKcCPwwQlNv56qaf0iN8VrbtJmGV6F
	 qhhA80l+TlhMQ==
Subject: Re: [PATCH net-next v4 4/6] net: mvneta: keep the TX rate limits
 across open and MTU change
From: netdev-bot+sashiko@kernel.org
To: pepe.schlehofer@gmail.com
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 23:02:54 +0000
Message-ID: <179530217425.3135.3188367185761117756@kernel.org>
In-Reply-To: <20261118093012.90121-5-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-5-pepe.schlehofer@gmail.com>
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

- [Medium] In this patch, a rejected mqprio shaper config leaves the new
  `bucket_refill` copy set, and `mvneta_restore_per_queue_rate_limit()`…

--

net: mvneta: keep the TX rate limits across open and MTU change

This commit saves the refill value of each rate limited TX queue in a new
bucket_refill field of struct mvneta_tx_queue. A new helper,
mvneta_restore_per_queue_rate_limit(), writes the limits back from
mvneta_start_dev(). Before this, mvneta_txq_hw_init() reset every limit to
10.23 Mbit/s after ifup, an MTU change or resume.

> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index 76dfbc484269e..58453c69be361 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c

[ ... ]

> @@ -5239,11 +5247,32 @@ static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
>  	val |= (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
>  		MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
>
> +	pp->txqs[queue].bucket_refill = val;
>  	mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
>
>  	return 0;
>  }

[Severity: Medium]
Can a rejected mqprio shaper config leave bucket_refill set for some
queues?

mvneta_setup_mqprio() calls mvneta_setup_queue_rates() one traffic class
at a time. If a later class fails (nonzero min_rate, a rate that is not a
multiple of 10 kbit/s, zero, or above the maximum), it returns in the
middle of the loop:

mvneta_setup_mqprio() {
    ...
			ret = mvneta_setup_queue_rates(pp, txq,
						       mqprio->min_rate[tc],
						       mqprio->max_rate[tc]);
			if (ret)
				return ret;
    ...
}

The queues of the earlier classes keep a nonzero bucket_refill.

In net/sched/sch_mqprio.c, mqprio_enable_offload() sets priv->hw_offload
only when the offload succeeds. So mqprio_destroy() takes the
netdev_set_num_tc(dev, 0) branch and does not call the driver with
num_tc == 0.

That means mvneta_disable_per_queue_rate_limit() never runs, and it is
the only place that clears bucket_refill. This also breaks the "0 when
not limited" comment on the new field.

For example:

tc qdisc add ... mqprio ... hw 1 mode channel shaper bw_rlimit \
    max_rate 10Mbit 10001kbit
  mvneta_setup_mqprio()
    class 0 sets bucket_refill for its queues
    class 1 returns -EINVAL
  hw_offload stays 0, mqprio_destroy() does not call the driver
ip link set dev ... down; ip link set dev ... up (or an MTU change)
  mvneta_start_dev()
    mvneta_restore_per_queue_rate_limit()

> +/* The TX queue setup overwrites the rate limits, program them again */
> +static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp)
> +{
> +	int queue;
> +
> +	for (queue = 0; queue < txq_number; queue++) {
> +		if (pp->txqs[queue].bucket_refill)
> +			break;
> +	}
> +
> +	if (queue == txq_number || mvneta_enable_per_queue_rate_limit(pp))
> +		return;
> +
> +	for (; queue < txq_number; queue++) {
> +		if (pp->txqs[queue].bucket_refill)
> +			mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue),
> +				    pp->txqs[queue].bucket_refill);
> +	}
> +}

At every later mvneta_start_dev(), would this find the leftover entries,
turn the v3 limiter back on, and write back the limits of the rejected
config?

No mqprio qdisc is installed at that point, so tc cannot show or delete
these limits. Installing and then deleting a valid shaper is the only way
to clear them.

Before this patch, a rejected config already left the hardware partly
configured, but that state did not survive a port restart.

The next patch in the series, "net: mvneta: validate an mqprio setup
before applying it", appears to fix this. With it, mvneta_setup_mqprio()
validates every class with mvneta_txq_refill_val() before touching the
hardware, and bucket_refill is written only after that.

Both patches carry the same Fixes: tag. Should they go to stable together,
or should this patch only store bucket_refill once the whole config has
been accepted?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118093012.90121-1-pepe.schlehofer%40gmail.com
