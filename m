Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549581;
	b=MIS8mKNCy4Yf92jPb7LQq63s+fONcGaCmuxMliWjOaihIkwwUzEoXmTbM5UWXCIZi23b
	 JiFwCZ3kX3XdT42UrAP+DfM5tKY6DdLYwi/85VVKPCpmo86oD44OCNpOm/ayujF3dzcFg
	 AC15JY0eOfb7m8VLjmWTM5vI8M3mmna692CiLT/wqlAI2t2MPST1DleaSOfx+A2hApR/U
	 dP6NF2nWnHEFrTngaMkXVRfltrytmSLt6YWlRMGM708L+jhyWcciWAEuwmDm5pPS/39XN
	 J/ys4d4zMHszbLpc5hI4JqoQVZVAvVipsiSM/OKJnhbCiXa4mVKAhgrkgDP6tGGTMfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
	b=AhhAoZfBoltXOudY972Xyy/DW8hsKn3B4wW1+538YwVGIdt5PAWKvaJVIgbG/nvnVSX0
	 7EpqatK4hsnxtSX0nznKRrKQTypg/VJNjpzLkPGGAMNLS/eo3m+kHIGFWK+cqtd5e4xMP
	 KjjmW4MIZ9vvt6zx0RiWounuU7vPaqfkI00INoZYthdYjK9dwuktZ6znZvvUegDKs480p
	 C3+dcvleJv/EMZoUnX+0gKQ4z8Sh1gtNSLCw/+djGXXliPrrFQe2wMX93dALLl2Q7CORs
	 EOrothgjQnP4c73kdvY7FTpApt8Sze/63lpwEAeBXAD8AHn25fixIar2Dgvu+CIU4dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E3606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hNzo9bKF
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c48582654so55886631cf.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795549580; x=1796154380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=hNzo9bKFfhVQc9qzPT4XFVGb8WWDhkAsWzEGNeoMtQsVv/UieKFHIx8duXK+pVyc+7
         K5tuXAPvt7SnRa+oW1TYccovCbxEoQMg8PMSal3gZtNqnBkfc9eaI8iRduIFPXdXeGyC
         7IqbxUGwhapkSK1PkTGpbVYuC07dIRe3KRRo51bldaV5T8p/83gXtSNREqT8fVb1HMZP
         lRwnNEOCDprIXQY+fn4dNi7XyHXAEaKdOG2aZhU8DQiLg94XiGTcamJqB2smYFg1x/Sg
         siI5MDO2hfLOudZP5xdAkje683/c7T63Kjq3de7kKz2KbuVb5db1oTFbL+o0yYQz2SQS
         i3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549580; x=1796154380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCMOaZdag+2OcXEDMl2EbRqTcxfKhXeKWu4Qydoaad0=;
        b=tNbFzjxElPAMPmHQ+btnb0tFdEhfKMuA1/cTCnPf9ge0c47jH8J5Y2neAqNZZCVnnl
         Pzo+PtO4j5X2xhg1pLQDeqHeshtp0Bnu1g2/6tny0Zn43xthg50LnM6xJY47nLBMRnz+
         Q46bIQd5i7wJYnW3OM+6qsJN98DrWrU6m4P/N3aqOjkHoxFoJIir7oSAI9ZDlVFe3ARz
         1mkeWJgpJ8gesIyroDLDkoDDXgupnlG/MKQkByq4H6k0UqYNH1SxBbeMVEIsAOcP5f5/
         CCvy9HkGZ+RG+0z2lTxs/5gdcjfZCfWmL+67/O9jVXza6oXh3fFazNFvkKKKsUUlOgYN
         YGiA==
X-Forwarded-Encrypted: i=1; AL+hErGt4vRdvMtUoAfqBQT7x/n8sO9bi/1oDdxoFAWvLp7Eu6zhb0Dr1mQaxVkIJQ9EaJ7Iz0yREbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kTAvre8GgnMY3hHsod6s8aXBJweMyKgYhX8LkZBZ7FL+yAsXY
	sXigqX2a3RueMhhTfFYpxYQttU5muAdQ18veyEDRJSjIbPUkHctFF3ME2EiQxg3iTGk=
X-Gm-Gg: AZFdTZdJ9jDjaAhRoPVfStjXW7zGLmPHEUcuJvz4vTKv6RrnhkTgVSTZEbE5VlPuMwh
	brn3OsabiQOW4SztUDHfl3Lgk7ELfpvEVeU12+4YfX53tnZ/yIMmvITB/0xkAwC0Yj3wF2MD30Z
	QHTWQ83mjtxVA0QwQTew8JyYBs5BXA0u8SV5yWQnaU3vOfmuexl3Spy+9H5ID9bj+M0pj+92BMK
	p1CTNMzSBCSXJ6uNS+BP/8InZBauRKdZGJedFm5tTGbWAkx2L2BHJjGL4CBdLWXZXgMz9MiHlMl
	EmBzOTxl93V+2hYKjwxwOM8AfjbPfoHMhvP9oWMKPa7NqojzmPBHylaUGleiUvVLFsIu0jWmfbr
	AKg70uB4OymSwfz9vH8GqwVJmwZ4HjFU/3jwpYEfzTy6IAZQ25NvduZ5Ppi1CcLLOJ7fb4RULIH
	lQJz3CwIWSmv6ye3+hrcVpCIjADGdzK5ytAybTF1WpJR4102sSYSW4//kOxhEUaTG1skg91lMiM
	3YXMi7XlaFpAXZICPZQjhI/c+s3/5qxea8nwJbxUJHf1IXb9ipdkVzeuxpCasQLOPEPOduMa2d8
	hb5eog==
X-Received: by 2002:ac8:5c8a:0:b0:55c:66f0:5bfe with SMTP id d75a77b69052e-55d76a6f55fmr288174681cf.22.1795549579924;
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm135596661cf.15.2026.11.24.11.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:46:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVwT4-0000000113s-3B2s;
	Tue, 24 Nov 2026 15:46:18 -0400
Date: Tue, 24 Nov 2026 15:46:18 -0400
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
Message-ID: <20261124194618.GC114530@ziepe.ca>
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com>
 <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com>
 <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
 <20261124142032.GN9566@ziepe.ca>
 <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>
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
In-Reply-To: <7a5a2d3a-e42e-4dc0-8d22-8dd1bd249501@amd.com>

On Tue, Nov 24, 2026 at 05:02:31PM +0100, Christian König wrote:
> The whole conversion from phys_vec to DMA addresses is something
> some API should provide based on the data the exporter/importer have
> negotiated (e.g. p2pdma_provider for example).

Yeah, probably, and this is exactly why I think it will take some
time. Building a new something in lib/ like this is not a
straightforward task.

But also, this:

> > You need to negotiate the actual C data types too, especially if you
> > want to do that nasty idea where dmabuf populates an iommu domain.
> 
> Yeah agree as well, but to be honest that task is negligible. We
> first need to figure out where to put the code.

Means you need to get the phys_addr_t into the dma-buf code so it can
do this conversion.

I'm still absolutely NAKity against allowing any DRM driver visibility
to an importer's iommu_domain if we do this hack.

I don't see how to meet all these concerns without making dma-buf into
a "converter" framework...

Regards,
Jason
