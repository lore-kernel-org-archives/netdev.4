Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295665;
	b=V4KT2jy5D5kz44QffFo2JApvH8zbrdaevA89i43z8+qM8rNRmsFPamMyYGslUWZimB0O
	 8CQM//DtBiFS2zx0JCJx962zySprR8bT5Occm3R362iYXv+07adMW1m68Ip48WdGq8eZk
	 K1YzTpkwtur7YVTal2Z6cL4j4NiM7QxkaNwDW6zcENM0aiV6hvTjiYJglzJb+50j5QNQi
	 3aa2tCcqEkUtDooKNtNM/fW6Ihtoxo89S16uE0tNEzCRjVRQQQMMUeO1S9BKxiXN4Reit
	 twrnhBUPfxcj+vHndEKUcRUkJvJP1ut9qr3weGZe1PVBW9c9xfyRYhx9owwOoLjw0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ed8oxsSDzN5rqkrgHlXU5EuiHWlUsNR3iigXKB29wfQ=;
	b=n7ZkjL3kwj/45ckFkyEcgA6Gu6otbJl4f3Ty3hVOKbRw102Xm8ohi7vWIvIJivgInDS9
	 /0Nu1szQgo1mubjvhuob/40Zicu2/kFIVl8ot9WXsNyEY+fvLdYX59piWVEOI7eB3iG7w
	 HM/P8uq/6rcbiJ96JU6LzMBYybuZUpedMT2+NPn5FUrjD1R3lg50qpXhG7ngDyRcSf5dS
	 DvTqCzgEEq5/VEc7YUriLR0UzxjoyC2X6MNrUTNDbPs7Z0KnSACvWHx2Rfy7gboq/CF68
	 WEyiiq97vh/sfDYc1GkWRYJX71Ht4EaA2AnUZNxOhgfYWdYNaleblD2JgUtA1FOYMuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lqlX8VdO;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FB1606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FB1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lqlX8VdO
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a160d24so15291966b.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295663; x=1795900463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ed8oxsSDzN5rqkrgHlXU5EuiHWlUsNR3iigXKB29wfQ=;
        b=lqlX8VdOrUp3zsk8oWYswsKiMbmiseFgJ8uH9a25sUYf0I2UEN/N+oGluUtqV+jZ8v
         2wfFl3FhgeBFP9tJH35qQE0ysN+eb0YLlXZlcaIVVpWC7cpayLNnlBQ0ob/VkbW60CrR
         W0Id1BPh/fnpr+NPh3KcqxHKfKXAYzXHWVLylNoCra0MEW0LcJtDd46l1r8JMRgMpMt/
         481AR2LANhl/qNgc4m1JVzeJ4lkAIChDetUKhsgb26pnj1BPaVGnBYwixmgMaS7kWYoq
         xY5woKSQzPaFaDqpcTEazolA/QWpYCSCwnq//TgNQvPCZcZg4iRZvCdSsVErbMGPVJfv
         V1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295663; x=1795900463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ed8oxsSDzN5rqkrgHlXU5EuiHWlUsNR3iigXKB29wfQ=;
        b=k8h25x/tyY/fe6PUUfzg72BG17HI78d543yGVfi2QPo4yS9dkoYNJPft1Rk/NP01zC
         0X/Vg4Y0ShJZRoo3ID2onJoZ9TYZGhP3UANzBTUS/gCZji87snWYuiFBtA421+uCLyYF
         D8RnJVev2si4H3hWAtDGLI3Tc8llZGg8sPMEqzDFG6v/qzauqF2E3FBOeNuKugNqdKGY
         5NlT2PL7cIA6GTjsouxFQf+0l0fG++xF1Ds8cL13wtFs2x7J5l69PYCzQfRZ/cHrKc2a
         OBxnC8KWxZlvy7gyhDCf/bdGPBkEWpI0w+7hkcRwPhZsIYeXvzG9F/HKkMbXYlsdVNC6
         BDhQ==
X-Gm-Message-State: APuU4Z8xO0asrxfmnR6D371VilWvlDq2kw9BwUYcbKZcG00Cp9d2KM96
	q9iMb9hMTYfFbu00TpEasAR7JMQRB6vsdMUG2w+fQWXXsT4FFTX0IVJ265lf9LjvNkHkEk6D/ai
	JzAfWFlxE
X-Gm-Gg: AZFdTZeXdIwaxl/+ovo0YBulJvfosPRHU3V0LCt4bs6LBNIyyDi1ELLuQWwU8ILtdKH
	RujECLxwpVqOOme2S+vMRuh5K+BpbJRqas8XBl/yrnPzR9lKSahT9oltIvDFvl6aBjDVkQzPua/
	z/rn9RDx6L7xJ1jkqa4mHVC/QKnQeDCxTJsQ7lCPhIFdbXwPBPr7iHz4tXtGekgLFLjer3cFGbC
	pVbNq7mFiSjsJd6OYdWY+jzRkDJfvjBreCYzGS9/fpmKJKIYV0Ck5SzpfWgdkLHbIgBLsgDbdUs
	DqahqwrwAk8AU+rbuWy8c1VFkV5KLUM+UEsOlFgDYd3BDc8K/7zn5tWH+Y18TTfThVgbMZtIjPI
	Na2MLzd1ywxDwtCHabviQcoXpcjmBI4RTTLfJi1BGnYh3CuUvyd/b1ZO5opCQQUo46WU+9ULY/Z
	QOdGZjH1qerrZj6F7meiKLAG3Rd/faC7mvZas9Te+Lf2RWAVnsNlIiGLzgWkChtuj91buHJyXJw
	IssPOSiWA1eu/P/eC3YRZ9d6C/NGqpaRhkaSy8vi7cUaqhqP3+T5T1/b6Rt3expMis2BWbFIesu
	rS8GvOdW9QB5greqYnX4Z3n55ieDnXCSweUgBh2D9E50C/i/GSfFSTYJYlgUBqzb4vnPp2uySjV
	1pMbD4/HfTgrT+mW81AdgAJijO52+SS1Jpl+Rkxu0vHJ1lgT/Q3AOjJ1ie3T/2uNSVNuFkq6ZTr
	7i7iREnWOllz5X8q1sBbS+VoW2C455y6bXiiQcfz3tUAKjx5QosxZnqgGHVrpEJg55dHelu0rIU
	D7gkx25/lHJUwsRSZidvYD0l4tdsu+HNOKJ6ztm5YcJmsfE790QTzXx1sRuvULIoKtOM+ZkfoBG
	hnB1eOf7M7AW
X-Received: by 2002:a17:906:130b:b0:c50:93b6:52fa with SMTP id a640c23a62f3a-c513a47e38bmr435535066b.2.1795295663493;
        Sat, 21 Nov 2026 13:14:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:22 -0800 (PST)
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
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	nbd@nbd.name,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com
Subject: [PATCH net v6 0/5] ipmr: forward GSO multicast packets
Date: Sat, 21 Nov 2026 22:14:17 +0100
Message-ID: <cover.1795295554.git.julius@bairaktaris.de>
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
segmentation. Checking the segment length instead of skb->len relies on
skb_gso_transport_seglen(), which reads the inner transport header:
fraglist GRO does not set it for the inner flow of a tunnel, and the
encapsulated UDP case counts the inner UDP header 8 bytes short. A
fraglist packet in a tunnel that computes its outer checksum in software
leaves skb_segment_list() with a wrong outer checksum.

Patch 1 sets the inner transport header of encapsulated fraglist
packets.
Patch 2 segments fraglist packets with a software tunnel checksum by
skb_segment().
Patch 3 counts the inner UDP header of encapsulated UDP GSO packets.
Patch 4 sets up IPXIP4 GSO state, outer IP IDs and length in ip_encap(),
and completes a pending checksum of an encapsulated packet before it.
Patch 5 lets DF GSO packets pass when their segments fit the MTU.

v5 patch 1 was applied as abccf171fa8e ("net: make room for the tunnel
header in skb_segment_list()").

Tested in QEMU (KVM), 3 runs with this series on net (acd205ab5c6d);
comparisons on net ran on d5b89d55a322, 3 commits before it, which do
not touch these paths, unless noted:
- VXLAN with an inner UDP or TCP flow over IPv4 or IPv6, outer UDP
  checksum zero or set, fraglist GRO on the router, forwarded unicast
  and by an MFC entry over a 1400-byte route, 1000 packets per case: net
  delivers 4 to 398 per case (4 runs of 16 cases); with this series all
  1000 arrive with valid outer and inner checksums, also with checksum
  offload on the egress, where skb_segment_list() still segments them,
  and packets with a 1404-byte outer header are refused.
- An IPIP aggregate built by GRO, routed to a tunnel vif: all 1000
  datagrams arrive on net, carried in IPIP packets with 125 to 154
  distinct outer IDs (3 runs); with this series every IPIP packet has its
  own ID.
- A TCP flow from a local VXLAN device (outer UDP checksum) behind veth,
  so the aggregates the router builds are CHECKSUM_PARTIAL, forwarded
  with and without checksum offload on the egress: on net (acd205ab5c6d)
  156 to 1057 segments per 4 MB transfer leave with a wrong outer
  checksum (2 runs of 3 transfers); with this series none, and every
  byte arrives.
- IPIP and VXLAN tunnels that end on the router, rx-gro-list on, inner
  UDP and TCP forwarded: aggregated as on net (fraglist for TCP), every
  payload byte delivered.
- An encapsulated non-GSO packet with a pending checksum, forwarded and
  sent locally to a tunnel vif: net hands the IPIP packet to the device
  as CHECKSUM_PARTIAL (2 runs); with this series the checksum is
  complete. With spliced payload, completing it moves the head; on a
  KASAN kernel no report follows (3 runs).
- An MFC entry to a plain and a tunnel vif, 4000 datagrams per arm,
  UDP_SEGMENT, fraglist GRO and UDP GRO forwarding, DF set and clear,
  software and device segmentation: 4000 of 4000 on the plain vif and
  4000 IPIP packets with unique outer IDs, or the 100 GSO packets whole,
  on the tunnel vif, all 12 arms.
- A GRE GSO packet multicast-routed to a tunnel vif is dropped before
  the vif counts it; with fraglist GRO routed into VXLAN and IPIP, every
  segment reaches the peer.

Changes in v6:
- Patch 1 (new): set the inner transport header in the fraglist
  completion of TCP and UDP, IPv4 and IPv6 (Sashiko on v5 patch 2).
- Patch 2 (new): segment a fraglist packet with skb_segment() when a GRE
  or UDP tunnel computes its outer checksum in software, because the
  egress does not offload it or the packet is still CHECKSUM_PARTIAL,
  which skb_segment_list() leaves wrong; found while testing patch 1
  with an outer checksum.
- Patch 4: drop only encapsulated GSO packets without SKB_GSO_IPXIP4, as
  IPIP and SIT aggregates segment correctly (Sashiko on v5 patch 3);
  complete the pending checksum of an encapsulated non-GSO packet before
  ip_encap() (Sashiko on v5 patch 3); state why GRE and UDP tunnel
  aggregates are dropped and what a device segmenting IPXIP4 gets.
  Simon's Reviewed-by is dropped, as the code changed.
- Rebase onto net.
- v5: https://lore.kernel.org/netdev/cover.1794151759.git.julius@bairaktaris.de/

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
- Patch 1: name the VXLAN case, where a member has no headroom for the
  tunnel header (Sashiko).
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


Julius Bairaktaris (5):
  net: gro: set the inner transport header of encapsulated fraglist
    packets
  net: gso: segment fraglist packets with a software tunnel checksum
  net: gso: count the inner UDP header of encapsulated UDP GSO packets
  ipmr: set up GSO state for tunnel vifs
  ipmr: do not drop GSO packets that fit the MTU after segmentation

 include/net/gso.h        | 24 ++++++++++++++++++++++++
 net/core/gso.c           |  2 ++
 net/ipv4/gre_offload.c   |  2 +-
 net/ipv4/ipmr.c          | 34 +++++++++++++++++++++++++++++++---
 net/ipv4/tcp_offload.c   |  6 +++++-
 net/ipv4/udp_offload.c   |  6 +++++-
 net/ipv6/tcpv6_offload.c |  6 +++++-
 net/ipv6/udp_offload.c   |  3 +++
 8 files changed, 76 insertions(+), 7 deletions(-)


base-commit: acd205ab5c6d762c7ab8f8413a5122e6f6fa2a59
-- 
2.53.0

