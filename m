Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715587;
	b=Bz3rVrFRPFE04zJ1hkJa+OzBCZ/InxjFK8jqgyNvlL9HMtI2JwlM/IsEco9nqRcaU0Ef
	 vw+T5j5W//JtHayKOfpDAS/XpZOCpfbe917/VIibih7eKYCNjKHlBfsCIR+1U7F7nGpTv
	 Bhtb2t+hsYHawPRYeIxMTay8AYQzch11/b2QzcRFONCZDJgidLfP/ZLNlgNeLrR4WCxvE
	 BqD/9pKj4IF+fMiaXxbkDWJ7eGgcy8gexN8xWNvDKoldjR7BuHjapweetbVo1K+K2WmWF
	 VJeCevftQiBewIe3elVor+45pjlRpRily058xL9e3kpfGGufpLq/8t6D1NXlbUt9KuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
	b=vVrtaZn+/jFbHm0KfkCS8JwW2Cl0ki+Wc/KSFDNVb4k7TKwoc5sMekxwyzQbghbay0ee
	 GA6tIPdprU8S6bm4X8LYAp6JsmxPiClvUJ+DqiKepMdWVftx519U3sJ+jPjFFo4LuZVYM
	 ZChj8ExSmBOz04rrJHxZZptEuX6C50rizXVppZ+Gpxqj6txyZ7ATZklznFGnhf4zS+UZF
	 yXQj0KqYW11HJD6A4Nia2n7T7lSwyh5UR440YFD2q3aPRbX/wK2nJAgsRjOcgKNuDkZIn
	 911XcQ9ukNBo9U1rQwIlC/0K3RmfncLfKrPsrGy+3KtXu1J05mYspCUjxCb6jQwdvOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at7PFRq1;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F7606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329F7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at7PFRq1
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1090003a12.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715585; x=1795320385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
        b=at7PFRq10eTsdOt9uitGaczbNBTm1VR+fitPN/ymHwOw1TEmTAcr+X0ArQU6H+VWWL
         uatUjAkMDUx0ORSw/1s9cxRvWXIXeGcIWAGU83rZPLXPfDo+bkY6cU8a8wth5DhHlqpH
         4F+d3biIsVtdV3ii0lHfFTG+mhjmdlEvy9tCT0FzzUNb2zrNWd3IHCoLlSj/9lJP33aD
         0Dkgm8srah7mn5YOo+Z8E89/Ws8MQ1EZiEFi/KoFSIAFhBNxNyo5gNWyrZs0AZJjN7zC
         myrRVAndu7rlCFrynDAlYtg/tPgU5hU1PXjMz7ju5qcoV9ptDwEN6ld459M5W1l/G0dx
         nLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715585; x=1795320385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
        b=wHRV+zBMtNEb7DEjXVu4KGUBPrAqVFfmYmjWWJBetW3cmcYH0H/SDIsPotpwR0TPD1
         rXe2bMy7YYu0BVCtXqDgNxeYsEV0O8W3lpPHXtCJ3FHmXJbBQXCo5+dy8KZrj8ccELUt
         IgFTFn7DfDhwBXpMNxSVYoBjleMQgnAIFFU6Tf4r6L91y9mnNE5dNVS7MXK/PrE0SmcH
         kgb4H2YuQxlrx4bz3LMu/bEsvRjKyTSsLAoJRq4ttWrb5k2bOke1KqAg/x2j+sUuF5Te
         hbqvsYhD2ysvx7Bcir9DypHwjvyJ3rgwX2md8byZBedC1sAhwoD/2xDs8KzCK5kMl3Lj
         mtoA==
X-Gm-Message-State: APuU4Z+W8O4YsZBGQT7TQ/dO4yXzP9QPIAlur1I32fb6WFcHtnuqZqEN
	I/02Dfopl8JUjBfxZKlE1j/m4tDf4gRBJSdeBc8bRSZlFk9jrKmnO279eH2hkj6N/PE=
X-Gm-Gg: AYBFou2Q9zs7Bd3ZJ8LnD2rlBR8cO4Gx8rDCxQTO/YSYEcjq0BKcNU5HVQ8GRRNmX4h
	4B0kY+gDEZPibgOWN9yE5VzM1M/6Gu13yJokV7ydiJaTCCCt0eyT/L+cFlHJqA/zd3by2EVYazf
	RfdKEVZLSK81hXRZdCCXfDK+EiwcLFulBqHBZb0JGKl4146OzMcwTNKp+5KkBVxbhMv9EtG5wOs
	zjD9LIXDObEQ6xel1CxMqQmBWtN5btHZOkNksWgIWKRP26vQjh9w1owhMaeNtJy6W1ttSoxuLff
	L6J4aII0MfJG0t0XR6QWQ3/h1SkLSAP9VuH3UnddkEnz+wbJRwJGn6Ph3iQdTYH1NPp5T7di58G
	ACGuXpNbjzjk59sl16oivCYIYNxhRNeikVPdC01pOM3ddvxegpFsJxZcjWrBCMock8cyQ7Z+SFc
	VJdZL3STYXIEzJFRKs3caJhwmwIYOvuCVoxvy2vAfEOC6MHw/ATBbuTn9q31b+KxF//qu6OH8ra
	hfjb8Ew5P2FEpXXeZXlm426p/Z+eHg3HAWD/PGQFvgzBPrr4fMF2+aVSGsmvhi2vhUlgOebr4Bz
	oiSorX+V/oN6g4zUO6S37nSQdn5qK2PpCz3P+4cUHKtRmttFljohtCEiUe5kEGbUdFWBii9MEp2
	uatY=
X-Received: by 2002:a05:6a20:2584:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3f7a51b3164mr6894533637.10.1794715585250;
        Sat, 14 Nov 2026 20:06:25 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm2485668b3a.10.2026.11.14.20.06.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:23 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v5 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sun, 15 Nov 2026 12:06:08 +0800
Message-ID: <20261115040609.61134-2-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115040609.61134-1-ilskdw@gmail.com>
References: <20261115040609.61134-1-ilskdw@gmail.com>
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

vxlan_snoop() handles a known MAC that now arrives from another remote
by rewriting the remote's IP address in place. It leaves the remote's
dst_cache alone, so the next packet to that MAC is routed with the dst
cached for the previous remote. When the two remotes have different
next hops, the packet leaves the wrong way. For example, if the
previous remote was on-link and the new one is behind a router, the
device resolves the new remote's address on the local link, the
neighbour stays incomplete, and traffic to the MAC is blackholed until
the cached route is invalidated, such as by "ip route flush cache".

The same branch also leaves remote_ifindex unchanged, although the
early return compares it and vxlan_xmit_one() uses it as the output
interface. When a MAC moves between an IPv6 link-local and another
address, the remote keeps the previous interface, and every later
packet from that remote enters the migration branch again.

vxlan_fdb_replace(), which makes the same change through netlink,
already resets the cache, updates remote_ifindex and clears offloaded.
Do the same when snooping.

vxlan_snoop() knows the interface only for IPv6 link-local sources and
uses 0 for all others, but the early return compares remote_ifindex for
every source. A packet from the remote of a dynamic entry that was
added with a "via" device therefore enters the migration branch as
well, which would now reset the device to 0. Compare remote_ifindex
only for link-local sources.

The selftest added in the next patch moves a MAC from an on-link IPv4
remote to one behind a router, and from a global IPv6 remote to a
link-local one. Both cases fail without this patch and pass with it.
A third case checks that the "via" device of a dynamic entry stays set
when its remote sends traffic.

This was found by our AI-driven automated live migration tests. The fix
and this changelog were written with the help of an AI coding assistant.

Fixes: 0c1d70af924b ("net: use dst_cache for vxlan device")
Fixes: 87613de95041 ("vxlan: fix snooping for link-local IPv6 addresses")
Signed-off-by: Zhefu Peng <ilskdw@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37..1cfb34fa2 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1470,7 +1470,7 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
 
 		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
-			   rdst->remote_ifindex == ifindex))
+			   (!ifindex || rdst->remote_ifindex == ifindex)))
 			return SKB_NOT_DROPPED_YET;
 
 		/* Don't migrate static entries, drop packets */
@@ -1482,7 +1482,10 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 				    "%pM migrated from %pIS to %pIS\n",
 				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
 
+		dst_cache_reset(&rdst->dst_cache);
 		rdst->remote_ip = *src_ip;
+		rdst->remote_ifindex = ifindex;
+		rdst->offloaded = false;
 		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
 	} else {
 		/* learned new entry */
-- 
2.54.0

