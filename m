Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100220;
	b=ZcJnqbtKlAayhqhv+djaGBUBWG5oVHtuoXs8vi1VOFvZarV5Q8SnB4Bw2Fj3GXlnIZOY
	 +OlZ/pWzHQIW7rQwd003PQez/AnK0V2Nyd1NDpyi/KO9cv3JrKud2oBdy6YdnwqQefM6S
	 uI+GSOT1PPmn75xBQ09eGXs6xjSxg74tMhBG+CXbagyjYklLq+rI491ADeuF+8urQs6fI
	 4Vx7UN5F5rSWK8mrCnWCp8odJMGEpWxqn5j5r1HdOeXLedmaeapj/kwtsHIKvwg153iBV
	 AXW3hCjIEYlvQfDToZMjz9MRk5zi00sQ5fObzMRD9PSgOThKWmbiDpaufPDd6vRSF5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100220;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Cnsng9BOZcTR5dWhMhFYliiky1LEK8VCvuJn4fpPT3c=;
	b=hR/E9v4XOy2Tr+sMfd1oTLW4RqrJ3FFlImPrpjVRVJw4jbvs4weGoTu9qrvvYvOEwNg4
	 eH7WT6XpxPLx+7cQ1NX+INnQnLsNg6uGG29qx88noY3hqHUQTcdfSZUuUvYItt0HLIunH
	 aMZPKPgDtcuT3Psu7b1AF69ObpRrWwz1Wcl+WO/g0qtr2hsjfKs3r4Ka7s8EImteQ3gAw
	 rsadHGOjqsZdHhxguwJ67yeq5j79pXVn9KG1mxQ74q9wQ3vI/ToQ/eXHTtIW8W3+gtt7m
	 ZBeSE0O2dbAUyOKD2vXtxPdDxYdGLFVT4qy5L26r0hb8M+9k/mbQ2ikqVfiRdNtKdWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KflLY7xu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68688606A33D;
	Thu, 19 Nov 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KflLY7xu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3954A1F000C7;
	Thu, 19 Nov 2026 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100220;
	bh=Cnsng9BOZcTR5dWhMhFYliiky1LEK8VCvuJn4fpPT3c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KflLY7xupGFFOzPewH3Sp5A4e0j8KWo63PiYVCjDPg7YcU6PTpuCukYhLb2nOsdWU
	 EnOU6eXvEX5k8PpUahGEYOvOMB5wkGUSyUY/elGg9jk00tpt2Lsh3N1r7rKmqtAvnj
	 kY5VsLI/Q+Ybp0OnnAbWQrDUUHd8+Th+iT/3Kd7qpupLq3DZKy+uvJk1MpMcT+9Ifk
	 iJUZVXr7VuNKaSmB6d5uERxDTJuDGELAFmFD/wq1TireWos7rxvIY8dsthn5w0sKN2
	 wUZZ973JTBygJ14hlE/Et7A+gmK5qUizPDD7tZjJSOS+gqm+J06GbBnVp4SNTAAINI
	 /mnIXJ1azfIYA==
Subject: Re: [PATCH net v3 2/2] net: add a KUnit test for the
 alloc_skb_with_frags() tail split
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, almasrymina@google.com,
 daniel@iogearbox.net, willemb@google.com, willemdebruijn.kernel@gmail.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 narcisav.kernel@gmail.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 14:56:58 +0000
Message-ID: <179510021881.3136.3672843529450562064@kernel.org>
In-Reply-To: <20261116115620.18151-3-yanhaishuang@cmss.chinamobile.com>
References: <20261116115620.18151-3-yanhaishuang@cmss.chinamobile.com>
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

- [Medium] The skip-or-fail decision in alloc_skb_with_frags_test_tail()
  (net/core/net_test.c) depends on a probe that only runs after…

--

net: add a KUnit test for the alloc_skb_with_frags() tail split

This adds a KUnit test that asks alloc_skb_with_frags() for
MAX_SKB_FRAGS - 2 full order-3 chunks plus a 7 page tail. It then checks
that the frags cover the full length. If the allocation fails, the test
checks whether MAX_SKB_FRAGS - 1 order-3 pages can be held at once, and
skips if they cannot.

> diff --git a/net/core/net_test.c b/net/core/net_test.c
> index 2b5080c226636..118866f3e28c3 100644
> --- a/net/core/net_test.c
> +++ b/net/core/net_test.c
> @@ -1721,7 +1721,58 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
>  #endif
>  #endif
>  
> +/* Can @nr pages of @order be allocated and held at the same time? */
> +static bool alloc_skb_with_frags_test_have_pages(unsigned int nr,
> +						 unsigned int order)
> +{
> +	struct page *pages[MAX_SKB_FRAGS];
> +	unsigned int i, n;
> +
> +	for (n = 0; n < nr; n++) {
> +		pages[n] = alloc_pages(GFP_KERNEL | __GFP_NOWARN |
> +				       __GFP_NORETRY, order);
> +		if (!pages[n])
> +			break;
> +	}

[ ... ]

> +static void alloc_skb_with_frags_test_tail(struct kunit *test)
> +{

[ ... ]

> +	skb = alloc_skb_with_frags(0, len, PAGE_ALLOC_COSTLY_ORDER, &err,
> +				   GFP_KERNEL);
> +	/* The full chunks can't fall back to smaller pages here, so the
> +	 * call needs up to MAX_SKB_FRAGS - 1 order-3 pages at once. Don't
> +	 * report a lack of them as a failure.
> +	 */
> +	if (!skb && !alloc_skb_with_frags_test_have_pages(MAX_SKB_FRAGS - 1,
> +							  PAGE_ALLOC_COSTLY_ORDER))
> +		kunit_skip(test, "not enough order-%d pages",
> +			   PAGE_ALLOC_COSTLY_ORDER);
> +	KUNIT_ASSERT_NOT_NULL_MSG(test, skb, "err %d", err);

[Severity: Medium]

Can this report a FAIL when alloc_skb_with_frags() only ran into a
temporary shortage of high-order pages?

The probe in alloc_skb_with_frags_test_have_pages() runs only after the
real allocation has failed, and by then memory is in a different state.
For this len, the full order-3 chunks can't drop to a lower order. So a
single failed __GFP_NORETRY retry ends the call:

net/core/skbuff.c:alloc_skb_with_frags() {
    ...
				page = alloc_pages(gfp_mask | __GFP_COMP |
						   __GFP_NOWARN | __GFP_NORETRY,
						   order);
				if (!page)
					goto failure;
    ...
failure:
	kfree_skb(skb);
	return NULL;
}

By the time the probe runs, three things have changed:

  - kfree_skb() has given the order-3 pages already taken back to the
    allocator.
  - The failed call has already done one round of direct reclaim and
    compaction.
  - kswapd and kcompactd have been woken for order 3.

The probe's GFP_KERNEL | __GFP_NORETRY order-3 allocations can then
succeed. In that case the test does not skip, and
KUNIT_ASSERT_NOT_NULL_MSG() fails.

The commit message says:

  so that fragmented memory is not reported as a failure.

Does this ordering guarantee that?

Also, the failure message prints err. That value is -ENOBUFS both for a
real frag exhaustion regression and for a page allocation failure, so the
log can't tell the two apart.

Would it be more robust to call alloc_skb_with_frags() again when the
probe succeeds, and fail only if the second call also returns NULL?

> +
> +	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
> +		frags_len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
> +	KUNIT_EXPECT_EQ(test, frags_len, len);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116115620.18151-1-yanhaishuang%40cmss.chinamobile.com
