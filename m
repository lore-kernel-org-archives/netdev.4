Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120266;
	b=btAaioucW42Dxo0tptyvCGQnG/NOb5Vhqi0UrNcvs81Pi6kqDYqqUpfyGVywJDn5uOAO
	 oTeGYWIrS6B49hJuD9Pc9yY1JHJ99afQASvbQOdJEUH26IJbZyI/jSxonmdsfUrjGvzcO
	 TC6GHTq/s3qywByh5+MfzPBljF6hZWztRAzbIniPIMpF+/KsxChEJaYbO3vS2sDvEMDx6
	 ze5McG6yKtvWfHHaLdiIs6jZ98k4nB1kvMwOFx5ep6xdGusC7lC5LLjYI6p596HQvAADl
	 pAN1aDVK8DvwRLE0aB1IXXnuhgTem6l1GbmIgIKVk3Qh68wsBWR/fEVUyAQe6jD+w/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120266;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qvhCWu9vmgqM4mc/mPMkhSbatfIv0aAa9VrQE3dzZbU=;
	b=PXv8i8Rvgsgt5PqBqepCxGGSd2NgPwOGnhh0KBtrvqzeO2Q0tMJEQteXlR2RZ7LYzz2Y
	 W/cypHJidQmDzpRKKHsjRaSPGWjtkJ/j47wj7/kK18ymW6Hrny9nn8vybg0uunu+h1xRt
	 bDEIRkhU5WWNC1p1A9sW0bq2/FEJ6BLb8Hdf7I4Hs+wjPQjIgs4dnAXIIBvwN6L8w5twr
	 KWIA5Ra5cRB5N+Zt12U2VJXIDd0BSOa/PnhF9wz8ZV8nAeBDGiBcyuaOg0n790budMNuK
	 bIC4UhAGYk7IQZHmULIg5cgtxBEc5Tu6I6xmo7uGcIuPVYYF501lihSHqXgZgaam0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUeLsisw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88260A260E;
	Thu, 19 Nov 2026 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUeLsisw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C451F000CA;
	Thu, 19 Nov 2026 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795120266;
	bh=qvhCWu9vmgqM4mc/mPMkhSbatfIv0aAa9VrQE3dzZbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iUeLsiswLypyI0jw+Gw4SZWQ0V+WFhhcjsapPnivS85dOEis5jP8Dtipm+cmu+8Ih
	 b2nLS+VrgJeWyfgmzKRMUhvfVaxrIJwSoaavKzqt/hCaq03sZOxYstlYKUy1DZ4Tog
	 0/TkuSjfjLNE0Aov2AacEq4K23w9/31KGRhQqsJQHjnk8/WdJosESqUqYmZvRvZfnK
	 sLhr5vk+9yj8yhlkYjVx2bTNq9hksVCikgvCBQ9qdkrBxNSf12UeTkD6jRPYr+4ZSf
	 isid7OfTRR8aUYYYbRttCK8KzzXj6DO5zl693KpKuMF3SVAwkqW3VVfvC9+cqurwOZ
	 bBaDokHV+yPlg==
Subject: Re: [PATCH net 4/4] net: systemport: accumulate the DIM packet and
 byte counters
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com
Date: Thu, 19 Nov 2026 20:31:05 +0000
Message-ID: <179512026544.3136.9866783753174621892@kernel.org>
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
References: <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
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

Critical: 0 · High: 0 · Medium: 1 (2) · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch makes priv->dim.packets and priv->dim.bytes running
  totals in bcm_sysport_desc_rx().

Pre-existing issues:
- [Medium] When net_dim_decision() changes the profile, net_dim() sets
  dim->state = DIM_APPLY_NEW_PROFILE and calls schedule_work(&dim->work).
- [Medium] bcm_sysport_set_coalesce() can turn off adaptive RX coalescing
  (priv->dim.use_dim = 0) and write the user's static rx usecs/frames…
- [Low] When use_dim is set, bcm_sysport_init_rx_coalesce() (and
  bcm_sysport_set_coalesce() when DIM is enabled) writes…

--

net: systemport: accumulate the DIM packet and byte counters

This commit makes bcm_sysport_desc_rx() add the per-poll packet and byte
counts to priv->dim.packets and priv->dim.bytes. Before, it overwrote them.
net_dim() computes rates from the difference between samples, so it
needs running totals.

> diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
> index bc88a27da16be..d3041ad606981 100644
> --- a/drivers/net/ethernet/broadcom/bcmsysport.c
> +++ b/drivers/net/ethernet/broadcom/bcmsysport.c
> @@ -844,8 +844,8 @@ static unsigned int bcm_sysport_desc_rx(struct bcm_sysport_priv *priv,
>  			priv->rx_read_ptr = 0;
>  	}
>  
> -	priv->dim.packets = processed;
> -	priv->dim.bytes = processed_bytes;
> +	priv->dim.packets += processed;
> +	priv->dim.bytes += processed_bytes;

[Severity: Medium]
Now that these are running totals, can the first net_dim() sample after
each open or resume still give wrong rates?

bcm_sysport_netif_start() calls bcm_sysport_init_dim() on every open and
resume. That function sets the counters back to 0 but does not touch the
embedded struct dim:

drivers/net/ethernet/broadcom/bcmsysport.c:bcm_sysport_init_dim() {
    ...
	INIT_WORK(&dim->dim.work, cb);
	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
	dim->event_ctr = 0;
	dim->packets = 0;
	dim->bytes = 0;
}

So dim->dim.state, start_sample, prev_stats and profile_ix all carry over
from the previous session. At close the state is usually
DIM_MEASURE_IN_PROGRESS, and start_sample holds the last large totals.

On the first bcm_sysport_poll() after reopen, net_dim() compares the
reset counters against that old start_sample. The u16 event gap wraps to
roughly 65536 - E_old, which is at least DIM_NEVENTS, so the measurement
is accepted right away. dim_calc_stats() then sees packet and byte
deltas close to 2^32, and a delta_us that covers the whole downtime.

net_dim_decision() can then step profile_ix based on those values and
schedule bcm_sysport_dim_work(). The prev_stats left behind also skews
the next comparison.

Turning adaptive RX coalescing off and on again in
bcm_sysport_set_coalesce() has a similar effect. desc_rx keeps adding to
the counters while net_dim() is not called, so the first decision after
re-enabling uses a start_sample that may be minutes old.

The bcmgenet commit in this series, "net: bcmgenet: restart DIM from the
default profile on ring init", handles this by resetting the whole
struct:

drivers/net/ethernet/broadcom/genet/bcmgenet.c:bcmgenet_init_dim() {
    ...
	memset(&dim->dim, 0, sizeof(dim->dim));
	INIT_WORK(&dim->dim.work, cb);
	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
	/* Match the profile bcmgenet_init_rx_coalesce() programs */
	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;
    ...
}

Would bcm_sysport_init_dim() need the same reset for this fix to cover
close/open, suspend/resume and DIM off/on?

[Severity: Low]
This is a pre-existing issue, but bcm_sysport_init_dim() never sets
dim->dim.profile_ix. When use_dim is set, bcm_sysport_init_rx_coalesce()
programs the default EQE profile:

drivers/net/ethernet/broadcom/bcmsysport.c:bcm_sysport_init_rx_coalesce() {
    ...
	if (dim->use_dim) {
		moder = net_dim_get_def_rx_moderation(dim->dim.mode);
    ...
}

That is profile index NET_DIM_DEF_PROFILE_EQE (1). Meanwhile profile_ix
is 0 on first open, and after a close/open it is whatever the last
session left behind.

Does net_dim_step() then walk the profile table from a base that differs
from what RDMA_MBDONE_INTR actually holds? bcmgenet_init_dim() sets
profile_ix = NET_DIM_DEF_PROFILE_EQE for this reason.

[Severity: Medium]
This isn't a bug introduced by this patch, but can DIM get stuck in
DIM_APPLY_NEW_PROFILE across a close/open?

When net_dim() changes the profile, it sets DIM_APPLY_NEW_PROFILE and
schedules the work. The only code that clears that state is the work
item:

drivers/net/ethernet/broadcom/bcmsysport.c:bcm_sysport_dim_work() {
    ...
	bcm_sysport_set_rx_coalesce(priv, cur_profile.usec, cur_profile.pkts);
	dim->state = DIM_START_MEASURE;
}

If the interface is closed or suspended while that work is pending, it
gets cancelled:

drivers/net/ethernet/broadcom/bcmsysport.c:bcm_sysport_netif_stop() {
    ...
	napi_disable(&priv->napi);
	cancel_work_sync(&priv->dim.dim.work);
    ...
}

On the next open or resume, bcm_sysport_init_dim() does not reset
dim->dim.state. Every later net_dim() call then hits:

lib/dim/net_dim.c:net_dim() {
    ...
	case DIM_APPLY_NEW_PROFILE:
		break;
    ...
}

Nothing reschedules the work, and bcm_sysport_set_coalesce() does not
reset the state either. Would adaptive RX coalescing stay frozen until
the driver is reloaded, so the corrected totals from this patch are
never evaluated? The bcmgenet commit in this series fixes the same
problem there.

[Severity: Medium]
This is a pre-existing issue, but can a pending DIM work item overwrite
static coalescing settings that were just configured through ethtool?

bcm_sysport_set_coalesce() turns DIM off and writes the static values
without cancelling or flushing priv->dim.dim.work:

drivers/net/ethernet/broadcom/bcmsysport.c:bcm_sysport_set_coalesce() {
    ...
	priv->dim.use_dim = ec->use_adaptive_rx_coalesce;

	/* Apply desired coalescing parameters */
	bcm_sysport_set_rx_coalesce(priv, usecs, pkts);
    ...
}

If net_dim() has just queued the work, bcm_sysport_dim_work() can run
after this. It does not check priv->dim.use_dim, and it calls
bcm_sysport_set_rx_coalesce() with the profile_ix values. Once use_dim
is 0, net_dim() is no longer called, so nothing puts the static values
back.

The hardware would then keep a DIM-chosen setting, while
priv->rx_coalesce_usecs, rx_max_coalesced_frames and use_dim say
something else. The two callers' read-modify-writes of RDMA_MBDONE_INTR
in bcm_sysport_set_rx_coalesce() are also not serialized against each
other.

>  
>  	return processed;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088%40tipi-net.de
