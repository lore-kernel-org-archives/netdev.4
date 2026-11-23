Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436685;
	b=xs6sR7jlKJXNyzSlXcdI85dI0SYYiR/DogM67y3GRa2v+tfhNK3u1bP6pWnl/WLth/AV
	 fplxoCFdEqSX+hcyd7iE4lb4DKdVBnmoCfB6ht2ugKJy6DQ4K4cGPipLLWeD/BwgYixdV
	 3FFfji5XuC1jvx2lbTHAoHdZWIt9bhoUrUwT3zNh9dJF0vzI5hzb/Cm+TJyyEAGaKTXdI
	 Luwh1tVzGLMyku3XyH3oWlmEG0jKj1xF6bSPhENILbf95qTcIbGYiHbck/e1lfGso9ZgE
	 5FBbXmhSxUCcqk5yv5nWMqq9LabZM9fkHpblxQIwCX5ChepmSbfEcxSSM2VC34+XNjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436685;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z2ZqcAzvn8rftSdz5CTFszuPMfE/mGAN+/UBYcUwPrE=;
	b=2T5qzinkpn+OQv2wWA7LkeoqcFKZIEo8Ud3RBhKVvjj/oBDM4xHzbBycTaubwM1V7vuR
	 XFOhv7suANuLbQB1VaBGhbTDqJBFfy+UUrx2ZWwTsyQClDuSVERDzY9EjV8P0XPUuSTbn
	 7Avu3otTQmR29dww+hdTazOfkGvQ6i7FqNGW5Icr1rF+edtwWtfCwFoPMxm3Mf5kTRb0h
	 ncVVCM8Onh5Xo0k0MD1mAZ62X2CbkBr7LxTFEQTWComHBin3bAf98YZ5zEGS2F2Kt5ppF
	 lVca8WA22C7uhP7nDZxPwxTAfNeFNFvnAcXdoE04/iEe04q5ZCZzKzcXdtrv1dVWuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wu3K2n5x;
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DB606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wu3K2n5x
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8Q1SjcwepZqcgCq92WDlIH0YSR9zqzm2uSjkwhu8qA8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795436682; v=1; x=1796041482;
 b=wu3K2n5x1EoCo7UGeAlIBRwvkmXp/8LZtB5hdm44gtIKdPhbEw2TqYQ2RjRfETkRBZ4B7knZ
 xOcQ6RCrcqvW8GvMsQm5jzVtEeqmyHdULLGc7gZUrYewav6jKGNj9WjpnvkttBshNMaNpsT0NDJ
 iEj0ySByYwUVCAU+Ag1kx6gg=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2fabbd8dfc1efd4;
	Mon, 23 Nov 2026 12:24:42 +0000
X-Mizu-Trace-ID: c2fabbd8dfc1efd4
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Wei Wang <weiwan@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Soheil Hassas Yeganeh <soheil@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
Date: Mon, 23 Nov 2026 20:24:31 +0800
Message-ID: <20261123122432.297135-1-jiayuan.chen@linux.dev>
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

Our local syzbot reported the following warning:

  WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x1f20
  Modules linked in:
  CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PREEMPT
  RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
  Call Trace:
   <TASK>
   tcp_sendmsg+0x2c/0x50
   inet_sendmsg+0x62/0xb0
   __sys_sendto+0x2fe/0x350
   __x64_sys_sendto+0x7f/0xb0
   x64_sys_call+0x1375/0x27e0
   do_syscall_64+0xe4/0x470
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

The problem is here:

  if (!skb_zcopy_pure(skb)) {
          copy = tcp_wmem_schedule(sk, copy);
          if (!copy)
                  goto wait_for_space;
  }

When MSG_ZEROCOPY data is appended to a skb that already holds copied
data, only the user length is scheduled, but the pinned pages are then
charged by their truesize:

 skb_zerocopy_iter_stream
   __zerocopy_sg_from_iter
    zerocopy_fill_skb_from_iter  //truesize += PAGE_ALIGN(copied + start)
    sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative

For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
charges 32768 with 4K pages.

On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
(e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
min(copy, sk->sk_forward_alloc), which is negative. The negative copy
is passed to skb_copy_to_page_nocache() and triggers the warning, and
sendmsg() fails with -EFAULT.

A few options were considered:

1) Schedule the truesize up front. It is not known before the pages
   are pinned, it depends on the iovec layout.
2) Do not append zerocopy data to a non pure skb. This splits a small
   header and its zerocopy payload into two skbs.
3) Schedule the missing part right after the pages are charged. They
   are already in the skb at this point, so this can not fail.

Go with 3).

Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v2: https://lore.kernel.org/netdev/20261120094605.46063-1-jiayuan.chen@linux.dev/
v1: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/

Changes in v3:
- Call sk_forced_mem_schedule() before the error checks

Changes in v2:
- Only call sk_forced_mem_schedule() for non pure zerocopy skbs (Eric)
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea..79b85035bf45 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1352,6 +1352,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 
 			err = skb_zerocopy_iter_stream(sk, skb, msg, copy, uarg,
 						       binding);
+			if (!skb_zcopy_pure(skb))
+				sk_forced_mem_schedule(sk, 0);
 			if (err == -EMSGSIZE || err == -EEXIST) {
 				tcp_mark_push(tp, skb);
 				goto new_segment;
-- 
2.43.0

