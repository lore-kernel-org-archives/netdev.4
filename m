Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487379;
	b=jbI1pgnBGOgimxBmZg7RnYJfMrLYUWYl1gv5qpM2dFZyhQ+qbyCgSWUXDxjs+nIo8jYp
	 FiYkAmBYNFrNzMNN3GQ1KfUDkKYz6eE4zbZ7nA0dajx/ogYB+NRvEbuuVc2XYVYyIhWiQ
	 IU5/4GPzYGdZiMMarVf7CNcUupW2g/lVfcG6Rpfz+uA+B8ERWzNg9K/XpqM3kzbMLaHfd
	 PfIQg7NmilEsR4pQsmO/2/mgCJZKkOGGTrhoPdeDq63xjiqBS3Wz6Ju+BkkP40LB0eHlf
	 NHdHENyT8OZWYO/bQefD0mTTTT+gIt37TF06LtCGKmG6PP9bq+Tf1wt5rKrv9HATI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487379;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8NvDqIrKXQ3eal5Cp0jr6Hk9FP8h4weYBqykTLZjvkg=;
	b=4f9JphXynmeDxpeXB6cbmwHEfnVFetDtJ2n/brI+2r191Hlf3rZq4tgzOiWBXblsoBCS
	 rHsejf/XGcZOII3ZzE/zqWTecfDtKIPlNvG22c4eDrbZDrD4q+gOWDLhoZiKFU2xO6G6a
	 fN+7AtlGgEOrl64bqYjwo9aoGfEdpPjFOFRXIo29r656404y1Tn24hbZOTDihSaye3dGK
	 Buf7eqjUKWeqMSita6jKzaVIiUZwFNg7NDQKpzak4avSKVxFpB+q2+VHFxHg89Tk44ZB0
	 VdOnwIt1uD+0KGYIxaTufQKWxrnM9a6RGN5KtJucmx8cj2EK0kfqINhjRwggEnjCx0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+jgVsxj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77E606A31E;
	Tue, 24 Nov 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+jgVsxj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D081F000CA;
	Tue, 24 Nov 2026 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487379;
	bh=8NvDqIrKXQ3eal5Cp0jr6Hk9FP8h4weYBqykTLZjvkg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f+jgVsxjp8mHuxBkzR7gtZ5ZFii3zHj/Vnf7rMjL1hpqnoVPzBxnROTETcd/Xa6WE
	 jfZbixfKit3yNUUs/ayq3l8klvIpDznn8ggf6NUAE5LY1LuvrpGiKZ38FDDISj4Czv
	 WDQ7ACcfL97lANMUYoIXa3aeCoJnjRBZzaTnlHUFzbjQma/izzyiHCwUGvmkP+2R1V
	 /JQk8zRTSV7vcdfC3HodkbjS8rz2YwFOl7/uPABUEktKr24unr+pN4Q/Zrv6onDTHG
	 5upHMdsbcxspjxDe3Vu4BJXhPImnvqHWsxXE8399FdCYCVo1tVpLhUjtSDKX0A3d8/
	 txHN8K4FlMbfQ==
Subject: Re: [PATCH net v7 2/6] net: wwan: t7xx: fix runtime PM usage count
 underflow on -EACCES
From: netdev-bot+sashiko@kernel.org
To: tim770802@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ilpo.jarvinen@linux.intel.com, sreehari.kancharla@linux.intel.com,
 m.chetan.kumar@linux.intel.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, tim.jh.chen@wnc.com.tw,
 Chih.Hung.Huang@wnc.com.tw
Date: Tue, 24 Nov 2026 02:29:37 +0000
Message-ID: <179548737758.3135.16325622111996411281@kernel.org>
In-Reply-To: <20261120015556.131547-3-tim770802@gmail.com>
References: <20261120015556.131547-3-tim770802@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] At this commit, t7xx_cldma_send_skb()
  (drivers/net/wwan/t7xx/t7xx_hif_cldma.c) still has the bug this patch…
- [Low] net: wwan: t7xx: inaccurate Fixes tag citing 46e8f49ed7b3 for
  runtime PM bug

Pre-existing issues:
- [Medium] t7xx_dpmaif_irq_rx_done() takes a runtime PM reference and
  hands it to the NAPI poll by calling napi_schedule(&rxq->napi).

--

net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES

This commit replaces pm_runtime_resume_and_get() with
pm_runtime_get_noresume() plus pm_runtime_resume() in four DPMAIF TX/RX
contexts. A usage count reference is now still held when -EACCES is
treated as success. The reference is dropped with pm_runtime_put_noidle()
only on errors that abort the operation.

> t7xx_dpmaif_tx_hw_push_thread(), t7xx_dpmaif_tx_done(),
> t7xx_dpmaif_bat_release_work() and t7xx_dpmaif_irq_rx_done() treat
> -EACCES from pm_runtime_resume_and_get() as success and proceed to
> access the hardware.

[Severity: Medium]
Was a fifth caller with the same pattern left out here? At this commit,
t7xx_cldma_send_skb() in drivers/net/wwan/t7xx/t7xx_hif_cldma.c still
does:

drivers/net/wwan/t7xx/t7xx_hif_cldma.c:t7xx_cldma_send_skb() {
    ...
	ret = pm_runtime_resume_and_get(md_ctrl->dev);
	if (ret < 0 && ret != -EACCES)
		return ret;
    ...
allow_sleep:
	t7xx_pci_enable_sleep(md_ctrl->t7xx_dev);
	pm_runtime_put_autosuspend(md_ctrl->dev);
	return ret;
}

On the -EACCES path, pm_runtime_resume_and_get() has already given back
its reference. Every exit then goes through allow_sleep, so wouldn't the
pm_runtime_put_autosuspend() there drop a reference that was never
taken? The path is t7xx_port_wwan_write() or t7xx_port_fastboot_write()
-> t7xx_cldma_send_skb().

The next patch in the series, "net: wwan: t7xx: fix skb double free when
CLDMA send sees -EACCES", converts this site to the same
pm_runtime_get_noresume() + pm_runtime_resume() pattern. So the end of
the series looks correct.

Could the CLDMA conversion be folded into this patch, or at least
mentioned in the commit message? Then this commit would fully fix the
underflow it describes.

> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
> index 5af90ca6e0631..77770869d5750 100644
> --- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
> +++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
> @@ -911,8 +911,10 @@ void t7xx_dpmaif_irq_rx_done(struct dpmaif_ctrl *dpmaif_ctrl, const unsigned int
>  	 * which can't be done from softirq context the poll function
>  	 * is running in.
>  	 */
> -	ret = pm_runtime_resume_and_get(ctrl->dev);
> +	pm_runtime_get_noresume(ctrl->dev);
> +	ret = pm_runtime_resume(ctrl->dev);
>  	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(ctrl->dev);
>  		dev_err(ctrl->dev, "Failed to resume device: %d\n", ret);
>  		return;
>  	}

[Severity: Low]
Is the Fixes: tag pointing at the right commit? 46e8f49ed7b3
("net: wwan: t7xx: Introduce power management") only added the system
sleep dev_pm_ops callbacks (suspend, resume, freeze, thaw, poweroff,
restore) and the PM entity registration. It does not add any runtime
PM calls, and it does not touch t7xx_hif_dpmaif_rx.c or
t7xx_hif_dpmaif_tx.c.

The pm_runtime_resume_and_get() calls that ignore -EACCES and are then
paired with an unconditional pm_runtime_put_autosuspend() look like
they came from two later commits:

  d10b3a695ba0 ("net: wwan: t7xx: Runtime PM")
    t7xx_dpmaif_bat_release_work(), t7xx_dpmaif_tx_done() and
    t7xx_dpmaif_tx_hw_push_thread()

  364d0221f178 ("net: wwan: t7xx: Fix Runtime PM resume sequence")
    t7xx_dpmaif_irq_rx_done()

Should the trailers cite those two commits instead? The stable
tooling uses Fixes: to decide which trees need this patch. Anyone
running git blame later would also be sent to a commit that has
nothing to do with the usage count underflow.

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. The
reference taken here is passed on to the NAPI poll right after this
block:

	napi_schedule(&rxq->napi);

The return value is ignored. If NAPI_STATE_SCHED is already set,
napi_schedule() does nothing. In that case t7xx_dpmaif_napi_rx_poll()
never reaches the pm_runtime_put_autosuspend() that would drop this
reference.

Can this leak the runtime PM usage count and keep the modem from
runtime suspending?

SCHED can stay set in two ways. The first is a closed netdev, while
DPMAIF RX-done interrupts can still arrive:

t7xx_ccmni_close()
  t7xx_ccmni_disable_napi()
    napi_disable()

The second is the !rxq->que_started early return in
t7xx_dpmaif_napi_rx_poll(), which returns without calling
napi_complete_done():

	if (!rxq->que_started) {
		atomic_set(&rxq->rx_processing, 0);
		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
		dev_err(...);
		return work_done;
	}

The same leak already existed on the normal success path before this
patch. This patch adds the same handoff on the -EACCES path.

The que_started part is fixed later in the series by "net: wwan: t7xx:
complete NAPI on the not-started RX poll early return", which adds
napi_complete_done() to that early return.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120015556.131547-1-tim770802%40gmail.com
