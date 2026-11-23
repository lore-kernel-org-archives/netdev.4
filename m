Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438327;
	b=YYD6PzQ8mIYU6IzwRm5rPZQ93v2awA/MRhnTLWuMLbYyENK9SXef3pC3kbELZusuU1a7
	 Jz6WK4JG9AjReenCchKYS9OyGDv3xbcpRmeATObIWk/HsPL9d8jhuGAL4ftZy5ZpqHp5U
	 HszFe+bXWcM7R2YCBbpnSA8jLq77R+QDHTIuW8+/aXs+LOwz7AwUNk174wSFLUX5D3ao3
	 ii1ABt1/aSrNmby8FSxHnxGkZ9cjsI8I4I2dzZ9oqRNWi9uexagWJj1/pEf9lf2IeQX6r
	 KHmuvMq9pn9Eb/AkcU5Ut1XCtR5wUtJ3qeO/osQiqzDG4S+hCa3XCVRNF9pbT3H2TVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438327;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=G9I46tjjZ0o61TQKYnfFGrnV1b47YbqA6nHR7I6CX88=;
	b=w33Chx+w5V4B4fqPc8+0dl+0XTIAlvex6QJ2PTIx8WUirmt0a8UiJJjggcJ7GXWQwp9R
	 XPuCpBDLJ3/syqMlTGWNhRgACuDqz+IemMa88F3geud/RJSfc5csPEwTqyP3rgqyDd6/k
	 HypjWoz+SITYzwjtb2ENuLy7ef8VmAIMBoN015mVxUK4YSUEIyjci6d8yuPx1KdMkfkH9
	 QiT1NC74o6VwD5/+wuo/FWk/CWuChjTzGBAIA/kwp0IDLab5asWNsBlypiRgRRltBd7yc
	 PeSljoOh5QOf9n7N81LIwuyb4+CrX1Ki9yOOc8dnX/fDdxlCutVKapIC+ElIkP5OaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flls5sXm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEC3606A686;
	Mon, 23 Nov 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flls5sXm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753621F000EE;
	Mon, 23 Nov 2026 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438327;
	bh=G9I46tjjZ0o61TQKYnfFGrnV1b47YbqA6nHR7I6CX88=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=flls5sXmgHVpcHyf+5b58rRLwHV7JTjQesQWPVmBWSVsJniJUDh4RF0ri+NN12TAo
	 1MaJgF81gyCH3iGWlbiy0VZqLzKJz2yzwqiF1wg6yfcr1G+ax/oiwo598SLDPGKF31
	 C7QE9R3zzpJWHq/T6NJd6fdztEfMMJ8pcdqzqJY6uO8dXLmqS9DY4XwKhfDNtajsoh
	 udKjXPud/Hz4TuAwIWtYJ39fngb9BnTLa6kQWDGEhpDANr3ByxL1gRkc3NZBXdU55I
	 9OljkPi9RTw+c7UrpT1H71UCgblzeDNukuQ1WcZMtQud7opIosABuN3TbLzM1MYbva
	 hYRElNBkwSXtA==
Subject: Re: [PATCH v35 net-next 6/8] net/nebula-matrix: dispatch: add mailbox
 RPCs for msix map, mailbox irq and vsi/eth id
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:06 +0000
Message-ID: <179543832604.3135.16730379200128130187@kernel.org>
In-Reply-To: <20261119113530.32107-7-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-7-illusion.wang@nebula-matrix.com>
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

- [Low] The commit message says "If the resource op is not installed the
  responder answers -EOPNOTSUPP." No code does this.
- [Low] The kernel-doc on struct nbl_dispatch_ops says the mailbox queue
  must be torn down before nbl_res_remove_leonis(), via…
- [Low] The concern was that when cfg_msix_map, set_mailbox_irq or
  destroy_msix_map fails with a lost ACK or timeout, the hardware stays…
- [Low] The concern was that on the control PF, local cfg_msix_map
  (reconfigure) and destroy_msix_map turn off the function's own mailbox…

--

net/nebula-matrix: dispatch: add mailbox RPCs for msix map, mailbox irq and vsi/eth id

This patch adds request and response handlers for five dispatch
operations: cfg_msix_map, destroy_msix_map, set_mailbox_irq, get_vsi_id
and get_eth_id. A control PF calls the resource helpers locally, and a
has_net PF forwards the op to the management PF over the mailbox channel.
The five responders are registered with the channel layer from
nbl_disp_setup_msg().

> requester can tell a protocol error from a failed operation.  If the
> resource op is not installed the responder answers -EOPNOTSUPP.  A peer

[Severity: Low]
Is this sentence accurate? None of the five responders has an "op not
installed" branch, and none of them sets err = -EOPNOTSUPP. For example,
nbl_disp_chan_cfg_msix_map_resp() calls the resource helper directly:

	ret = nbl_res_intr_cfg_msix_map(disp_mgt->res_mgt, src_id, ...);
	/* Forward the resource errno verbatim to the requester */
	if (ret)
		err = ret;

When the resource layer can't serve the request, the helpers return
-EINVAL:

nbl_res_intr_destroy_msix_map() {
	if (!intr_mgt)
		return -EINVAL;
    ...
}

On these paths, -EOPNOTSUPP only comes from nbl_res_func_id_to_bdf(),
where it means the func_id is not a PF present on this board.

If a msg_type has no registered handler, nbl_chan_recv_msg() logs an
error and returns without sending an ACK. The requester then times out
and never sees -EOPNOTSUPP:

	msg_handler = xa_load(&chan_mgt->handler_xa, msg_type);
	if (!msg_handler || !msg_handler->func) {
		dev_err_ratelimited(dev,
				    "No handler for msg_type: %u (srcid=%u, msgid=%u)\n",
				    msg_type, srcid, msgid);
		return;
	}

If nbl_disp_setup_msg() fails, nbl_disp_init() fails the probe, so the
device can never run with an op that is not installed. This is still
true at the end of the series.

Should this sentence be dropped, or is the -EOPNOTSUPP behaviour meant
to be implemented?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> index 58f6ac8343852..d256394a5cbb1 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c

[ ... ]

> @@ -17,6 +174,326 @@ static int nbl_disp_init_module(struct nbl_dispatch_mgt *disp_mgt)
>  	return nbl_res_chip_init_module(disp_mgt->res_mgt);
>  }
>  

[ ... ]

> +/*
> + * Precondition: caller must disable mailbox IRQ_RDY and switch send_msg
> + * to the polling path before issuing this RPC. The responder rewrites
> + * the requester's mailbox MSI-X routing during the resource op, so the
> + * ACK cannot rely on interrupt wakeup while routing is in flux.
> + */
> +static int
> +nbl_disp_chan_cfg_msix_map_req(struct nbl_dispatch_mgt *disp_mgt,
> +			       u16 num_net_msix, u16 num_others_msix,
> +			       bool net_msix_mask_en)
> +{

[ ... ]

> +	nbl_chan_fill_send_info(&chan_send, common->mgt_pf,
> +				NBL_CHAN_MSG_CONFIGURE_MSIX_MAP,
> +				&param, sizeof(param),
> +				NULL, 0, 1);
> +	ret = chan_ops->send_msg(disp_mgt->chan_ops_tbl->priv, &chan_send);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}

[Severity: Low]
Suppose send_msg() returns -ETIMEDOUT because the ACK was lost. Could
the responder already have committed the new map in
nbl_res_intr_cfg_msix_map() and armed the hardware? This helper only
passes the error up, so undoing the change is left to the caller. The
set_mailbox_irq and destroy_msix_map requests have the same issue.

Nothing calls these helpers in this patch. Later in the series,
"net/nebula-matrix: add common dev start/stop operation" handles this.
nbl_dev_start() jumps to err_destroy_map on any cfg_msix_map, get_vsi_id
or get_eth_id failure, and that path always calls
nbl_dev_destroy_msix_map(). A failed set_mailbox_irq enable goes through
err_free_irq -> err_destroy_map. So this looks resolved by the end of
the series.

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h
> index c90dd4e119160..f73d32ec2c8a9 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h

[ ... ]

> @@ -31,16 +32,54 @@ enum {
>   *               mailbox DMA before calling it.
>   *               Returns void.  Control-PF exclusive, same NULL rule as
>   *               @init_module.
> + * @cfg_msix_map: configure function msix mapping table.  On a non-control
> + *               PF this is an RPC, and the caller must have cleared
> + *               NBL_CHAN_IRQ_RDY and switched the channel to its polling
> + *               send path first: the responder rewrites this function's
> + *               mailbox MSI-X routing, so the ACK cannot depend on the
> + *               interrupt being reprogrammed.
> + * @destroy_msix_map: tear down msix mapping resource.  Same caller
> + *               precondition as @cfg_msix_map.

[Severity: Low]
As written, the IRQ_RDY/polling precondition seems to apply only to a
non-control PF. On the control PF, nbl_disp_cfg_msix_map() and
nbl_disp_destroy_msix_map() call the resource layer directly.

A reconfiguration (had_config) in nbl_res_intr_cfg_msix_map() turns off
the function's own mailbox routing and does not restore it:

	if (had_config) {
		...
		ret = __nbl_res_intr_set_mailbox_irq(intr_mgt, res_mgt, func_id,
						     0, false);

Destroy does the same. If NBL_CHAN_IRQ_RDY were still set at that point,
could the control PF stop receiving mailbox interrupts?

This isn't reached anywhere in the series:

- The control PF's only cfg_msix_map is the first configuration in
  nbl_dev_start(), where had_config is false.
- Its destroy_msix_map runs in nbl_dev_stop() after
  nbl_dev_disable_mailbox_irq() has cleared IRQ_RDY.
- When a peer is reconfigured, nbl_dev_start() calls
  set_mailbox_irq(true) to re-arm routing before IRQ_RDY is set.

Could the kernel-doc say that the precondition also applies to the local
path? It could also say that mailbox routing stays disabled until
set_mailbox_irq() re-arms it.

[ ... ]

>   * These callbacks are not dispatch-layer setup/teardown: the dispatch
> - * structures are devm-allocated in nbl_disp_init(), and nbl_disp_remove()
> - * only documents why no explicit teardown is needed. They forward
> + * structures are devm-allocated in nbl_disp_init(), so nbl_disp_remove()
> + * has nothing to undo. The five responders registered by
> + * nbl_disp_setup_msg() live in the channel layer's handler xarray and go
> + * away with it, so they need no explicit unregistration either. Nothing
> + * can enter them until a mailbox queue is running, and a queue must be
> + * torn down before nbl_res_remove_leonis() runs: nbl_chan_teardown_queue()
> + * stops the RX path and nbl_chan_remove_common() frees the handler nodes,
> + * so once the resource layer starts disappearing there is no responder
> + * left that could still be running, or be entered. They forward

[Severity: Low]
This isn't a bug, but the ordering described here doesn't match
nbl_core_remove(). The handler nodes are freed after the resource layer
is removed:

void nbl_core_remove(struct nbl_adapter *adapter)
{
	nbl_disp_remove(adapter);
	nbl_res_remove_leonis(adapter);
	nbl_chan_remove_common(adapter);
	nbl_hw_remove_leonis(adapter);
}

Also, nothing calls ->teardown_queue in this patch.

The RX-stop part does hold at the end of the series.
"net/nebula-matrix: add common/ctrl dev init/remove operation" makes
nbl_dev_remove() the first step of nbl_core_remove(). That path calls
nbl_dev_remove_common_dev()->nbl_dev_remove_chan_queue()->teardown_queue()
before nbl_res_remove_leonis() runs.

Could the comment be reworded so it doesn't say nbl_chan_remove_common()
runs before nbl_res_remove_leonis()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
