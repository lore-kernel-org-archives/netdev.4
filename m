Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699900;
	b=BmYgqlCSk/AXQR622lMcfderxLDn/EJRADiVA15LPBnxQoE+5smSwVJGwQsoZGbaIgtk
	 626a6c1QyAoKUCb9xx4ZL2j5jR2DrLpeeHFq3jhTnaRClf3Io5Jegdpq5UfW+5DoKCr0R
	 QUMw2b1CEcP2XAUlJfMn0PFCXBDCWpNEFLXaKuv3NVQxqS83WIxRQWAOka8RE7/o12d8Q
	 wWx7TfU0kVfetmfLsS4kMMPmu5+Qr3w2SgeTvGmz96+kRfpwltoXh947TTQ6u3NYp/fZ5
	 kwaa0GJalfGk5cktZ73gTk9ubdevw4FCChgrDCB7jRD/k+kxD1vNdKcxmpyCX3cVdhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
	b=hFUq08PLuDBDjyzPXSVfQluJuDVuU0elbEw1XJPsSh6t2VD4OaMBSalhmD5KFRQNXOY+
	 sYdSuPdsjjnhWDR5J8j/4vJ18beu9SfG+Hoha6zwLBgRoH56EkB3dfRD/P/Lo2JaVNwKr
	 I0ZxN/0m/CqGyJWJbA3n3Qrj9f2iD8otXGl6GGUFmyI7Q5vQHE4eRNbkyNJMERDks2Z6V
	 83im/8xPJAJxLyAoR2kFL88RBEiLhcxcBmbj02lHyqs8F28Ch4OeVjL1/vJiK9xxUUlvo
	 IsnqdYmpSBqHB06t855IJ/Vj8oD9J7irUgc+llGKp/pl4jxI9pUXUWszu2ZtTY/Nfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqzZOUKt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11C606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B11C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqzZOUKt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so4277489f8f.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699898; x=1796304698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
        b=YqzZOUKthL2sjZ0VADdk+MXwXhyPWPDzMfSAXdGlb3l71Lfg72EADy8PEATUOzNoiD
         sPHy+ho/QxQnPQDT0hCic8bkWk7y1+IafJv/2/IOJjfWi+AhbaP7gKOsAZrVP+erIpmz
         3+W77ivY9gUH1TrdPs9QPbOu1Wp2KGMCejhgrsIxjsXjh28lbl9bEfwKXBY8YtJRgLhh
         iLIfdMZuCcSPV8FnQHanTyswjh9wMsP66GM4bCQKyQk7ppAMIXcsv18fZ7q5I6wR+L/g
         ssLWa5zrwSCaUPXzea/6mCcBnCNKQPNV91tfHCdOL1Elix6AOs6SJNMx9gTn8iM0xZmn
         UB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699898; x=1796304698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
        b=C8wfgBBMpMAfiGV5KA5MAqvyTfSz71hGHIxt7nCgIML7bt9c2Tuw4hn7p4hp67zuvO
         SnQGJQQhKTTgDwIP6CpYYoIxeng2Q8kQCb3ifixR+T9Gb92mHozKCgAPnygkTsoeRRKg
         fkAdZNOMs7a15MHMsWYQ+KhvWpP1rEJpdKwesFoCfI0wfJsPjMMGiH0rxJUPqjGo600z
         XvcmQvZey4NKgBGz0R5aQuQ7Kmc5vkMzcav5/EhbHMOxozHxQYDy8AE0qEU1uOsRfgo5
         5q6iPqH0hDL3tWeaPRlzW/P18dQITbu4kp4o6h6Q9YPRTSSZKRBKH7hoj3cjxeT79OIU
         0vaw==
X-Gm-Message-State: APuU4Z+BlJjluHalWQ/WnvogSA+1VbASOlZDnh2AlHptBhPUxY1zoPxN
	F1jh62KWsAgMfXoQY/YqtdqwzumBGDJK3dtCm2/HEwKeR+FZolVQM9ek+gVurg==
X-Gm-Gg: AZFdTZf0Z/Oqil47bEjrwF15afoMCV6lvTbSp4yMb0uUsQ/U1ZJ+IqP5H4rKb9vlk5h
	4lBSIUwpmDLWzzOKwyo/wtni+Vd5Endhe/PfJGJafDGdO+knwtcGqfaXs30qma70iZJWE/h8TS6
	j21R/Sj6nVCHDLIIUWEEXmhgld+WeMLtup8WzS1NLaG3O3UMuaR5FNthIKSl41ibUK6Dhz3X6mA
	leOeJVJm7MfOqrvmPnLyrWw08TInia+/PaOUIfpaGqxh7lIo4gzEay18eQZI2zwi3+J8Epx9Npy
	qBeeQsYM9weQhdCY0G9cAJQlwm+nAvQIenDtyOF6wppnuAntIxjVs5jDNvliSjz90gb/C3NbmkP
	2SAi5LFPPjHIo/Hu9+CftUGEbbfJ0RmtmQ2L6JU8KDWzSi2nncR7kp+ZGaPA259nlI4KsmCv2Dh
	FhBXelBz3KNpsiVosLQ6oYx0U23GBAW2D/oKfeBzbOwRBjY0nNwZyybGAJr6NUp+OJOw8cL1DSF
	AClPPs53pEfiOTJqgEyNGlCqkgZX2w73GtwhW2Ov5Muo+EG1sG2ozQKRhr01BEReND+hsKtsX74
	EounjpJYV0nNVcjVhua+/58Ixnoj1NMQ0bUTNSlvFuL4LMGTekpYBuZsZSNPV+QKFRFvriXaPbV
	autnozWvF75s6tzw8CIX64Xchj2WcFAAS03O0VwmFOF5R93ml2yR3GrN1Mvs=
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr47012360f8f.51.1795699897829;
        Thu, 26 Nov 2026 05:31:37 -0800 (PST)
Received: from [10.54.182.141] (82-132-213-247.dab.02.net. [82.132.213.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm41778008f8f.2.2026.11.26.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:31:37 -0800 (PST)
Message-ID: <e7655061-2b71-439d-a933-09fa54fa96c3@gmail.com>
Date: Thu, 26 Nov 2026 13:31:32 +0000
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
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH io_uring] io_uring/zcrx: don't sync for cpu dma-bufs
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <2cf944dd571364e249af5fefcab07bc670bce842.1793623006.git.asml.silence@gmail.com>
 <1a338198-527e-418c-9e0f-2b619ea84e71@kernel.dk>
Content-Language: en-US
In-Reply-To: <1a338198-527e-418c-9e0f-2b619ea84e71@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 16:14, Jens Axboe wrote:
> On 11/3/26 5:11 PM, Pavel Begunkov wrote:
>> dma-bufs follow different from normal memory rules, we don't need to
>> sync it for the user. If the user space wants to directly access it, it
>> should use proper primitives like DMA_BUF_IOCTL_SYNC.
>>
>> Fixes: a5c98e9424573 ("io_uring/zcrx: dmabuf backed zerocopy receive")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
>>   io_uring/zcrx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
>> index 6d7abb1636e7..17e554bb774f 100644
>> --- a/io_uring/zcrx.c
>> +++ b/io_uring/zcrx.c
>> @@ -1425,6 +1425,8 @@ static int io_pp_zc_init(struct page_pool *pp)
>>   	if (pp->p.dma_dir != DMA_FROM_DEVICE)
>>   		return -EOPNOTSUPP;
>>   
>> +	if (!ifq->kern_readable)
>> +		pp->dma_sync_for_cpu = false;
> 
> Should this clear ->dma_sync as well for this? That'd bring it
> closer to what devmem does.

It can as well be that, but IIRC it needs some extra apart from
just setting the flag. I'll resend.

-- 
Pavel Begunkov

