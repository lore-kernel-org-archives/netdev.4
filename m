Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873355;
	b=jN33kacsNbychiC7rZVEn+jiU5aNHi2kKO/veVR91ocKSj5Wo98KzigAjFlJgUb5F6RS
	 H/PQhC1HrA5igCRSSqv++UW8gxfEgbb+Um4Z7YxJ3ta0tuFLYqmXGEP6J/DMdriHJYpGi
	 yia6J3/UVZEDW//+LXmf9ZhjL8FNCVxtDgWTNLv6K+Kv8s22/SctFm8oAiC0Lv1pWgnZq
	 DJ40CwP5uFs4V5v4bOk7oV2JGbX3TWbAt5xOQQye8crPsDm/6i/rlHE2PB5AV5eCNgwNP
	 gsjUl/W59N/fRnifws2ytboDq+Jk8nGgxnJ0gUvZBWxJN2rUqMEFQo+YWSWpVzFJw9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
	b=G1CFN9aLnMHY9MpZKE71dLYVO9cCmZJ91wnelL8HLaf6senu9U3DT/VftZzmEHN+0b0U
	 3EO1mCWXBu5UnFSeXWG3tNAWA4nHYodpPyJCqdUb9YlimpedfvZs94rVz7wk4SCScuAUK
	 0n51/VPTF3diAmU1ECsBW6SKYXYxR+AB7ZP0jkE5QBAkgIm74oBQc5XM6YJcd8hz1ebtR
	 w/zW0FnKgiFqqqTHyXfJvvjYovDQQekpiImM5sTjbYBRFyclXmNIm7/HAhx6tp4Wy8/Fx
	 iAgWqXen06dArvp46lIP8HAWkuJBDdeDdPgegVtYudosKbgThDP4XvRiz0Wx9OHQp+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB2606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CB2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4877837890fso2575006fac.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873354; cv=none;
        d=google.com; s=arc-20260327;
        b=KnDMT6ZCTF+dM5zTBPhmgWadn9NycRCPJL3xv5Lu46++EbcgJrUucltW7FT/RzZ2Xi
         HKcVf3HFRyHZCnOYFdO82ANg0DiVmZI43KGUBoFVENgA1jJsVo/eHTrMIsiYqh0+YbvF
         gW1WoswGflDDKPknf9HPRXaXBz2mgmaZzdB/9O/c5A8Sxtjz7pc5DXhjHcBpToypf4sq
         rAlGhM6EZJHPPwO/yMF9Aa822sizZpB4Y9qJLpQZJRBavDD0rLSXzVRFKDnCBArJ6ule
         tOBZVpKXu9Qn4H8a2wksHnsEDy7Qo2azg1IWlMSNFKKI/hkE3fB9mBe70X9YM7TDmTfG
         Vk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        fh=JLQsFxFN8kXe16YOJ4yJ5i5+g0BQ9lRu1f6HI7XrlGk=;
        b=UKUocp+2hx4vSpPR2dM3UXCnbR6mRNduwAq6hmGQ73+eMzCa1yYPHI2QIoMQTYxxBp
         Lw6f9mYPhlrcRpjSBwS546vFwAZQvmGeIUzeT3O5gkRfbKt/K/fNe9r8LNr7vqorZ6Pa
         4j1eOqst0VXqofeoxgywJlATiT/FYol/Yot4cKxnwO+H9yk/c59Wuyr6UrHwNaJuUbIa
         7HtxtmE2zMqPFYe+5SsTNR2Gwc9isVxMsQwxK9o5MxpuBVGYrQ+SEdDoAiW8RfduTxFm
         0f7g04k4/+N9JpfKcKybBkQpxcvkLWlVjMV6EFDtcynWyqNfCAvLc31I6FjaEXROoa9H
         BaaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794873354; x=1795478154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=JAkvmEBCaNDQqwC/zKowMzj6cpiI7lgA6iaz0LI7B90FIdYKT+zfc8mHOfbT+8rfmy
         SkxZwQ9E/3nRcFpOdPfK4YkO31ptJrj017y76GEN9o+sriJn2LpPhsvGdy4+6ZVs7P7b
         gWmNIxbWSERHhTKd2zkL1m6C4vu+dM8FCwNbEDFmf98bujAm6BesiHJVeKB6Mv37oIXE
         DWAm2yXQzqAAVjsc+DybarNPT6YXVie4MGJHRFFkjGvmOyHEShJDDqv0maNaWckg64Z2
         L/XJP7qjo7r7unFg1B4QzrVD6lfR0b+R5Old5lYIyjznlmAyd2cbZ0Uxx0FLIGVM4o9N
         a3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873354; x=1795478154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=b67Qc2Y7zTp7/DvL5oAh+Ci/kC3pbkrVelyVJ9CJjUf5eGokv2pjmugZ0UqdYpLMLN
         xczBXh958ZGxUoJGWdmH5dsG2pAtEl9wCfGE24n66uyZWhpDZU/GMF6WB7FfMUAXGpeu
         VHG4eJPRzYopfhJvTqc0fB9FkhkjVkyR+ck3ZUQ+TR8tXEObttL+vW0JtVLIeT15sOWV
         vFJ/uBIR4TREUPfVC1x+0blg+Xs+07MVistgyPbv2b9/zQmqQxRQNk/yQ/mOqNgjlygo
         BfBtrCYk2ea5LDAugA7IbbHC4K/6GASEH4ACeHmbuqEfzAc+DjyGf0RV+S1sRKzNtl2k
         atVQ==
X-Forwarded-Encrypted: i=1; AL+hErFRS1vnHMYb4r2two4NBUog9MJsj+aIfdpGh7of52Y1ZpOcalrN8Ex+d/kB+PPO0teRJCIh6cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xku1zONa3x8GdOZHD5pDrOcGGvWgDKpkjJbxfiRSFV/F2oLWh
	jgOlQ3lSyme5ay3a0PKvn86XANjcKW+Mp9eqB5vYWnLgRjBN8zOKt4rY8sY+w//75gGtKHc6apC
	tZQMV4JJvdFi/Jfts+y/ktxQ6pKToPoaB1VM2v2jT6Q==
X-Gm-Gg: AYBFou31xiUJP2/olnHD+50BXnVig0gLxHxb/rxHg2kPdahdrScJZ5BBSMxE9jvrFGp
	SV5VjuwfOgwjBmla+uf0IfFQGiA/fTERNc3G1BSTVx0n31jOLRaOlMIgw7pMiPMALnBFN9MHrOB
	9yHywvLL0Yq7p8+wW5RtDGAg6D9S/SM6HcbtwI4PrslWLlcBM8p5ErbOFdJIw3BCDEYag+qb3T+
	nzC+m9YVxDCGHafrBb/IH4hK7quqTmmg7x7V8/LiLyy3dnKT+W1/nCAqvqZzr/Ih1Hm0qaGfjuD
	4bnbMnBGlrnf+5oDvipek2CzsK6kHjLHLi1aLE6W07sb1k2KhYdB75UA0y2MoYobpxdWOZgAuK+
	rB//K3LcYEskjRm0fV9sXNhmw3ks49rWr88zWgHT1END5oC3v5DgLt376WPMvOCob0mgpOwltr0
	QRIPnmDkNBIA==
X-Received: by 2002:a05:6871:b2a:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4afdf70bba7mr10365207fac.28.1794873353687; Mon, 16 Nov 2026
 15:55:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org>
In-Reply-To: <20261116142710.347e8571@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 23:55:42 +0000
X-Gm-Features: Aa3M54oRvcr-c3A5HCcCKnOxqAqDaGkfnfsAP0Ey0SL0I7zgF2gu0s6ZsVqnle8
Message-ID: <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 14:27:10 -0800 Jakub Kicinski wrote:
> The question is _why_ you use it. Let's leave the cpumap case aside,
> you provided no legitimate reason why having an XDP prog in that case
> is a problem. With veth - you are right that attaching XDP causes
> problems for pure skb traffic. For veth cases, however, there's no
> strong reason to delay the skb allocation. Hence my question.
> Why not let the driver allocate the skb if we know that the
> redirect target will need to allocate one, anyway.

Sorry for not being clear enough.

On the setup we want to build: an XDP program on the NIC does the
decap for all traffic. The services run in namespaces, so the packets
must be delivered into them. Some services attach their own XDP
program to the veth, and some do not. The host does not control the
service's program.

For a veth with a program, the skb path has the problems you mention,
so the host uses XDP_REDIRECT. For a veth without a program, we want
to use XDP_REDIRECT too, so that the host delivers to every namespace
in the same way.

In a minimal benchmark, pktgen sends UDP, and perf stat counts the
cycles on the RX CPU. bpf_redirect_peer() from tc costs 3% more
cycles per packet than XDP_REDIRECT with the checksum status kept
(mlx5, one extra __netif_receive_skb_core()). So one XDP_REDIRECT path
for all namespaces is both simpler and cheaper.

> Since your patches are not a natural / clean extension of the existing
> infrastructure - we should step back and make sure the use case is
> practically justified.

Maybe I am missing something here. XDP_REDIRECT into a veth works
without an XDP program on the veth. To me, it is natural that the RX
metadata also reaches the skb on that path, without attaching an extra
XDP program.

Thank you for taking the time to look into this. I would really
appreciate it if you could point out which part does not look natural
to you.

Thanks,
Tianyi
