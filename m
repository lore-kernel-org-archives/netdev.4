Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072990;
	b=NeOLMLt69HrtxKH9KlqSQr5b6SLh1ioDwYDgUcWGDN8KGConPU463A/C94b7qzGU1l/y
	 ao5ftxPH7jbXVijyeKZ77LoHeSmjfVDLhi2bk3OzTVTyEB3ZwgbEcpRQ/8ldMAU1sagtv
	 u5NOCNH1zBu6Lpx6tGzHmN6bsiJCBzSpbeiLb5Hp7YnTSM76TW4repqKFLe8zX+fdu4n2
	 wolai0vzmIsB0vAJV8ZKY1fD8PlrSBEI/HcNHycqz6kScgfjImsBp2E5o8k9Wuz2VIrSs
	 kVeQB5obkoizGcPErSuc/A3QbpbOT2MWyL9tswLr70MVjyAUdi3YUQDUucGhzw5FbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072990;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=muQhZu+36l1uAaLyrixHWU6gCsLqKYzMEFKAfZjRkXY=;
	b=NbE5w9WpERJ8jxi1UdlHfuCZCj1CQflrZ3R4mQNe12PUPtXCnS1F6ZtwuJj+9KpFK/OZ
	 O5tJyu5V87mkJ/ZW/ii5vNc+cqxBxS0iPK34hskljKkUnizVfZW16WTpcBgzblpo/zeSB
	 B72NotLmczGLpH036VV5Mx4s0qfd1sXkeV18iqgOG6ghu9U5oYP55wHOsjNoUnXJo5aMC
	 loEszkZpbmvPEp/cG6UWR8e0GI7GDSAurV9tlYFxD7hPq7lIANaaBY53CkBeSAfaO0xA/
	 N9swsOt4yiKRvM2ObaqhhGq+64lZxmFBUDJeZooifOiAFbvFSq57FJurpJ3rHfZJcaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FStw+1ih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BD0606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FStw+1ih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2071F000C4;
	Thu, 19 Nov 2026 07:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072989;
	bh=muQhZu+36l1uAaLyrixHWU6gCsLqKYzMEFKAfZjRkXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FStw+1ihWn9waFLU4+2BU5a4HaSZ30CZVFtRRIkZEW9V1oSFPEvyH14lYa1EQNFk2
	 1vsJyLDaWtgdV9sUWtu/aghfIZWIG/DsNsiW+lsGi0TidOxeUOtV+8UXpiR1PEItib
	 KZhazRuwmxbYHducz6l2UAigDLgA06CtjZR0pfPY6+bzcs1S7uPhryCdx9y/MQOcga
	 BGbrzGbQ3zpRZkTIvUwot6X5ld9aCVTmmJghjXB7WKo9EM5DZNC/ZvoIATzHEj4qPj
	 49A++WTyQ4PEnKvfH/24oLMSWmWV7Q/ZV+xHQ4MuDwxVWX892EPMbCVOB+xaJJoXsa
	 lorsW27GFscqA==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 2/4] tap: add a mutex to protect queue management
Date: Thu, 19 Nov 2026 08:22:56 +0100
Message-ID: <20261119072258.3157902-3-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119072258.3157902-1-edumazet@kernel.org>
References: <20261119072258.3157902-1-edumazet@kernel.org>
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

The list of queues attached to a tap device (tap->taps[],
tap->queue_list, tap->numvtaps, tap->numqueues) and the back pointer
from each queue (q->tap, q->enabled, q->queue_index) are all private
to tap, but are protected by RTNL.

Add tap->lock, a per-device mutex nesting inside RTNL, and hold it in
every function reading or changing this state: tap_open(),
tap_put_queue(), the TUNSETQUEUE ioctl, tap_del_queues() and
tap_queue_resize(). A mutex is needed because tap_open() and
tap_queue_resize() allocate ptr_ring storage with GFP_KERNEL.

Add tap->ring_size, the ptr_ring size shared by all the queues of a
device. It is updated under the mutex when tap_queue_resize() succeeds
and is used by tap_open() instead of dev->tx_queue_len. Once RTNL is
gone, tap_open() can thus not size a new ring from a tx_queue_len
which is being changed, or rolled back by netif_change_tx_queue_len()
after a failure.

tap_handle_frame() reads tap->numvtaps locklessly, add the missing
WRITE_ONCE() annotations while touching these lines.

The mutex is initialized in the macvtap and ipvtap ->setup() handlers
and destroyed from dev->priv_destructor, once all references to the
device are gone. macvtap has to chain to the macvlan destructor,
export macvlan_dev_free() for this purpose.

Set tap->dev before the netdevice is registered instead of after,
since the char device can be opened as soon as the NETDEV_REGISTER
notifier has run. Like the mutex itself this has no effect yet: RTNL
is still held by all callers, and is removed from the paths that do
not need it in the following patch.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/ipvlan/ipvtap.c | 15 +++++++-
 drivers/net/macvlan.c       |  3 +-
 drivers/net/macvtap.c       | 16 +++++++-
 drivers/net/tap.c           | 74 +++++++++++++++++++++++--------------
 include/linux/if_macvlan.h  |  2 +
 include/linux/if_tap.h      | 10 +++++
 6 files changed, 87 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ipvlan/ipvtap.c b/drivers/net/ipvlan/ipvtap.c
index d17daa1040967a1d80cede5d740d957204fe1186..901697ff2169dce11dc90733dd9375af9b47e24e 100644
--- a/drivers/net/ipvlan/ipvtap.c
+++ b/drivers/net/ipvlan/ipvtap.c
@@ -82,6 +82,8 @@ static int ipvtap_newlink(struct net_device *dev,
 	int err;
 
 	INIT_LIST_HEAD(&vlantap->tap.queue_list);
+	vlantap->tap.dev = dev;
+	vlantap->tap.ring_size = dev->tx_queue_len;
 
 	/* Since macvlan supports all offloads by default, make
 	 * tap support all offloads also.
@@ -104,8 +106,6 @@ static int ipvtap_newlink(struct net_device *dev,
 		return err;
 	}
 
-	vlantap->tap.dev = vlantap->vlan.dev;
-
 	return err;
 }
 
@@ -128,11 +128,22 @@ static void ipvtap_dellink(struct net_device *dev,
 	mutex_unlock(&port->pnodes_lock);
 }
 
+static void ipvtap_dev_free(struct net_device *dev)
+{
+	struct ipvtap_dev *vlantap = netdev_priv(dev);
+
+	mutex_destroy(&vlantap->tap.lock);
+}
+
 static void ipvtap_setup(struct net_device *dev)
 {
+	struct ipvtap_dev *vlantap = netdev_priv(dev);
+
 	ipvlan_link_setup(dev);
 	dev->tx_queue_len = TUN_READQ_SIZE;
 	dev->priv_flags &= ~IFF_NO_QUEUE;
+	dev->priv_destructor = ipvtap_dev_free;
+	mutex_init(&vlantap->tap.lock);
 }
 
 static struct rtnl_link_ops ipvtap_link_ops __read_mostly = {
diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index 96ec9bafa525f37d38839ea32d6ee419c2d841a7..c7afa736c472bcfaa7d3065132e633b58968cdd4 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -1230,13 +1230,14 @@ static const struct net_device_ops macvlan_netdev_ops = {
 	.ndo_hwtstamp_set	= macvlan_hwtstamp_set,
 };
 
-static void macvlan_dev_free(struct net_device *dev)
+void macvlan_dev_free(struct net_device *dev)
 {
 	struct macvlan_dev *vlan = netdev_priv(dev);
 
 	/* Get rid of the macvlan's reference to lowerdev */
 	netdev_put(vlan->lowerdev, &vlan->dev_tracker);
 }
+EXPORT_SYMBOL_GPL(macvlan_dev_free);
 
 void macvlan_common_setup(struct net_device *dev)
 {
diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
index 3e88ca35cff2f9c755f8aff694e1c4ca83566741..32e6797014d6925745d5e99c8be6f5cf2ddf1832 100644
--- a/drivers/net/macvtap.c
+++ b/drivers/net/macvtap.c
@@ -86,6 +86,8 @@ static int macvtap_newlink(struct net_device *dev,
 	int err;
 
 	INIT_LIST_HEAD(&vlantap->tap.queue_list);
+	vlantap->tap.dev = dev;
+	vlantap->tap.ring_size = dev->tx_queue_len;
 
 	/* Since macvlan supports all offloads by default, make
 	 * tap support all offloads also.
@@ -112,8 +114,6 @@ static int macvtap_newlink(struct net_device *dev,
 		return err;
 	}
 
-	vlantap->tap.dev = vlantap->vlan.dev;
-
 	return 0;
 }
 
@@ -124,10 +124,22 @@ static void macvtap_dellink(struct net_device *dev,
 	macvlan_dellink(dev, head);
 }
 
+static void macvtap_dev_free(struct net_device *dev)
+{
+	struct macvtap_dev *vlantap = netdev_priv(dev);
+
+	mutex_destroy(&vlantap->tap.lock);
+	macvlan_dev_free(dev);
+}
+
 static void macvtap_setup(struct net_device *dev)
 {
+	struct macvtap_dev *vlantap = netdev_priv(dev);
+
 	macvlan_common_setup(dev);
 	dev->tx_queue_len = TUN_READQ_SIZE;
+	dev->priv_destructor = macvtap_dev_free;
+	mutex_init(&vlantap->tap.lock);
 }
 
 static struct net *macvtap_link_net(const struct net_device *dev)
diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index ded0be1dfdd1e3123acb08e75aa9a874c9e949b5..e8250857bce12f140b35f2b0b47f603e53a292d5 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -65,7 +65,7 @@ static struct tap_dev *tap_dev_get_rcu(const struct net_device *dev)
  * RCU usage:
  * The tap_queue and the macvlan_dev are loosely coupled, the
  * pointers from one to the other can only be read while rcu_read_lock
- * or rtnl is held.
+ * or tap->lock is held.
  *
  * Both the file and the macvlan_dev hold a reference on the tap_queue
  * through sock_hold(&q->sk). When the macvlan_dev goes away first,
@@ -83,7 +83,7 @@ static int tap_enable_queue(struct tap_dev *tap, struct file *file,
 {
 	int err = -EINVAL;
 
-	ASSERT_RTNL();
+	lockdep_assert_held(&tap->lock);
 
 	if (q->enabled)
 		goto out;
@@ -93,15 +93,16 @@ static int tap_enable_queue(struct tap_dev *tap, struct file *file,
 	q->queue_index = tap->numvtaps;
 	q->enabled = true;
 
-	tap->numvtaps++;
+	WRITE_ONCE(tap->numvtaps, tap->numvtaps + 1);
 out:
 	return err;
 }
 
-/* Requires RTNL */
 static int tap_set_queue(struct tap_dev *tap, struct file *file,
 			 struct tap_queue *q)
 {
+	lockdep_assert_held(&tap->lock);
+
 	if (tap->dead)
 		return -ENODEV;
 
@@ -118,35 +119,32 @@ static int tap_set_queue(struct tap_dev *tap, struct file *file,
 	file->private_data = q;
 	list_add_tail(&q->next, &tap->queue_list);
 
-	tap->numvtaps++;
+	WRITE_ONCE(tap->numvtaps, tap->numvtaps + 1);
 	tap->numqueues++;
 
 	return 0;
 }
 
-static int tap_disable_queue(struct tap_queue *q)
+static int tap_disable_queue(struct tap_dev *tap, struct tap_queue *q)
 {
-	struct tap_dev *tap;
 	struct tap_queue *nq;
+	int index;
 
-	ASSERT_RTNL();
+	lockdep_assert_held(&tap->lock);
 	if (!q->enabled)
 		return -EINVAL;
 
-	tap = rtnl_dereference(q->tap);
+	index = q->queue_index;
+	BUG_ON(index >= tap->numvtaps);
+	nq = rcu_dereference_protected(tap->taps[tap->numvtaps - 1],
+				       lockdep_is_held(&tap->lock));
+	nq->queue_index = index;
 
-	if (tap) {
-		int index = q->queue_index;
-		BUG_ON(index >= tap->numvtaps);
-		nq = rtnl_dereference(tap->taps[tap->numvtaps - 1]);
-		nq->queue_index = index;
+	rcu_assign_pointer(tap->taps[index], nq);
+	RCU_INIT_POINTER(tap->taps[tap->numvtaps - 1], NULL);
+	q->enabled = false;
 
-		rcu_assign_pointer(tap->taps[index], nq);
-		RCU_INIT_POINTER(tap->taps[tap->numvtaps - 1], NULL);
-		q->enabled = false;
-
-		tap->numvtaps--;
-	}
+	WRITE_ONCE(tap->numvtaps, tap->numvtaps - 1);
 
 	return 0;
 }
@@ -156,7 +154,7 @@ static int tap_disable_queue(struct tap_queue *q)
  * the reference that the files holds as well as the
  * one from the macvlan_dev if that still exists.
  *
- * Using the spinlock makes sure that we don't get
+ * Using tap->lock makes sure that we don't get
  * to the queue again after destroying it.
  */
 static void tap_put_queue(struct tap_queue *q)
@@ -167,13 +165,15 @@ static void tap_put_queue(struct tap_queue *q)
 	tap = rtnl_dereference(q->tap);
 
 	if (tap) {
+		mutex_lock(&tap->lock);
 		if (q->enabled)
-			BUG_ON(tap_disable_queue(q));
+			BUG_ON(tap_disable_queue(tap, q));
 
 		tap->numqueues--;
 		RCU_INIT_POINTER(q->tap, NULL);
 		sock_put(&q->sk);
 		list_del_init(&q->next);
+		mutex_unlock(&tap->lock);
 	}
 
 	rtnl_unlock();
@@ -240,11 +240,12 @@ void tap_del_queues(struct tap_dev *tap)
 	struct tap_queue *q, *tmp;
 
 	ASSERT_RTNL();
+	mutex_lock(&tap->lock);
 	list_for_each_entry_safe(q, tmp, &tap->queue_list, next) {
 		list_del_init(&q->next);
 		RCU_INIT_POINTER(q->tap, NULL);
 		if (q->enabled)
-			tap->numvtaps--;
+			WRITE_ONCE(tap->numvtaps, tap->numvtaps - 1);
 		tap->numqueues--;
 		sock_put(&q->sk);
 	}
@@ -252,6 +253,7 @@ void tap_del_queues(struct tap_dev *tap)
 	BUG_ON(tap->numqueues);
 	/* guarantee that any future tap_set_queue will fail */
 	tap->dead = true;
+	mutex_unlock(&tap->lock);
 }
 EXPORT_SYMBOL_GPL(tap_del_queues);
 
@@ -464,7 +466,14 @@ static int tap_open(struct inode *inode, struct file *file)
 					     &tap_proto, 0);
 	if (!q)
 		goto err;
-	if (ptr_ring_init(&q->ring, tap->dev->tx_queue_len, GFP_KERNEL)) {
+
+	/* Use tap->ring_size instead of dev->tx_queue_len, which might be
+	 * changing: a concurrent tap_queue_resize() either sees this queue
+	 * or has already updated tap->ring_size.
+	 */
+	mutex_lock(&tap->lock);
+	if (ptr_ring_init(&q->ring, tap->ring_size, GFP_KERNEL)) {
+		mutex_unlock(&tap->lock);
 		sk_free(&q->sk);
 		goto err;
 	}
@@ -491,6 +500,7 @@ static int tap_open(struct inode *inode, struct file *file)
 		sock_set_flag(&q->sk, SOCK_ZEROCOPY);
 
 	err = tap_set_queue(tap, file, q);
+	mutex_unlock(&tap->lock);
 	if (err) {
 		/* tap_sock_destruct() will take care of freeing ptr_ring */
 		goto err_put;
@@ -848,12 +858,14 @@ static int tap_ioctl_set_queue(struct file *file, unsigned int flags)
 	if (!tap)
 		return -EINVAL;
 
+	mutex_lock(&tap->lock);
 	if (flags & IFF_ATTACH_QUEUE)
 		ret = tap_enable_queue(tap, file, q);
 	else if (flags & IFF_DETACH_QUEUE)
-		ret = tap_disable_queue(q);
+		ret = tap_disable_queue(tap, q);
 	else
 		ret = -EINVAL;
+	mutex_unlock(&tap->lock);
 
 	tap_put_tap_dev(tap);
 	return ret;
@@ -1207,12 +1219,14 @@ int tap_queue_resize(struct tap_dev *tap)
 	struct net_device *dev = tap->dev;
 	struct tap_queue *q;
 	struct ptr_ring **rings;
-	int n = tap->numqueues;
-	int ret, i = 0;
+	int ret = -ENOMEM;
+	int n, i = 0;
 
+	mutex_lock(&tap->lock);
+	n = tap->numqueues;
 	rings = kmalloc_objs(*rings, n);
 	if (!rings)
-		return -ENOMEM;
+		goto unlock;
 
 	list_for_each_entry(q, &tap->queue_list, next)
 		rings[i++] = &q->ring;
@@ -1220,8 +1234,12 @@ int tap_queue_resize(struct tap_dev *tap)
 	ret = ptr_ring_resize_multiple_bh(rings, n,
 					  dev->tx_queue_len, GFP_KERNEL,
 					  __skb_array_destroy_skb);
+	if (!ret)
+		tap->ring_size = dev->tx_queue_len;
 
 	kfree(rings);
+unlock:
+	mutex_unlock(&tap->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tap_queue_resize);
diff --git a/include/linux/if_macvlan.h b/include/linux/if_macvlan.h
index 0f7281e3e448891a78c24b096862a2de790b7687..7a2bfbcfea1f95b01c17d38e30725a5a2f0f6616 100644
--- a/include/linux/if_macvlan.h
+++ b/include/linux/if_macvlan.h
@@ -59,6 +59,8 @@ static inline void macvlan_count_rx(const struct macvlan_dev *vlan,
 
 extern void macvlan_common_setup(struct net_device *dev);
 
+void macvlan_dev_free(struct net_device *dev);
+
 struct rtnl_newlink_params;
 
 extern int macvlan_common_newlink(struct net_device *dev,
diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
index e9c4c9272585cdb14cf0ea7ea7d96acc3e8964b7..f2507fd41b9c9bf37687d17d06a2a9821b934b50 100644
--- a/include/linux/if_tap.h
+++ b/include/linux/if_tap.h
@@ -35,12 +35,22 @@ struct tap_queue;
 struct tap_dev {
 	struct net_device	*dev;
 	u16			flags;
+	/* Protects taps[], queue_list, numvtaps, numqueues, ring_size, dead,
+	 * and the tap, enabled and queue_index fields of the attached queues.
+	 * Nests inside RTNL.
+	 */
+	struct mutex		lock;
 	/* This array tracks active taps. */
 	struct tap_queue    __rcu *taps[MAX_TAP_QUEUES];
 	/* This list tracks all taps (both enabled and disabled) */
 	struct list_head	queue_list;
 	int			numvtaps;
 	int			numqueues;
+	/* Size of the ptr_ring of all queues, as last set by
+	 * tap_queue_resize(). Can differ from dev->tx_queue_len
+	 * if a change of the latter failed after our notifier ran.
+	 */
+	unsigned int		ring_size;
 	netdev_features_t	tap_features;
 	int			minor;
 	/* Set once the net_device is unregistered, no queue can be added. */
-- 
2.53.0

