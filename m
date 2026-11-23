Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424940;
	b=Xih87aSpLAQz8P1akhyCo0isZMBVa51eoamq6EaBTlQYjoWuBFsn5mcKWCKUkVOwey0j
	 CFQ4Bxrd/TqcVwaMoBQxlTBHG94DZ8B/m0y8bysSz8C8hPgA3pneW1NwetZnpbir9DpQv
	 3s3Xw6dnaJ8qOSXu3Vyng7pTaBIqqgFdojoEpjZLXOlO6H1S7/qdwghyAu+IZLIEKoRL8
	 rcw0vFKr9CrdWZ4Zb8Ywa/Z3TsAEQNd1vbs3KcLBnPoUmMempUlgp34n3nzUvHfri/cvR
	 0fE5Y5tEtcP7UxkXvtaLxZC737o1LNDmF/zEqjgLr66L3EXyQ3uPSMjwwxnG0G4mIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424940;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mzrtJAbMobTpGy8WHIthTQipMFymKA52iLtSYNRDZ0k=;
	b=SUGL6ZqUfFsAlPWPgqnRp0g3ODtmTmkwBvYOLwNNYT3FaGP0ZBB8ERNvv7jiVnZn89qD
	 yoMzotApjdmrfW+FzhkhzzzUA4xJL9WyVTfbOMHNVb+hjtLfZiTEseT2Ph9zhaXgnF75U
	 Y22NSwPjLO/yTrmYo/ZwL85UHmD4qFxNVCwVqmkNem5T7LlX2CRtaeHrOA1RJwZay7aXV
	 Oh0O4qyvYs0cd8Uxt+orK/P9kmoc/0f5Jh4yDYC8ycNJi1alC4yVJY3wzMcz2oIrVGkYW
	 /ngarVQTUbjShNHIPMD/axXW8qxbQgtQVSOYFobULSAMnLukRfqq5eE67GdtlnWCx/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVEjSOrb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E3606A332;
	Mon, 23 Nov 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVEjSOrb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664411F000C0;
	Mon, 23 Nov 2026 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424940;
	bh=mzrtJAbMobTpGy8WHIthTQipMFymKA52iLtSYNRDZ0k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AVEjSOrbaxkYkqXb/u7ef3ouiCkwOim/ry4Rt07CGyD/ztTzQHf/sDa4nVf5itTYT
	 UqFM3XMn1xTSa8MaR+7DN8a667o5yD8RwvcE35mOUYsiaDBex5JnNO41e9Xwq98mWU
	 SSGg3k4j9g9w7RfTVFeAkBNavrOvhaOROyDLDaj/Ik3YG2K1AkXvVyfrB9TC5AgA8s
	 YeYftG+pKLc7YlpB2OqwwaGsUQ0+D8fbGfZEoqfhL2+6ea/Oka5rQKiHKJ5StBBysK
	 pb/65zrGjMdVgq4TV998Ee3cxjvrzNACh0kwhwy7jAdzZ4JBDErN9JacxOAb6pxbr/
	 BACwmbqyIqDbA==
Subject: Re: [PATCH net v4] octeontx2-af: Fix BPID leaks in NIX backpressure
 enable/disable
From: netdev-bot+sashiko@kernel.org
To: nshettyj@marvell.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 rkudurumalla@marvell.com, sgoutham@marvell.com, rkannoth@marvell.com,
 gakula@marvell.com, sbhatta@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 09:08:58 +0000
Message-ID: <179542493892.3135.7516887793037759713@kernel.org>
In-Reply-To: <20261119085434.2598197-1-nshettyj@marvell.com>
References: <20261119085434.2598197-1-nshettyj@marvell.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new channel range checks in nix_bp_disable()
  (rvu_nix.c:672-677) and nix_bp_enable() (rvu_nix.c:822-827) validate…
- [Medium] nix_bp_enable() (rvu_nix.c:832-857) still leaks an LBK BPID
  whenever NIX_BP_ENABLE or NIX_CPT_BP_ENABLE is sent for a channel that…
- [Medium] nix_bp_chan_disable() (rvu_nix.c:624-639) passes 'cfg &
  GENMASK_ULL(8, 0)' to nix_bp_free_lbk_bpid() without checking that…
- [Medium] nix_bp_enable() now saves each allocated BPID in
  rsp->chan_bpid[i] (line 844) and later reads it back from rsp to…
- [Low] The commit message undersells one of the problems this patch
  fixes.

--

octeontx2-af: Fix BPID leaks in NIX backpressure enable/disable

This patch reworks nix_bp_enable() and nix_bp_disable() so that LBK BPIDs
are allocated up front, one per programmed channel. On disable, a BPID is
released per channel, and only when it is in the LBK pool and owned by the
requester. It also adds channel range checks against the function's RX
channels and iterates with a counter bounded by chan_cnt.

> octeontx2-af: Fix BPID leaks in NIX backpressure enable/disable

[ ... ]

>     - In nix_bp_disable(), release only the BPID read back from the
>       channel, and only if it lies in the LBK free pool and is owned by
>       the requesting pcifunc. Previously the BPID was freed without a
>       range check, and fn_map/ref_cnt were cleared for every BPID owned
>       by the function, so FLR could no longer reclaim the rest.

[Severity: Low]
This isn't a bug in the new code, but does the commit message undersell
what the missing range check allowed?

In the old nix_bp_disable(), an LBK channel whose BPID field was below
bp->free_pool_base reached this call directly. That includes the reset
value 0, which the new comment in nix_bp_free_lbk_bpid() names:

    rvu_free_rsrc(&bp->bpids, bpid - bp->free_pool_base);

Both operands are promoted to int, so the id is negative. rvu_free_rsrc()
then passes it to __clear_bit(id, rsrc->bmap). That is an out-of-bounds
bitmap write in the AF mbox handler, not a leak.

The in-tree path reaches it. otx2_init_hw_resources() sends
NIX_CPT_BP_DISABLE on every open, including from LBK VFs, and this call
has no !is_otx2_lbkvf() guard, unlike the NIX_BP_* calls next to it:

    /* Default disable backpressure on NIX-CPT */
    otx2_nix_cpt_config_bp(pf, false);

Any LBK VF can also send NIX_BP_DISABLE without a prior enable.

Could the subject and changelog say that this fixes an out-of-bounds write
a VF can trigger? That would help with stable selection.

> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> index 199723d5ec947..274662086d2a9 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> @@ -599,18 +599,56 @@ static u16 nix_get_channel(u16 chan, bool cpt_link)
>  	return cpt_link ? chan | BIT(11) : chan;
>  }
>  
> +static void nix_bp_free_lbk_bpid(struct rvu *rvu, struct nix_bp *bp,
> +				 u16 bpid, u16 pcifunc)
> +{
> +	int idx;
> +
> +	/* Skip channels never enabled (reset value 0) or not using an LBK bpid */
> +	if (bpid < bp->free_pool_base ||
> +	    bpid >= bp->free_pool_base + bp->bpids.max)
> +		return;
> +
> +	idx = bpid - bp->free_pool_base;
> +
> +	/* Only release the bpid if it is owned by this function. */
> +	mutex_lock(&rvu->rsrc_lock);
> +	if (bp->fn_map[idx] == pcifunc) {
> +		rvu_free_rsrc(&bp->bpids, idx);
> +		bp->fn_map[idx] = 0;
> +		bp->ref_cnt[idx] = 0;
> +	}
> +	mutex_unlock(&rvu->rsrc_lock);
> +}
> +
> +static void nix_bp_chan_disable(struct rvu *rvu, struct nix_bp *bp,
> +				int blkaddr, u16 chan, bool cpt_link,
> +				int type, u16 pcifunc)
> +{
> +	u16 chan_v = nix_get_channel(chan, cpt_link);
> +	u64 cfg;
> +
> +	cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v));
> +	rvu_write64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v),
> +		    cfg & ~BIT_ULL(16));
> +
> +	if (type != NIX_INTF_TYPE_LBK)
> +		return;
> +
> +	nix_bp_free_lbk_bpid(rvu, bp, cfg & GENMASK_ULL(8, 0), pcifunc);

[Severity: Medium]
Can this free a BPID that is still programmed on another channel?

Disable clears only BIT_ULL(16) and leaves the old BPID in bits 8:0. The
free here does not check whether BIT_ULL(16) was set in cfg.
nix_bp_free_lbk_bpid() then checks fn_map[idx] == pcifunc, which is
ownership by function, not by channel.

Here is a sequence from one LBK VF A on hardware with cpt_links:

  NIX_BP_ENABLE      RX chan CFG = X | BIT16, fn_map[X] = A
  NIX_BP_DISABLE     RX chan CFG = X, X freed, fn_map[X] = 0
  NIX_CPT_BP_ENABLE  X is the lowest free index again,
                     CPT chan CFG = X | BIT16, fn_map[X] = A
  NIX_BP_DISABLE     reads stale X from the RX chan, fn_map[X] == A,
                     so X is freed

X is now free while A's CPT channel still uses it. The next LBK
allocation by another VF gets X, and the two functions share one
backpressure ID.

The same can happen after FLR. rvu_nix_flr_free_bpids() frees by fn_map
only and never touches NIX_AF_RX_CHANX_CFG. The channel keeps its stale
BPID with BIT16 still set, and a later disable of that channel frees an
index that may have been given to another channel of the same function.

Should the release depend on BIT_ULL(16) having been set, so that a stale
BPID field is not treated as a live mapping?

> +}
> +

[ ... ]

> @@ -629,26 +667,19 @@ static int nix_bp_disable(struct rvu *rvu,
>  		return err;
>  
>  	bp = &nix_hw->bp;

[ ... ]

> +	/* CGX may use up to NIX_BPIDS_PER_LMAC channels (PFC) */
> +	if (type == NIX_INTF_TYPE_CGX) {
> +		if ((u32)req->chan_base + req->chan_cnt > NIX_BPIDS_PER_LMAC)
> +			return NIX_AF_ERR_INVALID_BPID_REQ;
> +	} else if ((u32)req->chan_base + req->chan_cnt > pfvf->rx_chan_cnt) {
> +		return NIX_AF_ERR_INVALID_BPID_REQ;
>  	}
> +
> +	chan_base = pfvf->rx_chan_base + req->chan_base;
> +	for (i = 0; i < req->chan_cnt; i++)
> +		nix_bp_chan_disable(rvu, bp, blkaddr, chan_base + i, cpt_link,
> +				    type, pcifunc);

[Severity: High]
Can a requester get past this new range check by changing req->chan_cnt
after it has been checked?

req lives in the BAR4 mailbox region shared with the PF/VF. The loop
condition reads req->chan_cnt again on every iteration. The loop body does
readq()/writeq() (and mutex_lock() for LBK), so the compiler cannot keep
the checked value in a register.

An LBK VF has an rx_chan_cnt of 1. It can pass the check with
chan_cnt = 1 and then rewrite chan_cnt to 255 while the loop runs. The AF
would then clear BIT(16) on up to 254 neighbouring channels owned by other
functions.

nix_bp_enable() has the same pattern. Both of its loops, and
rvu_nix_get_bpid(), read req->chan_base and req->chan_cnt again after the
check. There, one request could drain the shared LBK pool, and the
programming loop could set BIT(16) with the requester's BPIDs on other
functions' channels.

req->chan_base is also read again after the check. If the compiler does
not merge that load with the first one and the race is won, chan_v can
exceed 0x1FFF. With:

    #define NIX_AF_RX_CHANX_CFG(a)                  (0x1A30 | (a) << 15)

bits 28-30 then get set. rvu_write64() ORs the offset into (block << 28),
so the read-modify-write could land in another AF block's registers.

Processing mbox requests in place is common in this driver, and there was
no check at all before this patch, so this patch does narrow the exposure.
Still, the commit message says these out-of-range requests are now
rejected.

Would it work to copy chan_base and chan_cnt into locals, validate them
once, and use the locals in the loops and in rvu_nix_get_bpid()?

>  	return 0;
>  }

[ ... ]

> @@ -771,35 +806,54 @@ static int nix_bp_enable(struct rvu *rvu,

[ ... ]

>  	chan_base = pfvf->rx_chan_base + req->chan_base;
> -	bpid = bpid_base;
>  
> -	for (chan = chan_base; chan < (chan_base + req->chan_cnt); chan++) {
> +	/* Get all bpids first so a failure leaves the channels untouched */
> +	for (i = 0; i < req->chan_cnt; i++) {
> +		bpid = rvu_nix_get_bpid(rvu, req, type, i);
>  		if (bpid < 0) {
>  			dev_warn(rvu->dev, "Fail to enable backpressure\n");
> +			if (type == NIX_INTF_TYPE_LBK)
> +				while (i--)
> +					nix_bp_free_lbk_bpid(rvu, bp,
> +							     rsp->chan_bpid[i] & 0x3FF,
> +							     pcifunc);
>  			return -EINVAL;
>  		}
>  
> +		rsp->chan_bpid[i] = ((req->chan_base + i) & 0x7F) << 10 |
> +				    (bpid & 0x3FF);
> +	}
> +
> +	for (i = 0; i < req->chan_cnt; i++) {
> +		chan = chan_base + i;
> +		bpid = rsp->chan_bpid[i] & 0x3FF;

[Severity: Medium]
Is it safe to read the BPID back from rsp here?

rsp comes from otx2_mbox_alloc_msg() in rvu_process_mbox_msg(). It sits in
the mailbox region that rvu_get_mbox_regions() maps from the PF/VF BAR4:

    mbox_addr[region] = ioremap_wc(bar4, MBOX_SIZE);

The requesting function can therefore rewrite rsp->chan_bpid[i] between
the allocation loop and this loop. The window includes a
mutex_lock()/mutex_unlock() for every LBK allocation.

If that happens, the AF writes whatever 9-bit BPID the function chose into
NIX_AF_RX_CHANX_CFG, bypassing the allocation and range checks in
rvu_nix_get_bpid(). Disable frees whatever it reads back from the channel,
so the BPIDs that were actually allocated are never freed.

The error unwind above has the same problem. It frees whatever values are
in rsp->chan_bpid[i], not the BPIDs that were allocated.

Before this patch, the programmed BPID came from a local variable and rsp
was only written. Could the allocated BPIDs be kept in a local array, with
rsp only written from it?

>  		chan_v = nix_get_channel(chan, cpt_link);
>  
>  		cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v));
>  		cfg &= ~GENMASK_ULL(8, 0);
>  		rvu_write64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v),
>  			    cfg | (bpid & GENMASK_ULL(8, 0)) | BIT_ULL(16));

[Severity: Medium]
Does this still leak an LBK BPID when backpressure is already on for the
channel?

For LBK, rvu_nix_get_bpid() always takes a new bit from bp->bpids and sets
fn_map/ref_cnt. This loop then overwrites the BPID field without checking
BIT_ULL(16) and without releasing the BPID that was there.

After enable (gets X), enable (gets Y), then disable,
nix_bp_chan_disable() reads back only Y and frees it. X stays allocated
until rvu_nix_flr_free_bpids() runs on FLR.

One LBK VF can repeat NIX_BP_ENABLE until the shared LBK pool is empty.
After that, rvu_nix_get_bpid() returns NIX_AF_ERR_INVALID_BPID for every
other LBK VF.

The subject says "Fix BPID leaks in NIX backpressure enable/disable".
Should the enable path check for an already enabled BPID owned by this
pcifunc before allocating a new one?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119085434.2598197-1-nshettyj%40marvell.com
