Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925097;
	b=N9fOoSFj1XV6Z/cMobrgl+7/DGsBLQFkSHrBUDRMFVJ6DPp05/mXllDl86gIzFS5X0kj
	 YqDt8eeBTBxQ1FS46bCyelAS/MHTsMtV3ipbh4VXiec/50jRNuxk8tH5TeSVygWY3+rNX
	 B5qNbYYKFHBwlAsJZAAqeBlQaqmy/vLYPMuj+v3LtlxriXVFyZ4cTnZqNDUj7ZrAuxk4y
	 wKPRGMYHeMUM6H15yFllqTX1pRb7Ps3EZWuGm9CEH36W8mjJzB5F15J3NogP1M6UGE9JA
	 V1jsST+LuvCKagwz5ps2O1f6FKK1f7DIQpolNmW9FsOj6LZh9dXZphLwX/AzYKgTzMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
	b=zlX+pXy4w8ivx9f7Uw/HwcUu0/Fawo5ptDjivdR2Bj+GiKq8FFCZjWf7cmXhb+69RBa0
	 xoSRDteQfDsdspF/0eBm2IU0/3HK7pDriV7sJNLMioebCev2vGXRKi3xM/IwtRNAh62sD
	 LvoZe8CwE2JkD4b8yXVr++Of/mJt8u091E96mwm6BXkyGKvhvA2rbUgkgCTzNNkJlG3++
	 5/t1b5ZWcIQf2X5w47r8HibeTmb8bF9q6WN71HQut7bKzHtNlT0FrwhFrEM2RlrbGkSlF
	 jAE0GZuwwFas2FFTfozWfKAvLHOUnrYxBOBEP/T2oIso5B876MKhy6ug3xGnuHVGL+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dJelGG0W;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FE7606A332
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FE7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dJelGG0W
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccecba199so5061166e87.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794925095; x=1795529895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=dJelGG0W56iwN6dunCqPEgrzwUe45Ks0CUkM0rKYyvzGIUEHgm47Byuj9dY72FWxCp
         SF+mC8AoSYBbrq3eEt+A863+WPU6mUVYAlSFW5hhiikR0HTQWHrRvAUNCe1DcjXuf6BA
         MIBHfLKefv71K7JOaENFWhNJKgJyY8K5zKhms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925095; x=1795529895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=jFLN1gvdhkB4gYjrKYeC8ns3k2nCoRGEZhAsW9Ddqugv2Ub7EVsdDaAhfz+UExAC6e
         QTkPcA+chajoIPm67gMY9Z+v0D2GeC2kdy4CUCrnJvvA1wHIMOQqVqYuqryLtK+xsS/U
         nM7+Vp28FwUDl1R15DnPc5yRTY2zjx+MB3rWkmFjJAQul4QsC9So2a+ieylP7GG98bZu
         npjL0mwDOpolDOkbiF2Gi+iXRISVMEJovLTU0xq80PC61eTxWIlcsND0uWNMPRdtZWCi
         iT8UjQk/2ejMDHx7xt1ognMODyGyWqTuh2inaIG542GXmmHCIr0rMsicFkETJ01SrVs4
         cqiA==
X-Forwarded-Encrypted: i=1; AL+hErF26xhJzwlrU+Ev5s6fqyiT6KaYzBJvnO8NNC486wUuMZ+N7OzUTIv9bPTNImry5soyRP+P6zQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o3LnTBKeCTfxVP3RKfhJfNhY9m+MB8EAUODPYf7IfeqZINry9
	+OiCa0YJpVF/Tn/mpf6dtC71TBm4tOc9nJ6WF49MdNHt+UFhD/smYcIDOPrkxYwHd+e7pi5+THW
	TwWCG5dHdZXA=
X-Gm-Gg: AYBFou04Z6KdiBUCsjd+Rr1lQ1O/uANF3fNE30Ih7ggryGN5m/X7D62KdgwjSK51CIt
	ZXwbbCVbUgWEVfTXyKFbB6k/oy28PhfTp+xlJQXkxuvh1ioV/BaPVOLeTXpo1DVfxPkyVY85noQ
	5zXjHT6ZfJ+iT+wYtVuXbZYmv1jItzyrBLvrv75I+xfYmZ3kPhh6hGxTVWhSyLodnAqjpRSNru9
	7ajm/Gdn3XaUxuM9CcSasFY7e7UFrUR4yIfW2AmfwsLls8Z4GxKJm1tjuEtaz3nx5EPf6YloSIj
	KA0Kujd+JtvwUTwdABgdSDLuWSXDZZ1qHWBd+CIzlU8Tug41xMPV/XiJW5J6AQIb2eXdQfpeoNy
	E2OYBQUTjJm/oqcBkr4XSTgPkgELD2eSfso9/JRTmLCvyFtfH2xTxzOA+afSuVRhdUEHrwKh/hx
	sV5suycHvVMuby34T3eqTf+cXIUHgyCqspBefkVT6TRORl193pfqgiRhCsI8b7KJXqNpMt3yM5L
	KZeTtf9adXBQXA8vJ63WIBcJQGyT0Fc/DjPKgE2P4nDCbavzSLILXMvS/2AmuI/AMxJcDdJtNC9
	ntZ2rWiAIIhfOrBpuG/FNPuSWUkiLJz/yU/QuUtloouKi8bGk0q0VfzFZQ3TOXaH
X-Received: by 2002:a05:6512:2208:b0:5c1:5970:ae1f with SMTP id 2adb3069b0e04-5c170a25d42mr5249804e87.63.1794925094880;
        Tue, 17 Nov 2026 06:18:14 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm4004082e87.77.2026.11.17.06.18.13
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:18:13 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9537e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:18:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCXzWI9TtKMTiNq4JfJS0fuh6sq6RXZVVEe8/AJbnA1iExCyzgpCyf0J9369WVi7yJbbcmDwE=@vger.kernel.org
X-Received: by 2002:a05:6402:a511:10b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b85b4c22d8mr72630a12.3.1794924698252; Tue, 17 Nov 2026
 06:11:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
In-Reply-To: <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 17 Nov 2026 23:11:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ZMC6yRFY7VxkKfsQMYV8BNfasB49bEPdk_bBjeXaAi9-9aO4mXcafXvg
Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Marco Elver <elver@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chia-I Wu <olvaffe@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Evgenii Stepanov <eugenis@google.com>, Ian Rickards <ian.rickards@arm.com>, Jann Horn <jannh@google.com>, 
	Jeff Vander Stoep <jeffv@google.com>, Jeff Xu <jeffxu@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Collingbourne <peter@pcc.me.uk>, 
	=?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, Baoquan He <baoquan.he@linux.dev>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Allison Henderson <achender@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kexec@lists.infradead.org, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:10=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/17/26 00:06, Jeff Xu wrote:
> > Hi all,
> >
> > Currently, GFP_HIGHUSER_MOVABLE includes __GFP_SKIP_KASAN (commits
> > c275c5c6d50a, 70c248aca9e7, and 0a54864f8dfb), allowing movable
> > userspace page allocations to skip KASAN page unpoisoning on allocation
> > and poisoning on free under CONFIG_KASAN_HW_TAGS (ARM64 MTE). However,
> > GFP_HIGHUSER does not include __GFP_SKIP_KASAN, even though it shares
> > the same kernel-accessibility contract in include/linux/gfp_types.h
> > ("for userspace allocations that may be mapped to userspace, do not nee=
d
> > to be directly accessible by the kernel but that cannot move once in
> > use") and differs only by !__GFP_MOVABLE.
> >
> > Moving __GFP_SKIP_KASAN to GFP_HIGHUSER addresses the performance issue
> > below (following up on the earlier drm/panthor discussion [1, 2]). The
> > swap issue from that discussion is not addressed by this series:
> >
> > 1. Performance: For every 4 KB page without __GFP_SKIP_KASAN,
> >    mte_set_mem_tag_range() tags all 256 16-byte MTE granules (via
> >    STG/STZG and DC GVA/GZVA) on allocation and again on free. In
> >    graphics and UI workloads, DMA-BUF (system_heap) and DRM/GPU
> >    (shmem/TTM) buffers use GFP_HIGHUSER; while steady-state rendering
> >    reuses buffers, window resizes, surface transitions, and app launche=
s
> >    synchronously allocate and free tens to hundreds of megabytes (~32 M=
B
> >    per 4K RGBA frame) on UI/compositor/render threads. That takes a
> >    significant share of the 8.3 ms (120 Hz) / 16.7 ms (60 Hz) frame
> >    budget and thrashes CPU data/MTE tag caches (especially on
> >    cold-cache free). On Armv9.2-A, skipping KASAN cuts ~32 MB DMA-BUF
> >    alloc+free latency by ~80% (~98% faster close()) and improves the
> >    OpenGL score of an app-loading benchmark by 15-23%.
> >
> > 2. False-positive KASAN report after shmem swap-in readahead [1] (not
> >    addressed here): when a shmem page is swapped in,
> >    swap_cluster_readahead() also reads the neighboring swap slots and
> >    allocates their swap-cache folios with the gfp mask of that shmem
> >    mapping. A neighboring slot can hold an unrelated page that
> >    userspace maps with PROT_MTE. If the mask lacks __GFP_SKIP_KASAN,
> >    that page's folio gets a KASAN tag in page->flags. When its owner
> >    faults it in, arch_swap_restore() writes the saved userspace tags to
> >    the memory, but page->flags keeps the KASAN tag. Later kernel
> >    accesses through page_address() then use a tag that does not match
> >    the memory and are reported by KASAN.
> >
> >    This series does not fix the readahead path. It only removes one
> >    way to hit it: shmem mappings that use GFP_HIGHUSER (e.g.
> >    drm_gem_shmem_helper / panthor) now pass __GFP_SKIP_KASAN to
> >    readahead, so the neighboring folios no longer get a KASAN tag.
> >    Shmem mappings with other gfp masks that lack __GFP_SKIP_KASAN
> >    (e.g. GFP_KERNEL) can still trigger the report. That issue should
> >    be followed up separately, for example in [1].
> >
> > What changes for users of GFP_HIGHUSER pages under CONFIG_KASAN_HW_TAGS
> > (other KASAN modes are not affected):
> >
> > - Access through vmap(): nothing changes. Those pointers already carry
> >   the match-all tag and are not checked today.
> > - Access through kmap_local_page() or page_address() (for example
> >   ramfs): accesses are no longer checked by KASAN, as is already the
> >   case for GFP_HIGHUSER_MOVABLE pages.
> > - Buffers that the kernel itself fills (pipe, FUSE, kexec, RDS) keep
> >   KASAN checking by using the new GFP_HIGHUSER_KASAN (patches 1-4).
> >
> > GFP_KERNEL, GFP_USER, slab and vmalloc() allocations are not affected.
> >
> > Patch 1 adds GFP_HIGHUSER_KASAN
>
> I really don't want us to spread KASAN-related GFP flags in the kernel.
>
> There must be a proper way to abstract this.
>
> Why is GFP_HIGHUSER not sufficient? We were already told that this is mem=
ory to
> be mapped into user space. Placing data structure on it and handing out p=
ointers
> to that would already be a bit questionable.
>
> So what are the ways to avoid GFP_HIGHUSER_KASAN?

I think the idea behind GFP_HIGHUSER_KASAN is to make it possible to
skip KASAN for GFP_HIGHUSER by default (for most of its users), but
keep it for some of the users which today use GFP_HIGHUSER for their
memory allocations, but could benefit from the added security. As per
the other patches in the series:

  pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
  kexec: use GFP_HIGHUSER_KASAN for segment pages
  net/rds: use GFP_HIGHUSER_KASAN for message pages

That said, I'm not familiar with any of the code mentioned by those
patches, so I can't really tell how much they would benefit from KASAN
or if their choice of GFP_HIGHUSER to begin with is correct.

Best,
Tomasz
