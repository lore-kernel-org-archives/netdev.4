Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042083;
	b=AH9BCtpDCoIzS1BdHxbdtARWSYsIzrF49mvWqvJv7w4aU0JkbmpXtMhc9WOR3ZxJycNx
	 rTrbU5s6eI8T+c77Yg2L1gO7mVFKgxqCFtRG4IfzEr63Yg2h6Dn3IR2k8WA2BEbc5wQJX
	 b5sZi0x0SPvrv+8FBgBh7mUjIX7L78RQhmaqJbAvVz39/WdD1XFM6S1UPdcuU5SeVvqCC
	 6tFG40SqsM7ynICAPNLOZLMhRDnL6Z8ADUsSXhNXyE9MJO4HRb72p9NeMDIL7SL1cL0Fx
	 o6AWMDX06VUny4VGbPNnNHHZQmmUFCgs/92vJ1Ut8dnYgPpvjOtxPRXqAVqLCv3ilPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042083;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rFVSpkvPQ/mh+EGM/GLGViyhVcWsq85GoWMz9Gq5jt0=;
	b=wlxHP/ZnPTNnQNOKiOwVsgMkW8k+GiMWHd0msrMBJxkG1gMEbb70AMkAiK7Rld/K+QMh
	 Pfbrrx8Dv+t5c24XVdfRg+gf8q5UnqVYnJbUO1x3khsiq+YlrS8sB+bXaSXxBfkFwkbfo
	 GxKdKY8osaJ2i3bVBVe1oMM2166dYwZb7TbvApFrtLWdnGEN6QWHUqODOO7Sd1FJ7EuGa
	 zjf/xBFsD4YwJ74bOmSshV4RoeMZk2cAoh5g4m8iSqf8Iyn6XA9yMgR87UTMiebbApJN0
	 72oNqBUr0HS6YfeZ0zrxBXRseXzRZvTcU/lUI025tEzmhQBfeBROP4UtnSB3SS+WKpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giXBFjD2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F9606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giXBFjD2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AEC1F000C4;
	Wed, 18 Nov 2026 22:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042083;
	bh=rFVSpkvPQ/mh+EGM/GLGViyhVcWsq85GoWMz9Gq5jt0=;
	h=From:To:Cc:Subject:Date;
	b=giXBFjD2eslVfejiEF2qfMZTgvsAHLpPVQa/8/p89uVfWICMfrdbWLMkpPDjX8EYF
	 kv7ISRi2tMgddp3f2428d9bvp6oLnBEoyt8vf6jMajTp4TXr8sxlGyAWU5EZ+dcX3S
	 1bBrcHXXIFqtcXma3mUqu4sbmAdwQhRyoC1bKAhx8Lxdgv/mSLWv4hlvo2oOKspQeL
	 /xhqokvkrsbE8cZIXS0VutaqwQ9XxrRmKc1zFsE1CLwW2ENeifdWcgdTqOMZkCCzK2
	 VzRM+Lx+1nTSabM+eg5cTzRsB7rpWefL/K6kFcV1+0jOQFPWBDsnsr4A2YPuCKlVu8
	 qB/rAS9vwRVNw==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next] tls: wait for a single RCU grace period in tls_device_down()
Date: Wed, 18 Nov 2026 23:47:58 +0100
Message-ID: <20261118224758.1617869-1-edumazet@kernel.org>
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

- Finally release the driver state and drop the reference of each
  context, as before.

The contexts are on a private list with a reference held, and the
first step only writes to fields of each context. The only change in
behavior is that all contexts stop being offloaded before the driver
state of the first one is released.

Compile tested only, with CONFIG_TLS_DEVICE=y.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/tls/tls_device.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 4cdfbb57ecff0a0ad5589fca4ab6599ab695c913..9c2f57312d14062f453d8b8e316404a3d1b20e0f 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1349,7 +1349,7 @@ static int tls_device_down(struct net_device *netdev)
 	}
 	spin_unlock_irqrestore(&tls_device_lock, flags);
 
-	list_for_each_entry_safe(ctx, tmp, &list, list)	{
+	list_for_each_entry(ctx, &list, list) {
 		/* Stop offloaded TX and switch to the fallback.
 		 * tls_is_skb_tx_device_offloaded will return false.
 		 */
@@ -1362,13 +1362,16 @@ static int tls_device_down(struct net_device *netdev)
 
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
 		/* Release the offload context on the driver side. */
 		if (ctx->tx_conf == TLS_HW)
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
-- 
2.53.0

