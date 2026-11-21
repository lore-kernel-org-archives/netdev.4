Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285249;
	b=U7CnhFvvBiXdkDkp8wwU1axm7xz6xe/74OPEWB7J6qb8UJNmQAIlMqKpIWgxo2pz6BGD
	 1L8SKk0rS/SiRc/RIN9VqTlK4Nd3RWvfDUYBXOcuti8YPF0wjKir1vIWNaq18L7yILmj1
	 j+WlFWJ70L3QGuyI1Lr6YntlMYneZPcHmG9NAV4G0nfj7LtDLC33S8hmtgpiUHaPs+ili
	 WV3SVEDIgWDbr0V7A41Jlt3qdUWcUQx2Ei3PWQhpeRd+TQ4EE5IcZoKsTuQtCUa73Z1+m
	 MIPKso9Mm/HobW4Ne78zokv7ENKIOg//+QjNCOE3miFzKII2T1eqf2YI8QZrJ4rQfuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
	b=TJtH1I21ZbCFb9bRuaQWKl5dKIWawIDlMrsQEQovj8SffKOSiRPy/VpboEO196ne9/Wq
	 T2jucaHmDnkXIXxISqWhW3C0a5e91t99DqGpIR9sZt4DfmYVn3uzteeKAMdxLgTnf/Vj5
	 dEtBxAwn/Y84rQb2H7u9IciDCWXPSJAyGSVJdWu9VT8WdAnLvuw4pssUpssL6HYxpjYbg
	 gg5T+aCx7I2fp38uwsYf3ISOohpSui2ERuN7uEfRsH95fnVZXlZIXndA/9/lyeYRqPIxU
	 Q+NlCKM+5/zCFGZiYAQMvmrHPvRKW1T0jBvbGytHGAZWplfDLxKKJR1iTbxSLYYpo6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Fg9iC2;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05D606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB05D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Fg9iC2
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so2773865a91.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285248; x=1795890048; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
        b=Y+Fg9iC2oscQUEyWn6ySF9qUwqJ014h262RlMdXZ3G2FRej4k+dj8/yhEey/eFa6o9
         LNyx7AVBaq92O2RyZ+R1s9EgX4vWQmp2t2+vojj3P7MXhE3yJAep7L2+3lCEEQhk6zd1
         3T2oHM2NGfxU/z8AbZJjhq+eJQZuz4YG1ri91/DMtSo84cBe8Zay2Tf/N8IC4rBEmtff
         TA3kZGy/D2iQ8VgMjNp/2PwKfuB2XonAEOOCAfhyvyiitB03OoPkj65APvuTGxH0Thus
         p4Jf7bx6oHqfqWs6pFdOI6dCRhs3PawrBUTXoDoIJH0MoPpNxUHkDGhAr+7cjxR76Zl+
         ZQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285248; x=1795890048;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
        b=REBijL/LKjAbahUNe0ThZWqRtCWYPgWS7ipaAY7M4O+48nzfyL8VoxhymA4OxJMVUQ
         BvLXxdPCfAuXZTmUj5eKkyo0dHhsBr8DQhCU/X+KKaZtSEYmxsip8lEQhVQCsAZu/agd
         4tpbbCMjok522Rm4+/g3cYFIkl0pmbmOOoJdgEqc2mQMVJPVdAlyosxLxE3UzxBo1ilw
         TFMU99iQ68SArlOFSuBylKFAjX5h71Vg3M1n+v9wKu4GG+XMYvsm/r2TkHmyGd+TyhLf
         2yeyf/+0TlzeIRrjxqaHIa0JG6B822119Vc7EfZYV0ZSztnFy+ECOYpHIBPW4VjX5SYZ
         aybA==
X-Forwarded-Encrypted: i=1; AL+hErHGwKTEsZEemKBly1n47fZx40A/k0F4o1UXdTr9TCNQBiy85IThqVOCIZ2VlNgzSAyHEUhNSBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nUN+jKikMz7B9GulXyCT87IIXbrnzT4C0zj1iQkCsoh62YpJw
	t0aEvXwKdDxRGh2oVm9OFquwrntG9HY5UQAdS6GwEh7j278zzNIDJ3rV127S/zTcFAvCLMiwOns
	5LbS47g==
X-Received: from pjbnd6.prod.google.com ([2002:a17:90b:4cc6:b0:3b4:50ed:c55e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e705:b0:3a0:9640:803a
 with SMTP id 98e67ed59e1d1-3b41c7e118emr6746307a91.5.1795285247861; Sat, 21
 Nov 2026 10:20:47 -0800 (PST)
Date: Sat, 21 Nov 2026 18:20:47 +0000
In-Reply-To: <20261117215554.68071-1-dennylin0707@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117215554.68071-1-dennylin0707@gmail.com>
Message-ID: <awHetU_All3Iydgf@google.com>
Subject: Re: [PATCH net] net/tcp-ao: fix reset key lookup for IPv4 segments on
 IPv6 listeners
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 17 Nov 2026 21:55:54 +0000, Hungyu Lin wrote:
> tcp_ao_prepare_reset() looks up the key for a reset that is sent on
> behalf of a listener by the address of the peer. It takes that address
> from the IPv6 header whenever the listener is an AF_INET6 socket, also
> when the segment is an IPv4 one that arrived on a dual-stack listener.
> The address is then read from the middle of the IPv4 header, the key of
> the peer is not found and the reset is not sent.
> 
> The v4-mapped check that follows does not help: it looks at
> sk->sk_v6_daddr, which is the unspecified address for a listener, and
> it runs after the address has been picked.
> 
> Use the protocol of the segment to tell the family, like
> tcp_v6_do_rcv() does.
> 
> Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  net/ipv4/tcp_ao.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> index bb7bbc20ba3f..656dbf805cfc 100644
> --- a/net/ipv4/tcp_ao.c
> +++ b/net/ipv4/tcp_ao.c
> @@ -813,14 +813,12 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
>  			sisn = th->seq;
>  			disn = 0;
>  		}
> +		if (skb->protocol == htons(ETH_P_IP))
> +			family = AF_INET;
>  		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
>  			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
>  		else
>  			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
> -#if IS_ENABLED(CONFIG_IPV6)
> -		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
> -			family = AF_INET;
> -#endif

No need to read sk->sk_family.

union tcp_ao_addr *addr;
unsigned int family;
__be32 disn, sisn;
...
if (IS_ENABLED(CONFIG_IPV6) && skb->protocol == htons(ETH_P_IPV6)) {
	family = AF_INET6;
	addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
} else {
	family = AF_INET;
	addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
}
