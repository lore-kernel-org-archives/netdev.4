Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289717;
	b=kbwiB/NiH07CiHAqek6xj29hjpsUzC2sbS+NkQJvZAEVYnB51Q0j5xjyADAEW27dc3Fc
	 PJudEu91syiQ4IuhAKboH7RMSESV7OXLTby4PX6KnS6A+7T2+fdrPQe2X4IPqUBeupPh+
	 jC/G/QkxN06QJoPFby9Elict4L3O3HCXwfwzCXlEH665kjd8hR2ZroNSah0f8+0rIDBCJ
	 53HO/w5KLwf97i+5CHsSpty+Q+YRJdxYYGleUUh7E+9z7ePkvvsnqGrJY4RKSLjYx1FoY
	 2lv+wqWw3cB1qQ0+DK9VSKLynnJPNx7ha+DrntrzPIIOHeucbCHIMM30N7UtPlhG6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289717;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6CN2gJNDMBoiZ0kP/OYJnDTB0ekHy0tOCfyENNeW4Ns=;
	b=rSgc2N8AkGKG8rDxdL6plar6IvxYj+n7d0fiWuDWNfQdl7RX8rWN9IjaBd6aVDIc94KF
	 Wh1lMXGju5csMh+NGGT7kRGXKdoEr8XRCMW5iuoU3RHgBMlGabO/nZQKhTrKiW7Vp97oa
	 HilB23z5xi+CEwb9n39Vs4mizvADK1dEmofdJD+QGik8R+UP3Oa1wJn9lV2LVJmg27qgl
	 96dBjgpALA5dJraTgeRa2icWbOCoRDSHmeldW8yZEDUEo+0RklrnEN87rE/i7t485bi04
	 Bm+c+oq4JVvghHbmU06uLsaN4OQoKA7I2ex3oVySHpLYmbDaWfLCPulFCO381IYJb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXbFkFWb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D828606A33A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXbFkFWb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8413A1F000C4;
	Sat, 21 Nov 2026 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289717;
	bh=6CN2gJNDMBoiZ0kP/OYJnDTB0ekHy0tOCfyENNeW4Ns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CXbFkFWbxl+tueznEajlYa35Xl5kos2bLxAAt257JUvxKUM3Ti4+QUK+9uHMXSbjo
	 57Q4ZSOkBpIkiVNBzz4Z5tQ/2nUs9oQjr221+7hxmK5Md7n6bJxjwnBPy92EEloP2I
	 n7LFU+kh/2mMl4Hbpn5KlziLmXoH5Bz/fuakdbTsO7vMAHyBNrkQM2549nBE6K9SMl
	 kR0eZe5PZYSPg4Osad9ntGZOwYF5vRkRE/TL3R7C1NG+EwfaMz8hOQg4CuwgBPF+uw
	 SCHsTG73ctUOKG/YMhjIbsFJ0xt9bpDojR5ohpbijagUgWsdT1XuDg9SVwPlnE5oQ9
	 yKjxdLaUJW1mg==
Subject: Re: [PATCH net-next] net: do not over-estimate truesize in
 zerocopy_fill_skb_from_iter()
From: netdev-bot+sashiko@kernel.org
To: edumazet@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, kuniyu@google.com, horms@kernel.org,
 netdev@vger.kernel.org, jiayuan.chen@linux.dev
Date: Sat, 21 Nov 2026 19:35:16 +0000
Message-ID: <179528971611.3135.7627191622615262722@kernel.org>
In-Reply-To: <20261119101538.3229466-1-edumazet@kernel.org>
References: <20261119101538.3229466-1-edumazet@kernel.org>
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

- [High] The new merge accounting in zerocopy_fill_skb_from_iter()
  (net/core/datagram.c) assumes that this skb's truesize already paid…
- [Low] The patch says the problem was found with an AI coding assistant,
  but only in the text after the '---' separator.

--

net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()

This commit changes how zerocopy_fill_skb_from_iter() accounts truesize.
Each new frag now charges one page. A chunk merged into the last frag
only charges the pages that frag did not already cover. Before, the code
charged PAGE_ALIGN(copied + start) for every iov_iter_get_pages2() batch.

Link: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/

> ---
> This was found with an AI coding assistant, while reviewing
> the patch in the Link above, which mentions 8 one-byte iovecs being
> charged 32768 bytes.

[ ... ]

> With this patch, both cases add 4096 bytes. Kernel selftests were
> not run.

[Severity: Low]
This isn't a bug, but this text is below the --- separator, so git am
will drop it. The committed changelog would then not say that the problem
was found with an AI coding assistant. The reproducer results and the
note that selftests were not run would also be lost.

Documentation/process/generated-content.rst says:

  if a tool was used to find a problem addressed by a change, that should
  be noted in the changelog.

Could the tool attribution, and maybe the testing note, move above the
Signed-off-by block?

> diff --git a/net/core/datagram.c b/net/core/datagram.c
> index 489d92fe6dae8..8c418c3adf1c9 100644
> --- a/net/core/datagram.c
> +++ b/net/core/datagram.c
> @@ -659,7 +659,6 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
>  
>  		skb->data_len += copied;
>  		skb->len += copied;
> -		skb->truesize += PAGE_ALIGN(copied + start);
>  
>  		head = compound_head(pages[n]);
>  		order = compound_order(head);
> @@ -680,6 +679,11 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
>  
>  				if (head == skb_frag_page(last) &&
>  				    start == skb_frag_off(last) + skb_frag_size(last)) {
> +					/* Only account the pages this frag
> +					 * did not already cover.
> +					 */
> +					skb->truesize += PAGE_ALIGN(start + size) -
> +							 PAGE_ALIGN(start);
> +					skb_frag_size_add(last, size);

[Severity: High]
This seems to assume that this skb's truesize already pays for every page
the last frag covers. Is that always true?

It holds for frags created earlier by zerocopy_fill_skb_from_iter()
itself. But TCP tail skbs can end with a frag that was charged per byte,
and the frag's geometry alone does not show which pages this skb paid
for.

tso_fragment() in net/ipv4/tcp_output.c moves exactly nlen bytes of
truesize to the remainder skb:

    buff->truesize += nlen;
    skb->truesize -= nlen;
    ...
    skb_split(skb, buff, len);

skb_split() usually leaves buff with a last frag that ends mid-page.
skb_zerocopy_clone() gives buff the same uarg, and msg_zerocopy_realloc()
reuses that uarg for contiguous sends. buff then becomes
tcp_write_queue_tail(), and tcp_sendmsg_locked() appends the next
MSG_ZEROCOPY chunk to it via skb_zerocopy_iter_stream().

The MSG_SPLICE_PAGES path in tcp_sendmsg_locked() is similar.
skb_splice_from_iter() charges only the spliced bytes:

    out:
	skb_len_add(skb, spliced);

Suppose a following MSG_ZEROCOPY sendmsg continues in the same page. It
matches the merge condition with a mid-page start, and the chunk ends
inside the page. PAGE_ALIGN(start + size) - PAGE_ALIGN(start) is then 0,
while skb->len grows by up to PAGE_SIZE - 1.

For example:

  - a zerocopy send of 2048 bytes from page P is charged 4096
  - tso_fragment() splits at 1000 bytes, and buff gets frag [P, 1000, 1048]
    with truesize 1048
  - a zerocopy send of bytes 2048..4095 of P merges into that frag and is
    charged PAGE_ALIGN(4096) - PAGE_ALIGN(2048) = 0
  - buff now holds 3096 bytes of frag data against 1048 bytes of truesize

Before this patch, the same send was charged PAGE_ALIGN(2048 + 2048) =
4096, so frag truesize never dropped below len.

This under-charges sk_wmem_queued and sk_forward_alloc. Over loopback,
can it also hit the WARN in skb_try_coalesce()?

skb_orphan_frags_rx()->skb_copy_ubufs() copies the payload into new
kernel pages without touching truesize. tcp_add_backlog() or
tcp_try_coalesce() then reach:

net/core/skbuff.c:skb_try_coalesce() {
    ...
	delta = from->truesize - SKB_TRUESIZE(skb_end_offset(from));
    ...
	if (WARN_ON_ONCE(delta < 0 || delta < len))
		return false;
    ...
}

The receiver's rmem accounting would also under-count the pages that
skb_copy_ubufs() allocated.

This looks reachable without privileges. One way is SO_ZEROCOPY on a TCP
socket with MSG_ZEROCOPY sends of a contiguous buffer in sizes that are
not page multiples, while cwnd or rwnd forces tso_fragment() on the tail
skb. Another is splice or sendfile of part of a page, followed by a
MSG_ZEROCOPY send of the rest of that page.

Would it help to charge at least the merged bytes here, for example the
larger of the page delta and size? Another option is to track which pages
this skb has actually charged.

>  					/* We combined this page, we need to release
>  					 * a reference. Since compound pages refcount

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119101538.3229466-1-edumazet%40kernel.org
