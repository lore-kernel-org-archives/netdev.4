Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825412;
	b=Wafa8qsDi4ncJe1XP0H99AvaEHUAld0jM7W0dYK0AcECH5VeZVxficzSody3eSRGFEfr
	 WHLHNeDrDRb+pGumIyWX6BUYHnKSI0nbB5Yxf0CoJTBom5V9lP34O4Oz3HJuqT7jGHcRC
	 p+DIW57gqchQltFqMsaRq910x7ep6M9vIxxbvkDUIts+ffBdovEjtmb2XPR894VewH1nW
	 DjLyZaCVSnkmnQlKquNlBdZL7HyYfH2EAlvNm4Zl/Qlea0XxmXK1HRDG2+OTg4LrTzDmg
	 eWqHrfLeAii/eRRSA1jap83T9yGUU4BghwnPGb/Abijz6z22IkMCnOyD578QADgkuiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A9QCvBDNzjHNewK/5sGsCPHGV+HulpdvSNXD8RtJkPM=;
	b=qtpMrhOKV6Iqay3y01DxMzwNWR/Cwn4VGgsXUNDgwnjdFz6Mmc9Z+YQDlcW2u+1/++Bf
	 /R5f8XZVEpcNHmeiMN9FHN1Yna/JEF1bjwnZfuTH01Qp8blZaIppM3+scCxaOvoAXE0Qc
	 b+NTSakVch6gZMt6cO2Z4+0uXmIbQIAHECVYZpIXVMfuzsRpHuAE7B/dvyMCxoM03jgZT
	 m0WcD55wV7e913n+HNbhqW/GK1VcsucBgQR2c/vkTk5vcldRrENVSYk97K/AxoSoGl7pH
	 vZxZFJbZgiLq9ZsPT0Mfndpfu3dVWqYiXt8HQVmwsKuwemOC2G3E4jzYGa1zXtZKpCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=KsupSwKc;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D94606A33D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D94606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=KsupSwKc
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53665358476so41863931cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794825410; x=1795430210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9QCvBDNzjHNewK/5sGsCPHGV+HulpdvSNXD8RtJkPM=;
        b=KsupSwKcrGa9Ub4U2tn+zrUWjxY4YpeOUXiPTMixI04s3Lr2LzT0JD3FSyD6Q1tVTw
         VR0ixc0mbd7CEKENRK+wnkSot1+oOS2lv7NPjM7Bxs42DyNtL8lsR5Fb7aIo5tBXEfxX
         QoOMRbRDdZQCC9aLtUd8YfYcUHQAGrnYd/3OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825410; x=1795430210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9QCvBDNzjHNewK/5sGsCPHGV+HulpdvSNXD8RtJkPM=;
        b=R1ZcypinlwuDOGwBU2mi26JBeosEvUeyY3f7ERs9dDNofeGpN2bYzvuIbI2qzk0GnU
         EzHuMg1D/Yj+Ct82q2eJWHo4+HBtCCbWPDuAbJ1lrZpTugAQDJ+efcDOoee93TeNTg32
         YdvDqvGvX65G4qwD6NA6gjJjAQQUOJPlc4IXj/xACVTIN/lXFxVXlyD/mvyQJ1L9ftFE
         vLjwJmJ+9/kC0PwBm9LJWKeV9IWdupJSo2U2vGNjVhj5XymkBqAR+zG2xgkUcYgdr/1N
         p0sK2b8+mEpSFURb+p8j/pWSU5KBy8PatV3PiC8XAaFd+Ld8eDAP9LWEdUsXM5sxHAnL
         N17Q==
X-Gm-Message-State: APuU4Z/q1vCsTFmmo4ZtP8MnO2YW21hvUdBSjqcFBxH2dsH8od+fdyos
	YtoBYimc0e/KZgfyyD/aY5NPwc9ERr51tnNK92bCDZivh81j8aNF4eP8HBVR67Up4g0KZsV6dhW
	0F00=
X-Gm-Gg: AYBFou1wwi6eT/R0J0+MFFrf8n4WeiTSea2O4xwflR27veew96TOzehUNrFHUAxuDpO
	OR3Lcw6KPuezawyioQB+40MDHB48p8K88DiiTezUibsrC90nD1DpVcEaW/BwxNecoM7ILvE/CYl
	vjDfUfaKu2Hyb9z0dUvHvic/ZuFQYLUH1Jgfy37DKrHD6gnEwJclTqNCncMrW4cCEVCzkTb1MLw
	3/7pNuTH4V9eizQtCsGE6PWNMPsRiecPRYQnO/YM8e9pzceFQ5mMKvuqIrPFrBGc9HYmSZqiCRg
	ezrDiuQdyT7EVj9O7C003v3P1gNHnH2PL8DBCMX2gJU0P0swAKklauS3tT7fzvj3/lp3yDpqDNV
	64Ca820HlYA9h8ddJ3lUF8IGe8AdCsJ1uvuchXT9wGjgFAIYDabqiFYPpGtPvRS62wP8Q4UbWnH
	UGXm7n08ya9EaxSIAYpx3DX89VT8DJxs0jW7RDIDKZi1BLOGRAEL/QPK6ItU4JP5oGW+0EGp93f
	gnoGkaWyd+ESW7TY08oIxXg8+GjRlycy2A6wUTeWtHtlyapC48/qZwGR0IpCS09WCHjGCPxr54p
	XyXjCzXk+mFrjITTNwbFauUhDq+FXkIAd6BkAZbYsDDYzZjl+FpGjFBhtWP26YNQbcoQX++rM/M
	=
X-Received: by 2002:a05:622a:1a88:b0:535:f3e:745e with SMTP id d75a77b69052e-55ac667e1f8mr172060921cf.20.1794825409531;
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm77778651cf.24.2026.11.16.02.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
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
Subject: [PATCH net v5 1/3] net/sched: sch_teql: unshare the header before writing and fix retry strip
Date: Mon, 16 Nov 2026 05:36:41 -0500
Message-Id: <QDISC-6HS9.v5.r0.20261116052927-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-6HS9.v5.r0.20261116052927@mojatatu.com>
References: <QDISC-6HS9.v5.r0.20261116052927@mojatatu.com>
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
parks it on its arp_queue and writes it when the entry resolves.  Track
the added length per iteration; an AF_PACKET frame retries with its
header intact.

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
v4 -> v5:
- unshare the skb header before the neighbour is asked to send it, not
  only on the path where the neighbour writes the link header at once.
  A skb parked on the slave's arp_queue is drained through
  neigh_update_process_arp_queue(), which writes the header itself, so
  the unshare has to happen before neigh_event_send().
- the shared-headroom paragraph of "Conditions to recreate the bug" now
  describes that parked path.

 net/sched/sch_teql.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_teql.c b/net/sched/sch_teql.c
index dc21cd9704a2..626dc001ec23 100644
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
@@ -292,16 +292,26 @@ __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
 		n = mn;
 	}
 
+	/* Unshare the head before the neighbour can write or queue it. */
+	if (skb_cow_head(skb, LL_RESERVED_SPACE(dev)) < 0) {
+		err = -ENOMEM;
+		goto out;
+	}
+
 	if (neigh_event_send(n, skb_res) == 0) {
+		int off = skb_network_offset(skb);
 		char haddr[MAX_ADDR_LEN];
 
 		neigh_ha_snapshot(haddr, n, dev);
 		if (dev_hard_header(skb, dev, ntohs(skb_protocol(skb, false)),
 				    haddr, NULL, skb->len) < 0)
 			err = -EINVAL;
+		/* The bytes prepended above skb->data, pulled back on retry. */
+		*hlen = skb_network_offset(skb) - off;
 	} else {
 		err = (skb_res == NULL) ? -EAGAIN : 1;
 	}
+out:
 	neigh_release(n);
 	return err;
 }
@@ -309,11 +319,13 @@ __teql_resolve(struct sk_buff *skb, struct sk_buff *skb_res,
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
 
@@ -321,7 +333,7 @@ static inline int teql_resolve(struct sk_buff *skb,
 		return 0;
 
 	rcu_read_lock();
-	res = __teql_resolve(skb, skb_res, dev, txq, dst);
+	res = __teql_resolve(skb, skb_res, dev, txq, dst, hlen);
 	rcu_read_unlock();
 
 	return res;
@@ -335,6 +347,7 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct Qdisc *start, *q;
 	unsigned long flags;
 	int nores;
+	int hlen;
 	int busy;
 
 restart:
@@ -361,7 +374,7 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
 			continue;
 		}
 
-		switch (teql_resolve(skb, skb_res, slave, slave_txq)) {
+		switch (teql_resolve(skb, skb_res, slave, slave_txq, &hlen)) {
 		case 0:
 			if (__netif_tx_trylock(slave_txq)) {
 				unsigned int length = qdisc_pkt_len(skb);
@@ -408,8 +421,10 @@ static netdev_tx_t teql_master_xmit(struct sk_buff *skb, struct net_device *dev)
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

