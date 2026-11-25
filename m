Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593064;
	b=BN3JCgPLxjISfPsInc1/CaX0iuxNQhU6mth2wZem8UyeHe1tHIryazLEEEpuVkmGsVIi
	 3n/2bYeR7+UBkdiAz/dtecou+soZFvvaAs5EGfaAI6wQUV0PrPRRHMN2BKTfKmN1EFPna
	 ql/dQl0QVtZymGxMh/X7+1Z54pKNVGs5z3wXZZ/IpjYmmqchwxmpu3z7uLRsTu8cKNc9p
	 4xjsLU73U6f0TMx4cnf/ZSWH2jCgOL0Xoee2jsNydISO4cSK7wZAf0af2EWRSGPKc81E5
	 5c7VKOfLyWq9fUuq1GqsyAy6746MJF9FalkIqF9qEajzsefGH0Eced/m2fLvR6MnTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
	b=xqk8/uuu3emYex6laeHS1V1kJxmP0sXPSAuPM2pUDVTJlrH+QfnBvOeTE9EXqsx4Sxdt
	 3vqv4/6YC7kWzXlKGfcl2bJtgde/oaWQe2+faBCRwcFtzH2UqpchSkZHTC4kCAVKLh1y+
	 w9eXMs78Pr5xPbCrHopvtKonKspVpgnJLnIOA/Wi9pI36X8b/IJdai31pNKkR0vr7i6xP
	 kBYushlX3rT8uCP2kpYJcPc76Cxz1klIwVop1UWGrI24KBrMqxYAygYk9gF89Pluc9T9A
	 p30Qy/1SJfusU2dOI+HGyb/COl61rS3exw00eOAa602FXSVXZCl3HjBL+7LKaGObvog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1J3Nw4n;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D36A606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D36A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1J3Nw4n
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so6425087eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593062; x=1796197862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
        b=x1J3Nw4nYGGn9AeXsBXw8ZbjZc0HjHkEVYnoRNbIFaJLgrnzKn+THGCmCIlsLOMZXv
         62tNvNPVengjfSRqky2zLMwXGXV3PE3GmiNROzqzHQi8cUd88pdLCs6q3dj6unTEv4U6
         H5vtzIryiI//hdRexwXPCyp8ePfOC6rSGTZSyhEL1pErERm3W0hHT00o+P8kbWZprJDP
         dAKXLp0OZGviY1XRkkglXyI7GqiB0mt1BYPvkAZ2LPNWjOVS4acizvtw+EjS9sXdo6Wi
         DnxtaGk4cNpjxc9vnWs5HCglTdo6ntmkce+riw18wFYb5KSBNinlm4Nz2TQ6bAPKAIrs
         niTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593062; x=1796197862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
        b=qrb5TyqumoBAwPektaAeFsMHMr3hXgaHCWMJHwM5Ua6rUxcVoMEwmO3MEigXoHPPib
         OLfw3vt05KvhterR+5T3rEPqZIEb9CU8mQ7mmxLlvdkSILGRqRVykH3JlUYdfgBhtYhY
         d7TcATjpbvvnteNiFlWmCxf2ApHAEArw/68MzqaqzWoUfazP6j69R3iumHHr0d0hxWWB
         FPZUIfT/cSMh+MNVO67K+/RD3qIDYfXwl/am7DVDu+i+sCTGAdoKKGi9IIOqmgHRHOfx
         GeLGZ5GTIWbrynxe9FCa2F2nzw3jjvMxrTLI5xibxhDRoDh2NECID0guaRGczIm5apqw
         +W+A==
X-Gm-Message-State: APuU4Z/WqitpJJgUZJEew6UW/YoKgmWY5EX8/qDCz/hAd76u2wUmqCpM
	lgsdtdnxTz0GySvinfkWrtutTlZTwF383e9wcaLd56Ep7lAq8YqxNcQ+
X-Gm-Gg: AZFdTZdfCiId5S5Wu8lgdlIe/LZwmBFXU0hCZ50olcofWg/a/yRhQ+IC9DGIPVCR8Y3
	aJMkitfYPrs4oFfdBbhzPTOK5YyN1e9VKKNlka09x0LWruRJ6NysL39vGCaBC5eNXzc5PNhzOT5
	f0Sbe5P9HkHVc7+x5U7b+15e/xShrhTnUmY3nqSs1/Ufh0Hvjt80R0+wFIBo/HVuEc1c34GafV2
	oYDxFczVfdcTisckkK8EcP0iXMYvIfgwn4ADBF9aCQEE1KHwron2gUchkebJkCQIY8F7nDJrHh5
	B6QmJTIEJ9dtPYlTcdtEfKCK6sZq4creLjXaCYC+PhCPhpf6Rv6b8Nie+0HoWYNXfF4i7+6D1N+
	Cqx0rhu5UcN0fKimzRvrf2fI7pCTbvSd5dwK3nBT+XMv098cdQ4I1e6Y/I1QQcZCUedq5R074Ul
	pZHLgutg69IDumWQxx/+xhvK03HgLRzbpbKEMJyRRLykMLrcgkS9akrJodsCeBdBdbZdANOfVRf
	4A1GDubMEl1Zx1Ht4DbRLEHR0ygE0pSWqepDsym4B5y64L/T/lhSJFNHfGEguDUq4xv7jJlRgpk
	esEtqZIq0rRZxJRikjj/MIv2TyVMYg==
X-Received: by 2002:a05:693c:8959:10b0:386:a603:506f with SMTP id 5a478bee46e88-386a60351eamr10899194eec.26.1795593062490;
        Tue, 24 Nov 2026 23:51:02 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm9521227eec.17.2026.11.24.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:51:02 -0800 (PST)
Date: Tue, 24 Nov 2026 23:51:00 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, edumazet@google.com,
	horms@kernel.org, narcisav.kernel@gmail.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: uso: add small MSS
 variants
Message-ID: <awaTZJf+8V1lQSho@gmail.com>
References: <20261125013838.3823834-1-joe@dama.to>
 <20261125013838.3823834-3-joe@dama.to>
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
In-Reply-To: <20261125013838.3823834-3-joe@dama.to>

On Tue, Nov 24, 2026 at 05:38:36PM -0800, Joe Damato wrote:
> Add small MSS variations to test paths in drivers where small frames are
> sent through different TX paths.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/uso.py | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
