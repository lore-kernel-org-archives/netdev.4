Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926417;
	b=eFEaMhdCzAP/XwvKVxbZZrEUhAExz/U8y4+i4owsXLIYdoZhEAMRnKc3YL/joQd8eDH4
	 d/PZPtAtYkYvSWz8I0J9xisAgv8CXK9TVWWHOIg/E7zZm8BF4UmaRXzOZ0gN0xSswT6/y
	 9e048MOYehXpvDXNWW9H9GNF1MbZouTpVEIeAYCDz2n4fUtsbxrN6vDCDyRTKdwvFJAD2
	 mFLzU0WwPtgI8qp+qXtVmPI2dm/vawdqj13DmtNzo9jdgVBS9Ex6SaQx8PwB8oQ8t9azP
	 egTanTDdfyQEKvXYV+Y0BnzoN6rH8nfJfM7m0CZ4+eLJTTIs9309AAh7ffl9LPPqauA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926417;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=Vk00xk7mW4mUnNzIbmkCcJTQ9n9uxWDzCdXTAZDq96cj+XHi9VJAj7T5mh/F1bhIa8VX
	 tkdfQTEVuzKpqXIB4Vmdfri63DKZ5mBvMoaDNHaZ/59G59rwLoLU3Ay1OYPeGPxoegxqs
	 X6wgDujjUY9V3b0Vd4lNRS6snt1OEwtgq9XeJHJvAKkh/7m4rwNNZAng4ZdjijZV4Gvfy
	 oOHo6xXOB0t7wGa5vF6og1spsKuq39iOdTG+9yqSIH9OdtyKGDi++FRqtjDFydGdHptSV
	 BgvXcYI5FDsXSLOqsbvRpR83mpwXF3us9y7qK67D/q+r01ubGy+u1GDubBdQ8rcGOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC5606A88B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CC5606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794926415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=ikRUpuw3SHfwGjCTFkYXmu4LQeRpKQAZmdaGtJgDrW5Y55YaC8uHRpuuGKfukJBzBFLTXd
	+vTi5ltcLG54GndvlGPHc3pjDyQv/RcHFr2Xu6RCyfnH0RVx3WCXZ4nAIpkpdwFeDcpHs5
	rMlxW9/bZD1pB35VkG4LtjPGZUoVh74=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-8AIdrAKZMLaQ1-fEVE9WlA-1; Tue, 17 Nov 2026 09:40:14 -0500
X-MC-Unique: 8AIdrAKZMLaQ1-fEVE9WlA-1
X-Mimecast-MFC-AGG-ID: 8AIdrAKZMLaQ1-fEVE9WlA_1794926413
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so2871683f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794926413; x=1795531213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=KmuUQcvXzVjZQyZDZZvXMNioNvXP5M7fIQoXHOaFe+0VLzFz9+mxgzWW82n5Se284g
         ySawX145ISXbOmT1JqS4JJacBlW6My2C6KtdDkK763PjkErXpXi5eRGQs+L2NKPrjQSm
         tVB+tGdsEfCuiv+v8g9KOUONZnLVfiOl50Rj9RXOJsR8XJyvNckWYBuuWt84ULbqx6wK
         9qtW4UKTfs10xwRWzZWiqYijFEggZ856Vv4+j0Ux7kQz+qufE3TncYQbNi1WGtxTn6dI
         8KCCjwZ/FOfMh//xH72/zUP9vZlurT35IMM10M9GOAvJ9uZzHlteXI3SoCm1Tp7Mu2cz
         YM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926413; x=1795531213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=ZieSvsxDh9Q/Q4mX/2KG0rnIlIdwOnbi2uAaLHwlYaLMtwEuHRUA3/yI/c+0iGk2pp
         t8fZFc1IPoGusbPbPCB2T96JhDwyXj6TH33h7ufFc1sKyHasJ7SBHwdRUcA0kwzFqpbR
         XIao6mwO7VEH0tC2ZYMnczmtYncYV30B91WR9TYvKOL/Vi7/Me2ojIZH8M4PlQE7uelC
         wTB2KDVSLaz3YLPMVow87B2GYDWA/vxKCYmpvVthrS49tKjDUZ61a5cY16e0lJbUZsyH
         HHY+0XWES9icZHCjsh/6JDVosHgclndJSclWryWAqfhyn85wjsFMQYV+eEAOTQVAh8Ki
         FOwg==
X-Forwarded-Encrypted: i=1; AL+hErGPU94/Ql0chJvreUdC9/yKfN3VUwk9TL9Ejv61OtUym1kE9DEp2G9QUEyuNfF8FFUzRh1HNMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6hpG+fhMcgqwo5mt6lE8PO0BVMq2xQZLhAqP/R9dzQXGMor00
	yXH/dWuWs5+eQl0/gLKymL+8g4OsvNZAbr8qTXXlFIyxJEu5njJ2oFU7s9NHSxsxaA9sxq2zx3+
	+3aEnn0oD0Xlu64ZzdGy34wPWCAOKrxStjFU1PExEpYQ8mNmojDQnRT2Flw==
X-Gm-Gg: AZFdTZdlyTv/CFkz+Ta0CGmYx1RSMZjjRlPzTMeqzaQMvPiEQ6+gYhzHyOaXqBSHwMg
	0jOmUZ10dSqe9sSK9NbjqNWCLxfjhaAFdfV8rTbY55kDvXsh95q8hZblzntVTgf8oguBm9oGobE
	CpOfZP/el72HU61YS18HeEWTjJepOqbJx9Rya6TUxck+8ugETIij6JLNEZFt2JtdYrNFsOv1MED
	mHdNwrMf2tDUVt2f4AHLWDAwqui/30W34NX/Z+cfGlvyVGvD0Htnz8FrTMvakMJe8lxAiJpDwVP
	E6ovn4g+c3yg0PFmYQjN5y/0iqZVnoPv+O86holV7JZ/fyZ4aBKMxMiJzGQoJ+68Bt5eWBmEWX7
	BmqAD4JaBCDuAQoQhDkRkkLhxvqjUOoAC//il1Mj/8WXNAjQAnL2VxtrCI4XrtT2ziPy/mcQ7Ki
	3fxo1TljYMWTKHXvQXCmJuEhBM0L2pZ0KHtNRGdOgHPSpk
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841220f8f.15.1794926412761;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841148f8f.15.1794926412365;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm23870977f8f.20.2026.11.17.06.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:40:11 -0800 (PST)
Message-ID: <10582a05-322c-4fe7-b1aa-b3d8a61fa07d@redhat.com>
Date: Tue, 17 Nov 2026 15:40:10 +0100
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
Subject: Re: [PATCH net-next v3 4/6] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Dragos Tatulea <dtatulea@nvidia.com>
References: <20261115022607.348112-1-almasrymina@google.com>
 <20261115022607.348112-5-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115022607.348112-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 03:26, Mina Almasry wrote:
> @@ -252,21 +254,18 @@ void net_devmem_dev_unregister(struct net_device *dev)
>   
>   	xa_lock(&net_devmem_dmabuf_bindings);
>   	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> -				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		if (READ_ONCE(binding->bind_dev) == dev) {
>   			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>   					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
> +				WRITE_ONCE(binding->bind_dev, NULL);
>   		}
> +		if (READ_ONCE(binding->map_dev) != dev)
> +			continue;
>   
> +		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +				NET_DEVMEM_BINDING_LIVE);
>   		xa_unlock(&net_devmem_dmabuf_bindings);

Clashiko note here a synchronize_rcu()/synchronize_net() may be needed:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115022607.348112-1-almasrymina@google.com

even if the lack of it is not catastrophic. Sounded quite
convincing to me.

/P


