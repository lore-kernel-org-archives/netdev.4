Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096200;
	b=oYhfPFGTzjKTBuKuu3cfwcIy7tvT1CgFxhDTBEIpze4bBiegHdqFM/YjPcHhfyM0CNUI
	 DtW7shiSarSGqGQXho6RMtvRLF9DRSDNtwMAsQUuuZCYJEUhU6TXOas6pww8wU3VVwA0c
	 rxZ2qgB1ekpE8ud0Diwmro25aPy3660GflvNQKxo1UVc5jdOKDwdyETO2BM2xfyNyNy+x
	 rpJiF9qE1ZIpoEMTA+WwmPSi0RY2UCCS7UrE9iaNcPDnlZ42TsYzxK5nzxDZK+4msRRLR
	 E5M4wALpAVoWG6NCoKLXgVdrOPiR8JcD7NzjakAXuTlhqGxnPREbyjs8Jy7olyEUimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096200;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yvojpHA5a6XmwGnVipZQIHScMNANN26Ln0EDUnyH/V8=;
	b=WWvJ6LhJHBF1ujH9yaRFJDvEkI4c9urB05S3jJKb63g0rsdsfZ+tvRvCZWN6rdoG1/Rb
	 23tag6haHkmFS0wdf9CL46lbPR9AZZ1xaoCn3l0hmfDJmGcBr3xAp4fJxr/qrj9QTxplB
	 nfO6/CPEnylFZl4gPNpx8UrYeaTkxDzo/qmLVLJU37Jlu+0loRtrzC36S+wTwGFS8c/Jh
	 9M13VSeP3BG3G+DDpwfvtfpzlIZeFftmv1VsHdNcvAIhfnfJXE2fk40V/6Ki2ZlMHqWP3
	 +n7CqvgqwypZJE3NBzJYUzC3F7CVnaNfs7aq5c0zKI0QlqmJUcYlUCDSnYHc1ypaPTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9HNw269;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5E60A2621;
	Thu, 19 Nov 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9HNw269
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF011F000C6;
	Thu, 19 Nov 2026 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096200;
	bh=yvojpHA5a6XmwGnVipZQIHScMNANN26Ln0EDUnyH/V8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g9HNw269JPkGeS+S0bDBc9+j71xujZ7wMRYRMMoGRKgMGlxcSoKEXFOcB75rwNqf3
	 ninO8SlnlmiE3oObIxJHfWOoRrmpI2VsJITrWMNL0ViuKMGUiPYImaeG5zzUw+4I/L
	 4XBBLYRcKaA0s7Zhl9BXvu0q3BzlMs5uRvvuo+xBMLLDYjKRPDUTF8avkcVebligF5
	 9YwKthUsVR6xQ2susLN/W+EBEO4ikCbtPcMCQglf2k9GNSzisrhMzvA+17eL+cUrmB
	 OmHW6UtWSIjTvVBygwsV6bm+Dmf32sAHeDZf0a6k+Vbm7ZkYU3+BLB/jKkq9xM8Zen
	 ZsyRNSMXrosNQ==
Subject: Re: [PATCH net-next v3 2/2] ipv6: preserve ip6mr_get_route() error in
 rt6_fill_node()
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 hangbin.liu@linux.dev, liuhangbin@kylinos.cn, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1342116488@qq.com
Date: Thu, 19 Nov 2026 13:49:59 +0000
Message-ID: <179509619942.3136.14572519530709310239@kernel.org>
In-Reply-To: <20261116014744.18223-3-sunwenbo@cmss.chinamobile.com>
References: <20261116014744.18223-3-sunwenbo@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the patch 'lets userspace see the
  actual failure reason' and gives -ENOMEM and -ENOBUFS as examples.
- [Low] The patch fixes the errno masking only for IPv6.
- [Low] The commit describes the -EMSGSIZE masking in rt6_fill_node() as
  an 'issue' but has no Fixes: tag.

--

ipv6: preserve ip6mr_get_route() error in rt6_fill_node()

This patch makes rt6_fill_node() return the negative errno from
ip6mr_get_route(). Before, the nla_put_failure label always returned
-EMSGSIZE. Other attribute put failures still return -EMSGSIZE.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 305ae2ac359ea..81effa72c1893 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -5874,12 +5875,14 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
>  		    !(ipv6_addr_type(mc_dst) &
>  		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
>  		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
> -			int err = ip6mr_get_route(net, skb, rtm, portid);
> +			int ret = ip6mr_get_route(net, skb, rtm, portid);
>  
> -			if (err == 0)
> +			if (ret == 0)
>  				return 0;
> -			if (err < 0)
> +			if (ret < 0) {
> +				err = ret;
>  				goto nla_put_failure;
> +			}

[Severity: Medium]
The commit message says this "lets userspace see the actual failure
reason" and gives -ENOMEM and -ENOBUFS as examples. Can those errors be
reached through inet6_rtm_getroute()? It is the only caller that passes a
non-zero iif.

The reply skb is allocated without a device:

net/ipv6/route.c:inet6_rtm_getroute() {
    ...
	skb = alloc_skb(NLMSG_GOODSIZE, GFP_KERNEL);
    ...
	skb_dst_set(skb, &rt->dst);
    ...
}

So skb->dev is NULL when ip6mr_get_route() runs. Its MFC lookup uses
rt->rt6i_src and rt->rt6i_dst. These hold the matched FIB prefix (for
example ff00::/8), not the (S,G) being queried, so the lookup normally
misses. The skb->dev fallback is skipped, and the function returns early:

net/ipv6/ip6mr.c:ip6mr_get_route() {
    ...
	cache = ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr);
	if (!cache && skb->dev) {
    ...
	if (!cache) {
    ...
		dev = skb->dev;
		if (!dev || (vif = ip6mr_find_vif(mrt, dev)) < 0) {
			rcu_read_unlock();
			return -ENODEV;
		}
    ...
}

This return comes before the alloc_skb() (-ENOMEM) and
ip6mr_cache_unresolved() (-ENOBUFS) paths. The UML test in the commit
message also reports -ENODEV.

inet6_rtm_getroute() already returns -ENODEV itself when
dev_get_by_index_rcu(net, iif) fails. After this patch, how can userspace
tell a nonexistent RTA_IIF apart from an mroute lookup that never got the
device or the (S,G)?

The preceding commit in the series, "ipv6: check mc_forwarding before
calling ip6mr_get_route()", already says that skb->dev is not set and
that rt6_info holds the prefix, not the (S,G). With mc_forwarding
enabled, "ip -6 route get <G> iif <dev>" for a routable multicast
group still always fails. The patch changes the errno from one misleading
value to another, and the new value becomes uAPI.

IPv4 sets skb->dev and passes fl4->saddr/daddr, so the same query works
there.

Should the lookup itself be fixed? Or should the commit message at least
say which errors can actually be returned?

>  		} else
>  #endif
>  			if (nla_put_u32(skb, RTA_IIF, iif))
> @@ -6002,7 +6005,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
>  
>  nla_put_failure:
>  	nlmsg_cancel(skb, nlh);
> -	return -EMSGSIZE;
> +	return err;

[Severity: Low]
IPv4 still has the same masking. In rt_fill_info(), a negative return
from ipmr_get_route() jumps to nla_put_failure, which always returns
-EMSGSIZE:

net/ipv4/route.c:rt_fill_info() {
    ...
				int err = ipmr_get_route(net, skb,
							 fl4->saddr, fl4->daddr,
							 r, portid);

				if (err <= 0) {
					if (err == 0)
						return 0;
					goto nla_put_failure;
				}
    ...
nla_put_failure:
	nlmsg_cancel(skb, nlh);
	return -EMSGSIZE;
}

inet_rtm_getroute() sets skb->dev = dev before it calls rt_fill_info().
That means -ENODEV (iif is not a VIF), -ENOMEM and the errors from
ipmr_cache_unresolved() can all happen on IPv4.

With mc_forwarding on, after this patch "ip -6 route get <mcast> iif X"
returns the ip6mr_get_route() errno. "ip -4 route get <mcast> iif X"
still returns "Message too long".

The preceding commit in the series, "ipv6: check mc_forwarding before
calling ip6mr_get_route()", aims to make IPv6 behave like IPv4.

Should rt_fill_info() get the same change in this series? Or should the
commit message say that IPv4 is out of scope?

[Severity: Low]
This isn't a bug, but the commit message calls the -EMSGSIZE masking an
"issue" and does not have a Fixes: tag.

The masking goes back to commit 7bc570c8b4f75d ("[IPV6] MROUTE: Support
multicast forwarding."). Its current form comes from commit
fd61c6ba313de6 ("net: ipv6: remove nowait arg to rt6_fill_node").

Is this meant as a net-next improvement? If it is meant as a fix, should
it carry a Fixes: tag?

>  }
>  
>  static int fib6_info_nh_uses_dev(struct fib6_nh *nh, void *arg)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116014744.18223-1-sunwenbo%40cmss.chinamobile.com
