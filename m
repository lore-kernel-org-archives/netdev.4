Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688462;
	b=Wh0V7REDUrfoVjw5ngWcpQchv3gOtjnDOoZFgJEkPcd/q3nqCRr9OjtS4VHqDAHEw1ws
	 fIuLQX4FfLKnDz1TXxQY+nSvjc2nzYcgQ004RnlIB/vXRzSq5xuf1jTLAvPVo+zcdVRT5
	 OLozTBrD8Wn55CLnonaqicz1zjfUfTfzLOgBml0ZYsaagTFAFopnzdGnf+vjdaNTOIN2c
	 jKtzgwJq3Mr2JwiWSHY9+n87/dIVqC+5WaCRRgHRqwaqfFATC16cV1YEmEg2HoUMzcWHA
	 fT+jjV55PTgpGnd5ZTRbQqkXLlRP+Z7mcUhOvuCnQ0YVuVW5USqxdSRXccowgii0mFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
	b=oW8eOpNN2POU305AM5L1JehIw0Q9Xt2nXuULmC2xCEnxuihsR2vWUxzUwTHITAY3KUys
	 o1HWumOe1R6XPbe2Q9smMJoYb17kQH5Yeujxgh/OX5O3F7slcKf4VNbb8PJfGcpeFZ0t3
	 1jekXMDLTxxX8yO68qwjHJS8mFe/RE0QGUa5aDh46iMvSINM9ke219RYZt8xyeqx3OKJz
	 ehUCyZ2Q7MdMYktMvEpu3FVYAMzcAd5fYxjBBIOn2/1RXCO09KlSTwFf/T3d4O6Cof90l
	 HinEp6zXybIFkpiqvsWYGtVlIqQUxyqQOXZZAIjzb/wmi1AFnN51whhncONaer881KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CD7VT//B";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CF4606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CD7VT//B
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so63883415e9.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688460; x=1796293260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
        b=CD7VT//BnwjcVd/x9W08z4hh0qia6Xph8wF/i4minXZySyXu8zsDolv0LFjazmM/6m
         pIGU6L76Mawk8H2KfnDIrG2oDmO7Tv7sO/LEOBXhymVTUcYfViwFwrXpTpNkkpHs8gl4
         otBJYE9GgyVPV2IUsre2NvaRLOV2zPcBDOjAv1YT/TJrss4Pq0CevX+URUlIVbdF1LB+
         iN55YZDkHNufNljGtkNuEStzk9IaQR+nbcYV+y7g4IE4bHodjC1+Z4Qpfkkd525fXANf
         yjTMIfngYNzhYLbG2HD7dSz7i6QkbKb7sIKmnwYNW0QDrTCnZACMi6z8+NrNv2a+YLfm
         iQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688460; x=1796293260;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
        b=W96K4JZWR8TN6pN/LRUmhMv7Pj/uGg24hnxtPJ9j52oURVJ+9hhoe6ErqX5aAyj9WA
         v7f9j6tiitrBfAX8KijYafAOz81mSRfl4ceslyYVdadbrQXfnHFuC2GbUt7tuzMLcc9M
         TKyBluba9mlPRGPGBd2F0rAW/XI9Wr51FO2iyrGhgSrJCdK9Yn+o9gfzeKUw/Ie0Qu5Z
         jaxOCr6SzZovzlkA7heyqIxBXD64TqfoPhcGxoE73doL2wiyS3kMk8Kzciw70FLUoXfl
         CwS1r2GZgFdHES3KjLQLH6/TZb8ZqGBIOzzgVA69I3KDiXQ9HVib+ByPVaKGJ5YqhfCD
         2hFA==
X-Gm-Message-State: APuU4Z80vqy43Z+mVG2OcAYA1XL3DPkcKAfi0SK2/iL0nQDtzl6uv4yN
	+jyrxgyFcybLmTzQ0cWXgCJUz1Y1sgqd173JgkWTzZpa+xAlnMn3Li6F
X-Gm-Gg: AZFdTZc+3OiwwAN+6Uz4HJRhIr5mUXuQm77P0MEt6jTqGzL8J07Grs0sohcKU6YUvm6
	fDOvRZ9BfqQ4Mvrl5xZap18QrwsP9YfsDL4Rojle17rSht2fLFfQbe/lhj+PyTU4it8NiBkpDN9
	rhh/hQlRcRhsNA+ty/8mZUC0ia8PEaUHAYkTWRMMB0gcHTd9Tkkk07ThYEZcSrEY6pLyh/5EQeg
	agute30ywbdzxGTRF16lai3o2IYHnlNDnaD8r3JXU2MUhYCAdPdlyMjz0lFqVqpAd1pZud8Z58F
	f78jA7aCYrOcSC7P//OpF7oVdLG0WyS2Ciyi3K4JVT3Ob1riM1HxMQ6EO5B1eSdixA7FpCrn+lA
	rvt+y/odLSmbb8ML2UfvvZA6zeb95q5Y3ATyPc8Y2nlaUiKlzWS+nYOZhxkAlKsHBQhQp1sbn04
	gjObZkl3ilmLgqBF4Aruzn/tWkjfxQyxnGmwlPqY5ZhokHGI1mWgdEK7lgOraVmcMRrunzL6U40
	tfVreNlnTVfgt0DOdD4fM4nuJzSRvDdoC21fN1q/0NIKQsaJYlz3Mn7MA3+WXMFnfS4g6vkA+9u
	/DuKnO9PAw1n47zn5tVXgTiYTCuQm/qympikixMArWw4M/drPNuGNiZFicFJ6HgYgA==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr432378915e9.3.1795688460499;
        Thu, 26 Nov 2026 02:21:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm581334935e9.5.2026.11.26.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:00 -0800 (PST)
Date: Thu, 26 Nov 2026 10:20:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John
 Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Matthieu Baerts <matttbe@kernel.org>, Mat
 Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, David
 Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Neal Cardwell <ncardwell@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Xuanqiang Luo
 <luoxuanqiang@kylinos.cn>
Subject: Re: [PATCH net-next v1 0/6] net: avoid stack canaries in TCP/IPv4
 fast paths
Message-ID: <20261126102058.1fecf50f@pumpkin>
In-Reply-To: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
References: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 22:06:25 +0900
Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:

> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> 
> With CONFIG_STACKPROTECTOR_STRONG=y, a function that has a local array or
> passes the address of one of its locals to another function needs a stack
> canary. The canary is set up and checked on every call, also when the
> local is only used on a path that almost never runs.
> 
> This series removes the canary from functions of the TCP/IPv4 fast paths,
> by returning results by value, by using storage that is not on the stack,
> or by not calling a function that has nothing to do.
> 
> Patch 1 returns the two mptcp_space() values in a structure, so that
> __tcp_select_window() no longer needs a canary.

While all (I think) architectures can return a big integer in two
registers (dx:ax on x86), not all ABI do the same for small structures.
For those architectures returning a struct by value is implemented by
passing the address of a hidden on stack structure.
So code generation may be worse than passing the values by reference.
I can't remember the list of architectures, mostly old ones - but not
32bit x86 because the compiler option was set when regparm=3 was added
for 2.6.
(Note that this is different from passing small structures by value.)

David
