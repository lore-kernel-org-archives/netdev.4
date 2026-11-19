Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119044;
	b=t4nZuONiag36PF2ZNI50l09FJcE67S4u+o0Sz7XNABX1QuLpnGA3Jyx4xcr1255nHlpg
	 7Ifp7dywbDDTCoHsQ21+2c6qbJbHIYxX9hBrvRp6zrLLaqogT8lZrwgGvHdrvFgfzZtce
	 SUccH8/4RQ9Czsp8xFAeFyxbK5oy7v4L2m9SnSTW9A+yBTAYaN+eQnnri2l23iJ4YyhJz
	 rAMR/kGswAiYmz6HFiNV04DdNncq0DjaCoYqqJDXRIkWONuYxKcyn4z7HQgwU0LLMc/nO
	 UIG1MiZz8IwslTtXJjhUMtJ2pGtAH1ibA8GOekC9UVQSEvjN/2ms7ibpmhFpl/qfuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
	b=Yo/OXm+B3VkVyYEiwmUIY0z3KU3UxPRoAggpV5+wHDE5CUjhSkSAqVlCcfHUg2kSkm6D
	 xm8AWDPHsXLxamnDGyysW9wF5CSCv0FJ/HJxVaLVD+Tr018NgW5I/ShlrWr7TPS+3vCZA
	 c2mDESMY4NdQE8l7gwZk4IS4UYrhFMGIN0TyD0hfVkYCYl0OCsIDOVE6LUVlSyheAizCY
	 yvvYargNrxqL9F/Zwi1Ja0BHZ717xfUE0kSnL8ILLJ8xPjuzKpquZZeHNYmmg2lO8f8OJ
	 EOcD4kRiIfAmeRQ5+Q5j/LL7i37lUrzrZH+h5kQgFvPYU2bECQru4GMAMkjDnRYYl0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0064606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0064606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbOGqzl4
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b315dd057bso1192197b3.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119043; x=1795723843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=jbOGqzl4pjTZnlX9CRqhGTwl7IvLx/HCGiF2R1smwd3C1xS/q5+8W6IuVixt3ofp/H
         UcDRPhnfi9vbdbCkAwL2L6B2GgmVewmfYsZXHz4rNAtL3nftLQnKP3S9AEk0k7oLIwED
         WkJLrVbc9mqKig8z//TLZvj4mk9v4eST7U+mBQKCykkKMy2zUfGyWk8m5DQlvPm8o6v2
         YaWg39KQF8X77inqQxHzMloUyf52HDB2HfTAnPXdu+rrErMGNxVat7iZ/qXNL5hj7sax
         DOLdkN/yHC/Ygm2ZtiQstlDpDGfBI2Wou+P5h5w/7Tv+ma5YWs70v4mbBxdENHUpD3xg
         MJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119043; x=1795723843;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4STxJw8apfsXksn2vhnIZYq3Je/j7gzJU23OLBgCVCw=;
        b=EvyLVc3MiZtfr18QbO7RkThYASOSvlQOHK+TU4G1lQmx7pegF5M8yjBPkWzdwI2uZi
         qzg0rPbfW9BxX/BAdCLoojWC8W3B7QiLB/u2c2JLOmxapO/Km3aKEGSrT0kNJ37Ey1XH
         /mFaloHzEsKGI7jCe6zp+C2TSn1fsNiMaJxM0U8AFyC94yM7I8BLt7L8XVyaeOm1gPWy
         6AvtEpK2YeTIDrn8uklDNdILaEu1mvbEbsIGyKSl8pvdd70p21rf5AyeQGM8fckkLolc
         ZXTp4Pz9zDYGDtjHkLyJipANjNUcQsQ+ywH4WmZlb6wW//3FQVHehToC4rIxqRfgkQ7f
         gMCA==
X-Forwarded-Encrypted: i=1; AL+hErFSHQ6TeYYrVtmzyi2ZhpH0si0Wztk/UqIe3b0BcDYInHvudHzQIrYAtxKXuS0ABEv52sK8zG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r1+dYwN/uS8AmYKud3IpKc/sBt11lwVAiHaAdLYL8W5XGFNTq
	ao+P64QD1eXESlZYmUFMW2li/DcE0eqUC9Ha73DXDw2PIIO4ayZR5Dhv
X-Gm-Gg: AZFdTZd1gvoSZsOT40F0rAKXtbAOEGRtaIN7ixQwLmlHl68FU2eKPBOhMrNIumuvedx
	G3M/fgZQm9iPC0bn4ry/oD/Usx51WidRaVQhPCoWBiIQiVvoOPaaio4bKUVfSC/kLpzOkWHFd+0
	XVGrkk48SUPFzQCxEdSLDO7qvNXCO/wS/vV9IGzoYjiwb8GRasqKGB0CHNnCTL1Va7SX01bWfKS
	c83xtsxf2xts6HuQqJHcIHR3tI+wScO51lfcOmMdw80JgGR3I0LGDJH/6sBtRBLqmS4gAWhYxz7
	4G1Gw/YPCJXMvg4K0wPcazv2uRynczCdEvFIByQ0tUNey4uJwVFklxjfcP+I0BI5HA0nipvFWih
	+tKUKKxiVCVfa1H/UBKsOVTfysO2m9rdydD4Fed9KgBlAuCe7RyufgKlvfij4pEOvtJkqkob+RS
	3zgHYBYhbJoh7gqBaWxabf7r9cy0tSQYnFGFqpaJrhqd8TuRiVvRd86cU+8VYJybcDiDXg5iWPg
	/+ejNnc1s86mI3heOIlE2nF9tPl5+HdNwvNoBO2c9cWtoAIhxKiaRHmW32C5Vlss+dSZOr317vp
	Qe3VNwPrpLHvBWbb2M+SDMxVWT8KdtIVJPKutcgBirmcpA7EvUE+r9q3gK5iwlWwuMSzAYgeNmd
	vn6ZJgkCh7fWN0fTk5bBLpi7nSNxAsICCSlbToxljC7C38XojOpTANLe1EeOa/tyI4VCa4S/oZ/
	eERdPbU0uH3g==
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr5285257b3.14.1795119042818;
        Thu, 19 Nov 2026 12:10:42 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5c1sm4973157b3.3.2026.11.19.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:41 -0800 (PST)
Date: Thu, 19 Nov 2026 15:10:41 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2124e819195d3@gmail.com>
In-Reply-To: <20261119144241.360238-2-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-2-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping
 header padding
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> __tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
> advancing past the configured virtio header padding. With a 512-byte
> header and a 14-byte Ethernet frame, hdr_len=256 passes because the
> iterator still includes header padding. After the advance, only
> 14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
> linear skb area larger than the frame and transmit uncopied bytes.
> 
> Advance past the padding before comparing hdr_len with the remaining
> payload. Both callers return immediately on error and discard their
> iterator, so the cursor position on -EINVAL is not observable by them.
> 
> The problem was identified during review of the tap zero-copy fix and
> reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
> produced a 256-byte frame on both tun and tap. After the change, both
> drivers reject that input with -EINVAL. The new tun and tap selftests
> pass on the patched kernel.
> 

If respinning, please state explicitly that this restores existing
pre 6.15 behavior.

> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
> Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com> 

> ---
>  drivers/net/tun_vnet.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> index f4c652b1fa44..0b9622891681 100644
> --- a/drivers/net/tun_vnet.h
> +++ b/drivers/net/tun_vnet.h
> @@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
>  		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
>  	}
>  
> +	iov_iter_advance(from, sz - parsed_size);
>  	if (hdr_len > iov_iter_count(from))
>  		return -EINVAL;
>  
> -	iov_iter_advance(from, sz - parsed_size);
> -
>  	return hdr_len;
>  }
>  
> -- 
> 2.43.0
> 


