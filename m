Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590051;
	b=atTkFsoSyFZGp8EAlHcYIIHXxuywYwtXJlB+QRRTqKR5Wr7p7BPvLY3DbRDgIrVVBMFL
	 rZmljpUK5IjdxuHazglWiIGtfICfAMptbgnQy6RAfjEFSqYLkYaaFnu6tBdDWihuwcWIl
	 jezZVeD0ahoYbsKPwlrMaTw8MvXC1tBEpG1Lv7iXMlCV+r8tlZhV6z3FJ+UwmooknSIVc
	 /OmGF7JCBP00mHPuCNtJ1fx3jqmLHaXggLyQ55m2AHwGyjS9a5Bt8bV+RhmvqtZWxtNhu
	 zB5I4Mnt+BmoANG0gudM3J7U1Q9NjBF0MEMVptFrIoZUKgC8D0sfNU6q5thHo8IUkQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590051;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pJzbT/2sKAu+1jUa3jEs/wpzdBrn3yrOVHZfzRy28u0=;
	b=QUOL++ri020K1GD7IbIfQIRO7Y4kLsrKYlxSTznsyF0yLoIz7iGkcBUu+XqStXkIhpr9
	 ARLJEeU+jLR0ZS2I86PXMpna3t2/JHIGGmPe1F90lucXjVop3koFFvCXme7Y0xIljRJbt
	 cJ6xa/46NyRlBwjynRLsyBMq1NlgXoObJF7zwIAPHvJo2xN9A7e+/Z8XnTAUm+wG026L/
	 +uuOmpY/RpsiyBJRec4VXXSiXzXCJmaJK2TQnBx1QStIl5CvsRfaaVmU4jHR2y65peGpL
	 UYw2zgku1QoVtFuQQ9R7GSU4VsQdXWsguYURglgEt9rAw8Fo/pNpy/0VnrXTExpjzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxi7hmqN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64470606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxi7hmqN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D417A1F000CA;
	Wed, 25 Nov 2026 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590051;
	bh=pJzbT/2sKAu+1jUa3jEs/wpzdBrn3yrOVHZfzRy28u0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hxi7hmqNY+OQqqv3rFXiiuxT7k3nIBw8GKpNVG8cwALof8FTwH4pd6PUsgZLY5iz6
	 S+YanuyRswRFP32vrusmHb3Rnt80nSX6C0QF9DHxAxjHuwaaenjev7dLYYJYO+vbUk
	 WAQ1V2LbayZSr6nipjLOYO7JFn18zwRMnrkgAbSVrw5bRHAEPz5gwsqrb44sp9BHlp
	 Q5FJpxc2oZcthkceNbWnTJYyku4Ix/r0R/evtEyO6/iwORt2YtbjJBFNEl2TdgkDRj
	 xsx8AdKasSdQd+jv9+l7Mk/Vz7azVvujD0NRa7f6/+uWFGXfQTxGCXbc6KACJKQe12
	 6By+8ULHt8w7w==
Subject: Re: [PATCH] ipv6: reject datagrams that leave no room past the
 fragment header
From: netdev-bot+sashiko@kernel.org
To: 3596417740@qq.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com
Date: Wed, 25 Nov 2026 07:00:50 +0000
Message-ID: <179559005040.3135.16330539313126668995@kernel.org>
In-Reply-To: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
References: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
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

Critical: 0 · High: 1 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] The new rejection in __ip6_append_data() (`room <= trailer ||
  room - trailer < need`) is stricter than the non-paged path needs, and…
- [Medium] The commit message says 'The non-paged path is not affected:
  pagedlen is zero there and the existing copy < 0 check returns…
- [Low] The patch fixes a user-triggerable resource-exhaustion loop in
  __ip6_append_data() (net/ipv6/ip6_output.c) that the author reproduced…
- [Low] The new -EMSGSIZE rejection in __ip6_append_data() exits through
  the generic `error:` label, not `emsgsize:`.

--

ipv6: reject datagrams that leave no room past the fragment header

This patch adds a check inside the datalen clamp in __ip6_append_data().
The check returns -EMSGSIZE when the space left after the fragment headers
cannot hold the trailer plus transhdrlen and fraggap. The goal is to stop
the paged allocation path from looping through alloc_new_skb without
making progress until the socket wmem budget runs out.

> The non-paged path is not affected: pagedlen is zero there and the
> existing copy < 0 check returns -EINVAL.

[Severity: Medium]
Does this hold when transhdrlen and fraggap are both zero?

rawv6_sendmsg() calls ip6_append_data() with transhdrlen == 0:

net/ipv6/raw.c:rawv6_sendmsg() {
    ...
	err = ip6_append_data(sk, raw6_getfrag, &rfv,
		len, 0, &ipc6, &fl6, dst_rt6_info(dst),
		msg->msg_flags);
    ...
}

Take fragheaderlen = 1272 and mtu = 1280. The clamp sets datalen to 0 and
the non-paged branch computes copy = 0 - 0 - 0 - 0 = 0, so the copy < 0
check does not fire. alloc_skb() then runs under the 2 * sk_sndbuf gate,
and length -= 0.

On the next pass, copy = 1280 - 1272 = 8, which is less than length. So
copy = maxfraglen - skb->len = 0, and the code goes back to
alloc_new_skb. This repeats until -ENOBUFS.

Doesn't that mean any CAP_NET_RAW holder, including one inside a user
namespace, can reach the loop without MSG_SPLICE_PAGES or MSG_ZEROCOPY?

The new check does stop this case. The commit message also doesn't say
that UDP and ping sends with this geometry on the non-paged path now get
-EMSGSIZE instead of -EINVAL, which userspace can see.

> Signed-off-by: Dai Wenjie <3596417740@qq.com>

[Severity: Low]
This fixes a loop that userspace can trigger, and it was reproduced on
6.12.96. Should it carry a Fixes: tag and Cc: stable?

The paged-branch arithmetic quoted in the message
(pagedlen = datalen - transhdrlen - fraggap) comes from 736b380e28d0
("ipv6: account for fraggap on the paged allocation path"). The clamp line
comes from 0c1833797a5a and e57a34478586. The raw socket
(transhdrlen == 0) version of the loop is older than both.

> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index cb648c8394310..b9887b9d60a39 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c
> @@ -1651,8 +1651,18 @@ static int __ip6_append_data(struct sock *sk,
>  			 */
>  			datalen = length + fraggap;
>  
> -			if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen)
> -				datalen = maxfraglen - fragheaderlen - rt->dst.trailer_len;
> +			if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen) {

[Severity: High]
Can this branch condition still wrap, so the new guard never runs?

The early check in __ip6_append_data() only rejects mtu <= fragheaderlen:

	if (mtu <= fragheaderlen ||
	    ((mtu - fragheaderlen) & ~7) + fragheaderlen <= sizeof(struct frag_hdr))
		goto emsgsize;

	maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen -
		     sizeof(struct frag_hdr);

When mtu = fragheaderlen + k with k in 1..7, maxfraglen ends up as
fragheaderlen - 8. If cork->length > mtu, the maxfraglen - fragheaderlen
in the condition above wraps to 0xfffffff8. The condition is then false,
so the maxfraglen <= fragheaderlen test below never runs.

Without the clamp, both the paged path (MSG_SPLICE_PAGES) and the
non-paged SG large-alloc path do this:

	alloclen = fragheaderlen + transhdrlen + fraggap;
	pagedlen = datalen - transhdrlen - fraggap;
	...
	copy = datalen - transhdrlen - fraggap - pagedlen;

The result:

- copy is 0 on every pass.
- On later passes, copy = maxfraglen - skb->len is negative, so the code
  goes back to alloc_new_skb.
- fraggap grows by 8 each time and length never decreases.
- pskb_trim_unique(skb_prev, maxfraglen) cuts each previous skb below
  fragheaderlen.

The loop only ends when the 2 * sk_sndbuf gate returns -ENOBUFS.

One way to reach this is l2tp_ip6_sendmsg(). It passes transhdrlen = 4,
ip_generic_getfrag and msg->msg_flags, so splice() sets MSG_SPLICE_PAGES.
Set IPV6_MTU to 1284..1287 and add an unprivileged type 4 IPV6_RTHDR so
that fragheaderlen = 1280. Then headersize + transhdrlen <= mtu passes for
k = 4..7, and a datagram larger than mtu gives cork->length > mtu.

rawv6_sendmsg() passes transhdrlen = 0, so k = 1..7 works there. That
needs an SG device and a send length that forces
fraglen + alloc_extra >= SKB_MAX_ALLOC.

ip6_append_data_mtu() also recomputes maxfraglen for the first skb (xfrm
transport mode) and does not compare it with fragheaderlen again:

	*mtu = orig_mtu - rt->dst.header_len;
	...
	*maxfraglen = ((*mtu - fragheaderlen) & ~7)
		      + fragheaderlen - sizeof(struct frag_hdr);

The commit message says:

    the subtractions are guarded so that neither maxfraglen - fragheaderlen
    nor room - trailer can wrap.

The copy of that subtraction in the branch condition is not guarded,
though.

Would it be better to reject maxfraglen <= fragheaderlen, together with
the trailer and transhdrlen room check, before this condition? That would
be right after maxfraglen is computed and after ip6_append_data_mtu().
Another option is to evaluate the condition without unsigned wrap.

There may also be a worse case that I have not verified. With MSG_MORE on
a non-SG device, alloclen = mtu while the unclamped fraglen is
length + fragheaderlen. Could skb_put() hit skb_over_panic() in that case?

> +				unsigned int need = (unsigned int)transhdrlen + fraggap;
> +				unsigned int room = maxfraglen - fragheaderlen;
> +				unsigned int trailer = (unsigned int)rt->dst.trailer_len;
> +
> +				if (maxfraglen <= fragheaderlen || room <= trailer ||
> +				    room - trailer < need) {

[Severity: Medium]
Is this bound stricter than the non-paged path needs?

On the non-paged path, after the clamp, the existing code adds the
trailer back for every fragment except the last one:

	if (datalen != length + fraggap) {
		/*
		 * this is not the last fragment, the trailer
		 * space is regarded as data space.
		 */
		datalen += rt->dst.trailer_len;
	}
	...
	copy = datalen - transhdrlen - fraggap - pagedlen;

So datalen ends up as room and copy = room - need. alloclen already
includes trailer_len through alloc_extra, so skb_put() of maxfraglen
fits.

Before this patch, any non-paged send with room >= need fragmented
correctly. When room < trailer, the add-back undid the unsigned datalen
wrap.

With this patch, routes with a nonzero dst.trailer_len, such as an ESP
xfrm dst, fail with -EMSGSIZE when need <= room < need + trailer. For
example, take an ESP GCM trailer of 21, room of 16 and a UDP need of 8.
That used to send 8 bytes in each first fragment and is now rejected.
Raw sends (need == 0) with 0 < room <= trailer fail the same way.

Only the paged path, where pagedlen = room - trailer - need can
underflow, needs the stricter bound. Could the trailer part of the check
apply only there? The commit message also doesn't mention this change in
behaviour.

> +					err = -EMSGSIZE;
> +					goto error;

[Severity: Low]
Should this rejection also report through the error queue?

Every other MTU and header sizing rejection in __ip6_append_data() goes
to the emsgsize label:

emsgsize:
	pmtu = max_t(int, mtu - headersize + sizeof(struct ipv6hdr), 0);
	ipv6_local_error(sk, EMSGSIZE, fl6, pmtu);
	return -EMSGSIZE;

The error label never queues an error-queue entry, and it increments
IPSTATS_MIB_OUTDISCARDS:

error:
	net_zcopy_put_abort(uarg, extra_uref);
	cork->length -= length;
	IP6_INC_STATS(sock_net(sk), rt->rt6i_idev, IPSTATS_MIB_OUTDISCARDS);

So an IPV6_RECVERR application gets EMSGSIZE from sendmsg() or splice()
but finds nothing on MSG_ERRQUEUE for this one failure. The drop is also
counted in OUTDISCARDS.

Jumping straight to emsgsize from inside the loop would skip the
cork->length and uarg cleanup. Would calling ipv6_local_error()
explicitly before the goto error keep this consistent with the other
sites?

> +				}
> +				datalen = room - trailer;
> +			}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709%40qq.com
