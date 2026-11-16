Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853036;
	b=hIWA36uTrW+IGkWSWS5CPzQo+2TuRDvgkdZMgSurWpz35Qknj8u583/OY1KCDUVsUYSF
	 C1b7xc/5TBAiMbUTHS5AN0qDWSSluEZv/veK1ibcOymXvG7qH5u4QmbpUschAgYmVP8es
	 fj9OMlE/i8JgC1Twzyhdazng8IbHNJMQDzp6JUkoCe3kkpR1j5tkeVFLNVH/7m8YbWxib
	 kpZ7FxscMc5bWK7f5zY1aEw14ZWsRsyZ8FCgi+0jw3eEqcHx7Bv6xJbZ6OGUVy40Jjbvf
	 mTDhdDMyU385GcF68zl0nEC3+VrfZAjzA2aN6SieDEk3EW7Zm7ymIUgqZwAZ4gbaMcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
	b=HvbcVumnrFBmybh055xQmB2+YokGFBi9ZYy0IeAsRv5KpL6pAgBCnNqCPVA3TcwBJDsT
	 zScwXEFXiGRSTH4S5EyyTh0wGPYanXQCs1gTJqKxKDTFB7hQpxlmwIFbP+w1glYC/lF2D
	 0LjkxBOxiinFTBD7CFUHL2hMfSwtF1OhvMgYVbczGUpRXZYYiaGg2KE452zXEejZRY1F0
	 oNub133f6LX+FCSvbMKp2MPvXTcOJd3Ht0vXh/iC0AfgrDZ5Bj2XDTD7LyTW4a2oLF7f5
	 rn0hpX9Hbkoln1FzDiMr0rgMe5Cdl6fR8rAsATt/LuEJACrYwPcYUyPC5mJnwVGgyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QPwa4qTd;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B51606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B51606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QPwa4qTd
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso240579a12.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853035; x=1795457835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=QPwa4qTdBndNoy/kjQcLNLm2Tb2ZEHmWraYHzX5ptvkL3AR2doTSDC+bf6oxQxJuWe
         oPGCuTjz3UUBxYytQuSu3dXROL3dQ6hS56GF2BJJ9arvRdG3/d0shpVlzcsWJRe/xstA
         C+oWJ+LydTHrxLpHS/dJNSH38vr29x+4o34q9Y/zbxPr3f/93pS+KJqp9U8VvCGKQsDo
         IwfYo/3l6Hg9c1oBlBp2t6OvdNsU8AkbEHgJiBgRc/9eNInfiLw0Aj6rughSxTxNmifg
         0Feq77hUK6aA9AQo2F2uYbQKungLiSsJL3c76iaHzxk47Owv5BoXPqtZ6OZYUjI91V+G
         lA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853035; x=1795457835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=qciulZK5/+T4AnLewyOTURpLp1nXgt04ZtDpqmph4LaJKRdbMrVOCTyihmsi+LOYXL
         WYF3xbxphxAkJ2ttLOG6pj8XJIwDdRBjlgOMqmAYqG5PEOk2fpfWNywUilF1crT43aoa
         r//ysX0ctHm70sUIlgRuJneAfKg9fX0MNOOa1eBkm0bz6MxvwfxgAMY19AC1p24PTGRu
         hj64Hn0ZwkhmYM1Bm4MDQ3rj/rP1H0/mfoP4tEDZfZMdlqnxr1q82DxZtdu1b4CehmTn
         eoYPdn+KA1nOPtDERpBt6RK/Q2F4W31zHHZTrfyS9nplrxm2VJMSxqeCLw6Sq76aZffI
         UPvQ==
X-Forwarded-Encrypted: i=1; AL+hErF/yBlj3/oLScQ6mE0Oyjyg61sJBCun3Zy39VT3NT+XohDpeJe+bHJRTjQNm6gtEklffzufVXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+brW73Qluy4L+g25rU01sjlKh3EnkNQ8oboR6LX8NVyGuAD58Q
	KAtdtMTKKDIGurAihsX/PtUljVj426c4J2TomgRaMKG0YG63sVaESH6dK+IjIjSVKw==
X-Gm-Gg: AZFdTZeja+LG5XqAnKlajLTUbACIsjH3KZzNKFXC/3pE4EmGjdhh0XssU7+43AXK/vE
	Ga5l9qfY62HqASQ2phEhDrpKIhjNp9XOddFGe/5SSrQZI7yvtWHZN8TTQ6Op0hF3nYPAgFhraSW
	jl6ZKAXVTG5roeYr0ARWSUQCJFn99NmsX8Ko3Q/sapvvszSAT0Jvm/5MBnt3uwJYL5Pcv73KMoU
	ODGa7WnlbPLYb4NYOCCOJigD1CJBMC1o2LafJ6/TGd2cesh2SlJj8s1/r42F8P4D7WNiLE7mkrt
	lslUsH04UDu/yCYcjVonp9tfN/jt+UYfAe7pty3i9BrdgzHD3OxGbTG6LJFoISqeJQOfKYvJMfG
	SMbJJLOncdwohPwIFyN/jXHT1T/zVe4xZmuowl3U8VP4Mke+H8UPY/7551cBFTnnF4ZqNjUqPYD
	vKXyHrQwqDRESdKVxHt2gE9oSYVyKROq4BEaD6XGJggFFZ2TtNrfKkk5ojrzoaCraZgFSBto3nf
	waVpGz2cbr24742VfezG+xPVU8rf4bohGrl0roAJpq7mgwoeqfCiEnR0kIk2+bZliutuTa/Ws4i
	XZXdYb3KmLK4mwu/HDTLE7n3Sm+fvHiNptZL2xmMntsasLyA0B10txz3i83zzQVZw07EEKIse7y
	kY+f0dX7ZUU6GR0zlN8e6i+MPQHKXQ/ay17gIL08Ywp26NuvlgGdQt5w6+MgJaSzjCREVdn/m1f
	H4Fmc4cSsG8AV0o3k/RY+OBOXo+rc9wHCRz+58yapqpZvfiSr1W3ModrQ=
X-Received: by 2002:a17:90b:28cf:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b1b0b47416mr9375279a91.47.1794853034181;
        Mon, 16 Nov 2026 10:17:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2e87:6:9050:473d:cdf:7c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm272890a91.17.2026.11.16.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:12 -0800 (PST)
Date: Mon, 16 Nov 2026 10:17:07 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net v2] qca_spi: Avoid unsequenced accesses to jiffies in
 qcaspi_netdev_tx_timeout()
Message-ID: <avtIOfLOG3x0TRey@google.com>
References: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>

On Sun, Nov 15, 2026 at 09:45:22PM -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in
> qcaspi_netdev_tx_timeout(), which can break the build with
> CONFIG_WERROR=y / W=e:
> 
>   drivers/net/ethernet/qualcomm/qca_spi.c:805:16: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     805 |                     jiffies, jiffies - dev_trans_start(dev));
>         |                     ~~~~~~~  ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
> 
> Printing jiffies on its own is not that useful for debugging transmit
> timeouts, so get rid of it to clear up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 291ab06ecf67 ("net: qualcomm: new Ethernet over SPI driver for QCA7000")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2197

Just hit a handful of these last week; thanks for getting issues filed
per (I thought it was just one instance; having one issue per makes its
clearer this is flagging a few more cases. Thanks for sending fixes for
these, too).

> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Changes in v2:
> - Eliminate printing jiffies entirely rather than using a local variable
>   (Stefan)
> - Link to v1: https://patch.msgid.link/20261114-qca_spi-wunsequenced-v1-1-6b219b906db7@kernel.org
> ---
>  drivers/net/ethernet/qualcomm/qca_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/qca_spi.c b/drivers/net/ethernet/qualcomm/qca_spi.c
> index 38a779f4b866..249b4b549a12 100644
> --- a/drivers/net/ethernet/qualcomm/qca_spi.c
> +++ b/drivers/net/ethernet/qualcomm/qca_spi.c
> @@ -801,8 +801,8 @@ qcaspi_netdev_tx_timeout(struct net_device *dev, unsigned int txqueue)
>  {
>  	struct qcaspi *qca = netdev_priv(dev);
>  
> -	netdev_info(qca->net_dev, "Transmit timeout at %ld, latency %ld\n",
> -		    jiffies, jiffies - dev_trans_start(dev));
> +	netdev_info(qca->net_dev, "Transmit timeout, latency %ld\n",
> +		    jiffies - dev_trans_start(dev));
>  	qca->net_dev->stats.tx_errors++;
>  	/* Trigger tx queue flush and QCA7000 reset */
>  	set_bit(SPI_RESET, &qca->flags);
> 
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261114-qca_spi-wunsequenced-a81e54616844
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
