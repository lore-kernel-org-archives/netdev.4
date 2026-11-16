Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804712;
	b=d1YMBKNfIISITTorK3NogSsDmsCW/aLdgAhGzHRvNNREAbvEDquzIoIQBt6qQ/uwgcOh
	 qBU/KcBky+SSUYnTWE4rlwv/erBupfzFXHnOrDyYiQ67QcMXVdb0LHfS0DEI9pBrSFIyC
	 Wkm+ZDyWIofZPLGz+DjSeTr2N2JKSdV6kQC0GJkhLW9FioinydcdaPu4ZwdZ3LSo+Be5n
	 6Hl8tZ1Rr0620Yn03OoxJPy93Lm/4hk8+a3/OlyufDUxAAeRczKuZHrT0fjUVToOSCPng
	 /+8HyQEKUsK8xEhMgqDkxlFXxbVlWsmGO6gxFxergZa1Hb8ZHznQeVNq7xJyguaCE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
	b=TMiNRij+kRO0prAWCSfz3qwSQJqTWvxr+veidK/Veu56gU4mbDRLf5C7ksG7arO4sCjP
	 o9PSMocojmMGK/FLZLWMoALAiu8jr3Lz0klQTP+iiPoXMBmp9syGrl4rfiPsHXqJrlg0D
	 vZ/6bYvwwIsVrVBxB7188R2B6WCGrTX1SMMbEIgCfwXu6YH+yyEK/A/6e0sHt8UZd9x1D
	 361eqxVfQZt9Vay3lofeh08UmtR5iAaeRq2JOzJCnDRYlc/8MeOAdHtWPpDmcpXjDTtL6
	 ajm138TDz6Q0dNnwmpzq8uFlpWcfPYeULREL5Gtk/lFg78g0CLMB0NHYdHipH381QNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9uMG0sh;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C22606A321
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9uMG0sh
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed3d8877e6so26130565ad.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804711; x=1795409511; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
        b=Q9uMG0shsjQL+u25gEioGMriGdkjPwXQL+5xFLs3BpJN9/lu5iNK6xJCTRdqzaVo5n
         d9qIjaheY8Sw4SNzemMBpyXWzwDpGL+2DUGvdthUsK5bqlxbmvwhXPby7xVBSckSGUx2
         A5P6dOPRHR449xae40tDEHvQSxWdGTApunX4iuvlVkVkbcPFv2ympFYjpBuLBdHbwFPX
         hHsSi0ExiGK17YBMPV+Tk6EimN8j7iNHmFYj4JUle+Z++KdZRzpbA0dPu4Aphd4h4wWm
         3ULZboBKGMvR28nAEPHHojGsL06gRTFhRBEOrNIKjXaFHRhi/Pc4ukzFpYurIpprgR65
         N9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804711; x=1795409511;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4t5XE20i/gJJgLpBrJ+KezC2CeSfioWQ5iCK7ep1kI=;
        b=biUvHjzCAs4f7k3A2hRlPCRf4/8NyS3yLW9RxgL8+ylDkYgMJnjUubkpC7I1hJfZnN
         qgiwHbjtfOpVbkuTwYJ08CBCljGjuA2sstMQLXkO8ZwFsk7ooqUq6pFnMVh0FURWCPzN
         K7y9aio/z95sW6B/x2PftViwsnTSbApjipC2jXtBtEBhUPQB78EHvRWIsCHurdFhyzKf
         hNyrCCmxSd7B1jOLWnXMwaqelSmCVm/qP+XOlzWwtL1rQdKRk+oNembN0GFgyETvzbUv
         nGHax4zxAn14wl7ujuv1NcUdbxlvU7h7ZzYSu0xtEwydPLBWPKGVopL9QXHbTh2CmOle
         v+aw==
X-Forwarded-Encrypted: i=1; AL+hErFaVsUiu9jKRCR5qQZu1gfgIJkOJkcGrdtvRE1PxDpYqaCfJCDBdO6b7TNRl+r1XgEhtUsf2ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pT7WxjFW8NakmLqcekg62Kbp2oeWxxpwoGcR/d3Knw/OxPnWr
	pZJ3JQp9mZMnHA5yPp+3DwoCtaJ25gzq03vee8rQJQUp8qnpoE/X2pNhw/hitA==
X-Gm-Gg: AYBFou212EUoARTqb0XwpMsQyYA74bX+jtS4fsJUve4YJt8DYZbcUtYA9TjqfJ6y1SM
	dKFODFtzxQ7yqHuvwUii5WsLajgi91SlfGWmS7SW4iXsOeVmFMORzqWPU0hgDytjBywMDaLJPG1
	uYfClBTPtQ1u/9egqLMlqOW8lVERqoGcE6EHgItQkNRScWqhSrNMUeCLZbp9tNKcqWbaljOGCcf
	om52y98ArhzKjg9OO1iWotUCrOPeygt44mVdBw+szu3uuzt3iZPwCdLz/jhtXZXQSHYmbDJbT0S
	5s7Gg9fs5AwaEBkT4Zpw/xPoGVxX/Pbx4afOQPP1iLmaXf2iVsluPshXZf6TP9BnKM23yCCiAwE
	AbvM7WsOCNRoBhjSFEIEYFdq4CSk45ysJVyiL0yX/3D4j5eRp9zKKW+e1TVltFJrVb9/3N35HKq
	aFBmx0pa/G721nBHBmXA0CnO2a0yGaUAExTfZvj3/i48p9Wu4pqUC/2wuw/yCjluXdlcf4i71fU
	oXRHi/kPvoMug1qubUr1UUPLQyNRHsYK+s4aMirgsjbFY+dJIMZYX9wnZvOf2sxJkvkJF/w7K2k
	UFPQ9mzSzClBzswl40bvWXZ+dxpwkgu79tSyszIciTQDgK5ywTkoyXTh0truIJyhr1gh6o2/YgA
	Hfc1B9KY64xya160s8kixHaPH97PhAn6UcQ==
X-Received: by 2002:a17:90b:2247:b0:3ae:2969:9031 with SMTP id 98e67ed59e1d1-3b1b0d08f2cmr9948935a91.54.1794804711394;
        Sun, 15 Nov 2026 20:51:51 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce460csm19648688a91.5.2026.11.15.20.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 20:51:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 04:51:50 +0000
Message-Id: <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
Subject: Re: [PATCH net 1/2] udp: fix reuseport rescore fallback
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Zihan Xi" <zihanx@nebusec.ai>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>
Cc: <willemdebruijn.kernel@gmail.com>, <davem@davemloft.net>,
 <edumazet@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
 <benh@amazon.com>, <kuniyu@google.com>, <shuah@kernel.org>,
 <vega@nebusec.ai>
In-Reply-To: <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
References: <cover.1794759652.git.zihanx@nebusec.ai> <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
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

On Sun, Nov 15, 2026 at 07:55 PM Zihan Xi <zihanx@nebusec.ai> wrote:
> When a reuseport group contains connected sockets, UDP lookup rescored the
> socket selected by the reuseport program. If that socket did not match the
> packet, lookup retained the stale selection while continuing the scan. This
> could deliver a packet to a socket connected to a different peer.

Not since 6.13, unless CONFIG_BASE_SMALL=y.

> Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q

That's not a hijack.
udp_reuseport_add_sock() lets only sockets of one uid into a group.
A member of the group attaches the prog.
The prog picks a wrong socket of its own user.

> +		if (need_rescore) {
> +			if (score > badness)
> +				badness = score;
> +			else
> +				result = sk;
> +			continue;
> +		}

This makes it worse.
The unconnected sockets of a group have the same score.
So the score of the picked socket is equal to badness, and the patch
replaces the picked socket with sk.

Sockets A, B, C are not connected. A is the first one in hslot2.
has_conns is set:

  reuseport picks   today   with the patch
  ---------------   -----   --------------
  A                 A       A
  B                 B       A
  C                 C       A

Nack.

