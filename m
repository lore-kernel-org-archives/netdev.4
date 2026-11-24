Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530037;
	b=HJ9gRnD2T88GwJjAR2+uxE/yjeXaGGmJJJv0tvJXFD+kpg1gWZUbOmusAnCUwEYIulPA
	 pO8oIktTjOHM69PDsMpzDW4SXRsFsQ+00ERfUaHqz34dNV2FPyMIxUZF69MEjtp+L6Cb5
	 elOGj27bqAbi+OYIVuTwQ85P2If2Lmah9UtlbE4yCyFRnWkE1mRggIOD23FLYtnx65fdk
	 fqZ/GEFI5wmzl5rJfGHhaIPHOhRZyn1cVA4U7oEWxgyeG5vuIBDQIfT6tJ8CWLo5tZMoS
	 31wVM3s+HseWAKMNtlRbEkt2kVC/hQNkmjIs+kHGawWcCBrBZyDW9HxjUZiJpT1du2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
	b=EV/Hoch6L7z1Pso4eaj+NA6aNHtnHIX3OtAs+j7DqI917C1EbAM1p56TCWyfqqDyS5uZ
	 bS3lxcCVkGNs44zKG8uWOBek9Ilo92PIj+DA55gZ7ccG7GFGXCCFPX31zIGW4AcErqNop
	 H9Hlg2Suv1KwhJ7aZw9KNBMXz5QvbWk0GtnlUvdmAaaFW4pK2+Gpd80Uv13ubWzx8cnLp
	 EBGw4YlmCXI3nyaqBJCU2CSDGhynyAlN/6XYXp7vqcqEdtZfPtjoJGjDkoVdpSKy62ntW
	 qfbmt5+yBLv4OC2yberPfnomHyPwOys7Lh+GgOHycq7Uy1ySli+2b00FZqmtqCICUbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jBiTgo2W;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302B606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9302B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jBiTgo2W
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so605935266b.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795530035; x=1796134835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
        b=jBiTgo2WnjFhpkgbIBu6On5by8ux66WiKBLBzWJdf4Pf6RCn1pmz1agYiK7SMfaxFg
         3/2YrNhOySAcSPgNeJdOxPH8P45jGqKY5S64rDyy/GqimZuTwtSLFUBdu/5vJlpZdzzr
         s4bwl1Rg4R2P3YXWI3cJVNf2474sYNB2WqyefKmd2Q9zmRyjanVGbBx1PSJBmR/NBbVb
         Em8am7TBb+PrC/eYOYbEaS+JpnHnvhpW0bM+eu6neOm7LPUdBWC1Zs5EIHxnkkBtcy2S
         FqTLqasaecjeohA6M/KuBjaSrElM71neIK7tdakJn6qod53aVVQSxRc62gnUmZLJzDVT
         ZSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530035; x=1796134835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hoa2uDGRiz+jXLxbcD4HBQF2SzMfWsHt0csEQeOTfAo=;
        b=x26Qu5ZGI6uCRT7CiUM3ECkh3I1erJ3Fd5d0kBuRvzKv+z34VWAD1B/SFfC2wWyzhf
         ucegqjPCkgErPm2VLF/xKeHP148y5/zvWceSI4+h2CvHGh347ad7+1StfYHwcWdZgk+U
         XstIzVNmbUWzdxOlwjmQjos6ZIlnBnfL+HYeHAh1hxfHhJOgUADEL+7RcANOHHRgXWpD
         OnDhObY29Sm3jUnESPI5PwLDzKLtuKGCYW5H6pq0cTdpODCmfSwAznmzGGAJhalR3Kqh
         iUlVkqZ67sDSS4K51QuAq5H1vpwr+tXUnPu5eqwQNkvmeItGFM19yQPAqCAtyCtXa32W
         Irqg==
X-Forwarded-Encrypted: i=1; AL+hErH8WeACzWOsPsfcwDdHhSP9Wn8BvGeL1Chp5r+f+cwbY2jXGfVhoDjuKWwEDuek6eS8nQulN0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GYVFYkMsFICNmmIKBi4GF5mMk0ZrW/dg+gg00OACH0d/OpfIg
	OhM4J8apFR0p2uG4Jw/4ClIMbkLxOwKmAhjfxNt7vh7p6SQEHXEpAhNVAgUCYPkYcCM=
X-Gm-Gg: AZFdTZdB+FbMQaG1hQnVxzN0wcRm+p9GuUQMAQcDqD72jSTn7BdAvPFa+3+rekT2AKU
	AtboV6QaR6RZvPg06movafxJhE8Ggkxzim+sAudI73+q7o8FOew2J2nQl6cKZM8yrB3M4t97l6f
	XxLdc0+ahbUbJRWsqEYgnjGeiVaL9Wn+xfeQAwWd4KLpYYoXV2oilFG9fAxZdxngrvfLLIbhl5f
	y4stKseevvMw8J6KRiyKbgKe7RjP0HDm1KzCyy7QKaRCM+n6PKi7Kg1K2Vhnk6vlCZVpeCuXZik
	JMD3tbxBUGIEKE/7nUUtojr7SPwdV/z/dbXjxv2e+qcRaWv9q7ZhcaNG8un9TG0dtLTh6GY5PS9
	2Bbq+6ev2GJzfimMxOUJNdXBNkLUgjyT1KgVRPB302ITfAd01C70ciCGU+tK/S9CXO7cW7vFnzx
	mj2KvlB8+mVVMQNXTUruGQfJ/FQN7Nzl9XmuM9ePQphU/4iG53bKvusbPXkBIEcD1dBPkXxaJof
	o/k5QRxfyje1luzQ8pT4EuAkeSNJbQo0n45eh0NFjhoQT+/9D9Xdf1IGVBBVhWF1Z1RbdNouqdf
	hRregGMKioFDAuIldIgyhGejG1w=
X-Received: by 2002:a17:906:eec9:b0:c51:5589:35a1 with SMTP id a640c23a62f3a-c515589d211mr891019366b.5.1795530034479;
        Tue, 24 Nov 2026 06:20:34 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8dc60sm518286266b.34.2026.11.24.06.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:20:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVrNo-00000000RS3-1UVp;
	Tue, 24 Nov 2026 10:20:32 -0400
Date: Tue, 24 Nov 2026 10:20:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com,
	treding@nvidia.com, jhubbard@nvidia.com, chaitanyak@nvidia.com,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
Message-ID: <20261124142032.GN9566@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>

On Tue, Nov 24, 2026 at 01:36:21PM +0100, Christian König wrote:
> > The core then negotiates compatible types and adds converters between them,
> 
> I have strong objections to that plan and would potentially NAK it.
> 
> DMA-buf should *NEVER* accept CPU physical addresses nor provide
> conversion between different address types.
> 
> Keep in mind that DMA-buf is solely a container for DMA addresses,
> nothing else and it should not provide any mapping functionality
> whatsoever.

dmabuf needs to provide support for drivers to help them use the
interface, and going from physical to dma_addr_t is absolutely a
common task every driver must do. I don't care how you call it, but it
is a service that must be provided by *something* and matched to the
needs of dmabuf.

I will definitely NAK any direction to open code dma mapping in every
driver again. If we are going away from SGT then we are fixing all the
DRM mistakes, including the wrong open coded DMA mapping, sketchy use
of SGT, and abuse of P2P that seems to be endemic in drm.

Meaing the exporter constructs a phys_addr list, gets a P2P provider,
and some common code constructs what is passed to the importer. I
don't care if this is in "dmabuf" or some "dmabuf library" or
*whatever* but it must exist as common shared code.

dma_buf_phys_vec_to_sgt() is the template how to implement this
transformation.

> > and having SGT as a type is what allows that. It only exists for unconverted
> > exporters and importers and eventually goes away once everything is converted.
> > The idea being we don't have to convert everything all at once, whilst also being
> > able to add support for different interconnect types. Are you ok with the SGT
> > type if it is just transitional?
> 
> Not really, it just complicate things.
> 
> What we should do with the mapping interface is to add the
> information in which domain the DMA addresses are to be used.

You need to negotiate the actual C data types too, especially if you
want to do that nasty idea where dmabuf populates an iommu domain.

Jason
