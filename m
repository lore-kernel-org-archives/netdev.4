Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438324;
	b=f+cE8ilxTO+X9ZzgLLO20Irh9nG2teXTMS6sBifi2gWzo2fkxOoVGeJoUw+Oow03b3ef
	 lHpgp7lgxiB3qtLqvkX9hSePMgDchdcz0AuVALOLg9ZdrSxQuMrzNkceXAWav20olMSKf
	 amAGSyf5XELzO8CYYA6zHiCCE7maZ8H075ZxMglDX1eC/UvmqLyjHu/uuxzLhKXUNuiay
	 LjIrclG0fxWET4rJwRaW9OHw+UY16LxInLHomWl7P2MgsxxDvAbTN615Hn3uuUlORf8Mg
	 BW7/bhplyIus9sx13LjHQGgOo02th8IXDEtUFVfK7S0dtz3+ma6JH7aarzv00MkC0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438324;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1LfsU5xdEHQISzpbhLWrrP4WWztqfO5xjY2OJEgSCVQ=;
	b=YIEz8Ij0mfyXwerEXvyzUwRX7uIRLtnCAWUq+/HCY8KJsbeENrQs3uRRsO2YtB17xN16
	 7CWVGEFtZIIeSNJyRsmQRDWV89IlWDudtCKTUjuIQUASTUGOYZeVhWlVP1VnoPtxhGki3
	 iQuHcXs/CadMj26Lv7NYOJGgxie/z8Rddxyqli3/WAQN8nwaQnrleMkpNt5DxjmzlsGpg
	 yEu2et6IwhljwbD7UW7yrYs4LQbzafdqbNWQLB5tMyT2rfmt7dfzsPZsSzE9Td6X4kxux
	 RU+BMlVtsnHT/GUdcmTxlivAk9X01V3sgIM7+XhtMXbWO4Idb9p3WLlZH4oMura+Aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcVFFFlW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE31606A32D;
	Mon, 23 Nov 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcVFFFlW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305DF1F000EC;
	Mon, 23 Nov 2026 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438323;
	bh=1LfsU5xdEHQISzpbhLWrrP4WWztqfO5xjY2OJEgSCVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RcVFFFlWtPOS4auNGGS9+HcRZs+OxMLuTDQzvVdsssmW3agmzcpUVizMMC3WUIoHk
	 p3+0nHEGaX5rRCN83lPvm/rvW+befhxsClOit5/sdY9c5Ctc1XWrM6bi9u9WintnxB
	 foe04M38QvDiW3M50/6MWbeD1NQyd2rF95C5OHku21SoWpMBNpMlCU+GyyqFPdUCv7
	 a3rPvt8Gc6Xw7XHITU26oMOCY9EPuzqyt17W/S2jvCQaILALIC/liKLp/Ly6XFl2sF
	 eof51XdxjGZDdKzOTnCBj5Pk9rJP2z+LCISG+5cbZy8v56pRiUqboD+XDSuRJuORr2
	 Qd6P6VTciOo3w==
Subject: Re: [PATCH v35 net-next 3/8] net/nebula-matrix: add intr resource
 implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:02 +0000
Message-ID: <179543832271.3135.13613851022028576414@kernel.org>
In-Reply-To: <20261119113530.32107-4-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-4-illusion.wang@nebula-matrix.com>
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

- [Low] The init scrub in nbl_intr_setup_mgt() invalidates only
  FUNCTION_MSIX_MAP.
- [Low] The commit message and the new nbl_probe() comment (nbl_main.c,
  "...Bus Master Enable, which the PCI core cleared on the way into this…
- [Low] At this commit, nbl_res_intr_cfg_msix_map(),
  nbl_res_intr_destroy_msix_map() and nbl_res_intr_set_mailbox_irq()…
- [Low] The header comment of nbl_intr_setup_mgt() justifies scrubbing
  only NBL_MAX_PF (8) FUNCTION_MSIX_MAP entries by saying the table "is…
- [Low] Two comments state as a safety invariant that nbl_intr_mgt_stop()
  is the only place a coherent MSI-X map table is freed.
- [Low] The public entry points load res_mgt->intr_mgt with a plain load
  and no lock, then call mutex_lock() on it.

--

net/nebula-matrix: add intr resource implementation

This adds an nbl_interrupt module that manages the chip-internal MSI-X
vector index space. For the control PF it programs the FUNCTION_MSIX_MAP,
PADPT_HOST_MSIX_INFO and HOST_MSIX_FID_TABLE registers. It also scrubs
stale FUNCTION_MSIX_MAP entries at init, moves pci_set_master() after
nbl_core_init(), and moves pci_clear_master() before nbl_core_remove().

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> index fa5b88e8c70fc..f7cdb0fecf442 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c

[ ... ]

> @@ -136,6 +150,148 @@ static void nbl_hw_get_fw_eth_map(struct nbl_hw_mgt *hw_mgt, u32 *eth_map)
>  	*eth_map = FIELD_GET(NBL_FW_BOARD_DW6_ETH_BITMAP_MASK, data);
>  }
>  
> +/*
> + * nbl_hw_set_mailbox_irq - read-modify-write NBL_MAILBOX_QINFO_MAP_REG_ARR
> + *
> + * The full RMW sequence is wrapped by reg_lock, so concurrent register
> + * access from different CPUs is already serialized safely.
> + * nbl_hw_cfg_mailbox_qinfo() programs the BDF fields during control-PF
> + * init and clears MSIX_IDX/MSIX_IDX_VALID at the same time (they survive
> + * kexec/forced unload without FLR), so mailbox MSIX routing for a PF
> + * starts disarmed at init and is armed only by an explicit en_msix=true
> + * call here.
> + */

[Severity: Low]
Is this comment accurate at this commit? As far as I can tell,
nbl_hw_cfg_mailbox_qinfo() has no caller yet. So nothing clears
MSIX_IDX/MSIX_IDX_VALID during control-PF init, and the only scrub this
patch adds, in nbl_intr_setup_mgt(), covers FUNCTION_MSIX_MAP and nothing
else.

Later patches in the series fix this. "net/nebula-matrix: add common/ctrl
dev init/remove operation" makes nbl_dev_init() call
nbl_dev_setup_chan_qinfo() -> cfg_chan_qinfo_map_table() ->
nbl_hw_cfg_mailbox_qinfo() for every active PF. "net/nebula-matrix: add
chip-wide hardware init/deinit implementation" adds
nbl_hw_clear_stale_status() for the kexec case.

Could the comment be worded so it is true at this point in the series, or
say that the caller comes in a later patch?

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c
> new file mode 100644
> index 0000000000000..9e5376d21d0f8
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c

[ ... ]

> + * Those are bus-master reads tagged with the control PF's BDF, so
> + * pci_clear_master() is the only other lever.  The only place a table is
> + * freed is nbl_intr_mgt_stop(), which nbl_remove() reaches through
> + * nbl_core_remove(), after it has cleared bus mastering.  That is what
> + * makes the final free safe: the device cannot start a new fetch, and
> + * this window covers the ones already in flight.
> + */
> +static void nbl_intr_quiesce_wait(void)
> +{
> +	usleep_range(NBL_MSIX_DMA_SYNC_MIN_US, NBL_MSIX_DMA_SYNC_MAX_US);
> +}

[Severity: Low]
This isn't a bug, but is "The only place a table is freed is
nbl_intr_mgt_stop()" accurate? The release_vecs_unlock error path in
nbl_res_intr_cfg_msix_map() frees the table too:

	if (tbl_alloc) {
		dma_free_coherent(dev, official_tbl->size,
				  official_tbl->base_addr,
				  official_tbl->dma);

That free is safe today. tbl_alloc is only set on a first configuration,
and every goto release_vecs_unlock comes before cfg_msix_map(valid=true)
is called. The free loop in nbl_intr_mgt_stop() makes the same claim
("so this is the only place they are released").

Could both comments mention the error-path free of a table that was never
armed? Neither comment changes by the end of the series.

[ ... ]

> +/**
> + * nbl_res_intr_cfg_msix_map - allocate & program MSI-X mapping table

[ ... ]

> + * not maximum, concurrent use: a reconfigure of the same or a smaller
> + * size still fails with -EAGAIN when the pool is nearly exhausted.  The
> + * in-tree caller asks for one non-net vector per PF, far below
> + * NBL_MAX_OTHER_INTERRUPT.

[Severity: Low]
Which in-tree caller does this mean? At this commit,
nbl_res_intr_cfg_msix_map(), nbl_res_intr_destroy_msix_map() and
nbl_res_intr_set_mailbox_irq() have no callers. That means the
reconfiguration and teardown paths cannot be reached yet.

The new comment in nbl_res_remove_leonis() has the same problem:

	 * does not mean their entries are gone: a destroy_msix_map RPC
	 * that timed out leaves the control PF owning that function's map

That RPC is only added later.

Later patches add the callers: "net/nebula-matrix: dispatch: add mailbox
RPCs for msix map, mailbox irq and vsi/eth id" and "net/nebula-matrix:
add common dev start/stop operation". The kernel-doc is then updated to
name nbl_dev_cfg_msix_map().

Could these comments avoid describing callers that do not exist yet at
this point in the series?

[ ... ]

> +/*
> + * Reset the software state and invalidate every function's hardware MSI-X
> + * map entry once.  The chip-internal tables (FUNCTION_MSIX_MAP,
> + * PADPT_HOST_MSIX_INFO, HOST_MSIX_FID_TABLE) can survive a kexec or a
> + * forced unload without FLR and there is no .shutdown callback to scrub
> + * them.  Only FUNCTION_MSIX_MAP is scrubbed here: it is indexed by the
> + * 3-bit PCI function number (NBL_FUNCTION_MSIX_MAP_FUNCTION_MASK), so the
> + * NBL_MAX_PF (8) entries are every entry the pcompleter can select - the
> + * 10-bit FID mask belongs to HOST_MSIX_FID_TABLE, a separate table
> + * indexed by FID.  One register write each, after which the pcompleter
> + * can no longer fetch a stale table that points into memory this kernel
> + * may have reallocated.  The INFO/FID tables are indexed by global vector
> + * id and are not cleared; instead a map entry is always invalidated by
> + * nbl_res_intr_cfg_msix_map() and by the teardown paths before it is
> + * armed for a new configuration.

[Severity: Low]
Does the register layout support this reason for scrubbing only
NBL_MAX_PF entries?

NBL_FUNCTION_MSIX_MAP_FUNCTION_MASK is a field in data[2] of an entry.
nbl_res_intr_cfg_msix_map() writes the control PF's own common->function
into it for every func_id. The table index is func_id, through
NBL_PCOMPLETER_FUNCTION_MSIX_MAP(i).

nbl_hw_cfg_msix_info() indexes HOST_MSIX_FID_TABLE by global vector id:

	nbl_hw_wr_regs(hw_mgt,
		       NBL_PCOMPLETER_HOST_MSIX_FID_TABLE(interrupt_id),
		       &host_msix_fid, sizeof(host_msix_fid));

This comment says the same a few lines further down ("The INFO/FID tables
are indexed by global vector id"). The 10-bit FID field of that table
holds func_id. struct nbl_interrupt_mgt describes func_intr_res[] as
indexed by the "raw hardware function id", and that range includes VFs.

How many entries does FUNCTION_MSIX_MAP actually have? If it has more
than 8, can stale VALID entries for func_id >= 8 survive this scrub?
Either way, could the comment be corrected? It is still the same at the
end of the series.

[ ... ]

> +	/*
> +	 * Unpublish last.  Readers do not synchronize on intr_mgt->lock,
> +	 * so this only has to happen after every hardware access and
> +	 * every free above; a caller that latched the pointer earlier is
> +	 * rejected by the stopping latch.
> +	 */
> +	res_mgt->intr_mgt = NULL;
> +	mutex_unlock(&intr_mgt->lock);
> +}

[Severity: Low]
The public entry points read this pointer with a plain load and without
the lock:

	struct nbl_interrupt_mgt *intr_mgt = res_mgt->intr_mgt;

It is cleared here with a plain store, and devres frees the object after
remove(). Could an in-flight caller reload a NULL pointer, or use
intr_mgt after devres has freed it?

Looking at the rest of the series, there is no concurrent reader. The
only asynchronous callers are the RPC responders, which run from
clean_mbx_task. nbl_remove() -> nbl_core_stop() cancels that work. Then
nbl_core_remove() -> nbl_dev_remove() -> nbl_dev_remove_common_dev() ->
nbl_chan_teardown_queue() joins it with cancel_work_sync(). Only after
that does nbl_res_remove_leonis() -> nbl_intr_mgt_stop() run. The local
callers run on the probe/remove thread, and the device links unbind the
sibling PFs first.

If that ordering is the real guarantee, would it be clearer to state in
the struct nbl_resource_mgt comment that there are no concurrent readers,
or to use READ_ONCE()/WRITE_ONCE()?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> index 8f7a07242d412..f50ace6ccb5c9 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> @@ -261,20 +261,32 @@ static int nbl_probe(struct pci_dev *pdev,
>  	/* never return fail when DMA_BIT_MASK(64) */
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>  
> -	pci_set_master(pdev);
> -
> +	/*
> +	 * Bus mastering is enabled only after nbl_core_init() returns.
> +	 *
> +	 * FUNCTION_MSIX_MAP survives a kexec or a forced unload without
> +	 * FLR and there is no .shutdown callback to scrub it, so at this
> +	 * point every map entry left VALID by a previous kernel still
> +	 * holds a DMA address that this kernel has already reallocated.
> +	 * Those entries tag their table fetches as bus-master reads, and
> +	 * the only thing standing between such a fetch and a read of
> +	 * reused memory is Bus Master Enable, which the PCI core cleared
> +	 * on the way into this kernel.  nbl_intr_setup_mgt() invalidates

[Severity: Low]
Does the PCI core always clear Bus Master Enable before the new kernel
runs? pci_device_shutdown() calls pci_clear_master() only when
kexec_in_progress is set. A crash kexec (kdump) does not run
device_shutdown() at all. In that case the device enters the dump kernel
with bus mastering still on, and it can fetch the stale FUNCTION_MSIX_MAP
tables before nbl_probe() runs the scrub.

The comment in nbl_intr_setup_mgt() makes the same claim:

	 * This is the scrub that makes it safe to enable bus mastering:
	 * nbl_probe() calls it with bus mastering still disabled, so no
	 * new fetch can start while these entries are still VALID.

So does the commit message:

  "nbl_probe() now leaves bus mastering disabled until nbl_core_init()
  has returned, so this scrub runs before the device can issue a single
  fetch against a stale VALID entry"

The practical impact looks small. The dump kernel runs inside the
crashkernel reservation, so it will not have reused the first kernel's
coherent tables.

Could the comments and the commit message be limited to the orderly kexec
case? The .shutdown callback that the comments say is missing would cover
kdump. The end of the series still has no .shutdown, and this comment is
unchanged.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
