Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575461;
	b=JIWVIDyTZP+nisg3blxCGra9nrZeROhTbDoOcHBXJGyNvIC8BG8oPmg43+oIXOx325FE
	 T7PAnYJQznO+FxTrnYtmbY0iFk0Nmh3Gr0Bj2FktpXqXxWUVE8SUNY5qs/2wP1cZZzS9o
	 tFXwfAVFsOXyuhZOAz/6DlJzfbdeoVVQcsGY5ZLa77yZK1e94irH0d1aBPA38hctr5zHf
	 IcgBdiQkTv0vy59WXYr5mMqa7Nt3+z2UObrAb5O3cqiYXs4ZWTtwmMPl+jw20EqfbjzKv
	 a0GnU2Ikda9cGsJmIM/zcYQ9kk005JQ+R1yTeFqlEqEXHDcMYds9Aqt+0OIGHIzgR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
	b=Yg5p9t4fOivztB5v5lNzN6SdRn7glK2OVDrMnMza6H0DP+JobducV/CwfgfALWeAGl8M
	 azZt4wfetL/nw/JqyYb0gjzQfMutqC42qVBoQ7oa91jflWuBx96M1OPwG+f+ABzxdFyJy
	 +ABD1To03Q65bH01YQth1RJo8XdR9bwZP+pQutO6fcdE1KE+KtZrKje612lYvEchNpaLb
	 iGqMrAOENzX5owsi7ef0TppoOGA/xh5GL6LCjh9ieDONULodNZgbLDbmnvBp2rCqRicYR
	 eZm/jttl3fnkRsKbMPLCR7t38OSU/pYBteNXOHmmhzseib3mvxDObh7gm8LhJjl183A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9pck++a;
	arc=none smtp.remote-ip=209.85.210.66
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D57606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D57606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9pck++a
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-862df509d48so4108007a34.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575460; x=1796180260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=t9pck++a1w4bc/mxi1Z84pgYZwdNd2gw5rXSY2Hazzt7fsd+ONy4xJDVFKnCck73AG
         eCppw7T6xcbzrFCuZuWPv6wC7/yrV8wRUazl8ni2x+qAEggMepFHaN+g2r7NFooWDBkZ
         x9WeLHk+l584mjuO1qtOb6krBqkc7eJz4Avi1ll/lq6RwyWSC05vCKW1kTYWenhuQ+UC
         7bnKodMtl96aMJjYt+FFRX4AqbgqLg153LtCC+WvWtKozQ0CfNqDTDQ2ivpPKd9aZpSe
         JUT8JIuE16PeTKA2FaUZEVE9baLGvRUdTMQBfZcZRYPS0txuzYjcsib1ALlX80oFJ+vE
         /2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575460; x=1796180260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwOZibvAccnxBelZH8y949wCLqVF2LXLaAyvhlz6UsE=;
        b=xBLjmETTPi1OVHrBUAE5TZ6fAPf9o1tBzLyFoE/kZjlkaG+u4Tvsqt0DIEVaQ6Cgd6
         S6mWR0GtXy/g4xzKWnQNz2wH5imrWaLGPxoaPmFcxukDM+1bnQ8XhkHdmRTxEiaWLEZx
         lNhgirpVQ8/pMuLWEbSD6sK3gsjEI7XGH5OmXGGstmaCsX7/rqBNbILWWE3zUkXjVcF7
         Vb6PhARO39dz1kytjfYPamLf02iu3haH5q7/zGsfQ9GxgdZnym9bKiYusOfw94eIqH0C
         ag+XxXU71SFea2WrfRlcc8xf4XlJLiGvzFiklU7UjCZgjU2xOwFXOj/gfUuQSVOMMnpk
         VPhg==
X-Forwarded-Encrypted: i=1; AL+hErFPg5rgQaDZhf6ugnxd7siGlftBfFFk9/ypSZP09+o26hAkxYAawkRGkE3Djw9LO/zpMlBJBAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XnNzWWwULn8e1gpayAoX+EG7O04TmqQxerTbGdWHrfZPgCF3O
	XtK4cNSugQlNKODI9K+F9nPQQXLuqoLP8L55XQTamVQU5kYKELgNkNiHQQDOm0fGteJu2g==
X-Gm-Gg: AZFdTZfR1dlJGNFyrZSesEGoLbGgt+H3PgXU3v/4JtgPZPLpZ9KzAbEWXdi8L2eeDv/
	VBYkbHnG81oC3G2bt2gDWiQ0ArTo/8kU7sGr9xmmb34ti2x/dUyUwzvnSuTA7q0St+NKYytBthd
	uh23jiIJt2UZBRiARvAti6poxvyESVeIuWPuXJzvLbxjL+WiNn+VfW6Tz0gSkc4Gh8jtKPCLU4+
	7DYay2LfwPQy09LVbjG7KNiPFhPypLsMz0qjebyQSE9DJqx8MjspQT/uEQQb9p35tKxL2qd0Ktb
	MDe4LvpRAcY0K2hD3WXzWRK4MS3Zon5eF/q1SUfnTA6kj+mdReEzjU8FBr9icihC+9V7E/HjQA2
	kVbawvq63XWZseqUO96Tabz2ob6DRBJ4DjlL3/bRgHQtLfT4R7n5Z2oJ/7vtX/ydfKSNOKyx+fs
	dzyo/RjC2wiJJ/2QcCb8YQhuQ67s9ksbq26z6qxwSKxRugqOCwiQK5ITbGVUW9ycE53e3qpByW4
	PCNHwfoAfIt/j8WmWajOJPDDR5baHDcdIMvEbVjNSNhPJePpauofHs08h1JYMrQM88yAyUnU43T
	/n9LoDo+xAPKqTO48mVO/hb+nKMmn0JHGpK+mTXoBsIroxZOs+lqgTLdYKN4vfT9vz6j
X-Received: by 2002:a05:6830:640d:b0:862:c21e:4f75 with SMTP id 46e09a7af769-863091e1e95mr13456344a34.15.1795575460166;
        Tue, 24 Nov 2026 18:57:40 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm10701384a34.4.2026.11.24.18.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:57:38 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nfc v2] nfc: llcp: walk the accept queue under the socket lock
Date: Wed, 25 Nov 2026 10:57:30 +0800
Message-ID: <20261125025730.383142-1-bsdhenrymartin@gmail.com>
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
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 was posted to netdev without a target prefix; netdev does not take
nfc patches, so repost to the nfc tree as [PATCH nfc].  No code change.

v1: https://lore.kernel.org/netdev/20261118083811.1721010-1-bsdhenrymartin@gmail.com/

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

