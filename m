Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703206;
	b=m9LGRGt0Wwd13ArD5OjdU8C3PJVcVm9evSIlrPbDwuYc4OJwtGseQ9AuFGtsrs6/OhZV
	 J0/ieIwqJQnNXOFktG4hDZ2UAIGtbH4c0zq6nEOexGMq/MyHjGDc/jcDUah9HKJY4q+hh
	 2p27QZSJA6e+dREu+F+il4+R+K8VK7AufD4XR55olLZ0vy9t+XVyBrm4RwlxCwbCaktK5
	 4UJ+o5ieHkGKzgJyYEN0ACQmdSVFa8dc/uA7mPH3b0NuZ1331ShCutSITfBaJJdIxHM0A
	 FO6UAQ5D73r2SjVkV4v2mnJwwVtf6vuHovSq+X16KkyyAe3TmeVr72kXqZq1t+SmkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
	b=SpgdGv1OkhkZM6xzho1vlnhwHwF3xpKJAtlzO2hPCuLwZrJQVrecmp2YpEyPIRV4zLxK
	 G1G+Ryz6wOXWtU1dRp4Jsn1w4/oEdwvTo5i/ex2e4MfhDoiIXmpP78lNPHw/+GZcS4u82
	 3eMP8pSkrpAj19o1dIDyjpbIY3Ey19eTvJcuvLtqCJUhpJ5Uu7jasD6YmmUwRV7zIXZ6R
	 CjlcPlnnXsYMDEUB1QJBmYuQ9rOxYbEIc7tHtL9qtwkNHohB6KW0Z44bDT+hUoy7qYbtF
	 Xic63nBJnnc/01WmTqhAZSZ/cddbA7HrRlEOTM2FB/zk4uloqUIiLXLbA8sSDJSSaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWFbI0St;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB0606A337
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADB0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWFbI0St
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3545130eec.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703205; x=1795308005; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
        b=jWFbI0StH4kwRNmVtrdLlCwT0MVW1ZK0uool8mJgjrQfYZfjOozju0+oVOC8BlrtWf
         z2GbCNhAi/DwMrmZZGYVzvQxE2y6oPLYJ7W1PnoBItcx6N+BwxbtCJM6dDC3RngQgs0T
         20JS8sW+oYOYcV2WwzE9xMZ3EEnQZ7MRJSrClIQv89Fzs5tRDNeeMy3O7qlAylVSddjV
         RFzzz2F8aSfKT7FYSyLaFGgT1Pj4Fb7/DLCJzaSTTRww7zm8k7OVG0GfcL2h0foaw9X+
         kSQiAjUYebAsK0ElPSOqKpeb9QEAzwDv6557/VHW03wy9hD/uvF0iDcVvBXx4OaTDaog
         IjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703205; x=1795308005;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVrOegmY0YJieEFM4WZoqJaWGp10ZlMFIEfoRDr37KQ=;
        b=RQcT75jzYLBfcD9z6RSnm1n3ZhipbNnOQT873uf9xDB/OM4SKRnLhC+qQI9y11kTRA
         7yruYGV/Jk3ymAU89xVWDB9Og/DJSQjlHqcxkIGPdysMjXQk5XVbTogQdmXM7LcyxQ11
         SkTkGQwn0U/ws39hKiv8Xdh9ANBXM+USp1K1rBDFA4wPjSN1bPuYCRh62RGy0cXQP+ql
         lGRx+HjnPJnAIwOg8ButoS0hZhoYQg1Wmn6PMYURnxA+H+deNO8MgskGpkTeX8XgtrKd
         uEWzkiZ1i1swfo8HRVQd4xBQVQcr4gsf2Iucs8FyPQMklTA6dr4Q0MhMAY487JIw91u+
         EMfw==
X-Gm-Message-State: APuU4Z9PD9dbuH2JZEFNk12aLm7ikF5x1dEdZth004gWBcis7ZUc71XI
	QOMuL8XwX7xFwrI1dNodB25c8861gsukNMd/Qu/nIPOUwHT9olWT4kNbxITQPK9v3getsh3qlEr
	AJdbheLq7Elt32Fnq1tLMn0R7mgc2cJ6TjqlXWM8Fgi+b+bEr/nCgG24kVgqtQ2juB+TcRD1Ikj
	GvCpc+NNT3y0MtRuFkuQuOSDdYAtHYEIW3jU9gdVezhrTaQom4NIOja8phvw8+2s4=
X-Received: from dldz2-n2.prod.google.com ([2002:a05:701b:4182:20b0:1b2:5271:f03b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f905:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b50311d32amr6524859c88.27.1794703204891;
 Sat, 14 Nov 2026 16:40:04 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:01 +0000
In-Reply-To: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115004003.3695475-2-almasrymina@google.com>
Subject: [PATCH net-next v5 1/3] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

skb_split() and skb_shift() do not accurately maintain skb->unreadable
when moving fragments between skbs:

- skb_split_inside_header() moves all fragments out of skb into skb1
  (leaving skb with nr_frags == 0 and only host-readable linear memory),
  but leaves skb->unreadable set on skb.
- skb_split_no_header() unconditionally copies skb->unreadable to skb1
  even if 0 fragments were moved to skb1 (k == 0), and leaves
  skb->unreadable set on skb when splitting at skb_headlen(skb) moves
  all fragments into skb1 (!skb_shinfo(skb)->nr_frags).
- skb_shift() does not clear skb->unreadable after all fragments are
  shifted out of skb.

Fix all three cases so skb->unreadable accurately tracks whether the
remaining fragments in each skb are unreadable.

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2e81aacc998b..4b18717e230e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4508,6 +4508,7 @@ static inline void skb_split_inside_header(struct sk_buff *skb,
 
 	skb_shinfo(skb1)->nr_frags = skb_shinfo(skb)->nr_frags;
 	skb1->unreadable	   = skb->unreadable;
+	skb->unreadable		   = 0;
 	skb_shinfo(skb)->nr_frags  = 0;
 	skb1->data_len		   = skb->data_len;
 	skb1->len		   += skb1->data_len;
@@ -4556,7 +4557,10 @@ static inline void skb_split_no_header(struct sk_buff *skb,
 	}
 	skb_shinfo(skb1)->nr_frags = k;
 
-	skb1->unreadable = skb->unreadable;
+	if (k)
+		skb1->unreadable = skb->unreadable;
+	if (!skb_shinfo(skb)->nr_frags)
+		skb->unreadable = 0;
 }
 
 /**
@@ -4730,6 +4734,8 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 	skb->ip_summed = CHECKSUM_PARTIAL;
 
 	skb_shinfo(tgt)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
+	if (!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
+		skb->unreadable = 0;
 
 	skb_len_add(skb, -shiftlen);
 	skb_len_add(tgt, shiftlen);
-- 
2.56.0.611.g1030f0b940-goog

