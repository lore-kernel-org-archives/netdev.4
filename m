Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011215;
	b=vlXhawbh+6FX1+NHH/D+/rLjRsVawBsw7IA4qkPt0cgFkt4KkPiAZbgSEdHM/NjowuWY
	 9mHHLibj0uUbOMZ5sWAB6zCwTO7bJY02n/lB50y//8cZZmVM/RADY08SAq/dkKA4/jopK
	 K3n2OKjpkKCZmPUMbq12Pq4+eN4aCQ46LRddutEBikh8ntZyvBRn2+0hv0v678cUOfHkd
	 9aExWnofvXnpxf6BJTOJFCdaZIbeel4puEQXu1BLdqMm2bw4kCd/+WKyDlTGVIkDzkW7f
	 V9czSFUYw1e9bWqC34o4HGDpsdxTUWCO/RpINsJKtuoseLBx9H/QCkdmUSqqTLMcDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011215;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Nm7knwVhQfHseANsuvpG5MUS6IV9swMP+DvaCdvGlvU=;
	b=kT1GXbI90NpiRixYWq4kenPks4u6OJw0cqr7SwNUIx7wBDGt77TIR52uFyeWCasb5FRt
	 tqVje1KxLyUgkFyWs2iueOyuYEqxS3BM1ITr8fUTyrG1ocIkC2KdC3gIi7QgRDPiaJiAY
	 N5cfLw3u0aMRys//X4uey7gUlXGLSjGAdNA6jfmzLMGZ4DhEyy97IOZUzVFqOmvxFtXNx
	 WUW8KqIEmWIw8zIqTWgKSLFdMDsVubgF9weIduJ+YfEY6H4Z4sFRuVRdSA3pOLFzUw3Az
	 5EwjWzlPCpeMa1ypfZ2CYcJL7aw4NG/xvIW8X4tx9BqC5sStQNCgFgskA+q+uxt/HAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ieSuVSdX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A7606A330;
	Wed, 18 Nov 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ieSuVSdX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C579F1F000C4;
	Wed, 18 Nov 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011215;
	bh=Nm7knwVhQfHseANsuvpG5MUS6IV9swMP+DvaCdvGlvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ieSuVSdXVN8BeQNm/tgVz1twPTRdYCxo2LUwMMLa3beCGAxWYQHd+cWS09lgC4UHW
	 EhgBKlw3tpGW59ctyRVTBGYfy/OVrcl2l2Ia7VjHQ8utApakkkLkT0FCJKanVcOlPA
	 SJfc071jr5ch5ypR/0MyjZGCNxR99VfOmAdvmGaOcXAwc1jCMbZBS9GOktqrT34BgG
	 MYe1jF8pjOmcuD/A8xLnknoHZEoDHg4vJReJ5R5xfM+QY9X+ABtmwvfNmQNlK3T5Re
	 unYE6GBsm1JPWrsXURk9qMFy5U5d4AYY7UreXc6mg4tqy99PcgvTa19AoafHt3tlj5
	 CKHR1BJK370Hg==
Subject: Re: [PATCH net] octeontx2-pf: Fix potential use-after-free in
 representor teardown
From: netdev-bot+sashiko@kernel.org
To: liguangshuo@mail.sdu.edu.cn
Cc: sgoutham@marvell.com, gakula@marvell.com, rkannoth@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 14:13:34 +0000
Message-ID: <179501121429.3136.3547762606402557223@kernel.org>
In-Reply-To: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
References: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
X-sashiko-severity: Critical
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

Critical: 1 (1) · High: 0 (2) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The patch is titled "Fix potential use-after-free in
  representor teardown", but rvu_rep_destroy() still frees rep_dev while…

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but
  rvu_rep_setup_tc_cb() copies per-representor pointers into the long-…
- [High] This problem wasn't introduced by this patch, but the flow_cfg
  setup used by representor TC offload has broken locking and error…
- [High] This problem wasn't introduced by this patch, but
  rvu_rep_state_evt_handler() runs from the AF->PF up-mbox work on…

--

octeontx2-pf: Fix potential use-after-free in representor teardown

This patch reorders rvu_rep_destroy() so that rep->flow_cfg is freed
before free_netdev() releases the netdev allocation that holds the
representor private data.

> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> index 0f5d5642d3f7a..662da7fc39536 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> @@ -638,8 +638,8 @@ void rvu_rep_destroy(struct otx2_nic *priv)
>  		rep = priv->reps[rep_id];
>  		unregister_netdev(rep->netdev);
>  		rvu_rep_devlink_port_unregister(rep);
> -		free_netdev(rep->netdev);
>  		kfree(rep->flow_cfg);
> +		free_netdev(rep->netdev);

[Severity: Critical]
Can rep->stats_wrk still be pending when free_netdev() releases the
rep_dev here?

The rep_dev lives in the netdev private area. Nothing in rep.c ever
cancels stats_wrk. rvu_rep_get_stats64() re-arms it on every stats read:

drivers/net/ethernet/marvell/octeontx2/nic/rep.c:rvu_rep_get_stats64() {
    ...
	schedule_delayed_work(&rep->stats_wrk, msecs_to_jiffies(100));
}

The unregister_netdev() call just above seems to arm it too:

unregister_netdev()
  unregister_netdevice_many_notify()
    rtmsg_ifinfo_build_skb(RTM_DELLINK, ...)
      dev_get_stats()
        rvu_rep_get_stats64()
          schedule_delayed_work(&rep->stats_wrk, ...)

When the timer fires about 100ms later, rvu_rep_get_stats() would run on
the freed allocation:

	rep = container_of(del_work, struct rep_dev, stats_wrk);
	priv = rep->mdev;

	mutex_lock(&priv->mbox.lock);
	...
	stats = &rep->stats;
	stats->rx_bytes = rsp->rx.octs;

It reads rep->mdev from freed memory, takes a mutex through that pointer,
and writes into rep->stats. The timer embedded in the delayed_work also
stays linked in the timer wheel after the free.

This can happen on devlink eswitch mode set to legacy, PCI remove, or
module unload, for any representor that has RVU_REP_VF_INITIALIZED set.
After a module unload, the handler could also run after the module text
is gone.

The error unwind in rvu_rep_create() has the same pattern:

	while (--rep_id >= 0) {
		rep = priv->reps[rep_id];
		unregister_netdev(rep->netdev);
		rvu_rep_devlink_port_unregister(rep);
		free_netdev(rep->netdev);
	}

This patch targets a use-after-free of the rep private data in this loop.
Should it also add cancel_delayed_work_sync(&rep->stats_wrk) before
free_netdev() in both teardown paths?

>  	}
>  	kfree(priv->reps);

[Severity: High]
This isn't a bug introduced by this patch, but can
rvu_rep_state_evt_handler() still run against the freed reps here?

It runs from the AF->PF up-mbox work on pf->mbox_wq:

otx2_mbox_up_handler_rep_event_up_notify()
  rvu_event_up_notify()
    rvu_rep_state_evt_handler()

It looks up the rep and does a read-modify-write without a lock:

	rep = priv->reps[rep_id];
	if (info->evt_data.vf_state)
		rep->flags |= RVU_REP_VF_INITIALIZED;
	else
		rep->flags &= ~RVU_REP_VF_INITIALIZED;

rvu_rep_destroy() frees each rep with free_netdev() and then frees
priv->reps. It does not flush pf->mbox_wq, does not clear priv->reps, and
shares no lock with that handler.

rvu_eswitch_config(priv, false) doesn't seem to order this either. On
the AF side, the NIX LF start/stop handlers check rvu->rep_mode without
synchronization and send the PFVF_STATE up message without waiting for a
response. rvu_mbox_handler_esw_cfg() also updates rep_mode without
synchronization.

Suppose a VF's NIX LF starts or stops while the eswitch is being switched
to legacy or the device is being removed. Could the handler then read the
freed priv->reps array and modify flags in a freed rep_dev?

>  	rvu_rep_rsrc_free(priv);

[Severity: Critical]
This is a pre-existing issue, but are priv->netdev and priv->flow_cfg
left dangling after the loop above?

rvu_rep_setup_tc_cb() copies the per-representor pointers into the
representor PF's otx2_nic:

	priv->netdev = rep->netdev;
	priv->flags = rep->flags;
	priv->pcifunc = rep->pcifunc;
	priv->flow_cfg = rep->flow_cfg;

Nothing restores or clears these fields, and the loop frees both objects.
Several paths use the stale pointers afterwards.

The first is in rvu_rep_destroy() itself, when SQEs are still pending:

rvu_rep_rsrc_free()
  otx2_free_hw_resources()
    otx2_free_pending_sqe()
      txq = netdev_get_tx_queue(pfvf->netdev, sq_idx);
      netdev_tx_completed_queue(txq, tx_pkts, tx_bytes);

This writes into the TX queue array that free_netdev() already freed.

The second is devlink. The params stay registered after the switch to
legacy mode. otx2_dl_mcam_count_get() and otx2_dl_ucast_flt_cnt_get()
read the freed flow_cfg, and otx2_dl_mcam_count_set() writes to it:

	pfvf->flow_cfg->ntuple_cnt = ctx->val.vu16;
	otx2_alloc_mcam_entries(pfvf, ctx->val.vu16);

DEVLINK_CMD_PARAM_GET doesn't require GENL_ADMIN_PERM, so any user can
trigger the reads.

The third is switching back to switchdev. That goes through
rvu_rep_create()->rvu_rep_rsrc_init()->otx2_init_hw_resources()->
otx2_pool_aq_init(), which does:

	pp_params.netdev = pfvf->netdev;
	pool->page_pool = page_pool_create(&pp_params);

page_pool_list() then does hlist_add_head() into the freed
netdev->page_pools and sends a netlink event for the freed net_device.

Should this teardown also clear priv->netdev, priv->flow_cfg and the
copied flags?

[Severity: High]
This is a pre-existing issue, but the flow_cfg freed above is set up by
rvu_rep_mcam_flow_init(), which seems to have locking and error handling
problems.

rvu_rep_mcam_flow_init() sends NPC_MCAM_ALLOC_ENTRY messages without
holding priv->mbox.lock, and then always unlocks it:

	if (allocated)
		sort(&rep->flow_cfg->flow_ent[0], allocated,
		     sizeof(rep->flow_cfg->flow_ent[0]), mcam_entry_cmp, NULL);

	mutex_unlock(&priv->mbox.lock);

Neither this function nor rvu_rep_setup_tc_cb() takes the mutex. Lockdep
would report a bad unlock balance on the first flower setup.

Without lockdep, can this release the mutex while another user holds it,
such as the rvu_rep_get_stats() worker, rvu_rep_notify_pfvf() or
rvu_eswitch_config()?

The caller also ignores the return value:

	if (!(rep->flags & OTX2_FLAG_TC_FLOWER_SUPPORT))
		rvu_rep_mcam_flow_init(rep);
	...
	priv->flow_cfg = rep->flow_cfg;

If the kzalloc fails, rep->flow_cfg is NULL. If the flow_ent kcalloc
fails, the early return skips INIT_LIST_HEAD() on flow_list and
flow_list_tc.

otx2_tc_add_flow() checks OTX2_FLAG_TC_FLOWER_SUPPORT, but
otx2_tc_del_flow() and otx2_tc_get_flow_stats() do not. Both reach
otx2_tc_get_entry_by_cookie(), which walks flow_cfg->flow_list_tc. Can
that dereference a NULL or uninitialized list head?

Finally, the flower support flags are only set when allocated is non-zero.
If the AF allocates no MCAM entries, every later TC callback re-runs the
init and overwrites rep->flow_cfg. Does that leak the previous flow_cfg
and flow_ent each time? The FLOW_CLS_STATS callbacks from filter dumps
don't need CAP_NET_ADMIN.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-c29ba55625-net-otx2-representor%40mail.sdu.edu.cn
