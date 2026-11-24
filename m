Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487381;
	b=b9mOzPh7LHwu2lYYAu2hVASQ/d5flLasnWcyvf+9zSNruK5VXPGw0j6PNzaCQP66aYZ4
	 I3DR2I5pgszjzsoN03JTQzaJst4XQg9o4BwuiX4PzrrDjC3PkgkWBlIG+C4Y/UsnLSbN1
	 B56B/bQ078yJCZ+VgvTZfxr/OJwq7ECS9R6OQvVEyqLG15+1ztlMKxMGxTLpAIOVpwYIh
	 QSY1iN0mAdTSpKmGyeyyWxTb/AmqfT6bS01iil8zUuaw//TEULlnmPH542GVX1zhesV7q
	 yRSWy8pDCwyDTtEyt6+OHXx/tQq5PaJ8959ashdvKhqAluM/Ew517+whTi0JnG6yxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487381;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uz8jautOgi8erVgpJod9PnSE73aAlfG1J6EWIOLDTGs=;
	b=vS1pGXRAaC5B2dE2TD9bBtAFsQbbTcNyljlj+c2GFFCyKY8YX4v1azfIDxdixv4u7kfX
	 lZUlfEbsQjDgZjwMXH1UvDhVp54wMs45OkjbTbRdnJcB4tiQIWwz59jn5tpxPlWVbzKeD
	 E7dgBrr46O2vvZd4LBIYoNp1XyDme66XBzGGU8oOvos6b586VuaNVQlZAlnM9TOipvvBX
	 hAgxNgfmlIuaYfE31xuyMJFbzvdaCG9w5NRJsSNW9mB2pzjSsbNDMo5I0iCO3q4y5/lej
	 /WI99ILsRpcPchWCHEOlKJYfnVgN9e5TyFRQXXeqMtsOQKRQQD6uoFPG0/5WYSEVLNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcjH+c0s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994A606A32D;
	Tue, 24 Nov 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcjH+c0s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3851A1F000D8;
	Tue, 24 Nov 2026 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487381;
	bh=uz8jautOgi8erVgpJod9PnSE73aAlfG1J6EWIOLDTGs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jcjH+c0sIoNXw2qebgab2HEYhwnV/fNZ9ln1NFiJ0uilP+HB4ZBvvY+jhWDnuUkEa
	 1OBQLEaBpz2Fx0r7V/mad9hquxgYIMC0Hw5SzZyEls/MhZEbHwUJ9YmAVFNVgPxPsq
	 qr2Z2ccw3759M8MZrEWu0lUED2yDBL54rdAM3EfO/2p/HOQLugal86xxR3HxgmSYsH
	 tLKCat37qD8R/JpJiIsi2foTrI5tzwpUJnx+yy8qB8meduUeqFc9l8jya9GDsRUyR0
	 dNZp9SYzQP+tDo7a1/PSbjd8XffufqdWG4R5Q0eAyeZAYFmSQ/pkoqpBZP45C0zEvx
	 ND4eh/cgYOr0A==
Subject: Re: [PATCH net v7 3/6] net: wwan: t7xx: fix skb double free when
 CLDMA send sees -EACCES
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
Date: Tue, 24 Nov 2026 02:29:39 +0000
Message-ID: <179548737980.3135.2481190514948803907@kernel.org>
In-Reply-To: <20261120015556.131547-4-tim770802@gmail.com>
References: <20261120015556.131547-4-tim770802@gmail.com>
X-sashiko-severity: Critical
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

Critical: 1 · High: 0 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The patch fixes only one way to hit the skb double free;
  another one remains.
- [Low] net: wwan: t7xx: wrong Fixes tag and caller names in commit
  message

--

net: wwan: t7xx: fix skb double free when CLDMA send sees -EACCES

This patch changes t7xx_cldma_send_skb() to take the runtime PM reference
with pm_runtime_get_noresume() and to resume with pm_runtime_resume(), so
one reference is held across the send. It also clears ret after the resume,
so a tolerated -EACCES is not returned for an skb that was already queued.
Returning that -EACCES made the callers free the skb a second time.

> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> index e1b37deb6d9bf..5b4b9ed4a95b9 100644
> --- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> +++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> @@ -926,9 +926,17 @@ int t7xx_cldma_send_skb(struct cldma_ctrl *md_ctrl, int qno, struct sk_buff *skb
>  	if (qno >= CLDMA_TXQ_NUM)
>  		return -EINVAL;
>  
> -	ret = pm_runtime_resume_and_get(md_ctrl->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	pm_runtime_get_noresume(md_ctrl->dev);
> +	ret = pm_runtime_resume(md_ctrl->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(md_ctrl->dev);
>  		return ret;
> +	}
> +
> +	/* ret holds the resume status (1 for an active device, -EACCES with
> +	 * runtime PM disabled), not the result of the send below.
> +	 */
> +	ret = 0;

[Severity: Low]
This isn't a runtime problem, but the commit message needs a couple of
corrections before this goes to stable.

The Fixes tag points at 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power
management"). As far as I can tell, that commit only added the system
sleep callbacks:

  t7xx_cldma_suspend()
  t7xx_cldma_suspend_late()
  t7xx_cldma_resume_early()
  t7xx_cldma_resume()

It did not touch t7xx_cldma_send_skb() and did not add any runtime PM
calls.

Three pieces of t7xx_cldma_send_skb() came in with d10b3a695ba0 ("net:
wwan: t7xx: Runtime PM"):

  - the pm_runtime_resume_and_get() call
  - the ret != -EACCES check
  - the matching pm_runtime_put_autosuspend()

Should the tag be the following instead?

  Fixes: d10b3a695ba0 ("net: wwan: t7xx: Runtime PM")

An incorrect Fixes tag sends the backport to the wrong set of stable
branches.

The message also names t7xx_port_fastboot_write() and
t7xx_port_wwan_write() as the callers that free the skb on a non-zero
return. Neither function appears to exist in the tree. The actual
callers are:

  - t7xx_port_fastboot_tx() in t7xx_port_wwan.c, which frees tx_skb
  - t7xx_port_ctrl_tx() in t7xx_port_wwan.c, which frees cloned
  - port_ctl_send_msg_to_md() in t7xx_port_ctrl_msg.c, which frees
    the skb with dev_kfree_skb_any()

Could you update the description to name those, so the double-free
explanation can be checked against the code?

[Severity: Critical]
This fixes the -EACCES case. Can the same double free still happen through
the -ETIMEDOUT return later in t7xx_cldma_send_skb()?

In the first branch of the do/while loop, the skb is placed on the ring
before the sleep-disable wait is checked:

drivers/net/wwan/t7xx/t7xx_hif_cldma.c:t7xx_cldma_send_skb() {
    ...
			queue->budget--;
			t7xx_cldma_gpd_handle_tx_request(queue, tx_req, skb);
			queue->tx_next = list_next_entry_circular(tx_req, gpd_ring, entry);
			spin_unlock_irqrestore(&queue->ring_lock, flags);

			if (!t7xx_pci_sleep_disable_complete(md_ctrl->t7xx_dev)) {
				ret = -ETIMEDOUT;
				break;
			}
    ...
}

By this point t7xx_cldma_gpd_handle_tx_request() has DMA-mapped skb->data,
set GPD_FLAGS_HWO if the queue is active, and stored tx_req->skb = skb.

If the modem does not ack the DS lock within PM_SLEEP_DIS_TIMEOUT_MS
(20 ms), the function returns -ETIMEDOUT. The skb stays on the ring, still
mapped and with HWO set.

The callers treat any non-zero return as "not sent" and free the skb:

  t7xx_port_fastboot_tx()    -> dev_kfree_skb(tx_skb)
  t7xx_port_ctrl_tx()        -> dev_kfree_skb(cloned)
  port_ctl_send_msg_to_md()  -> dev_kfree_skb_any(skb)

Later, t7xx_cldma_gpd_tx_collect() sees HWO cleared and req->skb non-NULL.
It then calls dma_unmap_single() and dev_kfree_skb_any() on the
already-freed skb. On reset, t7xx_cldma_clear_txq() frees req->skb in the
same way.

Until then, the next t7xx_cldma_hw_start_send() or queue resume would let
the modem DMA from the freed buffer.

The new comment says ret should only report the result of the send below.
Should every return after a successful queue report success? The other
option is to take the request back off the ring (unmap, clear HWO, clear
tx_req->skb, restore budget and tx_next) before returning an error.

The later patches in this series do not appear to touch
t7xx_hif_cldma.c, so this path would remain at the end of the series.

>  
>  	t7xx_pci_disable_sleep(md_ctrl->t7xx_dev);
>  	queue = &md_ctrl->txq[qno];

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120015556.131547-1-tim770802%40gmail.com
