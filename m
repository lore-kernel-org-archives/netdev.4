Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795532;
	b=L6yRZesUL4SgCQ2a8pdKQBkyCkylYjEQrQDhRZ67LzcAxDc+xzTyA/BzwcOADXfKIyq+
	 rJSOO69jnSPtVvy9LhSx8+aYsaAX+UDkS+fObag7X6hbuo62Gb/LInLZ8zm/ehqyL67Sv
	 QPydP6tfQiNhlhgmeYfgsYMeEYj5HKf20PSbFno3lolb0cGPQDQpXyTMVIXUb80HyASqI
	 LtsoQNIJuIhVK5e3cImrkbu05D349i2PdSiHh4ZZZ94kaDLhJspjkWTR4QhN8KYcxuxRY
	 4LmbjSwtrDrPbpnHnxsVar3N/SlB/yfWgg/VZEJ5Zh5uMMLmDBgXvmsz9UCD/XcPbUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=G5BUglz/Q6cFu76NrR7NNakZrPeMrR2/wpFJLSs11xw=;
	b=ZKLQorlIaT4QPUvkCXCI6z7aOnW75GK/rZAiVF7pZdUNxU+aDrJ6HhiFOFiH70HXmf5G
	 cgs7MrHQh2x04QItr1wElSVKQRHMpnME9+k/DoEfpiMRWIXKNpfnfkiwtR5PnTY6e5UdZ
	 MQz3RKJKy5/jjrSnIIKWCo47LdLdfm/AB+GYXd2RbuQ97OI+16wpoCfvhw0Dp8Ju6io1U
	 kgDY4EyP7AvbfWwv81aj/6cwgD6bqeuaHfXS59/wuTRb3E0hfPEdhNqNpTDuSGufTWuQX
	 ueOalD7btxmloy1eoIWd+mKhWXGF25lh7KccagIfkT0ej8/JLK9q3XliBHviEAJsPIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6Q1ax;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40A606A88A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A40A606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6Q1ax
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso46111055ad.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795531; x=1795400331; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5BUglz/Q6cFu76NrR7NNakZrPeMrR2/wpFJLSs11xw=;
        b=bkv6Q1axjVl14amz2XWaaTa9ErIa/hqNrSrUwcPdezmI97FiEMzHOmUa+k2uDc4O9/
         HiKqu7V7cK8swT/Ako0G6NBAWRnT30UOzA4QqEvFhWC4d7aHtoiz2eH77xAO6InZH+VA
         PkkrznAlM6IWUOc5U6zvnWc6bi6qVVZDPKPPbGtwEINLBdY5Ad/Cek4tKmMmVBU2iInY
         LmijRe31DFlTJOhfT0D/ebW2idEvGj7KPcwP22fZLwEL5MRoq5JVNi7Biw+PxtYqwOYu
         K+n6rcp09n55YkM/BOJg9u2YhQcoPO0Xn4XXayylxU+7MMi0n6ziiZh4BsgXtMm7n7oX
         POVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795531; x=1795400331;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5BUglz/Q6cFu76NrR7NNakZrPeMrR2/wpFJLSs11xw=;
        b=L0CaIQjhUgTRYNY1Wxh6G037/AW4uOcZs2Dfl5oqCgbSO5uhCMACke5APeOzA3d+U1
         Rjsa6X1k1txBQ9NYSu/EbD84ZYMA8GGewqNqnx7JgoGG7gRF7dEsKZbSWvxYIQkh5wxW
         Yy3fjGJHzsU+XUFUywnoBbVfz/M+43xlWFBcWcL9kiRRSr/maXOsVEZ3KTI3S6wHd21L
         Y1OPiOvOAajfYIWtImgoAloNCfNX1VnVs5ZYr5Ci6Gx+57JAImxGLOpjNlF/J5Vh4nXd
         JsOpI26HEUTu0x2yntOLtiXajPhnHJRjVIflU3fXvrW5WQriYfo78usf6ztq3nM2c1iJ
         Ke5Q==
X-Forwarded-Encrypted: i=1; AL+hErHd2Xpa4tGt/nxbxFXaWhloNUvygyjSZakPwRHVfRmGBXpYOlJ1AD1/6KcMT3ZNBpy5TE3e3l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qwSL61puolQd50RHrTe37fpwWJ7eXmwsx1EPEjaQT66d59eR9
	pZrWvg9dq0+4ltchzGWENMQwH2L1k6Y6mPV3WFNMsDwpXmpikUq/AshuHwrZbT9g60YM2zW4ko7
	q68JsTA==
X-Received: from plgc1.prod.google.com ([2002:a17:902:d481:b0:2e4:afb6:7889])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef49:b0:2ed:fbf1:7e29
 with SMTP id d9443c01a7336-2ee0de3c41amr88409035ad.41.1794795531229; Sun, 15
 Nov 2026 18:18:51 -0800 (PST)
Date: Mon, 16 Nov 2026 02:18:21 +0000
In-Reply-To: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116021845.2533130-5-kuniyu@google.com>
Subject: [PATCH v1 net-next 4/4] af_unix: Remove MSG_OOB.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Security folks love MSG_OOB and it has had many bugs with
CVEs assigned.

The volume of bugs from MSG_OOB led to CONFIG_AF_UNIX_OOB,
but the default was 'y' even though there is no clear use case,
exposing innocent users to security risks.

Most of such bugs are trivial if CONFIG_AF_UNIX_OOB is not
enabled, but typically MSG_OOB allowed serious consequences,
such as LPE.

Considering RFC 6093 deprecated MSG_OOB for TCP in 2011, we
should not have accepted it for AF_UNIX from day 1.

It is time to drop support.

Along with that, ioctl(SIOCATMARK), EPOLLPRI, etc become
unavailable as if CONFIG_AF_UNIX_OOB=n.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/net/af_unix.h         |   3 -
 include/net/dropreason-core.h |   6 -
 net/unix/Kconfig              |   7 -
 net/unix/af_unix.c            | 252 +---------------------------------
 4 files changed, 1 insertion(+), 267 deletions(-)

diff --git a/include/net/af_unix.h b/include/net/af_unix.h
index bb1b3dee02e8..43fb892eee06 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -50,9 +50,6 @@ struct unix_sock {
 	int			inq_len;
 	bool			recvmsg_inq;
 	bool			scm_rights_notrunc;
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	struct sk_buff		*oob_skb;
-#endif
 };
 
 #define unix_sk(ptr) container_of_const(ptr, struct unix_sock, sk)
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index fa2fe8990557..c010fdebf249 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -10,7 +10,6 @@
 	FN(SOCKET_FILTER)		\
 	FN(SOCKET_RCVBUFF)		\
 	FN(UNIX_DISCONNECT)		\
-	FN(UNIX_SKIP_OOB)		\
 	FN(PKT_TOO_SMALL)		\
 	FN(TCP_CSUM)			\
 	FN(UDP_CSUM)			\
@@ -164,11 +163,6 @@ enum skb_drop_reason {
 	 * during send() that the peer has been close()d.
 	 */
 	SKB_DROP_REASON_UNIX_DISCONNECT,
-	/**
-	 * @SKB_DROP_REASON_UNIX_SKIP_OOB: Out-Of-Band data is skipped by
-	 * recv() without MSG_OOB so dropped.
-	 */
-	SKB_DROP_REASON_UNIX_SKIP_OOB,
 	/** @SKB_DROP_REASON_PKT_TOO_SMALL: packet size is too small */
 	SKB_DROP_REASON_PKT_TOO_SMALL,
 	/** @SKB_DROP_REASON_TCP_CSUM: TCP checksum error */
diff --git a/net/unix/Kconfig b/net/unix/Kconfig
index 6f1783c1659b..d378726d5eb9 100644
--- a/net/unix/Kconfig
+++ b/net/unix/Kconfig
@@ -16,13 +16,6 @@ config UNIX
 
 	  Say Y unless you know what you are doing.
 
-config	AF_UNIX_OOB
-	bool "UNIX: out-of-bound messages"
-	depends on UNIX
-	default y
-	help
-	  Support for MSG_OOB in UNIX domain sockets. If unsure, say Y.
-
 config UNIX_DIAG
 	tristate "UNIX: socket monitoring interface"
 	depends on UNIX
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 96c13682938e..cc5c7fa40b4d 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -688,20 +688,12 @@ static void unix_release_sock(struct sock *sk, int embrion)
 
 	unix_state_unlock(sk);
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	u->oob_skb = NULL;
-#endif
-
 	wake_up_interruptible_all(&u->peer_wait);
 
 	if (skpair != NULL) {
 		if (sk->sk_type == SOCK_STREAM || sk->sk_type == SOCK_SEQPACKET) {
 			struct sk_buff *skb = skb_peek(&sk->sk_receive_queue);
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-			if (skb && !unix_skb_len(skb))
-				skb = skb_peek_next(skb, &sk->sk_receive_queue);
-#endif
 			unix_state_lock(skpair);
 			/* No more writes */
 			WRITE_ONCE(skpair->sk_shutdown, SHUTDOWN_MASK);
@@ -2325,67 +2317,6 @@ static int unix_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
  */
 #define UNIX_SKB_FRAGS_SZ (PAGE_SIZE << get_order(32768))
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-static int queue_oob(struct sock *sk, struct msghdr *msg, struct sock *other,
-		     struct scm_cookie *scm, bool fds_sent)
-{
-	struct unix_sock *ousk = unix_sk(other);
-	struct sk_buff *skb;
-	int err;
-
-	skb = sock_alloc_send_skb(sk, 1, msg->msg_flags & MSG_DONTWAIT, &err);
-
-	if (!skb)
-		return err;
-
-	err = unix_scm_to_skb(scm, skb, !fds_sent);
-	if (err < 0)
-		goto out;
-
-	err = unix_maybe_add_creds(skb, sk, other);
-	if (err)
-		goto out;
-
-	skb_put(skb, 1);
-	err = skb_copy_datagram_from_iter(skb, 0, &msg->msg_iter, 1);
-
-	if (err)
-		goto out;
-
-	unix_state_lock(other);
-
-	if (sock_flag(other, SOCK_DEAD) ||
-	    (other->sk_shutdown & RCV_SHUTDOWN)) {
-		err = -EPIPE;
-		goto out_unlock;
-	}
-
-	if (UNIXCB(skb).fp && !other->sk_scm_rights) {
-		err = -EPERM;
-		goto out_unlock;
-	}
-
-	scm_stat_add(other, skb);
-
-	spin_lock(&other->sk_receive_queue.lock);
-	WRITE_ONCE(ousk->oob_skb, skb);
-	WRITE_ONCE(ousk->inq_len, ousk->inq_len + 1);
-	__skb_queue_tail(&other->sk_receive_queue, skb);
-	spin_unlock(&other->sk_receive_queue.lock);
-
-	sk_send_sigurg(other);
-	unix_state_unlock(other);
-	READ_ONCE(other->sk_data_ready)(other);
-
-	return 0;
-out_unlock:
-	unix_state_unlock(other);
-out:
-	consume_skb(skb);
-	return err;
-}
-#endif
-
 static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 			       size_t len)
 {
@@ -2403,12 +2334,7 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 
 	if (msg->msg_flags & MSG_OOB) {
 		err = -EOPNOTSUPP;
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-		if (len)
-			len--;
-		else
-#endif
-			goto out_err;
+		goto out_err;
 	}
 
 	if (msg->msg_namelen) {
@@ -2505,15 +2431,6 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 		sent += size;
 	}
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	if (msg->msg_flags & MSG_OOB) {
-		err = queue_oob(sk, msg, other, &scm, fds_sent);
-		if (err)
-			goto out_err;
-		sent++;
-	}
-#endif
-
 	scm_destroy(&scm);
 
 	return sent;
@@ -2765,115 +2682,6 @@ struct unix_stream_read_state {
 	unsigned int splice_flags;
 };
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-static int unix_stream_recv_urg(struct unix_stream_read_state *state)
-{
-	struct sk_buff *oob_skb, *read_skb = NULL;
-	struct socket *sock = state->socket;
-	struct sock *sk = sock->sk;
-	struct unix_sock *u = unix_sk(sk);
-	int chunk = 1;
-
-	mutex_lock(&u->iolock);
-	unix_state_lock(sk);
-	spin_lock(&sk->sk_receive_queue.lock);
-
-	if (sock_flag(sk, SOCK_URGINLINE) || !u->oob_skb) {
-		spin_unlock(&sk->sk_receive_queue.lock);
-		unix_state_unlock(sk);
-		mutex_unlock(&u->iolock);
-		return -EINVAL;
-	}
-
-	oob_skb = u->oob_skb;
-
-	if (!(state->flags & MSG_PEEK)) {
-		WRITE_ONCE(u->oob_skb, NULL);
-		WRITE_ONCE(u->inq_len, u->inq_len - 1);
-
-		if (oob_skb->prev != (struct sk_buff *)&sk->sk_receive_queue &&
-		    !unix_skb_len(oob_skb->prev)) {
-			read_skb = oob_skb->prev;
-			__skb_unlink(read_skb, &sk->sk_receive_queue);
-		}
-	}
-
-	spin_unlock(&sk->sk_receive_queue.lock);
-	unix_state_unlock(sk);
-
-	chunk = state->recv_actor(oob_skb, 0, chunk, state);
-
-	if (!(state->flags & MSG_PEEK))
-		UNIXCB(oob_skb).consumed += 1;
-
-	mutex_unlock(&u->iolock);
-
-	consume_skb(read_skb);
-
-	if (chunk < 0)
-		return -EFAULT;
-
-	state->msg->msg_flags |= MSG_OOB;
-	return 1;
-}
-
-static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
-				  struct sock *sk, int flags, int copied)
-{
-	struct sk_buff *read_skb = NULL, *unread_skb = NULL;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (likely(unix_skb_len(skb) && skb != READ_ONCE(u->oob_skb)))
-		return skb;
-
-	spin_lock(&sk->sk_receive_queue.lock);
-
-	if (!unix_skb_len(skb)) {
-		if (copied && (!u->oob_skb || skb == u->oob_skb)) {
-			skb = NULL;
-		} else if (flags & MSG_PEEK) {
-			*last = skb;
-			skb = skb_peek_next(skb, &sk->sk_receive_queue);
-		} else {
-			read_skb = skb;
-			skb = skb_peek_next(skb, &sk->sk_receive_queue);
-			__skb_unlink(read_skb, &sk->sk_receive_queue);
-			*last = skb;
-		}
-
-		if (!skb)
-			goto unlock;
-	}
-
-	if (skb != u->oob_skb)
-		goto unlock;
-
-	if (copied) {
-		skb = NULL;
-	} else if (!(flags & MSG_PEEK)) {
-		WRITE_ONCE(u->oob_skb, NULL);
-
-		if (!sock_flag(sk, SOCK_URGINLINE)) {
-			__skb_unlink(skb, &sk->sk_receive_queue);
-			unread_skb = skb;
-			skb = skb_peek(&sk->sk_receive_queue);
-			*last = skb;
-		}
-	} else if (!sock_flag(sk, SOCK_URGINLINE)) {
-		*last = skb;
-		skb = skb_peek_next(skb, &sk->sk_receive_queue);
-	}
-
-unlock:
-	spin_unlock(&sk->sk_receive_queue.lock);
-
-	consume_skb(read_skb);
-	kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
-
-	return skb;
-}
-#endif
-
 static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 {
 	struct sk_buff_head *queue = &sk->sk_receive_queue;
@@ -2900,17 +2708,6 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 
 	WRITE_ONCE(u->inq_len, u->inq_len - unix_skb_len(skb));
 
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	if (skb == u->oob_skb) {
-		WRITE_ONCE(u->oob_skb, NULL);
-		spin_unlock(&queue->lock);
-		mutex_unlock(&u->iolock);
-
-		kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
-		return -EAGAIN;
-	}
-#endif
-
 	spin_unlock(&queue->lock);
 
 	unix_orphan_scm(sk, skb);
@@ -2945,9 +2742,6 @@ static int unix_stream_read_generic(struct unix_stream_read_state *state,
 
 	if (unlikely(flags & MSG_OOB)) {
 		err = -EOPNOTSUPP;
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-		err = unix_stream_recv_urg(state);
-#endif
 		goto out;
 	}
 
@@ -2978,15 +2772,6 @@ static int unix_stream_read_generic(struct unix_stream_read_state *state,
 		last = skb = skb_peek(&sk->sk_receive_queue);
 
 again:
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-		if (skb) {
-			skb = manage_oob(skb, &last, sk, flags, copied);
-			if (!skb && (copied || !state->size)) {
-				unix_state_unlock(sk);
-				break;
-			}
-		}
-#endif
 		if (skb == NULL) {
 			if (copied >= target)
 				goto unlock;
@@ -3322,37 +3107,6 @@ static int unix_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	case SIOCUNIXFILE:
 		err = unix_open_file(sk);
 		break;
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	case SIOCATMARK:
-		{
-			struct unix_sock *u = unix_sk(sk);
-			struct sk_buff *skb;
-			int answ = 0;
-
-			if (sk->sk_type != SOCK_STREAM)
-				return -EOPNOTSUPP;
-
-			mutex_lock(&u->iolock);
-
-			skb = skb_peek(&sk->sk_receive_queue);
-			if (skb) {
-				struct sk_buff *oob_skb = READ_ONCE(u->oob_skb);
-				struct sk_buff *next_skb;
-
-				next_skb = skb_peek_next(skb, &sk->sk_receive_queue);
-
-				if (skb == oob_skb ||
-				    (!unix_skb_len(skb) &&
-				     (!oob_skb || next_skb == oob_skb)))
-					answ = 1;
-			}
-
-			mutex_unlock(&u->iolock);
-
-			err = put_user(answ, (int __user *)arg);
-		}
-		break;
-#endif
 	default:
 		err = -ENOIOCTLCMD;
 		break;
@@ -3392,10 +3146,6 @@ static __poll_t unix_poll(struct file *file, struct socket *sock, poll_table *wa
 		mask |= EPOLLIN | EPOLLRDNORM;
 	if (sk_is_readable(sk))
 		mask |= EPOLLIN | EPOLLRDNORM;
-#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	if (READ_ONCE(unix_sk(sk)->oob_skb))
-		mask |= EPOLLPRI;
-#endif
 
 	/* Connection-based need to check for termination and startup */
 	if ((sk->sk_type == SOCK_STREAM || sk->sk_type == SOCK_SEQPACKET) &&
-- 
2.56.0.611.g1030f0b940-goog

