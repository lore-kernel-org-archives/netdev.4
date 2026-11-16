Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855712;
	b=CTpEZ5T8Y7opcnX36Xd4Q7dP7TrOOxE1XvJAnNr/r76E+sV3Zo/W9EqjxYCB9RtDrCLF
	 ojQieAJAaljHtfaJmoDSLJJWGRLDwjTH+QmhQmQSHR7VjB2Vbn/kY0ustY1cQEkWfCeYm
	 cXYcsM8FNHJiAEJC0Fp2J5BgBp4YqJbWp+20QvNEJ+z04o9U9iRj+8LUVts0OIKREP7G1
	 jIHt6R7YgG3cm1zoUF8ZZQmq6BCWGKB6l0dR+TA1/5SAkvZuRkOc6QvyihMoC7LWP7ix4
	 F6H+Lkl688nprxbf/6BwPP0ryGIzIe1sK+T+B2psKLxRraJ3cHr43YaLjrD4dRfHfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uAteSWpS1gqVc8m5fM9fpUirRc1+LR0rgrU7RUNRbEk=;
	b=Oour6oNLCvSx9Etzk1kB9gvnseBioPgBWaKDMU6uQBT2XCnDZ2A/NpnGwS6Ck506IRsJ
	 olFkwmPsRrvYjEi/SR/477ye2kdDrbxamld2RXFEbkhkn4FDWdhpODXHSpLI11/DCuUAQ
	 vDucHHGMEflgK08TzpSjINSpE0E7yvXwaCIOomyE92Qcwsy7LP1i7d7bkH4DCQoVwOIzq
	 jmN+G/sQ5c9O/UeLvwC6N3Vt0rj1DGAiXjC7+eu1vifkZhywe1sQbjUy1J9kfu8Y5UBlL
	 3qGwzV1zepOLmNalTsvt0abkxpj3+9FgEK6i9g2DaeAwkb0CNRxWEmF5PNbWxnTmqog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="cB/XQg75";
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21781606A330
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21781606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=cB/XQg75
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so134774241.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794855711; x=1795460511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAteSWpS1gqVc8m5fM9fpUirRc1+LR0rgrU7RUNRbEk=;
        b=cB/XQg75ScDlaed0WvdGgTqAxu08U2jFO6lLEE6sp3UXLQj1slZTgOVpWIW6/I97DM
         KBHxm5g7xLw3XvxtyyhQcN2SZYrd9OXgwA7rnz8UVKBoLEGkdnbrGTKGQwIPltCByqIo
         GEZ0CtLbqTj1KI94NF5EvlcalyOFF6j0vbX8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855711; x=1795460511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAteSWpS1gqVc8m5fM9fpUirRc1+LR0rgrU7RUNRbEk=;
        b=WYTj0/IyXssYZMOb8YgKGC6HYLY4cOXpusqImri7WmUJW2WMj22id4GUf5nmfEIYHu
         DNxpGPr9KU6nioBdIyX6zSjlpyxCr6Ou/FWHFz48InR802Py49OoVTNmeDZEaxn/NxNv
         WlJKxEf7mmHO7kKGjmJDojBBaclnuayu3ClZhn5e5p8Xn2MTdmvMfGNLMerBopnBI3mj
         K/bMhOiqPunjQpd2yIEwWrRsODOhnZmadeeSSr5Al5O0IDCiu6Wz+wM+K27pOzDxMRQV
         /AF6ddvETaJfci8FEIS1zFpspsdIYn2lU3i66SOljqNDao1M7lsvMd11cBA9mLDsbbPr
         SGBQ==
X-Gm-Message-State: APuU4Z9lwADvfstjChD1dsaq9guuoTPJPc+mgdFL17gnz6vcLaLos2bE
	bLPqOBLycG4T2DRWTA3qhXyUDZNNl+M6Y9UOkh+AuXMf71tsEGEN6Zs7SPCtvn1jVdLHSQV/LPt
	LjcQ=
X-Gm-Gg: AYBFou1Nfr/gnAh60VM0qZh3JAktJy8I4EkrUY3bte57YvS5h1u4HGBzm1bFmfh/CUu
	+VSiMx/G/6j6Q+JzL6Bl5BP4wxLnlQokE5KsJlbsE4rQrzSJkqXEVAyxs5uvNiaJ/GO0CqNTXlC
	rbjaKu+XbncvGt/Rmyv8SATRE2c+KD/4W3VwxygTrqALZC6OPVax1T2Vd2V6hiznqK/ngCETh+A
	CoipfXnEWgKaXGo+UKSfO8Rthg4HT1TtCXMLe90n9thn+Nu24vagnNyt8aDQDls//Lnk9xks2rR
	zn0NjV8rWxIil1n9jlpWbLwbbcA0GcfDi0Y6/4qp3uEEI6qO5NMUMCvMIwziJ79+xaXK/bIV/3a
	DFb3eRM2SEF/0NMVdNtY+yAjmiJGjhunOwUbPSDOr3JKHkQFt3pVHftL6FHvjDb2WVOE1ZGFCTJ
	4O5YjgMkHnzF7qtx7FPAcikdsXwYlV4vLVeHVC2VTxWVmcySAdJ9D2G0dwzZoR7MWywuuk1E0yQ
	lKL6ba58/q7XD/R+Pc2OXblKtuahK64fU4oBWq4glIYYh1QrP34Lu/i4SXyzxtL8+Zgcr8vCyTE
	46jiOlQ89lcP7fLYOl4LaBz/NaffKGvK+SVenv/HosA8OK+Z1J72BChG+D+rQ5h9PDhh5S1/Lsc
	=
X-Received: by 2002:a05:6102:6445:b0:7d3:133e:a37 with SMTP id ada2fe7eead31-7d69f77090dmr137298137.11.1794855710920;
        Mon, 16 Nov 2026 11:01:50 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm91997386d6.10.2026.11.16.11.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:01:50 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>
Subject: [PATCH net-next v4 2/4] net: dst: keep the LWT metadata of a dropped route
Date: Mon, 16 Nov 2026 14:01:39 -0500
Message-Id: <CORE-9NOG.v4.r0.20261116135311-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com>
References: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com>
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

Found while working on the two producers that steer a packet to another
device's neighbour. Both release the route dst on the way, and a route
installed with an encapsulation carries the parameters a device downstream
needs: an ip or ip6 encapsulation holds an ip_tunnel_info, where
skb_tunnel_info() reads it, and an xfrm encapsulation holds an
xfrm_md_info, where skb_xfrm_md_info() reads it. A blanket release would
discard them, so a tunnel or an xfrm interface downstream would have
nothing left to build the outer header with, or to select its if_id.

This patch adds the helper those producers need, on its own: it is the
shared half of the change, used by a netfilter expression and by the bpf
redirect path, so it is not folded into either of them. Nothing calls it
yet; the metadata loss it prevents only appears once the next two patches
release a route that carries an encapsulation.

The Fix:
Add skb_dst_drop_keep_metadata(), which moves those parameters onto a
metadata dst of its own before the route is released. The ip and ip6
payload is copied field by field; the route's dst cache belongs to its
lwtstate and is shared by every packet that uses the route, so it is not
duplicated: the copy starts with an empty cache, which costs the tunnel one
route lookup. The xfrm payload keeps the route itself, because the xfrm
lookup reads its family; the counted reference the skb already holds moves
into the metadata dst, which releases it once it has been consumed.

The helper owns the whole operation: a dst that is not a route is not
dropped, because a metadata dst is the encapsulation itself. Its callers
must not transmit with the stale route, so a failure is reported and the
caller drops the skb instead of sending it.

Conditions to recreate the bug:
Nothing calls the helper at this commit. Apply the netfilter producer (3/4)
or the redirect one (4/4) and replace its skb_dst_drop_keep_metadata() call
with a plain skb_dst_drop(). Then steer a packet that arrives over a route
with an encapsulation into a tunnel that takes its outer header from the
packet:

    ip route add 10.99.0.2/32 dev va encap ip id 42 dst 192.0.2.9
    ip link add gt0 type gretap external local 10.20.0.2
    nft add rule netdev t c fwd ip to 10.99.0.2 device gt0

The tunnel finds no parameters in skb_tunnel_info(), drops the packet and
counts a transmit error; with the helper in place the metadata dst has it
encapsulated towards 192.0.2.9.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v3 -> v4 (kernel-doc and commit-log change; no code change):
- Correct the Return: section: true also covers a dst that was absent and
  a route released without encapsulation parameters, and false also covers
  a route reference that could not be taken. The docstring sits inside the
  diff; no executable line changed.
- State that this patch adds a helper nothing calls yet, and give a recipe
  that applies one of the two producers with a plain skb_dst_drop() in its
  place. Considered comments from Sashiko (nipa).

 include/net/dst_metadata.h |  1 +
 net/core/dst.c             | 79 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/net/dst_metadata.h b/include/net/dst_metadata.h
index 02fffbb85099..a7808d42f779 100644
--- a/include/net/dst_metadata.h
+++ b/include/net/dst_metadata.h
@@ -138,6 +138,7 @@ struct metadata_dst *metadata_dst_alloc(u8 optslen, enum metadata_type type,
 void metadata_dst_free_percpu(struct metadata_dst __percpu *md_dst);
 struct metadata_dst __percpu *
 metadata_dst_alloc_percpu(u8 optslen, enum metadata_type type, gfp_t flags);
+bool skb_dst_drop_keep_metadata(struct sk_buff *skb);
 
 static inline struct metadata_dst *tun_rx_dst(int md_size)
 {
diff --git a/net/core/dst.c b/net/core/dst.c
index 092861133023..fd63580e6529 100644
--- a/net/core/dst.c
+++ b/net/core/dst.c
@@ -353,3 +353,82 @@ void metadata_dst_free_percpu(struct metadata_dst __percpu *md_dst)
 	free_percpu(md_dst);
 }
 EXPORT_SYMBOL_GPL(metadata_dst_free_percpu);
+
+/**
+ * skb_dst_drop_keep_metadata - release a route dst, keeping its LWT metadata
+ * @skb: buffer whose dst is to be released
+ *
+ * A route installed with an encapsulation carries the parameters a downstream
+ * device needs in dst->lwtstate, where skb_tunnel_info() and skb_xfrm_md_info()
+ * find them. Releasing such a route would discard them, so move them onto a
+ * metadata dst of their own first. The route is not duplicated: the copy
+ * starts with an empty cache, and for xfrm the route is kept because the
+ * lookup needs its family.
+ *
+ * A dst that is metadata, or absent, is left in place. Any other dst is
+ * released, and a route with no encapsulation parameters leaves the skb
+ * with no dst at all.
+ *
+ * Return: true when the skb is left free to be sent: its dst was already
+ * metadata or absent, the encapsulation parameters were moved onto a new
+ * dst, or there were none and the route was simply released. False when
+ * the copy could not be allocated or a reference on the route could not
+ * be taken; the caller must drop the skb.
+ */
+bool skb_dst_drop_keep_metadata(struct sk_buff *skb)
+{
+	struct dst_entry *old = skb_dst(skb);
+	struct metadata_dst *md_dst = NULL;
+
+	if (!skb_valid_dst(skb))
+		return true;
+
+	if (old->lwtstate && old->lwtstate->type == LWTUNNEL_ENCAP_XFRM) {
+		struct xfrm_md_info *src = lwt_xfrm_info(old->lwtstate);
+
+		md_dst = metadata_dst_alloc(0, METADATA_XFRM, GFP_ATOMIC);
+		if (!md_dst)
+			return false;
+
+		/* Count the route so it outlives the skb, then move the
+		 * reference into the metadata dst.
+		 */
+		if (!skb_dst_force(skb)) {
+			metadata_dst_free(md_dst);
+			return false;
+		}
+
+		md_dst->u.xfrm_info.if_id = src->if_id;
+		md_dst->u.xfrm_info.link = src->link;
+		md_dst->u.xfrm_info.dst_orig = old;
+		skb_dstref_steal(skb);
+		skb_dst_set(skb, &md_dst->dst);
+		return true;
+	}
+
+	if (old->lwtstate &&
+	    (old->lwtstate->type == LWTUNNEL_ENCAP_IP ||
+	     old->lwtstate->type == LWTUNNEL_ENCAP_IP6)) {
+		struct ip_tunnel_info *src = lwt_tun_info(old->lwtstate);
+		struct ip_tunnel_info *dst;
+
+		md_dst = metadata_dst_alloc(src->options_len,
+					    METADATA_IP_TUNNEL, GFP_ATOMIC);
+		if (!md_dst)
+			return false;
+
+		dst = &md_dst->u.tun_info;
+		dst->key = src->key;
+		dst->encap = src->encap;
+		dst->options_len = src->options_len;
+		dst->mode = src->mode;
+		memcpy(ip_tunnel_info_opts(dst), ip_tunnel_info_opts(src),
+		       src->options_len);
+	}
+
+	skb_dst_drop(skb);
+	if (md_dst)
+		skb_dst_set(skb, &md_dst->dst);
+	return true;
+}
+EXPORT_SYMBOL_GPL(skb_dst_drop_keep_metadata);
-- 
2.43.0

