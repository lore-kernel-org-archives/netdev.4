Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205660;
	b=NslH+f1++ORwhv4vmvDW+/VoZMOtx9u4+2mzPeZMoFB0/O6+Zo0ZELb9UHQeUhZgRgrl
	 mXgUEs26/ZgV4edCe6Gcv4icoI1xQcRsvyRh+ik4RmHyeJuv4IISXoRgx7+oDBMZGyIUL
	 elnOl/z7nM8ddnf22V7sX786Rh4WXlbptP3MwM6HZ6Lv2QrFuDce+sDFGch996+YkSlmf
	 nfxF6/4OjaEfmAKWi0wfUDThcC7F3zrVpPBgPvd2oSkD5ea7uQbmkc+cCusI09XIQOJtZ
	 kU/6BZZUhmuz+AG0Llmrjkwh7lXsAqC5Vl3v3zIi7LwWwIQ9jUk6ELlpisfznoT5WEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iiBssRB8xzkM/3fMatRQoM6fME1g+TiItI31xX1CbLE=;
	b=YetbP4BJsnv3TDvAh6opMzhse3uHRP7BTrKpHSDEvJF3v9zi3NQjIvPNm1+fRIkuGtOL
	 rHqMgB40m+y2jfJRyFurFDMH7DnSp5ATZzIfDCFaaaufPyz0Wr1pqMq9S6hMlSd7f/dKP
	 F0PBNbFcmxNt1r4pSKwc1OPpIlknBRLxaYPozryLSAnL/hvBvMhxm0N8tipNXoACVwmk7
	 INGh8YTtAIYvgnKZYmFJpQwrOHsBJnI+SAvRpAN+CA7FY+Z5j7hP6jl5e41Ajx9QfpZ/4
	 vz5SluG/m1wokUkZtDth9kBF8iuhk0/uDbRuyUbNUB+lwOvRVVgu2FVyzAmZl3R0tJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Becb3ybf;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40DE606A6C1
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40DE606A6C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Becb3ybf
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b238436265so850740c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205658; x=1795810458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiBssRB8xzkM/3fMatRQoM6fME1g+TiItI31xX1CbLE=;
        b=Becb3ybfoJsrVFcAV0A74k+ZG7FvwUiWqrXqudEfgk32RYdUYsEBtsq5fpMljbfzP/
         NeYKcrK7EvF4aivjy1XQuwXzgTQ4hnzCNjCvjrXGpJkvNs3+HCn7ftUDArKpPIszr/bn
         jlMjwiW3lb+21YG1jF9jQTGO9Qt/wIZFWECf2sxcWaJ7CQ6IlZKgPEicChAgjtsBU0On
         29U1N0EUo9JU2ie0IVjVW5bnvPzt24VklSYxcwZu9w/S3OJ4nsiwRWb1N5hCMR0HZJ/E
         /8iSDtSUS+iUWoarN4/DV8bPIISdoU6+dWlLDqeqTF7BFRYiF4UF1tCxAv7o/ax/Pg2U
         gZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205658; x=1795810458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiBssRB8xzkM/3fMatRQoM6fME1g+TiItI31xX1CbLE=;
        b=KzkSLzeFiJDR6Bj+hIa48ISv9rP4eXzK8hN6Gsi4MWGjVp5uJe4vJTyrxwxDEeEBLv
         EYKLUN4FZyaFaTUtvwikrgrg0lgdBQz2GyHKb2evuZ6CWObHBi40yMvCGRUP6I+sqGMH
         zYwMkqD1PU66avVth6uTK0GU/WJId2l5/HsimxgWBJuSi329QGTDAPb4yzEr4TUCBciU
         oggqh2cPCRHWwYRIklRkQRhmHJlHRxQXkSqZjcGLp9NBnd5S3hlFooML1ZT2OdYCsHsU
         C8GwvTV8fL24BlLjxRLec4hbQnKm5MyFKjG1Nrii242nqJBnzuAMjAzcZD4hO4puuCMi
         hiOw==
X-Gm-Message-State: APuU4Z/CfJEfPIepnURl9t/SgRAob/noGo8enn97ByZaS29wSADVDoHE
	vE4I3bmDEatYstXwiuAKj1r5Qx/y8YG0ThZVFagZ2T+bqA4VJXhrapmIhgymtrPT84rnqryzUtd
	8QmajDzNs5ldiCsjAJfprS9m9JvP/KwFFQRywUmJOzlaVJdwR0qYo2823E2jeTRWvz4pLIJGJ8A
	2gwL70BzmuZtFacGEk/WNId3FYHi0r+qOgAdroh63cQmA6knH1kcJ6Y4RdqphpuwU=
X-Received: from dly1-n1.prod.google.com ([2002:a05:701b:2041:10b0:1b5:43fc:8107])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f101:b0:1b5:4d40:e9ff with SMTP id a92af1059eb24-1b5568d7b42mr3242087c88.35.1795205656911;
 Fri, 20 Nov 2026 12:14:16 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:07 +0000
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-7-almasrymina@google.com>
Subject: [PATCH net-next v6 6/7] net: prevent mixing frags from different
 memory providers or bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Prevent coalescing, segmenting, or shifting skb fragments from
incompatible memory providers or different devmem bindings.

Add skb_mem_provider_compat() with an inline fast path checking only
skb_frags_readable() on both skbs (unreadable lives in
struct_group(headers, ...) alongside header flags already loaded in GRO
and TCP coalescing/collapse paths) and an out-of-line slow path
__skb_mem_provider_compat() comparing the net_iov provider instance
(net_iov_owner() for devmem bindings, niov->desc.pp for other net_iov
providers such as io_uring zcrx). Enforce compatibility across
skb_try_coalesce(), skb_gro_receive(), skb_gro_receive_list(),
skb_segment(), and tcp_skb_can_collapse(), and add a
DEBUG_NET_WARN_ON_ONCE() check in skb_shift() matching the existing
pp_recycle and decrypted assertions.

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/skbuff.h | 18 ++++++++++++++++
 include/net/tcp.h      |  2 +-
 net/core/gro.c         |  6 ++++++
 net/core/skbuff.c      | 49 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 0c69b66af8f0..979aab031096 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1890,6 +1890,24 @@ static inline bool skb_frags_readable(const struct sk_buff *skb)
 	return !skb->unreadable;
 }
 
+bool __skb_mem_provider_compat(const struct sk_buff *skb1,
+			       const struct sk_buff *skb2);
+
+/* Return true if the memory providers of @skb1 and @skb2 are compatible
+ * for coalescing. For any struct page-backed provider (the buddy allocator
+ * or a future provider handing out struct pages), coalescing is assumed
+ * feasible. For net_iov-backed providers, the provider instance pointer
+ * must match.
+ */
+static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
+					   const struct sk_buff *skb2)
+{
+	if (likely(skb_frags_readable(skb1) && skb_frags_readable(skb2)))
+		return true;
+
+	return __skb_mem_provider_compat(skb1, skb2);
+}
+
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
 {
 	skb->next = NULL;
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 0b896319aaf5..e2bb07a54a98 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1285,7 +1285,7 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
 		      mptcp_skb_can_collapse(to, from) &&
 		      !skb_cmp_decrypted(to, from) &&
 		      skb_pure_zcopy_same(to, from) &&
-		      skb_frags_readable(to) == skb_frags_readable(from));
+		      skb_mem_provider_compat(to, from));
 }
 
 static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
diff --git a/net/core/gro.c b/net/core/gro.c
index c093fe388dfe..6852b19e4840 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -109,6 +109,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 	if (p->pp_recycle != skb->pp_recycle)
 		return -ETOOMANYREFS;
 
+	if (!skb_mem_provider_compat(p, skb))
+		return -ETOOMANYREFS;
+
 	if (skb_zcopy(p) || skb_zcopy(skb))
 		return -ETOOMANYREFS;
 
@@ -233,6 +236,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 
 int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
 {
+	if (!skb_mem_provider_compat(p, skb))
+		return -ETOOMANYREFS;
+
 	/* make sure to check flush flag and to not merge */
 	if (unlikely(p->len + skb->len >= 65536 ||
 		     NAPI_GRO_CB(skb)->flush))
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index aac61fbe419f..212d76ef9672 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4630,6 +4630,7 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 
 	DEBUG_NET_WARN_ON_ONCE(tgt->pp_recycle != skb->pp_recycle);
 	DEBUG_NET_WARN_ON_ONCE(skb_cmp_decrypted(tgt, skb));
+	DEBUG_NET_WARN_ON_ONCE(!skb_mem_provider_compat(tgt, skb));
 
 	todo = shiftlen;
 	from = 0;
@@ -5277,6 +5278,10 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 				err = -EINVAL;
 				goto err;
 			}
+			if (!skb_mem_provider_compat(head_skb, list_skb)) {
+				err = -EINVAL;
+				goto err;
+			}
 
 			nskb = skb_clone(list_skb, GFP_ATOMIC);
 			if (unlikely(!nskb))
@@ -5398,6 +5403,11 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 					goto err;
 				}
 
+				if (!skb_mem_provider_compat(head_skb,
+							     list_skb)) {
+					err = -EINVAL;
+					goto err;
+				}
 				if (skb_shinfo(nskb)->nr_frags &&
 				    nskb->pp_recycle != list_skb->pp_recycle) {
 					nskb->data_len = pos - offset - hsize;
@@ -6588,6 +6598,43 @@ void kfree_skb_partial(struct sk_buff *skb, bool head_stolen)
 }
 EXPORT_SYMBOL(kfree_skb_partial);
 
+/* Return an opaque pointer identifying the memory provider instance of @skb's
+ * net_iov fragments:
+ * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area, 1:1 with
+ *   the binding across RX queues and TX).
+ * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp (shared
+ *   across all areas of an io_zcrx_ifq).
+ */
+static void *skb_net_iov_provider(const struct sk_buff *skb)
+{
+	struct net_iov *niov;
+
+	if (!skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
+	if (!niov)
+		return NULL;
+
+	if (net_is_devmem_iov(niov))
+		return net_iov_owner(niov);
+
+	return niov->desc.pp;
+}
+
+bool __skb_mem_provider_compat(const struct sk_buff *skb1,
+			       const struct sk_buff *skb2)
+{
+	void *p1;
+
+	if (skb_frags_readable(skb1) != skb_frags_readable(skb2))
+		return false;
+
+	p1 = skb_net_iov_provider(skb1);
+	return p1 && p1 == skb_net_iov_provider(skb2);
+}
+EXPORT_SYMBOL(__skb_mem_provider_compat);
+
 /**
  * skb_try_coalesce - try to merge skb to prior one
  * @to: prior buffer
@@ -6620,7 +6667,7 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	 * belong to the same memory provider instance; do not coalesce skbs
 	 * that would mix them.
 	 */
-	if (skb_frags_readable(from) != skb_frags_readable(to))
+	if (!skb_mem_provider_compat(to, from))
 		return false;
 
 	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {
-- 
2.56.1.750.gf70dc682cf-goog

