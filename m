Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717424;
	b=IHccLpLGh76oo4zUr2ypdkGSM2L39vhg8+ZJD730rB4fP/Yp9oRvbOgQ0VMKBCIbSqvs
	 8tmGNI6HaHFmBa5UdHJeCncj6jNWjCIK/egoWmf728bAEdT0JuhWjM5SVqQKGHdzj4dNs
	 6v5lkDCfztp/iuCBwPeg7DFz3MsP+xUKeHiXhAYpoCtHAYXo9TnYbsSisnVYyw/RmoSly
	 NQYIVtBD937h4MhBVNZMMP1HTVyAToOT1S4aoY8NvGQDl6DccWzXBbrcGGnyMtQBg7uzq
	 2w/VjBX3tCGu4GItSepK+28efEn4H2mW9u8/QJWM2Ww3HlPk4phEnQtjYQN5CbIYIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
	b=C6diBW00tbj2tSq69XoBJKIAGX5+kVoH7tsXmIod72zcKchth7j/tNvr+sczRVGyrPmh
	 S0MtSI2uKc9dgIF2mj5I4VVrCT1B+HSAtNNUzNU8hkif5YzUmxnFUAtySaOdQNZL32HCA
	 cncZ98ZrnyBWlTuxhffFBm1Qp6IkFlNtzDGXdEyqUjL212YJ0dqLwanE0lUQBMZO3hqbd
	 h0c7zQwMAjvW4FsQ+vKXHvOcwKfhUS01zGxQjzypEv6WOka317YLvnqRrfexrOlNexDi1
	 Lw4oa+aC2bF0HvP+1x2004jzzSmlX/BdLwKj1G6Q6eQDKQ9Vgw7wMU/6/2RcCF0IXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkfMpqsR;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AA606A331
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkfMpqsR
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385c497bf94so6113408eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717423; x=1796322223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
        b=GkfMpqsRuNkpr8OY3eTCYkDTW1lYDxDbjJnf6vR3/D0Uir0fRy1UMbVP77reIhaip+
         ssfV+kBkxfWhfK2WwxSfsRdgXOyP6Fd1QuxhX5FpH3c8ua5QE/7kN/fYOzQs+zVwoBGC
         HRKoJKrMCvNVWhRFl7oMYN0PieZEBU0MjvepDP25WEPsN+pGt77JhSVewLTR+/RXbFHo
         18Mfe0xnFQJKfvuhgWvdwv6jPP6t1Cq2VUEOdt7FFfTQzKVNypZPS9geN7RECuY08vQg
         fOCzp50uJj8r63cI5YLExa/N8POwS/huT8R0drDO4F9LqchDZhbwsphqT6gKGkWqU7DU
         Jhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717423; x=1796322223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
        b=EHv+Md2tLE1Q5JRNC56/gpQP1Vz9tGHUlN4Tyz+AH/v/Y+SmVhaiBp82pBsysNwT+t
         rfIXNU/570gIVyiIaOjgF77Lny3ztlIzpIq8sC0SaZOqgKxb1Bir0scG4pWvzikusKUj
         jvgjbrrMt+/BoVACQUzTPTswLjk9l6GHhauYjxnewBCjrYkIpj9HIhgjdeWl6LDdx71M
         1qjkflepv+D23YhWaQ9rYxWnjvqgvL01y8iwrtA5l8hvLSKkgw2oG6IpklOI3RGeVJUY
         jRIMRPhfhle3nCX1QIk7C6hNSQjCzrr7NXf+Y6lGly63KCS4ScN+0s5oYteSO662gXhf
         tmwg==
X-Gm-Message-State: APuU4Z8N08cvmeEJYbZrlKiyX7vQzWd2kpvuoOGrwLrC/Gc9/IdTyXXl
	yIVMGFcPE/RqCO7kqaEf4umgNDvSbqyDay2srtMbv0BB5dgM1UbE4zNq5iizXUrZUNE=
X-Gm-Gg: AZFdTZeCG2m/101yBJTf7PLdNdeXDsaFmqZHr1PfD1N+9wNbT49xkJn/1sOUGXI3KK+
	3S38e/2jvQPb+Yf65drF+NuqKXCIhtVVasw8oRdVNwjyx8Ym22SGX0Ao3/JrUWX6iqm2pzI09po
	6EzrA3MkzxJu1y/+hfDcgCKrHYkLx7Y/L+RaIE/U2OF9bXb9IXjRBB1lXNivY61ZUyp2N0ThDT3
	KR/B3f+IKPuLSMEMTfdo3o/z/5h3IDuT0uLAQNExqLO0TiOVuGy6XnFCyFIqDYlKQssA0c/xxvp
	iXNW8TWTtiq7d/UY8mYemDcfxsBHEeeGJqMxYFEjba5HQRSozYmNdEWN6lyepIzEAW2LpoJt9eP
	8wHLvgOdO/JLvQNJSiJfSH6Kyi5+cAFlTNQ1z3cdwPzmGj2xdVXwshrgWcfA/NWekBkM4GIDn7r
	uv9qgPgR0mxleQXVD2chN+cHXIIcFykOOWC6wc5/Wr1oVDZjdXt6FkgRShtpxkv1ZccWLJ0cGfi
	I5bSMbhcwGWva11c+sbdbvsKcc5WOh/oLfcOVc92db3nqGUAOw0Ft4taNhjAsw39YDIFPtL9sqS
	MYcQpDWzf67rUzZE8hfnUFKj/FBL1pBtPudSKF2Jtm3eN6kQaTrmPyzccjr5bVlQW263tpH+rK7
	OPi9dkA==
X-Received: by 2002:a05:693c:80c2:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3856eb492ccmr23530067eec.16.1795717422466;
        Thu, 26 Nov 2026 10:23:42 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm11826582eec.2.2026.11.26.10.23.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 10:23:41 -0800 (PST)
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
Subject: [PATCH net v7 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Fri, 27 Nov 2026 00:23:28 +0600
Message-ID: <20261126182329.91058-2-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126182329.91058-1-ilskdw@gmail.com>
References: <20261126182329.91058-1-ilskdw@gmail.com>
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

Two CPUs can snoop the same MAC from different remotes at the same time,
and the plain stores to remote_ip and remote_ifindex can then mix, for
example a global address with the interface of a link-local one. With
the early return above, such an entry is never repaired. Update the
remote under vxlan->hash_lock, which vxlan_fdb_replace() and the other
writers of these fields hold, and check the entry again once the lock
is held.

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
 drivers/net/vxlan/vxlan_core.c | 87 +++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 18 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37..584d56d03 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1434,6 +1434,67 @@ static int vxlan_fdb_get(struct sk_buff *skb,
 	return err;
 }
 
+static bool vxlan_snoop_should_move(struct vxlan_fdb *f,
+				    const union vxlan_addr *src_ip,
+				    u32 ifindex,
+				    enum skb_drop_reason *reason)
+{
+	struct vxlan_rdst *rdst;
+
+	*reason = SKB_NOT_DROPPED_YET;
+
+	/* Don't override an fdb with nexthop with a learnt entry */
+	if (rcu_access_pointer(f->nh)) {
+		*reason = SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		return false;
+	}
+
+	rdst = first_remote_rcu(f);
+	if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
+		   (!ifindex || rdst->remote_ifindex == ifindex)))
+		return false;
+
+	/* Don't migrate static entries, drop packets */
+	if (f->state & (NUD_PERMANENT | NUD_NOARP)) {
+		*reason = SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		return false;
+	}
+
+	return true;
+}
+
+static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
+					     struct vxlan_fdb *f,
+					     const u8 *src_mac,
+					     union vxlan_addr *src_ip,
+					     u32 ifindex)
+{
+	struct vxlan_dev *vxlan = netdev_priv(dev);
+	enum skb_drop_reason reason;
+	struct vxlan_rdst *rdst;
+
+	/* The entry may have changed before the lock was taken */
+	if (hlist_unhashed(&f->fdb_node))
+		return SKB_NOT_DROPPED_YET;
+
+	if (!vxlan_snoop_should_move(f, src_ip, ifindex, &reason))
+		return reason;
+
+	rdst = first_remote_rcu(f);
+	if (net_ratelimit())
+		netdev_info(dev,
+			    "%pM migrated from %pIS to %pIS\n",
+			    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
+
+	dst_cache_reset(&rdst->dst_cache);
+	rdst->remote_ip = *src_ip;
+	rdst->remote_ifindex = ifindex;
+	rdst->offloaded = false;
+	vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
+
+	return SKB_NOT_DROPPED_YET;
+}
+
 /* Watch incoming packets to learn mapping between Ethernet address
  * and Tunnel endpoint.
  */
@@ -1459,31 +1520,21 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 
 	f = vxlan_find_mac_rcu(vxlan, cfg, src_mac, vni);
 	if (likely(f)) {
-		struct vxlan_rdst *rdst = first_remote_rcu(f);
+		enum skb_drop_reason reason;
 		unsigned long now = jiffies;
 
 		if (READ_ONCE(f->updated) != now)
 			WRITE_ONCE(f->updated, now);
 
-		/* Don't override an fdb with nexthop with a learnt entry */
-		if (rcu_access_pointer(f->nh))
-			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		if (likely(!vxlan_snoop_should_move(f, src_ip, ifindex,
+						    &reason)))
+			return reason;
 
-		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
-			   rdst->remote_ifindex == ifindex))
-			return SKB_NOT_DROPPED_YET;
-
-		/* Don't migrate static entries, drop packets */
-		if (f->state & (NUD_PERMANENT | NUD_NOARP))
-			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
-
-		if (net_ratelimit())
-			netdev_info(dev,
-				    "%pM migrated from %pIS to %pIS\n",
-				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
+		spin_lock(&vxlan->hash_lock);
+		reason = vxlan_snoop_move(dev, f, src_mac, src_ip, ifindex);
+		spin_unlock(&vxlan->hash_lock);
 
-		rdst->remote_ip = *src_ip;
-		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
+		return reason;
 	} else {
 		/* learned new entry */
 		spin_lock(&vxlan->hash_lock);
-- 
2.54.0

