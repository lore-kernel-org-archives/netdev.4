Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795732202;
	b=xsW0UNJeso4AFYU8gqvyuDDRB0UO5iKht6xiBW92EKZ72YHrJiWL6IlADwq1AkFDpUOy
	 araWfBnBQ7evPLSs6XA3zqsF0T96ilV7lePqwHDwB5QlV8Apuz297t36H1MgtNcOHxfO2
	 E3OUTsJx17osfz3PBLeqM9yOktOB6uXRntvJexSiQ/tO+ut16rNQ51wbevcyTsK5q8Ee4
	 dA9VzVZXwAFp9jGC0SDv8LIpnSFCV6N4t3cQqlEmFy43ofM18UbywJzZ1uVOU9HrA/ntR
	 TRVa21QI13pY3I/89IE/VYw5C08TizPbCH7j4kK+w8ckX8PD3QN/7jXOEIinqQODY2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
	b=O5txBIhsbR9sPaBBqem94e/LJsUHjczFohEJ8NC43fQhKrlUmS6QVrriMOB3Qj//dQaj
	 +AzbFsKRq2FAmbkeDn7QgUMBaxwXMHia5+xMXtOpEE+9fNltXbYX7yQIjHI61GLot9qub
	 mAyHRlk09PCQnRNFonS4Vm/dfdusCyZagvLFYsnlTgfdA6lvEoQcSgBWGa5aKTRxLCoFw
	 2KwaNYoYWkFUxyGq5DXv6QNl8Xc9T7wuFZlfO6UjV/9HtS0edNfmFib+y1xzpWTy11x3b
	 E8eefFkStvIGw8ssI2l41ODJnUOi+7u6G+DuW1aByNrFq4RFIkpKBiFuZlgBMYzhs6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64624606A32C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64624606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921318b2eb8so91420456d6.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795732201; cv=none;
        d=google.com; s=arc-20260327;
        b=Dh2g+R8T77co4VG+dIpN6wlRcOpX1E+AmFeotN0Ag3SGyTFpsyHLmdmiI6mGHUNrft
         XDlSzQfKjBJ0J6EP4MBrTXPFcWm1vVXDAk8Avs0S325IGIeuC+VQ4BAL8VINaSrSgoPn
         cXUhB8dG8z9rkTLYRNLzmcrGmZxv/WEtUANeS0N6ePe3LEAgqsdngFn8/ZagoG9Rl/M3
         3VFiAY6f7O+Qzk2KQR6U3yLONn85WNo92CDioOYu6DXd3lVa4/NBkbwdOcwFqMvb89t1
         EWxnOxXKEFkCo9xw5xxqDbgQ5XXv+6Xt66xM1H7+aJookOBWPEjAYoA6SdSWnLTcdods
         fX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        fh=JstB0SrNgOhINVAFjpJHN1WQmOjzBOYcKJANBpe8zaE=;
        b=Zi6YKfnbaF2stkHj87eJZEDWJx0aqKr+Yu0/en+gaMYjakxm2FI97IZC0gcIod1f5D
         /qSDtB4Obt5UdsJ4Z19IPQS1HVLsTo/6CF58+UjmIr4RHjFn/nLSZeZU46CkHS0AEY6C
         y0AXY1UkmSJK3FUnPL3nbaS4x5PMfA0uvyWaV20o84c6MKR3KmqEPvCfsNA+zc44fx1y
         0HtkpcMiWT7xb6SJt2nR5ZFE/uA+eNrQWRixBQEXxMFuXkaPvMPls3nvq6ejmgGXr16u
         z3SCU/G8rgtD4FtZ6PRWseH+w2k9t6XWb/lnKywetG0shR3wFInjtXcZua+/3qhxnb/D
         jiAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732201; x=1796337001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=wc3hcrgpQyGy3NzEGt5a1A+uGla3D/nfNujGZRFuKyIiFzGqOi21KC7DS2glXgMkkm
         9h+Y4LWOCdhZ4sEeYplSgjFWfGOy0iCWIPHuZnevX4/R3jFDvCOgmtppJtyFtx1IxNdH
         eXAQ2kMqLigrG3VQ7L3vaBZAxoIJsEIOVBSmO4v+20XWj5DUiAY/3UBMNyfrzs40DHnk
         r46jDcx/WuEV9uFDWfB6U3jrMvrhigI8lr20ob33mdCUncAOmSF/tRl+SKLEvXo5d4my
         7a5UMj4aKiGjOk5KCF0X2jdUx9ks4t5/JZk8hoF6YckdILXvMPn98jKHI73lbTL6bDfW
         9Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732201; x=1796337001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=rEVnDVeXa6CMxRHw8qnCDrA/fmf3D0GXnhVl9F0sad5xYkeK1YFTFA/+Ph4PEM7MIi
         1zgGbxOsfR1R3vC+PoeEpc61ol6y6y0wK7sABvtcPn/RxQ1lVh/qokN9I/3/Nfb5kQpA
         BmCUCJZgIHw+fQjIkcOhHif+RsVDRVrPsv3SCHdl4T7VVEP1144CCOw2wjJo45xfCJPE
         cal+NiUN+gsHuTpS9KrN1oPDBFn5W8iRtvpIj7QCdsoh5Fqf/G+Mk46x1UjH7mcxqazO
         Xd9zg8Z5Es/gNj7Nt0+p3TZlrniIA/XVZopS0DkqBFifF9nTmhly8G42K8VPUXE3ld29
         E8eA==
X-Forwarded-Encrypted: i=1; AL+hErEawf+AtDeoqYZZBzWioirDY0wMwBitaedlQ1Hy7A2z3tHVf8/yPaqpiKO8Im12npr421MKxoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ORrBoW4vbvqjzwknEsqfC18Zd2NR1A/nOycerBbLdBYSUkYH6
	NsgawPJCs0uA7o19dvD/qtsDzJnln0I7jN3DThws3F80eqFp0cJnLjvr0+yjNt2LbS0ikhfmC4J
	yek1kVOaW5qCchYVe0JmNyttvxRodxNw=
X-Gm-Gg: AZFdTZfYIr4SbJQkVsKy5dNQaSII4U0wFONsoFaGoi7PWrqb7tW5sNqdFiwzQ6iNjxw
	q+vbIPsQOTSWm8FsyU34DvWUXMGEAoptSxpEiMgVADUQ053uPiEx3O/VeOHFVDQkp0ZuEBNxD8N
	n4u1c1mAimSB+BlIODSzmszCcIK9MtNvGqE8KcCtH0nSx5kCKUuewdfTjyzRAZWKfQWfSG5ZMaI
	RQWBm0BrwL3EYGRN1XO3XZXJDa+eoSYHYr1AVkNqceBALvIatTZ7FgQX8jp+7mSrM0gri8P98T6
	4L1cmrI0W+XRBSlXhSjykSPeuiywp6QIA+VpD3ka8a0HUYFdtRLJDNO1wuDWLaQSjjhrLfoeN8B
	o0PUgmmG2CbuBPJ+ndkyrAy9ye8MSjtGDOgoK2NSvy39P8soJw5ZPmOAegfHGLk9bR+ERJy4O3/
	avmkQ9qYeaZ0RlWD3N0SlceQ==
X-Received: by 2002:ad4:5d61:0:b0:91e:8bb3:82 with SMTP id 6a1803df08f44-92134988818mr432424486d6.4.1795732201165;
 Thu, 26 Nov 2026 14:30:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com> <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com> <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
In-Reply-To: <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Nov 2026 08:29:49 +1000
X-Gm-Features: Aa3M54rvnH00v1NCtGrc73zPMs4ZrSy5Ip3saymlbe4-GLTg5bt7TBC0zEJEFjg
Message-ID: <CAPM=9txheaE3=fp7=n4fYh-xshxOm+Tv=eQn9wvHVAc-b1JKDQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Dongwon Kim <dongwon.kim@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, treding@nvidia.com, jhubbard@nvidia.com, 
	chaitanyak@nvidia.com, Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 03:26, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/24/26 07:23, Alistair Popple wrote:
> > On 2026-11-24 at 05:37 +1100, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote...
> >> On 11/23/26 17:57, Jason Gunthorpe wrote:
> >>> On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian K=C3=B6nig wrote:
> >>>> On 11/20/26 06:55, Alistair Popple wrote:
> >>>>> From: Jason Gunthorpe <jgg@nvidia.com>
> >>>>>
> >>>>> The SGT (Scatter Gather Table) DMA mapping type represents the exis=
ting
> >>>>> sg_table/scatterlist based DMA mapping. For now it continues to use=
 a
> >>>>> sg_table for map/unmap, but this will allow a future patch series t=
o
> >>>>> convert to using a different data structure for importers without h=
aving
> >>>>> to convert all at once.
> >>>>
> >>>> I strongly think we shouldn't have an SGT mapping type in the new DM=
A-buf mapping API.
> >>>>
> >>>> Instead we should have something like either an array or an xarray
> >>>> of DMA addresses.
> >>>
> >>> My plan was always to get there, but I don't think it is reasonable t=
o
> >>> start there? There are too many places all over the place that are
> >>> just hardwired to do SGT right now.
> >
> > Right. There are around 70 drivers upstream that make use of the sg_tab=
le handed
> > down via a dma-buf import, so I don't think it's tractable to convert t=
hem all
> > in one go. So obviously we will need some way of phasing this in to giv=
e time
> > for each driver change to be implemented, reviewed, etc.
>
> My suggestion is not to convert all drivers in one go, but rather to come=
 up with some sane representation of the DMA addresses instead of using an =
SGT in the new interface.
>
> > Obviously some of those will share a common structure/helper and conver=
sions
> > will be similar, so that is an over-estimate. But based on an initial p=
oke
> > around there are plenty of drivers that bake the sg_table more deeply i=
nto their
> > data structures.
> >
> >>> Part of the design of this series was to allow the conversion away
> >>> from SGT to be done incrementally without breaking compatibility.
> >>
> >> Do you know the joke from the hitchhikers guide to the galaxy where th=
e dolphins are happy for exactly the same reasons?
> >>
> >> I'm pushing against this plan for exactly the same reason because I th=
ink it will make the conversation away from SGT even more problematic than =
it already is.
> >>
> >>> So it is effectively this:
> >>>
> >>>> The framework should then either connect the SGT directly if both
> >>>> importer and export are using the "classic" interface
> >>
> >> Yeah but that should not be a separate mapping type, it's rather that =
we just convert back and forth from DMA addresses to SGT for compatibility =
reasons.
> >
> > Right, I think this is actually fairly close to my plan, which is to pr=
ovide a type
> > for each address class an exporter can produce - either a CPU physical =
address
> > or some device context + P2P/MMIO address but in future could be some o=
ther
> > interconnect type.
> >
> > The core then negotiates compatible types and adds converters between t=
hem,
>
> I have strong objections to that plan and would potentially NAK it.
>
> DMA-buf should *NEVER* accept CPU physical addresses nor provide conversi=
on between different address types.
>
> Keep in mind that DMA-buf is solely a container for DMA addresses, nothin=
g else and it should not provide any mapping functionality whatsoever.

Is that because it's called dma-buf, if we just called it's shared-buf
would that alleviate things? I just feel like there are use-cases
where it containing CPU physical addresses might be what is optimal
for a certain scenario, and re-creating a whole parallel
infrastructure that ends up being 'I-can't-believe-it's-not-dma-buf'
would end up being bad.

If we need to shared object backings and have clearly typed and
negotiated on what the backing contains then we should allow it.
However I mostly agree on the mapping thing, I'd want drivers to
negotiate and natively support whatever backings they can rather than
having an intermediate trying to handle the conversions Not saying the
code doing the conversions can't be a helper, bit it shouldn't ever be
autoamtic or outside driver control.

Dave.
