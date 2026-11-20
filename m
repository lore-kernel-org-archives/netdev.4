Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152545;
	b=ofP20ybVKLiFKOXWqBecjlzsiMTf2g/llZemT2kYmgib3J7D9/siufn5gPVpbTy38+mf
	 X1wO26dCREwoongdYhsiqScQXGqRRUoCReYmCxjkZuBw7q+bEf3vM6HVgl2a0eRauh/zF
	 sR48Vq0YvoJysViJSfnseDrEnIQD4KJ8ayhACN9gXS+xbTQw75qGMxwSErnvmK5dGJ/fn
	 3/DXb7dhxlF6GJJeCjqsuv40rWVDh1fUL9n0JWHmGoKZ94L8JgluJMaStOesGlScCKzRV
	 0pw+unUGbHIrZxBjQpEk3WJrVxlwK9xNsfAGRQP7f4tmPELhSIREsUPagdbDLgWD/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152545;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XQbeFADGAxZRqiiyyzZqdT0TUYW6vebXpKkZsSMdm7I=;
	b=h56ho0JcZq/YkSwYUGQ9xsxKaCmBHIA5+cyyxS00u6TnR0853NSruBLB9UGAq7DCguru
	 5esznmJkV+IjHuJe3dD49fU83KsH7+MHb/OsejFQVBmtGEi9/IrPINiQS0RwCVoCnLv9H
	 aLooxI53KG9iufLDvNWGiCQQ7GX66wCX2HobJvnL+wULcgNR5MzH9InnLSB7Vjg2E8RGM
	 /DWEXVWVV16fiIBfA0b/QMU2z+tTSRs0oEkcQSGfa5JnzXX1DqCCWeM2P/Ik92d+9U/Gr
	 zokHQ9sRJgA65zTEYLzYAPQLtM/KYvv+WHXUc3msxcp0Xlm/6i1Hw57hH8zi2tDNHNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZkTVKZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70357606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZkTVKZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3EA1F000E0;
	Fri, 20 Nov 2026 05:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795152545;
	bh=XQbeFADGAxZRqiiyyzZqdT0TUYW6vebXpKkZsSMdm7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kZkTVKZshZIIejCZ05KmH8k0vp9NMEWNkwabMyDBJVROuioOlTRMbYSoYHVaHTT/v
	 TAigmhTpymF7fuTTNkRcVDzu+iG266Nb8nirjlBkO3s78nnRBZgDuBJrmxSbifn2Bo
	 QhbxVhCVVPZqI3bNh05oMnhih2gTTO9k6xBfDrfwHov3fmSOm/ZBlzLjE3Xl8xw7KK
	 gvOOhYm1g+/ZEVVbJfqTEmiz7xkNQ+hKpjbC1uHNBebB1kEK8bkederkHSTtdDm+Ne
	 +/MKqI0/VrJuyaY5eORBhICJZgBYFyMbFIfzEMeuMfCgZ+tcsNePahe7nFnJcWhtmJ
	 6DjmYlKOu5bxw==
Subject: Re: [PATCH v2 3/3] net: thunderbolt: Free partially completed skb
 when the link is torn down
From: netdev-bot+sashiko@kernel.org
To: mika.westerberg@linux.intel.com
Cc: netdev@vger.kernel.org, YehezkelShB@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Fri, 20 Nov 2026 05:29:04 +0000
Message-ID: <179515254415.3136.13667031381014860776@kernel.org>
In-Reply-To: <20261116142613.876208-4-mika.westerberg@linux.intel.com>
References: <20261116142613.876208-4-mika.westerberg@linux.intel.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch only partly closes the leak it claims to fix.

Pre-existing issues:
- [High] tbnet_connected_work() and tbnet_tear_down() are not serialized.
- [Medium] tbnet_tear_down() treats `login_sent && login_received` as
  proof that tbnet_connected_work() acquired the connection resources.

--

net: thunderbolt: Free partially completed skb when the link is torn down

This patch frees a partially assembled multi-frame Rx skb (net->skb) in
tbnet_tear_down(), after NAPI has been disabled and the rings stopped.
This keeps the skb from leaking when the link goes down mid-packet.

> diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
> index f76b4d134b330..2b95df73c6e51 100644
> --- a/drivers/net/thunderbolt/main.c
> +++ b/drivers/net/thunderbolt/main.c
> @@ -428,6 +428,9 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
>  		tbnet_free_buffers(&net->rx_ring);
>  		tbnet_free_buffers(&net->tx_ring);
>  
> +		dev_kfree_skb_any(net->skb);
> +		net->skb = NULL;
> +

[Severity: High]
Does the err_napi path in tbnet_connected_work() need the same free?

It runs the same Rx quiesce sequence but leaves net->skb set:

drivers/net/thunderbolt/main.c:tbnet_connected_work() {
    ...
err_napi:
	tbnet_napi_disable(net);
err_stop_rings:
	tb_ring_stop(net->rx_ring.ring);
	tb_ring_stop(net->tx_ring.ring);
	tbnet_free_buffers(&net->rx_ring);
	tbnet_free_buffers(&net->tx_ring);
	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
	tbnet_connect_failed(net);
}

tbnet_napi_enable() is called before tb_xdomain_enable_paths(). With the
software connection manager, tb_tunnel_alloc_dma() places the "DMA RX"
path before "DMA TX" in tunnel->paths[], and tb_tunnel_activate()
activates the paths in that order. Rx can therefore be live while Tx
activation is still running.

If the peer sends a multi-frame packet in that window, tbnet_poll()
stores the partial skb in net->skb. Suppose Tx path activation then fails
(a hop write error or a cable unplug). Control goes to err_napi. The
pages held by the skb were already detached from the ring
(tf->page = NULL), so tbnet_free_buffers() does not free them.

tbnet_connect_failed() then clears login_sent. After that, every
tbnet_tear_down() call from tbnet_stop(), tbnet_shutdown() or
tbnet_remove() skips the block that contains the new free:

	if (net->login_sent && net->login_received) {

Wouldn't free_netdev() then leak the skb along with up to
MAX_SKB_FRAGS+1 Rx pages?

If the peer logs in again instead, tbnet_poll() starts with the stale
net->skb and net->rx_hdr. Could tbnet_check_frame() then take the middle
of packet branch and drop the first valid frame of the new connection?

Would it be better to free the skb at the common Rx quiesce point, for
example in tbnet_napi_disable() after napi_disable(), or also at
err_napi?

[Severity: Medium]
This isn't a bug introduced by this patch, but the block that holds this
free treats login_sent && login_received as proof that
tbnet_connected_work() allocated the HopID and started the rings. Is
that always true?

tbnet_login_work() sets login_sent and queues connected_work.
tbnet_handle_packet() sets login_received and also queues it. If
tbnet_tear_down() runs from ndo_stop, shutdown, suspend or
disconnect_work before that work executes, stop_login() cancels it:

static void stop_login(struct tbnet *net)
{
	cancel_delayed_work_sync(&net->login_work);
	cancel_work_sync(&net->connected_work);
	...
}

Both flags are still true, so the teardown block runs anyway. Wouldn't
tb_ring_stop() then hit the "already stopped" dev_WARN for rings that
were never started? And wouldn't tb_xdomain_release_in_hopid() trigger
the ida_free() "which is not allocated" WARN for a HopID that was never
allocated?

The peer chooses remote_transmit_path. If another in-HopID user on the
same XDomain holds that ID, could ida_free() release that user's
allocation instead? That part is speculative.

The new dev_kfree_skb_any(NULL) itself is harmless in this case.

[Severity: High]
This is a pre-existing issue, but this free assumes two things: that NAPI
is quiesced, and that this block actually runs. Are
tbnet_connected_work() and tbnet_tear_down() serialized enough for that?

tbnet_tear_down() calls stop_login() before it takes connection_lock. The
protocol handler is still registered, so a TBIP_LOGIN that arrives in
that gap can requeue connected_work:

drivers/net/thunderbolt/main.c:tbnet_handle_packet() {
    ...
			mutex_unlock(&net->connection_lock);

			queue_work(system_long_wq, &net->connected_work);
    ...
}

tbnet_connected_work() checks the flags under the lock, then drops it.
The HopID allocation, tb_ring_start(), the buffer allocation,
tbnet_napi_enable() and tb_xdomain_enable_paths() all run without the
lock.

If the old connection still holds the HopID,
tb_xdomain_alloc_in_hopid() returns a different ID and
tbnet_connect_failed() clears login_sent. If that happens before
tbnet_tear_down() takes the lock, wouldn't the whole teardown block be
skipped? That would leak the paths, the NAPI state, the running rings,
the buffers, the HopID and net->skb. tbnet_stop() would then call
tb_ring_free() on running rings while the DMA paths are still active.

If connected_work gets past the HopID allocation instead, its
tb_ring_start(), tbnet_alloc_rx_buffers() and tbnet_napi_enable() calls
can run concurrently with the tb_ring_stop(), tbnet_free_buffers() and
dev_kfree_skb_any(net->skb) here.

tbnet_napi_disable() also checks a plain bool that connected_work writes
without the lock:

static inline void tbnet_napi_enable(struct tbnet *net)
{
	napi_enable(&net->napi);
	net->napi_enabled = true;
	...
}

static inline void tbnet_napi_disable(struct tbnet *net)
{
	if (net->napi_enabled)
		napi_disable(&net->napi);
	net->napi_enabled = false;
}

If tear_down reads napi_enabled before it is set, napi_disable() is
skipped. Can tbnet_poll() then run while the rings, buffers and net->skb
are being freed?

In that case connected_work also finishes bringing the link up with the
login flags already cleared, so later tear_down calls skip cleanup. If
NAPI was still enabled from the old connection, could napi_enable() also
hit its BUG_ON?

The peer controls when TBIP_LOGIN and TBIP_LOGOUT arrive. A LOGOUT also
leads to tbnet_tear_down() through disconnect_work.

The unlocked check-then-setup in connected_work and the stop_login()
call outside the lock predate this series. The napi_enabled flag was
added earlier in this series by "net: thunderbolt: Stop queueing Rx
buffers if allocation fails".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116142613.876208-1-mika.westerberg%40linux.intel.com
