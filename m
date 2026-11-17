Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933035;
	b=CJzV0bAlCHTqNE8aITGygiliOH6Euj9ZJ8ZfVKXdvHFu3y4/dGB47YQKcxtauQaMyka6
	 +Z50z8gnXHeH596aCpNSKxQj3agN7w6tIpVULqAofcYgomtgHjpb/Sf3BNYJGxSn7zp1M
	 VFGGK8BOMfrs9RFonWNjLJyhOPCp2f9odr37m4CCr28A1Py4anZ2nJC2a0hKnQHsJ+/yM
	 VGij/5FI3+FBB+j/zxb2C/OwrPO84fDInUcr3eDoXoSrIZ67McS6Fqj/RpYZgetk2Uuyp
	 QRc0s69UygXAaCa/RQnmR28HSv13lnMbmjIjcmDGqN94VbYOFD0gTUZGzw4QLJhEzpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933035;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=cU6CsjeFEV2au41Xkxjp/B+2aGj2H2bCU9CSV2cdU5ijS4g3ZBd3MTbf8Z+3X4KT4381
	 Pnk6PO+d7ui3mAiBjysSanLn89Gcih4S3nK8C0eEmOaXlcG5/mbRnDFb4XFX49k0YeKy7
	 ZzsJl99SwDqxGZMxchNDV1IyfSocL+BIMGPnLXMEX0AmjXQy7qOZ59LJVPbRC/6ggqnTG
	 6sxWhNvlyYfjMLIzSzsdl4IhnU4z/CKZWVDy5fcEBVU4ckNXMdk6pZ1AxLvRQA8RP2tmo
	 jF2+EeJu7ZrlMl6NW+qXl89WC3NxvX8cOAu1Tm55SdhxN5rd34/AjodjSC+/Gk/RcXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="OjeS/k9K";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499D606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7499D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjeS/k9K;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794933033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=OjeS/k9K+ZEeJGwLjA+B4pQfgrs1555WZIrBCTYjIeeL16SHOsepI0Aju6DM5iZAJ2b/89
	MRO096o+Xu99Xq2wDVa5yt94APWLvRM1BCnC02dStx2qio7fLMCpux57uOdERer5G6qMJq
	hRPN1F55iY9cTZ/z9zYcrHJeDn3nfuM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-ouxUmyE1PtORbV24e_vczA-1; Tue, 17 Nov 2026 11:30:32 -0500
X-MC-Unique: ouxUmyE1PtORbV24e_vczA-1
X-Mimecast-MFC-AGG-ID: ouxUmyE1PtORbV24e_vczA_1794933031
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49337a224a8so3258180f8f.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794933031; x=1795537831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=qf60IkSAFxTD8xr8bOjsd/byszjQSqPLfjok2uQ+ANozpf+0gR9NTS8yPJ7RUtY0eA
         IKfVZEz+ooTfmV3fZJ0ZPon3xFvNtD5Qvmc59ZPJCk5/1J+xOLhIq1v9zlJomaZAW2H4
         aUpvwfLGlWZ8xdmIH1uQwJfzN33jnBbmgxGNoj6XQRm6sNK/Gyq9QSz43sCTQa6Kjnfl
         6cDq4OXrIKMWWsaSc1ryv6UsrZeF3f4vIogqHWTxd6IFuqA7Tp+7HLuhJ+4JbxnWVjXe
         7eXmtj7+9avNVfGIN/HUPG3A48fEIcZx46uDs3vt9/5EDAh+btcari2jaZKPIQ9zA4Mx
         Zcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933031; x=1795537831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=0i5WM9IVku/WJD5zhkDefcY4BGkB6SW1ACDkmcK6Ci+MbkT797mhntocvGwg01vgnG
         uyOzdDIdd0jwz08+dh1whdqe7zpUHVWGRvRoCV230/w4YholoTZvRT/UhD5fNhIHcviF
         Cq2YP4/r+TSXfqOB0V/1qjFt9DHuDpiSpNNCuMaILYzTUg1WneVxIil1JBQnTb3Lp4oy
         2EGuIm7wGObOOn/8a+ZEr3mTevD30WKcDdsxDMN8Dyfvas+y1jkQglyhXSmz0n6I90/b
         jShs4ajGwp/lJ764HGgK6ttbqsB+lZGz7XbpX3aC51nDItZ28NQRm0PxjQr2uPn7Frqd
         Ga/Q==
X-Forwarded-Encrypted: i=1; AL+hErHNaqQezZhZCDAZWY6WWfxoh4/09miZK38i8ExUgTlMi6rzq05y3RDnXR0GC35VNzJQMRyL+wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z/1i/9IPne8Ee4MHv/uxz7671pbQJphHAewKqoTB2qHUV9CYM
	faNJwfYpmDLkXEEQ3HkNH+54o//XCtYgWHX9zt8+6W0p4yBJfTWGaTF+kucLUt1GNE1RpqUteP1
	oPmxsCPzzeHxHcQVIQJluTGhIFriJMpSUbn6c75vHyiDmDZb3+ZWh19LjaQ==
X-Gm-Gg: AZFdTZfaeuNe+hrASvus5+FbaunptQC6trlC4sXyf5VA/MLSGm7DriZJbavoUAy11hW
	o+Tw00E9Sg/Km6AvFOlya0l44VqReW3TyeD5B0/fXfRv6MImlS6fytoZUsHFJhqmSMvZSRkhC4+
	MYU7CNOTKRkk6cK2aFxQw43DAcTdn6P64o3JnLTGLQdkhWoQRD5QGhLrd37RNg8bWiXLajbFU3x
	QQnLcsE8prRpoBKsokfu75hCKBLOzAdx5uPhCNweDyHjCrRrxnTG+X4hGGwd8CWtm3HfZmE3MN+
	Wy3FMU3jHTUXuibs1A5yiph7cArA0tTchrkn2nm3jZx3U/NPw5kj8A9o6pHwIMDoC1ju37XttfV
	QV/T/CxOrA7dQBZn66T3bP9CTQ8Kahz06pH0poeSP5b8965osc27v1h1uyXYXxt1IDKwtR7ePVG
	axpi0gclWPQq8wRP8jRQoBuIpfxKaFQIcBeCc0HYw5rcxR
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405919f8f.30.1794933030669;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405842f8f.30.1794933030089;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm29021988f8f.9.2026.11.17.08.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:30:29 -0800 (PST)
Message-ID: <09765df8-89a7-4b7e-b889-5bafd7622c20@redhat.com>
Date: Tue, 17 Nov 2026 17:30:27 +0100
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
Subject: Re: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in
 fib6_lookup()
To: Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Leonard Lausen <leonard@lausen.nl>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <avxPFYfEirXzTup8@chamomile> <94f4ea0e-c1bf-467c-94be-b65963410d30@lausen.nl>
 <avxRfzsnke7VJq_w@chamomile> <20261117152414.GA824125@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117152414.GA824125@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 16:24, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 02:07:11PM +0100, Pablo Neira Ayuso wrote:
>> As Paolo suggests you explore fixing this from nft_fib itself,
> 
> Why?
> 
> fib6_lookup() is the IPv6 counterpart of fib_lookup() which is used by
> nft_fib_ipv4. The fact that it's not working with
> 'suppress_prefixlength' is an oversight, which is being fixed here.

I must admit I read the previous version as the issue was caused by an
API misuse by nft.

It looks like I misread it, I'm fine with this fix.

/P

