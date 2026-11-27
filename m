Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784277;
	b=BdpcjKOT8CfIyePCUv4B27uHXXC5Re9nKeLBVwuaChjNK3pzdi/jscf+Pr90tz9uipEW
	 uWTjsTYogbzLodcTN7F9XBmYUe1SwoNH9CskZ1SKgNHWG7yEVt1amu7AQuzbj0SWazrTH
	 zN0OGGVcvnwRwRnuQ2qaC1H/vDqg7DSo1e3rulMbTH2URB8PZMmnBPvhXB1Y8f5Gt5PFE
	 JXuqDv1tgvmLjI2Ou0pGfJe6szMn74rhL74UGat2MgiW9LygCEAE5dPvtN9XWhX4PFxWN
	 i20h0AH1YgJUeN0tDplROiQC75XaSjLEXHS4wCI4GZHP1zUmVA1jr2c/UNrX2B/NO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
	b=zXv/ollgXuTodY7Q/e0VM7caCZDcN6DuIIAyfBaBO7JWl0tpXCwLt4UbxHC2yMLjKsGZ
	 SkbmT9bj+a2XI0XunzpCq9G9Q6Oybhwchw0PyiLVHlkKUm7KlOni/4qyE9BNH32ZQQk51
	 S21NMg5MyPKzXIyZdeDkJO3vyERsK8BQvBEABopNx2rJtg2ppzMrIzvL0v+pE3UfUDv/Y
	 aOiQwci4LoppgbdL/p0HKemCkfVfb7zIsriV4r15x7UqQozMYisvpbz6wWnkzY5q3E7AB
	 AN5rvIq9MA6k571ikc1yYrA5Q73QPQO4xjYg4p8PKlMzdkyDlQh45bjyFcP+pjAfNFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=j7O+BfN8;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3F606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 12:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B3F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=j7O+BfN8
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55dc111ae86so15898181cf.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795784275; x=1796389075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
        b=j7O+BfN8/f6PwjasmxVhCBoceSC0sabwtMYxOvl/V+So2Mtlli7upfWXQOxdcMdwlP
         kdbWoj9wMH2VLhhxx9/W4qCwnXSv4SqCJA4dPFpucC+JLWjduqow4FxZ+HWokuT7I32r
         ZWkzzsm9oj4IR+X9hFXovpTueZ77GXxtTqpSEnUit2eZjN+4tGNr/uSL7JrpEgDwlfsZ
         gb6ILQTqqyaZeZUvLD8uZG2VKKCPgLdNfX2MOIWU/36VOy9usYwIOe5sNoISKHnEYyvA
         l0mQ01iQ4VywPJOhfdj9Spm6TD5MFnNoXSCtVssrDxM7oa6Cq3wIYpgkEkUlt2jLsmWD
         VJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784275; x=1796389075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hpgxxji67KrMZBTg6jUjcNbfY5cNwEwJL3jB25wL4Zo=;
        b=k70mCE1H6dRqOEcf5OqdobdgkqVBaP2yq/ClP8CIQwjSYwqTPE2F16m/7QAunwBtCs
         MjB+04jth/CET1h5xptAdlIJ3o8NnSfNXAwtdVOa7cdBCvDBSygnLs3cmLSWeU9DX8Gf
         3MtELCeNM+9mkQt0lkgdLlfOlBWoekqb2vVG7uUYLEsq/cn/Mr5/1iIDZ8ftYqGmVDHD
         jzrs5qAsF+r5tHiFqpaMF5RRAVuaq8lWsVpKWBj74hOiANkzz5pY+lpqQn4t7Pov42i0
         O3GFjsgXvsdtBS35b2IIrFEp2a2BFHIsTo0+sO4i3RXo0nrPZA7v9rEaYmduq+fzWh1G
         +Gfw==
X-Forwarded-Encrypted: i=1; AL+hErHitUhEd8KEGmOWYyFuoM2JLmm1ZlsntbGutdSl9SFiFjiqMWAORuD1BK5VG4ysZocndiyCxmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+euztMQpsYt8ltyRBDtI92NjC9r2zPMOoYzmcKg/z+6y9NRafp
	BkON4opyDNpxq1e8FqmJr+7jDnpnYIvbhWkqN+aEhbJDr+CaWaBzLjZiYpqpukop4To=
X-Gm-Gg: AZFdTZfPh3mYhWLdCRZwZC8ZKn03AupAdci9JLLR8PczgkHWxr7EKwMFQLsK9aN4TxX
	kvs9KGC8Iv+8lMokOBJP2e3NII22Y6zo2sFTPkLp4Qnzke8KF661QLG1BS/DEGQ/zTEULdF0RAi
	nUPRvz4b4F9jWHUPT3OPlkiMq2LhQxu/CesMFho2yDdvCcFsbLR2tJjP41dzeDS+N1RBCFsjQlL
	LBoWHzBprXzCLlxCDg+hZepi8kTu/9wR2QBTagh/PptyDxKdYY0KMGuJMkzVVnMVC5OQQdWWyFn
	hBvgYS+v4g/hWX1OzV/Z7ohlDtle8LctrR6eMP5mWJO6GF5Ajv3kpqQTs9QUC6IXJqieJb9p2Ye
	tAJM8QKjwOSpzNB6FtFn1dNmr3+no7oKS0+ZYN6sgmcfJLgb05B6BVCKMWqdd1UthRRuaePkxgw
	OJqF+q7bkhqa6C/cQUfZhjYxrSD1Mh+4xTW0cGKo6OFfZhEnip2U1CvkEcfOK5sW0NaBx1eScc7
	g8IZWlQTzGBzyIeZecTc7tqB+SXcgT7xxJFpJlz0TvcOskt11q9iChM3XeAz/IPGIdSEMX/pxDG
	YT+wUQ==
X-Received: by 2002:a05:622a:48d:b0:55d:3689:913 with SMTP id d75a77b69052e-55d76aad14fmr455567241cf.77.1795784275571;
        Fri, 27 Nov 2026 04:57:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dbeae112bsm55627651cf.8.2026.11.27.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:57:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWvWT-00000006hYF-3LIW;
	Fri, 27 Nov 2026 08:57:53 -0400
Date: Fri, 27 Nov 2026 08:57:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
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
Message-ID: <20261127125753.GS246011@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <CAPM=9txheaE3=fp7=n4fYh-xshxOm+Tv=eQn9wvHVAc-b1JKDQ@mail.gmail.com>
 <79d62f9a-cea8-4149-a673-7ef86942410d@amd.com>
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
In-Reply-To: <79d62f9a-cea8-4149-a673-7ef86942410d@amd.com>

On Fri, Nov 27, 2026 at 09:04:15AM +0100, Christian König wrote:

> If we somehow prevent the CPU physical address from being casted to
> a struct page and/or used with vmf_insert_pfn/page/dma_map_page
> etc.. then there is not much of a problem with passing around
> physical addresses.

I already offered that in v1 of the series using limits on
EXPORT_SYMBOL and you NAK'd it too.

> > If we need to shared object backings and have clearly typed and
> > negotiated on what the backing contains then we should allow it.
> > However I mostly agree on the mapping thing, I'd want drivers to
> > negotiate and natively support whatever backings they can rather than
> > having an intermediate trying to handle the conversions Not saying the
> 
> Yes, exactly that's my concern as well. We need to avoid this middle
> layer trap.

You avoid middle layers by having reasonable subsystem helpers for
things to use to build their stuff, especially to encapsulate common
patterns. These helpers are part of the subsystem, or in a related
subysstem helper library.

In Linux terms middle layer almost always means something wrapping a
function pointer callback into a driver and enforcing specific actions
on top of that. The recommended counter is to have the driver perform
the actions with helpers and not wrapper the ops. It particularly came
from the block world where they stuck something like SCSI after the
block ops but before the driver.

It is hard to see that DMABUF is anywhere close to a middle layer.

This is also why we don't understand your remarks about
dma_buf_phys_vec_to_sgt(). Of course it belongs in dmabuf, it produces
the dmabuf spec'd mangled scatterlist that only dmabuf uses. Where
else would you put this code?

> > code doing the conversions can't be a helper, bit it shouldn't ever be
> > autoamtic or outside driver control.

I think you do want it automatic, if an exporter is new and makes,
say, a dma_addr_t[] and the importer is old and wants a sgt, why
should we be open coding anything in every driver to deal with this?

You can argue if it is automatic because the driver called a very
general helper or automatic because the helper is wrapping a callback,
but that should be a fairly minor quibble not a huge thread full of
NAKs.

Ultimately DMABUF has a fairly simple flow:
 1) Allow importer/exporter to negotiate what kind of interconnect
    they want to use (PCI, ualink, etc)
 2) Give the exporter enough information about the interconect path to
    make a placement decision
 3) Describe the exporter's buffer so any mappings/translation/etc can
    be setup for the importer
 4) Program the importers HW.

Many of these have very common patterns, like PCI GPUs always make the
same kind of VRAM placement decision in #2 based on P2P support. This
should all be in helpers under the dmabuf umbrella and not open coded.

Jason
