Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572449;
	b=LrpOrTjeUT2FIili9/SeKxPUwBAvNejTRzvUE24g+KsYx4+xyW+cDJS8bSw54/DHNPHq
	 I0XGr8MayFH0aJS8pn3wzx6udoacmZY8yRMPzlGZ1EbPu2VoiZtSSsPQWZos4rXuGERSU
	 lqOBLDJRtpXQPoF0uRiFxgNGMUaBD4F2Zmigl0Pnf+8H9QkH42CHnZgNvJj6zgnYyF+kw
	 Kr5sgygw6twzDFCTFO8gpj+rok2vTKIa9AnzlHDsfmppPG+OCL3kC/wZidVdu/dTLeAux
	 aRYiTPo+/lNxLE380Jo1/w1BcKGl+/QgI7L1J2DnjiJRoH+9j4At4lF/dZDOI0l+VzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XojWxgDr5LA3x6lFRy1QQvM1cLzWVbAOPEYLcMc398c=;
	b=Oe+7XFBAZgHaUKrgXKjkuiFcBSyEg3eWG0A0syurdvk94vyPkrLkayS6t033NgHHSYeJ
	 fQY/qn3oZHmk/6XcylEMgSsAWC1S1HSyC1S6Na+2jvudm8ZXsXtnWLKkd8F16artMwDQT
	 Fo6qDeMJzTerT4sk4v+/7c/VUOgq4y0AXtrpSvPs//zdiQJAx49wfKJ5qzc/Co9AKIY3l
	 rigIP05GyVJQGUye8S9dfhhH3FMQ2El6v5NBqQgQH4rTn9C9v+XGmXcEfBAmYLBUWKfsP
	 GMZUgpBkZy2IMvC3+QcV99I+CQjSY8qFJCHLAxoNozjpOdzuu6x2BVdxyjztaW2rH2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifdWddk7;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8744606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8744606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifdWddk7
Received: by mail-oo2-f2.google.com with SMTP id 006d021491bc7-71ad760fdddso1754235eaf.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572447; x=1796177247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XojWxgDr5LA3x6lFRy1QQvM1cLzWVbAOPEYLcMc398c=;
        b=ifdWddk7bS3I6p/OXqg1h68J3BzhKyr40pH80d9KuCbubboJhl7Uyufrl2DYLNL+CB
         pgUR98RVuJ28y7BmFT0hVGWodLo/v2rOu+sfVFm/jIp37Tc7bd7rcH6C/XEGY0VU3PXk
         2zzEqHdcbVhWwz+vaXaCDhP1AaDp9ooDxgf9TPXGHfiD7lafP0b2RGvsZS8ifWe1YeYV
         DJqKApAaaQsafyNBgmhJfho9yTgLdZYgc447ExUvpPsMWVU8xF20McYsr5b0pB0AHtub
         yDdSqeACat4ikZLi2rh8iMjXqNZApXAMmuIKyiwZaKECOaIFXIENYjWDjyfTxKgtUUMn
         jgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572447; x=1796177247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XojWxgDr5LA3x6lFRy1QQvM1cLzWVbAOPEYLcMc398c=;
        b=aUep58f5gs5ARmwU/k1wAW5i8L42fOQwXydtSrCLE84+4hPiJWrR8qCKon5hq1EDjZ
         yv6ZAT5RlvjtHqUZeHcOvaoMoztUNkSfx57/4Sw+YXHAVfif5gs2MdAmyoiywmQLLcSb
         kvAukl2iX1cwMi6bF1vK4WTOjDH6ynqWxqx/SwI4ooyFCDspedH0upTOiE2Rwe1sGiDN
         4YcOasQdcJPzzMLknvlydD7EBprSuDetvCcQ4SD5+YKrb7ZCkem2X1Rg7DKJvBxqQAvC
         7EbsQ5jcBXROs0mNcm/kzU737GD8yWFT1sluD2MPjjGBtbMROOvgnFmqZC3V9vn7FhbA
         RFCQ==
X-Forwarded-Encrypted: i=1; AL+hErGGbSHodgEe26Z/+kCHz3Co0tPimXXmr/pnAlz2875dQ99iMqYekUCwfAi5LRjLlSfEG+FHlwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ifoVdcUcFZWAfn4CEUY3WAGYg8VQS2yyac4pom8/5N3hhNhpF
	MtHzAi5cTjcNiWFoMzh4Tbf0qVwyuhzY5SOie/APjr9GksYo9TZvDoo0
X-Gm-Gg: AZFdTZekuErVg3zj5o0z+JfhYsXLra1o+zBzvp1GCT0KRM0ZjOpDsdWV0BCjgbu0BmY
	NOKmy/oshmQs4kBPLwI4bl6cloPqolzc8OmNWEyRrzRnoQxcxxqe/vWHv/k5HWb52vH0HO44ShL
	rSNPufpYa6JiDzR+QoN8EOcoBljvzu9Ki9auAxTurOvi654dc8+luWhEvm6uA31M7XW1eBerEet
	ZxYkoW2NTeCFnoiG5PADdOuaYNf5tB2bO07WYhQN1tVpk2CBY9AQhsojwLe+T0D8Gg1+HDfHKql
	VyFFo9d4POV8sygoQpzSSlm1yEA3OGVVWPKkQwGBqGTgc2oM6VXejK+KBmZ4hkhFtvNPNi19032
	PToIT0mYqALr9znVbprZ1CsmhEhINc7obREULZ4m2Xfr/aYE0AcQ3mZFdvl4yFRZSVg45LvDTDz
	bCV2MXkosGCuOeXwdzHaoUvLg9qH14XpzW/N3xcWPHLWWVtr/b8DqKbcgqCVSM2ErPb2RZg6sGi
	MyS94kO/JbIWU0CRYOz8mqZSJjuAccSk+2w/FFI4Bbf4cupexnG920C/6vdPJTEFKS9c+bUyB1t
	C1Hg7ZXeBQFO/bH7FwagwarL+PjksxSudkp7Z5IhmSXcdSLAQQrYmbaWpKIcmlZNXkNZtZm7VSY
	x8mfbDY0i1prEcg==
X-Received: by 2002:a05:6820:7085:20b0:71a:ed37:d321 with SMTP id 006d021491bc7-71b3962fc62mr9616280eaf.90.1795572447458;
        Tue, 24 Nov 2026 18:07:27 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm9727568eaf.10.2026.11.24.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:07:25 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	fw@strlen.de,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH net v3] net: fix xfrm_state refcount underflow and leak in skb_ext COW
Date: Wed, 25 Nov 2026 10:07:17 +0800
Message-ID: <20261125020718.261041-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

skb_ext_maybe_cow() re-acquires the SEC_PATH xfrm_state references for a
copied extension chunk, gated on the source skb's active bit, while the
release side (__skb_ext_put()) is gated on the chunk's
offset[SEC_PATH].

__skb_ext_del(SKB_EXT_SEC_PATH) on a shared chunk (refcnt > 1) only
clears the skb's active bit: the chunk keeps offset[SEC_PATH] and
sp->len, because the remaining sharers still use them.  A later
skb_ext_add() COWs such a chunk; the copy carries the SEC_PATH data, but
with the active bit clear no references are taken for it.  When the copy
is freed, __skb_ext_put() puts sp->len references that were never
acquired, underflowing the refcount of every xfrm_state in the sec_path.
The state is destroyed while still hashed in the SAD and is dereferenced
by later packet input.  On v7.4-rc4, as an unprivileged user:

    WARNING: net/xfrm/xfrm_state.c:805 at __xfrm_state_destroy
    BUG: KASAN: slab-use-after-free in xfrm_input_state_lookup
    ...
    Freed by task ...:
     xfrm_state_gc_task
     __xfrm_state_destroy

The MCTP flow slot has the same take/put asymmetry, so fix both slots:

 - skb_ext_maybe_cow(): a copy of a slot that exists but is not active
   keeps no references (sp->len = 0, flow->key = NULL); they stay with
   the old chunk.  The slot itself is kept, since skb_ext_add() must not
   append a second slot for the same id.

 - skb_ext_add(): when it reuses such a slot, the chunk is not shared,
   so release the references the slot still owns before reusing it.
   Otherwise secpath_set() zeroes sp->len in place and leaks them; this
   case predates the COW path.

Nothing passes SKB_EXT_MCTP to __skb_ext_del() today, so the MCTP half
is not reachable yet, but nothing in the code enforces that.

This issue was discovered by Tencent CodeBuddy Security.

Reported-by: zeroday zhao <zerodayzhao@tencent.com>
Fixes: 4165079ba328d ("net: switch secpath to use skb extension infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
This supersedes the one-line patch in the report of 2026-11-05.  Eric
Dumazet described this two-part fix and asked me to take it over while he
is out.

Verified on v7.4-rc4 (KASAN, unprivileged user, userns + netns):

  unpatched: WARNING at net/xfrm/xfrm_state.c:805, then
             BUG: KASAN: slab-use-after-free in xfrm_input_state_lookup
             (freed by xfrm_state_gc_task)

  patched:   the same trigger sequence completes without warning or splat

The skb_ext_add() reuse path needs a stale slot on an unshared chunk; the
reproducer only reaches the COW path, so that part is covered by
inspection.  The MCTP slot is not reachable today.

v2 -> v3:
 - cover the MCTP slot too, as requested by Florian Westphal
 - factor the per-slot reference handling into skb_ext_put_slot(),
   skb_ext_put_refs() and skb_ext_copy_refs(), as suggested by Paolo
   Abeni, which also drops the forward declaration
 - document the invariant above skb_ext_maybe_cow()
---
 net/core/skbuff.c | 186 +++++++++++++++++++++++++++++++---------------
 1 file changed, 127 insertions(+), 59 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 74e9a96bc5df..dc2e1a39d46b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7300,6 +7300,126 @@ struct skb_ext *__skb_ext_alloc(gfp_t flags)
 	return new;
 }
 
+#ifdef CONFIG_XFRM
+static void skb_ext_put_sp(struct sec_path *sp)
+{
+	unsigned int i;
+
+	if (!sp->len)
+		return;
+
+	for (i = 0; i < sp->len; i++)
+		xfrm_state_put(sp->xvec[i]);
+	sp->len = 0;
+}
+#endif
+
+#ifdef CONFIG_MCTP_FLOWS
+static void skb_ext_put_mctp(struct mctp_flow *flow)
+{
+	if (!flow->key)
+		return;
+
+	mctp_key_unref(flow->key);
+	flow->key = NULL;
+}
+#endif
+
+/* Release the references owned by one slot of an extension chunk. */
+static void skb_ext_put_slot(struct skb_ext *ext, enum skb_ext_id id)
+{
+	if (!__skb_ext_exist(ext, id))
+		return;
+
+	switch (id) {
+#ifdef CONFIG_XFRM
+	case SKB_EXT_SEC_PATH:
+		skb_ext_put_sp(skb_ext_get_ptr(ext, SKB_EXT_SEC_PATH));
+		break;
+#endif
+#ifdef CONFIG_MCTP_FLOWS
+	case SKB_EXT_MCTP:
+		skb_ext_put_mctp(skb_ext_get_ptr(ext, SKB_EXT_MCTP));
+		break;
+#endif
+	default:
+		break;
+	}
+}
+
+/* Release the references of every slot of an extension chunk. */
+static void skb_ext_put_refs(struct skb_ext *ext)
+{
+	enum skb_ext_id id;
+
+	for (id = 0; id < SKB_EXT_NUM; id++)
+		skb_ext_put_slot(ext, id);
+}
+
+/*
+ * A COW copy carries the data of every slot, but only the slots that
+ * are active on the source skb may own references.  For an inactive
+ * slot the references stay with the old chunk.
+ */
+static void skb_ext_copy_refs(struct skb_ext *old, struct skb_ext *new,
+			      unsigned int old_active)
+{
+	enum skb_ext_id id;
+
+	for (id = 0; id < SKB_EXT_NUM; id++) {
+		if (!__skb_ext_exist(old, id))
+			continue;
+
+		switch (id) {
+#ifdef CONFIG_XFRM
+		case SKB_EXT_SEC_PATH: {
+			struct sec_path *sp;
+
+			sp = skb_ext_get_ptr(old, SKB_EXT_SEC_PATH);
+			if (old_active & (1 << id)) {
+				unsigned int i;
+
+				for (i = 0; i < sp->len; i++)
+					xfrm_state_hold(sp->xvec[i]);
+			} else {
+				struct sec_path *new_sp;
+
+				new_sp = skb_ext_get_ptr(new, SKB_EXT_SEC_PATH);
+				new_sp->len = 0;
+			}
+			break;
+		}
+#endif
+#ifdef CONFIG_MCTP_FLOWS
+		case SKB_EXT_MCTP: {
+			struct mctp_flow *flow;
+
+			flow = skb_ext_get_ptr(old, SKB_EXT_MCTP);
+			if (old_active & (1 << id)) {
+				if (flow->key)
+					refcount_inc(&flow->key->refs);
+			} else {
+				struct mctp_flow *new_flow;
+
+				new_flow = skb_ext_get_ptr(new, SKB_EXT_MCTP);
+				new_flow->key = NULL;
+			}
+			break;
+		}
+#endif
+		default:
+			break;
+		}
+	}
+}
+
+/*
+ * A slot that exists in the chunk but is not active must not own
+ * references: they belong to the chunk and are dropped by
+ * __skb_ext_put() when the chunk is freed, or released by
+ * skb_ext_add() when the slot is reused.  A COW copy of such a slot
+ * must therefore not take references for it.
+ */
 static struct skb_ext *skb_ext_maybe_cow(struct skb_ext *old,
 					 unsigned int old_active)
 {
@@ -7315,23 +7435,7 @@ static struct skb_ext *skb_ext_maybe_cow(struct skb_ext *old,
 	memcpy(new, old, old->chunks * SKB_EXT_ALIGN_VALUE);
 	refcount_set(&new->refcnt, 1);
 
-#ifdef CONFIG_XFRM
-	if (old_active & (1 << SKB_EXT_SEC_PATH)) {
-		struct sec_path *sp = skb_ext_get_ptr(old, SKB_EXT_SEC_PATH);
-		unsigned int i;
-
-		for (i = 0; i < sp->len; i++)
-			xfrm_state_hold(sp->xvec[i]);
-	}
-#endif
-#ifdef CONFIG_MCTP_FLOWS
-	if (old_active & (1 << SKB_EXT_MCTP)) {
-		struct mctp_flow *flow = skb_ext_get_ptr(old, SKB_EXT_MCTP);
-
-		if (flow->key)
-			refcount_inc(&flow->key->refs);
-	}
-#endif
+	skb_ext_copy_refs(old, new, old_active);
 	__skb_ext_put(old);
 	return new;
 }
@@ -7387,8 +7491,11 @@ void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id)
 		if (!new)
 			return NULL;
 
-		if (__skb_ext_exist(new, id))
+		if (__skb_ext_exist(new, id)) {
+			if (!(skb->active_extensions & (1 << id)))
+				skb_ext_put_slot(new, id);
 			goto set_active;
+		}
 
 		newoff = new->chunks;
 	} else {
@@ -7410,31 +7517,6 @@ void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id)
 }
 EXPORT_SYMBOL(skb_ext_add);
 
-#ifdef CONFIG_XFRM
-static void skb_ext_put_sp(struct sec_path *sp)
-{
-	unsigned int i;
-
-	if (!sp->len)
-		return;
-
-	for (i = 0; i < sp->len; i++)
-		xfrm_state_put(sp->xvec[i]);
-	sp->len = 0;
-}
-#endif
-
-#ifdef CONFIG_MCTP_FLOWS
-static void skb_ext_put_mctp(struct mctp_flow *flow)
-{
-	if (!flow->key)
-		return;
-
-	mctp_key_unref(flow->key);
-	flow->key = NULL;
-}
-#endif
-
 void __skb_ext_del(struct sk_buff *skb, enum skb_ext_id id)
 {
 	struct skb_ext *ext = skb->extensions;
@@ -7449,14 +7531,7 @@ void __skb_ext_del(struct sk_buff *skb, enum skb_ext_id id)
 	if (refcount_read(&ext->refcnt) > 1)
 		return;
 
-#ifdef CONFIG_XFRM
-	if (id == SKB_EXT_SEC_PATH)
-		skb_ext_put_sp(skb_ext_get_ptr(ext, SKB_EXT_SEC_PATH));
-#endif
-#ifdef CONFIG_MCTP_FLOWS
-	if (id == SKB_EXT_MCTP)
-		skb_ext_put_mctp(skb_ext_get_ptr(ext, SKB_EXT_MCTP));
-#endif
+	skb_ext_put_slot(ext, id);
 }
 EXPORT_SYMBOL(__skb_ext_del);
 
@@ -7471,14 +7546,7 @@ void __skb_ext_put(struct skb_ext *ext)
 	if (!refcount_dec_and_test(&ext->refcnt))
 		return;
 free_now:
-#ifdef CONFIG_XFRM
-	if (__skb_ext_exist(ext, SKB_EXT_SEC_PATH))
-		skb_ext_put_sp(skb_ext_get_ptr(ext, SKB_EXT_SEC_PATH));
-#endif
-#ifdef CONFIG_MCTP_FLOWS
-	if (__skb_ext_exist(ext, SKB_EXT_MCTP))
-		skb_ext_put_mctp(skb_ext_get_ptr(ext, SKB_EXT_MCTP));
-#endif
+	skb_ext_put_refs(ext);
 
 	kmem_cache_free(skbuff_ext_cache, ext);
 }
-- 
2.43.7

