Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424566;
	b=mXk97V04AxH+530AST/8REVE9kEJD32k4rH9wbYcpJVdBQMW9a/r02+cqLDKWdtdANsH
	 0REKI2EwDfpPkXqyB636pg9zs6w+rZhiN7v/4ODeGwzJMJ5+BpSMUwYTxqm0ccrh3NiNV
	 /U71HXfvtg3K1mSLmoMMLBldXBScp8L5XPLFKAOLleDHTW72oamNYtEoVb8vsPtu+aIhz
	 GQ6X5I2Q90wgdr3U510DQ8+gmazo4Bk29pIGxxfHgkgAybLx7+itbFHdg/OqSo3081ywh
	 U+tspVYeqIq+45rcDHkb+5Lqk8cjLZZ7aFuqbvQXle+Kv1+JhbeOlnAoY+86XJrM0Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424566;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ar2u8dRXYUTqNI0ctWg4yv56j21lkoS3WYQ/jgzITa0=;
	b=D4JttxI6JkOGHV/yPRMXaA0CZvSyLxMdZB7Zmnxje3xsZDJYVgm7wYISWK5SebdGj9SQ
	 hmdmESXym4d3Bow3FfNdHyuGMMFLk1h6gc9wJn6zX1LZkoEJwolbWR1kS3gNtJ2lsJD+G
	 60AcAql0YUmm3MKvT+jysoUfDucZjBNnz59u5lpTuhhMJTeFZwloeXavsOaVrbZPM34AP
	 jh0DUpk6IKFjl0QNj9XRWRK4PRFgcX+TJeduQL5GO/Z3QVOZF6yfyFzJlocAHcU6s8YQw
	 xEjx+W+nzy8OOu/CH9ViRnkITQqV0gCAqWa+GU7lqHbNVzHg++XoeXGv2YzKGlXBmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMHeLckF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A481606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMHeLckF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9614B1F000D1
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424565;
	bh=Ar2u8dRXYUTqNI0ctWg4yv56j21lkoS3WYQ/jgzITa0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CMHeLckFdBEyckXb2Og8Ehc2sxmLutHRX/5H3DxHwDzjIw80+HPczTFPp58p95xMn
	 t6dtAHz/0bHl6q708aa3biY6OPBvYNv2XxCvyQmaVv2t6QUkrsgPXILjHjSM/aojlI
	 Jm29QW8f/yHASeeVFMIrsTqowqcOQqnuTxqOPUkexJ6y+AsPRDHyzyCTSBY4sEvLh7
	 /VgXS8ZDcxUwq01UWajOPKfSe2j/YZaLdAQc596gCB7UQ4tKvinOqcn/5c1gtXxtk1
	 0qwbwyssBk/8Ymu5VJtYAPjQ1MNd2EzkLl7xLakdQIy/3o9HXBmZdHvOGC21ax6xqK
	 ijFefTPq+Jy6A==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-451a49abd8aso3214266fac.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERfLDymbimO+vK8M37lSAp1E5MsMaHSZlJTtzJUMX9G2TLbZ9WnU41SStzbPpHDFef8A5XeMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/obO8gLCMwBuNw2Kbt2d42Yn3UlbXMmXA81ni/qJkt5xhb2j7m
	IdU91XsgWjk5X1esRQAUeZpilp8d6yKBaeGLvFP7mhDfQxG1SHLuBZtFTAl0lsWussaPGRT2aqd
	ltxmBS6XI7hyedHD4mJWsopeZZoxmf/M=
X-Received: by 2002:a05:6871:4708:b0:4ad:6c6d:ce63 with SMTP id
 586e51a60fabf-4bc83478ea0mr9164927fac.31.1795424564831; Mon, 23 Nov 2026
 01:02:44 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119101538.3229466-1-edumazet@kernel.org> <179528971611.3135.7627191622615262722@kernel.org>
In-Reply-To: <179528971611.3135.7627191622615262722@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:02:32 +0100
X-Gmail-Original-Message-ID: <CAL4Wiirq+hjb=kxgbeiCcTxdjKXTef3Tp-q2ZWKbG708hd4J3w@mail.gmail.com>
X-Gm-Features: Aa3M54ooOsk3Uq-KK-5zouzhbYQJj50qrinJS1tMUF-VblqE69ugYV1k7juJVY8
Message-ID: <CAL4Wiirq+hjb=kxgbeiCcTxdjKXTef3Tp-q2ZWKbG708hd4J3w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	willemb@google.com, kuniyu@google.com, horms@kernel.org, 
	netdev@vger.kernel.org, jiayuan.chen@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 21 nov. 2026 =C3=A0 20:35, <netdev-bot+sashiko@kernel.org> a =C3=A9=
crit :
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The new merge accounting in zerocopy_fill_skb_from_iter()
>   (net/core/datagram.c) assumes that this skb's truesize already paid=E2=
=80=A6
> - [Low] The patch says the problem was found with an AI coding assistant,
>   but only in the text after the '---' separator.
>
> --
>
> net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
>
> This commit changes how zerocopy_fill_skb_from_iter() accounts truesize.
> Each new frag now charges one page. A chunk merged into the last frag
> only charges the pages that frag did not already cover. Before, the code
> charged PAGE_ALIGN(copied + start) for every iov_iter_get_pages2() batch.
>
> Link: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen=
@linux.dev/
>
> > ---
> > This was found with an AI coding assistant, while reviewing
> > the patch in the Link above, which mentions 8 one-byte iovecs being
> > charged 32768 bytes.
>
> [ ... ]
>
> > With this patch, both cases add 4096 bytes. Kernel selftests were
> > not run.
>
> [Severity: Low]
> This isn't a bug, but this text is below the --- separator, so git am
> will drop it. The committed changelog would then not say that the problem
> was found with an AI coding assistant. The reproducer results and the
> note that selftests were not run would also be lost.
>
> Documentation/process/generated-content.rst says:
>
>   if a tool was used to find a problem addressed by a change, that should
>   be noted in the changelog.
>
> Could the tool attribution, and maybe the testing note, move above the
> Signed-off-by block?

Yes, v2 will have the discovery and testing statements in the fat changelog=
.

>
> > diff --git a/net/core/datagram.c b/net/core/datagram.c
> > index 489d92fe6dae8..8c418c3adf1c9 100644
> > --- a/net/core/datagram.c
> > +++ b/net/core/datagram.c
> > @@ -659,7 +659,6 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb=
,
> >
> >               skb->data_len +=3D copied;
> >               skb->len +=3D copied;
> > -             skb->truesize +=3D PAGE_ALIGN(copied + start);
> >
> >               head =3D compound_head(pages[n]);
> >               order =3D compound_order(head);
> > @@ -680,6 +679,11 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *sk=
b,
> >
> >                               if (head =3D=3D skb_frag_page(last) &&
> >                                   start =3D=3D skb_frag_off(last) + skb=
_frag_size(last)) {
> > +                                     /* Only account the pages this fr=
ag
> > +                                      * did not already cover.
> > +                                      */
> > +                                     skb->truesize +=3D PAGE_ALIGN(sta=
rt + size) -
> > +                                                      PAGE_ALIGN(start=
);
> > +                                     skb_frag_size_add(last, size);
>
> [Severity: High]
> This seems to assume that this skb's truesize already pays for every page
> the last frag covers. Is that always true?

It is not, this is a real issue.

I reproduced the MSG_SPLICE_PAGES case on a kernel with v1 applied,
without privileges, over loopback:

- send() of one byte, so that the receive queue holds one skb
- TCP_CORK, send() of one byte
- sendfile() of the first half of a memfd page
- sendmsg(MSG_ZEROCOPY) of the second half of the same page,
  from a shared mapping
- uncork

  sendfile      2048 bytes: sk_wmem_queued +=3D 2048
  MSG_ZEROCOPY  2048 bytes: sk_wmem_queued +=3D 0

The receiver then hits the warning you mentioned:

WARNING: net/core/skbuff.c:6655 at skb_try_coalesce+0x5ac/0x5c0
 tcp_try_coalesce+0xed/0x1b0
 tcp_queue_rcv+0x5b/0x200
 tcp_rcv_established+0xa13/0xcd0
 tcp_v4_do_rcv+0x189/0x3e0
 tcp_v4_rcv+0xcf6/0x1640

I did not try the tso_fragment() case, but I agree it looks similar.


>
> It holds for frags created earlier by zerocopy_fill_skb_from_iter()
> itself. But TCP tail skbs can end with a frag that was charged per byte,
> and the frag's geometry alone does not show which pages this skb paid
> for.
>
> tso_fragment() in net/ipv4/tcp_output.c moves exactly nlen bytes of
> truesize to the remainder skb:
>
>     buff->truesize +=3D nlen;
>     skb->truesize -=3D nlen;
>     ...
>     skb_split(skb, buff, len);
>
> skb_split() usually leaves buff with a last frag that ends mid-page.
> skb_zerocopy_clone() gives buff the same uarg, and msg_zerocopy_realloc()
> reuses that uarg for contiguous sends. buff then becomes
> tcp_write_queue_tail(), and tcp_sendmsg_locked() appends the next
> MSG_ZEROCOPY chunk to it via skb_zerocopy_iter_stream().
>
> The MSG_SPLICE_PAGES path in tcp_sendmsg_locked() is similar.
> skb_splice_from_iter() charges only the spliced bytes:
>
>     out:
>         skb_len_add(skb, spliced);
>
> Suppose a following MSG_ZEROCOPY sendmsg continues in the same page. It
> matches the merge condition with a mid-page start, and the chunk ends
> inside the page. PAGE_ALIGN(start + size) - PAGE_ALIGN(start) is then 0,
> while skb->len grows by up to PAGE_SIZE - 1.
>
> For example:
>
>   - a zerocopy send of 2048 bytes from page P is charged 4096
>   - tso_fragment() splits at 1000 bytes, and buff gets frag [P, 1000, 104=
8]
>     with truesize 1048
>   - a zerocopy send of bytes 2048..4095 of P merges into that frag and is
>     charged PAGE_ALIGN(4096) - PAGE_ALIGN(2048) =3D 0
>   - buff now holds 3096 bytes of frag data against 1048 bytes of truesize
>
> Before this patch, the same send was charged PAGE_ALIGN(2048 + 2048) =3D
> 4096, so frag truesize never dropped below len.
>
> This under-charges sk_wmem_queued and sk_forward_alloc. Over loopback,
> can it also hit the WARN in skb_try_coalesce()?
>
> skb_orphan_frags_rx()->skb_copy_ubufs() copies the payload into new
> kernel pages without touching truesize. tcp_add_backlog() or
> tcp_try_coalesce() then reach:
>
> net/core/skbuff.c:skb_try_coalesce() {
>     ...
>         delta =3D from->truesize - SKB_TRUESIZE(skb_end_offset(from));
>     ...
>         if (WARN_ON_ONCE(delta < 0 || delta < len))
>                 return false;
>     ...
> }
>
> The receiver's rmem accounting would also under-count the pages that
> skb_copy_ubufs() allocated.
>
> This looks reachable without privileges. One way is SO_ZEROCOPY on a TCP
> socket with MSG_ZEROCOPY sends of a contiguous buffer in sizes that are
> not page multiples, while cwnd or rwnd forces tso_fragment() on the tail
> skb. Another is splice or sendfile of part of a page, followed by a
> MSG_ZEROCOPY send of the rest of that page.
>
> Would it help to charge at least the merged bytes here, for example the
> larger of the page delta and size?

Yes. In this loop a chunk never crosses a page boundary, so the page
delta is PAGE_SIZE if the chunk starts a page, and 0 otherwise.
v2 will use:

        skb->truesize +=3D offset_in_page(start) ? size : PAGE_SIZE;

With this, the sequence above adds 2048 bytes for each half and the
warning is gone. The 1024 one-byte iovecs case adds 5119 bytes
(instead of 4 MB before the patch, and 4096 with v1).

Thanks.

pw-bot: cr

> Another option is to track which pages
> this skb has actually charged.
>
> >                                       /* We combined this page, we need=
 to release
> >                                        * a reference. Since compound pa=
ges refcount
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261119101538.3229466-1-edumazet%40kernel.org
