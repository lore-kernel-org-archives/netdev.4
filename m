Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636664;
	b=olGmnAXtSgZWwgcYP2nCAypLQP0rAaHEbI7c3tjuTqS2QdY6/wla3q5qEGG/Dvn78zrC
	 8OJfVXvIjyf2ywT701sJhZ+ohBwwfQIhuPdEt2tBds0h+aIFwVe+XpvFOid9NYJ/oMx/L
	 oDUjsY8G4ZKq5Ev2o6HAkpTNt8L2opuRU+XG6LKmlnrS91HTF3HiKmWKY6VEyVUAh/2dK
	 MGO/QrQnbpF9eJYrlpGB2hkHsLyNBdCbWHgqIQRPnPYs9HvbrXMC05jP3+vGzE6Lc8eKt
	 uHbhLbbmaEpqjUFPKk9bdRSV/sfzlDpkc/9vBTsveaAk60P7PqQsticBz577Zdl2G8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ikqp2b9xDqrSgBf1tJWWIffgQq1ikNxbSMyEwPlqw0A=;
	b=nmFYH+qSWJ75/Ls3mbAGGcbGOsGrlTnof3f58sglYRcnOJFVpJQLdM/CV68o7JnKMRu0
	 DH3kVzqZwmCNKB93+EQ1HalvI0na5MXLGRmdkcs52p1LydV8cuzxiapS/YtaZZj/wMxEE
	 Avcl8AbWPUEK1833770FpQdNhpWmsAEXz2QyacKW7fbEtw0N1CVINO5io2ytdrvANIPIb
	 UiEf8I6jx9X28BfhNG0gJpLwX08Vq3CfyJ38kRxeqzxrv+YJZTRFJmClP3CnIgc48M/D7
	 koGJe4xTNWjI/Kyjyl8FKUGdEFCnNFohRNHcx2/wZeLUwfvTf5h23eIVrnTCrttLwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=TprMs1Fu;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F556606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F556606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=TprMs1Fu
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so8445873eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636663; x=1796241463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikqp2b9xDqrSgBf1tJWWIffgQq1ikNxbSMyEwPlqw0A=;
        b=TprMs1FunrOPrvdUDjqxN0e8QciE59yEYB5GGIKVhgNXvSivkD5cftYKu7g5Bybuxj
         L9+dT+Kp5Na9VUSnM5h76kh9QgtP5ebYUNcl8XUhM81qPn1z5Di7hILF7sox8k/DzFuI
         6vzdmPhLsxg0aSkWDyAfSlFp5P476HNcVQRlvA8WsyxYEihot8dqvwJIfuuYoDId0Ig9
         F9MuvytWP9Nbq5QZjUFwQqr+jwBVIxwNI9Qaw+e/jlsNgUedlDl/Kx+mUC6UFo8n53OJ
         vg7oG7qSDQcfY+Vnz53b2ypEqXmx+jvUDZF8rhQdzigNGXFn0/zCSKP2R+GCwOiARQc/
         5fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636663; x=1796241463;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikqp2b9xDqrSgBf1tJWWIffgQq1ikNxbSMyEwPlqw0A=;
        b=sj+BcEfMUZrccEAAKfseNvlBSf9tQWmpvWGXIMyLBFBGDRYwSj9+SPi1fzXmTWh5hN
         qqY+FhjMLBz7HWGSI2sQAmh18AQLTHL0SbhLGPCWxPEjexDUd8UgBdZrjnrhoTvo9/CK
         nQF5A1qBHU6K0Tp2UiT8/GZjXdVsyojA5uVLdUJjVW4z6PzL7PTTecoc18X/nmwi7Jt7
         33A/k7I0xCL3rXziHBpzm1LGRtS1TjDJxHy4oxGeNos3VMmVUhNSsy8kwHFA0TH4MZl5
         PYhzflr8VFW+O9+mlVotFRVWnltRuoKW6MywlQz88H9bYWsgbBXS2zKnPRO3oYpWYFS7
         DxRw==
X-Forwarded-Encrypted: i=1; AL+hErGJzDS2kEMTyKP6WItN+Em/PZIsukqop85ezN1YJPQWJFT7f8YnosfejFRyYn8zMiuS3rGcIxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3u24BpEGN5s/YJpcEVfqkjMa7/cbet77HCATcYq4xuc/+zH2k
	vqwriUX7jeJaZz6FKDVgT2+UeizKFkhIUOx3PXZI/Aq4prcuoYN4Dbi1qkfiyzIXDMQ=
X-Gm-Gg: AZFdTZdQPysmm352mHucEovDuSDE/UsvuNX0dk+yBM5Fnd1J+lqfHS2PGkPwIqmxJ+A
	TZzwBiNcdl4nDvJGlX0Epk9NTl1OSStTpm6olrM3oeO/rTsnASgJXnrAapO/HrCyk8P6NxPYOlY
	X6ttaBExeElYnyUursLF0HYaTg0TprpQB6MfX775hJQXkr5iyE8oS2FP41CB+579mNwWMlpRww1
	9WVqVd2B7GOyla+W2bJdxnIIoulPk0xK8YjUHVV++XvUXxF10oj38qyDM9S/xYgG2V44aSmpOcI
	tcc4EjssObrO/MTsTOY6iG32xB7nDQhArvll/sNft0uvwIWBDUZ5JlFsG475GyvIa2nx5CijCti
	22DHrKaAOqRb+C8E6/8k7Reimvu2/HeuDWtr9D6E2sQ1w2lJYWHoZWX4+R0YQn/sGoJlp65gFE/
	5FHBj/5iaYYhhHJvQdZV71xLxMdaarEfTohhjduJ7hypsW9JmPDlwJF208KmAZXw9Pym8wx/mFe
	QTDqZWTtGaKweDdLWYF3CgkdxTgJowf1nsyJVtno+NwsxcOsY9550/09e+Sjbhlys+UmInMV2Rb
	yZawwWw/bR6qnbfkM39g0+rIGjJJwi0ea5e0PztB7tW2SiRGnnZWjxxL4mJo+ZokjO9xDi7naPu
	L/ZtP34qRaAqnznyRuFy3tXxuTA==
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr23329136eec.35.1795636663008;
        Wed, 25 Nov 2026 11:57:43 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:42 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	joe@dama.to,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 6.18.y 2/5] net: pull headers in qdisc_pkt_len_segs_init()
Date: Wed, 25 Nov 2026 14:57:32 -0500
Message-ID: <20261125195735.57472-3-artem@trailofbits.com>
In-Reply-To: <20261125195735.57472-1-artem@trailofbits.com>
References: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>
Date: Fri, 3 Apr 2026 22:15:40 +0000

[ Upstream commit 7fb4c19670110f052c04e1ec1d2b953b9f4f57e4 ]

Most ndo_start_xmit() methods expects headers of gso packets
to be already in skb->head.

net/core/tso.c users are particularly at risk, because tso_build_hdr()
does a memcpy(hdr, skb->data, hdr_len);

qdisc_pkt_len_segs_init() already does a dissection of gso packets.

Use pskb_may_pull() instead of skb_header_pointer() to make
sure drivers do not have to reimplement this.

Some malicious packets could be fed, detect them so that we can
drop them sooner with a new SKB_DROP_REASON_SKB_BAD_GSO drop_reason.

Fixes: e876f208af18 ("net: Add a software TSO helper API")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reviewed-by: Joe Damato <joe@dama.to>
Link: https://patch.msgid.link/20260403221540.3297753-3-edumazet@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[ Backport to 6.18.y: 6.18.y lacks the qdisc_pkt_len_segs_init() rename
  with per-skb pkt_segs accounting and the preceding no-functional-change
  cleanup 30e02ec3b4b6 ("net: qdisc_pkt_len_segs_init() cleanup"), so the
  upstream result is applied to qdisc_pkt_len_init() without the pkt_segs
  lines. In 6.18.y only __dev_queue_xmit() calls the function, so only
  that caller handles the returned drop reason. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 include/net/dropreason-core.h |  3 ++
 net/core/dev.c                | 83 +++++++++++++++++++++--------------
 2 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 811057ae8ed2..ab36e3eded67 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -79,6 +79,7 @@
 	FN(UNHANDLED_PROTO)		\
 	FN(SKB_CSUM)			\
 	FN(SKB_GSO_SEG)			\
+	FN(SKB_BAD_GSO)			\
 	FN(SKB_UCOPY_FAULT)		\
 	FN(DEV_HDR)			\
 	FN(DEV_READY)			\
@@ -422,6 +423,8 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_SKB_CSUM,
 	/** @SKB_DROP_REASON_SKB_GSO_SEG: gso segmentation error */
 	SKB_DROP_REASON_SKB_GSO_SEG,
+	/** @SKB_DROP_REASON_SKB_BAD_GSO: malicious gso packet. */
+	SKB_DROP_REASON_SKB_BAD_GSO,
 	/**
 	 * @SKB_DROP_REASON_SKB_UCOPY_FAULT: failed to copy data from user space,
 	 * e.g., via zerocopy_sg_from_iter() or skb_orphan_frags_rx()
diff --git a/net/core/dev.c b/net/core/dev.c
index 97a6ea8fcede..2bbbfc82d779 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4124,53 +4124,63 @@ struct sk_buff *validate_xmit_skb_list(struct sk_buff *skb, struct net_device *d
 }
 EXPORT_SYMBOL_GPL(validate_xmit_skb_list);
 
-static void qdisc_pkt_len_init(struct sk_buff *skb)
+static enum skb_drop_reason qdisc_pkt_len_init(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	unsigned int hdr_len, tlen;
+	u16 gso_segs;
 
 	qdisc_skb_cb(skb)->pkt_len = skb->len;
+	if (!shinfo->gso_size)
+		return SKB_NOT_DROPPED_YET;
+
+	gso_segs = shinfo->gso_segs;
 
 	/* To get more precise estimation of bytes sent on wire,
 	 * we add to pkt_len the headers size of all segments
 	 */
-	if (shinfo->gso_size && skb_transport_header_was_set(skb)) {
-		u16 gso_segs = shinfo->gso_segs;
-		unsigned int hdr_len;
-
-		/* mac layer + network layer */
-		if (!skb->encapsulation)
-			hdr_len = skb_transport_offset(skb);
-		else
-			hdr_len = skb_inner_transport_offset(skb);
 
-		/* + transport layer */
-		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
-			const struct tcphdr *th;
-			struct tcphdr _tcphdr;
+	/* mac layer + network layer */
+	if (!skb->encapsulation) {
+		if (unlikely(!skb_transport_header_was_set(skb)))
+			return SKB_NOT_DROPPED_YET;
+		hdr_len = skb_transport_offset(skb);
+	} else {
+		hdr_len = skb_inner_transport_offset(skb);
+	}
+	/* + transport layer */
+	if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
+		const struct tcphdr *th;
 
-			th = skb_header_pointer(skb, hdr_len,
-						sizeof(_tcphdr), &_tcphdr);
-			if (likely(th))
-				hdr_len += __tcp_hdrlen(th);
-		} else if (shinfo->gso_type & SKB_GSO_UDP_L4) {
-			struct udphdr _udphdr;
+		if (!pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
+			return SKB_DROP_REASON_SKB_BAD_GSO;
 
-			if (skb_header_pointer(skb, hdr_len,
-					       sizeof(_udphdr), &_udphdr))
-				hdr_len += sizeof(struct udphdr);
-		}
+		th = (const struct tcphdr *)(skb->data + hdr_len);
+		tlen = __tcp_hdrlen(th);
+		if (tlen < sizeof(*th))
+			return SKB_DROP_REASON_SKB_BAD_GSO;
+		hdr_len += tlen;
+		if (!pskb_may_pull(skb, hdr_len))
+			return SKB_DROP_REASON_SKB_BAD_GSO;
+	} else if (shinfo->gso_type & SKB_GSO_UDP_L4) {
+		if (!pskb_may_pull(skb, hdr_len + sizeof(struct udphdr)))
+			return SKB_DROP_REASON_SKB_BAD_GSO;
+		hdr_len += sizeof(struct udphdr);
+	}
 
-		if (unlikely(shinfo->gso_type & SKB_GSO_DODGY)) {
-			int payload = skb->len - hdr_len;
+	/* prior pskb_may_pull() might have changed skb->head. */
+	shinfo = skb_shinfo(skb);
+	if (unlikely(shinfo->gso_type & SKB_GSO_DODGY)) {
+		int payload = skb->len - hdr_len;
 
-			/* Malicious packet. */
-			if (payload <= 0)
-				return;
-			gso_segs = DIV_ROUND_UP(payload, shinfo->gso_size);
-			shinfo->gso_segs = gso_segs;
-		}
-		qdisc_skb_cb(skb)->pkt_len += (gso_segs - 1) * hdr_len;
+		/* Malicious packet. */
+		if (payload <= 0)
+			return SKB_DROP_REASON_SKB_BAD_GSO;
+		gso_segs = DIV_ROUND_UP(payload, shinfo->gso_size);
+		shinfo->gso_segs = gso_segs;
 	}
+	qdisc_skb_cb(skb)->pkt_len += (gso_segs - 1) * hdr_len;
+	return SKB_NOT_DROPPED_YET;
 }
 
 static int dev_qdisc_enqueue(struct sk_buff *skb, struct Qdisc *q,
@@ -4760,6 +4770,12 @@ int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev)
 		     (SKBTX_SCHED_TSTAMP | SKBTX_BPF)))
 		__skb_tstamp_tx(skb, NULL, NULL, skb->sk, SCM_TSTAMP_SCHED);
 
+	reason = qdisc_pkt_len_init(skb);
+	if (unlikely(reason)) {
+		dev_core_stats_tx_dropped_inc(dev);
+		kfree_skb_reason(skb, reason);
+		return -EINVAL;
+	}
 	/* Disable soft irqs for various locks below. Also
 	 * stops preemption for RCU.
 	 */
@@ -4767,7 +4783,6 @@ int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev)
 
 	skb_update_prio(skb);
 
-	qdisc_pkt_len_init(skb);
 	tcx_set_ingress(skb, false);
 #ifdef CONFIG_NET_EGRESS
 	if (static_branch_unlikely(&egress_needed_key)) {
