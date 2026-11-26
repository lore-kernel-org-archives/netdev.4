Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686452;
	b=EU3BEWL+Q/qXKHEPySCLqY2If2gxfrupUMqMEzKTxFdm6s7fsx/N71LS5IvcYywUbqI0
	 tyr6AjFkb6U6psGQt2KeO2aH4st6A8JMhSaI0XaU+m723bv6HBKeIQBB6RH+wZSjD1fQN
	 WmltU/Di1jCoE4L/1wHWM4ExXSc8D/f+iI2rjUDZBRylH3KgDaHXbVwHdFbIuRk1s5gKu
	 23BwZS9ASawuOdJxDGRqTZU3EHyx2zLP9c2qzD3AOOHdo7rN32Q6ATxz/vGLuMe/dWaL5
	 5csF59r7gYeiJADoixuYb9iamOxWBkczxKMHq62SIDlMsaqN/nQDiNfcSxy5qf0dXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
	b=lEclSOaA0eP4QylFD77Rr+Kb2nuKaKVT/YGHCjGyPq0B6TJD0h6keb6cjqjGBMDoKplQ
	 bdyEYs0pNYgOWBRKS2AVzBxg2KaS93QtQAguxyhu3KjF79JLLhzocwqryOZOwP00kmIV3
	 N1yrzI6htFE3TR8ToxiR/cm+7KXulSyHGWfGUF1VDEBnXH8N7Kx9wtVt+xS3U+xJ9SiZX
	 5RIVloJALcDJWouDgStAaKYJFrLy2qVaTBD1bfKe1qNFk3NJkRR159PB6oJ0wpk3KCAuZ
	 +/Bm2Np3nr2afHOczh/VmfY+2D2u6tZB7BBqq5qKqb1EjPD4EQFo2efoNad1VynwNLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGKJDkKI;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD2606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CD2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGKJDkKI
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5126505cb3so880166066b.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686450; x=1796291250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
        b=gGKJDkKIKrjS/e3C0IpipinDtBBDVlS722h1FfEacoDIYwVLYuzltZxsazd3qs8OoQ
         fUyErCNMV+QWTsLsFx+J18kWkZHo5IIWOmfm1owGHLnOcE6RtBeC2I/TFuX8VSB9zohz
         YssXA3pkNplcxGq2wPU0a1+BTtmeZhWx+R2HYStPUwc6W716E+imrw95RIweGW4H27GX
         KxsYVlovMjn7CeyYLC0wE191Pq68TIUxuQl4JD/S0D6La2OBUKjF8GSPbeNOy3z/lnMe
         Cm+OUgYLyJ6981J3W1kSlz+miMoDxpKzU6IMHLU0iSvBldwvJ0lLIAKOtYxuMhOC+Cs1
         3mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686450; x=1796291250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
        b=GK8F+qEk5Z0qxFbEtkJT1y+5S24OA4gxoS1mu3BZUn/cMl9l2t6G/qUfC/U9j3BPag
         xR1cP+djNVUccstO61B9EVjdkgzh8YByFCpdUOeppl/U/SQZyzklteoIBhjjmADQEWVM
         QKjISwETyAOHFR4aJb0u0uqg+gc8ITxkkKwGlOJ830hv9MWKigFZ4pciKcoF+S3KHpSW
         G/vG7uDmrNw0zmQrdnaZw7nbG4ardJyPTmEEa1naeQkhgmITk9npL7N0k1eYNPUvvSXc
         +HQe7b+IUXsSXeC+7wKX3GaOZAjROz/maJRNRtra5InlMpIrIzxkr/J12q4I/SAS4TyW
         WpNw==
X-Forwarded-Encrypted: i=1; AL+hErEkqO2gqyOMUTbdw4nnZuA+U+UXgn55yAFev4B2PrpLrQK94UVT4Po7Q0XFLSSoU18ygbeC/kU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jnSmCsTxNGxE6uYhVpmfdbR1SclBl550mAzxnw4d/wI+qnpx0
	vzz20ScSZz/UbplOuevUlgc/AsnI6a4re5PcQmwOm2uAZ9VwoxVUKu4wn9wHSkuE
X-Gm-Gg: AZFdTZcHhp3A6MmZpjtxDRTKfUFMsuaKRtXwd/fbFSLC7b8Mf+c6C+Nmqq775rihiW3
	OsHHcwGew3DKQqDv0w11eshsp22RtjA2N3DjVkOBc5NYyRg1WEd2Jk0Upxq8JU6R9R6hdcvZHie
	hHpXf9vhN6Yi1dXN+gbrsRgZHj1rwiNBOmWnQDX7mvcCaqLzesdlMJAOyNLWcSD3hI3OR+SZMSI
	Q7F+4HWBf6bTrBFrYHaqU++8gvNFohLfDY2Ay0oArxF4e5eD3clEG9H/LJ5k4nO8aI4SulPMS6r
	f5uG9RsO9rJYNnNHBL1JEClEymUEFss6mk8U6w93KWEXhn8wk/ZMv1ppY/hYxs+boGxkRyKt3sE
	q0Z8z6x1+bGybIzJRwiDU4XDNI8Pyj/vvRB6qq2VkEQ7P9PycF11eiKeuczJFY4rrs3PLinKFSb
	T1WP2QMT7DPBkyICD+z93E095eTArtIpK3hd3U+gjztTzZHEl/YqyLrYqjiQNJkobmHU1q0A6jP
	YMrpwrnmDCsnPsz34HdYBQ3Mi/MN+eh3+tjTSurYItKYAG2YBi/u60+kKf+8XFgkAphcmCKVaJe
	6d1MkE3Xsd8JF5+TCWob4V/if0ea3fhrwBCmNv8AxQb/4ORT
X-Received: by 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c513a99abe6mr1685897766b.13.1795686450072;
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:29 -0800 (PST)
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
Subject: [PATCH net v2 1/2] wireguard: peer: free packets left on the per-peer queues on removal
Date: Thu, 26 Nov 2026 11:47:21 +0200
Message-ID: <20261126094722.73025-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126094722.73025-1-apasichnik9@gmail.com>
References: <20261126094722.73025-1-apasichnik9@gmail.com>
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

Free whatever is left on both per-peer queues once nothing can feed them
any more: receive entries are single packets, transmit entries lists.

Reproduced with the WireGuard selftest VM (x86 KVM): remove a peer while
a UDP flood keeps its receive queue busy, re-add it, bring the session
back up, repeat, then run the selftest's created/destroyed object check.
With 1 vCPU the unpatched kernel leaks a peer and its keypair in 25-40%
of such removals ("wg0: Peer 11: merely created"); with this patch, 0 in
212 removals. The next patch adds the loop to netns.sh.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a93..3e08898ce 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,25 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each queue entry holds a keypair and a peer reference. Transmit entries
+ * are lists of packets, receive entries single packets.
+ */
+static void peer_purge_queue(struct wg_peer *peer, struct prev_queue *queue,
+			     bool lists)
+{
+	struct sk_buff *first;
+
+	while ((first = wg_prev_queue_peek(queue)) != NULL) {
+		wg_prev_queue_drop_peeked(queue);
+		wg_noise_keypair_put(PACKET_CB(first)->keypair, false);
+		wg_peer_put(peer);
+		if (lists)
+			kfree_skb_list(first);
+		else
+			dev_kfree_skb(first);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -122,6 +141,11 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI being disabled completes after at most one more poll, which
+	 * may leave packets on rx_queue that still hold references.
+	 */
+	peer_purge_queue(peer, &peer->rx_queue, false);
+	peer_purge_queue(peer, &peer->tx_queue, true);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.

base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
-- 
2.43.0

