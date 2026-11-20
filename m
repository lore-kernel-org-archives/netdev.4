Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152544;
	b=A2eZ4Qsh7fs0SqWCXguqr+1XKfGVh5p45Ey6A4ap8P40NMK9c+dRLTBtafKWJGn8Jjis
	 hoaLNssGI9MLRI/WHpxGXsnVAGSC1P/jiXj/4gfoikNTSmc3MsOE21+8uJOUnGbN6fyQP
	 OkQd6ssS1efyDq3UiUfWIll8pDAUNQh+jloVc9KjX2YUSN1xMH3DSZhjDQq1uFmpGb0sk
	 gBKHyuNR+6LKLesg7E273d2LrWjObmaCA0P50MA1wW4e2f3cz2Na7BcDqEXhE2L0IN8L2
	 U1T7G0EeUjqdbiya0MU/Twzeu+lgrAmNarys6nlH+n3zwxW0skB44z57p3KLqXJKKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152544;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BzRqkoKY7TOZjy4PeTC0fGp+7EcA4Wr9Q3Dsl2M1Gk4=;
	b=kmyUMyBvHbqz+YYRBRao7RIFCVZl0ihfa62xXsOivSdevHgJWxb8VJCbTIKE6n0W76oE
	 pGSeiZZ66kHTGufAaBbQn8Wr9cyqMomP4U8jM1pN5PiuZLDaQdSnq2l/d8kT5Gf4fJIjP
	 1WHqAwtqm20+LBJgo84X/c5Jrf8obwvalWk/ml6JCwvqw3Xcxt7gsKfma10MNc+N1OUjy
	 GO0WQmvTamrDc048GsO+H7tWNuBANZKB0ZWgob7eJ21grL17ZQIXefea90pR0BQrsvXhn
	 kSKZlB8dvkERV77E+DAOd8MCMtvOtUj4i4qB/SynvZCk0jsxvfjLyWqVCKxZ7/AErIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDrxCa6Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE748606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDrxCa6Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F961F000C6;
	Fri, 20 Nov 2026 05:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795152544;
	bh=BzRqkoKY7TOZjy4PeTC0fGp+7EcA4Wr9Q3Dsl2M1Gk4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dDrxCa6QiZO+hK4yBy3l0ZuR6H1K5Zkjx9kMwDE2ko++b5u/hv3I3QDxPmeLllW6a
	 GgX+y2lE9SN3AT9sEk+9H0kAKcky7q22JnLaDiufv/8LXmLgsiwtzEuyMkXEp/VYAZ
	 skrKdv+1xJVvwN7FpMHW8YsSAysRrOyjOsPtqjKN1bazD11PE1PhiRx07P3E8RxCId
	 8OnEqmRVkTiqxFkn+TGAfcnn0sqld16bUBGYfuR6761n/1lYZpmZLEHmtmFAd085Hd
	 U0Qi4yYFWL1N2I9xll/8FxygKBh2/RR6ncS0n+G+i20UxVRZvwzLliWxVq6nsJIW6V
	 Wi/JnP5eZTtPw==
Subject: Re: [PATCH v2 1/3] net: thunderbolt: Stop queueing Rx buffers if
 allocation fails
From: netdev-bot+sashiko@kernel.org
To: mika.westerberg@linux.intel.com
Cc: netdev@vger.kernel.org, YehezkelShB@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Fri, 20 Nov 2026 05:29:03 +0000
Message-ID: <179515254314.3136.10991358568283987720@kernel.org>
In-Reply-To: <20261116142613.876208-2-mika.westerberg@linux.intel.com>
References: <20261116142613.876208-2-mika.westerberg@linux.intel.com>
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

- [Medium] This patch moves NAPI enable/disable into the connection
  lifecycle, but the new code is not serialized with teardown.

--

net: thunderbolt: Stop queueing Rx buffers if allocation fails

When Rx buffer allocation fails, tbnet_alloc_rx_buffers() no longer frees
buffers that are already queued, and the callers are updated to match.
If tbnet_poll() cannot refill the ring, it keeps polling so it can retry.
NAPI enable/disable moves out of ndo_open/ndo_stop and into the connection
lifecycle: it is enabled after the rings are primed and disabled before
they are stopped.

Closes: https://sashiko.dev/#/patchset/20260902082128.1148463-1-mika.westerberg%40linux.intel.com

> diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
> index cf51b9c39f4ee..1593ad76e645a 100644
> --- a/drivers/net/thunderbolt/main.c
> +++ b/drivers/net/thunderbolt/main.c

[ ... ]

> @@ -366,6 +368,21 @@ static void tbnet_free_buffers(struct tbnet_ring *ring)
>  	ring->prod = 0;
>  }
>  
> +static inline void tbnet_napi_enable(struct tbnet *net)
> +{
> +	napi_enable(&net->napi);
> +	net->napi_enabled = true;
> +	/* Run once in case an Rx interrupt arrived while NAPI was disabled */
> +	napi_schedule(&net->napi);
> +}
> +
> +static inline void tbnet_napi_disable(struct tbnet *net)
> +{
> +	if (net->napi_enabled)
> +		napi_disable(&net->napi);
> +	net->napi_enabled = false;
> +}
> +
>  static void tbnet_tear_down(struct tbnet *net, bool send_logout)
>  {
>  	netif_carrier_off(net->dev);
> @@ -404,6 +421,8 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
>  		if (ret)
>  			netdev_warn(net->dev, "failed to disable DMA paths\n");
>  
> +		tbnet_napi_disable(net);
> +
>  		tb_ring_stop(net->rx_ring.ring);
>  		tb_ring_stop(net->tx_ring.ring);
>  		tbnet_free_buffers(&net->rx_ring);

[ ... ]

> @@ -678,7 +702,9 @@ static void tbnet_connected_work(struct work_struct *work)
>  
>  	ret = tbnet_alloc_tx_buffers(net);
>  	if (ret)
> -		goto err_free_rx_buffers;
> +		goto err_stop_rings;
> +
> +	tbnet_napi_enable(net);

[Severity: Medium]
Is this tbnet_napi_enable() serialized against tbnet_tear_down()?

tbnet_connected_work() reads login_sent && login_received once under
connection_lock and then drops the lock. Nothing checks the state again
before the rings are restarted and NAPI is enabled here.

On the teardown side, stop_login() calls
cancel_work_sync(&net->connected_work) before tbnet_tear_down() takes
connection_lock. A TBIP_LOGIN from the peer can still queue connected_work
after that point:

tbnet_handle_packet()
    mutex_lock(&net->connection_lock);
    net->login_received = true;
    net->remote_transmit_path = pkg->transmit_path;
    ...
    mutex_unlock(&net->connection_lock);

    queue_work(system_long_wq, &net->connected_work);

This can happen on the disconnect_work path (peer LOGOUT followed by
LOGIN), or during suspend while netif_running() is still true. If
connected_work gets connection_lock first, it sees connected == true,
because login_sent is still set from the old session.

If the peer reuses the same HopID, tbnet_tear_down() disables NAPI, stops
the rings, frees the buffers, releases the HopID and clears both login
flags. connected_work then allocates the HopID, restarts the rings and
calls tbnet_napi_enable(). NAPI is now enabled while login_sent and
login_received are both false.

The next tbnet_stop()->tbnet_tear_down() then skips the block guarded by:

    if (net->login_sent && net->login_received) {

So neither tbnet_napi_disable() nor tb_ring_stop() runs. Because this
patch removes the unconditional napi_disable() from tbnet_stop(),
tb_ring_free() runs and net->rx_ring.ring is set to NULL while NAPI is
still enabled.

Could an already scheduled or busy-poll tbnet_poll() then run against a
freed or NULL Rx ring? On the next ndo_open, would napi_enable() on an
already enabled NAPI hit the BUG_ON(!test_bit(NAPI_STATE_SCHED, &val)) in
napi_enable_locked()?

If the peer's new LOGIN carries a different transmit_path,
tb_xdomain_alloc_in_hopid() succeeds right away, and connected_work can
run at the same time as the locked part of tbnet_tear_down().
tbnet_napi_enable() can then run before tbnet_napi_disable(), which calls
napi_enable() on an enabled NAPI. Or it can run after it, in which case
napi_schedule() lets tbnet_poll() run at the same time as tb_ring_stop()
and tbnet_free_buffers(&net->rx_ring).

Does that match this part of the commit message?

    We prevent tbnet_poll() from being called when the connection
    is torn down and buffers are released by disabling NAPI before the rings
    are stopped

napi_enabled is a plain bool. It is written in tbnet_connected_work()
(including the err_napi path) without connection_lock, and read and
cleared in tbnet_tear_down() under connection_lock. Can it reliably track
whether NAPI is enabled?

The race between connected_work and tbnet_tear_down() itself seems to
predate this patch: rings could already be restarted with the login flags
cleared. This patch adds NAPI enable/disable to that unserialized handoff
and drops the unconditional napi_disable() from tbnet_stop().

Would it help to re-check the connection state and do the ring start and
NAPI enable under connection_lock (or with a generation/state check)? Or
to make the NAPI disable in tbnet_tear_down() independent of the login
flag test?

>  
>  	ret = tb_xdomain_enable_paths(net->xd, net->local_transmit_path,
>  				      net->tx_ring.ring->hop,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116142613.876208-1-mika.westerberg%40linux.intel.com
