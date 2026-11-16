Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808040;
	b=jfXm/5xWB+PhKl5l+RgSAg93sqHURh+KhMF1NIPF6bajQnlYomDodysPH/DVS/3PKwvg
	 bi60odoN25xSTvshDctdugT+zrzHt2MGnZrGKqbJHNRLTyRN4PFRBfkQ3APgxdIdIwLkp
	 JUX4dvQlMrf1zOXnWmn0z3g3oSRAAP24rwbd16IO2ypYp+Q5VAtaOTZn75cdYKu9TkoQ+
	 RY6QLQc0HXuPvghZNzHK2u/C+2nU2g16BR3vq/aMxO2pnIw2wcygEWFTe+Tb65RXixvev
	 lms8rCa2z5Wn1EdEuAs9m8ZoQ1LgY1yi87t6s5ILc2dF8T5UWuJWhp+4R3Vh4TQWPCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808040;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gdvAspZggwJA276q0FHn0pkQ7VN/3rpACkNhZPI+9fo=;
	b=PKCFkm0sEDqLSLHH6Z6atIx6mC1FvNjOybrWIpWghedQS11e3Mo2xmyDF4FR/wx6Yrfy
	 oKxezhL6KiHzNI/zuBCL6EZzBUYMvsiCG1tZkgQ7hLZG3pOZLxjLdjJbibtKUxa65Ms5u
	 ZBCuJScMqgriRJKXhFqak8C1tGHmkaWQDXmeb7b89wHI60oY154WJCLBVLpkWJd5J6dzh
	 LFzUN+4L6QdnHJanEGJhRjlilLWrSL0xkG2BY4dmtTyWIZ85JWhZILH+IgIZD0/Z7cTm9
	 bDXFlGN1ysIC4uAUhsuBYvc72B8/HEcZlADhkBcRHyYvQtZtpR0B7mhWK8sIMeDUIWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lMHJujFe;
	arc=none smtp.remote-ip=91.218.175.231
Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA57606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lMHJujFe
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UQOsUJzIqjEeGyyOxOZX8x3rD9PH23RKiC6Lv6Uz/rE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794808037; v=1; x=1795412837;
 b=lMHJujFetMmatZAvjvRId9Toz0ZGyIQfBGZmZ+9EGsPvbTM165gKXG8ZGLk2SXkKlkfr/5e6
 GvV55I56NpjWLpmLZ1rLyBwf/+v1DggO8K7OYHB9uxjzlEcMaAHldZ9gsDSsSdvzuL+wvpwxI+1
 1M5yXJtb9Ext+GzF3EzSWEH8=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7377c0c34a4c72f3;
	Mon, 16 Nov 2026 05:47:17 +0000
X-Mizu-Trace-ID: 7377c0c34a4c72f3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 13:47:09 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Justin Iurman <justin.iurman@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	andrea.mayer@uniroma2.it
Subject: Re: [PATCH net 1/2] ioam6: drop the packet if no outer source
 address is available
Message-ID: <avqYw4zlIvpnKMNo@fedora>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
 <20261115000047.14669-2-justin.iurman@gmail.com>
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
In-Reply-To: <20261115000047.14669-2-justin.iurman@gmail.com>

On Sun, Nov 15, 2026 at 01:00:46AM +0100, Justin Iurman wrote:
> When no tunnel source is configured, ioam6_do_encap() ignores the
> return value of ipv6_dev_get_saddr(). On failure, the outer header
> keeps the source address copied from the inner header, so the packet
> is sent with an address that may not belong to this node.
> 
> Drop the packet instead.
> 
> Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")
> Signed-off-by: Justin Iurman <justin.iurman@gmail.com>
> ---
>  net/ipv6/ioam6_iptunnel.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
> index cfb2c41634a0..4990ae1ee78c 100644
> --- a/net/ipv6/ioam6_iptunnel.c
> +++ b/net/ipv6/ioam6_iptunnel.c
> @@ -324,11 +324,14 @@ static int ioam6_do_encap(struct net *net, struct sk_buff *skb,
>  	hdr->payload_len = cpu_to_be16(skb->len - sizeof(*hdr));
>  	hdr->daddr = *tundst;
>  
> -	if (has_tunsrc)
> +	if (has_tunsrc) {
>  		memcpy(&hdr->saddr, tunsrc, sizeof(*tunsrc));
> -	else
> -		ipv6_dev_get_saddr(net, dst_dev(dst), &hdr->daddr,
> -				   IPV6_PREFER_SRC_PUBLIC, &hdr->saddr);
> +	} else {
> +		err = ipv6_dev_get_saddr(net, dst_dev(dst), &hdr->daddr,
> +					 IPV6_PREFER_SRC_PUBLIC, &hdr->saddr);
> +		if (unlikely(err))
> +			return err;
> +	}
>  
>  	skb_postpush_rcsum(skb, hdr, len);
>  
> -- 
> 2.34.1
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
