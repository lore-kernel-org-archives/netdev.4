Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795782574;
	b=totmD34UUAyLafze2VuJRTnue8SurfIC+SufbQ8eNGMtR0Szko0yEJgDrj0X1HQr9Cp0
	 3aGmCCg/DdeBg6UGt5sl/h7vzZIl4peboImScTkR2RN73yghsx4CwqGcelf0NYysql8zI
	 N4cCoH4xWiDtckPsyb3U3srJQX0Ilf5qW8s6oABN6a66Nq9USK0IeuPxePcQKD1eqEc5D
	 bqkrk92oe9fW+n4xjAseGZx0kh00B0P98fh86A9hMOnOSYHNWU0eCl2HsyG3rcJ77ZqWM
	 EeNotOZcBIttfR0xPmpov0ntnMGPj/V2WWc429UhHZ71YznZWPO9NiQxtJOKu5D88kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
	b=cdmc/zbM5tRuZgdRaHVXBMhufzsDgWp3b4ZmGKInMVnUozgBVXgZUIjHuDE0SmO80eeM
	 Rb50cjhWLZM1UfQtvNGM0k0/9fJtRQO84m9fOyO6Ux1M2LZSej1WWpR/mt5UwdAJa/2Hh
	 +dm7NDIiIJwiJmvLRT6s5KGy9pucpikdhqOxr5WEgZpm4dIM8GFGcpivPlaaiEsnmA+Wq
	 gW34OlfgAEP25kFkuKkL6C3dKA75APZ67ETBcHIcr6kk5LFWp3BvMkVLta/ropPdvseaM
	 extk/rzd5BYbQwjkng/+81NUxzYSQPZtf3Wl40q2S/TJM3x1+j68sPhhcM2UHPB6mmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDtGKepm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785A606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 12:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5785A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDtGKepm
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55be673e029so1832101cf.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795782568; cv=none;
        d=google.com; s=arc-20260327;
        b=BA9ZYdt2egw2vZFmbt3oBYUjCrOFqinEsRs+GkwSa3zEGLncGyiyUpsBEYmYHdzNPa
         R/tfZ4z0PDbNLMRwidWIiwNdBF76eLR7rZDCmAuJtKl1/ryylhi9V06sp0EnceJceT1F
         UuVoFlQ0Go3MVNQd5Gm9Gn6lQFc83PXeuLKZJej1hJ9olvw+i1jPIYEbVEmfPNxHTSPY
         g1hBO+DaU2PZCnTxy9ruOLeONrdxTQhmCAvECZ4NLJGsLC2oFliJVCbwJZFBuY1s5SGq
         mCs3MuaCDkCRUGCz6ELkQuEM4MsEoyXVpdQbh5TnYd752hxmR2oYPyUUzRzOYh7HVFHX
         FX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        fh=+hf9eU4L4MDsppBRHBkwL/uVJenOdUa9s4CYR4gCcsg=;
        b=Jg8xB525GGKWNOj5pbYR+c+5SaHI4x9hR51Qnh0Xe3reEMz5nZxBnJ+xMPkSc5ANK/
         0MAPvApaQ9EDjSadCd8eJhvVN2jWLU+YnVRgybLQsbnvfRLBzV5tB/qmVL8r+9/Jtq9j
         YmMR7Tg+Y56NNzCjwYnRFxewcnQJK/BE47VS7hBP2G9KBGHFGWGB4c5yb0oEF01wRcrE
         dvehA4lVNfnjxbIOwFkBd/yG0PfXSea5MBXXmVUJd46eGyHEfRoOsQvHiHNwbryrXrru
         gxRcR0r5Gz818u+99AOXovUrEStSkAaEu/erJY25R2ytZap3UoafTv88CpQmL9ZOosce
         78Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795782568; x=1796387368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=IDtGKepmhQShYR7D/olwV/obTk+1pmvySEjMhbDi/ma/1i93QiS/JtjUrgxBSMhQ0k
         JL+ilsf6MgB7rL0RhzqkxVfHwpWehnk7Fk4Q747FAHE3PcGDe+yn84ff6jYRMPlMbx0e
         QokdEvRzq0preycHEpMBQ2Lohvx+Zw/uSsx2DMrkiT1qcSSKYLtRImSCVnyuzNksYALX
         NtWTa/1okzanV5FHK0NJqjKm441asfoZ8MYagjrt+QkZuqm+fqNCuiCSxrGhrELhPKIE
         fk/8Dwyrnu3Us/ZvtQsa36mEXHtFs/36/ZYUVzpvU3JIUzDhbiIDtqOBlvidXDxzNxSY
         eJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782568; x=1796387368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=tV9i48+q3jfF/IcaJvgofZRBkuoGf1Lv5FRAJp+9Ey5FesUdgeRWiwAONwcGS3qtge
         1EjeGu9Ur+JqqkfcdKPt6eqSqx03JGSsBTPewR9gb3VOih6xs4oSYirRkw0VAFB69A59
         AcOrOmXerQxmJCo392VgzTChyJTm36iQdt79piRVhjvLoVGLtyuSM54Yz200WLn1+sQJ
         wV604RnzreTUs678Rx+HEWqm+Ga9CE6MhBR5GwfVQhV49sIf8See2ZEnDvjfM0SlcXds
         Sm3TKrYYecxs5VDaxb8S+ADd6HvZ5lgUd1YdhiNq++lSZAU8/C/tAXEaFA0gsdb0gDcN
         xr/w==
X-Forwarded-Encrypted: i=1; AL+hErGV2Y97K8xIy58F3K7GCmwohUnOuqj4DYtid+gmP4DWLmUtZZd6lE7MWMcU1M//4oFSFTG4mY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wKyLy/P7qNINOvP2fuF1FAlaLHpgf1Qe1Y9pF+G553ZrDXvrX
	jPTH7y6W+iAdf6XCS2kql0XWHp4Cd37xhYkHceYMUeI7Vhou+K4iFqFkG7VO8sRo2N3PrWAOJUw
	3NchRFihwwfwFWqvmsftGZiDPkS3R23bXJkIhndW4
X-Gm-Gg: AZFdTZdzDu/6LzSPATDcORCIBS3g5PRblISfRHjFsf2h4Stum6UrzhrBguy/7IfzOwr
	moTCLHK9aRvN3/Z128copl87WE+Z48tpKiawvFznvfKEimkHfQoqXEi4wnlM2smi6jFPcYUeiwE
	2w/p+CZ1dKwk0MOX7MNpBQmaWyGHHjdRCTqZvPSBUt9PWqdSNPQIj0zfYr6lrnXjiuH59jA5csm
	t2BHie4P+dU9dlfmrj4I89M2WM0V9ZG66++QsAwLBjM/aBBY96eLapdAPkI8u7vxi4UnRF2uFRg
	ck9C5m6Jc5pd/BTKHkhkMS4NHk6AgMikSoetilp0MvqnRfkP+D4xJZzDiSR00c2HKA6+vJcul3H
	evD4F53beb/KlNiNly+bl8CEBxVmjIFDN5IHuzw==
X-Received: by 2002:a05:622a:a14:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55d8900bdcfmr34062041cf.7.1795782567558; Fri, 27 Nov 2026
 04:29:27 -0800 (PST)
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
 <20261120135013.GO3115493@ziepe.ca> <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
 <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
 <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com> <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
In-Reply-To: <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 27 Nov 2026 13:28:50 +0100
X-Gm-Features: Aa3M54o01jhZM9dCQYVFb8_-yMQWCkVYamRB04RwDLjyCo_Cf-5r3I24fRo_Jr4
Message-ID: <CAMOZA0JMZ8wUrV08YznFUH7AkmyqXcNdzfd26KsoTtzqt69SVA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Naman Gulati <namangulati@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
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
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Catching up on a few comments:

On Thu, Nov 26, 2026 at 9:46=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Mon, 2026-11-23 at 09:50 -0800, Naman Gulati wrote:
> > On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux=
.ibm.com> wrote:
...
> > > I think that approach would also align with Jason's idea to keep thin=
gs
> > > within the network stack and to work with the tools we have until the=
ir
> > > limits become very clear.
> >
> > Hi Niklas,
> >
> > I have been working on this idea exactly - extending the network
> > page-pool with a memory provider that allocates large pages, splitting
> > them into N smaller pages that all share a single IOMMU entry. I
> > breifly shared my approach in the v1 PMD series [1]. I'm readying a
> > short RFC to share shortly, would appreciate your feedback.
> >
> >
> > [1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69t=
rmw+BJRVYf3JB1g@mail.gmail.com/
> >
>
> Hi Naman,
>
> This does look more contained, but I'd say you should still go simpler
> and fewer steps per series. Some thoughts:
...
> - This is still a LOT of churn, my gut says much of the benefit should
> be possible with much less churn. It's really too much to follow but a
> cursory look makes me feel like there is duplication between rx and tx,
> which is weird since for the pre-mapping they should be quite similar.
> There also seems to be very little integration with the existing page
> pool, rather it seems to set up a parallel mechanism for the pre-mapped
> buffers. Really in a first step I think we "just" want to use a more
> efficient DMA mapping and contiguous memory chunks for the page pool
> and also keep the page pool API unchanged as much as possible.

The implementations seem large because they expose limitations
in the current kernel code (or our understanding of it;
but the proof is in the pudding). Networking for one, since you
mention it: the tx path allocates memory in many places without any
hint on how the memory will be used (loopback or device with IOMMU ?
cleartext or encrypted?).

If we limit to the easy parts (e.g. just network RX) we may avoid
some churn but we will not resolve the problems arising
from reasonably strict IOMMU deployments on large systems:
- IOTLB thrashing (network traffic uses separate PTEs for
  rx buffers, rx headers, tx_buffers, tx headers). Rx buffers
  are only 25..50% of the total. See [1] for some data.
- per-buffer VM exits on overcommitted VMs (same problem as above)
- IOMMU unmap serialization (with strict DMA, I measured over 10us under lo=
ad)
- swiotlb copy cost (on tx and a backlogged queue, most of the copies
  happen on the TX softirq handler).

Also we will not be able to see what is lacking in the current kernel
code to address all the above.

What I wanted to do with my series (Request-For-Comment, for a reason)
was to identify the components we presumably need (meaning: implement,
or figure out where they already exist and actually do what we need)
and get an idea of how intrusive the changes would be.

Then it is completely fair to say that the goal is not worth the effort
and should not be pursued, or to take the low-hanging fruits out of it.

cheers
luigi

[1] Here is an experiment with a system using bidirectional TCP
traffic on multiple NICs, where IOTLB thrashing becomes a bottleneck.
Below is how total throughput (TCP payload TX+RX across all NICs)
changes using 2MB mappings for different regions.
We really need to cover them all to recover the performance
of identity mode

Use of 2MB mappings         total TCP throughput Gbps
-----------------------------------------------------
none                                  440
rings                                 572
rx_buf rings                          577
rx_buf tx_hdr                         572
rx_buf tx_buf                         649
rx_buf rx_hdr                         674
rx_buf rx_hdr tx_buf                  716
rx_buf tx_buf tx_hdr                  734
rx_buf rx_hdr tx_buf tx_hdr rings     744
identity mode                         744
------------------------------------------------------
