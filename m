Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635941;
	b=hmzyOrYlkIbUHFviphRI/dFjcbEi0RB8RVjqbMYzwY0tGJb7WBrspjdhDOePAuyZmE5Z
	 BZqd0TEUYlGSvAvxWaTn5xqs8vSkCXPd8/JSTTlaj/4yJIiit9Wn9oL5PNDzlcjV9COcQ
	 OH/nZBvjBurCKZIBStO2hFPoyZeIl+DCpI6tGd+uHqseosIA5eIBBo/fzJBWRN7zqyq3H
	 D0nFdi76DYW/TuksOkQc1vboNbXJSCU2InO81LkUecpYlWKS3f4GGQYPGr+aQII5NjKZX
	 Klyy8UhQkIWHhGfq9zr1i/kIrh9YUDCWtxPD/At4jdCgNKmtzOOlpxzGY7zLaFmMSbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qYMiEl4prLrhTMVTCqOTVK1hbgx73L0LBDH5JakCX64=;
	b=bmMR6aGM27wZuD1EDyvkwCF6TWEpagExIfhkU10z+XhccwWIddQpyV6+fPAUSnjAsi58
	 CbgQjUsjkk7TGzeC6501XFGtjETviuyRDi2eJbJdlMQ55cpZeVwgJeCJv/E9/pxNqbMdO
	 ce61Dbtiquo7CBjz/MstFwh4ot/hegx9GCthFA0v5H3eAkY3oRgXi2YxMmxwMvs66Vtn/
	 n2M2tQDx7mz+2wdV+HSOkA13MAWP6udUah7qk0+gR761auUQG7D/B6+6MufydHUrrKw4r
	 Up34CfzGJI2EfrIDU1uD3ci4/D9NwV7YicMx3vi06b5SKB3pZxmA835+rYdFi2vY0qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=E9jKsogg;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575B1606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575B1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=E9jKsogg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3622273eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795635940; x=1796240740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYMiEl4prLrhTMVTCqOTVK1hbgx73L0LBDH5JakCX64=;
        b=E9jKsoggl5+jurP4/z2bnMDrC7/mS1yM/RrRID07bx/faTnjq06T4uaTTJewmZu/kS
         pJQxsqXk3VlgXjz4mNnMWzitOIHiofsmC+YBYroATqQnCGAG6KNkbvse4UyIzzYcI745
         F1XyBSSr7mETmmH6bxlCnHfS61MoC4+BnOs8zJ7XOBYwcGtUROcWGjnWzry9DTaUa8fO
         2RTnsZWidzHOmuxOdhHDUGUVEH5V8B1BmAdtlfDknx8TvpC1ewcSKcdantGFFcANVqm3
         px+yrY66nMjLqUB6y3xKWNrCSSbozy18YQcAHBWaa0MPg3E5yVFJVk7M+4noMrrJ3kmF
         7avQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635940; x=1796240740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYMiEl4prLrhTMVTCqOTVK1hbgx73L0LBDH5JakCX64=;
        b=W2CDZbwJ5SuhtCohinEV74ddZ2AKZ7VakkuizLk+29TJ6mg9MtJehXFr83IGs8HdJJ
         8o+o4K5rYbw4cDiYcz2mDMmtlaI10JIvHIiH5L6bOJn/AqVkGI9SOjFQ0IdrMzwMft/s
         yA1zjxPo4q1EmZ2MVYaPpcTL6oo1bKEM+c/S1pqoed8Lfmc4VXldyJeGkAcud/4tpyKk
         vTbt+lXOQuYujinvaZ9rLdl/5WlL+injMRMX3gtieW+xH9+R6XRrbiBOJc2d/qhDDDmo
         6iedmO4Fp5LblHV4vr6BR9a5fbQ3wRlgLqujWDMACoxqh2BFvnbkBiXpFmbMRvLlQH55
         xs5g==
X-Forwarded-Encrypted: i=1; AL+hErFhHP7HMkddUWcq2h3VMUGpQRG01vBvMOCTA/U0deh3yWYEv7MdGsrh4iSG/Z61/BPP4esPnBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T7Pz6Tb8R8tFwYFaxarFh2q5ygalewjobDEKAZCjUC/b2DWtK
	NHxz/ktl/li1EZuPcjVbXL55K7ifViJABn3bF7LkniRmIxCgcFhMxBPvGWe1fDzWf1I=
X-Gm-Gg: AZFdTZf++7rwqOdqOkJD/DI6JXl8zRRV8kBVmWQ4XWCe3cVojiNqMFdgYy2u6qKX0ZG
	upc+iL/WyAJJEbu/L+DTyI0QecN6VG0LkMaVWnJsGUmJ22M1JAkDLtnkM+VdHFeArqAjayeJeWQ
	6S6xwUpQ4M2cXgeK7KTbFVPiboKvlf6/kwROGMCpoMTR9P/atVXu2JoZP0AO2e6HlnYTxYMjUYP
	5LWyf2SEwCmEqT0yAFtc/TYHDeajpqnWNm4ewAIPsoe4pndY3MVF+k+Yy19RG8vTb6ckgcUxfdW
	PaZEDTW8N70+QD7D2v/Q61cY6PIPmT1ONRc3ZArPseVb+NSS7ihNQ1I+CnR46sLeQCjOUv6EjiK
	h1A7kxDaA1mFjosU6Amj2BafpNDwbffBNZc+0wwcEnIa53/Z3ND+nDjWPRoGtoPAZqa1jpbJxld
	q1lDItWj4JMe3ZdiuD205ObuFw2N/e5wpzFI6O53I3jsvI5sof9OABYdzjMAB4bEVOeGJZv3jnw
	dRxs+ShW9h3SiynsLkOtd764OWTkWoTsrqcKqXTh3fYZtGbL4JsEi1o+K6cb3W59K9gWusc+LeI
	cOJwF2jLwHziHNIY2+13AqxJn6c2R0IuTrkc8kDYGszwF/m1ox9frcO83ZGuwNPwbet+ZpWA6eV
	wzG18fnisRcORJ7uFmz0d0lNsUQ==
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr20687156eec.8.1795635940432;
        Wed, 25 Nov 2026 11:45:40 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm3737730eec.2.2026.11.25.11.45.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:45:39 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: bird@lzu.edu.cn,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	n05ec@lzu.edu.cn,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	tomapufckgml@gmail.com,
	yifanwucs@gmail.com,
	ylong030@ucr.edu,
	yuantan098@gmail.com
Subject: [PATCH 6.18.y 2/2] 8021q: delete cleared egress QoS mappings
Date: Wed, 25 Nov 2026 14:45:34 -0500
Message-ID: <20261125194534.52951-3-artem@trailofbits.com>
In-Reply-To: <20261125194534.52951-1-artem@trailofbits.com>
References: <2026050408-ideology-liftoff-aa01@gregkh>
 <20261125194534.52951-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Longxuan Yu <ylong030@ucr.edu>
Date: Mon, 20 Apr 2026 11:18:46 +0800

[ Upstream commit 7dddc74af369478ba7f9bc136d0fc1dc4570cb66 ]

vlan_dev_set_egress_priority() currently keeps cleared egress
priority mappings in the hash as tombstones. Repeated set/clear cycles
with distinct skb priorities therefore accumulate mapping nodes until
device teardown and leak memory.

Delete mappings when vlan_prio is cleared instead of keeping tombstones.
Now that the egress mapping lists are RCU protected, the node can be
unlinked safely and freed after a grace period.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@kernel.org
Reported-by: Yifan Wu <yifanwucs@gmail.com>
Reported-by: Juefei Pu <tomapufckgml@gmail.com>
Reported-by: Xin Liu <bird@lzu.edu.cn>
Co-developed-by: Yuan Tan <yuantan098@gmail.com>
Signed-off-by: Yuan Tan <yuantan098@gmail.com>
Signed-off-by: Longxuan Yu <ylong030@ucr.edu>
Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
Link: https://patch.msgid.link/ecfa6f6ce2467a42647ff4c5221238ae85b79a59.1776647968.git.yuantan098@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

[ Backport to 6.18.y: context adjusted in vlan_dev_set_egress_priority();
  6.18.y predates the kmalloc_obj() conversion. No functional change
  from upstream. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/8021q/vlan_dev.c     | 20 ++++++++++++++------
 net/8021q/vlan_netlink.c |  4 ----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index f86f6b770609..5b4ac6c127f0 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -208,26 +208,34 @@ int vlan_dev_set_egress_priority(const struct net_device *dev,
 				 u32 skb_prio, u16 vlan_prio)
 {
 	struct vlan_dev_priv *vlan = vlan_dev_priv(dev);
+	struct vlan_priority_tci_mapping __rcu **mpp;
 	struct vlan_priority_tci_mapping *mp;
 	struct vlan_priority_tci_mapping *np;
 	u32 bucket = skb_prio & 0xF;
 	u32 vlan_qos = (vlan_prio << VLAN_PRIO_SHIFT) & VLAN_PRIO_MASK;
 
 	/* See if a priority mapping exists.. */
-	mp = rtnl_dereference(vlan->egress_priority_map[bucket]);
+	mpp = &vlan->egress_priority_map[bucket];
+	mp = rtnl_dereference(*mpp);
 	while (mp) {
 		if (mp->priority == skb_prio) {
-			if (mp->vlan_qos && !vlan_qos)
+			if (!vlan_qos) {
+				rcu_assign_pointer(*mpp, rtnl_dereference(mp->next));
 				vlan->nr_egress_mappings--;
-			else if (!mp->vlan_qos && vlan_qos)
-				vlan->nr_egress_mappings++;
-			WRITE_ONCE(mp->vlan_qos, vlan_qos);
+				kfree_rcu(mp, rcu);
+			} else {
+				WRITE_ONCE(mp->vlan_qos, vlan_qos);
+			}
 			return 0;
 		}
-		mp = rtnl_dereference(mp->next);
+		mpp = &mp->next;
+		mp = rtnl_dereference(*mpp);
 	}
 
 	/* Create a new mapping then. */
+	if (!vlan_qos)
+		return 0;
+
 	np = kmalloc(sizeof(struct vlan_priority_tci_mapping), GFP_KERNEL);
 	if (!np)
 		return -ENOBUFS;
diff --git a/net/8021q/vlan_netlink.c b/net/8021q/vlan_netlink.c
index a5b16833e2ce..368d53ca7d87 100644
--- a/net/8021q/vlan_netlink.c
+++ b/net/8021q/vlan_netlink.c
@@ -263,10 +263,6 @@ static int vlan_fill_info(struct sk_buff *skb, const struct net_device *dev)
 			for (pm = rcu_dereference_rtnl(vlan->egress_priority_map[i]); pm;
 			     pm = rcu_dereference_rtnl(pm->next)) {
 				u16 vlan_qos = READ_ONCE(pm->vlan_qos);
-
-				if (!vlan_qos)
-					continue;
-
 				m.from = pm->priority;
 				m.to   = (vlan_qos >> 13) & 0x7;
 				if (nla_put(skb, IFLA_VLAN_QOS_MAPPING,
