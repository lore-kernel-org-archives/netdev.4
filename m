Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041956;
	b=O5TY5GFiBa7+9bXX9eyXNkehiafv6GcJjSAjRVp6ODyQ59MkOKxPyw5qpD0+2ULpAzVa
	 TfhZpu2ogy/1HF7kykq2VjrMX57Id2AnPNvzJipaOkRvgGPwHC9foBCg5pS5XJFVDROOY
	 wfSFFXtn2SKmlq/0c3Kmf8iJy4x68W6KQIG4mRkDypXwTaEtsJWj7QrkZb8IiIM2NMQhT
	 Ufxm7KCzQ3Rv7iA+nuGr2ZBT+UKTUMM6zYTlItd2OAaJPYfAtKJuDwCDQwhRr18dKD5l1
	 dtB7d22TKbP+o0CpETUB+deNxlib3MOLgrEkKVop2YXAfeUjo6ZbocnvUdRWp8lfjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
	b=m4cbZqMrZAB+Tey7Maz0y6JdrQipm1/9BHH8H8cDgFgSwdVJdbTyGdQ8urYaHz9ybooE
	 4h/FpwDfAXwF+55qadGvt9uhfxhUDJExZTD0TC4d2utvYr+k55J/Mxi4gTTFuGreivXLS
	 99EdpPP2/wHyzA85EmJFIQzR9/fW5K1zpuO1HmwCXLcLoefJaPoI92NKiiItS5utYhA7t
	 xxW/TBQ1yqcmiICGdZo0443ui/mdpZn782BnT/U/3KGM5ejpTT2gPKWj0r2KSItMHtbFZ
	 sTKM8GQyc4WX4k59ADVAR5w5enTCBRll7vV+6NqbYBtqn0T3IFDhBDZAWyn60fSUCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLrH8uEk;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF20606A337
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF20606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLrH8uEk
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so14424411cf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041954; x=1795646754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
        b=nLrH8uEkm+gHs351X2lhHHDZV8l//way/DxHSO9CK8eQ446ifZ7wOy3mUG7gcdFyNL
         8ZXMzeSwhyj2Ok7A0Hfh0ljx6owI5NLTR8hDo2UD0QVKbGZYdinUS0p1ysPwr/2U/+to
         8JQ16WjPfe4uDOR1+2e+dNrrsGa55auzWdZYlwnC14WQEMp+Jbes5u6TUDWBZ7JDQYZ4
         C5py3OJ9zhyaiWQrwJLFGbSkWXVZCovtG3V4RQ9KA/39ARFFh80i9wFenzne5mh4OdZS
         9bBhg3+zECx5PZTNdPJLz0g04inxC7/58TaWhMzCIm2rD+JDRFjUII0L4QybM8Ifn5R0
         GYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041954; x=1795646754;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlxflGN2P4bdLJLhBshlbVu7vfLlT4P5XJep01GeEKU=;
        b=fZh727sJeYM/P1udp8yXxssy+OrCFT0LDNuNMu6zgWCJVtITRLK4kLs1g4w3IbnNwI
         M6QPU8BH0p5qo3asCxc7w1sMj26DIxXU2ojjRZR66saXqtMxS6SL5UyPK0jya+ytI7ot
         IzHgZn9b75GGjMT8I8ONqo/FOS0DrkN0HIB7reV2AC0JLGcjpr+idmtOFjMxx/gZMYOp
         hMJ/msbqXOX4i/BieM0OIqvIY7tI8Q+MM/or4/oX70kiakNbk6YUos8mWxZyVkwVo91n
         ziMV6mFJt7NEfqOscWsuEIML0lH+IMvD+yRzsldE7aH4XHyYnhIbeVJQ+zcGVk15YXRO
         TgPw==
X-Forwarded-Encrypted: i=1; AL+hErGkMIibYz5uQV8akxRT/vr8mzaxwOkMoGkJmiufkjB5TvlQK6rpo2QP/GelSPiVRRoq01ueJXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tvKTrRIeT9hqXTdS8ryBoGWGhgtP/+PuJCYyV66SlG1iLErcf
	PIq/9hiRwuqwEJknxXFrDJLBDhxK3dsOOgb4MqW24fBwvPWQ21tv1WzE
X-Gm-Gg: AYBFou0ssAaZ5ReTNlan4THPe177E+RrM8gSJkuY/4V6gGK6qn/RGMUuEfDx8mrrakm
	7qqjtla8EWBVaj2JybqNqm8rkCrqNm6PWb3V06JdGv0dmn2Z4IpCKK+pm1wlqlsNOBP4F0O2YqN
	Y7onCcq+51BfqOYgZXjwo+dIwOMZAyrPQD5BORhVYEcfvCHuTa/t2m4UJ+GWXRX7vRPMXdWfB2M
	a1vhmXby6Pw1eDemYoSpaIj3czTMpDYBa0GLMksdMik/pTh3WAdvy/B/tnl6GeEK8mER2N++BpV
	rysUvYIIriGUI7RF6jnYi9u4TtMXuqzTBRCNgjaTwoHBLV5vmMS2Hl1AsDoUvlQklfwFQQFeXmD
	Gzyc38QDcqzPFd5TBMOn8i4YD7fme3nQa2pXLaB/cIr9UQ4Eg4OIznFIPIgOTzDiElJgKTynndU
	eDFFTfyGuaWnFh1USgq4gZTeajH1ABZ7XZ2CgS7Bj2fjNSZek71Dt2b8kRWnzSJv20UPx1agWVv
	V0XDZVRn3dujeFuJp2iFCM57yvrKJvobLfTbNFeS51aZ9ysQMHIoFo6DtSKH9tmtgEe1P6z1zro
	RDCbu24wusxbNeHKTgE9CNx9yzcW9BKKYY44OvKd15nKoZDYAFW2wLSuRUqA6ekElIVKDs8o0rt
	Hv0gk0RK497joCy4SS5vKH3pm8jyaS9cCIfCJiDFngyGl/Xj9ZzDljazzfUPOrlc8j4qJEX2TVq
	bPUC8mFtmI
X-Received: by 2002:a05:622a:2589:b0:55d:3540:5da1 with SMTP id d75a77b69052e-55d5a543552mr62410941cf.19.1795041954499;
        Wed, 18 Nov 2026 14:45:54 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm10266441cf.29.2026.11.18.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:45:53 -0800 (PST)
Date: Wed, 18 Nov 2026 17:45:52 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3b356fe59c775@gmail.com>
In-Reply-To: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
References: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
Subject: Re: [PATCH net-next] net/packet: don't direct reclaim for contiguous
 ring blocks
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

Daniil Tatianin wrote:
> alloc_one_pg_vec_page() first asks the page allocator for a physically
> contiguous block and falls back to vmalloc if that fails.  The first
> attempt uses __GFP_NORETRY, but that still allows one round of direct
> compaction and reclaim before giving up.  Under fragmentation every
> block of a ring pays for that round, so setting up a ring can stall the
> caller for seconds even though vmalloc would have worked right away.
> 
> On hosts that run tcpdump periodically we saw ring setup (8 order-6
> blocks) stall for up to 1.4 s per block and 3.5 s per ring.

Is this still the case with recent commit 0e05a469c294 ("mm/page_alloc:
avoid direct reclaim and compaction for costly __GFP_NORETRY allocations")?

> The contiguous block is only an optimization.  User space maps the ring
> page by page either way.  So make the first attempt without direct
> reclaim, as kvmalloc() already does since commit 46459154f997
> ("mm: kvmalloc: make kmalloc fast path real fast path").  kswapd is
> still woken.  The last resort attempt after a failed vmalloc keeps
> direct reclaim.  Order-0 blocks are left alone, the vmalloc fallback
> would reclaim for them anyway.
> 
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  net/packet/af_packet.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 8250e6a791f6..38f35a4f9d49 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -4493,8 +4493,16 @@ static char *alloc_one_pg_vec_page(unsigned long order)
>  	char *buffer;
>  	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
>  			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
> +	gfp_t first_gfp_flags = gfp_flags;
>  
> -	buffer = (char *) __get_free_pages(gfp_flags, order);
> +	/*
> +	 * A contiguous block is only an optimization because vmalloc works
> +	 * too. Do not stall in reclaim or compaction to get one.
> +	 */
> +	if (order)
> +		first_gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +
> +	buffer = (char *) __get_free_pages(first_gfp_flags, order);
>  	if (buffer)
>  		return buffer;
>  
> 
> base-commit: 073d54dc3ccc8c8109c56e4d984d1ad616554463


