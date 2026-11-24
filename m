Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537846;
	b=qdYGk/BK+uCljPOI5pB256C7gwhXfuLZWO1FzqQZCf12ODbSNnca4TVMWWLKh5QgrqY/
	 yjL86Vft/W89z/wDyZKtZVrU7zSWGCokEJPhRBZZDoq0tLql9+IYcfq52N5kUkIIbZUWW
	 t7OK2jpV1lMmv80QjgmbCVoCnKkrEklZiystEv01iHiKUoTNOx4hQT/AqEbiDvqD1zQiO
	 2EPzybM1NCKcIVUi8MUYyGacMPSe5kzGWrti4uxxaUEGq8WHxoXJIK7xjN/f7qA8p0SfD
	 7Dy6SmHHEktOg5UDxEojecHHfRR+rh+x6DuQ6toZ7HHPq/G0vyHfduCJn75VsbIxZ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537846;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=olE8fkLDJw/fcmpV7q4c6ThB8IxClbfNXoMOn7EO8fo=;
	b=cNhrcf/wzvazc3GLsL6rg7wSWcJdV+9bsHn86iujqu7NORFzYuQ/aHPBj7EzKsjmd+sE
	 YCoN2KXXFVQOW6GGWnWVhyFM+Y9kLJEUR8EB1GqVaYmXM5qq10OWK+3P7uOAEamCYDrtT
	 NmiX0H3wHED5RFmZyBiJ6LHQp8i9qqKlvX1t5glypZ081/xL4np82JWBMI5ZauWVOjySb
	 XN7ox3+dVuNyqt6EHuo3QBk3bol6EVxz6SJurO3jTxP3qXqrW3ujgpC+yVEuaS1dumLeL
	 bdZiGIqjzSzSE03f9dcA8PajyxNjVktm7yZxXx40CQrnZuYUNhaM8W8EAYF1/Jd7FJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/Z/jgY+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B18606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/Z/jgY+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1171F000D4;
	Tue, 24 Nov 2026 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537846;
	bh=olE8fkLDJw/fcmpV7q4c6ThB8IxClbfNXoMOn7EO8fo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R/Z/jgY+X8vdvI34xBK3CRs00/TxlAhEgxZC0/rFvoMhxIb1hQLa1jIBykyFDUO6z
	 q/qIiQbG/wDnq2vvdLT9ATjzOLDXa6QjHFLp9D6mvBVKQrq73ksdfB7aSdNdrS28My
	 GnKzKkZvqRFFOPilcAwP6CeHk5TGhHefY+ZSFfxf3BxnhyqqsH5z2rvV/mIGTO+/Xr
	 VZGqJz4b3IlDtivUiO4mLCH+UVC50e5YUBjJags4XsdmFlNvpdGpxRZ57hP+2BXM2R
	 sJRdcUjKcl8/N3nyMBX/WMdwyTGmT6aeYBRU6ae78/Xer97WlH3snKl272KYmxZRqE
	 1uui7i5A7uPwA==
Subject: Re: [PATCH net v2] l2tp: bound the reorder queue
From: netdev-bot+sashiko@kernel.org
To: weir@nebusec.ai
Cc: netdev@vger.kernel.org, edumazet@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, willemb@google.com, horms@kernel.org,
 gnault@redhat.com, kuniyu@google.com, michael.bommarito@gmail.com,
 alice.kernel@fastmail.im, nicoyip.dev@gmail.com, hengyul@cs.unc.edu,
 jchapman@katalix.com, vega@nebusec.ai, caoruide123@gmail.com
Date: Tue, 24 Nov 2026 16:30:44 +0000
Message-ID: <179553784453.3135.9272758416307793942@kernel.org>
In-Reply-To: <ccbcb9ac392bc81663a7a14691058b3f03eac3c0.1795437306.git.caoruide123@gmail.com>
References: <ccbcb9ac392bc81663a7a14691058b3f03eac3c0.1795437306.git.caoruide123@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] With reordering enabled (reorder_timeout != 0), the new fixed
  cap of 64 combined with timeout-only recovery turns a single lost…
- [Medium] The two new enqueue helpers enforce the same reorder-queue cap
  but update the userspace-visible session counters differently.
- [Medium] The new reorder_timer adds a second dequeuer that runs in
  timer softirq.
- [Low] The comment above l2tp_recv_data_seq() says it will "queue it if
  acceptable.
- [Low] The deadline and the expiry check disagree by one tick.
- [Low] l2tp_recv_dequeue() now also runs from timer context and writes
  session->nr and session->reorder_skip under reorder_q.lock.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but skbs parked in
  session->reorder_q keep the non-refcounted (noref) dst they were…

--

l2tp: bound the reorder queue

This patch caps the L2TP session reorder queue at 64 packets, rejects
duplicate sequence numbers, and inserts sequenced packets by walking from
the tail with a modular sequence comparison. It adds a per-session
reorder_timer that runs l2tp_recv_dequeue() at the head expiry, and it
moves the session->nr advance under the reorder queue lock. Session
teardown shuts down the timer, and l2tp_session_free() purges the queue a
second time.

> diff --git a/net/l2tp/l2tp_core.c b/net/l2tp/l2tp_core.c
> index 0cd3e38bf662f..42900c3cff632 100644
> --- a/net/l2tp/l2tp_core.c
> +++ b/net/l2tp/l2tp_core.c

[ ... ]

> @@ -636,30 +641,104 @@ EXPORT_SYMBOL_GPL(l2tp_session_register);

[ ... ]

>  static void l2tp_recv_queue_skb(struct l2tp_session *session, struct sk_buff *skb)
>  {
>  	struct sk_buff *skbp;
> -	struct sk_buff *tmp;
>  	u32 ns = L2TP_SKB_CB(skb)->ns;
> +	bool saw_seq = false;
>  
>  	spin_lock_bh(&session->reorder_q.lock);
> -	skb_queue_walk_safe(&session->reorder_q, skbp, tmp) {
> -		if (L2TP_SKB_CB(skbp)->ns > ns) {
> -			__skb_queue_before(&session->reorder_q, skbp, skb);
> -			atomic_long_inc(&session->stats.rx_oos_packets);
> +	if (test_bit(0, &session->dead)) {
> +		kfree_skb(skb);
> +		goto out;
> +	}
> +	if (skb_queue_len(&session->reorder_q) >= L2TP_REORDER_MAX_QUEUE &&
> +	    ns != session->nr) {
> +		atomic_long_inc(&session->stats.rx_seq_discards);
> +		atomic_long_inc(&session->stats.rx_errors);
> +		kfree_skb(skb);
> +		goto out;
> +	}

[Severity: High]
With reordering enabled, can one lost packet cause a stall that repeats
every reorder_timeout?

Suppose session->nr == g and packet g is lost. Packets g+1..g+64 fill
reorder_q, and the head blocks because cb->ns != session->nr. This cap
check then frees every later arrival from g+65 on. The expected-Ns
exception never fires, because the L2TP data channel does not retransmit
g.

When the head expires, l2tp_recv_dequeue() drops it, sets reorder_skip,
resyncs nr to the next queued Ns and drains the queue. That leaves
session->nr == g+65:

l2tp_recv_dequeue() {
    ...
		if (time_after(jiffies, cb->expires)) {
			...
			session->reorder_skip = 1;
			__skb_unlink(skb, &session->reorder_q);
    ...
}

This check already dropped g+65. The next arrival is inside the nr_max/2
receive window, so it gets queued and blocks again.

The nr_oos recovery exists only in the reorder_timeout == 0 branch of
l2tp_recv_data_seq(). The reorder branch comes straight here:

	if (session->reorder_timeout != 0) {
		...
		l2tp_recv_queue_skb(session, skb);
		goto out;
	}

So the queue refills to 64, further packets are dropped, and the cycle
repeats. The session would deliver about 63 packets per reorder_timeout
for as long as traffic stays above about 64 packets per reorder_timeout.
The only exception is when all 64 queued packets expire in the same tick.
Then reorder_skip stays set and the next packet resyncs nr.

Before this patch, the whole backlog was queued and drained after one
timeout. nr then matched the next arrival and the session recovered.

The commit message says:

    The existing timeout recovery then skips a missing sequence number when
    the queue limit is reached.

Is that accurate? Nothing seems to skip when the limit is reached. Only
head expiry does, and it reopens a gap every cycle.

Would a full queue need to force a skip or a dequeue here?

[ ... ]

> +static bool l2tp_recv_queue_tail_skb(struct l2tp_session *session,
> +				     struct sk_buff *skb)
> +{

[ ... ]

> +	spin_lock_bh(&session->reorder_q.lock);
> +	if (test_bit(0, &session->dead))
> +		goto reject;

[ ... ]

> +	qlen = skb_queue_len(&session->reorder_q);
> +	if (qlen >= L2TP_REORDER_MAX_QUEUE) {
> +		if (qlen > L2TP_REORDER_MAX_QUEUE)
> +			goto reject;
> +		if (!(cb->has_seq &&
> +		      (cb->ns == session->nr || session->reorder_skip)))
> +			goto reject;

[ ... ]

> +	__skb_queue_tail(&session->reorder_q, skb);
> +	spin_unlock_bh(&session->reorder_q.lock);
> +	return true;
> +
> +reject:
> +	spin_unlock_bh(&session->reorder_q.lock);
> +	return false;
> +}

[Severity: Medium]
Should the two enqueue helpers count drops the same way?

In l2tp_recv_queue_skb(), a cap drop or a duplicate drop increments both
rx_seq_discards and rx_errors. The session->dead drop increments neither.

In l2tp_recv_queue_tail_skb(), every rejection returns false: dead,
qlen above the cap, not expected/recovery at the cap, or head not
dequeuable. The callers end up at the discard label in
l2tp_recv_common(), which only increments rx_errors:

discard:
	atomic_long_inc(&session->stats.rx_errors);
	kfree_skb(skb);

So a cap drop is a sequence discard in reorder mode but not in
non-reorder mode. A dead-session drop is an rx error on one path and is
not counted at all on the other.

These counters are exported via netlink (L2TP_ATTR_RX_SEQ_DISCARDS and
L2TP_ATTR_RX_ERRORS), the pppol2tp stats ioctl and debugfs.

[ ... ]

> @@ -729,6 +803,16 @@ static void l2tp_recv_dequeue(struct l2tp_session *session)
>  				goto out;
>  		}
>  		__skb_unlink(skb, &session->reorder_q);
> +		dequeued = true;
> +
> +		/* Advance Nr under the queue lock so the enqueue cap
> +		 * checks observe a consistent expected sequence number.
> +		 */
> +		if (cb->has_seq) {
> +			session->nr++;
> +			session->nr &= session->nr_max;
> +			trace_session_seqnum_update(session);
> +		}
>  
>  		/* Process the skb. We release the queue lock while we
>  		 * do so to let other contexts process the queue.

[Severity: Medium]
Can the new reorder_timer deliver packets to the pseudowire out of order?

The timer is not pinned. l2tp_recv_dequeue_timer() can run on one CPU
while the receive path runs l2tp_recv_dequeue() on another. Both advance
nr under the lock, then drop the lock before calling recv_skb:

CPU A (timer)
  drops expired head, resyncs to N+2
  unlinks N+2, nr = N+3
  spin_unlock_bh()

CPU B (rx softirq)
  spin_lock_bh()
  head N+3 == nr, unlinks it, nr = N+4
  spin_unlock_bh()
  recv_skb(N+3)

CPU A
  recv_skb(N+2)

Nothing orders recv_skb(N+2) on CPU A before recv_skb(N+3) on CPU B. So
ppp_input(), sock_queue_rcv_skb() or l2tp_eth could get them in reverse
order.

The changelog says concurrent timer and receive dequeue is left
unchanged. Before this patch, though, dequeue only ran from the session's
receive path. Is this second, concurrent dequeuer intended?

> @@ -739,9 +823,22 @@ static void l2tp_recv_dequeue(struct l2tp_session *session)
>  	}
>  
>  out:
> +	if (skb_queue_empty(&session->reorder_q))
> +		timer_delete(&session->reorder_timer);
> +	else if (dequeued || !timer_pending(&session->reorder_timer))
> +		timer_reduce(&session->reorder_timer,
> +			     L2TP_SKB_CB(skb_peek(&session->reorder_q))->expires);

[Severity: Low]
Do the timer deadline and the expiry check disagree by one tick?

The timer is armed for exactly the head's expires value, but the walk
uses a strict comparison:

		if (time_after(jiffies, cb->expires)) {

When the timer fires at jiffies == expires, the head is not treated as
expired. A blocked sequenced head takes goto out. dequeued is false, and
the timer is not pending because its callback is running. timer_reduce()
then re-arms it for the same deadline, which has already passed, so it
fires again on the next tick.

That costs an extra callback and a locked queue walk on each expiry.
Would arming at expires + 1, or using time_after_eq() in the check, make
the two agree?

>  	spin_unlock_bh(&session->reorder_q.lock);
>  }
>  
> +static void l2tp_recv_dequeue_timer(struct timer_list *timer)
> +{
> +	struct l2tp_session *session = timer_container_of(session, timer,
> +							 reorder_timer);
> +
> +	l2tp_recv_dequeue(session);
> +}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.

skbs parked in session->reorder_q keep the noref dst they were received
with. They are delivered after the RCU section that kept that dst alive
has ended.

For connected UDP tunnel sockets, udp_v4_early_demux() attaches
sk->sk_rx_dst with skb_dst_set_noref(), and ip_route_input_noref()
attaches cached input routes as noref. udp_queue_rcv_one_skb() then calls
encap_rcv() without forcing or dropping the dst. Neither
l2tp_udp_recv_core() nor l2tp_recv_common() drops it before queueing.

Once the softirq ends, the route can be replaced and freed after a grace
period, for example an rt_genid bump followed by udp_sk_rx_dst_set()
releasing the old dst. Delivery happens later, either from another
packet's receive or, with this patch, from l2tp_recv_dequeue_timer().

For a PPPoL2TP socket that is connected but not PPPOX_BOUND:

l2tp_recv_dequeue_timer()
  l2tp_recv_dequeue()
    l2tp_recv_dequeue_skb()
      pppol2tp_recv()
        sock_queue_rcv_skb()
          __sock_queue_rcv_skb()
            skb_dst_force()
              dst_hold_safe() on the stale dst

Can that rcuref_get() run on a freed dst_entry?

The rcu_read_lock() in pppol2tp_recv() hides the WARN_ON in
skb_dst_force(). It does not protect a dst that came from an earlier RCU
section. l2tp_eth calls skb_dst_drop() first, and the ppp_input() path
only drops the dst without dereferencing it.

The v2 changelog says the timer path "does not dereference dst on its
own". That is true for l2tp_core, but the recv_skb callback it calls
does dereference it.

Would calling skb_dst_drop() before queueing the skb in
l2tp_recv_common() fix this? Calling skb_dst_force() while still inside
the original RCU section would also work.

[ ... ]

> @@ -783,7 +880,8 @@ static int l2tp_recv_data_seq(struct l2tp_session *session, struct sk_buff *skb)
>  	 * sequence number to re-enable packet reception.
>  	 */
>  	if (cb->ns == session->nr) {
> -		skb_queue_tail(&session->reorder_q, skb);
> +		if (!l2tp_recv_queue_tail_skb(session, skb))
> +			goto discard;

[Severity: Low]
l2tp_recv_dequeue() now also runs from timer context and writes
session->nr and session->reorder_skip under reorder_q.lock. Is this
unlocked read of session->nr a data race?

l2tp_recv_data_seq() still uses plain, unlocked accesses on the same
state. It reads session->nr in l2tp_seq_check_rx_window() and in the
comparison above. Further down it also accesses reorder_skip, nr_oos and
nr_oos_count, including this write:

		if (session->nr_oos_count > session->nr_oos_count_max) {
			session->reorder_skip = 1;
		}

On the timer side:

			if (session->reorder_skip) {
				session->reorder_skip = 0;
				session->nr = cb->ns;

KCSAN would likely report this once the timer runs on another CPU.

l2tp_recv_queue_tail_skb() also does not re-check Ns against nr when qlen
is below the cap. In non-reorder mode, a packet accepted on a stale nr
could be appended after the timer has resynced nr. It would then block
the head until reorder_skip is set again or the head expires.

The commit message says nr is advanced under the lock "so the cap checks
observe a consistent expected sequence number". Does that also hold for
this enqueue decision, which is made outside the lock?

>  	} else {

[ ... ]

> @@ -802,7 +900,8 @@ static int l2tp_recv_data_seq(struct l2tp_session *session, struct sk_buff *skb)
>  			trace_session_pkt_oos(session, cb->ns);
>  			goto discard;
>  		}
> -		skb_queue_tail(&session->reorder_q, skb);
> +		if (!l2tp_recv_queue_tail_skb(session, skb))
> +			goto discard;
>  	}

[Severity: Low]
This isn't a bug, but the comment above l2tp_recv_data_seq() no longer
matches what it does:

/* If packet has sequence numbers, queue it if acceptable. Returns 0 if
 * acceptable, else non-zero.
 */

The reorder branch calls l2tp_recv_queue_skb(), which can now reject and
free the skb itself: when session->dead is set, when the cap is reached
with ns != nr, or for a duplicate Ns. l2tp_recv_data_seq() still does
goto out and returns 0 in those cases. This branch, in contrast, returns
1 when l2tp_recv_queue_tail_skb() rejects.

The v2 changelog says the comment was left unchanged because a rejected
skb stays with the caller. That reasoning only covers the return-1 path.

Could the comment be updated to describe who owns the skb on each return?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/ccbcb9ac392bc81663a7a14691058b3f03eac3c0.1795437306.git.caoruide123%40gmail.com
