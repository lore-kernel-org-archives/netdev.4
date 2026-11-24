Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543038;
	b=BSvodUdB1itoEpfgp7c2ZB48LO7Nv6LOYI02V3FGm3t6PoPi+xs5kwSVqk8Itmvb5uWp
	 RX9Oh0xlMzVGEvr6R/t44j9FfBvgjIN/n9vN7nKUMJkRo3lQhJdS2mloLOd8qSFjzNaDy
	 GKqqBa82uSNDP1yTdk/N71kzcds9uFU65UADkY49oIPUwoQ26QbP9RTwdhL4xsmBqw1TK
	 xe68m6xkRwW0ZRcUA09XGWFpXM5+hpoF4zfiS+khFUHX1CtLt19oALslWz3nNvD6JnWni
	 gxJ9MilF1X8EQB3sU4JegvWk2dGUP0IohtWY+FVeG/ZJnkDl8DHMUn0NAeWQoX0xm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FtUnurMOW2+TFB7Hpkza8GTT88gSQvH6yzISCJsSoC0=;
	b=QgHrA+C2yweuaElL8yG9gvJxJBmUz1g0VTJHvwRAQkuhiOycUtWNej8zvpR8vfj1nYqv
	 fsdPSdQztFDSoQkre7FPkHNDTsbk3l8H+e369Y/SkiIG55oZSlHvCw6yczNgsdsf9uzi5
	 jKhx7HOW1saK/epwdw6VatsJMUWHlMZoUOa5qdbMoSULfPjd0kV5Y5LP5UCBrcIB7U9K5
	 zhGkO73SEBAxeHpsoA/7wra8ETQIRH0IOs8w5qBjxPJx1A1Msl5wwRdLgSY0fYWnblPha
	 tbz6OmQoz5Bq2uKw7dXWyQt9H0hTk+E3XWy328WFmiawgCaD3Cie5h+QjRcm7meL2jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=CgUl7irA;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D5606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7D5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=CgUl7irA
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-845788309b4so2329037a34.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1795543036; x=1796147836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtUnurMOW2+TFB7Hpkza8GTT88gSQvH6yzISCJsSoC0=;
        b=CgUl7irABDunpx8pZY5vhIddrfLurYb8dfe7uRcio+rp2rOWzJzpoJNUd8Yp5GM9d3
         9MBvOQzKwROSuJndw3qhM3WbxQx24kWyTaTglOoGzEPJGkQ5JxrCBlqrjd8E9NsJWnTs
         IG1U92XTmcGMgZHA8G153NY1nAbc8qoWQ4Th8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543036; x=1796147836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtUnurMOW2+TFB7Hpkza8GTT88gSQvH6yzISCJsSoC0=;
        b=PrB9mW5wvWnjJQvSqA5LAZeXRgmdvzevcxH//m4G2u0Ai3kWgZMrGG51LePniC42GD
         SVezD8dIv3kLrCHHubdrir1W2akgUH8dXB/P1MZuHVjAiDuonREgOdBGZ5AMPACFUVrr
         mGpO7ft91gE6usWGy4lIhKR3UlC42aUV/Umr3x5uupgnPmbvXnQxhfiTbmrEp9Fklu4a
         RjHRU99DVxjWX8+znzStOGrK0p13+H6i2fhlkblho9B6UYkKrjbEh911layyBDaGkwEc
         ZzpFZFp0tFsZe3sh3/Ut7T3LqQfGGAq3qNtAP9jhgT1RDZWeAFbTZOl/i5x3oluJK8aU
         butg==
X-Forwarded-Encrypted: i=1; AL+hErEq8Orzw7GnA3w3ZaFMJQhBp1PdK3vX8blJbe8i0mE7G2ZZAUVcGulhWR6sB02HPoCwRWYJe8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VgygcanMW/G+yhPq451A3MW6ONDvJyO79PD7FDsVZX3ikXOKv
	0HQqMPMkSMrxPkWyfK0o+2Lh1EPQoNewUEEs2Fvh8uAdqCfPRWddesaPU7UbnomMKw==
X-Gm-Gg: AZFdTZfYOldKxHHMb6YbDXhyFykQSQ5IDHWZwm/r4ryamCV76K82PkPsq7D99t/GFJh
	1QfXjyHtmE3K6WLCzAbuYIoMhLw+LCpC3GihqpJFSRQ0NOxcXTH+61zDb5vwPT9vKN9rMSqXTtO
	tefebYTrrepmflmrK2dKkjSnN+nQSnVcArdzWPh4fdNqbHI76AsC6c/8uJ71gP8bPT/xEGLwIRz
	1Fvau8UkP8hxklbq07QscPJhrNqbFiJxkncsnhSfT3q5A2EMiMQ/9CIW90le/h9cKebA8wyTyFT
	S3mzvvuUx9D24GuxJr3H5zoLzsilYY6kNxI8B0eshGkVuuQSAPNZnS8YOG9UEhCo/B5e6u90WSR
	fgmBqqQ61NDt4kdanGOR71myXDyIVAKR+aSdkABfI8XbRgmwbpwVdcXaRiz82Vs5upw7w5Uh4C9
	cUkNbfxaDUU1rZ+3VCfwjr4QUSL50IThA8IPtmAMnYg1KdXEyCah5bfFdJJXiDt9GsSjJSjHzaM
	EU7uHZ+RbwpEP5Ik8uzcAhRhX2JPQop5uETZXu4F4tg5SIyUEtBJBDYGAYBUMRQHvnFeIRJ9j1t
	emFPtw3r/Z7goMksfiGITb9wqEs=
X-Received: by 2002:a05:6830:4ac3:b0:862:bb04:b557 with SMTP id 46e09a7af769-863158f0eb3mr21786402a34.8.1795543035893;
        Tue, 24 Nov 2026 09:57:15 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-863168f6d9asm11958707a34.17.2026.11.24.09.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:57:15 -0800 (PST)
Message-ID: <91234e5b-6684-4acb-91b3-be8ab11ac032@ieee.org>
Date: Tue, 24 Nov 2026 11:57:14 -0600
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
Subject: Re: [PATCH net-next 1/6] net: ipa: remove ethernet-specific artifacts
 from modem netdev setup
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, elder@kernel.org,
 Willem de Bruijn <willemb@google.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
 <20261124170551.1874487-2-willemdebruijn.kernel@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261124170551.1874487-2-willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 11:05 AM, Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> Commit 75944b040bbc ("net: ipa: open-code ether_setup()") open-coded
> ether_setup(), including fields that do not apply to this headerless
> ARPHRD_RAWIP device:
> 
> - min_header_len = ETH_HLEN, while hard_header_len is 0
> - an Ethernet broadcast address, while addr_len is 0
> - clearing IFF_BROADCAST | IFF_MULTICAST, which are never set
> 
> Remove these and the now unused etherdevice.h include.
> 
> With min_header_len left at 0, the device behaves like other headerless
> devices (such as tun and rmnet) in af_packet's vlan_get_tci(), where
> min_header_len == hard_header_len instead of returning early on the
> mismatch. Normal IPA traffic uses ETH_P_MAP rather than a VLAN
> ethertype, so it is unaffected.
> 
> Cc: Alex Elder <elder@kernel.org>
> Signed-off-by: Willem de Bruijn <willemb@google.com>

This looks pretty reasonable to me.  The "don't open-code"
change was meant to avoid duplicate code.  All the assignments
were preserved, but I didn't fully understand how these fields
were used.

For now I'll just ack this.  If I manage to get my system up
to test this, I'll do that and provide a Reviewed-by, but I'm
not sure I'll get to that soon.

Acked-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/net/ipa/ipa_modem.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
> index d84c1dbd3b1a..e8392d9d3a4f 100644
> --- a/drivers/net/ipa/ipa_modem.c
> +++ b/drivers/net/ipa/ipa_modem.c
> @@ -5,7 +5,6 @@
>    */
>   
>   #include <linux/errno.h>
> -#include <linux/etherdevice.h>
>   #include <linux/if_arp.h>
>   #include <linux/if_rmnet.h>
>   #include <linux/netdevice.h>
> @@ -223,15 +222,12 @@ static void ipa_modem_netdev_setup(struct net_device *netdev)
>   	netdev->header_ops = NULL;
>   	netdev->type = ARPHRD_RAWIP;
>   	netdev->hard_header_len = 0;
> -	netdev->min_header_len = ETH_HLEN;
>   	netdev->min_mtu = ETH_MIN_MTU;
>   	netdev->max_mtu = IPA_MTU;
>   	netdev->mtu = netdev->max_mtu;
>   	netdev->addr_len = 0;
>   	netdev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
> -	netdev->flags &= ~(IFF_BROADCAST | IFF_MULTICAST);
>   	netdev->priv_flags |= IFF_TX_SKB_SHARING;
> -	eth_broadcast_addr(netdev->broadcast);
>   
>   	/* The endpoint is configured for QMAP */
>   	netdev->needed_headroom = sizeof(struct rmnet_map_header);

