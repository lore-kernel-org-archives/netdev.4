Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294539;
	b=qh8olujF1SoJX9HKK3bUzKtRW/8v7BO/ithLEZSvrGppMwx5VpBphM4J5e+RvmihYBTH
	 I0EZ+OxUAqNm032U+p/Yj2a7kKpD2IQECjbfwC8gXCzYGwGrrAWs6TQgoWJN1BlsVaK4z
	 QT8i39OKrF6oXxLVTtCi8soLSepM0y6HreJKu6ADxuLZizAOf7/VQq3GfJl6J0cPw8SKo
	 wx1DmlkdHEqPedRcDmJDjx5hULTsx5FpIpWF1pg8JxmQasZAm3AaBOVqnE0HgTOc5xiOm
	 txGUWmK9Tkf/IwwCTOOlqv5GLd7PMMN9OWmvODHBiw39YYuDHhQ7UH5YASsCCx4oKog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
	b=lJULV0854RNGAOfc5PA3sU+8ccMSyddwY+rrPcdkhze35EKRtL8HPahBfClHN1IKs72h
	 kNTwpBgNwtuV4nab6a7D/VSQkOddh81YmyfXIBsFkX2+/Z0Z//CCTb4hGjMuBBdif6N5m
	 Cl6N01DZZCWIHwAIcaSxbAN4UtymJGL1dXwgXSbWB9RSg6RDE+bxm6tAY2pUG+gG54rUH
	 nLfS1c1yTWU7C3Da5l/X/2djTZHgIOb0BseGvkEt6q/kB98nGrBbAYK8fqj3NTbAK9KJd
	 6H61AxmnMC73eRaWmjsFFyQbwSQoo2hrv94P2JFfTRb2TibaCYovsBX91nfB9EZ8UGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gXLaYwSm;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F57606A33F
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F57606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gXLaYwSm
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c515369b627so154928566b.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795294537; x=1795899337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
        b=gXLaYwSmXWTREaLwLLM+ay5C5XzlrBUYr7O0dsBnYQlVGtg+A8IMRdGMYB4owSa2J9
         UVVAaU57/dF3/dCbAFIIvr3IGJ1M2BAG1xkIpz81tvwl3jLcAVsLMhNk0iiKCMU4G2a3
         /ooENIhc/pje28/aDXUyaWCcGpAg257tZU7I3mQ705yYKKCc7G+KY5KBTaAZgKwMEl+n
         MRy9eRpsciitgZe1pHcrhWd/ZMjkjwahO3BFlPdEvrBacI1rj9xZQPxmJdkUEQdBsS/u
         ck49jXQJf6KeIhs07ptbT0/e2gZ3CF9LjYV/M1PlsYW6q/vPRynqtBmVp1ocdGOyT8jy
         WWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294537; x=1795899337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
        b=ekIb1eFuLRg7wrj2kMzarGFaHHJ4Eu9aIudbKBSpdbfG1THKzBfNus+4P3Gr3jc1Dw
         Z0tDNIvg+u2mnhptZpPqEahYNw+5eEYPbV72HGk9LcgajVb3zCBX0U0E30/OMDF5mxbc
         H7XgBV93g40DS86Gn/cKxUywIStRX2C+QZEcyLq0hWLxNIU3RXMm+vhfx0VhUwCUL2Lv
         QHDqf2QVj+vlCnci3w5cYoWFyotsWyTBn6ifmNhm/CVgU1OH5kFFNbZfnrj1n6kPNuLe
         i5p+iiD6vVGF2wbUw2jj8mhdRmWh2lO8ienWpyUo8UTjZZtZllUnwsVQdiMGMhNHokWj
         g5og==
X-Forwarded-Encrypted: i=1; AL+hErEcJnltk+P5u7Zve3HUeSvYw8nzHdmbH5sc+W5EkO6Eum1+giKAoW013Lay+GhK9frkjUw4Jwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z97ASDiMqT5HWWQG76ODNh1UKmcizhKi41i/biiVmIwTB/p/LGJ
	iubPfwEo3OzFXtaKe1zTnB4trzN7IPFg4WNitis8OAs7yM8vzh3nI/EgruTTZBSfOQ==
X-Gm-Gg: AZFdTZcYiPyijp1o2eAwhgJRSNtxTK7TylyqizTIMOU3uSr+3Zz/faQSHZSdRv/Hiu9
	dPpYoGbFUX9S4NW7nteLugFq+YvACCUr9iJnupqPaBlo2o8ZqTb89BbzybH+ij8NSNDX4bWmJ2H
	shJ42qOFfSpfTvbVCmPE0qxM3n4dSLHKyIw5ua4W5x4OFUBvB4Vg7iNGO9KcRz3yC/iE6ZzBRx2
	fEQsE6XfeFZYB2Ed82p/6zIB6jUGtTfZlVFWIEaVHAdPAOWBQGKnWJ0VvAhVh8k99pIFOChWt/d
	gajbUHg9Ldo/a0QnOuIZXZb1ZDkPhD3Ldt5Q4lExzah335fhJm2FOEW0MYmBhOQMb394tBD0W4U
	i7rcfmMR6n3O1R2NVArXyd7dScgHmPMQwtWQ+tdrxvaXN0ZOqO0ckjTRjkvUOTjhzMSuCZQraBS
	QV1yXpmIpDcYRrKTHjEvVpK4mvLWj3eHTDhnn8FVkWN/v/1CNJKYSNAq40Bt/3pnn9REtQfo9FD
	kmHRDwYWOdYK3GhbgVKRohyCpvb/Q/SSmzd6+rgTtXdIIsojJgD+Kycrir4+nP4PAKHTpFiEGMA
	r8lokK6qcSM8WMJ3aK4cyqg5pZUgg32KeVl0UR7pZXwWUT7gSp6+5CttCtQIKxgNtro1KsAosGu
	GrrWddKFtzimkvvogn8fxVHGigEaCx0YnJzthkTnKpapMMX/LBaS4/Op4raHSJCqqZglvhAxip9
	QCcQ4qDb0NlNc9M6mn3XrUXGFINcW9C9g3pxrLVA6Fs10pFDIrKEt284ZPU//FHNkPRk8xbjP80
	0fkJhH3BUApwqlD05O0GJD+3uoQPc20u1JRxm7xUELtvzCHBR/DAKnx2P2ZK4CduVfRD7/qQZ+w
	KFp+f0BnbtBgU1BUJ7jTTS5hWYnDFm26ahv0wkA2fk4M2RRG9uIeL+M=
X-Received: by 2002:a17:906:f8cf:b0:c50:bf14:8ec1 with SMTP id a640c23a62f3a-c513ab4d93emr437004166b.33.1795294536714;
        Sat, 21 Nov 2026 12:55:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm237136666b.33.2026.11.21.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:55:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v11 1/3] net: bridge: fill a forward path only to a port that forwards
Date: Sat, 21 Nov 2026 21:55:33 +0100
Message-ID: <20261121205535.1888592-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121205535.1888592-1-julius@bairaktaris.de>
References: <20261121205535.1888592-1-julius@bairaktaris.de>
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

br_fill_forward_path() resolves the destination port from the fdb and
checks only that the vlan exists on it. A port in STP blocking, learning
or disabled state, or an MST vlan that is not forwarding on it, still
gets a path, so the flowtable transmits straight to a port the bridge
itself does not deliver to (should_deliver()).

Add br_port_forwards(), the port and vlan part of should_deliver(), and
fill a path only to a port it accepts.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v11: no changes
v10: https://lore.kernel.org/netfilter-devel/20261115005555.645727-2-julius@bairaktaris.de/

 net/bridge/br_device.c  |  2 +-
 net/bridge/br_forward.c | 19 +++++++++++++++++++
 net/bridge/br_private.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 0a1ce9e59a4d..f5860e88dbe9 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -402,7 +402,7 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 		return -1;
 
 	dst = br_fdb_dst_port(f);
-	if (!dst)
+	if (!dst || !br_port_forwards(dst, path->bridge.vlan_id))
 		return -1;
 
 	if (br_vlan_fill_forward_path_mode(br, dst, path))
diff --git a/net/bridge/br_forward.c b/net/bridge/br_forward.c
index 54365c6104b5..9dbe9c949558 100644
--- a/net/bridge/br_forward.c
+++ b/net/bridge/br_forward.c
@@ -31,6 +31,25 @@ static bool should_deliver_vlan(const struct br_fwd_dst *fwd,
 	return br_allowed_egress(nbp_vlan_group_rcu(fwd->port), skb);
 }
 
+/* Called under RCU. Whether @p forwards a frame in @vid, 0 without vlan
+ * filtering, as should_deliver() decides for a frame filtered at input.
+ */
+bool br_port_forwards(const struct net_bridge_port *p, u16 vid)
+{
+	struct net_bridge_vlan *v;
+
+	if (!br_mst_is_enabled(p) && p->state != BR_STATE_FORWARDING)
+		return false;
+
+	if (!br_opt_get(p->br, BROPT_VLAN_ENABLED))
+		return !vid;
+
+	v = br_vlan_find(nbp_vlan_group_rcu(p), vid);
+
+	return v && br_vlan_should_use(v) &&
+	       br_vlan_state_allowed(br_vlan_get_state(v), false);
+}
+
 /* Don't forward packets to originating port or forwarding disabled */
 static __always_inline bool should_deliver(const struct br_fwd_dst *fwd,
 					   const struct sk_buff *skb)
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 014d0b8db8c7..2c73d2549eae 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1048,6 +1048,7 @@ int br_dev_queue_push_xmit(struct net *net, struct sock *sk, struct sk_buff *skb
 void br_forward(struct net_bridge_dst dst, struct sk_buff *skb,
 		bool local_rcv, bool local_orig);
 int br_forward_finish(struct net *net, struct sock *sk, struct sk_buff *skb);
+bool br_port_forwards(const struct net_bridge_port *p, u16 vid);
 void br_flood(struct net_bridge *br, struct net_bridge_vlan *v,
 	      struct sk_buff *skb, enum br_pkt_type pkt_type,
 	      bool local_rcv, bool local_orig);
-- 
2.53.0

