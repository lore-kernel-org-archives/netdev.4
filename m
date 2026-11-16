Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870412;
	b=X8XJ/Qb6kAIbMsuX7i9jL8nLUUAZgnqEZM+22pHxRsluZLQXLY+ZOAcSE3BhfqCD4/cf
	 WtHfv8k3R6shkKyPiq+bmiETbdbeFjsMrvWjq4bL5whC4LUHdnW52OTt5xNqlCC8m79JE
	 3mSuVBdobldQxikXi+fRQRA41kMuWhdO4ZHIXIQfSnO8pt1baBTj3KSdS4ZCCDTNsPiPZ
	 6IhUx39VAnAuGQ4RhXeqzMKVjL75eCf1TB438U40tFEndsSkDSYosupnNciRQUD+JKB0d
	 wYt97W9cPeq+6ph1YntYHr/hHbQEOL6AxzDzwUX/AlNHfT4JLGFbu/hSMs0t1qy3HRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
	b=Q/sUyU9+puWF2yCs3V1x0UMQI/MNvTrhNiGJ7VljaEvw/vYfpTY5TM/RMklJUS77xTJE
	 6iS+xnOR/VcOHrSe8m+yM/4sn3E2QbFZVyE3koPro5wYAgBd5HQy1iq4U6cr2C0EZTi1f
	 wovRexJg/kvR7+hDTGzgiaAqjd6RYL+bdeZJ38pRP0Q24mHPtFtj2nwhMlZ+IMo/cvNBh
	 HkhQweLq8iRb/sD3aYRli88AskmcOmynyOHQrTi57CPcHWAyQtegdO5ah+asyAuMhl8uS
	 N26WX7iDWdTKUHCLJ/jEUoFgDUX9amV9FSdBk+n57drcBo+vVAeuID7v3scd2Q0xn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vw4q3+7J;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391E760A2613
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391E760A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vw4q3+7J
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so728128a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870410; x=1795475210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=Vw4q3+7J0GTgcSWFxg4Zuev6Td1Csd2F1YArOtz+EmHp+gxPgNOgtp4qGE5OPD4j8d
         8kMC/9FQsVFuqTXrWeUl/o210OhRp59ba5RQZzU7CkwS6iWkfFaXLl9A8QIJBFxoY1SP
         bjUYPHwoaCqN1KjkM+WmK83bXCgnxSkp1hmfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870410; x=1795475210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=mN0XyXzSvHQjDvMh08dnWAKoigG5o2dhAu9WdE3jJw2ktJrSUFsrAwfg9O8H19paZI
         P7edr4gw7nNJLQXHv+Sb/xlzr/V4R0QDtyDKePK7TqC1hgy0gEobGRD6MlMY2GsIX83F
         eV0eMi+C4kqwlBmw0IzqA0a0ll9Ko+90L8GcFZz0A1gylDeI4aPXOdxGXvP8iZrQorxB
         mF1/h/eM9sIAZae1C/ljI9uXYv31o3p+G/g4bmrkCFEqr2XQyUYy6cp+Oe4gy2i6qzAA
         jFwonvD07SxG2D+X08zVzTnsaP6X6VJZ4dEGxzUZIpi8kOj+TBKsLFBevUXHjNWHcM2/
         gT2g==
X-Forwarded-Encrypted: i=1; AL+hErFr15DnKJssQ9JjooxaHkKew2DWZNgEpFFGaSFj7QotdbUaa/B3WJY/WOD7vOIntpG/qnpwtgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QWCakVdslepb3b0dK0AGLInZwBXg45C5ro3N1vfdcPLeQp3Uc
	NFV4F6oJYXBg68N0Hh+NgN90xlNND4ubuJ21kn2KeZWK2Q11yZbalBwdi9axdoIAZQ==
X-Gm-Gg: AZFdTZe7LF2oDNjOfzBOcgDmnluMHvm6SFUnxJSLDgMnD8BNTYP0WheyJjb0QmzjQKl
	8pYF5TjM9j3zXgaS/kXTOQqq6fbTVCE5vWQwzEjQSJI1lThkLm0BgJxKQnQxZRS9CtbM3wyxp0D
	jZ880GaDvS6nplxI3fDcH+LzIVAXYOMVZa4nczr/5bXdVh/uoLefG03MHiLZ/7jmQih/GtsVG1X
	aL1k/h5sFGqCPdN1QFXCV2Uy8cw7F4zUjqe0Apq/4/WHJ0muEVg8CD32fe70YBqLE82yktmDh3Z
	CIpap6uhiOp5ynk5j10A8m+iz/w2hoKQ2hmasbL3CKI1sgrtQ6v7UcgPk7ZSYxnJODZ5FwdOOq7
	iSXY/UXyaytMWQZQIMkDOCQAZI79dzpCEHN8gkeuOTUpfq2gpYufvsPec9GD8AyPFhwRon4q/S6
	fevZuJAniQPHZLgAw0g5aCKKI7tXwZbAZ06DjEhv13AjK9ueHZzriGInsD9xVPXhrlB78ewYKaq
	gkGr+MYiGFzEAJsy5Qjy/lAsuiMaubwaP1rvbla3lp5d2/OvXd/Y0XMxjlP8LYkwV2DTy5TD5yL
	AIqWi//iHXHQBSOqKSOViqsN7WaPprxI7lCT3p2QuLwi0/Ev1lgQN9j2kiRVUE2leXjnP2k=
X-Received: by 2002:a17:90b:1650:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b1b05fccc2mr17699416a91.0.1794870410469;
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3abe8b263sm1120355a91.13.2026.11.16.15.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
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
Subject: [PATCH v1 2/7] pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
Date: Mon, 16 Nov 2026 15:06:22 -0800
Message-ID: <20261116230627.3537051-3-jeffxu@chromium.org>
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

Pipe buffer pages hold data in transit. Pipe writes allocate them, and
the kernel fills and drains them through kmap_local_page(). The same
holds for the page fuse_copy_fill() allocates when a request is spliced
from /dev/fuse into a pipe.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point.

Assisted-by: LLM
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org
Cc: fuse-devel@lists.linux.dev
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 fs/fuse/dev.c | 2 +-
 fs/pipe.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d6b..fdcb11679dbb 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1044,7 +1044,7 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 			if (cs->nr_segs >= cs->pipe->max_usage)
 				return -EIO;
 
-			page = alloc_page(GFP_HIGHUSER);
+			page = alloc_page(GFP_HIGHUSER_KASAN);
 			if (!page)
 				return -ENOMEM;
 
diff --git a/fs/pipe.c b/fs/pipe.c
index 4fa69192e6fb..87792ef63564 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -155,7 +155,7 @@ static void anon_pipe_prefill_and_lock(struct pipe_inode_info *pipe, size_t tota
 	}
 
 	while (n < need) {
-		struct page *page = alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+		struct page *page = alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 
 		if (!page)
 			break;
@@ -201,7 +201,7 @@ static struct page *anon_pipe_get_page(struct pipe_inode_info *pipe)
 		return page;
 
 	/* FWIW: This is called with pipe->mutex held */
-	return alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+	return alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 }
 
 static void anon_pipe_put_page(struct pipe_inode_info *pipe,
-- 
2.56.0.611.g1030f0b940-goog

