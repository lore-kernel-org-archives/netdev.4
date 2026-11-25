Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617924;
	b=iaBTu0HcrekYlPFFSTJnb2pVDivFxFS3+ymmy0H9OFkxABPrL2TlhgAegQxqS3I475eM
	 t4FV7QxHba2lEhtepaGjdYdGCdd2LNvAe7sJ9G1PowZ1x177QNlci/NOH93G0M8VNPmg8
	 VCua4G+0414ikKcErwTZF/NBEzjMCHHIL86IUPKKKzImUbU6XrVCvyAWQuPe/ksRbpQ/G
	 yw70G7MnNwx87Ndkg6fSshfK1mBjuXN8MzS7tyY1+k78J2EGzhPLoUKkVi7D5X27hBMHT
	 A189F6Wj3R1tyfYXrPMsTcodUc+IMF4lK3rURlzrNTBuhalymZVi/BJU/sDV1Buel+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GQIqrvkEuCQaYgl8JZYA17fRuuRBiz0DeFEwMWUBlxE=;
	b=1JI0UEOfrelVm4LWqfmXs8p0VmbYFnGy8tRgSwkWaCzjeWfV2HedB6E8D4dGmxpohwqS
	 UlK79xbXpFTUiR+AmzXdvQufsmzmAx4Uyv9d+8iHBywcO+Lg3G8jmEe1zSKSsxCcqyFJX
	 jQ757RDb0y7RLQ94zuubzVRottapMRHMAhD4LjpbGdlP/Z9FkhbF3rzm2x1jKqwREmVtr
	 L02qmUee7bg39eN6ECL4yywY6I1HqmdvbackRop80FguMH/+lO38KfB4l5oCBVNQ+RPx9
	 sWyvgXNoxj8epQW/npne5CB14IJjDEsA8xu3R1DlPANseratn/Y9TX2QgYgMVayCSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GfHorJdx;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C058606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C058606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=GfHorJdx
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-94961d90b79so612599885a.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617922; x=1796222722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQIqrvkEuCQaYgl8JZYA17fRuuRBiz0DeFEwMWUBlxE=;
        b=GfHorJdxm/Tm/nk4NUjeAJQJeMDopYjbHRxpuzqoYvpqO3p4antAF9Co8gVV9g2PyA
         D+jEJvpcvNWs8JcznIBLvvI6KVXvooCwh1nHS41khHRAT+PPGeO/UsbuQiLLN4qglPfq
         QLJh+SV2O/J9aX4fleNQ/yXAxWIU21F5ryaFCt1ewGBY0rJxTkRvmr7Y+D9KNsR348Ke
         4VMocHdeZqjkQzWEJoUCRhhNC7TEWSHXg7Jn2gULsuOvbM9z5sgLSwQqCPcsSb188vFb
         Od3OsLXLJv9gyijuBwth+ELtyRHOI5qlbVseSdKjv8ldSPwWObeNyteRxVKytQu0/Zov
         u9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617922; x=1796222722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQIqrvkEuCQaYgl8JZYA17fRuuRBiz0DeFEwMWUBlxE=;
        b=nyQR7s/9JbTT3Wb/2lSzJIgXFdNhd6DeSOdO+cI6+tFOY3vsX4K3sEL9b3uVtwC+PP
         x9OSqNIMC8j2oV4tktFY5pLXs5N/VNIiZTUc9H+cf+cMh6VWjSB8Bzv+PYtLW8bNpuK6
         RPUQdVlNPx420aiFDrMiZt+TTBV4zpw+Cz/0OXrWWfxI1QmlrBy+Vbvf+Y9goPQ06I6H
         RT2/fM/rPCDB3NgvHc5YPKMyr0tBkZ/VKU5259K1/WUTsdLnNDCHkuzrtJ4vzf13MUbX
         TGmFdSgmXRk6+FSzP5sOUvSN4HwdyHXKTUOplhAaaqdVfIzZe2T9LeM97N1818Z6s4kG
         n4Jw==
X-Forwarded-Encrypted: i=1; AL+hErHZ1tn2OaoQZd5zdEACRvmpZn8Yg45icGRh3ZpvgTjSXVD4cmdyiVop2QExv1PSpH9qlU0+i5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z97hpbGI6SUJ9UH6yYKtVF2irhA2w/caIbLq4dsflmya8vmfxlL
	Ng1Fp2SMSwnvAktVeqM+rmnQocK/emFwHDcmceIyk/vQEi1pat59PiCl+y7tyO9cnLw=
X-Gm-Gg: AZFdTZe+VOHk8ss6jkZRSyCCZdLLQ/kcZpQcuKo0eeE4rm6M2VA9rj2ieKeQOLkqB43
	GcXM322UVwdrvuBwPNCfEerxu5BjA+UExDvSsZW+ANU1K5tN57/ooZniPR4ts9zQOPXgaqEK4ZG
	OmET2KQKcsTAk4JE+FbjhUPhwN07Xb4I32WxDKZGz3jbLxbpDDfZq0TtKgO0J4YhHXuPMDGZHAL
	OouRhkZm8PkJBJs5NGZ4bEwKe+eSpV6xKifKuoonr2gG4dl2T4H+fhAn7bIejZieNCe9FAeMGWA
	Hp829ofD4gAp5/USWeOfyepw5b37SJB7StufiNPDUwBc8C8KBc23tNvXEhuZ7dtMz1dvKhn6fLK
	2HBj449eRD/czdTkvtcg4tDVLlcv9auyWx/W/95BNFsC7A6ED68i2cW+YGLZUoDIbXFj2sp5rFm
	DzxYcEaGFEhnyFWwDkmFDJiDLXRp6AC+0tm2B9msw/Ju5jezE32F/ydzM8lklFN87E4LtQaptPK
	/4vaHcniCRUESGNYPpo1SNshXoEBZUaszc0D278jNeIAtAoa2Kgz4gZxkYX7e0rIx3yyfusjM12
	EaQMlQ==
X-Received: by 2002:a05:620a:6487:b0:949:9a8c:7052 with SMTP id af79cd13be357-949bab1577cmr2699750285a.70.1795617922348;
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm1327544785a.16.2026.11.25.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEFN-00000001mSD-154e;
	Wed, 25 Nov 2026 10:45:21 -0400
Date: Wed, 25 Nov 2026 10:45:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	dtatulea@nvidia.com, moshe@nvidia.com, maorg@nvidia.com
Subject: Re: [PATCH V2 rdma-next 21/21] RDMA/core: Report and enforce
 adversarial mode via GET_CONTEXT
Message-ID: <20261125144521.GI246011@ziepe.ca>
References: <20261117170914.27410-22-yishaih@nvidia.com>
 <20261122073156.GA12665@unreal>
 <761ca80e-a772-41f3-b8e9-cc332e4ba5d9@nvidia.com>
 <20261124125327.GR14811@unreal>
 <20261124125950.GC9566@ziepe.ca>
 <20261124133353.GT14811@unreal>
 <20261124134751.GJ9566@ziepe.ca>
 <20261124140906.GU14811@unreal>
 <20261124143024.GO9566@ziepe.ca>
 <20261125090309.GY14811@unreal>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125090309.GY14811@unreal>

On Wed, Nov 25, 2026 at 11:03:09AM +0200, Leon Romanovsky wrote:
> > What do you mean? This is a mechanism to help the user manage software
> > versions by not accepting incompatible rdma-cores.
> 
> Please take a look at the patch.
> User space provides that new adversarial flag.
> 
> +	ret = uverbs_get_flags32(&ctx_flags, attrs, UVERBS_ATTR_GET_CONTEXT_FLAGS,
> +				 UVERBS_ATTR_GET_CONTEXT_FLAG_ADVERSARIAL_SUPPORTED);
> +	if (ret)
> +		return ret;
> +
> +	if (ib_dev->adversarial_mode &&
> +	    !(ctx_flags & UVERBS_ATTR_GET_CONTEXT_FLAG_ADVERSARIAL_SUPPORTED))
> +		return -EPERM;
> 
> ...
> +	UVERBS_ATTR_FLAGS_IN(UVERBS_ATTR_GET_CONTEXT_FLAGS, u32,
> +			     UA_OPTIONAL),

What's the issue? If the user space doesn't ACK it has the new
software then it doesn't create the context?

This is how we do every feature that needs rdma-core support, though
more often there is a fallback in the kernel.

> The kernel does not care whether rdma-core is up to date. It works either
> way, so why should we prohibit older userspace on these systems?

What do you mean?

 +	if (ib_dev->adversarial_mode &&
 +	    !(ctx_flags & UVERBS_ATTR_GET_CONTEXT_FLAG_ADVERSARIAL_SUPPORTED))
 +		return -EPERM;

That is not "works either way" that is requiring new software. Which
is exactly what I want to see here.
 
> > It is not a security mechanism to hard guarantee that rdma-core has no
> > bugs.
> 
> It is you who talked about "... security downgrade ...".

Yes, in that I want people using normal software to have a safer more
secure experience. Meaning you need supporting rdma-core if the kernel
is in adversarial mode, because otherwise you don't get the right
security outcome.

You took it to some absurd scenario of a user hacking their rdma-core
to defeat the check, which is not the point at all.
 
Jason
