Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528842;
	b=pcDzN29KS8xqQXL7phRrKOa1QWJEGyCm7watL3z6OagJAvLXWRWlLa44Ro2GT9HhYkIr
	 9CbuUBIU0UtmF3nKM//JvWdOZtuEcodLArN+3SwBP3GFd6dP0hKSbZpfbTBgW7G5VwPeE
	 qihlRW8i+3eZxlzKCEdxB7LB8xkR937DDyobyxdiNYbQX34iApIWYoggoHBvLPw7aH0H8
	 MNHunWQ05nT5JMPSTrHiETeAd1WvFBE9JvVXgJt3sfbhNjiWYY2wWAmq8/kRXfZtxJv3a
	 lGFJAGBNOLc6Sp1rUYDSXstM6LXlnsN943GtvulsD2rjkh4Fo3ap70ogQh1lKoxoNlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
	b=GUkJb4up94dq5YJPpy2yYoymqTBWQzoy4eG79HmjMz0MfHXOpid+NSPl1/SG0XJRJFwo
	 sXhLVGOXP611w8zLN3OOfNKeuTpnl6UD8RQCvDgJhuYGsUXo5F6/zpDnAbV35cyMjfWZ3
	 hwpW+Qc+T4vO+4NzB3Ww4lVORgjXUYBMwfqKyoe/EHqDViVVj3NHrDWKHA/vtYhDv1BTY
	 VJcLQ0CfyAtaCIVcKLbissR3ElxgpPwrP7slttZ8BcBv7p5iao3T8LxZyVA7MIxMjQtAH
	 VAURXF9VE/oHhjv9/2SfZiWOLe6nhnBTXa3rDXhuK/LqgQkRKsmN3uYG2yPJYxZEZLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE708606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE708606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=V30Q+iur
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1089074166b.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795528840; x=1796133640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=V30Q+iurO56H29PrX9q7wVWHAj934LHyh9dyaSa8KHPs1wYEL79KlkRZ8Ndk67ZYFP
         8Moy2ZuuvXyGxj6hxEU5MHXoHu4tO+Fkx1FOmb3i6VmcSl2yRSR7ozCFXelACXZQQdpH
         73eeCdMmnAdK5bgaPJM2yLbbq+7EGbpzKQXhHQ+LiUd9gwn3Zcp08lnZgZpi+N/nP0qn
         CCEUWkIh7w7v7yFw7Ka90+w4XwePfoZZMNmE95Z67q//yab58k2vPq4mUMHNrX/ny0rT
         lztbpD17efmc4Yo1kTZgqTWxQyLSdMFoAnYsApctQXm4VrrSm5WoZqx2pG7gjDZXr6oU
         zvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528840; x=1796133640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o+7iSwGfMjtzT2Y6Ygii4nLjUX3g93NcfuA7HOwwEkw=;
        b=Za2z0I0gW8gb9Js0gqKCSQo9P4KRQJ8w1wwzn79muRna/7iUVMH8goH1Srz+WyrrHM
         WquyKozJKmvE/9Gjue68vvS96agWoOY6b0CEGflNIfP+frwH6sjYlIcORTjOmd2c3qwg
         pDvf+W9Ct0yU09+MuOR0tTZNFrpxpWJyglEei+ymm+FnTzZQnEBEvECkg7krMzsJw/oe
         IwGm21UpBuQH1JZ4bG0b8N86ET2BgRlKP4w7Kq8uwYqDVgMonp7KSgz4mlPEl06QJ4tv
         kzRMHVV8/U798V8GmA6VMu+m5mUeXAEmx64087dmrCiuaSSADUUMAGPwpS9OVcSZdHqM
         zOww==
X-Forwarded-Encrypted: i=1; AL+hErH7k3IkLtui6cgrZzmulCGHYKVAa6CAkRKObG2xGKWpDU2ZivtmlXcb2jv+DurL1K4L57oScw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mSEFV0KatmpCcc4HQXW370ypQljtPOfVy8ZFzhu8y6NCOtYmp
	2vCVSVGH0ISeghMsaUC7/svFdZ0SlxEjS4PcDtcVJ6WsFFud3Zll6Q+4iBgOtEk26u4=
X-Gm-Gg: AZFdTZevhrvjSkuIs+qv2C07SfkXhosQZedZvo9MSxQhU6jG5RQifqsCf0iEFv7bPPE
	eYj9PYRQcC5v/UKbxX3k4tbEZ3B43UJLc9qONLeZ2metpDKENp8nnMhx0b77J5yAWBd1SIeEcrH
	BS3suuMw3osotrTDW5vzLXRFNFFBhpeQOtM6xx2ujk+f3gIphnMazvAAm7G16mTcByyvKSw+2OT
	viX4qNmeMjAHK2OFl1oPRJ1ACUw12i46DQxKg+JigSXwMBjVq15ozIeGDGGePbp2YvzQeWKJtHl
	zqwGD/eM+BsW8Hn5JZThyBK8vETPi05W4W45TyAchoG0GVMi48R7lf9mcmZp5lQjOS1jxETzl3R
	G5JlOxd83gJPW2dZOUTzGubTu87x8xlnrzJkhyDqgrFo1fwz2iBANaBefmNceouTerjPaNEXK1f
	/ELlhFMW57f4tNvNBQFRSqvBr9syAW6O9CFKQdfQoMNyFkKwBDMvED5m5V1aFmuLWXOIddFKZKT
	KXvICBo8EQk1X4rPMTP8LghkSc9FcIYEEiWLfeImdRveZ9XWcci41aRKCywB6F9Hji4vCIu3cy9
	wb4f+A==
X-Received: by 2002:a17:907:3e86:b0:c36:777f:824c with SMTP id a640c23a62f3a-c51315851d7mr1405271066b.4.1795528839874;
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm6492195a12.13.2026.11.24.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:00:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVr4W-00000000QnE-3MAi;
	Tue, 24 Nov 2026 10:00:36 -0400
Date: Tue, 24 Nov 2026 10:00:36 -0400
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
Message-ID: <20261124140036.GM9566@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
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
In-Reply-To: <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>

On Mon, Nov 23, 2026 at 07:37:41PM +0100, Christian König wrote:
> > Part of the design of this series was to allow the conversion away
> > from SGT to be done incrementally without breaking compatibility.
> 
> Do you know the joke from the hitchhikers guide to the galaxy where
> the dolphins are happy for exactly the same reasons?
> 
> I'm pushing against this plan for exactly the same reason because I
> think it will make the conversation away from SGT even more
> problematic than it already is.

I think it is well proven that trying to do big bang conversions in
software doesn't work well. :(
 
> > So it is effectively this:
> > 
> >> The framework should then either connect the SGT directly if both
> >> importer and export are using the "classic" interface 
> 
> Yeah but that should not be a separate mapping type, it's rather
> that we just convert back and forth from DMA addresses to SGT for
> compatibility reasons.

The mapping type is to support ualink/etc that don't do "DMA".

Only DMA API can create dma_addr_t's, you can't reuse those types for
something else.

And you still need a scheme to negotiate exactly what kind of
connection you need. Focusing on the SGT is missing the big picture of
why this was organized like this.

> > As this is actually quite complicated and needs discussion exactly
> > what it will look like.
> 
> Actually that is the easy step I think because quite a lot of
> drivers already convert the SGT to a DMA addr array outside of the
> DMA-buf framework anyway.

Given the importer an array is not so bad. Getting the sgt out of the
importer will be a debate.

Jason
