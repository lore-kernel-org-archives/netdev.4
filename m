Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594037;
	b=jOH9sZ2Ta6Vv2CUm6hHZS3wjfJ36e2C/wz+2wc7ek0i6mZl4IQjEu1FfEswaa3FMaERd
	 XH2jo453nczcmJzcP0qPF2J8v/FiVfPRHffvamG0JZPQJCcswcgHZXsj+/4RlFrBDZPvS
	 fCMvCbHM6Ia2tQ7B4+FPGCED2dUXQwt0CBE1xKnt1yLioXaQMG6wkGT5TPBMRe5rtfZeI
	 90kgkvuS83tBJGAuYiSgLflezeK86gD3vhZKPKJAhDvUpsbiVStTAJqQdmkZ8KnTVwoW/
	 VMyUnnj+w0HhXF3Q2b6UVmZm9qzuTzhnCPC9c9x3HUScwQvpPwxmfUoQ0EJrHwe+1HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
	b=CpmqsO2fQbIHbNTvglkBWHLA3iQmEO+gsKGaZfDov+G7VCFeSH5TAO3WsEHGsRA2q6Jn
	 niWNpDwlblFMX/d7S/OV1yOn3Eao2mTCQjyjpayz3EQhD3g8LQAJ0TPyj6vociE3zdn/B
	 a+ORyxylHXhQZmy/qsjzBk1LkHlNTcnwT9W7Dx16vWYaRKFPPdJvve3Ho56qpn4ZD8R+5
	 C58N24O+zMjVVJosrUi1x6irpZKWtIH54sc7vwIyEhhh+R7DJoYEKKudbmdamHjEfukzW
	 KS+4ix2O8nEzYYiWQCFEePWYWuWLgVQ3J2jtRf2rhobqMqtB0ebQWqmedb0NE8pzhxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfdUzDSH;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94312606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94312606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfdUzDSH
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2efd15c7545so19320005ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594036; x=1796198836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
        b=FfdUzDSHVVNa3C4b4EHLfZ920Wdj/MKuK7+8i8ZOKGQlQ+PLHUPlc94TM/n6vdtdy2
         nehzlNTFChs+knZU9/X6OCbJWgHK0brI5NDm+eY3eaadXqtO7b/HJl01Bz0fQhRBx02a
         JSNaBRhZnVQMDAE1t0drp7iZRV+F0u1WCgjA1O6i9Uw3WSdFToaxcyOHSfuwRBhAetdy
         cBfGisA39axL6zOiQtbnlMex0az8cn8dwR6+ukk3o8mvEjvoEv5BJQ8A+PvHa2Goubmw
         JubVVt6HGtIlPopWs1sj2QW8GVA24x+1uQTscTolF9R+4JyasfOvr0Xh0CO3DF6+xAid
         KcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594036; x=1796198836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGgY/g42kXiEi9hKkVOcPMTngxVYNDDV66irTK01U44=;
        b=GCuJsTFRkar1ulbpPru6+MskBGFntda8xr0JdaEC11/UCzM5SCYwg123i034tsW1Q7
         nwiZl3dzOApB2Q18zgeYYG8OtX4HolmacM3pVWE17P01R03XYM2zPFai2VX6VwtbJi96
         5HQXCGQT/fEHHnajlFATPpF4VbJUTO2Tbt+rnRKxN/5+nDprVMR0YyEfngKo1FnDGXX6
         NE2CDwQms6VH9Msh5Bryt78i39ff2av/badJyMfJPGv2tUegGMau2opiC9I/Iogudl7S
         CJkn0JZiv9n+g7crg+ftltLQWnyR/9beIKatX9S8Sb+N5HgFK6CMZNgjKXZyb6r9UAyL
         RYSQ==
X-Forwarded-Encrypted: i=1; AL+hErGHxYCJZr/LymnEM6YrYMQ9eKV+aDc4tZO3ZyhwyZ3WYsfepD8lb8WTQdQ3Y4XNefm2V3RxSQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z++XyNwsYpfxi9u2Fkw2QChzv2YMM3BMr8U0dZdJqDaAyrcjrTX
	t3K6S6fA8s3K2o/8wrYUDVbwP7OoINtrZWXjrzdylCN8L+HagJfJZevE
X-Gm-Gg: AZFdTZfP2m1BGKhmriMNdn0MFLpJguuzegZtOz+bmGK2ro6OMlPoLk6jkytojlscX/P
	zsr9gP0ZfJqNYIAihGsxVd57zbz565V0PN0pWZxIlW2FAxsHe3XFZx7v9BS57uDZoG0CwYv1BJc
	oHozziNa8H+RLdXkLKayX8c3hWe4EVvHABArfwTwJtMOyey+NEJ5zdPDGLgI8XicBXAsf7KcuEP
	QTHk97bt//jHYgmU6IiK/ZsE3Bpsv3hWGGC/RMTm3jOONO+O844VHMAs3WhuFfOqfSOzkQKYcEF
	5PwS2mWOuprlsJxhyPBGRGZJjLHJqvDC29GO5ayZDxKhRTos9jqUkO7tUjI1ScHjctxbXBaBqsr
	D3ZDrHND2M8belTAf4nyhsYoLYvs31dAO9+HnGSytMRCvFpZf7CD0Nm0DhnSlptCD+hMPmKz9US
	WqavSH2/8OoKJaQIlKuMAZMlca25SJpnTold3eFscngO9wwcs811E0Jqko20eslY8xDpSnXo8nc
	1l3qoEwKuEbErzTB7P4H7ULSNg8dByNRfn8Iq314tkIlPr2QeMbQ3IPiPyiT9hTJwgG+9SLTgOV
	CQBme2IYA1ZCEiqNbLPxILZE3jnNnjDH7UGk09+h4aMeE5RELckiB6E6/mo9xAbFEl0VZu7iC5S
	n
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr162770625ad.45.1795594035760;
        Wed, 25 Nov 2026 00:07:15 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm83444005ad.12.2026.11.25.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:14 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nfc v3] nfc: llcp: reject bind and connect while the socket is still linked
Date: Wed, 25 Nov 2026 16:07:06 +0800
Message-ID: <20261125080706.648722-1-bsdhenrymartin@gmail.com>
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

llcp_sock_connect() only rejects LLCP_CONNECTED and LLCP_CONNECTING, so a
socket that is still linked in local->sockets can be linked a second time
into local->connecting_sockets.  That covers bound and listening sockets,
and sockets that a peer moved to LLCP_CLOSED with DISC or DM.

Both lists use sk->sk_node.  When the peer answers with CC,
nfc_llcp_recv_cc() removes the node from the connecting list and links it
back into local->sockets, where the stale bind-time entry makes the node
point to itself.  Every later sk_for_each() over local->sockets then spins
forever with the read lock held, which pins the CPU and stalls RCU, and
the socket is never freed.

The same stale-link case reaches llcp_sock_bind(): nfc_llcp_recv_disc()
and the non-connecting branch of nfc_llcp_recv_dm() move a socket to
LLCP_CLOSED without unlinking it, and bind() only checked sk_state, so
it would link sk_node into local->sockets a second time.

Reject connect() and bind() while sk_node is still linked.  A socket
has to be closed before it can be connected or bound again.

Reproduced on v7.4-rc3 as uid 1000: a soft lockup / RCU stall in
nfc_llcp_sock_from_sn() while walking local->sockets.

This issue was discovered by Tencent CodeBuddy Security.

Link: https://lore.kernel.org/all/20261009092338.3146149-1-bsdhenrymartin@gmail.com/
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v2 -> v3: apply the same sk_hashed() guard to llcp_sock_bind(): a socket
          that a peer moved to LLCP_CLOSED with DISC or DM stays linked
          in local->sockets, and bind() only checked sk_state, so it
          could link sk_node a second time (reported by sashiko's
          review of v2).
v1 -> v2: reject any socket that is still hashed (sk_hashed) instead of only
          LLCP_BOUND, covering bind()+listen()+connect() and sockets left
          linked after DISC/DM.
---
 net/nfc/llcp_sock.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde684..c12170dde8401 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -86,6 +86,15 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr_unsized *addr, in
 		goto error;
 	}
 
+	/* A peer can move a connected socket to LLCP_CLOSED with DISC or
+	 * DM while it stays linked in local->sockets.  Binding such a
+	 * socket would link sk_node a second time and corrupt the list.
+	 */
+	if (sk_hashed(sk)) {
+		ret = -EBADFD;
+		goto error;
+	}
+
 	dev = nfc_get_device(llcp_addr.dev_idx);
 	if (dev == NULL) {
 		ret = -ENODEV;
@@ -714,6 +723,15 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	/* A socket that is still linked in local->sockets must not be linked
+	 * into local->connecting_sockets as well: both lists use sk_node, and
+	 * the CC handler links the node back into local->sockets, which turns
+	 * the stale entry into a self-loop.
+	 */
+	if (sk_hashed(sk)) {
+		ret = -EISCONN;
+		goto error;
+	}
 
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
-- 
2.53.0

