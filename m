Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072615;
	b=zhcoa3Z1cqLh9KYgjxGWmvXh+TDt0ICdG8DcvwFV22c1I0dcpxZRPLqsdswpP8KVxvNx
	 aqYBXYfH8+9+jc7VrxB2HCsx8gHpxTrfSWTTrO8TXC9l3ysEV+QbG7DUGMIlJHb/Vp2jm
	 lY7Bc0/I/rZQl1BhJ/WJJjkQOuxvtjoK3geoCTNX0n7sB9Bjn1luQIIE3Hef+c/6joB0G
	 hibNckkXDr8LmX+LPgWUeMOP4yWSqd6PZeshudn+HNy8fE/KlVEuXhkX3kQuC6uYL7IGB
	 drUTIrpwa8oOrEoqBb4AK2hVoF1gsFlJUK6SJttLor7YLk9EksYXFR1tcMn6oXSKxww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BfV4B5f0ZbbZlYUsnZWOcvGjN7T23ipEhB0dVBboxDg=;
	b=FP/v+e4OgYsfokdpxn4sdscS/pR+AsAbahAb1xiPVCOXRJvq7cLfqbTdODrVWT7KOve5
	 6O3XOWsFssM8OCvurXjo53vtpC43phxTRT7DMTsQ2f1qNNCJQjWJ6KNuG+7Lr9KqXTkUZ
	 dLpriFzNOZOFz5UT/0ywt7/sGXCFenZENfdCpgacmWviE4GpW6gNRweXcq4hhOwctYTD5
	 2wq31xUSi9zxZwixLXDTUNuNCW5sJmDVp+Q0mfiuWNHFd8B7Q4lJahdBapAoMLpf1lVaw
	 nEcqstghdLkZFKbugY+YBk4Q7WPxsDuFgZGrPolflRRTQyEgBXBomLyKD/raUY2XB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPNjcfuN;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E76606A334
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E76606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPNjcfuN
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eced5a4cb9so18379315ad.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072614; x=1795677414; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfV4B5f0ZbbZlYUsnZWOcvGjN7T23ipEhB0dVBboxDg=;
        b=FPNjcfuNai2ONjK0/fWigfb5YdG5mUVffO1BagijGd6XK4w16qo+n/9FYDmH0eS1r3
         l1eulbKNLi+aRubLY8BrqoE/YGxoNpKG4cEx3lK1TC4xiSGhWhwHMebshVM8CMpfpngX
         MNKl0K7zj2lzwErQOHS+YfVByFoG284DAAm8PSv+UuHsAaOrQ2DHW9KhIqmLTleZnSEk
         lbBhStxqj6l4fjPwR5WbSebC4h3CpvBI8DTe9L/6y89T5Bs5XIS7QqSsvUkSPjz5IPJB
         WqsmyRnRldeJyucK1/XjnGNH6Oc0LsVWtbUP5UFUgblXGrB+py4Wogxp7ZxB7bDY5IC0
         RfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072614; x=1795677414;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfV4B5f0ZbbZlYUsnZWOcvGjN7T23ipEhB0dVBboxDg=;
        b=EMdimLhBw3/o+5KN3lP1PSwPKih25U3xudfr2DpbZ9vRyjE4XDmGLfEAdKzO9opezD
         gEeoWS2Dq4/FfMFdp4MMaWy6+5DAZjLaMKIwgMqlREG2+fLqPJ2pxZGCloELfVou8Ci8
         g8AtS6MkUUioWeiMMe0kqeeRKHEQ46/o4v0FzNjtPJf3G3Na0qwdaRKlPx7KOYBHHxrI
         izSaBPhvq3vbey5XPq0P384VuZfW0kFXawAVgP8+C3RYjpdWo/KlPM5PrsVOft2BPA2I
         LYwGWPcxpnrwEFCk/hhOcgPJtYbJsBPOtfXKK1AaVZUdZ1rYEiDcv2BRtxAWAe5g9C4T
         +RwQ==
X-Forwarded-Encrypted: i=1; AL+hErGru+4tqwx0v/5drXIvGDNupm7dUiRPw5FXoWwXVt66y8BRgCzJDT/JatZNfLBlRhCXsGIWhqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+m5KPn+KRQrMSz2akvSdPiilw1Pu9Np9vubGmtkSL+HYzqVZe
	57tSHeO9jhqfPyRMys27uIhxhpgGZEZ7qZtcZ04MTjiXAnATCjOAjPgid2CGo8cDowEUpI+zUOc
	kGy83wg==
X-Received: from pldb21.prod.google.com ([2002:a17:902:ed15:b0:2eb:3675:626c])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ace:b0:2f0:2aca:6795
 with SMTP id d9443c01a7336-2f02aca68f8mr8991735ad.18.1795072614384; Wed, 18
 Nov 2026 23:16:54 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:54 +0000
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
Message-ID: <20261119071649.374106-3-kuniyu@google.com>
Subject: [PATCH v3 net-next 2/7] tcp: Don't collapse high density skb.
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
index 838d4f470c94..b4e3d623c4a2 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5818,6 +5818,19 @@ static struct sk_buff *tcp_skb_next(struct sk_buff *skb, struct sk_buff_head *li
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
@@ -5849,6 +5862,10 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 {
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
+	u8 scaling_ratio;
+
+	scaling_ratio = min(tcp_sk(sk)->scaling_ratio,
+			    TCP_COLLAPSE_SCALING_RATIO);
 
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
@@ -5865,15 +5882,14 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
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
@@ -5892,7 +5908,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	__skb_queue_head_init(&tmp);
 
 	while (before(start, end)) {
-		int copy = min_t(int, SKB_MAX_ORDER(0, 0), end - start);
+		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, end - start);
 		struct sk_buff *nskb;
 
 		nskb = alloc_skb(copy, GFP_ATOMIC);
-- 
2.56.1.708.g77570a6a1d-goog

