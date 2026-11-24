Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481753;
	b=TDhAP/K9NqqQN8e8w1227o7ViYc6LL6bOP21oitvTxcTBa1UDSVvvkQo4C+CBX0A/zwh
	 Zp5TfEtMl1XUoTHbkIOu8kf8Uq6V2b09MzP1wVGLmedffGmMJCJ5GYbyg6L/n/iNRppa6
	 aeuX7UE81ddbsuhiw7Vb7XCv4cGE1MEAMuZPTGs0G9+oArLli8iNxZwMfULgfJV46pMu0
	 duBXllfHplh61NHT6iI7qtYPGdLJaX23aoZvZKTcaLOC5yQKu56Atz9Nmo3CjzP0An32a
	 XvlBtb6j6+LOtC2axp+6pqGknRW0/kQJ0MOasF2+uuxDqKy6oFtGy29LkcIECxp0Jig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G9FzbT/zJBdbcTMwuCKv/u2XIeFkphN379eodz2mpIw=;
	b=OVnpj/P6Ls6ph39EhNJ7Xr17FNFfWgQTUljNwRtwyr2Q/tGZ+/O8v/C2whFy7bTkLpiI
	 AXYj8fiOcQ4F7nQSFrvi2uzicNlsXrpaWESMqE6n9zn+pXj7piUiTUVAJSXiKz4T/msH9
	 QVW0VzZuVzMtQFLQyVip2e+tXW8tjt2qLJiWofbIDqqhyE67mZP7ui16ulNvwe0MaWOLz
	 AgTH49XqFU2Y3SbsS8hupkN1nkQodVdf5TeucneKeH9FLbNd7fk3kdUGysnCqN8xQ/A/D
	 y7eNqM4DYDPuUKPLZ8vHcDtrJy6+u6L3hAdFUrVf4AfEcBcnjELs7Oo1tbRA+0y+Khg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHKdUv7V;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E2606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHKdUv7V
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94958650b09so395720785a.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795481751; x=1796086551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G9FzbT/zJBdbcTMwuCKv/u2XIeFkphN379eodz2mpIw=;
        b=WHKdUv7VI2ka8Hv6xmfPtJrAyFhu1sa+j6HxyLbkAHBmiFpGQ4zjvZoi2zhH+kt2PR
         SGzMa0ckh2n5RY7b72rWzY+qlJQwUlEpRwCPO8Go+yKELj6uiDfJnDxg1LRNtsKMRPCO
         ePWyqC/Ma2UUlruQULuiCRbULB1BoqKLDa+eUolmBqJ7U9YXtGF6rWCutehEF3cnXr3+
         ZooGkM6uxtEefYsMuDAEg73hknyG+cBeAvBgiYsPp823Kbltm6gxEOMRd2OtELuoOYx8
         3lyb31YHsme47hBEwh9sE7BOfb8R16BmRbUNbAwXNmtLVXgmMGIKjAvyZX6amQJDuVa1
         TYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481751; x=1796086551;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9FzbT/zJBdbcTMwuCKv/u2XIeFkphN379eodz2mpIw=;
        b=wrrbr7oR8LUZAIbNVN2Bk0r66tSUnN1jI88AQlwSpQdkam1MGB+0XfENNzEjly8Eya
         vR+J2aWVYfQtWNMHOmA4FuGVedSPRwNIb/66taeRT4oz3AhKON5a6mOruea3JzVp6+4D
         9DOeEW4cPdX/LHYi/5hy6Gw5UemEs4rJD4HiyxPEParGk8pndlr6+k499ssz7PhbO1Dx
         AcM3/fBOzr2ThmqS5lXFgy+eCgWaiiV4cmh3XWbhxpvNd/XLTqUAe7Fvq5NMO14vT1gl
         4T8GsV9sq79i2DNVH3dU1UXDqG6t+rRQtlMDFo7mEf3hNAnY8p7rBxAyplFpd/U04xpa
         r1uA==
X-Gm-Message-State: APuU4Z/RUNgxatJt16AHXYJY0NWuccTFF0NVTnuGWK8aQ8IKPTr8Bb6O
	hUMsgsqnKWt9ILYcuYicmADIeT06x5/7UpAcGA/VVSkhjwEvNSwPmA1E
X-Gm-Gg: AZFdTZfj1BmXxo2Gw7HM4fpYzobFOO1wE5TTRDuY6nsyJIN6bvSJc8GGy6xzWqBlIha
	h1FQB09FBzmrxWmyNo5lbU5dGKq80h821v6VqgrNIYTzoWRpRh0Rc3NA18Zh3LsFU+fvoJkZhGC
	uQO3cjLFgMp3J4Fn+7fQY6i6T7WvL9zyvuwykweMmdHoSIrlynlwF57p2zTnXJU8ufZNoIO97H4
	K1qjtktfPCYMy1jrcClSjfYqfyc/XdCSz7G4v3zN3IGatPtv3vgwRdqb7DjvXir3lM4wTWMnotC
	eQCIZ2OTS0HKpsXNFJWNBYo505Rr33xX5XaEK8551Z31Cg79RGMx1hSca1Z0i4+PeLxnsHb4tkd
	0Ekuua82hiv/SL9e36YexF02z5nyRO9K0qPx28cfFrnOW/B8O/mVn0uEBsu/VODhcfoCP4rxboy
	Qu82wk0aem0C3FrEKNrI2j0+DrkNt+eQEwtz9WebyLfbOLZSDL+ITdOdQ4mY2sC/9l3IH4ZhWUN
	5HiKUoUBiye3Fo8aBoypozn5HqHBB3EYDO6Z6rQvtgYFn0uGV22hkD0dQ+4rrQ0Tcja7SC4GpJn
	SapUypj4Mlca5kCrk4IKfs7cnZX3M3qcb7tLACCDHjBdmQE7YqjcqPnbUYy91dcixHlqR4vX7s8
	GvSdo8iKmkYUAG77XC05JeCtomfPzWLxtsKeuPY+sJQCL1Ss6WuyarZIIl2T5DsQ=
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr2301367185a.6.1795481751033;
        Mon, 23 Nov 2026 16:55:51 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40efc4sm921340685a.36.2026.11.23.16.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:55:50 -0800 (PST)
Date: Mon, 23 Nov 2026 19:55:50 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Julius Bairaktaris <julius@bairaktaris.de>, 
 willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, 
 davem@davemloft.net, 
 kuba@kernel.org, 
 edumazet@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemb@google.com, 
 stable@vger.kernel.org, 
 hassansultan@google.com
Message-ID: <willemdebruijn.kernel.609ac1383a60@gmail.com>
In-Reply-To: <20261122164204.4058652-1-julius@bairaktaris.de>
References: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
 <20261120044733.222627-3-willemdebruijn.kernel@gmail.com>
 <20261122164204.4058652-1-julius@bairaktaris.de>
Subject: Re: [PATCH net v2 2/2] net: gso: fall back to skb_segment when
 fraglist cannot satisfy checksum
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Julius Bairaktaris wrote:
> Willem de Bruijn wrote:
> > 1. Outer tunnel checksums. __skb_udp_tunnel_segment() and
> >    gre_gso_segment() compute these with gso_make_checksum(), which
> >    reads stale SKB_GSO_CB() state, and needs an inner payload sum tha=
t
> >    skb_segment_list() does not compute.
> =

> Patch 2/5 of my "ipmr: forward GSO multicast packets" v6 changes the
> same three conditions for this case. With this series on net, the case
> from 2/5 (TCP from a local udpcsum VXLAN device, CHECKSUM_PARTIAL
> aggregates, forwarded with rx-gro-list on) leaves no wrong outer
> checksum, 3 of 3 cases in 2 runs, so 2/5 is not needed on top of it.
> The other four patches apply unchanged on top of this series.
> =

> https://lore.kernel.org/netdev/cover.1795295554.git.julius@bairaktaris.=
de/

Good catch.

> > +	/* Tunnel headers and outer checksums are not rebuilt */
> > +	if (skb->encapsulation || skb_tnl_header_len(skb))
> > +		return false;
> =

> 1/5 is still needed: the fraglist branches of
> tcp4/tcp6/udp4/udp6_gro_complete() leave inner_transport_header unset
> for qdisc_pkt_len_segs_init() and skb_gso_transport_seglen(). VXLAN
> forwarded with rx-gro-list on, 20 cases of 1000 packets, 2 runs: 34 to
> 241 reach the receiver with this series, and with 1/5 and 3/5-5/5 on
> top every packet the router received, with valid checksums.
> =

> Is v7 without 2/5, based on net once this series is applied, how you
> want the two combined?

How about splitting into two series.

One that is not ipmr specific: patches 1 and 3. That is ready to be
merged I expect without major comments.

A few comments to Patch 4:

    > @@ -1948,6 +1952,15 @@ static int ipmr_prepare_xmit(struct net *net=
, struct mr_table *mrt,
    >      if (vif->flags & VIFF_TUNNEL) {
    > +        /* An encapsulated packet carries the inner headers of its=

    > +         * own tunnel. Only IPXIP4 GSO packets nest: their IP head=
ers
    > +         * are segmented by protocol field, while GRE and UDP tunn=
el
    > +         * segmentation read skb->inner_protocol, which ip_encap()=

    > +         * sets for its own header.
    > +         */
    > +        if (skb_is_gso(skb) && skb->encapsulation &&
    > +            !(skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP4))
    > +            return -1;

    [severity: high, confidence: high]
    Checking only !(gso_type & SKB_GSO_IPXIP4) lets compound tunnels with=

    SKB_GSO_IPXIP4 set slip through: FOU/GUE over IPIP/SIT (both from GRO=
 via
    udp_gro_complete() -> {ipip,sit}_gro_complete() and local ipip/sit de=
vices
    with encap fou/gue) carry SKB_GSO_UDP_TUNNEL[_CSUM] | SKB_GSO_IPXIP4 =
(and
    esp4_offload.c can combine SKB_GSO_ESP | SKB_GSO_IPXIP4). ip_encap() =
then
    unconditionally overwrites skb->inner_protocol_type and skb->inner_ip=
proto
    to IPPROTO_IPIP, so skb_udp_tunnel_segment() dispatches SIT-over-FOU/=
GUE to
    ipip_gso_segment() on an IPv6 header, dropping/corrupting it after vi=
f stats
    already counted it.

  The hidden assumption is that SKB_GSO_IPXIP4 is mutually exclusive with=
 SKB_GSO_UDP_TUNNEL[_CSUM]. It isn't: FOU and GUE wrap IP-in-IP /
  SIT inside UDP, so a single skb carries both SKB_GSO_UDP_TUNNEL[_CSUM] =
and SKB_GSO_IPXIP4 in skb_shinfo(skb)->gso_type.

  The check tests the wrong sense of the bitmask: it asks "is IPXIP4 pres=
ent?" rather than "are any non-IPXIP4 tunnel bits present?"

  Admittedly double encap is a bit niche. But something a fuzzer will fin=
d. I'd lower the severity to medium though.

    [severity: high, confidence: high]
    Even for pure SKB_GSO_IPXIP4 (IPIP/SIT without FOU/GUE), pushing a th=
ird IP
    header without segmenting first breaks the invariant enforced by real=
 ipip
    devices (IPIP_FEATURES omits NETIF_F_GSO_ENCAP_ALL and hw_enc_feature=
s is 0,
    so validate_xmit_skb() segments any encapsulated GSO skb before ipip_=
tunnel_xmit()).
    NICs advertising full NETIF_F_GSO_IPXIP4 offload (i40e, ice, iavf, io=
nic)
    take the 3-header skb directly and only update skb_network_header() a=
nd
    skb_inner_network_header(), leaving the middle IPv4 header with the f=
ull
    aggregate tot_len and static id on every segment (and patch 5 widens =
this
    from DF=3D0 to DF=3D1 traffic). GSO_PARTIAL NICs (mlx5, bnxt, ixgbe, =
igb, igc)
    also replicate the middle header with a fixed id even when DF is clea=
r.
    Either drop all skb_is_gso(skb) && skb->encapsulation here (as in v5)=
 or
    segment already-encapsulated GSO skbs before ip_encap().


  struct sk_buff only has two sets of header pointers: outer (network_hea=
der, transport_header) and inner (inner_network_header,
  inner_transport_header). Every hardware TSO driver and NIC descriptor f=
ormat is built around that 2-layer model.
  Normal ipip tunnel devices enforce this automatically. ipip_tunnel_setu=
p:403-422 advertises NETIF_F_GSO_SOFTWARE (which excludes
  NETIF_F_GSO_ENCAP_ALL) and leaves dev->hw_enc_features =3D 0. When an a=
lready-encapsulated GSO skb (skb->encapsulation =3D=3D 1) is transmitted
  to tunl0, __netif_skb_features:3998-3999 masks features with dev->hw_en=
c_features (0), so validate_xmit_skb() segments it first before
  ipip_tunnel_xmit() pushes the second IP header.
  VIFF_TUNNEL bypasses dev_queue_xmit() on dvmrp%d and calls ip_encap() d=
irectly inside ipmr_prepare_xmit(), so nothing segments an incoming
  IPIP/SIT GSO skb before ip_encap() wraps it in another IPv4 header.

  The root tension is that v6 added && !(gso_type & SKB_GSO_IPXIP4) solel=
y to appease a review comment on v5 about preserving pre-existing
  DF=3D0 software-GSO IPIP/SIT behavior, but doing so violates the kernel=
's 2-layer GSO invariant and creates both Issue #1 and Issue #2.
  =

  There are two clean ways out:
  =

  1. Minimal net fix (revert to v5): if (skb_is_gso(skb) && skb->encapsul=
ation) return -1; =E2=80=94 drops all already-encapsulated GSO skbs on
  VIFF_TUNNEL in one line, avoids illegal 3-IP-header GSO skbs completely=
, and eliminates both Issue #1 and Issue #2.
  2. Full fix (matching ipip netdev semantics): Segment already-encapsula=
ted GSO skbs (skb_gso_segment(skb, 0) / software GSO) before calling
  ip_encap() in ipmr_queue_{fwd,output}_xmit() =E2=80=94 then all encapsu=
lated GSO traffic (IPIP, SIT, GRE, VXLAN, FOU/GUE) works over VIFF_TUNNEL=
 on
  both software and hardware TSO NICs, with zero drops and zero 3-header =
skbs (though slightly more invasive for net).

    > @@ -1982,6 +1995,17 @@ static int ipmr_prepare_xmit(struct net *net=
, struct mr_table *mrt,
    > +    if ((vif->flags & VIFF_TUNNEL) && skb->encapsulation &&
    > +        !skb_is_gso(skb) && skb->ip_summed =3D=3D CHECKSUM_PARTIAL=
 &&
    > +        skb_checksum_help(skb)) {
    > +        ip_rt_put(rt);
    > +        return -1;
    > +    }
  =

    [severity: medium, confidence: high]
    A unicast SCTP packet inside VXLAN/GRE/IPIP with a multicast outer
    destination can reach here with skb->encapsulation && CHECKSUM_PARTIA=
L &&
    skb->csum_not_inet (unlike unencapsulated multicast SCTP). skb_checks=
um_help()
    writes a 16-bit 1's-complement checksum over the first 2 bytes of the=
 4-byte
    SCTP CRC32c field. Use skb_csum_hwoffload_help(skb, 0) instead, match=
ing
    validate_xmit_skb() on an ipip device.
