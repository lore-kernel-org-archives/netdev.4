Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607536;
	b=no4R4cdaWPTot77g5fzGLSqkUbDXzY1Gbns+dIgk3RBz9Ead79sK+SV+o/r/rupHvFgw
	 r6pxVHYsbc7VCH1jaCm/bZQYNMikRip4/AEjKgx3pSgVDJK2s6zfL+kd/NvIpo0zlwZCa
	 +0ZEckRgyqG84BLAESzFfNZdx4GbicU/a7NHe78yE1iKuuPLZoIO36YzehvG/okqssSNV
	 r/ourYZi3Y2oLb6CTk/XW0nB5ab/LX73lnQXApDh32uJ23cp7nmhceAHIHUbPi2ihty/V
	 dgzDIVNhthhAnh8zdCKOlMCeLnPHcvQC4MBaWska7gkTyV1EZpc12YU/neJ6pquxqUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
	b=2ZJ7ALs+GrICpXY/E2rtWvj7J7ZDR026aXKvxGLbhrTroGBGBYsDX7jYTa75hSn2ND5L
	 0DvmuTrg7V+rQmBqnvrPyVoZeSdInleXtELBXgJoC5wHTS42brcE0qS0HiTTFpJJjfHKG
	 jbmtW+uvSMyI4AgfEhBmSM+PLXAl//jV4aaYmWTB8OBhiE0I49J4hILzn7gC2ug2TiRIX
	 virNjlJcs8R8k1d7VZCQztpvK+fe5e22rfFLwS6mlG1fhAtTkmUnMip+FGI+vVDWV+ZlM
	 PHOZKGXWVdGYgwcPZWPYpQmn/jsCDdxUzekBr1B0VWEkMenQVNJpWV5t88tMxkEk66g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1E606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA1E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so6630044a12.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607535; cv=none;
        d=google.com; s=arc-20260327;
        b=Qt+khvqkksU8IuJei2IMDWeQ0Avl4463WqH5hxF09JZg1myRwion/gEx5XHvJBrfaV
         zIGj+auSM+3F2NBtu/AzO9faEgGaBt78o1tix66mIBrBVHJdl1bALtK+cJE10CFcMlI+
         8PQFoy9ez8LRpHZA50UzPKFbV+F1a+ksvdJwdVH5i+ILFswKXPznysEgGXdR19r8zk7B
         FOl7Nozilop50mLIBuzRwU11gEwbtmcuREX6fDbTZYfRzr0gqrRdzSAug0ON2WLUiMur
         zTrvFVkBUJQkU6b3voFXCpbzhJRQLmK7ZXXbU75j31jIkJvtnd9wPaH9hxkhWjrdkCii
         1yHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        fh=JA50z94e8/4T91t97keZHOYF9h5iTJkyv7xUnkEiibU=;
        b=Vj8+Q6UAHPoWmqrjSP2EC9eq2tTNnSXw0ZaTcfwLuLlVdnLStqWcHh7IypPb2RtrIQ
         IEp5UPzZRcKIpPRmcJJ/oSD6CqqrxDet0iw2/nmhqWiVtpqwqNO0NnPNWdwjmRIqQBws
         0Br4LOrCiZdAovVGqo4YZMDAUgTnK74CDaYgHfmrb89zu9NyG3LBjQxa/DuQ6eiEybDu
         RnqVzC+qxL8Z+VKTsNwOpmBZSr2WTVsM1LkVz25CAnQ0f9BCB6aLJyNsRAWtNrutxl/n
         J9NWRvZklWYDuQYeaR4iHcdT3pH6mJgCB8hGdvEXsNAyk8XvXZ2uAfISosj8PKArrCZx
         OMbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607535; x=1796212335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=GqBOILI5YHt+I8rgrwlbLHY5BG3XvSU+r+LHqw3oI7Xy0/F1mDTEwsdyR/Vg4NAa45
         Lm5t/VP+Y3VLJbd4SMm6dsdhwLsOEkLXgBKY7IhDbCRVTJW2z5+dEGbV75/b+OILcqVH
         Htz/jZJaC1jTlUIovL+B41koB1HHMD3on30Sq24mS8XcpKvZn84VEQVDg78rRo3NexCv
         CfUpZ4w1ozN2VEO3DGF34fg0s21O2V/GL4YDulN54roVhEA0MtAJ5Rzer/ir/Fv35qKe
         X1ChbSIIuM5mpCM9ks6E4geN5r0vm3yNI4K7txZiLyzSdnRqWF00BxvnRVlU7gqrA66V
         x4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607535; x=1796212335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=OaIysWL9ehBLazDgdQ8eYgUTVsG3H5kPkN/G7eXbVwbpwlDhZYbPAM3HajKMFVqI58
         0M1gbMC3OC03b4zVHzsTpVxMp6QdsB+jcS/pyRDBHFYpl+/jGNQ07eM1fzxNRMTZgdp1
         Sxng1mmSVpJ/YYBRFIEUofNlmnLOsCqypaKVyUxqNcvJmbnEHLb3Gp5jtzGqZVOVMTUB
         rEq1IfqZ5TnEeNxk2uieO8nA5EKLFVE5EM/IAW+XIhUNdP//Mf+QLr4vPZrZetg2Dzo/
         9F/BNZ6dzpOb7sJts2HFEtjRMyAHgWFglTPXSZy599LhIhhoaIPllU/FMECpgXk8ODwl
         Ehug==
X-Forwarded-Encrypted: i=1; AL+hErHJT7nAGTuF76T73PwzVhMfiaOcKz1xSFvwBy0BAEHNHMiUORHCGYmFtVViDNp3BNqONml6Ofs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+POHWH3ugQq0rn2N6NUDNzB2FtBbNE6SHIq/xeiEcoy1197UTI
	q5hzcFmzXu83mXR+zwNvNfcE1H/G+WBq3um/elmkfNSf9o208bozuol3KYTPd0+VHgaiUOyH+E1
	wJB2S4e0r9QT3X5x3cOQE+OcxN9yuPwBODKwGeUE=
X-Gm-Gg: AZFdTZc7pRmvExXMAT0CXgmDp/4s5IfA9MZXDK6hDlU7HX7XVnOUuKJL6FVyMOqTbdC
	RNZX+bsYMlhy1IhLyPVUdfQSOWwR9KRn+UZhWtvtiPv496ERiok0KaAuFp7RqmPcflfbqfqV+6G
	KxjmoHx9NuNoisIBgFe4RQ73+wsHhhXfEcs46d3isi8vOMcyZq3/+pQot3YJqf+/IOqdQSiHvOy
	3Calpi8X8QI3PZEdmqpwGKb3UMNLvjwflfwi781Ho6mD06it5xILwHQcoCDgVWP7XWSGkwSq8B9
	VXnVFwGFCEAYpnyn/iy9AwR2NNbU0a4XcmM3KK7VsxCLmtncwu9EYiZgR0fyIOu0mdNLCtLw1MO
	T9gh2coivbRaV+tP5JBFcBv8w0AIICPR7rQIA1siCOGLLAFd3iWEc9zoSGJLluC071J35uA==
X-Received: by 2002:a05:6402:a592:10b0:6b8:8706:8e91 with SMTP id
 4fb4d7f45d1cf-6ba37d6526dmr10123892a12.12.1795607534606; Wed, 25 Nov 2026
 03:52:14 -0800 (PST)
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
 <awVzJMLVw4wUSqky@monoceros> <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com> <awa6Owm3eDW3EitJ@monoceros>
In-Reply-To: <awa6Owm3eDW3EitJ@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 12:52:02 +0100
X-Gm-Features: Aa3M54p8sDF24v9l5vsIDk_y4hlZnLV9zBkxaSf0Tu8Y_d4WDzlfpPV0l4Su2os
Message-ID: <CA+=Fv5RttOgZp9vftYN2XfmV31TyC_o_eSejruM_bbf6v7zfBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev, 
	joro@8bytes.org, will@kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe, Marek, Jakub,

On Wed, Nov 25, 2026 at 11:53=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> > Hi Magnus,
> >
> > On 25.11.2026 00:22, Magnus Lindholm wrote:
> > > Thanks for catching this and identifying the interacting commits.
> > >
> > > I reproduced the error on next-20261123. In
> > > arch/alpha/kernel/pci_iommu.c, I changed:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp=
);
> > >
> > > to:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL :
> > > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> > >
> > > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > > with CMA enabled also passed, as did an object build with CMA disable=
d.
> > > The full allmodconfig build hit an unrelated cgroup sample error
> > > involving PATH_MAX and LINE_MAX.
> > >
> > > I'd prefer to keep the Alpha tree independent of the DMA series.
>
> That's up to you, but in my eyes merging in the immutable branch
> provided by Jakub into your tree (or rebasing on top of it as suggested
> by Marek) is really the easiest option. That way you don't have to wait
> for the change to hit Linus' tree and there is no further need for
> coordination or others paying attention to not create non-bisectable
> commit graphs.
>
> However looking at the immutable branch I see it contains both the dma
> API change and then separately various adaptions to ethernet drivers.
> IMHO the immutable branch should only contain the API changes (that is
> the commits up to 31f7e12d621b) to reduce the amount of possible
> conflict.

Thanks, that makes sense. I guess best is for me  to rebase the Alpha chang=
es
onto the shared DMA API changes and update the caller in my CMA commit.

As you point out, using only the four API commits through 31f7e12d621b
would avoid bringing the Ethernet driver conversions into the Alpha tree.

Jakub, Marek, would that commit be a suitable immutable base for this?
A separate stable tag at that point would be helpful.

I'll then rebase, retest, and notify Mark before updating for-next.

Thanks,
Magnus

>
> Best regards
> Uwe
