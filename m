Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079320;
	b=QJ/O8gRCW9gSjjqM4uDBeMGMKRoYz4LW5suPj0QuBaMzVrNfbPDobfTRk5eh9WftnTFM
	 mULc/ZlPbQKYDkHTO/gN/NO6wlaNPO5nl92CjirpWZmpQB4FjjVKkuTYad4+JtD2dMMpH
	 13jx7Rd/gyzmxK4ZgbweLx34HemCTinl5E8nI/QLPBoe5hneHnF8fSMiz7kaeg8QbVjOo
	 6UwvFy5V9PhUhnsXugDf1f5wtzNNv48eG9UB5u42wrrlc3LVUikjOMXQfISifaE2CT9kS
	 EwdhQ8fReT9jSJLWOh7mVkJcJE4NHlR3KAv+7Xda+x674jwU0vi/lyaB3E02m4g093w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079320;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=15zWcwkuBSJexmlOsRrtxfRWi46muQGHV1HA3UEnjNo=;
	b=RR+rTNsu3FQPq7tesGzb21OtyafpZXvCndj6fdJ5beRfe8F9s/42NHrQ81lJ/werYgWb
	 dxUMr9AJJHQe67EcBl5ZxqGXHO9G+HZvqecB4iOMVSReIsGM0ASK5fddmMFvZT90kp0/8
	 Ya0qtLLl5nmMimS65rhm/sq8YTJANb4GsNN4+w+V6Uh3upRZT91/YMVq239yN1EwZ+mvI
	 W3d5XqK5MOtOj3RQksAkWnVKO9E7TDZm/omW9GKLosk0Yn/5ZWU5VmxOZ2h8ASdv4OdmM
	 jC4K0tpmPKCUnQtSlndg/tXSNC/BgkcpsJxpGkNmeu6wk2/RV/Tt7/f6dJGJa6GjX2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iGaz0MnM;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0212606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0212606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iGaz0MnM
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ewLD2RoUEn44CzUrN+jsQkMnB8disIPWVTgYsWzKRj0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795079316; v=1; x=1795684116;
 b=iGaz0MnMJK2L3UpilUUmEvzFnKsXezvVt0AyKhtlDDnoCP09FGGP6xbv7veim1jcXUBtCeJJ
 CROBFESll6SlMQ2Hko7oNd264lW6Nnqhg2YBGRodvb0haPXBwcZhKy5JQy53NOr5gtTviSGySZE
 PUGXqZOu5DfTBBxuQFPoMR3Y=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c716db91977b33a7;
	Thu, 19 Nov 2026 09:08:36 +0000
X-Mizu-Trace-ID: c716db91977b33a7
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
	Soheil Hassas Yeganeh <soheil@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
Date: Thu, 19 Nov 2026 17:08:27 +0800
Message-ID: <20261119090828.343748-1-jiayuan.chen@linux.dev>
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
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea..8bd377542a89 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 			if (err < 0)
 				goto do_error;
 			copy = err;
+			/* Pages were charged by truesize, not by copy. */
+			sk_forced_mem_schedule(sk, 0);
 		} else if (zc == MSG_SPLICE_PAGES) {
 			/* Splice in data if we can; copy if we can't. */
 			if (tcp_downgrade_zcopy_pure(sk, skb))
-- 
2.43.0

