Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395978;
	b=DGPrsFs08g8ZrfezoZBUW49zGTD4JrZiAdP/PnRmgb2bMBLWEXxO5wqhwS2HK1z9e+Av
	 vyQz4wI4Kll50gwbiBHv3Gh7FSRQjHJAZIYSybjgMqWI3evgoX2qOC9cI1r4MiIziqQxM
	 2NqKNrOsbs67rA2VoJ7/YLnyMl9SF3/EjU/Met4bi3htLcrFS9yEV9kn8q60gCJC81SsZ
	 60ZYcf58q/EcBOxcHXX73jT1Gj/FGt0vPmGyK0nLRdi2HyTPQnBoqaCzepQ6svVss7r3n
	 C8HaH32BE/hcc1BHi4RUc1t9+ktiCo7x+eRHhd3bygl9CuJJmQbw7aQRoGtihTKlZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395978;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1Zoo9XJTPYrdHfSXlDKHwIXN7MYXmeiXVWp4UATL1+w=;
	b=i9yv2iZWZ36URmvpCRKMRHOBkcrTXfvCvsQVI/6UjoKFdTSGd0gx2OATvuDiSz9FWOAW
	 A/dLXe94BQhZpGvBa+6UJ1TDRDGlRi1AY9CB5/cjyGfkWEhVBGM1MV+sKOeXq4rYBBsVj
	 mUD8sP6AEJoO1Efm3VUysOKBzf701D3bizN+CUOyfGnbibPKQPlA79mNXdP6k1jwMAeTU
	 FSoWMGQcUNuPfolTgc/5eHj5Ykz4SAw4mGXtsKLh1IVEFC9eNOeV/k5H66vYankAMG0bb
	 gusczYRJRXQoY/G9sqWqw8QO8p+025OGpfhLzJGstyHfv75lXcEStsJM/sODE9NJ0bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8ek+V4A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09031606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8ek+V4A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701FB1F000C6;
	Mon, 23 Nov 2026 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395977;
	bh=1Zoo9XJTPYrdHfSXlDKHwIXN7MYXmeiXVWp4UATL1+w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y8ek+V4AUqm0sZMkfViyq64LAnqX/EwXoOoe5snZbxetmNhugEN4nVDzROySacgSs
	 EUtflDx6TucnPzwRIVI+DTgA8ypPs7+6B003bvTALwyNpZIhhJpOyU5equc8FXAVNW
	 eAlE3yCrT4M/aRw8DWFnNmPEUgNN++0aw1aYWfqBWkBRAMWiFUax9P5N8f5NjgHOUL
	 u2m/IgsXezO9pVF+gkTrWlNAwRR1kyH5EqUyOHcWVw0XpIX3PT1Kvp23XxPQB8obnC
	 DLwLFnEeUdhisf5+fk1EcJg7eqbw7E5we2oKT/RiiIxOBK18OWyflHzhD1LAF9lF4A
	 QZ6ijZcohiQng==
Subject:
 Re: [PATCH net 1/2] vmxnet3: drop XDP frames that do not fit in one rx buffer
From: netdev-bot+sashiko@kernel.org
To: filzador@gmail.com
Cc: ronak.doshi@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, kuba@kernel.org
Date: Mon, 23 Nov 2026 01:06:17 +0000
Message-ID: <179539597704.3135.16978504109818344145@kernel.org>
In-Reply-To: <20261122002847.616-2-filzador@gmail.com>
References: <20261122002847.616-2-filzador@gmail.com>
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

- [Medium] The commit message says the XDP head buffer given to the
  device is MTU + 22 (skb_buf_size).
- [Low] In vmxnet3_rq_rx_complete() (drivers/net/vmxnet3/vmxnet3_drv.c),
  the new comment says "Count it against the budget like other XDP…
- [Low] A frame dropped by the new head-drop branch in
  vmxnet3_rq_rx_complete() is counted twice in rq->stats.drop_total if…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch's
  new poll-start logic relies on the invariant it breaks, and it can…

--

vmxnet3: drop XDP frames that do not fit in one rx buffer

With XDP enabled, a frame the device splits over a head and a body
descriptor used to reach the skb path in vmxnet3_rq_rx_complete(). That
path treated the page_pool page as an skb and crashed the guest. This
patch drops such frames at the head, skips their body buffers, and
starts each poll with skip_page_frags set when no frame is in progress.

> diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
> index f8df83f9965db..fb98eb7712584 100644
> --- a/drivers/net/vmxnet3/vmxnet3_drv.c
> +++ b/drivers/net/vmxnet3/vmxnet3_drv.c
> @@ -1614,7 +1614,8 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
>  		adapter->rx_prod_offset, adapter->rx_prod2_offset
>  	};
>  	u32 num_pkts = 0;
> -	bool skip_page_frags = false;
> +	/* A frame dropped at its head may continue in the next poll. */
> +	bool skip_page_frags = !rq->rx_ctx.skb;

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.
However, this new line assumes rq->rx_ctx.skb is NULL whenever no frame
is in progress, and the data ring XDP path can break that.

For a data ring completion with XDP enabled, VMXNET3_GET_RING_IDX()
returns 0, so rbi points into rq->buf_info[0]. vmxnet3_rq_init() marked
that entry VMXNET3_RX_BUF_XDP, so its union holds a struct page pointer.
The sop block in vmxnet3_rq_rx_complete() still does:

			skip_page_frags = false;
			ctx->skb = rbi->skb;
    ...
			if (rxDataRingUsed && vmxnet3_xdp_enabled(adapter)) {
    ...
				if (act == XDP_PASS) {
					ctx->skb = skb_xdp_pass;
					goto sop_done;
				}
				need_flush |= act == XDP_REDIRECT;

				goto rcd_done;
			}

On any verdict other than XDP_PASS, ctx->skb keeps the page pointer.
That includes an XDP_DROP firewall program. The stale value can carry
over into later polls.

Suppose the next completion has eop and err set. Would
vmxnet3_rx_error() then run this on a ring-owned page_pool page?

	if (ctx->skb)
		dev_kfree_skb_irq(ctx->skb);

With this patch, the stale non-NULL value also makes the next poll start
with skip_page_frags = false. An orphan non-sop body could then get past
BUG_ON(ctx->skb == NULL && !skip_page_frags) and reach
vmxnet3_append_frag() with the page treated as an skb.

Would it make sense to clear ctx->skb before that goto rcd_done? The
ring buffer XDP path already does this. Another option is to not assign
ctx->skb = rbi->skb for VMXNET3_RX_BUF_XDP buffers.

>  	bool encap_lro = false;
>  	struct Vmxnet3_RxCompDesc *rcd;
>  	struct vmxnet3_rx_ctx *ctx = &rq->rx_ctx;
> @@ -1666,6 +1667,21 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
>  			goto rcd_done;
>  		}
>  
> +		if (rcd->sop && !rcd->eop &&
> +		    rbi->buf_type == VMXNET3_RX_BUF_XDP &&
> +		    !VMXNET3_RX_DATA_RING(adapter, rcd->rqID)) {

[Severity: Medium]
The commit message says:

  the device is given a buffer length of MTU + 22 (skb_buf_size)

Does that hold for larger MTUs? vmxnet3_adjust_rx_ring_size() caps
skb_buf_size at VMXNET3_MAX_SKB_BUF_SIZE (3072) on v7:

		adapter->skb_buf_size = min((int)adapter->netdev->mtu + VMXNET3_MAX_ETH_HDR_SIZE,
					    VMXNET3_MAX_SKB_BUF_SIZE);

Before v7 it sets skb_buf_size = VMXNET3_MAX_SKB_BUF_SIZE once the MTU is
above 3050. vmxnet3_rq_init() then uses that value as the length of the
VMXNET3_RX_BUF_XDP head buffers.

vmxnet3_xdp_set() only rejects netdev->mtu > VMXNET3_XDP_MAX_MTU, which
is about 3494 on x86_64.

Take XDP attached with an MTU of roughly 3059 to 3494. Won't every
full-sized frame (MTU + 14 > 3072) be split into a head and a body, and
then be dropped silently by this branch? That would drop all full-MTU
traffic on such an interface, not only the MTU + 23 to MTU + 26 frames
the commit message describes.

The later commit "vmxnet3: keep the XDP program across device resets"
adds an XDP check to vmxnet3_change_mtu(). It uses the same
VMXNET3_XDP_MAX_MTU bound, though, so this MTU range still seems to be
accepted.

Could XDP head buffers get a device length based on
VMXNET3_XDP_MAX_FRSIZE instead? Alternatively, could XDP be rejected when
MTU + VMXNET3_MAX_ETH_HDR_SIZE > skb_buf_size?

> +			/* The frame did not fit one XDP buffer. XDP here is
> +			 * single-buffer and the head holds a page, not an skb:
> +			 * drop the frame, reuse the head, skip its body buffers.
> +			 * Count it against the budget like other XDP verdicts.
> +			 */
> +			rq->stats.drop_total++;

[Severity: Low]
Can a frame dropped here be counted twice in drop_total? Suppose its
eop body completion has rcd->err set. This check at the top of the loop
runs before the skip_page_frags handling:

		if (unlikely(rcd->eop && rcd->err)) {
			vmxnet3_rx_error(rq, rcd, ctx, adapter);
			goto rcd_done;
		}

vmxnet3_rx_error() then increments rq->stats.drop_total again, without
any condition. vmxnet3_get_stats64() reports drop_total as rx_dropped.

The skb allocation failure path already has the same double count, so
this adds a second case. Also, the comment in vmxnet3_rx_error() says
ctx->skb may be NULL only for the first and only desc of a packet. With
this patch, that no longer covers every case.

> +			ctx->skb = NULL;
> +			skip_page_frags = true;
> +			num_pkts++;

[Severity: Low]
Is the comment "Count it against the budget like other XDP verdicts"
accurate? After vmxnet3_process_xdp() returns a verdict other than
XDP_PASS, vmxnet3_rq_rx_complete() does:

			ctx->skb = NULL;
			need_flush |= act == XDP_REDIRECT;

			goto rcd_done;

and num_pkts is not incremented. The same goes for the data ring path
after vmxnet3_process_xdp_small(), and for the allocation failure drop
path that this branch says it copies. Only XDP_PASS is counted, later,
after sop_done.

That makes this the only drop path that uses up NAPI budget. Should the
comment and the commit message be adjusted, or should the accounting be
made consistent?

> +			goto rcd_done;
> +		}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122002847.616-1-filzador%40gmail.com
