Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670427;
	b=V264Wp12/pplngChxbxGt/bgxfit7HyAL2S/5IF3aOmfb11p0sVK69uQGxBDd5GsnqOy
	 IL2prQ8pYPqB/iGH85GOhJtcfugbbhYOx+CGxklI8BlLViJlHV5DnA4A7vN4a5mgspnRH
	 e/OFiJ+l8nUphVpK6u69SWzx4FVhH60TxKNBQhs8sbFJoudSkuzmM2WgILez5AdWuDZ60
	 2ufMI1ObcBA3hemE3IsroeDr76Q6x8pznphAZN+odQFmXBUHitDG0IKTBri2NZBKvx9xu
	 HrpBe6KQSVjqR2UGKAunaK3L/L0b/+fhRl0RIqh7ypobmyC6HfmZwmRk5kY+PN2VJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670427;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6IGjr6D6fzEJZcvgx9FvyfcpYyzq4AV1N2b99/KEpNg=;
	b=u4zhPepoeATCf2GZfidpQaHBXaNnKnfDoGpOnFPIZtNLSPyWTAuziOqB0By6LGWBLq0o
	 uG+fpo7A7XnOZ4W/yJUS021UduWmNbHIT2IaKfgSV67KWyx8uivLHDuZvy/ZuZaJWMrf0
	 VOGjkXjYt1RGK4QSmwfrvpoAZ+zdnk3BbRA1sYl58funYyyfP9kHEfLFRZbB5+JrGinze
	 dCJ/FKTfYalhcxpInOAbFV4A4offZBeEITHSP40C7VJ/eUQ07DYvwTF+3VQfTcv86gcSv
	 mrNEYFSgCTQw+022bW7s7fnhoBC11YACbmX10scSDXn+bLYEzoKLtJVWvf3f6OxEzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEQgjd7X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666D606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEQgjd7X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF9F1F000CA
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670427;
	bh=6IGjr6D6fzEJZcvgx9FvyfcpYyzq4AV1N2b99/KEpNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WEQgjd7XTtS6AvRw4v+wDDtXlD70vtoYdoOHpI+EWpmGz4G0JwXsUe+HVYIBVrSZP
	 iM1faR91oPUjCEmJsmwDTCR3hhUoIHC9l/huV7ByJaq9bT9IfG/Y5udD3JmcjCUOEw
	 eyLsM88L4fkQUNFNJgKLZrbWidS3EAJ55NKlghmmAmno/XkEP9DwdqapIR9r5QMFbL
	 FRyXrwkNJaU+fxZxlGpvF+iB9v6iPI82edUi8WuCUl8gTEMs/14zCcQIuuG5/FPF/j
	 GWaL4kVU4d7TCLU1dVh3/BOLkPEZ3UwGrXcYS0xWrYIcjDwNylECUH0NKc8PzDwUvj
	 9OTQ1xaehshlQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f1fso2597953eaf.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:33:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFsofQenUsl8i4yakbiQgI4TFTGozrGbF6XfhZnyPTgOOrw/ZtNr6cl0PC8HPtJFOKaatDhdLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zEF7nxj9PtnGWQ5aB0cVtMuP9IN145tsovMrZz1CUb6+SqltU
	4dxIFY2pvFYGmXV5pswJz/GiAHq1JUZvLJZx9IPRojH1Rr9u2gQVCtCHdfLekVDDVK3bLBpI38e
	ZfBC7hHYByJMuUBG1r1M9wIv2pPmu+CM=
X-Received: by 2002:a05:6820:1628:b0:6e1:d890:3825 with SMTP id
 006d021491bc7-71ab4fde843mr3391591eaf.18.1794670426591; Sat, 14 Nov 2026
 07:33:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-3-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-3-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:33:35 +0100
X-Gmail-Original-Message-ID: <CAL4WiirVAvjv-+2LJbkRcVQ+t_Fh5_Nt9kkJbJsYo7fd9HTXFQ@mail.gmail.com>
X-Gm-Features: AclHuK80nYn4Q1sDQa4udRyJHlmcCD3KHwEsRvAyWMrOkp-LVugCKTsBVeSd6uU
Message-ID: <CAL4WiirVAvjv-+2LJbkRcVQ+t_Fh5_Nt9kkJbJsYo7fd9HTXFQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 2/8] tcp: Don't collapse high density skb.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_collapse() starts collapsing skb to a new skb if either
> of the following is true:
>
>   1. skb is less dense compared to tp->scaling_ratio
>   2. skb has read data before @start
>
> However, this could make situation worse.
>
> The new skb size is SKB_TRUESIZE(SKB_MAX_ORDER(0, 0)) at most,
> and with PAGE_SIZE being 4K, its scaling_ratio is 222 (86%).
>
> If 4K-MSS GRO skb updates tp->scaling_ratio, it can be larger
> than 222.
>
> Then, even the newly collapsed skb could be detected as bloated
> by the next tcp_collapse().
>
> Also, even when only a few bytes are read from GRO skb, it is
> collapsed by the 2nd rule, making less-efficient skb.
>
> Let's cap tp->scaling_ratio with the collapsed skb's maximum
> scaling_ratio and use unread bytes for bloat detection.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
