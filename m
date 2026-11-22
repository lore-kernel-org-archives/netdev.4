Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356256;
	b=22b5yTBaxpGaaFZHqpjxYfMig+95yiLZRXS1GZA5JAsO2J9jornVnoGrFYCJh2WHvjNP
	 Tg49WL2rxuJr1BWjvycLVB3xFA4n2Bk03LUQ3t/z29y8sA27WCNpQOSKPVp4hc0aAgOmU
	 OwAyaFXoQikPK6zTqzv91kVSr/MLjkUKuiTXu0zT1RJjZPwrfqe7jG8/QQZovyPAVEzuK
	 4XPcAYB4MxExW/uvcfVXfsscz58tqWosDNTDAwiQgD7a/VnHbDmoIvJ070+7yMeP7TrNo
	 QjpdsJta0+PcJobkNUT8lfpJ0a43lXvnc3DA5eR3VgHYgvgB7GuZ/2kfgFHEBJ+I09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356256;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IBCuwj024PZyyxNa9iO6/34HUfTL5JYDWrPTDTMA/YI=;
	b=q1L7GoTjn6+RB0+klaixJtu0kndra5I6M2J36k1X9qUlo0aRlsMXOPCiEd7RY1y4TSI9
	 +q5VwTLMjmrkAzkkouTw8oXopRLBFbP6TQXDlBzOpp+erCIhu4JpjWug2s3x3t9SV6/Q7
	 /AAlhZVVDwcN1HF2bfaWm9bvN9PAHIlG82oNSYExzP81GW4blIIfTk3Xxp7jPe86ceIA4
	 sQ/tEeIOrFUwyKsc6OaSj2w+aMa+OUNZ3QCge8XRDDNX0i5Qo/rU2bOTvLhOi40xD1XYu
	 gi3IvhZd8S90Rifcu7p/CLFTYKqW4MuoCQp92537Kv0O51zwoWFkD7HiVsqHdtdRckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Oreqy/JK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8A606A32A;
	Sun, 22 Nov 2026 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oreqy/JK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DB01F000CA;
	Sun, 22 Nov 2026 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356255;
	bh=IBCuwj024PZyyxNa9iO6/34HUfTL5JYDWrPTDTMA/YI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oreqy/JKkJUHB/P5T1A2qq123KwJW2kMrDFFP6iYzL26BeVXrrW0Z1/9gpE8Jdm+Z
	 MK8eZhApAo3b/DztiH9PpTUAP1H1RDdZGcgwKZR8VEcbrgzdS7G+JC98JgUXsdR2tS
	 Zml+5Uw//5bLGCJKP1RqAYJp1TMnf0xtr3klMbEsJvI3f71FukmcStH5pr1QNrHu/Y
	 fR6wNYlKbHnvvq/1M3S0K7n2qYarGAobVkCHfEdWzd8IAv2VGliydyKLeJYmfv2e6F
	 xEbjzbb2lvTVT5XnuEC2wgGdpPIVz5FYhyi1FdjqsCXmh0DaK45oTFXGzVtA6DbJiA
	 vK+Yli61HhNFw==
Subject: Re: [PATCH net v6] af_packet: avoid waiting for TPACKET_V3 copies at
 retirement
From: netdev-bot+sashiko@kernel.org
To: jingxuanxie@deeproute.ai
Cc: netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 shaoyanghan@deeproute.ai, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 14:04:14 +0000
Message-ID: <179535625471.3135.1055757479714455404@kernel.org>
In-Reply-To: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
References: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On PREEMPT_RT, __packet_lookup_frame_in_block() can now return
  NULL while the current block is still TP_STATUS_KERNEL.
- [Low] The patch changelog says a review tag carries over, but the tag
  block does not contain one.
- [Low] The new comments describe only the PREEMPT_RT behaviour, and one
  of them is wrong for the default (non-RT) build.

--

af_packet: avoid waiting for TPACKET_V3 copies at retirement

On PREEMPT_RT, this patch uses write_trylock() on blk_fill_in_prog_lock
when retiring a TPACKET_V3 block. The packet path and the retirement
hrtimer then no longer block on an in-flight skb_copy_bits() while
holding sk_receive_queue.lock. If the trylock fails, the timer re-arms
and the packet path drops the capture record, while non-RT kernels keep
the blocking write_lock().

> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>
>
> ---
> Changes in v6:

[ ... ]

> Changes in v5:
> - Rebase onto net/main; no functional change, so the v4 Reviewed-by
>   still applies.

[Severity: Low]
The tag block has only the Fixes: and Signed-off-by: lines and no
Reviewed-by. Was the v4 Reviewed-by lost when v6 was reposted? If so,
could it be added back? If not, could the changelog note be corrected?

> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 73222563fb704..e0ebd0627509f 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c

[ ... ]

> @@ -677,6 +677,24 @@ static void init_prb_bdqc(struct packet_sock *po,
>  	prb_open_block(p1, pbd);
>  }
>  
> +/*
> + * Wait for an in-flight skb_copy_bits() before retiring the current block.
> + * On PREEMPT_RT the read lock can be held by a task that has been preempted
> + * or is running on another CPU, so do not block while holding
> + * sk_receive_queue.lock; return false and let the caller retry.
> + */
> +static bool prb_wait_for_copy_bits(struct tpacket_kbdq_core *pkc)
> +{
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +		if (!write_trylock(&pkc->blk_fill_in_prog_lock))
> +			return false;
> +	} else {
> +		write_lock(&pkc->blk_fill_in_prog_lock);
> +	}
> +	write_unlock(&pkc->blk_fill_in_prog_lock);
> +	return true;
> +}
> +

[ ... ]

> @@ -963,13 +982,13 @@ static void prb_retire_current_block(struct tpacket_kbdq_core *pkc,
>  		 * the timer-handler already handled this case.
>  		 */
>  		if (!(status & TP_STATUS_BLK_TMO)) {
> -			/* Waiting for skb_copy_bits to finish... */
> -			write_lock(&pkc->blk_fill_in_prog_lock);
> -			write_unlock(&pkc->blk_fill_in_prog_lock);
> +			/* Do not wait for copies while holding the queue lock. */
> +			if (!prb_wait_for_copy_bits(pkc))
> +				return false;

[Severity: Low]
This isn't a bug, but does this comment hold for non-RT builds?

There, prb_wait_for_copy_bits() takes the else branch and blocks in
write_lock(&pkc->blk_fill_in_prog_lock). Both callers hold
sk_receive_queue.lock at that point: tpacket_rcv() takes it before
packet_current_rx_frame(), and prb_retire_rx_blk_timer_expired() takes
it on entry.

The helper's comment also says "return false and let the caller retry".
Only the hrtimer path retries, through goto refresh_timer. On the packet
path, __packet_lookup_frame_in_block() returns NULL and tpacket_rcv()
goes to drop_n_account, so that record is never retried.

The name prb_wait_for_copy_bits() also doesn't fit the RT case, where
it doesn't wait.

Could the comments, and maybe the helper name, cover both
configurations?

>  		}
>  		prb_close_block(pkc, pbd, po, status);
> -		return;
>  	}
> +	return true;
>  }

[ ... ]

> @@ -1097,7 +1116,8 @@ static void *__packet_lookup_frame_in_block(struct packet_sock *po,
>  	}
>  
>  	/* Ok, close the current block */
> -	prb_retire_current_block(pkc, po, 0);
> +	if (!prb_retire_current_block(pkc, po, 0))
> +		return NULL;

[Severity: Medium]
On PREEMPT_RT, can this new NULL return break fanout rollover? At this
point the current block is full, but it stays TP_STATUS_KERNEL because
write_trylock() failed.

__tpacket_v3_has_room() only checks the block status:

net/packet/af_packet.c:__tpacket_v3_has_room() {
	...
	idx = READ_ONCE(po->rx_ring.prb_bdqc.kactive_blk_num);
	...
	return prb_lookup_block(po, &po->rx_ring, idx, TP_STATUS_KERNEL);
}

So packet_rcv_has_room() still returns ROOM_NORMAL or ROOM_LOW for this
socket, and PACKET_SOCK_PRESSURE is not set. fanout_demux_rollover()
then keeps sending packets to this socket:

	if (try_self) {
		room = packet_rcv_has_room(po, skb);
		if (room == ROOM_NORMAL ||
		    (room == ROOM_LOW && !fanout_flow_is_huge(po, skb)))
			return idx;
		...

With try_self=false, it can also choose this socket as a rollover
target.

Each of those packets then takes this path:

tpacket_rcv()
  __packet_lookup_frame_in_block()
    returns NULL
  goto drop_n_account

The packet is counted in tp_drops instead of going to a sibling socket
with space. This lasts as long as the copier holds the read lock, which
the commit message puts at hundreds of milliseconds.

Before this patch, the room check and the allocator agreed in this
state, because the allocator blocked and then succeeded.

The commit message accepts a higher capture drop rate. Should it also
say that PACKET_FANOUT_ROLLOVER and PACKET_FANOUT_FLAG_ROLLOVER no
longer move packets away from this socket in this state?

>  
>  	/* Now, try to dispatch the next block */
>  	curr = (char *)prb_dispatch_next_block(pkc, po);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118135443.24767-1-jingxuanxie%40deeproute.ai
