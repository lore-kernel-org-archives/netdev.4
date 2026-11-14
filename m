Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658477;
	b=4saQcvkkNC820ufueb06Ewb5PEgx3IkjrHvjgJSoE39pxkPb0XPYaNdaXClSu3kGOMTB
	 E4RQ/TpCqZTYlGirqfYcDD1Csam/hDGGFIJpvr4Y49bbGnGi3KQEGxXsJRIZQRkYz1Mtd
	 KS8t1/5ctR7rgLw3dEXqz6BEwmcMHM6/1ZDVBlUFruvJTcFIhm2MxwlHTVs5f2JE66yn8
	 LU3J7TJKxR6ShR7Gl1SuOZu8s4Qe8WdWV4YtFoa2d+GNWur5xIt7IjYdKq4/bA4snIMvv
	 x7latiYXMQKlu1LmawYv335SBV0Ku0bhVzIsWC4mAfra0h+LSSSFU6w3dx1ytR8v0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zwhaeCJRv3sI4IjbReNvuaapvaFwUI/cTpt7X2hxku0=;
	b=NX6W7AVuuUivMEbGp1IyNCrWW7ETAAuHtmHnt5/A6gRrrqCq3Ja8wcnZL9yLnNA5V8Gw
	 vbF0ug+U11vy1soL4T4S/fldeBCw6w+qhW5XmMX/f/fMa5Sa65TWpZERaJNP/3HPdWzmh
	 xbW2Yf9bTOK8dc2xv+98LY8RIWfRQhLvyBxlwK72XOMvfbfmwpjiI/3xQAvr3eBGx9M0Z
	 7s93/j58JNvDrs0zj83NUVj96IFyvdSAKOWEOPlGBSzlsFzi9WfVHOQcZzGNB3KW7eHdM
	 g4xehj38kZa8nK7yUCh3GL6TIuPn3+vFX6pMVi6SgKh9QclaCHpYc+yOen19M/uJTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ENEQAMp5;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5A606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E5A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ENEQAMp5
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c11468b5fso29099036d6.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794658476; x=1795263276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwhaeCJRv3sI4IjbReNvuaapvaFwUI/cTpt7X2hxku0=;
        b=ENEQAMp5BCYdP9T8o5z8L5IaPt3kCUrTy2HtbaJka8eZAuwU6pMJFAGJVn0C3lHhNo
         0X/xYNyW+qtUsCV7bXUk4I+ln3uq3RRAENsPOztigrAPMcdMTseYKDZoPcOAhMv5Td4C
         brviZtcTu0DhgCLRjG5ykQ/ivLKrSajLvTjOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658476; x=1795263276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwhaeCJRv3sI4IjbReNvuaapvaFwUI/cTpt7X2hxku0=;
        b=SO1g/3uSeLNPvPL/3VctJRhKoMQeuh9HkHmc0PpPy71a0mh1uwNTC/5CMYIOa9nm2/
         RBH7txaxUcqKA8O+K21PAGEaKUZXmpxTQ+OnQbFaeq2yRy3ilQd3YOgdZdsXY65m4e/m
         dwa/SZYO6AHuJeNGKTR1Tw4qWQYY0eSZNdlCj5J+GzthQxAFF8bwqbt3yH/VPjYrFJK8
         /P8pLtVY9KqvY19o025Y2b0g2eqSQhzPv5WoAd3ASDrTwBbI+mxLBnFVCxQYUVT3Tefz
         78VJxDFkoD8G3OjpTtxcYvVTii9fJZzI6PaNd/4kZpfNiD3fPUFMOFSVfJv31mh59d9v
         OMXg==
X-Gm-Message-State: APuU4Z+P05P6SZL0CKa6UioFF2qWt1r2p529XMLnhbc7qCCAjbplM1v5
	cP5desS+eiAAnq3s3HodIUtg9KF9yyOcN1ZVv3R1AWWhsXeMIWMUfRqLFi1c/dzP7A6bNNHNZr/
	9brE=
X-Gm-Gg: AYBFou0UaPw5g31TlLpywMQBhMMZmL65GCU+EnGx3KD2CkAyNxspgI4mt24WXevSDri
	bSugpI3IOIXC42X/f8Sxv8hDCWhjx2SYthukPKrjhDz3Z7vVyXseMRyWYYtl8VkVqFTqXxT2PdM
	kvpa1OyNQFuax4eEVJSx+MDxdfn6Kw/rR7JI3muk9sHpIraFavA0qF0LT4Lagyb07FpFEzXsT1t
	5N62eIyqVVsjtBdjqCXcFTnnX6XZVq0SduSNo98NSgLCbv54D4tK9y5h2IgFQx0g79BppVDg116
	HsAN8gNVmTMhUNC8IgMSZ2Qbf7k2DjWu/h4uYaACdYa/o+MQ4M9SDFulNCpM+oXXr2f2VS3NEUh
	9cWBJBSjc2xxbikF0OY9CeqBskk+e7iFgH+yJfDIhRyzDwe9PISI5ZpHFSOZNIA10x6fFzoEvpa
	j4eQsyvfS4aQ8pMSyO1yr1vIJ9yyIkeVMIhRPxCCfEirFZaFtGRVzzVRo1d1dxKkBxdcttV2nMJ
	3RMFovbX5Q6+xhI0qshvHIsuUxUtjaCwtA6ImWmCZN4ziPiUpJGzcA2cCqJnGFUi3hINAyNVLdP
	Vr/hDtWqnZ4ge7k7ifdBYWALLTEb2hecZZ4iwKvhHqoojD8g0/XzODa6mLzgwnHvBjlcNgLU7BE
	HcIBReIBpyIvjFGQ=
X-Received: by 2002:a0c:f148:0:10b0:91c:8fd4:9ad5 with SMTP id 6a1803df08f44-91f2415f556mr66581206d6.10.1794658475969;
        Sat, 14 Nov 2026 04:14:35 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm41840486d6.17.2026.11.14.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:14:35 -0800 (PST)
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
Subject: [PATCH net-next v10 2/4] net/sched: cake: use a dedicated split-GSO list iterator
Date: Sat, 14 Nov 2026 07:14:24 -0500
Message-Id: <QDISC-BA27.v10.r0.20261114071135-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v10.r0.20261114071135@mojatatu.com>
References: <QDISC-BA27.v10.r0.20261114071135@mojatatu.com>
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
2.43.0

