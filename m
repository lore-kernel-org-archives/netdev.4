Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438329;
	b=xljBhIjn5lKHGw4QAz3UFAlTNZgjahXmX6en461PFt6T6gc539yUcLF/kt1tdIAGPFKG
	 7dFO5gCHs+6WpkUPI/u24hqD6RTIY+VW+MOpLyfaOjX8MamYrG7STkf11/U6APIz3Dkbb
	 Ec92fG8OY7X1sfxnhIXsgmQb9JDdHuF6jSO+eTkFoxbFTKFvxPzCiq+e9QC5Z1am9thPU
	 yoXx2USQfZkquGA8NuucJ/M9NM3wMgZhrDf+MN5MgX5qPcTHryrEXcaHWhgrTp6dN5WwS
	 pXqqFg1TPu4HNp7A31kAkQeo/0VNcaPwWZcc2Yo15roGIaEM3RDCaAI7nmgQQq57+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438329;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gbcv55uyjw0fopltdaiw4Q0dqBwFdcRA0KznAqN+vss=;
	b=5tw+J7k0UclZMBdpjajkEPcMnRQ10CnoQI7pgXIAWTtEzd/j4y22fCJAAgtTk7nZoYqb
	 08bUGTsta79DjuyfWkwamgViiMl0l+Y9yGAtQRP/Q4mMdIRKhdo9ANZ/Sa0NgGVTqN2qr
	 JUiJaM/5rR/PAyTriBBeG9u5jzXdVOzuZqHNWVZV+tsMp6lW4EWcgjKN//RCcddMOzaNA
	 81uLCXW84Aqzs20aZoqnzj/HYyB5ivGBF2NIFdcJTA4UAsL4tLrG/Xno9R2wDM/dsjvF3
	 oK636v+9J1P/5XvFdPiG+9q3LXazxqecncQNnPEYRThGsOQIiMgEHH18ZroagxuBvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViJiiLtg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416CE606A33F;
	Mon, 23 Nov 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViJiiLtg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523E61F00AE3;
	Mon, 23 Nov 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438328;
	bh=gbcv55uyjw0fopltdaiw4Q0dqBwFdcRA0KznAqN+vss=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ViJiiLtgu0Q+GAhfsfdE/dEoNjpbPQo1K0aFrbFS2ocRJfiFrUyC1pNnxMXiMYPyA
	 NRH4ULBDEYXr3liT6lT6Fivb/7w/SDocuDjou23bG9hrz+YCt5hqlRfmUhd0zBWTRD
	 HOKJt2hpLiE2LfYy2zaQXvgwKQzbuFKcEMU2dvZB2T2LhXVTE7EtKvNzJ1qR+29Bnw
	 9R4XM9WqpxCMM8q4i68AB+zB/63wTAffjqYNN9P3qIBlNtgZ1GaJW2gIbZa0lSF6C1
	 lERUlebCtt+kPCHjiXIMqS0fooIuq+7KFaWvSq2iPVXUcyxfM0Fbf3rmMp7GHuOpoO
	 vaPLhFZ+IWECw==
Subject: Re: [PATCH v35 net-next 7/8] net/nebula-matrix: add common/ctrl dev
 init/remove operation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:07 +0000
Message-ID: <179543832792.3135.10347904080978998972@kernel.org>
In-Reply-To: <20261119113530.32107-8-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-8-illusion.wang@nebula-matrix.com>
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

- [Medium] nbl_core_init() turns on Bus Master Enable (pci_set_master(),
  nbl_main.c line 68) before anything quiesces the mailbox TX/RX…
- [Low] The comment and the extra pci_clear_master() in the
  nbl_core_init() error branch of nbl_probe()…
- [Low] Two comments describe the remove path in an order that
  nbl_core_remove() does not follow.

--

net/nebula-matrix: add common/ctrl dev init/remove operation

This adds nbl_dev_init() and nbl_dev_remove(). They set up the mailbox
clean work and channel queue, and on the control PF they also program
the mailbox QINFO routing and run init_module. The patch wires them into
nbl_core_init()/nbl_core_remove() and moves pci_set_master() from
nbl_probe() into nbl_core_init(), just before nbl_dev_init().

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> index d256394a5cbb1..2d015ba6f5311 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> @@ -599,5 +599,25 @@ int nbl_disp_init(struct nbl_adapter *adapter)
>  
>  void nbl_disp_remove(struct nbl_adapter *adapter)
>  {
> -	/* Dispatch structures are allocated via devm */
> +	/*
> +	 * Dispatch structures are devm-allocated and freed at detach.
> +	 *
> +	 * The five responders registered by nbl_disp_setup_msg() are
> +	 * owned by the channel layer (xarray of handlers) and are never
> +	 * unregistered here. This is safe because the teardown order
> +	 * guarantees no responder can run after this point:
> +	 *
> +	 *   mailbox teardown
> +	 *     -> cancel_work_sync(clean_mbx_task)   // drain RX work
> +	 *     -> nbl_chan_teardown_queue()          // stop HW queue,
> +	 *                                                 // join clean task,
> +	 *                                                 // active=false
> +	 *     -> nbl_chan_remove_common()
> +	 *          -> nbl_common_destroy_wq()            // no new work
> +	 *          -> nbl_chan_remove_msg_handler()      // free handler nodes
> +	 *
> +	 * By the time devres frees disp_mgt, the mailbox queue is stopped
> +	 * and the handler xarray is empty, so no responder can touch
> +	 * res_mgt->intr_mgt after nbl_intr_mgt_stop() has cleared it.
> +	 */

[Severity: Low]
Is this the order nbl_core_remove() actually uses? The comment concludes
that the handler xarray is empty, so no responder can touch
res_mgt->intr_mgt after nbl_intr_mgt_stop() has cleared it.

Here is nbl_core_remove() after this patch:

	nbl_dev_remove(adapter);
	nbl_disp_remove(adapter);
	nbl_res_remove_leonis(adapter);
	nbl_chan_remove_common(adapter);

nbl_res_remove_leonis()->nbl_intr_mgt_stop() sets res_mgt->intr_mgt to
NULL. That happens before nbl_chan_remove_common() calls
nbl_common_destroy_wq() and nbl_chan_remove_msg_handler(). So at that
point all five responders are still in the handler xarray, and
common->wq still exists.

What actually keeps responders from running is the stopped mailbox queue
in nbl_chan_teardown_queue(): shutdn, RX QUEUE_RST and the cancelled
clean_task. Nothing breaks today.

The struct nbl_dispatch_ops kernel-doc in nbl_def_dispatch.h makes the
same claim:

 * torn down before nbl_res_remove_leonis() runs: nbl_chan_teardown_queue()
 * stops the RX path and nbl_chan_remove_common() frees the handler nodes,
 * so once the resource layer starts disappearing there is no responder
 * left that could still be running, or be entered.

Could both comments be changed to describe the real order? They are
unchanged at the end of the series.

>  }
> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> index db863f9ecfdfd..e5da5581185a7 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c

[ ... ]

> @@ -53,7 +54,27 @@ struct nbl_adapter *nbl_core_init(struct pci_dev *pdev,
>  	ret = nbl_disp_init(adapter);
>  	if (ret)
>  		goto out_res_remove;
> +
> +	/*
> +	 * Arm bus mastering before nbl_dev_init() hands the mailbox queues
> +	 * to the hardware: it writes the ring addresses, sets QUEUE_EN and
> +	 * rings the RX tail doorbell, and the device cannot fetch those
> +	 * descriptors with Bus Master Enable clear - nothing re-kicks the
> +	 * queue afterwards.  This is the first point where it is safe to
> +	 * turn it on, because the MSI-X map scrub that must run with DMA
> +	 * off (nbl_intr_setup_mgt(), called from nbl_res_init_leonis()
> +	 * above) has already completed; see the comment in nbl_probe().
> +	 */
> +	pci_set_master(pdev);

[Severity: Medium]
Can a mailbox queue that a previous kernel left enabled start DMAing as
soon as bus mastering is turned on here?

This comment only covers the FUNCTION_MSIX_MAP scrub. The mailbox TX/RX
QINFO_CFG entries (ring base, size and QUEUE_EN) are the same kind of
state. They survive kexec, or an unload that never reached
deinit_module(), and there is no .shutdown callback.

During probe, QUEUE_RST is not asserted until later:

nbl_dev_init()
  nbl_dev_setup_common_dev()
    nbl_dev_setup_chan_queue()
      nbl_chan_setup_queue()
        nbl_chan_init_queue()        <- coherent ring/buffer allocations
        nbl_chan_config_queue(tx)
          nbl_hw_config_mailbox_txq()
        nbl_chan_config_queue(rx)
          nbl_hw_config_mailbox_rxq()

The RX entry is only reset after the TX entry has been reprogrammed.

Before this point, the only stale-state handling is
nbl_hw_clear_stale_status():

- it runs only on the control PF
- it runs only when driver_status is still set
- it then sleeps 2-3ms while firmware reclaims the state asynchronously

The comment above NBL_FW_CLEANUP_SYNC_MIN_US says:

  A firmware pass that takes longer than this window - an ECPU still busy
  right after kexec, say - can therefore still race a later probe.

Suppose that reclaim has not finished, or does not cover an entry.
Before QUEUE_RST lands, could the device then do any of these?

- fetch stale TX descriptors
- write an incoming message into an old RX buffer address
- write descriptor USED flags into memory the new kernel now owns

Would it make sense to assert QUEUE_RST and clear the base of both
mailbox QINFO_CFG entries before pci_set_master()? That is what
nbl_hw_stop_mailbox_rxq()/txq() do, with the read-back flush, and it is
MMIO only, so it does not need bus mastering.

> +
> +	ret = nbl_dev_init(adapter);
> +	if (ret)
> +		goto out_clear_master;
>  	return adapter;
> +
> +out_clear_master:
> +	pci_clear_master(pdev);
> +	nbl_disp_remove(adapter);
>  out_res_remove:
>  	nbl_res_remove_leonis(adapter);
>  out_chan_remove:

[ ... ]

> @@ -281,17 +305,21 @@ static int nbl_probe(struct pci_dev *pdev,

[ ... ]

>  	adapter = nbl_core_init(pdev, &param);
>  	if (IS_ERR(adapter)) {
>  		dev_err(dev, "Nbl adapter init fail: %pe\n", adapter);
> +		/*
> +		 * nbl_core_init() enables bus mastering before its last
> +		 * step, which is the one that failed.
> +		 */
> +		pci_clear_master(pdev);

[Severity: Low]
Is this comment accurate? Five of the failure exits in nbl_core_init()
return before pci_set_master() runs:

- devm_kzalloc_obj()
- nbl_hw_init_leonis()
- nbl_chan_init_common()
- nbl_res_init_leonis()
- nbl_disp_init()

The one remaining exit is an nbl_dev_init() failure. nbl_core_init()
already clears bus mastering for it at its own out_clear_master label:

out_clear_master:
	pci_clear_master(pdev);
	nbl_disp_remove(adapter);

So this pci_clear_master() either clears a bit that was never set or
clears it a second time. That is harmless at runtime, but the comment
suggests nbl_probe() owns the bus master unwind for nbl_core_init().

Could the comment and the extra call be removed? They are still present
at the end of the series.

>  		return PTR_ERR(adapter);
>  	}
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
