Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438321;
	b=WZXjvYinbbWiaWTSzeEMwJOMofGjOMEmMo2obkeHy9OwuRhq/AyJ8sKW46CWO0dpoZJj
	 Ri41r+GjfYut8O2tCSHp+MTV8HAuO/9hTDUXzPQT+d77Pp1hhVtJ4S/7AuQ5Pgob7Yf6O
	 8AXjkdGknFXl6wYcujxOg+cWTZ29TSiMxi6QTMTSqfdrCIwsZd+i+CGvW8JpV9TE+CblR
	 6rSKOAf0+w+KxEIoLSrWoCIRwn8KktQcOl91AktiZZ0VPCz7FVgvou/s33EloDbXM0FvY
	 bZTMdK3m+ju+nUXGEIO48S08O8QjbnB6pb+0NqSr5DiQODoMegDgIt0fddiogpdx7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438321;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/5wYdo2l6HVbwTab+q3bfPr6i/OED3I7Bdhb2Bb+iBc=;
	b=MF1z8gIa72iI35pskrpSqXLEEAoEHY+nyIw+DmLvvgJCfcEOyUK8y8/Alerdyfp8nxZv
	 qOwsrPfaSE8hUPqzezP4I6if+5trvoUawKbDd0bHCFl+jOrplslxMKHtpfbEV+INhFOq9
	 MvuZWCrK8n2j9WNAggS6wuzScuPx8j/H/XNwbo6aCYXqeVV8I4QLjvDHqz5p0/FEz3YjI
	 yixhXRs+vgKMkWCl3oru5KAKKx7ok9LDE3QYI7TTwtzGFLYJ9W0VLRY7IDHqNHn7nqiXO
	 V+T496XVq6yvpgvszsOGbmGk95imGB75CTv0/mP4hd+ePI2qkhcj11f/JtNINNhAhFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGgg6fzE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49838606A31A;
	Mon, 23 Nov 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGgg6fzE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0E41F000C4;
	Mon, 23 Nov 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438320;
	bh=/5wYdo2l6HVbwTab+q3bfPr6i/OED3I7Bdhb2Bb+iBc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IGgg6fzE6bZuaNFzc0Fp/CkgcOK6S6NRWeyiMcRu3Gkl5YzugraAqgnAPp0/o2vtf
	 qhFsX0MT5na/xlHuVJhm/j5V8anoejq2QTB/d5o0BQvHxY6QxPzYX1loRGTQ4+7/J2
	 EevXIvwuHPlrEomd8QFq62E6hUYc6b+bc2gtFoQuP9K/s1Y4zho/ubrENHeacTAh4Z
	 OZf9dIk0N87V1rLZzIuuCaYUTvWfDQu70sXU1KUfaOHa4cdYTYpz/XcpPgZhkD/jxK
	 7AlvAyLU6sIY/7Kew03R51J81juzmdbkJpSniJ+oIGRmA6hZCbl6Ze82fiWjcLYvSG
	 6m272+GtOyP1g==
Subject: Re: [PATCH v35 net-next 1/8] net/nebula-matrix: add channel layer
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:51:59 +0000
Message-ID: <179543831940.3135.6386641569668667332@kernel.org>
In-Reply-To: <20261119113530.32107-2-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-2-illusion.wang@nebula-matrix.com>
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

- [Medium] nbl_probe_chip_deps() dereferences the struct device_link
  returned by device_link_add() (`READ_ONCE(link->status)`) with no link…
- [Medium] The TX timeout recovery in nbl_chan_quiesce_and_reclaim_tx()
  asserts QUEUE_RST, forces next_to_use/next_to_clean/tail_ptr to 0, and…
- [Low] The commit message (and the matching code comments) describe the
  effect of the persistent DL_FLAG_AUTOPROBE_CONSUMER link on other…
- [Low] nbl_probe_chip_deps() finds the management PF as (domain, bus,
  PCI_SLOT(devfn), function 0) of the probing device, and its only VF…
- [Low] The large comment in nbl_probe_chip_deps() justifies the lock-
  free design by referring to "the trylock-and-retry scheme necessary…

--

net/nebula-matrix: add channel layer

This adds a mailbox-based channel layer that carries control messages
between PF0 and the other PFs. It uses TX/RX descriptor rings, ACK wait
slots and an xarray of message handlers. It also adds
nbl_probe_chip_deps(), which defers sibling PF probes until function 0 is
bound to nbl, and creates a persistent device link from each sibling to
function 0.

> - creates a persistent DL_FLAG_AUTOPROBE_CONSUMER device link, so the
>   driver core unbinds every sibling PF before function 0 goes away and
>   re-probes them when function 0 binds again. It is deliberately not
>   flagged AUTOREMOVE_SUPPLIER: the link is what re-queues the siblings
>   after a rebind, so it has to survive function 0's unbind. Because the
>   link outlives the nbl binding that created it, two effects outside nbl
>   follow, both intended: while function 0 is not bound to this driver
>   the link is DORMANT, so any other driver on a sibling PF (vfio-pci,
>   pci-stub) is deferred by device_links_check_suppliers(); and unbinding
>   function 0 from its driver force-unbinds the sibling through
>   device_links_unbind_consumers(). A PF of this controller is only
>   usable with this driver bound to the management PF.

[Severity: Low]
Is this description of the link's effect on other drivers accurate?

When the supplier binds to any driver, device_links_driver_bound() moves
DORMANT consumer links to AVAILABLE:

drivers/base/core.c:device_links_driver_bound() {
    ...
        WARN_ON(link->status != DL_STATE_DORMANT);
        WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
    ...
}

device_links_check_suppliers() only defers a consumer when the link is
not AVAILABLE:

    if (link->status != DL_STATE_AVAILABLE &&
        !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {

So with function 0 bound to vfio-pci, it looks like a sibling PF can bind
vfio-pci or pci-stub normally. The link seems to be DORMANT only while
function 0 has no driver at all. The "bound to this driver" restriction
comes only from the mgt->dev.driver != pdev->dev.driver check in
nbl_probe_chip_deps(), and that check only applies when nbl is the
sibling's driver.

Could the commit message be updated to describe what the driver core
actually enforces?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c
> new file mode 100644
> index 0000000000000..8db556c3c9b26
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c
> @@ -0,0 +1,1568 @@

[ ... ]

> +static void nbl_chan_quiesce_and_reclaim_tx(struct nbl_channel_mgt *chan_mgt,
> +					    struct nbl_chan_info *chan_info)
> +{

[ ... ]

> +	 * The QINFO entry exposes no idle or reset-done status, so that
> +	 * proves the reset was accepted, not that DMA from the old run is
> +	 * gone: a late USED write-back for the descriptor that timed out
> +	 * can still land after the re-arm below.  The ring cannot step
> +	 * around it either, because QUEUE_RST clears the hardware tail
> +	 * counter and the software indices have to restart with it at
> +	 * slot 0.  The timed-out message has already failed, so the only
> +	 * remaining exposure is such a completion arriving while the next
> +	 * message is polled.
> +	 */
> +	hw_ops->stop_mailbox_txq(hw_priv);

[ ... ]

> +	txq->tail_ptr = 0;
> +	txq->next_to_use = 0;
> +	txq->next_to_clean = 0;

[ ... ]

> +	if (READ_ONCE(chan_info->shutdn))
> +		return;
> +
> +	/* Re-enable queue with current ring base and size */
> +	nbl_chan_config_queue(chan_mgt, chan_info, true);
> +}

[Severity: Medium]
What happens to the next message if the timed-out descriptor was in slot
0? That is the case for the first send after setup or after a previous
reset. The indices restart at 0, so the next send reuses the abandoned
slot.

nbl_chan_kick_tx_ring() decides completion only from the USED bit, with
no msgid or generation check:

    if (le16_to_cpu(READ_ONCE(tx_desc->flags)) &
        BIT(NBL_CHAN_TX_DESC_USED)) {

Could a late USED write-back from the old run, which the comment above
says can land after the re-arm, make the new message look sent even
though the device never fetched it? For non-ACK sends such as the
nbl_chan_send_ack() replies, the message would be silently lost. ACK
sends would end in a spurious ACK timeout.

For payloads over 16 bytes, nbl_chan_update_txqueue() also does a
memcpy() into tx_buf[0]. Can that race a late device read of the same
buffer for the abandoned descriptor, so the peer receives a mix of the
two messages?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> index 442da73835b00..074875a0dad3b 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c

[ ... ]

> @@ -67,6 +74,155 @@ static void nbl_get_func_param(struct pci_dev *pdev, kernel_ulong_t driver_data,

[ ... ]

> +static int nbl_probe_chip_deps(struct pci_dev *pdev, bool has_ctrl)
> +{
> +	struct device_link *link;
> +	struct pci_dev *mgt;
> +
> +	if (has_ctrl)
> +		return 0;
> +
> +	mgt = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +					  pdev->bus->number,
> +					  PCI_DEVFN(PCI_SLOT(pdev->devfn), 0));

[ ... ]

> +	if (mgt == pdev) {
> +		dev_err(&pdev->dev,
> +			"management PF lookup matched this device\n");
> +		pci_dev_put(mgt);
> +		return -ENODEV;
> +	}

[Severity: Low]
Does this guard cover only one of the VFs in a group?

nbl_get_func_param() only sets has_ctrl in this case:

    if ((PCI_FUNC(pdev->devfn) == 0) && !pdev->is_virtfn)
        param->caps.has_ctrl = 1;

so every VF that reaches nbl_probe() takes this lookup. For a VF,
(domain, bus, slot, function 0) does not identify the owning PF.

Under ARI, the VF at function 0x11 resolves to the VF at 0x10. That VF
matches itself here and always fails with -ENODEV, so it can never be
bound to nbl. Wouldn't every other VF in the same 8-function group then
fail the mgt->dev.driver != pdev->dev.driver check and return
-EPROBE_DEFER forever, with only a dev_dbg() record?

At this commit a VF bound through driver_override can reach this path. A
later patch in the series ("net/nebula-matrix: add common/ctrl dev
init/remove operation") adds an -EOPNOTSUPP rejection for functions with
neither capability, which closes the driver_override path. The lookup is
still wrong for any VF whose device ID matches nbl_id_table.

Would rejecting pdev->is_virtfn up front, or using pci_physfn(), make the
VF handling consistent?

[ ... ]

> +	 * the supplier bound.  Since nothing is held across the deferral, no
> +	 * retry can fail again on account of func 0's probe still being in
> +	 * flight, which is what made the trylock-and-retry scheme necessary
> +	 * before.

[Severity: Low]
This isn't a bug, but which trylock-and-retry scheme does this refer to?
There doesn't seem to be one in the tree or in this series. Is this left
over from an earlier revision of the patch?

[ ... ]

> +	link = device_link_add(&pdev->dev, &mgt->dev,
> +			       DL_FLAG_AUTOPROBE_CONSUMER);
> +	if (!link) {

[ ... ]

> +	if (READ_ONCE(link->status) != DL_STATE_CONSUMER_PROBE ||
> +	    READ_ONCE(mgt->dev.links.status) != DL_DEV_DRIVER_BOUND ||
> +	    READ_ONCE(mgt->dev.driver) != pdev->dev.driver) {

[Severity: Medium]
Is it safe to dereference link here?

The link is managed (there is no DL_FLAG_STATELESS), so the driver core
owns it. The device_link_add() kerneldoc says the return value can only
be used to check whether the link is present. An existing managed link
gets no extra reference, and this read is not inside a
device_links_read_lock() section.

Take the case the comment above describes, where function 0 starts
unbinding between the readiness check and device_link_add():

func 0 sysfs remove                    sibling probe
device_links_busy()
  links.status = DL_DEV_UNBINDING
                                       device_link_add()
                                         device_link_init_status()
                                           status = DL_STATE_SUPPLIER_UNBIND
device_links_unbind_consumers()
  (only waits on CONSUMER_PROBE)
->remove()
device_del()
  device_links_purge()
    __device_link_del()
  ...
  device_link_release_fn()
    device_link_synchronize_removal()
    kfree(link)
                                       READ_ONCE(link->status)

The held pci_dev reference keeps mgt->dev alive but not the link. If the
probe thread is preempted between device_link_add() and this READ_ONCE(),
can it read freed memory?

Could the check rely only on state that the held reference protects,
such as mgt->dev.links.status and mgt->dev.driver, or run under
device_links_read_lock()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
