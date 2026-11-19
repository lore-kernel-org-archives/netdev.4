Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092039;
	b=QmvG8J4noIBrxCEcvlfdSyx5c6I9BgTdZjXIirc7PUGyVADb7DYhbawhsY1CQ4FT8+d0
	 +87rjBzN+4xZqFJSvXyY2cfNm/re2Zr6Jl71VRy9VjX39peAeppO8wr7DXmRdBNsBKCkn
	 pMYBb77XExPeYlQhLZcIForb2eHMaVRd8CKMT8m0jIeZiiBK3nuQTHn+iOTOzgXXREyLu
	 NdcPYUb6r0Ix7+yexI4UaD0VDgEFb/GAfnIBkg5KgpkxtSPEcv814mRXNtxHjmSMdQT0R
	 TUyidfy3UIa/RVSo17HDciQeROIlQ4hbrVnd5kLMRDLqHFNRZybxl2qQwDTYLP/PpSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/HBktdhhH40COOtgFHhMziUMTJYpM/f/9inUmvkMpn0=;
	b=Y5/VxYWxzFYlw+70JES2l0ReFIuNLFkICUX95JyHtC4hzDnTaFcUTXu5IeE0VZGuT3RR
	 jEX90ki4wFtv5zGLuUWk0iZ/RfslxH6W7EqjjtuSK/lVeezhUP335EXdcNF/H811qT60O
	 8Srb1xKGxvYUVbbOR9zJVjiBggM631NZI7lINXJsCApXWXwN4eCH68z2LYGRprfqjKFtt
	 AQ66Nf3qkZjlqcrdwjbHh5TE+u9gTiYIAw5zZPyItdWu3G0+uqwLRJWaltpqajm803kpd
	 j68K24UbSI3mqLm15RAbKkhR5N3lqQVd1Ad3x+x9Iy1mcwBaCiFHRX6AhcxYJof1NJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=TG59cT47;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA833606A338
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA833606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=TG59cT47
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so20824031cf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795092037; x=1795696837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HBktdhhH40COOtgFHhMziUMTJYpM/f/9inUmvkMpn0=;
        b=TG59cT47d78F1RoC28G8m4TwPz6aL4pqdP6Eo2YIKsEOX6vagNfv3qWajo+aP3L6vL
         bJobuGx0zpMVC8S5LTj4VZvIyTLEPzCcs1u5Pn1oHPdt3yXV2H4YHlQ/lAUaBDuINIhS
         NTPjMyB8ek/ZQ2OCKgWgzvG06qpqF/XuuLApE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092037; x=1795696837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HBktdhhH40COOtgFHhMziUMTJYpM/f/9inUmvkMpn0=;
        b=WO2u+UoHN8x8DMaq1nH9uJ9jF4OCY8nzCHXUMjgj7wA32hI7W3otxlOdRui5VB1pQW
         iol7QWuk4AfefmMs3jXoJAhIzq3SmnETQlqC+RLSMhESSOe56HByal0XkchmErQsKJYw
         UI186/KVKo9jD9HAzdhOBrcNUKtLGhKDe+miS0xuFuzrTk/UZNnF35nr1qszoGQsyuie
         RYKFBAJW9Tg9/Jn9pnHVpntrgb4d1xy7aB5tPu0z4VFz/8yNRGKJs+/XiBBC45W3dXP/
         3w2YRHCW7ANkm9Q23uBFsNkSUfby8KnVJ1VKBeGaboNyi4EBRGrfgi/9ENoqJ79CEEUX
         zK/g==
X-Gm-Message-State: APuU4Z90z9eU1RsYCsmnpnv3n/qdeZY8k4j8r42alenyqWMLLVpO6T0f
	mBTHXNDx//fg+eiet6Vz7mOoCfWJ71QQH+mKvl+xbGVG34d5p83WeH9semed384Mu6guCjS6IaS
	uLSs=
X-Gm-Gg: AYBFou3YBLFy1HAvPMFmhtFGN1U3Z2xaVw1Yb+5VQGCVLM5gVcpPPYlK/2xtImfvWW1
	u2hQeumCLMDYRz6DBS7guixppWNWgVDgZ6XYSV9hUlqISJciV5T4k9MmRd8H8h4wPlyTuSe04ER
	9Z93Ebn6rZxYP3xUFziLsN1g8LTB188GQuulBBYZ8ws2GX5UeWMSyISDAE1Tm93MeMPOqFT0Wjd
	7rD5qknPFDoIfFuJy+bQjAkHFfu5/I7gXN47x0ilzQpkRqHJ8BO0OX85of8l+6y47kmfWXJZ1fX
	+irXQa4JKRYsic4DMXYvQF9217kaGy3lKlFOXpZxSNhjuBfvvjMU+5tJyZ7Uvf20MHIkyz2EC9w
	LGXydbtT3JxmAZCnwvl9bEEXTKHTEI6JcwEHKmeazyaKQqQyXOItSLtSM1/uPksEiJGTAjry3xw
	p9HtdoTgZ6G6B9f5fUcDKySyXe+GFv0NqcNOFn9vHoh0U3I8RgmO2Cfk1Q3fD1eMwnJmNSYQR+L
	01pkU0oXessyGrDxpac3e2yZPKpgBnJbE3+zUok2kWuZTXpbzyOJhtp4WglyLIPDF/CoOoF9Do9
	jtbEPE0ROX7Hx4h8+3XR12LGVwZr1x6qlUbsZPERnBkeRLNFaMJFzec+lu5yMqj2LJBSWHUFcAU
	9
X-Received: by 2002:a05:622a:40b:b0:55d:37d8:5037 with SMTP id d75a77b69052e-55d5a75b268mr87571091cf.77.1795092037457;
        Thu, 19 Nov 2026 04:40:37 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b75823sm22370191cf.13.2026.11.19.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:40:36 -0800 (PST)
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
Subject: [PATCH net v6 2/3] net: neighbour: reinject a parked skb through a headerless output device
Date: Thu, 19 Nov 2026 07:40:24 -0500
Message-Id: <QDISC-6HS9.v6.r0.20261119070330-2@mojatatu.com>
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

This was split out of the sch_teql fix on review, so that the neighbour
restore carries its own commit log and its own Cc set. It is the first
half of that pair and is applied first. The behaviour it describes
exists once the second half, "net/sched: sch_teql: keep skb->dev
consistent on the arp-queue path", moves skb->dev = slave ahead of
teql_resolve(): until then the parked skb still names the master, so the
assignment is a no-op and the recipe below does not reproduce on this
patch alone. The two are taken together.

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
neighbour half of the sch_teql parked-skb fix, reached once the sch_teql
half parks the skb naming the slave: create a veth pair, make one end a
teql slave, give the master an address and a route, flush the slave's
neighbour entry and send one packet:

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
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v5 -> v6:
- the commit log names the sch_teql half this neighbour restore is
  applied before.  Considered comments from Sashiko (nipa).

 net/core/neighbour.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index ae2db3912454..d36d86cfc441 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -1342,6 +1342,9 @@ static void neigh_update_process_arp_queue(struct neighbour *neigh)
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

