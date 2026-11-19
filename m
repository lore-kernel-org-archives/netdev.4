Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081987;
	b=oVKAuIGTYG+1cHmE5Ifmtbr/1lv4D3ehq9i9FyyceqYD2vEx7PQToA82aWsBE6y36FjM
	 cw2/Kt7uCwL/+wTdwQYdHOdQdLO1FDrjlLWtzuBjAin2PZxty/hvEJ87t9i8l1tA1h04f
	 mx3RZTpK+AvExyhkzXfLjWCkHemC9ZzP8n0fdT/EKq8+tiFheYMof/CdsUKpF8Hl0Y0mk
	 WcajZcvSiAmjpr1TAIdw1qGZb+mWC+VYXB5aDhP9wOUd4FzjWPa0/lqLZXypu3o2BEFLA
	 r43U+QrjDG7ENvafaCr3x2mN+MjriS6hkzsU835ZyQVjejU/t1NttEKIesWPAOOYDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7TwuXd1N6O0YZu83iCTlrXxdB6FRZa6SxiwykmOOhUI=;
	b=ZT4mwV0fjMtmfYxbT16ADKdx7ioRHv4MLiX6K3PK6AxfS0lxrP9RScAiUWaxSqS3z9rr
	 rL96aTbWiKwENEAgAc2fi6DCxOoqp46mQWHkZt85OafMJGGQP34rjnfw+JKNTdQKLFDnV
	 pnE+mQZPK1UnPXU//rhfuPoW67prIkkPCwAPwqKL2io9bxo+SZ/chwLVFpFVb3bTrjf2k
	 U3L440HJZbrALYz7rgeZiWR6qOLIjMnw6HkOf8hdhoT8iZ4uAIcnTPqDDzcnzP81mOmOi
	 nOayRH40HlzeNMFE4n/ISoCNSLMhNHqK9TsziGBMPYMcYz1c3GY+BFVgmG0iLWJxdww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNhGTbqL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA4606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACA4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNhGTbqL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18818daa3e7so300810c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081986; x=1795686786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TwuXd1N6O0YZu83iCTlrXxdB6FRZa6SxiwykmOOhUI=;
        b=QNhGTbqLw3Lg+ow9t6MkqiXyW7z1X+nWgaSRSpHoU/Tt6iurJDZ2rMAL6LMFFagOBC
         F9CX3OuSl+7HvICJ0L2pD+kl9mNcGNS7tPHPlCwOqQjJjLj57gw9IevfKAMPRAUB+t11
         O8cUxPD2G/4Tx9ZfOvtcEbMUhktdes0ILvhsQ+Ns/i1qVq1HnuJwenMh80Aa0SWH/aSr
         2+t2YcwdJQDlYVY2t4mE/NmdJWG6gJk919IJw7U3UYLM9Z9pNUAoIPy8Yw6pUlRAWjLv
         TWcN/fAp0Xe8gNduZCTf84iiqJHnvv2x/UH4hgqzAjnYsR9iDP8co7wZhg6vFvIy4rSS
         cgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081986; x=1795686786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TwuXd1N6O0YZu83iCTlrXxdB6FRZa6SxiwykmOOhUI=;
        b=ksoJPw7HHul1CmH5TsMDhOZABPQj+KnWiKFncAqFQe5OjOzKeAXj+YmZtKML9FkIB8
         PS2mNHHgdkwP2vm+HaHaLa2jCTd7ZGA4DIgxsaB5JvAX2YvoahHXQpasrqIJ9skQWC7g
         LzL+Xe2MQj8i61lpeQDszEmt3b9TYEDmNIggfkOHuJyN3MvaE1PpjKMpZqCCalqQvN03
         GExgnVzn+qnFSgegcRAFofiOOnfgKP/AEpOoeXWN3r+O13/1KpghldO9l2d4io7qzM13
         EwN7bJTBue4Y+nUdMn1PjXrfEszhnq3L0FOndkLmP1lvZOMLJvldCznp91MZydwV2ii1
         DCDA==
X-Gm-Message-State: APuU4Z9qyulyLjPxPs19TYWisE+rBaHoOagAgk5WVwzzjEnVEOG95xj6
	YCaypdBwX/Ldn8Gmxi+FTiMdFDqs/0EP4+oXR85iCKzhCSDUbqP/9is+3YyrfI12
X-Gm-Gg: AYBFou0EgsmU+lVF2NiHi/d2v8BlGBvDaxC8YEZlmDMq6tf8SYcblGY8TKFukIjCnI6
	RKjWnyZpDFp4x6Ssq9q04mNc+IFb+3j91gac66lOn9N1dq1oT1DtMFaTqOplgDm5utfEEbyLY0b
	dW7Oka9dxljaC4I9GQKvW+pNi3LZ9cm7lIWuvkPGpWGZO6iyNMhcpyk2d9VQ88LD59CZMHQuTRj
	Vpz28Vj2hpfm93z8qXFoexCwfZpM2B5TJQW0JPY8LbIvFJvob/XMsfyPzSIA7dLnRt5ve1tCXfe
	4slHlObcTSWLI4GEwExBmTzD+YdPCHSxymk+pfHedqG0DxIq+6wFRrekQ3Ma+jvokTYPCYzg0Qg
	xDXnwjwmQMYDpZDXbcHCxu1k1S0bE5Kn/ByR9M0y6ac+hdI9EyfZF3Oh1LCvqXveOFwPUJxO1Nv
	f4koWXvqEihcpoyIeUK+BNoGYzKvA6ck+lwaIBoQi7FU6PWBBMluSXENoFKfw2CDglk7SPQZlsJ
	0t5tSFarFPeAqQOQxLHRYCLb+/mTind/932zCZ0E49hl4ZkH+PUOmwhut8E1sWSgSSZUmZnGJf5
	7j55CljcN/OeaUgJqoe3iPffmzOJKKrWijqzBLBCOqgRh6x/5cYHsQrwqX84dWS31JdE8DaXsak
	cYSxZsYtJOegEblZdEpfFU+yDrg==
X-Received: by 2002:a05:701b:2704:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b5525eed02mr429077c88.19.1795081986088;
        Thu, 19 Nov 2026 01:53:06 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm12862850c88.6.2026.11.19.01.53.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:53:05 -0800 (PST)
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
Subject: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Thu, 19 Nov 2026 17:52:55 +0800
Message-ID: <20261119095256.42005-2-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119095256.42005-1-ilskdw@gmail.com>
References: <20261119095256.42005-1-ilskdw@gmail.com>
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
 drivers/net/vxlan/vxlan_core.c | 59 +++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37..8738be39e 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1434,6 +1434,51 @@ static int vxlan_fdb_get(struct sk_buff *skb,
 	return err;
 }
 
+static bool vxlan_snoop_same_remote(const struct vxlan_rdst *rdst,
+				    const union vxlan_addr *src_ip,
+				    u32 ifindex)
+{
+	return vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
+	       (!ifindex || rdst->remote_ifindex == ifindex);
+}
+
+static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
+					     struct vxlan_fdb *f,
+					     const u8 *src_mac,
+					     union vxlan_addr *src_ip,
+					     u32 ifindex)
+{
+	struct vxlan_dev *vxlan = netdev_priv(dev);
+	struct vxlan_rdst *rdst;
+
+	lockdep_assert_held(&vxlan->hash_lock);
+
+	/* The entry may have changed before the lock was taken */
+	if (hlist_unhashed(&f->fdb_node))
+		return SKB_NOT_DROPPED_YET;
+
+	if (rcu_access_pointer(f->nh) ||
+	    (f->state & (NUD_PERMANENT | NUD_NOARP)))
+		return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+
+	rdst = first_remote_rcu(f);
+	if (vxlan_snoop_same_remote(rdst, src_ip, ifindex))
+		return SKB_NOT_DROPPED_YET;
+
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
@@ -1461,6 +1506,7 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 	if (likely(f)) {
 		struct vxlan_rdst *rdst = first_remote_rcu(f);
 		unsigned long now = jiffies;
+		enum skb_drop_reason reason;
 
 		if (READ_ONCE(f->updated) != now)
 			WRITE_ONCE(f->updated, now);
@@ -1469,21 +1515,18 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 		if (rcu_access_pointer(f->nh))
 			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
 
-		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
-			   rdst->remote_ifindex == ifindex))
+		if (likely(vxlan_snoop_same_remote(rdst, src_ip, ifindex)))
 			return SKB_NOT_DROPPED_YET;
 
 		/* Don't migrate static entries, drop packets */
 		if (f->state & (NUD_PERMANENT | NUD_NOARP))
 			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
 
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

