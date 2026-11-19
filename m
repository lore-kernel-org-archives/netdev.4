Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092036;
	b=mJTPBoyoNbjpVrDk2ceaaqI7Ve9AmRSN9Y1+lWOBXANT/Oi4kVyNnNZ325FCe+UJk8hl
	 fD7/P0/wSKfgitnJ4MdDClL93Uac9RJH0jNE94XCYT1b9dwOs3kQA4MGGt9SUHH1W34lG
	 lOW6n57/SxRN9QUuJ3mJ1cuhj1huyhQIgVIdWq0QJEvm1n7YOQcxZ/LVAptYo+CrOzMxC
	 psJwrudt9ZN5dwBagtBScyK/OeSBRmy45xHsI4KzNAFCwefzCUnOlf2Goap4Zz15NVCzz
	 VSoAjpMQss+aZIivq2tUp65bBSLSUs9XqWm/8x9Bk/h4kMlVgroblt2Zo9FagOnm9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tVDnY8OtxNX87CAwAGPLJZ7DAxyj7rWw4UJCN44byEo=;
	b=IpUUMa1jQULMXkiJcfZE2yh+rFK1Qx8DPLfUZ1PxXd7YPE1RpP2kIo++rrWisjHjgb+C
	 G0XGk0adRAopLgi/KfrXWTpaijubQTpaTuI+LdbkCtxwoFe1Eqb0OcXOZfdx+HUD+CUos
	 tVqk3ll1q+H9c4GReP8HuTJeUAzmSc5LSw406a7JB2bDUKVF2CPyVSmdw2l4jgLXo22mG
	 B2IsDCxMV6+B7xoAWnp3iX4vri2ya7MJmpaB8WVUUB7WAe0i7BUzAJ33nYSJ8g3u7mzcV
	 YJTrBWe/POyrmz8yo3GsTs9SjGqlR1J/B2g68CjSGR0sKCko5ZbfPhTqSIDD5NMclww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=O8pJNLyp;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A20606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A20606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=O8pJNLyp
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9212aaefc11so5868746d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795092035; x=1795696835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVDnY8OtxNX87CAwAGPLJZ7DAxyj7rWw4UJCN44byEo=;
        b=O8pJNLyp5l0iKi1X4+pPG7gM8tZIRyouS1KJ1bmgyKmu0Y/IMd+XIfxoVhjnO6jS6r
         CVZTS0GDKOWNYnf968sqh1hXrjpWHa5zfEzdsxWWt8swcz2Ue+ytbt+rxLuopiOkuAYf
         tuo+zJ9NApIiLSTz3C77VaADY98UxsujnzhI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092035; x=1795696835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVDnY8OtxNX87CAwAGPLJZ7DAxyj7rWw4UJCN44byEo=;
        b=DGuWSLQV12WgzawxVzUlF+2IFwFW3jLKbpYzeKt6O7B9JtWiRGnc7kwb4DqQbxskPQ
         bF38fCU7sHFmuT8+0wig7Q+4MQnkrbVWS7ImKFYXwrataETH8iy6XCfQ4dudZq5RJiN4
         E9WX/UWA4b1pSpNUEwsUqXonLvPPkrXWe8J7JN72qnb3nEL49K7fcjwoH8org5jIsLKN
         3AFFjU21+Qhn+xWNI71/MzjhbyEzvabaa13330Xxfu33Hl/6BGhMkVu2YLY6QbjA6MJO
         nNnCwKtZ6ofsDeY3SfklSK68jTCOoK/xQuFN0HU0DYKBpYHS5t8Di2sWZyo1klF59s3u
         iBzg==
X-Gm-Message-State: APuU4Z8lnC7r2P6OOYmXhCXj+m42HOTeqQPlLu3bjTUsgGQ0fQ9RPi3e
	EVKKumJv5/aCyxH/aJOOjEbx6J78dgI4229pI3wyRhqVOg0rkwRwoDArwyV8u6YRvIhd4h/xre7
	eM1Y=
X-Gm-Gg: AYBFou26Xbmf33AvUIW4ol4m964vrzFb2uS/jlXSDZUzT8HM4deBAfpwUPQYwBiO8Tv
	izQhD9T6TfE4npQefGVTHigfuI78MYfhq5VVtS1sJ0nEiP9/Zg5/PU2TYkmQh8ci0gw9AooW9R2
	qkl/ePE2GpmP3aisuLYF/jn6aDzaOAUlErqD/maqaZBwj2g3jbrk9wqVNgPUiplIBvm+3UXEznB
	eP+GlyMLw862eCQeAfRGOsXllMS8VNCOp5NkphYPLg+aLrzOSyMgpBzgGKXbJM25JR1HRbl5bIX
	/V13AA5BrXH13l900Y5mFxzsvIYInUTj1fHtAPnR6fbu/hj65Kc8EXQC43HE988BA/uvaOa35l9
	6HC6YSu3Y1Vac5OLJBgdtav6Fl/oeBjPNB2X2x4u+VcQ7ELxu1pbFsf4OqMkhuU8Pmnvwpvayej
	a3zhH2CowpMpUhy+x5SVQGGjmnm9JuZ471x/Sy6Sr3WYXrAeIJ/2nbyHgDpx3vch329U+QkXaLI
	ylxgziUfzUfo9o+dHfQw4uTGcLMEUiv7SmIgh6vWhOHRQWlLbAJyne+lTYWWjL61eP7kdlTykV0
	Ihez0SL1uHDCfVOMAdEZ5xSe0stTggZmNd1p9ITXn8u5fE+i83QGbMQ/1+gFR+rWUSejAaZLtjs
	=
X-Received: by 2002:ac8:5d06:0:b0:536:d47:22e with SMTP id d75a77b69052e-55d5a5e9e6fmr94167611cf.40.1795092035312;
        Thu, 19 Nov 2026 04:40:35 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b75823sm22370191cf.13.2026.11.19.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:40:34 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net v6 1/3] net/sched: sch_teql: unshare the header before writing and fix retry strip
Date: Thu, 19 Nov 2026 07:40:23 -0500
Message-Id: <QDISC-6HS9.v6.r0.20261119070330-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-6HS9.v6.r0.20261119070330@mojatatu.com>
References: <QDISC-6HS9.v6.r0.20261119070330@mojatatu.com>
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
Cc: stable@vger.kernel.org
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v5 -> v6:
- every attempt now starts from the network header, as
  neigh_resolve_output() does, so an skb that arrives with link-layer
  bytes in front of its network header gets one link header rather than
  a second one.  The header length is recorded as the offset the
  neighbour built, and only that much is pulled back on retry.
  Considered comments from Sashiko (nipa).

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
2.34.1

