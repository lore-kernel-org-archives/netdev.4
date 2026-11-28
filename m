Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855318;
	b=USbL7/CW21aDOgNPMaKfoUI2mIXfF9UasbMv0pSmwDmbO6RwS9pqSP935tdY1MTOFdFs
	 BASRLROqyNBi+lVFM3s8q2nRy7z4W9LLlhSXzGIepqFljHkLw06YyODth4TaCyOtdFuSV
	 dITMUP9vckEs4BPBlg7DN6JWM4yiwd0/XY9njXwAfGVwq/gg068hdfX0GYn9vQ+7QQhAQ
	 DltRnBpJVrEnT/VyYMoqpdv7uq86iFAnw5E3jAoqFW19CJ3dVIfbf8jW6y3CHys5+bg6o
	 hE0rthZHYe4wJskHXN+cuZy0G59eMiwOEE765lBS8wprhnDAbpiKFOsFIj8sMoi1iHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZmP0Ygpa3Av7s2IY+n4jCeLQuINoH1fyD4XJvm1wVM0=;
	b=Jq9sjpM4RUky69mX2ruHzS2qr6B9wIG9Kd7eQu1z58F6u5d8P/QnROEmy2V/vTw7vW79
	 Y/7LWsz8MENXmh+0lBv8vGXMeN+B4KyWnrrx0HeOSdb0mWOiaUUNjHeX/m+CMp0ML0KfL
	 WEZHJOC5AsREl2SUT5fSTbYt4GCG1LsAj+ISWkrzBr+MEKpHOnLvZGQc6MNUVgLJ2iy3a
	 dO6stwP5e/ut9RlUG52VU5wmjvvUKC5/2xtUYphdafv4sjVKHpWHT5sY/lggbJHWKYDcE
	 O3wr22fberwCtDOLHaT+D/1aYzfX/of9ghI5h+iuIQm+iSMS9xXlB8CnqfrlNzpoP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5mWn75w;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C2606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5mWn75w
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386bd881d39so10767193eec.1
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855317; x=1796460117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmP0Ygpa3Av7s2IY+n4jCeLQuINoH1fyD4XJvm1wVM0=;
        b=d5mWn75wKe6BpFR8EHN0zFuR3SLVKv1PLmw/MC9sOkjn+d/vaaSOW14JvBwFFwViR7
         R2u1B9WGck8bnobh8YiZYZQXbx7JAAh9eq9qSDVma8q8b18lgjWsQbZajZIl2Aka3k4n
         kr+H3W3J/O/4g7tlD1aRnC8NGaOTQJNaN8NHZ+C40FkUef2E/L5w/0O1k1DJYjN7dbX2
         EST+Cl2RPBdRj/R2sHjpu1irH+zNzh01cx/emXGAvYKsFzYyDN/bd2XlkclqRfnti6yo
         InJAUP9GoB+VwY4al7i2EwITe7tp4YDlZvX2xglbB+l149G/ybqzcK4NWNdZlnOpRFl4
         t0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855317; x=1796460117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmP0Ygpa3Av7s2IY+n4jCeLQuINoH1fyD4XJvm1wVM0=;
        b=fjZ1ZS5DUH3BBM+dwyxJbGt5zh/cAcFUMpr/14I3xCLEZl/fYExoL/67DkKhkuQloN
         F1kJq118+UCicP3jPEa3Xi0+qRlMew4esD4JFWr77ilPkVshb5cTlam27CMDdgmdkyoP
         U/fG637QlfMpbrDuvsn/k0p2Nq8pK2SNOhqQJO7hEBjsNrF4J0j1O4nAaPq+R0PIIb65
         9NtM+wMjj/MVlozNXVgjS6N1dcwzMvbPpfkyYOboErlGoPf3CMAGJe+MVkEL7+yP/q0T
         4Pvx6cv2FXd4hp/jQMnuqviRRfTf3Z0pr+1M6VClz3GF8M2bCi6p0Tkp+46Vsbaw2hTo
         xOoA==
X-Gm-Message-State: APuU4Z9eIMmLBn8gmUZl9kpfVApOE8554Z/vJ9dQJwgVWxd0dIJLhkFK
	RLegYrO6ql14HlVgBmrCvJV1XMawtxwNdREypaEZnZKBcO14NJ56UZa+DryaCA10VptLjNyB
X-Gm-Gg: AZFdTZc2rr0PGJY0JXG+d4Bke2s/NxFOCb2EqrCpw++Xmvo/kHsjpXAMmYVtJ2Z3rxP
	SlwXJXzim2x0cxjJOiSCI3L3rl4v+POIzjzagztzsZMcDxNjsMP3MxcOJ0f6+AtdvrndCatoD0F
	JYJ/yC7Ls802PYU/vNfGEi6qfxZDfrTOWDSMpvZPPXPfWSRj/sZ2359Zsl2RgVIE1f3yFVeq+X3
	5Dnl6HJDhxGM6vQZy737gbaHemSVVGsN70KaWlvrTssa0OAypXATDD+5fvouAeDm1UpPIJE7SyF
	rnSZu5sxJqc/gpdFSTV+2kmrnRj9k7fJubuF5cvn2Rq632Cs3w0/nGCdPcMFvUpfD2Xj0h5RX4V
	zjp/IYyoLllNy2bWKy8g+IomYwELoXC2tV7Fkz4zqckSVM4axRaEmzgX0OU/hMVypAwpEVfIV+G
	aCLGK+aO4UIUeSuFbECHWxnw9P+ydhOECMG+RujDeJxrZpvwJSMzN9d+NHSEWd7hCejRdvmMAhn
	Bs5+DZdaHFGtvGBsyZGJLCn4SJBc7c/L/tirGYYwwxNESST25sR/DjK7p9JW7ZwR6FiXhLQrTdP
	KQDs8VUfWG/j6YXx6PKZ6665+htaUVb9M9DZAEWY4FIFxggRdk5pgolX7qaPqSjz9QFSbzcEroQ
	1T5CVi+NBZAT74Y28le+B+/ms8hrGMBOFozRuknJQBq5hFyA+K4aEd4rjm/CIJ2NSYtFE6w==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr23833640eec.7.1795855317213;
        Sat, 28 Nov 2026 00:41:57 -0800 (PST)
Received: from knomputer.. ([2401:4900:8f55:f867:c07b:846:4da2:5ea0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm75698554eec.16.2026.11.28.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:41:56 -0800 (PST)
From: Anant Garg <anantxgarg@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Anant Garg <anantxgarg@gmail.com>
Subject: [PATCH net] net/tls: publish offload state inside device_offload_lock
Date: Sat, 28 Nov 2026 14:11:37 +0530
Message-ID: <20261128084137.94590-1-anantxgarg@gmail.com>
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

tls_set_device_offload() and tls_set_device_offload_rx() drop
device_offload_lock before do_tls_setsockopt_conf() sets ctx->tx_conf or
ctx->rx_conf to TLS_HW, and tls_set_device_offload() also installs
sk->sk_validate_xmit_skb after up_read(&device_offload_lock).

Because do_tls_setsockopt_conf() holds lock_sock(sk) without rtnl_lock()
and tls_device_down() holds rtnl_lock() without lock_sock(sk), a
concurrent NETDEV_DOWN can acquire down_write(&device_offload_lock) right
after up_read(&device_offload_lock) and before TLS_HW is recorded:

1. tls_device_down() sees ctx->tx_conf != TLS_HW and/or
   ctx->rx_conf != TLS_HW, skips netdev->tlsdev_ops->tls_dev_del(), and
   clears ctx->netdev = NULL. Subsequent socket teardown also skips
   tls_dev_del() once ctx->netdev is NULL, leaking driver offload state
   and leaving driver async work/completions (e.g. mlx5 RX resync/rule
   workers) holding dangling sock/context pointers (use-after-free).
2. For TX, tls_device_down() switches sk->sk_validate_xmit_skb to
   tls_validate_xmit_skb_sw, which tls_set_device_offload() can then
   overwrite back to tls_validate_xmit_skb.

Additionally, tls_device_down() unconditionally writes
tls_validate_xmit_skb_sw to ctx->sk->sk_validate_xmit_skb even when only
RX is offloaded (tx_conf != TLS_HW), causing subsequent outbound packets
to enter tls_sw_fallback() with priv_ctx_tx being NULL or
tls_sw_context_tx.

Set ctx->tx_conf / ctx->rx_conf to TLS_HW before tls_device_attach(),
install sk->sk_validate_xmit_skb before up_read(&device_offload_lock),
only assign TLS_SW in do_tls_setsockopt_conf() on software fallback, and
gate the sk_validate_xmit_skb_sw switch in tls_device_down() on
ctx->tx_conf == TLS_HW.

Compile-tested net/tls/ with W=1, CONFIG_KASAN=y, and
CONFIG_PROVE_LOCKING=y for both CONFIG_TLS_DEVICE=y and
CONFIG_TLS_DEVICE=n, and ran tools/testing/selftests/net/tls (965/965
passed under QEMU/KVM); hardware tlsdev_ops + NETDEV_DOWN race not
runtime-tested due to lack of physical NIC hardware.

Fixes: 4799ac81e52a ("tls: Add rx inline crypto offload")
Fixes: 3544c98acd09 ("net/tls: narrow down the critical area of device_offload_lock")
Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: stable@vger.kernel.org
Signed-off-by: Anant Garg <anantxgarg@gmail.com>
---
 net/tls/tls_device.c | 10 +++++++---
 net/tls/tls_main.c   | 11 ++---------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index fa7170cd4fd..fa59a3ad3da 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1194,14 +1194,15 @@ int tls_set_device_offload(struct sock *sk)
 	if (rc)
 		goto release_lock;
 
+	ctx->tx_conf = TLS_HW;
 	tls_device_attach(ctx, sk, netdev);
-	up_read(&device_offload_lock);
-
 	/* following this assignment tls_is_skb_tx_device_offloaded
 	 * will return true and the context might be accessed
 	 * by the netdev's xmit function.
 	 */
 	smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_skb);
+	up_read(&device_offload_lock);
+
 	dev_put(netdev);
 
 	return 0;
@@ -1281,6 +1282,7 @@ int tls_set_device_offload_rx(struct sock *sk, struct tls_context *ctx)
 	if (rc)
 		goto free_sw_resources;
 
+	ctx->rx_conf = TLS_HW;
 	tls_device_attach(ctx, sk, netdev);
 	up_read(&device_offload_lock);
 
@@ -1355,7 +1357,9 @@ static int tls_device_down(struct net_device *netdev)
 		/* Stop offloaded TX and switch to the fallback.
 		 * tls_is_skb_tx_device_offloaded will return false.
 		 */
-		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
+		if (ctx->tx_conf == TLS_HW)
+			WRITE_ONCE(ctx->sk->sk_validate_xmit_skb,
+				   tls_validate_xmit_skb_sw);
 
 		/* Stop the RX and TX resync.
 		 * tls_dev_resync must not be called after tls_dev_del.
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index d24e86e7f42..f0ee17acf62 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -629,7 +629,6 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 	union tls_crypto_context tmp = {};
 	bool update = false;
 	int rc = 0;
-	int conf;
 
 	/* TLS and sockmap are mutually exclusive. A socket already in a
 	 * sockmap (i.e. with a psock attached) cannot be upgraded to TLS.
@@ -709,7 +708,6 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 
 	if (tx) {
 		rc = tls_set_device_offload(sk);
-		conf = TLS_HW;
 		if (!rc) {
 			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSTXDEVICE);
 			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSCURRTXDEVICE);
@@ -725,11 +723,10 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 				TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSTXSW);
 				TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSCURRTXSW);
 			}
-			conf = TLS_SW;
+			ctx->tx_conf = TLS_SW;
 		}
 	} else {
 		rc = tls_set_device_offload_rx(sk, ctx);
-		conf = TLS_HW;
 		if (!rc) {
 			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXDEVICE);
 			TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSCURRRXDEVICE);
@@ -745,16 +742,12 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 				TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXSW);
 				TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSCURRRXSW);
 			}
-			conf = TLS_SW;
+			ctx->rx_conf = TLS_SW;
 		}
 		if (!update)
 			tls_sw_strparser_arm(sk, ctx);
 	}
 
-	if (tx)
-		ctx->tx_conf = conf;
-	else
-		ctx->rx_conf = conf;
 	update_sk_prot(sk, ctx);
 
 	if (update)
-- 
2.43.0

