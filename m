Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530793;
	b=1djPcyN3h9yvD7iPZYnXs0J4OWBWBIn9xLTC/PALxh/yE4hTK61J30GDE82WtgD7SVQo
	 83YQ8HI0Icp7uLcpcluEDl49wnt2S3IPhK4236ibDV+hh/b4bcqkp6SykOvGOpRA2pdwR
	 +cSDHy0VVeY3kzpOkN36K0f5+fXqYfS6ykHAqIrA1HUJGw+IiACyU6RM7icxk12xdIP8X
	 TIt1re62KmLSCFLkTalxN0Gdy51nkLGCw2afEKUK8V5A/6kudfDHeNsgI/O/YyqJM3x6a
	 d9XVdKgRM31nKXy2UYJkx59DGdQHgGWoDjtmhURd4vuGjoM5IVaEEiUAU1eHRmXumcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530793;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8JJk/d8oBdbWzMtuNBpTkxKLz2LN0RTuhqTPuDYu+FA=;
	b=pQohfia/Qn0I2ZPfD3ZT6KCg+TOsxdKxf6vkwChSIGdIINKwtsVZ2XUjhVP0Ud6N/ucB
	 DZFvFeJ27q/bG18tAzN8rk6r4ATd5toghQEpzef6bQVdmmXG87eTQthcyEpz9WFwalhSg
	 QnJ0oTIM/5aI1sI9gy87cMz9w2PQJ7O+iQqOhy1vaivt5a6L7GubqI72ACWFhkgX/4xwd
	 eizu9ATviSixs2O2BL5yy4BYjdrxGU/dmePUGVGsDuZC6x8skzxPWHTMYEgfgkGp0bJl/
	 h3YXup/3s2ZenReybeTswjR0t9tvgI9ywQq+Akc8iZ080s1Xqf4+ymh0lKX0QUrid6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2T0CHZL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6AC606A321;
	Tue, 24 Nov 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2T0CHZL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257361F000D3;
	Tue, 24 Nov 2026 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530791;
	bh=8JJk/d8oBdbWzMtuNBpTkxKLz2LN0RTuhqTPuDYu+FA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h2T0CHZLZdHzI2ODb2lTXMObnFhQZo+mt+6xM96o1ISkgh627y1FP9iOA5V4uaunJ
	 ch/lsmYbW/fzQ5dzx6SOu+5Hvf3aOF8PCiUQpx/7zSgr6cfqsFlRsNjnuf8wMJwpgn
	 7S3eL/7qPPxsoeGWO2Ir9pQs7TSBXNgFR5CNscjT7coZcbvcrhVrLZp2/BBgYJtQqk
	 pmAf0UaB2XVJphGZOw867s0C/BPjMP+VSYq79sxu15z/ceHv2Mk4RKdx7wCQsvnbhc
	 xsV+V1BjNGd/qv6Eu6IHpYSUQLafc/ZpCCxZaqfx2LSHdohfJFLwPvEBK2+9HnAOlL
	 XyfLAfUVX5WAg==
Subject: Re: [PATCH] net: stmmac: reset the DMA on a fatal bus error
From: netdev-bot+sashiko@kernel.org
To: jakobunt@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 jakob.unterwurzacher@cherry.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 14:33:10 +0000
Message-ID: <179553079064.3135.2914132404967559636@kernel.org>
In-Reply-To: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
References: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
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

Critical: 0 · High: 0 (1) · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On dwxgmac2 the Fatal Bus Error interrupt is never enabled, so
  the patch's dwxgmac2 change cannot run.
- [Medium] Recovery from an FBE depends entirely on the service task, and
  the service-task logic can lose a reset request.
- [Medium] The patch targets FBEs around suspend/resume, but the reset it
  now triggers is not coordinated with PM transitions.
- [Medium] In multi-MSI mode the FBE handling added by the patch may
  never run.
- [Low] The patch fixes a hang that users can see.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch adds
  a new trigger for it.

--

net: stmmac: reset the DMA on a fatal bus error

The dwmac100/1000, dwmac4, dwxgmac2 and loongson DMA interrupt handlers
now report a DMA fatal bus error as a new dma_fatal_error status instead
of tx_hard_error. The shared and per-channel MSI interrupt paths then
call stmmac_global_err() to reset the adapter from the service task. The
goal is to recover the RX DMA stalls seen on RK3588 after resume.

> The only trace is the fatal_bus_error_irq counter in
> ethtool -S. The interface needs a manual down/up to recover.

[Severity: Low]
This looks like a fix for a hang that users can hit. Before this patch:

- dwmac_dma_interrupt(), dwmac4_dma_interrupt() and
  loongson_dwmac_dma_interrupt() mapped FBE to "ret = tx_hard_error".
- dwxgmac2_dma_interrupt() used "ret |= tx_hard_error".
- stmmac_msi_intr_rx() threw away the return value of
  stmmac_napi_check().

Should this have a Fixes: tag and target net, and possibly Cc: stable?
The subject doesn't say whether it is meant for net or net-next. Without
a Fixes: tag, stable backporters can't easily tell which trees need it.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 0a6e82a155c0e..bc06076410dc7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -335,7 +335,7 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
>  		}
>  		if (unlikely(intr_status & XGMAC_FBE)) {
>  			x->fatal_bus_error_irq++;
> -			ret |= tx_hard_error;
> +			ret |= dma_fatal_error;
>  		}
>  	}

[Severity: Medium]
Can this branch be reached on dwxgmac2? dwxgmac2_dma_init_chan() sets
the per-channel interrupt enable like this:

	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));

and dwxgmac2.h has:

#define XGMAC_DMA_INT_DEFAULT_EN	(XGMAC_NIE | XGMAC_AIE | \
					XGMAC_RIE | XGMAC_TIE)

Nothing defines or sets an FBEE (bit 12) enable for XGMAC. dwmac4 does
include DMA_CHAN_INTR_ENA_FBE in DMA_CHAN_INTR_ABNORMAL.

My reading of the databook is that AIS only reflects abnormal sources
whose own enable bit is set. If that is right, a fatal bus error would
not set XGMAC_AIS or raise an interrupt. The XGMAC_FBE test above sits
inside the XGMAC_AIS block, so it would never run.

The acknowledge at the end of dwxgmac2_dma_interrupt() is also masked
with intr_en, so bit 12 would never be cleared:

	writel(intr_en & intr_status, ioaddr + XGMAC_DMA_CH_STATUS(chan));

The commit message says the change covers "all DMA cores that report
the error (dwmac100/1000, dwmac4, dwxgmac2, loongson)". Does dwxgmac2
also need FBEE defined and enabled for this to work?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..16ba83db34546 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -349,6 +349,24 @@ static void stmmac_global_err(struct stmmac_priv *priv)
>  	stmmac_service_event_schedule(priv);
>  }
>  
> +/* A fatal bus error stops both the TX and the RX DMA of the channel. Only a
> + * reset of the DMA brings them back, so restarting the TX side alone is not
> + * enough: RX would stay stopped without any further error.
> + */
> +static bool stmmac_dma_fatal_error(struct stmmac_priv *priv, int status,
> +				   u32 chan)
> +{
> +	if (likely(!(status & dma_fatal_error)))
> +		return false;
> +
> +	if (net_ratelimit())
> +		netdev_err(priv->dev, "DMA fatal bus error on channel %u\n",
> +			   chan);
> +	stmmac_global_err(priv);

[Severity: High]
This is a pre-existing issue that this patch did not introduce, but the
patch adds a new way to trigger it. stmmac_global_err() queues
priv->service_task, and nothing cancels or flushes that work before
close or remove. The only place STMMAC_DOWN is set is inside
stmmac_reset_subtask() itself.

Can the reset worker re-open a device that is being removed?

reset worker                        stmmac_dvr_remove()
stmmac_reset_subtask()
  test_bit(STMMAC_DOWN) is false
                                    unregister_netdev()
                                      dev_close() -> stmmac_release()
  rtnl_lock() waits
                                    unregister_netdev() returns
  dev_close() is a no-op
  dev_open() -> stmmac_open()       phylink_destroy(priv->phylink)
                                    reset_control_assert(...)
                                    ...
                                    destroy_workqueue(priv->wq)

__dev_open() checks netif_device_present() but not reg_state. That
means stmmac_open() would run again on the unregistered netdev. It
would:

- re-request the IRQs, which are not devm-managed
- reallocate the DMA rings
- use priv->phylink while phylink_destroy() is running

The netdev itself comes from devm_alloc_etherdev_mqs(), so it is freed
after remove.

Could this cause a use-after-free of phylink, priv or the netdev? Or a
hang in unregister_netdev() waiting on references taken by the re-open?

A plain ifdown looks similar: a pending reset would re-open an interface
that was just closed.

Should service_task be cancelled with cancel_work_sync(), and
STMMAC_DOWN set, in the close and remove paths before teardown? The
same path can already be reached from stmmac_tx_timeout() and from the
safety-feature errors.

[Severity: Medium]
Is this reset coordinated with suspend and resume? stmmac_suspend()
neither sets STMMAC_DOWN nor cancels service_task, and priv->wq is not
freezable.

On the suspend side, an FBE handled before stmmac_stop_all_dma() in
stmmac_suspend() lets the worker run during or after suspend.
dev_close() -> stmmac_release() tears down the IRQs and DMA. dev_open()
then fails, because netif_device_detach() has already run:

net/core/dev.c:__dev_open() {
	...
	if (!netif_device_present(dev)) {
		...
		if (!netif_device_present(dev))
			return -ENODEV;
	}
	...
}

stmmac_reset_subtask() ignores the dev_open() result. stmmac_resume()
returns early when !netif_running(ndev), so the interface would stay
down after resume. If plat->suspend has already gated the clocks,
stmmac_release() would also access MMIO in an unclocked block.

On the resume side, stmmac_resume() does:

	stmmac_enable_all_dma_irq(priv);
	...
	phylink_resume(priv->phylink);
	rtnl_unlock();

	netif_device_attach(ndev);

An FBE after the DMA restarts would queue the reset. A worker waiting
on rtnl could then reach dev_open() before netif_device_attach() and
get the same -ENODEV.

Resume is the scenario this patch targets. Could this leave the
interface closed and needing a manual up, which is the symptom being
fixed?

> +
> +	return true;
> +}

[ ... ]

> @@ -6533,6 +6555,9 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
>  
>  	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
>  
> +	if (stmmac_dma_fatal_error(priv, status, chan))
> +		return IRQ_HANDLED;
> +

[Severity: Medium]
Will these per-channel vectors ever see FBE in multi-MSI mode? With
multi_msi_en, dwmac4_dma_init() programs DMA_BUS_MODE_INTM_MODE1, and
dwxgmac2_dma_init() does the same for XGMAC.

As I read the databook for INTM=1, sbd_perch_tx and sbd_perch_rx only
signal TI and RI. Abnormal channel events such as FBE go to
sbd_intr_o, which is the MAC vector here.

stmmac_mac_interrupt() only does this, and never reads the DMA channel
status:

	/* To handle Common interrupts */
	stmmac_common_interrupt(priv);

After a fatal bus error the channel stops, so no further TI or RI
interrupt arrives to bring the status through this path.

The commit message says the per-channel MSI interrupt paths are
covered. If the above is right, would multi-MSI platforms still stay
stalled after an FBE?

[ ... ]

> @@ -6557,7 +6583,8 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
>  	if (test_bit(STMMAC_DOWN, &priv->state))
>  		return IRQ_HANDLED;
>  
> -	stmmac_napi_check(priv, chan, DMA_DIR_RX);
> +	status = stmmac_napi_check(priv, chan, DMA_DIR_RX);
> +	stmmac_dma_fatal_error(priv, status, chan);

[Severity: Medium]
An FBE is a one-shot event, so can a reset request be lost here?

First case: during the reset, stmmac_reset_subtask() calls dev_open()
with STMMAC_DOWN still set. An FBE raised after the DMA restarts hits
the early return above without being decoded. stmmac_interrupt() and
stmmac_msi_intr_tx() return early the same way.

Second case: after the reset, there is a gap between clearing
STMMAC_DOWN and clearing STMMAC_SERVICE_SCHED:

stmmac_reset_subtask()
	clear_bit(STMMAC_DOWN, &priv->state);
	clear_bit(STMMAC_RESETING, &priv->state);
	rtnl_unlock();

stmmac_service_task()
	stmmac_reset_subtask(priv);
	clear_bit(STMMAC_SERVICE_SCHED, &priv->state);

An FBE handled in that gap calls stmmac_global_err(). That turns the
carrier off and sets STMMAC_RESET_REQUESTED. However,
test_and_set_bit(STMMAC_SERVICE_SCHED) in
stmmac_service_event_schedule() fails, so no work is queued. The
running task then clears SERVICE_SCHED and exits.

Would that leave RX and TX DMA stopped, the carrier forced off, and no
reset pending? dev_watchdog() skips devices without carrier, so
tx_timeout would not recover it either.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-stmmac_dma_fatal_error-v1-1-acd57921af57%40cherry.de
