Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072992;
	b=hH+ZBSzYT4EbJEYIkvhAaRg5hqQjlgkhxv5FTWEL1kOJesF/gD72m5f5Hr/9EmFlmqs/
	 OlG1BkpAPZg8+Yd3LqSCz3MOt4nIXUxE1J0MACWVFWWnofeIuKpMjZB0x3aa1HGSR09Fm
	 3YN5lS3wZK3bhp8JnZLhj62cfvt7zJrcTMrfjDJjJ8zqhcfyjkVfh2Jeryv6ws5qjPEx6
	 7qq7s2XJuNWImKh1j6Sg9rF3xsPM/KKIppVk9UhWeu1Xx91C5jhYVOy7bEoewrWARnGl5
	 W0n1jQiSelUNamAxGheOb1yB3bbsep5GHMBXthDT+EgBHALKQAxVdYeR+PqaHp1QQyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072992;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JtefrI6V/vSLXr/21TNQP0U6f9069jbZrY59syvm1DI=;
	b=lWzYpRnAhXSsYKYsdH3QRgeAWepKEfnUAMk92ZN6VBLXA2jemMFuIHxfbgDPY89Bolko
	 14nI3C8i1VZWsLtuLmdDoZJ63SQ/bddAmfcYzSNG/BovyOtDYTqB9PxsxJ1b4po8odQWR
	 3Yqh4HSLTMZ6KL59ZBzUBlEP3Xm4l+jlGbSZSdoAVGHa5e55vUoGFqy36pZuN6SgojYsa
	 aUqOpTD8T4ZrtL61AreRziUTfhr4pt0NM4gGl3pl8NBpChPMUEbgQl0YLT2i6qSQCXqiq
	 GL0Kng/5p0kxUl2wfQE4kZ4ZT/0wpgnklEqszKvtYYvHwJwaDu0vQQdcOQkw/fp/p2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wp5NPkMy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF3606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wp5NPkMy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FD61F000C8;
	Thu, 19 Nov 2026 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072992;
	bh=JtefrI6V/vSLXr/21TNQP0U6f9069jbZrY59syvm1DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wp5NPkMyAG9EF4U3SO9CtbvOd17sZOU+63lKYvXvorCGIvOA8luX5hS1L/BZOZSm1
	 Ml9dj0aSGCRitdmVX3cUsgTP+oRHNWoYAQPiPfFLIN/u3tDgwREVGC2BTJBsV8lCWt
	 H1CNa29ipOzyHmlq7nmWf4BGRogo7Kq1+g463dJDlyFneIw7pGEJe22S6k8uVgG0mE
	 7vQgwzytcG0Om0SVkIWt74pyBpSJuY++0h1lEq4fgje0kIGUb7wqsXmBuTVOiPdp8c
	 SQfkLC10W+2pMkYsrM5hYm2ZBMOykPK8SHSQQddu7Bh2xw613H0ZDXyGdWfnZNpMmQ
	 spRo4HtS8aPdg==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 3/4] tap: do not hold RTNL in open(), release() and queue ioctls
Date: Thu, 19 Nov 2026 08:22:57 +0100
Message-ID: <20261119072258.3157902-4-edumazet@kernel.org>
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

Opening and closing a macvtap or ipvtap char device, as well as the
TUNSETQUEUE and TUNGETIFF ioctls, only touch state now protected by
tap->lock. They nevertheless acquire RTNL, so starting or stopping
virtual machines contends with every other networking configuration
change on the host.

Stop taking RTNL in these four paths.

Without RTNL, the tap_dev a queue is attached to is found with
tap_queue_lock_dev(): q->tap is read under rcu_read_lock() and a
reference on tap->dev is taken, which is safe because q->tap is
cleared before the synchronize_net() done while the device is
unregistered. tap->lock, which lives in the netdev private area, can
then be acquired and q->tap checked again.

tap_open() relies on the two previous patches: a queue can no longer
be added once tap_del_queues() has run, and tap_del_queues() runs for
every unregistered device.

TUNGETIFF uses netdev_copy_name() to get a consistent device name,
export it for modular builds.

tap_open() now reads dev->features once, with READ_ONCE(), since it
can change while the SOCK_ZEROCOPY decision is made.

TUNSETOFFLOAD, SIOCGIFHWADDR and SIOCSIFHWADDR call into the core
stack (netdev_update_features(), dev_set_mac_address_user(), device
lookup by name) and still hold RTNL. They keep using
rtnl_dereference(q->tap), which remains valid because tap_del_queues()
is only called under RTNL.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/tap.c | 90 +++++++++++++++++++++++++++++++----------------
 net/core/dev.c    |  1 +
 2 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index e8250857bce12f140b35f2b0b47f603e53a292d5..a240609d2a8a6b643216135d4b80540c18cf11db 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -76,7 +76,48 @@ static struct tap_dev *tap_dev_get_rcu(const struct net_device *dev)
  * queue from outbound SKBs, but these never reference back to the
  * file or the dev. The data structure is freed through __sk_free
  * when both our references and any pending SKBs are gone.
+ *
+ * Locking:
+ * tap->lock protects the queues attached to a tap_dev, see the comment
+ * in struct tap_dev. RTNL is only needed by the ioctls calling into
+ * the core networking stack. They can use rtnl_dereference(q->tap),
+ * because tap_del_queues() is called with RTNL held and the only other
+ * place clearing q->tap is the release of the file they operate on.
+ */
+
+/* Returns the tap_dev @q is attached to, with tap->lock held and a
+ * reference on tap->dev keeping the mutex alive, or NULL if the queue
+ * is detached.
  */
+static struct tap_dev *tap_queue_lock_dev(struct tap_queue *q)
+{
+	struct tap_dev *tap;
+
+	/* q->tap is cleared before the synchronize_net() calls done at
+	 * device unregistration, tap->dev can not be freed under us.
+	 */
+	rcu_read_lock();
+	tap = rcu_dereference(q->tap);
+	if (tap)
+		dev_hold(tap->dev);
+	rcu_read_unlock();
+	if (!tap)
+		return NULL;
+
+	mutex_lock(&tap->lock);
+	if (unlikely(rcu_access_pointer(q->tap) != tap)) {
+		mutex_unlock(&tap->lock);
+		dev_put(tap->dev);
+		return NULL;
+	}
+	return tap;
+}
+
+static void tap_queue_unlock_dev(struct tap_dev *tap)
+{
+	mutex_unlock(&tap->lock);
+	dev_put(tap->dev);
+}
 
 static int tap_enable_queue(struct tap_dev *tap, struct file *file,
 			    struct tap_queue *q)
@@ -159,13 +200,9 @@ static int tap_disable_queue(struct tap_dev *tap, struct tap_queue *q)
  */
 static void tap_put_queue(struct tap_queue *q)
 {
-	struct tap_dev *tap;
-
-	rtnl_lock();
-	tap = rtnl_dereference(q->tap);
+	struct tap_dev *tap = tap_queue_lock_dev(q);
 
 	if (tap) {
-		mutex_lock(&tap->lock);
 		if (q->enabled)
 			BUG_ON(tap_disable_queue(tap, q));
 
@@ -173,11 +210,9 @@ static void tap_put_queue(struct tap_queue *q)
 		RCU_INIT_POINTER(q->tap, NULL);
 		sock_put(&q->sk);
 		list_del_init(&q->next);
-		mutex_unlock(&tap->lock);
+		tap_queue_unlock_dev(tap);
 	}
 
-	rtnl_unlock();
-
 	synchronize_rcu();
 	sock_put(&q->sk);
 }
@@ -239,6 +274,7 @@ void tap_del_queues(struct tap_dev *tap)
 {
 	struct tap_queue *q, *tmp;
 
+	/* The ioctls using rtnl_dereference(q->tap) depend on this. */
 	ASSERT_RTNL();
 	mutex_lock(&tap->lock);
 	list_for_each_entry_safe(q, tmp, &tap->queue_list, next) {
@@ -452,11 +488,11 @@ static void tap_sock_destruct(struct sock *sk)
 static int tap_open(struct inode *inode, struct file *file)
 {
 	struct net *net = current->nsproxy->net_ns;
+	netdev_features_t features;
 	struct tap_dev *tap;
 	struct tap_queue *q;
 	int err = -ENODEV;
 
-	rtnl_lock();
 	tap = dev_get_by_tap_file(imajor(inode), iminor(inode));
 	if (!tap)
 		goto err;
@@ -496,7 +532,8 @@ static int tap_open(struct inode *inode, struct file *file)
 	 * The macvlan supports zerocopy iff the lower device supports zero
 	 * copy so we don't have to look at the lower device directly.
 	 */
-	if ((tap->dev->features & NETIF_F_HIGHDMA) && (tap->dev->features & NETIF_F_SG))
+	features = READ_ONCE(tap->dev->features);
+	if ((features & NETIF_F_HIGHDMA) && (features & NETIF_F_SG))
 		sock_set_flag(&q->sk, SOCK_ZEROCOPY);
 
 	err = tap_set_queue(tap, file, q);
@@ -511,7 +548,6 @@ static int tap_open(struct inode *inode, struct file *file)
 
 	dev_put(tap->dev);
 
-	rtnl_unlock();
 	return err;
 
 err_put:
@@ -520,7 +556,6 @@ static int tap_open(struct inode *inode, struct file *file)
 	if (tap)
 		dev_put(tap->dev);
 
-	rtnl_unlock();
 	return err;
 }
 
@@ -854,20 +889,18 @@ static int tap_ioctl_set_queue(struct file *file, unsigned int flags)
 	struct tap_dev *tap;
 	int ret;
 
-	tap = tap_get_tap_dev(q);
+	tap = tap_queue_lock_dev(q);
 	if (!tap)
 		return -EINVAL;
 
-	mutex_lock(&tap->lock);
 	if (flags & IFF_ATTACH_QUEUE)
 		ret = tap_enable_queue(tap, file, q);
 	else if (flags & IFF_DETACH_QUEUE)
 		ret = tap_disable_queue(tap, q);
 	else
 		ret = -EINVAL;
-	mutex_unlock(&tap->lock);
 
-	tap_put_tap_dev(tap);
+	tap_queue_unlock_dev(tap);
 	return ret;
 }
 
@@ -935,6 +968,7 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 	struct sockaddr_storage ss = {};
 	struct ifreq __user *ifr = argp;
 	unsigned int __user *up = argp;
+	char name[IFNAMSIZ] = {};
 	unsigned short u;
 	int __user *sp = argp;
 	int s;
@@ -958,31 +992,25 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		return ret;
 
 	case TUNGETIFF:
-		rtnl_lock();
-		tap = tap_get_tap_dev(q);
-		if (!tap) {
-			rtnl_unlock();
+		tap = tap_queue_lock_dev(q);
+		if (!tap)
 			return -ENOLINK;
-		}
 
-		ret = 0;
 		u = q->flags;
 		if (!q->enabled)
 			u |= IFF_DETACH_QUEUE;
-		if (copy_to_user(&ifr->ifr_name, tap->dev->name, IFNAMSIZ) ||
+		netdev_copy_name(tap->dev, name);
+		tap_queue_unlock_dev(tap);
+
+		if (copy_to_user(&ifr->ifr_name, name, IFNAMSIZ) ||
 		    put_user(u, &ifr->ifr_flags))
-			ret = -EFAULT;
-		tap_put_tap_dev(tap);
-		rtnl_unlock();
-		return ret;
+			return -EFAULT;
+		return 0;
 
 	case TUNSETQUEUE:
 		if (get_user(u, &ifr->ifr_flags))
 			return -EFAULT;
-		rtnl_lock();
-		ret = tap_ioctl_set_queue(file, u);
-		rtnl_unlock();
-		return ret;
+		return tap_ioctl_set_queue(file, u);
 
 	case TUNGETFEATURES:
 		if (put_user(IFF_TAP | IFF_NO_PI | TAP_IFFEATURES, up))
diff --git a/net/core/dev.c b/net/core/dev.c
index d88af07aea29004f78a47576ea04a7c5a1c6d411..5efa26fcb207f31d7975272a9fc0f861f5fcc923 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1244,6 +1244,7 @@ void netdev_copy_name(struct net_device *dev, char *name)
 		strscpy(name, dev->name, IFNAMSIZ);
 	} while (read_seqretry(&netdev_rename_lock, seq));
 }
+EXPORT_SYMBOL_GPL(netdev_copy_name);
 
 /**
  *	netdev_get_name - get a netdevice name, knowing its ifindex.
-- 
2.53.0

