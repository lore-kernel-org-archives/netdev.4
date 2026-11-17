Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908456;
	b=er8j5PTWfieCv1MdfhYUUtRx33rRMZGOCi7cT+pwAzRHbqL9ZuwtitnuKC+Ie6A1/45L
	 XZ/tsqdpcsmcbVwwtPAcoO1Ccyn1tpqY15WMCE2kb71Kuez+BeAURNPt044l2wITk80pg
	 6I8OUzFYemjuhnjEUZfgnM2q87Yq2ZqDOhjiasreZBb+CveJfIPSBmjr3PvbfWZ9Ql5Gq
	 QCPqLllONo6FnHLhhpgCE46hlOCPk9aZPxjtwO7FcD3+SmHFQ1KKIRleSbUCfhny6ohj8
	 7Ecp8EkYVPGcuTeI2PyWjbwgiMY8A+JEtmTcPXH31M+TVHvLxYlJ1j8lBE0F8e2CVOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908456;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aIlny92Oczs7zbQwn8DM7qSzZOMaavkMmiwpKTUsCbw=;
	b=1dlHvk4WQPy1UZpgJjbSDjTXMI/JCDw9HL/qRyvThXUvdEOXJTm2mHy/RVsaL3moyRoO
	 AHZEbNJnhrJve14n6/vy8Aa7vADjTV3iWVlQ087xyb53o0NATTvk3Ad7/169YIv/yfTb5
	 CLmFwpz8dzy8DmHTf8zyrl0Co/wziHNcLp2haooRvcpVX3JDMePwv2R6s4RiCBfGcQDn0
	 J10kup9cD7qTjWD/oHot0BaBJM9LJmpyD2PympIiX6rOZGBB97FBQxRPn1a4DuT9Tvvp4
	 T95SjXaiNCmcfDC6E2EGJMmtl8cZSw7t6bWXMSAH8B5tG4fe6f6JM+PisLZLgQckayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KkvZ5bc5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z83MLS9U;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAF606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AAF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KkvZ5bc5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z83MLS9U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794908455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aIlny92Oczs7zbQwn8DM7qSzZOMaavkMmiwpKTUsCbw=;
	b=KkvZ5bc5XKKJoY387d/oOgOyMZ6pHRGtXG8drW4M6IF+zU/HGMTs3/O0iIcY38G1uvgDC8
	3SFu5+jSDdT8nJ4JT5w33jVfxW6ZYOZZFW7R2gmfnaDXO37pszoh0RjmQ13CYmPc94olom
	s2JeJyYbADzmeU6jjGrW6EJMWGfI7g8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-xbR0fFpaNka4dxEBJJWzjQ-1; Tue, 17 Nov 2026 04:40:52 -0500
X-MC-Unique: xbR0fFpaNka4dxEBJJWzjQ-1
X-Mimecast-MFC-AGG-ID: xbR0fFpaNka4dxEBJJWzjQ_1794908451
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso25989865e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794908451; x=1795513251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIlny92Oczs7zbQwn8DM7qSzZOMaavkMmiwpKTUsCbw=;
        b=Z83MLS9USuR77z6LKE+onks878LLCBYQ5WjjINDuRVTAqzi3Z9hI8APk++16zIhIAw
         ohabGJsYRHnuzI8c3RdSTHu0yzMr/04qWVVqDC+g+11KGXYnbdTTd3TeSUEsYOYIgUlS
         soi9Gq+8rajNmMTNIWoZ/uBN2pmNKuAd+2BHTMXsqpXW99URiC/i3J6reWDRjmSw7aZ4
         iYgBOHSjDYeWI00wH3rYCJZa8pUZugL+F1WXZnSICpJTZ3C3IIZK2t8QWye8f758e3Hn
         wKVc/Tnai4t3i/8X04A4JdshU1C5LRvMZbSKJTBUgVZyM6zNkNkzD0l3xnqvK8cFBl8J
         EKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908451; x=1795513251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIlny92Oczs7zbQwn8DM7qSzZOMaavkMmiwpKTUsCbw=;
        b=ekLQB9EtDhypLqfmQqfco19GcMoCWwYFC42GmdNM1/vfSQN5tmTWGO58C72z7ZuLou
         BBarwIYQ194JrsdEEYAPjwWBBNqLt7ADw37TCoB4OOr9sHWdOwGboaUkO9oO52SQuuzm
         VlzPzeZUuvHLmUPE7rDCG81M4GPam1T/p+LRGdk8zUM7N2hxF/fwg8t3zHGBwfdCP3WA
         KMITvuolxZQKnXVz2fGJyiSvODfYJgc54bQ6NOinxHxafpNeXEphTdI4+17u5PUNccCF
         deAF5I+MHZX8YUEdvsg9aeVhoLUQhKOnXGiaezryiA1yTowvp+aoi76lEF9Z3gdFRKqq
         ElJQ==
X-Forwarded-Encrypted: i=1; AL+hErE/2J6Ri4fYN39EjwdwcSPQ2G3ZzHko5ZqJkrL21yz3SjjdDQEgmwXkCIqbPBP+Lu2I8S8Px5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nb0xstyYWwv7L55DmWKeHOQjKvChyBV/GKcMbqhD3Ibx/wrbT
	Obux6FMinbl67ammncDiPVkQ0IGGexvfUbM5rBgv8xia3e3+oZqpLN3r5Zs6DpZfKjNyXIjHBpZ
	ELUQ1b+9uw5bZBsf7if2V9jQzOLhLm8ksW1bl1IhrvdTNeUgYvrA+wd1qHg==
X-Gm-Gg: AYBFou1XK7twewfWiB67lytQ9v1CrOG8nOyg7En9kTwIxuNzeV16ZQmup8Xv3lxdeQR
	eO1syzwOtF07pn4V/fbYjvh2oPpP4/lybVUZTh46pUUWuJQ5GAgfam27ww51QCYCWnGka1NOTm7
	MhlP+BI9Sv3DBgERqnSLbjes2G0OVxfJddkVEN0fymPz/F2yN3n5d7pxYkjSXKXDD/7nV72fPfV
	NzR1B2K+2Cnga/AP7QUGX4M5vIQUB7ElZ/OCm8WTaizloxHWOeh1qHx0GiYuvDQj6U1cQv/fVdv
	I/mHR7y9pxQX9E/O4wpnDTMHXTAKCyaKkdQBcvTH7598u/waQoL4gCE4lfUkNu/s7xE+z1yDKTV
	9ZSpzbGTG+sHvf8/IQGZcfH904kiIK8622OjeS8/rLYZd/94km6dfFXOugsb/B1epqW4BudOHE2
	Cp/h879Q/Dp/nC8vrYqlNt2Gx3J+f/yJ6BpYa0Njm3f/7G
X-Received: by 2002:a05:600c:1daa:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb55a4801bmr284210015e9.15.1794908450711;
        Tue, 17 Nov 2026 01:40:50 -0800 (PST)
X-Received: by 2002:a05:600c:1daa:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb55a4801bmr284209625e9.15.1794908450299;
        Tue, 17 Nov 2026 01:40:50 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm138644185e9.2.2026.11.17.01.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:40:49 -0800 (PST)
Message-ID: <9ead5297-c706-49d7-8226-99955d81ccae@redhat.com>
Date: Tue, 17 Nov 2026 10:40:48 +0100
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
Subject: Re: [PATCH net-next 01/13] netfilter: flowtable: do not hw offload
 flows in teardown state
To: netdev-bot+sashiko@kernel.org, pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, kuba@kernel.org, edumazet@kernel.org,
 horms@kernel.org, fw@strlen.de, ja@ssi.bg
References: <20261116001612.2806263-2-pablo@netfilter.org>
 <179487496421.3136.13242797618262399074@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179487496421.3136.13242797618262399074@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/26 01:22, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete.
I understand from discussion on v1 that the above is understood and will be
addressed as follow-up. The same for the mid issues in patch 2/13 and 3/13.
@Pablo can you please confirm the above?

Thanks!

Paolo

