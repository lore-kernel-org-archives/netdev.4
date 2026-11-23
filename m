Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449726;
	b=acD7tHKlUVnDnSuyA1P+d3sSZY/HTLvkvY0fIddO6AqE3t2YvRwt92PneQG5EdB5MSnd
	 3t9FCwma4ahyjYI/aBQeY+HgS+NcBM73FrWQC7KYYbTUoPmcGgOxAHtqyOaFmQU+vGn2m
	 Kk+XE1tJjrS1hlGY9Cb90IbDZw1ml1vLwle5i8e3u0Vl7oVT4oSY4+0AHdtRGkKfuoi5u
	 c3dj8ojnV01x/FpqPlbjmpNXfm+IgdLaRQbOENiRGSTUh9JQ1cb4xyOdutWmt+KhcGnAc
	 +qqjyChPFQH4N9R4K9PJXZd8BN+d02muZb+rG2yVSruL3R4XBE4PrU+zgH9KhcMRIkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
	b=pW/0uths5AYHl2fm+OTTNgDODRoppU1LbrXQ+CeVvVON4bHK1WrANr5zujZ1/pZv7z0V
	 5BsU7pjPlFu8qXvv7FJPNeISTrBK10fzLhFKIOK0cD5J9zXRpXBGpmSID/7EsZQl9ERZ9
	 SgYnr0Y9jIROtZr01DqSvs5MiJH63F+Pi7kS8cKClj23aQ8FK6mt+Cjz0Bqo//5pb48u8
	 gPhy6hOiU9MFnWzRaLDMD2ik7MqWaq0pAZD58Pt0TL3pGVWOeUCws1ZPrWrrjY92BWyxG
	 EDRKeLdSfePcwHeFhXgwHSOlgH+PKpXTKaJmxh6DKg1+FwDnnQXKgOFAJi9vrHDfVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+cjp4zF;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DF606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+cjp4zF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so7193520eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449724; x=1796054524; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
        b=O+cjp4zFNfTyCftHhvEp8PgWz1Jgmqpc5yNNuU8tbUrYtLdoOXED2bRmT1GTkRwnD8
         CvfeOGTKygbgpKiJq8twMQ/8XNUa/h2YB3OpFbws53r7LYPZlpDH2z8k9vpC0fY21D+3
         XVjDWyaqSDOoFKrIWIxgloMgtYZygeUPdvHa//X6mE54uKyUPzsD0iAsEA3fTHawFntN
         l8AbPo7XDX1cPrz05q8yN1rFQlZ0kspCgwb7KnggEg/WyA/E+OBNVziWKeqYcxptFC6a
         FNEXfUsPrLE3HJ6cIhtarPkELi0yB1m+2U3c+wIoWEvql3lOtfLFk7zxMpFegMsTD/sG
         BNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449724; x=1796054524;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
        b=s6NK2sQpVltkzMewy8gQvfvuY4VUgpvuqRFM+1NMUidumfhSVwKpxN7y17qMz6PXg+
         FWYpWx/R9CWP3AcwRBjJwtzZhbtowRHT6K62wR4NG/P/LUJEhujAHIBbGXhtrsgCpncF
         u/XkA8iZWSjgWWueLT/S86lwGqSOrYzwPxgGUNAI5G/711AazscZA57eJCVpK7FyRAkE
         W3xbVc+SzhH+U8imv2A3aK9aD/xKUFLjzKfY6ApMBAt0Iyag5BI2dlnPUiIyEMJWKutK
         jrI+0UCNYEdUoi7QBo0qtNUH39ZuGvqK8ydYwXNCz7H2Ne5Yn7ONcyAjiA0IGadDUi14
         Py/g==
X-Forwarded-Encrypted: i=1; AL+hErEQSJFzZTLyHiGCUnGBM+zwlnKZt0b1dy+B9v67rwlHT/cIb+3LqN8nZayg2JOBHwVil0+10/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z92cr07b5GfADnZNyNvVkjio+fLK/ksUaLyjVo2N2MEBrLijyLN
	GESL+M1WUequgfSNQdIeR8F0eVHOrOQ0E1rAJvyoryBjnDuFabWtfd00
X-Gm-Gg: AZFdTZftkicXA0KkAPVdV+c1UfYmsUCGcUT4CuRQ6qNy80WsxsMGWWYa0Etjp0vVjRO
	QZ7fBjgFyEBxNwcw/Gf2QhdEl1AD1np4rJ6v951P0iPayst1ERg9DhZO9nVSIP2tOq1Bm9BeETN
	aifxNnYQg0bpoj1ugphX/ug3Hjz7ylFyl1ybgWDKK3Pb6u251CJUMdeVjekYi0sunH9ftC94ejf
	QrQCcJl/CVwjiKlahA0cfxAops88tyy0ZwwuhOcYPf449SJAqQf+7yeLAlFz5Y+0yy1C9zlWr/6
	eE366i1T5kPlvKHGCBGak9JKw0gGgHNJICkgH7Or0TI/BbtU/o+leC5Cqs6ukMBfJWna45tVJbM
	sxPJeJOACix/9czL/XSboY7tkKcAQVfqAOKjgtO5bJCryEBSEeNw6uPk8O+hXEG5bBHg8XgPARE
	XwZDj3nX89doYdy4w+kmXHcdCf6GzYpRQtPuzpE+69dGVOSAhjfOY4z7FUdx+rGVrt4U77RxHxU
	deTWg4Bx28YixDoEwsgEfpm6obFnu5oGTP31A/6biBvAkvhtD9onjg3YHKH0ldKhFSHvwvXnKYi
	yIlL97tKLzfm2KHF8WrKffspu6nglc/JhMUKiA==
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr9286882eec.35.1795449723987;
        Mon, 23 Nov 2026 08:02:03 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:b134:e578:f288:cb38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38961399eec.28.2026.11.23.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:02:03 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
From: mdshahid03@gmail.com
To: Paolo Abeni <pabeni@redhat.com>
Cc: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
Date: Mon, 23 Nov 2026 21:31:39 +0530
Message-Id: <179544969959.175192.4403952228876691788.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Paolo.

I think,I may have misunderstood this part from NET documentation guidelines:

"The commit message must disclose whether reproducing the issue required 
modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing 
a loadable module to issue the right sequence of calls)**]] or using error injection."

I interpreted this as allowing a out-of-tree test module to produce
an issue,provided that it uses legitimate kernel APIs.

1.am i intrepretting incorrectly ?

2.This is general question ,i mean ,we can litrally crash the kernel 
just with loadable module ? How do we distinguish a legitimate kernel 
bug exposed through a test module from a crash caused by an artificial 
or unsupported sequence of operations? is this not vulnerablity in a 
way or design issue ?

3.Don't you see a gap in documentation w.r.t testing with loadable module
in details.

I am asking because, like to understand the correct approach and apply 
it to my future kernel contributions.

Have a nice day !!!

Thanks
Shahid.

On 2026-11-23 11:56 +0100, Paolo Abeni wrote:
> On 11/21/26 12:10, mdshahid03@gmail.com wrote:
> > I tested this issue on both original and patched kernels in qemu.
> > 
> > First, I used a test module to unregister all PF_UNSPEC handlers.
> 
> Just in case the are any doubts on the poic: if you need a custom
> OoO kernel module to trigger a 'bug', it's not a bug.
> 
> /P
> 
> 
> 


