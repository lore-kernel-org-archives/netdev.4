Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244235;
	b=2dEgHgUlYRddDf/wsu51eCSaNhYsn7w4NtUf9JiUb/+RZaVUpfEk1sot871GyOkdXiZK
	 4tc5tCIhF37z0L4PzSNw7OUyqN+9pIMlz7Q5EFUG7ifZlFbkZ3ph6DsZ4Sod5n5VFWMwm
	 H7xjrwa5ky4jkNvqhMRiz6xqKQIXEceNsdKdLDEDkcwrBhZyFj+EfHJSbjJJnE+IHGu5G
	 OUTniMJl7sjLrcXvOUdmiAzwzEuIL/AVlLsjQ+TBWnXQxVuqLSvOmSGW8i/jBQbLBCOCL
	 4EXkz5sU5n6d5aPbc8m+uWZWBYdM4QnSNz32k5uKAuo9OuYtddy8UVIg6jUmfQzeFyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244235;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ksbhy0xodm3CgAlLkde69u7bohvkk2sKgDCXNK1T2kQ=;
	b=nTuZTDi6xqtxq3lC2dvQurlxmPn1TsJl80euBO4sJOpFnTupe1jXO2CC5fXlaMsFIcK+
	 bOKmNLlzy/BKJOAJnE0PMXGpa1dYZGgfGKpNYCOPUqJxpurTBvjECbA9KHC2tI1PhHEVq
	 cuNEmlXvoFBgynd5NR0L72ON3CSSTswbbqKklbsCZdfaKMWPDTPxKxlXDtDQIkFDA9QY5
	 W54ZJQRrwACxNsSoEyKknFV87pTUnIGRHES6dDiFMKX+AiZR5P+pKHDFkSJw4l/1R5woI
	 evOMXMo2E8FKahX8r7bY1Mc7Q4/kqEFkRrbqwVBmuVmM/W7/Gh3vL8r8ry3hmiN7Mvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iEyvQMCw;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62468606A320;
	Sat, 21 Nov 2026 06:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62468606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iEyvQMCw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ks
	bhy0xodm3CgAlLkde69u7bohvkk2sKgDCXNK1T2kQ=; b=iEyvQMCwm3u4R/c1tw
	NvDEP8eViTBcZol552sJlZq5rfYDQ7BgFcPnUCPp1jR6oGfkZWgAEUOM845jPmBR
	/I4Y9nRXJo3PzTnYPsd0xBIZr6C1k0mq/clEp3E+OrupnbrMAPcfA0k7B2zXMbD9
	ItYqFM0w3qam+vCFrgSH+g89U=
Received: from colol4bi5.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHOZObQAFrNe_VHA--.28370S2;
	Sat, 21 Nov 2026 14:56:28 +0800 (CST)
From: Binbin Deng <18983559317@163.com>
To: sam@mendozajonas.com,
	fercerpav@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Binbin Deng <18983559317@163.com>
Subject: [PATCH net v4] net/ncsi: fix use-after-free of ncsi_channel in ncsi_remove_channel()
Date: Sat, 21 Nov 2026 14:56:25 +0800
Message-ID: <20261121065625.27934-1-18983559317@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:QCgvCgCHOZObQAFrNe_VHA--.28370S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJr4UJF48XF4rXr1kAF1DKFg_yoW8GFy8Xo
	WfXrW3Xrn7Gr1UWayYq3Z3tFW7Za48Kr98Aan0kw4kCFsxXrW5A3y3AanxWa4xZF4SkFWD
	ZFnrXw4vqay8tr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRLvtAUUUUU
X-CM-SenderInfo: jprymmytvvmjmrxbiqqrwthudrp/xtbC3xxSNmsBQJxr0gAA3o

ncsi_remove_channel() frees the channel filter arrays and the channel
itself immediately after list_del_rcu():

    kfree(nc->mac_filter.addrs);
    kfree(nc->vlan_filter.vids);
    ...
    list_del_rcu(&nc->node);
    ...
    kfree(nc);

The generic netlink package info walkers iterate np->channels with the
list_for_each_entry_rcu() based NCSI_FOR_EACH_CHANNEL() and
dereference deep into the channel: ncsi_write_channel_info() reads
nc->version.fw_name with nla_put_string() (strlen) and iterates
nc->vlan_filter.vids[].  No NCSI genl handler enters an RCU read-side
critical section -- genl doit and dumpit callbacks run under
genl_mutex and cb_mutex -- so a walk that overlaps the teardown reads
freed memory.  NCSI_CMD_PKG_INFO has no GENL_ADMIN_PERM, so an
unprivileged user can race it against rmmod of the driver:

  writer: rmmod ftgmac100
            -> ftgmac100_remove() -> ncsi_unregister_dev()
            -> ncsi_remove_package() -> ncsi_remove_channel()
  reader: sendmsg(NETLINK_GENERIC, NCSI_CMD_PKG_INFO)
            -> ncsi_pkg_info_nl() -> ncsi_write_package_info()

KASAN reports (arm multi_v7, QEMU ast2600-evb, KASAN + SLUB + PREEMPT,
four threads looping PKG_INFO doit/dump while cycling insmod/rmmod):

  BUG: KASAN: slab-use-after-free in ncsi_write_package_info+0xa5c/0xf84
  Read of size 1 at addr c69019e0 by task poc_dump/68
  The buggy address belongs to the object at c6901800
   which belongs to the cache kmalloc-1k of size 1024
  The buggy address is located 480 bytes inside of
   freed 1024-byte region [c6901800, c6901c00)

The 480-byte offset is nc->version.fw_name, read by the strlen() of
the nla_put_string() in ncsi_write_channel_info() inlined into the
walker; kmalloc-1k is the size class of struct ncsi_channel.  The
dump variant of the same reader is caught reading the freed filter
array instead:

  BUG: KASAN: slab-use-after-free in ncsi_write_package_info+0xb6c/0xf84
  Read of size 2 at addr c6b03600 by task poc_dump/72
  The buggy address belongs to the object at c6b03600
   which belongs to the cache kmalloc-64 of size 64
  The buggy address is located 0 bytes inside of
   freed 64-byte region [c6b03600, c6b03640)

which is the u16 vlan_filter.vids[] walk of the same handler.

Fix both halves of the contract for the channel:

  * The free of the channel and of the filter arrays, which are only
    reachable through the channel, moves into an RCU callback.

  * All seven genl handlers now resolve the device and walk the lists
    inside an RCU read-side critical section, so the grace period of
    that callback protects them.  The critical sections are
    non-sleeping: the reply skb of the PKG_INFO doit is allocated
    before the lock is taken (genlmsg_new(GFP_KERNEL) must not run
    under rcu_read_lock()) and its unicast reply is sent after the
    walk; NCSI_CMD_SEND_CMD runs ncsi_xmit_cmd() under the lock (it
    only uses GFP_ATOMIC command skbs, spinlocks and
    dev_queue_xmit()) and defers its error notification past the
    unlock, as nlmsg_unicast() may sleep; the net_device the
    notification uses is pinned by a dev_hold() taken inside the
    critical section and released once the notification has been
    sent.

  * The handlers used get_net(sock_net(skb->sk)), which takes a
    reference on init_net that is never dropped anywhere in
    net/ncsi/; plain sock_net() is enough as the socket pins the
    netns.

Found by a Coccinelle rule matching kfree() immediately after
list_del_rcu(); the code inspection and the fix were LLM-assisted,
and the race was confirmed at runtime with KASAN as above.

Fixes: 2d283bdd079c ("net/ncsi: Resource management")
Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
Signed-off-by: Binbin Deng <18983559317@163.com>
---

Changes in v4:
- Pin the net_device used by the SEND_CMD error notification with
  dev_hold()/dev_put(); the notification runs after the RCU unlock,
  where the pointer captured inside the critical section no longer
  has any protection.
- Reword the commit message and the comment in ncsi_pkg_info_nl() so
  they describe only the lifetime rules this patch itself establishes,
  without referring to other in-flight changes.

 net/ncsi/internal.h     |   1 +
 net/ncsi/ncsi-manage.c  |  20 +++++---
 net/ncsi/ncsi-netlink.c | 102 +++++++++++++++++++++++++++++++---------
 3 files changed, 95 insertions(+), 28 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index adee6dc..530834d 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -239,6 +239,7 @@ struct ncsi_channel {
 	} monitor;
 	struct list_head            node;
 	struct list_head            link;
+	struct rcu_head             rcu;
 };
 
 struct ncsi_package {
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 54d0df0..2b117cf 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -242,17 +242,21 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
 	return nc;
 }
 
+static void ncsi_channel_release(struct rcu_head *rcu)
+{
+	struct ncsi_channel *nc = container_of(rcu, struct ncsi_channel, rcu);
+
+	kfree(nc->mac_filter.addrs);
+	kfree(nc->vlan_filter.vids);
+	kfree(nc);
+}
+
 static void ncsi_remove_channel(struct ncsi_channel *nc)
 {
 	struct ncsi_package *np = nc->package;
 	unsigned long flags;
 
 	spin_lock_irqsave(&nc->lock, flags);
-
-	/* Release filters */
-	kfree(nc->mac_filter.addrs);
-	kfree(nc->vlan_filter.vids);
-
 	nc->state = NCSI_CHANNEL_INACTIVE;
 	spin_unlock_irqrestore(&nc->lock, flags);
 	ncsi_stop_channel_monitor(nc);
@@ -263,7 +267,11 @@ static void ncsi_remove_channel(struct ncsi_channel *nc)
 	np->channel_num--;
 	spin_unlock_irqrestore(&np->lock, flags);
 
-	kfree(nc);
+	/* Netlink walkers may still hold the channel or its filter
+	 * arrays; the arrays are only reachable through @nc and share
+	 * its grace period.
+	 */
+	call_rcu(&nc->rcu, ncsi_channel_release);
 }
 
 struct ncsi_package *ncsi_find_package(struct ncsi_dev_priv *ndp,
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index 8cc5383..3310a9c 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -169,11 +169,6 @@ static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
 	if (!info->attrs[NCSI_ATTR_PACKAGE_ID])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(genl_info_net(info),
-			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
-	if (!ndp)
-		return -ENODEV;
-
 	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!skb)
 		return -ENOMEM;
@@ -192,7 +187,23 @@ static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
 		kfree_skb(skb);
 		return -EMSGSIZE;
 	}
+
+	/* Resolve the device and walk its lists inside an RCU read-side
+	 * critical section: the channel and its filter arrays are freed
+	 * from an RCU callback, so the walker is protected by that
+	 * grace period.
+	 */
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(genl_info_net(info),
+			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp) {
+		rcu_read_unlock();
+		kfree_skb(skb);
+		return -ENODEV;
+	}
+
 	rc = ncsi_write_package_info(skb, ndp, package_id);
+	rcu_read_unlock();
 
 	if (rc) {
 		nla_nest_cancel(skb, attr);
@@ -228,20 +239,25 @@ static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
 	if (!attrs[NCSI_ATTR_IFINDEX])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(get_net(sock_net(skb->sk)),
-			       nla_get_u32(attrs[NCSI_ATTR_IFINDEX]));
+	package_id = cb->args[0];
 
-	if (!ndp)
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(skb->sk),
+			       nla_get_u32(attrs[NCSI_ATTR_IFINDEX]));
+	if (!ndp) {
+		rcu_read_unlock();
 		return -ENODEV;
+	}
 
-	package_id = cb->args[0];
 	package = NULL;
 	NCSI_FOR_EACH_PACKAGE(ndp, np)
 		if (np->id == package_id)
 			package = np;
 
-	if (!package)
+	if (!package) {
+		rcu_read_unlock();
 		return 0; /* done */
+	}
 
 	hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
 			  &ncsi_genl_family, NLM_F_MULTI,  NCSI_CMD_PKG_INFO);
@@ -266,8 +282,10 @@ static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
 
 	cb->args[0] = package_id + 1;
 
+	rcu_read_unlock();
 	return skb->len;
 err:
+	rcu_read_unlock();
 	genlmsg_cancel(skb, hdr);
 	return rc;
 }
@@ -289,10 +307,13 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 	if (!info->attrs[NCSI_ATTR_PACKAGE_ID])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(msg->sk),
 			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
-	if (!ndp)
+	if (!ndp) {
+		rcu_read_unlock();
 		return -ENODEV;
+	}
 
 	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
 	package = NULL;
@@ -302,6 +323,7 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 			package = np;
 	if (!package) {
 		/* The user has set a package that does not exist */
+		rcu_read_unlock();
 		return -ERANGE;
 	}
 
@@ -317,6 +339,7 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 			netdev_info(ndp->ndev.dev,
 				    "NCSI: Channel %u does not exist!\n",
 				    channel_id);
+			rcu_read_unlock();
 			return -ERANGE;
 		}
 	}
@@ -350,6 +373,7 @@ static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
 	if (!(ndp->flags & NCSI_DEV_RESET))
 		ncsi_reset_dev(&ndp->ndev);
 
+	rcu_read_unlock();
 	return 0;
 }
 
@@ -365,10 +389,13 @@ static int ncsi_clear_interface_nl(struct sk_buff *msg, struct genl_info *info)
 	if (!info->attrs[NCSI_ATTR_IFINDEX])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(msg->sk),
 			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
-	if (!ndp)
+	if (!ndp) {
+		rcu_read_unlock();
 		return -ENODEV;
+	}
 
 	/* Reset any whitelists and disable multi mode */
 	spin_lock_irqsave(&ndp->lock, flags);
@@ -389,12 +416,14 @@ static int ncsi_clear_interface_nl(struct sk_buff *msg, struct genl_info *info)
 	if (!(ndp->flags & NCSI_DEV_RESET))
 		ncsi_reset_dev(&ndp->ndev);
 
+	rcu_read_unlock();
 	return 0;
 }
 
 static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
 {
 	struct ncsi_dev_priv *ndp;
+	struct net_device *dev;
 	struct ncsi_pkt_hdr *hdr;
 	struct ncsi_cmd_arg nca;
 	unsigned char *data;
@@ -427,17 +456,26 @@ static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
 		goto out;
 	}
 
-	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(msg->sk),
 			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
 	if (!ndp) {
+		rcu_read_unlock();
 		ret = -ENODEV;
 		goto out;
 	}
+	dev = ndp->ndev.dev;
+	/* The error notification below runs after the unlock and may
+	 * sleep; pin the net_device for it while still inside the
+	 * read-side critical section.
+	 */
+	dev_hold(dev);
 
 	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
 	channel_id = nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
 
 	if (package_id >= NCSI_MAX_PACKAGE || channel_id >= NCSI_MAX_CHANNEL) {
+		rcu_read_unlock();
 		ret = -ERANGE;
 		goto out_netlink;
 	}
@@ -446,6 +484,7 @@ static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
 	if (len < sizeof(struct ncsi_pkt_hdr)) {
 		netdev_info(ndp->ndev.dev, "NCSI: no command to send %u\n",
 			    package_id);
+		rcu_read_unlock();
 		ret = -EINVAL;
 		goto out_netlink;
 	} else {
@@ -462,23 +501,31 @@ static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
 	nca.info = info;
 	nca.payload = ntohs(hdr->length);
 	if (nca.payload > len - sizeof(*hdr)) {
+		rcu_read_unlock();
 		ret = -EINVAL;
 		goto out_netlink;
 	}
 	nca.data = data + sizeof(*hdr);
 
+	/* ncsi_xmit_cmd() is safe to run under the RCU read-side
+	 * critical section: it only uses GFP_ATOMIC command skbs,
+	 * spinlocks and dev_queue_xmit().
+	 */
 	ret = ncsi_xmit_cmd(&nca);
+	rcu_read_unlock();
+
 out_netlink:
 	if (ret != 0) {
-		netdev_err(ndp->ndev.dev,
+		netdev_err(dev,
 			   "NCSI: Error %d sending command\n",
 			   ret);
-		ncsi_send_netlink_err(ndp->ndev.dev,
+		ncsi_send_netlink_err(dev,
 				      info->snd_seq,
 				      info->snd_portid,
 				      info->nlhdr,
 				      ret);
 	}
+	dev_put(dev);
 out:
 	return ret;
 }
@@ -608,10 +655,13 @@ static int ncsi_set_package_mask_nl(struct sk_buff *msg,
 	if (!info->attrs[NCSI_ATTR_PACKAGE_MASK])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(msg->sk),
 			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
-	if (!ndp)
+	if (!ndp) {
+		rcu_read_unlock();
 		return -ENODEV;
+	}
 
 	spin_lock_irqsave(&ndp->lock, flags);
 	if (nla_get_flag(info->attrs[NCSI_ATTR_MULTI_FLAG])) {
@@ -639,6 +689,7 @@ static int ncsi_set_package_mask_nl(struct sk_buff *msg,
 			ncsi_reset_dev(&ndp->ndev);
 	}
 
+	rcu_read_unlock();
 	return rc;
 }
 
@@ -663,10 +714,13 @@ static int ncsi_set_channel_mask_nl(struct sk_buff *msg,
 	if (!info->attrs[NCSI_ATTR_CHANNEL_MASK])
 		return -EINVAL;
 
-	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
+	rcu_read_lock();
+	ndp = ndp_from_ifindex(sock_net(msg->sk),
 			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
-	if (!ndp)
+	if (!ndp) {
+		rcu_read_unlock();
 		return -ENODEV;
+	}
 
 	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
 	package = NULL;
@@ -675,8 +729,10 @@ static int ncsi_set_channel_mask_nl(struct sk_buff *msg,
 			package = np;
 			break;
 		}
-	if (!package)
+	if (!package) {
+		rcu_read_unlock();
 		return -ERANGE;
+	}
 
 	spin_lock_irqsave(&package->lock, flags);
 
@@ -690,6 +746,7 @@ static int ncsi_set_channel_mask_nl(struct sk_buff *msg,
 			}
 		if (!channel) {
 			spin_unlock_irqrestore(&package->lock, flags);
+			rcu_read_unlock();
 			return -ERANGE;
 		}
 		netdev_dbg(ndp->ndev.dev,
@@ -721,6 +778,7 @@ static int ncsi_set_channel_mask_nl(struct sk_buff *msg,
 	if (!(ndp->flags & NCSI_DEV_RESET))
 		ncsi_reset_dev(&ndp->ndev);
 
+	rcu_read_unlock();
 	return 0;
 }
 
-- 
2.43.0

