Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780687;
	b=RU0Wd/IzDbb6nugcOdZt9WmksAKMvTIFxxviV8r6DOvhm1wr9egBnptlW29+abYWMbqK
	 S70fL+dGdj1JJuzvikdpbSr7rPIq5rXeoyDSIj33EoNNupCZX0fU/atm9hu+dsJl+twZ2
	 1iKbGHee+byYtoSIJX5QW/k9Mr9IfNCJkIRTOv/LWqBhXEyC3uugsMZk+IPxoxy/w6TXI
	 DCNrsWXTUsbt2zFcTzfVNAsa6pJQlCheu7E6laYaaBE9vVHHfsgA9jvh2dbaSQVUfvCRE
	 WcYUBCXCvTe1CRyrUXoZZIeRW6o6YOYK6Ua4mwwpcTRzoas6e9DmA4pYTvKS4xVhYFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IppX34mtbwcveWpzKOOiEcz4RQPHVMqcBGDE9+flnwE=;
	b=dH72JrRJcMFD1ch/n4C967PJY843aRVIZ9fpPEOHu5+F7j9Ow9DAUy3Wd9XCZ8U+bf7f
	 pamlfPd982o5wVYGTs3PtPyFI14IoTpXCpwzL9zCPSpQyYWxGaPBO3ww01Xock0fiwTSM
	 LOmf/89qKMXNPju+J1EX2g4AEzS/iIS4EMZMM+r/laksWRK2J4+shXNr95o+2OQRc9IcG
	 B2BlFvVddBbsc7ZL8QQ6UeUytlNz+cEdk+mdGigpIa8BCMyrJbTnBon5KtEDBmcPOiQfE
	 khPcI0C6WZ9MA0c/t8aUcNFpkOPc0l82gE1uX9cTHj71Onj65WHHkOSQvPEsHdCesoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Dwt1zDzi;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C191606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C191606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Dwt1zDzi
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-537548b811aso64129981cf.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780686; x=1796385486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IppX34mtbwcveWpzKOOiEcz4RQPHVMqcBGDE9+flnwE=;
        b=Dwt1zDzi62QXtjvMk0jQATZv2bDuwvRkLz0wUjLuIO5TmXQ489UxHGUk4h9np7+wFC
         m7gNLrzIqjGo80D2e6kso2smh0GpWKrvVSdo+0NrUN3hXoQqA+dY+f8wQOHEE5A6oYmI
         jTav1Mw/TGVXm5VsFFg8wqvnM2fVVLjwD4pQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780686; x=1796385486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IppX34mtbwcveWpzKOOiEcz4RQPHVMqcBGDE9+flnwE=;
        b=SmTcN+p5hv3bxS0Xa8TWhXbwiJaUSG2NDcgKqRimykvjJtCh12XqZtPJvV9FaKmaG/
         uvz44Svpey8DVZm52IqLYKZkgPEh8wlKp2GSTSXVpfx0XIaiNkLH+kOIzsbB5Pgea3j6
         Jwo51rSkReWZdIvwHi7N9OmGEL/qCEeuLnFlYQlTdw5RMmIz8+wiAPDfz0nynbZS31XP
         whSvU9zqr6/MSIj3dp2CmX9FlsWfn9Ix+eY3agPf7k1Vo06RMNNAYAWpzGUlLgqzG1IL
         tw/r4a2BtvVerLthuomsZq/j4il4T+GxgnKstoDvJciEnwH9Uqcb9x0tTvqw3u+gzKAW
         2HSQ==
X-Gm-Message-State: APuU4Z/WTm4uy/GOwKlRi3u5txfAQ8xLbeYpfeAIgIBYQvcEGnx3q+3M
	YXic79LGvyyZXgLNtqjl7ldZw5hY5X5g3fk2nfw9tCrgGMHKKLDnq1t/mSbpiCTd9mPPsMRRlP8
	hono=
X-Gm-Gg: AZFdTZdPFIXhx3uvNd2Y/18eSXHfrTYe8SfjfR/rdUvyArxtIy+CyTwC1qW0gVbaPpd
	Ad72+BW3xfhE6FnW3rTUZ2z5D3HldZaSswXTp0QeQNv4kjURgIY9jZuLdU+GRchYAIoqZSSCja9
	jfxDi2E4JOk2gF9mdVOX2qALZuc0+RtjsmtQK8YnwTv+ztiN6sjiO3sv89P7gyhhYYbNey9A8gb
	xcdOyzl1GAzoU9MtFG+fddANpA3sBz1mAgFepVZnEe6Gn+sfovU1REekmaJpBfQKnQWjjta8Htm
	a10WcnCruvI+sszLBKcoI8UOYZv+3ncit7ywfUjsO5PsiVoT5cXhYvz8HhqYr5QUfF2D05N6IcK
	2+It+zCZh4blpA7F7MJDbID+TO/4xB5D8bbykvjSko1nOLxYQugN4qqbdRRgwpq45HxCxzdGuUX
	ceS/jwSw2JNuJfraw3v15lbBFpg0aHTIdMF9kOHPjUxoLr6SLnyNzf3gf4XiNTxEY05s2NhtVTQ
	iDt5e/dXScqq+ESe0eSsqQ1WjO0JpqWM/dtFbnDHZr9Rl6CD8GKOqXwemUPoVqQ4LnHexScOWkR
	oflL0TDiVKjKG20bxnFAwVZyd2UPh47mw9k6up65rQyMMTv1Q46wBPBKHHqjL+N/iAjh0nMLLhY
	=
X-Received: by 2002:a05:620a:a012:b0:949:e60b:e0ea with SMTP id af79cd13be357-949e60be137mr2335941785a.16.1795780686018;
        Fri, 27 Nov 2026 03:58:06 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm1588177985a.2.2026.11.27.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:58:05 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	cake@lists.bufferbloat.net,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v13 4/4] net/sched: cake: hash before segmenting and reject an overlong split
Date: Fri, 27 Nov 2026 06:57:52 -0500
Message-Id: <QDISC-BA27.v13.r0.20261127065026-4@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
References: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
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

The Fix: with CAKE_FLAG_SPLIT_GSO, cake computes the flow keys and then
splits a GSO skb into segments it accounts individually. Key extraction
must run on the unsegmented skb -- skb_gso_segment() can rewrite
encapsulated headers to the inner ones -- and resolution must wait until
admission, since it commits set-associative state a later rejection would
leave mutated.

Split cake_hash() into a side-effect-free cake_hash_keys() and a
cake_hash_resolve() that runs only on admission, move the split-GSO path
ahead of the resolution, and sum the list against the ceiling before
linking any segment. A split an ancestor cannot absorb is refused, because
qdisc_tree_reduce_backlog() would grow it without its enqueue guard seeing
the sum. The list is deferred to free so the tail segment's sock_free()
never runs under the qdisc lock.

Some context: tag every deferred segment with QDISC_DROP_OVERLIMIT --
skb_gso_segment() keeps the control block at cb offset 32, aliasing the
qdisc drop reason into every segment, so tagging only the head left the
rest with a headroom-sized value. Read the flow mode once with READ_ONCE()
so a concurrent cake_mq reconfiguration cannot extract and resolve in
different modes.

Conditions to recreate the bug:
  ip tuntap add tun0 mode tun
  ip link set tun0 txqueuelen 32 up
  ip addr add 10.99.0.1/24 dev tun0
  # hold the tun fd open without reading so the backlog persists; a stab
  # overhead of 1048468 accounts each 92-byte packet at 1048560 bytes.
  # 4095 queued packets are already above QDISC_MAX_BACKLOG, so the
  # enqueue guard drops the GSO skb before the split is tried; 4094
  # packets leave 2162655 bytes below U32_MAX, so only a segment sum above
  # that reaches the split check and cake drops the whole list.  A
  # 65000-byte UDP_SEGMENT payload with a 1400-byte segment size sums to
  # 66316 bytes and passes.  Setup needs CAP_NET_ADMIN in a user namespace
  # of its own (unshare -Urn); the payload itself does not.
  tc qdisc add dev tun0 root handle 1: stab overhead 1048468 \
      cake split-gso memlimit 512Mb
  # Fill the queue to the window with 4094 92-byte frames (1048560
  # accounted bytes each) and then send the split:
  python3 -c 'import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, 33554432)
for _ in range(4094):
    s.sendto(b"A" * 64, ("10.99.0.2", 9))'
  # A 65000-byte UDP_SEGMENT datagram with a 1400-byte segment size sums
  # to 66316 accounted bytes and is admitted; the refusal needs a segment
  # sum above the 2162655 bytes left below U32_MAX, which this example
  # does not reach.  The clause is a defensive bound, not a proven one:
  # the shape that can reach it is an encapsulated trusted TSO with a small
  # inner MSS, where the initializer replicates outer and inner headers on
  # every segment.
  python3 -c 'import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.IPPROTO_UDP, socket.UDP_SEGMENT, 1400)
s.sendto(b"A" * 65000, ("10.99.0.2", 9))'

Link: https://lore.kernel.org/netdev/179231933068.3135.80340792633077986@kernel.org/
Link: https://lore.kernel.org/netdev/179269577270.3135.16072065138845192450@kernel.org/
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

---
v12 -> v13:
- refuse a split an ancestor cannot absorb.
- state the shape that reaches the check in Conditions.
- drop Toke's Acked-by: the split path and its ceiling check changed
substantially; he stays in the Cc.
- shorten the commit log; the v12 body read like a changelog.
  (Note to the sashikos: reduced because humans complained.)
v11 -> v12:
- compare the split's segment sum against U32_MAX, the wrap boundary that
qdisc_backlog_overflow() uses, instead of the post-add ceiling, which
rejected a split up to two packet lengths before it could wrap.
  (Sashiko nipa review of v11)
---
 net/sched/sch_cake.c | 135 +++++++++++++++++++++++++++++++------------
 1 file changed, 99 insertions(+), 36 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 25c7e20ec123..f22d9bcad077 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -709,19 +709,28 @@ static u16 cake_get_flow_quantum(struct cake_tin_data *q,
 		get_random_u16()) >> 16;
 }
 
-static u32 cake_hash(struct cake_tin_data *q, const struct sk_buff *skb,
-		     int flow_mode, u16 flow_override, u16 host_override)
+struct cake_hash_keys {
+	u32 srchost_hash;
+	u32 dsthost_hash;
+	u32 flow_hash;
+};
+
+static void cake_hash_keys(const struct sk_buff *skb, int flow_mode,
+			   u16 flow_override, u16 host_override,
+			   struct cake_hash_keys *out)
 {
 	bool hash_flows = (!flow_override && !!(flow_mode & CAKE_FLOW_FLOWS));
 	bool hash_hosts = (!host_override && !!(flow_mode & CAKE_FLOW_HOSTS));
 	bool nat_enabled = !!(flow_mode & CAKE_FLOW_NAT_FLAG);
-	u32 flow_hash = 0, srchost_hash = 0, dsthost_hash = 0;
-	u16 reduced_hash, srchost_idx, dsthost_idx;
 	struct flow_keys keys, host_keys;
 	bool use_skbhash = skb->l4_hash;
 
+	out->flow_hash = 0;
+	out->srchost_hash = 0;
+	out->dsthost_hash = 0;
+
 	if (unlikely(flow_mode == CAKE_FLOW_NONE))
-		return 0;
+		return;
 
 	/* If both overrides are set, or we can use the SKB hash and nat mode is
 	 * disabled, we can skip packet dissection entirely. If nat mode is
@@ -756,50 +765,64 @@ static u32 cake_hash(struct cake_tin_data *q, const struct sk_buff *skb,
 	switch (host_keys.control.addr_type) {
 	case FLOW_DISSECTOR_KEY_IPV4_ADDRS:
 		host_keys.addrs.v4addrs.src = 0;
-		dsthost_hash = flow_hash_from_keys(&host_keys);
+		out->dsthost_hash = flow_hash_from_keys(&host_keys);
 		host_keys.addrs.v4addrs.src = keys.addrs.v4addrs.src;
 		host_keys.addrs.v4addrs.dst = 0;
-		srchost_hash = flow_hash_from_keys(&host_keys);
+		out->srchost_hash = flow_hash_from_keys(&host_keys);
 		break;
 
 	case FLOW_DISSECTOR_KEY_IPV6_ADDRS:
 		memset(&host_keys.addrs.v6addrs.src, 0,
 		       sizeof(host_keys.addrs.v6addrs.src));
-		dsthost_hash = flow_hash_from_keys(&host_keys);
+		out->dsthost_hash = flow_hash_from_keys(&host_keys);
 		host_keys.addrs.v6addrs.src = keys.addrs.v6addrs.src;
 		memset(&host_keys.addrs.v6addrs.dst, 0,
 		       sizeof(host_keys.addrs.v6addrs.dst));
-		srchost_hash = flow_hash_from_keys(&host_keys);
+		out->srchost_hash = flow_hash_from_keys(&host_keys);
 		break;
 
 	default:
-		dsthost_hash = 0;
-		srchost_hash = 0;
+		out->dsthost_hash = 0;
+		out->srchost_hash = 0;
 	}
 
 	/* This *must* be after the above switch, since as a
 	 * side-effect it sorts the src and dst addresses.
 	 */
 	if (hash_flows && !use_skbhash)
-		flow_hash = flow_hash_from_keys(&keys);
+		out->flow_hash = flow_hash_from_keys(&keys);
 
 skip_hash:
 	if (flow_override)
-		flow_hash = flow_override - 1;
+		out->flow_hash = flow_override - 1;
 	else if (use_skbhash && (flow_mode & CAKE_FLOW_FLOWS))
-		flow_hash = skb->hash;
+		out->flow_hash = skb->hash;
 	if (host_override) {
-		dsthost_hash = host_override - 1;
-		srchost_hash = host_override - 1;
+		out->dsthost_hash = host_override - 1;
+		out->srchost_hash = host_override - 1;
 	}
 
 	if (!(flow_mode & CAKE_FLOW_FLOWS)) {
 		if (flow_mode & CAKE_FLOW_SRC_IP)
-			flow_hash ^= srchost_hash;
+			out->flow_hash ^= out->srchost_hash;
 
 		if (flow_mode & CAKE_FLOW_DST_IP)
-			flow_hash ^= dsthost_hash;
+			out->flow_hash ^= out->dsthost_hash;
 	}
+}
+
+/* Commit the flow into the set-associative table (q->tags[], host
+ * indices, bulk counters). Only after the packet is admitted.
+ */
+static u32 cake_hash_resolve(struct cake_tin_data *q,
+			     const struct cake_hash_keys *keys, int flow_mode)
+{
+	u32 flow_hash = keys->flow_hash, srchost_hash = keys->srchost_hash,
+	    dsthost_hash = keys->dsthost_hash;
+	u16 reduced_hash, srchost_idx, dsthost_idx;
+
+	if (unlikely(flow_mode == CAKE_FLOW_NONE))
+		return 0;
 
 	reduced_hash = flow_hash % CAKE_QUEUES;
 
@@ -1767,13 +1790,17 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 {
 	u32 idx, tin, prev_qlen, prev_backlog, drop_id;
 	struct cake_sched_data *q = qdisc_priv(sch);
+	int flow_mode = READ_ONCE(q->config->flow_mode);
 	int len = qdisc_pkt_len(skb), ret;
 	u16 flow_override, host_override;
+	struct sk_buff *segs = NULL;
+	struct cake_hash_keys keys;
 	struct sk_buff *ack = NULL;
 	ktime_t now = ktime_get();
 	struct cake_tin_data *b;
 	struct cake_flow *flow;
 	bool same_flow = false;
+	u64 slen = 0;
 
 	/* Classify first: a terminal verdict means do not enqueue. */
 	if (cake_tcf_classify(sch, skb, &flow_override, &host_override, &ret)) {
@@ -1790,12 +1817,54 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 					 QDISC_DROP_OVERLIMIT);
 	}
 
-	/* choose flow to insert into */
+	/* Select the tin and extract the keys before segmenting:
+	 * skb_gso_segment() rewrites encapsulated headers, which
+	 * changes the keys.
+	 */
 	b = cake_select_tin(sch, skb);
-	idx = cake_hash(b, skb, q->config->flow_mode, flow_override,
-			host_override) + 1;
+	cake_hash_keys(skb, flow_mode, flow_override, host_override, &keys);
+
+	if (qdisc_pkt_segs(skb) > 1 &&
+	    q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
+		netdev_features_t features = netif_skb_features(skb);
+		struct sk_buff *nskb, *seg;
+
+		segs = skb_gso_segment(skb, features & ~NETIF_F_GSO_MASK);
+		if (IS_ERR_OR_NULL(segs))
+			return qdisc_drop_reason(skb, sch, to_free,
+						 QDISC_DROP_GENERIC);
+
+		/* we never use the original skb after splitting */
+		consume_skb(skb);
+		skb = NULL;
+
+		/* The split path accounts the segment sum, not the
+		 * stab-adjusted qdisc_pkt_len(), so check that sum
+		 * against the same wrap boundary as the enqueue guard.
+		 */
+		skb_list_walk_safe(segs, seg, nskb)
+			slen += seg->len;
+
+		if (unlikely((u64)sch->qstats.backlog + slen > U32_MAX ||
+			     (slen > (u64)len &&
+			      !qdisc_ancestors_backlog_room(sch, slen - len)))) {
+			qdisc_qstats_overlimit(sch);
+			/* __skb_gso_segment() puts SKB_GSO_CB at cb
+			 * offset 32, over tc_skb_cb.drop_reason; every
+			 * segment inherits it. Tag each one with the
+			 * qdisc drop reason.
+			 */
+			skb_list_walk_safe(segs, seg, nskb)
+				tcf_set_qdisc_drop_reason(seg,
+							  QDISC_DROP_OVERLIMIT);
+
+			return qdisc_drop_all(segs, sch, to_free);
+		}
+	}
+
+	/* Admitted: resolve the flow. */
+	idx = cake_hash_resolve(b, &keys, flow_mode);
 	tin = (u32)(b - q->tins);
-	idx--;
 	flow = &b->flows[idx];
 
 	/* ensure shaper state isn't stale */
@@ -1822,14 +1891,9 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	if (unlikely(len > b->max_skblen))
 		WRITE_ONCE(b->max_skblen, len);
 
-	if (qdisc_pkt_segs(skb) > 1 && q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
-		struct sk_buff *segs, *nskb, *seg;
-		netdev_features_t features = netif_skb_features(skb);
-		unsigned int slen = 0, numsegs = 0;
-
-		segs = skb_gso_segment(skb, features & ~NETIF_F_GSO_MASK);
-		if (IS_ERR_OR_NULL(segs))
-			return qdisc_drop(skb, sch, to_free);
+	if (segs) {
+		struct sk_buff *nskb, *seg;
+		unsigned int numsegs = 0;
 
 		skb_list_walk_safe(segs, seg, nskb) {
 			skb_mark_not_on_list(seg);
@@ -1843,7 +1907,6 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			qdisc_qlen_inc(sch);
 			numsegs++;
 			q->buffer_used += seg->truesize;
-			slen += seg->len;
 			WRITE_ONCE(b->packets, b->packets + 1);
 		}
 
@@ -1855,9 +1918,8 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		WRITE_ONCE(b->backlogs[idx], b->backlogs[idx] + slen);
 
 		qdisc_tree_reduce_backlog(sch, 1-numsegs, len-slen);
-		consume_skb(skb);
 	} else {
-		/* not splitting */
+		/* not splitting - skb pointer still valid */
 		int ack_pkt_len = 0;
 
 		cobalt_set_enqueue_time(skb, now);
@@ -1951,7 +2013,8 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		flow->set = CAKE_SET_SPARSE;
 		WRITE_ONCE(b->sparse_flow_count, b->sparse_flow_count + 1);
 
-		WRITE_ONCE(flow->deficit, cake_get_flow_quantum(b, flow, q->config->flow_mode));
+		WRITE_ONCE(flow->deficit,
+			   cake_get_flow_quantum(b, flow, flow_mode));
 	} else if (flow->set == CAKE_SET_SPARSE_WAIT) {
 		/* this flow was empty, accounted as a sparse flow, but actually
 		 * in the bulk rotation.
@@ -1960,8 +2023,8 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		WRITE_ONCE(b->sparse_flow_count, b->sparse_flow_count - 1);
 		WRITE_ONCE(b->bulk_flow_count, b->bulk_flow_count + 1);
 
-		cake_inc_srchost_bulk_flow_count(b, flow, q->config->flow_mode);
-		cake_inc_dsthost_bulk_flow_count(b, flow, q->config->flow_mode);
+		cake_inc_srchost_bulk_flow_count(b, flow, flow_mode);
+		cake_inc_dsthost_bulk_flow_count(b, flow, flow_mode);
 	}
 
 	if (q->buffer_used > u64_stats_read(&q->buffer_max_used)) {
-- 
2.43.0

