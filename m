Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103472;
	b=MDaAd5BFMUUebSVx30yWEGRQ9sQ2KlhZL1iSOJCql82KdzR+qWYji8Wx2ZkGmmpIjN+v
	 6o+EcyeBsvwM7pAR2Tgh1+7qNujEL3Z2rmX8x5CR/6zYPzlZ8yg83YwK49EPeFp6vqN97
	 C4ZfvuwJ/aL0XroJ68FwjL7D/8VlTz1D1+xOfsMbjo9YwyifYVWXHTjL1rlbbGIlizu32
	 mh7iEOaDqb4cmNY2Lepwq28ZupAw+i1DnaTzon9i6D3ntwSLiqIkni+XJ8ICmnrK1X1Wv
	 IRv+cS2cKSZF1JE8lJKvoNLGRxPlvZbBEwIwYRA83z339T2x+fWNzEAI2h8f0PNiQPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103472;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mNv9duDmdr+E+4uwAAITXj6VkyKFirznqkpw8zttkrs=;
	b=fDhlXhnmB9EV5mhtyXh1iz4i27BGRlDpJoBkDwzN0KlS1F8uA50zsbg//0IAYQOwF9M5
	 +oUX3RcxQWvgKa3O8GEqAtjcbClhzzFv1qPU6EMknEBy7KHyNe1k8UAq1HcB/77rGrcv7
	 OLJZwSSTkGVCX1L86jHI/otfaMKjRZtQA5cJr6QbrSQReMujt0ppltxrCJWlicKwSSdGF
	 mEyv0784KZDjZVkwCnGQJGYHHErGA4Lr388q+Gfc6bZc+uyxFXdoWPFvppXypp/migcoO
	 Lp+xDS8fZ2TXZaL9xM0eBISeZima7XtbpMkn7y0h8vI++coHvnviAVwSSKAcUD2Kk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRbBS8xd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B8606A320;
	Thu, 19 Nov 2026 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRbBS8xd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4F21F000C4;
	Thu, 19 Nov 2026 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103471;
	bh=mNv9duDmdr+E+4uwAAITXj6VkyKFirznqkpw8zttkrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZRbBS8xds1TFSwEY66JPeKQGLj0dN8kCfuhUO25psxbI+zXc9Q9usiM08yNB1IRJm
	 oHWCPHw6e1Weob6ETcz7k8VqRYYzapPI3b3puSoi3XwyXYo8gIRt1sX9Yit9h/X2Bd
	 sRWVAz4XGMTWsoz1iHhmI1fvTYJzgy9xSlEflKZY3IWxaDe+m32cxqW9+O756Ixa7f
	 /87vnIO88PKAZm+NWGu3l6g7fcOcCCCrIsuAgEBW4Ah0O0H0APa2Kr8NOV1aoWPNPV
	 IabWt01yHbtrAfYrP3Djice+W/rV0PSe5PvdLVQeV4mnfZZ7Hzrq81Z6PdD1dl0ZP3
	 GB5rUa1wkUJkg==
Message-ID: <54447dd9-50ca-43ac-911c-3265be2c1b7c@kernel.org>
Date: Thu, 19 Nov 2026 08:51:11 -0700
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
Subject: Re: [PATCH net-next v3 2/3] ipv6: return EMSGSIZE when first route in
 dump does not fit
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
 <20261117221538.184948-3-stephen@networkplumber.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261117221538.184948-3-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 4:13 PM, Stephen Hemminger wrote:
> If a route does not fit in an empty dump skb, fib6_dump_node()
> suspends the walker and inet6_dump_fib() returns 1.
> rtnl_dumpit() then returns skb->len, which is 0, and the dump ends
> with NLMSG_DONE and status 0, silently dropping the route and those after it.
> 
> This became reachable when multipath routes started being dumped as a
> single message with an RTA_MULTIPATH attribute; a wide enough route no
> longer fits.
> 
> Return -EMSGSIZE in this case, as IPv4 does. This depends on the
> rtnl_dumpit() fix in the previous patch.
> 
> Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> ---
>  net/ipv6/ip6_fib.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>

