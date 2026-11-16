Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830694;
	b=N6FZEhz1dn4eBuxKJ3YtmRZX1gFu6Vk4VzU6OEOHl+5pPViYTWy0TStPKk6r444DI0xM
	 vBavno8ahbCtLYDSlHlAiE1G12Uk91AmXIXi/OLZSHAaBjEoOwzOnT9MxtAoxE7XmAYb4
	 6pCKC4/wOdY1UcZkyuDpLMCzn8keV21jZoA92Dn5yZ1FmbeIncZhMAAXF5KEZ7LhjAd9W
	 jPamlKtwo3fbEmAHcfWUv9FRJVHdb1t+AAQ/C2zQ2GwjNaJjvv2IxW0GmvwHsZlVbE6ra
	 v0aPIh/HfwHgAWFqQS36R8hrNhP0VtJ4/no9kYbvDeOH4a9V42ZvwwSegzZJuBnrYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
	b=uGXwGozGJKx5FD3tCvGAXWGV9L2dg7pmjmg4qnV+vWDqkeNBSXvMTOkaQygn35Tbk18y
	 ExX6zh8u8BfVwEWWfc0eOx9E5nKrcV95mzEbO9I4tg+ODoOYaF2ka7vXEszqMQSalb0Vb
	 lu7pqXQCVjWUi7oxKsSQ3GOlp0CHhoCPRPfczD9QGQ4SlgV1IW46ZC1hN7M4FCjIApTm4
	 SHuJlMd8ljwxy1v3rX50WUkvEW1IXF1qj+mAvreBPdgtFAoh4Huawh8aTdKibU5EOva7G
	 p3++dc9PbAPDRUcC7IA1df+jXQT9yBAL7yslXXT9ASpGimA67rMzGh7rXtTPmB2eTMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQYWUNWA;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B48606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQYWUNWA
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4bc5b8de5so6321167b3.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830693; x=1795435493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=XQYWUNWA/Z9kFl+eUr/6baRH8U8s/xW1GbhE2QVEVJBlihAnpRwzJHq1u4RVPQyZ6t
         8dYRF4ayMh7rh8ZZyLbVWb/xFcW7vfBnCCFXt1ZFy3ufaCQDp++s+CnGoTQ57hnva5d5
         4nxyTOfG0UwkiNQPaJNZpZdwFWUhppAgj98qQH6qs8vI85CIF30MF1dVYH93IP28P9qN
         MWoW+jBMmdtnkmI6aIDzAsJbn3NUXhhHs165HSiaaV7DHn00+h1+igTQhWBI/qXgp/nF
         pGFvunMr/dFNroLuTcOCaCrCjgk9+xKCwVbD19WCamSEmkb7SmXnZSq0xTWsc0Pdb3BZ
         z8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830693; x=1795435493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=iywNdIVo5V4iHUDUBMUi+h8vPqF0yj8L1oz+2zlAiscaXcuXNAE29YGrUjBgoO3VRN
         skzAdsxLG6BeGeefK8zwVooMjxIKP9nkScAzRNFYehCpn1ZKzK8TKglCZk8wcDgWmYjY
         YQXy7yPUUHhyTTQ61fHwFhIGPI/N8obvLrLGbdvCcFngAvIpFnNYzDX4wKK9Q5Kx8Swf
         Dgq3MBHAnvigSZleIvrV4sqFvs+PQ8dlfhyFUr20+YlAzbK88BhuxvuHAzKIsQNoCIkE
         K94wpfQ/F06uNUocbHGCEfnY59kcEUCvwdw4Fi+gJ4e2AuLKwwOeidzrFw3Mc+bfuODq
         CAdw==
X-Gm-Message-State: APuU4Z/po8zxFIigXw/dzpO8pX2hZreDPU9yMFhfRqq0qXyU5CP8cSqk
	k3+ifxmldAmVuA9cAZ/d8SXh4ugt/BQyJJNPzf5kjpOk3Ws6HajE4M+PJwI0VEqS
X-Gm-Gg: AZFdTZf2Mgm3HeiBuSzoEszDTKLodK3vJ/mLj2YJ7bP2v7V9VIMQnrfJfx2GO/8DGbG
	wGSMSIZ/Xevb00QvSIv8lHE3k21wbEt9AFxc9MElq5Mrpu/vjvcJkwTUdtl13FFRtJbOZodsRO/
	RSXjp0M8B6ZT3d1raYU9qocmTG6WVFZulXUQ/doG/J7I81xXgVaKXOxHl6kXmiDYETv8vNDlTsg
	PqoS6cbFw9QlZiwkSBGfzDAF5ingXGiu8ny1Iova0LuobXJ09w+gppBi6YNzR/x8Z06p3fRwgtY
	Zk8fcXnnZWL4PCOPe/SXDs3FQXbUO58qFzIcteT2949TMpr938Ia8K+eO73YFKc0dnWuu51PhK/
	32vUCNOxV2KIa8O8ufnGxM119Bfak9/K0HrcsL4BjZpIFEbg655qk3lAsTZpFPcNoRZ9/2qlK1X
	4pESdTwmeE1//IFVb2lpddHdfFJTdBx4lkt9doOnhIKa5R+ky6lAD/Y4PlVE8EmdYPoCT76jpzy
	oGNPjayoBquO9rXlAGuP9HyfzLmEnuJ5ney2C/qdvdiRoGVtSUMxjDYX1IoXhvDNCb1t9KxPqpq
	ahX+pnHIDTxKXlhatRDnGv/i6Q==
X-Received: by 2002:a05:690c:f95:b0:8ae:98ce:5497 with SMTP id 00721157ae682-8b3baa08396mr80137557b3.0.1794830692420;
        Mon, 16 Nov 2026 04:04:52 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4cf38590bsm33071347b3.14.2026.11.16.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:48 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:36 -0800
Subject: [PATCH net-next v4 1/5] psp: support rx rekey operation
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-psp-v4-1-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Support updating the rx PSP state used by a socket. This is most
useful to do after a device key rotation has occurred and the key
being used by the peer will become stale after the next device key
rotation.

Create a new psp_assoc for the socket to use that contains the same tx
state, but with new rx state. Copy the previous rx state to use as a
fallback while the peer is in the process of switching to the new key.

skbs matching the current rx spi and generation or the previous rx spi
and generation will be accepted. It might be reasonable to stop
accepting skbs on the previous state after seeing skbs with the new
state and after waiting a grace period, but that is not implemented
for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count it in stale-events
- drop the requirement that the new rx spi has the opposite phase
  bit from the previous one
- keep prev_generation valid across a rotation when the prev SPI is
  from the same generation
- document rx rekey in the rx-assoc op doc in psp.yaml

v2:
- copy old rx state by value instead of pointer to prev
- place non-datapath fields at end of struct psp_assoc
- disallow rx rekey when socket is not in full psp state, or
  dev/version doesn't match.
- require the new rx spi to have the opposite phase bit from the previous
  one
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     | 23 ++++++++++++++--
 include/net/psp/functions.h          | 10 ++++---
 include/net/psp/types.h              | 17 +++++++++++-
 net/psp/psp.h                        |  3 ++-
 net/psp/psp_sock.c                   | 52 +++++++++++++++++++++++++++++++++---
 6 files changed, 96 insertions(+), 13 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index f3266763c325..d5713f5d1af7 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -265,7 +265,9 @@ operations:
 
     -
       name: rx-assoc
-      doc: Allocate a new Rx key + SPI pair, associate it with a socket.
+      doc: |
+        Allocate a new Rx key + SPI pair, associate it with a socket.
+        If the socket already has PSP state, rekey its Rx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 0f9b6b73f244..fab797506b0a 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -140,14 +140,33 @@ The PSP assoc state of a socket is not reset when the connection is
 torn down. ``connect()`` on a socket that has PSP assoc state will
 return ``-EINVAL``.
 
+Rekeying
+--------
+
+A connection which has completed the exchange described above and is
+in the "PSP Full" state can be rekeyed in place without being torn
+down, using the same netlink calls as in connection setup.
+
+``rx-assoc`` allocates a new Rx key and SPI, which should be passed
+to the peer exactly as during the initial exchange. The SPI which was
+in use before the rekey remains acceptable on the socket until the
+next Rx rekey, or until the device key it was derived from has been
+rotated out, so packets the peer sent before it learned the new SPI
+are still received.
+
+A rekey is rejected with ``-EINVAL`` if it would change the PSP device
+or the PSP version of the association. It is rejected with ``-EBUSY``
+if the socket has not completed its initial exchange in both
+directions.
+
 Rotation notifications
 ----------------------
 
 The rotations of device key happen asynchronously and are usually
 performed by management daemons, not under application control.
 The PSP netlink family will generate a notification whenever keys
-are rotated. The applications are expected to re-establish connections
-before keys are rotated again.
+are rotated. Applications are expected to rekey their connections,
+as described above, before device keys are rotated again.
 
 Kernel implementation
 =====================
diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index 410adb6718c1..5a7a518b9579 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct psp_assoc *pas)
 static inline bool
 psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
 {
-	return pse && pas->rx.spi == pse->spi &&
-	       pas->generation == pse->generation &&
-	       pas->version == pse->version &&
-	       pas->dev_id == pse->dev_id;
+	return pse && pas->version == pse->version &&
+	       pas->dev_id == pse->dev_id &&
+	       ((pas->rx.spi == pse->spi &&
+		 pas->generation == pse->generation) ||
+		(pas->prev_spi && pas->prev_spi == pse->spi &&
+		 pas->prev_generation == pse->generation));
 }
 
 static inline enum skb_drop_reason
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index b8905efbd604..9eb89d2d680c 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -3,6 +3,7 @@
 #ifndef __NET_PSP_H
 #define __NET_PSP_H
 
+#include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <net/net_trackers.h>
@@ -78,7 +79,8 @@ struct psp_assoc_dev {
  * @active_assocs:	list of registered associations
  * @prev_assocs:	associations which use old (but still usable)
  *			device key
- * @stale_assocs:	associations which use a rotated out key
+ * @stale_assocs:	associations which use a rotated out key, or were
+ *			superseded by a rekey
  *
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
@@ -152,6 +154,15 @@ struct psp_key_parsed {
 	u8 key[PSP_MAX_KEY];
 };
 
+/**
+ * enum psp_assoc_flags - flags of struct psp_assoc
+ * @PSP_ASSOC_SKIP_TX_KEY_DEL: Do not delete Tx key from psp_dev. It was
+ *	copied to a newer psp_assoc during an Rx rekey.
+ */
+enum psp_assoc_flags {
+	PSP_ASSOC_SKIP_TX_KEY_DEL	= BIT(0),
+};
+
 struct psp_assoc {
 	struct psp_dev *psd;
 
@@ -159,6 +170,10 @@ struct psp_assoc {
 	u8 generation;
 	u8 version;
 	u8 peer_tx;
+	u8 prev_generation;
+	u8 flags; /* Slow path, protected by psd->lock */
+
+	__be32 prev_spi;
 
 	u32 upgrade_seq;
 
diff --git a/net/psp/psp.h b/net/psp/psp.h
index b123c2427905..92d7b92acaed 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -63,7 +63,8 @@ static inline bool psp_dev_has_sadb(struct psp_dev *psd)
 static inline bool psp_assoc_needs_tx_key_del(struct psp_assoc *pas)
 {
 	lockdep_assert_held(&pas->psd->lock);
-	return psp_dev_has_sadb(pas->psd) && pas->tx.spi;
+	return psp_dev_has_sadb(pas->psd) && pas->tx.spi &&
+	       !(pas->flags & PSP_ASSOC_SKIP_TX_KEY_DEL);
 }
 
 #endif /* __PSP_PSP_H */
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index f2cba3fa3a23..c1e38845f08c 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -149,10 +149,39 @@ void psp_sk_assoc_free(struct sock *sk)
 	psp_assoc_put(pas);
 }
 
+static int psp_sock_rx_rekey(struct psp_assoc *pas, struct psp_assoc *prev,
+			     struct netlink_ext_ack *extack)
+{
+	if (pas->psd != prev->psd) {
+		NL_SET_ERR_MSG(extack, "PSP device mismatch with existing state");
+		return -EINVAL;
+	}
+	if (pas->version != prev->version) {
+		NL_SET_ERR_MSG(extack, "PSP version mismatch with existing state");
+		return -EINVAL;
+	}
+	if (!prev->tx.spi || !prev->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	pas->peer_tx = 1;
+	pas->prev_spi = prev->rx.spi;
+	pas->prev_generation = prev->generation;
+
+	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
+	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);
+	prev->flags |= PSP_ASSOC_SKIP_TX_KEY_DEL;
+	list_move(&prev->assocs_list, &prev->psd->stale_assocs);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 			  struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
 {
+	struct psp_assoc *prev;
 	int err;
 
 	memcpy(&pas->rx, key, sizeof(*key));
@@ -165,10 +194,11 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		goto exit_unlock;
 	}
 
-	if (psp_sk_assoc(sk)) {
-		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
-		err = -EBUSY;
-		goto exit_unlock;
+	prev = psp_sk_assoc(sk);
+	if (prev) {
+		err = psp_sock_rx_rekey(pas, prev, extack);
+		if (err)
+			goto exit_unlock;
 	} else if (sk_has_decrypt_user(sk)) {
 		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
 		err = -EINVAL;
@@ -177,6 +207,7 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	refcount_inc(&pas->refcnt);
 	rcu_assign_pointer(sk->psp_assoc, pas);
+	psp_assoc_put(prev);
 	err = 0;
 
 exit_unlock:
@@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
 	 */
 	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
 		pas->generation |= ~PSP_GEN_VALID_MASK;
+		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
 		psd->stats.stales++;
 	}
+
+	/* Don't allow SPI from two generations ago to alias one from the
+	 * current generation. Rx rekeying under the same device key generation
+	 * is currently permitted, so skip if the previous SPI is from just one
+	 * generation ago.
+	 */
+	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
+		if ((pas->rx.spi ^ pas->prev_spi) &
+		    cpu_to_be32(PSP_SPI_KEY_PHASE))
+			pas->prev_generation |= ~PSP_GEN_VALID_MASK;
+	}
+
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 

-- 
2.52.1

