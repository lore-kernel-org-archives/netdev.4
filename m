Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770468;
	b=ySVbMMcI+OJFnfZVAiURn9sTNefkvClZwizG0UtEKKc2GvXKUBlAIUaHXqXt4R60Y1T0
	 /AAWqoAgrJ3fSpBktZoD4RSBpsdVd+TR1UDjEo5mtwiaDhuDMXqnfKKdG1hWx3dpPKhX5
	 0FHk8ZB9ojcI8tdvZOgTrJeSd4YCi5mLZrJv6ahw2Cdcq57fTZVHi0WbGBi5Z5iHYz8tq
	 3fAdTC9O5IBJWoMhVmRoa0RcFEgmdqSB9naFjonUZBCONQ9MYRxh9JDS9kM7zgf1H/OfN
	 KJGRVsScqMOmlYhI9vPntLYjRbWSllfUYI0dVE+yjM0KKJYwFApuxg93tWxvHgVVhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770468;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zRRThROE+AkCpaWtAXNlWMUc7xhN0txdUiuzXhQ3xC8=;
	b=DRgKnkz6VJ4WBopA7eX7BJFAb6ZNIsn0cZFxvJjraPXOhZbFg6HLOeap4dEkEnmdOTsz
	 bGRPwA/XUTvk71lKiAQ6HzlbQMaCKcXQY2rgxLyjvKU3jrtAQJqnNsfCH4F6l5cGlsmC9
	 4bXpwuczgSdf6FLnzpo7f5JkAIP2sdBphZle3ExWVFyENA6zfSUfA6lEHFW7tFGlQNneL
	 rOJ9c8xFT7T1DboPHcedqZnQyyI/uhaV64WTzb1SFWVp0/qRgmzhs+//W+3S0b4H8rx9s
	 tHthHgdTqR1L0pkr80tjjX/UxppIfpCHtyDRdu+gQxqyV5ehurFmJlLHekEVODgJhfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGdXxNR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A8606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGdXxNR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ACF1F0093B;
	Fri, 27 Nov 2026 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770468;
	bh=zRRThROE+AkCpaWtAXNlWMUc7xhN0txdUiuzXhQ3xC8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LGdXxNR5IrNwalxdLm1JNv2QZyBEoaEu+kVCl/ujSHegbkBzII/PvUuCq8gfw/RbW
	 /hmsQ55yzIKwyIQp4pZzAx/A7mOm1ShLRnR/ktg44gmzRltvdVlGcY+dqtdGzBouSp
	 rEghCIerahPJXSXIN32Ipfr4zHrlM4p2A8qdJDjm78pgmomjaU1jU5Sq+9aA4qWKJQ
	 LmKDGI8pta6kuaPPXnWI7rJ41gDsdiYSdxfhTY6s0y1e/mAqKAPyNQSYICFLOhwD5E
	 foUB0+4voRWSANOPsvwHfTfbjSPxIseDsOVMkqbKnqsZ3+Ba8AGRP4ywq65kg/Yd/o
	 NFfaHqj0ADFRg==
Subject: Re: [PATCH net v2] net: avoid clobbering active cork flowi union on
 datagram connect
From: netdev-bot+sashiko@kernel.org
To: dmnk@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, kuniyu@google.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 dmnk+artist@google.com
Date: Fri, 27 Nov 2026 09:07:47 +0000
Message-ID: <179577046722.3135.9189478439176832766@kernel.org>
In-Reply-To: <20261124180604.73257-1-dmnk@google.com>
References: <20261124180604.73257-1-dmnk@google.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] udp_sendmsg()'s connected fast path does not take the socket
  lock, and it still sends with whatever is stored in the shared…
- [High] Finishing an IPv4 cork on an AF_INET6 UDP socket connected to a
  native IPv6 peer only calls sk_dst_reset() (include/net/udp.h:429-432).
- [Medium] For non-UDP datagram sockets, __ip4_datagram_connect_corked()
  (net/ipv4/datagram.c) and ip6_datagram_dst_update_corked()…
- [Medium] L2TP UDP-encap transmit still uses the user tunnel socket's
  inet->cork.fl as its working flow while the user has frames corked.
- [Low] The comment "Throw away all pending data and cancel the corking.

--

net: avoid clobbering active cork flowi union on datagram connect

This commit makes datagram connect() use stack-allocated flow keys when
frames are corked on sk_write_queue, so the active inet->cork.fl union
is not overwritten. When a UDP cork completes on a connected socket, it
also restores the connected flow into inet->cork.fl. In the
cross-family and non-UDP cases it resets sk_dst_cache instead.

> diff --git a/include/net/udp.h b/include/net/udp.h
> index 5bc25dcf25fba..cee5ebd1edec8 100644
> --- a/include/net/udp.h
> +++ b/include/net/udp.h
> @@ -417,6 +417,27 @@ INDIRECT_CALLABLE_DECLARE(int udp_recvmsg(struct sock *sk, struct msghdr *msg,
>  					  size_t len, int flags));
>  void udp_splice_eof(struct socket *sock);
>  int udp_push_pending_frames(struct sock *sk);
> +static inline void udp_cork_restore_connected(struct sock *sk)
> +{
> +	struct inet_sock *inet = inet_sk(sk);
> +	struct flowi4 *fl4 = &inet->cork.fl.u.ip4;
> +
> +	if (sk->sk_state != TCP_ESTABLISHED)
> +		return;
> +
> +#if IS_ENABLED(CONFIG_IPV6)
> +	if (sk->sk_family == AF_INET6 &&
> +	    !ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
> +		sk_dst_reset(sk);
> +		return;
> +	}

[Severity: High]

Suppose an IPv4 cork completes on an AF_INET6 socket that is connected
to a native IPv6 peer. This branch only drops the dst. Is
inet->cork.fl.u.ip6 ever rebuilt in that case?

udp_sendmsg() wrote the corked IPv4 addresses and ports over the first
bytes of cork.fl.u.ip6.daddr:

    fl4 = &inet->cork.fl.u.ip4;
    fl4->daddr = daddr;
    fl4->saddr = saddr;
    fl4->fl4_dport = dport;

udp_v6_cork_restore_connected() does not run here either, because
udp_v6_push_pending_frames() returns early:

    if (up->pending == AF_INET)
        return udp_push_pending_frames(sk);

udp_v6_flush_pending_frames() likewise goes to
udp_flush_pending_frames().

The next connected native IPv6 send fills the cache again from its
stack flow:

udpv6_sendmsg()
  ip6_sk_dst_lookup_flow()
    ip6_sk_dst_store_flow(sk, dst_clone(dst), fl6)

After that, an L2TP-over-UDPv6 transmit goes through
l2tp_xmit_core()->l2tp_xmit_queue()->inet6_csk_xmit(). Because
__sk_dst_check() now succeeds, inet6_csk_route_socket() is skipped and
ip6_xmit() builds hdr->daddr from the stale cork.fl.u.ip6.

That would keep sending the tunnel's data packets to a corrupted IPv6
destination until the dst is invalidated or the socket reconnects. It
also seems to contradict the commit message's statement that L2TP
encapsulation never reuses the corked flow.

Should this branch rebuild the flow, for example with
ip6_datagram_flow_key_init(), rather than only calling sk_dst_reset()?

> +#endif
> +	WRITE_ONCE(fl4->daddr, READ_ONCE(inet->inet_daddr));
> +	WRITE_ONCE(fl4->saddr, inet->inet_saddr);
> +	WRITE_ONCE(fl4->fl4_dport, inet->inet_dport);
> +	WRITE_ONCE(fl4->fl4_sport, inet->inet_sport);
> +}

[Severity: High]

Can this restore protect the lockless connected fast path in
udp_sendmsg()? That path checks pending once without the lock and then
reads the shared cork union:

udp_sendmsg() {
    ...
    fl4 = &inet->cork.fl.u.ip4;
    if (READ_ONCE(up->pending)) {
        ...
    }
    ...
    if (connected)
        rt = dst_rtable(sk_dst_check(sk, 0));

    if (!rt) {
        ...
        fl4 = &fl4_stack;
        ...
    }
    ...
    saddr = fl4->saddr;
    if (!ipc.addr)
        daddr = ipc.addr = fl4->daddr;

    /* Lockless fast path for the non-corking case. */
    if (!corkreq) {
        ...
        skb = ip_make_skb(sk, fl4, ...);
        ...
            err = udp_send_skb(skb, fl4, &cork);
    ...
}

Other threads on the same socket write the union under lock_sock().
The writers are the IPv4 cork setup in udp_sendmsg(), the
"inet->cork.fl.u.ip6 = *fl6" copy in ip6_append_data(), and this
restore.

The restore only runs after a cork ends. Nothing orders it against the
READ_ONCE(up->pending) check, so a sender that has already passed that
check keeps reading the live union.

On a dual-stack AF_INET6 socket connected to a v4-mapped peer, this
sequence looks possible:

thread C: holds an IPv4 cork and uncorks it under lock_sock()

thread A: send()
  udpv6_sendmsg() sees pending == AF_INET
    udp_sendmsg() with msg_name == NULL
      waits in lock_sock(), sees pending == 0 once C is done,
      releases the lock and takes the connected fast path with the
      cached IPv4 dst

thread B: sendto(native IPv6 X, MSG_MORE), with IPV6_PKTINFO naming a
          native local source so ip6_dst_lookup_tail() accepts it
  udpv6_sendmsg()->ip6_append_data()
    inet->cork.fl.u.ip6 = *fl6;

thread A:
  ip_make_skb()->ip_copy_addrs() and udp_send_skb() read
  fl4.saddr = X[0..3], fl4.daddr = X[4..7], dport = X[8..9]

That sends an IPv4 packet with a source and destination the user chose,
over the connected peer's route and without CAP_NET_RAW. This is the
same result the commit message sets out to prevent.

The race was there before this patch. However, the v2 notes say the
restore keeps "udp_sendmsg()'s lockless fast path ... from sending with
the corked flow".

Would it be more robust for the lockless path to stop reading cork.fl,
for example by building the tuple from inet_daddr, inet_dport and
inet_saddr?

> +
>  void udp_flush_pending_frames(struct sock *sk);
>  int udp_cmsg_send(struct sock *sk, struct msghdr *msg, u16 *gso_size);
>  void udp4_hwcsum(struct sk_buff *skb, __be32 src, __be32 dst);
> diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
> index 7d25519a6cdd3..987676251db48 100644
> --- a/net/ipv4/datagram.c
> +++ b/net/ipv4/datagram.c

[ ... ]

> @@ -82,6 +81,29 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int
>  out:
>  	return err;
>  }
> +
> +static noinline_for_stack int
> +__ip4_datagram_connect_corked(struct sock *sk, struct sockaddr_unsized *uaddr,
> +			      int addr_len)
> +{
> +	struct flowi4 fl4;
> +	int err;
> +
> +	err = ____ip4_datagram_connect(sk, uaddr, addr_len, &fl4);
> +	if (!err && !sk_is_udp(sk))
> +		sk_dst_reset(sk);
> +	return err;
> +}

[Severity: Medium]

For UDP sockets, this leaves the new dst in sk_dst_cache, but
inet->cork.fl keeps the corked flow until the cork completes. Can L2TP
send data with the corked tuple during that window?

l2tp_xmit_core() only checks sock_owned_by_user(), which is false
between corked sendmsg() calls. It then does:

    ret = l2tp_xmit_queue(tunnel, skb, &inet->cork.fl);

With a cached dst, __ip_queue_xmit() goes straight to
ip_copy_addrs(iph, fl4) on cork.fl.u.ip4, and inet6_csk_xmit() calls
ip6_xmit() with cork.fl.u.ip6. The L2TP data packets would be built
from the corked tuple and sent over the newly connected route.

ip6_datagram_dst_update_corked() has the same window for UDPv6 tunnel
sockets. There, ip6_sk_dst_store_flow() caches the new dst while
cork.fl.u.ip6 keeps the corked flow.

In the cross-family case, the IPv4 saddr and daddr would come from the
corked IPv6 destination's bytes. That case is an AF_INET6 tunnel socket
with an IPv6 cork to X, followed by connect() to a v4-mapped peer.

Before this patch, a corked connect() wrote the connected flow into
cork.fl, so this particular window looks new.

A related problem already existed before this patch. A route miss
during any active cork makes __ip_queue_xmit() or
inet6_csk_route_socket() rewrite the active cork flow in place. Also,
with a valid cached dst, a sendto(other, MSG_MORE) cork sends L2TP data
to "other".

The v2 notes say the patch keeps L2TP encapsulation "from sending with
the corked flow". Isn't that only true once the cork has finished?

> +
> +int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
> +			   int addr_len)
> +{
> +	if (unlikely(!skb_queue_empty(&sk->sk_write_queue)))
> +		return __ip4_datagram_connect_corked(sk, uaddr, addr_len);
> +
> +	return ____ip4_datagram_connect(sk, uaddr, addr_len,
> +					&inet_sk(sk)->cork.fl.u.ip4);
> +}
>  EXPORT_SYMBOL(__ip4_datagram_connect);

[ ... ]

> diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
> index ff7a7ffbf9833..d423988350848 100644
> --- a/net/ipv6/datagram.c
> +++ b/net/ipv6/datagram.c

[ ... ]

> @@ -119,6 +117,29 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
>  	return err;
>  }
>  
> +static noinline_for_stack int
> +ip6_datagram_dst_update_corked(struct sock *sk, bool fix_sk_saddr)
> +{
> +	struct in6_addr final;
> +	struct flowi6 fl6;
> +	int err;
> +
> +	err = __ip6_datagram_dst_update(sk, fix_sk_saddr, &fl6, &final);
> +	if (!err && !sk_is_udp(sk))
> +		sk_dst_reset(sk);
> +	return err;
> +}

[Severity: Medium]

For non-UDP sockets, does this reset only postpone the clobber on an
L2TP IP-encap tunnel socket (l2tp_ip6, IPPROTO_L2TP)?

l2tp_ip6_sendmsg() corks through ip6_append_data(). That stores the
flow in inet->cork.fl.u.ip6, and l2tp_ip6_push_pending_frames() uses it
at uncork time.

Consider a connect() that runs while frames are queued:

l2tp_ip6_connect()
  __ip6_datagram_connect()
    ip6_datagram_dst_update()
      ip6_datagram_dst_update_corked()
        sk_dst_reset()

For a v4-mapped peer, which l2tp_ip6_connect() allows, the path goes
through __ip4_datagram_connect_corked() instead. In both cases the next
kernel L2TP data transmit calls l2tp_xmit_core()->l2tp_xmit_queue()
with &inet->cork.fl.

With no cached dst, inet6_csk_xmit() calls inet6_csk_route_socket() on
&cork.fl.u.ip6, which does:

    memset(fl6, 0, sizeof(*fl6));
    fl6->flowi6_proto = sk->sk_protocol;
    fl6->daddr = sk->sk_v6_daddr;

In the v4-mapped case, __ip_queue_xmit() calls inet_sk_init_flowi4()
and ip_route_output_flow() on the overlapping fl4.

On uncork, wouldn't the queued IPv6 frames be finished from the
rewritten flow? They would go to the newly connected peer, or, in the
v4-mapped case, to a destination built from aliased IPv4 bytes.

> +
> +int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
> +{
> +	if (unlikely(!skb_queue_empty(&sk->sk_write_queue)))
> +		return ip6_datagram_dst_update_corked(sk, fix_sk_saddr);
> +
> +	return __ip6_datagram_dst_update(sk, fix_sk_saddr,
> +					 &inet_sk(sk)->cork.fl.u.ip6,
> +					 &inet6_sk(sk)->final);
> +}
> +
>  void ip6_datagram_release_cb(struct sock *sk)
>  {
>  	struct dst_entry *dst;
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index a6886a0432f97..344071574122c 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1267,6 +1267,17 @@ void udp_v6_early_demux(struct sk_buff *skb)
>  /*
>   * Throw away all pending data and cancel the corking. Socket is locked.
>   */
> +static void udp_v6_cork_restore_connected(struct sock *sk)
> +{

[Severity: Low]

This isn't a bug, but the "Throw away all pending data and cancel the
corking" comment now sits above udp_v6_cork_restore_connected()
instead of udp_v6_flush_pending_frames(). Should the new helper go
above the comment, as net/ipv4/udp.c still has it?

> +	if (sk->sk_state != TCP_ESTABLISHED)
> +		return;
> +
> +	if (ipv6_addr_v4mapped(&sk->sk_v6_daddr))
> +		udp_cork_restore_connected(sk);
> +	else
> +		ip6_datagram_flow_key_init(&inet_sk(sk)->cork.fl.u.ip6, sk);
> +}
> +
>  static void udp_v6_flush_pending_frames(struct sock *sk)
>  {
>  	struct udp_sock *up = udp_sk(sk);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124180604.73257-1-dmnk%40google.com
