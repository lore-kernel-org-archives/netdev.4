Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523624;
	b=g19C2+cAs6tcM2PgLIl75vEewZJ2lsPjt8StZfYRQcW7FFQIj4/CszvcTmc0bRjTjrAK
	 T4IvgmTd5RsYlb/gtwZ5987R3ly3L1n/zoN6dU72qeN3wx0oT74LSEmdhbxLMCQVM9QRB
	 UQ+C+NbJvrUIUvb8Lscp4gGNiOYgjP3dwM6VYQPCw3KU0Mt4+dNVCKkeE88K6PtzQjwrT
	 FJGUo0VZdTCBwGtZX93w6Lks5VnGHTsHuYlMVKVzRMrR5TdbFX3+SI57qzyYpV5iolAMX
	 IDA+Uod1SsiFvKcU4jvlWobwusn5ekdmoPM3LiytmqYBQPTZfa8NQHi1T+YHEplm2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523624;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mj4WIF0r5bDm7Ig3365eQeIDAcnQr8DdtDdiyJY6wmI=;
	b=i6juX1XBD9Z1lOKjPjXrvHZ5GaMI+f2ajNuhzzKyzWdAltW34gcrJC3LmhpoqUeszafY
	 +EcB7o4MvaI16+LGpKn6XWY19Zi2SFi7nC61TjrhYehdEPCOYfhgZVeN+aLMEnSLA26pH
	 K1tkxbzM5o+l4T5gnZKeK/1ZKihXbh/2Q1d5XqAFaA2Zv8xQkXtKHQg0WT/xIF1/o+uYS
	 34gILJ7JuLbKXBXmyei2quqKM8UwmtUbyoXv6XDCGrDF7g2OHwrM3OKtahWU9E46+Hkwm
	 V5K79RcriByYQ/5DI/U26qeWkWEFf99AVfPTTNWkHbYJLLVvHvdGSrcxkA4drY8ZsEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMlkKn5R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF7606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMlkKn5R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C83F1F000CA;
	Tue, 24 Nov 2026 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523623;
	bh=mj4WIF0r5bDm7Ig3365eQeIDAcnQr8DdtDdiyJY6wmI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iMlkKn5R54MXD0fpQiZmYkyJqVk7/GieIbXtGvPPrlmH/n//mi+gM++J2+muX3BEh
	 7j1PKJSBATDvSAgBxNhqv53xvFPDVWKdQCpkHODySFdqRle25dnTl1OXaZZbaPUgYL
	 +whKVer9U4m1C28UyR40H9hc3z14XDMtWi4sj4QZ6xSPbw6WIwkCDlB91Tu8DuoLpb
	 iArQwahDYPy+uJRzLAc3oT4GgRki1Nlmqj/zRtkeKeaDFFE+Qgj1gXYOroJUG72Wir
	 t1h+MLdR05PgCWo+LTvbYaW1oqBM44r+pG/TxJKnRQrF2A2+iLMeO+ga3LpmqgkUAJ
	 02yZXqnbpXwvw==
Subject: Re: [PATCH net 1/4] eth: fbnic: restart queues in place when
 fbnic_queue_stop() fails
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org, bjorn@kernel.org,
 bobbyeshleman@meta.com, almasrymina@google.com, daskald@meta.com,
 netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 12:33:42 +0000
Message-ID: <179552362260.3135.14543564146944003534@kernel.org>
In-Reply-To: <20261121033215.1020506-2-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-2-dimitri.daskalakis1@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] fbnic_queue_stop()'s new error path relies on a hardware
  guarantee that is never written down or checked.

--

eth: fbnic: restart queues in place when fbnic_queue_stop() fails

When the idle wait in fbnic_queue_stop() times out, this patch no longer
runs fbnic_nv_enable() and fbnic_nv_fill() on the error path. A new
helper, fbnic_nv_reenable(), sets the ring enable bits back without
resetting anything, so the hardware and the driver's ring state resume
in place. The fbnic_nv_enable()/fbnic_nv_fill() calls move from
__fbnic_nv_restart() into fbnic_queue_start().

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 381831b7e1080..c0fe89425430d 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -2326,6 +2326,50 @@ fbnic_nv_disable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)

[ ... ]

> +static void
> +fbnic_nv_reenable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)
> +{
> +	int j, t;
> +
> +	for (t = 0; t < nv->txt_count; t++) {
> +		struct fbnic_q_triad *qt = &nv->qt[t];
> +
> +		if (qt->cmpl.size_mask) {
> +			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TIM_MASK, 0);
> +			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TCQ_CTL,
> +					FBNIC_QUEUE_TCQ_CTL_ENABLE);
> +		}
> +		fbnic_reenable_twq(&qt->sub1, FBNIC_QUEUE_TWQ1_CTL);
> +		fbnic_reenable_twq(&qt->sub0, FBNIC_QUEUE_TWQ0_CTL);
> +	}
> +
> +	for (j = 0; j < nv->rxt_count; j++, t++) {
> +		struct fbnic_q_triad *qt = &nv->qt[t];
> +		u32 bdq_ctl;
> +
> +		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RIM_MASK, 0);
> +		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RCQ_CTL,
> +				FBNIC_QUEUE_RCQ_CTL_ENABLE);

[Severity: Medium]
Does this in-place resume rely on hardware behavior that is not
documented or checked anywhere?

The driver keeps all of its ring state across the disable/enable toggle.
That includes head/tail, the TCQ deferred_head, the TWQ0 deferred_meta,
and the partly built Rx frame in qt->cmpl.pkt.

For that state to stay correct, two things have to be true:

  - The device keeps its internal ring pointers and frame-assembly state
    when ENABLE goes 1->0->1 with no RESET.
  - Completion writes that were in flight when the CQ was disabled are
    held back or finished, not dropped.

Nothing on the disable side seems to ensure the second point.
__fbnic_nv_disable() turns off the CQs in the same burst as the
WQs/BDQs, without waiting for the upstream queue to drain:

fbnic_disable_tcq():
	fbnic_ring_wr32(txr, FBNIC_QUEUE_TCQ_CTL, 0);

fbnic_disable_rcq():
	fbnic_ring_wr32(rxr, FBNIC_QUEUE_RCQ_CTL, 0);

Also, err_restart in fbnic_queue_stop() is only reached when an idle bit
did not assert before fbnic_wait_queue_idle() timed out. That is when
the device is most likely in the middle of a descriptor or a frame.

On Rx, fbnic_clean_rcq() picks up from pkt = rcq->pkt. Suppose the RDE
had written the HDR_AL/PAY_AL completions for a frame, but its META
completion was lost while the RCQ was disabled. Would the next frame's
PAY_AL frags then be appended to the stale pkt?

The next frame's HDR_AL would also hit this check in fbnic_pkt_prepare():

	WARN_ON_ONCE(pkt->buff.data_hard_start);

pkt would then be overwritten, leaking the old page references.

On Tx, the cumulative head in the TCDs makes this partly self-healing.
Even so, could the Tx buffers, DMA mappings and BQL bytes stay stuck
until another completion arrives?

The commit message says the HW "resumes from where it stopped". However,
fbnic_csr.h only defines RESET and ENABLE for these CTL registers.

The injected tests cover "HW is idled, but waiting for queues to idle
fails" and "HW never stops (rings left enabled, and wait skipped)".
Neither covers a CQ that was disabled while a completion was actually in
flight.

Could this behavior be confirmed against the hardware documentation and
described in a comment? If that is not possible, other options would be
to disable the CQs only after the WQs/BDQs have gone idle, or to drop
the partial qt->cmpl.pkt state before resuming.

The later patches in this series ("net: add netif_disable_subqueue()",
"eth: fbnic: wait for in-flight xmit in fbnic_queue_stop()" and "eth:
fbnic: wait for both TWQs of a Tx queue to go idle") do not seem to
change fbnic_nv_reenable() or the disable ordering.

> +
> +		bdq_ctl = fbnic_ring_rd32(&qt->sub0, FBNIC_QUEUE_BDQ_CTL);
> +		fbnic_ring_wr32(&qt->sub0, FBNIC_QUEUE_BDQ_CTL,
> +				bdq_ctl | FBNIC_QUEUE_BDQ_CTL_ENABLE);
> +	}
> +
> +	fbnic_wrfl(fbn->fbd);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121033215.1020506-1-dimitri.daskalakis1%40gmail.com
