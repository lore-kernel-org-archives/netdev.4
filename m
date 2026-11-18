Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966669;
	b=sNq1G5luly49yBT8ingYYstxSTY4yaAZS+WVOmOycjmXlAVpjV3hlPWeggGc14H1LV0c
	 ENbZlOwpJAIwc/Eq2icQuukkhlvEBd2YZxYYF2O7TuLfofjbeJnVW6Mg6I5IhiyqHOf4i
	 VGg8eJsPeysWegA4nv693L3MabFZjvGlG8mnc5q97g+W5hWTKe48x3lXOHO89iqiXAmIw
	 6/5fjE40RhN/LNKgKpBkcBiOc9GiswsvnOSY9GHOHTNcKoQ73NI8DDl5SwF/dn4UFoKwv
	 I3V/urzj3+o9lXQPHxKStP7kV5MKaRk6rUG5LahKOcaoWdFnkiMXtErktZUE43iL8kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xui+L1Kl8YV8BY/zkHbqr+YzjXk4VH0pkRVVyFr69gk=;
	b=DP7+xUmFAUaYDFkKVulbhN6O4KXzc+qWf89nGWh4Ts9xaIji63nPn1yjOYuXQAU3wXs7
	 l/pkfJJxtvAJ5x5TT6ZsoKkINi4gduPyMgfCbyiOpL5bg/5sqRfImi820pFWbrVP6nktV
	 7XcNhvX1LM/rnvlv+cMNrFXJk7FGwaBEuAPLBp0tTjEPvV6wEmTSwqNIvIFprpWrWks4L
	 5EXYCeSitG/rPhmd41ZxpoEhod9kLcxFY/BIJF8KbYBldwRKdrvdLVYEZg8slzfmC7Cv+
	 FetMHAhJ3pSWxxmroOB9Gl1kWmWSli86jJGVziXYYLn0Fw3bFj1VVqbPW2vOkTYKqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ln3yavLO;
	arc=none smtp.remote-ip=95.215.58.92
Received: from mta1.migadu.com (out-92.mta1.migadu.com [95.215.58.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354CF606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ln3yavLO
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rm+AxKqTEOXCpk9Th0qeoefjY+08yAH5hlAEglN9Rgk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794966667; v=1; x=1795571467;
 b=Ln3yavLOPytuKHfZPe5QYObzrdgPsQkepZJE4WVOafWZy3hLA3nYTZc3C/7QztuWz6kuOLNl
 o/OteqBnBpLONtPkSKfIWAr5wKLl04XXL4upWSW0YFmqQQkiY2GoW/PFGrkXw8z5Hb9jK6uAKGd
 EPYm5u2j9OaxUhESxsoQscF8=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f9f5a1b8f39bf639;
	Wed, 18 Nov 2026 01:51:06 +0000
X-Mizu-Trace-ID: f9f5a1b8f39bf639
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 09:50:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Hyunjung Ko <hj351016@gmail.com>
Cc: James Chapman <jchapman@katalix.com>, Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Chris Elston <celston@katalix.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] l2tp: reject short IPv6 address attributes
Message-ID: <av0EfxJlYXo2XbU-@fedora>
References: <20261117092157.85513-1-hj351016@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117092157.85513-1-hj351016@gmail.com>

On Tue, Nov 17, 2026 at 06:21:57PM +0900, Hyunjung Ko wrote:
> L2TP_ATTR_IP6_SADDR and L2TP_ATTR_IP6_DADDR are NLA_BINARY with .len set
> to sizeof(struct in6_addr), which only bounds the attribute from above.
> l2tp_tunnel_sock_create() then copies a full in6_addr out of each one,
> so a shorter attribute makes it read past the payload. If the attribute
> is the last one in the message this picks up whatever lies behind the
> skb tail (stale heap data unless init_on_alloc is set), which ends up
> in the socket address and can be read back with L2TP_CMD_TUNNEL_GET.
> 
> The commands are GENL_UNS_ADMIN_PERM, so this is reachable from a user
> namespace.
> 
> Require the exact length.
> 
> Fixes: f9bac8df908d ("l2tp: netlink api for l2tpv3 ipv6 unmanaged tunnels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>  net/l2tp/l2tp_netlink.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
> index 89ef04c78787..a07009d4cb00 100644
> --- a/net/l2tp/l2tp_netlink.c
> +++ b/net/l2tp/l2tp_netlink.c
> @@ -910,14 +910,8 @@ static const struct nla_policy l2tp_nl_policy[L2TP_ATTR_MAX + 1] = {
>  	[L2TP_ATTR_MTU]			= { .type = NLA_U16, },
>  	[L2TP_ATTR_MRU]			= { .type = NLA_U16, },
>  	[L2TP_ATTR_STATS]		= { .type = NLA_NESTED, },
> -	[L2TP_ATTR_IP6_SADDR] = {
> -		.type = NLA_BINARY,
> -		.len = sizeof(struct in6_addr),
> -	},
> -	[L2TP_ATTR_IP6_DADDR] = {
> -		.type = NLA_BINARY,
> -		.len = sizeof(struct in6_addr),
> -	},
> +	[L2TP_ATTR_IP6_SADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
> +	[L2TP_ATTR_IP6_DADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
>  	[L2TP_ATTR_IFNAME] = {
>  		.type = NLA_NUL_STRING,
>  		.len = IFNAMSIZ - 1,
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
