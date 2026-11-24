Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530629;
	b=wjg4IHLZ4IMH5rn2qllyuuMHVua75CdcJacAiX5VpWbCn67KIe9J3XurnAeGVNffJQJi
	 Ukr1zRL8Ghw0hSoiQQasq6v55ro3rFA7G6d+RXLxwtPtKtmGPT2d7VsV1r8nzu9+F4Fvd
	 /BWnsoOUMUCh4ZSSSaG1340zYzSJbEh7qC2kg/mSEi75OTGNS9gZ4/iccb7Z4F3FSuKoI
	 Yw8qKNKV5youp9yXZz9fUcPOghWlkQ1X8vMw8FfEKEQKygZoQlSellsL7bAZ/DAZUTNGu
	 Km2n4yXKFlETxUTzfJ9XFqorCphngsFPNA4HVxxdk0DnaOsrlMhyszcBspuCXbOnx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=jVFdSwnS47EFl8UcZbr6GAKJGNG0CDFPn0KaTVMkw9w=;
	b=ZXvf1HQk5gfjlGOWJRrlkgaUjACXjDaKx9K/7Q7GcWsDd/Si7wzwwWdznzsTf2qI65Vk
	 SWZa9hJ0EDUztNeeVKmIj5YBB76wExmczL49kyddVEZwCYb/PcusVQxSMlsFhdqXaJ7Ra
	 gZUAoC3pSNb9wydyvmKOTKAAXWhHnn8r/jzAL47LJ4Mn2wyxF63LoIVYo+KgWfQeDvAdL
	 rA6SsVE09C6keNSb+QWdwx1rHsK8MWPf8hgHsc6TDGrwaSb4dssrx9JK9d08RHFWowofJ
	 K7dJNxxELv7yqFKIUjAmwIe6EQMVY8i5xOZ0tyuwAcMSTW6aRiGsXl8PH+sywzpu5bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=G3Eb1aSi;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C7606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=G3Eb1aSi
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-949589c1495so410417085a.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795530628; x=1796135428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVFdSwnS47EFl8UcZbr6GAKJGNG0CDFPn0KaTVMkw9w=;
        b=G3Eb1aSiZGOuAbMP0/V4MCpuAFp4RHwcDx0YgPHKuJI85WOxFXaykXGDBOrUxp5hxI
         svqhv+lcU5Xn2WoHRkKis0zSWzRWpZP4x+YBKOl+HiJQ3F/jI5rLYL1C1GSQhkZTKoX0
         RuY/B6M/MHr3FyhUjfEAgBPtdaUFmTn72E6OyprhGxlogNACnzUPeRT5V8u2s/vW8R8n
         UqMNNvMgdLU8g7SJ+K5wcVTEDD/apQLocUlnskMmJGi36NBcWcgQGarHoh5qGGb5073f
         ++iqhwwJfUr7XuPmBCdx/47VnFNkSnTPcnpTvjlVH8sR1YSOMhDL+N2nYTqscjMyU9xm
         aT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530628; x=1796135428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jVFdSwnS47EFl8UcZbr6GAKJGNG0CDFPn0KaTVMkw9w=;
        b=cjBeeyuRh0RomQFVUJCexfiVA2peBryVKaWJogxSDwGhQpk0H7+xXMcOqwwYw45NoO
         1+JE4/8Wav06PJRPP5dbCUIOPdM7Za1fOjDre8C0tXFgagZQ2SMkZ1NMzM849Mt7HaWO
         MHc8qqucHFPEa633qro7p+qDuadeBFbIkRepg3wwhX101EmxtLz9M/2G0fGmrkcXhTaB
         gYqa99QwKUlK2ayJCqS3TWxhPDU9a7t1HkcZqlP0j+wFpwhWyQJnCsVj+2G1dxqU3Kie
         wnNma7X/9CDqNPztDmWafwoRAJyrEVg/SMwsN1/hIKCgJUIb8USBa7rPbTwGom12iAF8
         EW0w==
X-Forwarded-Encrypted: i=1; AL+hErFBQyeKK2O4nyLfIIgRr78AsYVTPoqhHMo+50LbC2JlOkIKkPYloplljiqBXDcswIQhLL/nyww=@vger.kernel.org
X-Gm-Message-State: APuU4Z87sHR9EAUyKI3fRu0XHayvYRjbgPI3Cg4omOT+nrB3soM88w4E
	zYWgjIW336U3w/BVLkDpI1djD8R5M+ny3owLD5W81AlLpNu7uzSWZ3+h1qaVw25MDCk=
X-Gm-Gg: AZFdTZfi34cy3t2FPgQRvHBa/VLFewwjHroOC2+4Uo+TTK/vcPdPbhESgmZYJ3YLQk0
	NAtQsKyecF53S76pMvq6V8z2o4Zorn8Cdl+211P5Dlt9vOkQbk3NAdIw+VBnJVIKlSoxi7Wx/Hz
	JVgMyx2lG2FoJx/nM6B490QrlTwbqmVi9GeZQf6q5cPmsZSsSwzekAe+TuHm458mReqUCVFhKXG
	kILW/FmzHps1qa4K0U5caMpWvMLJvs6WzFs8eY2rw3h+TdBILVhxRHATlitQHzQqcbAJ2ORgEI/
	/H2fILC6VpZWreoQHaqjYeR/94/ceJpZe6NK4FPjmdMwtdKFQ2Y2lM+CrPi7+iaMwR7D8q2lWj1
	jeF7oNhBRy3q8YpKhiJh2kc6/yPdrkaqwxE8N5D9CUM5sG3Ql6Hi3X+E/LurP+KaiHb3hSGFg9Y
	ObSDTr0Y6q+j65sex+i9udGs4uVg5PTrdVrlPLzapsyxJdiB80nONRDPuyxaAuy2mz4SjNKmksN
	TNLWSjN/rRVnvPQ1Ccumu2hsO5B8nKzLd2wiEtKraxr1Hf4hl9Xb0uF0OZA9poqm8kMQRSw7Rjl
	bd/5xw==
X-Received: by 2002:a05:620a:bd3:b0:93c:6417:f9c8 with SMTP id af79cd13be357-949ba9b3e00mr2686641385a.29.1795530625685;
        Tue, 24 Nov 2026 06:30:25 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031617sm1047656585a.1.2026.11.24.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:30:25 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVrXM-00000000SA4-25fy;
	Tue, 24 Nov 2026 10:30:24 -0400
Date: Tue, 24 Nov 2026 10:30:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	dtatulea@nvidia.com, moshe@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V2 rdma-next 21/21] RDMA/core: Report and enforce
 adversarial mode via GET_CONTEXT
Message-ID: <20261124143024.GO9566@ziepe.ca>
References: <20261117170914.27410-1-yishaih@nvidia.com>
 <20261117170914.27410-22-yishaih@nvidia.com>
 <20261122073156.GA12665@unreal>
 <761ca80e-a772-41f3-b8e9-cc332e4ba5d9@nvidia.com>
 <20261124125327.GR14811@unreal>
 <20261124125950.GC9566@ziepe.ca>
 <20261124133353.GT14811@unreal>
 <20261124134751.GJ9566@ziepe.ca>
 <20261124140906.GU14811@unreal>
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
In-Reply-To: <20261124140906.GU14811@unreal>

On Tue, Nov 24, 2026 at 04:09:06PM +0200, Leon Romanovsky wrote:
> On Tue, Nov 24, 2026 at 09:47:51AM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 03:33:53PM +0200, Leon Romanovsky wrote:
> > > On Tue, Nov 24, 2026 at 08:59:50AM -0400, Jason Gunthorpe wrote:
> > > > > > RDMA/core: Report and enforce adversarial mode via GET_CONTEXT
> > > > > > 
> > > > > > In adversarial mode the NIC is not trusted. As the kernel protects its
> > > > > > own code from it, user space has to protect its own area, e.g. the data
> > > > > > path that polls CQEs directly from the HW.
> > > > > > 
> > > > > > Hardened user space might use a different data path, with extra checks,
> > > > > > and support a smaller surface. This isn't needed for a trusted NIC, so user
> > > > > > space must know when a device is in adversarial mode.
> > > > > 
> > > > > This information is part of trust level series. Why is this a “must” in RDMA UAPI? 
> > > > 
> > > > Userspace has to work differently if the kernel driver is in the
> > > > adversarial mode, and the kernel should not permit an old non-supporting
> > > > rdma-core from loading to prevent a security downgrade.
> > > 
> > > I understand the first part of the sentence above, but the second part is
> > > unclear. Why should this prevent it? In adversarial mode, the kernel simply
> > > isolates that device from the others.
> > 
> > Userspace needs to do it too or it is not a complete defense.
> > 
> > > Moreover, the kernel cannot determine whether rdma-core has actually been
> > > adapted. A locally cloned version of rdma-core can set the new adversarial
> > > flag without changing the old, legacy version.
> > > 
> > > Once that flag is set, the kernel allows the patched rdma-core to proceed.
> > > Therefore, saying that it “should not permit” this makes no sense.
> > 
> > If someone makes a non-official version of rdma-core that doesn't work
> > securely then I don't care one bit.
> > 
> > I care that the official versions are not improperly mismtached to
> > give something insecure.
> 
> You explain why rdma-core needs to know about adversarial mode, which is
> fine. However, you also say that rdma-core MUST send this new flag back
> to justify the statement, “The kernel should not permit an old,
> non-supporting ...”.
> 
> However, in your last reply, you said that the kernel does not actually care about
> the rdma-core mode.

What do you mean? This is a mechanism to help the user manage software
versions by not accepting incompatible rdma-cores.

It is not a security mechanism to hard guarantee that rdma-core has no
bugs.

Jason
