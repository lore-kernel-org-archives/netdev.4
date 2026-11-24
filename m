Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550101;
	b=G/GkP90jWiKAApmQYSlMz+4bRD6j/piCUUQ2zjVDyZueFVQdwnQ1Dr0GFtWpb9s9sN7B
	 CcFRIKa4Ax4zR+FeQ/CojcMuvE1VXFj9X4x6+Si92+b4DJc4pEILxNkHLHDWooF2/85MD
	 DcoLTWs9srfQUexctpteddXBPAHoo7Vzc1P4vK1vAYXxh8Vep3ns6Tr69CD82skUxzVvX
	 mtONvKY40KxVDUSjZMAw91O0vnTQOnt16GfXoUvU3jLfhZ7+8yUvOGJ+NE4/d84AW2+Bv
	 /iD1kp6hdBHzABLe57ZICZqTVriaTZ7vS0oNM6af3U//AyLYlqvjK+tVN5Bgk0PnHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
	b=V7SHKWdVqyxCiRitkIAWGZJYiirXgDDD155FF86wYzL2Sj34Xa4swgPjVmdySxiEGrWb
	 b9Nu2TGkubYtlXpteXyZ6y1JU1ACgHiK1yQ4dLccvAxMCianStXt3R9cGdvgT/OKmIXaR
	 sgqjSX7fK0Ka35HwFUF32U/kkrIJmLRMnYqBW9oRT+GG0hpkCD7eusnGEU+fpHUpdE4ec
	 Jmj8j40Ebj5aPMVdePIXCLsxFWTVEiXdSjwu3OXoIt+xTG2je3sLrQBOK9UbksBqUBDmh
	 exqFTDI5Uzi624MuglgPM76CgI7pjQqhlL7l8ncKKSpKKrih/q3dnzCvl6l0w5+Z/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F8BWsB0n;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244BC606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244BC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F8BWsB0n
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cde60d879e4so107870a12.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795550100; x=1796154900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=F8BWsB0nCAqeb/AWcfO+HDVK8mZYlTd5OrAGXo+PDo4qNalYx0D3fOywTn36jlGI3o
         c+cNELy8fDLVUhaoRcT08PS33thK2uCkqwfG9C9YuYZMNa4hOWdKcnZwta+H9xQ9PyXj
         BerC9R4yihNnd8XXBnr17D3gJaZI3rr46c44Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550100; x=1796154900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=JHOwoWJeyBcq/9phYcdbfLpSB+L1JQ117Gd4XcgFlieiBMMKYOZHgRn7iK1K7GpQ0B
         zqmDDkk6QD/kkQtjt5D34TFfxMIpMRtBdbMESHFg9Q6HRHCcbItRPeHUCE0T29TSaBBV
         nvC+QFjMPSdBmjtoO2pnT98GEDFXsu73n6a8fdp0wuWbZl/7+LkMMfE6oQ4uXnk29SE4
         Uere3fTGq1C+BfOmfqEmKLXgjwzHYnaaxawra0Y5Wt6W0BsQcqrtYbIN5lLgbegFySxa
         j4sEHuv0+7HJG+pqwnPIeL38mY9ZMdypuqRvAlQFfs19sK/QYgA+1dbSUSVLFPBie47m
         Lsqw==
X-Forwarded-Encrypted: i=1; AL+hErHCMxGOiQIM2LWR5/DJAqp5bbeTZFKF13eCk3o1BH7gn7Hy0CaSxqGbpMuQl+bPey58J5/zuVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/436V6Pv5aZDiL8fsDi/gqkFXvdf0s5UOCe01vxmCo0BAOUdtx
	hKF+LnZvBndE/36kylmRA4TbJBLLkbAGfnOdcFfbkda10Fd4PQ09CIwNzPQKQhBLyQ==
X-Gm-Gg: AZFdTZfVSV5ba5qdThTGZjCpXlfMg4sXKkuMJTjO+68xxi3vgRFYxRwy5WZSrpPAk9I
	i3QCZl6AFUVwTCijI48StvIeUc2WJe3rM+B1xaXEgpHQ4v/CmF5LQF7e5bQHdnFu+RKYoVk09Az
	jOBVlDLbDwkTSeglhjqYcMpBRC+WsUwB/cy2K+n0OudyKT+cNuPDrK19zGYyDRXmg6EYhTTNl5U
	vl1fauKtYuzVa6bsTE7wq+gg9oOlT4hCaczC4+goAyGJMXQkLL3muYjEVA0v4yzbNuSVqHdKJX3
	i7zMcwuiafxlnI/vVEOBON7tnVUNHyxVt1xD7l2z/ucRV4NszJT9J2FXvWXbyaYlS0nooeBMpzs
	KbII6rwXMzWsu2gwWKNYxfDLpTGur2Hmi1RAUMlgzvkyrhbyEC6iSVXne5wiF61p5QiJa/3rdA9
	6FvJ4Az/7bgAarG/wRjip+L+TwB4odkGZVmUBYI0tiqxm0Zi20+9c/hHEFuWPO7TvpY4zpSICpC
	oQuiY8kbcu65mDBxevSZn4bfYaAJQdBV0x9pLav2bPgFO/FRbBM3ZxDYWWjL5DyHo/MLN8EzWtm
	mAeoIgJPJcHLP+VWc8EnEGYYTJRBxmd5IQ33HuPVdPf09P783zi/BAbUhJtXRbVVH4H4/w==
X-Received: by 2002:a17:903:4688:b0:2f0:7d6d:4a09 with SMTP id d9443c01a7336-2f07d6d4bc1mr137239435ad.1.1795550100419;
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f142b8bsm72335435ad.70.2026.11.24.11.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
Subject: Re: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 24 Nov 2026 11:54:55 -0800
Message-ID: <20261124195455.164425-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org> <20261123033111.2349160-2-jeffxu@chromium.org> <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
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

On Tue, Nov 24, 2026 at 09:10:53AM +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 04:31, Jeff Xu wrote:
> > -#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
> > -#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
>
> Can we please add a big fat comment above GFP_HIGHUSER, explaining why we use
> __GFP_SKIP_KASAN and which security impact this has?

Sure, I'll add a comment above GFP_HIGHUSER in v3:

/*
 * GFP_HIGHUSER (and GFP_HIGHUSER_MOVABLE derived from it) sets
 * __GFP_SKIP_KASAN to skip HW_TAGS tagging on allocation and poisoning on
 * free. These pages are meant for userspace data (e.g. anonymous and page
 * cache pages, DMA-BUF, GPU/DRM buffers) rather than kernel data structures,
 * and tagging every granule on allocation and free is expensive.
 *
 * Security impact: under CONFIG_KASAN_HW_TAGS, these pages carry the
 * match-all tag (0xff), so kernel accesses via page_address() or
 * kmap_local_page() lose HW_TAGS out-of-bounds and use-after-free
 * detection. Callers that store kernel data structures in these pages
 * should not use GFP_HIGHUSER. Generic and SW_TAGS KASAN are unaffected.
 */

Thanks,
Jeff
