Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431222;
	b=fnKR91JyhX+7+0hDOBmqObxT4T5qPuIS8v2OQNSx3yhR4wzmU79s2KgNDw8uJxilaOZ/
	 6WkKSkNMXwEWd8Lt9m7weuF/K3G0wDBtf9Rob3U2NUOAz7fG+ZOPEjwtHV2IOmTLxSP3D
	 /F89iFZwLxrwzLcvz0Hu4u57eSoSQHlMdzUiAAQkHITanqSCYK4OQ08ZFvkrwuW3kTLci
	 rOGPPcIUnXuUv28njxHG/JJegwOYVVBNdlCRXQCyiY15jxW4+8codyhWCKxkixrwAdUQc
	 OrwsJU4blhIrHUlikgmkZfHN8+Ay8M5KrQvTrX4BnMyUvkeFRQyhy7VWYMj4PEa+LdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1rtPkjvF/UClVzYz4kjqVFAadpbqC7VWOUF1Yq5L8+8=;
	b=GlfGj6EyY+jGGCW1Vh+2aRH4pIEhTX+pYqSwtFV7TZrJBCsS81lP/RmjimS1NKno/mdL
	 OTdtjRNbhi1sz3d50yocn4u330mSUaNaFgkq5snR5U35cKfboPN9I+3/FkzGFGkfrMM4R
	 HuoSooI6BiLlEKi1l1fQlQVBA4C0j4PsS4Pyx6uVaFnuAchwryJ2UKUNQNKO7oUX8B/a3
	 em5mYlt6JzjLi6qi0CDjQR2rxCPb/8jxEWV5VzBnttSHr0obB/2Rquu0Yb29YOTaSe90Q
	 D0lzmchOm5DxdycWD80kQGbY9iT0oN+UXSI2AIJjJo21FQd75+U+kZBbBmDzyPuZuqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=GSRcrtNi;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C2606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=GSRcrtNi
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so207294f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795431220; x=1796036020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1rtPkjvF/UClVzYz4kjqVFAadpbqC7VWOUF1Yq5L8+8=;
        b=GSRcrtNipxfDJZORQ/1cPxOgJkPd0aulpkNyqz01MYVSVser/9pNKNxWaaM4vZO7At
         e3Uai8eyB8N4uIdZSVtO3D8sFR6BbZj2g3PPQHtsCYIYTzXwCyNh+hLAcJ7WGmiFQbbg
         orNheuq8lstudQ2QCgP+meo99XBI0ChxqG+GT82f0poXrU86+NBk7xthCVPhZF6Ju+6i
         yMkwVsFx5VoGMB60UQiXgBgyFZHYNcp8DBVwLHRdEYP3PYLh3xDAE6ScTz1guKv2zfA2
         x2kMvrbTEIVue4m5s5R8dDyUGcl9xOsRgoZI4dwwe7uJbpDsp1+yxgOj8ERlnJfKl4W5
         RngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431220; x=1796036020;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rtPkjvF/UClVzYz4kjqVFAadpbqC7VWOUF1Yq5L8+8=;
        b=VV4PXp9vxmJWWZl943LcaZoSThWwGCCIXVnc82L+lrqVK9XRmrkKU6pjp8HHufAMTZ
         WP7hliWcLgzhJM0zXl8rcIoVQBHf3Wq3dMHFuwUrKzBcPD4fFBv7ioOM9zKN+YuYCQP2
         U0RU7hOqM2xdiHC95qqdpFQMrVbp0nhxkAfrk2HyB0BaN7UAZ8kPQV9bECFcEQlyazWC
         Y1XcKJDqvQZOQO3hx1np0pAP1a2Qh4fMpWfAXPKMtDrSyCnLRmp/LBbirQTftzbzjwfI
         ++stgWWanV5qUuvgb+rBteXFLWc5CypNyE3ixfDs4hG7XdTYZ9eHnVyTSvjyPSoBfD1y
         ZUhg==
X-Forwarded-Encrypted: i=1; AL+hErGzx2VsS6/HuM8avfMS9KOVl40VGC/ZMyNuTiV5YxxwLUo1/Iz3DV260ZE8rBJQq+VrDTVZ8do=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zYjud3F9kTjwx/6Kh4l4ezD+eqXi2RCVU8r608VKOmLuftudY
	mZZrRGt13wDmKS57Rhvyv84Jz8tmpkVtxZeHt1R5VGm5HgVWLp05lRe0tdxoPihgVpQ=
X-Gm-Gg: AZFdTZcipkYZ2QTwkE7r2zpr7eQDZyjrm2z9/WQSFRGiFaG0YDXzYszPY7BK1pB3Txr
	8ckNqcE1+t5J3Rx22fWioSZKZEGw9lb8qja5P/6q/5yNvFxBl/TAjR4TRaU9aQFezT1/aM3jjDn
	vYI5gxtwDfQg8Iiv4b4Alt7GO/V+CtPHEKjY2xO8priJLxf/N+5wU31W6eS0s2TLCQ/0oJkDllL
	8StEv+hcK0GFTnxt9xROM9RWG/fXeRhyhlohU+2A2XJDi7djHaIk8P4JwP0UD9btwaHgpNaHxJe
	gDKSie6N5XKVWsfap0qftQ+p+glarcZUDplI/+3jykD3HNsq4N0YZDRtZBVZOzFIMGg3gzA1pvq
	wC3ZSH8babCXhkakxsmAqyQVXFHVvhs1REmML2a+wzBRxg2P56jRpl/lE3UBCzEm68zMSp+BLwd
	RFLVQxltr/J5fnUvPWV3diXpfGFFqwcgyXCWVNEchEqcwi7OZeT4ZS2R0cr49/Xb/B/YTDsLWwP
	Nv2GA126ZWLfkEWzEwUGYlxQSO/2VR7AWUOotBVNok7aKETA9M1SoUm46DAl4pUkIHO7eQ2hWcT
	gPwCbITU0KrKLHOjW6KQT9jk5oStBIDb1kyGALsDBOKFgGgPG9Wa0K2ue9BiZUcdGNWWgbCnbTi
	ty42vXGo=
X-Received: by 2002:a05:6000:2210:b0:4aa:8fc3:28fc with SMTP id ffacd0b85a97d-4abad0dedc8mr22282207f8f.1.1795431220124;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm21294529f8f.36.2026.11.23.02.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:53:39 -0800 (PST)
Message-ID: <77c1afb5-3a1b-419c-a36d-660c464ad307@6wind.com>
Date: Mon, 23 Nov 2026 11:53:39 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>
References: <20261122002633.584362-1-yuyanghuang@google.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261122002633.584362-1-yuyanghuang@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 22/11/2026 à 01:26, Yuyang Huang a écrit :
> __hw_addr_create() allocates struct netdev_hw_addr with kmalloc() and
> copies only addr_len bytes into ha->addr[MAX_ADDR_LEN], leaving the
> rest uninitialized.
> 
> If dev->addr_len later grows while entries remain (e.g., adding a
> multicast address to a down TAP device with SIOCADDMULTI and then
> switching it to ARPHRD_TUNNEL6 via TUNSETLINK), readers using
> dev->addr_len such as /proc/net/dev_mcast and AF_PACKET
> RTM_GETMULTICAST expose the uninitialized trailing slab bytes, and
> __hw_addr_add_ex() reads them in memcmp().
> 
> Switch __hw_addr_create() to kzalloc() so the unused tail of ha->addr
> is always zero.
> 
> Link: https://lore.kernel.org/netdev/179012275175.2160803.16091441325063775173@kernel.org/
> Signed-off-by: Yuyang Huang <yuyanghuang@google.com>

Henry already starts a thread on this:
https://lore.kernel.org/netdev/20261119040153.158372-1-bsdhenrymartin@gmail.com/

He will probably send a v3.

Regards,
Nicolas

> ---
>  net/core/dev_addr_lists.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index b6f25e487984..ff0815d8f6a8 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -100,7 +100,7 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
>  	alloc_size = sizeof(*ha);
>  	if (alloc_size < L1_CACHE_BYTES)
>  		alloc_size = L1_CACHE_BYTES;
> -	ha = kmalloc(alloc_size, GFP_ATOMIC);
> +	ha = kzalloc(alloc_size, GFP_ATOMIC);
>  	if (!ha)
>  		return NULL;
>  	memcpy(ha->addr, addr, addr_len);

