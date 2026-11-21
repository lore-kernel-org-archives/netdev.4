Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293448;
	b=e7hL5YhDs/aZjRAGm+DNWi/l7ImYgBTVOpm9nyJaHLjHLk6KyIN8R+J/pX+rLQHTfxwC
	 3LF9UkaYdD4qMC8F5U1yUkQ/D5Z0C/tRcsxFttzM9Qwv+bLkCTqFoE0Ki50q9ABH3PYpm
	 A2GIYp/3dK6Aeq+S4CJkNACgGK6eOgQWtqdeRKHP09TsQG7Ns3m6pWJVlUo0CeLoCQpPj
	 Ks0aMk42JSo2gjFsXw5UgvsXB4ZaerIdiVJwqZ6HPijdzHMOs8cdusbsEc6aY0j+UB43U
	 sspiCy1kf/eDoJLeG6E+yXN8LClMtQMJHD+Pkou+xZRGzETe+KVoO1AYDi/nhWJC8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293448;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ght0jMClRvRbVsMcJvSI10A8vVgfhTEERWLX+iA+QgI=;
	b=TETybsTf89Vy9ShM4ud7vNw9IAj0V5WNTVZB2ts5mSfJDUmKlKmt8A6uBz3pBq+lqC0S
	 Ykvc/NmXK7aFlr595LqfZNGOwJrT05WBb7PkDS+kRlMgnnYdVx2hVgZP3kWKe9QQp7hgD
	 7i4fo4+PN7Kre7dJc20wPy0BS07OCqnNMvM6wM37uiKr8uKek+SypF49xhxVbXi6fx8lE
	 7AhYTQNB/y7CKsK3qxkWiGMVgItveL5UgmZaPtwEpgPGGwfusF23EwSh8DBBib/IAY1E2
	 zTMapt+SUEK5O6aEatFhIr3kPj/4Mg8RRkJQnKGaXTUt8gj9nuiT6/I0DsrGAL6sD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQaaQTSD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A2606A32A;
	Sat, 21 Nov 2026 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQaaQTSD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F21F000C4;
	Sat, 21 Nov 2026 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293448;
	bh=Ght0jMClRvRbVsMcJvSI10A8vVgfhTEERWLX+iA+QgI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LQaaQTSDhZob8ozFLXa9bJ8/+7zhC6zCRuIni14PFynEbyGw/jWytUlYhcBPWlui9
	 gb6pgD0n8V4X9DuL5C22+jRh+8Yku087bdUvSpiJTn6C3FP4rKwK9bkEDIpz+7B0H5
	 NJ38ol/VSL2fw8j7hrYKJZf0g1cYKDogGSwGUHtXVWVu3X5XB5rvyM+mswWymgU6f9
	 c5TL/g7iQumBVH41rZ51KyMNGR+c4SiA90ifaEVkBqez2arnoBsLo6BTvkYcklZQDL
	 qwchWyoBmHuIKfRBoWyeUf+oyQ+T4erqp6pEBhGa+ONFSR9MD+jSlNwSyEjUfkxGgH
	 KyTDUFUD67tFQ==
Subject: Re: [PATCH net v3] wireguard: drain per-peer queues with sentinels
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, edumazet@kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Date: Sat, 21 Nov 2026 20:37:27 +0000
Message-ID: <179529344756.3135.530687351541002943@kernel.org>
In-Reply-To: <20261117-fix-wg-peer-removal-v3-1-36cf733c2d94@cloudflare.com>
References: <20261117-fix-wg-peer-removal-v3-1-36cf733c2d94@cloudflare.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] peer_remove_after_dead() (drivers/net/wireguard/peer.c:128) now
  runs a plain, non-expedited synchronize_rcu() for every peer it…
- [Low] The patch adds the same rcu_read_lock()/rcu_read_unlock() section
  to both wg_queue_enqueue_per_peer_tx() and…
- [Low] peer_remove_after_dead() (drivers/net/wireguard/peer.c:96-98) now
  puts two whole struct sk_buff objects (`struct sk_buff tx = { }, rx =…

--

wireguard: drain per-peer queues with sentinels

This patch drops the device-wide flush_workqueue() calls in
peer_remove_after_dead(). In their place it appends drain sentinels to the
peer's TX and RX prev_queues and waits for them, then calls
synchronize_rcu() and does per-peer flush_work() and napi_disable(). The
crypto helpers that publish packet state and notify the consumers are now
wrapped in RCU read-side sections, so the grace period covers them.

> diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
> index 1cb502a932e07..25d87509df938 100644
> --- a/drivers/net/wireguard/peer.c
> +++ b/drivers/net/wireguard/peer.c
> @@ -93,6 +93,10 @@ static void peer_make_dead(struct wg_peer *peer)
>  
>  static void peer_remove_after_dead(struct wg_peer *peer)
>  {
> +	struct sk_buff tx = { }, rx = { };
> +	DECLARE_COMPLETION_ONSTACK(tx_done);
> +	DECLARE_COMPLETION_ONSTACK(rx_done);
> +

[Severity: Low]
This isn't a bug, but does peer_remove_after_dead() need two full struct
sk_buff objects on the stack?

The prev_queue code and the new sentinel checks in wg_packet_tx_worker()
and wg_packet_rx_poll() only touch NEXT(skb), which is skb->prev, and
PACKET_CB(skb), which is skb->cb[].

The two sk_buffs plus the two on-stack completions come to several hundred
bytes. That grows with KCOV, conntrack, lockdep or KASAN stack redzones.

The file already uses a smaller layout-compatible stand-in for the queue
stub:

drivers/net/wireguard/device.h:
struct prev_queue {
	struct sk_buff *head, *tail, *peeked;
	struct { struct sk_buff *next, *prev; } empty; // Match first 2 members of struct sk_buff.
	atomic_t count;
};

Would a similar smaller object, covering only the fields the sentinel
actually uses, be enough here?

> @@ -105,28 +109,32 @@ static void peer_remove_after_dead(struct wg_peer *peer)
>  	 */
>  	wg_timers_stop(peer);
>  

[ ... ]

> +	wg_prev_queue_enqueue_sentinel(&peer->tx_queue, &tx, &tx_done);
> +	wg_prev_queue_enqueue_sentinel(&peer->rx_queue, &rx, &rx_done);
> +	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
> +		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
> +	napi_schedule(&peer->napi);
> +	wait_for_completion(&tx_done);
> +	wait_for_completion(&rx_done);
> +
> +	/* Handle edge cases where a consumer can finish a packet before crypto
> +	 * helper schedules the consumer again. Use RCU sync to ensure that all
> +	 * notification helpers finish.
>  	 */
> +	synchronize_rcu();

[Severity: High]
Should this be synchronize_net() rather than a plain synchronize_rcu()?

On the netlink path the caller holds RTNL, because wg_set_device() takes
rtnl_lock() before it updates peers. synchronize_net() switches to an
expedited grace period in that case:

net/core/dev.c:synchronize_net() {
    ...
	if (from_cleanup_net() || rtnl_is_locked())
		synchronize_rcu_expedited();
	else
		synchronize_rcu();
}

peer.c already uses synchronize_net() in wg_peer_remove() and
wg_peer_remove_all().

With WGDEVICE_F_REPLACE_PEERS (as used by wg setconf), the path is:

wg_set_device()
  rtnl_lock()
  wg_peer_remove_all()
    synchronize_net()
    list_for_each_entry_safe(peer, temp, &dead_peers, peer_list)
      peer_remove_after_dead(peer)
        synchronize_rcu()

So RTNL is now held for one normal grace period per peer. That comes on
top of the expedited grace period that netif_napi_del() already costs for
each peer.

With thousands of peers, could wg setconf now hold RTNL for seconds or
longer?

Before this patch, removing peers from an idle device cost little more
than the expedited grace period in netif_napi_del(). Removing a single
peer through wg_peer_remove() now also adds a normal grace period under
RTNL.

The commit message gives RTNL latency as the motivation:

  "Unrelated peers can keep those workqueues busy, delaying removal and
  other users of RTNL."

For bulk replacement, though, RTNL hold time seems to grow linearly with
the peer count. WG_CMD_SET_DEVICE uses GENL_UNS_ADMIN_PERM, so
namespace-scoped CAP_NET_ADMIN is enough to trigger this.

Would either of these avoid it?

  - use synchronize_net() here
  - batch wg_peer_remove_all(): enqueue all the sentinels, wait for all
    the completions, then do one grace period before the per-peer flush
    and NAPI teardown

wg_destruct() also reaches wg_peer_remove_all(), but it drops RTNL first,
so that path only gets slower.

[ ... ]

> diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> index 663b19b783953..e8d912f36ed86 100644
> --- a/drivers/net/wireguard/queueing.h
> +++ b/drivers/net/wireguard/queueing.h

[ ... ]

> @@ -194,9 +204,11 @@ static inline void wg_queue_enqueue_per_peer_rx(struct sk_buff *skb, enum packet
>  	 */
>  	struct wg_peer *peer = wg_peer_get(PACKET_PEER(skb));
>  
> +	rcu_read_lock();
>  	atomic_set_release(&PACKET_CB(skb)->state, state);
>  	napi_schedule(&peer->napi);
>  	wg_peer_put(peer);
> +	rcu_read_unlock();
>  }

[Severity: Low]
This isn't a bug, but wg_queue_enqueue_per_peer_rx() still has the old
comment above this section:

	/* We take a reference, because as soon as we call atomic_set, the
	 * peer can be freed from below us.
	 */

kref_release() frees the peer through call_rcu(), so the peer can't be
freed inside the new RCU section.

wg_queue_enqueue_per_peer_tx() got the same code change, and its comments
were updated to "Keep the peer alive across state publication and TX
scheduling." and "Teardown waits for this section after the drain sentinel
completes."

Could the RX comment be updated to match, and also explain the new RCU
section?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-fix-wg-peer-removal-v3-1-36cf733c2d94%40cloudflare.com
