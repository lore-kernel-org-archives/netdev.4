Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461720;
	b=aP2ydXeVQNibbD26/KxAWaKnBrNG1oLeJHz4dXaBAny6u5W+4dybgM5Ai/N9nA2+uIHg
	 qAqsc5iUGN9DvxQwAl6QPYZXOCHJ8uW9wqnfERbCPHeklZZsBl59L+/w5MMzngJmyDBxk
	 Us7ofVboA293iEBydP+FQBw7yajd44Gi3cR02Gcqbr8qDa/ZK9idGWQDjribz/NZfPHDc
	 X+EWOJpE+mtcxQPE+KoVnd4owQvyMAlAM7OJvKF78b0I8ZZi0T9uTjjnMlBmoRiYsBXWl
	 alSreq9VRLA1zow9uUXv3fssJgRvTwicHESvUPLYT9963jd+iwzC6l5B68xY2jsKRxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9ZZKtdNxzmNbD/qLZUk8lEJCDzZaRxZ+I5E787FEO+4=;
	b=LS3g2LlAKQxEWSYqzRYKCi30pTHwXUqy71YLGIG+LexXH1ixpm24EnJDgtJf0GukIH0U
	 8qI9trJlKPztjPr+c9lkezYc0to2M19hST+yWfR8gehbNxm0pnItHuXo/SD4RWPlHaSGD
	 3sXEoCNnzBXq1SyO1o2DVk6llhUvEg1dPIjDdhJ7hkHE3EBAh1HYh+liGlKj/P4cp9g/M
	 BYUAAsMDnpTEzdYTJsdYhACQIc6z4rYacptpU7qxaEnRw2F/+qRjloFHOHxtxA7pFyD8C
	 /ANaX/Rikb3Xd6pusd6rJ9pXSy72nv78boKxm0Yde1yfw8KoO++1Dfv4M39Y8jb7LSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KeJNVWI4;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A3606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KeJNVWI4
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6600383eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461719; x=1796066519; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZZKtdNxzmNbD/qLZUk8lEJCDzZaRxZ+I5E787FEO+4=;
        b=KeJNVWI4caPKpAtF2r42WmNkb/6+AQatU8wnlhGuQH2MRmTI1Cj9l0WeykRVA0PUSY
         Ya43/UnJd3onilxYqwGOB8dfmsTXNPHq75wx1ZmI0ofMnamlnokf6GXJwwOipdR7u4dg
         cb7OdmIZagea9MGIRWLmhBJBaRXNGH1CeoVD4W11LICrmlaCV3xMfaqbt5FAQdgpVx97
         wIfbD2fW79oeUCtLamnjwVj1twMQUsXOqPr5q52WjJQloGen0/dgiHnknq5TiGltiQA6
         5ZaSMauaMIKlSmkZLa2hZSUzj9U7mvYXLH7y1tJLmQWvcogWc5wv5rzs0Qj0XWTx23Re
         +3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461719; x=1796066519;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZZKtdNxzmNbD/qLZUk8lEJCDzZaRxZ+I5E787FEO+4=;
        b=wptfzDnvPaTGVNrwJj13bxQ+VBTS/tFR0Hf3nxJwoCeubuL4GhaZvwbI+lRmgqQRqy
         54Dbw4u9a4ElaXerGJ+WD76wWOMysuusgqQGyn6qJKaGomw142Gx1XOYpoBXZBY0Crx9
         No7l02qdDEaX6Pbc/5NO0GiiMJz53SYFh5RUFlnb6bjMrTmhcp3x2r9i2212oDJEQYRN
         T6usJeBW3jrOQ9PqdoUaWcQeZEo3SSmtB4IEunGCfO9M8U5hPsHpSsdfnESffdp5EFmG
         vK+lfsclRTbI70KdwexGky8HJyl7V+JCfVBo0ymFN6BJitV5dwlc3iM5BozTV18MlR6H
         4qBg==
X-Forwarded-Encrypted: i=1; AL+hErEYaxYVLRoF7Jd1EvXu1N7+gj37Ac59L90R6FKJvhddWZ2TofhcKPx6hQAPTiu5upflgvhNs2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BS2lhghFO+/nh2ovtmtxzGIitEcr68IwM6QtoRU8iD9GCzafg
	rdxS9oQRlYmnR7GOy/g82oyhfCQ+2ffsIhWzEQ3vVuAWKXqgS1fmwM34MO4RIrj1ydu7haH4Vej
	kDNqbF8BitBoCQfB66suo4w==
X-Received: from dybna20.prod.google.com ([2002:a05:7300:cc14:b0:386:95bc:ec27])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7488420eec.24.1795461716968;
 Mon, 23 Nov 2026 11:21:56 -0800 (PST)
Date: Mon, 23 Nov 2026 11:21:50 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123192150.4012944-1-nilayvaish@google.com>
Subject: [PATCH net-next] net: selftests: use netmem_get_pp_ref_count_ref() in net_test
From: Nilay Vaish <nilayvaish@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

The page_pool KUnit cases read page->pp_ref_count directly. The
page_pool fields of struct page are being moved behind struct
netmem_desc, and netmem_get_pp_ref_count_ref() is the accessor for the
reference count.

Read the count through a small helper built on that accessor, and pass
it the netmem reference that the tests already hold for the page. The
order-1 block of netmem_ref_test_pp_page() holds the reference of the
tail page while it checks the count of the head page, so it converts the
head page explicitly.

The test no longer depends on the layout of struct page. No functional
change.

This patch was written with the help of an AI coding assistant (Gemini).

Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 net/core/net_test.c | 133 +++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 64 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 19f422300d9c..35d57a086427 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -727,6 +727,11 @@ static void netmem_ref_test_page(struct kunit *test)
 }
 
 #ifdef CONFIG_PAGE_POOL
+static long net_test_pp_ref_count(netmem_ref netmem)
+{
+	return atomic_long_read(netmem_get_pp_ref_count_ref(netmem));
+}
+
 static void netmem_ref_test_pp_page(struct kunit *test)
 {
 	struct page_pool_params pp_params = {
@@ -748,39 +753,39 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, page);
 	netmem = page_to_netmem(page);
 	base_ref = page_ref_count(page);
-	base_pp_ref = atomic_long_read(&page->pp_ref_count);
+	base_pp_ref = net_test_pp_ref_count(netmem);
 
 	/* Layer 1: netmem_inc/dec_ref always use non-pp refcount */
 	netmem_inc_ref(netmem);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref + 1);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 	netmem_dec_ref(netmem);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 
 	/* Layer 2: napi_pp_get/put_page use pp_ref_count */
 	KUNIT_EXPECT_TRUE(test, napi_pp_get_page(netmem));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	KUNIT_EXPECT_TRUE(test, napi_pp_put_page(netmem));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* Layer 3: skb_netmem_ref / unref obey recycle flag */
 	skb_netmem_ref(netmem, false);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref + 1);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 	skb_netmem_unref(netmem, false);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 
 	skb_netmem_ref(netmem, true);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	skb_netmem_unref(netmem, true);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* Layer 4: skb_frag_ref / skb_frag_unref match on pp_recycle=1 & 0 */
@@ -792,23 +797,23 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 
 	skb->pp_recycle = 1;
 	skb_frag_ref(skb, 0);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	skb_frag_unref(skb, 0);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* pskb_copy on pp_recycle=1 skb propagates pp_recycle & pp_ref_count */
 	copy = pskb_copy(skb, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, copy);
 	KUNIT_EXPECT_TRUE(test, copy->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(copy);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* skb_zerocopy on pp_recycle=1 skb propagates pp_ref_count */
@@ -819,12 +824,12 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, skb_zerocopy(copy, skb, skb->len, 0), 0);
 	skb->head_frag = 0;
 	KUNIT_EXPECT_TRUE(test, copy->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(copy);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* skb_clone + pskb_expand_head preserves pp_recycle and pp_ref_count */
@@ -832,12 +837,12 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, clone);
 	KUNIT_ASSERT_EQ(test, pskb_expand_head(clone, 32, 0, GFP_KERNEL), 0);
 	KUNIT_EXPECT_TRUE(test, clone->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(clone);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* skb_split inside linear header & inside nonlinear page_pool frags */
@@ -853,7 +858,7 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, split);
 	skb_split(skb, split, 16);
 	KUNIT_EXPECT_TRUE(test, split->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	skb_shinfo(split)->nr_frags = 0;
@@ -869,12 +874,12 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, split);
 	skb_split(skb, split, 32);
 	KUNIT_EXPECT_TRUE(test, split->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(split);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* skb_segment on pp_recycle=1 skb propagates pp_recycle to segments */
@@ -885,12 +890,12 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	split = skb_segment(skb, NETIF_F_SG | NETIF_F_HW_CSUM);
 	KUNIT_ASSERT_FALSE(test, IS_ERR_OR_NULL(split));
 	KUNIT_EXPECT_TRUE(test, split->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	kfree_skb_list(split);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* skb_shift balances pp_ref_count across split, partial coalesce,
@@ -905,17 +910,17 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, split);
 	split->pp_recycle = 1;
 	KUNIT_EXPECT_EQ(test, skb_shift(split, skb, 16), 16);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, skb_shift(split, skb, 8), 8);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, skb_shift(split, skb, 24), 24);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	KUNIT_EXPECT_EQ(test, skb_shift(split, skb, 16), 16);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	skb_shinfo(split)->nr_frags = 0;
 	consume_skb(split);
@@ -927,7 +932,7 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	skb->pp_recycle = 0;
 	skb_frag_ref(skb, 0);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref + 1);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 	skb_frag_unref(skb, 0);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
@@ -946,15 +951,15 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	page = page_pool_dev_alloc_pages(pool);
 	KUNIT_ASSERT_NOT_NULL(test, page);
 	base_ref = page_ref_count(page);
-	base_pp_ref = atomic_long_read(&page->pp_ref_count);
+	base_pp_ref = net_test_pp_ref_count(page_to_netmem(page));
 
 	netmem = page_to_netmem(page + 1);
 	KUNIT_EXPECT_TRUE(test, napi_pp_get_page(netmem));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(page_to_netmem(page)),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	KUNIT_EXPECT_TRUE(test, napi_pp_put_page(netmem));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(page_to_netmem(page)),
 			base_pp_ref);
 
 	skb = build_skb(page_address(page), PAGE_SIZE);
@@ -968,14 +973,14 @@ static void netmem_ref_test_pp_page(struct kunit *test)
 	skb_put(copy, skb_tailroom(copy));
 	KUNIT_ASSERT_EQ(test, skb_zerocopy(copy, skb, skb->len, 0), 0);
 	KUNIT_EXPECT_TRUE(test, copy->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(page_to_netmem(page)),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(copy);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(page_to_netmem(page)),
 			base_pp_ref + 1);
 	consume_skb(skb);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(page_to_netmem(page)),
 			base_pp_ref);
 
 	page_pool_put_full_page(pool, page, false);
@@ -1172,7 +1177,7 @@ static void netmem_ref_test_release_data(struct kunit *test)
 	skb->len += 64;
 	skb->data_len = 64;
 	base_ref = page_ref_count(page);
-	base_pp_ref = atomic_long_read(&page->pp_ref_count);
+	base_pp_ref = net_test_pp_ref_count(netmem);
 
 	page_pool_ref_netmem(netmem);
 	clone1 = skb_clone(skb, GFP_KERNEL);
@@ -1184,14 +1189,14 @@ static void netmem_ref_test_release_data(struct kunit *test)
 	consume_skb(skb);
 	KUNIT_EXPECT_TRUE(test, clone1->pp_recycle);
 	KUNIT_EXPECT_TRUE(test, clone2->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	consume_skb(clone2);
 	KUNIT_EXPECT_TRUE(test, clone1->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	consume_skb(clone1);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref);
 
 	/* All 4 combinations of (unclone skb vs clone) x (free order) */
@@ -1212,24 +1217,24 @@ static void netmem_ref_test_release_data(struct kunit *test)
 						 32, 0, GFP_KERNEL), 0);
 		KUNIT_EXPECT_TRUE(test, skb->pp_recycle);
 		KUNIT_EXPECT_TRUE(test, clone1->pp_recycle);
-		KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+		KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 				base_pp_ref + 2);
 		KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 
 		if (i & 2) {
 			consume_skb(clone1);
 			KUNIT_EXPECT_EQ(test,
-					atomic_long_read(&page->pp_ref_count),
+					net_test_pp_ref_count(netmem),
 					base_pp_ref + 1);
 			consume_skb(skb);
 		} else {
 			consume_skb(skb);
 			KUNIT_EXPECT_EQ(test,
-					atomic_long_read(&page->pp_ref_count),
+					net_test_pp_ref_count(netmem),
 					base_pp_ref + 1);
 			consume_skb(clone1);
 		}
-		KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+		KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 				base_pp_ref);
 		KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	}
@@ -1248,18 +1253,18 @@ static void netmem_ref_test_release_data(struct kunit *test)
 	ext = pskb_extract(skb, 16, skb->len - 16, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ext);
 	KUNIT_EXPECT_TRUE(test, ext->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(ext);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 
 	/* Carve + trim + skb_condense ref/unrefs pp_ref_count cleanly */
 	ext = pskb_extract(skb, 16, 48, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ext);
 	KUNIT_EXPECT_TRUE(test, ext->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(ext);
@@ -1268,11 +1273,11 @@ static void netmem_ref_test_release_data(struct kunit *test)
 	ext = pskb_extract(skb, 48, skb->len - 48, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ext);
 	KUNIT_EXPECT_TRUE(test, ext->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(page), base_ref);
 	consume_skb(ext);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 
 	/* skb_morph drops old skb data via skb_release_data */
@@ -1285,7 +1290,7 @@ static void netmem_ref_test_release_data(struct kunit *test)
 	clone1->data_len = 64;
 	skb_morph(clone1, skb);
 	KUNIT_EXPECT_TRUE(test, clone1->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(netmem),
 			base_pp_ref + 1);
 	consume_skb(clone1);
 	kfree_skb(skb);
@@ -1364,7 +1369,7 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	netmem_or_pp_magic(niov_nm, PP_SIGNATURE);
 	atomic_long_set(&niov.desc.pp_ref_count, 2);
 
-	base_pp_ref = atomic_long_read(&pp_page->pp_ref_count);
+	base_pp_ref = net_test_pp_ref_count(pp_nm);
 	base_pp_page_ref = page_ref_count(pp_page);
 	base_reg_ref = page_ref_count(reg_page);
 	base_iov_ref = atomic_long_read(&binding.ref.data->count);
@@ -1424,14 +1429,14 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, IS_ERR_OR_NULL(segs));
 	for (seg = segs; seg; seg = seg->next)
 		KUNIT_EXPECT_TRUE(test, seg->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 4);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	kfree_skb_list(segs);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 2);
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 
 	/* 3. Mixed GRO frag_list (head pp_recycle=1 + list pp_recycle=0):
@@ -1468,13 +1473,13 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, segs->pp_recycle);
 	KUNIT_EXPECT_FALSE(test, segs->next->pp_recycle);
 	KUNIT_EXPECT_FALSE(test, segs->next->next->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref + 3);
 	kfree_skb_list(segs);
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref);
@@ -1512,13 +1517,13 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, segs->pp_recycle);
 	KUNIT_EXPECT_TRUE(test, segs->next->pp_recycle);
 	KUNIT_EXPECT_TRUE(test, segs->next->next->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 3);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref + 2);
 	kfree_skb_list(segs);
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref);
@@ -1558,12 +1563,12 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, segs->pp_recycle);
 	KUNIT_EXPECT_TRUE(test, segs->next->pp_recycle);
 	KUNIT_EXPECT_FALSE(test, segs->next->next->pp_recycle);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	kfree_skb_list(segs);
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 
 	/* 6. skb_zerocopy -EFAULT rollback when from->head_frag (pp_page) is
@@ -1584,12 +1589,12 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, seg);
 	skb_put(seg, skb_tailroom(seg));
 	KUNIT_EXPECT_EQ(test, skb_zerocopy(seg, head, head->len, 0), -EFAULT);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 1);
 	skb_shinfo(seg)->nr_frags = 0;
 	consume_skb(seg);
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
 
@@ -1608,7 +1613,7 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, seg);
 	skb_put(seg, skb_tailroom(seg));
 	KUNIT_EXPECT_EQ(test, skb_zerocopy(seg, head, head->len, 0), -ENOMEM);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 1);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	skb_shinfo(seg)->nr_frags = 0;
@@ -1616,7 +1621,7 @@ static void netmem_ref_test_skb_segment(struct kunit *test)
 	consume_skb(head);
 	skb_shinfo(head)->flags &= ~SKBFL_ZEROCOPY_ENABLE;
 	consume_skb(head);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 
 	page_pool_put_full_page(pool, pp_page, false);
@@ -1666,7 +1671,7 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	netmem_or_pp_magic(niov_nm, PP_SIGNATURE);
 	atomic_long_set(&niov.desc.pp_ref_count, 2);
 
-	base_pp_ref = atomic_long_read(&pp_page->pp_ref_count);
+	base_pp_ref = net_test_pp_ref_count(pp_nm);
 	base_pp_page_ref = page_ref_count(pp_page);
 	base_reg_ref = page_ref_count(reg_page);
 	base_iov_ref = atomic_long_read(&binding.ref.data->count);
@@ -1684,11 +1689,11 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
 						 &delta));
 	KUNIT_EXPECT_EQ(test, skb_shinfo(from)->nr_frags, 0);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 1);
 	consume_skb(from);
 	consume_skb(to);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 
 	/* 2. Cloned pp_recycle=1 from (pp_page + non-PP reg_page fallback):
@@ -1711,14 +1716,14 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, clone);
 	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
 						 &delta));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref + 2);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref + 2);
 	consume_skb(from);
 	consume_skb(clone);
 	consume_skb(to);
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&pp_page->pp_ref_count),
+	KUNIT_EXPECT_EQ(test, net_test_pp_ref_count(pp_nm),
 			base_pp_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(pp_page), base_pp_page_ref);
 	KUNIT_EXPECT_EQ(test, page_ref_count(reg_page), base_reg_ref);
-- 
2.56.1.839.g22a8290db9-goog

