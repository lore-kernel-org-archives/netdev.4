Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676454;
	b=nUgiapA3UU/ja6KncNgyR0uRj0FM07OzZy46F6UMLben+2Nw3rCYdaNuMXrcVrOYmLPQ
	 o2k80Oybe2M6QDTtq8KOvyLEmImFv+GgWUElav1DozBlZhdwFMwyOacSZzSWUuTgZiDDP
	 FZ9251StqDyHeiOVvtgIFX+rTBobC/k6k2OsEevXqElJoTV4XRcTN6eETANWRrb2uv15g
	 CBvSHtbXnYNB04byF5CST9YJeCvGyeJAPHYY5pC4AhvWL8ggW+oe0/rkruPAHsROoHsH8
	 vuToAVV9ilME0p113zrPQD90OOmAiVEjzH9Pr/Dp5O5p6LqQoixpCh6gCwvoLuymW8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676454;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5egdyMUL//oHT60ACbwW69GJ0v66WMLNl92315/6tfM=;
	b=hiqehImubuv/KJjQiHiXDdn6HbgsZ8tviIb4KuBJ/HiP4UnwfjEUUtA0kxyeTu2Nt1CV
	 zQ0gcrHO3KRdRh3y25eMEkiAzm43CWLzYK6d73JBxhgWrWWAy5+YjCxyGC4yAhG7xhUVe
	 eRfNo2L+kNXyR4lMyX4JWbWWVAP2isyO+FOf1iQRcBUePNzaVNv4KKa8GB7FNLE9eB6HS
	 UazMCCFuHDxlB6/modWlRQAB+bniyi+NmXcNoNmOGAJ7JtaM0d2zV3aLOvku0qdc5u1a3
	 wabj4oUcRmO6PP/sffSBgFOMkhbXcA4oG/vf4HxIYPpF9KFkXmWRe3YO1X+4cnGdf6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefzDLSe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9347606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefzDLSe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A731F000D3;
	Thu, 26 Nov 2026 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676453;
	bh=5egdyMUL//oHT60ACbwW69GJ0v66WMLNl92315/6tfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EefzDLSeGQmRXjNH7bKZMx/eLlYDedDH9dSaFpEM38KInYGJfMElSeNEC0X769AHQ
	 Urw6WkzfZEwg/lpZbUdPOJStvdglzfOx0L3YZ0gobMN3+jTsN3vrp2aN42zOP7UDUM
	 b1/WNNGfLA+6vEk78XxhqBCqQ+BArIrTUXMDpvcZq572ze4CX8RwIsQCYn8kH4iiXz
	 5FNBqxKNkS6IR19HTgHYa7NOpWBfHO8jjhpqYHaXUalyBNdHCl8JOaKO1D1knCLAkv
	 TegyAiYPpZGLaDi+Me8tf6wL1+CQW21deRk6JcDimiNeSya7f3pWjja+LPABvLWCrj
	 UTuyFCcX4wayg==
Subject: Re: [PATCH net] octeontx2-pf: QOS: Don't free SQ memory if disabling
 the SQ fails
From: netdev-bot+sashiko@kernel.org
To: oss.patchbox@gmail.com
Cc: sgoutham@marvell.com, gakula@marvell.com, rkannoth@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, hkelam@marvell.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 jacob.e.keller@intel.com, netdev@vger.kernel.org
Date: Thu, 26 Nov 2026 07:00:52 +0000
Message-ID: <179567645260.3135.1714589619526936893@kernel.org>
In-Reply-To: <20261124190046.415260-2-oss.patchbox@gmail.com>
References: <20261124190046.415260-2-oss.patchbox@gmail.com>
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] If otx2_qos_ctx_disable() fails, the new early return in
  otx2_qos_disable_sq() (qos_sq.c:316-322) leaves all the queue state in…
- [Low] The commit message says otx2_free_hw_resources() frees the kept
  memory 'after the SQ and NPA contexts of the whole LF have been…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  otx2_qos_sq_free_sqbs() (qos_sq.c:116-148), called on every successful…

--

octeontx2-pf: QOS: Don't free SQ memory if disabling the SQ fails

This patch makes otx2_qos_disable_sq() check the return value of
otx2_qos_ctx_disable(). If the AF mailbox request fails, it now logs an
error and returns without freeing the SQBs, the pool stack and the aura
flow-control buffer, which the hardware may still reference.

> If the disable fails, log an error and keep the memory: leaking it is
> safer than freeing memory the hardware may still access. If the queue
> is not set up again, otx2_free_hw_resources() frees it later with the
> other queues when the interface goes down, after the SQ and NPA
> contexts of the whole LF have been disabled.

[Severity: Low]
Is this ordering accurate? otx2_free_hw_resources() calls
otx2_free_sq_res(). That function frees the SQB pages of every queue,
QoS queues included, right after a best-effort SQ disable:

drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:otx2_free_sq_res() {
    ...
	/* Disable SQs */
	otx2_ctx_disable(&pf->mbox, NIX_AQ_CTYPE_SQ, false);
	/* Free SQB pointers */
	otx2_sq_free_sqbs(pf);
    ...
}

otx2_ctx_disable() returns void and only logs a mailbox failure. The NPA
pool and aura contexts are disabled later, in otx2_free_hw_resources():

	/* Disable NPA Pool and Aura hw context */
	otx2_ctx_disable(mbox, NPA_AQ_CTYPE_POOL, true);
	otx2_ctx_disable(mbox, NPA_AQ_CTYPE_AURA, true);
	otx2_aura_pool_free(pf);

So the SQB pages are freed before the NPA contexts are disabled. Only
pool->stack and pool->fc_addr are freed after that. If the AF mailbox is
still broken at ifdown, the memory kept by this patch gets freed anyway,
with no check of the result.

Could the commit message be reworded to match this?

> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
> index 683efce519af0..e9ca884cfb4d5 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c

[ ... ]

> @@ -311,8 +311,16 @@ void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
>  	otx2_cleanup_tx_cqes(pfvf, cq);
>  
>  	mutex_lock(&pfvf->mbox.lock);
> -	otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
> +	err = otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
>  	mutex_unlock(&pfvf->mbox.lock);
> +	if (err) {
> +		/* The SQ, aura and pool may still be enabled, so don't free
> +		 * the memory they point to.
> +		 */
> +		netdev_err(pfvf->netdev,
> +			   "Failed to disable QoS SQ %d (%d)\n", sq_idx, err);
> +		return;
> +	}

[Severity: Medium]
otx2_qos_disable_sq() still returns void, so callers can't tell that the
disable failed. When the same qid is set up again right afterwards, are
the kept SQB pages and queue buffers leaked?

otx2_qos_enadis_sq() re-enables the qid straight after the disable:

drivers/net/ethernet/marvell/octeontx2/nic/qos.c:otx2_qos_enadis_sq() {
	if (pfvf->qos.qid_to_sqmap[qid] != OTX2_QOS_INVALID_SQ)
		otx2_qos_disable_sq(pfvf, qid);

	pfvf->qos.qid_to_sqmap[qid] = node->schq;
	otx2_qos_txschq_config(pfvf, node);
	otx2_qos_enable_sq(pfvf, qid);
}

otx2_qos_leaf_del() works the same way. It disables node->qid and later
calls otx2_qos_enable_sq(pfvf, qid) for the moved leaf.
otx2_qos_leaf_to_inner() and otx2_qos_leaf_del_last() pass the qid to a
child or parent. That node is then enabled through
push_txschq_cfg()->otx2_qos_enadis_sq().

The setup path overwrites the kept pointers without checking them:

drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c:otx2_qos_sq_aura_pool_init() {
    ...
	sq->sqb_count = 0;
	sq->sqb_ptrs = kzalloc_objs(*sq->sqb_ptrs, num_sqbs);
    ...
}

In the same way, otx2_pool_aq_init() always calls qmem_alloc() for
pool->stack. otx2_sq_init() also reallocates sq->sqe, sq->sqe_ring,
sq->cpt_resp and sq->sg.

After that, the old SQB pages stay DMA mapped and keep their page
references. The old qmem buffers are never freed, because
otx2_free_hw_resources() only sees the new pointers. pool->fc_addr is
fine, since otx2_aura_aq_init() reuses it when it is non-NULL.

With default ring sizes this comes to roughly 2 MiB each time. The
commit message only covers the case where the queue is not set up again.
In the common callers the queue is set up again in the same call.

Could otx2_qos_disable_sq() return the error so callers can avoid
reusing the qid? Alternatively, otx2_qos_enable_sq() could refuse, or
retry the disable and free first, while sq->sqb_ptrs is still set.

>  
>  	otx2_qos_sq_free_sqbs(pfvf, sq_idx);

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. Does
otx2_qos_sq_free_sqbs() leak sq->sqe_ring and sq->cpt_resp on every
successful disable?

otx2_sq_init() allocates both buffers for every SQ, QoS SQs included,
with no qidx condition. Those allocations came in with commit
6a77a158848a ("cn10k-ipsec: Process outbound ipsec crypto offload").
otx2_qos_sq_free_sqbs() frees the other buffers and then clears the
struct:

drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c:otx2_qos_sq_free_sqbs() {
    ...
	qmem_free(pfvf->dev, sq->sqe);
	qmem_free(pfvf->dev, sq->tso_hdrs);
	kfree(sq->sg);
	kfree(sq->sqb_ptrs);
	qmem_free(pfvf->dev, sq->timestamps);

	memset((void *)sq, 0, sizeof(*sq));
}

The only other place that frees them is otx2_free_sq_res(). It only does
so when sq->sqe is set, and the memset above has already cleared it:

		if (sq->sqe) {
			qmem_free(pf->dev, sq->sqe);
			qmem_free(pf->dev, sq->sqe_ring);
			qmem_free(pf->dev, sq->cpt_resp);

The qmem buffers come from otx2_dma_alloc_coherent(), which uses
kzalloc() and dma_map_single(), so they are not devm managed.

With the default sqe_cnt of 4096, each HTB leaf delete, leaf-to-inner,
leaf delete-last, or re-config through otx2_qos_enadis_sq() would leak
about 1 MiB for sqe_ring and 256 KiB for cpt_resp, plus their DMA
mappings. This happens on the normal success path and can be repeated.

>  	otx2_qos_aura_pool_free(pfvf, pool_id);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124190046.415260-2-oss.patchbox%40gmail.com
