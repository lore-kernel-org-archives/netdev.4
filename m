Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737960;
	b=ecVXYk2kRzvtlx21RZOtZsruPHW97+eq1jyp8E4UcsHv0Hf3vSzBikb69HHl1i7fcKR1
	 deFN8wyW93XQUpL7BPhIzltJ0EpJQRmEu8LCSppr5shArUozq27wAYbMtEcLgq7YrEm2/
	 XtNgF5qskm2rJT6CqqBOJaZoUwpa3cJxrX6Qax4cC32KIQPpAYN26jQ9v5f7Ox1jdoFoB
	 +oYXBWxEYHghp7DQMtDQmYhYF09H4Hwf5Zr8B7zzBzq9l9V+Zfckkifn5vXzhGRZ4sgIM
	 +ouTTQF1+7jMo5Ctlei85wnGuvnkhZwmHE/JNujHmQh+s2EOq/7fVtNzK5BNhN56IBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Eplc5FJto6KDJg/y223+4Fj7wO4MSUFeGn6npZetd7A=;
	b=C7Q+2BQVqDuvyt41JYBvf5XgQt8KXwee6hVShrTjLc4BP34UTkL4JoNjPRQ3vNr6l9CX
	 378Ix0elDJ3+BmEN3PaqI4sEsSFV41GM0nI68KowofFENwpIrbtAkgzKWq3JwJyZFk2Lw
	 CHEO9e29twxfOqkJ7PHc5geSaIn2p8rMaok6AmPK6S82tIFXQhdpipcHPYYz23knQbGVL
	 tb225XAP7FDucTlsVWjFTlcoqiuOWeDAWXpYYK7BDJ8MsufRDsAai/72biiC2vxyiBjFQ
	 EpJayhUIJK9Ah2EKvALDdEEEqrYecpuTBNzdSQWREOAXg8Qco0/vNm9tfcBq4VAmuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=rFOEdbcb;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EEA606A332
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18EEA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=rFOEdbcb
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-94961b68685so124828685a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794737959; x=1795342759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eplc5FJto6KDJg/y223+4Fj7wO4MSUFeGn6npZetd7A=;
        b=rFOEdbcbIun05gq1ib7jLw8PIjR5xW5urIkjHV8n0H6OieMrfJh09TjO/TrJ2SX39n
         k/0B5JB38tQcDFjQaHyD6PvsI8JrTnmJ7sGZNVWPG0kEOrmz5yXlL/DxiUcgNpPD4eia
         Ho/LVK9Xhdi+RKzw0gqedLNq4FHzwpgZGC4v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737959; x=1795342759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eplc5FJto6KDJg/y223+4Fj7wO4MSUFeGn6npZetd7A=;
        b=dGBo1CCJowCKG4uqxMdz7qNgqNCj+MJiQYnbSPCwKrcs7axIl9kQ03PFi09ASGt+89
         j3h60D8YUYgzwGTKl/ODpPBj+31t/MaoB8NVpkz0BvgrtbcY0F/aICr94EzzVnPFCC2Z
         18JTh3yfQAXbtdk9oXn1rd8nBrriCuB+WXHBqG34eIjl+MzbGqtlZSd7PiJlSk/k8f22
         j/Nj3rzNyT3toSGzFsWW3fA7Cetv94ViMKWCJ/WMgY/3V8AurstsHa8BflzreNwzYga0
         eI0Zwn+VNV/nxccf+BgAN4oz8mhy5GL3PBV4OJ/IUqcI+001VnA08dcV6TUwFK+ehQ4S
         Lp2g==
X-Gm-Message-State: APuU4Z88wcKuy8UN89V/zwxIh0bfxzQqckD9eH2PnQguZMVKSGEcgyeZ
	g34yBEtiRYF6ehDfGrEx4LI3aq69mgublMzRfclger9NRxrwgmZInv/ceDBQ9jbbS9EYJknfuLi
	J7G4=
X-Gm-Gg: AYBFou0Q7pmKI8/mAHGk0YJu9rEfUDZevbj/LffpEKczYigxxXEjPG5AvGhoV8eoEdf
	LuU+FJXhZ85p4R5EBXKN76DXkwVUd5wltqGw5EfoO2RkhUwg2VCAy9koedcmbYBNtvNfrv60u9r
	U7gJeTImzmMoGb+RDz7OVYEWSTHZtyXcpalO7Kva0LEpL8vGBpxKCZVE5B3q1HKYGrtLi+fTnvP
	2OximTsPjgT36ZEDgKURBFi1/LCY8DhGXuygwQXDFQZLwFglWNl9T0Dh9RIJTkFW/dJ0Qfxbn3p
	LQLk07cYm4XRlBzIZbC0XyjGgOEDZqqTCEbUWPcUIVwdX8W4SsuRm7l6PmRcqaWSTnA6Xjjrgwl
	fGAyoExkqQ5YnmgQyEDje3s8GJXkw9qJBnqavdvS8ONNGxPvtUZyBEGHtlzN1kmBAM8mNf8d9at
	Emy8hIGsNpUJRl/3Sj0Xnc2HJBSI/BqVxeUgeXhsQRM0DKUByo2xSbKnq8sWZxs4CNdf8nBpB2E
	7ssvob3bqrnQvZ9BJJdq+FnF/uOTz6u27iPschJ2cmteUl3I+TGpSJecDiuRk73vV22Ykjay/V6
	4jnEtd5cOnUXfPIloOTFE4HJ3N9sfqx0iTTkydf6zOkduXddQfUChrquEGi27mvA6l++jZkVx5g
	=
X-Received: by 2002:a05:620a:4385:b0:949:6982:3f0c with SMTP id af79cd13be357-949698240admr422657885a.19.1794737958975;
        Sun, 15 Nov 2026 02:19:18 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm592337085a.5.2026.11.15.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:19:17 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	ipsec@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>
Subject: [PATCH net-next v3 1/4] net: xfrm: interface: restore dst_orig on every xfrm interface
Date: Sun, 15 Nov 2026 05:19:08 -0500
Message-Id: <CORE-9NOG.v3.r0.20261115050625-1@mojatatu.com>
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

Found while testing the dst release for the two producers that steer a
packet to another device, fixed later in this series. One of the consumers
of the metadata such a release installs is an xfrm interface, which
restores the original route before the xfrm lookup; the swap warned on the
metadata dst still installed in the skb, and only the collect_md arm
restored the route at all.

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
bpf_skb_set_xfrm_info() and redirects the packet to an xfrm interface is
the shortest way to hit the overwrite. A netdev egress fwd rule that steers
a packet routed with an xfrm encapsulation into an interface reaches the
same place once the dst release earlier in this series keeps the route:

    ip link add xf0 type xfrm if_id 42
    ip link set xf0 up
    ip neigh replace 10.20.0.1 lladdr 02:aa:00:00:00:ab \
            dev va nud permanent
    ip route add 10.20.0.1/32 dev va encap xfrm if_id 42
    nft add rule netdev t c fwd ip to 10.1.0.2 device xf0

Send one packet to 10.20.0.1. With CONFIG_DEBUG_NET=y and panic_on_warn=1
the kernel panics in xfrmi_xmit() with the metadata dst still installed
while the route is put back. The interface with the configured if_id drops
the packet as a link failure without consulting the outbound policy, and a
clone made after the metadata was attached consumes the route before the
original packet arrives.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 include/net/xfrm.h             |  2 --
 net/core/filter.c              |  8 --------
 net/xfrm/xfrm_interface_bpf.c  | 16 +++++-----------
 net/xfrm/xfrm_interface_core.c | 22 ++++++++++++----------
 4 files changed, 17 insertions(+), 31 deletions(-)

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
index f42ecfb5841f..bd98d29ed7f8 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -6354,14 +6354,6 @@ static const struct bpf_func_proto bpf_bind_proto = {
 
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
index 5ea15037ebd1..8e83c624b774 100644
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
 
@@ -86,7 +79,8 @@ __bpf_kfunc int bpf_skb_set_xfrm_info(struct __sk_buff *skb_ctx, const struct bp
 	skb_dst_force(skb);
 	info->dst_orig = skb_dst(skb);
 
-	dst_hold((struct dst_entry *)md_dst);
+	/* The allocated dst owns one reference, handed to the skb here. */
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

