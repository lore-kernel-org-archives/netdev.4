Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825414;
	b=siWMFJU6BTU6qT80lCwap/pw48J5LBSxthZlhZXboVQ3Of3StTgyplMcIoFdvdlB90gx
	 imQgQA+pSkka/F3NcQa0892SF46fEVgX5o+oBmBkQ78vLuJk7P/xK37DfJdh+EGrBj9iM
	 APBetzQcWMwh/9wrGlApAjuG3PkzMAkdhQ2g2vuDhv8+CEL5lKyHPUYEv5saadANIYDCC
	 HAn3yklau5SOtQolTlHg2evTjSyd2vlGLAmCDzDpLA7FCXH1wSfCn5UF8gUHSwy7a+Bh4
	 VcsrkQX/m/g4rHBkYsndDqgX0oGg8b+7fvDOixxaNhrFUQsRygOTr71geTN91bncdsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=opkasNgH5N2ElWKTLtDlU79vyZanUWteaYR8uJXKCIE=;
	b=z3SKlUty5QefP8vR0IQ98OwS91sL+6n8KUMddibifYW4u3pzZoANG/w3RwQw5gZRpu7n
	 3v91SR1LXuw6gRcqC7qgALa/hSp/AUgprhSPrXmCtHW5cDS63DJ1TRRWqCv0/yM/YaK+m
	 LfQ0ay3pHipSoqy2Wv5AlNgfk2OmeWkXXP+iv+w4I9Ez+d7BaXRwMS3JtOF1eir1wCdIS
	 OS4xb5zd3COChyfUXODM6IgWJhlas7oqgcCx19lIOvaB5CguU51HdTeWSPq/9yl1klJhE
	 ZLW67ke/YYqdjIw6qiVvnFH5TTt8ccirdGN/q5zrDN7/ZzdE8swR5c8Inq61+tjmwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=qNy1jVqW;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563AA606A335
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563AA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=qNy1jVqW
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ea0c05c92so48004466d6.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794825412; x=1795430212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opkasNgH5N2ElWKTLtDlU79vyZanUWteaYR8uJXKCIE=;
        b=qNy1jVqW6L9/5zG4gg7sEdmDaV5qrCkIrOMT60lMGphvhx75VTvRFFRnCXrKjWR2Zv
         TBRLQ5q67oU4GX5Ux67P/OHxvbvP9xVTZsWlnyJHyASSZAToHpFGFehpZFvDNdClwGNx
         n7SfBm+L2DGwfTH9oyOf5ZdA/wdkH0XydmsRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825412; x=1795430212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opkasNgH5N2ElWKTLtDlU79vyZanUWteaYR8uJXKCIE=;
        b=i5YBGElToy4QicPCWlrV0lqwv3nCtm8NpXrDjzg8uag5iuAp88mh+mmjWBhBvi2jNg
         orTim25jujvTSm48LWCgXXtswDFAi/8Kf86ybRqgS51Kq5TFX3FsoG5IXdWTGurgOQRH
         qnirP43uev0x5oZ1YjBylXKQvv7s2e6Hfjxuz0fcdv5CVaPKm4SeazVhTsuFfO09yMfd
         6PQ5pwANo4tx/fnrehf3C29HE7k27sI0Sk6o2oM4xrMp8zy74FaQQSrUKCDHGINAGyDF
         f8a6dQJJ3mtxwrpkYwN7DeOPUXzwkrG1y3CDPqcPcAHkLwuoH84G97Vw5k8TVBC5G6yi
         3Wsw==
X-Gm-Message-State: APuU4Z/BxVIOW2QpugsDV/fja694R0pOXfiBavNnU3NX4aHkJgh7FAFZ
	/jZV0PAHhBax3acde4K9yEz29BZv4ou3dWok26KdTAHaVXkKehzfTT1VbionUp3MWBEx+QtV9QY
	FwVg=
X-Gm-Gg: AYBFou1p1/3g23V/pfjYY+0YLqiw3vkUpidVhNkJz3VxY1xQEwC5XkNSSZhh5ya53hf
	4QqGTyw6woIb1JwQzP/3juBSIvYZC4LYsrZkRByewi86P89GK1ws447VxlXCml2t50rgtxWMis7
	YEKWgtP+JwsMFgZ73No4uEcXnmr3VcBunfiVEsFB1AvctcNSj6XZ74IImNxPHrIJpMbdJhfJ7Xw
	5fk4iNo28mhNJXuT2z9qeE78ghi4mq8K5OpHb4jeFhhclnSZWHr7TYQijHjnqZ3zq2667qi/Xc5
	mw36pS1HbJXOXyN2q7/UjL1ZjldH+q1MKzF/GAPEvEZqi26WNAyO5c7SsLbCM2jr93ANaE1HgyB
	HVgEC9cCSithLfe22N8wzqC9lL6ATmHvB9S6+mgsAZUN6AbbR317jCVqa+uE66lco3fkA/OR1RT
	ujY+W78Vppq3hVrGi/nZQN4xueSAk3XHk5gzl0KBcBlLCWrkE7jGUhu6YjYeNsrwui4CqNOoLQ2
	oJGdc0LhdqgdWPQLrSe70PjaZN5g4ytVce80Tc7ve5nPO6nxYkMTIiSDd/u5Q5YCreLC35HSPlP
	r2v2gLhgYJmAfQCrZP6oxpr3DgmTPCUPO8z2dYgUB4GMkrocmRWSGKjVVDGWs5ag/o5X/4d7+PM
	=
X-Received: by 2002:a05:622a:58cd:b0:535:a5fb:67fd with SMTP id d75a77b69052e-55aca05b3aamr157894831cf.73.1794825412136;
        Mon, 16 Nov 2026 02:36:52 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm77778651cf.24.2026.11.16.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:36:51 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	bpf@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v5 2/3] net: neighbour: reinject a parked skb through a headerless output device
Date: Mon, 16 Nov 2026 05:36:42 -0500
Message-Id: <QDISC-6HS9.v5.r0.20261116052927-2@mojatatu.com>
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

The issue:
neigh_update_process_arp_queue() drains a neighbour's arp_queue and
reinjects every skb through READ_ONCE(n1->output)(n1, skb), where n1 is
the top-level neighbour re-looked-up from the skb's dst, not the neighbour
the skb was queued on. skb->dev is whatever the producer left there.
Note: skb->dev and n1->dev are not guaranteed to be equal.

When n1->dev has no header_ops, arp_constructor() and ndisc_constructor()
install neigh_direct_output(), a plain dev_queue_xmit() that transmits on
skb->dev and builds no link header. Such an output sends the skb out
whatever device skb->dev names, not out n1->dev, so a producer that
parked the skb naming a lower device has it leave without the link header
its own transmit path builds.

sch_teql is the producer that hits this: it parks the skb on the slave's
neighbour while the top-level neighbour is the master's, so skb->dev and
n1->dev differ and the reinjection has to come back through the master to
leave with a header. It names the slave on purpose, so that a parked skb
does not outlive the master it came from.

This half was split out of the sch_teql fix on review, so that the
neighbour restore carries its own commit log and its own Cc set.

The Fix:
Put skb->dev back to n1->dev before the output call when that device
builds no link header, so a headerless output transmits on the device the
neighbour belongs to, whatever the producer left in skb->dev.

A forward that steers the skb to another device, nft fwd ... neigh or
bpf_redirect_neigh() with explicit nexthop parameters, parks it with the
dst of the original route still attached. When the original route is
itself a headerless device this gate matches there and the skb goes back
out the original device, running its egress hook a second time. Those
forwards supply their own device and nexthop and do not consult the
retained dst, so dropping it at those two sites is where that is fixed;
that is a separate change to the producers.

Conditions to recreate the bug:
CONFIG_NET_SCH_TEQL=m and CONFIG_VETH=y, run as root. This is the
neighbour half of the sch_teql parked-skb fix, reached once sch_teql parks
the skb naming the slave: create a veth pair, make one end a teql slave,
give the master an address and a route, flush the slave's neighbour entry
and send one packet:

  ip link add v0 type veth peer name v0p
  ip link set v0 up;  ip link set v0p up
  tc qdisc add dev v0 root teql0
  ip link set teql0 up
  ip addr add 10.0.0.1/24 dev teql0
  ip route add 10.0.0.99/32 dev teql0
  ip neigh flush dev v0
  ping -I teql0 -c 1 10.0.0.99

The packet parks on v0's arp_queue. When the solicitation resolves,
neigh_update_process_arp_queue() reinjects it; without this change it
leaves v0 directly, with no link header, and never reaches the peer.

The window that frees the master, and the unload recipe that shows it,
are in the sch_teql patch.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/core/neighbour.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index d6e9c7c59a89..1b556fa17c57 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -1339,6 +1339,9 @@ static void neigh_update_process_arp_queue(struct neighbour *neigh)
 			if (n2)
 				n1 = n2;
 		}
+		/* headerless output transmits on skb->dev, not n1->dev */
+		if (!n1->dev->header_ops)
+			skb->dev = n1->dev;
 		READ_ONCE(n1->output)(n1, skb);
 		if (n2)
 			neigh_release(n2);
-- 
2.34.1

