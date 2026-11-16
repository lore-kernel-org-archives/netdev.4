Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870364;
	b=p4pHAyBpBECrRZlvh//4Tnjd57xBtvjGF/3Hfk+krmUScuM0hGscPANSuaz+jhTOK8ZT
	 UNTw4IXDxam9qABvjVuoOzWAgGpUbQPC5lkD9/ZWGxxhb72tLNCLTDzD4vt+jv39xdqlM
	 3KH3pFKbEjWz5bOxFpTGkoPANbc/AQiTzLMNgetccIe5Qkp4BS2gkh93+AHFZ3OME13zQ
	 8yblEosKTT5M3SxynWMVp5MnOcKKSHHKzs2v4cCe7NpmMZinctv4dQvE0GHiJtiUzMvfq
	 8SKtJzxmoeIlcgkPOl7TZlE4wMMNpRfo3ZBWvgeAA/aD5W0JxfkwNOdgUWbKyaYWwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+1bUuETZhuGuotXrQFC7vVEwK6wl12zrg9sjS68gw/E=;
	b=M0YODMvEoYkTxW3N/agXEqj4g86e9L5Co/Xqj8GkaJmxgYMWa8KizcUzkus66Vyjx8xb
	 SCD8dX07PRLK1UIcazNMqC9kiFVvGhNHHYC1ocs++b4Sjk6aM6zWBcCuDZQs3b7eSnUJG
	 mDM3awMIS8M2OuGts833CvaNKSnkusKOWM2vMJ+a7EchtKUjd2nvXYFilIn+4SfIuEbIX
	 dc+CDYnk5IibLKW19sc2VWIjgJ/itFa9rCwUU1cylZjWRqaXRxZ5GIPObxjxZIGzAfKD4
	 Xjpd2WYN++UB43JKLAja/AzSWOH3YGA7f3qu7l3XVumshrtVbAYkIP8xyA0sS8jEkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIMjTwot;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92649606A33E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92649606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIMjTwot
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3202567a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870363; x=1795475163; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1bUuETZhuGuotXrQFC7vVEwK6wl12zrg9sjS68gw/E=;
        b=TIMjTwotkH1ZbYBdbvO2GvKn25yGYq7/Q9XMYSeiiGYHxFw6RyZhgpZEJiF9otNB/O
         hyBrhHVLXieJBSquHXuThGffmocs6ylMZui7S/D9RrAfxCDtL0sr5eFivB6LvUUyZf03
         zB/LQsERbpq8lnFadyzOSQa4NF7gB6c1w/nImfAGbf70GpNG30AAMaj4yLVkaaSKq43t
         tMUqGMKgppoamJDXZy2OjKUBoAsEhnZ82a9Mm+JJVFS2vvndofy0uIjKekPeVlR4dvWt
         mzF7QRyhd4gx2Y+bcx+iKQC/BoRNtvNQpfgw+Z+gkiQLUON7Isg97y4CBpJ7zTydrkmJ
         HHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870363; x=1795475163;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1bUuETZhuGuotXrQFC7vVEwK6wl12zrg9sjS68gw/E=;
        b=ciEKLipCIoNwnYVbAr5u5z06OfOORCrxFFqfMJxwn4iBk5OyzG0/S3f2j1736AgjCl
         AHPcWMegUgyB2DalDBELn113zH6flwHaW70f46pYOwicUQcHqc0ogr4BaBLsJgG4vdET
         pKqX7/4cELJgJW/fm2AYjjDtysIjtwuHM4CYRgLgCr9jIuo7b+rbELgsG7eFDa+2P8X9
         KNZ05TZ3mm2zD0D0Vl3ScBSuS/drPZ+sC9tOEOdzKlU2SO8fWFlegYFw/rKeI3fBSaEC
         F7s//YAj2V8urTqZALNiNUbjqEFrIa6yFt06fx6GH7LQuR5p/SFRSqbklT42eoNP6FpV
         FWVw==
X-Forwarded-Encrypted: i=1; AL+hErH4Qs+oUt0hPfUfmKBc/aRoqI+BhAKgkoryAkY4oha78SJ4YHvvrFS8qT4n3xA/bwNNM0ZMwj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IGhiVTJZdG7BSquUQ58XBvrdpb1pVqvloLA1l3AmOkNq9slQf
	zGRajECOsjGQtdPA1xsYROoQwkgatFtC8iEb625vf1P7RIeN1RbqtC9j2k7gp2YvWJ4oGAUSD3l
	WZ7PmHw==
X-Received: from pjpf15.prod.google.com ([2002:a17:90a:9b0f:b0:3ae:c243:313b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528c:b0:3ac:8897:7baa
 with SMTP id 98e67ed59e1d1-3b1b0a5030emr9587501a91.40.1794870362595; Mon, 16
 Nov 2026 15:06:02 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:30 +0000
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
Message-ID: <20261116230555.2305867-7-kuniyu@google.com>
Subject: [PATCH v2 net-next 6/7] tcp: Batch memory accounting in tcp_collapse().
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
 net/ipv4/tcp_input.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index ca4cdb93373d..713dcabd88b4 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5822,6 +5822,24 @@ static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
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
@@ -5857,6 +5875,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	int remainder, nskbs;
 	struct sk_buff *nskb;
 	u8 scaling_ratio;
+	int released = 0;
 	u32 sub_end;
 
 	scaling_ratio = min(tcp_sk(sk)->scaling_ratio,
@@ -5874,6 +5893,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 		/* No new bits? It is possible on ofo queue. */
 		if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
+			released += tcp_collapse_uncharge(skb);
 			skb = tcp_collapse_one(sk, skb, list, root);
 			goto restart;
 		}
@@ -5959,11 +5979,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
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
@@ -5987,6 +6004,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 				start += size;
 			}
 			if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
+				released += tcp_collapse_uncharge(skb);
 				skb = tcp_collapse_one(sk, skb, list, root);
 			}
 		}
@@ -5998,6 +6016,12 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
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
2.56.0.679.gc527c65306-goog

