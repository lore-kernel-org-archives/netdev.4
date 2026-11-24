Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795562577;
	b=jKaS3foWcxNHW4JN7S503QNstj7cAezrh33Pl61WV/pN5QHJbBaDV/+x9/Fb5GGTQUox
	 NuXLazrVmJgPWeHUiGY65ZPRU796ufDfpDaLi3JHjjtTiriQf0WJbSLIYyfi5dhyLnsbX
	 F+/5KCVDeUEe2KXOSSLZvRDsjwD8bZhKEiH1iFtxSNAqRfBPaFJOjByhWCAY7tQLMa5+9
	 TDgfb8TysFGmiIPNKQNNIrVdtuLjWikbe8XnVnhudI4SJRXLO6nAJrUJFTcS1kaWZUcD8
	 ZVFzUtWmky7ati8JvLUpPfDwqdEQgyjiCCtyVE1MZKV13q5CKLr8xzn88USk9q0xJcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
	b=HYUygNEvCIaqxww9D0LHyk+G2lFapmgBoCBMrMiyB4w3mxDYBzBC/7Y/sNu65OefpU0o
	 OlfSC+FfKe/HJlcdOkLka6hlO6uDJhcVi6jv0LEBXBSbjT3weT01SUhCOBdZDgoGYNlUw
	 Cp5nlRCv6dO9kbNTuFqW2u30lAiT2FeU7VNBqXUG4uQrDzD/tr8D6DLFtozAlBtqLmP4o
	 7mmKKf95hv0W54uicCuVMVSUnAdaMpLxOR2uhesBE2/Ystykb29EMn9seCmQRnnhfEi5W
	 xgjcKWsQPI1aVNGOoBh9ZO3dYCNNDexSGJSrpGa2phFdT17MWgvqQmADHSNlPQ+A95Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFAARA7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B599606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B599606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFAARA7C
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5188e4980fso356393466b.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795562575; cv=none;
        d=google.com; s=arc-20260327;
        b=qRjmSoqQeI+FPGSInd20i7tlagDMdtcG4Qvs5FoZevIQCWe9xvHN6qk5aubAk1vwfm
         Vm3DVsTCVa8HBoybksbVa4NTJZpOyM2FaFGmzVQP5JHjqjp91+qx9LIzUm4d/G8J2PDB
         F3KGhf/6cDluwtTANtQv0HmLySkCFysQa7mlaqjlTjtSo/g3IsNCvlaljQNmYlQJylkx
         Z2vyY/ls85CrHIaPLVqYrcPWH7a0+SufUGebYmaJs09KKG83sxq8GfHCpCSEtJSAeP55
         a0+KFtU7M/NyI+pPr0jeAyhf6FlSo+V0Cc0WGvq/PVIrQApFfcMthzr4ykK2p6XPTSld
         sqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        fh=Os2Xg6mj+lxdfuA5fIe4Ev1fWWXyhWsifK0FAsc4WXY=;
        b=CdPQeSYd5W8TYCpQyMHkEcIXYeWwAN1PmpLYPp+CgeVcgOy+2z2Cwh90bK2WQ/cwEb
         sEnLJoVMuuKtIYcDZS8f/GkwLTNYqzij8eZG6/alFEvh0O7vc136ENXlIULhytrn63Lp
         bLMnoNZnKBJZarLaPXE3IDV+OrCMA3/EOSEqfpe2VVmmC6lb6w8cONwiUVGh3z4UDJRb
         2EdbzodnFkCAQdf7sEaouOi6ipPpKmNn+AcZok3xvh3OvNLyr9qcr73wtLJHMoWBQjSB
         7Pi4QxHPQOjFcf68vhvI3NpxxvcQpaf6/N7PCkWqlmoZGjTLsj9obKUx9aX3gfcYbo89
         ISuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562575; x=1796167375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        b=nFAARA7Cx2gUDYdmhiPWIhOLgw4+aYVBFj22IRVliJa9NgXc24+2Atj7MZeI4+k0EZ
         boFGw1uQQLETqjcnJIgujQnFwKk1V4AIagMh+jeL5S6bm7E/y+3R9UBBomg76spuLv2M
         ubkhf+a/MKeHLj2fJCXvu9TEQbCMOoM/73j2p/Vz5j+DI9LIY6Sro2IBiNm/VzpRsiDi
         GMwyQ+QaZhJXOox8nowxzdDyMmUkkEjbiqMbTEfFQ5WXw7cTkMZlX1k0RAvbW5EZP5J5
         ktnrHLxqmTYx5rn/RBYJXllVmPsrvbtZC5srpF6v4Rzsmfdn4VNLpLeaEGNT4juIOWK+
         atYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562575; x=1796167375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        b=tsY8KQbQ+z3gghB2B8mp5CHshzVLHNG9Ti0HhmdKBkhnmpfycOWKwK8aD99Bn1eSLG
         dBWgND2ktT08AtZmZNxpoGq+KIKA6SSBxdkxPZ+p25w5AfllElFK1pYIM04jHUS0+qDL
         TSC3GkPnIpq0XlskEvqXgdm+E8+wBz4GExW6LM/BzW64P3Ujqg9skgIQq3ZEQNXW8Z/O
         RcKCvqLBGCezj79uKFpUIBYp5HoPjpp+130JRnYwhxbtbTx4R98EZNJu2VHNfzGg5tRU
         dB/RLiSkm9bDs4mplCAe4uVW5iZ+mPKX0XzOnYYr18/LyTFhioLVQ7uubYzXZpaIl2CZ
         qVcw==
X-Forwarded-Encrypted: i=1; AL+hErHMgZtdYn5BsnKF/6UakeGzN6oVK32qQrrshAn1xJqH1XytOuv8jmx9urmJph8qns9bqaU7Soc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1r3LVSIgiwnrGcRn/zX+Lnoncg5mBtIGfefVz7C8k/90jFcas
	vMj0q6vNaGPTbMR2/ISGVgYLb6AFhSF//GSRnJWZkNS2IoVTo0vUPiIkcSuDKDXIRDkMa8DHeQk
	CKIilrzh+Zc/nP/H3ru6wU87OghkGcEA=
X-Gm-Gg: AZFdTZd4T4y+OObtbe8PEEpJ/YHh6BFXkRl58JjUPW2P7wPyA7pO9Erybd9WI7aU7hY
	2xVVKhEie7h6P+we8QSYyfyWeCXKKXU3DV30q15tpaiMfL77e5hF4PWnysCcHrkB+DkePaeeQW8
	dwWkRLSBxlOdAe4JeQUcsL+0ZXvT7vCI0inKiEeabcq/Vr39oc6Kh/v5PCS9aHH6e4uZbiWjjW4
	v2SJrxoaFbEfPUlCxH/SPXoQzNJzYvZMuTK/+DXBljDHBXZPbkl16FHNFxVQPh8HfIh0l2QCWch
	JV+bHig8O6SMZFMPtg8eycEQsLW8yw41RqHEbpBw5u4C3J80ctJEJSMMVBkPuXDVmsc4krM0F6K
	kLSZ+M4cqy66J51BpbdMQ02kzHzxR3aPMcawACZRgrlFOhOxncOhiB+HvJjBFDq97YykpSStizG
	ReDeb2l+4zRqLq9Yn1ZSwwOdk=
X-Received: by 2002:a05:6402:3551:b0:6bb:2049:ca7a with SMTP id
 4fb4d7f45d1cf-6bb2049ce09mr530944a12.30.1795562574801; Tue, 24 Nov 2026
 15:22:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115103809.1288167-1-linmag7@gmail.com> <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros>
In-Reply-To: <awVzJMLVw4wUSqky@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 00:22:43 +0100
X-Gm-Features: Aa3M54p40jvWYlRgIpwdomsHYhgnFpDsLhI0rv_i2dkIsTGssHPloMOWlC-TIyE
Message-ID: <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, Nov 24, 2026 at 12:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sun, Nov 15, 2026 at 11:37:43AM +0100, Magnus Lindholm wrote:
> > Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
> > machine has initialized its DMA windows. Prefer top-down placement
> > below the direct-map and usable RAM limits. Skip the default reservatio=
n
> > when no direct-map window exists. Explicit cma=3D ranges retain their
> > generic override semantics; top-down placement is a preference, not a
> > hard lower bound excluding the first 16 MiB.
> >
> > Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> > falling back to alloc_pages_exact(). Pair both paths with
> > dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
> > Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
> > return the same unsuitable CMA pages. Retain zeroing for CMA memory.
> >
> > Round the size up to a page boundary in both allocation and free. CMA
> > allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwis=
e
> > allocate too few pages and overrun the allocation during zeroing. Keep
> > the mapping and unmapping lengths consistent with the aligned size.
> >
> > With CONFIG_DMA_CMA=3Dy, the default CMA_SIZE_MBYTES setting reserves
> > 16 MiB without a cma=3D argument. cma=3D0 disables the default area.
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> > ---
> >  .../io/dma-contiguous/arch-support.txt        |  2 +-
> >  arch/alpha/Kconfig                            |  1 +
> >  arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
> >  arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
> >  4 files changed, 30 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt =
b/Documentation/features/io/dma-contiguous/arch-support.txt
> > index 3c6ce35d704f..6cd205a991f6 100644
> > --- a/Documentation/features/io/dma-contiguous/arch-support.txt
> > +++ b/Documentation/features/io/dma-contiguous/arch-support.txt
> > @@ -6,7 +6,7 @@
> >      -----------------------
> >      |         arch |status|
> >      -----------------------
> > -    |       alpha: | TODO |
> > +    |       alpha: |  ok  |
> >      |         arc: | TODO |
> >      |         arm: |  ok  |
> >      |       arm64: |  ok  |
> > diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> > index 6ccb2d230326..cddc1f3af209 100644
> > --- a/arch/alpha/Kconfig
> > +++ b/arch/alpha/Kconfig
> > @@ -30,6 +30,7 @@ config ALPHA
> >       select HAVE_ARCH_COMPILER_H
> >       select HAVE_ASM_MODVERSIONS
> >       select HAVE_DEBUG_KMEMLEAK
> > +     select HAVE_DMA_CONTIGUOUS
> >       select HAVE_GUP_FAST
> >       select HAVE_KERNEL_BZIP2
> >       select HAVE_KERNEL_GZIP
> > diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iomm=
u.c
> > index 955b6ca61627..19aa5c05de2b 100644
> > --- a/arch/alpha/kernel/pci_iommu.c
> > +++ b/arch/alpha/kernel/pci_iommu.c
> > @@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct devi=
ce *dev, size_t size,
> >  {
> >       struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
> >       void *cpu_addr;
> > -     long order =3D get_order(size);
> > +     struct page *page;
> >
> > +     size =3D PAGE_ALIGN(size);
> >       gfp &=3D ~GFP_DMA;
> >
> >  try_again:
> > -     cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> > +     /* A low-memory retry must not return the same unsuitable CMA pag=
es. */
> > +     page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size,=
 gfp);
> > +     if (page)
> > +             cpu_addr =3D page_address(page);
> > +     else
> > +             cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
> >       if (! cpu_addr) {
> > -             printk(KERN_INFO "pci_alloc_consistent: "
> > -                    "get_free_pages failed from %ps\n",
> > +             pr_info("pci_alloc_consistent: allocation failed from %ps=
\n",
> >                       __builtin_return_address(0));
> >               /* ??? Really atomic allocation?  Otherwise we could play
> >                  with vmalloc and sg if we can't find contiguous memory=
.  */
> > @@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
> >
> >       *dma_addrp =3D pci_map_single_1(pdev, virt_to_phys(cpu_addr), siz=
e, 0);
> >       if (*dma_addrp =3D=3D DMA_MAPPING_ERROR) {
> > -             free_pages((unsigned long)cpu_addr, order);
> > +             dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
>
> On next-20261123 I get a build error on an ARCH=3Dalpha allmodconfig buil=
d
>
> arch/alpha/kernel/pci_iommu.c: In function =E2=80=98alpha_pci_alloc_coher=
ent=E2=80=99:
> arch/alpha/kernel/pci_iommu.c:418:41: error: too few arguments to functio=
n =E2=80=98dma_alloc_contiguous=E2=80=99; expected 4, have 3
>   418 |         page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(de=
v, size, gfp);
>       |                                         ^~~~~~~~~~~~~~~~~~~~
> In file included from arch/alpha/kernel/pci_iommu.c:14:
> include/linux/dma-map-ops.h:105:14: note: declared here
>   105 | struct page *dma_alloc_contiguous(struct device *dev, size_t size=
, gfp_t gfp,
>       |              ^~~~~~~~~~~~~~~~~~~~
>
> which seems to be a conflict between
>
>         next-20261123~159^2 =3D f03df6019b56 ("alpha: enable contiguous m=
emory allocation for coherent DMA")
>
> from
> https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-ne=
xt
>
> and
>
>         next-20261123~104^2~23^2~7 =3D 31f7e12d621b ("dma-contiguous: pas=
s the NUMA node to dma_alloc_contiguous()")
>
> from
> https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_=
coherent_node
>
> I guess the right thing to do is to pull
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dm=
a_alloc_coherent_node
>
> into the alpha tree and fix the offending function call in the merge
> commit.

Thanks for catching this and identifying the interacting commits.

I reproduced the error on next-20261123. In
arch/alpha/kernel/pci_iommu.c, I changed:

page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);

to:

page =3D (gfp & GFP_DMA) ? NULL :
dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));

This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
with CMA enabled also passed, as did an object build with CMA disabled.
The full allmodconfig build hit an unrelated cgroup sample error
involving PATH_MAX and LINE_MAX.

I'd prefer to keep the Alpha tree independent of the DMA series.
Could we coordinate with Jakub and Marek to carry the adjustment in
linux-next and ensure it reaches Linus when both changes are present?
I'm happy to help with further testing.

If that proves awkward, I can remove the CMA patch from for-next and
defer it to a separate Alpha pull request once the DMA changes have
landed, updating the caller then.

Thanks,
Magnus

>
> Best regards
> Uwe
