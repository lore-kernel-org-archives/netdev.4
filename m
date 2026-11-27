Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795799141;
	b=SZ0zd7nocay9ENbRdQiUyPtelwj37mZ5Ecpl8e5WNmOYH5OS1hGmO1syK9AKrp0qSIgP
	 MK73eQhCQCvIbLiT34wLil5Waa5ThQrb3w5rhI2XiJlT1pyH19N63eVw9MPm70AZpnI+1
	 a45YhPf4a5tZd3TTm5+PkH9kFbjBmYI1qsMgnGmqaIMppgzbOHKlZfc/RbgtIDYMh/E0F
	 edEFfWaxlVO//Uq3tsGpbp8KCf+vkA9zBkr0HtbYJBbOSf4AvdAlvocJ50sAqr1RhHLs8
	 HEpqjj0FsOvZ3lMYYbUuv5yyNJ62FejZj3mNLvCvLYI5EE4haOrLVWmAH6haDRBB8/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799141;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DNf4tvvxpD/YN1brTfQ0yFEOrzkT4bIAGOPy1L8ixds=;
	b=4cQXIaI3WkMnwUu6CCMuOJSOBIQpK7opk48kx+SgYFH5QPgIg+a+YZFZBQFB4OkrPTDg
	 wGd0fhLMNxXH2AG1AKOtgNMkP919PQPpe+wxepuHN8CoTu4reVTQovCSJhlAC1H+jr7fx
	 qLSj/0X/3qNq0Vhe//NfX1HpSeTF05fJRZuW/M30UD4u2Z5uJidJ36Cg8dOUK5n/fN8HL
	 IPu7oave53hAHgj8fwR6Gh2YEuZGEM5KxYzxhiy8OeEluP5DmDTaGIe8TBmyYVhcCZ/WK
	 3KyKK67zASJudxUahbvIXHWSDdXgKwn2EWHN1BEnhbhFqCPXayi0LY1bhWKdW3gJyQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cDpC/M+M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42031606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDpC/M+M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795799140;
	b=GuL6MDE7gK9Iw3Q5TMBB+cQplEHCJMJ+gGjnOwz1AUiyk61vZjH0bn4CcHZAYklkr7Td
	 xFiHcnd+O2C9qZ6T0QSUEl+xhPvvE0sYfBzjmCLb6FwZL3s3RnEiKJKN/0MJEUEdLUVK7
	 j+dBVpW4RqQA8+iFKs9B3GjWloopCUUwLha7Jw2zupI7LbYe8QylIYpqYi25eHcouhcCl
	 JNMJrU1TYVTWuUH6RhD1rko3wDl//YdQ+Sl2f/IZ0NcAFIyXCQscs7VS5ZggguisQv86i
	 L6bNb7TWq3aHAxWCYahx4z8eYlZyeO2MT/1rubOBIGPN4BTSGIVjyJWy3kU7XBOKcLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795799140;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DNf4tvvxpD/YN1brTfQ0yFEOrzkT4bIAGOPy1L8ixds=;
	b=JW0QlHqA21ww5Ou+e6vIeA4gZi+s6oeBIsfFt0k0/3t4xwyxh0rir1T0ehYVWT/HedLl
	 JHYMkDUUa+CB23Z+LP/Uxmxw4of2qd5SbtieVXmUQmQOQWaYrX5euf8ylv0JYpk23rvet
	 9jTwGFh2kScxw6AgjrG+Kpx7BQVGP3acK5vlpSt6dBa3ezOP6PsOCO0IRHT23R9pL74H2
	 JfZJHwLg4lgEwgAaQ3yVbkmwXNJBhHgiB43gZG9NWNx+SVhozhp3xBB0OC9uJU/yrVsgp
	 0eGnff2ugHbiBCr1OFiM9zdbPiJxUZ6WWDVNNGyNwGrt/Vd22Fi0ZYARfdZLZUUKWuw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 690791F00899;
	Fri, 27 Nov 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795799140;
	bh=DNf4tvvxpD/YN1brTfQ0yFEOrzkT4bIAGOPy1L8ixds=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=cDpC/M+MCmKUnNAsjtxF3tgVniV3JbP2JSdN6QGHATv16Fb63K8125/4b0YveGs2B
	 zYVj4JDBLUmsCXG4YGVbSUOERLRjcnLkAhwKr4R3zB8pbqCnXOXqD5+c7nUR8Pi3+P
	 wxr/v5i+0TIGGJ22i49pe216HjgdMRrc5UWuw3ukkc3q5K5djrpoTnFLKE5BTFVuQs
	 0ikdN+ELWM3DIU4y9XzbUvK3PQC9Xs5OYf7Arvha8OulXNLCTUycKubp8vZF3rEysZ
	 6MqTVTOozbxYpvDGfvfUlvjAr53/dXFQnEvi6PCb51j05OdmnJ/0ZPGyvF6nYFLvCJ
	 CEh/lss8+g0Jw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1DB04DCD7;
	Fri, 27 Nov 2026 17:05:36 +0000 (UTC)
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
Message-Id: <20261127-ktls-recwait-v1-1-81155599e61e@certik.com>
X-B4-Tracking: v=1; b=H4sIAIS3CWsC/yWMSw7CMAwFr1J5jSUSBFG5CmLhJIYaqgTF4SNVv
 TsJLGf03iygXIQVjsMChV+iklMDsxkgTJSujBIbg93agzHW4b3OioXDm6QiOed24z6YSCO0y6P
 wRT6/3AkSVzj/pT79jUPtoT7zpIy+UApTV8op1pxn7B7W9QtzdyRplQAAAA==
X-Change-ID: 20261127-ktls-recwait-a777395c1da9
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 14:01:16 +0000
Subject: [PATCH net] tls: avoid recursion in tls_rx_rec_wait()
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, security@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795798916; l=3158;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=rZeJn4EPp2cBQrhNXU2Mo53D8TwNxpANd8sKyNzy5mg=;
 b=iJwGOSvpnsl63KLZjPggQM5WQoytsb/8muG0PrCwGhIo2o3ucGkTRk1+eiQEomg/LzkrmD5Jf
 lqAxYgl2dJmBUPR6qOoDLjUNBGrWxmTTqE4l+HgnwmkyBHIly9WK3MK
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Transfer-Encoding: 7bit

From: Dickson Wu <dickson.wu@certik.com>

When a ready record disappears from the TCP receive queue while the
socket lock is released, tls_strp_msg_load() returns false and
tls_rx_rec_wait() retries by calling itself.

The self-call was expected to become a loop, but the wait entry is
address-taken and live across the call, so the compiler keeps a real
call. GCC 13.3 and Clang 18.1 both do this on x86_64 defconfig and on a
distro config, with and without KASAN, costing 128 to 288 bytes of
stack per retry. A local user can keep draining the queue with
TCP_ZEROCOPY_RECEIVE while a reader waits and overflow the kernel
stack. With CONFIG_VMAP_STACK that hits the guard page and panics.

Go back to the top of the function instead, as suggested when the
retry was added, resetting released and ret to what the recursive call
used.

Suggested-by: Paolo Abeni <pabeni@redhat.com>
Link: https://lore.kernel.org/netdev/b3a83032-8ed4-4d5d-9df9-6dbd02acac1c@redhat.com/
Fixes: 6db015fc4b5d ("tls: handle data disappearing from under the TLS ULP")
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
Tested under x86_64 UML (VMAP_STACK, 16 KiB stack, PANIC_ON_OOPS) with a
small UML-only change so the guard page hit gets reported, networking
code otherwise stock:

- Stock and with the patch reverted: an unprivileged process (uid
  1000, also tried as uid 65534 in its own user and net namespace)
  draining a waiting kTLS reader with TCP_ZEROCOPY_RECEIVE hit the
  stack guard page within 50 retry cycles under KASAN, and within 100
  cycles on a non-KASAN GCC build.
- Patched: the same driver completed 5000 drains, up to 743 in a row
  inside a single recvmsg() call, with no panic.
- Blocking, non-blocking, MSG_WAITALL, MSG_PEEK, a 4 MiB transfer and
  EOF on close behave the same on stock and patched.
- W=1 build of net/tls/ is clean.

The tls module has to be built in or already loaded, since an
unprivileged TCP_ULP setsockopt won't autoload it. A reproducer is
available if it helps.

This was found and the fix prepared with AI coding tools (OpenAI Codex
agents, with review by Claude). I went over the analysis and the patch
before signing off.

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..363aae36ac69 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1104,9 +1104,11 @@ tls_rx_rec_wait(struct sock *sk, bool nonblock, bool released, bool has_copied)
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
-	int ret = 0;
+	int ret;
 	long timeo;
 
+retry:
+	ret = 0;
 	/* a rekey is pending, let userspace deal with it */
 	if (unlikely(ctx->key_update_pending))
 		return -EKEYEXPIRED;
@@ -1167,8 +1169,10 @@ tls_rx_rec_wait(struct sock *sk, bool nonblock, bool released, bool has_copied)
 			return sock_intr_errno(timeo);
 	}
 
-	if (unlikely(!tls_strp_msg_load(&ctx->strp, released)))
-		return tls_rx_rec_wait(sk, nonblock, false, has_copied);
+	if (unlikely(!tls_strp_msg_load(&ctx->strp, released))) {
+		released = false;
+		goto retry;
+	}
 
 	return 1;
 }
-- 
2.43.0


