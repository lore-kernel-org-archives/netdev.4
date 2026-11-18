Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991107;
	b=kGMGwIQwRbOoExhqjRgOUVub65g9zqPTHd0pwzHUZjW6BN9RyeXKkKV1v4mLQ0r0LJVZ
	 6rVrljhL2Mac5hQTnXLN3FEK8WJmE6cPeuGqbocb11MbKJXRrCw3oSEyF5BXqBwr0F22T
	 /+iHMbz3ieSEamG4q5SZZMOQVFQ+VTWzQVfeOnxPpnvrD9X/K6BhKQ9tkErzbbWioH1zX
	 WLCSO2ZjMgx2dwo1iNmzXN+2uck59CvQOehdXGZ2ugDbRCiBhk1mZnwSdTvltT5ZjjxYh
	 3ne50H/tbTnHUUBEQoMi71RLMwUiJTxDt5fUyyOV/Z+YDdLbB/wYAxK5FIrop9Xx+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991107;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KRtJKN4D7KTr1hM8wuPqB24BsqKEkGefeClnbMZYA8w=;
	b=XdMjTJhG0Kn8y+5pB3KioshOjbcDOSrhNyltXoSi/JpDBsZbiQBR3qV1XzUUYDE91tHu
	 2Gpr/Toak+mA1aAPIrSFJ+Oe58Yco8wVjRKE325bE66fin6WBxpZpLxtUiUFCMH41aP7X
	 iawWiX3RyXgerGtc6vMbOFaHXNCo3Gv7gKeAbiDUT5yepYMCEU0YojHGOCiVXCZl/YhCi
	 J3EQAJSnSCxOStvwsAd9MauaGUYpTQ9yycc9HSWmADyykVOxSe5vMavBbKEx2JC6anRRg
	 8XHIKxtVdXSjt9PSr9FXqnhiBaF9rKYW6iP6fz90PJLOiInBuXn/wXFH+Z2wzOVH3MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpndDx47;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63A9606A883
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpndDx47
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8108C1F000CF
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991107;
	bh=KRtJKN4D7KTr1hM8wuPqB24BsqKEkGefeClnbMZYA8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KpndDx47BE5PHN3YkOr4wC8d2bDJvwZ4SWTFzw18wMRjvayc1gsqvYI0hZDC95qEF
	 ALU6Ze17g/ca//vsoZfQitysDrcDOAqRb8C6Z9C6WWVMlGc8xxqYZnItOeZi4Qvy1u
	 THrX/P3h/6FWt0iKQM+SpbJKLRqZDrq4qceAioNTxpGQWMNfoeCUXpgcyOsBPjAIM4
	 +KAj4GEshy4eUi/SneVPy2sMqiVN5rC/rwY8bIsmDvIXhvcqiihnlY/ThlrEkJS0W2
	 p10X6mpZ/hOtZ/GIJmDZ11yXq9f4nlF+UxlERuE4BHt7Rws/1bZxmtcR44mlj//x/u
	 ugYQxA0b91DEg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f1fso653981eaf.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:38:27 -0800 (PST)
X-Gm-Message-State: APuU4Z9+PmUnAhCvOyeAnkgzVa4t1bUDDI958ODAnEuolPX4Sndgl5Ya
	6BbVyixH0kBSI0rbQuOUPe/eTzlnfIis/6YBLh4DZYtCZLDM7LRiu58khe/KXPSANC9BOaPld81
	8UNlPRxMYgRYGylWqnlQ1wt/axA7T/yc=
X-Received: by 2002:a05:6820:1c8f:b0:71a:ecfc:4406 with SMTP id
 006d021491bc7-71b187ad482mr1476088eaf.64.1794991106787; Wed, 18 Nov 2026
 00:38:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118070524.310356-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261118070524.310356-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 09:38:15 +0100
X-Gmail-Original-Message-ID: <CAL4WiioCxT9izsNuNAXWg4NPbJJMR3z8AXCSj=f+2_+frQ0mmQ@mail.gmail.com>
X-Gm-Features: AclHuK--9fXfiLB24KQhCJA7_PKXTYTcPONOafDRgYRYIXUHHUrYJaZBcAt_Dk8
Message-ID: <CAL4WiioCxT9izsNuNAXWg4NPbJJMR3z8AXCSj=f+2_+frQ0mmQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dropreason: add SKB_DROP_REASON_FRAG_MEM_LIMIT
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 08:05, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> This is used to track fragments dropped when the reassembly memory is
> over the limit (ipfrag_high_thresh, ip6frag_high_thresh).
>
> Fragments dropped because high_thresh is 0 get this reason too, the
> same way they are counted in IPSTATS_MIB_REASMFAILS.
>
> Tested with pwru.
>
> Before:
>
> ... PROTO  MTU   LEN   FUNC
> ... 0x0800 65536 1500  ip_defrag
> ... 0x0800 65536 548   ip_defrag
> ... 0x0800 65536 548   sk_skb_reason_drop(SKB_DROP_REASON_NOT_SPECIFIED)
>
> After:
>
> ... PROTO  MTU   LEN   FUNC
> ... 0x0800 65536 1500  ip_defrag
> ... 0x0800 65536 548   ip_defrag
> ... 0x0800 65536 548   sk_skb_reason_drop(SKB_DROP_REASON_FRAG_MEM_LIMIT)
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
