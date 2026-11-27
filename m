Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741218;
	b=zVQZ5dsNBulFzQFs9Axmr/G0I6kZrguVfB54WySVSDXtH5qRndnv4MJ6B0FH/L9xWkfx
	 TW8oEkAQ196oZMcG6rfG4z1h/RQh/vXItPRw8eTBi3FVnRQ9+6mZHo9huHzkDARQrB1uH
	 GgneurxXpRgdj20kdZK44pCsBVP+wp9s5Ol9fVy4vgjFtcGwzpIz89vTBJyDih0e9JFRI
	 0S/1LqJZ6gywnVQW8mnM1RXlYjT07oktYbsEThnnIWtmhDNNK4Co6S3B9YKK7Z3ZpFXds
	 esTlgBqC99VOb28PdpUveWkVwAjvDQwTt7NkwJBrPNBDBQ7TFkBN1Zmo3uUzUWxtUbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741218;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FkfiyFa5z5LQjJ6nkngWn4LI3fHUmNEL40d6e9Mt7Eo=;
	b=3rVe1zuHgNavf9AKxmfksqNECwgrjkxapCuS1uz0tQhRuuBp4YSErwrDahZ9+baEB0Io
	 WoTNc6mtLp5CXIh33YdedgDC+dQLQKXVGN5VOg6Df7UjIPnLgJRyTD3RUeqgfazJO+MuJ
	 m7nlQPdLaxmTwo0sxBcFIkM97nR7ijmLtDyqZGHQytBS+cdbxQAfiz+o+eTBDXAQsRDdk
	 /MgZs8b0rWwLlrWEnMe+WoTkpqXzx5FAD13xwETNSR3B8cEa0kTIIGB7z00KiqZDb9c8X
	 79/MRgOOI2rjsnZeuveNh5Ue6ymDQP6UNkhtQmHGjPRvs/D7+1WDBLUsu7AuzyKgsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hadvIiEm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65D7606A31C;
	Fri, 27 Nov 2026 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hadvIiEm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25311F00897;
	Fri, 27 Nov 2026 01:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795741218;
	bh=FkfiyFa5z5LQjJ6nkngWn4LI3fHUmNEL40d6e9Mt7Eo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hadvIiEmPgUxab67HE6XQIwyhNuJNM2ivDJM2zEL7wyhPfY6StS1xvWITIo04J2uB
	 IAf1wKJPg3yaIva90aNpr/j4PMYaPq7aFolrHIbeWMd+//3RucTvUDvI+wnSkbKNYZ
	 llWM9AcshK96iO4hajENJFsBy9NPh9kycsS7RQVWRbzV62WofPI2UWns4oWemccTxM
	 O6WP3ev7ge9XOhg0dbsO7my6ZNUeFkV5yVgrThA5dLqtBtH2lqkcv1JA5X17SW3+5s
	 QabBSQ1y83q5wlxuBxT7UhAu1crifGCeyWB1P/eunp4/AdHdnXEB+reoMj+wEB6+R9
	 METdJ/SnxaUYQ==
Subject:
 Re: [PATCH] net: tap: fix inconsistent lock state in tap_sock_destruct
From: netdev-bot+sashiko@kernel.org
To: 847807867@qq.com
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 01:00:17 +0000
Message-ID: <179574121714.3135.6932520604039855103@kernel.org>
In-Reply-To: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
References: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not remove the lockdep report it says it fixes.
- [Medium] The commit message's technical explanation has factual errors.
- [Low] The patch fixes a syzbot-reported lockdep problem in
  tap_sock_destruct() but has no Fixes: tag.

--

net: tap: fix inconsistent lock state in tap_sock_destruct

This patch replaces the ptr_ring_cleanup() call in tap_sock_destruct()
with an open-coded loop. The loop takes the ring's consumer_lock with
spin_lock_irqsave() and then calls kvfree() on the ring queue. The aim is
to silence a syzbot lockdep report of inconsistent {IN-SOFTIRQ-W} ->
{SOFTIRQ-ON-W} usage of consumer_lock.

Link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d

> 1. softirq context: from softirq rx drop paths via
>    skb_release_head_state() -> sock_wfree() -> __sk_free() ->
>    sk_destruct() -> tap_sock_destruct().  In softirq the BH
>    state is already disabled, so consumer_lock is taken with
>    SOFTIRQ-ON-W semantics.

[ ... ]

> Fix by hand-rolling the cleanup loop with spin_lock_irqsave() /
> spin_unlock_irqrestore() so consumer_lock is always taken from a
> uniform softirq state.  irqsave is a no-op on the softirq path
> (interrupts are already off), so there is no extra cost there.

[Severity: Medium]
Are the lockdep states the wrong way round here? When the lock is taken
from softirq context, lockdep records IN-SOFTIRQ-W. SOFTIRQ-ON-W is the
process context case, where softirqs are enabled.

Are interrupts actually off on the softirq path? Softirq handlers and
RCU callbacks run with hardirqs enabled. So spin_lock_irqsave() really
does disable interrupts there, and it is not a no-op.

No hardirq context takes consumer_lock, so why mask hardirqs at all? The
_bh helpers such as ptr_ring_consume_bh() seem to fit a softirq versus
process context conflict.

tap_sock_destruct() only runs after the last socket reference is gone.
At that point no other context can hold the same ring's consumer_lock.
That makes this a lock class report, not a real deadlock on a single
ring. Could the commit message say that?

Also, the new loop in tap_sock_destruct() is the same as the existing
helper in include/linux/ptr_ring.h:

static inline void *ptr_ring_consume_any(struct ptr_ring *r)
{
	...
	spin_lock_irqsave(&r->consumer_lock, flags);
	ptr = __ptr_ring_consume(r);
	spin_unlock_irqrestore(&r->consumer_lock, flags);
	...
}

The loop plus the kvfree(q->ring.queue) copies the internals of
ptr_ring_cleanup() into the driver. Would tap then miss future changes
to that helper?

> Reported-by: syzbot <syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com>
> Link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
> Signed-off-by: Shuai Liu <847807867@qq.com>

[Severity: Low]
This isn't a bug, but should there be a Fixes: tag? The replaced
ptr_ring_cleanup() call in tap_sock_destruct() came from commit
5990a30510ed ("tun/tap: use ptr_ring instead of skb_array"). That commit
kept the ring cleanup in the destructor that commit 362899b8725b
("macvtap: switch to use skb array") added.

> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index 2f19fb07bb2d4..d749c7e73858a 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -440,8 +440,18 @@ static void tap_sock_write_space(struct sock *sk)
>  static void tap_sock_destruct(struct sock *sk)
>  {
>  	struct tap_queue *q = container_of(sk, struct tap_queue, sk);
> -
> -	ptr_ring_cleanup(&q->ring, __skb_array_destroy_skb);
> +	unsigned long flags;
> +	void *ptr;
> +
> +	while (true) {
> +		spin_lock_irqsave(&q->ring.consumer_lock, flags);
> +		ptr = __ptr_ring_consume(&q->ring);
> +		spin_unlock_irqrestore(&q->ring.consumer_lock, flags);

[Severity: High]
Does this change actually stop the lockdep report? Lockdep tracks lock
classes, not individual locks. Every tap queue's consumer_lock shares
one class, set by the spin_lock_init() in ptr_ring_init(), which
tap_open() calls.

tap_sock_destruct() can still run in softirq. One example is an skb
allocated by sock_alloc_send_pskb() in tap_get_user(), sent with
dev_queue_xmit() and then freed in softirq:

kfree_skb()
  sock_wfree()
    __sk_free()
      sk_destruct()
        tap_sock_destruct()

Lockdep marks the class IN-SOFTIRQ-W whenever it is taken in softirq
context, even when spin_lock_irqsave() is used.

Several other users of the same class still take it with a plain
spin_lock() in process context, with softirqs enabled:

drivers/net/tap.c:tap_do_read()
    skb = ptr_ring_consume(&q->ring);

drivers/net/tap.c:tap_poll()
    if (!ptr_ring_empty(&q->ring))

drivers/net/tap.c:tap_peek_len()
    return PTR_RING_PEEK_CALL(&q->ring, __skb_array_len_with_tag);

drivers/vhost/net.c:vhost_net_buf_produce()
    spin_lock(&nvq->rx_ring->consumer_lock);

The vhost case works on the ring returned by tap_get_ptr_ring().

Won't any normal tap reader, poller or vhost-net backend still record
SOFTIRQ-ON-W? Then the same {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} splat can
fire again. The patch seems to stop only the destructor's own process
context call from counting as SOFTIRQ-ON.

Because this is a class-level report, should the fix cover the whole
class rather than one call site? Some options:

- Make every consumer_lock user in tap and vhost BH-safe, as resize
  already does with ptr_ring_resize_multiple_bh().

- Drain the ring in the destructor without taking the lock, since
  nothing else can use the ring at that point.

- Give the destructor's acquisition a separate lockdep annotation.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_934E899D4D24BB3B4827B2A0C9D73461E00A%40qq.com
