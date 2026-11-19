Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103445;
	b=WF9OnkbezRcipMHphrZZB+EPY/nHEfBfdyFt7jvje0KNGiKYlmK18qCw50tnk7Ia9Y1p
	 uVBqTVkcroDGpwfCadi/KxwOvAt3eounNycHYJxEIhaEyzLcDIpINn/1sbuET2TO/lyHl
	 zr4fae54HU6o3Aoi1MUBt8iinFawlnRlx27jE4iwaYgVYxlKcH4fYjavNZd0m2F/GcdIq
	 ruPGsk9wf1TKw050HxgA8c7UqKzRGjJLznju1MuP9xhmb2z9LMSO6MdI+Nm1sn4+PWMeP
	 9hGd05WROgw58NrVCtPEHShw4lsj8gQEiempieci6pjmGgmc8kymhLnXekC0tjd92AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103445;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=62W9RY7nZd29DN8Po0/bEaRLPE+4tKh51aN3pE4XOWE=;
	b=Hu/j075nG67rn8z5oZJqnRhGhjBImukc1wKOh4jvj33Srfvda8bi2XuTGGIDRbX/fgVT
	 bps104KzbqhPCN1TFTGk+hb/noUv6B8QIcJfIo8ZENbPwHVUjXRalFSWGqtuuIFKBXCGd
	 NkDXKsnLMP6NVzvbGkyjcqtp8yjHPojyZugAjwTAKlZbNi9Mmk92mREcb5QK1YTcZFUSF
	 GN5Q3TZKXDrCTRnB8utKQDwFw3V/GdN36b0tuztQBK+InArtZMhY4nWFMJ6908X8TgYv5
	 Y/Njgq6wN3bXjPf3YBSAzaFCQKLu3bepThjKXS4cv/RxQTL+ONSXzfnN/Rpcsa2pKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz4g+Qgx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53B606A324;
	Thu, 19 Nov 2026 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz4g+Qgx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4EA1F000CA;
	Thu, 19 Nov 2026 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103445;
	bh=62W9RY7nZd29DN8Po0/bEaRLPE+4tKh51aN3pE4XOWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hz4g+QgxWI0u1pL4SdlNXI94Qj7MVmcXKvWbeSgpUuUKxZVgAvPxIf/L3GMUbeStS
	 Kg0inaxYr1zhk3Vo+eAShMs5VuryUCqAyh/TxBtqWWVATIFp1zPS+Odg70KnWaMx5Y
	 HNd5vwgYAaNGaULB6Yf4qVLjhfPIGRbE5hBuRykOTKy3VXFD+tWpgTi+K+BoLO4qWh
	 RY/cOLDsnXvcq2UrIhWQWpdV1S/Rez8zVSwameCnTmJDwlO/fbbaqtTFQRZGO6qvx7
	 Y309eYrluDGB3auVzC0hb87i1P/HXf7MJvySkEiCvnbT7eifZa9enFG2SXHCDRH++0
	 Nxcmk/Z+zgdhw==
Message-ID: <e8f2770e-68bf-4b1c-bc9a-7bae4ee3f9e1@kernel.org>
Date: Thu, 19 Nov 2026 08:50:44 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first
 dump entry does not fit
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Andrea Parri <parri.andrea@gmail.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>,
 Willem de Bruijn <willemb@google.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
 <20261117221538.184948-2-stephen@networkplumber.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261117221538.184948-2-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 4:13 PM, Stephen Hemminger wrote:
> If a route entry is too large for the dump skb, the dump is silently
> truncated and no error is returned.
> 
> For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
> -EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
> dump ends with NLMSG_DONE and status 0, and the remaining entries are
> lost.
> 
> The first dump skb is allocated from __netlink_dump_start() while
> max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
> kernel that is under 4000 bytes, and a 500 way multipath route does not
> fit:
> 
>   ip link add dummy0 type dummy
>   ip link set dummy0 up
>   ip route add 198.51.100.0/24 table 100 \
>         $(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
>   ip route show table 100
> 
> The dump prints nothing and exits 0
> 
> Only ignore -EMSGSIZE when the skb has data, so that an entry which
> does not fit in an empty skb reports the error to user space.
> 
> This only covers handlers which report a too large entry with
> -EMSGSIZE, such as the IPv4 FIB dump. inet6_dump_fib() instead returns
> a positive value when the first route does not fit, so the check added
> here never fires for it; that case is fixed by the next patch in this
> series.
> 
> Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> ---
>  net/core/rtnetlink.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>


