Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820020;
	b=AtSitaC3YIQsIbHIV8TYdxeybrEfsfXKjRS1HP3BGSBMfEP4THupZcFLxkDtx6UAdKnC
	 qDFJKJW9hAZ6lSAKu7SfcbkeQn7+lXHdJKFhY3dUtdHi8cc5Q/p0FWe9hLo7DqU4wxYIy
	 WNo1QGU0DLxC0KyF3OMq0Sga8qI/8bjhA4asDg7tfdrhk00LEx3wQSUwMWz0hnb447+5E
	 LxWRgncBL4QeaSoWHiEyyoUxka9/O9X8fub8rc9oLnVFZf7+BHml9uLYUkcq06Uuatmr3
	 jxLRCUSwP3E/BODbHBYFoWVZHARXnoOz6Tp2jAv71F7j5Q6HGIZp917tdZgdFUa1dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
	b=O17V/+xGj8V8Mj1JC2W1w4G/+Gj0+Yh29MmXHn2ULVwiwUm//Ppnun1yBnk/xPkyHipg
	 cPMteZA9wpONf91EyT5Njj0/4b5xJVkf78lIw0CB9q1Xd2huppvLjZVOsS9pHo2QJ/u/z
	 ptBfI72UfepnMEWezcY5+pODaynSHdSL6doPOcm9/kjSXrWBeFzF0dNMJyjUOitkXhFdn
	 ybhCQ3rjfrfhlFF32N44494FUYZtR1oRGI07d98fRPuAkAonuYnbPr6GMQYLOyNzOqbm9
	 M6e0T5TgueMbRx4Oy2LG+S5k7QAmmc8WJG7ZlPyPRECHBHLVlo8vkS0q2RZAOqPcHeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E4D606A880
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E4D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb76bb36c7so99955e9.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820018; x=1795424818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=DAzVbDoROMuDExMfbuvnxK3ei/jkVt8al+uAvr4lNOIokGBrEO444rzMqWh0q3/iIY
         tFEcJuyGjmeaz0oG20AVeJ3eRs1gNe6Yr05Wquy7BWCPz6y6VbrNrESt2jp6R4TTGPt6
         GKNhbEJR2Js7q4oDE02vFaVtCEM4CRSTXmeoc3Hy1l7b3pwXEgtogazICUxxxmHsIb/V
         Adqxz77ChXrsNZQ0Yh7kqFI7dqKgZSb5C7oczrJpZrMcnwJHNjllH5AJ71p21kh940E3
         f1pQXQJXDhvZZU9/Bo2APo1Yl0TFcArez+faJ2ArKW2cwTAfvYQL/y5XFa/JMVyuOCP1
         JrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820018; x=1795424818;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=qT90+Mgxt4AxHOr6wAMi3jnUTWwqM4V+CH5wWTL14PlBSPjyuPd61UkwzI9gXvOcjq
         We18XT98qejwkLr22ke64diSqN8vWZ1K+Y+hzCP3kqms7IlrOsmNzoZ6Z0ecPEjPl8hQ
         MyahxX2s2CejOpdE1/UVtNFHQ4gz6JGmEMM05s2LTJa2yGUn1h2oRkFfQEcoP5CgK44h
         2KyUoa7aFUOILzG0PFpuOGwX2yVlQsCF/axCQaxYGiFTTJezFpF4tRNCkJ22dIGtOliN
         NYJ8kVVHbJ7aH/3ieKpF5iLP6i8RtZ5aUz9xYQJTyoyz1rmDPCafbQvtd9YUauU775RZ
         5m6Q==
X-Gm-Message-State: APuU4Z/BKR1K8FltCxKAK05l7U5EpX/jlqh1CXzytMvN6kH9OzFXhPOO
	MHEZ/eTIw3Fq/Pyi79X1+3Y/wn4UlvDHHjOIVAq/0zHdn6Pe+KoEpsmx
X-Gm-Gg: AYBFou1n9vAd0Yw+Fr8htdRQiAsT5aULqzWfjZxCZUj3lNzDSH+isxlWtgzqREFb0qB
	o42QOGecrIMT6h+tvrdSkiwXs3dJbuuDWSeOBPAPxu0C/1JfNnUQji29X6qqkuRDR6YI0/ih8AI
	e7iS9u+bmoUdxFRYa9ITnL2398GDqw+7oo4DeGYJ2W/qPB59ax/B4YbTUt+Ye20imUZVoC5gKpm
	FDv3t5Gu6v2slX2y8Fj5g1RNbyCcQrG3MWmE/SZfIIUvGviYiNL2bV5D6SA1OzJEefiK589rWan
	jmqgDJcEj+njckF4zXrvUIZ9K3Sg66YpUSDB78Ps/FdwmB4Ec5e+dIJCUwZc79cyt+kGklCNGdr
	T5CNAE/wAcAv9DDnk9WAQrTDqFoQhf69eVxnlxt6thmm1DvFBLi7U0swyZS1pp4on5uLJlCr6R9
	nyUN8GjeSboxCoUE0UrPp3AVVrJ02F1OOD3oz26bMmXgzM6SIpAXQwNJbymZuERaxgXCiHO3SWD
	tCsUrei/PdMSSzhuefpx8t5jmQUlHdoRRTsChM1iRv4MRO4q7XyxQ+wVCTZgz49w1rkiBm+768h
	3XfZqVCqfzYf1oZ7ul6o5xdYtRvfigjhBrt3hrFbSSxkWpmqvjg+LDyWbDZejYCHLu08Q6mJYC4
	51FvRXpWzHA+37evUyyucDKhpfVxtkVN3QOY2PjUnicruxTWtArPIm8FneJ98s0FKNnqwj8G+mA
	1bewNMmgYzGNVFP/uiQE+rQ9bjKGMpV1fsaV0+7WZaz/FJwtUheLYM
X-Received: by 2002:a05:600c:224b:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb5ad95277mr147508915e9.0.1794820018021;
        Mon, 16 Nov 2026 01:06:58 -0800 (PST)
Received: from ?IPV6:2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad? (dynamic-2a02-3100-5ad0-78fc-2c93-94c5-21ea-75ad.310.pool.telefonica.de. [2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm81554075e9.13.2026.11.16.01.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:06:57 -0800 (PST)
Message-ID: <79f022a7-6f49-4794-9dbe-4774cc50e1f7@gmail.com>
Date: Mon, 16 Nov 2026 10:06:55 +0100
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
Subject: Re: [PATCH net v9 3/4] net: hsr: segment GSO before per-frame
 forwarding
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com, lukma@denx.de,
 fmancera@suse.de, danishanwar@ti.com, richardcochran@gmail.com
References: <20261112153333.20-1-xiexinet@gmail.com>
 <20261112153333.20-4-xiexinet@gmail.com>
 <20261115214108.UmIyEJ8I@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261115214108.UmIyEJ8I@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2026 22:41, Sebastian Andrzej Siewior wrote:
> Should you repost:
> 
> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 9aefc5f0249f6..5e49f2bb9e39b 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -940,11 +940,9 @@ void hsr_forward_input(struct sk_buff *skb, struct hsr_port *port)
>  		goto drop;
>  
>  	consume_skb(skb);
> -	while (segs) {
> -		next = segs->next;
> -		segs->next = NULL;
> +	skb_list_walk_safe(segs, segs, next) {
> +		skb_mark_not_on_list(segs);
>  		hsr_forward_frame(segs, port);
> -		segs = next;
>  	}
>  	return;
>  
> 
> Sebastian
Thanks for the review. I will switch the loop to skb_list_walk_safe()
and skb_mark_not_on_list() if the series needs a repost.

-- 
Xin
