Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795796423;
	b=NLsdwQkUmQ6FipCwT9ox/YheTu2CKpXI+OrWDQ7AIGrsSNY3hDG+FEltNlYYdmFmKfcJ
	 cixDAFhL2Fze8hX/8HaIP+++paWCchQSKxhUubdUd7zukkXv7yN6aZfjq//0ft+rDFgW5
	 B/q8TeRuR9UP3nw7dR8U/p7EUQ7UYptV0a2gc75ZEdrQsu/jYUGzpt3tJf0fHeadJ5hcR
	 348SHkbpaTF5jvuwrANjrAu33BvEBnizypHAm2xxQP53ZnGKXS5MI5xW79NgP7pa+X5sm
	 lWX5BEeVnkYIDJ7qE7pejfna0EkEVERIm/txBtyjBlQm6HrA1Dj5LQb0fsEMd7cOc/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796423;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vlV2NmQSTcQ/110OLf6uY6isn37bkjqJxsOBavg0uxk=;
	b=0JEWbOpw61BQEwuS6McZqmrS4X/uudKouLlyhCuDlRUz/mFW9wjmt/UDcrEiPVd9NquI
	 576U0AYfXBMEPK8WoHXfF/QsECw3gYNKFU2cL0zld4RX4Y88PuvDFJ2Ylb8RTTFu4MYhx
	 p24mqnCRHuRDTQdrwPyAQ55oqLB0svSkZfFPQ9wTGmVF5kDjkFYsZcEqpdPi/EH5OEToC
	 LsDRjDsYKQDV00WNDczqBSO+nLqVjYZF/hL9SZJiPE/erSVkAOSV9900woSJuip3enIjs
	 Qqrg081S1KKZ3PxukzxyOABDGDbqNTNXnbcn5iZ/cNreQYEjVau2yPPCYmqVGdBRw5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+lwguN7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55F606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+lwguN7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795796423;
	b=VfVvLd+wJTQCDGJN912AfP0nXCrbp6XMSPQWQ+W32Vid1nDNjQNWmQAGuWrE1rJxkkJO
	 vI70PofQOoZUEbkV+imXx/Rv0SNks7MsApmdMdSf5McKSnOike0IjyYdvJOxKglaAcD0M
	 zUjIku/OrxINXxc+wumiL2PF+urgMHa0uvnm/FDmK9pBKI56onfpLnNdqmtX3yjUpd5uu
	 SXb/Ff8lXthGh/AmyNuh+IZb6Np63ajkl4vG/M2RNHKKArLbX0ds1yC2ckePGhtgdasTP
	 9vjTUsMm9LucuSDWc+6vFtp/0dPRCyOdMdpMdIU25mcf9ybmefCV1/JF+q4wytXemug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795796423;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vlV2NmQSTcQ/110OLf6uY6isn37bkjqJxsOBavg0uxk=;
	b=DAjjFbTptcy/ppG0c9Sj/axHRlgjQwZ4ZtbV4hKVSxs7CZa/L6azk52RHvkFrA+j3A+7
	 gQchBDS0OUZNX1IKFQ2+ZR634mSVbMNq508HV/aNWDQINImLWE6XhjPXJCauCazYUqR+/
	 WH8sECxkfL5MJGhWcFWOgymVav/VQNQJZDyGDlworILkyNZVAnmsxkByz38n5HnkMKnyB
	 g4PQ94mPexwBfPZpGA2FUcqhcyHaTLMNR8JFe2+sFkywxgk10ZyEreQUX+53ilpYC6OD9
	 Z345IicmMIr3BavigQk1bmm6ZLZ3zMylwGIL6EhVOa4mvQhdpI/mLPVUia7pS1Mn1Yw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A1EE1F0089C;
	Fri, 27 Nov 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796423;
	bh=vlV2NmQSTcQ/110OLf6uY6isn37bkjqJxsOBavg0uxk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=i+lwguN7mZZZ8sNLT5X+9a+iWcQ5dhpymFNkovJ9WUwfEFmDIkhvtRWQSfYiiRp54
	 3f1VYiZHBsXO2soMSC2IdvTO4HSFTjOuNEZeBB3PqOhrqQvGCZfIoG63xbI3froymK
	 QtK/8XUgbrrNd/4J+Y3u9tXns0x/RJ4JFO4xAoDV98V72pVwKAO3xinnRx92rd7nru
	 Ed8aQjCWSsCPNBrDBuONO1lbC6Ih2f2iNHrlLfAUHI5yVcwsL0KDESEznL06MPXvcl
	 xmqLCPoc5AHE60h4ZtobOcuc2+cDtpwKmia+tyRAUUwud/uomCVXqDtds4MHjL/Dvx
	 6rE74vGGV3ysw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F7E64DCBB;
	Fri, 27 Nov 2026 16:20:17 +0000 (UTC)
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
Message-Id: <20261127-ktls-peek-v1-1-244836f9f89e@certik.com>
X-B4-Tracking: v=1; b=H4sIAP+rCWsC/yWMywrCMBAAf6Xs2QWTaqz+injIY7WxZVOyUYTSf
 zfR4wzDrCCUIwlcuhUyvaPExBXUrgM/Wn4QxlAZ9F4bpfQJpzILLkQTmiGcB2OP7tD3UPsl0z1
 +fq8rMBW4/aW83JN8aZeWOSuELlv2Y1NCHEpKMzYP2/YF7qmz4pIAAAA=
X-Change-ID: 20261127-ktls-peek-68d986a5b433
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 14:21:21 +0000
Subject: [PATCH net] tls: charge decrypted records held on rx_list to the
 socket
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Vakul Garg <vakul.garg@nxp.com>, 
 security@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795967; l=4130;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=9mzHNAa83ROpA6/PQtySArTP7Dy+hfWQN66fcPiG7ts=;
 b=TNnLZfzjoZaEF/iAyDVoEVAWWRmsMQb11bNrz1ns4EAno6TeL9qkBxGOJ4OeGZ0iH1mjBv1LP
 QYCULnOZnZNC/xVPPpyy9UOx/NIkMg3uWABUlMjcWyLf151bu0k8XTN
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Transfer-Encoding: 7bit

From: Dickson Wu <dickson.wu@certik.com>

MSG_PEEK can leave decrypted records on rx_list after TLS has consumed
their encrypted TCP skbs. The cleartext skbs have no socket owner, so
the memory they hold is not charged to the socket, the TCP memory
counters or the reader's memcg. A single peek with a large length keeps
decrypting and pinning records while TCP reopens the window for more,
which can drive a global OOM that kills processes in other cgroups.

Charge a newly decrypted skb to the socket when it is retained on
rx_list. If the normal receive reservation fails, force the reservation
for that record and stop decrypting more records in this call, so the
reader gets what was already decrypted rather than an error. Readers
that consume full records do not retain the cleartext skb and do not
take this path.

Export sk_forced_mem_schedule() so TLS built as a module can use it.

Fixes: 692d7b5d1f91 ("tls: Fix recvmsg() to be able to peek across multiple records")
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
Tested under UML with KASAN and cgroup v2 memcg, TLS 1.2 AES-GCM-128
over loopback. The reader was an unprivileged process (uid 1000) in a
cgroup with memory.max=16M and memory.swap.max=0:

- One 192 MiB MSG_PEEK read pinned about 257 MiB on stock (262748 KiB
  of MemAvailable until the socket was released), 2684 KiB with this
  patch, and 261508 KiB with the patch reverted.
- A 400 MiB peek on stock, with a 300 MiB process in the root cgroup,
  hit a global OOM (CONSTRAINT_NONE) that killed that unrelated
  process while the reader survived. Same with the patch reverted.
  With the patch the peek returned early and nothing was killed.
- A TLS 1.3 normal reader in a tight memcg completed a 16 MiB transfer
  with and without the patch. An earlier version that charged at
  allocation time failed that run with ENOMEM, which is why the charge
  happens only when a record is retained.
- A 64 MiB transfer that peeks 4096 bytes, then reads and compares
  every byte, passes. Three 128 MiB TLS 1.3 transfers per kernel were
  within noise.

The TLS ULP has to be built in or already loaded, since an unprivileged
TCP_ULP setsockopt won't autoload it. A reproducer is available if it
helps.

This was found and the fix prepared with AI coding tools (OpenAI Codex
agents, with review by Claude). I went over the analysis and the patch
before signing off.

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 80de376a9d2e..3c8293ade342 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -925,6 +925,7 @@ void sk_forced_mem_schedule(struct sock *sk, int size)
 
 	sk_memory_allocated_add(sk, amt);
 }
+EXPORT_SYMBOL_GPL(sk_forced_mem_schedule);
 
 struct sk_buff *tcp_stream_alloc_skb(struct sock *sk, gfp_t gfp,
 				     bool force_schedule)
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..4ce94060e3e5 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1826,6 +1826,22 @@ static void tls_rx_reader_unlock(struct sock *sk, struct tls_sw_context_rx *ctx)
 	release_sock(sk);
 }
 
+static bool tls_rx_list_add(struct sock *sk, struct sk_buff_head *list,
+			    struct sk_buff *skb)
+{
+	bool forced = false;
+
+	if (!skb->sk) {
+		forced = !sk_rmem_schedule(sk, skb, skb->truesize);
+		if (forced)
+			sk_forced_mem_schedule(sk, skb->truesize);
+		skb_set_owner_r(skb, sk);
+	}
+	__skb_queue_tail(list, skb);
+
+	return forced;
+}
+
 int tls_sw_recvmsg(struct sock *sk,
 		   struct msghdr *msg,
 		   size_t len,
@@ -1923,7 +1939,7 @@ int tls_sw_recvmsg(struct sock *sk,
 			DEBUG_NET_WARN_ON_ONCE(darg.zc);
 			tls_rx_rec_done(ctx);
 put_on_rx_list_err:
-			__skb_queue_tail(&ctx->rx_list, darg.skb);
+			tls_rx_list_add(sk, &ctx->rx_list, darg.skb);
 			goto recv_end;
 		}
 
@@ -1953,7 +1969,8 @@ int tls_sw_recvmsg(struct sock *sk,
 put_on_rx_list:
 				decrypted += chunk;
 				len -= chunk;
-				__skb_queue_tail(&ctx->rx_list, skb);
+				if (tls_rx_list_add(sk, &ctx->rx_list, skb))
+					goto recv_end;
 				if (unlikely(control != TLS_RECORD_TYPE_DATA))
 					break;
 				continue;
-- 
2.43.0


