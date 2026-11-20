Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153801;
	b=FfkWQF6u9mPqcm4rBmRYYE7xmtebJzdYAC9u/1j6nfy9Aw6gReIUoOdWsE+5xmun7AdX
	 T/4bhFU9xJ5wZS3jMiSK6FKewF6gPVdEaGOHP9jAJJbfM1aaOvKLYA+uQl/yo3TP1yP+B
	 kcy+Usr+Qv940r7C9ZmGN3AyQHlhOYExIqrein5Q10ri4bn+PiMJ2/NteI4WpYUe/EjsU
	 GUTaOQO3Fu57d7Ie0GvVR6l6avxSvtxrgElf/uy6nCP+SmwlqXj+q+D3Ckv68eDAB1okq
	 HCJ8xZ/hlTfePakx3skIYx9mfWm39EGBr2vT9T0zykEgE7ZW22VDSL7Hn6ZZSZvwWZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=soppLwM6SpJBX+5i3j7riS251Hnqi+MeKdWJ/XQGWvQ=;
	b=O/nh5/LgqyWtgr4CjRCli19oMoKTl4EePFTMITYgWZm3VEkuztk5qw2uR0EjCHTOhsQw
	 ilPUAn+bUJ8wj6wqQ5mb7W07om5/HvcZYRprbsXkDYUNNrhE1XhP9XVp2diH9nQ6QxOPg
	 g6V9/XLN7Jn4yskFLFLN6etl+EIMvzTIUmOewgUKm+C/k+ZnRWkQpRVBmtiSd+bpLp29W
	 iTFHoR/4+X43DWl/tK36f+BpmzCO8XTmpYvPeoejJ81s8gfAO+6MTixub7bAYrtKRIZHz
	 bDK/FPu56SuN6C2osn6xgd5s21wMFZCA5cHTstXM/4Vigph8ZRY3FKj1cvZiULd7jBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8DMSzoM;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DCB606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DCB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8DMSzoM
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383435e46f9so372579eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153800; x=1795758600; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soppLwM6SpJBX+5i3j7riS251Hnqi+MeKdWJ/XQGWvQ=;
        b=V8DMSzoMsgGhNE2mw1aV/bblBJGeYYdfXaJrMDSwJg+drErxE887h+Ij1Yn+9BziuW
         78eM+qxlM6Bnp3x/RRiXrIRd8EJqjrwkvyweosvEq6V7yi62rGklW/0BQWrKBpzlqUtn
         XxlVPN6b5daLF3BVESvxu+wu48RccM8Ya0Ku3kY+DcTo911Oy2cw9bE2QRuW5K8WzAZh
         qn6NiQoj13ibsZfxEFKF86JQVFtUk3XN2DasxuoDuDRRhcsm73hRkvshrwUaQKqZ+G+H
         lbR3z+0Ad8gG1/3exmKLsKAcNPnEJoSPhnA3zzaIzp4ho1cRwa2StDkXrUyP7O+y/SmO
         bN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153800; x=1795758600;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soppLwM6SpJBX+5i3j7riS251Hnqi+MeKdWJ/XQGWvQ=;
        b=nHL9C+aL1L0CCYfhgBvQqbdg/gYlnUScLGbs4f9EV1qfsglLrD4xisV3E6/pyqwx4Q
         z543uQWWIcqyErADlvgZLk7TfKuIWQJtaWLRjrkk/KGg5se/siP1uFQXq20970xTsBMW
         xL5VyPf50HQoIVdmdnp/8VCwA1HC9LYsLJg7TUJeCW8W23c6GuTZeRingBLv1OUKEk/2
         g5fge8PsoTkQm+mTOQRSUwGtOV8noQF7GRBAYr+Y45vldydXGl/nwQfuwjQ1XnJJTZ8D
         3RnzpBDZFNJVdjOeAnC0klxQbkqd7CZxGabllU94uzzq96lf+ThqlwXKbJo7VLMLJD7D
         nN6w==
X-Gm-Message-State: APuU4Z+hXVQELfn7jIRGhQqzE9DeyaG7RkHM1EPpZoWZCtgf8hUbWuyE
	54KJrOestv4Cne1ITYMAI+aV8tYhtLS7GRlPTP+NgNVRxPh3bEoIjBtctC+mO2PDIvFIn1MycPk
	N9QJoT7lNQ6gK1F7WLtiyoa8VoIJznZo1ruLlIil5Gtk7dxtUVTvS1XrVJoNhcJ850iGTzWmCsY
	TSV3IHHt9zOIPUrWcCvI3jIizzja/o2GFpcRNWf/GN5G0rL3EBikomx2AXbGigBqs=
X-Received: from dycai24.prod.google.com ([2002:a05:7300:fb18:b0:385:58ae:e3af])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr1869362eec.22.1795153799854;
 Thu, 19 Nov 2026 21:49:59 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:13 +0000
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
Message-ID: <20261120045918.1239746-3-almasrymina@google.com>
Subject: [PATCH net-next v4 2/7] net: devmem: rename binding dev and vdev to
 map_dev and bind_dev
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

struct net_devmem_dmabuf_binding currently tracks two device pointers
under the names 'dev' and 'vdev':

- 'dev' is the physical net_device whose dma_dev holds the DMA mapping.
- 'vdev' is the virtual net_device the user bound to when using leased
  queues.

Rename 'dev' to 'map_dev' and 'vdev' to 'bind_dev' (typed as struct
net_device *), and rename the matching local variable in
netdev_nl_bind_tx_doit() from 'bind_dev' to 'map_dev' to match. No
functional change.

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/dev.c         |  2 +-
 net/core/devmem.c      | 38 ++++++++++++++++++++------------------
 net/core/devmem.h      | 17 +++++++++--------
 net/core/netdev-genl.c | 31 +++++++++++++++----------------
 4 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 1a63f6b939f70..79dd15fb34659 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4192,7 +4192,7 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
 		if (net_is_devmem_iov(niov) &&
 		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
-		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
+		     READ_ONCE(net_devmem_iov_binding(niov)->map_dev) != dev))
 			goto out_free;
 	}
 
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 056e185410cd4..604718bed3cb2 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -157,7 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+	dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
@@ -227,13 +227,14 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 
 		rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
+		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
 			busy = true;
 	}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->dev && !busy) {
+	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
+	    !busy) {
 		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -252,16 +253,16 @@ void net_devmem_dev_unregister(struct net_device *dev)
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
 		if (binding->direction == DMA_FROM_DEVICE) {
-			if (READ_ONCE(binding->dev) != dev ||
+			if (READ_ONCE(binding->map_dev) != dev ||
 			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE))
 				continue;
 		} else {
-			if (READ_ONCE(binding->vdev) == dev)
-				WRITE_ONCE(binding->vdev, NULL);
-			if (READ_ONCE(binding->dev) != dev)
+			if (READ_ONCE(binding->bind_dev) == dev)
+				WRITE_ONCE(binding->bind_dev, NULL);
+			if (READ_ONCE(binding->map_dev) != dev)
 				continue;
-			WRITE_ONCE(binding->vdev, NULL);
+			WRITE_ONCE(binding->bind_dev, NULL);
 			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE);
 		}
@@ -270,7 +271,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 		if (!netif_is_queue_leasee(dev))
 			net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 	xa_unlock(&net_devmem_dmabuf_bindings);
 }
@@ -318,7 +319,8 @@ static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
 
 /* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -346,14 +348,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		return ERR_CAST(dmabuf);
 
 	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
-			       dev_to_node(&dev->dev));
+			       dev_to_node(&map_dev->dev));
 	if (!binding) {
 		err = -ENOMEM;
 		goto err_put_dmabuf;
 	}
 
-	binding->dev = dev;
-	binding->vdev = vdev;
+	binding->map_dev = map_dev;
+	binding->bind_dev = bind_dev;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
@@ -582,8 +584,8 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 */
 	dst_dev = dst_dev_rcu(dst);
 	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->dev) &&
-		     dst_dev != READ_ONCE(binding->vdev))) {
+	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
+		     dst_dev != READ_ONCE(binding->bind_dev))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
@@ -709,8 +711,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 		if (xa_empty(&binding->bound_rxqs)) {
 			if (!rxq->lease)
 				net_devmem_dmabuf_binding_unmap(binding);
-			ASSERT_EXCLUSIVE_WRITER(binding->dev);
-			WRITE_ONCE(binding->dev, NULL);
+			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
+			WRITE_ONCE(binding->map_dev, NULL);
 		}
 		break;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c0aaba0041ff6..9dcb629e10bfd 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -22,14 +22,13 @@ struct net_devmem_dmabuf_binding {
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sgt;
 	/* Physical NIC that does the actual DMA for this binding. Set at bind
-	 * time and cleared to NULL under netdev_lock(dev).
+	 * time and cleared to NULL under netdev_lock(map_dev).
 	 */
-	struct net_device *dev;
-	/* Opaque cookie identifying the virtual device (e.g. netkit) the user
-	 * called bind-tx on. Used only for pointer comparison via READ_ONCE()
-	 * and cleared with WRITE_ONCE() on unregistration. Never dereferenced.
+	struct net_device *map_dev;
+	/* Device the user called bind-rx or bind-tx on. Set at bind time and
+	 * cleared to NULL on unregistration.
 	 */
-	void *vdev;
+	struct net_device *bind_dev;
 	possible_net_t net;
 	kuid_t uid;
 	/* Serialize net_devmem_dmabuf_binding_unmap() on attachment and sgt */
@@ -91,7 +90,8 @@ struct net_devmem_dmabuf_binding {
 #if defined(CONFIG_NET_DEVMEM)
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -171,7 +171,8 @@ static inline void net_devmem_net_iov_dec_ref(struct net_iov *niov)
 }
 
 static inline struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 5f96808da59fd..4c63b59023323 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1195,9 +1195,8 @@ netdev_find_netmem_tx_dev(struct net_device *dev)
 int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	struct net_device *bind_dev;
+	struct net_device *netdev, *map_dev;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	struct device *dma_dev;
 	u32 ifindex, dmabuf_fd;
 	struct sk_buff *rsp;
@@ -1245,27 +1244,27 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
-	bind_dev = netdev_find_netmem_tx_dev(netdev);
-	if (!bind_dev) {
+	map_dev = netdev_find_netmem_tx_dev(netdev);
+	if (!map_dev) {
 		err = -EOPNOTSUPP;
 		NL_SET_ERR_MSG(info->extack,
 			       "No DMA-capable device found for netmem TX");
 		goto err_unlock_netdev;
 	}
 
-	if (bind_dev != netdev)
-		netdev_lock(bind_dev);
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
 
-	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
+	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
 
-	binding = net_devmem_bind_dmabuf(bind_dev,
-					 bind_dev != netdev ? netdev : NULL,
+	binding = net_devmem_bind_dmabuf(map_dev,
+					 map_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
 					 0, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-		goto err_unlock_bind_dev;
+		goto err_unlock_map_dev;
 	}
 
 	/* rsp was allocated large enough */
@@ -1273,16 +1272,16 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 
 	genlmsg_end(rsp, hdr);
 
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	netdev_unlock(netdev);
 	mutex_unlock(&priv->lock);
 
 	return genlmsg_reply(rsp, info);
 
-err_unlock_bind_dev:
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+err_unlock_map_dev:
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 err_unlock_netdev:
 	netdev_unlock(netdev);
 err_unlock_sock:
@@ -1476,7 +1475,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.1.750.gf70dc682cf-goog

