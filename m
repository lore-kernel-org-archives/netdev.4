Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870360;
	b=JlTK8wnD8ScRN9EtqpX1WbL++ahyPnjKS5e+USdExMuJpH6EHvr6ynYibYDXb+5uC/Iu
	 TVZevdfsV7NwvTgRrA9G1WMF/+tlS0TaEP4FaNoNrH9QTONJbDRYngWWkLAZuKi4twc+P
	 aB1IYVrsU7gDEqu+0fzjcGyX2hABcY2YLB2Vw+PgQV8g8ooHR9MPjPWEOEVzyCT64LJE4
	 sVTQ/m5GZnaUs2GYYTh+VUrgUt6ow3T4OF0Aq0gwzBwRV74hqY1kpZg8l5AW+Vl62AoNA
	 uqZU6/9r0FdQrCtz4qJHinpmmV3n/CRJzR6qV/JIPwG2NLMKMuPKD7rtKiGqoJSkMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=82kaqSP7iEmpNxWJnQWMoEafhsr/yOtqX12R6w+tpRU=;
	b=JxagQKZmuHy9Q53kNDm9Ng1JeIDJdY9ZKKE9Ag64U5XRe+COMZBxyZ1Kt4iozBtfNKOV
	 hbqI7zmhbQrOCJQN0oHKL3AhFAgrGv43SL69gokVgBuW9XT45kgzs310/IFR3F8jGCrhV
	 rRKpCwkEQMC0Hh78Q09wTQW2P4jNMiEEByaBts1w/PN7yWe0M5BYx/3ZwIaJrCJRgQ4KV
	 Osk6iChv1Q+B9KL3HUc51OHiW7ksg/LaZuRfU+6PXjelt1wocNcyVKqXqwSarp2gufZ3a
	 +0g3EuLmCsRwe2SwqB3KfbFGnwRXOhS4TP6ovZm6yPECP8q35sKcSbGdWgbfakhplZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VsZguPg8;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3A606A339
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B3A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VsZguPg8
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so620212a91.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870359; x=1795475159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82kaqSP7iEmpNxWJnQWMoEafhsr/yOtqX12R6w+tpRU=;
        b=VsZguPg87tuR/YaCoQiudfYdkuF/LWemUKnz6ge/mtYzV2KvOYUrV5OFTL6Is3v8Vg
         c0EIDGCadYRyXcCWUmcXAK8REUWb44MX+wBiKCVrp6CEWZ1uvV1m58HVCtBqkcvzQzbR
         w0qNuIDztFfMVlqYxPbBbLk44gdvTALgBKU5AwwzUqnKtH4IcCS/PyP8kc/1FQyI2h97
         OlAAfB0Fjnh3wg0chf8YvrLJAREQyx8kzCju9y2F7BlUejkWd6gW2NywfN42D+cBlIaw
         +uyL8+kkRn1GQm7pDoCyyLHJA15fnmaLDCp6dlYx5TEn7RgdEto56LkMW++Sfzb8Q5HE
         hQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870359; x=1795475159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82kaqSP7iEmpNxWJnQWMoEafhsr/yOtqX12R6w+tpRU=;
        b=BYdgDQdPl7cue2N+S3nVHVtKhVzAnlRke4T2fvO4DzfY1aQbFuuVO5vAungKJQXTzY
         jUfc2RroFRCsOiA7yOr1TDQkUegv+68MQCAoSyd5Ny9Xi/NHG/Ni8jvuwgEDcWrMMFjj
         XZ6oFxED8KnO95FZdLpzk0/r/Uxwwbf+Kfzl/PM2pjKaKxzhDFnNrAhZ8F2wTzjVuuYH
         X6WN4wLx5vglD0KTJEZWI7n4AWd37A6/6p1UPbJTw0cgQ4s7smOJWNpUy7MqX5CSrE9V
         ZyHy2GGlDFQcJrV9Gk+lt2/z4ADkrgafOokdgm72LHpRsuR9Cnsr/cFTq9nsVcBpa3pi
         cSyw==
X-Forwarded-Encrypted: i=1; AL+hErG6pWlRdte0muWN/oHC38YnXMibiG5vWobQZfV3YKsa/xV8mauhccV4IVkC6Ikmym5tv9Eb5Ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lmam/8XZFE5dEIhyg2hja6HA4qlnrBWedPY+Z3gAYYB41w+h/
	nlmrwVnyacgFTw1jw2DqIFkCb6HhSYqI0S1e86WA0Huwfip3OvUJyV5asf38O/7bOHnDTyBlyd2
	yXlnNUg==
X-Received: from pjyd15.prod.google.com ([2002:a17:90a:dfcf:b0:3ad:ce09:ff3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5608:b0:3ac:c024:b275
 with SMTP id 98e67ed59e1d1-3b1b089e262mr12037995a91.9.1794870359342; Mon, 16
 Nov 2026 15:05:59 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:26 +0000
In-Reply-To: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116230555.2305867-3-kuniyu@google.com>
Subject: [PATCH v2 net-next 2/7] tcp: Don't collapse high density skb.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

tcp_collapse() starts collapsing skb to a new skb if either
of the following is true:

  1. skb is less dense compared to tp->scaling_ratio
  2. skb has read data before @start

However, this could make situation worse.

The new skb size is SKB_TRUESIZE(SKB_MAX_ORDER(0, 0)) at most,
and with PAGE_SIZE being 4K, its scaling_ratio is 222 (86%).

If 4K-MSS GRO skb updates tp->scaling_ratio, it can be larger
than 222.

Then, even the newly collapsed skb could be detected as bloated
by the next tcp_collapse().

Also, even when only a few bytes are read from GRO skb, it is
collapsed by the 2nd rule, making less-efficient skb.

Let's cap tp->scaling_ratio with the collapsed skb's maximum
scaling_ratio and use unread bytes for bloat detection.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_input.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 32e63d089db8..e07f43347409 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5808,6 +5808,19 @@ static struct sk_buff *tcp_skb_next(struct sk_buff *skb, struct sk_buff_head *li
 	return skb_rb_next(skb);
 }
 
+#define TCP_COLLAPSE_MAX_SIZE	SKB_MAX_ORDER(0, 0)
+#define TCP_COLLAPSE_SCALING_RATIO				\
+	((TCP_COLLAPSE_MAX_SIZE << TCP_RMEM_TO_WIN_SCALE) /	\
+	 (SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE)))
+
+static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
+				     u32 start, u8 scaling_ratio)
+{
+	int unread = TCP_SKB_CB(skb)->end_seq - start;
+
+	return __tcp_win_from_space(scaling_ratio, skb->truesize) > unread;
+}
+
 static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
 					struct sk_buff_head *list,
 					struct rb_root *root)
@@ -5839,6 +5852,10 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 {
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
+	u8 scaling_ratio;
+
+	scaling_ratio = min(tcp_sk(sk)->scaling_ratio,
+			    TCP_COLLAPSE_SCALING_RATIO);
 
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
@@ -5855,15 +5872,14 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 		/* The first skb to collapse is:
 		 * - not SYN/FIN and
-		 * - bloated or contains data before "start" or
+		 * - the unread portion starting from "start" is bloated, or
 		 *   overlaps to the next one and mptcp allow collapsing.
 		 */
 		if (!skb_frags_readable(skb) ||
 		    TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN))
 			goto skip_this;
 
-		if (tcp_win_from_space(sk, skb->truesize) > skb->len ||
-		    before(TCP_SKB_CB(skb)->seq, start))
+		if (tcp_collapse_skb_bloated(skb, start, scaling_ratio))
 			break;
 
 		if (n && n != tail && skb_frags_readable(n) &&
@@ -5882,7 +5898,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	__skb_queue_head_init(&tmp);
 
 	while (before(start, end)) {
-		int copy = min_t(int, SKB_MAX_ORDER(0, 0), end - start);
+		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, end - start);
 		struct sk_buff *nskb;
 
 		nskb = alloc_skb(copy, GFP_ATOMIC);
-- 
2.56.0.679.gc527c65306-goog

