Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680826;
	b=z0aOtCNcvUXTzZawjtcdtcjwXCLvJAUJ7j14g5uzn46MXLsH5/iTgsiM3S2Rqxwor2YO
	 hlsiwxHUZzh2cJRkM29CPsFTF5F5umbGBKOhI035T2xHN7r/gbGC02y98KsP0sOgFxNnT
	 7ZG4nMjNvLBmkkUMmnmw6W3D8FG8460+Tio4LSYxyRURNtx2dnmPUUANPmewzZTooutYD
	 5pHcCcRWiKxf/UnivWERGY35ajuvy0+CuSXfB6XUgio5QjlnqRiQgadWlJifdOvyVITPJ
	 S62Z+wnkdek8AbKk3bS9wbzs13tDW/5bAfC6o8Zrv7W5pg0GMnZS7O4z5/I9eDV5+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
	b=zyYmWTklLqRrfs9mJLjxqH4i7nV0updHjkHRkj/tCEAw3EJ/DIcVIjIIvidwXssrqIAF
	 3tYrS1wTWVCHwUdCcNKvwXo9n3CexMmylQ3SvlFc7OhCoffRA5zpk9OP50GMvIiDTntlQ
	 pKQxks7BZhcapf2ZKNnfyK7tYkkA0BnWfXVYVu6SK4rVvkR5WCzJVKXcgojwAz1wg86yQ
	 DGC+JYXEGHv/VngQo5JropxyCs+4dGZw4vFb5w7L8PzN85baPaF8rLRwuvxjQ9x/32ARe
	 bYDnKYFtBgdK0xL+y5wNR5vJFJQyUwwFfV6vdCGa0G7I81BvZ21oJJYohgdST0igz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l3mB9oUI;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD62606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l3mB9oUI
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5067a2411bso345169166b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680823; x=1795285623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
        b=l3mB9oUILZHE6tkdqLPs81uCa6bdvGmSXBTqB2Pikc1OS7+C1/fAJXMDFTn6arK9Lv
         spy+nfN1AhrboVwjgUMupVdks2BLCqS2GiSfSUGfVicvabVYACFA0TG2U0wrrJlMFCbN
         4F31prggAqolL4nBbNeZzQszwz72/RgM+D7VFFzrz+9Srqje0XJOZLQF71SA+6zBl4Wh
         6M7DAL/tTh6oSgwvDYKcd4jNP9fYorFP5VlAHh2KHNMABitp6w+oEBpEOgHB2Y3Yu0d7
         87RachCnz/RSv6GhX/gQQyFBxMi0wEI1+naKy+fBmJuBdYvsb87cNqlxX+nN4ZGbkHL8
         ZNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680823; x=1795285623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
        b=vchxUx2UyvHqKo49BK8/Yyig280gB6fqaE+YFUvrEBwc8Y4M4pS7CDzaUJyQRYiL++
         883Jk4oGY3G39/adq8KPdZZVsmmJIAkI3FfvtHlSaQf1dpZ5QmkbOSzBoaOPug7uudsX
         Xc3wk3aGtmCTp2jwXaReUzhulRZAuiyusogsbxbVefR58RD7e2RUrSBvcP9gf9W4qfCN
         FOPjkwzVFQ1KE//O3dZLM1QpZq1KX/E9z6VJWxPxo+6xyiuyy0qq17SKD9ydlXqyF1iQ
         Vx2PStUZLTHJ5cDxyO7j6fam7aWc40u9ykpUsZmxv14JdvKKPrij+t8IxjmNEtIziral
         kfqg==
X-Gm-Message-State: APuU4Z+GfQNgMgJXvesavMYsSbF072yGblOvY4cK8IFB+2AubDAif/4d
	MfA579Rcfput+Vrtn1Q21KsNyBKO7USSpgh6UPpYm+OiLKicqyriYjj3tiLL0RpsyPo1PvHUnAZ
	Dy6FiNUTS
X-Gm-Gg: AYBFou2nbMBQfobVr9saT7fmTNF87NZmpzhaei7wlo+9BMbC2a8uLL9dz/XX6Ww1KF6
	tR7lcp1DAMzxvJ0M1auwWCI1iDKPRW0osKl+OYAz4hm+03MslPjPT7aUKYx62sKYI5BZq6vlOIW
	6YqHa3OViFvjL4S9yQFSfO5ZKbjp2bRV9qz6N0NPwOvu3O0Ae4GSxXl0poWdrkdbkJ11oASTf7B
	gSA93Gy/c5Xg84KbK79lcXt2RAzqQp0gUnf77MZJ2k+B0gMqnG9EnFKYLS0DyQJqq11BtpXB782
	mL8Lx6qp1om+7GS2GeUHzCdF95+sYg/EdXcfA7f3cGEEURlLWer1aAOchtWqwMCnMQGKoAeIAko
	NpZo+9ldPhnPprHZzGpMfXjA2FqAxq3oYh99AmagC/k+uvuMEOJvLvjqVxRfcuSa/QUJOL5RXhS
	e9FEc0BuGOwCWY29e23Xsi+q42cvPhwW+Gwy4A4HAzLu1CjkbYQQ0w2135AKXC8zMI4r+hmZ6SO
	UpeYdKTNZdM9DOiKzfcSxhlVmmQTn1BwSWAilehIvFgbv/b9blUGYC3x05fWw53Y9+PJI1RB7OK
	BBxcVVzqT0BVW5gQdwg403GY6+Nyw2QH/WolOBPTS/c6yo7NSBj64FAiRbWUh8kVhXZrWGu9JhI
	UDZSVukRYpevepkpVert79zUXGguCFOhfQOJEfq+hicuc+jO4+SyM1/zx3769lsPL5KSlq59/jD
	1lnaXc+OnMIGu7i9J+SjBxVc/+Ey+iSczP0byLGnjnuI/iuvR5TXUMuO5CuqenRMlCpnxL2Fz3m
	PC9eZQ29V/CCK9f0EXr7SS7Q9pBlYAID3ODoo9+KvACyFSP3N6hdcXQfSvIuD5kFluPOKefbHfu
	DUs=
X-Received: by 2002:a17:906:c141:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c50964372bcmr518656166b.27.1794680822619;
        Sat, 14 Nov 2026 10:27:02 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 0/4] ipmr: forward GSO multicast packets
Date: Sat, 14 Nov 2026 19:26:56 +0100
Message-ID: <cover.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With fraglist GRO or UDP GRO forwarding on, a routed IPv4 multicast
stream arrives as GSO packets. ipmr_prepare_xmit() drops every DF
aggregate larger than the MTU, and ip_encap() sets no tunnel GSO state,
so a GSO packet sent to a VIFF_TUNNEL vif is dropped during
segmentation. With that state set, a fraglist aggregate reaches
skb_segment_list() with tunnel headers, which can write before the head
of a frag_list member; this also happens today when such a packet is
routed into a tunnel device. Checking the segment length instead of
skb->len relies on skb_gso_transport_seglen(), which counts the inner
UDP header of an encapsulated UDP GSO packet 8 bytes short.

Patch 1 makes room for the tunnel headers in skb_segment_list().
Patch 2 counts the inner UDP header of encapsulated UDP GSO packets.
Patch 3 sets up IPXIP4 GSO state, outer IP IDs and length in ip_encap().
Patch 4 lets DF GSO packets pass when their segments fit the MTU.

Tested in QEMU (KVM, KASAN and lockdep) on veth, 3 runs each on net
(30c71476d842) and with this series: an MFC entry to a plain vif and a
tunnel vif, 40 x 1316-byte datagrams per GSO packet, 4000 datagrams per
arm, UDP_SEGMENT, fraglist GRO and UDP GRO forwarding, DF set and clear,
software and device segmentation on egress:
- net: every DF aggregate dropped on both vifs (FragFails 2 per
  aggregate), and with software segmentation nothing arrives over the
  tunnel vif; fraglist GRO routed into VXLAN reports a KASAN
  slab-out-of-bounds write in skb_segment_list(), then panics.
- this series, all 12 arms: 4000 of 4000 datagrams on the plain vif,
  FragFails 0; on the tunnel vif 4000 of 4000 IPIP packets with unique
  outer IDs with software segmentation, and the 100 GSO packets of 52688
  bytes whole with device segmentation.
- VXLAN with DF, 1404-byte outer segments, route MTU 1400: net forwards
  all 1000 segments at 1404 bytes through ip_forward(); with this series
  none leave, through ip_forward() or the MFC entry, and FragFails
  counts them.
- a GRE GSO packet (skb->encapsulation set) multicast-routed to both
  vifs, 50 packets: all 1000 segments on the plain vif; none on the
  tunnel vif, whose pkt_out stays at 0 (v4 counted 50).
- fraglist GRO routed into VXLAN and IPIP with software segmentation:
  every segment reaches the peer, no KASAN report.

Changes in v5:
- Patch 3: drop an already encapsulated GSO packet in
  ipmr_prepare_xmit() before the route lookup, so the vif does not count
  it, and call iptunnel_handle_offloads() without error handling, since
  skb_cow() leaves no header to unclone (Eric Dumazet, Sashiko). Simon's
  Reviewed-by stays, as this is the change Eric asked for.
- Outer tot_len 0 (Eric): 50 x 1310-byte datagrams merged by UDP GRO
  forwarding make a 65528-byte packet, so the outer header gets tot_len
  0 from iph_set_totlen(); before, htons() truncated it to 12. In 3 runs
  nft ip forward chains still match it with meta l4proto 4 and
  ip protocol 4 (100 of 100), while a netdev egress chain on the output
  device does not match meta l4proto 4 (0 of 100), as
  nft_set_pktinfo_ipv4_validate() takes the length from iph_totlen().
  All 5000 segments reach the peer, with software and device
  segmentation.
- skb_gso_transport_seglen() also leaves out the inner SCTP header of
  an encapsulated SCTP GSO packet (Sashiko on patch 2). That predates
  this series, and multicast routing does not see such packets:
  sctp_v4_addr_valid() and sctp_v4_available() reject multicast
  addresses.
- Rebase onto net.
- v4: https://lore.kernel.org/netdev/cover.1792838740.git.julius@bairaktaris.de/

Changes in v4:
- Add patch 2 (Sashiko).
- Patch 3: drop GSO packets that are already encapsulated, and set the
  outer length with iph_set_totlen() (Sashiko).
- Drop v3 patch 2 (TCP fixed-ID flag on encapsulation): multicast
  routing does not carry TCP, and the flag also needs the decap and
  GRE/UDP segmentation paths, which go to a separate series (Sashiko).
- Rebase onto net.
- v3: https://lore.kernel.org/netdev/cover.1792293419.git.julius@bairaktaris.de/

Changes in v3:
- Patch 1: name the VXLAN out-of-bounds write (Sashiko).
- Add patch 2 (Sashiko).
- Patch 3: reserve one outer IP ID per segment (Sashiko).
- v2: https://lore.kernel.org/netdev/20261011162957.1328474-1-julius@bairaktaris.de/

Changes in v2:
- Add patches 1 and 3; v1 let DF GSO packets reach ip_encap() on tunnel
  vifs, where they were dropped during segmentation (Sashiko).
- Keep the additive MTU comparison and check mtu > encap before
  subtracting, so a route MTU below 20 cannot wrap (Sashiko).
- v1: https://lore.kernel.org/netdev/20261010131842.2157365-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (4):
  net: make room for the tunnel header in skb_segment_list()
  net: gso: count the inner UDP header of encapsulated UDP GSO packets
  ipmr: set up GSO state for tunnel vifs
  ipmr: do not drop GSO packets that fit the MTU after segmentation

 net/core/gso.c    |  2 ++
 net/core/skbuff.c |  4 ++++
 net/ipv4/ipmr.c   | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0

