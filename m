Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508071;
	b=vpNXRMQmEQs0G8DF7UF1ZMowrE0hB4gmskmyQeHvx+3CYvytHFqAyK6+copAPekkB6ix
	 oLkGDpyozXSvcSAXEurL58Q2FkP3k2/Ig7l2o2SJsjNGoGl0N8CIQvD/TR9IucmRBADu9
	 hV2l36TN+/j2x6DoMZfgtQOW3slg3mTl/uEe8TQ8hAfKFRPgNVMvajqxpWTyY1PGBmEJS
	 c+YF45OYlPnITF7usFZ9u74nYGd1CUb1H2qI4mdblLUj+CRQXxeqMyEBXsTQbQwgiBZ8o
	 2u2oJRWnQehRtKaPJtLtsLp8cks8wDX/xQsAHfqquAP7c4/VdzhqEZNlhf13oPyK4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508071;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5kIJ6tQi0PHKcy1HxVFl+UQPO7ioAUVMwSZpbfVBl2U=;
	b=i6efuHN+IJxEuF9Jukrpk7R0n9T8YGDbCUhI+oyo58ouOAB43rgSpXLvmDGBl4p6ZDsj
	 KJxGVEvTi2rGYurK2MNHGLKKtPhRH4o5Swxqy+MFjJjYJZK3Afykbu/8DX7fLeLMOGEIJ
	 nMMdxE+QgHKfLTuoW2EUXvofe/3gkauBngSC91Eh7B3GU48P/l38l4qBiZi3x4/fMEfKv
	 laJn9V3R3w9pxkEWnvhJJ70GZBY37X+/Mc2NJMSzLD1fSQoF1EDha9O5K/TAvwLEz2YhG
	 xeC7Ss2ziSj0hubUwk85H+8jlv2cBrxin6BPmivwr+6Hr/LDo3bRHAcTxkq6xb0aFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgFZtFdF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9841606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgFZtFdF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6951F000C4;
	Tue, 24 Nov 2026 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508071;
	bh=5kIJ6tQi0PHKcy1HxVFl+UQPO7ioAUVMwSZpbfVBl2U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XgFZtFdF0V4fbRTG5wXJzkN+0nEC84NCbktt2Dgz/Z6AV4hiJk/+4xdb5OVgHTe98
	 d1DyJBHFEcOJXlQRGzHGB5qmYW4wRFNVPoHTGbOpqCfxK1d3WpY5qS94QymFAEbeKx
	 8R2F15BDHj9k/PXTZqEgE/VFzSZ59ZkbOmQJXXyChtKmQXdYaU75NRoN09RUMauuyQ
	 SRN6Fjt3K4IwYCoM+jiSNE78O6pmkCH/6aCJB2xAmSSrq07CwE/NB23VO8zL42P0QN
	 TRuCCvQFPoS5qo4WAWCtt+t0RYjFJ+1UrUPwPqMAsgpfw/CF+x9WrldyF0LqNbs9im
	 uJd0hOoNObLlw==
Subject: Re: [PATCH net-next v6 6/7] net: prevent mixing frags from different
 memory providers or bindings
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sdf@fomichev.me, kaiyuanz@google.com, willemb@google.com,
 daniel@iogearbox.net, josef@toxicpanda.com, sdf.kernel@gmail.com,
 dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com
Date: Tue, 24 Nov 2026 08:14:30 +0000
Message-ID: <179550807001.3135.15837206052330880112@kernel.org>
In-Reply-To: <20261120201408.3445445-7-almasrymina@google.com>
References: <20261120201408.3445445-7-almasrymina@google.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] skb_mem_provider_compat() is now called in skb_try_coalesce()
  and skb_gro_receive(), but both functions can still move a struct page…
- [Low] The commit message calls the issue 'theoretical' and only talks
  about mixing provider instances or devmem bindings.

--

net: prevent mixing frags from different memory providers or bindings

This adds skb_mem_provider_compat(). Two skbs count as compatible when
both are readable, or when both are unreadable and frags[0] of each
resolves to the same net_iov provider instance. The check is enforced in
skb_try_coalesce(), skb_gro_receive(), skb_gro_receive_list(),
skb_segment() and tcp_skb_can_collapse(), and skb_shift() gets a debug
assertion.

> diff --git a/net/core/gro.c b/net/core/gro.c
> index c093fe388dfe8..6852b19e48408 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -109,6 +109,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
>  	if (p->pp_recycle != skb->pp_recycle)
>  		return -ETOOMANYREFS;
>  
> +	if (!skb_mem_provider_compat(p, skb))
> +		return -ETOOMANYREFS;
> +
>  	if (skb_zcopy(p) || skb_zcopy(skb))
>  		return -ETOOMANYREFS;
>  

[Severity: Low]
This isn't a bug, but could the commit message say more about what this
hunk fixes? The message says:

    This issue is theoretical and was found by manual code inspection and
    LLM review; it was not triggered in production.

It only describes the problem as mixing provider instances or devmem
bindings.

Before this patch, skb_gro_receive() and skb_gro_receive_list() did not
check readable against unreadable at all. skb_gro_receive() only compared
pp_recycle, which is 1 for both normal page_pool pages and net_iov
page_pool memory. It also never set p->unreadable.

So the headlen <= offset frags path could merge an unreadable skb into a
readable p. The result would be a readable skb holding net_iov frags.
__skb_datagram_iter() only checks skb_frags_readable() before doing:

	skb_frag_foreach_page(frag, ...) {
		vaddr = kmap_local_page(p);

Here skb_frag_page() returns NULL for a net_iov.

skb_try_coalesce() and tcp_skb_can_collapse() already compared
readability, so for those paths this patch only tightens the check. The
GRO hunks close a much larger gap.

Could the message mention this, so stable maintainers can judge the
impact?

[ ... ]

> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index aac61fbe419f2..212d76ef9672e 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c

[ ... ]

> @@ -6620,7 +6667,7 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
>  	 * belong to the same memory provider instance; do not coalesce skbs
>  	 * that would mix them.
>  	 */
> -	if (skb_frags_readable(from) != skb_frags_readable(to))
> +	if (!skb_mem_provider_compat(to, from))
>  		return false;
>  
>  	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {

[Severity: High]
Can a struct page still end up in an unreadable skb's frag array after
this check passes?

If to and from are both unreadable and share a provider,
skb_mem_provider_compat() returns true. Suppose from carries payload in
its linear area. The tailroom copy is skipped because
skb_frags_readable(from) is false.

If from also has head_frag set and is not cloned, skb_head_is_locked() is
false, so the head gets stolen:

net/core/skbuff.c:skb_try_coalesce() {
    ...
	if (skb_headlen(from) != 0) {
		struct page *page = virt_to_head_page(from->head);
		unsigned int offset;

		offset = from->data - (unsigned char *)page_address(page);
		skb_fill_page_desc(to, to_shinfo->nr_frags,
				   page, offset, skb_headlen(from));
		*fragstolen = true;
	}

	memcpy(to_shinfo->frags + to_shinfo->nr_frags,
	       from_shinfo->frags, ...
    ...
}

skb_gro_receive() seems to do the same after its new check when
headlen > skb_gro_offset(skb):

net/core/gro.c:skb_gro_receive() {
    ...
	} else if (skb->head_frag) {
		...
		struct page *page = virt_to_head_page(skb->head);
		...
		skb_frag_fill_page_desc(frag, page, first_offset, first_size);

		memcpy(frag + 1, skbinfo->frags, sizeof(*frag) * skbinfo->nr_frags);
    ...
}

Either way, the skb has unreadable set but its frags mix a page_pool
header page with net_iovs. That goes against the comment right above the
new check: "All frags in an skb must either all be struct page-backed or
all belong to the same memory provider instance".

skb_zerocopy() already rejects this layout:

	if (!skb_frags_readable(from) && j > 0 && len) {
		skb_frag_unref(to, 0);
		return -EFAULT;
	}

Documentation/networking/devmem.rst says payload lands in the linear area
when the NIC can't split the packet at the header boundary. The remote
peer controls the shape of those packets.

A devmem receiver would then reach this in tcp_recvmsg_dmabuf():

			if (!skb_frag_net_iov(frag)) {
				net_err_ratelimited("Found non-dmabuf skb with net_iov");
				err = -ENODEV;
				goto out;
			}

The skb is never consumed. Wouldn't every later recvmsg() on that socket
fail the same way?

Also, skb_net_iov_provider() only looks at frags[0], so later merges
won't catch a mixed skb once it exists. Nothing later in the series
appears to touch these paths.

Should skb_try_coalesce() and skb_gro_receive() refuse to steal the head
of an unreadable skb, the way skb_zerocopy() does?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120201408.3445445-1-almasrymina%40google.com
