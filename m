Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496251;
	b=Za/n8GMdheJwu5TsTUfk0UtjFqsVfYvT7ya1oUHPS/vdEBxx1a2jU2SSAkppWW+Um7uh
	 YZc6Q8TLPF95Ef3wUxYo9zBec/Lw3/iitQ+a2SLTxyCFcTIStnOcfbihHWzxIvS7LPnw6
	 41BHubUUV3NKCvPzhiLYskOMug98Ui5+nEBTiWA8rtxWIkLBteqoiXO7tQBSXzXVf9lOn
	 Wzf0G1TjzE6R9a1LWuhKdVbhk7td+jQW8TvIReRdpO6CVMTMZwvJI/QXIhmenUBlHwGmF
	 RA+UFTdSdLZcbVb7b+tymIpOvNVOPi7mgMPS9fELuwUntZ6/nOXGyxLjomgsfJCHolQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
	b=RKlNuDubfHQ7q+nne6FMjBbpGreO1MQ7sRvjCOSIdGvmCOnLt9Lx/iZqYC1SRb9L4yjr
	 8LlM8G/xFrI79Mk7QF/RVKIJXTH15OOYmfHv3cOQajCyLGr7Mxg7NZU6AucB+Bjk83GQG
	 FuwBk7W2KXwTk97QuCVbUBlRRvZXiYrSQ9+lViTmzjKjnYhyvzc5q8GsN/Vd95LiVyRG/
	 G13CFs7OjHSw2tMhIXq9AWgV6vNgCYT4tYocW/kRyUU25VegwYNzES8UFKU9iXRslkafl
	 xdFwyQf9oyJ/u7lGLKQJnKH6j4AUZROjzEyIujXFykcxjEi9Cs3ergrO3JDUKF4EZZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/YkzPmc";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D5606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/YkzPmc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso2053855a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496250; x=1796101050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
        b=X/YkzPmcXZgazGeOUQOKY/AcJyNIgtpQbgIh3w1XZ/PxZAO9vv6ldKnLcT3QeTCstR
         QiHV6zls9nwWTW/7H3PZy3Xk3lg4l2QpS0T3IUDf4srj9XJqKtp3F6gyyDgkVngW6SN7
         YodyshzN5/H/hAJOXl/N2ZJV/8tYt9LICXc4jgsHKxFG7styeJuBk19VAt4ETjUKL6+Z
         XSq289tx9BPE0BTZJxdnoih5DXP2aaXPF7015+FBkABtyTq7RApZGaUZ7nq4k8pjhdPs
         rASeyO0VpfstsZaSz0lPw11eXRxa2zNGK/UFcEzmJE5mZHg8GfvkTaky90PWuulfWmCE
         h5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496250; x=1796101050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
        b=n1mFnk+SC/3TIQCUW5fD7Hr13+10a+M1B79PqzZuIuCzI0DUzvYNYX2k3vhyEMquaB
         zmCbQsuq85ZADbohzgZpGG+jJVS22Shv+AWojM1Ozg6pRS1h3FWEEy3MvtmWlYvz3B6y
         Sf4qffqLzkHd+ezeW8TdMsfnJaB6CQSfb2kOAqH/pVID36VH9CNRzoUZ83Lfl2AS4q7L
         GK/GgSesULqQZ0fWqKqwjyE39ati/VFdIt4JuIDecO8wNhSbZoO3EAIwPyvb7a10yA0T
         AYo0l0R2bOX8+Zj5Klv+cvTYwbQt+EOlXpFAo+4PDU6Re6f+AEJ+M/2W30GVe0XZoXIU
         nWMg==
X-Forwarded-Encrypted: i=1; AL+hErFwweMLNR3WHvNel8RlS5C7K2PjEgFMQxK3ViiGgnl2yqInMzGqqudbwzsOXl2I6+IMAV5petY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7aDtcn4PUuCLry1Q+HJxbQ4RecfpGgcL5dEIhPMlXIQmPEIl0
	ZHSE/fZ6LQTCdMfbYMUAW5dd/6u5oFJYQYfkS6ESEd2WAPo4zxUtO1Ue
X-Gm-Gg: AZFdTZfkB8D6PRuqdKQlPeWLvA0dyZUdn4IbGsMAAcWB0edetDViJ2p5IwU7QiYMEzu
	lh3AtXU7xMKotRpsE3+0aq3K5zC0rHEkfF5mSv/TiCzGMH3Ji+J9gfB/Ut1yCWieTncjU0YEfF4
	7ZVIAQ9pinAGXByvT4wmA43yiTTRZ5JI8Fv9A7GzfylgLygTaYbiYcfniyd7SJefl9AMJd9M02t
	HHuh8cSjgl1DABgZbEjXm238wEIEXokNQLwA36l3JeL3h7aNJF9tfltYdFKyv9Tfr/Ate4B5XhE
	00lsFteV03YjsvAMIMM0TetkXFSHzWdClQ54kb3PwpyRkIB8+6CayO/iPJsBByGdspRF+uMeVsL
	Q/MuOocHJLQiJHYXdjgyHJSmkiJYBPfq1LTro6gRT+0JxRod7R/lbG3iUic3MBEgdHUXPcniL67
	VeX7x9PNiw39vGjCJKeWvIG/h1qi61H7YCQL50IZBDUXi/Z12+foG37AfBobhSyIseoXjkwLg6F
	YhkaWcBlWDz2u7eEQtGYj+l2S9PXlvpho42ox8UdEHSxp2ZluM52KME45ntYiXXBoImjh4tgI4R
	p92DEuKtCiuAe/fgvtzFMZGwXLIZE2dMI6TVRZ4mW7B6mBuq63G81N+g203/dsrr8l0=
X-Received: by 2002:a17:90a:c10e:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b41c8ff7b3mr13032274a91.22.1795496250498;
        Mon, 23 Nov 2026 20:57:30 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7477815a91.1.2026.11.23.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:57:30 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: =?UTF-8?q?Jonas=20K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	cake@lists.bufferbloat.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/sched: sch_cake: use rcu_dereference_bh() in the cake_mq sync loop
Date: Tue, 24 Nov 2026 13:57:24 +0900
Message-ID: <179549599115.54577.5943710312861930188@gmail.com>
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

cake_dequeue() reads the other cake_mq sub-qdiscs with rcu_dereference(),
but it runs from __qdisc_run() under rcu_read_lock_bh() or in softirq
context, not under rcu_read_lock(), so lockdep warns:

  WARNING: suspicious RCU usage
  net/sched/sch_cake.c:2039 suspicious rcu_dereference_check() usage!
  2 locks held by test/114:
   #0: ffffffff88b2ca80 (rcu_read_lock_bh){....}-{1:3}, at: __dev_queue_xmit (net/core/dev.c:5014)
   #1: ff11000013ec8170 (&sch->root_lock_key){+...}-{3:3}, at: __dev_queue_xmit (net/core/dev.c:5058)
  Call Trace:
   cake_dequeue (net/sched/sch_cake.c:2039)
   __qdisc_run (net/sched/sch_generic.c:359)
   __dev_queue_xmit (net/core/dev.c:4502)
   packet_sendmsg (net/packet/af_packet.c:3157)

A BH-disabled section is an RCU read-side critical section, so only the
annotation is wrong. Use rcu_dereference_bh(), as cake_classify() does
for the filter list.

Fixes: 1bddd758bac2 ("net/sched: sch_cake: share shaper state across sub-instances of cake_mq")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. Its test runs as an unprivileged
user in its own user and network namespace: it gives a multi-queue veth
a cake_mq root with a rate and sends through a packet socket. With
CONFIG_PROVE_RCU, the warning shows once the shaper sync runs.

The patch was written with LLM assistance; we reviewed and tested it.
With it, the test runs without the warning.

 net/sched/sch_cake.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index aa4043d662c1..c1652c0506e1 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -2036,7 +2036,9 @@ static struct sk_buff *cake_dequeue(struct Qdisc *sch)
 		unsigned int ntx;
 
 		for (ntx = 0; ntx < dev->num_tx_queues; ntx++) {
-			other_sch = rcu_dereference(netdev_get_tx_queue(dev, ntx)->qdisc_sleeping);
+			struct netdev_queue *txq = netdev_get_tx_queue(dev, ntx);
+
+			other_sch = rcu_dereference_bh(txq->qdisc_sleeping);
 			other_priv = qdisc_priv(other_sch);
 
 			if (other_priv == q)
-- 
2.43.0

