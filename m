Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622162;
	b=tEwotvLif4D1fCy99w/fAwM34hV0PRpmTYhNoYtjLP/y2RLn6U2nA0iFItmJibizBtl+
	 asq8rQ+fSG8zgQ1K3ZOq38CxXeFEdnfGeaNYv1nxoCjzMIjrWy8SjQCSO5hSpmKyS+4gx
	 grVFkwefE2dvBW+hU5PMD2RIdojZAET2V/UfLXl1lDLJHFTen9T/T91en/F+jFAK3aXMM
	 4OR6LSNWDdZqRSN4nSNQvR0phJy0ppIwY3pfuQySsMeI5OjgAJ9JksWCycREYHEyFRXr6
	 cK9eRV2jVDjJR1kYd1VwH2bpE0KqiWP6CZ3T30hX/ioFysNa9oSqoXJ9HXfx3cP81mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=EFVYxWaHZcfOFQ3BpTu3S3Fo2WDIpYYjIvIe38jWEXE=;
	b=afP2Iic/jaZE82oVySCzYAzAxjdM+RXhKdSKYq2nMV5hEfKbuoQdmWyoexvH8x06ks6K
	 V7gvMasL079iHff5JGyvjRb7bxqttkRIlIztyen/ybV3O3ZucNcVmDaxG5MbEG//Y3T7p
	 HOQQ+/4iUsOvp1BIPTUAnL3QOm+VLY11yfInragBgS140le65Dsa0B5CyS4ZhG3YJtLCu
	 uZiBfiTWA2j9/3tn1bMn5oHqNKqMv/fNKLCFQRcwFy4rlx53YP8sngymeWUdmVEltwhQ+
	 iZ946iHEBzo9fIVvLG8zLm9a8ej5mN+51h4f0g/PFxRDRIe+9w6eZ3+6y6o1BpX2/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AunkM8Nd;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B12606A33E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B12606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AunkM8Nd
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-537548b811aso49245051cf.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795622160; x=1796226960; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFVYxWaHZcfOFQ3BpTu3S3Fo2WDIpYYjIvIe38jWEXE=;
        b=AunkM8NdkleqIXitLeobLCQ3Tftf6jih38/IsUVKvscsn0eom/XU3ykRho0PpQ0az0
         rYvStTeGGeX8RzqZvSmkfQ8PnfZTaau/BD81gD8jksR79zy0OeqgvvaJ5S12A8sDTRmI
         nDzgUpEThFfPpbYyy92hrIWUBiAH5NujeTowTbmHDJbrcMjsoGpU9TLndiIxQJscM2JS
         KPSmuaAUUkGT+shzqkoybwk6wagC24/6Jh+eTluckgbUG1rf3BSFzpgbcmXYy6TNs3mH
         xxseDQrWCjodnpd9Wzsmsn4TFh6ZehNtFTOJb0+srU8fXJGYJAlBbpVfqIml+61lRgAa
         8/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622160; x=1796226960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EFVYxWaHZcfOFQ3BpTu3S3Fo2WDIpYYjIvIe38jWEXE=;
        b=xsGS56nqacMrGOG+e9+O3G7+RQBnxVz3LH+kocye0xB3tONozfKG74oEwcfTCLOmVt
         oHrKENKqx3KIedcuEjwIrW9P1YyrtvPRHcpFVpHeUegBJGylvsvWz0Xp/vnQ5GhmUSrN
         ZA7INn5Gc3PfM3et7lcUjFqcMRecv2V+XxP25U1In9QQEbyPdqjBggb64J2/wSxeXUa8
         arAlo9ZA+tBeiZGa/KaZBpeW1+BMEAtTXZvYK52dyLiZbv1deXvX8HY38sO5rLcdpzs1
         75BW5Su4do67W9e/JNjKeKMu8APd7KgmTnPQWIIjnUmVMhNiRp13PFR5Dma8TYPLrHam
         nStg==
X-Forwarded-Encrypted: i=1; AL+hErEHpd5wERX+66Lkbad6yGlaYBPn0RNKbKl2dawdx0UD3tbSLlszcS5Q0nYTX7+VZIbmCNLp3Bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e9t+WEXZADc+XEwP45mDLf+aTOy18vbt0nzCso+Kxjf4FfI9+
	gSwOdSKDDbKTk7yxSlNJw8VXYVn6+EwY5Cq6VlhZBNpBnRBeURNmHVLSvHSaRZuHdeo=
X-Gm-Gg: AZFdTZemnCVaP0Lsu+RbW/UWfxqTq6j+aLbCkdlaY8ULVmi0kmtPMN4hisX9ni3SbDa
	o75UaiN+/4tQCRNwhFHFFl4e+gGxxDQR6wevqcl1woKlbejDtPEG9en3i9bbru0VF9xXUR22HxP
	f4PaM8daZGPWsoIJjeoLhaW046cfi47T3o685k4RJ8zj9Cq5R5QpnxObvPt1MV/7IEkLV+4hezb
	1eln3xe2dOteNAhehfn+9tuqipjekGDGRi8gj01XFEoBN4NzYo/9CSWhXX0K7VeWYrwNOv7xGN5
	DD6RvUPw82ParcjkFcgd+5pN5CYILY1J1pdDvWWK8yNkRyEbnbazt+PEJRXLiGaG2fo4Y/q7CHj
	PD4Ajma00G2gHhux/mqF64tmxu4Jn8YYwnpwStXDqmeiFYgsw+N6X5R+Glqo2/SID2QH/iXW3Sh
	Ka4M4hsXT5o3eHsV43n3LCtaLhaRQ5Rwqql8LCTizIrTkgEy/iYSz4xR1GFWJjUou5SoTfzbOVq
	PSMasqGtEHZcvtYLuat7f4+syxWMaC7cf2tPWJ3B6tLonezd7vsmXd9WwbxXB8Oq4/Nd+rqbNlY
	6c30yyPegd+SlKYeJyGbk642Iio=
X-Received: by 2002:ac8:5d89:0:b0:536:5696:e8c8 with SMTP id d75a77b69052e-55d769e4561mr347501161cf.28.1795622160509;
        Wed, 25 Nov 2026 07:56:00 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm160274901cf.11.2026.11.25.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWFLj-00000001uyg-0aUM;
	Wed, 25 Nov 2026 11:55:59 -0400
Date: Wed, 25 Nov 2026 11:55:59 -0400
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
Message-ID: <20261125155559.GL246011@ziepe.ca>
References: <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
 <20261124194618.GC114530@ziepe.ca>
 <awZ_Os1pXelOGaFP@nvdebian.thelocal>
 <fb9a6b12-c134-4e40-86a5-dbcb59c0b91b@amd.com>
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
In-Reply-To: <fb9a6b12-c134-4e40-86a5-dbcb59c0b91b@amd.com>

On Wed, Nov 25, 2026 at 12:19:08PM +0100, Christian König wrote:
> The low level API which talks for example to the IOMMU driver for
> creating the information how to access the buffer is simply not the
> task at hand for that framework. The stuff we already handle is more
> than complicated enough.

No matter what name you give it we need something in the middle that
can see the phys_addr_t and the iommu_domain..

If you don't want DMABUF to be that thing, then I'm not sure what you
have in mind.

> > If I drop the type/placement negotiation for now and focus on SGT removal I can
> > simplify things a lot. Plan would be something like:
> > 
> > 1) Introduce a new C data type (dma_phys_list?) for exporters to pass physical
> >    location info and context for mapping.
> 
> Something like this maybe?
> 
> struct {
> 	u32	mapping_type;
> 	u32	num_entries;
> 	union {
> 		dma_addr_t	*dma_addr;
> 		u64		*generic_64bit_addr;
> 		...
> 	};
> }
> ....

"phsyical location info" means phys_addr_t and related, not
dma_addr_t. Step #3 has it as the *input* to dma_phys_list_to_sgt().

The flow today has the exporter get a phys_addr_t (ie a struct page),
build a scatterlist and directly invoke the DMA API.

The primary issue here is the exporter *direct* call to the DMA API!

We cannot disconnect this from the DMA API, ie to use an iommu domain
or ualink, if exporting drivers are hardwiring calls into it.

Fundamentally the need is for the driver to get the phys_addr list,
exactly like today, and then pass it to an op which formats that into
the right data structure for the importer. Be it dma_addr[],
iommu_domain, or some ualink_addr[] - or whatever.

This is the main issue here, disconnecting the exporters from being
hardwired to the DMA API.

That's what Alistair is explaining. This sequence:

> > 2) Introduce two new dma_buf_ops - map_dma_phys_list() and unmap_dma_phys_list()
> >    - which are replacements for {un}map_dma_buf that converted exporters use to
> >    return a dma_phys_list instead of returning a sg_table.
> >
> > 3) Move dma_buf_phys_vec_to_sgt() somewhere other than drivers/dma-buf and
> >    rename it dma_phys_list_to_sgt().

> > 4) Update dma_buf_{un}map_sgt() to call the new map_dma_phys_list() ops and
> >    dma_phys_list_to_sgt() to create an sg_table for unconverted importers
> >    importing from a converted exporter.

Effectively converts all the exporters to produce a phys_addr_t, and
then moves the DMA mapping action into one single place in common
code.

With one single place we can figure out how to replace it with a call
that does an iommu_domain:

> > 5) Add dma_buf_iommu_map() taking a IOMMU domain/iova/offset/size to be called
> >    from iommufd for mapping an attachment into an IOMMU domain.

But that relies on iommu_map having access to the dma_phys_list *which
is true physical*

> I think a whole bunch of other drivers would be really happy to use
> that interface as well, yes.

Right, that is clear now, that it is not just iommufd that wants a
dma_buf_iommu_map()

But I don't understand at all how you imagine to implement
dma_buf_iommu_map() if you don't want this in the DMABUF core code.

> That totally sounds like a plan to me.

I'm confused if you agreed to what Alistair said :(

Jason
