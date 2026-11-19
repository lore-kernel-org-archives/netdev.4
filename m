Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082697;
	b=s54yvxrAdSNmZ75H6f5n2vWvRvXstEk7Bc3kkjfV2yaVXgnKUiCAnsCVqHPNeT5sAvre
	 IbeUjng7orGxlRcgEXaLzSH/s32Xn2RgWAqErnaiq0BEwr5gpdS0l6jn4FltJJJg54CuF
	 oVtSMM77UkGP9KXx6kqzv3nFFV3ByMyEbRwk7toSyL/uLou4+wiy24SnE5H66dP10hNsP
	 t6EYZxPepbwknx7pUDvHvBtbNxvk08SwKVws0tEcosxWSXvxcgLehRErrSQwExOpvf/yk
	 PQY2oQNNEVanugqdeoKJiCviXI9KLVU9aALKe+PGw2cOZ60fA6u1JxH0u91W53sWn/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082697;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=V9MosF3NDfFt7F7sJs4wGKjGSBRTacCEdlZ6XqE5b68=;
	b=3OiwLqdv4XXPlZwiTpH+s2ZLzrtNS7jtdfLHyNkRRDsVc3iLgFZTknD2M0+yO/xaBbYN
	 MMsV1XSwTu+6AX68C5XTzg2/xchfhL73NpcHwBUBZs5LcWuOfIdJ4w0+/mNWJbt7PO8aG
	 xzm4iYxYwHATxzQ4KbLLExtcjc2phrczJeFCAEOmRKwOIrgJExK+Qt+8JzuUeMstGFTNI
	 /r/MCH8vDA5Y095/lWrArG0jAW3qSNN2P5d3OlppapUqatrPDBLJm+cNmzYXfeHsxGOyv
	 WmZJf7ZuKV5+2aQKX9VZysDyRngPyw8ZPWdKXH6X0uDSemxDp5dCoPGXUv8Mbg33wDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YCL1qJ28;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEB606A32C;
	Thu, 19 Nov 2026 10:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YCL1qJ28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=V9
	MosF3NDfFt7F7sJs4wGKjGSBRTacCEdlZ6XqE5b68=; b=YCL1qJ2817r+8V7D0Y
	legPoaaREPRhcaD9LFR1PLJ0t/lHFUI5P+Pzo4y14g08qNqtoQPC7sn5cC1QKss+
	YuMW5OBfR1CjRvcdUOk+nWxW6Dh3kWKEn4OjxbJ6U1E8FcEZ9hGYLY1imv3MjTRh
	4KIYpIO6yfxkWI4It2CezZ9uM=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v4yeyf5q5LMPIQ--.16106S2;
	Thu, 19 Nov 2026 18:04:15 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: do not use SOCK_INODE() in sock_init_data_uid()
Date: Thu, 19 Nov 2026 18:04:14 +0800
Message-ID: <20261119100414.13635-1-zihengw03@163.com>
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
X-CM-TRANSID:_____wD3v4yeyf5q5LMPIQ--.16106S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFykJFWDKw1kZw4fur15Arb_yoW5Xr13pF
	W3tFW3J3yDAr4kZrnYqFZ7XrWfAw1rCa17GFyrZ343AFZ09w4rA34kt34DCF1qkrs5Ga1f
	ZF47Ww4SvasxAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdAwxUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7QD0RWr+yaCAGwAA36

Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
sock_init_data_uid() calls sk_set_socket(), but its only direct users
are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
are embedded in struct tun_file and struct tap_queue, not in a struct
socket_alloc, so SOCK_INODE() points at whatever follows the socket in
those structures and both reads return unrelated data.

sk_uid is overwritten a few lines later with the uid passed in, and
nothing reads sk_ino of a tun or tap socket today, so the result is
not used. The reads themselves are still out of type, and with
CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
tap_queue.

sock_init_data_uid() was added so that tun and tap would not use
SOCK_INODE() on these sockets. Set sk_socket directly there, clear
sk_ino, and let sock_init_data(), whose sockets always come from
sockfs, fill in sk_ino.

Found by LLM-assisted source review and confirmed by code inspection
only; the out-of-type reads were not triggered at runtime. The fix was
build tested only; it was not run against selftests.

Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---

Notes:
    Changes in v2:
    - Use plain assignments for sk_socket and sk_ino during socket
      initialization, before the socket is published (suggested by Kuniyuki
      Iwashima)
    - v1: https://lore.kernel.org/all/20261115161820.941166-1-zihengw03@163.com/
    
    The changelog was drafted with an AI assistant from my analysis;
    I have reviewed the code, the fix and the text.

 net/core/sock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878d..ce7e1cf0d 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3831,7 +3831,11 @@ void sock_init_data_uid(struct socket *sock, struct sock *sk, kuid_t uid)
 	sk->sk_sndbuf		=	READ_ONCE(sysctl_wmem_default);
 	sk->sk_state		=	TCP_CLOSE;
 	sk->sk_use_task_frag	=	true;
-	sk_set_socket(sk, sock);
+	/* tun and tap pass a socket that is not part of a socket_alloc, so
+	 * SOCK_INODE() must not be used here. sock_init_data() sets sk_ino.
+	 */
+	sk->sk_socket = sock;
+	sk->sk_ino = 0;
 
 	sock_set_flag(sk, SOCK_ZAPPED);
 
@@ -3897,6 +3901,8 @@ void sock_init_data(struct socket *sock, struct sock *sk)
 		make_kuid(sock_net(sk)->user_ns, 0);
 
 	sock_init_data_uid(sock, sk, uid);
+	if (sock)
+		sk->sk_ino = SOCK_INODE(sock)->i_ino;
 }
 EXPORT_SYMBOL(sock_init_data);
 
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

