Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855972;
	b=Rb19BWsBVN5t2i1wyUIKy4pQeJ4XFmcXY1JDo18CvFmbcGk0t3CfQ9w2yU38mc+ZmdjU
	 laTRZbS46kFVxfLK/JBuDetH1twO2K56Cj2L7zq8AlwBpw2ix5dH+Q4+OZeZBkI6N0vDU
	 EseWyMYVQgt4zRZkLHmvCPCcFoA4LzQZYxp5zF4NdiQiejIbcAvQpcPhj2zEiYqrbvmTw
	 FRxkO9GwwmW5n2FN+mSsSH3SikCBXN386PtHLUvNDRUyeMLZNteg0GnRfs2vCZaHGvUDB
	 QizVI4sZ82j/ny98muBlAB84x+TKxjLSxmw0mVp7qzhDDi0U3r+9qSTdg9peFmirzgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
	b=r6Qz3WnjelCPmEj+MnFydiMhuVj44fyjZuo2w2tlA3EMmpiVRc4GGwilktJCQdp0S8NE
	 2c5k7oyh3v0pCl89GGlujakFgNPFI/KYsJkpm9FpSM5fIAnCQJru/Daq1DrFSxxcIx3wB
	 pafVQVUDxW/vCWtM1cmCJ/YLgZ7R4rvzcbAPCuHNLfAkUDMDizqQWwic7+NzT1GHBPy29
	 GIkEtpbn5W+QBhq5+ArDLPvc7cHIxhUgSlzvqkaIO9NBJl5QnURGP2d1YbtO5Egjpc2oG
	 PL92wMZz245Asji4rms4RrWE7mvgTWw9bVapiGf19eQ8jBD0MC//B3LA8+6F4/JJKdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E67606BA35
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E67606BA35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so1006357e0c.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855970; cv=none;
        d=google.com; s=arc-20260327;
        b=VN4i415+yCd5LaeZCi4y8JlEldQNPZt2cxGsTSmMrywG6I4DRqd8RDplUaKl924afU
         vRHu9HAUk7Bri1jBrgD4Q8DRSyJ4zvpMA7Iw6Gj/DsKl2s7gFE9eubbMQQxSPhutbPj2
         X2ciXwZNefrmT9wXZkT1+XiOvljKaAVTYvGQX2n7kdnsLMjwCjpQo4O4nflawufxfRid
         eBjmPrpGTCZbxh9W1e+BTTEfJFC0ZVuL2HPzrd5WzGt5I94VAMA6LVYNsrisa65K1qiG
         1PbS30+EQ514mbL7stHvlKXVbYb/7v6mP0HWBqf0Fv7xGBl1+u+igsGfhWIcjjsF6+q1
         4LIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        fh=S54Yjw9VaE4tgt2n0MgSYRI9pVNAvD5Mt7YEx/ML3t0=;
        b=q47Mka8a9yyABb6yh/jufLesZDmK/bvLQJrTmTePOPhFoGm7UDU6vW1FBwIO13GySZ
         YaeGBrp4ZEfyne520sc1YMoNp3sp1D2BzJIjhB7AOhvjCSdg7m6YHwmz+RdIZBFCad4P
         6UqP/aQZF/rvhS072G0m+j0x7+MfIrdsqeiNxeDj8fw0ws9w2qWB2HO6qeZX7IferUN7
         Vbum+nNRBbmVDLmp87rQaMtW4084cxb1QCLCMQO5T5HsDYKga5ZHRYzQa3eBCcDRYTY8
         7i7O0qBRLmrWr7zJpUndCPdIfUctrgBCBowF8a5aXUsW4r+wup8+kfNTLDDFyuujp0dt
         S0jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855970; x=1795460770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=Jm2Gk8kjWWwRV2Oi1KDcMVKvvo2dKssVrRlht1w65ARIvAvJHtaRkh5gALMeNGFexR
         j2tS4wtXZv6yXg83D423lAlXUdUogfBCNoql26Ht2pY9lBro3u2idDSeOaZkduUKxiwt
         g8cTxqxbDTTTOvMQZYgK5qFPiJ0jZJY9+JwRFURRFaoYKECLPDoGE9lTtLEC5ClMw6zQ
         W41sm8KufFyLvIFlC7ApPY7fL4TIZGIgN6ckkuKJV1IWh9KX4VRJ9wg60OI2QVITa/7B
         h6XBilkVxUviYZ0x1faQAS+D45VQIabR3Pm3OxpAR6OX1tFpiMiSDb/O757nTsQGAq9T
         DLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855970; x=1795460770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=QogQrHceIZ/49V4F8wD5B9hDE8x4hgyjCsPBiWtlXFBIiexBWRLLJR+eG9t9tRAopu
         4fY4vFv+UVsUfO8myatCXgbFlkIgD708RxGbEOOq4YTOsCblYdoGQQsP8GrhjKTnROWu
         XMFty6Z+gPDKjyiEUDD2n/bNwGvvwOIWO6hOk3Zoqn+xLX0Lyd1gFVKkAjsO+4+vJ8WX
         D5YtWkgD2LJPG221eL85KJgQZA8OUjIHBDmp1ibya2vKbDfey53NqjCntFW2tI59Hx9p
         JgkJmOOGowFAMUjcdkacjLg7cJz4TuyzXSRovlZ9rgudbNLcXlCyXcczU0AnAWbeZxvs
         kFfw==
X-Gm-Message-State: APuU4Z9AdhH4Yl89ymiZiQWp7KkV5QubpjsArAdtBaAZYxZ7gn2RVzX1
	u/ZpgAcbnCSsp49tmveBrw62XebeSeyY2ASYu+iO50csL8NAwdDl/TyeIps/F324haZJjIy8r1n
	jnltmADvYV2tKeI2zctWVc/RKb9dnA6sAujmWfydgRw==
X-Gm-Gg: AYBFou0S0xFGe1s3fvob53TrbVGS7Ouz7zXq2JRRjmpiqXgSdR1uUItC2bM6SGc27Tm
	ICZgyApAeGYMX8+T2G6yfmXR+fwaOqOAtxbu5EK4SyBNIyIjcbdOt7qyIW6u5FJbW29aEdyDnK6
	grxGNerKh3rygNsfgUAwg6wMwGsu3ci3JcH3/d88Fw8D7XWDFq/z7CL3pQSBWW4l7NwxsNNqdhR
	hktwZ/BMqEta3eLk6girSmlQ7igE4iUNKOIkCyqRGAx2awGpH0qgDu2FuodLhuhxbDHAKflDuVa
	hegIKi184HtuK9jKzUuLb09NuiWjCxl6C9KrQAkimJZYAKUbTf6kpdV9A3L7/I1mFnS+C+t3BNl
	XTKV2dIR8Zo8JXdsOXmipGFBmXaae4T++uqvixVizr42Ntxwq+fbB5efwT8KzcvnDnOqQQYJAKX
	gQ5VVqe9dNhfpNPjrFXr9dzmu92/P9n1UA3h9ZpxnCtu69jKQDC8uGIdCCI+5fa8itpoMzSBoXU
	7P69N2Pdw1WAz31WpI9PIxj71pPffdw/cuVmnxYQ0Mp5Do=
X-Received: by 2002:a05:6122:1b10:b0:5ec:4a13:8aae with SMTP id
 71dfb90a1353d-5ee34a9298dmr3969191e0c.17.1794855970467; Mon, 16 Nov 2026
 11:06:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116190111.3317976-1-rjethwani@purestorage.com> <179485574283.3291.7349043137994808253@kernel.org>
In-Reply-To: <179485574283.3291.7349043137994808253@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 11:05:59 -0800
X-Gm-Features: Aa3M54o7vX-XpVUCQ5-uuaPc-Fmkae2NyST6GEXFL4X2HiaIMluNfTh_m5Er0I0
Message-ID: <CAKaoeS29P8SukOACusGaO=7z13_eFR5pFWDjbYqurgYd2bVz9w@mail.gmail.com>
Subject: Re: [PATCH net v8] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jiayuan.chen@linux.dev, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Dave Watson <davejwatson@fb.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:02=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by code review. The sleep in atomic context was reproduced on an
unmodified kernel with CONFIG_DEBUG_ATOMIC_SLEEP.
