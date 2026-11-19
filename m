Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072618;
	b=2kbDhFogeEaom9ILUGw+CRsX6vynaEnN++KthDkzvW4vRcRulMsewidz7dsdJkrN6mo1
	 JWhrgX/mjjf4Vceq0pe65tsOGknvsUmEiSscmDV4o5m/oYylzrcz7FVBoA4MdrZAiA7Mu
	 +rGE/P9n9f/yS7oXXK8p8bcL5+N8+Snslcd+ZxLP9kNx6+sFYybem/NZVJrk496GTcfAv
	 fDC4c61CzrNPLTfmMngbswfXTmKsUc88swYJ5wdGxuCEaOTQOjIjwmYDsFj6mjqaGoQ/U
	 rDC7900RnvnUj08rryWxTDXlRBTD6yroWacLbME/9WuEOcZu6DQSnTDoUVUDIUow5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CMnj+t+BttJGwsYDnQr6glYXkdhn5BK2wJJ0r6rAzhA=;
	b=4YsagGijyElBS7rr6dkvVSATNfFMe010N4dvn+AOaXvcW0m9p+sX7S9eJb6EgZCCfZok
	 9OwXLvcY7eQ8DzpwwA6XB+rZ3+qr/MIojuOi5JmnnM94SsESsD0k+5tG+fJvjE1fxl8+s
	 nM8UZeB+wYhTxByit1ZQRRPXItjENdVPI+yp0Vdm5MwqzBBkSonLYkxG9KFypQ7ZkJth1
	 vKgOroRsFb5YeIpWr9ulSwyIvUfIufhJ+DaFfYFHwE+ex0ipfeD/V07BaOmr+RFia41J7
	 3TWrlJjRv5xWFeUrhv0vnbt6g1Xd39ALy/aha/+3hc7RlRPgKXCwH6lHY2AQelFR/wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NT2eviJW;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068660A2620
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4068660A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NT2eviJW
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe2a88b7cso11182175ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072618; x=1795677418; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMnj+t+BttJGwsYDnQr6glYXkdhn5BK2wJJ0r6rAzhA=;
        b=NT2eviJWNYFlNRIEU9saOpkK+mBFGZQ8yb6KgbB2cs341C5J4CmngE30dyWArxGrJh
         uJwsb+zm6xUW97B9HbcYIyEGIJ72yEOyeyUBya8H4nabBnwZuqBZmUD1GZWGykzOuSgi
         GJQ5fwZ4qVqnnfBbHgf0xChrY8VKtPCsGEbkc1Czz4g6dk7yzSzrTDUf2yjYNELUGq+n
         l95wzAFQivzE9VR/ECJAHvACkmwP+RTW6ECgNqwd918i4U0F6d4TS+gvq7QsgJfysj74
         bDCHnogYsGH7jBmt/1T0OsvpOxap0KGDJluBT+viztOgsoFhNbcIN2Ppb4wcOMHmGhjZ
         s1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072618; x=1795677418;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMnj+t+BttJGwsYDnQr6glYXkdhn5BK2wJJ0r6rAzhA=;
        b=T8yJ2nuNGTywh1oNBu7PDD0w8xBHpkXFJeOSivB0kDARpit+Pcrotxc5hkXCEiQKy/
         AIgMN+aLh0TB9o0EqL0LseLM5RCuZ4oTYUc8+LUWq4+bqCkYqYkbTXk6VA9RYywfTIgk
         1cb24c0GlCjYxrn3P4ayHzI050xkcn4TxIu86xgbu3NhiIut/PYkUSe3664rJjjT80OI
         6bcC3RJIwVXMM5gAYTEDbSLbqfy0vJYoiVifAmu9MOu5dUflt0eW/lfC/lLGWWvrsGvB
         MqtC6GsTlsc5HHS2blcUanhOU7pmAfyFhJKOpJV7KFPxM6UqbPIIVdvI7r4ItR0ZBgfq
         e9cA==
X-Forwarded-Encrypted: i=1; AL+hErFtwH5p02Et/YxVcSufOc1+zZqfpFs36NpKYmnm/euebJXBLo/OWdJ5U59MapHZ2GxTXp3Vh14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ddws72h184kCn3Awyf8o6+wDL98q4JmzpTTGJ/gy2IXbGzQVx
	9fz3zEK4HD2px9cb06CLQV9yjBL4oQLydaTkYu21STZQMPVPG9JERNXct5nny/6Ya+S9TMxrtnS
	o1terMA==
X-Received: from pldb12.prod.google.com ([2002:a17:902:ed0c:b0:2ef:deb6:1cc5])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8a:b0:2e9:9b5b:e179
 with SMTP id d9443c01a7336-2eff7545dcdmr54697525ad.50.1795072617476; Wed, 18
 Nov 2026 23:16:57 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:58 +0000
In-Reply-To: <20261119071649.374106-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119071649.374106-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119071649.374106-7-kuniyu@google.com>
Subject: [PATCH v3 net-next 6/7] tcp: Batch memory accounting in tcp_collapse().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Once tcp_collapse_one() calls sock_rfree(), skb->truesize is
reclaimed to sk->sk_forward_alloc by sk_mem_uncharge().

However, sk_mem_uncharge() rounds down sk->sk_forward_alloc
immediately once it reaches 4K since commit 4890b686f408 ("net:
keep sk->sk_forward_alloc as small as possible").

This unnecessarily reclaims memory for newly allocated skbs,
and the following skb_set_owner_r() for them underflows
sk->sk_forward_alloc without sk_forced_mem_schedule().

Let's cache the delta during tcp_collapse() and batch accounting
at the end.

Then, we no longer need sk_forced_mem_schedule(), and instead
DEBUG_NET_WARN_ON_ONCE() is added to catch a future issue.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_input.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 990e34896373..ec47c75f9598 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5836,6 +5836,24 @@ static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
 	return __tcp_win_from_space(scaling_ratio, skb->truesize) > unread;
 }
 
+static int tcp_collapse_uncharge(struct sk_buff *skb)
+{
+	DEBUG_NET_WARN_ON_ONCE(skb->destructor != sock_rfree);
+
+	skb->sk = NULL;
+	skb->destructor = NULL;
+
+	return skb->truesize;
+}
+
+static int tcp_collapse_charge(struct sk_buff *skb, struct sock *sk)
+{
+	skb->sk = sk;
+	skb->destructor = sock_rfree;
+
+	return -skb->truesize;
+}
+
 static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
 					struct sk_buff_head *list,
 					struct rb_root *root)
@@ -5871,6 +5889,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	int remainder, nskbs;
 	struct sk_buff *nskb;
 	u8 scaling_ratio;
+	int released = 0;
 	u32 sub_end;
 
 	scaling_ratio = min(tcp_sk(sk)->scaling_ratio,
@@ -5888,6 +5907,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 		/* No new bits? It is possible on ofo queue. */
 		if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
+			released += tcp_collapse_uncharge(skb);
 			skb = tcp_collapse_one(sk, skb, list, root);
 			goto restart;
 		}
@@ -5917,6 +5937,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		bool overlap;
 
 		if (!after(TCP_SKB_CB(n)->end_seq, sub_end)) {
+			released += tcp_collapse_uncharge(n);
 			n = tcp_collapse_one(sk, n, list, root);
 			continue;
 		}
@@ -5983,11 +6004,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			__skb_queue_before(list, skb, nskb);
 		else
 			__skb_queue_tail(&tmp, nskb); /* defer rbtree insertion */
-		/* nskb is charged before the skbs it replaces are freed.
-		 * Make sure sk->sk_forward_alloc can not become negative.
-		 */
-		sk_forced_mem_schedule(sk, nskb->truesize);
-		skb_set_owner_r(nskb, sk);
+
+		released += tcp_collapse_charge(nskb, sk);
 		mptcp_skb_ext_move(nskb, skb);
 
 		/* Copy data, releasing collapsed skbs. */
@@ -6011,6 +6029,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 				start += size;
 			}
 			if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
+				released += tcp_collapse_uncharge(skb);
 				skb = tcp_collapse_one(sk, skb, list, root);
 			}
 		}
@@ -6026,6 +6045,12 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		tcp_rbtree_insert(root, skb);
 
 	__skb_queue_purge_reason(&pool, SKB_CONSUMED);
+
+	if (released) {
+		DEBUG_NET_WARN_ON_ONCE(released < 0);
+		atomic_sub(released, &sk->sk_rmem_alloc);
+		sk_mem_uncharge(sk, released);
+	}
 }
 
 /* Collapse ofo queue. Algorithm: select contiguous sequence of skbs
-- 
2.56.1.708.g77570a6a1d-goog

