Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441452;
	b=dyXHnoWIbr8U4+a4MSBi5/PHQPgoce14t/FkWkXhiAtQ4NWm54rP5HAiv4E0iqaE0nv+
	 4Hv9XOnhwESdPMKKTDXuBgmQ0uRJj9ExGDATG372Anf/wGPLhaYcDeV2a3XmUq6kv0UdB
	 NBKYPkdji1WJ5iWH86laHSlSn2csIT18fsknBB3Qabp6JQDfL4E0ClWhWY9J/fk9uM0cA
	 nA3a09m5IfsXYakebpHMm2hm1dN7kzyNggEJWbcddzrVZIKGWTgW7gycbj+rWyaSoxAun
	 Uh7I84LyLZ3MqeYEZ/aXLM4ZyQ7GAFSnl9gIGJBAoTogPCBRl24Ue/2bk+hOkATj/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441452;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gEg/X/U+sJbpESTwvAMkVsppgmwr915oAyo3PtLsi0g=;
	b=nY67EOCN/FH5Ft0f6V2b5QximJaTnjB4hwVXAzeNtUnMlnukxail3wv2Nlozfkvo5sD0
	 je52zIsHajbHz4J87tkPkxN/woGGHWzXLooVyqR443DhebgfcV9HheRLWThVjOwP2M5yd
	 elnnGUsP9MKEM7KE1Gt0dIr9k4gMGLPIT+nQQAz+10eRvvG5Y3ik29v8cHx80Gnm0mvcP
	 ZOi2tQHxFaT/1UTfwnaN99TdUy3JpmPAh9wNlLBN55XlRFc0ytziDiO/TeVn6efsWxWSd
	 ZdOqoOgYJgeHRVRPPS7Ljme0gU4VpmLyh+wN1wdu7EeG9oV7lgWnB0okMXR5/2jbnTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFtSEIZ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A086606A31A;
	Mon, 23 Nov 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFtSEIZ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109541F000D3;
	Mon, 23 Nov 2026 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441451;
	bh=gEg/X/U+sJbpESTwvAMkVsppgmwr915oAyo3PtLsi0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CFtSEIZ8bsbDYExL3gqDt+hUvuPiBZjfGnAM/IEZJBrDLyPE54pBaN4VfnZipZSms
	 7yLT8NQMoAoDEasjnmw+tTbdnCNiWVOLww7TMYE6RGYf65dWwSczMrq8WHTIqiRIc6
	 ihYVxwqf346OjKK/bn2egSdMwO/iHqrSCUEgcg2dESu2/JGuhl6biV9LfA1Mrc7Pns
	 yK+c1Poxo0YhLg8C8Dh9oLEGLMYjoj7b+GxNaHiOF0XUGSIsFGWQ7CBP3Vxix7mY7M
	 BB+hZyaUoaGQn3I5uJnJt7NznwVZpZIyH9LSU+HGEF05liMy4KDvDCK2D0S4/Ym2nw
	 kmmGh6SsamNFQ==
Subject: Re: [PATCH net-next v5] ip6_gre: fix changelink conflict checks for
 L2 tunnels
From: netdev-bot+sashiko@kernel.org
To: yanxia@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
 xeb@mail.ru, yana06070@163.com, netdev-bot+sashiko@kernel.org
Date: Mon, 23 Nov 2026 13:44:10 +0000
Message-ID: <179544145061.3135.15862505318599577492@kernel.org>
In-Reply-To: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
References: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch says changelink now checks duplicates "as the
  newlink paths do", but it copies only half of that check.
- [Low] The patch fixes a long-standing bug that users can see, but the
  commit has no Fixes: tag.

--

ip6_gre: fix changelink conflict checks for L2 tunnels

ip6gre_changelink_common() used to check for conflicting tunnels through
ip6gre_tunnel_locate(), which only searches for ARPHRD_IP6GRE devices.
This patch calls ip6gre_tunnel_find() with dev->type instead. That stops
ip6gretap and ip6erspan devices from being changelinked onto another L2
tunnel's parameters, and stops L3 tunnels from causing a spurious EEXIST
on L2 updates.

> diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> index 26c0e1c4de18f..9f1e58f9326af 100644
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

[Severity: Medium]
The commit message says this matches the newlink paths. However, the
newlink paths skip ip6gre_tunnel_find() for collect_md tunnels:

net/ipv6/ip6_gre.c:ip6gre_newlink() {
    ...
	if (nt->parms.collect_md) {
		if (rtnl_dereference(ign->collect_md_tun))
			err = -EEXIST;
	} else {
		if (ip6gre_tunnel_find(net, &nt->parms, dev->type))
			err = -EEXIST;
	}
    ...
}

ip6erspan_newlink() does the same, using ign->collect_md_tun_erspan.

ip6gre_tunnel_link() still puts collect_md tunnels in the normal hash
buckets. So two ARPHRD_ETHER devices with the same wildcard parameters
(laddr = raddr = ::, i_key = 0, link = 0) can land in one bucket. Two
examples are an ip6gretap external device next to an ip6erspan external
device, or a plain wildcard ip6gretap created before an ip6gretap
external.

Can this lookup now return the other device and reject a valid update
with -EEXIST? For example:

  ip link add gt type ip6gretap external
  ip link add es type ip6erspan external
  ip link set gt type ip6gretap external ttl 64

hlist_add_head_rcu() puts es at the head of the bucket, so
ip6gre_tunnel_find(net, p_p, ARPHRD_ETHER) returns es. Because
es->dev != gt, ip6gre_changelink_common() returns -EEXIST.

Before this patch the lookup used ARPHRD_IP6GRE. It matched neither
device, so the update succeeded.

This seems to be the same kind of spurious EEXIST that the commit message
describes, now caused by an L2 peer instead of an L3 one. Should
changelink skip or filter collect_md peers the way newlink does?

[Severity: Low]
This isn't a bug, but should the patch carry a Fixes: tag so it gets
picked up for stable? The commit only has a Signed-off-by trailer and is
based on net-next.

The changelink lookup goes through ip6gre_tunnel_locate(), which
hard-codes ARPHRD_IP6GRE:

	t = ip6gre_tunnel_find(net, parms, ARPHRD_IP6GRE);

That looks like it dates back to the original implementation, which added
changelink for both ip6gre and ip6gretap:

Fixes: c12b395a4664 ("gre: Support GRE over IPv6")

The lookup was later moved into ip6gre_changelink_common() by
c8632fc30bb0 ("net: ip6_gre: Split up ip6gre_changelink()").

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179535496489.1244648.10031965997557933761.ip6gre-v5%40cmss.chinamobile.com
