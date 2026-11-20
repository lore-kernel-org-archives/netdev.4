Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153806;
	b=eMhnMXzA5shXJZ1XWgrG70YrcKawhn0cotBQE/AJmzc0SVZKNexYBA2CadYKRK2Ii7l6
	 0weVbY9p2nXgj8b+WUb4NlX62Vmd1fc0r4BExiTu8mk19oGHvhM1lX4EZ8w73Q0pjmmsq
	 Giet6sXNfBPeo1ZZmZ16tGEtPj7iLtFw+ywYwu6Um5oQO30GPJqCIyIp3yFo710yfY8uw
	 O+XT7I7lnY7n7onfbUesUi/rrQKLHT2Z3EeIMRwbmkF8pcKMemNSmnwrRpVGGxtE2caQX
	 r5md2z7LLPrABmm0CRGDjfIJ5kxhBU3dE1SoPmOElqXS2hD37O9lqKbsoPweFgllkwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UNZ8PIlApPjYFCSJLof3zWVExUY0A0mLvs6oEnO1VoM=;
	b=qOXdbu5gKno13BPNvj0hshZtRDyi11V6zdwpdd7AVso8UeY/o+HsVeF5yqMQNO0oP2g8
	 p3xfypy4XR4GxjGJCrS0BgNiGKI2hD6qWRirllkmtOxsP09hMtIyb7tmMCgzR53QKtwMG
	 Q7x6QksUz+MYYioV66Attmby6K7/xx5dp4mMYCv0uOQ5uNrCDCr1rMm3Os3GrgSvHbOBU
	 Z9MwA0jL0rtM7yYugZLXJu5aFeOcyFl1KEZN2lqYUbetpV2Sk3WLcz+dMvd9Q6y+hQQxq
	 mU16fomEY7jMvCU3dV65NbvjD5DbOZw4Pg5qOnyxAJpCHPMmtwhSKQ4PIqRmZALp4sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HBIV+f7j;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AD606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562AD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HBIV+f7j
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso595564eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153804; x=1795758604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNZ8PIlApPjYFCSJLof3zWVExUY0A0mLvs6oEnO1VoM=;
        b=HBIV+f7jKAr61LW/MvWykVYm9Y9aRtuxjG4DC9vLl9iqfOQJWGXyjq5hr/2ohQjo0R
         dGPMV8RnK/PY0SOUsdyT0DzgbrJm4Y9x6pMpct5hHegNpIeSgyq3QEev7DIFtMM8XA+m
         S3pIOF9HlABTsfs4uA7CK9HGWWPyqPpJV4Tcx67L1lv7+w4dEZBHXTS1S9f/S2grJGwF
         4VSeksxFpnGN6hfq+sIeGYNbMPa4ypXcOzpxQV8Ww3Iwgm3OSGL7BOT/xwXoRfa7l7/T
         JnMThPDbDUb3BOi0Jj5sZXvtITM0FYjTR+SLvgoXxn8OA6eXCTv47J9N3CR/xa92Kw+Q
         9e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153804; x=1795758604;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNZ8PIlApPjYFCSJLof3zWVExUY0A0mLvs6oEnO1VoM=;
        b=ZDRVJGwF1TmYkVWyy4P37gZ0cJwKb09bQeQx1jj2lAj52+xwPO3wz8sE+jd7d7nwQO
         2LtmEJVUM1kdUi6IpuQJYaZ+LynoaZtmHehVaoqHDycqUjdDUH7KkW1MkNXrUMOyI7Qz
         ZyqEDszbSgbE67Gr7LHTAv9NoFi6tFXusAtejEWcv+4t/7mcze64xsC/FBcGcj4Ansde
         FsbZksJjWfvSQSrgS5WmuHB2rcprzFccgylzr78eNmk2i19Ov43IpZXZ9k92GCh47g3U
         IQJRED+8I3vXbR4PRhVNnISwXkWah6qpfTtoky85rHWrWw0BaCfgnfduT6OebGpw7Hz1
         +Oeg==
X-Gm-Message-State: APuU4Z/YVV7UNa4O1xBqG+vPaGBFlFUdE1MfQigoeA7agtnOXHCscv1a
	Y6xolfaVewUgewNlx6NBkSYKb/tkPygnM7uchpsd9qr8iVqgDma8XCe1bklVmONjfC1d0fdvNZy
	QlIwbN6cMQ/Is38C7UcuCy+0JHu7dggIa0VXPB0cktK5htEcUd37XVjS6xb9JZG6zkiXe4He9O9
	zSz3j1ppuVTlV9eS/t/RVYqrjGZgo6QOrGdaHRV2JOY9qwSa3YE39hXIU9BUk1VPY=
X-Received: from dybmb7.prod.google.com ([2002:a05:7301:1907:b0:384:7a9f:7f2])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr2305191eec.1.1795153803556;
 Thu, 19 Nov 2026 21:50:03 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:16 +0000
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
Message-ID: <20261120045918.1239746-6-almasrymina@google.com>
Subject: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Previously, bind_dev was only populated when bind-tx was called on a
virtual netdev (where map_dev != netdev), and socket teardown, queue
uninstall, and net_devmem_dev_unregister() did not uniformly track both
bind_dev and map_dev across RX and TX bindings.

Always populate bind_dev with the net_device the user called bind-rx or
bind-tx on (equal to map_dev for direct bindings, or the virtual device
for leased bindings), and handle teardown and unregistration of both
pointers in either order:

- Lock &binding->bind_dev during socket teardown in
  netdev_nl_sock_priv_destroy() and pass binding->bind_dev to
  netif_mp_close_rxq() in net_devmem_unbind_dmabuf(), because bound_rxqs
  stores queues belonging to bind_dev and netif_mp_close_rxq() expects
  the leasee device so it can redirect through the lease and lock
  map_dev.
- Require binding->map_dev to remain non-NULL in
  net_devmem_get_binding() so TX lookups fail once map_dev unregisters
  even if bind_dev is still registered.
- Clear binding->bind_dev in mp_dmabuf_devmem_uninstall() once
  bound_rxqs is empty, leaving leased bindings mapped until the binding
  is freed or map_dev is unregistered, because
  netif_rxq_cleanup_unlease() runs while map_dev may still be up and
  ignores __netif_mp_close_rxq() failures.
- In net_devmem_dev_unregister(dev), first walk the bindings to clear
  NET_DEVMEM_BINDING_LIVE to stop new lookups (and clear
  binding->bind_dev only when bound_rxqs is empty or dev is not a queue
  leasee so leased RX bindings keep binding->bind_dev valid until
  ndo_uninit's netif_rxq_cleanup_unlease() uninstalls the virtual
  queues). If any binding has binding->map_dev == dev, wait for an RCU
  grace period via synchronize_net() so no in-flight
  net_devmem_get_binding() lookups remain, then re-walk the bindings to
  unmap the dmabuf while map_dev is still valid and clear
  binding->map_dev.

These issues were discovered during AI code review (Sashiko) of the
earlier non-leased devmem unregister series (and subsequent mailing list
review) and confirmed by code inspection (not observed in production or
reproduced on real hardware). Tested with the nl_netdev.py selftest on
netdevsim added in this series.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 91 +++++++++++++++++++++++++-----------------
 net/core/devmem.h      |  8 ++--
 net/core/netdev-genl.c | 17 ++++----
 3 files changed, 67 insertions(+), 49 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6f85b90950f8b..80c3e149cd762 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -86,7 +86,7 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
 
 /**
  * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
- * @dev_ptr:		pointer to the net_device field on a devmem binding
+ * @dev_ptr:		pointer to &binding->map_dev or &binding->bind_dev
  * @dev_tracker:	reftracker for the held net_device reference
  *
  * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
@@ -95,17 +95,18 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
  * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
  * NULL while holding netdev_lock() on that device (in
  * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
- * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
- * synchronize_net() and netdev_run_todo() free the net_device).
+ * net_devmem_dev_unregister(), all before synchronize_net() and
+ * netdev_run_todo() free the net_device).
  *
  * Taking rcu_read_lock() guarantees that a non-NULL device read from
  * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
  * (which waits for an RCU grace period via synchronize_net() after
- * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
- * safely acquire a reference before sleeping on netdev_lock(). Once
- * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
- * guarantees that the device has not yet been detached from the binding and
- * cannot finish unregistering until net_devmem_unlock_dev().
+ * NETDEV_UNREGISTER and ndo_uninit before freeing the net_device), so
+ * netdev_hold() can safely acquire a reference before sleeping on
+ * netdev_lock(). Once netdev_lock() is held, re-checking that
+ * READ_ONCE(*dev_ptr) == dev guarantees that the device has not yet been
+ * detached from the binding and cannot finish unregistering until
+ * net_devmem_unlock_dev().
  *
  * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
  * or NULL if already cleared.
@@ -219,22 +220,23 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	if (binding->list.next)
 		list_del(&binding->list);
 
-	xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
-		const struct pp_memory_provider_params mp_params = {
-			.mp_priv	= binding,
-			.mp_ops		= &dmabuf_devmem_ops,
-		};
+	if (binding->bind_dev) {
+		xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
+			const struct pp_memory_provider_params mp_params = {
+				.mp_priv	= binding,
+				.mp_ops		= &dmabuf_devmem_ops,
+			};
 
-		rxq_idx = get_netdev_rx_queue_index(rxq);
+			rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
-			busy = true;
-	}
+			if (netif_mp_close_rxq(binding->bind_dev, rxq_idx,
+					       &mp_params))
+				busy = true;
+		}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
-	    !busy) {
-		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->map_dev, NULL);
+		if (binding->direction == DMA_FROM_DEVICE && !busy)
+			net_devmem_dmabuf_binding_unmap(binding);
+		WRITE_ONCE(binding->bind_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -244,6 +246,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	unsigned long xa_idx;
+	bool unmap = false;
 
 	netdev_assert_locked(dev);
 
@@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device *dev)
 
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
-		if (binding->direction == DMA_FROM_DEVICE) {
-			if (READ_ONCE(binding->map_dev) != dev ||
-			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
-					NET_DEVMEM_BINDING_LIVE))
-				continue;
-		} else {
-			if (READ_ONCE(binding->bind_dev) == dev)
+		if (READ_ONCE(binding->bind_dev) == dev) {
+			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
+					NET_DEVMEM_BINDING_LIVE);
+			if (xa_empty(&binding->bound_rxqs) ||
+			    !netif_is_queue_leasee(dev))
 				WRITE_ONCE(binding->bind_dev, NULL);
-			if (READ_ONCE(binding->map_dev) != dev)
-				continue;
-			WRITE_ONCE(binding->bind_dev, NULL);
+		}
+		if (READ_ONCE(binding->map_dev) == dev) {
 			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE);
+			unmap = true;
 		}
+	}
+	xa_unlock(&net_devmem_dmabuf_bindings);
+
+	if (!unmap)
+		return;
+
+	/* Ensure no tx net_devmem_get_binding() are in flight after
+	 * NET_DEVMEM_BINDING_LIVE is cleared.
+	 */
+	synchronize_net();
+
+	xa_lock(&net_devmem_dmabuf_bindings);
+	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
+		if (READ_ONCE(binding->map_dev) != dev)
+			continue;
 
 		xa_unlock(&net_devmem_dmabuf_bindings);
 		if (!netif_is_queue_leasee(dev))
@@ -535,8 +551,8 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 							 unsigned int dmabuf_id)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	struct net_device *dst_dev, *map_dev;
 	unsigned long xa_idx = dmabuf_id;
-	struct net_device *dst_dev;
 	struct dst_entry *dst;
 	int err;
 
@@ -568,9 +584,10 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 * net_device.
 	 */
 	dst_dev = dst_dev_rcu(dst);
-	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
-		     dst_dev != READ_ONCE(binding->bind_dev))) {
+	map_dev = READ_ONCE(binding->map_dev);
+	if (unlikely(!dst_dev || !map_dev ||
+		     (dst_dev != map_dev &&
+		      dst_dev != READ_ONCE(binding->bind_dev)))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
@@ -697,8 +714,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 		if (xa_empty(&binding->bound_rxqs)) {
 			if (!rxq->lease)
 				net_devmem_dmabuf_binding_unmap(binding);
-			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
-			WRITE_ONCE(binding->map_dev, NULL);
+			ASSERT_EXCLUSIVE_WRITER(binding->bind_dev);
+			WRITE_ONCE(binding->bind_dev, NULL);
 		}
 		break;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 5bfb1b21d19f5..4028da2b2a711 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -25,8 +25,10 @@ struct net_devmem_dmabuf_binding {
 	 * time and cleared to NULL under netdev_lock(map_dev).
 	 */
 	struct net_device *map_dev;
-	/* Device the user called bind-rx or bind-tx on. Set at bind time and
-	 * cleared to NULL on unregistration.
+	/* Device the user called bind-rx or bind-tx on. Equal to map_dev for
+	 * direct bindings, or the virtual device (e.g. netkit) for leased
+	 * bindings. Set at bind time and cleared to NULL under
+	 * netdev_lock(bind_dev).
 	 */
 	struct net_device *bind_dev;
 	possible_net_t net;
@@ -44,7 +46,7 @@ struct net_devmem_dmabuf_binding {
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use. RX bindings are unmapped earlier when their queues are closed or
 	 * uninstalled, unless a leased or busy queue may still use the binding.
-	 * TX bindings are also unmapped earlier if their device is
+	 * Both RX and TX bindings are also unmapped earlier if map_dev is
 	 * unregistered.
 	 *
 	 * net_devmem_net_iov_inc_ref() on dmabuf net_iovs will increment this
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 4c63b59023323..c2b8ec0058a34 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1110,9 +1110,10 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
-					 dmabuf_fd, niov_shift, priv,
-					 NETLINK_CB(skb).sk, info->extack);
+	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
+					 DMA_FROM_DEVICE, dmabuf_fd,
+					 niov_shift, priv, NETLINK_CB(skb).sk,
+					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
@@ -1257,11 +1258,9 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 
 	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
 
-	binding = net_devmem_bind_dmabuf(map_dev,
-					 map_dev != netdev ? netdev : NULL,
-					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 0, priv, NETLINK_CB(skb).sk,
-					 info->extack);
+	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
+					 DMA_TO_DEVICE, dmabuf_fd, 0, priv,
+					 NETLINK_CB(skb).sk, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_unlock_map_dev;
@@ -1475,7 +1474,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->bind_dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.1.750.gf70dc682cf-goog

