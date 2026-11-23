Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426137;
	b=XUvlwGKGqQGJolUy9lbrtnPcrNreG3wACmPtJlJ4ABqxnJTPHM8qiFSdgdMxPLSidZgY
	 BKKPlKzCUgiEeWfmNf6BTOU/9nGT9O08sr7YwJlKdxt0bg9VzLg3mQdKrwfMG0hNjPvOy
	 MvwFQu2xJxzU6YqCF0hQ88gQVovigspI6yi3OXSPJ2ktmOWzHG8VfcW/LWUohFVRM3ShT
	 IXNLEOZHpbfIDzxkP24bxe3mjP/pZ8dy1H2II8tjUCPfZzsKBhggc3twfWJrAPtJClgRD
	 hFbbrznFKNrudmlHdMzqGmMf6sVOWDBdeyt8+cMJ/WKVBnO9ZJfC7y3GQWQc3vXjbDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426137;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XQ3s/upW/7ozz8AHusZ3fvLJjMDzHSWHY2rf94ibYuc=;
	b=aCoOFyUPpZn6RjghK8CJ3acMxbvyd/+sE/ztb63hHoGA6jnvadY/K/eMv7yVqjfqWwYf
	 7pZxWhftFQw0DnJq0OPHY3pInHgRkVpQl+G3p5TTRVZ5XgENL4cr3CgDgW9EGd6XFDB15
	 M2zdhW/eJ4yAFUMmIwP62FLNXBLG5C/1wMi+yRDC7q/V9T4lqScmMZZxff0gtgLq0RYv9
	 Nr3SiO8r44P6menOwpool/f+ALKnT7zr0SE1CMwlRntVDTalkPwyCECPZptt85X3s1/3U
	 E8+MH/TmruCx//jJDL8pt/+Q5PaisVMV0bmcYXVoNOlBhSAC7RBBu7KUwE6/991WGcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWb0+3IF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EF606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWb0+3IF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3F61F000E1;
	Mon, 23 Nov 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426136;
	bh=XQ3s/upW/7ozz8AHusZ3fvLJjMDzHSWHY2rf94ibYuc=;
	h=From:To:Cc:Subject:Date;
	b=aWb0+3IFiV7ax9eBEZa8bJnaClDt7LVeCvcwt7liBITNZVcjzmfZHeAornkRAwY7L
	 UN/iR4XDQzFr/OMZRzpLFq6o+/5AFk9P2rE1E2pcMPU9mdVyUoyYFgxeWFY0VSjtT7
	 81hqeunAKYWLYJUAVI6th8PahAsctPZqiLJQdXuCoIh5pkOPEk01si4QwBjee9XRZz
	 EeRoRb5lGCpYt9KbQTLjIwARQerlsPFUGq/5R2qhNnxJ07plONpG9KaqczTPXOl/r0
	 SDazr53wJ9l2cdBxfWZGATBrzfy6QGl9zSHZu55N9Iu5hEmN4mVdgJHZ9/+kPhlAWx
	 w6FwSysYQHNWg==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: [PATCH v2 net-next] tls: wait for a single RCU grace period in tls_device_down()
Date: Mon, 23 Nov 2026 10:28:51 +0100
Message-ID: <20261123092851.137140-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

tls_device_down() calls synchronize_net() for each offloaded context
bound to the device going down. As this runs from the NETDEV_DOWN
notifier, a device with N offloaded sockets waits for N RCU grace
periods while RTNL is held.

Split the loop:

- First stop the offload for all contexts: switch to the software
  fallback, clear ctx->netdev and set TLS_RX_DEV_DEGRADED.

- Then call synchronize_net() once, if there is at least one context.

- Finally, for each context, release the driver state, then move the
  context to tls_device_down_list and drop the reference taken by
  tls_device_down() under tls_device_lock. This part is unchanged.

Between the first and the last step, the contexts sit on a private
list with a reference held. If sk_destruct runs in that window,
tls_device_queue_ctx_destruction() only drops its reference and
returns without touching ctx->list, so the private list can be walked
twice without holding tls_device_lock. The final removal stays
serialized by tls_device_lock in the last step.

The first step only writes to fields of each context. The only change
in behavior is that all contexts stop being offloaded before the
driver state of the first one is released.

Jiayuan Chen tested v1 with the netdevsim TLS offload emulation,
with N sockets having TX and RX offloaded on one port, measuring
"ip link set down" on that port:

sockets    before     after
    100   12.7 ms    8.6 ms
   1000   39.1 ms   11.5 ms
   5000  160.8 ms   19.2 ms
  20000  577.2 ms   44.1 ms

v2 is compile tested only, with CONFIG_TLS_DEVICE=y.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v2: rebase on top of commit 81c8333141b9 ("net/tls: serialize context
    removal in tls_device_down()") which came via net (Jakub).
    Move the free_ctx declaration to the second loop, and expand the
    changelog about the private list.
v1: https://lore.kernel.org/netdev/20261118224758.1617869-1-edumazet@kernel.org/
---
 net/tls/tls_device.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index fa7170cd4fd10f6298ac031ffa824814e592d736..a90ecfce597d23588d3c568ebd6221633531575b 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1349,9 +1349,7 @@ static int tls_device_down(struct net_device *netdev)
 	}
 	spin_unlock_irqrestore(&tls_device_lock, flags);
 
-	list_for_each_entry_safe(ctx, tmp, &list, list)	{
-		bool free_ctx;
-
+	list_for_each_entry(ctx, &list, list) {
 		/* Stop offloaded TX and switch to the fallback.
 		 * tls_is_skb_tx_device_offloaded will return false.
 		 */
@@ -1364,13 +1362,18 @@ static int tls_device_down(struct net_device *netdev)
 
 		/* Start skipping the RX resync logic completely. */
 		set_bit(TLS_RX_DEV_DEGRADED, &ctx->flags);
+	}
 
-		/* Sync with inflight packets. After this point:
-		 * TX: no non-encrypted packets will be passed to the driver.
-		 * RX: resync requests from the driver will be ignored.
-		 */
+	/* Sync with inflight packets, once for all contexts. After this point:
+	 * TX: no non-encrypted packets will be passed to the driver.
+	 * RX: resync requests from the driver will be ignored.
+	 */
+	if (!list_empty(&list))
 		synchronize_net();
 
+	list_for_each_entry_safe(ctx, tmp, &list, list)	{
+		bool free_ctx;
+
 		/* Release the offload context on the driver side. */
 		if (ctx->tx_conf == TLS_HW)
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
-- 
2.53.0

