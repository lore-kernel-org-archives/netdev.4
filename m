Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774977;
	b=vRjwE3pnfXxwAtvl7G+76xKE/r1idES2wO6Eovqf5rKz/QHXOnybffb1mn+NMc22SvZb
	 xq8HXur8iJNkVdvkQC2DKrWpiqk6+wvdp7X2gj7eqBCRhsypZX6h8U5UUXwKEoAh9Zs/P
	 fHvPx9BSPSh/DzyK2NBFdwc9jGSz70x/BjtCIq8Y0SpMruJjBuxhD9g98ulWsJOgydEoq
	 vUEqknnvcC04bIvsD9o37SZJOmxt6ik5TlwHzg5xOZpiWx059aHj9vYNzMj6LFeqSR+QQ
	 wpGMm/y3Nufe6b6Ss0vkvtbP8FGlhQldsz0vJ0V8QeJb4T/93Xi2NTV4E9m8z+KCxGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
	b=DSAv3aZFvsqNfSwtjmVp6HPjxUoo0L6nHbUPEAlt61OnqKPYDLcRHVEynokV/Yzq6Gju
	 VwoctNCyRLcNWaVlK4QZZPr6lgauBYsjK8tePKvGbOKsPTfzbL/xAhGCfdnp3KMB03hTt
	 AmUlwSoKwmTreDf3BusXOYjhUlKPuFVghh0TN1KPO1LNqHs6v8Ur547cs36qcc29zjFvj
	 wXvLN1RbEjYG0wsu3zwGse+8MY7MgUsGa/rKWyUfStxoQpJalsWjcKPAvIGx++4j5Jwv8
	 avoko23VyjFw+IreingTsSbT/brGH8Ez8o66fjmo0zcj/bGeUlE/tQWkpoTXOvisXWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CD606A6BE
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1CD606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso10653493a12.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774967; x=1796379767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=iUfprVmi1p2iZpSWamAre+Ca+1GLQ/sm48kJML9FIQ3AZbFfn9jwnrSf9AmcH21p9/
         wVigRP6lTz7WJi7gw/Su/ldnTrvtUSjIAIVEJ+BvJTPt0FPwVhDaGM1LuXt1njMDmcv3
         aFskoRgHNMaqMVg1R+5xrNRJg/8X4qh89yRySLGt09Hd/L9UtHj6JoVOE1GQWhdqHXam
         KVgDDgteoMjw0gIf+9asFXlcgBEbpNN+klZcLXRVWZaCF8AJ/fE/pyNVPk6oiDWPJd7W
         GxssRG0SVOvp7BgXaXHbwWVs3RP/UbkOMZa3U9LksCubGHx8MD8nkrtg4QAJfOQytS/I
         yCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774967; x=1796379767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=Ute4j5sby+DUHV2venW/Q1o23zY0OYoqUAmkpWpvMUCEZoFA7/0a79puNaCZqVDjrC
         +FvE51m3RVWb4YeIOjiZd7A2rZ95Rf2gy0CuyxtPeqPMcJCIWZiyC8vRmwEd5t2GKAs4
         8mtw2w2Pheb0VCT4uzthFKskd43W6WcJ5879BwvRq8cefZoMCdeC87L48hO72EgB7Dc9
         bdql+wVJl7S32TrXDFMwvsAOYg8cH9pOk/HUyRs/nZmhoTZwrT3L3irVzhG+WhiAxIr7
         7yU+4VBThg6o/M3vvCrmpIXyQkyUJ3yywkipgCpdbjMoOs6jb5Mpzn+jUv2o3Fb9OQv7
         VJkg==
X-Forwarded-Encrypted: i=1; AL+hErElpDR/BzKkIkwzsIUsXEZeVWT2c9IVXOKCFOFPXEdagul9w3fW/5lZ5vx6Aelpi3OqsKS/lDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nFValQ247kao095TdOmh3Vmww2Af5IpA1Bfqf8Nun8UrmSm6P
	ca+0kIskDwEMeL/z4+SFbuh+sED0ab8/JJQcQFVPpl522cvZhr8tkWXM
X-Gm-Gg: AZFdTZclvAgl+aPmaBqvOFz7ur3IEfRT1Bdxmd10rY9LE1ZXIUwkr08GbkumuQwSv8v
	lodiYtjybCgSkZ1AUrHzLlB3f/XkL6wlsLwQU81hkQQMRctwQgIcdlsDPkHs2QiA0Fa9mkv/D18
	l0iJn4jGr8NHSH3Y4B0v10zHfMsa6mfZze2Lh0nuJUk4mVRhDbKma8aBufKKIPKnhmeA8XUjlnb
	dfVlL4fX6FXwSEakIEv5I9CHk0Gt3GMwZtX3s5eaw/Z63DKzilaYPv8OQN7ZNT3U4Xix89H46BR
	aDeUE0ABXKsaS7eMe3sGWbB6eb3/8V8D5yxs0fERlq3anA82htE4UqJA7aS8YhTpdf2DJrhlYRk
	1bw+vp+8e4lYV5ih5k88UD/TL2wVKU3yrsu9tbJSWaZcKHCVnMCkVs8zWO+e6TXPLCMSh7x2TIi
	wojrg433NKHNYx8ehalvOpDzCliT/6CyiCoOq4H3q66DwumFVwNbgT3JH4cOE08YJ47IBOXi2gh
	0zm/PICmi/44W2Zg6oq30t/yswcdM2rEtCHQd14vzIAploMaqbJHHyX0KIFv9gs89qtaBHJhynk
	Q5XOrPTRF9Mx8nLwe0ESZH7LfSswauMTitQz4QGIuuMCUpXt
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43d:893 with SMTP id 4fb4d7f45d1cf-6ba37ee46b3mr18117759a12.35.1795774966892;
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] wireguard: peer: free packets left on the receive queue on removal
Date: Fri, 27 Nov 2026 12:22:42 +0200
Message-ID: <20261127102243.49405-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

peer_remove_after_dead() flushes the crypt workqueue and then disables
the peer's NAPI. Once a disable is pending, __napi_poll() completes the
instance after the poll returns even if it used its whole budget, so a
peer removed while more than one budget of decrypted packets waits on
rx_queue keeps the rest there. Each entry holds a keypair and a peer
reference, so the peer is never released; the WARN_ON in rcu_release()
that checks for leftovers is never reached either.

Free what is left on rx_queue once the NAPI is gone and nothing reads
the queue any more. tx_queue needs no such step: transmit_packet_work
drains it without a budget, and its entries keep the peer alive until
then.

Hit on a single-CPU MIPS router (Realtek RTL8196E) in everyday use as a
WireGuard gateway, then reproduced with the WireGuard selftest VM (x86
KVM): remove a peer while a UDP flood keeps its receive queue busy,
re-add it, bring the session back up, repeat, then run the selftest's
created/destroyed object check. With 1 vCPU the unpatched kernel leaks a
peer and its keypair in 25-40% of such removals ("wg0: Peer 11: merely
created"); with this patch, 0 in 210. The next patch adds the loop to
netns.sh.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a93..6bafe5724 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,19 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each receive queue entry holds a keypair and a peer reference. */
+static void peer_purge_rx_queue(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+
+	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL) {
+		wg_prev_queue_drop_peeked(&peer->rx_queue);
+		wg_noise_keypair_put(PACKET_CB(skb)->keypair, false);
+		wg_peer_put(peer);
+		dev_kfree_skb(skb);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -108,8 +121,9 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	/* The transition between packet encryption/decryption queues isn't
 	 * guarded by is_dead, but each reference's life is strictly bounded by
 	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	 * ingestion, so we can simply flush twice, and be sure that no crypto
+	 * worker still holds a packet of this peer. The per-peer queues may
+	 * still hold packets after that; see below.
 	 */
 
 	/* a) For encrypt/decrypt. */
@@ -122,6 +136,13 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI that is being disabled completes after the poll in progress,
+	 * even if that poll used its whole budget, so rx_queue may still hold
+	 * packets, and nothing reads it any more. tx_queue is left alone: a
+	 * transmit_packet_work queued during the second flush may still be
+	 * draining it, and its entries keep the peer alive until it has.
+	 */
+	peer_purge_rx_queue(peer);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.
-- 
2.43.0

