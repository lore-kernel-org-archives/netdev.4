Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859562;
	b=3U9dTfharIeAXHZ9GerZlldcRf7McDVufos8inJktiFO94rgrSY7zEztrbmYDDIVNUiD
	 Wr3NXWxZ0NozHMg0DHlZ9O9O4tBZq3tJJufuIQ13USQ13nLUMLNBDC7Ceea52/41g3UTW
	 ypuBa5DbaJ9Ik9Oz0sr0LmOz4PakYEsD1L+ifKma3OUXPs4nJPBo9Qf/gbeml9+Bz1fh4
	 sdVM8UI2ItkFj6xEyQ658Cf6wsNFDh6m5nwVkyxzOBJqw/dZmN3VYYV05kR7MQ6umqdQ8
	 RowzIVFlbsi5R7UkTUh44Flk/Wy5W0Qvkog5BcHD9km8UXUOpcTloArYmcpgNjUw1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xu7iXQN/4O1+5RTiopqG0TpWlazdt9S4Mw8sRdID0kI=;
	b=1gkiMuyJpZJkBjzVxzXvAN+Zib4qOcFTq5Xz3yad5bfDGWpTd38vDZFtgnJVs/k6Imqx
	 83eFPyhIw6OZQYshN/a+quXmyEKaVfdoIr4/GFIip1cZJVPzUNXuluk054M5GGNIfH0c3
	 AvlJQBItqV2Aef+HA6bWFXIDaznQJojAbbvXigDoLXw9rpegtTtPapHT35uCXSGqK7LkL
	 CJKcbDfiir57qB+rVQOAv2rcWGCj/Omuht1lbuZztxMlZ3basclGkni1M1LllSXOhHEw3
	 pVOWbkQq01cUm4N2JstsbHW/enQN6CawJBpEzMIlThhaN61KuY3V7ZUIUfRcN2mRF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yNjsoeLK;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF4606A337
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DF4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yNjsoeLK
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-920fed989b2so458856d6.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794859561; x=1795464361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xu7iXQN/4O1+5RTiopqG0TpWlazdt9S4Mw8sRdID0kI=;
        b=yNjsoeLKMElNYoyOImcmVR2rZaFyHNQGFIlCLJCThdrJ2EtN4r8BF1LumQFN2rImMx
         TxiVjcCmn6aEXaf39RpX/3trXZCl7mMye9nejbRdBpWDEyD71FfGwKPj/vNU1A+HuIoN
         RKHg5JQW6iW9hgEBCz6L/InxD/RUd6k1dMdjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859561; x=1795464361;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xu7iXQN/4O1+5RTiopqG0TpWlazdt9S4Mw8sRdID0kI=;
        b=rfmcxLFYCgs46YJ8SXu7oKYsIhneZueDQ+GCeFL/OZdl/S6eu0j7D0vVyk3r+G/IhT
         H+Nb+svgduVQdFNPofOMb931NqZzx+4TZEOaL9wwpNa+Q+jUKaQZqfhsHAheAvUUSIns
         4I751OuFY0kFTaBl4KReW+s6eoaDQ9Y5n07JLF3WzaCWnYWsTZQy/batOTk0ap1+Qy9W
         KQ5/1Vnk8K3XdRSc63QkAwuZi0r6N0O9onVtWH3sh6meOMpvC69VgS5FBk2gZ0HhHLRC
         inPD3TB0k6dtlCUf+WpX7PNoZGDgVPBSPbu7Iv2Nw0x+/hP7aflY+3qZ92IqRzk+Kw6V
         1JIg==
X-Gm-Message-State: APuU4Z95b6ZYR1L3MBXo0d+PU3zum08dnUjOACTULA0qT/LHGfchgxhU
	um4h1wSEYrrIhRnwHVMjiFUD84907olofiDKrQQTPptTfug+yV7wEdqtT+3N4NDVRIK5dTyBEkr
	ZZC8=
X-Gm-Gg: AZFdTZfwmZ6+F9bLtQinxBMLUlGj+8ZB0zEDP4fNviiHMUkMDe7NpDB0o+EZnffyyz6
	FRNPE8hw1bqKNWs4JO0WVfpE1YZWbppy20Pyg6/eDQu+0FOeSy7QX/YwJOlBk6SLgSewYnqhAgU
	ZNvEc1YGn/ZX1uZJcNRGumUSK9kGvpYozGqV2ZnO9z77LH4ieUrvA2PL/Jc73z/bwkewGffKjtJ
	K1QMeoPqy3DHxmuMBzVTgDutD5VXZhHURN3a0eJap+2iSzpMvlpNwOynwg+W32vN7AvoEu5n8ow
	YYjRPnjokut9rI3gJpOtcOboFZ9vnhOWpUcDgUqOkUA+hUvGt/fuxQTTFYrFoGVXZG6uid3JSeW
	hoA0uG0Zq0ijhEvwKj7gqnH31iKPRNPvy0dIPPKKk6sql2a4dX0zMxSfa0zJHxHrffIMi7OltlH
	eIYbOIctHYVlLCgz06U62Dk4w+0cLygAShnY0VcrJhoGLDCXzRaLKSgnwRjsafUUu+u9Jh0IK0A
	NI3bUfIs44vdI1JbXBZ2KxTVE20G37TXLS1r+WjEio3v8JszgC2hqv1+gic47ZeC9x/vo7T0tWz
	XIKcxiCO//E/bWjxqtsFwK9k6F1a50v0R/2V2LO8GE1+jel96aBT/n5OWFwmNrRaR5/FdfSmuVI
	=
X-Received: by 2002:ad4:5969:0:b0:91e:9135:7a7e with SMTP id 6a1803df08f44-91f241a5139mr182048106d6.36.1794859561167;
        Mon, 16 Nov 2026 12:06:01 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm94333936d6.26.2026.11.16.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:06:00 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	cake@lists.bufferbloat.net,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v11 2/4] net/sched: cake: use a dedicated split-GSO list iterator
Date: Mon, 16 Nov 2026 15:05:52 -0500
Message-Id: <QDISC-BA27.v11.r0.20261116134053-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v11.r0.20261116134053@mojatatu.com>
References: <QDISC-BA27.v11.r0.20261116134053@mojatatu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

skb_list_walk_safe(segs, segs, nskb) reuses the list head as the walk
cursor, so segs no longer names the segment list once the walk finishes.
Use a separate seg cursor to keep the head and the walker distinct. No
behaviour change.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/sch_cake.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 24853d90c17e..88ff3e4f6754 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1814,7 +1814,7 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		WRITE_ONCE(b->max_skblen, len);
 
 	if (qdisc_pkt_segs(skb) > 1 && q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
-		struct sk_buff *segs, *nskb;
+		struct sk_buff *segs, *nskb, *seg;
 		netdev_features_t features = netif_skb_features(skb);
 		unsigned int slen = 0, numsegs = 0;
 
@@ -1822,19 +1822,19 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (IS_ERR_OR_NULL(segs))
 			return qdisc_drop(skb, sch, to_free);
 
-		skb_list_walk_safe(segs, segs, nskb) {
-			skb_mark_not_on_list(segs);
-			qdisc_skb_cb(segs)->pkt_len = segs->len;
-			qdisc_skb_cb(segs)->pkt_segs = 1;
-			cobalt_set_enqueue_time(segs, now);
-			get_cobalt_cb(segs)->adjusted_len = cake_overhead(q,
-									  segs);
-			flow_queue_add(flow, segs);
+		skb_list_walk_safe(segs, seg, nskb) {
+			skb_mark_not_on_list(seg);
+			qdisc_skb_cb(seg)->pkt_len = seg->len;
+			qdisc_skb_cb(seg)->pkt_segs = 1;
+			cobalt_set_enqueue_time(seg, now);
+			get_cobalt_cb(seg)->adjusted_len = cake_overhead(q,
+									 seg);
+			flow_queue_add(flow, seg);
 
 			qdisc_qlen_inc(sch);
 			numsegs++;
-			slen += segs->len;
-			q->buffer_used += segs->truesize;
+			q->buffer_used += seg->truesize;
+			slen += seg->len;
 			WRITE_ONCE(b->packets, b->packets + 1);
 		}
 
-- 
2.34.1

