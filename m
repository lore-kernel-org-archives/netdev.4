Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205661;
	b=X0PY+SyiKL5bgME8TSTbvP7w1f7eTVE7lm1jQyd9UrvbhY2ALP16eRcJORmXQHkPeBeS
	 F5lsxOOzLxQDgZcDk2kvdq8jLH4ca9BB6kozRBrYX84Ijb/OgUloVLYRviJjdY+zVDH1Y
	 /7BV6WJtmmtyMExftcqncYcRs6GlQz+Q96VArB/v6BVd2QpQUCIVuzvHSc3NYUt8d2OJD
	 u+pTIYqVjoplyJrop48giUbE69lpFyWkjayyg2HkLoVztDOiwi4lDhKJMfYVP301uK+hK
	 a7Jo+T+IXvm6/iKgbFQ6Mt2fBjM3efYrpP30I0NntHuHav3DsBPo2Cr0ZzH78n/No9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RYXg0B4XcZd7l5X1Kl/tzzwPWSC8fGJzkL6gcZJW3y0=;
	b=IkX0t/e2jhTkq9OUVdho2KrQvJjCkeKBpmyalfWVJX2Cyg9MSGgsGnCpVQm9/TPgF5/h
	 SMTv2zJq4KXStfMuH3ZOLtY8q2x6/8mzCkIRjSYIUnqekfh+YDw1oyN9+jZjxaunAh0Dh
	 +v2fiPf8M8LMnw+1AhUlFyXh9dDXIdjL0QizhB6khN8KANCdjk1fOgQkhATMDFbp39S0a
	 Qqk2W4vuRnO/eYUINGoNz2CmarA9bzdBpyOsaaaXNJgneMIuNXsOFjp2+J4rFzGEIh6RS
	 EkkgWDeTAd4X7T/PYMrYtJGn8esbLY37Qg6Wd6xTKl+uRPFiOSRRF2rgKQ+//lgslyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VPJZtaTy;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E3606A6C4
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6E3606A6C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VPJZtaTy
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b53bfc9534so366081c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205660; x=1795810460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYXg0B4XcZd7l5X1Kl/tzzwPWSC8fGJzkL6gcZJW3y0=;
        b=VPJZtaTyp72bsdGUOZbxiMs+5buZSckqYEb7Ym0a/hr95OrFaEOj8U3DcLnrXzZRRU
         qrxmXv7pS9g+4KEdKYUhymBm4kqsCE7O0o5SmouqLTnzERnQ3s7U0vO8A/XoCFUCu9Je
         65smX703li2Mc/hb2dAPA+o1QgkJyed78ovlm+H2K6oYmq9Ptmj/95y/ZC0mnqACBd/t
         Ba3bv3Ah1+7hgYFpLuZN5AN9FKvjte4aghBYADj3P5o835uN6J7Io1yCbDImmPfDlMj+
         UMbiwnbTct16waVf/Hylwh9aS5+fZd7oVuYHxqAKdepNg6ALUzhHyDW6gUEzDrIq3ZqQ
         XI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205660; x=1795810460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYXg0B4XcZd7l5X1Kl/tzzwPWSC8fGJzkL6gcZJW3y0=;
        b=nXBvC6p1gng+iP/PdDgcxd/I9SEoRL8DUj7GgK2Suszo6DflfoEXzBkgiyVro2+sr9
         uHYfcV61bwds8ML4XXKKbHYGId8MP1KCMcIPhvc2OOVwa4TVYJ+roKsVVxfnv8bmFQg+
         zxs4AUnt2QRcn+awP+H0GGnwA2YJBfg1rpW6QxKHDOoExdvmyFpcVJhg1fqxnCyE4KnC
         ctd044oC+fA8B8Ta5Fu506wMKiPDmbqUcKi/67s2ttnvwCfmMvMp77gWLTTBnBkXLucH
         pRlGuXmWME4iwRnEbbfbwEHp9lwgStInP5JdturfPFlgW4S4mPLzwUyNbBMUjlJfOhUJ
         Zdrg==
X-Gm-Message-State: APuU4Z8djU69N2MMkJDGUedk1bTQ9kjL+ZkTEwNt1y5bnK0NunEgEumI
	cGFFpQNCtOh4A6TkC3EA99jWZNNp18U+cWOOZOMyHYS3MqHn8hFdsroedi9cv7gidr9JDReKpqj
	zKevHYQuR7nIzSNAM3fvM0gbEarROQy4X6fBMEKiIPmVkO9zGooNzJ4MO5LCn+2f79eld3m6hKc
	sWVSNlGIBcnELksy8Ul8dBOvOSl4GDEvFAhSnQkIP/aJDK+hvWroqfNzr6NaJWyM8=
X-Received: from dldyq13-n2.prod.google.com ([2002:a05:701b:454d:20b0:1b2:3bcd:9068])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4182:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-1b5568a2ef4mr4036848c88.22.1795205659863;
 Fri, 20 Nov 2026 12:14:19 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:08 +0000
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
Message-ID: <20261120201408.3445445-8-almasrymina@google.com>
Subject: [PATCH net-next v6 7/7] net: kunit: test incompatible memory provider rejection
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

Add KUnit subtests in netmem_ref_test_try_coalesce() verifying that:

- skb_try_coalesce() rejects coalescing two NET_IOV_DMABUF skbs
  belonging to different bindings, and
- skb_try_coalesce() rejects coalescing a NET_IOV_DMABUF skb with a
  NET_IOV_IOURING skb.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/net_test.c | 49 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 1cfa947c11f2..3efff3f5368a 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1639,9 +1639,10 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 		.nid = NUMA_NO_NODE,
 	};
 	struct sk_buff *to, *from, *clone;
-	struct net_iov niov = {};
+	struct net_iov_area area2 = {};
+	struct net_iov niov = {}, niov2 = {};
 	struct page *pp_page, *reg_page;
-	netmem_ref pp_nm, niov_nm;
+	netmem_ref pp_nm, niov_nm, niov2_nm;
 	struct page_pool *pool;
 	long base_pp_ref, base_iov_ref;
 	int base_pp_page_ref, base_reg_ref;
@@ -1753,6 +1754,50 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	consume_skb(to);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
 
+	/* 4. Reject coalescing net_iov skbs from different bindings. */
+	net_iov_init(&niov2, &area2, NET_IOV_DMABUF);
+	niov2_nm = net_iov_to_netmem(&niov2);
+	netmem_set_pp(niov2_nm, pool);
+	netmem_or_pp_magic(niov2_nm, PP_SIGNATURE);
+	atomic_long_set(&niov2.desc.pp_ref_count, 2);
+	to = alloc_skb(0, GFP_KERNEL);
+	from = alloc_skb(0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, to);
+	KUNIT_ASSERT_NOT_NULL(test, from);
+	to->pp_recycle = 1;
+	from->pp_recycle = 1;
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, niov2_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov2_nm);
+	KUNIT_EXPECT_FALSE(test, skb_try_coalesce(to, from, &fragstolen,
+						  &delta));
+	consume_skb(from);
+	consume_skb(to);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov2.desc.pp_ref_count), 2L);
+
+	/* 5. Reject coalescing net_iov skbs from different providers. */
+	net_iov_init(&niov2, NULL, NET_IOV_IOURING);
+	to = alloc_skb(0, GFP_KERNEL);
+	from = alloc_skb(0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, to);
+	KUNIT_ASSERT_NOT_NULL(test, from);
+	to->pp_recycle = 1;
+	from->pp_recycle = 1;
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, niov2_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov2_nm);
+	KUNIT_EXPECT_FALSE(test, skb_try_coalesce(to, from, &fragstolen,
+						  &delta));
+	consume_skb(from);
+	consume_skb(to);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov2.desc.pp_ref_count), 2L);
+	netmem_clear_pp_magic(niov2_nm);
+	netmem_set_pp(niov2_nm, NULL);
+
 	page_pool_put_full_page(pool, pp_page, false);
 	page_pool_put_full_page(pool, pp_page, false);
 	__free_page(reg_page);
-- 
2.56.1.750.gf70dc682cf-goog

