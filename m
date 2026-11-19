Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085384;
	b=svyc/MXvPwsXKdxZExXZkjeJjyrQi8M2xiGP/aTue7DntET75d7SSwsiapnfUWqWaCev
	 1WfhwDMI3vCWzT0v0ZxBG2kBPNrUYQmRHc5Y3odiwMWwkwtytLbQX0KpAYwfxFWw8ld9e
	 XIKGwifPhj/jFE/HcQ9OpxwwcAKdwEqFGRPcC1oFSOxf4C16gOh3zll7ttb2suBvZU1G6
	 /rUORtFu9lOix0tsgIuaj86CxxSM1QPXHLNxaBn/34XP9x1gGlEN882Jpp+OsrI+qbcKh
	 Cimd0l+4F9s19YuR6O2mwA0Lcohu9U6ybqeRlMTIq4UIm1WdfZEBnTMC7XmoEPeZqoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085384;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
	b=JPJylSk4eyMNsoc1cHdisdsWcX0ubd5Cai1UsGQy9xlCYVH+FGUPRO2y4yPnLRAN3iOC
	 9618Jm3UeBwMOhM3dtn90LTBBSP6+fxlVl8XobVJlmZW+4LJqsiKOHCuhQnqMAsfucluF
	 LadN5bHo679zkmZOT8zlz7X7gG1p7QsHi4BOgAnd9S0+AvmadN6VRY/WFgtUKJVTcq1D5
	 TAosVLsWwV6eGwBPlonpWIY0LZXF4UMPlL5Pc23NCq1XXRme8LfLHQF1QxD3wOUq4FYig
	 7F5v61nu9I/kA5KF2jQLqfblEa7bQ4IsPcoLl+Y5QrluufVDrZLE1E/CEiGXo+JNsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fUOd06kj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qmnk73NJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A8606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6A8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fUOd06kj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qmnk73NJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795085382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
	b=fUOd06kjg7qrtuicS0LVJg2Ow8Bmf9m3unCxs7SNWL8GwRjLQ/OCWltPqymYAEAH2EKss1
	M8F3RLlUKOKpEGAuHzK+4o6Iq5Q0eWnE0dKdxmP+AwJKeaNFlwtaEUvwM7YwfGdHTLJeCO
	m7dnqRl/R2tWWvoB2u/JwcwZeaigS9k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-WwH8ppQ8PPy6Dh0Ojjf1iA-1; Thu, 19 Nov 2026 05:49:40 -0500
X-MC-Unique: WwH8ppQ8PPy6Dh0Ojjf1iA-1
X-Mimecast-MFC-AGG-ID: WwH8ppQ8PPy6Dh0Ojjf1iA_1795085380
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso710171f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795085379; x=1795690179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
        b=qmnk73NJf6DOljXpqtNoLk86T2PzOEnIK058W3W1xzhvZquEYIAHpITks+XchqOo7U
         mCmSg/1L6j/n86L1FFk6mHaUvD4VfNPyBgm5k4Ug+hkngyvs8Yhd+VpfND56l2i1Cbsz
         JAqFXr7bGfNjBch+jkUqTbQB+fIkvRTp15/4PJT/ThBAThYQz5vAZJfTEKy5XtQdv2w+
         FcsnsS5lkVJ2A/WvpXg4hZgtbdvpQvOEGumR7t351Ba9biN0pXe4SgHNw+p+ol1KpSVi
         3TdVGBQGOjJG/MySIIdFR3dtXLFVI1dHur+p6Rj23PRUDDx+DT6zVmMPqEEbyjxdos+j
         9B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085379; x=1795690179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
        b=NAqMmCAF/F2wMu4A+sDovItPPtZ00EmzeEdkjhzJ0OdVLuPdIiQPvNBFP7t4zB52MB
         W3vJNVc0isaxHE8+CdEV1xIojb2FUtj71guAWTakIEFhBHG0tlUVKtFXCslz/EHscP4d
         v57zCWK1MgvJnkO9n8f2gSMD0je632u4G0bA+uaYGhElp+SmL5mPRAjouLfVBdjMHy4U
         xaz0wbrCxBi4TZmsuWmGAbj0HsV2dZPokB+dk43Sn2Q0vtpQ16+FTtIdba12m7SHBmtG
         gVs7N4RcfZDXvcxN6NL4ze9FaB7eMUZ5pkqJrENvbkhVD7Achp5uU5lFBUYGw4sV6cvG
         WoYg==
X-Forwarded-Encrypted: i=1; AL+hErGuRBaWgASLJPe8FVQGQQhV095fX8tckhZFTXwm7yBVxQ09JDoZysBdNdncqPCCZ5/xEIefTjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mWHSs3RHuijVNhs2CJ6xfGdlV5MHIgvFeL6We23SCtTrw2tMG
	Vf51sTxbBnu4DDJtaOUPVnRFDCNe35fFJCh4j1qruV8wZBDxKX9F3ZX8etHJEDYlAbpWOGjkndB
	Hq3OksA7pRHVmeRXhVY5eWB8S2FbsBaGPlgavxKMLhrPgKoxWjVwE5h+z1g==
X-Gm-Gg: AZFdTZcOpXw0e3P5iBzC8O25UtAwB8spJ62ikqcakNzlw8ekmJ1+qyPcivor+i74b1k
	5+Fad2S+0yFgVnIYXaElJzy+QNl3ZULQfUv6hzYGh4oXbk9jz8Yj60MJm3DptjDdojqkVC//yzD
	TprT0F3vV0Fshc+4DQRUE47+hw2G280ze/Hw234Kx7sZ/motPqr8IBnOXjR1hGAJ4aIdJsG7/t8
	bYwOcPgbITvRKJksUtQSj9QPLJUbYco7utmuz/o7sFQpxXZfYnuZIE8TwtC29MBLUqIQHLm1mI4
	UT63vdQwEtrC/oe6TpV0sSEIDJ3KnKJM74/b2DljnNBczDHyxNgANX1djCMn5PZgLTzJinsz8vK
	Swpgw8IaoFxP6vSSC6+yvjUSWpEBoxbN8SwlVTjGNDQpiGyzh/yEKw8+jfXvZUf0sdqr6NJrA0I
	x4MISHujZt8HjsxPD4jjihGkw+dqye+umeGT93JR5T7AKM
X-Received: by 2002:a05:6000:258a:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4a6332bc8fcmr12141426f8f.7.1795085379555;
        Thu, 19 Nov 2026 02:49:39 -0800 (PST)
X-Received: by 2002:a05:6000:258a:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4a6332bc8fcmr12141377f8f.7.1795085379181;
        Thu, 19 Nov 2026 02:49:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b2a1sm9587223f8f.32.2026.11.19.02.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:49:38 -0800 (PST)
Message-ID: <00d863db-2ca2-4d05-964b-ce742cd0740f@redhat.com>
Date: Thu, 19 Nov 2026 11:49:37 +0100
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
Subject: Re: [PATCH net 1/2] veth: wake a stopped peer txq beyond
 real_num_tx_queues
To: Simon Schippers <simon.schippers@tu-dortmund.de>,
 Tianyi Gao <tianyi@cloudflare.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Toshiaki Makita <toshiaki.makita1@gmail.com>,
 =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@cloudflare.com, tianyi.gao@linux.dev
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de>
 <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
 <20261117181607.30219-1-tianyi@cloudflare.com>
 <ab31c0a9-8e3a-4c24-9570-7baf91c22288@tu-dortmund.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ab31c0a9-8e3a-4c24-9570-7baf91c22288@tu-dortmund.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 19:53, Simon Schippers wrote:
> On 11/17/26 19:16, Tianyi Gao wrote:
>> On Fri, Nov 13, 2026 at 11:46:47AM +0100, Simon Schippers wrote:
>>> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")
>>
>> I agree with Sashiko on the Fixes tag.
>>
>> I have reproduced the stall with your script (stuck after 2 cycles) and
>> confirmed this patch fixes it (all 30 cycles pass).
>> It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
>> VM with 8 vCPUs.
>>
>> Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
>> Tested-by: Tianyi Gao <tianyi@cloudflare.com>
>>
>> Cheers,
>> Tianyi
> 
> Hi, thanks for your testing!
> 
> Yes, I should have referenced the other commit, will post a v2
> if requested :)
Not needed: I'll update the tag while applying the patches.

/P

