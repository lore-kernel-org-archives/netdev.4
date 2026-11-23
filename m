Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458664;
	b=c7Yu3WcuaTYi7p4n2mI/zyF7OfOouHSw0OJcl/S7FcWZC3LmTy9livX+vgkDsuUjKqea
	 HvkH5naezp9jUzxyrKMwT7k/JvO+rV7DdMWE5L+pwfHh7CjP8SosdpZhE4Hz8Msncjhey
	 jTQE0GYlvJfDjc/YbfqS4lR40ky+DsctxZ7U9k+ySx+mQswabdAdaJr5f4URi7YC77Pod
	 SL6nkYBEapOJ8ETBHyq48rrp5ZjhTLrDIsnHOMtcxxWSkUCwl84cLLFaG9jPO70jQW0+m
	 Bv+jGFI3lutEXPg3iEVlP+9Vgj4o2JdqQu9lJw5g+LCThhFQOOo/mMp3Hp9KFRdgGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458664;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0rXnro+trqhO/0C4PaUp7HBy7QJ45IhaqrH1ik2Spjs=;
	b=M9oWFfC+38Ngn3eKMHWOVNoSlvD2LOeOQ7L486x94l9a1KQdKcUXfi6TCVSVEJHFAuf2
	 TgfXDaJYlxyC/Iwlo1jSIBnptRciaXLYCDsBgDpJ5YJ4Xyh8W2l6yeSBhHS9q18xpai5A
	 OgTdm1NOBeT5dMedkRi+bYrEO84Ybd+beJH3Rh2TeyuB/VIMa4Nd/zBKCwcNBu4ME1cO8
	 i69acwpC8/n1LQ/SC/2Wpv6n5zQWym4A07u5NCXtVsqwgHGVIyy9YBTynPr19QoTi5N/O
	 r2HptElLVW9yPewe0335lOW76bzBKnHEaceI30TsORGf82FX6Sq52idTlLme7NkO/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7TCwpCJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47988606A330;
	Mon, 23 Nov 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7TCwpCJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5E31F000D3;
	Mon, 23 Nov 2026 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458663;
	bh=0rXnro+trqhO/0C4PaUp7HBy7QJ45IhaqrH1ik2Spjs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W7TCwpCJ8sL6hMtva2JmEMaAV+ZjYUCVBklwtfWF0lERzg3D2FnH0tHfzK3u6bXOH
	 hA9bZ6AQTjGXFOxfxNaS5CHYgSgD+qkojODBcvy5JMQXutHLYDuQsqkqWQzyFhmhUA
	 o+bsaihF3ad7X473FWkx1xnW3d/LusZvlCjH2wLboYvJIDkjVOhxvdunVTwCn+yrih
	 SmQZasyRVIAagsq+F2qpP7kbcaAt92oIEKUVZae25VwS5buNachMxdfKzaDEkLp558
	 UrozDOGRJny1gXPqzFWHJKkVOTTFqaJ7ZatzfLy+RTe43pFYGPIInmlFa9Y1I4pr86
	 OGWXoHHTmiBtg==
Subject:
 Re: [PATCH net v6 4/5] bnxt_en: refuse to open a device with stopped DMA
From: netdev-bot+sashiko@kernel.org
To: joe@dama.to
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 prashant@broadcom.com, edumazet@google.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 18:31:02 +0000
Message-ID: <179545866233.3135.17505837220604349272@kernel.org>
In-Reply-To: <20261120152830.699712-5-joe@dama.to>
References: <20261120152830.699712-5-joe@dama.to>
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

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] BNXT_STATE_DMA_STOPPED is set once in bnxt_stop_dma()
  (bnxt.c:7850) and never cleared.
- [Medium] The commit message says DMA_STOPPED is added to
  BNXT_NO_FW_ACCESS() "so HWRM commands sent after DMA is stopped fail…
- [Medium] BNXT_STATE_DMA_STOPPED records a specific hazard: firmware did
  not free its rings, so the device may still hold DMA addresses of…

--

bnxt_en: refuse to open a device with stopped DMA

This patch adds BNXT_STATE_DMA_STOPPED. The bit is set in bnxt_stop_dma(),
and bnxt_open(), bnxt_open_nic() and bnxt_half_open_nic() refuse to open
the device while it is set. The bit is also added to BNXT_NO_FW_ACCESS()
so that HWRM commands fail fast once DMA has been stopped.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 600a8c866f3c3..9daf053293a42 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -7847,9 +7847,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
>  
>  	netdev_err(bp->dev,
>  		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
> +	set_bit(BNXT_STATE_DMA_STOPPED, &bp->state);
>  	pci_clear_master(bp->pdev);
>  }

[Severity: Medium]
Is BNXT_STATE_DMA_STOPPED ever cleared? This set_bit() and the test_bit()
calls are the only places that touch it. Once set, it stays set even
after the PCI function or slot has been reset and bus mastering has been
turned back on.

The comment at the top of bnxt_stop_dma() says "A firmware reset resets
the device". Even so, two recovery paths that reset the function now fail
partway because the bit is stale.

In bnxt_resume():

    pci_set_master(bp->pdev);
    ...
    if (bnxt_hwrm_ver_get(bp)) {
    ...
    rc = bnxt_hwrm_func_reset(bp);
    ...
    rc = bnxt_hwrm_func_qcaps(bp);
    if (rc)
        goto resume_exit;

__hwrm_send() exempts VER_GET and FUNC_RESET, so both reach the firmware
and the function is reset. BNXT_NO_FW_ACCESS() then skips
bnxt_hwrm_func_qcaps(), which returns -EBUSY. Resume fails with bus
mastering on, HWRM_FUNC_DRV_RGTR is never sent, and the netdev stays
detached.

One way to reach this is through the suspend path, when
bnxt_shutdown_nic() fails:

bnxt_suspend()->bnxt_close()->__bnxt_close_nic()->bnxt_stop_dma()

AER recovery has the same problem. bnxt_io_slot_reset() calls
pci_set_master(), bnxt_try_recover_fw() and bnxt_hwrm_func_reset(), then
returns PCI_ERS_RESULT_RECOVERED. bnxt_io_resume() then fails in one of
two places:

    err = bnxt_hwrm_func_qcaps(bp);
    if (!err) {
        if (netif_running(netdev)) {
            err = bnxt_open(netdev);

It fails either in bnxt_hwrm_func_qcaps() or in
bnxt_open()->bnxt_check_dma_stopped(), so the device never reattaches.

Before this patch, with the earlier "stop DMA before releasing rings"
change applied, both paths re-initialized the device. Also,
bnxt_check_dma_stopped() would then print "DMA was disabled ..." even
though bus mastering has been turned back on.

Should the bit be cleared once the function has actually been reset?

[ ... ]

> @@ -13519,6 +13535,10 @@ static int bnxt_open(struct net_device *dev)
>  	struct bnxt *bp = netdev_priv(dev);
>  	int rc;
>  
> +	rc = bnxt_check_dma_stopped(bp);
> +	if (rc)
> +		return rc;
> +

[Severity: Medium]
The new bit is only checked in the three open functions. Can
bnxt_resume() turn DMA back on while the device still holds stale ring
addresses?

The bit is set because the firmware did not free its rings. Clearing bus
mastering is the only thing that stops the device from writing into ring,
RX buffer and stats memory after __bnxt_close_nic() frees it.
bnxt_suspend() runs bnxt_close(), which may set the bit. bnxt_resume()
then does this without looking at BNXT_STATE_DMA_STOPPED:

    pci_set_master(bp->pdev);
    if (BNXT_VF(bp)) {
        for (i = 0; i < BNXT_RESUME_MAX_RETRY; i++) {
            rc = bnxt_hwrm_poll(bp);
    ...
    if (bnxt_hwrm_ver_get(bp)) {
        rc = -ENODEV;
        goto resume_exit;
    }
    rc = bnxt_hwrm_func_reset(bp);
    if (rc) {
        rc = -EBUSY;
        goto resume_exit;
    }

Suppose the function's firmware ring state survives suspend, for example
with s2idle or D3hot with No_Soft_Reset. The device can then do
bus-master DMA from pci_set_master() until FUNC_RESET completes. For a
VF, that window also covers the bnxt_hwrm_poll() retries and their
sleeps. Whether this happens depends on platform and firmware behavior.

VER_GET or FUNC_RESET may well fail here, since the firmware has already
stopped answering RING_FREE. If they do, resume jumps to resume_exit with
bus mastering still on and the stale rings still live. Because the flag
is stale (see the comment above), resume then gives up anyway.

The rebind recovery that the commit message prescribes uses the same
order. bnxt_init_board() calls pci_set_master() before
bnxt_fw_init_one_p1() sends FUNC_RESET. In the kdump case,
bnxt_init_one() calls bnxt_kdump_reset() (pcie_flr()) before probing, to
avoid this kind of stale DMA.

Should bnxt_resume() check BNXT_STATE_DMA_STOPPED, or reset the function
with something like an FLR, before it turns bus mastering back on?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index 41d05efd6307a..50c024dd3c6c4 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -2474,9 +2474,11 @@ struct bnxt {
>  #define BNXT_STATE_FW_NON_FATAL_COND	13
>  #define BNXT_STATE_FW_ACTIVATE_RESET	14
>  #define BNXT_STATE_HALF_OPEN		15	/* For offline ethtool tests */
> +#define BNXT_STATE_DMA_STOPPED		16
>  
>  #define BNXT_NO_FW_ACCESS(bp)					\
>  	(test_bit(BNXT_STATE_FW_FATAL_COND, &(bp)->state) ||	\
> +	 test_bit(BNXT_STATE_DMA_STOPPED, &(bp)->state) ||	\
>  	 pci_channel_offline((bp)->pdev))

[Severity: Medium]
The commit message says:

    Also add the bit to BNXT_NO_FW_ACCESS() so HWRM commands sent after
    DMA is stopped fail right away instead of waiting for the timeout.

Does that hold for every command? __hwrm_send() still lets two request
types through when BNXT_NO_FW_ACCESS() is true:

    if (BNXT_NO_FW_ACCESS(bp) &&
        (req_type != HWRM_FUNC_RESET && req_type != HWRM_VER_GET)) {

The device writes HWRM responses into ctx->resp by DMA. With bus
mastering cleared, HWRM_VER_GET and HWRM_FUNC_RESET cannot complete, so
they still wait for the full timeout. The exemption list was written for
fatal-error and channel-offline recovery, where bus mastering is or will
be enabled again.

Devlink reload can reach this. The first reload fails in
bnxt_dl_reload_down(): bnxt_hwrm_func_drv_unrgtr() clears
BNXT_STATE_DRV_REGISTERED and then gets -EBUSY. On a second reload,
unrgtr returns 0 and devlink calls bnxt_dl_reload_up():

bnxt_dl_reload_up()
  bnxt_fw_init_one()
    bnxt_fw_init_one_p1()
      bnxt_hwrm_ver_get()       <- waits for the timeout, then msleep(100)
      bnxt_try_recover_fw()
        bnxt_hwrm_poll()        <- another VER_GET
      bnxt_hwrm_ver_get()
      bnxt_hwrm_func_reset()

Nothing on this path checks BNXT_STATE_DMA_STOPPED. Only bnxt_open_nic(),
which runs later, does. Each exempt command sent along the way waits for
the full HWRM timeout.

Should __hwrm_send() also refuse these two commands while
BNXT_STATE_DMA_STOPPED is set, or should the commit message be reworded?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120152830.699712-1-joe%40dama.to
