Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478631;
	b=Usnteoznd3Tzup5g9+wzQqPUvOIYjqJ9215LwtxLwKC9AykaG3ai+6gPMUQGxK5q18be
	 cgiBRnCk234KPJ0JcbzbSYOGIc78wJP8m7M3oyVATF1m7N7Y1+r1YHZbjjedUnfWnBynA
	 GXyELwEZuylt9ZIZMT7hIOP5i5Yt6FLh8ARVrC51FL9Eo9dUdo2Mcr1S8H3LitZN33RUQ
	 zkOM6MKdKXibTaTGcW1ZxQm9lw8xdZbsj8ZLNfeYkR5QhmJ0LOVI7fxEdtmZkfK56XCkh
	 OLUxu/p9rP6Ft47IWJTSglnt97j59goP83bAvBWjHcZuUKM6JkCoUnHg7MfZKHbNccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478631;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uhLm4YyQicFoJX+Exw7k19Cw4KlzHU0mutOb3HgYX+4=;
	b=S2Fkrr3Eqj2Lu2/Gtx5HW6huSL9pEpyz23TkMSve0mMUU0S25Wc90KmJuY5YScQfRqxY
	 nMgACmDmfeZ+tAtA1OkAqpwTenJ6XwPDfVnBs1i3Bt2ccB/vYUtFFnzPKfhp+ShY1G2eh
	 UUztyMqcp9+ArC1InIusme9zqaxMehuCBJxklq0L2klQrlHZ2gJodGMNoqpKdVhzfsXya
	 lLTZfJNhhGoJnKO0J/h1YHO5w0qPWGSkELyAbufJdTptn0lglEzDIlVLmvErg9/iS1zH9
	 gU1MGFuk56UbU6XaDWav3MyWNYrHPLs/ohralZo6PI5QZz90ME1rpDuuoynL+KIcS6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCraPmZx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE455606A31E;
	Tue, 24 Nov 2026 00:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCraPmZx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC161F000C4;
	Tue, 24 Nov 2026 00:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795478630;
	bh=uhLm4YyQicFoJX+Exw7k19Cw4KlzHU0mutOb3HgYX+4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eCraPmZxbkmw5AtVz+bpDxqclOYcbi09vSCwcRyJIV7W2LvXj22Z9I4lyYybAnVM8
	 /3UseCfM3GahiQHYbXioswx4BG13KYDaO5N7AU1Y8O7r6kp57bunmKmQQf+gy2+Ori
	 8bhEQUXNj3YAl3tuzwt4TbzlCPHDQipVwgctxuQ3kaQQNfhOc72whof3nYlaFrls2G
	 bpbt/eb95q+V22al1lGcRFLWRlJMizBtfLRf0V4WMHO4aegd3gtRNyDROUNXXFqkN+
	 /jd/SNY0NZ4zpvHA3joDxPY4p98lrVB8hNu/Zv7NEkV7MQl4bRaGHd4GtbeX6ghjcO
	 mJaXCzqkz/89g==
Subject: Re: [PATCH net] tipc: free the tunnel packets when failover
 tunnelling stops early
From: netdev-bot+sashiko@kernel.org
To: astellman@stellman-greene.com
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 tuong.t.lien@dektech.com.au, ying.xue@windriver.com, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:03:49 +0000
Message-ID: <179547862919.3135.6087887655063297728@kernel.org>
In-Reply-To: <20261122233958.10462-1-astellman@stellman-greene.com>
References: <20261122233958.10462-1-astellman@stellman-greene.com>
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

- [Medium] The patch leaves one early exit in tipc_link_tnl_prepare()
  (net/tipc/link.c) that still skips the FAILOVER_MSG receive-side hand-…

--

tipc: free the tunnel packets when failover tunnelling stops early

The three early returns inside the tunnelling loop of
tipc_link_tnl_prepare() now jump to a new out: label. That label purges
any tunnel packets left on tnlq. It then runs the FAILOVER_MSG receive
side hand-over (drop_point, failover_reasm_skb, deferdq).

> diff --git a/net/tipc/link.c b/net/tipc/link.c
> index 6427c69f89294..2fead2f4ed0fa 100644
> --- a/net/tipc/link.c
> +++ b/net/tipc/link.c

[ ... ]

> @@ -2073,6 +2073,9 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
>  		}
>  
>  	tipc_link_xmit(tnl, &tnlq, xmitq);
> +out:
> +	/* Empty unless tunnelling stopped early */
> +	__skb_queue_purge(&tnlq);
>  
>  	if (mtyp == FAILOVER_MSG) {
>  		struct sk_buff_head *fdefq = &tnl->failover_deferdq;

[Severity: Medium]
The commit message says the fix is to "go on with the hand-over" when
tunnelling stops early. Should the earlier exit, taken when the dummy
packet can't be allocated, also jump to out?

That path in tipc_link_tnl_prepare() still returns directly:

net/tipc/link.c:tipc_link_tnl_prepare() {
    ...
	skb = tipc_msg_create(TIPC_LOW_IMPORTANCE, TIPC_DIRECT_MSG,
			      BASIC_H_SIZE, 0, l->addr, tipc_own_addr(l->net),
			      0, 0, TIPC_ERR_NO_PORT);
	if (!skb) {
		pr_warn("%sunable to create tunnel packet\n", link_co_err);
		return;
	}
    ...
}

tipc_msg_create() allocates with tipc_buf_acquire(..., GFP_ATOMIC), so it
can fail under memory pressure. If it fails for FAILOVER_MSG, this code
never runs:

    tnl->drop_point = l->rcv_nxt;
    tnl->failover_reasm_skb = l->reasm_buf;
    skb_queue_splice_init(&l->deferdq, fdefq);

The caller goes into failover anyway:

__tipc_node_link_down()
    tipc_link_tnl_prepare(l, tnl, FAILOVER_MSG, xmitq);
    tipc_link_reset(l);    <- frees l->reasm_buf, purges l->deferdq
    tipc_link_fsm_evt(l, LINK_RESET_EVT);
    tipc_link_fsm_evt(l, LINK_FAILOVER_BEGIN_EVT);
    tipc_node_fsm_evt(n, NODE_FAILOVER_BEGIN_EVT);

tnl->drop_point then keeps a stale value. That is 0 from link creation,
1 from tipc_link_failover_prepare(), or whatever an earlier failover left.
tipc_link_failover_rcv() then does this:

	if (unlikely(less(seqno, l->drop_point))) {
		kfree_skb(iskb);
		continue;
	}
	if (unlikely(seqno != l->drop_point)) {
		__tipc_skb_queue_sorted(fdefq, seqno, iskb);
		continue;
	}

Could this drop the peer's tunnelled messages? Could it also leave them
in failover_deferdq for good, since drop_point only moves forward on an
exact match?

tnlq is already initialised and empty at that point, and the out: block
only touches tnlq, l and tnl. So changing that return to goto out looks
safe.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122233958.10462-1-astellman%40stellman-greene.com
