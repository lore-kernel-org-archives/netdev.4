Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680740;
	b=z7a17az69kZVXPceNTHhb+VTcS3kc/mvXaLfbqjKG+ej3xLJdMy1NifjKqC7DWmIU8Lm
	 aN8kk3Edg6PGPNAPR/46OJ5YIs3qzigqOKP6j+l7iHy1UVzjbKQvEJRY+vBB+EBIQcECE
	 4cQAKy4l39wB+R80WvAXhKKscGXnOvsaPD4MIiOCeL9s+GjOQGW3ZJ2Va0h0KGjpArWEs
	 U9jx/7i8onCDuPXyGDylZbSTdU9vfJdvw7ah1EGIudeGxsqNFQ2CCkC5xY8s6Nd+2ILPp
	 zmThEL4mYweVDfpqV975DxWrNOFPUYsbypR3qzw3BHpvSpZEOfLEVm7Ex9MnslZ6tLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680740;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Lt2W2OTrkjivIClcb6pJV3VzVc47DEMwu0EDTWnTE10=;
	b=Ofvb3ysLzoeBruvU7elOjT1oiVGjAFCPj6AsULxgECBfiWyxeZzAgYg3svmmNUrSqJEh
	 Rjr9QvaveMYWoiJQq97QcWOe4887WdGn0f+Ko5FwN5kJ3ezyZ5XEIUq/w5ttGjBjoUOqG
	 gNMnITZ5WPUcl5OUkY0YnTt3seA0ooS+VNO8Jr0yaI0JcBRpOC4IfdaE6zylVo97/z+Na
	 /OfGc4EaRiNhxuQwKuSt8rsak2Km8t4Kl8XK8m2fx7Zm7tYxB7EVHEqr9HGk9yjC65kZg
	 NINnMT+Clm1vakoM7MCRLfS0XXflHOnG5g1SoR0E+eAMQ5LpiLOunn+FI8Pa7bd7d7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ClZTMiUX;
	arc=none smtp.remote-ip=91.218.175.40
Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD2606A684
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBD2606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ClZTMiUX
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oX5t4fq6E1hsGhDXl7ngJctWdFTSMPrw40BAF+ejwYM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680737; v=1; x=1796285537;
 b=ClZTMiUX5Kn4nvmqqs6Pf5/Wt0i/EZzzQ9G9LIUQeiAp9d3d+F2ptWKeeGBi5eCT8ezz2Az8
 CaOVpV9RFrccrrJ0F7YMex948weREo1me94BTP+M/SacZiDbCh5/HifF/5x0r3QurpnuVX7p0+o
 Y6wkxUO6lz1yAIwQAK+Zro/w=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1252e3651f26e1a8;
	Thu, 26 Nov 2026 08:12:17 +0000
X-Mizu-Trace-ID: 1252e3651f26e1a8
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:12:08 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/6] gre: Enable BIG TCP packets
Message-ID: <20261126081208.GD33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-3-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-3-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:11PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. gre and gretap can carry BIG TCP packets as well: the
> outer IPv4 header gets its total length from iph_set_totlen() on output,
> the GRE header has no length field, the GSO and GRO paths already handle
> IPv4 BIG TCP, and FOU and GUE encapsulation set the UDP length with
> udp_set_len() since commit 47282504ad21 ("udp: Support BIG TCP GSO
> packets where they can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with gre and gretap. erspan is left alone. The default gso_max_size and
> gso_ipv4_max_size stay at 64KB, so nothing changes unless they are
> raised explicitly.
> 
> iperf3 TCP over gre and gretap between two netns connected by veth,
> without encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8
> vCPUs on an Intel Core i7-14700 host:
> 
>   gre,    65536:   92.9,  94.2,  93.0 Gbit/s
>   gre,    196608: 130.6, 128.6, 123.3 Gbit/s (+37%)
>   gretap, 65536:  105.5, 106.6, 106.6 Gbit/s
>   gretap, 196608: 124.7, 129.7, 127.5 Gbit/s (+20%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover gre and
> gretap with IPv4 and IPv6 traffic, without encapsulation, and with FOU
> and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv4/ip_gre.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
> index f8a7c435350..41ec54dcbfd 100644
> --- a/net/ipv4/ip_gre.c
> +++ b/net/ipv4/ip_gre.c
> @@ -1007,6 +1007,7 @@ static void ipgre_tunnel_setup(struct net_device *dev)
>  {
>  	dev->netdev_ops		= &ipgre_netdev_ops;
>  	dev->type		= ARPHRD_IPGRE;
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  	ip_tunnel_setup(dev, ipgre_net_id);
>  }
>  
> @@ -1394,6 +1395,7 @@ static void ipgre_tap_setup(struct net_device *dev)
>  	dev->netdev_ops	= &gre_tap_netdev_ops;
>  	dev->priv_flags &= ~IFF_TX_SKB_SHARING;
>  	dev->priv_flags	|= IFF_LIVE_ADDR_CHANGE;
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  	ip_tunnel_setup(dev, gre_tap_net_id);
>  }
>  
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
