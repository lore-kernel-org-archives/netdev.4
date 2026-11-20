Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183743;
	b=rDFPTs3VXXA+pedNvgD4gQw6trVDEcN//twk4BtTfioHjcS7rV1Ya3zXv3bFgxHeuCYe
	 xoJ0Avqhd1QHQw1eJ+Ze/3+YJ1hnIekPsmVqathDp9D0PldtkVdbPJ6yubke//vcVaYr2
	 ukwavC3rMM8Eoo7Myv2//ft7Zs3eGjPULCKUtewKnCOYQVQcXc/OAkhAlbmGRTAhhyC5/
	 XiO6L/n6tDgjNukiscj58f6kqwGXu4doFIKoKYeMNsocjcmTIONnytC7yEey4Wvu2a6PR
	 QZXqpsx3Sqbo8i1sMgZ5aRh2tLQCdA04+kd2SB8yL4Pi3nFoNdaZaJdhX9CjJk26PGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i8o5obuhKYzZzTMxbyuPWpCrvH0/smuh9G7Q1LIM9Mk=;
	b=pda1Q5gURwXYhpAJEhtbS5bmS/m0HmemlXewmRrG27gAdEpt5u6n+F3EiFggbUOf2Fue
	 4+wEF9nxr3ffxqOguoXWzIl82uVv389JNdT0I0Qd255LZHT3ntY40kwieUlm+Zf/o7WYh
	 m1GZTI91VJbmK0o2+je8sCZo3B2UjkmUS62MpfsMeZqiZLkCwcW54JCbe/JBtH4/kEjgt
	 IhSkHlb9eBv8FjvvyO+I25+rtPiyoZrEWQzZtMefPd42pK7wp6NxfR/S7oQYKQtz5rQbJ
	 OKrDkZ9e46oYKURdPrBERYCRbAprX4zBS3twTo3/6yTDCqhUIjy4LBbKP0RkVBUXzDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yWwicMdU;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E4606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=yWwicMdU
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b335eeb340so8354427b3.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795183741; x=1795788541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8o5obuhKYzZzTMxbyuPWpCrvH0/smuh9G7Q1LIM9Mk=;
        b=yWwicMdUeVNA1UsXEGn2NprcBEJ0rMyuPq9bmUiJOmZaie64Zg+7JQorf89VHSc064
         0IwtLEU8u4Oe577I0Vh/wDw7KMxBLh6zWHVgbCmUxy3M1g2//5UcSW3n/BbSVgoreuw+
         3pgS+MbjbqPhpcfTLG6eur4htjXBP3HNoCOHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183741; x=1795788541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8o5obuhKYzZzTMxbyuPWpCrvH0/smuh9G7Q1LIM9Mk=;
        b=rlCt/wmUMyR+sPx10nLmpWUwzWS2iEJZTNk4wyebVlwujKVChUJCoBSbSs8KyLisBA
         U3WFTYo1X2WAsthkprd4ZekgJRq2KZltKdI1BLObvPXn1BsnbU+dQBToMPPAS316H/Zs
         FlDJ+bgZdusix/xqQC2HaYhhH9cwv4BR4UetbCkSud/sl/NJgV2KixueLBq/kbTjdz2l
         WG9t92vdJsQdvGpRRkbI1zR/ERrnkMqqlNQwQ9x/oGethlG7lKCuzohoYsIPp1pfXsdN
         Ctx+dgtO/GC0Rf5kQwMRFSSf1TXbyKJlt643EJOFjHOBd5yFIM2h3KvRSlQrfnh8/hQD
         DT9w==
X-Gm-Message-State: APuU4Z+iWt4X2yPgXJpqcXQ8p9QqPd0HI4/ZAh42rlxxaR2RpxZ5Cfd+
	FwxFgtpbv3rYeEU695/uHKrLd/pXCi55sGvN+hh4l50PlmLZnCXFvcGAvsKksQk6vgkKxJKog7m
	2MGo=
X-Gm-Gg: AZFdTZdpLhSPff0NW3NHg9yK9BlOXY+FzpcFswso6m+0VN3EpB2l95yCqPlaNJtbbYl
	TPz0PwnMCUiJR7lIHgU6D09aWFV/q9McTNMJ0Iu52CVqV1MPDwcxTi41YYqVW9ma2iIwJtSezWd
	TIgrXkFt2+2yG5vFUQJeiWijVvgb2XwB6m5zjsAv/Gh4zwa38D/auGJI77WZ/8XZbHIxWPxlc1T
	mpgEQnZRz9h72t8o7agbHle7C9cLrT/vv7Qq+v/uudxNzGTh5PehF2q543pCIFFgFEGA8jKg9Qk
	FWGPQfr1ZWAr3q2rzdzPYf5bCXUB0V6cLJq9LU/eOCzfB6vSfuaubx7Jfp9CTpjIBqyvnk6vDV3
	8q3YPfTHD9cdcB4xwFY/k9R7n/r4B4QacTiDWiLs9z8I8bAcoKe1AL10kAZEUMUnH1Av/TOrRPs
	yg2FKW6mku/Yjq+GHBRuEKw/HYcDs4hWftFyKr9bxYuFIS3S4i5bN5WwpaI1zzTZXPizsOp25bp
	SZjZsp/13wgwUpHj/eGfI2+ErgacI8SoWvIMaDCw4Z2FKyDwwP+Hab06sF42X9WSo1kmRdvuajr
	ag+YEiVCBFByiDDseN1CTtzmSc1GRSJlFkm4Bd3+mg9toKKxXVCSsj1LmKz/d0TjcP7xLbR30EE
	=
X-Received: by 2002:a05:690c:9c02:b0:8b4:d584:6178 with SMTP id 00721157ae682-8b5204b2f94mr15536727b3.63.1795183741483;
        Fri, 20 Nov 2026 06:09:01 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202dd36dsm12990277b3.26.2026.11.20.06.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:09:00 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Eyal Birger <eyal.birger@gmail.com>,
	ipsec@lists.linux.dev,
	bpf@vger.kernel.org,
	stable@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>
Subject: [PATCH net] net: xfrm: interface: restore dst_orig on every xfrm interface
Date: Fri, 20 Nov 2026 09:08:56 -0500
Message-Id: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
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

Found while auditing the xfrm metadata consumers of a steered packet. One
of them is an xfrm interface, which restores the original route before the
xfrm lookup; the swap warned on the metadata dst still installed in the
skb, and only the collect_md arm restored the route at all.

The issue:
An xfrm interface takes the if_id and the underlying device either from its
configuration or, in collect_md mode, from the xfrm metadata on the skb.
When that metadata also carries the route the packet arrived through,
xfrmi_xmit2() puts the route back on the skb, because the xfrm lookup takes
the address family from it. skb_dst_set() expects the dst slot to be empty
for a reference counted dst and warns when it is not, so the route landed
over a metadata dst that was still there; a kernel built with
CONFIG_DEBUG_NET=y panics on the first packet that takes this path when
panic_on_warn is set.

Two more defects sit in the same place. An interface with a configured
if_id never restores the route: it takes the metadata dst as it is, whose
address family is AF_UNSPEC, so the lookup finds no policy and the packet
is dropped as a link failure instead of being transformed. And the restore
moved the route out of the metadata dst, which a clone of the skb shares,
so the clone that reached the interface first left the original packet with
nothing to restore.

The same slot overwrite is in the unstable helper a tc-bpf program uses to
attach that metadata: bpf_skb_set_xfrm_info() records the route as dst_orig
and installs a per-cpu metadata dst over it. The per-cpu dst is shared by
every invocation of the program, so the restore cannot keep anything in it.

The Fix:
Restore dst_orig in both arms of xfrmi_xmit2(), taking a reference with
dst_clone() so the metadata dst keeps its own, and empty the counted slot
with skb_dst_drop() before the route is installed. The helper allocates a
metadata dst per skb instead of a per-cpu one, so the route it records
belongs to that skb and is released with it; the per-cpu allocation is no
longer used and goes away.

Conditions to recreate the bug:
A tc-bpf program that records the route as dst_orig with
bpf_skb_set_xfrm_info() is self-contained: the overwrite is in the helper,
so the first packet that calls it panics inside bpf_skb_set_xfrm_info() on
a CONFIG_DEBUG_NET=y build with panic_on_warn=1.

An interface with a configured if_id shows its own defect without any
other patch: it drops the packet as a link failure without consulting the
outbound policy. And a clone made after the metadata was attached consumes
the route before the original packet arrives.

Fixes: 94151f5aa966 ("xfrm: interface: Add unstable helpers for setting/getting XFRM metadata from TC-BPF")
Link: https://lore.kernel.org/netdev/DMZJS8O5A4YX.9T2P4DT0DAB7@gmail.com/
Cc: stable@vger.kernel.org
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 include/net/xfrm.h             |  2 --
 net/core/filter.c              |  8 --------
 net/xfrm/xfrm_interface_bpf.c  | 19 ++++++++-----------
 net/xfrm/xfrm_interface_core.c | 22 ++++++++++++----------
 4 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f..1866e5a3b911 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -2370,8 +2370,6 @@ static inline bool xfrm6_local_dontfrag(const struct sock *sk)
 #if (IS_BUILTIN(CONFIG_XFRM_INTERFACE) && IS_ENABLED(CONFIG_DEBUG_INFO_BTF)) || \
     (IS_MODULE(CONFIG_XFRM_INTERFACE) && IS_ENABLED(CONFIG_DEBUG_INFO_BTF_MODULES))
 
-extern struct metadata_dst __percpu *xfrm_bpf_md_dst;
-
 int register_xfrm_interface_bpf(void);
 
 #else
diff --git a/net/core/filter.c b/net/core/filter.c
index 946b07a17fce..a1b4f6333d1e 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -6334,14 +6334,6 @@ static const struct bpf_func_proto bpf_bind_proto = {
 
 #ifdef CONFIG_XFRM
 
-#if (IS_BUILTIN(CONFIG_XFRM_INTERFACE) && IS_ENABLED(CONFIG_DEBUG_INFO_BTF)) || \
-    (IS_MODULE(CONFIG_XFRM_INTERFACE) && IS_ENABLED(CONFIG_DEBUG_INFO_BTF_MODULES))
-
-struct metadata_dst __percpu *xfrm_bpf_md_dst;
-EXPORT_SYMBOL_GPL(xfrm_bpf_md_dst);
-
-#endif
-
 BPF_CALL_5(bpf_skb_get_xfrm_state, struct sk_buff *, skb, u32, index,
 	   struct bpf_xfrm_state *, to, u32, size, u64, flags)
 {
diff --git a/net/xfrm/xfrm_interface_bpf.c b/net/xfrm/xfrm_interface_bpf.c
index 5ea15037ebd1..7afbdbd11145 100644
--- a/net/xfrm/xfrm_interface_bpf.c
+++ b/net/xfrm/xfrm_interface_bpf.c
@@ -68,16 +68,9 @@ __bpf_kfunc int bpf_skb_set_xfrm_info(struct __sk_buff *skb_ctx, const struct bp
 	if (unlikely(skb_metadata_dst(skb)))
 		return -EINVAL;
 
-	if (!xfrm_bpf_md_dst) {
-		struct metadata_dst __percpu *tmp;
-
-		tmp = metadata_dst_alloc_percpu(0, METADATA_XFRM, GFP_ATOMIC);
-		if (!tmp)
-			return -ENOMEM;
-		if (cmpxchg(&xfrm_bpf_md_dst, NULL, tmp))
-			metadata_dst_free_percpu(tmp);
-	}
-	md_dst = this_cpu_ptr(xfrm_bpf_md_dst);
+	md_dst = metadata_dst_alloc(0, METADATA_XFRM, GFP_ATOMIC);
+	if (unlikely(!md_dst))
+		return -ENOMEM;
 
 	info = &md_dst->u.xfrm_info;
 
@@ -86,7 +79,11 @@ __bpf_kfunc int bpf_skb_set_xfrm_info(struct __sk_buff *skb_ctx, const struct bp
 	skb_dst_force(skb);
 	info->dst_orig = skb_dst(skb);
 
-	dst_hold((struct dst_entry *)md_dst);
+	/* The metadata dst releases dst_orig when it is freed, so the
+	 * reference the skb held is stolen rather than dropped. The dst
+	 * allocated above is handed to the skb with its single reference.
+	 */
+	skb_dstref_steal(skb);
 	skb_dst_set(skb, (struct dst_entry *)md_dst);
 	return 0;
 }
diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 9835fbe63ccb..896180f8d171 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -423,6 +423,7 @@ static int xfrmi_rcv_cb(struct sk_buff *skb, int err)
 static int
 xfrmi_xmit2(struct sk_buff *skb, struct net_device *dev, struct flowi *fl)
 {
+	struct xfrm_md_info *md_info = skb_xfrm_md_info(skb);
 	struct xfrm_if *xi = netdev_priv(dev);
 	struct dst_entry *dst = skb_dst(skb);
 	unsigned int length = skb->len;
@@ -433,25 +434,26 @@ xfrmi_xmit2(struct sk_buff *skb, struct net_device *dev, struct flowi *fl)
 	int mtu;
 
 	if (xi->p.collect_md) {
-		struct xfrm_md_info *md_info = skb_xfrm_md_info(skb);
-
 		if (unlikely(!md_info))
 			return -EINVAL;
 
 		if_id = md_info->if_id;
 		fl->flowi_oif = md_info->link;
-		if (md_info->dst_orig) {
-			struct dst_entry *tmp_dst = dst;
-
-			dst = md_info->dst_orig;
-			skb_dst_set(skb, dst);
-			md_info->dst_orig = NULL;
-			dst_release(tmp_dst);
-		}
 	} else {
 		if_id = xi->p.if_id;
 	}
 
+	/* The metadata dst carries the route the packet is still to be
+	 * transformed for, and the lookup below takes the address family from
+	 * the dst it is given. Put that route back, taking our own reference:
+	 * the metadata dst keeps its own, as a clone of this skb shares it.
+	 */
+	if (md_info && md_info->dst_orig) {
+		dst = dst_clone(md_info->dst_orig);
+		skb_dst_drop(skb);
+		skb_dst_set(skb, dst);
+	}
+
 	dst_hold(dst);
 	dst = xfrm_lookup_with_ifid(xi->net, dst, fl, NULL, 0, if_id);
 	if (IS_ERR(dst)) {
-- 
2.43.0

