Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737962;
	b=ERyr8/qc+fv53IoGGWb3knYPae12rkOuXEdC2xCBEMgOpAoqaPi4fiZP8/RqIvk+zxGK
	 +DTbYpWjgrPf54qYM5m/0R5SRhdGHsgRXaPtEGAUzhnbpSVYdEYnYVZOgPCzq86QmHDVE
	 EzxvvyRHZHR+3P1NYwTsX5ACbtp5H0DfG9xLDMKctDp/et+ZkFsKiLgH4/AzX0WJGUOOm
	 1u9umaP1L8eCu5My8kX/f/PzV0PoneYPkc4AF7pxbP83ejUrP8Ld8HrP8DLbssObc1LN4
	 mSE87xXZCRar7pokK+9UveooDytOyDDDqKMU1vOuOpf1awW25devFZXLKSRbhvRAlqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qUywjH1mXMA5ZdVLI5mxTaeNIn4AcR8Pm32/OR31sAQ=;
	b=d3yV2g1zzebWtIpAbIcNmlLoWhNMscaFTWYpfCZPnYQeX/23tfMQJTcbcPeOrYfaYBqV
	 dWHCsQma5FZpoxFYCIdEmAXGOXUW8Cu/DDhkw7lMNt9XOBU+AS/+xUqb2UmA67pYiqQeq
	 0GL8hJAm36ZWJmjG89wg7Nw+YHycpi1SO0eredAjXp/xIxJJm1OV0t2j8M5wcwDy+PB2s
	 K+ymwypA97wckFdJ10AzWu5Fxvt9ihV+SRkeyJzWnIXC/7WUjqgLUoa0xpD3I1gIRgOb1
	 kM3M1qPu1tUL2oF2NeUWWkSPYsCnjjVBPayhQvfFnE5H7Vvru4aNm9G7HhqHXw5nT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=wpleSygf;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1AD606A334
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1AD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=wpleSygf
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9496317b730so149556685a.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794737960; x=1795342760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUywjH1mXMA5ZdVLI5mxTaeNIn4AcR8Pm32/OR31sAQ=;
        b=wpleSygfirmdrkvBklDi3OhjJQ6nlsbgxjcBqeiYeodHcTTqanWc2odN9Zq2wP66rh
         QCir5pjHaqIaK6J7ZQtSZNicwxH3DINYH/l5YjrZ9xQ3ISaEvacW5BeJLdxzOkMKsSKu
         V/Z0eiEJf4fxOCFYhTJTuvix624F8OGbXIUlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737960; x=1795342760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUywjH1mXMA5ZdVLI5mxTaeNIn4AcR8Pm32/OR31sAQ=;
        b=vN1WeB0/B1BTv0QXLLbTK4APDE7MUT55aYFDtIkyHtH6EumOqCv316HtITxBZEijaV
         sBtlBDynMN51ipePHlGnwRW21wWclL1W+I+R8Q7rf9nHlp+nI/19SoJLCDky5SNtyhFS
         n1kYJdSFOIOcsFX0qN2Kt4m7WYpKjOrH/B4Va/OCGiKA3gPk6VFYCP13oidRa2HtJuID
         H9uyj0mZ7w6wdBHC+PCw6TwgcQRNLhONxnPoWFpvfUda7HJzG8uAoiBH7HtydJUlgGpB
         MhZT1b/zLWd9+u83a17Z0P+RFP1uCJcXECAu4BB8h+yP8XMieb5w57zXyTLcaBW5mbam
         sflQ==
X-Gm-Message-State: APuU4Z9MfTShYLuY3DVNG/H093L7zf9s1XofpItCP/Ds60OZmFsGAuaT
	TkKm/WrC/wQTREddFrd32IVuqHaFqmkbtkR/fK68C/zsrXr/90Ex/66937PNeDPDlEQfyxzcVQs
	gft8=
X-Gm-Gg: AYBFou1tf9HAighKCxfmyG0+1lsrEiRMSJPnp3svCs4ErPAp8d47uyQmrDpRcCawmwE
	urcje4E7O8QjxBotc8L3gMfUsxt6DgrxfvBJOtPEmKS3Bagp1BIyYPy1K1Tz+ytBo5pS+0s0B6C
	JZ6wb3p5IN+4S7sshuuvpAJWwQjUdLbNAJKssc0C95820HN/7StYCKyYQd3raoTCn8H5tJKHx50
	ApQ7HnQzlQNGKEV/qoyS9EV9C5ngl+PP5DHGINjQmoH0mKLv4VrCr8brFRsMLHsZq7rSe/5L3bU
	qIELOqnEqAFBATWNPKLVKHpxxLe+xrTEt09UMi/QgMceChVJfd5J5BBCR/3U+XkraKlFHDTUZhj
	qzT6qVm9fKO+C+9TsL8YJSTL0ZD/rnOPyaVp3kHReJpO7iZkXgnDnR/pC2YQ2+XbxCF+S4aC4mC
	raOlCZN/BQpDeH15EUEM23WeVWJaw463lDYATrjnnCwtBAFfFa2Epjjpev9Muap/gOFPs0FSAUr
	a007Bk8qkFcpH9QphZqYTGLwGCW930VffANdAIKDmnMCNE0ZXf/2BI7SULnNTtnqnhL8g+epPuA
	d+G2IayU+qj2XTHiYuO+1b4+5ejS11A4wHMhmvhKwn2vUc+Hf+uutyNOsmSD9JUb5XNKyfEbpH1
	f
X-Received: by 2002:a05:620a:880a:b0:939:f49c:1b30 with SMTP id af79cd13be357-9494bb77a5amr1224675585a.13.1794737960471;
        Sun, 15 Nov 2026 02:19:20 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm592337085a.5.2026.11.15.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:19:19 -0800 (PST)
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
Subject: [PATCH net-next v3 2/4] net: dst: keep the LWT metadata of a dropped route
Date: Sun, 15 Nov 2026 05:19:09 -0500
Message-Id: <CORE-9NOG.v3.r0.20261115050625-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
References: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
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
device's neighbour, fixed later in this series. Both release the route
dst on the way, and a route installed with an encapsulation carries the
parameters a device downstream needs: an ip or ip6 encapsulation holds an
ip_tunnel_info, where skb_tunnel_info() reads it, and an xfrm encapsulation
holds an xfrm_md_info, where skb_xfrm_md_info() reads it. The release
discards them, so a tunnel or an xfrm interface downstream has nothing left
to build the outer header with, or to select its if_id.

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
must not transmit with the stale route, so a failed copy is reported and
the skb is left untouched for its owner to drop.

Conditions to recreate the bug:
Install a route with an encapsulation (ip route add ... encap ip id <id>
dst <remote>, or encap xfrm if_id <id>), steer a packet to another
device's neighbour with a netdev egress fwd rule or
bpf_redirect_neigh(), and release the route dst before neigh_xmit() hands
the packet on. A tunnel or xfrm device in the path then finds no
parameters in skb_tunnel_info() or skb_xfrm_md_info() and drops the packet
instead of using them.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v2 -> v3:
- Document the `Return:` value of skb_dst_drop_keep_metadata() in its
  kernel-doc comment. Caught by NIPA CI.

 include/net/dst_metadata.h |  1 +
 net/core/dst.c             | 76 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

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
index 092861133023..9c80c225cbfd 100644
--- a/net/core/dst.c
+++ b/net/core/dst.c
@@ -353,3 +353,79 @@ void metadata_dst_free_percpu(struct metadata_dst __percpu *md_dst)
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
+ * A dst that is metadata is left in place.
+ *
+ * Return: true if the skb is left free to be sent, either because its dst is
+ * metadata already or because the LWT metadata was moved onto a new dst;
+ * false if no copy could be allocated, in which case the caller must drop the
+ * skb.
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

