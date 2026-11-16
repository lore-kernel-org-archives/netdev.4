Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870425;
	b=Jm53/xnKqjXuSM5venHtMVNb8PN7yoOOx7lngOXewVOBnvFj3ifPgrkIKlwv9qYv0pra
	 VEUDw9ghVjA+p+RMlYmBF0JIzFiPGCmuZC8xNMBSucBUoMZbBNtcoKlFl6CfVmtvJiRB8
	 Rm3YuP08fqC134kDm8D/xd+COsuL0ElmPaNw+nGR9K0/xOrn0G7KfkyhcS0lhjwoMmEns
	 HZkojKCq6KeEHYxtXQaLyszxEUgouNFeID5cpttWv/Gjb0Y2UQ4y0jkGfwcaYalIhDEUs
	 5cknC6cLkllqPgVgavqKfK8sGIORjQFjmq36Umxv1jaMqXrRivOUmdO91Qkxyv00N/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
	b=IW057hDZfxu72Gt2h9drOrcTNGpSB17ymY+RLPYVLETpTcXvXvb23Bd3tUM2RanWnVAc
	 F2vXA1r4RBBNBcA+DZ27nFCh6i0iTJhmIn+AcXPhU3sgNM+VYDCZWoaQ0K7os4687L8yh
	 VK5mi+pCyTMr1pZUBytJM8FeUCqFKQkMAWtvgg4CLG+WnJeBt/SGD52jlftvnYsu0L+lA
	 fIinGwT0wJjsMlB1YftgiZ5zEYpIha7csEWm9ZdebKc3Uh08xzKxH8OQQaLuKh+U6sZHx
	 QXSNx5YFl4d7B73649rO0MVEJa/izlpO/Ycwq+KFJ3GchSWuY+gqEDw5fKZQctXPJhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJR1HdCG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96A60A2608
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB96A60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJR1HdCG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b1bb072438so435283a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870424; x=1795475224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=MJR1HdCG1wWH3hDIRoiEgv1K5UeU+oV3eu2gTuvSPb82VDk0dQt1fxMu575tdzDRGV
         nUFCKCO0UTGdyHAaOGD1thvWdC5zgS6BIK0tGbz0ddiEBrRU3UF7z1PABYXgFTbzfP7t
         p/Fggtbeu2kof0DUPF3WoBkPiM6QK+GVj83Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870424; x=1795475224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=EIHK34Nu8JKhd/yhTYxgazJJ8vlZ/4N/oEmKsmx95X6DzoLiHSPlmYI6krBBxv+8l/
         Gh3usdOP8ZodOKUerjHW9y2Uk+VgYfJywrVmynqCq23sPeBaM3ZPbVPLbW5Q6Jmvr2w4
         10uEB5/Lj9KOk6bVcoNWIIWDNO7QmV2MPfkFMp7YBddwN5wFX1XC6YZGEj7nWsRpEKCL
         NgT7hcXcoYJSDYbMTzXujUFYAYagTgzD+CLwe7AfbgZQwasqR/20VzJrTXrgrg+Oxp8q
         IFUoZX34gkqEaSb/cF1kRBeiD4Aho2qNbB99jzKVnWFEiLyl0C3/bZSw3bcr6ADe6Xrg
         YPbQ==
X-Forwarded-Encrypted: i=1; AL+hErFGPkSpKAmhiqQKGilN/fUwU1rTm6OLca8WfzzEcQIodimSkA/9kljx5k82M+FsIMn4qR/f84A=@vger.kernel.org
X-Gm-Message-State: APuU4Z80X4/eeS0mZknJfDdf9IfWQ0+mZtMd1CAbvzpR4UPh7GEnhisq
	b9Su42vJBphyk4O10QVr47r/aELutw1ryxJxay8yZN9Y1P5dZx/Q27BmPbZkO7qkWg==
X-Gm-Gg: AZFdTZfg8K59F83CR0YyCf78nBLN9KQ361m4IWhW700xV3vTbRjp64hRydBZJB/Y851
	Tmt84TnLyifHDO5EPGrXDnryVLXn7mol7s9p+M2ALSiDcuyGXOuaISf9EfGdIrhmpiHEMrrkLa7
	BWHMWP5LMTuHM2XTS2bdpyOjo1QQXuyFekZoIwjPe3OghEIVR8ePgyKhwcxiaNL1JXCMKWROVty
	XuPWoVdDq4vpXAAbhCaH/R5SHopxD7jJGzCUhoi2Aizx8KbfVDWLqQS2RDlu4FGScky3QwGlDag
	hhE6qefW4g3Es1VuklkMCEn21pCX9wfw8UxzF17JYIJLtfhNarxsIsYliigRAHctGxkmJ4BQY+/
	Le4J9eRenR3YGDMdr+jkEzjB2cMAdsd239335Ea+n5ToGbiE5ts/Ugv9iOM79TikPH6bsZYf6/L
	UomiXZaRErZEiCGY+axnTZpaDHp9ZtJ8ssbO11q6uvf213GeuYWv+p3THML0lZ2DGxO4RKT3HH0
	XMGMaeFUhJNqTyN8flzmYgrmys4OKo14RHEEhxKiAiK6AJFFWWawhFJrwYYqGD7mh1F+C+zSbm8
	uAY6wb06j9Evb3cVFtYDWQewzYTtMv2xi/hKWM+KoDiX6pjO7DdWCV7tm68FspDF8OyoOZW3qzC
	mCnJxFuMW5m0SxINp
X-Received: by 2002:a17:90b:5906:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b1b0b4ffffmr17720470a91.6.1794870423621;
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cddc13275cfsm5035019a12.0.2026.11.16.15.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] mm/kasan/kunit: add page_alloc_highuser_kasan test
Date: Mon, 16 Nov 2026 15:06:27 -0800
Message-ID: <20261116230627.3537051-8-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_highuser_kasan) to verify that, unlike
GFP_HIGHUSER, page allocations using GFP_HIGHUSER_KASAN under
CONFIG_KASAN_HW_TAGS:
1. Get a KASAN tag in page_kasan_tag() across all sub-pages of a
   high-order allocation, and the same tag in the pointer returned by
   page_address(), and
2. Are poisoned on free, so that a use-after-free through the stale
   pointer is reported.

The test fails if __GFP_SKIP_KASAN is added to GFP_HIGHUSER_KASAN.

Tested on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) with
kasan.mode=sync, async and asymm.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 72342137bb18..285b82793bdd 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -423,6 +423,33 @@ static void page_alloc_skip_kasan(struct kunit *test)
 	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
 }
 
+static void page_alloc_highuser_kasan(struct kunit *test)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	pages = alloc_pages(GFP_HIGHUSER_KASAN, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+	ptr = page_address(pages);
+
+	/* Unlike GFP_HIGHUSER, these pages must get a KASAN tag. */
+	for (i = 0; i < (1UL << order); i++) {
+		KUNIT_EXPECT_GE(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_MIN);
+		KUNIT_EXPECT_LT(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+	}
+	KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), page_kasan_tag(pages));
+
+	/* They are poisoned on free, so a use-after-free is reported. */
+	__free_pages(pages, order);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test, READ_ONCE(*ptr));
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2413,6 +2440,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
 	KUNIT_CASE(page_alloc_skip_kasan),
+	KUNIT_CASE(page_alloc_highuser_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.0.611.g1030f0b940-goog

