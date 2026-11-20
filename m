Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189394;
	b=nuf1NKX8zYrVQdBHKgwmZXmEUshIq378CQb+DPSsXFEhCtAWNODqNoZn2QEpFOwz3glh
	 j7iQMxAdqPB5biIkO0sUsG1hQIaZPBcnwWIUGeB7hV8PW9dFvMqSru3qeRkeTxkvDbCFC
	 GpmuiwDNnRTVQCT0QnTiJ852udsbgMWc9lLngVIWCgMv2547RyPe0slDlOpYb9DvyUxCP
	 +Ao6qr+1I1erVE5L2Efbzo6iE7IJyOuvAuMQvnAw5MSRElC2cq2RKVwsQtBsvK/yZUyvT
	 5vHW1TBPSeTJlogrAtzR6XqqKU+Ps5I7wLv8/s4CE7xxFXcpRKGm3/Ixlk8ARzERr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DaLfAeXgRE1oRE+vSokADhq/gV2tFW1OuyRH26+hvIU=;
	b=GMMLvSY9zUTCxiE1571sBSZefe8WEbF/msjZDwjmOoZ1LWZycGo7LmI/IjJBcBuYCYCV
	 OsnMNwe1S7NY4IZ6toqIcMfaNv2gbkOO5Lsbso2g1oMr3HRgFNNleJ2aPURTT2dCVECBa
	 rw/132qeI0N0dAqW1JawsEpJb3jkO+hPTrKCnu17hlvf21tlkIFiYmYMFAMddn4bJTn0h
	 3BtfiEmT9LsbbvroMvgNDR8jDLN7fXaRym13FyrLtkGlEzmo7YU80LhZsGC4KDEBfRC40
	 iaIt55f15ZS+pfahVHl6WqGMRf00frMPYx4gpb5GZDEhOuQ0nNHkZ5+DJfXdT9AybeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=W6XQi2J3;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F1606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D73F1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=W6XQi2J3
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5363316fa0cso14452371cf.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795189393; x=1795794193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaLfAeXgRE1oRE+vSokADhq/gV2tFW1OuyRH26+hvIU=;
        b=W6XQi2J3So9PWrR3p/SjUq34lOOkZdWEJTXtAhYZ/t3jTUlYPd9PZ41ffzWsxjAAeJ
         RoNxcuOsufqJwLGfsU9QbPw0D9rjKCvD9uYukrGzz90uWO291ztuTiWKqwqLKnB+I87q
         PJcv3U9+YWFzTGOhydiETrHsDFLNIWtQ7HrtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189393; x=1795794193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaLfAeXgRE1oRE+vSokADhq/gV2tFW1OuyRH26+hvIU=;
        b=kpBTxO30uRmSZYs/XBI/UlWVFONCMrzIFkLAh4RC1oTdRmmML6J6LMQp50x8X4oUL6
         F7OmqY9nhlUMQemO+OnzhkBE15mVv+Rtb584u4C+Avh/kQUAWXaMlF65ZWr9WXpTOQKN
         VRDrBTDW6xsyCMD4fOTq5owg8BdUqXuWnvvVAFcwkqRVkjupcyUDQ+skRGcBt1JkCbUR
         GtUu88HI3/DlMZhVbmsVWjmZFdOYvu4+Mqz9T5lZ3cVvWPY9FQy/+PJRq2XJwhGxfc2A
         hz4xTdoTuy32mWVSK/M/U69qR6pf2XIzHE973bHB9TqvCmFA90j/Euf0ecRQ2JT+5wA/
         J9Og==
X-Gm-Message-State: APuU4Z+Z4NBBNCSFpnoPLaZFXxw4Bi41IWusaFzJTEPEChx8rE3mOqar
	2J7ic7PL9KPIIVYk+8w+c12trTGRQ16pvwMnq7jbqnAerF6AP4gykIBgWLbAHKZIhTxC2Yhtd/b
	Zl+I=
X-Gm-Gg: AZFdTZdOmx5LgLP4bgOAoES8LqEMs3ubMXqzE+8T9XiHhm2mzDjwMdY8tjNIGGXFCll
	y5DSgH3MPv+9eHlcmXqQlW/GgeMtXm4tNpDuXg/6Ql0plS1p4EFK8KJNM9vLuUR2zMWY0nIO0xd
	SJuf4XxCeLkmmWsq5cFmDB0+5NfTAglYPbyndxo+dTyKDH+fovUtm+/2MseR2g3KL3VPcyA1WDR
	tPl3IGWwE/O4K9YiKIdz1ily+fXVrCNhcBWsjTgmoLOF5SbGhglxzcPZ1onOZLDJm5lZ/igNTZU
	goiJK7hJJK2bY2o33d9k6v4KF6DODHUD18+F/1HcrIWFUDHI8t84uOCNcG7omLH4XTrm88cmXdT
	bDBiVBJ8pRL+yCGI78z8E80LW45+owqczh/G88NbFSiXYiZoO5nC7RBNyHirSdI6bOrA3srsuS5
	UP0Vt/lIoWfjW2gmTIssFBKE8GRh4R2MDDvzKRBvAWaHrbH3obxNic1I8tMQQ6oZHFelkRXB2zT
	zMePFPuHDcGIu23Lt+hpu+wa/mLxezoakJwzPwxBtLBbc/06uGujLpALaZxGJ1tTVRVUtTM/+eX
	yWDIwmrQBazWMvsHelT5ER8EJQW4vKgtg4Vwwo9xykPqdeTn283gvVWs8qpR+fk8t/zOvApoHa2
	wu2uB
X-Received: by 2002:a05:622a:4014:b0:535:a5fb:6459 with SMTP id d75a77b69052e-55d76a97e34mr61051721cf.68.1795189392660;
        Fri, 20 Nov 2026 07:43:12 -0800 (PST)
Received: from majuu.waya ([184.147.180.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78451407sm25429451cf.2.2026.11.20.07.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:43:11 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>
Subject: [PATCH net-next 0/1] net: neighbour: skip the stale dst lookup for a redirected skb
Date: Fri, 20 Nov 2026 10:42:58 -0500
Message-Id: <CORE-J9UK.v1.r0.20261120103344@mojatatu.com>
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

This replaces the four-patch series posted as [PATCH net-next v4 0/4]
"net: drop the stale dst when steering to another device":

https://lore.kernel.org/netdev/CORE-9NOG.v4.r0.20261116135311@mojatatu.com/

Patches 2/4, 3/4 and 4/4 are withdrawn, and 1/4 is split out into a
separate posting against net:

  * 2/4, 3/4 and 4/4 dropped the stale dst at each producer that steers a
    packet to another device. Alexei Starovoitov pointed out that a route
    for one device is a normal thing to find on a frame that leaves
    another one, and that the xfrm, tunnel and lwtstate consumers further
    down still need it, so they are gone.

  * 1/4 is a regression of the xfrm interface helper, so it goes to net
    on its own.

What is left is the drain guard Alexei proposed in his review of v4:

https://lore.kernel.org/netdev/DMX7RM93TMGR.AXFN4YJ55REF@gmail.com/

It is adopted as written: neigh_update_process_arp_queue() skips the
re-lookup of the neighbour from the skb's dst when skb->dev is already
neigh->dev. The parking neighbour is the top-level one in that case and
can reinject the frame itself; a dst that is a route via another device,
which is the sch_teql shape, still takes the lookup.


Jamal Hadi Salim (1):
  net: neighbour: skip the stale dst lookup for a redirected skb

 net/core/neighbour.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0

