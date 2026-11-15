Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777448;
	b=07DWeIYT8ybBNp6Sixs+hJNenXpSMfDIZeyUaX56u363E6eG6KZvcHzp5KDdZ7rrmPeG
	 QbdYoofEu7NUwo+HeOnRAit1q8x5rh9o2QjQ91BASqTafmh4AQNyKXCX4HDSB11GYJ8TN
	 VtcbrCrOOXbjUEhpJCxfLnBp/O1C18IjoE/8n+7q9VX9abqbw6ib1zMivMRfbKWVYsK96
	 XdM3o2U8OiDUYwOepE/dTOSTVrLYP6oQVZZGagS2mxK+Jzlg0aUw1UwqqYW/tHrmJHUZ3
	 suuyxvK5rTcaEuSGA6bpNbYyOOnWU2tvaVbcGBZkjT0+/pyOzN2pNEA//ZDwH96cO3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777448;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/i8ZOAiepp/PGkORWIRG6O/6WCcMM+wyJ+tB43yNBv4=;
	b=vGSUUnqn59WMrt+SGfmuVZ2RcRVh9ROstJaq8nF0RcHixcQcOcyJmVbypYZGtMr/RIlq
	 CYQOz1fYfkKDlHsEaL67PtzJV3n47IJQ8ldIC5nOqQxGhAn5BNRQAdWf7bTULmPbkenl1
	 AxDqMTLY0tM6XShsHAEL76hSuKtSNnX7MakgxkOTEhWKOaU9lXfxzQg9akp1PCXuu+4oO
	 PyDVldIYgeG8MqsXunikYFRW9nZ1Nspn1UYX85xRl2g68hQQhrnVRWzGKJQgbOki+QjxM
	 5VzJSB+TW8fa0pA0jwvnexX8qMpdO5pMNjYLX11+Q02/edEBSW1r+XD/9wnnRx/KEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoEek1Ji;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12CE606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoEek1Ji
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E5F1F000C5;
	Sun, 15 Nov 2026 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794777447;
	bh=/i8ZOAiepp/PGkORWIRG6O/6WCcMM+wyJ+tB43yNBv4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OoEek1Ji3J5ZCRoicmQ0jnPzhM48dkfNodJn6daW1hsE21DBxzOTjyYe8iB7UVEkG
	 IOhB7SURt7d0ZsMRQcwYIU9n3koUGB9HfbKB2NZRfe265lfNxo7bwfvrNhfYkv6tR7
	 +G6Avv/iBWcu0TU6yrzig6Gt0L5QAV/ua7hDLwBpsDfw2A2o2JLm7z6enqz4+rLQ12
	 h7FLD3iiGM11+wWF5DOddZKGAPWi8ah6ZKuAmeupOKAnoTVZ8mtcEftidLJQj/K1ZA
	 aO8l8OjNZJIuxwK1oREwxmwdk+J/uxlKjss25y9m/AJjteuXtmT3YRSYF11oSgyBdF
	 ftvHwYLsdTIAA==
Subject: Re: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
From: netdev-bot+sashiko@kernel.org
To: edumazet@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com,
 ncardwell@google.com, horms@kernel.org, netdev@vger.kernel.org,
 netdev-bot+sashiko@kernel.org, imv4bel@gmail.com
Date: Sun, 15 Nov 2026 21:17:26 +0000
Message-ID: <179477744662.3136.16061867603109307859@kernel.org>
In-Reply-To: <20261114111247.21995-1-edumazet@kernel.org>
References: <20261114111247.21995-1-edumazet@kernel.org>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

--

tcp: purge Fast Open RST queue when listen() fails

This patch moves the rskq_rst_head purge out of inet_csk_listen_stop()
into a new helper, reqsk_fastopen_purge_rst(). It also calls that helper
from the inet_csk_listen_start() error path, after the socket has been
set back to TCP_CLOSE. The goal is to reclaim Fast Open request_socks
that were queued while the socket was briefly in TCP_LISTEN.

Closes: https://lore.kernel.org/netdev/179450310167.2199510.18107423940014989443@kernel.org/

> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index ca3057192e6da..c33b0095468af 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c

[ ... ]

> @@ -1373,6 +1389,12 @@ int inet_csk_listen_start(struct sock *sk)
>  	}
>  
>  	inet_sk_set_state(sk, TCP_CLOSE);
> +
> +	/* A Fast Open child accepted before a previous shutdown() of this
> +	 * listener might have queued its request in rskq_rst_head while
> +	 * we were transiently in TCP_LISTEN state.
> +	 */
> +	reqsk_fastopen_purge_rst(&icsk->icsk_accept_queue);
>  	return err;
>  }

[Severity: High]
Does this error path also need to drain rskq_accept_head?

The commit message says the socket goes back to TCP_CLOSE "without going
through inet_csk_listen_stop()". This path only cleans up rskq_rst_head,
but the accept queue can be filled during the same TCP_LISTEN window.

After shutdown(SHUT_RD) or connect(AF_UNSPEC), inet_csk_listen_stop()
drains the accept queue. TCP_NEW_SYN_RECV request_socks still stay in
ehash with rsk_listener pointing at this socket, until
reqsk_timer_handler() drops them.

Suppose listen() is called again, and the peer's final ACK for one of
those requests arrives while sk_state is TCP_LISTEN:

tcp_v4_rcv()
    if (unlikely(sk->sk_state != TCP_LISTEN))   <- not taken
    tcp_check_req()                             <- no listener re-check
        tcp_v4_syn_recv_sock()
        inet_csk_complete_hashdance()
            inet_csk_reqsk_queue_add()

Under rskq_lock, inet_csk_reqsk_queue_add() still sees TCP_LISTEN and
queues the child:

	} else {
		req->sk = child;
		req->dl_next = NULL;
		...
		queue->rskq_accept_tail = req;
		sk_acceptq_added(sk);
	}

__inet_inherit_port() can succeed here when the port was locked by an
explicit bind(). That is also the setup of the -EADDRINUSE example in
the commit message.

If get_port() or hash() then fails, the socket returns to TCP_CLOSE. The
req and child are still on rskq_accept_head, and sk_ack_backlog is not
zero.

Nothing seems to reclaim them after that:

- inet_csk_accept() rejects sockets that are not listening.

- __tcp_close(), tcp_disconnect() and tcp_abort() only call
  inet_csk_listen_stop() from TCP_LISTEN.

- A later successful listen() overwrites rskq_accept_head and resets
  sk_ack_backlog in reqsk_queue_alloc().

Wouldn't this leak the established child socket, its request_sock, and
the listener reference held through rsk_listener? That is the same kind
of leak this patch fixes for rskq_rst_head.

Could the error path run the full inet_csk_listen_stop() cleanup after
setting TCP_CLOSE? Alternatively, could TCP_LISTEN be set only after
get_port() and hash() succeed?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114111247.21995-1-edumazet%40kernel.org
