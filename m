Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700205;
	b=WKIWZ48LTtzgHn57dU0HWTEOC9KekSmcW1SUjL5/JyAtExEHbCxuF+NSwD54eLzToGEr
	 HgM6AENYekYDuA2+6hiXfGXWqe8O7eML+/JGLxOrvu7o7/K567KCaPub0pKFoRGNvwm2N
	 Z+fVz7eMaToOYmGJWHkdYeXzb4LkEw9WU6WA3eEB0f2YCw2ya1I/vjLeJqFmyMFaE0e8h
	 AIxPeKd5FHj3Bgjdt9vrlRR+TBRQOXzzMJEnEReg/2GOLF5peeasCh3ZkSJO2/3dG1cus
	 ot3ZC67wDApwvkIWd7Og/br4eCMg9/6sSckKoqvjrHdF+tafht7vlUDXx+syt146Qhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700205;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fshQ5H++9xpVgnK9VrrbU9Ju4zsh5/KFJATHWaeaVKI=;
	b=1Vp8q/Ae9Ydgfiy6p+RySn3JzV1ImphDHn1NIDa8G2hBmF9alBafj7pHlumBNlW6wLeo
	 G6As85YTKMk1En17bRBYwFev0QDWqUg2UBbzV2qZcLN3GGIIJpKZvcawY448foT8XSGcN
	 +cAPWIsk2xmxvHAs1hwuyOaTohvdDxvO11NzBaaWvNRpYdRwfD2+S7ZE9VV4xCBizsnvV
	 Y5oid1F0Nk2V15Cj0TE2PeuXLUtc5shd4maFvjXfft3vNF0/bXYGv4XsU0t95w5sR+h+D
	 FuR0PnbiNQpH7UctBQwy9jEuxPhWz4v4qDg9OkS5SOGWkL0jgbc900lYBKcDuhYV6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJWAL3DZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eqxBjXrm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F5606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJWAL3DZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eqxBjXrm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795700203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fshQ5H++9xpVgnK9VrrbU9Ju4zsh5/KFJATHWaeaVKI=;
	b=OJWAL3DZAZObLAJ+iVmhDeVYyo8Dt+lG438rhRKUpzc05KxTIpZQHCbS1DxaVUEtv6pZ9F
	NXkLO5FJUUu21J/edUc0z6PffJt1Z7T7TBdPF0eX38Q8Y4VmIar9PH+UdKlYYHPe+NGn1t
	WUWoBErKXa4lqc2iS+KTDd5hVX4K8IY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-e9ec24zOObWdeCR49de6fQ-1; Thu, 26 Nov 2026 13:36:41 +0000
X-MC-Unique: e9ec24zOObWdeCR49de6fQ-1
X-Mimecast-MFC-AGG-ID: e9ec24zOObWdeCR49de6fQ_1795700200
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso59536215e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795700200; x=1796305000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fshQ5H++9xpVgnK9VrrbU9Ju4zsh5/KFJATHWaeaVKI=;
        b=eqxBjXrmrEDjFh+3RvPCBs/6oLZDfX8C2FWHpIkQ4iX2sCic9o413WCzt8lzbc2aih
         kEGT6DBhpXl+UrmoRs0DxC1cZ0MASm95OxyANzPuU154cVGOUD1ZqHXQO2CG2dk+1PkV
         1FJf44VqHqxy1BEa5/v7MfAwaGhkO24O7YgMXbPUaoasuL0gFkw+FWuMrQhpjqtaKyGg
         U/+L2QXuvtT3vNvY/YdYvp8EZiinoIol7ufAmjRq8q+yzjuTSdaP8ebch8vh+7olYuS+
         e8pmgwhZ7HPhJW8R/fifS/5/GyBQiK6exPbZNXgqX+/oyLlS0uCip1+rysDyt0JHJS66
         mJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700200; x=1796305000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fshQ5H++9xpVgnK9VrrbU9Ju4zsh5/KFJATHWaeaVKI=;
        b=1lF7La3G9p3IM15VY4i69V+jMacS3jDhozprWRZDhjHpTkGu9IeMOkn1008KIjx3Cu
         54Ghk8S6pcqEwEoRvvc/oJlSuywHh8jZKPC+xEh6UJxmKzb8efZ5lRnNbe78w7t1WIq2
         ZYdVjVaXHIxENuSXlG8aQ4ZFSdpoIIpEKwreYytRmvvPRBPCDVNIueOWFc17NivnGDrX
         yprxUUFxmbEvGVHTEJ6a+mcFvREG78bo0lTUX9KmVjrAiE/WJD8cSYlnYW0xB/Ufs3xO
         4qGmGuNrYoK3ZGstrKgu9qzuUs+yrGfeIgXRrkTU4ZDIeDzGEWUxPTgOegBt7Wns3b7M
         taCw==
X-Forwarded-Encrypted: i=1; AL+hErHcTzn0m2gJeXLPRwfDlCHMr50nq2YQL6Am7Z1skO2aIYE+cNMoUE0POTOnRQPEeWlDVg9bzfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UvUgacF08PPhGe6yuy0x0NXuJ7sSr5cz+7bURwSwu6gnFf9dC
	auLPK56zk2fBuapCz6RNdjtanA+zOIzIBCplArZ47rfJiY9NR8SBvPBv5x0O6Er2lbR8Ojub+Vs
	JTnQ9QewqVNRDiU8ZcB++aIM4nHjd6o7MuluqhkhA3UO8RSqxDjhe4QLrdw==
X-Gm-Gg: AZFdTZeYkustH8t0SFXkEoCM0bZCGjsIdGZUUaQLhqoMX+i2b2UVinMgzBcVk5YySSq
	UB1w7bUxGbbR8GwtR6qmUIZhIerOwKf70L7z+djjUzsQLxs0120PwmzBOWR9EwG+nto2lufg7Ix
	rVkSZn0YDBit41c31FfyYjY5ICE8pf0r817UlJxfRrZCo9Lk9HwNAAtMiNTQg00GRvm8oEREckC
	UrZOURb/EpOLZhYkkJD6XjTUO/7KqJMMjI1hQgcHoEqZg2iEjmIINUVty58HyOGDCKzpadtfLdd
	xESm2a9E9I2tWyO9X0g3gfh6/BxK7GV9slrC4XeSDqF7LsWatwFTbuWpjYumT0jIp4Mf/GHpQjt
	Q4pb0/FxCBeKMzaW4Y8fjPM9P9FJyuIUYnn7WoMnu2gjmLZJKbciaibYy/lpzWlfXyjkcYlhchd
	lNmYGsKiNqsSrt0tjkqs012JSzYrk8grSkeQMI2Brj6A0x
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr424078175e9.0.1795700200372;
        Thu, 26 Nov 2026 05:36:40 -0800 (PST)
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr424077645e9.0.1795700199939;
        Thu, 26 Nov 2026 05:36:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm590393965e9.10.2026.11.26.05.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:36:39 -0800 (PST)
Message-ID: <87c0af53-95f1-485e-bb5f-00db3a9d3d43@redhat.com>
Date: Thu, 26 Nov 2026 14:36:38 +0100
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
Subject: Re: [PATCH net-next,v2 00/15] Netfilter updates for net-next
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, kuba@kernel.org, edumazet@kernel.org,
 horms@kernel.org, fw@strlen.de, ja@ssi.bg
References: <20261123135726.3940688-1-pablo@netfilter.org>
 <8e69f35e-73fb-4558-910b-45f5e723c64a@redhat.com>
 <awWSHujeBmMMOonS@chamomile>
 <f0a3c071-0142-4c62-b74b-ffff8121c8d9@redhat.com>
 <awgOALX8V2RXY-uH@chamomile>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awgOALX8V2RXY-uH@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 11:46, Pablo Neira Ayuso wrote:
> I am preparing a v3.
> 
> I will make a few changes to address some of the comments that
> clashiko.
> 
> My plan is to keep the ipset rhashtable in place, I think some of the
> relevant comments in the reports can be addressed by follow up
> patches.
> 
> Let me know if that approach works for you.
FWM, please go ahead.

Thanks,

Paolo

