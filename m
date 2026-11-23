Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478265;
	b=CpptuiKlASRgSl4HKxKO8dI6oW+71y0eUt+iBmBYfZ+i3czg0Y0cb6GP7Q5EpSkRN217
	 l2FDGj6P2a5TSsqUfA+JmK3BdNh/qsYyw+FvDnEWwbJXhgtjpcDexAy/4UfebnZMCTGmO
	 ZkOkirX56yrsHY4iG/jyTWD1pHaNesJd5cphoJSY1qWSbC1cTebliiu/c7/n+Ztn/RIt7
	 KKaNgrHB9i5b/pw0JhMsKg5ZrN8Q76o6kg4tsxc7gmB2wg9GKjUgN6Dx2oKX+yMBX3zS0
	 i+SW44N7v2yiu/4swOrJyz04Ov3EzF9nYUHNJhlENh4X3qyUx6nTCrIxoQCmvBCk/9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478265;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2pNP0xtV5aWCIviAsDqRtjaXnEC3csJaqGq9fEWnUoQ=;
	b=vPiQV2/BBlyp+tILopDOYBCYL+/zaSAEv/0/5a0NaD5knmwSWZFgbqu/MWWesCenGors
	 n5Ik5vOwemItJfKpnStl/GVejCzLrWkK4aCgrMN3+uJwQckhFb/OPZIoM52XqoHZqGjKP
	 5+4f5nIgAfVDEpfGhLcMGCuRamqBDhyhTmFn9JWMkR//h9o4x/FvOusQ4bqxrsUDgmue3
	 QC82BR7Bq5ZOlD32oYR2FVJl9lolXuTVtdtxbujKBqk0VxPrFaQFYupgimFNp3gJHtMwt
	 gawJk6IVm+MWxviBpHTyPnJzN3AZwN8dv1W3ccHPIyWQlAL7plbYG+QKarVoWmpQYpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HiIOp2m9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71DF606A32D;
	Mon, 23 Nov 2026 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HiIOp2m9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21151F000CF;
	Mon, 23 Nov 2026 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795478265;
	bh=2pNP0xtV5aWCIviAsDqRtjaXnEC3csJaqGq9fEWnUoQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HiIOp2m92zZVi8i8k0xVdMxuWNaLj5PDR3caWsrVbY+wpIblim7VYqGBfCFaJIf2e
	 lsidAgvvbq74a06buReUuU+ssF5FIMh1Pb/NE8yArkTNjVvigamA28wYXZSwz/BR9U
	 WlkUfed8Sz731n/7RRGItqs9i3EwbUwqhi/BGmSTMOYLnNWK6v3TkWXxNRt6mNJpgx
	 MY98XuwQ5eA7Jaxn8bi3r+ptKr1rXQ9BVZhahi7fvdT0HSJjn6o50KkMj2QGC9G3E+
	 pYgZJ95iCSMt/8BJxgNMLm3q597hc/rWr6m0+MWscHvhgPX3EONND5pj8A0/gPrzl6
	 dDPiMoI2GzU+w==
Subject: Re: [PATCH net-next v3 3/3] amt: make the per-tunnel group and source
 limits configurable
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org
Date: Mon, 23 Nov 2026 23:57:44 +0000
Message-ID: <179547826432.3135.16263442399696125291@kernel.org>
In-Reply-To: <20261122235724.2898320-4-omar@blockcast.net>
References: <20261122235724.2898320-4-omar@blockcast.net>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new IFLA_AMT_MAX_GROUPS/IFLA_AMT_MAX_SOURCES ceilings,
  together with the automatic growth of hash_buckets from max_sources in…
- [Medium] When max_sources > 2048, amt_newlink() sets hash_buckets to
  AMT_HSIZE_MAX (512).

--

amt: make the per-tunnel group and source limits configurable

This adds IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES so a relay operator
can raise the per-tunnel group and source limits, capped at 512 and 4096.
It also sizes the group and source hashes from max_sources, growing
hash_buckets from 256 up to 512, and reports both limits in
amt_fill_info().

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 177bc0b7cb1fd..01b3a8cabef37 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -3657,9 +3660,15 @@ static int amt_newlink(struct net_device *dev,
>  
>  	spin_lock_init(&amt->lock);
>  	seqcount_spinlock_init(&amt->key_seq, &amt->lock);
> -	amt->max_groups = AMT_MAX_GROUP;
> -	amt->max_sources = AMT_MAX_SOURCE;
> -	amt->hash_buckets = AMT_HSIZE;
> +	amt->max_groups = nla_get_u32_default(data[IFLA_AMT_MAX_GROUPS], 0) ?:
> +			  AMT_MAX_GROUP;
> +	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
> +			   AMT_MAX_SOURCE;
> +	/* Keep source chains short when one group holds every source:
> +	 * at most eight sources per bucket up to AMT_MAX_SOURCE_LIMIT.
> +	 */
> +	amt->hash_buckets = clamp_t(u32, roundup_pow_of_two(amt->max_sources) / 8,
> +				    AMT_HSIZE, AMT_HSIZE_MAX);

[Severity: Medium]
Do these new ceilings also raise the per-packet work a remote gateway can
cause under tunnel->lock by roughly 32x?

amt_report_budget() scales with max_groups * hash_buckets:

static u64 amt_report_budget(const struct amt_dev *amt)
{
	return 2 * ((u64)AMT_REC_WALKS *
		    ((u64)amt->max_groups * amt->hash_buckets +
		     2 * amt->max_sources) +
		    (u64)AMT_REC_LOOKUPS * amt->max_sources);
}

At the defaults (32 groups, 128 sources, 256 buckets) this comes to
120,320 units. At the new ceilings (512 groups, 4096 sources,
hash_buckets clamped to AMT_HSIZE_MAX) it comes to 3,850,240.

The charge from amt_rec_cost() matches real work. Every record, even one
for an empty group, pays AMT_REC_WALKS * hash_buckets. amt_cleanup_srcs()
walks every bucket of gnode->sources twice, and the UNI/SUB paths of
amt_lookup_act_srcs() walk them again.

All of this runs in softirq with the tunnel lock held:

amt_rcv()
  amt_update_handler()
    amt_update_tunnel()
      spin_lock_bh(&tunnel->lock)
      amt_igmp_report_handler() / amt_mld_report_handler()

Once a relay is created with limits near 512/4096, any remote host that
completes the Request/Query/Update handshake can send Membership Updates
whose records keep naming existing, even empty, groups. Each such packet
can then use the whole budget walking bucket heads.

Could that hold the BH-disabled lock for milliseconds per packet? While
it is held, amt_source_work, amt_group_work, amt_tunnel_expire and
amt_dev_stop would spin on it.

Teardown grows the same way. amt_clear_groups() is called from
amt_tunnel_expire() with amt->lock held. Through amt_del_group() it walks
about max_groups * hash_buckets = 262,144 bucket heads under
spin_lock_bh(&tunnel->lock).

The AMT_MAX_GROUP_LIMIT comment and the commit message justify the caps
only by memory ("keep one tunnel's worst case to a few MiB"). Should
these ceilings also account for the CPU and lock-hold bound that
amt_report_budget() is meant to limit?

>  	amt->nr_tunnels = 0;
>  	get_random_bytes(&amt->hash_seed, sizeof(amt->hash_seed));
>  	amt->stream_dev = dev_get_by_index(link_net,

[ ... ]

> diff --git a/include/net/amt.h b/include/net/amt.h
> index 96357b3e32fc9..296570feccef9 100644
> --- a/include/net/amt.h
> +++ b/include/net/amt.h
> @@ -392,6 +392,11 @@ struct amt_dev {
>  #define AMT_GC_KICK		2048
>  #define AMT_MAX_GROUP		32
>  #define AMT_MAX_SOURCE		128
> +/* Upper bounds for IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES. Gateways
> + * drive these allocations, so keep one tunnel's worst case to a few MiB.
> + */
> +#define AMT_MAX_GROUP_LIMIT	512
> +#define AMT_MAX_SOURCE_LIMIT	4096

[ ... ]

> @@ -400,6 +405,8 @@ struct amt_dev {
>  #define AMT_REC_LOOKUPS		8
>  #define AMT_HSIZE_SHIFT		8
>  #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
> +/* hash_buckets grows with max_sources up to this, see amt_newlink(). */
> +#define AMT_HSIZE_MAX		512

[Severity: Medium]
With hash_buckets at AMT_HSIZE_MAX, do the per-group and per-tunnel
allocations end up just over 4 KiB?

amt_add_group() allocates:

	gnode = kzalloc(sizeof(*gnode) +
			(sizeof(struct hlist_head) * amt->hash_buckets),
			GFP_ATOMIC);

struct amt_group_node is about 200 bytes on 64-bit. With 512 buckets
the request is about 4296 bytes and comes from kmalloc-8k. With 256
buckets it was about 2248 bytes and fit in kmalloc-4k.
amt_tunnel_get_or_create() uses the same layout for the tunnel and rounds
up the same way.

So once max_sources is above 2048, the bucket scaling alone doubles
per-group slab memory: 512 groups * 8 KiB = 4 MiB per tunnel, against
2 MiB. Every group's source table is sized from the tunnel-wide
max_sources, so a group holding a single source still gets 512 heads.

reciprocal_scale() does not need a power of two. Would a bucket count of
around 480, which keeps the node within 4 KiB, work here instead?

These GFP_ATOMIC allocations are driven by remote gateways in softirq,
are not memcg charged, and are bounded per device only by max_tunnels.
max_tunnels defaults to 128 and is an unbounded NLA_U32.

The worst case is roughly 128 * (4 MiB of groups + about 0.75 MiB of
sources), around 600 MiB per AMT device. Nodes parked on the GC lists
are not counted against max_groups/max_sources, so transient use can be
higher.

kmalloc-8k objects also need at least an order-1 page, while kmalloc-4k
can fall back to order-0. Under fragmentation these atomic allocations,
and the joins that depend on them, are therefore a bit more likely to
fail.

Is "a few MiB" in the comment above still accurate once slab rounding
and the number of tunnels per device are counted?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122235724.2898320-1-omar%40blockcast.net
