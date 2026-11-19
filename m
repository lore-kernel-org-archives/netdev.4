Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072614;
	b=lnKhGDI48gNBdXOcRJoe9GG22dfn5Ml26QZAXmrZfVm86Ql1CAdytwtSjCnIjLj6Oz11
	 fejwWfMiMs8unP3+6IwCVVd5M2OxjBExQPasnr7H0sqvnhyztFHh1T1FDqRCKG64EQq8x
	 iFqWTk6IgefYAJRB6soemwy8gpnh8a63DpOMf3PZlTuYiAbD3bQtpOdmxUzG22JkE4Gez
	 PfIgnzIl8ViNai1KuvzCAlMJDIhbccief7pqExz9P/7PBOtKMHwC/XpKNMtagbMJH15d1
	 XmxGiyd/VjdmZyOuod8+qqtfpyHW3zQPuz4xYW1hG7Rs9g/waHgaMlcM87MF8eiedOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XH0KR5U668j8GkdNpv7amJfmOVvHsijvl9Q4WNbhGpI=;
	b=VpFk8Qq1dmbip5z9habIqcM0dPEjeYnCPlsRVIWwkTi+/RLHcJ7IbxKNqSy5qG8A99V+
	 pdweHVE9btkvLNxV8p+aM5ohplGRCQR1TCIe+uPqal/x1kI3yOXfMHG+c9PY14r+mevqR
	 hEVM5DeVQa0fCBxozAjS6I+d5chkMG9aYdKs5dhy2u+mdori0eWiyZ8ume2tBCEE3V00n
	 VZwIy8zUbcTSn/UpyX3l7GzqbqEOW35jZUPFvJNoVKVtqlEFM9N0IlLaUS7CHfZ/OHWl2
	 LFCFG5+G1IGPHcsbdy+6qLhnXjxgi1FZjlBW2TP1IINvqT0+F5OpHj/KwlqBdATvjrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F4ADlqnE;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA4606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F4ADlqnE
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed1fbae872so23048375ad.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072614; x=1795677414; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XH0KR5U668j8GkdNpv7amJfmOVvHsijvl9Q4WNbhGpI=;
        b=F4ADlqnE9ChsCRqTTxPfwBz9jRS5lUTC3Kg33/yG7ChrbSmY8JOWfoIqYg5jyEAhCY
         PxU5B+BU9AkUr+rG4W61gZZ2EUSDkDZSJDOvnzU87Ojabn7qC/Wx8Tvv1N6BotYJV0SK
         1KoDEw1LderVUge24AiWTfF2/8/3f175XhUAAe6m5wyT7+FBZYwVfxWpHQNw+lK21diq
         bRUTFshkQC9rfA4Osik6WZk2uXoGJ44T5+RKjOXFGGwHaOaUi71uQX+Ks76HUJtooh8u
         nhHbwy4QEudEG7ONu4ptMpcYW+YlQNQjqT1i6GhqIAI1FP8V/te40CVAEEG4hzT6ZCU5
         REsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072614; x=1795677414;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XH0KR5U668j8GkdNpv7amJfmOVvHsijvl9Q4WNbhGpI=;
        b=KKGgmyILjo81eMXj+OIC6A230X0HtMNx8S6Otl8ghP4I+QzSAsCe7cbuqSLmZ9pNPm
         TERwrp1pDRgs29azvvOHEuQm3A6iKEtqkxV9o5UpgudZ1muJk/lshKkv02/a7hzT37P5
         ROoAAaL2e5mhddWoQo/ESUaLpmw8zG8rkdSSwWDq2rCzgcUlWmOwBRVJzHKVrOvx+88n
         tXQHl5DHbm2fq2I8iVXGkxaOMfFRobZBXHBeYc0tpiZLOYqFb6KlFdOYb44j2Rjz2Y2p
         qtQgcwXdY2hkPebzbp85ojOzvl0bVV4hyAM9fk/IGKW3WiuWi9Jr+XHChunxQeLSqs2R
         f9Hg==
X-Forwarded-Encrypted: i=1; AL+hErHw+trMmfdxrPfYVBsh1RmBkhQqvu0KHUdQ9d89kw3A/R5wUobDGv8HRB77Lpp1ggTGmjZfK1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I944GBio1ym9iJx6yzufKE3SujybevJRS3YdG0Ec2gwQA/u2v
	lT0ShuKwSja8pGw+tXHw5zzmgxCIuYPyPERRtiC4H0EBrLqzOM3QhsupPCYSW60asYfEPCNeLTk
	CUFz/Zw==
X-Received: from plbjb7.prod.google.com ([2002:a17:903:2587:b0:2e1:2a71:d15b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:90f:b0:2e9:8202:509c
 with SMTP id d9443c01a7336-2eff70fd303mr54789045ad.7.1795072613602; Wed, 18
 Nov 2026 23:16:53 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:53 +0000
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
Message-ID: <20261119071649.374106-2-kuniyu@google.com>
Subject: [PATCH v3 net-next 1/7] tcp: Refactor the first loop in tcp_collapse().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

tcp_collapse() detects skb to start collapsing from in the
first loop.

If the last skb has SYN or FIN, the condition is tested
again after the loop.

skb_frags_readable() is placed inside and outside of the
loop as well.

If we goto skip_this in both cases, we can remove the second
tests and simply replace end_of_skbs with the inverted loop
condition.

Then, we do not need a test for tcp_collapse_one() too.

Also, skb_frags_readable() should be tested after the fully
overlapping check.

Let's refactor the loop.

Note that previously, when a SYN/FIN skb overlapped with the next
skb, the loop broke with end_of_skbs set to false and the check
after the loop returned without collapsing anything further.
Now such a skb is skipped instead, allowing the following skbs to
be collapsed.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v2: Document SYN/FIN behaviour change
---
 net/ipv4/tcp_input.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d35048c363be..838d4f470c94 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5849,23 +5849,17 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 {
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
-	bool end_of_skbs;
 
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
 	 */
 restart:
-	for (end_of_skbs = true; skb != NULL && skb != tail; skb = n) {
+	for (; skb && skb != tail; skb = n) {
 		n = tcp_skb_next(skb, list);
 
-		if (!skb_frags_readable(skb))
-			goto skip_this;
-
 		/* No new bits? It is possible on ofo queue. */
 		if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
 			skb = tcp_collapse_one(sk, skb, list, root);
-			if (!skb)
-				break;
 			goto restart;
 		}
 
@@ -5874,27 +5868,25 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		 * - bloated or contains data before "start" or
 		 *   overlaps to the next one and mptcp allow collapsing.
 		 */
-		if (!(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) &&
-		    (tcp_win_from_space(sk, skb->truesize) > skb->len ||
-		     before(TCP_SKB_CB(skb)->seq, start))) {
-			end_of_skbs = false;
+		if (!skb_frags_readable(skb) ||
+		    TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN))
+			goto skip_this;
+
+		if (tcp_win_from_space(sk, skb->truesize) > skb->len ||
+		    before(TCP_SKB_CB(skb)->seq, start))
 			break;
-		}
 
 		if (n && n != tail && skb_frags_readable(n) &&
 		    tcp_skb_can_collapse_rx(skb, n) &&
-		    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq) {
-			end_of_skbs = false;
+		    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq)
 			break;
-		}
 
 skip_this:
 		/* Decided to skip this, advance start seq. */
 		start = TCP_SKB_CB(skb)->end_seq;
 	}
-	if (end_of_skbs ||
-	    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) ||
-	    !skb_frags_readable(skb))
+
+	if (!skb || skb == tail)
 		return;
 
 	__skb_queue_head_init(&tmp);
-- 
2.56.1.708.g77570a6a1d-goog

