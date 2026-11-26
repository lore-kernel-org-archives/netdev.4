Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726521;
	b=U/VFOZZsHp9Cyl6YgBvkmQQ9Rh8pWCs2QwSQGSz51qjZLYNtEHVQAxv/UWifNu2EdbdH
	 76KXdHodPlTWIeFT1O3GteORItGtMpehaCsrEeta4y0muwYPNoU8Xq9FUlqUDCp3OaxgP
	 HNPXw+ZrP7+YibBsIq5CnAyDJ4diOcIvDWjNqy05AGJiZKOUh3Jxmp6zoTRkNkZhiSFNl
	 3yMc+id38Bz+7xlm975ybQwcgygiPbGv5JxX8kB3wHaYARCOSy3ORJQ/2TKUBdKvGV9dL
	 pdZcCCfxp/2INml4KkFxStYsG1T2+qbQYD0n5SsgRAwhqDQcy4JPz7kcYT8T7864+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
	b=MXKYvpJgP9DJ5iLPt1s7RDLG+bH7s9uYY95RHJr8ubzlNuSI0KPxgji2yH+twuAVXaTT
	 LhnTCUNkof67QeW/n5H0sqm2i34WaaD6tvFqXGZe4PTv6yO28CetmOywZyqaGri1ito2a
	 34a6MQZoCIwG7189Pd11I4Yxtb7VhD7S+zgfOYNaPJMKgDoKZxqnQj1UmHm24jDNFaA02
	 EJuFq1ZxcyoFtQJMFP6y6SHxt5JYk0ACb1He4jt8auAX28zE/NHbaaNYU/BVugA+Twlw9
	 5Ug8krYHBADOvsI/UOfZpfaBJdFA58tPDNOMlvu12F192Xh3xveKAyLbU5lEl8o568w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRk9pbpx;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A2606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRk9pbpx
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0621eec70so51688045ad.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726521; x=1796331321; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
        b=ZRk9pbpx1qYIlFNLdBpTk1l5ax99IpkBgvxNndr/7zOBPE6nwy4dYpgboyM6myBcfh
         Mi6xXUv3+6WgJDwvQwrPwgFzyk9MtzD/rI3kxjQIdCGy9DoJ8BjUgOlrri1ZmEUwaiZf
         GhaPLezWmjAbMscLibq+ydYSoMaq3aVttbOp/ZKZpLswK4/QVdl4WFEEsg5DKXMC6+1U
         y+2P5zEzVaqP3Vju4lAasWaBFSECJWxeHJRlQ7x3rlCK609SjbO5ErXa3VRVUYBnkYU/
         c4o8lMyCUXE6bprS76giqjnE5nQCcW1iw1M8Q6SAshZ6wIl6nn8AQT8HNllqw84pqxwE
         qXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726521; x=1796331321;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG8u27/WmbWF6C9WqnFdauWWHkIDT4nMCSatNf2Dopk=;
        b=wKTFS0yhuQiKKBnPYVOavL0QcB/Zholf9/wqczwzdD3GwDW4xv05fxHjiPhSae69S2
         guZRjQADsRgFVWOLrrKvbcPIfAy2KILsEvuUSryVH9+Uk5ThCrbMmR7ub4c6W4MS7BFI
         6bW7Vb8FAAVCK7T8HvFG0sQRVIh8rzsHYNVni0KgjWrsW6zGPwmaBa0ilo8tbL00H3Ow
         z6gd9lhqmyEHkdtubk2dKJr3Hum7O4G0ce6h+xk1RnPEQpRiueTGmDP9vqlPkccunisS
         UhZoz59Z4QF8eO5qcfy8oC/rme+nmlLMJxSsy58ts56hd7AYqSAmx0MBxQLA0oB0gosC
         CDfQ==
X-Forwarded-Encrypted: i=1; AL+hErGo4fW9+WoqFHACIUDlbIAjWvAe6859LqPZZC/NEvtZS0He3h3K8t0wUERIATpELWYQ+nF69gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KoakUTNU+XrjTFBWNu8zs+ap746uowYZeBeA7DTavqVaFWX+B
	j2q/9VxHEHjr8GJhEHCJDzTZqknH4oJu6KvN1QJq9+8wygKvKvPMKJXK
X-Gm-Gg: AZFdTZcLucGrWTeoOweC5jdQ5uO1K+7v9fFbbFg59rz6U4xfHBOagbQpzXP5YI6uI8D
	87vP3uKzry3i3kPyevis6sMkEL/KteU5FWUHDPKxsdV8F4kgi3sKofqfviZV0FuqxsqvY9Nhhrt
	vcX2ysFLdXozUzJ/EuhBcf6JbjWNOkWa8Jpx1QcpMo4iX6aCDbQmuQyFcsly7CWVS7H0zec7OG1
	a0hO6Ab1oFEmhWKzIVnL2GvibZ4Y5dIosbseybsexqJnWOT/A8SxJqQY5cKge409wRSGr/tsvsX
	ytQMIiMQMJQh1bbkvhbP22yKgYdPsxzTFHZ0PRUkbWZc0zxfrM1ltoeQo5gde7tH/1Bg6YgyYT8
	o8oLsL4ndOf69Xp3rpA20ywRmFENc0+Sf5oo/LiLVTj1JphedntPO8IuLSaUv1p23ABhRkPzhHX
	139Vmo30fbme0OvoF5tBW6Rs4oixGK2A9ijlS8g/I+XtGTSHhzpExojf2Is2Nl8XgH4LnHqs/Iy
	Xlr7mRlhFpde+8pnvmwyoAFvfgDqNwF/s0gWoaF3ebZ57QOd0llxq/f0N33hwNeVK5VcIYtGqRJ
	BpnZyQamvzOpv9YiwE4VHec0y/JTclYSQ7A35gys3dh/Yul49WYoO1Bf6WFzrWo73UuWDIEtbH0
	C5+2aQ4PYEC/RrJ1HjEaEkNr1NJ/aO/078vJf3dQ3APo8aMpSmdDS+e4=
X-Received: by 2002:a17:903:230a:b0:2ef:e755:bba2 with SMTP id d9443c01a7336-2f03f2b6004mr227987945ad.62.1795726520672;
        Thu, 26 Nov 2026 12:55:20 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm100950515ad.34.2026.11.26.12.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:55:20 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:55:19 +0000
Message-Id: <DN5FXAJD2B7T.26NBT62PWILGJ@gmail.com>
Cc: <jiayuan.chen@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>, "Tianyi
 Gao" <tianyi@cloudflare.com>, "Octavian Purdila" <tavip@google.com>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Alexander
 Lobakin" <aleksander.lobakin@intel.com>, "Ilias Apalodimas"
 <ilias.apalodimas@linaro.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Lorenzo Bianconi" <lorenzo.bianconi@oss.qualcomm.com>, "Magnus Karlsson"
 <magnus.karlsson@intel.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "Simon Horman" <horms@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v8 bpf 0/7] xdp: fix page_pool leaks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>, "Slawomir Stepien"
 <sst@poczta.fm>
In-Reply-To: <awbq4F8pF3YSGX2D@boxer>
References: <20261124104016.532341-1-sst@poczta.fm> <DN3QVHST3PUQ.3NINFUW0FL9IW@gmail.com> <awa0fvxzngTtIYVd@nr200> <awbJFmKWy50Dp0yS@boxer> <awbq4F8pF3YSGX2D@boxer>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 06:04 AM Maciej Fijalkowski <maciej.fijalkowski@intel.com> wrote:
> Nothing leaks with your diff, it is only about recycling, so I'm fine
> with keeping it out of the fix and following up in net-next. On top of
> the on-stack rxq it should be small: for skbs veth copied (what pp_cow
> tracked; an uncopied head is usually not page_pool memory), keep
> MEM_TYPE_PAGE_POOL in veth_xdp_get() and take page_pool refs instead
> of page refs. Unlike the RFC, which keeps skbs as skbs, that preserves
> the XDP_TX/devmap bulking (the RFC loses 8-17% there [1]).
>
> Would you be OK with that as a follow-up?

I'm not sure whom you're asking :)
but makes sense to me.
net-next is the right place for it.
