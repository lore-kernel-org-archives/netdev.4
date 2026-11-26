Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680388;
	b=ZZ+faFmtslabFeqT2fFvdQiQYVPhvW5Jx3VWRIyCce/OMslL9MAbS/7ZBtMW2RgXs96P
	 GIC43psPpsGmn23u71DnOTLftDdFr1FTwH/DkmVQdXi6Iy1inexlFAWh55ZWx6OL3b5Tv
	 MZJyLPv8sYOYIPj6thHAwzfkX53LQEGvePw2YHXlZnTQh77XcubD+Yn5rv+lbAF/GMsI5
	 qJ3cuqmr/nEArlbeV64sWlD4MukVYhsYlwjXiGiK+43HU+ulHHJT5mBZs58ePepWW5IP9
	 Ox6bz1/8QB9sbf2Amr9MD8mqL8oSOUCqxhtQTH5mRk1kTx/yXQCiCEXzcCHJEIPbcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680388;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OyUa2t4yocbjCgEzqBUoX1J7WxTuMvwNQAsF10zzeO4=;
	b=PlsVvB7MYCMt5+zev5yM4srgMp7PtgsQdE6LbkR+RlJYMCqFvB6QBm7LVpmD3kk4QIP9
	 Cnxab2jey0UZy5LR8AjAbNMux4qDho95tNvh2KgHLikHUA1/CVWeTseuQjznPsY3eH/IE
	 H6IwRtgJVkX/WprzYT0sZ7xCei3tUJYlIdl0t3ZYivLMbbzoPzjOHRt8a43J2dCFYER8o
	 aTykp0rWpFl0EIdONKySokNwjsF/k0o/mVrVpB+1UCTfucWNACgwVtwxSE+0XSiKtU7kV
	 y65BzxhJL4oqyegxNXk43OVkjSzFSbZVLolnMOI7Q/PmMjLzDu3X52fD1KCqmpkkn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H8UkYiDc;
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC6606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H8UkYiDc
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pJEyvNNA+em0nk/2jshqBxyFrkwUKtMx1aBhCWN2nrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680386; v=1; x=1796285186;
 b=H8UkYiDcNwmbnPaNWunF5N3GwDzVU2PDox+LyMkU/oF+OIu2fX7uARBJFeMpkZ1pcJlMz3WK
 Top1WkZNg5YzpSw9ihQZl+H/BzkL8CGjNHUzMMHi1v51JARVhZccGUnaYbXUcAC/80SNRcB8WnF
 w9NxgMEeZZhsjRgztrXBagiE=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 57db03fa17c5ba0a;
	Thu, 26 Nov 2026 08:06:26 +0000
X-Mizu-Trace-ID: 57db03fa17c5ba0a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:06:19 +0800
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
Subject: Re: [PATCH net-next v2 1/6] ipip: Enable BIG TCP packets
Message-ID: <20261126080619.GC33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-2-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-2-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:10PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. ipip can carry BIG TCP packets as well: the outer IPv4
> header gets its total length from iph_set_totlen() on output, the GSO
> and GRO paths already handle IPv4 BIG TCP, and FOU and GUE encapsulation
> set the UDP length with udp_set_len() since commit 47282504ad21 ("udp:
> Support BIG TCP GSO packets where they can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with ipip. The default gso_max_size and gso_ipv4_max_size stay at 64KB,
> so nothing changes unless they are raised explicitly.
> 
> iperf3 TCP over ipip between two netns connected by veth, without
> encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8 vCPUs
> on an Intel Core i7-14700 host:
> 
>   gso_max_size/gso_ipv4_max_size 65536:   94.2,  97.4,  97.2 Gbit/s
>   gso_max_size/gso_ipv4_max_size 196608: 133.7, 128.5, 130.5 Gbit/s (+36%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover ipip
> without encapsulation, and with FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv4/ipip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
> index 15189e1fa06..74af06b1d94 100644
> --- a/net/ipv4/ipip.c
> +++ b/net/ipv4/ipip.c
> @@ -416,6 +416,7 @@ static void ipip_tunnel_setup(struct net_device *dev)
>  	dev->addr_len		= 4;
>  	dev->lltx		= true;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  
>  	dev->features		|= IPIP_FEATURES;
>  	dev->hw_features	|= IPIP_FEATURES;
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
