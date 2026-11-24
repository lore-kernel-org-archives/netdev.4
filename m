Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513763;
	b=5Vf+AvgaR5R69pBlr+QpQs+z3ciHzANPffr0FyiJERJlhWSohNYChqW/iy/fd8VjDqeU
	 8lF3NGYmG3el2CaaqEfJEMep/QPCO+nXpI+xHwDowy7zRqT9Atmsy3zrbu0nWKrFuzceE
	 l+dEERl8GUrOk7BYMt0TyuhrcXzGnAWWEGEJd/PEwV15VDqhfddPtfdpDxhNsEBjAgN/m
	 Qu8q1Uo750jr87+jyhi9KpdevHVfHT4N0yNVxpBKlJojcTStqHeF0ZP7t3V2FiiKi55Yw
	 8W66OX+ZZ75qrhmrWYNK+qRjj1tqT9kXrCxB4wC8Y69mr4a+IbdG278oIHsqPEeeKqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=slkJzzrrK3r3R+tM7uOPwQJ/dVKmERj9wH5MODddrAY=;
	b=wp1Jc6HTaodL9EcKGoPfANa3QRGkUucXWq2EI3dD6gouX2f+3pfpM6eK1n+2FvjUf5G3
	 cSwqcJSEVhrZzB0GIIGBQVEiYV+HO/fbmq4iAF+KdWYRrx92a4GXSCmNRtvQgaihDC5IR
	 NoWYoPO0IuEKaWIzDWOEe2GnQbqYvyJFaJYHEizam/C4t/hH3mVaukKh/28/WkVmo+W2d
	 hRD2Nw+CRytbM9h7yCnlYyXf3/0SnPs4QccWmRdNcCBUxFqoBMO1864mP9lx1NiHKqmZy
	 lgCx+2pJnZpsNA5keUmeAD9kdfahXZLJY13IDZTUZ14w3RkEb4vdfkXH03Y8dn8ZASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Q5p1wtQa;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3665606A867
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3665606A867
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Q5p1wtQa
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921342fae7eso47610506d6.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795513758; x=1796118558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=slkJzzrrK3r3R+tM7uOPwQJ/dVKmERj9wH5MODddrAY=;
        b=Q5p1wtQaGTLJdx6sfSr7iRMFSa3XfzZLzupibUB9JB3S3pOtnB80RyXskBPJPszIx7
         LK0EZWtO9UYgwtiMc+N5Uiz7r/jWhpmQmRcjHqqraNPnrp69mZvyq46IsQFgx6Tf9wPN
         6gniXBsYdxhCrMyHCoRTmd7R25IunOofg7erE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513758; x=1796118558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slkJzzrrK3r3R+tM7uOPwQJ/dVKmERj9wH5MODddrAY=;
        b=LZFtveqb75nUVGq+MLlJsBkhEl3+Y//xgzK7qRNsavMt4ACQNgE69Tl6hRXxWwQEyl
         AkNQcWqEjvLVlqcj5Quv8tk79D2T4DcefVlONOgZ/8T0yF5+bbc+KXWFajHXr/Igkogi
         z4j1Tca17VKAhBxHQYjxfshAYVSgIniQ65Egscu//ZkkiOgF2BcPF2/dacj+8mBF6gaK
         x6BjsFrAQhcfIXfghmu5cJ2YkytE8xlAjptLnpI6Jnu9hE5Ve6iuC389s+ou3X5JNNVs
         hOC6S+vDVEm9WzhFyDjWzfiO+/MrLlnELmKguNyLyhVgS4gkO9eIwM18uLqKEFTUrCXV
         juZg==
X-Gm-Message-State: APuU4Z+YqHUqVIWNQkOCXzkYfsLjzex2+fhILbXdxCTff804PYQSmPRR
	9Nv8IcSE7Rg/5nHTwwCtjZ/uJ4villJXxWVei0gYcVoi1puJlIJ/RinTfB2VA6LkpUUHQNL0sKZ
	FmTE=
X-Gm-Gg: AZFdTZfUWv8WK+3tQIonKOkJDxdsn+9yCOoRxRiRzlsFl3YPctqPlFyiPyedB4Tp/f4
	6Ftt2e1Y+Y/UA+cvtQ39JxKgsHgUCU+VvY2ZHKbRJg38D0lmy9EClj867Pe5ZggVGGCr+NbsNOy
	XfGQnAAW0HzAWbRDscToVF2u9dwOMIjk5C3QZmvZTuwxj3u0Ha2ve0++053SPVxurtWaW6PnHny
	zDYK/iJlbCLmIIunKGzgEUfInunB2xmICOKCmaeOWYN8pJNZaQyeMGiAsXgUmBqy4HTKGBIPHpO
	lnpN328AUO4B7v+M0Pb98DnO5U0r51+k9akRY5U4ppXW7s85L2ZdfHz8pqTCy0iCMr8QjdI4ftr
	z99GXEa63aZOSlLsaUIPMyq/CEVkJ7ZteoZiCcsiZAv2Bo95ytzjZJnkM7EwoRkyu2Icc/gQTVu
	zmXEVjYDEvLC4O9TjQJW8dYyvVSueLhQsF+PVFzqVexrPUflHU84DNU2C990ybBlPZC0xmTHXTz
	+deIbDZoy6prHtumwz30+tFTMqM6q/seaD3Zxk2iHjdQq2ucsCaRAY/1quqi4s/A2cQ9G79nleq
	wuw2NH37k2zoyQVbE4rjw8ka0fCNTfden0/QzdrW9Gqmt5U0rbUk9kCqlVdByptKt+vWMvqEatE
	AlZJE
X-Received: by 2002:a05:6214:124e:b0:921:2a6:c6d9 with SMTP id 6a1803df08f44-92134ade7cbmr264015476d6.51.1795513757772;
        Tue, 24 Nov 2026 01:49:17 -0800 (PST)
Received: from majuu.waya ([184.147.180.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm130484506d6.28.2026.11.24.01.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:17 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net v7] net/sched: sch_teql: unshare the header before writing and fix retry strip
Date: Tue, 24 Nov 2026 04:49:04 -0500
Message-Id: <QDISC-6HS9.v7.r0.20261123194720-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

This is a followup of commit dc4b95b8fee9 ("net/sched: sch_teql: restore
skb->dev on the slave failure path") as reported by Sashiko.

The issue:
teql_master_xmit() writes the slave's link header into the skb in
teql_resolve() and on retry pulls it back with __skb_pull().  Two bugs:

1. When the skb's header is cloned (e.g. a tc-mirred action on a
   physical device's clsact egress redirects to the teql master), the
   write corrupts the other clone.  Call skb_cow_head() first.

2. The pull always removes skb_network_offset() bytes.  For an
   AF_PACKET/SOCK_RAW frame with no dst entry, teql_resolve() adds no
   header, so the retry strips the user-supplied one.  Pull back only
   the length this slave added.

The Fix:
Unshare the header before the neighbour is asked to send the skb, so the
skb is private whether the neighbour writes the link header at once or
parks it on its arp_queue and writes it when the entry resolves.  Start
every attempt from the network header, as neigh_resolve_output() does,
so an skb that arrives with link-layer bytes in front of its network
header is given one link header rather than a second one.  Track the
added length per iteration; an AF_PACKET frame retries with its header
intact.

Conditions to recreate the bug:
CONFIG_NET_SCH_TEQL=y and CONFIG_VETH=y, run as root. A teql master with
two veth slaves, the first slave returning NETDEV_TX_BUSY without
consuming the skb so that teql retries the frame on the second one:

  ip link add vethBAD type veth peer name vethBADp
  ip link add vethGOOD type veth peer name vethGOODp
  ip link set vethBAD up;  ip link set vethBADp up
  ip link set vethGOOD up; ip link set vethGOODp up
  tc qdisc add dev vethBAD root teql0
  tc qdisc add dev vethGOOD root teql0
  ip link set teql0 up

Send a SOCK_RAW frame that carries its own link header on teql0 and
capture it on the second slave's peer. A veth transmit does not return
NETDEV_TX_BUSY on its own; to hold the skb pending this reproduction used
a test-only IFF_DEBUG accelerator in veth_xmit(), which is not part of
this patch and was applied to both the unfixed and the fixed build.

On the unfixed tree the captured frame arrives with its header stripped
(176 of the 208 bytes sent, starting at the payload) because the retry
pulls skb_network_offset() bytes while this slave added none. With the
patch the frame arrives intact.

The shared headroom case needs a second reference to the skb to survive
the transmit. A PF_PACKET tap on the master whose socket is never
drained keeps one alive; a kprobe on eth_header then reports cloned=1
without the patch and cloned=0 with it. The parked path needs the
unshare before the queue: a tc-mirred mirror on a physical device's
clsact egress parks the clone on the teql slave's unresolved neighbour,
so hold the original frame in a netem delay on that device and then
resolve the slave's neighbour through a changed lladdr. Without the
unshare the arp-queue drain writes the new link header over the original
frame's first bytes, and a listener on the peer sees a frame addressed
to the new lladdr instead of to itself; with the patch the queued frame
keeps its own destination address.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Sashiko (gemini) <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260824115928.4099988-1-victor@mojatatu.com
Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v4.r0.20261111094338-1%40mojatatu.com
Link: https://lore.kernel.org/netdev/20260824115928.4099988-1-victor@mojatatu.com/
Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
Link: https://lore.kernel.org/netdev/DN09UU4NHKLV.29WR92GGDPBP5@gmail.com/
Link: https://lore.kernel.org/netdev/179543888086.3135.17583427226707859195@kernel.org/
Cc: stable@vger.kernel.org
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v6 -> v7:
- the code is unchanged.  Patch 2/3 and patch 3/3 of the v6 series are
  held back for net-next: 3/3 depends on a neighbour guard that is still
  in review, and 2/3 has no effect without it.  This patch is therefore
  reposted on its own.

 net/sched/sch_teql.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_teql.c b/net/sched/sch_teql.c
index dc21cd9704a2..44730a5e8917 100644
--- a/net/sched/sch_teql.c
+++ b/net/sched/sch_teql.c
@@ -262,7 +262,7 @@ static int teql_qdisc_init(struct Qdisc *sch, struct nlattr *opt,
 static int
 __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
 	       struct net_device *dev, struct netdev_queue *txq,
-	       struct dst_entry *dst)
+	       struct dst_entry *dst, int *hlen)
 {
 	struct neighbour *n;
 	int err = 0;
@@ -292,6 +292,18 @@ __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
 		n = mn;
 	}
 
+	/* Unshare the head before the neighbour can write or queue it. */
+	if (skb_cow_head(skb, LL_RESERVED_SPACE(dev)) < 0) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* Each attempt starts from the network header, as
+	 * neigh_resolve_output() does.
+	 */
+	if (skb_network_offset(skb) > 0)
+		__skb_pull(skb, skb_network_offset(skb));
+
 	if (neigh_event_send(n, skb_res) == 0) {
 		char haddr[MAX_ADDR_LEN];
 
@@ -299,9 +311,12 @@ __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
 		if (dev_hard_header(skb, dev, ntohs(skb_protocol(skb, false)),
 				    haddr, NULL, skb->len) < 0)
 			err = -EINVAL;
+		/* The bytes prepended above skb->data, pulled back on retry. */
+		*hlen = skb_network_offset(skb);
 	} else {
 		err = (skb_res == NULL) ? -EAGAIN : 1;
 	}
+out:
 	neigh_release(n);
 	return err;
 }
@@ -309,11 +324,13 @@ __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
 static inline int teql_resolve(struct sk_buff *skb,
 			       struct sk_buff *skb_res,
 			       struct net_device *dev,
-			       struct netdev_queue *txq)
+			       struct netdev_queue *txq,
+			       int *hlen)
 {
 	struct dst_entry *dst = skb_dst(skb);
 	int res;
 
+	*hlen = 0;
 	if (rcu_access_pointer(txq->qdisc) == &noop_qdisc)
 		return -ENODEV;
 
@@ -321,7 +338,7 @@ static inline int teql_resolve(struct sk_buff *skb,
 		return 0;
 
 	rcu_read_lock();
-	res = __teql_resolve(skb, skb_res, dev, txq, dst);
+	res = __teql_resolve(skb, skb_res, dev, txq, dst, hlen);
 	rcu_read_unlock();
 
 	return res;
@@ -335,6 +352,7 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct Qdisc *start, *q;
 	unsigned long flags;
 	int nores;
+	int hlen;
 	int busy;
 
 restart:
@@ -361,7 +379,7 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 			continue;
 		}
 
-		switch (teql_resolve(skb, skb_res, slave, slave_txq)) {
+		switch (teql_resolve(skb, skb_res, slave, slave_txq, &hlen)) {
 		case 0:
 			if (__netif_tx_trylock(slave_txq)) {
 				unsigned int length = qdisc_pkt_len(skb);
@@ -408,8 +426,10 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 			nores = 1;
 			break;
 		}
+		/* Pull back only the header this slave added. */
+		if (hlen > 0)
+			__skb_pull(skb, hlen);
 		skb->dev = dev;
-		__skb_pull(skb, skb_network_offset(skb));
 	} while ((q = rcu_dereference(NEXT_SLAVE(q))) != start);
 
 	if (nores && skb_res == NULL) {
-- 
2.43.0

