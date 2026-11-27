Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811574;
	b=jlaL3ejSrNDBm9ssirrCFAVBgGZ1RyhoUzR0Hn2gkm85AGvW2lQQZ5zrkF9QUXGoeRfO
	 mpS4/u4ELxRD9N89g/+kRnRyb/Irl++6cuY7rZXQqpNYSAf8DGqwgI5W3GtOxusGl7ZpN
	 b8Yh1yASv1T1Ae/kVh5B2YILOgJtVHuVS9Dg2AIhExQtqjPYZqPWB7PCQQ79+ewj2peWA
	 Xq0ubU5hKIAy69qAc1Twm1i3Am/K7K6hvMCXf4o+rq/qr4Yt+mlWXA2To0D+HdFM96dNu
	 BibXxym5dntxT+QdyCjxgGg+0bnaLWK60dkjKvn46kz024W4nvtm0atLkUD97KxJlHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811574;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b+pBW0ie5SZOAG6e1XFDlOMSG8pEGv1BxNGq7GcpCjM=;
	b=tw5m70ixrCUVjvYLMVRPM1uwktPp4A4lTJe6YuToseBuVQXuft23kN98+TVOYEFZWoVS
	 0xRxGjTHITPhoFBxq6gY+6K/QXvFNe9XiAJF7S1nrxNhISQlxM3gieIv2Wa+nrTUpS4rn
	 793yQvWupi16GqVKepqCOjcZ2zCz5h1IM3OlI4WVZefSK9G7T1F5gkUzq8kNWs2ModQPd
	 B/BYURm8vmaR4NMtHmQE9bROesP1OP47KDiIxeNZCeCWsKTV/ckyVrK1FFJgkM/ATEpFt
	 JrkWHQYI3U7BY0xS/ZIh0kz3wxqJmC9cFmqQJNmPA7TixFG11etwVHIv5Ub9NfPk2uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOUijG1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D50606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOUijG1b
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811574;
	b=rR9nkDMEpJocBvRkp/1IFp1RxUHgGatkQQmJlB4dR1H3igXfWviAJ0ZaWJE/B5mdZB9a
	 gk/qmB5BcecpmswuapPzwxmk4vHQWCQVoMAJOpZRo/RRPevs0a8J7RuVY6M9FzxkNld9a
	 nwZLvyp4ZYPKs8kexPukQjzq1/HCWFrX3a9kQkvQP4YX6d9J4BDu2/abHHtgH/IMbshO/
	 LqEy12S2hhPb4itBnRebgJICt5FV28IX2sbbgiday6O1j4UAXiEAdANzWbEmKJ2QIOlE5
	 XmRQiigfjU3O96NKP02oDV6rN7O23CwgQBGRnlkfS8fL+8Ix0DfjehawAOkicPJlFyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811574;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b+pBW0ie5SZOAG6e1XFDlOMSG8pEGv1BxNGq7GcpCjM=;
	b=wPFQpVvfQ50RbfvgeFyfj/lcdKFgdDgETawDXcwtHr6/XZUCZRhljaDBPQ9jKytBDBIO
	 ITSngJERPm4InNWmj1mYBuysLvwYD814Jx0We+rPbiV1gsJLzvOhriiMfAYIPkwvR3wOM
	 z/ZbUDR36oGPM3dC8s4T2lkcS4fqaeCu75mio+suSo1GZlVswCm9afycg35u2s/esDHwK
	 DUbSwNi3MuUiYMtEpVTu7eQEQHDZTf961JXlH53DMutCh7+ST3GUm2pNf0Vbmgq37oHYl
	 Y9Gu3u5lUuCm/gR5x1tGgQUqCFUTOEhISbNfX8Y5iYdkOov7MfVcMq23Fu6YG3shaPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F24561F000C1;
	Fri, 27 Nov 2026 20:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811574;
	bh=b+pBW0ie5SZOAG6e1XFDlOMSG8pEGv1BxNGq7GcpCjM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MOUijG1bweFp1wW7O2p+uEHtoXBzwhdUzYRb3NTwOWSTfW5CPNyD34uRGgO1/3KYa
	 ptJzT87wtqueqRvFqd8pY7Yi4gNR2I0LCO5G31XRmUTfHtOIvMJ47J7/rzZy97pX9A
	 dY9x6hmILQnCjuFqcYshqiMr1H5HKLq4SUqhh9DR/mMvHVEEiKCz8cv6W0nQHnkgxb
	 KbobZpdXf86PBxXN7xg4hzMgvMNVFil/R95B+ya+BIiPuTTI/Ne+PIZb6HPTQVtV5J
	 +Qo4K9rLnlVN6BJkrozAiMjGj3Zd64JZQZLBq87V5wofgR3BLNxYf6uq3mbpwqnZkW
	 qzqWjn14o0EKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 832E94DD8F;
	Fri, 27 Nov 2026 20:32:53 +0000 (UTC)
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
Message-Id: <20261127-unix-atmark2-v1-1-d164028cdae7@certik.com>
X-B4-Tracking: v=1; b=H4sIACToCWsC/yWMSw7CMAwFr1J5jaUmoiC4CmLhJC41nwTFKapU9
 e4ksJzRe7OCchZWOHcrZP6ISooVzK4DP1G8MUqoDLa3B2PsEecoC1J5UX5YtMEMPPT70dIJ6uW
 deZTll7tA5ALXv9TZ3dmXFmozR8roMkU/NaUcQ0npic3Dtn0BLmo985UAAAA=
X-Change-ID: 20261127-unix-atmark2-2d15e504f2a9
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 16:04:41 +0000
Subject: [PATCH net] af_unix: return 0 for SIOCATMARK on listeners
To: netdev@vger.kernel.org
Cc: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811364; l=2688;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=6FClBD8KxA1vZvrrT75+LOHaN5SjejVjVPoreOXqzTo=;
 b=XULMB6I44C976PZ/a15uKmebkiYhMf3vqE/y3H1mNhgz94oVsQLGr4AcromAFKhmPLQl5pCzo
 xHSoob5ok9cC9t/TC4gMx3KzkrL6FfCryIDMz7eu9YFi9D6ryxmuB+1
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Transfer-Encoding: 7bit

From: Dickson Wu <dickson.wu@certik.com>

AF_UNIX listeners cannot receive out-of-band data, but SIOCATMARK
currently peeks at sk_receive_queue.  That queue contains connection
requests, and unix_accept() can dequeue and free its head under
sk_receive_queue.lock without taking u->iolock.  As a result, SIOCATMARK
can read the freed skb.

Take u->iolock and the state lock in stream receive order.  Return 0
for TCP_LISTEN, and keep both locks over the receive-queue inspection.
This prevents a concurrent listen() transition between the state check
and the queue access.

Fixes: e400cfa38bb0 ("af_unix: Fix wrong ioctl(SIOCATMARK) when consumed OOB skb is at the head.")
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
This is the listener case left after d119775f2bad ("af_unix: Reject
SIOCATMARK on non-stream sockets"). The earlier queue-lock proposal
for the same lifetime problem was redirected toward rejecting
unsupported sockets:
https://lore.kernel.org/netdev/f6cbbc8da90e95584847b5ceb60aae830d1631c2.1775731983.git.wangjiexun2025@gmail.com/

net-next 387f48167305 ("af_unix: Remove MSG_OOB.") removes SIOCATMARK
along with AF_UNIX OOB, so this is only for net and stable.

Tested under UML with KASAN as uid 65534 with no capabilities: one
thread loops SIOCATMARK on a listener while others connect and accept.
Stock 7.3.6 and a mainline snapshot hit a slab-use-after-free in
unix_ioctl() (freed by unix_accept()) within 30-45 s, as does the patch
reverted. With the patch, 300 s runs (about 24M ioctls and 36k accepts
on 7.3.6) were clean. A second test races listen() against SIOCATMARK
on the same socket: 20/20 clean. tools/testing/selftests/net/af_unix
msg_oob passed 60/60. A reproducer is available if it helps.

This was found and the fix prepared with AI coding tools (OpenAI Codex
agents, with review by Claude). I went over the analysis and the patch
before signing off.

 net/unix/af_unix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 91c1d6cad497..1ba12617d55a 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -3344,6 +3344,10 @@ static int unix_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 				return -EOPNOTSUPP;
 
 			mutex_lock(&u->iolock);
+			unix_state_lock(sk);
+
+			if (sk->sk_state == TCP_LISTEN)
+				goto out_unlock;
 
 			skb = skb_peek(&sk->sk_receive_queue);
 			if (skb) {
@@ -3358,6 +3362,8 @@ static int unix_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 					answ = 1;
 			}
 
+out_unlock:
+			unix_state_unlock(sk);
 			mutex_unlock(&u->iolock);
 
 			err = put_user(answ, (int __user *)arg);
-- 
2.43.0


