Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458660;
	b=Krcvrgqr0S3obmVi75pIox5FghUk729jaRB9jIxlpvi8vr+eIHIoSS185VjpVA06D5k3
	 +YFAIrZkkzbEHUF4+eFGj5WRPMcVV5EEQTPW5BVMzCZeurXtj5j2VIltu4ARpXuw8+fGp
	 ihyVgz2gr0DRqW6iEEsPRXBB/0O6w/0ftbd0fxEfqNrg5EM/CEYlRg8XVhpBKaOiOyfby
	 bxdNCMvvkFfiF1RzUN3zkRJryJ9bR0vtMCSNnd+YuhBe6w4JDVqAmGQxzbY/p93nvhbSO
	 mDY7jfNvsWa4Hs7+/7O0Mg+sPOwNPfdGhJVYWuthjO7RtgP8PKaY3DpEjQUGCtQj1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458660;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ziPq+rozolTFcfNoS5trKF207s8r7DJFetFXDyLmxW0=;
	b=ygUbZ7OfmDanzsYPXrozdd5UYdrOgzuDZNTJFUJZDUnUtawjeAXPtsAKcqmXYe/JYjkA
	 vtY/qL+Re0T1P9ATmuXmLHq5w5FjfMNcMbqnGE025IdC9TttNaBmVRxnYH6e4MfvP4sSH
	 bPK3NS2mn1gcSMkl6r/sSLC+Et3WITEo4rzy7gYoEMD1ri2bSr9gUqQkXFw70Fdpe8olV
	 OHuT731lwafX7wkEP8eZvKsRK+r8qcrs+xQx5nhooE9dHU9HOx6yW2Mp1BBnsE735Y5p9
	 8bZTHPK3fkwOqah0jhtZhgvAjtmnuMqEALJJHALw75lzJSMN+QR6SnLldMcx6f5iUuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpxRiSY7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F9606A31A;
	Mon, 23 Nov 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpxRiSY7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDCB1F000C0;
	Mon, 23 Nov 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458659;
	bh=ziPq+rozolTFcfNoS5trKF207s8r7DJFetFXDyLmxW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hpxRiSY7HpcAIL55xRlAm1lflsBTQn8fl9d6/ZHCwN1U5The5a9miNZIpDt70xwux
	 WTTX8RmlJ/4q/8Zd7YYxPMyiLGwJJKdEsr/xU7yWKaz5GaAWEn6Q/ksWceinw98jEX
	 nCARY3P+70q9exQORVcQZpwenY7A7+co2PfEh+I28DS/ViDtD5kQov5vFWi0I0GzOl
	 LF0tWlKt5Se6rdid3qOy/Qs+nRdW4Ke+RcDEHWrUlvbII3zBKoMNAYcXxL3S7sXXt7
	 sdihoGiNnHRAK20Misl8C87lGGhvZYJRez6RwwFGsMqOHtXAJ6zzY4i95qx8JEvweh
	 pf7a6kNaXpEow==
Subject:
 Re: [PATCH net v6 1/5] bnxt_en: return the RING_FREE status to callers
From: netdev-bot+sashiko@kernel.org
To: joe@dama.to
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 prashant@broadcom.com, edumazet@google.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 18:30:57 +0000
Message-ID: <179545865792.3135.13782875077253506018@kernel.org>
In-Reply-To: <20261120152830.699712-2-joe@dama.to>
References: <20261120152830.699712-2-joe@dama.to>
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes an errno contract that
  hwrm_ring_free_send_msg() (drivers/net/ethernet/broadcom/bnxt/bnxt.c)…
- [Low] The commit message says 'No caller acts on it yet, so there is no
  functional change' but still carries `Fixes: 74608fc98d28`.
- [Low] In hwrm_ring_free_send_msg()
  (drivers/net/ethernet/broadcom/bnxt/bnxt.c), the `return -EIO;` left…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is still
  present at the end of the series.

--

bnxt_en: return the RING_FREE status to callers

This patch makes hwrm_ring_free_send_msg() pass up the errno from the HWRM
layer on failure. Before, it always returned -EIO. It also changes
bnxt_hwrm_tx_ring_free(), bnxt_hwrm_rx_ring_free() and
bnxt_hwrm_rx_agg_ring_free() to return that status, though no caller uses
it yet.

> No caller acts on it yet, so there is no functional change.
>
> Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")

[Severity: Low]
This isn't a bug, but is the Fixes tag meant to be here? The commit message
says there is no functional change. At this commit, every caller of the TX,
RX and AGG helpers still ignores the return value.

Later patches in the series carry the same Fixes tag and depend on these
return values, for example "bnxt_en: stop DMA before releasing rings the
firmware did not free". If the tag is there so stable takes this patch
together with them, could the commit message say so?

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index e78cf7ad3cbc8..c3413354e7582 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -7673,55 +7673,62 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
>  	if (rc || error_code) {
>  		netdev_err(bp->dev, "hwrm_ring_free type %d failed. rc:%x err:%x\n",
>  			   ring_type, rc, error_code);
> +		if (rc)
> +			return rc;

[Severity: Medium]
Does the errno returned here match what the commit message describes? The
message says:

    Return the errno from hwrm_req_send() instead. -EBUSY means no response
    arrived: the wait timed out, was abandoned, or the firmware channel is
    down.

If the channel is already down, the request never reaches __hwrm_send(),
because hwrm_ring_free_send_msg() returns success first:

	if (BNXT_NO_FW_ACCESS(bp))
		return 0;

So the only channel-down case that comes back as -EBUSY is a FW_FATAL_COND
that gets set during the wait.

Some cases where RING_FREE never reaches firmware return -ENOMEM, not
-EBUSY. The first is hwrm_req_init() failing in __hwrm_req_init():

	req_addr = dma_pool_alloc(bp->hwrm_dma_pool, GFP_KERNEL | __GFP_ZERO,
				  &dma_handle);
	if (!req_addr)
		return -ENOMEM;

The second is __hwrm_send() failing before it sends anything:

	token = __hwrm_acquire_token(bp, dst);
	if (!token) {
		rc = -ENOMEM;
		goto exit;
	}

__hwrm_to_stderr() also maps a firmware HWRM_ERR_CODE_NO_BUFFER reply to
-ENOMEM. A caller therefore can't tell "never sent" from "firmware
rejected" for that errno. Also, the hwrm_req_init() error is returned here
as well, not only the errno from hwrm_req_send().

Later in the series, bnxt_hwrm_ring_free() counts a ring as stuck only
when the helper returns -EBUSY:

	if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path) == -EBUSY)
		stuck++;

On the -ENOMEM path, would the ring then be released through
bnxt_free_mem() without bnxt_stop_dma()? Firmware never got the RING_FREE
and still owns the ring. The path would be:

__bnxt_close_nic()->bnxt_shutdown_nic()->bnxt_hwrm_resource_free()->
  bnxt_hwrm_ring_free()->bnxt_hwrm_tx_ring_free()->
    hwrm_ring_free_send_msg()->hwrm_req_init() returns -ENOMEM

>  		return -EIO;

[Severity: Low]
Can this return -EIO still be reached? __hwrm_send() sets rc with
__hwrm_to_stderr() from the same response error_code, and only
HWRM_ERR_CODE_SUCCESS maps to 0. So rc == 0 with a nonzero error_code
doesn't look possible. On the hwrm_req_init() failure path, error_code
stays 0 and rc is nonzero.

This isn't a bug, but rc is now the errno handed to callers, and the
netdev_err() above prints it as rc:%x (for example rc:fffffff0). Would %d
be clearer? The %x format predates this patch. After a timeout or abandon,
the err:%x value also comes from a response buffer that firmware never
wrote.

>  	}
>  	return 0;
>  }

[ ... ]

> -static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
> -				   struct bnxt_rx_ring_info *rxr,
> -				   bool close_path)
> +static int bnxt_hwrm_rx_ring_free(struct bnxt *bp,
> +				  struct bnxt_rx_ring_info *rxr,
> +				  bool close_path)
>  {

[ ... ]

> -	hwrm_ring_free_send_msg(bp, ring,
> -				RING_FREE_REQ_RING_TYPE_RX,
> -				close_path ? cmpl_ring_id :
> -				INVALID_HW_RING_ID);
> +	rc = hwrm_ring_free_send_msg(bp, ring,
> +				     RING_FREE_REQ_RING_TYPE_RX,
> +				     close_path ? cmpl_ring_id :
> +				     INVALID_HW_RING_ID);
>  	ring->fw_ring_id = INVALID_HW_RING_ID;
>  	bp->grp_info[grp_idx].rx_fw_ring_id = INVALID_HW_RING_ID;
> +	return rc;
>  }

[Severity: High]
This is a pre-existing issue that this patch did not introduce, but it is
still there at the end of the series.

bnxt_hwrm_tx_ring_free(), bnxt_hwrm_rx_ring_free() and
bnxt_hwrm_rx_agg_ring_free() clear fw_ring_id on every path. The RX and AGG
helpers also clear the grp_info rx_fw_ring_id and agg_fw_ring_id. The queue
management callers ignore the status these helpers now return.

bnxt_queue_stop() does:

	bnxt_hwrm_rx_ring_free(bp, rxr, false);
	bnxt_hwrm_rx_agg_ring_free(bp, rxr, false);
	page_pool_disable_direct_recycling(rxr->page_pool);

It then hands the old ring and page pool to qmem, and ndo_queue_mem_free
frees them later.

bnxt_tx_queue_stop() does:

	bnxt_hwrm_tx_ring_free(bp, txr, true);
	bnxt_hwrm_cp_ring_free(bp, txr->tx_cpr);
	bnxt_free_one_tx_ring_skbs(bp, txr, txr->txq_index);

This unmaps and frees the TX buffers right after an -EBUSY that nobody
checks.

If firmware doesn't answer RING_FREE here, can the device keep writing into
freed RX pages, or keep reading from unmapped TX buffers?

The close path log in this series shows firmware can keep doing DMA after
an unanswered RING_FREE (AMD-Vi IO_PAGE_FAULT). However, only the close,
half-close and init-error paths through bnxt_hwrm_ring_free() were changed
to stop DMA.

The RX side is reachable through netdev_rx_queue_restart()->
bnxt_queue_stop(), for example from the TPH IRQ affinity notifier or from
binding a devmem or io_uring zcrx queue. The TX side is reachable through
bnxt_tx_queue_stop() when BNXT_FLAG_SHARED_RINGS or tph_mode is set.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120152830.699712-1-joe%40dama.to
