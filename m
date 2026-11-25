Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566176;
	b=AeilQItqitlFtmWilhrB8eXVzUU2iFTtIcftu9x35YrkGvPvIeuCpcSIPGIELVCe8ecY
	 yLaBIDe+o8HhTXkDsnvHFj56jd6zeyQkMUmKYtbP9Knp9pRj9cgyL+mMVw2p/SOFWFpE/
	 XaYPWm3tzlI/zid3Q0Lou9TKX+3z2zn/qTa0ya/4cphG5tjVlxzRzFWq3aZ9fTph8n0TQ
	 mef3FKGQ7qy/eqgtkiXZFEUwaFaGvMVAYAHIK15ysrnHfupF4DL6tucIWvoLey/XVBZjh
	 nH7irF9cEj5CpSH8NisAzMMOJSpLhYpHU5vLD46wTPYyfdVLlURRp11CuLtBd4RjWZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FueLGoLZyku9AG3AS1iYf/8SXMA4pebp9Uqlej/o1AM=;
	b=Jw0+J+ZBhy/HG4YJwsV+cutocgBwKdS+K9S8q4fse9z8TPKHp9WEaQ/jJCDf1AOXXnwQ
	 vEYStQHW0by5bavUS4b3oWySALUjQJF35aLNqDdVpQP2kZN2ZOOOCfjZQOlJiiy6Vgn+z
	 WaeZ15wKv7ck3YW7CUCFty0ScuKBmojKKbx/8wg01tk1f/29rzzW+96sJuYtyEup2jSB0
	 sTF/DUVL3UU4Y9R0/5JeRtsg5agJy2vNxHfOsZaCWK2HO5fE6swKppBruMx8x9xug8h6w
	 gDPbsz045RosPAy+3E0v26I9er7YpBzA4OLdwoT5jPQdsK8oM//h75NlQUfqsqtodCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=FHNHElH6;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45712606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45712606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=FHNHElH6
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4209505f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566174; x=1796170974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FueLGoLZyku9AG3AS1iYf/8SXMA4pebp9Uqlej/o1AM=;
        b=FHNHElH6qzk8f9n75QfpuseUiedIhFzjFoKmULg4ssi21EK2oogDcqpLfUmX1/Fx3x
         uwc+QwTZxPyM5VGwbY1zTdUFuD/Ts4FN3Xwow8bTQrwgJPJi9+nibgPWbnT8Xs2Dwf2l
         tE+WRDJ/bPbL4jlm0seCkQRFpGJKinXuyI3nfSG2KOefczASb+8Gw1WRbMBylM3Q/tl4
         A6lwzbdRSiMwRO8HRZp9AocEcSaGUL8eHccGlrW5rKlJsKBrvi/MjBtOD4eQjlIjMqVZ
         C6aWENm6GXPw6jYreUmzTPrSwhPm75oQXv4Lu4WMYiUBEBBLixknhbJqB7mAueRJ7iLD
         YypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566174; x=1796170974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FueLGoLZyku9AG3AS1iYf/8SXMA4pebp9Uqlej/o1AM=;
        b=siOEKmY0IBC65ZICxufS1lv4yH7qfDNUblYW2CFSMVjmht6FbGdAH8SDVXQesQaQuv
         5gMUB3swCq06K8iFGWv23B6PSQ4fdOvrdHJBBL0/29uuOpepGuPI7rYka4SsL7Zw1zgR
         rtb8zI4g9ddAKs+iQrlMMcltUzE8BAnGAHIkDAZt++jDDfOLr40zhc04YcUJiqqn52YX
         /hFftWH4gLhgUbrXNfZpWo6eRs71vGI0IU8GJ7Xffm2GD1d2y7bG39vbVeEZskZy3JA+
         ATw9cZLSxcqNyHB9d/7xwrxwVjQkunDbXfrpBEAqNC2vlkjgfFrHbs1gl7e4GzDAj+N3
         xNSQ==
X-Gm-Message-State: APuU4Z9KYu4u8cAFEIWoNbm/LI8TMy1VWHfmCSIDyAok1qnHBD4nUgyW
	UVDjExk8ksDiStx4eDWHf0j2lVj0jlsCoYHd42PIsNrkM+rLKKmy5BD+QBiNj3bAEE1H/1IRQqE
	+N/a68KLbn5qowlUHgduFZpdt/cAJVSnKNqf5lGxjOeayHyy6dENWXRhvzmuW5ULAins=
X-Gm-Gg: AZFdTZesjjrn9nXIXxHW3x/+8xplYYF3hbbJrCGvP2LFn6dVHXZYPHEcTW4bIZBINKL
	ayXoKgpE5gTRQtL7AsClj+oaT1FiWy87AwBIoXKW0ONDjkFKzF82QzzfnE6VeghocToxrDKcAp5
	6NFnnhL/K5Tj1UnhIFA0iUrW3HtEkefO5Lia5GpS3rWT3tivoLzAL3lF5+j7VxVMUB69Z/0vDPx
	REuA2Njo7jZZkD5IpF+IKMm47K3V5St7hyvOTXv7dN2kAWyXNWG60IcL6LEv7xKD9yxqd6mCos+
	5/uLsKXLNVYsfQxTdTdQN8DK9gs/Lmk8eOA70w4/adyQYYLNWeu93W3H8XaPJXsgMrQGNqL12xU
	9fJcNZ5M8a0rSJbfnGyK+fRTNH/o0LORVAet1uLlr2ur0xApJtGLxdCe3Mld8pk320uz9zRHY1g
	sHPqgQWM1yT2r2Wl6h3zxIGzKqoDCqQMm4MWetihpPsqRcfag6mij1Zu3b3CyawBbBM7TfTzesC
	IjfyRtgJzG/IN4QAV+ICKyrWvtBxhkKbbIWHOv0cGJK+sqwggJJ7qH/gbmQRWVxV3qNOovuj/hx
	oFZE4B2n2L2wYcWhTBGW/mcd6zA6rbTSgg96uVLJy3vBrqHcMgdc
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr338648045e9.35.1795566174532;
        Tue, 24 Nov 2026 16:22:54 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:53 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net 6/7] ovpn: fix TCP TX accounting for locally dropped packets
Date: Wed, 25 Nov 2026 01:22:37 +0100
Message-ID: <20261125002239.1191542-7-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125002239.1191542-1-antonio@openvpn.net>
References: <20261125002239.1191542-1-antonio@openvpn.net>
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

From: Ralf Lici <ralf@mandelbit.com>

ovpn_encrypt_post updates peer TX stats and last_sent as soon as an
encrypted skb is handed to the TCP transport. However, the skb may still
be dropped locally: when the per-peer output queue is full, when another
output skb is still busy, or later, when the skbs queued while the
socket was owned by userspace are flushed by the release callback.

Make the TCP send helpers return an error when they cannot consume the
skb, so that callers account and free the drop, and update peer TX
stats and last_sent for TCP only once the packet has been sent.

Fixes: 11851cbd60ea ("ovpn: implement TCP transport")
Cc: stable@vger.kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
[antonio: account peer TX stats and last_sent once the packet is sent,
 to also cover skbs dropped from the output queue]
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/io.c  | 12 +++++---
 drivers/net/ovpn/skb.h |  2 ++
 drivers/net/ovpn/tcp.c | 67 ++++++++++++++++++++++++++++++++----------
 drivers/net/ovpn/tcp.h | 10 ++-----
 4 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ovpn/io.c b/drivers/net/ovpn/io.c
index a11ad979e9f3..fc1f5aeefb41 100644
--- a/drivers/net/ovpn/io.c
+++ b/drivers/net/ovpn/io.c
@@ -284,18 +284,22 @@ void ovpn_encrypt_post(void *data, int ret)
 		ret = ovpn_udp_send_skb(peer, sock->sk, skb);
 		if (unlikely(ret < 0))
 			goto err_unlock;
+
+		ovpn_peer_stats_increment_tx(&peer->link_stats, orig_len);
+		/* keep track of last sent packet for keepalive */
+		WRITE_ONCE(peer->last_sent, ktime_get_boottime_seconds());
 		break;
 	case IPPROTO_TCP:
-		ovpn_tcp_send_skb(peer, sock->sk, skb);
+		/* TCP accounts the packet once it is actually sent */
+		ret = ovpn_tcp_send_skb(peer, sock->sk, skb);
+		if (unlikely(ret < 0))
+			goto err_unlock;
 		break;
 	default:
 		/* no transport configured yet */
 		goto err_unlock;
 	}
 
-	ovpn_peer_stats_increment_tx(&peer->link_stats, orig_len);
-	/* keep track of last sent packet for keepalive */
-	WRITE_ONCE(peer->last_sent, ktime_get_boottime_seconds());
 	/* skb passed down the stack - don't free it */
 	skb = NULL;
 err_unlock:
diff --git a/drivers/net/ovpn/skb.h b/drivers/net/ovpn/skb.h
index 4fb7ea025426..578e1268bbc3 100644
--- a/drivers/net/ovpn/skb.h
+++ b/drivers/net/ovpn/skb.h
@@ -26,6 +26,7 @@
  *		containing the IV, the scatter gather list and the aead request
  * @payload_offset: offset in the skb where the payload starts
  * @nosignal: whether this skb should be sent with the MSG_NOSIGNAL flag (TCP)
+ * @data: whether this skb is an encrypted data packet (TCP)
  */
 struct ovpn_cb {
 	struct ovpn_peer *peer;
@@ -33,6 +34,7 @@ struct ovpn_cb {
 	void *crypto_tmp;
 	unsigned int payload_offset;
 	bool nosignal;
+	bool data;
 };
 
 static inline struct ovpn_cb *ovpn_skb_cb(struct sk_buff *skb)
diff --git a/drivers/net/ovpn/tcp.c b/drivers/net/ovpn/tcp.c
index 00cab8d2aa6a..dbdb6eeb3c08 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -297,6 +297,17 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 		dev_dstats_tx_add(peer->ovpn->dev,
 				  skb->len - skb_inner_network_offset(skb));
 		local_bh_enable();
+
+		if (ovpn_skb_cb(skb)->data) {
+			/* exclude the length prefix, like UDP excludes its
+			 * header
+			 */
+			ovpn_peer_stats_increment_tx(&peer->link_stats,
+						     skb->len - sizeof(u16));
+			/* keep track of last sent packet for keepalive */
+			WRITE_ONCE(peer->last_sent,
+				   ktime_get_boottime_seconds());
+		}
 	}
 
 	kfree_skb(peer->tcp.out_msg.skb);
@@ -320,45 +331,57 @@ void ovpn_tcp_tx_work(struct work_struct *work)
 	release_sock(sock->sk);
 }
 
-static void ovpn_tcp_send_sock_skb(struct ovpn_peer *peer, struct sock *sk,
-				   struct sk_buff *skb)
+static int ovpn_tcp_send_sock_skb(struct ovpn_peer *peer, struct sock *sk,
+				  struct sk_buff *skb)
 {
 	if (peer->tcp.out_msg.skb)
 		ovpn_tcp_send_sock(peer, sk);
 
-	if (peer->tcp.out_msg.skb) {
-		ovpn_dev_dstats_tx_dropped(peer->ovpn->dev);
-		kfree_skb(skb);
-		return;
-	}
+	if (peer->tcp.out_msg.skb)
+		return -EBUSY;
 
 	peer->tcp.out_msg.skb = skb;
 	peer->tcp.out_msg.len = skb->len;
 	peer->tcp.out_msg.offset = 0;
 	ovpn_tcp_send_sock(peer, sk);
+	return 0;
 }
 
-void ovpn_tcp_send_skb(struct ovpn_peer *peer, struct sock *sk,
-		       struct sk_buff *skb)
+/**
+ * ovpn_tcp_send_skb - Prepare skb and enqueue it for sending to peer
+ * @peer: destination peer
+ * @sk: transport socket
+ * @skb: packet to send
+ *
+ * Prepends the skb payload length, as required by the OpenVPN protocol in
+ * order to extract packets from the TCP stream on the receiver side.
+ *
+ * Return: 0 on success or a negative error code otherwise. On failure, the
+ * caller retains ownership of @skb.
+ */
+int ovpn_tcp_send_skb(struct ovpn_peer *peer, struct sock *sk,
+		      struct sk_buff *skb)
 {
 	u16 len = skb->len;
+	int ret = 0;
 
+	ovpn_skb_cb(skb)->data = true;
 	*(__be16 *)__skb_push(skb, sizeof(u16)) = htons(len);
 
 	spin_lock_nested(&sk->sk_lock.slock, OVPN_TCP_DEPTH_NESTING);
 	if (sock_owned_by_user(sk)) {
 		if (skb_queue_len(&peer->tcp.out_queue) >=
 		    READ_ONCE(net_hotdata.max_backlog)) {
-			ovpn_dev_dstats_tx_dropped(peer->ovpn->dev);
-			kfree_skb(skb);
+			ret = -ENOBUFS;
 			goto unlock;
 		}
 		__skb_queue_tail(&peer->tcp.out_queue, skb);
 	} else {
-		ovpn_tcp_send_sock_skb(peer, sk, skb);
+		ret = ovpn_tcp_send_sock_skb(peer, sk, skb);
 	}
 unlock:
 	spin_unlock(&sk->sk_lock.slock);
+	return ret;
 }
 
 static void ovpn_tcp_release(struct sock *sk)
@@ -367,6 +390,7 @@ static void ovpn_tcp_release(struct sock *sk)
 	struct ovpn_socket *sock;
 	struct ovpn_peer *peer;
 	struct sk_buff *skb;
+	int ret;
 
 	rcu_read_lock();
 	sock = rcu_dereference_sk_user_data(sk);
@@ -389,8 +413,13 @@ static void ovpn_tcp_release(struct sock *sk)
 	__skb_queue_head_init(&queue);
 	skb_queue_splice_init(&peer->tcp.out_queue, &queue);
 
-	while ((skb = __skb_dequeue(&queue)))
-		ovpn_tcp_send_sock_skb(peer, sk, skb);
+	while ((skb = __skb_dequeue(&queue))) {
+		ret = ovpn_tcp_send_sock_skb(peer, sk, skb);
+		if (unlikely(ret < 0)) {
+			ovpn_dev_dstats_tx_dropped(peer->ovpn->dev);
+			kfree_skb(skb);
+		}
+	}
 
 	peer->tcp.sk_cb.prot->release_cb(sk);
 	ovpn_peer_put(peer);
@@ -450,8 +479,14 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 	/* userspace messages are not encrypted: account them entirely */
 	skb_reset_inner_network_header(skb);
 	ovpn_skb_cb(skb)->nosignal = msg->msg_flags & MSG_NOSIGNAL;
-	ovpn_tcp_send_sock_skb(peer, sk, skb);
-	ret = size;
+	ret = ovpn_tcp_send_sock_skb(peer, sk, skb);
+	if (unlikely(ret < 0)) {
+		ovpn_dev_dstats_tx_dropped(peer->ovpn->dev);
+		kfree_skb(skb);
+	} else {
+		ret = size;
+	}
+
 peer_free:
 	release_sock(sk);
 	ovpn_peer_put(peer);
diff --git a/drivers/net/ovpn/tcp.h b/drivers/net/ovpn/tcp.h
index a3aa3570ae5e..957f7f7db6c8 100644
--- a/drivers/net/ovpn/tcp.h
+++ b/drivers/net/ovpn/tcp.h
@@ -24,14 +24,8 @@ int ovpn_tcp_socket_attach(struct ovpn_socket *ovpn_sock,
 void ovpn_tcp_socket_detach(struct ovpn_socket *ovpn_sock);
 void ovpn_tcp_socket_wait_finish(struct ovpn_socket *sock);
 
-/* Prepare skb and enqueue it for sending to peer.
- *
- * Preparation consist in prepending the skb payload with its size.
- * Required by the OpenVPN protocol in order to extract packets from
- * the TCP stream on the receiver side.
- */
-void ovpn_tcp_send_skb(struct ovpn_peer *peer, struct sock *sk,
-		       struct sk_buff *skb);
+int ovpn_tcp_send_skb(struct ovpn_peer *peer, struct sock *sk,
+		      struct sk_buff *skb);
 void ovpn_tcp_tx_work(struct work_struct *work);
 
 #endif /* _NET_OVPN_TCP_H_ */
