Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453039;
	b=XrY1nEi79uHXN/f9UvQC828uHOSazfoMpOnK4I2nKH9YpvKXeF73GBuBvgEpaNBXgvrl
	 bZ+Mas40yaS9PgJ0O1WGvqXbTxu5dwSOZ3RPvRXp0aFRGzbvBNEnoURwPtG2GFfPc63ks
	 ZaaSBrK0hOLJDoHfyq9NEb3U+udqIe3Eb7xtdDnNEK64eT1+K+2+EznfpJwtkF3rQ+BNM
	 4XaXSjX32Q833Cu1Jd0BJA+7547gxcpHP6uisylyKaqLVJ/WHVjdEYq9Y3PUdGxyp1uB/
	 NQnsX+6UD5D201zNB4XqiZZnUW4mIJ3pk/1UtTyEddrWxsc8z+xLqUWGV1RVpLb8Hlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
	b=EoRfJX6EEowZ5VcHxrCAnzcic/qD12uQlcdfQimK3Y36B7J2hqMjZTkuCRvu/CI+Sa9c
	 9DblpuBprYjgQZWO4+cyS1GGtS+MOyXQmFxUf83LMGWJpRd7HJDGEeIumpIM6W/PBktnO
	 LJWieZUGQTNfYsGEyXDk+LZG8ayWrEahuyYEFilZRbdpcuVYfIedbtK/5IHDK/CgYdbNA
	 Ec0e50KGaT8tNMYk2h3f9lRyXbnCrKOL8gsClxkRfGsWdgpgOFb6AQXBsJ3c4+mAn4VUs
	 3Kjq7OEuTWrGmQ5gQCIyZ2fxxqqPsOu1E6elXr/pAkI28WEtPXX5XnoiLvOJzv6jqmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AhgqFtUx;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD50E606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD50E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AhgqFtUx
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9212dac247aso37819616d6.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795453038; x=1796057838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=AhgqFtUxAkQppOlVHwr4sQwZVIp7IUGPtjYW1ZgPhelHowbnMq5+k5GDnpyrMpQ4QH
         cxZM8Neiv/9bH/kPoiZH3Aoqwr3PKOqe03k6A9rEDhNNu8cE7bMZ7ZN6cn5HMRCbglkh
         6TGicHFpPHiQmGNvl0XwYRDUPffckFT6Cr3T/FR9P3kqO8+q9ZGHdE4Escfknhdbv2XG
         UcS4CezJjEIVbAEerPQiNY3R8W6TDU8Dv5YeHcYf3//QXv8tVGMKplyYb2NJ13wU11xy
         39d11YeHjPmMuE/v7rn/Kn6ypXu+5QEE1j5feAfp5FK3hNt3swguJ5rblF+gM/EtT00g
         E1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453038; x=1796057838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j5i4WU3qjrhh//MRl3wcVLLT33h5NdpwdC0V5dWlBjs=;
        b=OE7qVWHGroeAd69r782tQGOv8Lnuo0SggnlOqa7g/h4vI1VqLPuo64xVrmz1con7dJ
         tjZKYEXZ/lYzLJT09QW95njM6gtLEX6h32VTWUQs94zwPwbxFYgDhyK2nmkUvtE9oX/e
         H8m7WrfoFyDxUV/zJjdNf7RzmKaRY2SNQXygX0lUWK/lpXRZk1ohqve8sQ77oOkX2Q69
         VuuboFIRIABpMQZcxSHaoGBOB+/RjTrCBbG2Yj0kjSJC4Sp5ynQRVST82TaTN+wKyJhQ
         NahRnjLqxtq30NIpio/t2/3OMkb0eFfUGNq3wKXVSN+08gaLOBxBubXGbE2eI3GYxkr0
         PMTQ==
X-Forwarded-Encrypted: i=1; AL+hErGqR/HRcQvEzU+lK1PhZ5cgK+wFtuTVfuu5qsECItUYw6iiBz4zVD+V3tyqU60vDGJsDhFLtFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VvYV+NPu6Cx3owrT98xA1CICLRdsRZmo8XgY1zfE5urDQVRcF
	e/uYdYbbCPtVlptuknDwKE9FCbFiCqKT6ZGKYAWlPHFByexZ8yLBFaRtnYlOwPAEuVc=
X-Gm-Gg: AZFdTZeUhx9xq8EBy5y8OmEy2uW9sS3d+ZYcHO8TbW9QHDjGJJt0Gs38inGRzqt0lBH
	2JifL18WTmWGatxgDGgp2IRcRYxL10uRWbQ8wU8ctoI7orKJfwowCYQmvtCVsyn9xBs5HIauNQ7
	Rep3i86CVRFAuJG01ca3gZp/r/AodhvIpx7hjZkBxuKRtAtnxg4wAOSqMZwL2KrjCCWi6b90JUJ
	tSYDAZsz9b1D5l2VVuQnxN9JS55lNHg8eBb6Geb2uCCHD4zZBjdy7t8vyRmCLMGVbpUgn9Kvo1t
	Xh0qf10kaD0uUOxSJgHxZFCsJWi8gIKd1P/QtM0gxm9e2f+/mRKijm/52jIWO4KrEWcKFWJPmz4
	wZV8cRsXmxmrP2a4y5U3vlDFu5raUGHemW222/DiAymu+d6j0/DLiyoCR1ndJaC3vtsIxKMe4UT
	zGIhrrQNnoko/l0pgWI4G/DIBv/IBz9KJJllw2LP559XUHhNW/e967zcBzLVazNATSPcqDLMH/b
	1CewqTkTQDYxbWo3gQF57RKNZy8S2027PZmTITTghuJGS7BvVDjwm+sWay04XsnzlGJNzKgBVDV
	YSFFhM0IUlWPV7XAG2UcTvwro3VdLrUOyfnlnkCJAwOSdxMtdTxH2mJ8irtlOy6NlyD5a01qq+R
	EJfJ6280BKsfI7uQd6BG07prs
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr1950593985a.77.1795453037117;
        Mon, 23 Nov 2026 08:57:17 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm844162485a.6.2026.11.23.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVXLw-00000000woc-0Jy7;
	Mon, 23 Nov 2026 12:57:16 -0400
Date: Mon, 23 Nov 2026 12:57:16 -0400
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
Message-ID: <20261123165716.GM179082@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
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
In-Reply-To: <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>

On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian König wrote:
> On 11/20/26 06:55, Alistair Popple wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > The SGT (Scatter Gather Table) DMA mapping type represents the existing
> > sg_table/scatterlist based DMA mapping. For now it continues to use a
> > sg_table for map/unmap, but this will allow a future patch series to
> > convert to using a different data structure for importers without having
> > to convert all at once.
> 
> I strongly think we shouldn't have an SGT mapping type in the new DMA-buf mapping API.
> 
> Instead we should have something like either an array or an xarray
> of DMA addresses.

My plan was always to get there, but I don't think it is reasonable to
start there? There are too many places all over the place that are
just hardwired to do SGT right now.

Part of the design of this series was to allow the conversion away
from SGT to be done incrementally without breaking compatibility.

So it is effectively this:

> The framework should then either connect the SGT directly if both
> importer and export are using the "classic" interface 

And this:

> or convert
> from DMA-addr array to SGT and back if either of them are using this
> new interface.

Is something I imagined as a followup series.

As this is actually quite complicated and needs discussion exactly
what it will look like.

Jason
