Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519981;
	b=WmIgeBNkpOvXGKNxKzzCNOANYFnUIRKddU3GPQjD74+Q8YWva44uxY6kwjubM1s1a7t6
	 EeFFRmXV/sI3dRY+PPt8Pyn5gQ97uW/5TPMu+EqA6yPydnHQ7b73OFTo5qmpYXhPJmo+g
	 as0x/0aiadUFJRkHnbBuSo8Np4FXA2mL36m5ObYgE7oIH55oFSqiCpzC24E6Gwu2ZRWZ/
	 2VzsC9Onc08cvihcRmZx+N28hzAedx9+XrIaYeWE7RcNiblkYknOvUdJ6DKzeVR+tQZEW
	 /eT5vx95nW6NLiXtWSi6oHSPJqdGL23+soI9ipBtjv9X/0QDGnr1N0XC2NSA8//tpiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
	b=NBjhxtYG3kagfuj9oy51+4L9+cZ6m962CWvgTznV9WyDVXiE9xkkYdaK7JxmcsuEbcnF
	 oBRcSilZPrnoG/Oz7kl4CDUJy0cqSqBg/dHjabbefYsGOpDQayGRf/YrqLSwBd76DB2GI
	 L/BN6ABYNTUzbmvveReF2wmbUPYbLoiiizf8JPFUzJON9X9cwTGyp0VnAAEouEex7ZIEx
	 gDvcwsgNALf8vfx5m37R/eoNnPcOETqxTyWDqOWKANfkRVCGX+ffy2BKdzWjGxe/EwRGY
	 X/saQkweGtPVS9mOh6J1JQmsz9e/zpY7Lrt4S5KB2bG4mZd9Ch5rnQouCmGxQtq3MAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WLScM0wC;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D392606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D392606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WLScM0wC
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49a92144733so2102813f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795519978; x=1796124778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
        b=WLScM0wCE8n9bNC8leElzo3pEq/ZLH6iPvqMGmOwKm9O08hQt/HJ9t/dvdyrs2DAF8
         holVOYZ4x1H/YWixsMjoiqqly926eZqs0KhAfZaiDI0yeew12uAe7354UmW4eneA/Zg8
         HTJbj5M1/msNpPZzGuLt24k30RgklKoe3xTZXIQoDQHJp2peaXS/6ogsqfd7Rk1XJqSH
         KL0h/6ZvUqJtdxlbQlGs3lwj0PIETp8OP0WPZ9U1AvrNhswvxRurpoy8+m6MZWkf4mWp
         8oXaCztL0QuP6BiNfKJak2pmy2UEwuebqfCkqDj7/LJXrLJEXjfsMFnibmRezcuj2V3P
         IGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519978; x=1796124778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
        b=nonfucPOpQPjQUo1y2Bc9oHGDPWkeOiJabbYTN05v5bgwzFPqW1ZRuJCABj64VBXqV
         9byu28EXsZfVtcSCp1zoHvp43HWJCtUG8Zho+N5UHjnDwWMXQoqL77w6CTUnjSmPUpPp
         k2LVO20CsLgsbYNOOUITlvqzLlXmNomKy7BdRCt0ZsgXQHU2Y0kU+m4YVpcoo+jqPgAg
         2s2ysGa6uqVI+inK2No2WUkcYa8K3LOEEoju2FfptCt6fNl2H1GSOEYO+GFfdF4lHk8L
         6ssJW28rp9LUS7A8LPY8qNyA4OlbIu7UbdMSQaAntRFamCqeQLgYz5Q4Dr7/3QPO2S6E
         y3eQ==
X-Forwarded-Encrypted: i=1; AL+hErEFx9gloaoP98fnXHJ6bLl3MsREkM36GP45+w/Reg6l0UZG6SxgyTtpz1nRZpt6ZpizicJ1vz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yGckUduWUCfJc8pMGevS8lpG53ybStY87e38KQ3kxsCLQi8+o
	MxIJT489YkMm0dGGlhYKNuBlCaclRpC9CP4EyMDZs73BZWQbPRmjDGfICNuL1U9YU9U=
X-Gm-Gg: AZFdTZeuGUssE87M01dZS7FTUb3IFxRWyrhGuUvOBYc/3QBKDpWcu6rq3U+6q2XpVXX
	Bp6vMGmOBvfPWbni8JM4vgeAraw629IFqoU7Uld3FGhXjYMXfUMshhP6ZNV1ft8H7nekLvPWp9s
	Ju+sZMl5RScR7K7fwG1R4xk+xKCSzmUFJ0GbOsiFR6Z/XE/TT8kx3pnjwlAsrPeEuyo2yIh6jlG
	w0YYXpyqZosQMC/eg8Cj6iaeR0ZY9SXA7ysanuEqWqGi2Yepv2HQyJW+xPutyi7tIGVqZXNZxB5
	orAi9882nwbKS01T4/VaCkYZdxhSn/HcH2BGjNTzfo5uU2zQdCgptAn6eQT5oToMPwt2QSN5Rkz
	kjuWkIIedPioJJ7GiUr67oeT5obAUI+0aLxcLn+xGDvyyN7ROBcRK+xk/AvRDg993jGWy/aAdXp
	rAhUM3ncHu07ZU4ueFuF5SSrjHzzKPNUMIpql+a8lyzzaYxvcYDtnutOulua+MME++XywvmXS2c
	TS9sFa82iAakU/Oo6YkgsQGJG84s/O0DwqpM/LYwYgzqXmRRkwBGapzrO5zmb8Wrl1Whx/Wqqrq
	D3X1RdI18C4VN2F6aFnl/oj+0C8U9LqnCwIsCu1fnHgrBDy5Ifm58bC+Z8t02VFx9Sw3Z6734+w
	MdwHQaihUW3GaVYxK
X-Received: by 2002:a05:6000:40da:b0:4b7:83a0:6c06 with SMTP id ffacd0b85a97d-4b783a06c89mr2288961f8f.15.1795519978076;
        Tue, 24 Nov 2026 03:32:58 -0800 (PST)
Received: from localhost (p200300f65f19a9047f1ca7b446868308.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7f1c:a7b4:4686:8308])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67f1b2sm25503606f8f.25.2026.11.24.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:32:57 -0800 (PST)
Date: Tue, 24 Nov 2026 12:32:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-next@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org, 
	will@kernel.org
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
Message-ID: <awVzJMLVw4wUSqky@monoceros>
References: <20261115103809.1288167-1-linmag7@gmail.com>
 <20261115103809.1288167-3-linmag7@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zz6vlopso3otapss"
Content-Disposition: inline
In-Reply-To: <20261115103809.1288167-3-linmag7@gmail.com>


--zz6vlopso3otapss
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
MIME-Version: 1.0

Hello,

On Sun, Nov 15, 2026 at 11:37:43AM +0100, Magnus Lindholm wrote:
> Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
> machine has initialized its DMA windows. Prefer top-down placement
> below the direct-map and usable RAM limits. Skip the default reservation
> when no direct-map window exists. Explicit cma=3D ranges retain their
> generic override semantics; top-down placement is a preference, not a
> hard lower bound excluding the first 16 MiB.
>=20
> Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> falling back to alloc_pages_exact(). Pair both paths with
> dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
> Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
> return the same unsuitable CMA pages. Retain zeroing for CMA memory.
>=20
> Round the size up to a page boundary in both allocation and free. CMA
> allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwise
> allocate too few pages and overrun the allocation during zeroing. Keep
> the mapping and unmapping lengths consistent with the aligned size.
>=20
> With CONFIG_DMA_CMA=3Dy, the default CMA_SIZE_MBYTES setting reserves
> 16 MiB without a cma=3D argument. cma=3D0 disables the default area.
>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  .../io/dma-contiguous/arch-support.txt        |  2 +-
>  arch/alpha/Kconfig                            |  1 +
>  arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
>  arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
>  4 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/=
Documentation/features/io/dma-contiguous/arch-support.txt
> index 3c6ce35d704f..6cd205a991f6 100644
> --- a/Documentation/features/io/dma-contiguous/arch-support.txt
> +++ b/Documentation/features/io/dma-contiguous/arch-support.txt
> @@ -6,7 +6,7 @@
>      -----------------------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 6ccb2d230326..cddc1f3af209 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -30,6 +30,7 @@ config ALPHA
>  	select HAVE_ARCH_COMPILER_H
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_DEBUG_KMEMLEAK
> +	select HAVE_DMA_CONTIGUOUS
>  	select HAVE_GUP_FAST
>  	select HAVE_KERNEL_BZIP2
>  	select HAVE_KERNEL_GZIP
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> index 955b6ca61627..19aa5c05de2b 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
>  {
>  	struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
>  	void *cpu_addr;
> -	long order =3D get_order(size);
> +	struct page *page;
> =20
> +	size =3D PAGE_ALIGN(size);
>  	gfp &=3D ~GFP_DMA;
> =20
>  try_again:
> -	cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> +	/* A low-memory retry must not return the same unsuitable CMA pages. */
> +	page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
> +	if (page)
> +		cpu_addr =3D page_address(page);
> +	else
> +		cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
>  	if (! cpu_addr) {
> -		printk(KERN_INFO "pci_alloc_consistent: "
> -		       "get_free_pages failed from %ps\n",
> +		pr_info("pci_alloc_consistent: allocation failed from %ps\n",
>  			__builtin_return_address(0));
>  		/* ??? Really atomic allocation?  Otherwise we could play
>  		   with vmalloc and sg if we can't find contiguous memory.  */
> @@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *=
dev, size_t size,
> =20
>  	*dma_addrp =3D pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
>  	if (*dma_addrp =3D=3D DMA_MAPPING_ERROR) {
> -		free_pages((unsigned long)cpu_addr, order);
> +		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);

On next-20261123 I get a build error on an ARCH=3Dalpha allmodconfig build

arch/alpha/kernel/pci_iommu.c: In function =E2=80=98alpha_pci_alloc_coheren=
t=E2=80=99:
arch/alpha/kernel/pci_iommu.c:418:41: error: too few arguments to function =
=E2=80=98dma_alloc_contiguous=E2=80=99; expected 4, have 3
  418 |         page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev,=
 size, gfp);
      |                                         ^~~~~~~~~~~~~~~~~~~~
In file included from arch/alpha/kernel/pci_iommu.c:14:
include/linux/dma-map-ops.h:105:14: note: declared here
  105 | struct page *dma_alloc_contiguous(struct device *dev, size_t size, =
gfp_t gfp,
      |              ^~~~~~~~~~~~~~~~~~~~

which seems to be a conflict between

	next-20261123~159^2 =3D f03df6019b56 ("alpha: enable contiguous memory all=
ocation for coherent DMA")

=66rom
https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-next

and

	next-20261123~104^2~23^2~7 =3D 31f7e12d621b ("dma-contiguous: pass the NUM=
A node to dma_alloc_contiguous()")

=66rom
https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_co=
herent_node

I guess the right thing to do is to pull

	https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_c=
oherent_node

into the alpha tree and fix the offending function call in the merge
commit.

Best regards
Uwe

--zz6vlopso3otapss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFdeMACgkQj4D7WH0S
/k5++gf8Def1hTBgcrh/KoII3KUQugHVpyoXdwJDAayGMHuOUnodDFoEcOG7dRch
ODRC7w2t0rKG/XIYwabEtNnXK6BanW5b3foBoafZTtB+E9v7swJK3Z2TpNYsfIDh
eba7AQFbffHbCTwNlzdCMTEmyqqz0qhL5Mc8YONsN9lq4no+UNOzN9123YxSnsaH
MaVWVYaV/ZLWle1TLI3vUfb+L+fQzX96kFbT6FeX1FGO8Cubq37kGONVgLybBvC+
y5GTwQ0VbUIoYQ74Bt+7Jo7qbU8NSyhEiosy5G7TDUQ05NX1Eikj5eiYv+XvHR2u
zBKgWDi9C98biJIon1f+BFbkWqNA2g==
=1TSm
-----END PGP SIGNATURE-----

--zz6vlopso3otapss--
