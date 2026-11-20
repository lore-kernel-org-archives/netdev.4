Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795184413;
	b=J87F+aYttsJGz5CiU5ND0ZvG1ne4JyDThinTfNltnu2UZI7B/0oSD60d/9JLHFhgAeDI
	 v/1mFqtB0rlUenllr1Lm9L9ZplaC4Ib7nxIJ0i2RbygTkk8cV6dFqipJSrCZl0euJsgnv
	 I179yWVxFwH0frj/QeqlZDuSGe0VPwPdKexONeVcR0XfJFUnjVyoMpUQCN/aEBxJDwrXV
	 zecP1dZ/1YwMvZWq5ACX8PKlaNoTR4VI041PPBEg0v7ZLhSsBp316vKYuolmgV8zQMMN8
	 NkIrcqqInozm1zeK8MvvifMTR0mV1PT0XLbsY23UOx6GhkP0cDjm7kv4suMkFjrIteA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
	b=D+GHbhMjRnpnh2anLY8g9XggeL6CnCYCEQDLOekEX8FCXLYd8ECF7ynS3azkbCzEKmjV
	 PXlsmkcNHjjhQiSsYRvfCd8F19CfTADN4rJoaOnv13bUx9rm7JPDSpBlOoKf/BpnqBWoa
	 UwxgxPFxuyeGA+rZh3aGbzOjBOJRdqFMzqiJCpoAg9AahfzPqYEEl9kruLxOHizbZKisU
	 4ItWk4HZ6MZqyjs/F7FmX7RM1HQ6m7uB1BzTsrWPkotWrMYw8wpRZG29hIAsstm0QN4sB
	 flZPtb5Qu53qP4gsxZWEbgJPQoFsCGSCn9wW2GKRZjG1/YpW1Kk2rdItE1BduzPQMCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPrxrTV3;
	arc=fail smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CF2606A332
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79CF2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPrxrTV3
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so289131cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184412; cv=none;
        d=google.com; s=arc-20260327;
        b=fPvBtQTiKSsyg7j29oNe/GF/kc40Xt3jmkoiFwUruMivvR/sjNFBHrl0ju/pfKd1uR
         DXBvRv9eFLpNpXyxInbVSYw56+khAGCmQEfxsvyt//1kso9aXIX1fw10t8UKdsMwmax4
         qUauzJQjKTctiEkpDqPE6fA0oEIMKHW220cQ5N3k/V7jAZQr2e/TQJMFGGuWEf8HG924
         T0ffz7GhFHGgpbMZPgj+x8Aj0EMzR4atfHcixp9sVubycxsZ+67ETItGm8HTyLnYeQJw
         NaFVCULswdH6uDOHuyFHTl4PJt0mr6daZ8bN2+RAHQeLsRsFoKqpPN//dXZHeWj7gF1v
         Q4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        fh=LGFy9tkWhoCtyRu4gTc1Awe8DgLnsu6ZBTV03J2vyS8=;
        b=MuZmRbQSLuASgv21HhHSgTOpGKr5claft5tUkooq6AfAV7HoGpEbefFYp6P/Q5As9n
         J6A1f4hP+jC8nNZRXgeXX+RL5XwcKm2Eu3YOQECWoaRItFbFimg5Du7kZYiXof+mbOLv
         0NySH+wGRLx9p6f1zTcwmyF9fR9+TO3knS0ITyQl2mMclH745I04Mc6L3hVOyQI/78Sl
         xh4r/mVxjp5JLvFrxmpYOdsK5e14lnvuIEhC8564beww7NmohVaxUhhUa8LGbwlDMQ0d
         cW+8gNjwVizr1ROmhCfj3l0+lJTSkdLg9k4u0wQX7lcH0iqOrc5KJgDo864n7LdkMxO5
         uTJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795184412; x=1795789212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=aPrxrTV3tjNKVZRe0o/QZnrHtJ88Cq0pnVQFh7mHgAvBJzDrEJpUWOT7AK49X/t9t1
         p7Vunzt0X2Jci5rymoMAfsIElmpqm511Q1t7p8xn1jTunsDcwP+6GaXxEB2IFTgFyMZ9
         0iof2il/XdRNNVwakcxSw0onlzvNI9i3hcQnJoO5i5GHUKuFzFtrzC3+IMt6INHHgjGk
         xqTd0Wgb4Ec0WCLoQA1db0uoMdVOIYDq9ySwBT+7Mn0wwGKDTjTrt/aa7XbbUc+3QID5
         2e3M416nZRs+/ass9ys+Ro5LBwyHkmnva3YwUsJ7NnD60k9CYZmdfaxSg5dN/4GGjxa8
         eNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184412; x=1795789212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=2l4Lj5EcSHZsFCOzzZvB/6g8FRShoC85Z9iLDskDSGOwDFR/nWrOp8P68MKwPhRYbv
         v68Cs4aqUVmFBajdR9h7aP1fhq1FltTofHYNHNVjSNOygJ+inqmXstvaQAASF5Un6i8n
         J1wdRd5C/4Kotg855ps4+zmTNNmpWCO/7KWV5N0d4xpDA3bvXcGdYhkcLAQLqPPZH6BX
         VwgwYg9zd/Nvn7jsB8vundXdAekgw0/eaNc6VaTmowDcDQsBOw+ZRz8nJtpi0i8J2x3y
         bPPyXLmYjvf0PLNfmrXT6BvdkR73H0k4srv05AQASGbl0xZS65gUzBEqi6g8afsv0zFJ
         GrMg==
X-Forwarded-Encrypted: i=1; AL+hErGZUsAoI5GqyWstlRtyPG8rY+AoG+mDKQMJk3Hyu5KCfl9VAO+ua0HvMKHEmWNJFVmnFnhSux4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W2oYZnw2k2oiaTFnOqPR+5kpMKGhA/6D3y82YeygTwT/rj3pB
	W7F1blmyNmt2oWdd3/hTGcFMlJk+l9phA+X/gvNm29d7YoPvXnDKb6ukfKu1YYBII0ArJ4US16h
	F2U6yoy8LdS2Ekl7Hk2MpzQTTLT7SFaaOTLs4OaFX
X-Gm-Gg: AYBFou3gBg76FNfJJh2+9yl6iT3wz7m4pk7hGlylU7Rxqm5oVPj1AnGI7cgzp5X4Atz
	j832Xy+hQqNFtoqX3sqoflRR8SmcwN1PY1axQfBGtph38bsLRA9SRJFpBjVhckF9Xz7Eqe6Muv9
	bMl1uO5VnT48lqRO1VLK0wZHtEIAJDUdxNV4Uh9Y8SifKa1LKDTn5SIhFgXnnojs7xdqg/psroZ
	9LToNEqHjeWFl9LOHZL3nOQF8DVhhU//tcig1zcvM8EoFBc6sMmMIhFMTecW8OdCeUIfM8Hjx6+
	5xrpkZrwjlpRnt+JCRGWA/eppYx16Au0iN+U9dX1t/O6XhcLIne7C405aZKa0J3fR0gy48rzBQC
	ZdNJO1ws+wRrGZL9iNGd86Bgo3z4EDAiQPcTQcg==
X-Received: by 2002:a05:622a:8c8:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d7a37902amr16973301cf.12.1795184411359; Fri, 20 Nov 2026
 06:20:11 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
 <20261120135013.GO3115493@ziepe.ca>
In-Reply-To: <20261120135013.GO3115493@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 20 Nov 2026 15:19:34 +0100
X-Gm-Features: Aa3M54r79-wonm4abHk_49DjjJPxLMhPkMzG33LcM6yDH6fwirGgzaIY398cqTc
Message-ID: <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Naman Gulati <namangulati@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PIS=
A
> > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > Documentation/core-api/pisa.rst (patch 25/25), which has the details.
>
> I thought the conclusion was to just do this stuff in netdev pagepool,
> now you come with an enormous AI series spread across the entire
> kernel?

There were surely comments claiming nothing outside net/ cares or needs thi=
s.

I respectfully disagree, witness is the fact that e.g. there was already an
io_uring proposal which is smaller, but does not address applications
that want to use the standard disk I/O paths (libaio, buffer cache etc)

Nothing has changed from the initial series in terms of size, use cases or
subsystems involved. Large files are placed where they should,
the series covers the same three use cases (disk, network, CoCo), and
touches three parts which it has to touch: mm (most of it; it is a
memory allocator
extension after all), dma (it hooks into map and unmap, not a large change)
and net (the pagepool change is a couple of lines; the tx path needs to
touch more places because the current stack assumes all paths have
the same I/O requirements).

For CoCo, there are very fine grained controls so the bounce buffers
can be enabled only when they don't pose a risk, which in turn
depends on the threat model.

Specifically, for network tx buffers or disk writes, the user-to-kernel cop=
y
is basically a bounce buffer provided it is used correctly and not leaked
elsewhere (which is the design; of course the implementation
needs to be verified and possibly fixed so that it matches the design).

cheers
luigi

> > - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
> >   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies=
.
>
> It seems this was ignored too. We want the bounce buffers in CC. They
> serve a security purpose. You cannot loose control of the shared
> memory buffers have have them leak into SKBs, user mappings and so
> on. It is not secure.
>
> I don't see how any of this is valuable or necessary for CC,
> especially when we really don't even expect to have an vIOMMU for CC
> very often..
>
> Jason
