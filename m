Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401117;
	b=GI+Hk8PgVfYARv4zWmc+mHnCwiaN1syMQscMXd/XmBlfmhxhLr8+y2no3aph6YjGnAMK
	 YdcaR9pA0lG+13ceRMbq/f6SCo3CxjBrIPQDBZPeKsP5egtvuZvagcrGuzxEC31EFS2Pj
	 /5Q/Skkgftkp+SYvna6F4dsN2HOLOM8bY0Y7PfqMFBE1TSAa1fcxo7Xb6pg3aSzlG59Wd
	 yI+bSAgYZhtXevMzNTwbPco/ZdXnsDcjjvVygOcXFyM6LJmvXMCf+Nj0mbi3a7bGEoDLw
	 n9wuW4zmiQOeRwsz8oN93sHNbSzCzjFHB9w2gFlz7KB+hEBNcDtGyFF0uSWJ73PoQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401117;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IUIJQRAo4fBf4O9kTiEZ++kZybJm/kjPCJWhtsgVsio=;
	b=N99sPkm3O74AGxKDIkCKvwozifKNTGppXv15ixG5TkXuCZ/aLhhziAOo2ox0nX3qlsye
	 61Bv1kv5M7hIADoi8DtocidL8ftBJO4v0THMvDzIWEXlXJpCBSZTT48dZMHaA8Jp5tZ6I
	 wv0uv+RDzz9sYeFH6fgq+6CAOGYs9k9eRoHmIMCn1EwTG+Ifobr0dRjfDZmplZpAxYdYC
	 BCCDnStKv3KAeLX1PmThU6G3YrmLRlgHBO1IAdyYZRAfgAVCVxMBrLZ3IqbeXXMyeqspB
	 LEuMa51TG5XYC0XFxCAn/0PJHVaFV2jcxe/8QbTBB0GvBOT+aTouBX41b8fvyBVl2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHCXQErP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82706606A31A;
	Mon, 23 Nov 2026 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHCXQErP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766831F000C0;
	Mon, 23 Nov 2026 02:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795401117;
	bh=IUIJQRAo4fBf4O9kTiEZ++kZybJm/kjPCJWhtsgVsio=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fHCXQErP4l+9JJNhZLkPqlmsWIXhTQcRQ5m5quKNcx7hmx18VWpfpAgaCIG2+vfCA
	 gv3xbpA0Pf6kNwwz8z8M3dp6qPjP9gTHALHcJ8rHPFRp7PNOGoCkpgC1AOFYSzEFwz
	 3WZ36tNobpF1prMZT9hESf0WHFmQ9vDSMSCeo2HHIeDf/e8Q9pYK1Xm2nR20FuIdXC
	 N9QXphkd3RbC9edxFjuzbKUwbIfQLxIq9yCfJgpbtUWkOKyJEwX0O9yd4G4hz848Vi
	 6hada5WJ83fx5nWVd9EHV8OnG0FmXZzMIIAHMXxpbcnIzWcMseyP3QAweALGX2h1q3
	 d3QiToueanI+g==
Subject: Re: [PATCH v2] rxrpc: Fix slab-out-of-bounds write in
 rxrpc_send_ACK() during PMTUD probing
From: netdev-bot+sashiko@kernel.org
To: gowtham398gs@gmail.com
Cc: dhowells@redhat.com, marc.dionne@auristor.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com, horms@kernel.org,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Date: Mon, 23 Nov 2026 02:31:56 +0000
Message-ID: <179540111601.3135.3449316237387537597@kernel.org>
In-Reply-To: <20261119021202.525077-1-gowtham398gs@gmail.com>
References: <20261119021202.525077-1-gowtham398gs@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 (2) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message's root-cause explanation does not match the
  code.
- [Low] In rxrpc_send_ACK() (net/rxrpc/output.c), the new comment above
  'if (len > probe_mtu) goto skip;' says the code will 'skip padding if…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the patch
  guards 'peer->if_mtu - peer->hdrsize' against unsigned underflow only…
- [Medium] This problem wasn't introduced by this patch, but
  rxrpc_init_peer() (peer_object.c:293) computes 'peer->max_data =…

--

rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK() during PMTUD probing

In rxrpc_assess_MTU_size(), this patch guards the if_mtu - hdrsize
subtraction against unsigned underflow. It also caps the PMTUD upper bound
to what local->kvec can hold, and sets pmtud_pending only when the link is
above the 500 byte floor. Separately, the zero-page padding loop in
rxrpc_send_ACK() is now bounded by ARRAY_SIZE(call->local->kvec).

Closes: https://syzkaller.appspot.com/bug?extid=0cd6f4783442ac67b56d

> As a result, peer->pmtud_bad and peer->pmtud_trial become excessively
> large. When rxrpc_send_ACK() builds a padded RXRPC_ACK_PING packet for
> PMTUD probing, it appends PAGE_SIZE zero-page entries to call->local->kvec
> inside a loop until len reaches probe_mtu.

[ ... ]

> Fix this by guarding the subtraction against unsigned underflow when
> peer->if_mtu <= peer->hdrsize, clamping pmtud_good, pmtud_bad, and
> pmtud_trial to the usable payload limit, and only enabling pmtud_pending
> when the link supports more than the minimum floor.

[Severity: Medium]
Is this the mechanism behind the syzbot report? Before this patch,
rxrpc_assess_MTU_size() already capped pmtud_trial:

	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
	...
	peer->pmtud_trial	= umin(peer->max_data, peer->pmtud_bad - 1);

RXRPC_JUMBO(1) is 28 + 1412 = 1440. So even if if_mtu - hdrsize
underflows, the first probe_mtu is at most 1468 and needs only one
padding kvec.

The only other place where pmtud_trial grows is
rxrpc_input_probe_for_pmtud(), and it uses signed ints:

	int good, trial, bad, jumbo;

	good  = peer->pmtud_good;
	trial = peer->pmtud_trial;
	bad   = peer->pmtud_bad;
	if (good >= bad - 1) {
		...
		return;
	}

As an int, an underflowed pmtud_bad is <= 0. This check returns at once,
so trial never grows. rxrpc_adjust_mtu() only ever lowers pmtud_bad and
pmtud_good.

The kvec_limit clamp also looks like a no-op for normal routes. dst_mtu()
is limited to IP_MAX_MTU / IP6_MAX_MTU, which is well below the roughly
180KB needed to overrun 47 kvecs with 4K pages. The commit body never
mentions this clamp. It is only described in the v2 changelog below the
"---", which won't be committed.

So the write past local->kvec[] seems to be stopped only by the new
nr_kv < ARRAY_SIZE(call->local->kvec) check in rxrpc_send_ACK(). A
backport of just the rxrpc_assess_MTU_size() hunk would not stop the
reported overflow.

Could the commit message identify what actually made probe_mtu large
enough to overflow?

Separately, the message says pmtud_good is clamped to the usable payload
limit, but the code still does:

	peer->pmtud_good	= 500;

When max_mtu is below 500, pmtud_good ends up larger than pmtud_bad.
Should the description be updated, or is a clamp missing here?

> diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
> index 88cad087f13bf..a9d083076a16e 100644
> --- a/net/rxrpc/output.c
> +++ b/net/rxrpc/output.c
> @@ -325,9 +325,19 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
>  	if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
>  		size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
>  
> +		/*
> +		 * skip padding if the base ACK packets already meets/exceeds probe_mtu
> +		 */
> +
>  		if (len > probe_mtu)
>  			goto skip;

[Severity: Low]
Is this comment accurate? The skip label comes after the transmit:

	trace_rxrpc_send_ack(call, why, ack_reason, ack_serial);
	rxrpc_send_ack_packet(call, nr_kv, len, ack_serial, why);
skip:
	rxrpc_free_ack(call);

So the goto drops the whole ACK, not just the padding.

The "meets" case doesn't match either. When len == probe_mtu the branch
isn't taken, the loop does nothing, and the ACK is sent.

[ ... ]

> diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
> index fa9a406e11683..32b75a7617f99 100644
> --- a/net/rxrpc/peer_object.c
> +++ b/net/rxrpc/peer_object.c

[ ... ]

> @@ -207,11 +209,24 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
>  	peer->tx_seg_max = dst->dev->gso_max_segs;
>  	dst_release(dst);
>  
> -	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
> +	/*
> +	 * Avoid unsigned underflow if the interface MTU is smaller than the
> +	 * transport header size (e.g., on virtual interfaces with MTU 0).
> +	 * Also cap the PMTUD upper bound to what local->kvec can hold when
> +	 * padding probes with PAGE_SIZE zero pages (3 header/SACK/trailer
> +	 * kvecs are reserved before the zero-page padding loop).
> +	 */
> +
> +	max_mtu = peer->if_mtu > peer->hdrsize ? peer->if_mtu - peer->hdrsize : 0;

[Severity: Medium]
This isn't a bug introduced by this patch, but the same subtraction is
still unguarded in two other places, and both put the result on the
wire. In rxrpc_fill_out_ack():

	if_mtu = call->peer->if_mtu - call->peer->hdrsize;
	if (call->peer->ackr_adv_pmtud) {
		max_mtu = umax(call->peer->max_data, rxrpc_rx_mtu);
	} else {
		if_mtu = umin(if_mtu, 1444);
		max_mtu = if_mtu;
	}
	...
	trailer->ifMTU		= htonl(if_mtu);

The connection-level final ACK in rxrpc_conn_retransmit_call() in
conn_event.c does the same computation and fills trailer.ifMTU from it.

The new comment says if_mtu <= hdrsize can happen. In that case both
sites wrap to about 0xFFFFFFxx. With ackr_adv_pmtud set, ifMTU tells the
peer roughly 4G. Otherwise the ACK advertises 1444 for an interface that
rxrpc_assess_MTU_size() now treats as having no usable payload.

Should these sites use the same guard, so all three agree on the value?

> +	kvec_limit = (ARRAY_SIZE(local->kvec) - 3) * PAGE_SIZE -
> +		     sizeof(struct rxrpc_wire_header);
> +	max_mtu = umin(max_mtu, kvec_limit);
> +
> +	peer->max_data		= umin(RXRPC_JUMBO(1), max_mtu);

[Severity: Medium]
This is a pre-existing issue, but this clamped assignment is skipped if
the route lookup fails earlier in rxrpc_assess_MTU_size(). By that point
peer->max_data may already have underflowed.

rxrpc_init_peer() runs while if_mtu is still 0 from kzalloc:

	peer->hdrsize += sizeof(struct rxrpc_wire_header);
	peer->max_data = peer->if_mtu - peer->hdrsize;

So max_data starts out near 0xFFFFFFC8. The fallback at the top of
rxrpc_assess_MTU_size() never fires for that value:

	peer->if_mtu = 1500;
	if (peer->max_data < peer->if_mtu - peer->hdrsize) {
		...
		peer->max_data = peer->if_mtu - peer->hdrsize;
	}

If hdrsize > 1500, the right-hand side wraps too.

If ip_route_output_ports() or ip6_route_output() then fails, the function
returns with max_data still near UINT_MAX. It stays there until an ACK
trailer or an ICMP message lowers it.

In that case pmtud_pending stays false, so this can't reach the kvec
overflow. But with ackr_adv_pmtud set, rxrpc_fill_out_ack() advertises
maxMTU = umax(max_data, rxrpc_rx_mtu). And the DF test in
rxrpc_send_data_packet() can never be true:

	len >= sizeof(struct rxrpc_wire_header) + call->peer->max_data) {

Would it make sense to also give max_data a safe initial value in
rxrpc_init_peer()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119021202.525077-1-gowtham398gs%40gmail.com
