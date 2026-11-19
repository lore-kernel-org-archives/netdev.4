Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100218;
	b=H/b+211kddAkNycTbFuHxSb+Rt1sKNA0pzpBeIZmx2dJH0Sn2MBl+wMxKAqmG2NuJZl2
	 BtgHtzZvyfpIpdxGfCaAfTUby7rDgnPU+lBB64RUwoGpII8Xy1eqDbfZsm1BQX+87jyOq
	 RCZX6jjiey62fgEjPAvXDCyn2FHnJf3IdnxkdiiLyRVhhonm8kIeOBjB06UMBvmJ1kSDo
	 LjBsk6foZcUJ4pbCU92EDGka8ppDkB6fy76QkWoB3gn337g49Oj6VCoNHaOdpvcv3bbfd
	 z/C3tGhK30ARhp6As9etpo0tm15rHM+lgT1+Pf3JDiiA+enSniwk00Tc1wPZ1jEanGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100218;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h4wVfzJaa/ibP8lnm0+cpyqaMS8S9SYMC5L5IAg9SnA=;
	b=u+GcP1aYZHzHTmrQdX5Hht/ZwnvKd9iZvGYZcDlCp8Rmulg0KOvsog6QGlHIfGM/AZh/
	 GoLl3eW1L3Pzs3t0dGx8pByRI1TjC3JicQrVbQ6wHiApcHWonU/+dun5YBcWJIDqHnIDX
	 yPcNsUUVlVEKW1TQc3ow/zj/l6cdnho0IMLVXyvEHyU3ZISz8sjwWfeKpTITcqeWAJylE
	 8+viCGnsmD+gWOhB+ZbpWcHCHRSvxScUTY8lp5GMGYzC/G2xtDn5zNIN7KG55qRQvCxcD
	 Z9JgjS0DOFCFXbX0TXaxIC0KONU4r9SC9ATba2/xhStxuZSMbaK+L0y5CGCcJqxSw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/NNxc3/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C15606A320;
	Thu, 19 Nov 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/NNxc3/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ADE1F000C4;
	Thu, 19 Nov 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100218;
	bh=h4wVfzJaa/ibP8lnm0+cpyqaMS8S9SYMC5L5IAg9SnA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E/NNxc3/gdqSVZhn2j7w8PkOa6j1MvtbezXHVadiMFdAJfTCQ75jmOEtiVkXngxky
	 UJjYXKwmqo2g3kba68S76vENKejPf5T04nKqLy+HjInKDqIHs5PFa8n8SqizR0n7dQ
	 9oIWQOqCroWU9Jpe/LpDoch1gyCPt18NSsr2VwWtW1jJZ31IMJ5iEUVE3Lhtb+AxY/
	 Oo7KI8m0vV+Iuhw41XmQNTBIM6tzHVTKvyv++/doYe5eezf/wtOhGbhWE7hfJmiwz0
	 xgi/MRY0EqfrKwcquRUDQf7zl5brrMxZZjjm18bdFtRNRoH+WexCRUNnda8RmaDlZZ
	 2SgGUGXu+SWcQ==
Subject:
 Re: [PATCH net v3 1/2] net: do not run out of frags in alloc_skb_with_frags()
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, almasrymina@google.com,
 daniel@iogearbox.net, willemb@google.com, willemdebruijn.kernel@gmail.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 narcisav.kernel@gmail.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 14:56:57 +0000
Message-ID: <179510021729.3136.221796617179339449@kernel.org>
In-Reply-To: <20261116115620.18151-2-yanhaishuang@cmss.chinamobile.com>
References: <20261116115620.18151-2-yanhaishuang@cmss.chinamobile.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says only tun is affected ("tun hits this with
  large GSO packets from a vhost-net guest").
- [Low] In alloc_skb_with_frags() (net/core/skbuff.c), when a non-
  blocking high-order allocation fails and order-1 pages cannot hold the…
- [Low] The commit body (above the '---' line, so it stays in git
  history) says "Tested with that guest, page allocation fault injection…

--

net: do not run out of frags in alloc_skb_with_frags()

This patch changes how alloc_skb_with_frags() sizes its frags. When
splitting the tail into smaller pages would need more than MAX_SKB_FRAGS
frags, it uses one larger page instead. When a non-blocking high-order
allocation fails, the order is lowered only if the rest still fits.
Otherwise the same order is retried with direct reclaim.

> tun hits this with large GSO packets from a vhost-net guest.

[Severity: Low]
Is tun the only affected caller? tap_alloc_skb() in drivers/net/tap.c and
packet_alloc_skb() in net/packet/af_packet.c use the same clamp as
tun_alloc_skb():

drivers/net/tap.c:tap_alloc_skb() {
    ...
	if (len - linear > MAX_SKB_FRAGS * (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
		linear = len - MAX_SKB_FRAGS * (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER);
	skb = sock_alloc_send_pskb(sk, prepad + linear, len - linear, noblock,
				   err, PAGE_ALLOC_COSTLY_ORDER);
    ...
}

vhost-net also drives macvtap/ipvtap through tap_get_socket(), and
AF_PACKET vnet_hdr GSO senders reach the same path. All of them could hit
the same -ENOBUFS failure before this patch. The fix in the shared helper
covers all of these callers, so only the message is incomplete.

The visible symptom is only described below the '---' line, and that part
is dropped when the patch is applied. In that symptom, handle_tx_copy()
treats -ENOBUFS as retryable:

drivers/vhost/net.c:handle_tx_copy() {
    ...
			if (err == -EAGAIN || err == -ENOMEM || err == -ENOBUFS) {
				vhost_discard_vq_desc(vq, 1, ndesc);
				vhost_net_enable_vq(net, vq);
				break;
			}
    ...
}

It then retries the same descriptor forever.

The message also doesn't say that the trigger needs data_len above roughly
68K. At 64K the order can drop to 0 and the data still fits in the
available frags, so stock 64K virtio-net guests are not affected.

Could the commit message list tap and AF_PACKET as affected, describe the
vhost retry symptom, and give the size threshold? That would help anyone
deciding on a stable backport.

> Found while prototyping >64K TSO in a virtio-net guest. Tested with that
> guest, page allocation fault injection and the KUnit test in patch 2.

[Severity: Low]
This isn't a bug, but "patch 2" is a position in the posted series and
will mean nothing once the commit is in git history. This fix also has a
Fixes: tag and may be backported on its own.

Could this sentence name the test commit instead ("net: add a KUnit test
for the alloc_skb_with_frags() tail split"), or move below the '---'
line?

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index a7d555b3d2f28..43581ca020243 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -6906,17 +6906,40 @@ struct sk_buff *alloc_skb_with_frags(unsigned long header_len,

[ ... ]

>  		if (order) {
>  			page = alloc_pages((gfp_mask & ~__GFP_DIRECT_RECLAIM) |
>  					   __GFP_COMP |
>  					   __GFP_NOWARN,
>  					   order);
> -			if (!page) {
> -				order--;
> -				continue;
> +			if (unlikely(!page)) {
> +				unsigned int shift = PAGE_SHIFT + order - 1;
> +
> +				/* Can smaller pages hold the rest? */
> +				if (((data_len - 1) >> shift) + 1 <=
> +				    MAX_SKB_FRAGS - nr_frags) {
> +					order--;
> +					continue;
> +				}
> +				/* No, retry this order with direct reclaim. */
> +				if (!gfpflags_allow_blocking(gfp_mask))
> +					goto failure;
> +				page = alloc_pages(gfp_mask | __GFP_COMP |
> +						   __GFP_NOWARN | __GFP_NORETRY,
> +						   order);
> +				if (!page)
> +					goto failure;

[Severity: Low]
Does this fallback bring back the order-3 direct reclaim and compaction
that commit fb05e7a89f50 ("net: don't wait for order-3 page allocation")
removed from this function on purpose? That commit noted that
"alloc_skb_with_frags is the same".

tun_alloc_skb(), tap_alloc_skb() and packet_alloc_skb() set data_len to
exactly MAX_SKB_FRAGS * (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER). With 4K
pages and the default MAX_SKB_FRAGS of 17, the check at nr_frags == 0 is:

  ((557056 - 1) >> 14) + 1 = 34 > 17

The left side stays larger than the remaining frag count for every later
frag too. Under fragmentation, could a single packet then cause up to
MAX_SKB_FRAGS direct reclaim/compaction attempts? Those would run either
in the vhost worker while holding vq->mutex, or in the AF_PACKET sendmsg
path.

This retry only runs where the old code would already have failed with
-ENOBUFS, so the behaviour itself is not a regression. If the order-3
retry also fails, though, handle_tx_copy() retries the same descriptor
again, and each pass now includes a reclaim attempt.

Could the commit message mention fb05e7a89f50 and explain why the
reclaim cost is acceptable here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116115620.18151-1-yanhaishuang%40cmss.chinamobile.com
