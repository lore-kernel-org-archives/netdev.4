Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134721;
	b=D9yq7J8lPOr7kI4WoII2Z3OxCwLiM8Rtb1N8VILwiTtQTaYX4DPR9f8NPHFzeShMbRRF
	 iehdtWdkJPRAds91ASdDNHqbipf9esdvXMJ5r60xaTbiYu9NvF4wo8O3YNsrKKzwp5Abl
	 OvjcxQlrBUmkWfSyP/1n+7XJJgefNdp3EE+AcMJcwJ82D3kGTXxgp0AT1TeOHmYG1ZGqs
	 E6co6pj5nu+uBHK53+tpO7Mn+NVP8WPF8KKp2wFSXtpt1pAr2aflNmAufxQcIujAyB2jA
	 BjOPUXjacRTF6Cir09ntuaI8tWrpxudgZRjC1qlM6iY9Z8AryhrfyFf8INpvwnfgJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
	b=CftLq7zh89b6Fi9dpxaHOVJi0vbmGM8mI08zi/fEDGcVOMX4mHiR/aOE7vlGAW/5NB82
	 HBRkXCNBAKzFudg4uiL2gsQbVFOrkXySUBm5MMTAB4Tbe4K1Ri1Mzoy6MEhFcVaNHySjV
	 zv9fkNgLllvMULtVPUZXb4gszaMrR4B8O8c4a1Ar+5nvxMzG+rnkczF22g4MMHMR7Yfbf
	 QKC+KJfyvND0kSICiJipOgQkOGMcX6sPUkHkW/1vQM5tPCJ5OdPnok+ibwD4IgylOWEle
	 qK8b9T2FvWrh9h1N+ok+p5TVJ+Q8GqDV/ePHSJVFKavQxlDM+uAVmw7Mn5hoJaQvq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6D606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D6D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-380c28f9e35so1395646eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134720; x=1795739520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=glVrkyNIyYlm8wVTiuLIn+1R/pE2V9VJN825nkjbnVE7DzI/tklr0XR6PDNFu1OUjc
         A6P3ZfTwHJQxiHAjmoK4SpQIdS8Ir/katd03VOBvE+4swUu2oA+8IkTyyok1Pjj9/pPY
         jRHRWeNYDZ3yM5EUWHx+RVw95l+YNdToEWVWMBlDmJCQ5nDUi+lZAkU6M+KCBd+2W1HW
         fToXfkJkp8+luUW1MITx+x0oH3VnjO0S4X/xzsL89lshkI/VzuYPu9YudzfVuvXLiO7a
         PI2e6DkQIuvL5sJxpbyOQ9dBGmqKQnp3LSWMA4iJOQsw2EYyE1DA6dSJBL+RP9i6HuS0
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134720; x=1795739520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=PSUe2UjGLabJ9a+OCct6fEWkTj5Du510X6l1QwUeYXRrsI41jqJXk1xA31T+rgOF2V
         K6dENMft9+CO1SuzhP8e/RwWm9capEti/tj+psFHMHVul/wHtne1CUoVJMVH6MgUNtgO
         afciVpDGJS43ot40ZNwgP7GgbvATIsEZkiBHnSoPkyb9wBPRXm5LvrS9v25dY6EvIKDD
         oFKSbxkTcC7jTCE5jfbNimC++tRyKSMcWyY46V1awLw7LCJX6JJaHes1i9QE/vbKFamo
         nsgpnCXOtx37O2F/LCG4pHWGm7gF6N0CIqW/qtooaqPb9sV2aX4RnRGC0ERDnrRgPdcY
         kGJg==
X-Forwarded-Encrypted: i=1; AL+hErGxz9ewbpoHvLe3vOERBPXL6jGAt3M/K3qvgTbxo3TIkpJJLgaULfhdHYImcrVDIjsS0Tvm/s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BHErmOc6LzeSgSnBM089uyklwh2GUjAcupK6DNlQ1pa80XI1R
	mLkYYcwnQpJgih2vY/tk5tSmt6R29zeMOhJyIeIemApEPtK8uSB21VeK
X-Gm-Gg: AYBFou2IFMOCsX7+L1jQP9T3Jn8kPCL+dhcohebg0tCRr7fpteJaug+CRlQPJMT0eF5
	L0l/KZz2E61oOskpuz5tJ+5/KCMU30Po24R6dc1yExm0Ih1/isLJsRjhtwpe5GmyKZuo/xti7Qe
	DWqbUJJQUToD0kt0D7YFS8I6dF/Caj+tNjAbZfCX1PWIZAN78ChODeI0uyXzfjgF2RiakTFJxt3
	t1k4tFIBCdIP95nIf6OaVQcjFqIEe9cCxllGA0d1Dt+JL0iXXv2rvip/Afbp8qKAiTTRi80LSFb
	/2NPT/T8ZaVJv0p9kyLmwpDBBU0TkGZVjnRxnJeQLhZyQ53vQvOJGW4WYSNkG3c0qXtEsZ7iVeC
	45QQWl6a3kNUHFwh51ijXQji/uoF2tx6iXezEjfvMY997Ua4ckyHyl328/7vzLDqNGev8oSON6Z
	ILVH1V5x/kuQtS1GylrF5MGMBLOs8qM3d08e1uX/vqwqXZaPNCSus2RJA8pnVdyzQD1T+OJXg0A
	eZNlBQirm7i3/QJyAVGIWUDwjhL10TSFzNHJ9RyAP/bY3BjCtDKy/qLPrCphInVhpEI6y1HTZNP
	TXbWaaCM7ztkaspZVnaXLSw=
X-Received: by 2002:a05:7022:7f19:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b5520d7d86mr2448430c88.1.1795134719982;
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm2242124c88.8.2026.11.19.16.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:53 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 1/7] bpf: Keep XDP helpers within readable data
Message-ID: <av-SmgwQhAKI5u5P@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-2-bjorn@kernel.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-2-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Devmem and io_uring zero-copy RX put payload in fragments that the
> kernel cannot read. XDP helpers must not treat these fragments as
> normal pages.
> 
> Reject operations that read or write these fragments. Access to the

[..]

> linear part still works. Tail trimming does not read the payload;
> clear the unreadable flag after it removes every fragment.

I guess this is technically true, but why allow it at all? Easier/safer
to reject tail trimming as well?
