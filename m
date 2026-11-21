Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295668;
	b=Z+KAbPMxKdDXQtvbjSoPAppBEbaV7CKAqaW8JW7u3gw+YwB8o2o5FZtHrOObVOXTp+dM
	 Uy1YCLblaOf+Iia0CnZcRLVcRD4y50CbBKQ+zeJhaKBPCFNZ0kxxKNgBp0LBjSCyVQxs0
	 1Og//TuneMoA2NtrYHauwgpFK1ugFWT8/RK2RTXgyuHu1ND9Kbyh1uyA+BuJorje5n7oo
	 YMV1rDberylliQH2ZPDZX9jKK9dmBH143p/lu2atXINmJYPx1W0Bmfw7Uju42aSwW2gas
	 iLBGyZIxrocst22KiP4D1TRiU6t8pFv+yZZGAsyTVKQWm60SmvnzeeewNn60Xe2sOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OQaBB11/fPHyGD1ZYjYYD9/Lmp2ha/R3INOHqIgnSEw=;
	b=zKgLZoowJhOMzF61c2C4ANoE/347ktWWJ8zJk8IRvcEl3qHLhOTjG1R3YAh4SFbjszzE
	 QrgKtBmS2DglOHul/LSO/68ehbJskbgyG0HNWoEijQ43FKn+yisfN2XU2BZnMd4LtNn0H
	 SEsfGzSZhzLcoi0U0LTr7jUQbsQ2zrdwuyfcq+CQMkkfF1X35+sG9/YreMjBZaE2UbE7Q
	 Brtjg1u9Janh0KFW14owM0JPzKiOaWYRifcwDaPQKxU69QViT/HyahDH8K1O3UmYSMRNs
	 AY0NoDy9mEjf0H/A9T71lhNiUPjZPSDi0wzMkx/6E1qOQCgprPWQlCPxR6i4sh4tRNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xE9LMvqX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9BD606A682
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9BD606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xE9LMvqX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c516a194350so14881166b.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295667; x=1795900467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQaBB11/fPHyGD1ZYjYYD9/Lmp2ha/R3INOHqIgnSEw=;
        b=xE9LMvqXXcqkzvOjj4TjsEQVtnfz2UUYkw8KQUxVgSCKCtL1nbndmmJCbyQwnJ2DwT
         KMvzE7s9AuxcAWQu7W2k78cFn+dJD/O2JeyQ9yp63MJG6DUM2nXzRlIyVpjy0uqn+4FH
         gRcPO0ZIatRiH5zIcB3zSnqyika39Zwf46ZWJIHR4W5JJmx7GGT6mQjgEqY7PYo4haBf
         izHwS2apoVZzX43hTSHVrlzheRIF9jp2Gya+rChrNobiBvIq3IAJl4MJGjCnDwTnm5SS
         pfILV3X8Q8746ocyK7rOu0KNpiWdBwyb6Y3pIZkF2RwYtEDS7VRH7HdL3qHw1xZEuDVM
         XgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295667; x=1795900467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQaBB11/fPHyGD1ZYjYYD9/Lmp2ha/R3INOHqIgnSEw=;
        b=uPZNbD6vX766xEGDWdd3nWXhSerr9fqL5Kg9hfpTfYGDIJue23GDWIz6XB6HFhZ0Gz
         5OxDVFQEjc1iNn3mcs6OErW6kwRrRurKM4RifpUly7tsNVAiWjCxnafncOWRPvRbbNos
         T/I7FS4+rvTBLkbWgK0pbGdQKB4wPBG55Q4yUxTNCtF83iRu46fZYjr/iR+byn3VLgLM
         lW4+EQ81BgMCpoj3mvifkqm4FVKJsa/6WLFK/mLzYrdOAE0VfukzuaXMb51aXf4vwyVv
         O29//TWPrQwMl4oS7EmRzlL4mI+yMnnb+SjjVYP/V6Lxni6pqOTLhszzrJzA5nyTuo9t
         CbEw==
X-Gm-Message-State: APuU4Z/a1CWuLowYRJ1gsTHNgsX52XMhZ20nNdGo/sFhHDi8GgQJDXNL
	qoPitarnzQz5xbDOOPH8JeycmlczuuXf646Ux05BoJpmTbVqe6scoVLBGdGShvek6OVppQBvRBk
	e4waxLyXU
X-Gm-Gg: AZFdTZfDIhF/YxkfVl0365+f5j1c/2UiRdy424c64dpAJUuQ+KQGdaCIkgnO3X8hFhN
	O7fGwQpMdZIDOaDzS+TJovobaVjY+UgT8Eo+t6G+nlGgOaXbhUMvnc3cb4VodjcINuo/Gt7Zig5
	fBPEADxEpHTScyESfGbC+rCeDccfUVqsVfSDqPBFYW2mgHh3//ybZY14NdzYeeV/Ft3dhXxyPAe
	bfkN+DkHJP/BS0S8/a0WK1fQL768Ttj6H5rSXFciq9YWGHZkh/jidxYjIcA5Ugs0g2d3bbErkKG
	g+eOJjkWTHqC4ZjTG/ZBXaafSWRRKMSWsDIYgwhSqEbMoCCIQsSXgzmbkJrCPfkWaC7XYff3s/0
	xmSH0jXnRo81wwSuMAAiBYHrvp8//aMvdKoBAgf0VQbTJwb/4vhKBsOrnGOsxSgD28/Sz4gdzLh
	pPxDhvI3p9fWGWkwGbMGFG17lGgUhirrToaLJjPwDTgfJjbqnKnF1JbzbTX3Zgv4ciDwGLxjhAN
	gb7gJU1s17S4RLkJ4L4bPytgUN4nV/jc+z24s+tGeTMMv42YhGBRsgF3orwQemP+scMHitmtcXU
	UqqaekaJXFvz+U2f+f8zPJPZJrJmrOnwPEKlozcC8fkJuQ1Xk1SXM727Urj/IJzpiKAECKbuV8X
	GtsBXJhWU7dYcXIZL/A5VyM5d/b6Bvt2LfRc1iNaIG0QfVx4KlkbAO6FXBoisYDoHAU1AVGZLAk
	W4BVrAtVg4EDwWl4M7lkNZ0HR4v4x557TnKzyvIT6i8uM3x2pccY192p1EiXN6cmBZXD7EGFDsg
	r7ObJE//6Tt2L/bfk+Y3o0se+vwS1ATW2JtlRQ1Kq8LnwF+PDD8q/+Ew/bz2io92LdOEzYgPY2f
	oXiheGb3Khka
X-Received: by 2002:a17:907:a890:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c513ab12652mr681539666b.49.1795295666845;
        Sat, 21 Nov 2026 13:14:26 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:26 -0800 (PST)
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
Subject: [PATCH net v6 2/5] net: gso: segment fraglist packets with a software tunnel checksum
Date: Sat, 21 Nov 2026 22:14:19 +0100
Message-ID: <c512956bc8cc74688721e3d5a52016ee85966484.1795295554.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795295554.git.julius@bairaktaris.de>
References: <cover.1795295554.git.julius@bairaktaris.de>
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

skb_segment_list() turns the frag_list members of a fraglist packet into
segments and copies the headers of the head in front of each, but sets
no SKB_GSO_CB() checksum state for them. In a UDP tunnel or GRE with
checksum (SKB_GSO_UDP_TUNNEL_CSUM, SKB_GSO_GRE_CSUM),
__skb_udp_tunnel_segment() and gre_gso_segment() compute the outer
checksum of a segment with gso_make_checksum(), which reads exactly that
state, when the egress device does not offload it and for every segment
that is still CHECKSUM_PARTIAL, as they then set skb->encapsulation.
The segments of skb_segment_list() have the ip_summed of the head, so in
both cases their outer checksum is wrong.

Both tunnel segmenters set skb->encap_hdr_csum before they segment the
inner packet. Set it only in those two cases, with one helper for both,
as its description says ("software checksum is needed"), and segment a
fraglist packet with skb_segment() when it is set, as
tcp4_gso_segment(), tcp6_gso_segment() and __udp_gso_segment() already
do for fraglist packets that are DODGY or whose geometry changed. A
fraglist packet that is not CHECKSUM_PARTIAL and leaves through a device
that offloads the outer checksum, and one whose tunnel receive path
cleared the tunnel GSO bits (iptunnel_pull_offloads()), is still
segmented by skb_segment_list().

The UFO segmenters also read encap_hdr_csum. For a UFO packet in such a
tunnel that is not CHECKSUM_PARTIAL, with the outer checksum offloaded,
they now fake the inner checksum offload as they do without an outer
checksum: its segments are CHECKSUM_UNNECESSARY, so the tunnel
segmenters offload the outer checksum and do not call
gso_make_checksum().

In the setup of the previous patch, with the outer UDP checksum set and
checksum offload off on the egress port, 849 to 981 of 1000 segments
per case left with a wrong outer checksum before this change (2 runs of
4 cases) and none after it (3 runs); with checksum offload on, the
packets are still segmented by skb_segment_list() and arrive with valid
checksums (3 runs). With a TCP flow from a local VXLAN device behind
veth, so that the aggregates are CHECKSUM_PARTIAL, 132 to 1098 segments
per transfer left with a wrong outer checksum before this change, with
checksum offload on and off (2 runs), and none after it (3 runs).

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Fixes: bee88cd5bd83 ("net: add support for segmenting TCP fraglist GSO packets")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/gso.h        | 24 ++++++++++++++++++++++++
 net/ipv4/gre_offload.c   |  2 +-
 net/ipv4/tcp_offload.c   |  3 ++-
 net/ipv4/udp_offload.c   |  3 ++-
 net/ipv6/tcpv6_offload.c |  3 ++-
 5 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/net/gso.h b/include/net/gso.h
index 119fc4c170e1..1cf2bf3a2b4a 100644
--- a/include/net/gso.h
+++ b/include/net/gso.h
@@ -84,6 +84,30 @@ static inline __sum16 gso_make_checksum(struct sk_buff *skb, __wsum res)
 	return csum_fold(csum_partial(csum_start, plen, partial));
 }
 
+/* Whether a GRE or UDP tunnel segmenter computes the outer checksum of a
+ * segment with gso_make_checksum(): when it does not offload it, and for each
+ * segment that is CHECKSUM_PARTIAL, as it then sets skb->encapsulation. Every
+ * segment of skb_segment_list() has the ip_summed of the head.
+ */
+static inline bool skb_gso_tnl_csum_sw(const struct sk_buff *skb,
+				       bool need_csum, bool offload_csum)
+{
+	return need_csum &&
+	       (!offload_csum || skb->ip_summed == CHECKSUM_PARTIAL);
+}
+
+/* skb_segment_list() sets no SKB_GSO_CB() checksum state for the segments it
+ * builds, and gso_make_checksum() reads it: a fraglist packet whose tunnel
+ * computes the outer checksum that way (encap_hdr_csum) has to be segmented
+ * by skb_segment().
+ */
+static inline bool skb_gso_list_csum_ok(const struct sk_buff *skb)
+{
+	return !(skb->encap_hdr_csum &&
+		 (skb_shinfo(skb)->gso_type &
+		  (SKB_GSO_GRE_CSUM | SKB_GSO_UDP_TUNNEL_CSUM)));
+}
+
 struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
 				  netdev_features_t features, bool tx_path,
 				  unsigned int max_segs);
diff --git a/net/ipv4/gre_offload.c b/net/ipv4/gre_offload.c
index c8129782d39d..3ee1ae65f41b 100644
--- a/net/ipv4/gre_offload.c
+++ b/net/ipv4/gre_offload.c
@@ -43,7 +43,6 @@ static struct sk_buff *gre_gso_segment(struct sk_buff *skb,
 	skb->protocol = skb->inner_protocol;
 
 	need_csum = !!(skb_shinfo(skb)->gso_type & SKB_GSO_GRE_CSUM);
-	skb->encap_hdr_csum = need_csum;
 
 	features &= skb->dev->hw_enc_features;
 	if (need_csum)
@@ -53,6 +52,7 @@ static struct sk_buff *gre_gso_segment(struct sk_buff *skb,
 	/* Try to offload checksum if possible */
 	offload_csum = !!(need_csum && !need_ipsec &&
 			  (skb->dev->features & NETIF_F_HW_CSUM));
+	skb->encap_hdr_csum = skb_gso_tnl_csum_sw(skb, need_csum, offload_csum);
 
 	/* segment inner packet. */
 	segs = skb_mac_gso_segment(skb, features);
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index 27bc48a24c2b..5a9aa3c387f4 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -108,7 +108,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
 		struct tcphdr *th = tcp_hdr(skb);
 
 		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
-		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
+		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY) &&
+		    skb_gso_list_csum_ok(skb))
 			return __tcp4_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 7dc85eb333aa..fb2f63774cf6 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -214,7 +214,6 @@ static struct sk_buff *__skb_udp_tunnel_segment(struct sk_buff *skb,
 	skb->protocol = new_protocol;
 
 	need_csum = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP_TUNNEL_CSUM);
-	skb->encap_hdr_csum = need_csum;
 
 	remcsum = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TUNNEL_REMCSUM);
 	skb->remcsum_offload = remcsum;
@@ -226,6 +225,7 @@ static struct sk_buff *__skb_udp_tunnel_segment(struct sk_buff *skb,
 			  (skb->dev->features &
 			   (is_ipv6 ? (NETIF_F_HW_CSUM | NETIF_F_IPV6_CSUM) :
 				      (NETIF_F_HW_CSUM | NETIF_F_IP_CSUM))));
+	skb->encap_hdr_csum = skb_gso_tnl_csum_sw(skb, need_csum, offload_csum);
 
 	features &= skb->dev->hw_enc_features;
 	if (need_csum)
@@ -521,6 +521,7 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
 		 */
 		if ((skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size) &&
 		    !(skb_shinfo(gso_skb)->gso_type & SKB_GSO_DODGY) &&
+		    skb_gso_list_csum_ok(gso_skb) &&
 		    ip_hdr(skb_shinfo(gso_skb)->frag_list)->version == (is_ipv6 ? 6 : 4))
 			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
 
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index 5bed3f341786..8d5df64bd1c4 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -183,7 +183,8 @@ static struct sk_buff *tcp6_gso_segment(struct sk_buff *skb,
 		struct tcphdr *th = tcp_hdr(skb);
 
 		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
-		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
+		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY) &&
+		    skb_gso_list_csum_ok(skb))
 			return __tcp6_gso_segment_list(skb, features);
 
 		skb->ip_summed = CHECKSUM_NONE;
-- 
2.53.0

