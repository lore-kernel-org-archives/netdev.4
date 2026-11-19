Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126987;
	b=RKcLesFba/bUZ3jqrW1Nj+AUflUkkp6mw3Z4HGKS36ZwOtrDBqvv4FLVwDJAgZOKJLEq
	 G/CvZ6FXUKeRoFKOrdZkH4fL8/zVAiFWzdxU35fEEk/vN/ss+z9pm1zVQn0C2CUfZcICe
	 yK4sbTxTHvxU+RHaeM9df1GBjXyNLeimtq5kK1zxRVF0aXiZ6+iW/qSU4CZuCuQnq3Jui
	 HawYlbnvVJYK7HQBjiguvXq0v/FM3gsb9L0A5K2GKiZ2HAsH0N9DES07NbLFRpIoZ0Fp/
	 TWb3F0/L2H/zxKOJYw5eVYwf5tAvklKULfkDSBerrbebdK5/TGdgwl5gAF0HJ9ShhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126987;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VIR2XXRz/VIYbQ3vo4yDdmGYcHrzMjtf4j4rI56rJeQ=;
	b=Ge7lwTgMlGpLwwaMVSWZzzNH5xJHn4lKVio2/6FgPJUMIoO2aIbGBmZ5mLeijaCb4b+C
	 lssfvqrUk5SmKxkONzdBmhfQUkF8SLLS9IKwvt/ENuLNove/hscTZgbWuxEJpwiyi5oQ2
	 dq7ShXPraQLM8TkfNKAAQjWe2SfaO1jdr7cvVPUWZ6MrrfdCSI+3+Yl8jOoB4oXrQaDxT
	 ZvzNdOYCUBo8dmFdS9JbVqQPXsn98YcifZUPnTcFejdHMJ+PysOnjWDPHoSz+rV73ylAk
	 mxkN8tPBctUE01heK+jqCGIUUU+mKRCvqkTAigueRvShSYO8jazDJVU0kZGCh8ZGixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzbl9uGy;
	arc=none smtp.remote-ip=91.218.175.107
Received: from mta0.migadu.com (out-107.mta0.migadu.com [91.218.175.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDD606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EDD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzbl9uGy
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AtODdgI8E3q9jMSujROV6OOBgGoFpUES4FimZBiQZPI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795126983; v=1; x=1795731783;
 b=nzbl9uGy2kx/0r/xMp3VPfNb0piZ1Lw7JaW3LaZGQYvNd96F9+Kz8pLTjhgqXTySgLQajBwC
 LGenOQVTz4X4p+fjVW6EcCsDuaNjoKPbjP1JTx4GViVENIQ5jQmmPjeOCSSZfZRHqf0dMN8hqCO
 qFWgnUlDPdUqagpw3OAXAdJk=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 677f1b06c5739ceb;
	Thu, 19 Nov 2026 22:23:03 +0000
X-Mizu-Trace-ID: 677f1b06c5739ceb
X-Migadu-Flow: FLOW_OUT
Message-ID: <4e42134b-b017-4836-9772-9c1915b16e77@linux.dev>
Date: Thu, 19 Nov 2026 22:23:03 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/4] ptp: ocp: prevent timestamp rearming during
 detach
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
 <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 21:19, Ahmad Byagowi wrote:
> Detach disables timestamp interrupts before unregistering the PTP clock.
> Until the POSIX clock is unregistered, an ioctl can rearm a channel
> after that disable. The clock can then be released while the timestamp
> IRQ is still registered. The core cleanup does not necessarily disable
> the channel: EXTTS requests do not require a PTP_PF_EXTTS pin assignment.

I think we have to fix it other way. Basically, there are several ways
to enable EXTTS in ptp_ocp:
1. Via sma* attributes in ptp_ocp sysfs entry
2. Via pin name sysfs entry under ptp device
3. Via PTP_PIN_SETFUNC ioctl
4. Via PTP_EXTTS_REQUEST ioctl

On teardown, sma* attributes (1) are removed before disabling
interrupts. Options 2 and 3 set PTP_PF_EXTTS function and reverted
during ptp_clock_unregister(). Only option 4 does not set PTP_PF_EXTTS
function to pin, because it calls ops->enable() callback directly.
To fix it properly enable() callback has to set PTP_PF_EXTTS function
if it's requested. That will make ptp_disable_all_events() do exactly
what is has to do - clear all events generators of ptp device after
removing ioctl interface.


> 
> Use the existing device spinlock to serialize the stopping check, PPS
> subscription updates and timestamp MMIO. Set ts_stopping under that lock
> before detach disables the channels, so an enable already in progress
> finishes first and later enables fail with -ENODEV. Keep disables
> available for PTP core cleanup.
> 
> Flush the interrupt mask writes under the lock, then drop the lock and
> restore IRQ flags before pci_irq_vector(), which takes the MSI descriptor
> mutex, and synchronize_irq(), which may sleep. During teardown, bypass
> the PPS no-state-change shortcut: a concurrent disable
> may have cleared pps_req_map and dropped the lock without yet draining
> its IRQ. Detach must still disable and drain that channel before
> ptp_clock_unregister().
> 
> Reported by the netdev Sashiko AI review, then checked against the PTP
> and POSIX-clock paths. The source-derived userspace harness reproduces
> rearming with the old source. With this fix it rejects late enables,
> serializes in-flight enables, drains a mocked active IRQ and covers a
> disable paused after unlock but before IRQ synchronization. It checks
> that MMIO is locked and vector lookup and IRQ synchronization run unlocked
> with IRQ flags restored. Shared PPS/EXTTS subscriptions and all six
> channels pass with ASan/UBSan. This is not an in-kernel UAF, lockdep or
> physical-card test.
> 
> Codex revised the code, tests and changelog from Vadim's review, at the
> request to check the spinlock approach and rerun the removal-race tests.
> 
> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
> Suggested-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Link: https://lore.kernel.org/r/ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 35 ++++++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 625a85b2dc..4c98558e96 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -367,6 +367,8 @@ struct ptp_ocp {
>   	struct pci_dev		*pdev;
>   	struct device		dev;
>   	spinlock_t		lock;
> +	/* Protected by lock; blocks timestamp arming during teardown. */
> +	bool			ts_stopping;
>   	struct ocp_reg __iomem	*reg;
>   	struct tod_reg __iomem	*tod;
>   	struct pps_reg __iomem	*pps_to_ext;
> @@ -2550,6 +2552,15 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   	struct ptp_ocp_ext_src *ext = priv;
>   	struct ts_reg __iomem *reg = ext->mem;
>   	struct ptp_ocp *bp = ext->bp;
> +	unsigned long flags;
> +	bool need_sync = false;
> +	int err = 0;
> +
> +	spin_lock_irqsave(&bp->lock, flags);
> +	if (enable && bp->ts_stopping) {
> +		err = -ENODEV;
> +		goto out;
> +	}
>   
>   	if (ext == bp->pps) {
>   		u32 old_map = bp->pps_req_map;
> @@ -2559,9 +2570,9 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   		else
>   			bp->pps_req_map &= ~req;
>   
> -		/* if no state change, just return */
> -		if ((!!old_map ^ !!bp->pps_req_map) == 0)
> -			return 0;
> +		/* Teardown must drain IRQs even if another disable cleared the map. */

there was no need of this in the previous patch, why do we need it now?

> +		if ((!!old_map ^ !!bp->pps_req_map) == 0 && !bp->ts_stopping)
> +			goto out;
>   	}
>   
>   	if (enable) {
> @@ -2569,16 +2580,21 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   		iowrite32(1, &reg->intr_mask);
>   		iowrite32(1, &reg->intr);
>   	} else {
> -		int irq_vec = pci_irq_vector(bp->pdev, ext->irq_vec);
> -
>   		iowrite32(0, &reg->intr_mask);
>   		iowrite32(0, &reg->enable);
>   		ioread32(&reg->intr_mask);
> +		need_sync = true;
> +	}
> +
> +out:
> +	spin_unlock_irqrestore(&bp->lock, flags);
> +	if (need_sync) {
> +		int irq_vec = pci_irq_vector(bp->pdev, ext->irq_vec);
> +
>   		if (irq_vec > 0)
>   			synchronize_irq(irq_vec);
>   	}
> -
> -	return 0;
> +	return err;
>   }
>   
>   static void
> @@ -5749,12 +5765,17 @@ ptp_ocp_detach_sysfs(struct ptp_ocp *bp)
>   static void
>   ptp_ocp_detach(struct ptp_ocp *bp)
>   {
> +	unsigned long flags;
>   	int i;
>   
>   	ptp_ocp_debugfs_remove_device(bp);
>   	ptp_ocp_detach_sysfs(bp);
>   	ptp_ocp_attr_group_del(bp);
>   	timer_delete_sync(&bp->watchdog);
> +	/* Drain in-flight enables and prevent rearming before unregister. */
> +	spin_lock_irqsave(&bp->lock, flags);
> +	bp->ts_stopping = true;
> +	spin_unlock_irqrestore(&bp->lock, flags);
>   	/* Disable interrupts on all timestampers */
>   	if (bp->ts0)
>   		ptp_ocp_ts_enable(bp->ts0, 0, false);

