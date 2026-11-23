Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472992;
	b=K+fOMi+rkI+pQJJdWpcXE8CRip72tVkD0Q71iL03faC4ebAZTHrxDoQXP9BSQzTCKttx
	 8U/qKZ7dIgXYyT9pck6AAa4kNvo7ImDzcr2f0bcecFVtGF+m3x91dJw4YbBCvsqhw28du
	 I1aRF6OP//PHTzNqOwQnGTFMVQDprCHveF+KfNS23nwCCmTEi7ufoyd8h9DtjBcR7Op+5
	 LgxMrMv4Jree3eU1kpz68YwmbnfG+r99SL0EGuW0lxGZAzXF0KL3vcvgG+av8axqT3He7
	 Wvi1e2Bg142eCHtnD/RWlMD1rSHIlA8uIvCNSwdx4jGN2rMAcaay2rVpcVJNq7SWT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=H2vxAWoYWHp6UyKnUQXbx7unIB0YZxuVIcKrameyVgM=;
	b=WTeByjQndIcN4zESxZX0Qca9/Zwb5I3VqO7pOfz65eVY38UrcZA3nnEMLcAlYsh+4/RN
	 CfsNGYgCZYbDVpVEgQ2baGUI2zZvwMY9URBMCObNu0ArQvrcRwn9kKqSHCOuR/75xxs2V
	 g5S+3sUHFNlQcL23wY+00G9S3a5vZusfNObFpQWrk7wMbMxGpeTl2bi43u599KWEkIZqy
	 DB9f9Qb8ub2QulU6vmYsEWcQHXa7tN/E7MYsks1GEA5JrJuQetxCeWFemQTj+sPSxn7eg
	 JsFPddx9jLioaObtaDGGMGTmwI53BVF+3IDIQ7XKNHeH4l159AeAjN2gqiGFSmSulZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EEauRH0X;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F9606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9F9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EEauRH0X
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7d2da166818so2355804137.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795472991; x=1796077791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2vxAWoYWHp6UyKnUQXbx7unIB0YZxuVIcKrameyVgM=;
        b=EEauRH0XZJQvGZczsRF6XoVb37PsS0/4gNMc0EzE1MZMqIaE2kNv259tfgRNkN7jdH
         HnUKMimueeuQ7DX357m0LEvAO1ds7kUZleVD3svjXxcPaXcV3QMIWZpvDYvTJutQ5n8S
         wN+H/5xRu9IeL3xexuSUHvcHO+yR5qgYOWjnXbm52wKNmOSesMvWDW8ZzF+Ri6n6510t
         ncMUzOu+QG9KM+O0AggcU7TalZj1DRGSMpEljnvaSKAIueymHBpWYkS5nocbtbIlaKZ4
         ssf1ufIPfEtdHFubBp0Sd2FCmLauF5O+aMnRJvuPNa/KXxhek7DMwXPC0iIX9HEpXwdO
         X3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472991; x=1796077791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2vxAWoYWHp6UyKnUQXbx7unIB0YZxuVIcKrameyVgM=;
        b=HtZ0eMRMBF+Nxs0gGzZPqwKmzzryzV/V7CPCwMJF5F7OM50FsWe70IIYBZLYgAUJwm
         8kDXjttUVDJPFMwoOFtKs1JetL6kp5cDoB7Z7RN2uOYLIsXWyR6G/8LBrxDSDUIPjxTk
         Jl0DziKaJEe9/pJOa/+capkn2My9MvjPj9yS0Wt1FxGvCxmh1Iz6rojyn+z5Y2MSPfAi
         0IwwVqfvGQW6pE9A8XtwvwR5uwQJYPwayy3H55O1ZJHmZyWvuJqF2B68Y9NHWr0rP+/d
         T/YCHUfZNf3GsNxn7Ltp2exZHraP2o8cjhQA2MyED4Vl15pYKcDB0Gvc4NXB29fASxNV
         LdQw==
X-Gm-Message-State: APuU4Z+ynK+CQJKKzvcMcJbuT/LL72JaH9kY5KX+5+frHwGoJ0+VzcDw
	WA6xNWJdpvlzrxH4KbBbEUheoN1gfT/5x8AhbwMj1dtuXI9vWVGfI2u/3jxTItbARwwgxxy4CR2
	EMw+kpl7kRJKfLHiNXS/oaxeY5x6tuvYfs9UwGRmP+qdjFnLeyqJZ
X-Gm-Gg: AZFdTZckkDPceSGt5OPx8xWX7JFEdDyGFchadNKwTyQ62jFM93dDq3caNlfvyz1RwBZ
	KSYeJPPbwjCF4UtBlEYX3Hai5fEwUiJDY4e135UsdhRT5Eowld5ZL6Y0MhfS1t+S2EaeoTZHvVx
	DtwkDlTjfpKC0aINevWGDeOK5X1qKr1EUyX49JPgo/tbaQR+BSv1uzU/JpTK+qyW6IOlPYBM+L8
	vU+kj9IH5tSJ1mCcLkjbgymmWfh/iUiv6BFXxTlxvr7cjMPpAQCj9QbgPD5IpFhel/PvT6nR9ha
	BAr9mmZ6uIJa6jXI+rPDu6dfJmiG9p1RllVoW+TGjPls/yego9l0xQF3oWk/ZXSm+epwRV7g85K
	qbjmg9V8vzp/RFIfah4Ry
X-Received: by 2002:a05:6102:448b:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d739462bc5mr7097568137.19.1795472991005;
        Mon, 23 Nov 2026 14:29:51 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e120c2esm1306669241.10.2026.11.23.14.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:29:51 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 6156F40124;
	Mon, 23 Nov 2026 15:29:50 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 5DEDEDC0D02; Mon, 23 Nov 2026 15:29:50 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Boris Pismenny <borisp@mellanox.com>
Subject: [PATCH net v6 2/2] tls: restrict device-down TX fallback to hardware TX sockets
Date: Mon, 23 Nov 2026 15:29:44 -0700
Message-ID: <20261123222947.1014041-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261123222947.1014041-1-rjethwani@purestorage.com>
References: <20261123222947.1014041-1-rjethwani@purestorage.com>
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

tls_device_down() switches every offloaded TLS context associated with
the device to the TX software fallback, including hardware-RX sockets
without TX offload (RX-only, or software TLS TX). The fallback expects
a hardware TX context in priv_ctx_tx, so such a socket can crash when
transmitting a payload skb. In the oops below, a payload skb queued on
the neighbour entry during the down/up cycle was flushed on ARP reply:

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  tls_sw_fallback+0x11b/0x450
  validate_xmit_skb.isra.0+0x14f/0x420
  __dev_queue_xmit+0x5e8/0xf30

Device-down teardown cannot key on tx_conf/rx_conf: setup publishes
them after releasing device_offload_lock, and they share a byte written
without that lock. Device-down can therefore observe configuration
fields that do not yet reflect a successful tls_dev_add() and skip the
required tls_dev_del(), leaking driver state. Key it on installed
driver state instead.

TX: switch the validator only if it is tls_validate_xmit_skb(), record
the switch in TLS_TX_DEV_DOWN, and call TX tls_dev_del only when that
bit is set. tls_set_device_offload() now publishes the validator under
device_offload_lock; otherwise device-down could run between
tls_device_attach() and the store, skip tls_dev_del (leaking driver
state), and setup would then install the hardware validator on a
torn-down attachment. Contexts never return to the active list, so the
bit needs no reset.

RX: TLS_RX_DEV_CLOSED now means "no RX driver state installed". Set it
at context creation and after every RX tls_dev_del, and clear it after
a successful RX tls_dev_add under device_offload_lock. This avoids
deleting absent RX state and reading tx_conf/rx_conf while their
shared byte is updated.

Tested on Mellanox ConnectX-6 Dx (Crypto Enabled): the crash reproduces
without this patch; with it, an RX-only socket survives interface
down/up and keeps receiving TLS records.

c55dcdd435aa made the fallback switch unconditional; 4799ac81e52a keyed
teardown on tx_conf/rx_conf.

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Fixes: 4799ac81e52a ("tls: Add rx inline crypto offload")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 include/net/tls.h    | 10 ++++++----
 net/tls/tls_device.c | 20 +++++++++++++-------
 net/tls/tls_main.c   |  1 +
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 0b001b8ab1c3..faaeffd9981b 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -188,12 +188,14 @@ enum tls_context_flags {
 	 * to be atomic.
 	 */
 	TLS_TX_SYNC_SCHED = 1,
-	/* tls_dev_del was called for the RX side, device state was released,
-	 * but tls_ctx->netdev might still be kept, because TX-side driver
-	 * resources might not be released yet. Used to prevent the second
-	 * tls_dev_del call in tls_device_down if it happens simultaneously.
+	/* No RX device state is installed. Set at context creation and after
+	 * RX tls_dev_del, cleared after a successful RX tls_dev_add. Prevents
+	 * deleting absent or already released RX state while ctx->netdev may
+	 * still be kept for TX.
 	 */
 	TLS_RX_DEV_CLOSED = 2,
+	/* Records the TX fallback switch for device-down's cleanup loop. */
+	TLS_TX_DEV_DOWN = 3,
 };
 
 struct cipher_context {
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index e4e675243779..0af2514b883c 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1195,13 +1195,13 @@ int tls_set_device_offload(struct sock *sk)
 		goto release_lock;
 
 	tls_device_attach(ctx, sk, netdev);
-	up_read(&device_offload_lock);
 
 	/* following this assignment tls_is_skb_tx_device_offloaded
 	 * will return true and the context might be accessed
 	 * by the netdev's xmit function.
 	 */
 	smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_skb);
+	up_read(&device_offload_lock);
 	dev_put(netdev);
 
 	return 0;
@@ -1282,6 +1282,7 @@ int tls_set_device_offload_rx(struct sock *sk, struct tls_context *ctx)
 		goto free_sw_resources;
 
 	tls_device_attach(ctx, sk, netdev);
+	clear_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
 	up_read(&device_offload_lock);
 
 	dev_put(netdev);
@@ -1314,12 +1315,11 @@ void tls_device_offload_cleanup_rx(struct sock *sk)
 
 	netdev->tlsdev_ops->tls_dev_del(netdev, tls_ctx,
 					TLS_OFFLOAD_CTX_DIR_RX);
+	set_bit(TLS_RX_DEV_CLOSED, &tls_ctx->flags);
 
 	if (tls_ctx->tx_conf != TLS_HW) {
 		dev_put(netdev);
 		rcu_assign_pointer(tls_ctx->netdev, NULL);
-	} else {
-		set_bit(TLS_RX_DEV_CLOSED, &tls_ctx->flags);
 	}
 out:
 	up_read(&device_offload_lock);
@@ -1351,7 +1351,12 @@ static int tls_device_down(struct net_device *netdev)
 		 * The context reference pins ctx; tls_device_lock keeps ctx->sk
 		 * allocated until the validator has been switched.
 		 */
-		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
+		if (READ_ONCE(ctx->sk->sk_validate_xmit_skb) ==
+		    tls_validate_xmit_skb) {
+			WRITE_ONCE(ctx->sk->sk_validate_xmit_skb,
+				   tls_validate_xmit_skb_sw);
+			set_bit(TLS_TX_DEV_DOWN, &ctx->flags);
+		}
 
 		list_move(&ctx->list, &list);
 	}
@@ -1375,13 +1380,14 @@ static int tls_device_down(struct net_device *netdev)
 		synchronize_net();
 
 		/* Release the offload context on the driver side. */
-		if (ctx->tx_conf == TLS_HW)
+		if (test_bit(TLS_TX_DEV_DOWN, &ctx->flags))
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
 							TLS_OFFLOAD_CTX_DIR_TX);
-		if (ctx->rx_conf == TLS_HW &&
-		    !test_bit(TLS_RX_DEV_CLOSED, &ctx->flags))
+		if (!test_bit(TLS_RX_DEV_CLOSED, &ctx->flags)) {
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
 							TLS_OFFLOAD_CTX_DIR_RX);
+			set_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
+		}
 
 		dev_put(netdev);
 
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index fa71c75c2861..54d851df0c58 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -935,6 +935,7 @@ struct tls_context *tls_ctx_create(struct sock *sk)
 		return NULL;
 
 	mutex_init(&ctx->tx_lock);
+	set_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
 	ctx->sk_proto = READ_ONCE(sk->sk_prot);
 	ctx->sk = sk;
 	/* Release semantic of rcu_assign_pointer() ensures that
-- 
2.50.1

