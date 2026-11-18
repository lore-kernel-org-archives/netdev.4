Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036492;
	b=1V78/yRdqMWkx1WIsd7bnGmKgjcqfEQV3rR6tbDuUUKpcZf++DX1ozwWaZ74oR71dVVa
	 Rom3Z93Z5e+Wk2TdsT/w2VPiB/MDnu5GRWnS7kol9DW624dthDV1P3r1HL7c37uB0fvc0
	 oadWr5bOLpJ0q+3HlXFfRXVvhDjV6YKHLuFdk2PNY84Z7tXGtS6BILzcSK9HkSUk3U3V4
	 bvwAJqu9sZEUCNlQB26nlgCqDRmLt9YbljDnax7zJcaVjH997raoC6R4pENymk5AIu6cC
	 kq4mVw5dx+O5z5vZ2LQHq1lzXkzdePC5PAzL35dI09PtOOSJtS+BxZgB4FVSahZ4h5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036492;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IRN8e1YgeSGzhUuFsD2VLCnpoWk3n4qAeM580YrGeI4=;
	b=JpepUGtP2Sv5lYI7daoRF57v7nCqt4cdqsjNlFjby1Cl+TdUmgeulytXShKLMc6VKepL
	 /m/Au80IceM6tA7Hx2bMWqx8d9rBsPWZVn56wY6v3L3Yf4qPg1uN9Xauh/CXX3dfGo6ma
	 +4eEKuFB7p6QCJLBGxdkQU5YV7Gloslhj/Ss7tNLVGG0IgSiw7MD0IfdBYzGUA8EUYnMi
	 jxy3GqN6KiZCNR7kXdibrJaKSQ3xdDrrAgMtTw71rAZ1UoDQc27t/reTjIOaF7S7oHvTR
	 jYJlrkAGReLwpZ56U2nzHlHrvJ5DPxNV8zk4JARKJyJfauP95+j/Ir/fac2FSN5da+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiA9haQ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02C606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiA9haQ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3301F000C4;
	Wed, 18 Nov 2026 21:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036492;
	bh=IRN8e1YgeSGzhUuFsD2VLCnpoWk3n4qAeM580YrGeI4=;
	h=From:To:Cc:Subject:Date;
	b=ZiA9haQ4tMQKr8lYRgQ3BeMsgjR4ai24W4NxEIkuZ7EyAv6CcsWG9FioicltCbMll
	 2VoXCRYt9qh4ixjtsEYlg0FAoLIcPPKbfkufufr+CnETNblNsLRN6LNFdPolZG0pIj
	 B5fpXsCozRL0qSxe1iUqG++4BKcnReyAbQXxd8bCbPlHmdzM1cnIbieDeHp3jzFElw
	 2SX2jdwzVqsEjHGyQBMJrOHzBa0PePcHNPS0Wvzg2SMw3m0BxGBMF65GgtOnud6L/+
	 zbahE8ybS7ruc9fsTaLbbm5W0Ex+L4/Pj39wkymMMFGtnpUecorvedcjzqFd+YKCrY
	 euDydSniDeoJw==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next] net/packet: wait for a single RCU grace period in packet_release()
Date: Wed, 18 Nov 2026 22:14:39 +0100
Message-ID: <20261118211439.1453635-1-edumazet@kernel.org>
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

Closing an AF_PACKET socket waits for one RCU grace period per ring
in packet_set_ring(), then for another one at the end of
packet_release(). A socket with an rx ring (libpcap, tcpdump) pays for
two grace periods, a socket with both rx and tx rings for three.

All the RCU unpublishing is done at the beginning of packet_release(),
when unregister_prot_hook() removes the socket from the ptype lists or
from its fanout group. Nothing is unpublished after that point:

- When closing, packet_set_ring() finds the socket not running and
  does not touch the hooks.

- fanout_release() only clears po->fanout and unlinks the group from
  fanout_list, both under fanout_mutex. If it drops the last reference
  on the group, all members have already been unlinked, so the fanout
  hook was removed by __fanout_unlink().

Call fanout_release() and synchronize_net() right after the socket has
been detached, before the rings are torn down, and skip the wait in
packet_set_ring() when closing. That single grace period covers the
rings, po->rollover and the fanout group.

The setsockopt() path of packet_set_ring() is unchanged.

Average close() duration over 20 sockets bound to lo, in a 4 vCPU
virtme-ng guest:

                         before      after
  no ring                7.86 ms    7.76 ms
  rx ring                8.01 ms    4.01 ms
  tx ring                8.00 ms    4.00 ms
  rx + tx rings         11.96 ms    4.00 ms
  rx + tx rings, fanout 12.02 ms    4.01 ms

Tested with tools/testing/selftests/net/run_afpackettests
(psock_fanout, psock_tpacket, txring_overwrite) on a kernel without
KASAN or lockdep.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/packet/af_packet.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 6ace2a5b2d177e3de89361a3092536a8f6c5e00a..96c5216a9d6b47700da682d864368eead8572297 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -3224,6 +3224,15 @@ static int packet_release(struct socket *sock)
 
 	packet_flush_mclist(sk);
 
+	f = fanout_release(sk);
+
+	/* The socket is no longer reachable from the receive path:
+	 * unregister_prot_hook() removed it from the ptype lists and
+	 * from its fanout group, if any. Wait once for packets currently
+	 * being received, this covers the rings, po->rollover and @f.
+	 */
+	synchronize_net();
+
 	lock_sock(sk);
 	if (po->rx_ring.pg_vec) {
 		memset(&req_u, 0, sizeof(req_u));
@@ -3236,10 +3245,6 @@ static int packet_release(struct socket *sock)
 	}
 	release_sock(sk);
 
-	f = fanout_release(sk);
-
-	synchronize_net();
-
 	kfree(po->rollover);
 	if (f) {
 		fanout_release_data(f);
@@ -4674,7 +4679,9 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 
 	spin_unlock(&po->bind_lock);
 
-	synchronize_net();
+	/* packet_release() already detached the socket and waited. */
+	if (!closing)
+		synchronize_net();
 
 	err = -EBUSY;
 	mutex_lock(&po->pg_vec_lock);
-- 
2.53.0

