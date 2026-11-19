Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072987;
	b=zdUvOCa9b9UJehYeR7H2n9hizpu6Ct6GNxVMHtCSZsQRKJTQXkl1E6J6qWD/q+UjS8RX
	 5CfGUQF1UlgfyQ5cGx4imxodpQOngASPY2UpwUlcMv5W+r79u7v+p0ro90wysB9kQk4VZ
	 Y7osaW+NWSRTLNvVO55xNr3XaJQKH6qbXfLEJGLztIsX8GQwchguxWvEnfy+tuEBYk12T
	 oqeOYQ+BYSO6+hnyxKy4tBcjafKSTBZM6DKamddQRzHy38pMECckmqj/X2RgfyvWiLFL/
	 N9AC4A3zjtZlQtuZqxXNCGaS4rp6y00dbTXi6BGt05Z4M2Fy/JjZm6bJa9F06z8HegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072987;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4BOUf6cONj91gqvU3YTcocQL5AKhDdVWvcxqz4Y6Jic=;
	b=dO5DybGUeJjaDRAJXc23Gf0D7CXoC+b2PkdHPNaKcG60Be0bZDcuGONM/p9a6yBPYyj8
	 Rq2W4o8Dq2aSSaxpVpT6UcZEYOq6wokhOO1R7OUIZGKbE/ZHv1KuwurwU9u01qr0PLIce
	 hB3Rt+4NG6Tg7h81GYGBvqJZ4uMGXHthg9PRwvsIzL44vYDerIjeK0dCaTmVKnA3HkRK9
	 PvgpAZmGFgFrqiF1y9KL7ZA6y4vqs1mFFeCZ/OsTSQKdSv4MqXS6JQEF2UNMzjTHhhi7E
	 FZ8bdyXZGqj2a9Pu4T0lMtolwFnPbulde8gpbW7YedDbS6zBoLJKCTcaMmp8WDSJrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8gCP+NB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E152606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8gCP+NB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096201F000C5;
	Thu, 19 Nov 2026 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072986;
	bh=4BOUf6cONj91gqvU3YTcocQL5AKhDdVWvcxqz4Y6Jic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R8gCP+NBPkUahW6T/rNcBgyGnxEiPfRpTlutfbtJGB3b2yZ3PQ2sAayFm5mzQt2en
	 4XnntFRoGOmb+JRbqMa9GxNXpWSv5xQHViIxK1OlAIeqmPURI46ABO5NddjwNbvdFE
	 dlv2SBGp2eBfPDw+fvhbgIS+Njlo7kHpLxXUc2T7oyewjifcPq/w7pwNvJNv6rF4SY
	 T3UBJQDYFs6ZwF3Jm5xGG2ctJ/t6578EJnA87+Qz4+T3isTp8bK1UvPXMSx2A3betQ
	 ZEm77UjA8UjWytjA+NWLKqOc18qZdH7r5Na9H9lDL5S7dhGCcloa9GoULp0qBdaLzS
	 Y36NcnKHZYNaA==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 1/4] tap: detach queues from the NETDEV_UNREGISTER notifier
Date: Thu, 19 Nov 2026 08:22:55 +0100
Message-ID: <20261119072258.3157902-2-edumazet@kernel.org>
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

tap_del_queues() is currently called from the macvtap and ipvtap
dellink handlers. Two things in this area only work because
tap_open() runs under RTNL, which a following patch removes:

1) Not all unregistrations go through dellink. If register_netdevice()
   fails after the NETDEV_REGISTER notifier created the char device,
   or if macvlan_common_newlink() / ipvlan_link_new() fail after
   register_netdevice(), the device is unregistered without
   tap_del_queues() being called. Nothing can open the char device in
   this window today, because RTNL is held from the minor allocation
   to its release.

2) tap_del_queues() sets tap->numvtaps to MAX_TAP_QUEUES to "guarantee
   that any future tap_set_queue will fail", but since commit
   815f236d6227 ("macvtap: add TUNSETQUEUE ioctl") tap_set_queue()
   tests tap->numqueues, which is zero at this point. A later
   tap_set_queue() would succeed and write to tap->taps[MAX_TAP_QUEUES],
   one element past the array. Again, this can not happen today since
   the minor is released in the same RTNL section.

Call tap_del_queues() from the NETDEV_UNREGISTER notifier instead, so
that every unregistration path is covered. The notifier is also invoked
when the device moves to another netns, in which case the queues must
stay attached: only act when the device is really being unregistered.

Replace the numvtaps trick with an explicit tap->dead flag, tested in
tap_set_queue().

No functional change intended: none of the above is reachable as long
as tap_open() holds RTNL. These issues were found by code inspection,
with the help of an AI coding assistant, while looking at RTNL removal
in tap. They were not triggered.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/ipvlan/ipvtap.c | 8 +++++---
 drivers/net/macvtap.c       | 8 +++++---
 drivers/net/tap.c           | 5 ++++-
 include/linux/if_tap.h      | 2 ++
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipvlan/ipvtap.c b/drivers/net/ipvlan/ipvtap.c
index 66c949d9426103edea10b2580f096f399f139f4f..d17daa1040967a1d80cede5d740d957204fe1186 100644
--- a/drivers/net/ipvlan/ipvtap.c
+++ b/drivers/net/ipvlan/ipvtap.c
@@ -112,10 +112,7 @@ static int ipvtap_newlink(struct net_device *dev,
 static void __ipvtap_dellink(struct net *net, struct net_device *dev,
 			     struct list_head *head)
 {
-	struct ipvtap_dev *vlantap = netdev_priv(dev);
-
 	netdev_rx_handler_unregister(dev);
-	tap_del_queues(&vlantap->tap);
 	__ipvlan_link_delete(net, dev, head);
 }
 
@@ -185,6 +182,11 @@ static int ipvtap_device_event(struct notifier_block *unused,
 			return notifier_from_errno(err);
 		break;
 	case NETDEV_UNREGISTER:
+		/* NETDEV_UNREGISTER is also sent when the device moves to
+		 * another netns, queues must survive this.
+		 */
+		if (dev->reg_state == NETREG_UNREGISTERING)
+			tap_del_queues(&vlantap->tap);
 		/* vlan->minor == 0 if NETDEV_REGISTER above failed */
 		if (vlantap->tap.minor == 0)
 			break;
diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
index cc975dfb738051cd43d70e6b95d7499400e345aa..3e88ca35cff2f9c755f8aff694e1c4ca83566741 100644
--- a/drivers/net/macvtap.c
+++ b/drivers/net/macvtap.c
@@ -120,10 +120,7 @@ static int macvtap_newlink(struct net_device *dev,
 static void macvtap_dellink(struct net_device *dev,
 			    struct list_head *head)
 {
-	struct macvtap_dev *vlantap = netdev_priv(dev);
-
 	netdev_rx_handler_unregister(dev);
-	tap_del_queues(&vlantap->tap);
 	macvlan_dellink(dev, head);
 }
 
@@ -186,6 +183,11 @@ static int macvtap_device_event(struct notifier_block *unused,
 			return notifier_from_errno(err);
 		break;
 	case NETDEV_UNREGISTER:
+		/* NETDEV_UNREGISTER is also sent when the device moves to
+		 * another netns, queues must survive this.
+		 */
+		if (dev->reg_state == NETREG_UNREGISTERING)
+			tap_del_queues(&vlantap->tap);
 		/* vlan->minor == 0 if NETDEV_REGISTER above failed */
 		if (vlantap->tap.minor == 0)
 			break;
diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 0f3ad8fd6ab66003093d2aedd4d7e7a6c4f882e9..ded0be1dfdd1e3123acb08e75aa9a874c9e949b5 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -102,6 +102,9 @@ static int tap_enable_queue(struct tap_dev *tap, struct file *file,
 static int tap_set_queue(struct tap_dev *tap, struct file *file,
 			 struct tap_queue *q)
 {
+	if (tap->dead)
+		return -ENODEV;
+
 	if (tap->numqueues == MAX_TAP_QUEUES)
 		return -EBUSY;
 
@@ -248,7 +251,7 @@ void tap_del_queues(struct tap_dev *tap)
 	BUG_ON(tap->numvtaps);
 	BUG_ON(tap->numqueues);
 	/* guarantee that any future tap_set_queue will fail */
-	tap->numvtaps = MAX_TAP_QUEUES;
+	tap->dead = true;
 }
 EXPORT_SYMBOL_GPL(tap_del_queues);
 
diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
index 553552fa635c3e1e53d1a63c203d32e4c4fd5a4f..e9c4c9272585cdb14cf0ea7ea7d96acc3e8964b7 100644
--- a/include/linux/if_tap.h
+++ b/include/linux/if_tap.h
@@ -43,6 +43,8 @@ struct tap_dev {
 	int			numqueues;
 	netdev_features_t	tap_features;
 	int			minor;
+	/* Set once the net_device is unregistered, no queue can be added. */
+	bool			dead;
 
 	void (*update_features)(struct tap_dev *tap, netdev_features_t features);
 	void (*count_tx_dropped)(struct tap_dev *tap);
-- 
2.53.0

