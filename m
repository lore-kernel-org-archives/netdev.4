Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870409;
	b=AZOfV1nMhus5HwLN+UzDH0J0V0ZVytvLvpsMrO2MELEwl0yi7OJCGWPy4K8DOMVmgU0x
	 ZB9dqsNXuFbQU7Vyg5g8K24PX+nD78dkaUYcZ0HsvMdxZVyiYCEHTPpJccE+42isuPChT
	 YLV9k2WOUxv+NfrUMTLneuuaDvj6hV9xZ9kYdI57TdnSPV9ovG2Y2ZRv5Wv1v+t1csYvl
	 D9lBhnsg5vd6Q65KREIrlU94ysBcg0G3hF9iu6Dq9qA4glF5pOTtxCr0j+VBUtq9qKDBZ
	 vg3Dton1dsxKm6bo3YTEzd/H6QTWR8YtNrtrV7rqNhby7ifUKHNOk61UQv9mQNSYqDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
	b=y5cvo2NOcaKPJ6ahhFBNJSpCq2F39vHNxvY+ZQ5nx9tfmzBztvEUz0QC/aqaEaCLlPp9
	 2cSJHMjV9MVZWpl2aXo6iovyn5aMtLG6b3cXfKEnTY2F6dA571OSqVn4cLUuI1lLqwZlg
	 juuSa+W5ksZA59gH1WyTZFFBzpQblglUDdifdH3TT49wDBIMG/4FwFM0YKLR78/GFD/qd
	 ICSfalWAJoh4JXLyeysdDV/vD2HAvn0eGQeyOAUq7whJX+0LDWzqXFukNnPCvkzb+V4hB
	 0LRZMJYCPHPO8aSgNyZGIctnVP+CLTBh3GO98QfL5acUU9K/YoUam/Ek7Y7p2C2absA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kk6K2Mds;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C923A606A8A5
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C923A606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kk6K2Mds
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69a8bf5e5so209364a12.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870408; x=1795475208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=kk6K2MdsQgdCogkjrc1s8JbIoFQAiggPJV7wUYjqOZ6QuiZpbJJvKe9lzn7JrPs2BS
         XjdRRTRvTuEkLTTU0BybV3HCSYy8668HmwSRmTX/PQgwdZujyZiZT2sd7WxcQHk2u1Zp
         xhfLBrYKJ8E8wCfRTNb8MH5R9pBQK8BDFXS3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870408; x=1795475208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGcgw87oL+/aayCG1LZRiyRs5ahRDiLzP62eRx4RAEM=;
        b=vpzDkIqJwmpp1oER7kLHzilCrL0dAHxNHilbToOj4gMUHpAFqD//QNDcr6aEDNdDwu
         u2m3GFcmeJiXEpYN/jnyAtO0jtDJlfAPqTO1hZ9q9w6Q3kzC49Bi3Fm0aDLplg6oPskc
         E2ljBIJHSYxXXXK+fmQqPBucv29f7E8Zv6yeFEjp1Y4dUzZ3MMfwDUDCZulxEZ+eTOJA
         S9SAGLnJ0ey76eHs9cgxuGNEyXcfMfKN7Xzk870lG5uFhgyHhypLoIHH5qjF3YNYqXZn
         aa+VS34+MwMKhHblYwGhpJiFz7L28V6phy2E87ytR6Lfl4Fjox2h6uus5M8bSoJEfvqt
         v7XA==
X-Forwarded-Encrypted: i=1; AL+hErEWSmnOcNysOkBXP1eUfA4s0T63jq9qAlSmH3dWQP5okrfsl3FUYpL2rpMIpnc24NYN30pK7l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VwIq0NXdMWYAgd2jvO8kHYc/N5ML5hEYe8EExFGE/wTiamkDE
	Vz6c0ln28SJqV+29alvP78+KHEMB2fbN9bu9ZNuIKlgwIhEidRKc03+RfttPV1mZyQ==
X-Gm-Gg: AZFdTZd6UAL2QbhFo0UZTZmfCxDwWV4ZNAd/LvhOfc0gQHcRjO8Bxi2Ez8Z/KXuDMMl
	LTCUtMTfaxvpSbV5wOflFjVJupu3DP6x4PEShCGlTlrWL4+mTJ8Xx8kVZ6E4Dj3OMwHZhhVRoNk
	/RfLuHaHmZgH5zFx4akurA5+PQvhBn1QMP1nv9Uv+d806N23feLrYXHvF59/UK00pPkBJ1JvLqI
	ppF3uybOGY19EbqvrIEUdwSQfL7lgY5OZcvPjOAqT3sF2zsjEGdCe7ou8aC4WmMsJdh471qJ4ol
	VPgHZLeocIpH77FVOYrFdMCSfHt+4g43iBfhd51WNAzQWmOSCj/7/xrMre56GYlnK7OjK6Jc1Z1
	3MTjRwanuu2zow1Ctq8OCDoUht7nAqdiMuHbXbe1cGsom94D8me/Zt4eLWNHBk3cCpSE1aDKXwE
	oap6B6Pf05zMdXOcgPrpCozKEeipoKeOg6rCxh/oP4QFpD+CLPkCFIxbGp2exSjDY9yNAk921zE
	WWCalTyUPpwTEUGH+nGtI62KwGB5PL4sjaR6dymiejUZUKEaVjMhRiGq4gSTImqhrQvZSSsgiD3
	rfbVObEXXPH9xrCPSt8NWdcJtQl9vYYHijab4fYqmiUIeCLzYPruPGABfzVxVzqYuLJj2rM=
X-Received: by 2002:a17:90a:9f98:b0:3b3:b15f:eb89 with SMTP id 98e67ed59e1d1-3b3b15feeb1mr321766a91.1.1794870408006;
        Mon, 16 Nov 2026 15:06:48 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1108222a91.0.2026.11.16.15.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:47 -0800 (PST)
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
Subject: [PATCH v1 1/7] mm: add GFP_HIGHUSER_KASAN
Date: Mon, 16 Nov 2026 15:06:21 -0800
Message-ID: <20261116230627.3537051-2-jeffxu@chromium.org>
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

A later patch in this series adds __GFP_SKIP_KASAN to GFP_HIGHUSER, so
that with CONFIG_KASAN_HW_TAGS its pages are neither tagged on
allocation nor poisoned on free. That suits pages whose contents belong
to userspace and are mapped there.

Some GFP_HIGHUSER users allocate buffers that the kernel itself fills
and drains through kmap_local_page(), such as pipe buffers. While such
pages are tagged, KASAN can report a linear overflow out of the page
and an access to it while it is free.

Add GFP_HIGHUSER_KASAN for these users, so that they can be converted
before GFP_HIGHUSER changes. It has the value GFP_HIGHUSER has today
and will not gain __GFP_SKIP_KASAN. The two stay identical without
CONFIG_KASAN_HW_TAGS, where __GFP_SKIP_KASAN is 0.

GFP_HIGHUSER_KASAN must not be used for memory that userspace can map
with PROT_MTE (anonymous, shmem and hugetlb pages). Userspace sets the
memory tags of such a page, while the kernel keeps accessing it through
page_address() with the KASAN tag from page->flags. The two do not
match, and kernel accesses are reported as KASAN faults. arm64 does not
reset the tag in page->flags when the page is mapped; it relies on the
page having been allocated with __GFP_SKIP_KASAN. Nothing checks for
misuse at allocation or mapping time.

No functional change. The kernel-doc describes GFP_HIGHUSER as it will
be once it skips KASAN tagging.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..567c93fc1cfb 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -356,6 +356,16 @@ enum {
  * move once in use. An example may be a hardware allocation that maps
  * data directly into userspace but has no addressing limitations.
  *
+ * %GFP_HIGHUSER_KASAN is %GFP_HIGHUSER for pages that the kernel itself reads
+ * and writes, such as pipe buffers. Unlike %GFP_HIGHUSER it does not skip
+ * KASAN tagging: with CONFIG_KASAN_HW_TAGS the pages get a KASAN tag, which
+ * page_address() and kmap_local_page() return in the pointer. It must not be
+ * used for memory that userspace can map with PROT_MTE (anonymous, shmem and
+ * hugetlb pages). Userspace sets the memory tags of such a page, so the
+ * kernel's tagged pointer no longer matches them and kernel accesses to the
+ * page are reported as KASAN faults. Nothing checks for this at allocation
+ * or mapping time; those reports are the only sign of misuse.
+ *
  * %GFP_HIGHUSER_MOVABLE is for userspace allocations that the kernel does not
  * need direct access to but can use kmap() when access is required. They
  * are expected to be movable via page reclaim or page migration. Typically,
@@ -377,6 +387,7 @@ enum {
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
 #define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
+#define GFP_HIGHUSER_KASAN	(GFP_USER | __GFP_HIGHMEM)
 #define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)

base-commit: 4b028d0cedf95f66b8c5294fde2d7d698bf830da
-- 
2.56.0.611.g1030f0b940-goog

