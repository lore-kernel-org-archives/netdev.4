Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107078;
	b=lSmd8a6VyQ+smLO0RBEoaVNsoNiquVEQ7RExQrwxpu27Byq2knlywKYVaEcr8MpItsDN
	 86VJZ3v8x9lEjaSxVPL7ZSvtQ6YMJl4I7mgxYS3+ppiSwhK1oK9i+SLP2bzXIyRfVf5tC
	 2l2XAjp+ShzUGLILJkPv9I2gnPRt1B2TuqJMYVbkjs9BjzNHm621n9C1epSPgEhoDSWtf
	 W+PI2smt3395H1pFPfE0MNcbW0BTYkFZbM5i6qfBU9sZi8WSd5QfX5+u21KOp/+jVKE7J
	 Xjm5Ch7WDwrgzpTGam1IOncqtd6QDH0h2UqU9goC1QOuOf6opUFqCVkeGc6neJdjVQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
	b=lRvIpZCAXKTQC/9qacZM2nLJSttqSkJ0w+19hJjy2HAs0mAoBsC4oqg7nWHaQF7KbqOd
	 AW2MEpV28hpVSpAbKlbVKHypiC+jfI2Gm1RtFfsrmNUACD1QwRVCeYJBMIv6MRLbT7Qf1
	 fWrKRsqThhznzuuShGwwGmF/KEpUstSWC5FiYS7giVRLrFljzfb5A2WaH9SIso318d9Na
	 hJqHEs3XesNtlgarr5yhtE0rymDGdQy4a/WWwbTVHhaUjQy/4h6XaajBHWAj72N1ALZTb
	 tWybXBH/TUbneMpY4iZN1MYMJ83NhuO02X8C2/RedSb7I2er3y468+adf9CrPqKAFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5wO6cSp;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B85606A33C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B85606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5wO6cSp
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3bbd46625so3500a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107077; x=1795711877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
        b=W5wO6cSphMtufLh55O1QNHFTjjb1uZu5SGtB5W7M62SmtljwEGk7x3+bhzJ+DREFK6
         umUp6pwX5j+HBfVAZA44kvYcenfW2ZXBeKRbIgFV02b5iZ0jdHoB5mQNj9FdjY3Q1vtw
         bhiqhmaJ3qXePUgF5vYOCQwnUqrgTLMFRkJ2LXEBXHMT5utExV3QpMGWC5UUblaatWXr
         jPJsVBx48ePyUXCmmGeWvOnStA4jjHK9GMCxpyFdG4QMocQqrY/5IPAsj0+zxTL7GgEe
         hkthLF2Kph1SFQXMlKWX2vB2SzT9y2FtH/HwmLi8Y1kUI3sVT4mkiJAcUcDqcgFItZ3k
         tvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107077; x=1795711877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
        b=mK+LhVzV7DHam9fHciJu1Cr9cHlsoyNu0Th0/HGp2Q7icP5b9Iz9N6f6drx2YHVIjz
         Wrj48q1L39g4eSd89atAKba35QOL/U6SLFg+Q+Xmf4wvgloe0w4Cd6xVW+1kvS+Nn/+d
         L99YYf+pVhQiFTjKhO9wa7yyLjtgfl5GmUnHRXJK/3SL63ia0okEgcRJjB06ksvGKIjq
         AqU/oLbFBqkA5c+yUPzVIRjYUxpK5b8qUNsGpiey1xl9oXv7mBmLLJsHUGpXLPPk2xw1
         TnsFm9hkDDrh1w6CSJEeT43TVrWLYtWzd52hvr/BDFkGdNpu9Z7vo9Aci3i5oCP3A+x3
         XoCg==
X-Gm-Message-State: APuU4Z/nRG57CGzRVjDjNMXhGUqu4ugEjPXlOOB7j7mbXkwI/EyPCN73
	s9ChB5xSTYU3WtqceChjSHg6kt5IQ5vaCaGEVHt5XQJgfykKmiJtPInB
X-Gm-Gg: AZFdTZf4EweN+MctKkwcA8NWuGMRNMIRxPC3cPFXd0ofLKENo/w6VkQNfla5Yzc4CCD
	SYXz2JNOoLBpFgT6mao0qrZsWLYCUraMAwxYu4BEo7X7M/V+eeo+BiiwtR60uGazsu22WTFeykc
	ihiZsHOwVogzwFU4YYV41qRt2mc8SJi5np7u90RBjvxS+SN5R4aW/+tKTc98xN11JrLVoXpnPQF
	7cHE/xQDqxKZSdZRJ/EUYxLjSI9J+1kQdfDjbqUiUOFY1PvrqTjRbjegB0YH8CWY6IDeGMobdNv
	s9QgfhfyIZgtfMlVZoopvzZ6txQWMqiRIEoTBPqHCK7h4foCjHb2iKxH2DLfxvEH67e/1eIQYRu
	akb9nGU/XQE9zd7dWMCMyl15/4FpzzrmfG0zK5ZhlfLBiTW9G5hlHpRutJ4QxqRB59U5Q+ZyAqN
	oJKmKOac9+Im6LDMoHMm3eZQmPSW+D610Ae2rS1HaPOxo7DN/8Ot1DFGBAAj7aZVTqotNZs+RRn
	GysAvLH+HOK8sGkAqlr3Ujka8AICFQZ1axQqK3r1ynDLhlCr6Txofuurkx0EZ3Cm2Om/agn1ldi
	y4o4kJBkyQwDNbO6FPYBh4Y=
X-Received: by 2002:a17:90b:5407:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b3d074d82bmr6300014a91.22.1795107076893;
        Thu, 19 Nov 2026 08:51:16 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm129647a91.14.2026.11.19.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:51:16 -0800 (PST)
Date: Thu, 19 Nov 2026 08:51:11 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	yoong.siang.song@intel.com, kerneljasonxing@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, tianyi.gao@linux.dev, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH net] xsk: reject TX checksum requests that overflow
 skb->csum_start
Message-ID: <av8o-Egamsxv-uWn@devvm16445.scu0.facebook.com>
References: <20261116162834.30087-1-tianyi@cloudflare.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116162834.30087-1-tianyi@cloudflare.com>

On 11/16, Tianyi Gao wrote:
> xsk_skb_metadata() sets the u16 skb->csum_start to hr + csum_start. With
> 64K pages, csum_start can be close to U16_MAX, so the sum can overflow.
> The checksum offset then becomes negative. With XDP_UMEM_TX_SW_CSUM,
> skb_checksum_help() triggers a warning. Without it, the device gets a
> CHECKSUM_PARTIAL skb with a negative offset.
> 
> Reject this with -EINVAL. Use the limit of skb_partial_csum_set(), which
> also rejects U16_MAX, the "not set" value of transport_header. That
> helper cannot be used here, as the skb built for an IFF_TX_SKB_NO_LINEAR
> device has no linear data.
> 
> Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
