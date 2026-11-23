Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475722;
	b=yDTsEecMMBSbXMkiH58/JQzLzgfdBXfEYS4wHSAVA+/3ZC4CdxlcMVhXxh1kOlHKeBDo
	 yewvDUvjSmK7ugZYw3LeZV29fHU2fDfqukhK+EYggupNniPM3/EsaGhSG0V6JndwIqrwe
	 LF0icKvYrfuoWZx0lnByFujAvXa/Yd2cWSzzNadUUBZfNZeOSHRxJFqYZ1G17FT0Bp7rO
	 QZM+mSkZzs91yKMvt80L0meIImAqB20c2LaRliJriY8RipQqaM18hZeOcHV1rk27LBz0D
	 9/lm0PNe7rAgbB1QADKu2LZLWtwczmJjxnmvTulFSOAYF90/vFW0S04V2BD0S3HKxiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yLBdnVh8xwsXQonOiCKJHP1ANYw6wkSutl8/BrhO7dY=;
	b=CxMUG8DSgHCS1FhFvRwe0k5M24W7AClAkQlLAuNQvZmkz16RG0xxPs7rjjEPORLLTKO1
	 WkwfDfPiEI42dv5dlHJtEmaAI8IVOT1ql/ik5E1QxlfoWgqWnmwzQBdj1GHcaCAA1XDAt
	 RQHO81DXH5yQJ+VSvRwddYSnZADYAFnObO5uM4ZKsgH0EKsfYAU8Q0hngEGTPbJtN7jXm
	 pmOfTzJUFyYq6rId2VbG/FsVZg30ovip3AfJUUb5Ap46warcbW2lrnRTMQwb3RXR2+uaZ
	 LdbpaowfFGM2cTJMgH9y6lhv95+RhIbUT5YYlw+zEIdrDgjitxfGCYDqT7s7cKjTy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ra2UnGi0;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC054606A337
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC054606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ra2UnGi0
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38431138772so4965467eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475721; x=1796080521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLBdnVh8xwsXQonOiCKJHP1ANYw6wkSutl8/BrhO7dY=;
        b=Ra2UnGi0ij9gulCmXyGwRzEVlkwp8AK/N8UJYPA20T8Ml1jaNGA+2SDEJV5QWSsj92
         oZqlYTy0seldjCrdxd24kOcuwMyfn/I5BerhTPwjAUumEKR7mbDLi3pUPJO+igLcMA61
         gYHAa5LNfUGwUu9TCzWhoP4lRbyszuggZzxAB6DmCV++C2CT2McgftbmAXkNdu+a5BE5
         +T8RrONQ9ID71jdoI8Nv3nkSULowUt6Yk7krBy23pYXqtQFtUlN/1E6sDDDGvZpO45M2
         W2uWpUvHtSwzKqXmH5Bq1vOgj382IZcnakrbZm/3R7y1vanC2RFK27YSPQaHI7/MTuU8
         0Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475721; x=1796080521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLBdnVh8xwsXQonOiCKJHP1ANYw6wkSutl8/BrhO7dY=;
        b=hXamsjvwJdNoA4zQVmXnC9A3IegkZEk4mOG95+AsJMv8zjFjsVjpBs6W3rH1zDItcv
         7+QkgC4+54yVsaiOcDEsHXqUqmnDJj2HP7mBylxZU7b/hUFQmD5SloNDB4xCm7Ik+ykq
         Smqnsmls3oYXYJCCi0mXl/QX70QYIrYpvK03Rv1KPmV5QkcBwRrhOUc41xgmuf2EJD6L
         X6F+G/pEaTnys8NT7lUCW2aV4ZOVN7erLYqlZrivmsISfMh2aSeubs+bwcqqDsgE5tbv
         bQtFNU+uOp5nWNuSWrL4Q9FC2+k2c+3n9Qy+1ULuw5MToGCWOZgZidk6LqipzB6gXnm4
         y+rQ==
X-Forwarded-Encrypted: i=1; AL+hErE6+U30v+kfU9kyi9xdWzWhiRJ4PDKvPnoMJH+z0pbwubHssNcNSR3knDvEd3TS5xJyCL/sVk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jc0+0zK/vFQPYnY9r/HMeLPfbSEJgwt3XyzvSWShSLYF3VnB8
	QqWQ9253YUmGSbigVqiRWGWTVt8EEVv9zlW41lcFOzaTcMWfOH/Sqe1F
X-Gm-Gg: AZFdTZf475B08KJ9Q4yRXTYdpFMQLT3KRGFpH0GPNXtOwWv9+ZdHFW3wyL94W0po7g5
	9VSeZYqxe+YRlItdiPqBygUke6tU5zwNN97DyBRbtpA9+Qg+eNYOc7ItXDS59EABRkNvoVCsBq5
	cWZJKV9j9F7O7qJNlRj4iwkgy2Rja4PDgp6ptJI7a6tfCtCncA6e3s1kvuKPQRg7aoV1cBRmGrk
	IyZIjuePwprplx34FGKyEziyZc4xoMnxOmrilUXG+LbhLtvMwHu+hZW59XYsxBvxd6y+5B5EaXs
	Gf55TzzwxcaDDIJ89Ye1CLcnyuO1EB0MUuRBID0nhyBrZpbl207NgQiJ9++3Jys+nKZgfPvB8Br
	q/PGIdYFeNny3/5oAJ+jVMQ0J5RVbu5UiZo8uKUWcAN0zGlnd+nqhba3IYA5fGHPDkS0Wdp2ZRL
	1ekoNu3F68tvKyd3BOiwfrgio+lVcAyY3pnqdmOFNLMRV9niy9ptqt1d64bMXsMIzCZJP2aAjRi
	1FMTBO1/Ll3lY5VlK1RXxFWKXm27GvNVZLuoo2VjkIt4L6seCGibXw6lPcLRcuCoFSWE9UYIGnW
	Z4ixME+jj4DW6QsTlYk+oMrfb5V5VpV+QvNTZ3viW/Ti47SInC3nH9b0O2Xx0QFjJxOTT5sfnv8
	ebXO0A3rS9Lu3dnlzBTCS4UF3K0F9DBE=
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr15176431eec.2.1795475720681;
        Mon, 23 Nov 2026 15:15:20 -0800 (PST)
Received: from v4bel ([211.209.222.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41447416eec.6.2026.11.23.15.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:15:20 -0800 (PST)
Date: Tue, 24 Nov 2026 08:15:15 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, richardbgobert@gmail.com, willemb@google.com,
	kuniyu@google.com, netdev@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH net v2] net: gro: avoid truncating transport header
 offsets
Message-ID: <awTJAyw57pj7LFfq@v4bel>
References: <avcJ_0-OqgDlD5GB@v4bel>
 <179492223500.3136.9448543337352524214@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179492223500.3136.9448543337352524214@kernel.org>

On Tue, Nov 17, 2026 at 01:30:35PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 1 � Medium: 0 � Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] ipv6: gro: u16 off truncation in ipv6_gro_receive() inflates
>   data_offset
> - [Low] The commit message says the reproducer is already blocked by a
>   GRO extension-header limit.
> 
> --
> 
> net: gro: avoid truncating transport header offsets
> 
> This patch replaces skb_set_transport_header() with
> skb_set_transport_header_careful() in ipv6_gro_receive() and
> inet_gro_receive(). If the GRO transport offset does not fit in the
> 16-bit skb->transport_header, the skb is not held as a new GRO head and
> goes through the normal receive path instead.
> 
> > The IP6_MAX_EXT_HDRS_CNT limit in ipv6_gro_pull_exthdrs() prevents this
> > reproducer. However, nested encapsulations can each add an extension
> > header chain, so the accumulated offset can still exceed the range of
> > skb->transport_header. inet_gro_receive() can also be reached with such
> > an offset.
> 
> [Severity: Low]
> Is this paragraph accurate for the tree this patch applies to? Here,
> ipv6_gro_pull_exthdrs() in net/ipv6/ip6_offload.c is still an unbounded
> loop with no header counter:
> 
> net/ipv6/ip6_offload.c:ipv6_gro_pull_exthdrs() {
> 	for (;;) {
> 		int len;
> 
> 		ops = rcu_dereference(inet6_offloads[proto]);
> 
> 		if (unlikely(!ops))
> 			break;
> 
> 		if (!(ops->flags & INET6_PROTO_GSO_EXTHDR))
> 			break;
>     ...
> }
> 
> IP6_MAX_EXT_HDRS_CNT is not referenced anywhere in ip6_offload.c.
> 
> The limit appears to come from Eric's prerequisite patch. That patch is
> only mentioned in the v2 notes below the --- line, and git am drops those
> notes. The permanent log would then describe a cap that is not in this
> tree, and nothing would point to the patch that adds it. In this tree,
> this change is the only thing that stops the KASAN reproducer.
> 
> Could the prerequisite be referenced in the changelog itself, for example
> with a Link: tag? Or could the sentence be reworded?
> 
> The nested encapsulation argument could also be more specific. With a
> 12-header cap, one GRO pass handles at most two L3 layers through
> encap_mark. That comes to about 2 x 12 x 2048 bytes, roughly 49 KB, plus
> a small amount of driver headroom. That total is still below 64 KB.
> 
> Which path still exceeds the range? One candidate is a second GRO pass
> through gro_cells after decapsulation, where the pulled outer headers
> become headroom. Could the changelog name the concrete path?
> 
> Also, skb_set_transport_header_careful() was added by commit f12c2de4f542
> ("batman-adv: reject unrepresentable multicast TVLV offsets"). This patch
> carries Fixes: 4b0ebbca3e16 and Cc: stable, so stable trees would need
> f12c2de4f542 as well. Should that dependency be noted in the changelog?
> 
> [ ... ]
> 
> > diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
> > --- a/net/ipv6/ip6_offload.c
> > +++ b/net/ipv6/ip6_offload.c
> > @@ -249,7 +249,8 @@ INDIRECT_CALLABLE_SCOPE struct sk_buff *ipv6_gro_receive(struct list_head *head,
> >  		skb_gro_pull(skb, sizeof(*iph));
> >  	}
> >  
> > -	skb_set_transport_header(skb, skb_gro_offset(skb));
> > +	if (!skb_set_transport_header_careful(skb, skb_gro_offset(skb)))
> > +		goto out;
> >  
> >  	NAPI_GRO_CB(skb)->proto = proto;
> >  
> 
> [Severity: High]
> Can this early exit turn a truncated inner offset into a heap
> overflow?
> 
> Suppose outer layers advance skb_gro_offset() to just below the
> limit, so the outer transport offset still passes the new careful
> check. A tunnel and L2 callback such as gre_gro_receive() followed by
> eth_gro_receive() can then pull a few more bytes without any U16_MAX
> check. The inner ipv6_gro_receive() is entered with off above 65535.

This concern seems plausible, but I could not find a path where
skb_gro_offset() exceeds 65535 in the current upstream tree with
v2 applied. The two capped IPv6 header chains in this path stay
below 50KB, and skb headroom is not part of skb_gro_offset().

I will not send a v3.

> It stores off into the u16 network_offsets[] slot before anything
> validates it, so the slot holds off - 65536.
> 
> If the inner nexthdr is an extension header, ipv6_gro_pull_exthdrs()
> then does:
> 
> net/ipv6/ip6_offload.c:ipv6_gro_pull_exthdrs() {
>     ...
> 	skb_gro_pull(skb, off - skb_gro_receive_network_offset(skb));
>     ...
> }
> 
> Subtracting the truncated value advances data_offset by an extra
> 65536. On a linear skb the extension headers were read through
> frag0, so frag0_len is still set.
> 
> Before this patch, tcp6_gro_receive() or udp6_gro_receive() called
> skb_gro_header() with the inflated offset. That went through
> skb_gro_header_slow(), which invalidated frag0. With this change the
> careful check fails first. We jump to out with data_offset far past
> skb_headlen() and frag0_len still non-zero.
> 
> dev_gro_receive() then takes the normal path and calls
> gro_try_pull_from_frag0(). grow is roughly 64KB and frag0_len is
> non-zero, so gro_pull_from_frag0() copies that many bytes to
> skb_tail_pointer(skb), past skb->end. That overwrites
> skb_shared_info and the memory after the head buffer.
> 
> A single linear skb slightly over 64KB is enough to reach this.
> virtio_net, veth, tun/tap and loopback can all deliver one. That
> includes devices an unprivileged user sets up in a user and network
> namespace.
> 
> Could the representability check move to the top of
> ipv6_gro_receive(), before off is stored in network_offsets[] and
> before ipv6_gro_pull_exthdrs() runs? Making ipv6_gro_pull_exthdrs()
> pull relative to skb_gro_offset() would avoid the inflation, but the
> truncated network_offsets[] entry would still be wrong for any later
> user. inet_gro_receive() stores a truncated network_offsets[] entry
> the same way, although it does not inflate data_offset.
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/avcJ_0-OqgDlD5GB%40v4bel
