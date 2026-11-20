Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153804;
	b=yT78y4ILB+wnpf9RSwnFQgbc2i8k5gb1feqar+uZN7HTEDMe/R84VBjDsD1h+xRcdg4L
	 tOpWB+VqOixv2aktUSOoN/D7lzYjwnF1uzZKZpP+pwsD65VSLn2YWzIjqc4i/Ku6nkb71
	 h5WVXMfcTSvPGBdmyB5PP/Xy/URR4hJ5RcF0yYGQuBrH9f/0bG69t6ex5K9/715sMqrBJ
	 +CnoX4dSOQkkkoaIGTInQ4g/7bKJA9MRIdog/LFT8ACrMTmqPnJTWxnQzwR1i7aqXGO0W
	 34NoMLT6v48jNyV0DFKlC5D3WzWBB2q9pm2ZF9zAxAMzVrlB951Luwmu2VNn3schHXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
	b=U+eOHFGMiJwGFFk5QOUN7VaC5d3C2FcHGlX9TFXLSFkfACiJA3rRzgPyI5ia7gSoaurZ
	 Baffpk1giMqEcKJxCyekvBEeavmITjRMOqqJBhInbzV91G0wJz7wmRC987n9ZTmqxbEhH
	 hQAu7p6ZPHHn6NcGptltPsjny/zvGLdEZ+tHeazQDTzgi9Z//z5XwETFf7XNl9CrgNDss
	 arNsrYxPx3+k8YX1VbZwO0Jam5uVnJjq6R0a5HIs9K1rNaQZa4IRbuDx1wtBWB5x1A9BJ
	 JhRBb1nIjK3SeyQRnaTONM87O2FnBkLnbCJ4xYDfMp0k7gjYIc087QTNPcEqKc2f4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMVDcKPp;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26580606A337
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26580606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMVDcKPp
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso520738eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153803; x=1795758603; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
        b=TMVDcKPpOpVkqF98votaywv0qrAehZkHAmqpIUewjvV+jeyv/wJVvNlXEDgNtRAr00
         5eeFseYQ2gNtHfjprmp0Iqw9gkuwYzJIWqE85IveBVYZ03hJ7X42dkhyCjqncZEHyHmm
         B+euqHSSbCZUvi4sq1oqgdCZHgo1/rqQx5t/ToDInFxxNiCuPQBt2K26OvtH394KxYRy
         ipu0jaKGS6kZvYTdfNu2H05qBE9M0Vp4zrdzJWX2MiUp5TUC53cZ98RK/sX8FrPeP3P+
         czxxS0SVZnm6/IYnAVJUVcfkmC37lqLS9U2xKqonRnIY5WXSTFNJGyvjUBVi0B0834jj
         MZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153803; x=1795758603;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KVUdhjdUAQUVhU8tF9wbTS923a28qAeS6k6sQNHWmc=;
        b=NLE1lW/UKgu3fTpZWPv9oM30I4Op+lL0IEGXvNCES4BNRHgDEBiaAlr+34R+gO/qyJ
         ZELgexjBBdchkSrhrNpvH3rHiLFNq5tbKwpWu9Na35GuRpFJWe6Us1oSUalkY2Xu8GwW
         4ikdAWBPn+n+IrdITZAVrh27B8aiLKL8Mf0XLRzSv2h2GY56T/t30jGUQbGIULpUYyBr
         /H7whBlHibNLZHkQrhiGXFZPJPwZaELP9ZJeUpTTJ0NCS+L2/O0W5WyaLVu9miBEafu9
         gL5fBVk3TWiccI11VI89aL2iBbVvHvbn+Zu7YG2ItgxnjfZA2NtxehuFgMxfu/C1EKys
         5Xbg==
X-Gm-Message-State: APuU4Z9KvV2Qx/s3dGE0MdQWLptS4jsURGjQszUiAz1H6JuKG1FXM1Ov
	isCq5/LPcvN1D6DVrB8hwuimnzDmqFdW12RJ0X5e+Si86a9RD5K1lFQVjWk91n43trjLfvGBacw
	k9dprjBhye0jdmqB1/8ctAu/4sBOtUjHB8j4EBm3n7fkDA/D7Pi2aCl9tZOICpaPvPKnRZA72cF
	Qlb/XpjxiREHTixG2k19ZFaiylCoQOkxXpgu0wZ7xqxs0LhmY0FyevjCctCqk08IM=
X-Received: from dybme37.prod.google.com ([2002:a05:7301:18a5:b0:384:71f1:1227])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr1567860eec.11.1795153802509;
 Thu, 19 Nov 2026 21:50:02 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:15 +0000
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120045918.1239746-5-almasrymina@google.com>
Subject: [PATCH net-next v4 4/7] net: devmem: fold net_devmem_lookup_dmabuf()
 into net_devmem_get_binding()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

net_devmem_lookup_dmabuf() has only one caller, net_devmem_get_binding(),
which currently enters two separate RCU read-side critical sections: one
inside net_devmem_lookup_dmabuf() to find the NET_DEVMEM_BINDING_LIVE
entry and acquire a reference, and a second in net_devmem_get_binding()
to verify dst_dev against binding->map_dev and binding->bind_dev.

Because the lookup and device checks are split across two RCU read-side
critical sections, waiting for synchronize_net() after clearing
NET_DEVMEM_BINDING_LIVE does not guarantee that in-flight
net_devmem_get_binding() callers have finished validating the binding
and returned.

Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
entire lookup, validation, device check, and
net_devmem_dmabuf_binding_get() run inside a single rcu_read_lock()
section. The binding stays alive for the duration of the RCU read-side
critical section because net_devmem_unbind_dmabuf() calls
synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE and before
percpu_ref_kill(). Deferring net_devmem_dmabuf_binding_get() until all
checks pass also eliminates the error-path reference put.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c | 38 ++++++++++++--------------------------
 net/core/devmem.h |  6 ------
 2 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 604718bed3cb2..6f85b90950f8b 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -211,7 +211,7 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
 		      NET_DEVMEM_BINDING_LIVE);
 
-	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
+	/* Ensure no tx net_devmem_get_binding() are in flight after the
 	 * mark is cleared.
 	 */
 	synchronize_net();
@@ -521,23 +521,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	return ERR_PTR(err);
 }
 
-struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
-{
-	struct net_devmem_dmabuf_binding *binding;
-	unsigned long xa_idx = id;
-
-	rcu_read_lock();
-	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, id,
-			  NET_DEVMEM_BINDING_LIVE);
-	if (binding) {
-		if (!net_devmem_dmabuf_binding_get(binding))
-			binding = NULL;
-	}
-	rcu_read_unlock();
-
-	return binding;
-}
-
 void net_devmem_net_iov_inc_ref(struct net_iov *niov)
 {
 	net_devmem_dmabuf_binding_get(net_devmem_iov_binding(niov));
@@ -552,19 +535,21 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 							 unsigned int dmabuf_id)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx = dmabuf_id;
 	struct net_device *dst_dev;
 	struct dst_entry *dst;
-	int err = 0;
+	int err;
 
-	binding = net_devmem_lookup_dmabuf(dmabuf_id);
+	rcu_read_lock();
+	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_id,
+			  NET_DEVMEM_BINDING_LIVE);
 	if (!binding || !binding->tx_vec ||
 	    !net_eq(sock_net(sk), read_pnet(&binding->net)) ||
 	    !uid_eq(sk_uid(sk), binding->uid)) {
 		err = -EINVAL;
-		goto out_err;
+		goto out_unlock;
 	}
 
-	rcu_read_lock();
 	dst = __sk_dst_get(sk);
 	/* If dst is NULL (route expired), attempt to rebuild it. */
 	if (unlikely(!dst)) {
@@ -590,15 +575,16 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 		goto out_unlock;
 	}
 
+	if (!net_devmem_dmabuf_binding_get(binding)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
 	rcu_read_unlock();
 	return binding;
 
 out_unlock:
 	rcu_read_unlock();
-out_err:
-	if (binding)
-		net_devmem_dmabuf_binding_put(binding);
-
 	return ERR_PTR(err);
 }
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 9dcb629e10bfd..5bfb1b21d19f5 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -98,7 +98,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 		       struct netdev_nl_sock *priv,
 		       const struct sock *nl_sk,
 		       struct netlink_ext_ack *extack);
-struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 struct net_device *
 net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker);
@@ -184,11 +183,6 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
-{
-	return NULL;
-}
-
 static inline struct net_device *
 net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
-- 
2.56.1.750.gf70dc682cf-goog

