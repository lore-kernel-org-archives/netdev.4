Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429724;
	b=vaUBMpCdpFI7XEIKQrKr3YLslcfZLnTgIHh3IOyf0Xh18xc21brwtKKpxVxC2LsUhNi9
	 rtFZ44pOKE17iGu5WlgSI5QAQwizO/vtOxol0DkjeY4fzsS5BRay6go9XAZPUeTUIbRLM
	 U09vCpbCnx+qMijhOelJg1aQnzUN25n1E5dtPV+0QxVmKAW290JATrPSdvIMfvTny1dYH
	 AIrHZrJRcPQIl0MsJ2aR4BV8fDOt8v9HFvpilmINUKohnDA6ZyckK9V0FuEs5eMPOTBjs
	 5qIgMzC6qGFWrTF9Jb/H3fzdnCTHZaP+s2FeDRKqBNZ3NNAtIrCiY8MoiBFis7HSDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0A1TT+t5OqeLZ073EDE6jPbaRu8g2jN0d8R7gHtkTVQ=;
	b=CXC1p1Aw9kt+3Ay43Tiymv4y6Ke4bOC0SAVyFIH20X0y6qKui0GyLGE1USBV6DKW5U5B
	 1nZzOBmHCtoYpqFfH9uZ6GlCOtzeBcbABtI8H+smQCFIknXMCI5vMY39yabbbAhgcSFqu
	 sqHq5NN5oaJk/C/H976MPTHKdeErPeoXyL0ae1/CSOtJ7lcxKBjnOe9csIY+LopnideH5
	 fz/lcIwg9mRIea8yVPyf1soTkdADxLzUYHm61vcvmNiLRl+GmgiJYr8i3e4V8D3yr4H9C
	 1p7pfJH0nwpVgtZFiZtbEAQAI+AHZK6PYj/dbK1aKPK4IB91eLKkXy4/z8PM2+nx6Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=h697C8WV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA86606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA86606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=h697C8WV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb61185057so19769205e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795429722; x=1796034522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A1TT+t5OqeLZ073EDE6jPbaRu8g2jN0d8R7gHtkTVQ=;
        b=h697C8WVYLtlWfUHat1yJ2d0fXT7iN640zusVa/Vq0htJqYu/wazn3OS6HzW5Jrq9/
         CQwdtQXSO17GYrUzKRUXgzBtSi7zhXf5OoS2ba5VffV7+Lum6dKJl+hnFnsU5MiXepgw
         MKaJ6JyZ5RxyokxgHmrhRzZUqH7vmIjl9w1cBSQu2DMvw81X3xcCTwC9ubire7NiMfTH
         k5DgshMEC3rVoSV35qJcdJGqZX/4iBXGuRhmLsx2edHlx4c63FfOeregckS6rXZMKxGA
         HEBPFONCOAv6Ksw+T28tio23EJdxAhNM35rjo0edO++GmJ9WaU1RtLqg/HSWTyv8pWgw
         7OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429722; x=1796034522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A1TT+t5OqeLZ073EDE6jPbaRu8g2jN0d8R7gHtkTVQ=;
        b=qdWcRpl+iIzagp/0ZF7ukM5sIGqAO+0Jib3cvOOuv+omoiGj+rU5fw6UvDRlft3db2
         zw74N5Ch22d5aN6td7GM4+kUlpUoL6v6RtAQ0BAuvghlfU6E7pFKFEG+waARNM3ibN1Q
         KG75hp4wh0D+LZ5evB6vvQvYNPabaESVriN7wVjsIR3FiLGyi6zVbHKETOdyP6/y2tde
         ptIZery4TacmBlM96y5WvQbHJXNNhqNHjEm6kD6ECZwSI+urfS3Wqo/Zaxy52WMvgpea
         mLU7fCnUgnBUNQg3rLsWJMCtO5iDihV2haqaJBI438OQCJ2jg+rgYU5VvoYcfn5pfWgo
         Nylg==
X-Gm-Message-State: APuU4Z8CL6DzJ+dPMr83sLw6tZEssNsw+9ZQUu9Wzl3sVw/YY7H7XZ+t
	6KdeHsckionTA2grCDxYzDWxCNhD5xXkZLdjm83vCjk2V1a9uey9+lNBeQHOnWzGwDYgwyA2R8f
	Nvt43har0/w==
X-Gm-Gg: AZFdTZe6PekggRgwqcIw/3eFDU12sOOVOAkg7AHLsyfJZcOxah0pXfqM/EqgYaEs4k+
	o28Na92+E98hZ+Wqyskxo3Zs/KGoHbXYiJ5hIYBepKLZM2s8pLlK0DnC3Sy/zfql0FfwhHm4WMZ
	1v07Vyco+st2958EB2X2emf4q5Cxzg3frdzqstTNEuIFD4KvvIh6Hr5C8UtsC508AEuAPisqvR2
	LksR3ub8JZdiH283giGfaONBqeLG01fz7YGlxdwwwzxtfOLAIdpFAU+lcVYGmCxcRqnxgO0ZM2X
	6zc3a2AxwcSa36leKJWc6eDQQjfm9IwbFHS6oX8/8Am47WxQkTHhm0M39w6Zy8DwIvZWkMuUNaI
	gYOHlPkc+qQj5IJFMv4aYwyvJo4mPMeeurReND58Q32WhV4/4GRFG2VtJRPytv49JsbtwPDpI+W
	FTsv+1E4LNXiExwCbY4WuQwbrI9+zm1HqTOsdNSdiVQj84pyUTdTuxr0wqpcxA7VNxmYQXXimna
	BoMjZS+F0YOyKW8wgoLAsQbE3aQLxWooGtGHQS6+YFKGSp7EwG+II1n4cZkqDq6Y/6ozIubO877
	2GCnn7C+Qonao/R3bXQITv0eOByokx/UXSZEf2Ix4ssD6LaBEw0=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr225278965e9.0.1795429722129;
        Mon, 23 Nov 2026 02:28:42 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm447180395e9.0.2026.11.23.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:28:41 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev
Subject: [PATCH net-next 1/3] net: bridge: avoid VLAN lookups for multicast router forwarding
Date: Mon, 23 Nov 2026 12:28:31 +0200
Message-ID: <20261123102833.924427-2-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123102833.924427-1-razor@blackwall.org>
References: <20261123102833.924427-1-razor@blackwall.org>
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

Return the multicast port context when decoding a router-list node and
pass its VLAN entry to the forwarding destination. With per-VLAN snooping,
the context already identifies the egress port VLAN, so validation and
tagging can use it directly.

A per-VLAN router context is selected through the resolved ingress VLAN.
Global router contexts have no VLAN pointer and resolve their VLAN during
egress validation.

During port VLAN deletion, a per-VLAN router context can remain on the
router list after the VLAN has been unpublished. Forwarding can therefore
still use its cached VLAN until router-list removal, whereas a fresh VLAN
lookup would reject it. This is transient forwarding during teardown,
consistent with the existing cached FDB destination behavior. RCU protects
the VLAN's lifetime, and context cleanup removes it from the router lists.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
local Sashiko review says:
 [Severity: Medium]
 Can this forward multicast through a port VLAN after it is unpublished?

 CPU0                              CPU1
 nbp_vlan_delete()
   __vlan_unpublish(vg, v)
                                   br_multicast_flood()
                                     fwd.vlan = rpmctx->vlan
                                     should_deliver_vlan()
                                     br_handle_vlan()
                                       <-- forwards on removed VLAN
   br_multicast_port_ctx_deinit(...)

 Nik: this is already documented, it can forward for a short-while until
      ctx_deinit is called which is fine

CC: Ido Schimmel <idosch@nvidia.com>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: bridge@lists.linux.dev

 net/bridge/br_forward.c |  5 ++++-
 net/bridge/br_private.h | 19 +++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/net/bridge/br_forward.c b/net/bridge/br_forward.c
index 54365c6104b5..b725e8f1b29a 100644
--- a/net/bridge/br_forward.c
+++ b/net/bridge/br_forward.c
@@ -412,10 +412,12 @@ void br_multicast_flood(struct net_bridge_mdb_entry *mdst,
 
 	while (p || rp) {
 		struct net_bridge_port *port, *lport, *rport;
+		struct net_bridge_mcast_port *rpmctx;
 		struct br_fwd_dst fwd = {};
 
 		lport = p ? p->key.port : NULL;
-		rport = br_multicast_rport_from_node_skb(rp, skb);
+		rpmctx = br_multicast_rport_ctx_from_node_skb(rp, skb);
+		rport = rpmctx ? rpmctx->port : NULL;
 
 		if ((unsigned long)lport > (unsigned long)rport) {
 			port = lport;
@@ -432,6 +434,7 @@ void br_multicast_flood(struct net_bridge_mdb_entry *mdst,
 				goto delivered;
 		} else {
 			port = rport;
+			fwd.vlan = rpmctx->vlan;
 		}
 
 		fwd.port = port;
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 014d0b8db8c7..20e423e22132 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1244,24 +1244,15 @@ br_multicast_get_first_rport_node(struct net_bridge_mcast *brmctx,
 	return rcu_dereference(hlist_first_rcu(&brmctx->ip4_mc_router_list));
 }
 
-static inline struct net_bridge_port *
-br_multicast_rport_from_node_skb(struct hlist_node *rp, struct sk_buff *skb)
+static inline struct net_bridge_mcast_port *
+br_multicast_rport_ctx_from_node_skb(struct hlist_node *rp, struct sk_buff *skb)
 {
-	struct net_bridge_mcast_port *mctx;
-
 #if IS_ENABLED(CONFIG_IPV6)
 	if (skb->protocol == htons(ETH_P_IPV6))
-		mctx = hlist_entry_safe(rp, struct net_bridge_mcast_port,
-					ip6_rlist);
-	else
+		return hlist_entry_safe(rp, struct net_bridge_mcast_port,
+				       ip6_rlist);
 #endif
-		mctx = hlist_entry_safe(rp, struct net_bridge_mcast_port,
-					ip4_rlist);
-
-	if (mctx)
-		return mctx->port;
-	else
-		return NULL;
+	return hlist_entry_safe(rp, struct net_bridge_mcast_port, ip4_rlist);
 }
 
 static inline bool br_ip4_multicast_is_router(struct net_bridge_mcast *brmctx)
-- 
2.47.3

