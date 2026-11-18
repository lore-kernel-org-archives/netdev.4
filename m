Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010512;
	b=DD9/PW1Cyvv0GOvQVundJftyT5J1gB/bFCOCtAJvMNvcDAVCeaxpZwTGp98IiTQ3Q3hP
	 LW+PmCAG0BhMhc0ymcFVlbg/UYTxJiZDPksr+Npo8+e7OJZ44iFijtDgwvigmxYb28R6g
	 NPsuRyX4+ctxLpuloeEKsj0NAHERYeKT34UpvrdUjW87VUnUQsasb2+YWq84PYI6N18zq
	 Eu42B30MOVhvBQyOo2OAN8/0Ncx372XyMKKRKm9SRi/UXOnKqqn2By8ul9zXJzAmO0ieO
	 X+5TkDByQYXmu0qJQif644AypPy4JcJi7H/lrqQDnTXZBVhp0dlYmTkzb/L+jPdbbLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010512;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KIdqIlj6kC8jVLpZrDN3iLbh4+p+XYCBL44LZcUbDfM=;
	b=gF2CisdAGtrjDcShUeaXvOLO/Vn1b+a034NAD3OEbHzUVA1/V8mcG+iCQuZJb2IvcYyM
	 GRn1pvtS00gSflrkXKycOIOzYt3C8dBp5un0z6b1nDfqxe1RtzRrTb7HJmqiK/tR0Sekl
	 eYycq+1WupBSZEYFNyp2v5+P2yETR2GK5DtJMy9Kyg4Po1jwgqF6KV9E5OTvnP8DJ3+yF
	 TNq9ATBUmsS3JpVKi7LNoBspcucrrS3U3FxO+uQQ+r45yZMFVPfVzqVGtIFnaPHoljskA
	 ZmRJoxP+2eYcM/7R7pkWCkyZzt3sblxin8JOb/dxd6wrAokXkkXzkdHnk0jNy0HC//A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pnkwsk7U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05939606A338
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pnkwsk7U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7611F000C4;
	Wed, 18 Nov 2026 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010511;
	bh=KIdqIlj6kC8jVLpZrDN3iLbh4+p+XYCBL44LZcUbDfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pnkwsk7UoGBWjjE2fd8d2R7QRtAmeQRGgwRrPDe3Pi3eJSHnlzVj/A3JeYavucVSG
	 6Tjytuhoq3N156tPQ0Oe6XF78LM1c6yCcVdHA0SxF4GdzKssQWwG+dSCNRiKWkbywL
	 uDwcQXgMZQq/zhW7SVKB5Aj++5wTECre1k7evRxEEaJRyQLe/pAUOx6H9biDo8j/Qx
	 KRN1v9zlB7L3o5oz9lX53YCcYfizrne+cfCbRuk5z5HlUP2qHeZ+YpEGKrXnSOOPWC
	 XZAb6bpXT0G53QqSAfNYgv7RH4aPrVQ25UuWgxtk3KfngXAK6AatZHzHfp2BlIGuo0
	 P0VXSohs03Rig==
Date: Wed, 18 Nov 2026 14:01:46 +0000
From: Simon Horman <horms@kernel.org>
To: Li Yifan <yifan2.li@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dima Ruinskiy <dima.ruinskiy@intel.com>,
	Li Lili <lili.li@intel.com>, Wang Jie <jie.wang@intel.com>
Subject: Re: [PATCH iwl-net v2] igc: Disable PTM after the last device reset
 on remove
Message-ID: <20261118140146.GD860048@horms.kernel.org>
References: <20261110062051.2730678-1-yifan2.li@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110062051.2730678-1-yifan2.li@intel.com>

On Tue, Nov 10, 2026 at 02:20:51PM +0800, Li Yifan wrote:
> After a PTM dialog, I225/I226 can send a PTM Request at the next device
> reset through the RST bit of the device-specific CTRL register
> (CTRL.RST). The device sends it even when the PTM Enable bit in its PTM
> Capability is clear. This is a hardware defect: a PTM Requester is
> permitted to request PTM Master Time only when PTM is enabled (PCIe
> r7.1 sec 6.21.3.1). The EN bit of the device-specific PTM_CTRL register
> is also clear at that time, so the driver has no control that stops
> the request.
> 
> The request is harmless while the upstream port has PTM enabled. Since
> commit e1092d5e15e6 ("PCI/PTM: Do not enable PTM automatically for Root
> and Switch Upstream Ports"), pci_disable_ptm() also disables PTM on the
> upstream port when the last user goes away. igc_remove() calls
> pci_disable_ptm() before unregister_netdev(). If the interface is up,
> unregister_netdev() then resets the device through igc_close() ->
> igc_down() -> igc_reset(). The upstream port now handles the PTM
> Request as an Unsupported Request, as the spec requires (sec 6.21.3).
> On an Intel Nova Lake-S system with an I226-LM, this triggers DPC on
> "modprobe -r igc". Recovery fails because the driver is unbinding, and
> the next probe fails:
> 
>   pcieport 0000:80:1d.0: DPC: containment event, status:0x1f01: unmasked uncorrectable error detected
>   pcieport 0000:80:1d.0:    [20] UnsupReq               (First)
>   pcieport 0000:80:1d.0: AER:   TLP Header: 0x34000000 0x81000052 0x00000000 0x00000000
> 
> Message code 0x52 in the TLP header is a PTM Request from 81:00.0.
> 
> Call pci_disable_ptm() after the last reset of the device, so that the
> upstream port still has PTM enabled and responds to the request. If the
> interface is down, unregister_netdev() does not reset the device, so
> reset it explicitly. Skip this reset if error recovery is in progress
> or has failed, as igc_down() does before igc_reset().
> 
> Tests on an I226-LM show that this reset also clears the state: the
> device sends the request only at the first CTRL.RST after a PTM dialog,
> so a later reset sends nothing unless a new dialog runs.
> 
> No new dialog runs after this reset. The PCIe spec makes the mechanism
> that starts a PTM dialog implementation specific (sec 6.21.3.1), so a
> device can start dialogs at any time while PTM is enabled. I225/I226
> start a dialog only when PTM_CTRL.EN is set and the driver sets the
> TRIG bit in PTM_CTRL (the "PTM trigger mode" in commit 8e404ad95d2c
> ("igc: fix PTM cycle trigger logic")), or in an automatic cycle mode
> that igc does not use. The request at CTRL.RST is the only exception
> that we know of. igc sets EN and TRIG only in the PTP code, and
> igc_ptp_stop() runs before the reset:
> 
>   - igc_ptp_suspend() -> igc_ptm_stop() clears PTM_CTRL.EN.
>   - ptp_clock_unregister() removes the PHC and waits for the
>     igc_ptp_getcrosststamp() calls in progress, so no new TRIG comes.
>   - IGC_PTP_ENABLED is cleared, so igc_ptp_reset() returns early in the
>     reset path and does not set EN or TRIG again.
> 
> pci_clear_master() stays where it is, so PTM Enable is now cleared
> after bus mastering is disabled. This keeps what commit c080fe262f9e
> ("igc: Fix possible system crash when loading module") needs: the
> device starts no PTM dialog while bus mastering is disabled, because
> PTM_CTRL.EN is already clear.
> 
> Fixes: e1092d5e15e6 ("PCI/PTM: Do not enable PTM automatically for Root and Switch Upstream Ports")
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Co-developed-by: Li Lili <lili.li@intel.com>
> Signed-off-by: Li Lili <lili.li@intel.com>
> Signed-off-by: Li Yifan <yifan2.li@intel.com>
> Tested-by: Wang Jie <jie.wang@intel.com>
> ---
> v2:
> - Call CTRL the device-specific CTRL register. Describe the defect as a
>   PTM Request with PTM Enable clear, and remove Bus Master Enable from
>   the description of the defect (Bjorn).
> - Leave pci_clear_master() where it is and move only pci_disable_ptm()
>   (Bjorn). Retested this order on the I226-LM (v7.2.7 with the same
>   change): reload x20 with the
>   interface up; unload with the interface down or never up, then a
>   manual CTRL.RST (no PTM Request); S3 and s2idle; unbind/bind;
>   remove/rescan; runtime suspend; reload in parallel with S3 for 10
>   minutes. No DPC.
> - Explain why no new PTM dialog starts after the reset, and that
>   starting dialogs only on TRIG is device-specific (Bjorn).
> - Add PCIe r7.1 references for the defect, the Unsupported Request at
>   the upstream port, and the dialog trigger.
> - Keep only the pci_channel_offline() check before the reset (Bjorn).
> - Drop the pcie_ptm_enabled() check before pci_disable_ptm(). The PCI
>   core fix [1] (applied to pci/ptm for v7.5) handles a failed
>   pci_enable_ptm() for all drivers. Without [1], this is the same as
>   the current code, which also calls pci_disable_ptm() without a check.
> - No erratum covers the PTM Request at CTRL.RST yet. I reported it to
>   the I225/I226 hardware team and waiting update now. I
> 
> [1] https://lore.kernel.org/r/20261104121457.2108515-1-yifan2.li@intel.com
> 
> v1: https://lore.kernel.org/r/20261031021928.1714612-1-yifan2.li@intel.com

Reviewed-by: Simon Horman <horms@kernel.org>

