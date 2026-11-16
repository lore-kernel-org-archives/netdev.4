Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870359;
	b=HOjkTa1XbI5grZaYH2lSt2v1ZKnAt2fdYoaWcNTfrdoQ9hOYnsZc6wc+UDU/2GGLNhMc
	 dhyaCMis2LnQk8GgMdVHdbdrP71qRWoPql3BRI5OfdUkYzkEB4XJDoo8+Qj01TM7mqzKJ
	 F3W3xH92utA+IO1/TFxqwVQFU6vkUJGuSAmQpB3AWi0cwDsbFBSzSqMRQ1Gq40vhg5n7H
	 hwNXB+hPScY6fDigPMbWSqWia+L8cj7NN3a8TcXfqq6/NwWpUkt6cuapQIyBkMFRcbP9Y
	 GqYX8AKO0HfpB6PCyZn2y9N/tWJsZsn3HJimiFQHcf82k/JcpPC5eYan7izcOKGqn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kEaEXO/J1xQxeEQZwu8ZzIT12eLGw74qjW2MKVja9P0=;
	b=wewBUiSugNqFMkvVj1rL0XsVNvLdzypTjaOuiwXN1Dw6852GvYZSrjAJ0S1IG8YQUXlR
	 WQ5jPIbmv6t6aIju5sOMDV3+WNRmV2PvXA265U9mFBtkRrMF1snc7p3P05BoxLrBXmyt2
	 kKcQUS1HteZ0324xNyRCgg8EUBBHOowVN2ZCzelCpXDrC/sueGzpqEvyAwN4WLm53vDPx
	 Yy3d+3OSei7CBjekkQjqqFHvEvoD9b8C9EnADgh6RVJXayWysDELoc979HDKvvH3wyJqu
	 Eq9WfO3Mo92vNPbrEBEStFQ+r01tpJPnDKd3VrsyPKLfNKT5/Fe94JXV8ngr2+pUBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jN2/2C+R";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70773606A330
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70773606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jN2/2C+R
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso29708925ad.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870359; x=1795475159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEaEXO/J1xQxeEQZwu8ZzIT12eLGw74qjW2MKVja9P0=;
        b=jN2/2C+RsY0dusEWUKp6o/f0KBH7WBXxD04PkM9eeBeOY9rJ7ZjT/NDtS+RVUJ9EXd
         9fAsrHXYCwMBfkiIwOQy+Q/dEso7dKCLQ9dhxUfZ9xLNgH+Gc6ivfuGA0u8QeBLz/50i
         y3q7wq4KgDPBIhLGYosIL5yffFgMRy+F/eE4z8kWkW9irI6i2xKrMBTelRMI6CvEVcwK
         O1dY1+7WuVFFJ2MNE0jB5xH88ROXJYqOKb4hqM3YDl4XlQNVTxmD3LfqgalmoF/ybB3j
         I/zBBiHorPy64gvfgz8F51kcaz2oZmBjmz+k55fuJunBWXk8qsjF+Q8stiICZ5WEmGuf
         F6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870359; x=1795475159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEaEXO/J1xQxeEQZwu8ZzIT12eLGw74qjW2MKVja9P0=;
        b=Dqy2cOlHyh1Ar6OS3JEouDWSx7xVl3xqspDgQjJdQqriCZqws7F9mRvRGAczGZdmVn
         u9XvFbt5I3QIC8oymi4w9990Rz+DhP8baMFKbD3zMYH9rQYOgweYfiTySOaQcT4bW1XD
         C1EgaDaXwPWvgJfEmuLYeU4NmQR+9EueUHvim3YEP6+7tDpRrjNs/sJ2SMsO5GWFGE3x
         DCy/T7FJZiG84BDGoKkKST5Ptilbp/2egSdTyjqciRyLzT8eNsXQqPIdy8xj1esgi5Mu
         e2C8K4Itn3GSIGKgR/1XAHuNeu7hHQ2l67+ZFdSe8r9eSsUyPITXm9a8HEz9w543qezw
         Lp5g==
X-Forwarded-Encrypted: i=1; AL+hErEaE8SzsQCyVGhhlqhrDqgf5Ia25Iotfuxj6BRosrbe6wFsRqdDUIr7T3kcj0yaESgGKGmbcWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TEdEIXrgCyv56h+Ryi2/PF7+7IwbtPk3oDeoIYYGOXGUyxZwv
	xmlXqC7Z0hnORzvbyaK/S+CM7XYDDuB1p0CiQz08kbU/tziL307yJQKvXk4xVCnj4Cjv/KMSrw9
	lLwtRlg==
X-Received: from plpw11.prod.google.com ([2002:a17:902:9a8b:b0:2e8:bfd5:b889])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc47:b0:2ed:3eeb:b0db
 with SMTP id d9443c01a7336-2ee0de10ab1mr113092835ad.17.1794870358515; Mon, 16
 Nov 2026 15:05:58 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:25 +0000
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
Message-ID: <20261116230555.2305867-2-kuniyu@google.com>
Subject: [PATCH v2 net-next 1/7] tcp: Refactor the first loop in tcp_collapse().
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
index a2074a1af422..32e63d089db8 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5839,23 +5839,17 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
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
 
@@ -5864,27 +5858,25 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
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
2.56.0.679.gc527c65306-goog

