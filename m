Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991105;
	b=5ZF7Azaeg4/1DhQ/kUrLuEfNMWQcLGXR4hXfnCdIkQbW0TS2TNoa8ZzKAQExxMu7POaG
	 JN9NKTe/KRCxzS235MNcckDj61a7Im2tkX4+GkH0x/IBrTd6kz7sufJJ7JBwbcEpA/pSb
	 9r8VxztFrAZk/mfub4bFsh/+PakXORf7TMhT4pPpNssTGI+FM21I8L4CI1FzYWmZcYWhV
	 tX6VKus5SEVqS9oJwC8kyDubL9otX2uPyUtnP12azmiLx5sl86jusshOH6njF4zNIsNUW
	 8JzvraFJzOdLDfrjXmvoFMXhlvqcXKDaWlEPuB7pNh4ohZ7jxJUB8lsr9Uwvr/t2Hhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
	b=5UudjDtDtg4oGkwJk/DwkwCfPSoK5VpxRj/9T4xBtdmTgc2Qwfcnwb6oNdLlkAtvoUlR
	 ryavkm5XRyc3zlJHQGCUn+O5Ivez8Zrss3xyeVToR4ojXuVoMzz7xnIyl5FJC73swC4S5
	 XVEi90aa4S1gEjfqUmhgQrd6owFB/qtvoihTSyN4o/7VDawR4Aw9QspdZnu3dMErmvCea
	 z/+7DbC8+WgSoRNbrcZGDiDMrPjHICEvezkpMfj+dZpFTn+GyZ6kdQxP7Vrk+7NHEpjwU
	 So+Qrwv6OhXEsXUy8oyguDodiGgmjJhayIdESv1b6FIYX+HVTXR1p4QzNh6OTlCXMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKI8d9MU;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D920E606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D920E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKI8d9MU
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a05abb95so134663a34.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991103; x=1795595903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
        b=FKI8d9MUzkUbNdnN8QuOvsu6gjuzjotYn7+lzQJRBwIH+4t5OcEvcg8yr5xq1Mj18/
         UEDlJg58pIl2ikt3lfgIJQN2Ut5ld4oFeBPcVfE2Ce9yNkrqlUYSr8Up1nSae2Ih7B9F
         zoLseKBDn0StWUum8symXoT/QHFacANkj6zGg/2OflNiYgk122D40RvVkC3g7Qwf9Io8
         I4S0Ju/K3qvDJPva7j2ONjlLiB59Fr1LiY4CvImd1FMpMuHmijT0f1nbHbgXej0pWM39
         tuQRjudolrUMfgiayZ7L3z6fPMxx71n6I6wCeUe/oPIUFIfOiBYboaZdRNz2LoR2UCqk
         WQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991103; x=1795595903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMKeyOZcK3q18Yw2MNqKYKjsEME0sggs4rjvagocBak=;
        b=YKsTHaIzXu2i9DzYWlr/SLo68uWlXF9TKe5pH+WhGbUU9axYBvVB9/F5c54UBTnoI3
         wuByf+hfzF96uptGSn6OfcmaZWd6Nxy5Tq+jvVUpiUS2snLgbNd8fVCj5XCrxCCgbQI3
         L9W67OhRKjQ6UZfFSW59gP0TeSb9RrSxouLZNKztBZchkkD8GROGZfT/ZARmJOczU/po
         o3Z+zpjBYsNpAeN3niP4dxJybtrJJqzc7yF3lZG1aZYnTPdEfQhdpEQcdAa8nO4v8laL
         BsqXIzxCypEe96klf4syPnR94pUjjc6IthmC9sNLBNXutrVYVxfBmgxaHzaSLTq94FoA
         U6sQ==
X-Forwarded-Encrypted: i=1; AL+hErEgndKaPzpLyWYpf7uzNzc9hT+fdmCUddkYr83jJYjlh0d29FN2nVbHs53xaFu9TZFBFDNbxig=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jSBiI/NCibYrb7vECIqwM8Amu+C2q1LHivOnqXtdzK+I23hL7
	HicnskalF7i3/iJNnqPTuYaM3AVygN55Rq+iG6E9R4GVks1P9l8m6LmN
X-Gm-Gg: AYBFou03qiRjd4/GUqI53EEMLYARR6//haCLI02tI/G90hpwj8PBPbpwbscaY6Kd3cv
	B0hHfMqFwBJYmgCQ8iO5gbCCvW26MI29mnNuFd7pfWjvKcoRrJTGhL38HJpF80RABwQW1PhBU4J
	PwcsxktOdGG/pW5gLzmfqoryNb87CUmPdfQ5U8XvpzwaWRywRoVRlbBjjP9gKr6xsHJa22F3eaM
	7DCb1c8yY6jy/o9uif0ZgEQ8I7zCnpzXavjHCruVzrlL3XC6NBnf0MHj0Xu21+TTClaN6v65Zsp
	IXqc6JpQokJ/y/dBxxeHOuX5N+ILXAcvMpQVmfg+wZr6AlMc7LIWE8nSgYdn0IJfnrQ+YpJG8CN
	BWRMK/xTcVcKL9E7lfbclGaBj7iPeDKU9BWG6T63/RUK6/AjuVi+Dgz/0RLTVhS564gcPHpss8M
	37BRz6cuaj822/qO3pzj1UrXAIPTzZmvQfxfM4ZYeXs71dLD0cWH2N5iq1lVwaj286mMFVd88sU
	swJFK2ztNOvUSMDZL2ytPxHeKPs8NzN1UyxE5xiuXnDdJ0OSDjKKB6GzbeZ4F4liKZiPiwwcEE5
	4W7BSTiwT3OaxYojgc79iLCQIC8Sf7NIgcmpen9TTi/j6SbzNn/NLDrITLTTNFssRBX3N9UqRuh
	vhqfboxDhBF91
X-Received: by 2002:a05:6820:a70a:20b0:713:da3b:9530 with SMTP id 006d021491bc7-71b187889e8mr789320eaf.44.1794991102733;
        Wed, 18 Nov 2026 00:38:22 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b1945800asm1516812eaf.5.2026.11.18.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:38:21 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: llcp: walk the accept queue under the socket lock
Date: Wed, 18 Nov 2026 16:38:11 +0800
Message-ID: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

llcp_accept_poll() walks parent->accept_queue and reads each child's
sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
unlinks closed children and drops their creation reference under that
lock, and the last sock_put() frees the child.

A poll() racing with accept() therefore reads a freed child:

  BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
  Read of size 1 at addr ffff888112387812 by task poc.bin/528
  Allocated by task 198:
   nfc_llcp_sock_alloc
   nfc_llcp_rx_skb
  Freed by task 529:
   __sk_destruct
   nfc_llcp_accept_dequeue

Take the listener lock around the accept queue walk.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..3503f1a7a7cc 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -584,8 +584,16 @@ static __poll_t llcp_sock_poll(struct file *file, struct socket *sock,
 
 	sock_poll_wait(file, sock, wait);
 
-	if (sk->sk_state == LLCP_LISTEN)
-		return llcp_accept_poll(sk);
+	if (sk->sk_state == LLCP_LISTEN) {
+		/* nfc_llcp_accept_dequeue() unlinks and frees closed children
+		 * under the listener lock, so the queue can only be walked
+		 * with that lock held.
+		 */
+		lock_sock(sk);
+		mask = llcp_accept_poll(sk);
+		release_sock(sk);
+		return mask;
+	}
 
 	if (sk->sk_err || !skb_queue_empty_lockless(&sk->sk_error_queue))
 		mask |= EPOLLERR |
-- 
2.43.7

