Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806222;
	b=Vr093dbC4CaCnxOor1BwRRq7u8bDq62A0LsED/aC6UsHdyGQWshN2vlmSHw4fmR16ROl
	 L4/aQC7QGhzoV+LF0Rk4I117PDFhQRms+mcjnsLEjuGS2/L6mQy4XWH940kaaTLb33iyC
	 HZMWp8oHMBbOKRSsxLmA5SVRDoc4w49H+J/ngJZAeCJRrZ/0soxi+kmEPmsP+kz/wEg6t
	 oL6uT8MzQ+LtYwb0FoHUUOdz7bkUX/FnYn1G9bG8hYbHYDZa8zeZUv3iDu3kMtnU5V1mX
	 v401RTnbUdYyAoNl7N+AAqFmX7aq/okEjv0vPxbEjktPDGhb7uZY6Qb83I9BQWoOtDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806222;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TjzzOyavUsmK8+nA5C4pPZ8/ksR+I/TmM7vvBy5YUk0=;
	b=OWgNWa+GqQylR37i1u4fB8YuO945mR39m9SwdOMnHM1ASf6LlDUsgayMLUAine7nDPgA
	 iREkqnwjo0yx1C/bsZLk3DPWFgJKxZNP+VFwA6f0GFdfxgak0F14lIzHKTuUOQMBKjbTq
	 1i9F8xL/dLVH92GrDcTL9LMMp2j5SQfJXnqESXzylzrDL/w1Pob0rsbg9dPbVrshpIc+K
	 S8XiDhlGlH84IYwKsWZMY+wDrQUEKmcjUkHvv3tQxiawDW0qmvl/mfhSmXsnC5ZozNylb
	 AVdZIfN6cwQ9KtUN4wc0dvTTmHwMJe41PGTI+1LAUwbOgZG7gdy7blaRDP3EVCInauQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAowffRb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69386606A333;
	Fri, 27 Nov 2026 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAowffRb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA201F000C1;
	Fri, 27 Nov 2026 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795806222;
	bh=TjzzOyavUsmK8+nA5C4pPZ8/ksR+I/TmM7vvBy5YUk0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AAowffRbCJ4ZdIHylf0XbQ9tZRC3N/lRW0PF2aVQUJd3kk2h2VRCeRi4fUoJ0oBpm
	 SVb2KdSKU35zVVIa5rbSsJ0nz+i7+tWGxHgJdi3U6568T/wsu8vk5DGJddFpis5iBr
	 XsAf8nhOD33SYK2gEpWyqHAc13SmcoeRfb1aBr60elek5n9G7F6RQNxiPLe7r74dET
	 qAV8C+nLbDxR0zD0CKf6nvgYes0U5krIeCHWHZL5t/pncRX5f7Ch69XJY7e2GbHl51
	 IKaWnOqjxM7YqFO+0jjNH0UQsOVwg9k0YwNdNCSptcLSzkuCFqocrqT0+3T7lGdyW1
	 K/aVSswsH/qnw==
Subject: Re: [PATCH net-next V3 2/5] net/mlx5: nodnic: Implement data path
From: netdev-bot+sashiko@kernel.org
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 cjubran@nvidia.com, gal@nvidia.com, linux-kernel@vger.kernel.org,
 shshitrit@nvidia.com, horms@kernel.org
Date: Fri, 27 Nov 2026 19:03:41 +0000
Message-ID: <179580622112.3135.1797108162011344544@kernel.org>
In-Reply-To: <20261126182448.707782-3-tariqt@nvidia.com>
References: <20261126182448.707782-3-tariqt@nvidia.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] With budget == 0 (netpoll), mlx5_nodnic_napi_poll()
  (drivers/net/ethernet/mellanox/mlx5/nodnic/en.c) runs `if…
- [Medium] Error CQEs (OPCODE_CQ_SEND_ERR 0xD / OPCODE_CQ_RECV_ERR 0xE)
  are treated as single-WQE failures.
- [Low] The commit message describes only the TX/RX descriptor paths,
  NAPI and checksum offload.
- [Low] In mlx5_nodnic_check_features()
  (drivers/net/ethernet/mellanox/mlx5/nodnic/en.c), the comment…
- [Low] mlx5_nodnic_activate_queues() (en_cfg.c) calls
  napi_enable_locked(&cq->napi), then mlx5_nodnic_arm_cq(cq) from…

--

net/mlx5: nodnic: Implement data path

This commit implements the TX and RX data paths for mlx5_nodnic. It adds
WQE posting with a BlueFlame doorbell, page pool backed RX, and a NAPI
poll on a shared CQ that dispatches both TX and RX completions. It also
wires up ndo_start_xmit and ndo_features_check and enables checksum
offload.

> Implement NAPI polling and CQE dispatch for TX and RX completions,
> including RX WQE reposting and CQ re-arming.
> Wire up ndo_start_xmit and ndo_features_check, and enable TX/RX
> checksum offload support.

[Severity: Low]
This isn't a bug, but the commit message leaves out some port lifecycle
changes. This is the first patch that calls mlx5_nodnic_enable_port() and
mlx5_nodnic_disable_port(), from ndo_open/ndo_stop. In the parent commit
they were defined but never called.

The patch also makes three related changes:

- mlx5_nodnic_disable_port() now returns int instead of void.
- A new mlx5_nodnic_quiesce_port() calls pci_clear_master() on the whole
  function when the VSC port disable fails.
- mlx5_nodnic_enable_port() is relied on to restore bus mastering on the
  next open.

Could the commit message describe these port enable/disable and bus
mastering changes?

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
> new file mode 100644
> index 0000000000000..6400e100bcb10
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c

[ ... ]

> +static void mlx5_nodnic_handle_err_cqe(struct mlx5_nodnic_cq *cq,
> +				       struct mlx5_cqe64 *cqe64,
> +				       int napi_budget)
> +{

[ ... ]

> +	if (opcode == OPCODE_CQ_SEND_ERR) {
> +		struct mlx5_nodnic_sq *sq = &priv->sq;
> +		u16 sq_pi = mlx5_nodnic_sq_get_pi(sq, wqe_counter);
> +
> +		mlx5_nodnic_complete_send_wqe(sq, &sq->wqe_info[sq_pi],
> +					      napi_budget);
> +	} else {
> +		struct mlx5_nodnic_rq *rq = &priv->rq;
> +		u16 ci = wqe_counter & (rq->ring.num_entries - 1);
> +
> +		mlx5_nodnic_release_rx_wqe(rq, ci);
> +	}
> +}

[Severity: Medium]
If the device moves the SQ or RQ into an error state after a completion
error, does anything recover it?

mlx5_nodnic_handle_err_cqe() prints the CQE and then completes or
releases only the one slot. It records no queue error state and
schedules no recovery. The syndrome table includes WR_FLUSH_ERR. Under
mlx5 semantics that syndrome only appears once a queue is already in
the error state and flushing.

On the TX side, mlx5_nodnic_complete_send_wqe() credits flush
completions as if they were successful sends. The txq keeps waking and
xmit keeps posting into the errored SQ while the carrier stays up.

If the SQ stops completing instead, the txq stays stopped forever.
mlx5_nodnic_netdev_ops has no ndo_tx_timeout, so the watchdog never
fires.

On the RX side, mlx5_nodnic_napi_poll() refills every freed slot on
each poll, with no queue health check:

    if (!mlx5_nodnic_rq_post_wqes(priv))
        return budget;

Wouldn't each reposted WQE come straight back as a RECV_ERR CQE that
counts toward rx_work_done? That would keep NAPI and the IRQ busy
without ever receiving a packet, until a manual ifdown/ifup.

mlx5e recovers from MLX5_CQE_REQ_ERR by moving the SQ through
ERR->RST->RDY. The health monitoring patch later in this series only
polls firmware health.

Is the nodnic firmware guaranteed not to put the queue into an error
state here, or does this need a recovery path?

[ ... ]

> +int mlx5_nodnic_napi_poll(struct napi_struct *napi, int budget)
> +{

[ ... ]

> +	while (true) {
> +		cqe = mlx5_nodnic_cq_get_cqe(cq);
> +		if (!cqe)
> +			break;
> +
> +		/* RX and TX share the CQ. With budget == 0 (netpoll) only TX
> +		 * completions may be processed, leave RX CQEs in place.
> +		 */
> +		if (unlikely(!budget) && mlx5_nodnic_cqe_is_rx(cqe))
> +			break;

[Severity: Medium]
With budget == 0, can an RX CQE at the head of the shared CQ block every
TX completion behind it?

The CQ is consumed strictly in order, so this break leaves cq->cc on the
RX CQE. The send CQEs after it are never reached,
mlx5_nodnic_sq_publish_cc() has nothing to publish, and sq->cc does not
advance.

During a panic with netconsole, NAPI and softirq can't run. Any inbound
frame that lands at the head, such as a broadcast ARP, stops TX reclaim
permanently. The failure would go like this:

- BQL or the SQ ring fills.
- mlx5_nodnic_xmit() sees no room.
- __netpoll_send_skb() retries netpoll_poll_dev() until it gives up.
- The skb is queued on npinfo->txq for a workqueue that won't run.

Wouldn't the rest of the panic output be lost?

bnxt handles budget 0 on its shared completion ring by discarding RX
completions with bnxt_force_rx_discard(), so it can reach the TX
completions behind them. Would something similar work here?

[ ... ]

> +netdev_features_t
> +mlx5_nodnic_check_features(struct sk_buff *skb, struct net_device *netdev,
> +			   netdev_features_t features)
> +{
> +	features = vlan_features_check(skb, features);
> +
> +	/* Validate if the tunneled packet is being offloaded by HW */
> +	if (skb->encapsulation && (features & NETIF_F_CSUM_MASK))
> +		return features & ~NETIF_F_CSUM_MASK;

[Severity: Low]
This isn't a bug, but this comment appears to be copied from
mlx5e_features_check(). There it is followed by a call to
mlx5e_tunnel_features_check().

Here nothing is validated. Checksum offload is cleared for every
encapsulated skb. That behaviour is correct, since
mlx5_nodnic_tx_build_wqe_eseg() only sets outer L3/L4 checksum flags.

Could the comment say that tunnel checksum offload isn't supported?

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> index 79cd2527966c4..243c720b73b63 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c

[ ... ]

> +static int mlx5_nodnic_activate_queues(struct mlx5_nodnic_core_dev *dev)
> +{

[ ... ]

> +	mlx5_nodnic_activate_sq(dev);
> +
> +	napi_enable_locked(&cq->napi);
> +	mlx5_nodnic_arm_cq(cq);
> +	napi_schedule(&cq->napi);

[Severity: Low]
Is the mlx5_nodnic_arm_cq() call here needed?

Once napi_enable_locked() has run, a busy-poll socket still holding the
napi_id from a previous session can run mlx5_nodnic_napi_poll() on
another CPU. That poll updates cq->cc and may call mlx5_nodnic_arm_cq()
itself after napi_complete_done().

Meanwhile this process-context arm reads cq->cc and cq->arm_sn. It then
writes cq->dbr.db[1] and the CQ doorbell, and nothing serializes the
two arms. mlx5_nodnic_cq_irq_handler() also increments cq->arm_sn.

include/linux/mlx5/doorbell.h notes that mlx5_write64() is not atomic on
32-bit and needs external locking.

The practical effect looks limited to a stale arm or a spurious
interrupt. napi_schedule() follows right away, and the poll re-arms when
it completes. Could this arm be dropped, or moved before
napi_enable_locked()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182448.707782-1-tariqt%40nvidia.com
