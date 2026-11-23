Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410458;
	b=hchbcEM8A+uVKlGE3XNOycdKoDm32obXYbcN3i2f8VVsrCAps7SIKFnOeZrlnpjEUKyT
	 F3EdKDWVfLDtcvw23vWvFI8upukwl2jbFJk+oOB62yd/VkWrIkuxgyYTBlOFV0tCJX82t
	 EVCvgBAUS7n3yVTC6peYMPXfzgPBR7WYyFZjj/I72eOJJSzLjRxfmtk3hsWwOBjOzagGN
	 bJiozZQ9X9YSfMtCqSJf8rifO3yPJqK2vQPwI0RX6Qgk9BV4YJghfFYPkw2EJGRwjvVNh
	 qe/PGsqJ8WP+YFijJrV6aATGcyWbZhtQq2wpdEebxI+66VgcjXAJEg3gorja+pW7rJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410458;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jXsj4yBDa40W+GRxXNQS4djxEV9wqaTAzh35gQgC/FM=;
	b=5YIbVLuhAgcMPmMsKnVXDzrsZCLOLFjS6+JZPIipbBbhm7fRrZv4YNh678ESe3rcRjJF
	 KEdJ+WY7btudfCOCKDoI1WzHr+Ho6qwmRsMMjWzHdLaaYl/wHhCndIlriaXtCfT+N6nCj
	 cqU7TTpuHab/t0+aN2xt9vcPgum+C7H/0jKKYzBvMuA+GCsESmNGEafXrIhr+qBWqoFlR
	 UD1i8nBBqM3NLAx78PwqzpZpWbfdJ3o6wifOqK+JL2PkkD/NI6Q0Y78/lC7pt9biuRr3j
	 NhD6uHJkL+owb0Voj9yhWtzHkr9VcGiLNUh1Cf1Lk+WbYMZmSMRofiVwRKZ44KTTmsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A5tXLO4H;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A516606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A516606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A5tXLO4H
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lnUq93IGNsz/Cb1nIEvJY31ok+tibOAtwwZITwxSEzw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795410454; v=1; x=1796015254;
 b=A5tXLO4H2zXdVBartanS99QsB4ZSefo+fmAjO1C/3RMC1RrLk9kfYzSklUKSYu0ER+BLUQBO
 lwzfHrlBK09pU58/+KmHTIRuHjJHMRJDZMSaFQeWlywVqS5L+E1pid8n8R1PbobGwbsQfVmMHs+
 tYBtWX99qnYJyIJvZIrRpQpg=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f42f577cfbcb11bc;
	Mon, 23 Nov 2026 05:07:34 +0000
X-Mizu-Trace-ID: f42f577cfbcb11bc
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 13:07:25 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	kuniyu@google.com, xeb@mail.ru, yana06070@163.com,
	netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net-next v5] ip6_gre: fix changelink conflict checks for
 L2 tunnels
Message-ID: <20261123050725.GF10218@Liu-laptop>
References: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
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
In-Reply-To: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>

On Sun, Nov 22, 2026 at 09:42:44PM +0800, Xia Yan wrote:
> ip6gre_changelink_common() calls ip6gre_tunnel_locate(), which only
> looks for ARPHRD_IP6GRE devices. The same helper also handles ip6gretap
> and ip6erspan devices.
> 
> An L2 tunnel can therefore change its parameters to match another L2
> tunnel, and incoming packets can be delivered to the wrong interface.
> An L3 tunnel with matching parameters can also make a valid L2 update
> fail with EEXIST.
> 
> Use ip6gre_tunnel_find() with dev->type, as the newlink paths do. This
> also matches the device-type check in IPv4 ip_tunnel_changelink().
> 
> Found while comparing the duplicate checks in newlink and changelink.
> Reproduced under UML using existing netlink interfaces, without kernel
> instrumentation or fault injection. With an IPv6 underlay named under
> already configured:
> 
>   ip link add tap1 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 100 dev under
>   ip link add tap2 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 200 dev under
>   ip link set tap1 up
>   ip link set tap2 up
>   ip link set tap2 type ip6gretap key 100
> 
> Before the fix, the last command succeeds and received frames move from
> tap1 to tap2. After the fix, it fails with EEXIST and tap2 is unchanged.
> 
> Tested on net-next under UML with W=1 builds before and after the change.
> Standalone tests covered duplicate and valid updates for ip6gretap and
> ip6erspan, including receive-interface and payload checks, plus an L3 GRE
> control. Kernel selftests were not run.
> 
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
> ---
> 
> Notes (ip6gre-v5-mail):
>     Changes in v5:
>     - Return to the minimal one-line v1 change, as requested by Ido Schimmel.
>     - Rebase onto current net-next.
>     
>     v4: https://lore.kernel.org/netdev/179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com/
>     Review: https://lore.kernel.org/netdev/20261122123555.GA2812544@shredder/
>     
>     Current UML build and runtime baseline: eb6d6c80d35449c27471b1874f13066c09a8964d.
>     The v1 x86_64 W=1 allmodconfig- and allyesconfig-derived full builds used
>     net 7076f684d513. Those full builds were not repeated for this rebase.
> 
>  net/ipv6/ip6_gre.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> index 26c0e1c4de18f8b44ceb05d01673aaadfbcbd5ef..9f1e58f9326afd27d097431ffe62efb0aaaaf58a 100644
> --- a/net/ipv6/ip6_gre.c
> +++ b/net/ipv6/ip6_gre.c
> @@ -2064,7 +2064,7 @@ ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
>  
>  	ip6gre_netlink_parms(data, p_p);
>  
> -	t = ip6gre_tunnel_locate(net, p_p, 0);
> +	t = ip6gre_tunnel_find(net, p_p, dev->type);
>  
>  	if (t) {
>  		if (t->dev != dev)
> 
> base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
> -- 
> 2.43.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
