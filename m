Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052410;
	b=EDoFyI0otpqSFhCZiSEAbTsmJivRCuWa7QBmcwCyhG8IxvOr7+On9y4Ubwnh45yoSmXS
	 NEGdFA97TngBhu6iEKdnIIJFQwjxyboYfDepVwXMJXYUg5rkijEaCfXejFuv6vDbIbyIA
	 asioAwdcczXSsdapx8Ct8Yi9SOzcF55AjvlFOJg97DjbWVmkdBW3n6vwgOQaCKIkCoV/J
	 r9QtpOoWyBLnUuyTO/lfd4KjzD6B89wb/FtxN6pbm6R4VyG+QGVbl/hKTSe4t6rXhnWDl
	 7u3/vaM7lhIt5GxA/CKjBCoG2+ZnA0/vkbRpBej+MJelN2L08Zsuh85RxjlZ3rDHBXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ModaUdQuDc5OEhvTUxfYZcAFMZUWXkGC1LbpFLoUZic=;
	b=Mcnr5Pi4lmjOVQXD2Z5dHyJXp4YYzfL+BRU1IIrKGz0eBHMeN6WdqUdvZKz6ZK7//JhA
	 /+NH7sjm/5n0f55YEvROOG9hLODcPqwueyfL/rGrNTMSd3zzfYvkwlhJqmTbASHmFOZOO
	 Mc2s1NObt0/47eu9gxuq7S6mF0nrN+stoIMsURefLFFC9ay7gsbRKv53i95rUd9k0k3QO
	 hGpdJaRfJZQL/mns1n9zlChL0J1Tcvwspx/3PnKG2riuGu+UoDmC9ZntLbNKx4BOCUsv8
	 LZd69SgUDXUpPGdlxiJDtAFVf6Hh6g/w2fXyjEQPKpjLZTj1AnscOm4Dsukwof7GMYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OID3aPfs;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC482606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC482606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OID3aPfs
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so2851785c88.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052409; x=1795657209; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ModaUdQuDc5OEhvTUxfYZcAFMZUWXkGC1LbpFLoUZic=;
        b=OID3aPfsHzVnCot0shZHSIXsPtaWdYt3ENbqlkncVJcaYBYEMztm9e/N3GKUXbim6r
         UnL7/kvY9IV2LGOJTutMa8SBZ2FnSiUWutls53Kuqec8gGOCQ3T4PGGgCWyFsV1FN4vd
         fkl8Ntk3fI/Q7XuVVmBvXKpODYWBbKpPcEkTs+QddJeGi8MUDdll0JfTpQ+5uEVJOLiH
         KMS/XX4+AAWSBMLN9A5jcqoyLolmbspulSXBKWF3Q75BjrOR2eWNKvzEfpSt7pOQMPTZ
         +e4RYwLStL0wXY5YUB5cGIM4OJfKYrEKWLiLIXG8A64QncBh14ykrBNBcGNLKPriYb9g
         lDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052409; x=1795657209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ModaUdQuDc5OEhvTUxfYZcAFMZUWXkGC1LbpFLoUZic=;
        b=gWAoNvKfpWsFgn4HREMokkDrt3AnZ77/EAz0alloq5PlhQdIT6mhDD7+2vgCavqhyB
         nnt9k9le7pUojiiAHxJNh0F8hlGxAekydkhGCS01ich9DtmmFfnV+jAy0ELexIZSb8of
         r45WOuqkM+kOSytio3bWbeCMa9bGhFWI0nXc/STLKcm/nrDRUcnlNynZ6BiNnRnYhf1/
         2R3fsYe0hVGFaoXXs2PPe1wFA4LBt6BLNhOpd1kjnX/H52V5EecvCvlocXaL6B2diQAK
         /WhMT22pLmzQyYmtRwI3mZPQjlFanqBdl/i3fA543bICcrZkcoMsyOaydvI2MkIY4cVL
         vlyg==
X-Forwarded-Encrypted: i=1; AL+hErHIWozkG/PJpE/SAbcKRqjFaa0tnHeN7jvIDPOXRg0288fcsLOgfOJVpBulZfWrhFt+ijr9rt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QL3ogZ2aHyp6xfAZrrnaC1/KBX3gG8QdEB1PnWakZf+FViPa8
	dpirNKc4/slZdcxnwE9/pzSbm8MdGFhj6mLchddGgiLZ0pCOUeC7YkobxaOguHHNvCg=
X-Gm-Gg: AYBFou30fMYOXgREW54SFvaOzmVgxQetkWTBf4HBCwkktMyImfOD5/aFLV+PkblrjmS
	1nM42m8iAjWQ9pOnDHR4jaysuYFHy8NnwT01xLV1l4A4xbZjbxigNisTN9Xs/9ampICK5pC0urs
	Vd85+nUIpoDX+DFodcDrUN7kVCPNzQUFGiZT+hnxlmq0CTJRIXM6koVbWHM4xVrkL3Xo0mUAmFo
	D+WDGAF0Ambr+YFa34fut1W8S/JSyUXbGo00TTS6JOjYksSG5mNqyfe+rNeoZN4hAMkI3YwJeCT
	hSE6u9jvrxmgceaVgqcXhlKkY4FBAhGgdHjD5BLm0+g1/1YvFVNjff8EcSQTMmQ4wzjBNrbCYmd
	t3e7BV7dwIxXgW+JKSlX9o85yrW1PB5TC71G1Cv6o0D5Z8rPCvW9yj0E8gnTAJW4QUlsO+ov3vV
	4binv/VOyN5qb+AQqhnFj3ccl/WH2/a4X93JGFZb5Bgjf/0JYRXfOQ0kXzAzvzczz3lzPqMUems
	wSpt1U6O/niNSlB41GvpXXGOG50S5SaTWIqhqoGq29CE8k3RPDNuGCGJz2gPrfJYmp2Jw28KISW
	GaXIdaA41ia6
X-Received: by 2002:a05:7022:f516:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b543beb6edmr4091138c88.13.1795052408841;
        Wed, 18 Nov 2026 17:40:08 -0800 (PST)
Received: from 20HS2G4 ([2a09:bac6:67e1:1187::1bf:d2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm10029543c88.2.2026.11.18.17.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:40:08 -0800 (PST)
Date: Wed, 18 Nov 2026 19:40:01 -0600
From: Chris Arges <carges@cloudflare.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	june@cloudflare.com, danjones@cloudflare.com, jbrandeburg@cloudflare.com, 
	josef@toxicpanda.com, mason@kernel.org, kernel-team@cloudflare.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] net: prevent receive header offset overflow during
 decapsulation
Message-ID: <av5RgJZR2HKzAN2D@20HS2G4>
References: <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
 <179502356763.3136.15330216541876894208@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179502356763.3136.15330216541876894208@kernel.org>

On 2026-11-18 17:39:27, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new SKB_MAX_RX_HEADROOM (32 KiB) checks run in only three
>   places: when __netif_receive_skb_core() is entered…
> 
> --
> 
> net: prevent receive header offset overflow during decapsulation
> 
> This patch limits receive headroom to 32 KiB (SKB_MAX_RX_HEADROOM). The
> goal is to keep the 16-bit skb header offsets from being truncated after
> repeated decapsulation. The check runs on entry to
> __netif_receive_skb_core() and at the resubmit points of
> ip_protocol_deliver_rcu() and ip6_protocol_deliver_rcu(), and drops
> packets with the new SKB_RX_HEADROOM drop reason.
> 
> [ ... ]
> 
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 3c58db732761a..6140fd9d11cd0 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -6223,6 +6223,10 @@ static int __netif_receive_skb_core(struct sk_buff **pskb, bool pfmemalloc,
> >  	trace_netif_receive_skb(skb);
> >  
> >  	orig_dev = skb->dev;
> > +	if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
> > +		drop_reason = SKB_DROP_REASON_SKB_RX_HEADROOM;
> > +		goto drop;
> > +	}
> 
> [Severity: High]
> 
> This check runs once, when __netif_receive_skb_core() is entered. That is
> before the another_round label, sch_handle_ingress(), vlan_do_receive()
> and the rx_handler call.
> 
> Can headers stripped later in the same receive pass still push the 16-bit
> header offsets past U16_MAX?
> 
> For example, tc act_mpls with TCA_MPLS_ACT_POP calls skb_mpls_pop() once
> per action. Each call stores the current headroom into the u16 header
> fields:
> 
> net/core/skbuff.c:skb_mpls_pop() {
>     ...
> 	__skb_pull(skb, MPLS_HLEN);
> 	skb_reset_mac_header(skb);
> 	skb_set_network_header(skb, mac_len);
>     ...
> }
> 
> Outside CONFIG_DEBUG_NET, the only guard in those helpers is
> DEBUG_NET_WARN_ON_ONCE(), so the value gets truncated silently.
> 
> The number of pops per pass doesn't look bounded:
> 
>   - a filter can hold up to 32 actions
>   - a filter whose action control is continue returns a negative result,
>     and __tcf_classify() moves on to the next tcf_proto without counting
>     it toward max_reclassify_loop (that limit only covers the
>     TC_ACT_RECLASSIFY / TC_ACT_GOTO_CHAIN reset path)
>   - about 512 matchall or flower filters with 32 pops each comes to
>     roughly 16K pops in one pass
> 
> veth_setup() sets dev->max_mtu = ETH_MAX_MTU. A frame of about 65.5 KB
> carrying about 16K MPLS labels, sent with AF_PACKET on one veth end, would
> reach __netif_receive_skb_core() on the peer with about 30 bytes of
> headroom and pass this check.
> 
> tc ingress could then pop the labels while skb_ensure_writable() keeps
> pulling data from the frags into the linear head. At some point
> mac_header and network_header would wrap past U16_MAX.
> 
> After the wrap, the remaining skb_mpls_pop() calls would run memmove(),
> skb_postpull_rcsum() and skb_mod_eth_type() at the truncated offsets.
> ip_rcv_core() would then read ip_hdr() from stale bytes and set
> transport_header from that position. L4 code could then misparse the
> packet, for example in tcp_data_queue():
> 
> 	__skb_pull(skb, tcp_hdr(skb)->doff * 4);
> 
> Here doff comes from the wrong bytes, so could this wrap skb->len or hit
> the BUG() in __skb_pull()?
> 
> This setup needs only CAP_NET_ADMIN and CAP_NET_RAW in a netns owned by a
> user namespace.
> 
> Similar in-pass header strips look possible elsewhere:
> 
>   - openvswitch pop_mpls with recirculation, where
>     ovs_dp_process_packet() runs again without re-entering
>     __netif_receive_skb_core()
>   - bpf_skb_adjust_room() shrinking, which adds len directly to
>     mac_header and network_header
>

These additional paths can be addressed in a follow-up patchset. I'd
prefer to fix the currently known cases first.

> The commit message says:
> 
>     Together, these checks
>     prevent 16-bit header-offset truncation in cases of repeated
>     decapsulation.
> 
> Is that still accurate given these paths?
> 
> Would it be more robust to bound the offset where it is stored, either in
> the skb_set_*_header() / skb_reset_*_header() helpers or in the pop/shrink
> helpers, instead of only at the chosen re-entry points?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994%40cloudflare.com

If the checks were moved to where the offset is stored (using something like
skb_set_transport_header_careful()), then we could introduce potential
performance issues.

--chris
