Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681532;
	b=U5mkEwcWA3nqfZr0cYFLJJsgVGxVPZMzjgdJ7r9sGkanz8DUg7iDa9HegEQ10aTC24OE
	 SS4C0qORqFqLdGUDAUpGXR++14RrznMb96Ks42dcXTmndsLZb7QqqQYHQURIicqf7Y9zB
	 ThJtnmgxIb3eU7f3Jkwb/+9UtUf4A0zW4mLZwV0JkkVO/SUk6myCpO6RvpifH1Fo6dicG
	 xjOS8KdrpY3yzOPpqEKKHFOl8SQuOkXDjAJ0HcGvV1arjCJbZebNYwVmtnikRXbyFNcyl
	 XW0aZw3eroRGzab+f4tjBxcm1Ci2Rq9dS3+Ya0n9hc3iL1IaAXcL5f6YdKRGVdY7sXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k/bylzWKznwTVF6pPmD6PbGpKb3ObNIRSAfKOe+kT50=;
	b=fJ7tidMvihWgBImp3+uFMtGgqOpw98xK88C6j/iTcoMw20AcNHG/tY52D6zPaYydDRgU
	 Z5q00cKjz8vvsxucqWd/MEanz8ecyRKKKKxAGbEQnr70GPTiJ8dgOie8zlQqojhsCqyd3
	 4iJwo7iep2u9UiEq5bjUQL2QpKce3cm/3/slBwCSTP7qj8mT6dGp4xkkhZkUybG5jNtQM
	 OIsYDoU3bhdA/wrzEouZZU4NDkzZI1OtlFlYpxUkaZl90+tm5Nurqn9ru7MwF7B4jYPay
	 RNaKehyqrjFQ0uc79O1c49r7/AVslHb+kUyzbg8x9vJrnN/5f5FGVYYcpHe6A29TGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=rUVL7VRu;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D28B606A33E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D28B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=rUVL7VRu
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0414c1062so41344645ad.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795681530; x=1796286330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/bylzWKznwTVF6pPmD6PbGpKb3ObNIRSAfKOe+kT50=;
        b=rUVL7VRuYqCgG05lo5BkE2ALIu5V353+4nNJAYGZVa2i+1piMvKzbF+g6yQ9AhaGif
         YzEuelqLLSBJlAWtunt5OsIF4qAAKQ3EpAcRSL3v2IU42uwqZee4hesZQAAdGfp+ZH6k
         MmEALUsUsD7PPdaasCrQVxXz8xiYNNickVVtUA991WydI4fNj9L3dYPOoek9FF0J/sAr
         4iRp2rzFN3GU/GaWVEx6V4wX/JZeZdSQb3pMrtOPo6hSdTGJED47A15V/vTfqD96VBKt
         PjZiXSYxohoJ0Xp53YdoqtuUmqz7zKdCcH5hGE+o4tYOA1Fdk307AgqPi1ey6ALvIHgY
         8t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681530; x=1796286330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/bylzWKznwTVF6pPmD6PbGpKb3ObNIRSAfKOe+kT50=;
        b=fPoGynHTpMLJTj5w41M7ylETd9122ISk5/FvAvtJSr3e1BUMvwuH3V9HKf86/jiZ73
         syBkJ1AchXKNfzB8NyOSLQG1rr2E35Yi5ErzEQl4f6tbn/iL2LJXj+QcoCMgrHScOq6q
         SmILD9epsGqBs5bDwy9izklzpKlYrDO4IShRUwwnIJCi1Bf6xMTn4kGwL3rrokyn7CRR
         09qRWYKfTH46vVcRLoAG3i/Nm+0uVh8zESQ3GjZFi8cKIyqYjeZ4E8KWorfLhis63X2x
         X+OrhB9zmG9GeHcKGV7L0U06HC010nzHJb3H/CmF92iPIRy2ylf2cC5/oeM2A7pMMv/X
         GpcQ==
X-Gm-Message-State: APuU4Z9ipIY8JNVP4Kj9D7JYXzmizBViKwG4PH0KOoTdVfy5bWZ5b65O
	L7//yFPzrNhPKRx45I29nY1I34wvzPII1Y2xLfQQcMguWwGu3Bao/0a9zoQ5xIUnF38c/lQBkjT
	lVmVNOg==
X-Gm-Gg: AZFdTZdNYO4hCfXlCc7uMblSwBmWVxHKQwbfXxJ659fXta70f0THTPXYvZQF7u1YA0+
	jRFwkBK4AQyA3EkN3JleB/9onD6cf08pnwO67fNyhs63OfVkG/Eb7f0mFhf0MhnCoXCL/FBMuLt
	k5RirPoPqgfiNViR3lIWPxv3f1BrTY759VRcXYzVJZtel/AkpC0sczo1XZKS5as6VfqNifMxL0p
	BYy8ldgNDLXGeQiFBUCROPh5Xs6niPX05opK2STLmYdaLYRYZdVmjS97G61c3i32Z8tpNVcSclK
	rm5py2kY8G19IVEkneUM/nRWVeSVI+Xk2mvumdsOZ5i5ufZCNh9tg5hClUnSBefCztEnkyYHqIr
	9pEhCBC4lwmZsB8xrcB3QkwKA3zTVwgIaxkH06ACZ8UdRIA3QKnUJ8B7s5QJiGpz4WzjW/XDVal
	fMg7FFp7g+zsln1DLfCVmukjvKvmoA5yxqcoGW6lB+kFZiLDjGqpEkwrrfOxZCg9O50m/QSpieC
	GZUUIxZRkkPwZoyfK4/06zoIVO2Zkwa/HyffHimhO+CsIEiU+k9dV9rHYcKhYrjamB7xlb+jrWs
	H34i3XqTTUbrCupOzaGMnb0rYuYanF8zVQk9W+kjhkesL7tYL9LGLwuuAfLTzgbIzQUwXanBrI2
	23BmlrNvyXPZkLWqCWkYs
X-Received: by 2002:a17:902:ce0b:b0:2e9:5059:4468 with SMTP id d9443c01a7336-2f03ef594efmr192926185ad.7.1795681529425;
        Thu, 26 Nov 2026 00:25:29 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm76794325ad.8.2026.11.26.00.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:25:28 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	brauner@kernel.org,
	runyu.xiao@seu.edu.cn,
	jiayuan.chen@shopee.com,
	leitao@debian.org,
	rjethwani@purestorage.com,
	tom@herbertland.com,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 1/1] net: kcm: check sndbuf space while building a message
Date: Thu, 26 Nov 2026 08:25:16 +0000
Message-ID: <bba172167bf15db0cd19226541324db7bae1a86d.1795676623.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795676623.git.zihanx@nebusec.ai>
References: <cover.1795676623.git.zihanx@nebusec.ai>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kcm_sendmsg() checks sk_stream_memory_free() before entering its copy loop,
but a single message can span many page fragments. Limit each copy to the
remaining sk_stream_wspace() and reject messages larger than sk_sndbuf.
This prevents a send from growing an unfinished KCM message past the
socket limit.

On SOCK_DGRAM errors, undo accounting for the entire discarded message,
including any MSG_MORE partial data.

Fixes: ab7ac4eb9832 ("kcm: Kernel Connection Multiplexor module")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Link: https://bugtracker.nebusec.ai/f/12034
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/kcm/kcmsock.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index ca789812124e..22ef60c3545b 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -750,6 +750,21 @@ static void kcm_push(struct kcm_sock *kcm)
 		kcm_write_msgs(kcm);
 }
 
+static unsigned int kcm_skb_frags_len(const struct sk_buff *skb)
+{
+	const struct sk_buff *frag;
+	unsigned int len = 0;
+	int i;
+
+	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
+		len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
+
+	skb_walk_frags(skb, frag)
+		len += kcm_skb_frags_len(frag);
+
+	return len;
+}
+
 static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 {
 	struct sock *sk = sock->sk;
@@ -771,11 +786,24 @@ static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 		goto out_error;
 
 	if (kcm->seq_skb) {
+		unsigned int queued;
+		size_t sndbuf = READ_ONCE(sk->sk_sndbuf);
+
 		/* Previously opened message */
 		head = kcm->seq_skb;
 		skb = kcm_tx_msg(head)->last_skb;
+		queued = kcm_skb_frags_len(head);
+		if (queued > sndbuf || msg_data_left(msg) > sndbuf - queued) {
+			err = -EMSGSIZE;
+			goto out_error;
+		}
 		goto start;
 	}
+	/* A message larger than sndbuf can never be completed. */
+	if (msg_data_left(msg) > sk->sk_sndbuf) {
+		err = -EMSGSIZE;
+		goto out_error;
+	}
 
 	/* Call the sk_stream functions to manage the sndbuf mem. */
 	if (!sk_stream_memory_free(sk)) {
@@ -811,6 +839,10 @@ static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 		bool merge = true;
 		int i = skb_shinfo(skb)->nr_frags;
 		struct page_frag *pfrag = sk_page_frag(sk);
+		int space = sk_stream_wspace(sk);
+
+		if (space <= 0)
+			goto wait_for_memory;
 
 		if (!sk_page_frag_refill(sk, pfrag))
 			goto wait_for_memory;
@@ -838,7 +870,7 @@ static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 		}
 
 		if (msg->msg_flags & MSG_SPLICE_PAGES) {
-			copy = msg_data_left(msg);
+			copy = min_t(size_t, msg_data_left(msg), space);
 			if (!sk_wmem_schedule(sk, copy))
 				goto wait_for_memory;
 
@@ -857,8 +889,9 @@ static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 			if (head != skb)
 				head->truesize += copy;
 		} else {
-			copy = min_t(int, msg_data_left(msg),
+			copy = min_t(size_t, msg_data_left(msg),
 				     pfrag->size - pfrag->offset);
+			copy = min_t(size_t, copy, space);
 			if (!sk_wmem_schedule(sk, copy))
 				goto wait_for_memory;
 
@@ -964,6 +997,12 @@ static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 		if (head != kcm->seq_skb)
 			kfree_skb(head);
 	} else {
+		if (head) {
+			int queued = kcm_skb_frags_len(head);
+
+			sk_wmem_queued_add(sk, -queued);
+			sk_mem_uncharge(sk, queued);
+		}
 		kfree_skb(head);
 		kcm->seq_skb = NULL;
 	}
-- 
2.43.0

