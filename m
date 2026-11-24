Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533182;
	b=lg2aP4YqN3YRq+G+5KiYY31k12F23ZpdBCAoW/WP7n7X9MAz09chhlSXKOwfqaCPQpw5
	 76fRXIj6S/37kRvNNMZzBxb4Gi5cvNrTLCM8J4Og9pcBVeSzpS3Pgezwjelwx0YTE6eKH
	 FFwfYCBgIlEwCHGaHbJID23hnvxUAhktOYyvdFiB6TgUrs7j9xrlTyHJcEzJa1MxsdYCc
	 TzQ3CarKwnwsZ0TsIZT+0oi5+udvj8BiR1qFRIAhjk8lod3Zm9t1BFAKb1QIpFMeSibrg
	 c3QXs/4wfLjXIBJCUaSopY9fDv4n+vMRQE2wM1yN6XPSjYFvDMYH1KKBTKqPFKOn2cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bxfHWkkO3nvxyaQCZVAlCuVZFf2yV4v6dH4CBU9Lclk=;
	b=l2vmtchcU2JspUVOPV41y1wUM5FkqtDH6ieeI1JHeXPygjK2iAuxXi4z9qJrgdJac99n
	 3vp4DmR/JCc0AE1fqu4vhQ1Cedxhr9hbUnuOdW4amdOkZt3OPNRy+x440M8t4uyVa0VOX
	 Yla8wrfcPc5hmoYr7yFKPEpN+tYyQB+hoafxMh4ONjBFUBAbw6nbrr/WzLlN3Uf4RgAx+
	 8aXrYQJEAmjgmji0aaJ9uphx+ejrIqO9t69De4hrcTWlVm915lCkwPhqDOppaaDB8x9mH
	 gVZsH9F9OOqtjDHe0QoMgYjG6kWz09ctmv2Qh3QcY+OtMBn3FPPz8ohMQ+g9bAJAEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GWP0tpkz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923C8606A33B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923C8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GWP0tpkz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so21796015e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795533181; x=1796137981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxfHWkkO3nvxyaQCZVAlCuVZFf2yV4v6dH4CBU9Lclk=;
        b=GWP0tpkzfhpxD7juj58vRe+R9am9qiGRL76oXsfgW4wWCvOS3MBZBJ81MN8NWGOXc7
         KESusgv+Ir2B8ksirJeBtTPVOtzC5XX5gtFjsFds5ilBa+fUtHo96U0qyTPzG/E0UYjs
         B1x2UFAYU9QMhkptLAriRIvp1xnNMnYNpJsXD3YzB74YlzIkZIbT9TnPzKHh4HNmDsk2
         UocVtxpZJUqho6rva367a0nSqkiFULr5ZDt5bM/D4mS6DVQArYYLHS+5Es5y5d8QwHEs
         nunWuMm66AP5ypR333hGZtqxukMdTHk1h0+IuJqWiOyyRC4cBSR+lcbeGmVIAo5yesFB
         8nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533181; x=1796137981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxfHWkkO3nvxyaQCZVAlCuVZFf2yV4v6dH4CBU9Lclk=;
        b=IlCkCXejPcVvVBUhbXl5w/xUCTlrkdQu92ko57+xcMFc6or2iuTFgQeFljEBcP3GDb
         sUXuYa+goWsM41DHQobpua9uXrPHmsgqXcbG7Zs1yAo7u2HLXJJiWRZSjcKWQUqWTZ43
         O3eT9BvmZm8Y3Ws0yxygd52MWy9kcPXLdEwkByKe47lHswS2gPs+BfxI1avXmD4aI/NL
         edHPWZAFHwdcF903d0LFLlEDzZtdUrXBE+LoraK60UkKYe+cSKvvywUKiQFZLJUZFF+G
         L70OJEHS0oRJ/a0k+mZEpKg3dv4GAdKCJRK5xxnKWoYCN8y2B5Ob7S4gwALW+s66QpzK
         F/tg==
X-Forwarded-Encrypted: i=1; AL+hErEng5UxFRB4fQUSNdSjzwwrG/aNT2gUCJE2YPyIEFd067/8VL33a4BpEoS3QdNF46CGy1MVRmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VrmTLQIgAXlr4d5K4fRwb9rA+q7ZUO9ITjFeLu+84SENTgbwv
	npV4zaJXpboiDO0LgWhPOCLRkBTtklIflrLgaUvH2PR4LPswNHLEROicczGlhChrO7U=
X-Gm-Gg: AZFdTZeu7nWdSLsd0j65Kgfuuj9eLWd+nmj0b2sQL7ZOV4YeUZl4rc12ifY90Bj7Kg5
	EXoFaC4yf56bPuYQX3XrY7bKPDApLguNHstx+SJ2sV2pb36FKrIUPvC+q8xGPEgY/MieQXb90wV
	94o1PmL310So0K6r32L+stXsftHCd1euZ/Y/U3gPy7DZynM7ir6WQH15Wxex7VsBxZH6POv0RGl
	nJtjyUfse2jzFb9K9WhF6kXxBuw0+Q6SExsAC3PwGvGnreFcqKV7Of1sVAxQTP466+xeH93nZzr
	vEm7IE/bnJ97zbMCK2jux44qFfSA9f/D3fojfoupgl5cA70tEBEto9JxDQM0WLfBRrQHUuj01CF
	gnzXoyDOudBkL8iFsS2YjB78hP4OL2g0rzggOCNxJF+EGNTyiMJt8ZQgSoH32N+VtwbEIK6plqy
	gpJVkcuF+5DCwGpPRveGertCb6OYhm11LLjSNyZxNQvsfsuL5Fqolyw6NzYXtzqn886thBK8xLW
	SP36XNiEQ6UzNZ+Ls7jCSpUb15E7MrYajc2AyLAvS2NYmBLVS2eF9BsJ88WSEF8vATeR6sgFgUk
	gB2VwnMEJ8AqJdmdswcK9AG/A9oez7ApHPoYzPfD04nv4xKRDIc=
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr316098875e9.7.1795533180883;
        Tue, 24 Nov 2026 07:13:00 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6c61e53asm29763135f8f.59.2026.11.24.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:13:00 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH RFC bpf-next 2/4] bpf: preserve owned socket assignments on ingress redirects
Date: Tue, 24 Nov 2026 17:12:42 +0200
Message-ID: <20261124151244.1423343-3-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124151244.1423343-1-razor@blackwall.org>
References: <20261124151244.1423343-1-razor@blackwall.org>
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

Ingress assignments can borrow an RCU-protected listener, directly or
through a syncookie request. Redirects can queue the skb beyond that
protection. Peer redirects also cross into another network namespace.

Keep an assignment on a redirect from TC ingress to ingress in the same
namespace when the skb already owns a full socket reference. Acquire a
reference for a borrowed full socket before queuing it and use
sock_pfree_ref to release that reference. If the reference cannot be
acquired or the socket is a request socket, orphan the assignment.

Orphan assignments on peer and egress redirects.

Fixes: 7ae215d23c12 ("bpf: Don't refcount LISTEN sockets in sk_assign()")
Fixes: 9aa1206e8f48 ("bpf: Add redirect_peer helper")
Fixes: e472f88891ab ("bpf: tcp: Support arbitrary SYN Cookie.")
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
 net/core/filter.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index 53c042b267ab..3206b40887c5 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2546,6 +2546,41 @@ static struct net_device *skb_get_peer_dev(struct net_device *dev)
 	return NULL;
 }
 
+#if IS_ENABLED(CONFIG_INET)
+static void skb_redirect_prefetched_sk(struct sk_buff *skb,
+				       const struct net_device *dev, u32 flags)
+{
+	struct sock *sk;
+
+	if (!skb_sk_is_prefetched(skb))
+		return;
+
+	sk = skb->sk;
+	/*
+	 * tc ingress redirects to ingress in the same namespace keep a
+	 * prefetched socket if the skb owns a reference or can acquire one.
+	 * Other redirects and request sockets lose the assignment.
+	 */
+	if (!skb_at_tc_ingress(skb) || flags != BPF_F_INGRESS ||
+	    !net_eq(sock_net(sk), dev_net(dev)) || !sk_fullsock(sk))
+		goto orphan;
+	if (skb->destructor == sock_pfree_ref || sk_is_refcounted(sk))
+		return;
+	if (refcount_inc_not_zero_acquire(&sk->sk_refcnt)) {
+		skb->destructor = sock_pfree_ref;
+		return;
+	}
+
+orphan:
+	skb_orphan(skb);
+}
+#else
+static inline void skb_redirect_prefetched_sk(struct sk_buff *skb,
+					      const struct net_device *dev, u32 flags)
+{
+}
+#endif
+
 int skb_do_redirect(struct sk_buff *skb)
 {
 	struct bpf_redirect_info *ri = bpf_net_ctx_get_ri();
@@ -2558,6 +2593,8 @@ int skb_do_redirect(struct sk_buff *skb)
 	ri->flags = 0;
 	if (unlikely(!dev))
 		goto out_drop;
+
+	skb_redirect_prefetched_sk(skb, dev, flags);
 	if (flags & BPF_F_PEER) {
 		dev = skb_get_peer_dev(dev);
 		if (unlikely(!dev ||
-- 
2.47.3

