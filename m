Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442183;
	b=mO6bIJWDAxoeDwrjHEjkaSHYxap3VkA6mKV1U6IOPZqxO6r8aGvVbQzcNpBqUyesu2Ac
	 KtLoTvp/WgCGeeFBFq2xSiN0ltvl3YpYTc29/7ZxSZZ3lWqlzaYchDve0o7PGi2+1H7R7
	 X8xQOS7l68nF4hJrOTiM4NmONZEEGiXPMoF9DdSq1xIdVanFyiwBZXBW+LuK0LyTq/Own
	 H2JmhXPPeJSv/+2vKgInB/91nOKBoT6ixqYUKXokXIsZibCIbZT89HAevx9ZjjQq9k1N8
	 2Ve7PP7PmYKyKEZaIJDHPmWUc+9ptJa9ogoA3d9zJJcWn2FbwuXZi+cgHFfih9ifYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442183;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=elXleLjGMgaKjWSrc09mBM5vLGTodPWNVJvKoRwMpAE=;
	b=0nGv87JzgPWWf/EyJ3ZmLqUbfMAFzZJ9aQrytiPGynzEbXxo5RzfKjFby9ABGzHIrhzA
	 zm56AgOeYs/QWT/Th9m1ZskSXa3B0c7PFkCEwXipx4GLXFuYmVR35bUutU9xG0Oq3hKvn
	 M2TiL2bfFIk1rY+b8tdkY8ZzVcNgoFHuP5CqFOM9me1y5HzjQiSKIKYJqDQBLnJ0Q1cgE
	 Ngy09mCCmYZDYC9UDnn7gNf4HMLkytE9pbmKige/MPgYR9C/wKeLPvEQ16QonN+/c0iRb
	 S0i3sm1ln65Jhaz13Dk98fZc2DNPtYquM06SgZG/G9UqWPt+XVsGkOwfIi7s7YyPGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NRz5uADo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8D606A336;
	Mon, 23 Nov 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NRz5uADo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E6A1F000F4;
	Mon, 23 Nov 2026 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442183;
	bh=elXleLjGMgaKjWSrc09mBM5vLGTodPWNVJvKoRwMpAE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NRz5uADo/hFVviKJ6Ainl8m8Nr/ocsHLBaxwTwYWjmusvoc6QGcuzDHjYar9q4qW9
	 7ZRlQZlZMbrSue5xTcqv7pJMUO2SZvaKAoPhRR1Qm+LiWNJcA3MO6/coG2l5kKU0Pg
	 Y7zsazseshdglOKajxNSfhBXKj3md7Qzs0BZ6C6C3gNw9xc7Ngx9mPEKu/S2XcI0dd
	 TRgHj3LdR2gJoC5DL30C9HjpzeBlQ3QEDIbT6FWA8VYmINieGjBwaHsp/9H2aNDMaE
	 Hm7EYIQY+uc4ROb4Qql2TyNHPq63OTcOWqBWVL37Rbd3mVvxaF+UNoCaxVK2jS2Tz3
	 jVlGtmN3GhxeA==
Subject: Re: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
From: netdev-bot+sashiko@kernel.org
To: linma@zju.edu.cn
Cc: dhowells@redhat.com, marc.dionne@auristor.com, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Mon, 23 Nov 2026 13:56:22 +0000
Message-ID: <179544218224.3135.17101952241323509354@kernel.org>
In-Reply-To: <20261122135515.3989708-1-linma@zju.edu.cn>
References: <20261122135515.3989708-1-linma@zju.edu.cn>
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

Critical: 0 (1) · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but
  rxrpc_resend_tlp() can still pass a freed (NULL) txbuf slot to…

--

rxrpc: Fix missing lower bound in rxrpc_resend_tlp()

This adds a lower-bound check on the tail Tx queue segment in the fast
path of rxrpc_resend_tlp(), so that it matches the slower queue walk.
According to the commit message, the bad state comes from
rxrpc_send_data_packet() failing to allocate its wire header. By then
rxrpc_transmit_fresh_data() has advanced tx_qtail and tx_top, but
tx_transmitted has not been updated.

> diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
> index 21be9c86d7a74..e5578779b3f74 100644
> --- a/net/rxrpc/call_event.c
> +++ b/net/rxrpc/call_event.c
> @@ -141,6 +141,7 @@ void rxrpc_resend_tlp(struct rxrpc_call *call)
>  	/* There's a chance it'll be on the tail segment of the queue. */
>  	req.tq = READ_ONCE(call->tx_qtail);
>  	if (req.tq &&
> +	    after_eq(call->tx_transmitted, req.tq->qbase) &&
>  	    before(call->tx_transmitted, req.tq->qbase + RXRPC_NR_TXQUEUE)) {
>  		rxrpc_retransmit_data(call, &req);
>  		return;

[Severity: High]
Does this fix the inconsistent state itself, or only one of the places that
consume it?

The commit message names the wire header allocation failure in
rxrpc_send_data_packet() as the trigger. rxrpc_transmit_fresh_data()
commits the new tail before it sends:

net/rxrpc/call_event.c:rxrpc_transmit_fresh_data() {
    ...
		call->tx_qtail = tq;
		call->tx_top = seq;

		space -= req.n;
		rxrpc_send_data_packet(call, &req);
    ...
}

rxrpc_send_data_packet() then returns before tx_transmitted is advanced:

net/rxrpc/output.c:rxrpc_send_data_packet() {
    ...
	whdr = page_frag_alloc(&call->local->tx_alloc, sizeof(*whdr), GFP_NOFS);
	if (!whdr)
		return; /* Drop the packet if no memory. */
    ...
	if (seq == call->tx_transmitted + 1)
		call->tx_transmitted = seq + req->n - 1;
    ...
}

Nothing appears to bring tx_transmitted back in line with tx_top later, so
tx_top stays ahead of tx_transmitted.

On the next pass of the while (space > 0) loop in
rxrpc_transmit_fresh_data(), req.seq is still built from tx_transmitted:

		struct rxrpc_send_data_req req = {
			.now	= ktime_get_real(),
			.seq	= call->tx_transmitted + 1,

But req.tq is taken from the segment holding tx_top + 1.
rxrpc_prepare_data_packet() then indexes that segment with the stale seq:

		struct rxrpc_txbuf *txb = tq->bufs[seq & RXRPC_TXQ_MASK];

Here is an example with RXRPC_NR_TXQUEUE=64 and a jumbo limit of 4,
starting from tx_transmitted = tx_top = 60 and send_top = 70:

  - batch 61..64 sets tx_qtail to segment B (qbase 64) and tx_top to 64,
    then the wire header allocation fails
  - the next pass uses req.seq = 61 with req.tq = B
  - txb = B->bufs[61] is the slot for seq 125, which was never filled, so
    it is NULL
  - B's segment_lost, segment_xmit_ts[61] and segment_serial[61] are
    updated for the wrong slot
  - rxrpc_prepare_data_subpacket() then does
    txb->data - sizeof(*jumbo) on the NULL txb

If the wrong slot happens to be filled, does another packet's payload
go out under this header's seq instead?

There also seems to be a case where the call stalls. The loop breaks
once tx_top reaches send_top. If the LAST txbuf was in the skipped range,
rxrpc_close_tx_phase() has already run and tx_qtail is NULL. Packets
tx_transmitted+1..send_top would then never be sent, because
rxrpc_resend() and TLP only look up to tx_transmitted.

Would it be better to keep tx_transmitted, tx_top and tx_qtail
consistent on the allocation failure path? One option is to not commit
tx_top and tx_qtail until the send succeeds, another is to roll them
back. Either would make this bounds check in a single consumer
unnecessary.

[Severity: Critical]
This isn't a bug introduced by this patch, but can rxrpc_resend_tlp()
still pass a freed txbuf slot to rxrpc_retransmit_data() even with the
new check?

A peer can send an ACKALL during the send phase. That is
CLIENT_SEND_REQUEST or SERVER_SEND_REPLY, before the LAST packet has
been queued (e.g. sendmsg with MSG_MORE):

net/rxrpc/input.c:rxrpc_input_ackall() {
    ...
	if (rxrpc_rotate_tx_window(call, call->tx_transmitted, &summary))
		rxrpc_end_tx_phase(call, false, rxrpc_eproto_unexpected_ackall);
}

rxrpc_rotate_tx_window() puts each txbuf up to tx_transmitted and sets
tq->bufs[ix] = NULL. It keeps the tail segment, so tx_qtail still covers
tx_transmitted.

Since rot_last is false, rxrpc_end_tx_phase() isn't called.
rack_timer_mode stays at RXRPC_CALL_RACKTIMER_TLP_PTO, rack_timo_at stays
armed, and acks_hard_ack isn't updated.

When the PTO fires, rxrpc_tlp_send_probe() checks the stale
acks_hard_ack:

	if (after_eq(call->acks_hard_ack, call->tx_transmitted))
		return; /* Everything we transmitted has been acked. */

tlp_serial is 0. tlp_rtt_taken never seems to be assigned, so it differs
from rtt_taken once an RTT sample has been taken. If send_top equals
tx_transmitted, or there is no window space, the else branch calls
rxrpc_resend_tlp().

In rxrpc_resend_tlp() both bounds checks pass, because the slot index
is correct and only the txbuf has been freed. rxrpc_retransmit_data()
then does this with txb == NULL:

	struct rxrpc_txbuf *txb = tq->bufs[ix];
	...
	txb->flags |= RXRPC_TXBUF_RESENT;

Could the TLP guard check tx_bottom instead? Alternatively, the ACKALL
path could update acks_hard_ack and stop the RACK timer. A NULL txb check
in rxrpc_retransmit_data() would also cover this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122135515.3989708-1-linma%40zju.edu.cn
