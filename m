Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502875;
	b=zYCzJPocJv86sVla4oQgFlsmh+LYlXkw5ML/eMHnD1ulnhe1BsQ9nN5psVPpQYlWq1Fz
	 5Qsjqh86+ZksUddChWL+UPs4xFgt5ygEWHE97fXDiCleSjNT59fukbj89AfDZjLpdygWN
	 7H9QVe77QSaDm+NSbqTGmzgAPwTGPSiBicGR8oFF9HyzouZiNEKk7NS6EfIsg/3HR0TZE
	 0V//VZ9cZEPdhi9VeRvkB9sQbwH6iLfDcYJWFzML+pHXpOo2d+AP92ezHbkRqDLeo5BBi
	 VUtTCIj+jzpgGuCS+2LM5whqonmP6PyIVQUO77aUpf3ho8fxDJeGIH1oZEtKM+FmcUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502875;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gFwBodHAGBDbWf9JpGhvw7svf2pK3gtlu6FQIiMCf9Q=;
	b=nf2Vcie5SBOLL+waLQckThKa7nJv45ME1B8ypdloF0nj0/32c0tVkoJy5OYajGM+RU4c
	 1NJMok1oR2abBWHWfQAU5gIMNyMyGbNpom2upvU8TJzDs6w7wWuYmFQ4gsAzuUdTrbGjQ
	 oS9jg83BzIBCwNuQvlQ3b9B8O+LROU17UvK5zSKxGBzxudIRuRR+lL0FiWg2P72HOzEGB
	 8lEIJn3ZGffWZb8qoliIZsjVae2kzlheTAnUnIIPfN/owAajLU+vzOUsi80gK12YJCx7j
	 id7R7Z0OuCPhZxeMvrn3qJmxqWtEq1BryLZnAnWyKFN4vsvZe7ct4vxBUFIa1oJ0xcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iRQvAcou;
	arc=none smtp.remote-ip=91.218.175.110
Received: from mta0.migadu.com (out-110.mta0.migadu.com [91.218.175.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B3606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29B3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iRQvAcou
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MCB11qv4KSVKKMEE6AuGYmXMoszO6pWe2RyhcuU+7T4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795502873; v=1; x=1796107673;
 b=iRQvAcoutYVwsy9Rk6m+2ohowrSVQQn+Pv3G3+wn2W8lzHpebcB5vvaAA1pfPZaSKPEdz9RR
 gPNQcVR2jMj78M0uGDUBXH+qeMU5bwpI15pO92tLde4O3OYVW2AjIeDZNHxPkn9HcUwtnmLhPCI
 D1xY+R65n0ByF/lKhJfeL5uQ=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ab07041aaeeca585;
	Tue, 24 Nov 2026 06:47:52 +0000
X-Mizu-Trace-ID: ab07041aaeeca585
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 14:47:44 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Gabriel Goller <g.goller@proxmox.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] vxlan: always report local address
Message-ID: <20261124064744.GC14932@Liu-laptop>
References: <20261123-vxlan_preserve_local-v2-1-72d89179a98d@proxmox.com>
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
In-Reply-To: <20261123-vxlan_preserve_local-v2-1-72d89179a98d@proxmox.com>

On Mon, Nov 23, 2026 at 04:10:06PM +0100, Gabriel Goller wrote:
> When a VXLAN device has no local address, link dumps and notifications
> contain neither IFLA_VXLAN_LOCAL nor IFLA_VXLAN_LOCAL6. If the device
> also has no remote or group address, userspace can't tell whether it is
> an IPv4 or IPv6 device, even though the kernel stores the family. FRR
> runs into this when it finds existing VXLAN devices after a restart.
> 
> Report the local address even when it is unset, as IFLA_VXLAN_LOCAL
> 0.0.0.0 or IFLA_VXLAN_LOCAL6 ::, so the attribute type shows the
> family.
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> ---
> Changes in v2:
> - rebase
> - Link to v1: https://lore.kernel.org/20261104-vxlan_preserve_local-v1-1-e9b51f2132b4@proxmox.com
> ---
>  drivers/net/vxlan/vxlan_core.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b37472..b7ad60cb5d12 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -4765,18 +4765,17 @@ static int vxlan_fill_info(struct sk_buff *skb, const struct net_device *dev)
>  	if (cfg->remote_ifindex && nla_put_u32(skb, IFLA_VXLAN_LINK, cfg->remote_ifindex))
>  		goto nla_put_failure;
>  
> -	if (!vxlan_addr_any(&cfg->saddr)) {
> -		if (cfg->saddr.sa.sa_family == AF_INET) {
> -			if (nla_put_in_addr(skb, IFLA_VXLAN_LOCAL,
> -					    cfg->saddr.sin.sin_addr.s_addr))
> -				goto nla_put_failure;
> +	/* Report the address family even when the local address is unspecified. */
> +	if (cfg->saddr.sa.sa_family == AF_INET) {
> +		if (nla_put_in_addr(skb, IFLA_VXLAN_LOCAL,
> +				    cfg->saddr.sin.sin_addr.s_addr))
> +			goto nla_put_failure;
>  #if IS_ENABLED(CONFIG_IPV6)
> -		} else {
> -			if (nla_put_in6_addr(skb, IFLA_VXLAN_LOCAL6,
> -					     &cfg->saddr.sin6.sin6_addr))
> -				goto nla_put_failure;
> +	} else {
> +		if (nla_put_in6_addr(skb, IFLA_VXLAN_LOCAL6,
> +				     &cfg->saddr.sin6.sin6_addr))
> +			goto nla_put_failure;
>  #endif
> -		}
>  	}
>  
>  	if (nla_put_u8(skb, IFLA_VXLAN_TTL, cfg->ttl) ||
> 
> ---
> base-commit: 2388bb763e323442f4dd8189238ac0c5f334c4a0
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
> change-id: 20261104-vxlan_preserve_local-c3fa959e9715
> 
> Best regards,
> --  
> Gabriel Goller <g.goller@proxmox.com>
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
