Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618368;
	b=4IjLwdl/wxEWlRxxc3cR1ujnK0DiEIgzeXXqThcDjouuoHVIAyym8ohQ6wfErWSXUban
	 w7+5BMEhH51NvDhJ2R0YD+X0LZBfcYw2x34JZvkEX6Gr4V5+TQqH/ZOuYAWGa6VTaWwW1
	 gkibP9+EIQhoZUgZ5NjCJIQjRyFH3kVXcS8Q5XWxFxBEKSqGDDHIPluWlLTxs4rQDhAVE
	 /ZVjJPpo28fpmnBe70cU0+A7UxxgBo1oZgbIwqpXUuxv6tWRqbxg2fDL6CqFOxHIzWzAt
	 8tgTkzs0rRwE1hnbmxjMFjIezE1Lb5wELOnP27g1eV0NOQGLYBfNiDCAGGPaaZ+1C+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618368;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
	b=4k/Oxhw8YaRti2+/k6nizqGD/cUSJ2iuerIBLkHtGzen2XlR1ifgLoOAX8Us17Cbtun8
	 30YGHfuQz28tcMf2hTPz0oqy8wnqzlc1ej/3WsefcJvPhIve9u0nJtSrepKBNF/hjrEtE
	 gD6Kr03PVRwb2ztToU5X/4JasGiHLWQ6GQqu7+7l0k95UYd9YZpgWQ2b+kGYI2OVE1fDT
	 tHLy/rwvBgrEelAfcinTlWn1idSzmcjgXlCTl3qJiDmk9NciPt+yIncmcTMpmmc5YXcxA
	 0wG0wZjMA/f8+ztgBPgG4q2ebWQlrQzB0atifQ/SQjPyiB3XQ8fO1f7WZq9tDC3KK1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WUWK3mr3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Og9N7t4p;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950ED606A330
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WUWK3mr3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Og9N7t4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
	b=WUWK3mr3X/yDeDTYWp6t9quJxT/PQTSty8Ba9PBZSGj/v5RKwJuLWum4FZne3eCzJcm6zH
	ufhrf7OqSVTS41e19XuhysSmWqkeFB8YTN09ypps6u0yDepwopcoO4NLuq6G4kY4KDIn8k
	sS9ctg8qk8R3PxLlWBK3541T3c2VYNk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-7Vy3DSe3OUOIljlrQq5twg-1; Wed, 25 Nov 2026 14:52:43 +0000
X-MC-Unique: 7Vy3DSe3OUOIljlrQq5twg-1
X-Mimecast-MFC-AGG-ID: 7Vy3DSe3OUOIljlrQq5twg_1795618362
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e011829easo3559133f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618362; x=1796223162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
        b=Og9N7t4pa7nsuRPESyV8DOMPhoeBzUPu4LoZTsTgKclqq8KPIRas3OZa47mK7ZOCmv
         4uLYUCDtS695OaReRUhD5JFRyTInZr4ul3RqoNvKukMQde/QMgoyiRIogvLTplG0M6Bt
         gOE6cnD65rYUBrlNx3/hfarbT7w9PurdHI54xQOcD16Y68EClBbJ8cwxDQfUCS+wexg9
         p4p5k5LMe3v3Jrukeux0aRNe8KYfSZPRiBlZZz1anVsckp04kuifjnYj9PCAnRryzm8X
         3nAYVV9lKpebksDXefFa4yjTRDQsLpvRzqXvP45hcLxIAYnS/JGR7GYUT+YO2pGb0Nmc
         JmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618362; x=1796223162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
        b=erjl+DrETp2ZUC6Ur7kdr44/xCQzlf7NxkylYSj5m179Ecwv3G88cZ7VphWktvejTc
         eKDD02iUTz+H5gLiTe9RPK0YfyJexxYViRlZ48MS0yOZnzdrUFNM/9Q84WJF5xESWbhq
         5LLOEeSnvzPrm1/5BaijlcdHCNIjZatJzEOnBDJg9a5e6cRcghbt836Gw4NgoV23OR3U
         6pxKdlv+F3oq0uvg7i96OboYdTkPVGLyknEIspdn4PVieVwYpeZ8jmggGGoLwOMXbpbA
         n6BWKDmyM5e08Z6PEFAus9fHRsNkFaS6Q1vBFIIracHkWdUDl7cB005W9iTpu6q55Ahe
         Ec2Q==
X-Forwarded-Encrypted: i=1; AL+hErEAVqE/vjqo2fEjdDZfk3RgCCcffYOPDF4TszolPlu7Esxy7e5xRki1XnstRC4KpCkofAhlzcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z82UzhgJPrI8lvaTTLWZm7FlP8fk3HdaQNflYW4V0D2d4KKckjs
	wocf7gnuOz3+If/F6dxQWaH+YmmX5F7/aZYZJlxsnrUHDbJo7MFimocsjmV41P2uCd9IQ4ufWYV
	HUMLottzeOFmwkk+iAwBcYtx758ilYPqnwfysuXXptvgRwOWMg3w8fZdmGw==
X-Gm-Gg: AZFdTZcSJUoPOIMEC+wCWs3M1067LUjgDt+CIfqK2WDXcsa49qHxSn4MRFz2yFzA60N
	ma72Uc5wrM5/Rqau4ewwR+LRXwQTgtdlUBgYRkCeuBAirdMHnIZxIxEZcHSLBd1nWvdHyyFYlK+
	CXL1uiTIO8QeXDZlYq2QrGNcA+LHX5g4zN3IuME739VldtlwdIHKy0s1yGAu2kHzH8s+KPvdAz9
	OLwaJP+DeEYi2UAMwQeofiFvjutihkbThEr8vrAL1KuLYy/CSNldxJVZbGk2jzz9z106+99Au8o
	lwmpXpE/VwesrVdtDl+jRR9w3pvNyNv/EWfWPDLUATOROYLa2kG0QyBZKBH1IG67GMhdUMeDQJS
	ZJdCMTQARCzU1Uwe+b15rGJNZloEFYtHF2jJQu3jJEuyTgxDgMd3lUz9tc07X9p658Y6gECVwym
	Nk+3BUod7d7cDtjYeaucNqrqQ49xOK4DqLp1NGpMkhHazk
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr359808605e9.21.1795618361983;
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr359808145e9.21.1795618361518;
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm36682773f8f.59.2026.11.25.06.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
Message-ID: <af9b6e7d-6972-4881-9403-c8af22b449fe@redhat.com>
Date: Wed, 25 Nov 2026 15:52:39 +0100
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
Subject: Re: [PATCH net v3] ptp: vmclock: keep the device state until the last
 file is closed
To: Chad Aldreda <ca@modelmiser.com>,
 Richard Cochran <richardcochran@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119061517.1142436-2-ca@modelmiser.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119061517.1142436-2-ca@modelmiser.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:15, Chad Aldreda wrote:
> vmclock_probe() allocates struct vmclock_state with devm_kzalloc_obj()
> and maps the shared page with devm_memremap(), so both are released
> when the driver is unbound, but an open /dev/vmclockN keeps using them
> through its file state. After an unbind, read() runs on the freed
> struct and reads through the released mapping, and a poll() in
> progress sleeps on a wait queue in the freed struct. KASAN reports a
> slab-use-after-free in vmclock_miscdev_read(). In testing, the same
> read() faulted on the unmapped page once the device had been bound
> again.
> 
> Allocate the state with kzalloc_obj() and map the page with memremap(),
> and release both on the last reference: open() takes a reference and
> release() drops it, and a devm action drops the device's own reference
> after vmclock_remove() has called misc_deregister(). misc_open() calls
> open() with misc_mtx held, and misc_deregister() takes misc_mtx, so
> open() always runs while the device's reference is held.
> 
> vmclock_remove() now marks the device as removed and wakes every waiter
> on the wait queue. A read() or mmap() on a file that is still open fails
> with -ENODEV once it sees the mark. On a device that supports
> notifications, poll() returns EPOLLHUP | EPOLLERR, including a poll()
> that was already waiting; it tests the mark after poll_wait(), so it
> cannot miss the wake-up. The wake-up uses wake_up_interruptible_all(),
> because no later notification will reach a waiter that the remove-time
> wake-up skips, such as a second epoll instance that registered the file
> with EPOLLEXCLUSIVE. Without notifications poll() already returns
> POLLHUP.
> 
> Separately from the report below, the bug was also found by a
> Coccinelle script that reports device nodes in devm-allocated memory,
> posted at
> https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com,
> and reproduced in QEMU 10.2.4 with -device vmclock. There is no access
> to EC2 hardware with this device, so the fix has only been tested in
> QEMU. QEMU's device has no notifications, so the poll() path was tested
> with a local change that lets poll() wait without them.
> 
> Fixes: 205032724226 ("ptp: Add support for the AMZNC10C 'vmclock' device")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/all/178144969601.60470.14493569608271069160@gmail.com/
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
Applied, thanks!

Paolo

