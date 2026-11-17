Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944524;
	b=WrynigrPkxJRgDN38UpClDq/oy8Ed2cCavnrzvOScNZ/tvoq/hWfSF7hUnORrr7FPmOk
	 2F8eJAi30GHWl+cUHHGtTEeoe5w5sTFGrHzZF9xWvW8Q2V1bbrVornldBfMV3Fl8D/wDH
	 s6zIYexXJDvXciH1eIVF53NSJN/JBvQWZF2DeZYsK81AgCb3sZqvSsa19kq1WtsjX1n9v
	 lETHexCTFa29uAhrEEGOAV7BnO2OfER3tA+HjqEyFii40mb3g7VvpQ13qYxTF6RyyY/Pf
	 PtyHhih3sjbq1WvzOOdfIUIaH/qZXVFnz8/G7TklsApwcM74t455dAe1RCI8PzMiuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cfpAEo+H03jVyrZN/y8r60UoKsXhvGp4wm0aEGkEoDU=;
	b=jBGuLcx05ZN42CHWh659t3sbmFJKLXIQmFYSC9olCzSUZ/AdkmUbwrdOQO3hoZonbYx1
	 ojLJPBKraVBG55Z8Y4w08aMALHgRSG14P72TlEtsGCPKkp6VtA2hkC9q94BCum2Yjr9Ou
	 nu/ZaBdwGZVzU1tHZEmqUFePBWmZMzDqmiZyO7kJXUO2PEFFFAorDp4SzODQAK0VcdhEj
	 VtrlFt/WxcqC89Zl2weyzdagNGrNT7ksHS8odM3ZXSjLCamU0WR6gRtaaSFgfZVeTRhXG
	 3ZsJ+GKDRq7kQEYdh4Rm/Af7DkH7MW7E05WF6BXbDTyP5sFD7lAy59BN/xVF0dsCqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fxPYp+Mi;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B1606A88B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752B1606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fxPYp+Mi
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71aed54d4c5so145229eaf.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794944523; x=1795549323; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cfpAEo+H03jVyrZN/y8r60UoKsXhvGp4wm0aEGkEoDU=;
        b=fxPYp+Miv776WZqfDjJkCDYHZbUr16QkhZ8Je+qdBlCj70yH3/d2GP9xv479/NAAkF
         vHdt7zXlP26/feIHaAgf4i6tT592VOD0aAX5OwpIVzb2aEkrSmbf6zzXTIqZs4yPLj6M
         JkYWjY2kJLPPWrDombmZQr/sMyn6C18pVBHyAz1NUOxpFy4jSVj099BLOb59Sfoxd/yT
         mKhJwrgSYi1SQsbFYK2rUxgfOqisDuqVqMBX1e7s6oULeizQEtNz51SAAoMSkBagETkF
         GNkZNKv9Ae7rFb3nt6Q8NcbLnJ2VK6YiWsOi8xW2P7PCxvVfF8/ZkNLxbxrfHrMHc9IO
         8kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944523; x=1795549323;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cfpAEo+H03jVyrZN/y8r60UoKsXhvGp4wm0aEGkEoDU=;
        b=CdjWMLKw0ezzMJkj0jhm9yWvdsN2jKB0iswA0+MUlxY2vAzqanZb1jFk510alNo7xv
         2w0+sdeSOCLBatXMCHbwywgTCe40NJpuRFnqIkh9HY9Al+cqMt++Ks5jsqsXJSHau9Q0
         eUQvQSghor3poiA2NuyUCe1Cp+ggqbPjElekW+Iy5R1O4XsLifJ8PwSF92+rd0i8/IQB
         uutMx0zxgfxKit0Uc89vSMPA6EUsAAqvBfQkY2tmMN5EsEDRypLYCRFwhyhEc2iQ9/3A
         1c9fRc/0P0uXfzv4wQfEUGlm+rx7CJih6RP74bCPAEERGkta5nJVpZfcPZTUv0AcKHqP
         EahQ==
X-Forwarded-Encrypted: i=1; AL+hErGZ3F9sL08kxQ00djXQd6VJ+ck183Zbhh9waa6M3nNji9415hzmytJHKi4tT2x3utulY4t/P5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kp4+UsK3EAghSQUsmVbje7E1h92MCEVeoXz5+rt+xFWinQQ/e
	Z21XTFw2iXGU66KGnagtijxKM8dcrk36+rtCNO3c7ZnDRuOyhhr4kRhCfF2BHrcr7Sg=
X-Gm-Gg: AYBFou1GcrQG7NSsNcWPUU4gGR6cJzRNeK++YsurKuAuof5kGqyOJLGsa1CtRsR2MYX
	fbs8dhdfV5X+USrDsS6aucuXznNU/q/ZwSYmLee+aVFRKPSWfBIojxykDg3Wr1dHp/8c/hU4jfu
	dr2UprvIVmQgAMCLztaJv5bUhB71yqbd4lfCuse/9csZMP7igVOK8MoeqpQXPneot5Yr+gAcCey
	iyqwwgYgol5YDRsK/u+XHr1WKiXAxuElOKGJTmrcApPtXaKjUV0Xo6BuX9pgO6MGc4NcY5/sbMF
	mWL9t9Zr0bMn8lxDHTHZmaHU753ad58YfEhlaR76C8E0ywr4YttOPBErKs+w9izEdeL150RZ0H2
	/fouYTps9QyumpX+DxVhrKgCcd3O+Pdz9BiPieOL2QUrMWOccdWa9fTTrigy3kfpAR9bF5+oATh
	CvrMA0Rl1Ts9x0azodEEKQx4qQ8MqoPC0hbx9BleyobLdt5Xm8zbdzzs2JBblIuOgNf7iVm75rn
	GeqzUYODA7msjhFwfgt3lux/NUvuwDcvC1NC/JWvKIvwlIZLipqV4AcAchIolTUufosj0TGww6P
	J2atyAnLtyRZ45No
X-Received: by 2002:a05:6808:190b:b0:56e:1e8c:7e42 with SMTP id 5614622812f47-5773c52fecfmr971672b6e.6.1794944522354;
        Tue, 17 Nov 2026 11:42:02 -0800 (PST)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e28::499:40])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57777f04c32sm17152b6e.1.2026.11.17.11.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:42:01 -0800 (PST)
From: Chris J Arges <carges@cloudflare.com>
Date: Tue, 17 Nov 2026 13:41:51 -0600
Subject: [PATCH net v3] wireguard: drain per-peer queues with sentinels
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-fix-wg-peer-removal-v3-1-36cf733c2d94@cloudflare.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6tqbTgoor72FclHaAGqCkhaoh3
 N2CLkxk+Sdv3puIR2fQk3MyEYfBeGO7OMQuIaqWXYXU6LgJZ/zAcga0NE/6qGiP6KjD1gbZ0FS
 USuRMMwFA4mfvMGKr9Uo6HMjtc/RjcUc1LL4Fq40frHut7QAr/M3wzUwACvQoGeSszJQu4KIaO
 +qykQ73yrZrJvAfEYhtEY8ipqTG/JTxNJN/onme34vXyq0bAQAA
X-Change-ID: 20260901-fix-wg-peer-removal-43fc390d0311
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1794944520; l=9500;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=iuIo3TKnQZK/k+TQQPCb+csWCzOOYf7cOMAGe6b+MYA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNT7Nmc5B+zcNYgozlf6J9M4bvwDrfGqeip2JhM4F9xhavFTQMIFr1EfiOLjQ1PBKUvCsBGXrmU
 0W6YHDp4VyQU=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

peer_remove_after_dead() flushes device-wide packet crypto and handshake
workqueues while holding RTNL. Unrelated peers can keep those workqueues
busy, delaying removal and other users of RTNL.

After closing packet admission, append an internal sentinel to each of
the peer's TX and RX queues and wait for their completions. The serial
consumers reach each sentinel only after handling all preceding packets.
Reserve an extra queue slot for each sentinel so full queues can drain.

A crypto helper can publish a packet's final state before queuing TX work
or scheduling NAPI. An already-running consumer can process the packet
and its following sentinel during that interval. Guard publication and
notification in RCU read-side sections, then wait for a grace period after
both completions. This finishes those notification calls before flushing
the peer's TX work and disabling NAPI.

Keep the sentinels on the remover's stack until the consumers finish, and
recognize them before normal packet, keypair and reference handling.
Flush only this peer's handshake work; timer teardown already flushes its
key-clearing work.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
Changes in v3:
- Use sentinel approach and not use atomic counts for every RX/TX packet.
- Link to v2: https://patch.msgid.link/20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com

Changes in v2:
- wait for RX packets to drain from peer’s NAPI queue
- Link to v1: https://patch.msgid.link/20260902-fix-wg-peer-removal-v1-1-7a0190f5cdb1@cloudflare.com
---
 drivers/net/wireguard/peer.c     | 42 ++++++++++++++++++++++++----------------
 drivers/net/wireguard/queueing.c | 10 ++++++++++
 drivers/net/wireguard/queueing.h | 22 ++++++++++++++++-----
 drivers/net/wireguard/receive.c  |  4 ++++
 drivers/net/wireguard/send.c     |  4 ++++
 5 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a932e0..25d87509df93 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -93,6 +93,10 @@ static void peer_make_dead(struct wg_peer *peer)
 
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
+	struct sk_buff tx = { }, rx = { };
+	DECLARE_COMPLETION_ONSTACK(tx_done);
+	DECLARE_COMPLETION_ONSTACK(rx_done);
+
 	WARN_ON(!peer->is_dead);
 
 	/* No more keypairs can be created for this peer, since is_dead protects
@@ -105,28 +109,32 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 */
 	wg_timers_stop(peer);
 
-	/* The transition between packet encryption/decryption queues isn't
-	 * guarded by is_dead, but each reference's life is strictly bounded by
-	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	/* While is_dead guards against new TX/RX, there may be existing items
+	 * in encryption/decryption queues. To address that, queue a sentinel
+	 * on those queues and wait for completion for both tx/rx queues.
+	 */
+	wg_prev_queue_enqueue_sentinel(&peer->tx_queue, &tx, &tx_done);
+	wg_prev_queue_enqueue_sentinel(&peer->rx_queue, &rx, &rx_done);
+	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
+		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
+	napi_schedule(&peer->napi);
+	wait_for_completion(&tx_done);
+	wait_for_completion(&rx_done);
+
+	/* Handle edge cases where a consumer can finish a packet before crypto
+	 * helper schedules the consumer again. Use RCU sync to ensure that all
+	 * notification helpers finish.
 	 */
+	synchronize_rcu();
 
-	/* a) For encrypt/decrypt. */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.1) For send (but not receive, since that's napi). */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.2.1) For receive (but not send, since that's wq). */
+	/* Keep the sentinels alive until both consumers have finished. */
+	flush_work(&peer->transmit_packet_work);
 	napi_disable(&peer->napi);
-	/* b.2.1) It's now safe to remove the napi struct, which must be done
-	 * here from process context.
-	 */
+	/* netif_napi_del() must run in process context. */
 	netif_napi_del(&peer->napi);
 
-	/* Ensure any workstructs we own (like transmit_handshake_work or
-	 * clear_peer_work) no longer are in use.
-	 */
-	flush_workqueue(peer->device->handshake_send_wq);
+	/* wg_timers_stop() already flushed clear_peer_work. */
+	flush_work(&peer->transmit_handshake_work);
 
 	/* After the above flushes, a peer might still be active in a few
 	 * different contexts: 1) from xmit(), before hitting is_dead and
diff --git a/drivers/net/wireguard/queueing.c b/drivers/net/wireguard/queueing.c
index 26d235d15235..db3b94e57db7 100644
--- a/drivers/net/wireguard/queueing.c
+++ b/drivers/net/wireguard/queueing.c
@@ -77,6 +77,16 @@ bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
 	return true;
 }
 
+void wg_prev_queue_enqueue_sentinel(struct prev_queue *queue, struct sk_buff *skb,
+				    struct completion *completion)
+{
+	PACKET_CB(skb)->completion = completion;
+	atomic_set_release(&PACKET_CB(skb)->state, PACKET_STATE_DRAIN);
+	/* Reserve an extra slot even if the queue is full. */
+	atomic_inc(&queue->count);
+	__wg_prev_queue_enqueue(queue, skb);
+}
+
 struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue)
 {
 	struct sk_buff *tail = queue->tail, *next = smp_load_acquire(&NEXT(tail));
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 663b19b78395..e8d912f36ed8 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -7,6 +7,7 @@
 #define _WG_QUEUEING_H
 
 #include "peer.h"
+#include <linux/completion.h>
 #include <linux/types.h>
 #include <linux/skbuff.h>
 #include <linux/ip.h>
@@ -53,12 +54,16 @@ void wg_packet_encrypt_worker(struct work_struct *work);
 enum packet_state {
 	PACKET_STATE_UNCRYPTED,
 	PACKET_STATE_CRYPTED,
-	PACKET_STATE_DEAD
+	PACKET_STATE_DEAD,
+	PACKET_STATE_DRAIN
 };
 
 struct packet_cb {
 	u64 nonce;
-	struct noise_keypair *keypair;
+	union {
+		struct noise_keypair *keypair;
+		struct completion *completion;
+	};
 	atomic_t state;
 	u32 mtu;
 	u8 ds;
@@ -133,6 +138,10 @@ void wg_prev_queue_init(struct prev_queue *queue);
 /* Multi producer */
 bool wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb);
 
+/* Called only after packet admission has stopped. */
+void wg_prev_queue_enqueue_sentinel(struct prev_queue *queue, struct sk_buff *skb,
+				    struct completion *completion);
+
 /* Single consumer */
 struct sk_buff *wg_prev_queue_dequeue(struct prev_queue *queue);
 
@@ -176,15 +185,16 @@ static inline int wg_queue_enqueue_per_device_and_peer(
 
 static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet_state state)
 {
-	/* We take a reference, because as soon as we call atomic_set, the
-	 * peer can be freed from below us.
-	 */
+	/* Keep the peer alive across state publication and TX scheduling. */
 	struct wg_peer *peer = wg_peer_get(PACKET_PEER(skb));
 
+	/* Teardown waits for this section after the drain sentinel completes. */
+	rcu_read_lock();
 	atomic_set_release(&PACKET_CB(skb)->state, state);
 	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
 		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
 	wg_peer_put(peer);
+	rcu_read_unlock();
 }
 
 static inline void wg_queue_enqueue_per_peer_rx(struct sk_buff *skb, enum packet_state state)
@@ -194,9 +204,11 @@ static inline void wg_queue_enqueue_per_peer_rx(struct sk_buff *skb, enum packet
 	 */
 	struct wg_peer *peer = wg_peer_get(PACKET_PEER(skb));
 
+	rcu_read_lock();
 	atomic_set_release(&PACKET_CB(skb)->state, state);
 	napi_schedule(&peer->napi);
 	wg_peer_put(peer);
+	rcu_read_unlock();
 }
 
 #ifdef DEBUG
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 824bbefce61c..beca1e6308dd 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -452,6 +452,10 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
 	       (state = atomic_read_acquire(&PACKET_CB(skb)->state)) !=
 		       PACKET_STATE_UNCRYPTED) {
 		wg_prev_queue_drop_peeked(&peer->rx_queue);
+		if (unlikely(state == PACKET_STATE_DRAIN)) {
+			complete(PACKET_CB(skb)->completion);
+			break;
+		}
 		keypair = PACKET_CB(skb)->keypair;
 		free = true;
 
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index 67d01478eb76..e72264b64e72 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -270,6 +270,10 @@ void wg_packet_tx_worker(struct work_struct *work)
 	       (state = atomic_read_acquire(&PACKET_CB(first)->state)) !=
 		       PACKET_STATE_UNCRYPTED) {
 		wg_prev_queue_drop_peeked(&peer->tx_queue);
+		if (unlikely(state == PACKET_STATE_DRAIN)) {
+			complete(PACKET_CB(first)->completion);
+			break;
+		}
 		keypair = PACKET_CB(first)->keypair;
 
 		if (likely(state == PACKET_STATE_CRYPTED))

---
base-commit: 67869597fab06abaa5b977cb7004532269fc960b
change-id: 20260901-fix-wg-peer-removal-43fc390d0311

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

