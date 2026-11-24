Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486250;
	b=RN2IJXAcV91N9gnogcdluheYpygpYnzhQBEtjgvXUpAEvWXIKe7v7TWa1sX8E6gL2pBk
	 p8w+/HhN4wd1w1pKzczi3J2PCSoxM/kgGsBN66jjDgLyeHbCAAM4RlWO5uoVRgi82Jddm
	 CV/V1qhvPf80FaWBUkFajIfDxzaGZkRqdfrgXaAEhLWHXol/A9Ws0t8HPhl73ri5Zo+f8
	 1aT43A9t0+A5z8ed2p7gaakxp5dueOY+5p3xnfLzP2auT5Yu6I6LXFB1eyXAu+cjzkTXH
	 CHTBRKgXgbuVgQaloN/oXrNzOgGRCIW5TgUfImRUePlU0ai6plpAH27hXLnr2oijLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486250;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EUD6MmmzcC7XU4WpWMgaTRjecZep8B/pY08NSiSmt94=;
	b=I8h/qASJtOGdE9s3e3X3uZ+05RbTFOcTqFbMW7Vv3+moNV4N4ZXRVwZNXYYVSQDV/TKr
	 mrJlEbF7vya7Hisyn/us57qyTIOewL8HoJur22PQ7tset0eVovCGEznvCyXIUMd/6pNj2
	 wh7PYCpy/EhlpzirsHZgZ31KGYfCzL2KXdIop97pnWmI0f/TWb4YC3KEMk8L44LswevRF
	 ggdtnIEycU8EzC89JFQc5nVO4Q6EUnUGQTDWsmSfuOgZwlFdvd1t5zz98Bzr+JCec2eDt
	 TNXw0OnpqBAY6x8E3XUpnHAHfHibpkHho3L4DW0jxNtAN5YvP+UGk3iMMP6wv0D5/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwlTvbgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D624606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwlTvbgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973251F000C6;
	Tue, 24 Nov 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486250;
	bh=EUD6MmmzcC7XU4WpWMgaTRjecZep8B/pY08NSiSmt94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VwlTvbgQObR5o12fsRYITrOW/vtvShJOHpTjci7vYbNLlIXSzD/7aBPRqO9gzA+Ux
	 DX1pRNYuQzuazxlkbJ392Edh2OafKiwztPrwlwkyLWMirOqoW4s9a1da5+cqMlRFLb
	 QnSITnomIW8JfC1yfVUj6F07PMci3S3ll6thSFNgfRoOxrm8QRrEe1K5HEACh9qfok
	 sv5LTWUPzGqXbu8VxXtVqnlN/EjEgMymgVu9CXtuNTbIZfzszp2Uouk3Hcz9aEdLBH
	 rx5gE8c6/P8eZwwYhsbQ7TCHyl0KqGIhFl8+H4X16lsstKNpvwqEghJ+i3R6kKkIJn
	 n4nCNiRzJvmaw==
Subject:
 Re: [PATCH net-next v5 1/9] bnxt_en: Clear bp->total_irqs when disabling IRQs
From: netdev-bot+sashiko@kernel.org
To: michael.chan@broadcom.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
Date: Tue, 24 Nov 2026 02:10:49 +0000
Message-ID: <179548624915.3135.3359343024461356242@kernel.org>
In-Reply-To: <20261120012921.2537903-2-michael.chan@broadcom.com>
References: <20261120012921.2537903-2-michael.chan@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new '!bp->irq_tbl' guard in bnxt_ulp_start() (bnxt_ulp.c) is
  read without the lock that serializes writers of bp->irq_tbl.
- [Medium] bnxt_ulp_start()
  (drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c) now leaves a…
- [Low] The commit message understates the behaviour change, and a code
  comment is now wrong.

--

bnxt_en: Clear bp->total_irqs when disabling IRQs

When bp->irq_tbl is freed, this patch now clears bp->total_irqs and the
new bp->irq_tbl_size. Dynamic MSI-X adjustment and filling of the ULP
MSI-X entries now only happen when bp->irq_tbl is valid. It also sizes
the dynamic MSI-X table from bp->max_irqs and skips a second
bnxt_init_int_mode() in bnxt_io_resume().

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index e78cf7ad3cbc8..0808911186c51 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -11710,6 +11719,8 @@ static void bnxt_clear_int_mode(struct bnxt *bp)
>  
>  	kfree(bp->irq_tbl);
>  	bp->irq_tbl = NULL;
> +	bp->total_irqs = 0;
> +	bp->irq_tbl_size = 0;
>  }
>  
>  int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
> @@ -11751,7 +11762,7 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
>  
>  	if (irq_re_init && BNXT_NEW_RM(bp) && irqs_required != bp->total_irqs) {
>  		irq_change = true;
> -		if (!pci_msix_can_alloc_dyn(bp->pdev)) {
> +		if (!pci_msix_can_alloc_dyn(bp->pdev) || !bp->irq_tbl) {
>  			bnxt_ulp_irq_stop(bp);
>  			bnxt_clear_int_mode(bp);
>  			irq_cleared = true;

[ ... ]

> @@ -17842,7 +17853,7 @@ static void bnxt_io_resume(struct pci_dev *pdev)
>  			err = bnxt_open(netdev);
>  		} else {
>  			err = bnxt_reserve_rings(bp, true);
> -			if (!err)
> +			if (!err && !bp->irq_tbl)
>  				err = bnxt_init_int_mode(bp);
>  		}
>  	}

[Severity: Low]

The commit message says:

  In the AER path, if MSI-X capabilities change, bnxt_reserve_rings()
  will initialize MSI-X if BNXT_NEW_RM() is true.

Does this only happen when capabilities change? bnxt_clear_int_mode()
now sets bp->total_irqs = 0. So when bp->irq_tbl is NULL and a
reservation is needed, this condition in bnxt_reserve_rings() is always
true:

    if (irq_re_init && BNXT_NEW_RM(bp) && irqs_required != bp->total_irqs) {

The new "|| !bp->irq_tbl" branch is then taken, so bnxt_clear_int_mode(),
__bnxt_reserve_rings() and bnxt_init_int_mode() all run there.

bnxt_io_slot_reset() calls bnxt_clear_reservations(bp, true), so a
reservation is always needed in bnxt_io_resume(). The new !bp->irq_tbl
check in bnxt_io_resume() therefore matters on every NEW_RM AER resume,
not only when capabilities change.

The FW reset path through bnxt_hwrm_if_change() -> bnxt_open() works the
same way. The comment in bnxt_hwrm_if_change() still says:

    /* IRQ will be initialized later in bnxt_request_irq()*/
    bnxt_clear_int_mode(bp);

For NEW_RM firmware, MSI-X now seems to be set up earlier, in
bnxt_open() -> __bnxt_open_nic() -> bnxt_reserve_rings(bp, true). Could
the commit message and that comment be updated to match?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
> index a515c368bac01..0c27a6ec69f77 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
> @@ -334,6 +334,11 @@ void bnxt_ulp_start(struct bnxt *bp)
>  			goto clear_flag_continue;
>  		}
>  
> +		if (edev->ulp_tbl->msix_requested && !bp->irq_tbl) {
> +			/* Stay stopped if there are no vectors */
> +			mutex_unlock(&edev->en_dev_lock);
> +			continue;
> +		}

[Severity: Medium]

When bp->irq_tbl is NULL, this path skips adrv->resume() and leaves
BNXT_EN_FLAG_ULP_STOPPED set. What resumes the ULP once the vectors
come back?

bnxt_ulp_start() looks like the only place that calls adrv->resume() or
clears BNXT_EN_FLAG_ULP_STOPPED. Its callers (bnxt_io_resume(),
bnxt_fw_reset_task(), bnxt_resume(), bnxt_dl_reload_up(),
bnxt_ulp_restart()) are one-shot recovery points. bnxt_open() only
queues BNXT_RESTART_ULP_SP_EVENT when BNXT_STATE_FW_RESET_DET is set.

One possible sequence:

1. With static MSI-X, ethtool -L on a running device takes the
   irq_cleared path in bnxt_reserve_rings(), and bnxt_init_int_mode()
   fails (pci_alloc_irq_vectors() shortfall or allocation failure). The
   open fails and the netdev is left closed with bp->irq_tbl == NULL.

2. A PM suspend/resume or a devlink DRIVER_REINIT reload runs while the
   device is down. bnxt_suspend() or bnxt_dl_reload_down() calls
   bnxt_ulp_stop(). Then bnxt_resume() or bnxt_dl_reload_up() calls
   bnxt_ulp_start() with !netif_running(), which takes this early
   continue.

3. The user opens the netdev. bnxt_reserve_rings() or
   bnxt_setup_int_mode() rebuilds bp->irq_tbl, but bnxt_ulp_irq_restart()
   does nothing because the RDMA device is still suspended.

Does bnxt_re then stay suspended until the next FW reset, AER, PM
resume or devlink reload, or until the driver is reloaded? The commit
message only says the check is needed "before filling the ULP MSI-X
entries". It doesn't mention that the ULP stays stopped.

[Severity: High]

Is this check safe against concurrent writers of bp->irq_tbl? Here
bnxt_ulp_start() holds only bp->auxdev_lock and edev->en_dev_lock.
bnxt_clear_int_mode(), bnxt_init_int_mode() and bnxt_change_msix() run
under rtnl and the netdev instance lock, and take neither of those
mutexes.

Every caller of bnxt_ulp_start() calls it after dropping rtnl and the
netdev lock. For example, in bnxt_io_resume():

    netdev_unlock(netdev);
    rtnl_unlock();
    if (!err) {
        bnxt_ulp_start(bp);

On a static MSI-X NEW_RM device:

CPU0                              CPU1
bnxt_io_resume()
  netif_device_attach()
  rtnl_unlock()
  bnxt_ulp_start()
    bp->irq_tbl != NULL, passes
                                  bnxt_set_channels()
                                    bnxt_reserve_rings(bp, true)
                                      bnxt_ulp_irq_stop()
                                      bnxt_clear_int_mode()
                                        kfree(bp->irq_tbl)
                                        bp->irq_tbl = NULL
    bnxt_fill_msix_vecs()
      ent[i].vector = bp->irq_tbl[i].vector;

Can this cause a NULL dereference or a read of the freed table in
bnxt_fill_msix_vecs()? Stale vectors would then be passed to bnxt_re
through adrv->resume(). bnxt_restore_pf_fw_resources() is another path
into the same writers.

The lockless read of bp->irq_tbl was already there before this patch.
But the new check is meant to stop NULL bp->irq_tbl dereferences while
filling the ULP MSI-X entries. Would it make sense to do the check and
copy the vectors under the netdev instance lock, or under another lock
that the writers also take?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120012921.2537903-1-michael.chan%40broadcom.com
