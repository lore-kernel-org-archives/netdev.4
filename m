Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091193;
	b=Xg1XPv0eLn5Z4O9aiRAMoNjsimyKSTkzCOxlYx0X5nXpzedHdYfdIIWcI2X793mXZcNW
	 yxn5Bf6tJ4RSKb9CStBXqeGldpttL2WnN6/co1rT+2bU/rQiQ2yzQQGCYVDowjWyW1rGn
	 oZk+eUzK9DkMT/ENkZRkXD1QaRSBNyJ4FryhhDMJGgLz0w25IFbCZqlKvmoF/1J42qLpd
	 TXDtfIRD4cwSMc1WLnwu9N6lTkFrpHrsb3w+stnaYQosBCFn8Y8OV5bEuc3xInQE6YzHw
	 PuT08twh/FWP/C96YAlaXfdF0fvJz5YfpNTQzpVNvNfrN/UGNR4H0ZjOlhEjqYqoYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091193;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
	b=cNSRl68fFtNp8T6tcUsTkwSBVokoKxkUtApQHDZRLF98RQteC9UFgadzjy5gVmHtATBH
	 A++uM61yVSN6YyA58LDEPZPVftBew1nYO/WXc1NK/ykEs5CuerpnhMcj9ssgwhuBX2T3E
	 6YMQmJauzWekP2JM3MtOwqsx72PdL1dGqANQblgoydgn5IEEN3iMZws+7LMMrDHdn6v10
	 yJaocU+5IlWVFD3U0c+8nVxcH5pjD5oLqn+QnlYwhJ4t1YAziSCQ8bqLdaxqye5jIHBe4
	 t//2SXCfxMltjMagHd2pzchYWC4F30JYWlF6rdRI68GxmN1xWepK6q8Rgl9TG+rmhxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INRUOght;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V8rZNA7G;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E91606A33A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E91606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INRUOght;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V8rZNA7G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795091191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
	b=INRUOghtOr6wQRAKWCYpK5KFJnWnRK9NXbbemqfoo9uYlB9XErl+y7GtJYw+LzfapjwKSh
	Ri5BSdcWvFrv663d0fklIt2uRJ4xbFpyFd2+BZpTlHklT6sVDX4cwfrv+CLYuM5RfOZJso
	ku5BeCfvfQ4jpcNthvMshNNDyrbtEJ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-ayFQPUEzNVy_3FwbBTp2Dw-1; Thu, 19 Nov 2026 12:26:30 +0000
X-MC-Unique: ayFQPUEzNVy_3FwbBTp2Dw-1
X-Mimecast-MFC-AGG-ID: ayFQPUEzNVy_3FwbBTp2Dw_1795091189
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so15280065e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795091189; x=1795695989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
        b=V8rZNA7G2GaTHDLpumciZAe8cxUQQXziNITmEtt3+6mBnH2IFtTdJxV+gUTi5ejbZ7
         tFxcglAZKajrwqDG1xsCKsmeiXENX3toHuU4lOVRnen5rrbNBMlQ7jl9/vkep4YMpm7J
         3tK7xV2rPjDxFO/XhxkM76dwMM5AKbJEEz3KeqrjsUOgkOIA8EhLXTwzsti/rKZXD2so
         x8i3ZsxBe2XUBIV+AC2gQGc+MPBQUdhEMXBcZHriaoi82XbWHcSciZ+/r1D3kxrdZINK
         QqSuFsH+XQaPzGCl3Qzg07kgK1MumkuTlV/5YPsUsjLP/XaOIlye1j4vAIFX1VsSoX3g
         uUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091189; x=1795695989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPtKEPcgPPei/4lpP6NMUNca2C67n223f11xypl4aLY=;
        b=c1OTYEsgcfDR8+WjUtjk2E543yTQg8DYCxdBGFBcy3Za0ioXaazNKUw56K0RVRifpY
         Q1Ye4KEiqj6rqAEDTc5wpwhNwyFoPucT/HZoWEIPNDUltn6uwf2HOpEEnz0Ttm47kUfI
         sRvpB0TZhYMpfq82Ob2pyMDc7Ar+3SNXN5/e0wFcNCAqOGeXltgu7CvJXDA6WR8JAXLJ
         D0ZvLaNC1aWY6F2iMAdMN1rL6mUssyWIPmudI3SsiVKVcXStI0jqSrdUUjZUcp5aUa8u
         s0G3v9UewsMdIqf1eHILDNzcNyV4J/+87jIARqUfHHGUdMho0rZlV4+Lh2TOyew6hO15
         1k7A==
X-Forwarded-Encrypted: i=1; AL+hErHnI80bJdt38ULaWtuFgX9wz0I4sEKEwpP9fr7764i5X4/T6Bd0d8Kv1v87H3rLnUCl/ON67iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KxCGQTMSNpDMNdsmIMwjks/2d1NPjlwKUhiDvzhI/E1y/1ZDc
	wL3+Cq3zfg3MjqflGzl74isM26ZpoxiD0QPF8f7VCrd5MFFAwTUUMKTwnUYUDQ1T0rvZp3JzrC8
	Xd+U9sxQtwNvjXPi7oqISs4DSP9SSnNKtNyg3+dSeoMhLrvv6OJtjNi4inA==
X-Gm-Gg: AYBFou2K/AzaoafsADcyvruS9x/Xm6NnQ74t9b4tQXq/tMfyd55c/x6aYZ1U5KYP/Fw
	WSS47vfAjJ/C47PqzPVNczvCipugSjiMXJeWY4wnqbZRgST2Dw4tEBk0jzqaIRfYLbJVeM7uEZt
	UxTC9vn5y62aHMjk6ibekeKW8cm4d9FUNV38n5LJZmaRDd2Io8CUrrCfxPGDvUlRnPNQqI/70wR
	3e5UggsH57DC005340Benu2GSOlozVKI1k6zmH3knGFEBL/mfnGHrQ5Mbd5dRYxmpJ2SQRux9rs
	K85nED6OoEjbJlEcMiwn7oa98R89fGYiEgs/TsRtXTJ4yv40M8gdCBqlaqVAgpaHsyEmCMakk22
	wr0sG4K90zY5jGAbpk+DxWA+4iA7j8YA/C2BEjHXWHJEbgqeYu+aZ+0j3bKNTupCYZ4OPtobr4d
	5mRPqnnhaNFRSgQHFUO/HSQ/vGafhHd+uadVZT/KxI9ieK
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr117566695e9.15.1795091188982;
        Thu, 19 Nov 2026 04:26:28 -0800 (PST)
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr117565805e9.15.1795091188490;
        Thu, 19 Nov 2026 04:26:28 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11163728f8f.56.2026.11.19.04.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:26:27 -0800 (PST)
Message-ID: <7ae72699-c528-466a-872d-e9124fadd11c@redhat.com>
Date: Thu, 19 Nov 2026 13:26:26 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 1/4] net: make room for the tunnel header in
 skb_segment_list()
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, willemb@google.com,
 steffen.klassert@secunet.com, jiayuan.chen@linux.dev,
 mfleming@cloudflare.com, almasrymina@google.com, bigeasy@linutronix.de,
 richardbgobert@gmail.com, ecree.xilinx@gmail.com, bsdhenrymartin@gmail.com,
 linux-kernel@vger.kernel.org
References: <cover.1794151759.git.julius@bairaktaris.de>
 <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 19:26, Julius Bairaktaris wrote:
> skb_segment_list() pushes each frag_list member back to the outer MAC
> header and copies the tunnel headers in front of it, but never checks
> that the member has the headroom. A fraglist GRO packet forwarded into
> a tunnel and segmented in software then hits skb_under_panic() on IPIP,
> and on VXLAN the copy writes before the member's head (KASAN:
> slab-out-of-bounds write in skb_segment_list()).
> 
> Call skb_cow_head() on each member before pushing it.
> 
> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Tested-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This one looks correct, let me pick it. The reset of the
series will require a new iteration.

/P

