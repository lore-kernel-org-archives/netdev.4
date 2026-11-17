Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920024;
	b=Q2DM/uoCp/2CRt7e86OLPujA6jmtP6r1GfZ27Tet2vt6Rr9De0mj6il3g+jC+QodJ9rA
	 hoEVcVjHecD6zPXhKfldPV1efPrUVHXo4RHqVNd1ZsUmvdWmtfdsASAspYTZTokudpG56
	 n3IRuXLpoZhBsDxPSz/ccomIKnn9Ik/FIpGvmiXa/b64TfmvjMqGKkl1Ch9p8lhxWagzw
	 VwBoubqRzBSebvxVgGoSh3bPx5WP6vdL9mbOu4WoLFEld5BQDJvGdCejb0jLbhpIb94Bk
	 iET6+B26NSY3NgGdKSCcVFyyPxnzgyP2jaUoHVaoEPu63Cor7xnf46iRfddmh18B/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920024;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rFetIYEk0jDXvNYIfKGajMe/NWzrr8J7psT0CT+nhDY=;
	b=RmYoh/peNSDzGYnTOJI/xy6hzQU91LbD7/X2ww9VZ17J9iN91hxGZnebcrNkCk+h3dx8
	 dI22AnXY6UgjgGE7PoN+ZAm9kkdYmzs/GSJkGN7FrGbOFQYzDX3eha4Ejee/8XVOKGz5Y
	 mealPd7hhkJpejp6+Lp1Y5b0TuWZHL2/ctJzLiMOk2DR8wxrOzAem7a5iKptfjZiYDoC/
	 yDPsYxYGmlLmEAz3xEcVuPEm8wpjVomKL3+zXjwlo63gLAbNO69brg1dcvfx5HF37GyJj
	 KmqOQLhBEE71U/ouXXA2IkrCwYyv5mxER1JZ2coiWs2k4bHlcmJvqvHR3/CPa8baehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvHsu5kV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QDH9t42b;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B6606A882
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705B6606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvHsu5kV;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QDH9t42b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794920021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFetIYEk0jDXvNYIfKGajMe/NWzrr8J7psT0CT+nhDY=;
	b=CvHsu5kVQgJoCK1iB6a69NClG2Jplq8p9d+A2tuiY9D3uVMgZQSptkSzPI9bXmK8hYHaAS
	/N5vI964Wenfm5dQsEF6uUs7CQqcJ1Nmp9BJOimD1lsJaWQE0P+nhMUvF4bnuUP474WP0g
	9o03j5IYimtt/5C1Jo8qRnfbZZcT97I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-6ZLgIjidOo-Y1HQgH9Zlng-1; Tue, 17 Nov 2026 07:53:40 -0500
X-MC-Unique: 6ZLgIjidOo-Y1HQgH9Zlng-1
X-Mimecast-MFC-AGG-ID: 6ZLgIjidOo-Y1HQgH9Zlng_1794920019
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so28799545e9.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794920019; x=1795524819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFetIYEk0jDXvNYIfKGajMe/NWzrr8J7psT0CT+nhDY=;
        b=QDH9t42bY/gXhUZmg+ZdFpN5YPVhd47akM28B40Cs/LMjoFwIDV+hgdC4HGIzhcnDq
         241LJJOhBdmQvMMHI7Y8AG8oHyw0CsNyG3gtFsbNcEhCuk8nCL5pebmxzAbA27YvZMDs
         S9AX63JcwuEFJogViOWmhz1nAUns8ThsyGSTwQ4lOyAYwUH2HLme3j4lHoLgnsxLU6B7
         4iyUbb6VF3njmXABk4C7ryrOnVRMv5K3CSOxxA11Nly7eh+dyOCVnZ3Jqxjhd9mAwX60
         tWlb0O28szRTFJds18a2m+1pBLNsHA4dqfgRDsK7vFkFwG5D5ZzczeOHMwVBmH2Zy0rt
         8+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920019; x=1795524819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFetIYEk0jDXvNYIfKGajMe/NWzrr8J7psT0CT+nhDY=;
        b=F5wUFHSHaJ06DXecmZCOOW0YEmf3g1lkYcSyADsgHDRtVpQQinZDtv/+NbEZeuO+Wl
         tcIycXK1Jkxn0M94vLPTNEegHwP3on5MKALXRkZN3tYucEj0vIn+moHBBp7LFDX7X9Vi
         sQh0Rs00T0irtzmc8zSRhMDQAbqDOoES3/29/G+pzXc6/uo3wfv1MO3o1JEJfF/oVTCY
         VohLJfzyJK9YG2ystGsurcQ0GAiVUx8vQDf31MiwHWLUzIr/L7q/WPE4I5CawM80si6+
         G2V0Iz+D3fD1wr7af/c0dE2HOO5Kpovlsgs+z1s1v0KspVdLTwHn9NOuLAezZgQ+zsnj
         oeaw==
X-Gm-Message-State: APuU4Z9wN3zENQXgxKCQbXOET9OEFmnA3xedtkwUwiShRIrYv6tnd+ct
	oveg6NpBWjuRdTyQJMI2LB3cuXtxpClLsWJE5f0RdWeF/eSPTdLx2qDDn1f0iFMxA2C4LFlOt9I
	y3V0JDGozLOkBdIBOQK85frytpUhlcPTiGS744LDcqSjCECDcFBrIWLQ27w==
X-Gm-Gg: AYBFou2OqmkblwSgmq6rOlaHMMhXr6rV7JrpJNNAtXvQXm8hMXdhL0RXDOK5qPivDAa
	VttnNOSA52ZymuksWkCM8WMXEUBWcsR6SX+hf+8sWBUXGaznnJIlprtLf4rgjwPTZVPzXvmfpjG
	nw5pn7HxX58W5WIsdFUSv92/uJAttcbOlmojhTBWEssmsYEXv8Ck5vCQfNTS9omnsCjD7VbBW1q
	36b7rQ+zqJCTRo9oCWGpysNFCKY6aUFsuQsY96uCCADyQQxk4kLecK1RBaDDGNjCaRWBDVFI8aj
	AD+qF9jRMgXZ0wWBQ+5Va6RJDiarDscZ8cRY23CbhldKfjM9gxxNUeQzCBMCaIr0+WlxSLQlbgt
	YME2mkv7ZCTVC08J4rwSr/rXV/11foJ0W9DVwI2gWJmt52WQupxom5ugaA64ayXespG/78Fi5qj
	nyI9mPyHhXiRFlXccCnrlrLycqjj4nnCAePtwe738WerT6
X-Received: by 2002:a05:600c:3b96:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb679a8e01mr231688115e9.29.1794920018813;
        Tue, 17 Nov 2026 04:53:38 -0800 (PST)
X-Received: by 2002:a05:600c:3b96:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb679a8e01mr231687435e9.29.1794920018360;
        Tue, 17 Nov 2026 04:53:38 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm116029895e9.3.2026.11.17.04.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:53:37 -0800 (PST)
Message-ID: <4c074303-367f-4a8f-843e-aae152260aea@redhat.com>
Date: Tue, 17 Nov 2026 13:53:36 +0100
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
Subject: Re: [PATCH net 1/2] ipv6: honor rule suppression in raw FIB lookups
To: netdev-bot+sashiko@kernel.org, leonard@lausen.nl
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, horms@kernel.org,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, shuah@kernel.org,
 daniel@iogearbox.net, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261110131638.15004-5-leonard@lausen.nl>
 <179469689962.2199510.1299009420613186748@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179469689962.2199510.1299009420613186748@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/26 23:54, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] For raw lookups, fib6_rule_suppress() (net/ipv6/fib6_rules.c)
>    evaluates suppress_ifgroup against a different nexthop than the dst-…
> 
> --
> 
> ipv6: honor rule suppression in raw FIB lookups
> 
> This patch makes fib6_rule_suppress() apply suppress_prefixlength and
> suppress_ifgroup to raw fib6_table_lookup() results. For those results it
> takes the prefix length from res->f6i and the device from res->nh. Raw
> results marked RTF_REJECT are never suppressed, so a later rule cannot
> bypass the rejection.
> 
> Link: https://github.com/firewalld/firewalld/issues/1600
> 
>> diff --git a/net/ipv6/fib6_rules.c b/net/ipv6/fib6_rules.c
>> index 0ffd7b47a0460..e8a44b540291d 100644
>> --- a/net/ipv6/fib6_rules.c
>> +++ b/net/ipv6/fib6_rules.c
>> @@ -283,19 +283,29 @@ INDIRECT_CALLABLE_SCOPE bool fib6_rule_suppress(struct fib_rule *rule,
>>   						struct fib_lookup_arg *arg)
>>   {
>>   	struct fib6_result *res = arg->result;
>> -	struct rt6_info *rt = res->rt6;
>> +	struct rt6_info *rt = NULL;
>>   	struct net_device *dev = NULL;
>> -
>> -	if (!rt)
>> -		return false;
>> -
>> -	if (rt->rt6i_idev)
>> -		dev = rt->rt6i_idev->dev;
>> +	int plen;
>> +
>> +	if (arg->lookup_ptr == fib6_table_lookup) {
>> +		/* Raw lookups report reject routes without an error. */
>> +		if (res->fib6_flags & RTF_REJECT)
>> +			return false;
>> +		plen = res->f6i->fib6_dst.plen;
>> +		dev = res->nh->fib_nh_dev;
> 
> [Severity: Medium]
> For multipath routes, is this the same nexthop that the dst-based path
> checks?
The AI comment Looks relevant.

I think this is net-next material: I would not push behavior
change to net.

Can this be solved within nft? The wording in the commit message
sounds like it's using the wrong API.

/P

