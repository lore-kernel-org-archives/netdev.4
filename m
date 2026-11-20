Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205661;
	b=2zwHFfQYpeD1c6LFLOZibJ5WKGLM9G0lj0/xTwz5Z5sqomNNhYCujoiAoMn0dVRV+65B
	 F7o3IhPUQ2gpnWYdli+dgXcu6MUiU7icN6vMbcA+2EaAipuUY8r6bnyd9pdKpnhxdSVEG
	 t4Y5oSRx6VHH4YP4N+b2vTtsPWgVjofGH7BAITtch9qzSlKzrPBGw1/G5WlVflc1mIGA5
	 AW1Vko/ke3O/TG0hgEAG0h0k4d5Qt5ZNGhQD3dwTWFmifqzzayHRu1VgRUcxklhJNxkWM
	 nSMSGmWpnymOhky8wdOqamaFJ7YGvEu7cVt0MWFr2RY+KfK29eFrIwg/SLGOIhoumVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NSvJlip/yv6mtxUQ30h6FCDPgrpYgrnOBqf2mcN2qUw=;
	b=kt4yEHnX5XKhlr9keCu5EST7YJYciBGcr0xetAd6QyfZN85ytseYqbiI/caD6/gRz8kA
	 cPQ1e1OnhJ3ogGQCSCxsWzzQ/XwdNv3q/WMmLgbK0ybc6oA/wvONvGjsd3R2JeLa/fXph
	 cjERX0fHXlJ4asLsJTVeqGppxZQRXFNhQeTzFfuAkuuRKko9YvjrlPC0MmZ0zKMa6zHXb
	 Zcm1uMZZtGvJhjTznN/5IHfWOLFKyXnzeO/aHBWQ8lFrceiYVujbkC+hUdHiINSmLI8mG
	 +HdWbBoGi0W5fDrwqtkSE9E4oSRX1nUuyv8Dkm5MVnO8teoOlRHRPamh+dDyHLiL95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Voui0P3o;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9846606A6D7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9846606A6D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Voui0P3o
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3821eb27024so2100447eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205651; x=1795810451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSvJlip/yv6mtxUQ30h6FCDPgrpYgrnOBqf2mcN2qUw=;
        b=Voui0P3oKqWSRXab62BuzpmFDz/ysoqpgc7U3y/O6yK8IxxLbqZCSk/DAYx6fYQyTV
         Kamqv/5v5mD6dQcVnF60H8Cz7/14TMEf9pGoYG1Z9EbhP7YAsmbQ6leY8aRkku4vxDYi
         aAF1YEvFVD5gO7RuClIFGiZZsOge7Xcf8TJN9OmlU+NqfnvdCLvZYufzp/MyBT//DQDu
         /fhLGgSNAr9UCN06R1C6rjw8dD7pkZ5ug9JwaykFOZClquTEfyNHlFBs4XS1g5mNxOVI
         nEJ8lMw8b8CC7j9ycw6Ypa0408S81S1XEyrihwH8tcNcfwUBfbbxiYa7O7Zx4MU4YJOt
         Zzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205651; x=1795810451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSvJlip/yv6mtxUQ30h6FCDPgrpYgrnOBqf2mcN2qUw=;
        b=ynCisdPr+8Hr1LefVz2M3XtDLpR/Udl6WpQ7aU5l655FjB8bXUj6KIHgyZC4LXx94w
         Yxyf+R4plqyR5uswxV7LFaik0ePzwm4MQT4rFRA55PyCHnIVM7q7j1uIfMgZqZY39IPn
         eqoEE7XMSFVp5VUoPpYroJBP9wdHcJpE7JBi/DDpaJRRgSMGxEa3zt8C8CDk+H/VkSZG
         4Euwl1bodbQ/BrnDwDDKkwE0t5JXGyyQWG38+2Yz0v9nIjAcjNKdQ25hjPVsfddYGO/J
         Nu5gh/1bffJiEsiVcln6iJQX0AytQ/V85+hoDpIA3L/8p8APVeWbCKss2mS67+3PZvzD
         SBFw==
X-Gm-Message-State: APuU4Z+gx2ZxY0A2j7fJwRZvL/+62shxxr5b1qDbuALlkDIaZfBDvmE1
	eVwdu3EE3bziuJ57+X+Z53SPp5evZwTpP95aAQZK0vpbbT9oInHDrcvL9SeNK/rqrpS4Ngkockw
	D3S2imQF1BgJMBhvdKQtI7VRlcAIPbTJ9iNwSjSAb8gPdPDRcEIjl8t3Y/6mHynS5iNN+vIaF7F
	x6W/DGtLJGnhPmrzRABFMT4KvgPjtOIjKgAD5vV4SWQjuMibuOdE/Y53+HWA9MvDU=
X-Received: from dyz3.prod.google.com ([2002:a05:693c:4083:b0:359:72f9:2aab])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:e9cb:20b0:376:7d39:33a0 with SMTP id 5a478bee46e88-38570f22ae5mr4096459eec.26.1795205650512;
 Fri, 20 Nov 2026 12:14:10 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:02 +0000
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-2-almasrymina@google.com>
Subject: [PATCH net-next v6 1/7] net: fix skb->unreadable propagation in
 skb_split() and skb_shift()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
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
Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/skbuff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1c921383aed9..aac61fbe419f 100644
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
2.56.1.750.gf70dc682cf-goog

