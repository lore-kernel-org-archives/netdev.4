Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404684;
	b=rd9O/oamojOQ9ntMzPjLm+ZBQUHkTdWqzs0fzZq/qZOfXJFegiUrgjB4BAozlOwPTZ8R
	 mPSHfrszgoCS7AamqzpH/Vw28wzDVt6Hki1NNc0bznoUkdIRpgsmE9WHdRQ01IBu0KwaY
	 uyPOM9Yw8CHpWCIEroYv+EhN1ZGKWEz27NnV5E0MND+tO5LBIKlrQ8kXZqMaIdR3+syqD
	 /+Doyf4+e/12K7H859NUgRLOzcjqBvezDyAPIA98h231ngInDTNQDJ32GTO9d+Daf3AjO
	 AfYK6nMC31T3Km5m7iDMmqDJVAQqaxQjv7L2fDvWSM/0Ad3wsG7b5Z+j3VKHoiujDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
	b=ZGSwiNZfjPJDA40kqTD+5wpe4RJiYVUuJqqpjgcSASREgKp+idd27dhmcqpQ7KMVggrG
	 PPa2oV9IBTxh7RpDMBuaEgYICh+2P5Eq+DRCwwMatVDIpEQVZiAZU550uUSNmI6c2pSnC
	 EphHTvTJ242FgLVm6+wyLfiCOtWeJDpG2AK23wiEZ/8Miwj+zrnXrh3o4HI7Pxvq9DNUu
	 OYq1cJbwgo5e+fU87wxx6nQculwzZD/MncN2oh0FrYegfDG8dREHxyH84AmXwcnwFc0vv
	 ChIDHx2LSIvBVES6NmKxxrDfKebXP8DYbCkNw5Tq20LKpTOTZhuk+u03QngJEKUNoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AxPYQPzz;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B3606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AxPYQPzz
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so9327a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404683; x=1796009483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=AxPYQPzz//LoTvh9Mr24xcYoaLF4FfIftHMSVYvNWkkd2ORREvf97GRTmlchcg5pA/
         BY7zxNGJ9LLSAtVEdx572axC+dtCMdmu2MGH8ThCGPY3DEEFyqzqLt5DgIuv64ua28yS
         2YY/pj6BGymwB0NT9sh7rI/OFa3aN3Yg7uhBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404683; x=1796009483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=vRNpOUB6dPnL2bXGtsraSR0JhOBhXSwcoPj94/13lBMVCihverVZHni/D+ZEuCBTCl
         2GqJV8aHwNOJa7rLZq/0puHZ7j0/w/HelD75vpW1Sq27+C4A7wtkwZ8DBVmgOVV4wtw3
         SMl43pNORgk0TktlZ20vrRZlFGl36HIDf5QBXSkBRTKfTPn3OqCfHghkVddPO65CBA11
         t9SRZe2bgAmP7fm716+NxxtYJQefNuN3PeknYJRBh9U6uNXa8Q8hEn7w/02otITzt+xz
         nhaIyeRMe9GSREIYhzcO6ohWSR8FZI4z974Us3tsVk8/zOplaZmPXOQ8B54CQEwy/+8T
         PpSQ==
X-Forwarded-Encrypted: i=1; AL+hErG5ZGoerptTkDIGKi8X+EqoxQodwwjn7cKmXH16r4VZMQecgfPLMZVLrtkPIaO46aY+BC5VBK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YRVqkb7vldsVWPZYcTYKT2qnVT85CjoBDmZBizOsWpPBv6+pw
	T4eL0GtMudjYaFYKqcXJWGfo8jd3YOh6GOc6531DRK1jtudgVeen2tA7B0Cqq3EdGA==
X-Gm-Gg: AZFdTZeh41IFKyMj1oaEkpRqBYKeVIALAmTj3Na7NT3pZbi7YSpHs36DCRBADk5oWaw
	KDuZUurzvn7QAWlzL/hrBa6a2CnjKcSW1ka68rlcRSdVp439by0ytKJz8M9LO+0imwgZsomKysV
	PJkt2Cr7zFU8EIR1AiK1DbcwnZhdFoXb0bJfogN0jBdOaioVC1foQzRsPc3OTlA/cvZ8MaFvftU
	bdN2VMZCBIOpztojBAbD+j1KB7hHopVGnOl9Nz8mVzglifzQyqsvHVdoXILiCAtf9yX7Ej/92AH
	DnKTwX7K6gRvLRRzA4jmgeCarPjIrKNrJ6fFQoJ0994l0uOxfJ7ySwd+RGIGTVi3mCHgwD87BMW
	ecne4tUQKXANRbvSWXyp16jMScK0SrBlrmI1aiKyapOhVzKu5hiSNeWFz4sz/ZEDe4SsBJdN9Bm
	sKoFvhaNjlIGVdy8P3748MLWzLmo2l7W3o7b7t+qyOzA5v8JodUNhwih19VvpQDMa3A6fMiHPYB
	FKPYo6EWhG3URhzE8AUFZasTFUq/4om7dfWxj69FfmKcvvGeoUBa2tqqHqbhym5xiiobEbpHO/c
	K8gS4Tjr8DE2ACMux3DPKHwKh6lhDxEFzkqzAOLeNyRfU1mKDtmBtXcLpfYkkX7vQTQ0og==
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr15663729a91.0.1795404682704;
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad48786sm15745736a91.9.2026.11.22.19.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
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
Subject: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Sun, 22 Nov 2026 19:31:10 -0800
Message-ID: <20261123033111.2349160-2-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123033111.2349160-1-jeffxu@chromium.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org>
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

Move __GFP_SKIP_KASAN from GFP_HIGHUSER_MOVABLE to GFP_HIGHUSER so
non-movable userspace page allocations also skip KASAN tagging on
allocation and poisoning on free under CONFIG_KASAN_HW_TAGS.

GFP_HIGHUSER_MOVABLE already skips KASAN because user pages do not hold
kernel data structures and tagging every 16-byte MTE granule on
allocation and free is expensive. GFP_HIGHUSER has the same contract and
differs only in being non-movable, used mainly by DMA-BUF, DRM/GPU
buffers, and non-movable HugeTLB.

On an Armv9.2-A device (6.12 kernel, kasan.mode=sync), this reduces
32 MB /dev/dma_heap/system alloc+free latency by ~80% (~59% alloc, ~98%
close) and improves an app-loading OpenGL benchmark by 15-23%.

Callers that access GFP_HIGHUSER pages through kmap_local_page() or
page_address() (such as ramfs, pipe/FUSE buffers, kexec, and RDS) lose
HW_TAGS checking on those pages. None of them store kernel structs
there; this matches the trade-off already made for GFP_HIGHUSER_MOVABLE.
Generic and SW_TAGS KASAN are unaffected.

Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..bb54c7abfb02 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -376,8 +376,8 @@ enum {
 #define GFP_USER	(__GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
-#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
-#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)

base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
-- 
2.56.1.750.gf70dc682cf-goog

