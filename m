Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408059;
	b=RGqyVfXdnOXwgr/HtqZUrTKJB8YilRFvmOrWm+K9mfURa3EfvEM9fVjzchG4VJPb3KxR
	 5Ms9Cmep4NAKi7jAy8i600kM9IA4+bLrnYTUVdMkyWXU72PN+qlRhFXSfu4jUJsqJ7MQ+
	 gAsGEYvq87vJvZbJsH3iUWOX6KfSv7wIz6j2hX4jZvzGQkMdbhSQToNF6Dhj28ZXyB4ax
	 3E6YEsCRebcEH8phwUrEM0YLucQU86/J7m02rHoYmNd7HeFb5kHkziB8anKh2kOUQoo+B
	 sK3/7kBIjcnwc7chMi3xrA7XooGNYXVo4bSFX5yntTGCZiiOr2+bOYxuTfHZJweNK4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=12qSEXBh1kky0UXoklLvduTD4cGZzd7bYb0VVEnUAmM=;
	b=ZBDxdyQGuinlAyzOT+hoAduzyO8ERLFNGxPSvKNbaRoxZGW/e3421jORTchXHK2rM65O
	 9j/Icqw+5qRLw9OROpwo1bUZeAerICh2DVB1HJ+PkTp9tZzE+FezhzhG99wZaMb8E6ke1
	 3Um41EejRHyFJs6vHcRGiAeu3T5+uZNuEjXkXguBCRQiokDvbLXGyAXzBt7iQiyd3p+zm
	 r24i7dLiEbAdyNjgyE6oqAyaCsL34J5umdPaGR/u7GfZlfLd11veLrY5JvhUNHh3lrsw4
	 MlsyckfMRri2wddj51xHefhlruRgQ/onY7bg10aXPvRo34SqbHExWlwnDCgFe1dyTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+qfEOiA;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E6C606A320
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+qfEOiA
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f045b921caso14736485ad.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408058; x=1796012858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12qSEXBh1kky0UXoklLvduTD4cGZzd7bYb0VVEnUAmM=;
        b=t+qfEOiAJ4rEi+c1jzXPqGVycyB2mllH0/DYza5ME07Laai9LLHD8iI2dpbqmg3KtC
         SPRv6AFrgsGw/xkJa7eUCZCAvw0Yl6rmHViPW9TWYp+9rZQ0XAPc9H4ZaZbGxZoU3yqm
         3na7dACZpbqz+tGFeYmU/+rIzfwlLxFnasyLid44NI7jUdefD72nwgX3AK6Dhr+qL+F3
         1VkmYNujgQI72j+YcX6KddfHGUk1GyYlxe1B2jDdyGLiPfV4HIqXp/LOMjAiLCMojXMV
         hoNLiu+vL8Wh6QVFJjNXc+efeL6c2lbNSfl9gYSvOlfERioclZkedc73uhBFFPMpZDuf
         zCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408058; x=1796012858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12qSEXBh1kky0UXoklLvduTD4cGZzd7bYb0VVEnUAmM=;
        b=vjKtw3mH3C5KsXe9WyvB3FQ7A6JKvlteX8jqSxEnyPiFxOrfW7U3WPBoTqw55aTy8E
         Q9HdVcJoJFGj4jTvsPTiada9aVKfRd4PRHJixeAju8artiGJH5UkCOWAd64IZ+s7+Ouu
         sKbK841Ze2C9tpeyk5QfPnMx2CKMCGtMZh9V3FE24oBB1JF5aBYW+zjDCHqiKiUM3otf
         Ub59NDZ351g7ZsiOQXSjfnfxSHnpuDBb58uD1jQYpgyq9EfdWBPmp2uiJpKoywfUjBJE
         guX9UIjRDqhWAN1DTnnNGEgttvdXXYh5kbus/BUO4HWX67wm/ernMg0taXLkwuyJaRQd
         eKjQ==
X-Gm-Message-State: APuU4Z8Blw0sT6QOU+CfUuprTeRqYx3QDSuGwT+S+TbejFgnlILDJ3yv
	icMgMhQg2QTKLAJiTFuGWSQoBcbM4H+lQOpm9kEbLS187SPC64r3ihmE6yoI6A==
X-Gm-Gg: AZFdTZco3FCIPDtykFKZfInA2DwpNbxgoOuqBqFMuYOFNpTy/Q7SXQxbpBpNy5jgdYV
	XhCa48LL7rVwueBYHkpqVN4llBo3PFo/UTPw8DL46GA5QAJ3pT+eygx8QhQP94eulZGC51UaMyu
	mN4YHTXUb91aJrcYfzt+NCBpFB9eZZo2ETZmRtKmwr+5B4cpPtWKnfTldRNLWBJpYgDUsCjNWKb
	rh1+iElduBtxs4JEa14WKK0SiI5dlp5wp/mWb0maoPqspsCRKrwnpfcqMN2ytuXKqiGXoGuLwOd
	w2Uu2Uu37Xk8UvlakMLMdVjs/1gQKLfaTaWx/a1rnGCeWo9gTZEostMZuqwo+x73iipkAroeC10
	ikflpaFgXuuT1+AVifxbaOVEcd7456LNKXwGIkmIPtmpCTZZUDti3xq8EcukH/3KNL8wJUBEC7O
	TUApCePkbwrrmlfOam4QKPnasS4jRozizwKRny2va4+YCj8Cr9xCXsb/S0B09P3Yg1GecaWfkwe
	mjWXLAGRe4nESIXMZx5ymh+xkF+578t2zRp1tFRXj5ycKeyt7aS+j3sbXH5XWJ4Yqg0TS10HhiN
	Flv8YJCj1BeKtkIcgLU5JmyqAk0UTESwSlkvfaiNTSbdAt9LxjruVWUYxYZFVPeA1h//NsZOaDU
	33GxfurHwI8MZTv1kT5VXsTjjZvIvmobkwcFlYTOFsjDwtobvsCXkY6a8alMlRULXFPhozs4+J9
	iu0g==
X-Received: by 2002:a17:903:1a0e:b0:2ed:38c0:332d with SMTP id d9443c01a7336-2f03f16eabamr96982105ad.23.1795408057963;
        Sun, 22 Nov 2026 20:27:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm45584795ad.53.2026.11.22.20.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:27:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org (open list:BPF [MISC]:Keyword:(?:\b|_)bpf(?:\b|_))
Subject: [PATCH net-next] net: gro: skip the checksum of fraglist GRO packets
Date: Sun, 22 Nov 2026 20:27:35 -0800
Message-ID: <20261123042735.139550-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

TCP fraglist GRO is used for packets that are not for a local socket. It
chains the original packets instead of merging them, and the segmentation
on the way out restores them as they were, each with its own checksum.
GRO still verifies the checksum of every packet before merging it, which
on a NIC without RX checksum offload means computing it in software over
all of the payload. On a router this is the only time the payload is
read: forwarding a packet otherwise only touches its headers.

Skip the check for a fraglist skb when it would have to be done in
software and leave the merged skb CHECKSUM_NONE instead of marking it
CHECKSUM_UNNECESSARY. A corrupted packet is then forwarded unchanged and
dropped by the receiver, as it would be without GRO. NICs with RX
checksum offload keep verifying it, which costs them nothing.

The checksum in the head of such an skb does not cover the packets on
its frag_list, so a plain __skb_checksum_complete() of it would fail.
Make __skb_checksum_complete() verify each packet against its own
headers instead, and mark the skb CHECKSUM_UNNECESSARY when they all
match. This covers whatever asks for the checksum later: conntrack with
nf_conntrack_checksum enabled, and local delivery, which happens for
example when a REDIRECT rule sends a connection without a local socket
to one. Only fraglist skbs of plain TCP over IPv4 or IPv6 without
extension headers are left unverified, which is what that function can
check.

tcp_add_backlog() condenses an skb before verifying its checksum, which
can pull the packets on the frag_list into the head and leave nothing
to verify them against, dropping valid packets for a busy socket. Verify
the checksum first.

With nf_conntrack_checksum enabled, the default outside of OpenWrt,
conntrack now computes the checksum that GRO used to, so the work moves
rather than disappears; with RPS it can move to a busier CPU.

A fraglist skb whose geometry was changed after GRO, by NAT or
bpf_skb_pull_data(), is segmented by skb_segment(), which computes new
checksums. Such a packet is now forwarded with a valid checksum even if
it was corrupted before it arrived; the packet boundaries needed to
check it are gone by then.

Cisco Meraki MX65 (BCM58625, 2x Cortex-A9 at 1.2 GHz, bgmac without RX
checksum offload), TCP forwarded through the router, CPU bound with an
MSS of 536, median of four runs in Mbit/s, in one boot:

             checked  skipped
  WAN->LAN     496      621
  LAN->WAN     682      802

At the full MSS the router already forwards at line rate in each
direction, and csum_partial(), which took 27% of the cycles, drops out
of the profile.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/net/gro.h        | 13 ++++++++
 net/core/skbuff.c        | 67 ++++++++++++++++++++++++++++++++++++++++
 net/ipv4/tcp_ipv4.c      | 19 +++++++-----
 net/ipv4/tcp_offload.c   | 29 ++++++++++++-----
 net/ipv6/tcpv6_offload.c | 29 ++++++++++++-----
 5 files changed, 134 insertions(+), 23 deletions(-)

diff --git a/include/net/gro.h b/include/net/gro.h
index 7a19d4486456..3cbf6d11be16 100644
--- a/include/net/gro.h
+++ b/include/net/gro.h
@@ -292,6 +292,19 @@ static inline void skb_gro_incr_csum_unnecessary(struct sk_buff *skb)
 #define skb_gro_checksum_simple_validate(skb)				\
 	__skb_gro_checksum_validate(skb, 0, false, 0, null_compute_pseudo)
 
+/* A TCP fraglist GRO skb is only built for packets that are not for a local
+ * socket, and is segmented back into the original packets, each with its own
+ * checksum. Leave the checksum of such a packet unverified when that would
+ * mean computing it in software: the merged skb stays CHECKSUM_NONE, and
+ * __skb_checksum_complete() verifies the packets one by one if anything on the
+ * way asks for it.
+ */
+static inline bool skb_gro_flist_skip_csum(const struct sk_buff *skb)
+{
+	return NAPI_GRO_CB(skb)->is_flist && !NAPI_GRO_CB(skb)->encap_mark &&
+	       skb->ip_summed == CHECKSUM_NONE;
+}
+
 static inline bool __skb_gro_checksum_convert_check(struct sk_buff *skb)
 {
 	return (NAPI_GRO_CB(skb)->csum_cnt == 0 &&
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1c921383aed9..c00542200799 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4068,6 +4068,68 @@ __sum16 __skb_checksum_complete_head(struct sk_buff *skb, int len)
 }
 EXPORT_SYMBOL(__skb_checksum_complete_head);
 
+/* Verify the TCP checksum of one packet of a TCP fraglist GRO skb: the
+ * head, whose data starts at or before its TCP header, or one of the skbs on
+ * its frag_list, whose data starts at the payload with the headers in front
+ * of it.
+ */
+static bool skb_flist_tcp_csum_ok(const struct sk_buff *skb, bool ipv6)
+{
+	const struct iphdr *iph = ip_hdr(skb);
+	const unsigned char *th;
+	unsigned int len;
+	__wsum csum;
+	int off;
+
+	if (!ipv6)
+		th = skb_network_header(skb) + iph->ihl * 4;
+	else if (ipv6_hdr(skb)->nexthdr == IPPROTO_TCP)
+		th = skb_network_header(skb) + sizeof(struct ipv6hdr);
+	else
+		return false;
+
+	off = th - skb->data;
+	if (off > (int)skb_headlen(skb) || -off > (int)skb_headroom(skb))
+		return false;
+
+	len = skb_pagelen(skb) - off;
+	csum = 0;
+	if (skb_checksum_full(skb, off, len, &csum))
+		return false;
+
+	if (!ipv6)
+		return !csum_tcpudp_magic(iph->saddr, iph->daddr, len,
+					  IPPROTO_TCP, csum);
+
+	return !csum_ipv6_magic(&ipv6_hdr(skb)->saddr, &ipv6_hdr(skb)->daddr,
+				len, IPPROTO_TCP, csum);
+}
+
+/* TCP fraglist GRO may leave the checksum unverified, see
+ * skb_gro_flist_skip_csum(). The checksum of the head does not cover the
+ * packets on its frag_list, which all still carry their own headers, so
+ * verify each of them.
+ */
+static bool skb_flist_csum_ok(struct sk_buff *skb)
+{
+	bool ipv6 = skb_shinfo(skb)->gso_type & SKB_GSO_TCPV6;
+	struct sk_buff *seg;
+
+	if (skb->encapsulation || !skb_flist_tcp_csum_ok(skb, ipv6))
+		return false;
+
+	skb_walk_frags(skb, seg)
+		if (!skb_flist_tcp_csum_ok(seg, ipv6))
+			return false;
+
+	if (!skb_shared(skb)) {
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+		skb->csum_level = 0;
+	}
+
+	return true;
+}
+
 /* This function assumes skb->csum already holds pseudo header's checksum,
  * which has been changed from the hardware checksum, for example, by
  * __skb_checksum_validate_complete(). And, the original skb->csum must
@@ -4083,6 +4145,11 @@ __sum16 __skb_checksum_complete(struct sk_buff *skb)
 	__wsum csum = 0;
 	__sum16 sum;
 
+	if (unlikely(skb->ip_summed == CHECKSUM_NONE && skb_is_gso(skb) &&
+		     (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) &&
+		     (skb_shinfo(skb)->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
+		return skb_flist_csum_ok(skb) ? 0 : (__force __sum16)1;
+
 	if (skb_checksum_full(skb, 0, skb->len, &csum))
 		return skb_checksum_complete_failed(skb);
 
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index f2a5c8f3bf9d..67897435291a 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1919,14 +1919,6 @@ enum skb_drop_reason tcp_add_backlog(struct sock *sk, struct sk_buff *skb)
 	int delta;
 	int err;
 
-	/* In case all data was pulled from skb frags (in __pskb_pull_tail()),
-	 * we can fix skb->truesize to its real value to avoid future drops.
-	 * This is valid because skb is not yet charged to the socket.
-	 * It has been noticed pure SACK packets were sometimes dropped
-	 * (if cooked by drivers without copybreak feature).
-	 */
-	skb_condense(skb);
-
 	tcp_cleanup_skb(skb);
 
 	if (unlikely(tcp_checksum_complete(skb))) {
@@ -1937,6 +1929,17 @@ enum skb_drop_reason tcp_add_backlog(struct sock *sk, struct sk_buff *skb)
 		return SKB_DROP_REASON_TCP_CSUM;
 	}
 
+	/* Verify the checksum first: a TCP fraglist GRO skb left unverified
+	 * can only be checked while its packets are still on its frag_list.
+	 *
+	 * In case all data was pulled from skb frags (in __pskb_pull_tail()),
+	 * we can fix skb->truesize to its real value to avoid future drops.
+	 * This is valid because skb is not yet charged to the socket.
+	 * It has been noticed pure SACK packets were sometimes dropped
+	 * (if cooked by drivers without copybreak feature).
+	 */
+	skb_condense(skb);
+
 	/* Attempt coalescing to last skb in backlog, even if we are
 	 * above the limits.
 	 * This is okay because skb capacity is limited to MAX_SKB_FRAGS.
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd07c723..d38eaf24c3c5 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -410,8 +410,11 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 			return;
 		}
 
-		/* Fall back to the regular GRO path */
-		if (NAPI_GRO_CB(p)->count == 1)
+		/* Fall back to the regular GRO path, unless the checksum of p
+		 * was left unverified: regular GRO would compute a new one on
+		 * the way out. p is flushed instead.
+		 */
+		if (NAPI_GRO_CB(p)->count == 1 && p->ip_summed != CHECKSUM_NONE)
 			NAPI_GRO_CB(p)->is_flist = 0;
 
 		NAPI_GRO_CB(skb)->is_flist = 0;
@@ -433,10 +436,21 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 INDIRECT_CALLABLE_SCOPE
 struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
 {
+	unsigned int off = skb_gro_offset(skb);
 	struct tcphdr *th;
 
-	/* Don't bother verifying checksum if we're going to flush anyway. */
-	if (!NAPI_GRO_CB(skb)->flush &&
+	th = skb_gro_header(skb, off + sizeof(*th), off);
+	if (unlikely(!th))
+		goto flush;
+
+	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
+		tcp4_check_fraglist_gro(head, skb, th);
+
+	/* Don't bother verifying checksum if we're going to flush anyway.
+	 * A fraglist skb is verified one packet at a time if anything asks
+	 * for it, see skb_gro_flist_skip_csum().
+	 */
+	if (!NAPI_GRO_CB(skb)->flush && !skb_gro_flist_skip_csum(skb) &&
 	    skb_gro_checksum_validate(skb, IPPROTO_TCP,
 				      inet_gro_compute_pseudo))
 		goto flush;
@@ -445,9 +459,6 @@ struct sk_buff *tcp4_gro_receive(struct list_head *head, struct sk_buff *skb)
 	if (!th)
 		goto flush;
 
-	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
-		tcp4_check_fraglist_gro(head, skb, th);
-
 	return tcp_gro_receive(head, skb, th);
 
 flush:
@@ -465,7 +476,9 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 		skb_shinfo(skb)->gso_type |= SKB_GSO_FRAGLIST | SKB_GSO_TCPV4;
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
-		__skb_incr_checksum_unnecessary(skb);
+		/* not verified, see skb_gro_flist_skip_csum() */
+		if (skb->ip_summed != CHECKSUM_NONE)
+			__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
 	}
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index eec3778855eb..9c5709b2bf72 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -32,8 +32,11 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 			return;
 		}
 
-		/* Fall back to the regular GRO path */
-		if (NAPI_GRO_CB(p)->count == 1)
+		/* Fall back to the regular GRO path, unless the checksum of p
+		 * was left unverified: regular GRO would compute a new one on
+		 * the way out. p is flushed instead.
+		 */
+		if (NAPI_GRO_CB(p)->count == 1 && p->ip_summed != CHECKSUM_NONE)
 			NAPI_GRO_CB(p)->is_flist = 0;
 
 		NAPI_GRO_CB(skb)->is_flist = 0;
@@ -56,10 +59,23 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 static __always_inline struct sk_buff *tcp6_gro_receive(struct list_head *head,
 							struct sk_buff *skb)
 {
+	const struct ipv6hdr *iph = skb_gro_network_header(skb);
+	unsigned int off = skb_gro_offset(skb);
 	struct tcphdr *th;
 
-	/* Don't bother verifying checksum if we're going to flush anyway. */
+	th = skb_gro_header(skb, off + sizeof(*th), off);
+	if (unlikely(!th))
+		goto flush;
+
+	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
+		tcp6_check_fraglist_gro(head, skb, th);
+
+	/* Don't bother verifying checksum if we're going to flush anyway.
+	 * __skb_checksum_complete() can only verify the packets of a fraglist
+	 * skb without extension headers.
+	 */
 	if (!NAPI_GRO_CB(skb)->flush &&
+	    !(skb_gro_flist_skip_csum(skb) && iph->nexthdr == IPPROTO_TCP) &&
 	    skb_gro_checksum_validate(skb, IPPROTO_TCP,
 				      ip6_gro_compute_pseudo))
 		goto flush;
@@ -68,9 +84,6 @@ static __always_inline struct sk_buff *tcp6_gro_receive(struct list_head *head,
 	if (!th)
 		goto flush;
 
-	if (unlikely(skb->dev->features & NETIF_F_GRO_FRAGLIST))
-		tcp6_check_fraglist_gro(head, skb, th);
-
 	return tcp_gro_receive(head, skb, th);
 
 flush:
@@ -88,7 +101,9 @@ static __always_inline int tcp6_gro_complete(struct sk_buff *skb, int thoff)
 		skb_shinfo(skb)->gso_type |= SKB_GSO_FRAGLIST | SKB_GSO_TCPV6;
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
-		__skb_incr_checksum_unnecessary(skb);
+		/* not verified, see skb_gro_flist_skip_csum() */
+		if (skb->ip_summed != CHECKSUM_NONE)
+			__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
 	}
-- 
2.56.1

