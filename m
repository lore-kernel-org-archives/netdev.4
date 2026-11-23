Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404348;
	b=w2smoESy1pV5sNmCBz20DT4JXo5jblH6acgs2jnnRwo6A93EIh7A+cQc6sa6gGixduSG
	 AmISu8iOMIDK/5y2zxH+roTCBwv7E03yfjTvec3K7jM4WZfmpx1Pa+WUoiVhSRw1OKOEx
	 A+3E/wOsqx9GLox6gBQFRyep6fJx8F8YyaSTiIrvbD6rdOjSYf2orgGHQRs2mKG2j2tAC
	 XEjXqF8OY3pEp3P/Pf/vH4UJF1PM1iIyrldkOMO19UrF6khCb8E5kOmJDjZIA4lf/QoBI
	 Bb/MvQ0HoW//YLo8tRtkgSpnqhga1nnCLISz5X6Z2FK07JGVgtQWweCd+Uv8Bj5DztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404348;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e3Yc6JAlwaTv2qXHFm4ZyG1PlJXC648rlgLKH7Ra6f4=;
	b=4YbUTZ91jP9jEIgJzfjeka0VjoXT/pQJC/RVEDPEXXDepgEFLeyEzx6bMsknW8+Y9/zZ
	 d3PSjeyCBZGtdna39Bo5AgZ766Fd0+aFc3pumdCvHjLXzNZSVjC0WJ+yNFsiVlA/wtMnp
	 /WqrOjQO5g5id6wQBmbvlSaUfHSxnYKTY3z730VOy8M4fpUejG3sZFgLlLti16JZ9JCzA
	 MwsBtOx8ltMKgJQlDt6mf0pwWWPnvWu0WHZWkw5cOnZ28btCbYsC7vrXtWURjkodT2GGC
	 LE/wjuvCQXNp3J8CWw0Tw8X6W8L6y7o00IpmLjIOW/ZT4XW/RGuueLmcMIeFx2tXQTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LbRCt7No;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1325606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1325606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LbRCt7No
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J0WzD7xt978YmwyUOKWILnt4R9Sg7QENfh2/qnfkRQY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404345; v=1; x=1796009145;
 b=LbRCt7NoOPix3FxjACX2+/qFdievgMjaPgNzbac7c4baB1s1S3uFC0kB7CdJlUVDsJPH7bHX
 Mhb0RHImcXsvBxeZdiHfRLHhzLHrBLRN+gw4XJfPrQpQnf/7PlKbuoFVZ/Wm+5gf7O+syUqoaTM
 MAijQNZfoVPX4Sz+CdKdUnvE=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f2f39b979a91e5d5;
	Mon, 23 Nov 2026 03:25:45 +0000
X-Mizu-Trace-ID: f2f39b979a91e5d5
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 11:25:37 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change
 its type
Message-ID: <20261123032537.GE10218@Liu-laptop>
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
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
In-Reply-To: <179535729502.2645501.271186140389290426@gmail.com>

On Sun, Nov 22, 2026 at 11:59:10PM +0900, Kyuwon Cho wrote:
> A bond can be a slave of another bond. Enslaving a non-Ethernet device to
> an empty inner bond changes the inner bond's type in bond_setup_by_slave()
> after NETDEV_PRE_TYPE_CHANGE, and nothing refuses that while the inner
> bond is a slave of an 802.3ad bond. The outer bond then adds the 8-byte
> lacpdu_mcast_addr to a slave whose addr_len is 16, the same global
> out-of-bounds read as when such a slave is enslaved directly:
> 
>   BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>   Read of size 16
>   Call Trace:
>    __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>    dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
>    bond_open (drivers/net/bonding/bond_main.c:4405)
> 
> Refuse NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond, as team
> does for its ports. Other modes still allow it, as
> bond-eth-type-change.sh expects.
> 
> Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
>  drivers/net/bonding/bond_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index bcc12ef34d9a..1a926b8d28b0 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -3981,6 +3981,10 @@ static int bond_slave_netdev_event(unsigned long event,
>  	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
>  
>  	switch (event) {
> +	case NETDEV_PRE_TYPE_CHANGE:
> +		if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +			return NOTIFY_BAD;
> +		break;
>  	case NETDEV_UNREGISTER:
>  		if (bond_dev->type != ARPHRD_ETHER)
>  			bond_release_and_destroy(bond_dev, slave_dev);
> -- 
> 2.43.0
> 

Hmm, I personally prefer the approach used by vlan and team, which disallows
changing the slave type after enslavement. If you think we should only disable
the 802.3ad-specific part, this change should be merged with patch 1, as they
address the same issue.

Cc Nikolay since he add the bond-eth-type-change.sh test.

Thanks
Hangbin
