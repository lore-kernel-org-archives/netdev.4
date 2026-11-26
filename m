Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684053;
	b=NHIA+tzzjgELrEZMT+rVOpe/1PEz5FqbDqtLKEaPSKhcF4EbZYPN5KVfbInkYksjvR2X
	 eEreTo5Xk/2PvG712V0dcfIgesRZ0cQxqNqGIYO77PM3aAuvU9jsDlrzaHFjKpn+zxtXu
	 h7ygsuUZVudYViUte64mTSpEZGFfyvSdGNSWtVGUswwBEaPOMFUmzqWqozQ7LSmOGD/xs
	 YM2bdiE9TL73VtZPZob+zmCHJc6Y7Y3EzhHR4JP+IizzNHBhwjofKsGoF1Y1/zbItiiRE
	 AMiNnBsb7RELKFQbPZB0j6oUKFnpSFEFGr+5eidaiyEATaj7OFZRUjrjlCZ2/Sym17Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N3rhvzb+h28MvlNfZwN0zhZc4VGxf79hWWSLpBvEg3Q=;
	b=U8r9nfBsA4r3JpVeBhSTBGnHudURetqJQIxyJa8/c8leHVF3TF/yB/nqUiS+bO18xUWV
	 aMX3oPK20zSV7s9fwt1ViK0vRW9URdgwiGhSy1BTJYxcw50GcVJQu5lkjaOwTUXuWL3yW
	 gDz3j4g28cg/1r81gsKs9cjKt5o26NrF6fdxfA1OTHfIRxnm9eMNcGiIL55f7KXULLda5
	 PW5cPlYYv79X2OASIrR8shJqMSv7UQ0AqHhiCCD/OfU1YLYtKghLfft6hJWc3JusZegWj
	 vDO6Ko70hAp+PJuFoAw4vr0kymGIbrFfceiP9BRmZXA+jk5q2BJ7EdCLQD07VHFL9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=amUVkJF9;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73760A2638
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD73760A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=amUVkJF9
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=POEJ5Y1wEVWjdL2mnds2Wh5HHh6t0AOQagRcRKfgwZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795684049; v=1; x=1796288849;
 b=amUVkJF9Bwj9/6b21VkxsSr6UNGkYdtXmi5rBccl/vefcSPpQtjQJtphRCGU32jPucCATy9I
 kaAmFjwmVpy/hI5e6ZQWQ49ov6SZshSJyRkfBiqpPv53ZJ0DYdrCbqTCTQDDMLfHBTruCh/bki+
 iAOzbfZRo7nFmFycaATaIJrc=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a6186c7db64e534f;
	Thu, 26 Nov 2026 09:07:29 +0000
X-Mizu-Trace-ID: a6186c7db64e534f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 17:07:17 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, dsahern@kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next] ipv6: Do not keep loopback addresses when MTU
 is below minimum
Message-ID: <20261126090717.GH33976@Liu-laptop>
References: <20261125111709.126901-1-idosch@nvidia.com>
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
In-Reply-To: <20261125111709.126901-1-idosch@nvidia.com>

On Wed, Nov 25, 2026 at 01:17:09PM +0200, Ido Schimmel wrote:
> When the MTU of a device drops below the minimum IPv6 MTU (1280),
> addrconf_ifdown() is called to stop IPv6 on the device. For all devices
> other than loopback, the IPv6 configuration is destroyed together with
> all the addresses. For the loopback device, the configuration is
> retained and so are permanent addresses if keep_addr_on_down is set, but
> their host routes are deleted.
> 
> This results in an up device with addresses that do not have host
> routes, a state that persists even after the MTU is raised and that the
> kernel warns about when DAD completes for such an address:
> 
>  IPv6: BUG: Address 2001::fb on device lo is missing its host route.
> 
> IPv6 cannot operate below the minimum MTU, so there is no point in
> keeping the addresses. Do not keep them, similar to when IPv6 is
> disabled via disable_ipv6. This aligns the loopback device with other
> devices and with IPv4, where all the addresses are flushed when the MTU
> drops below the minimum IPv4 MTU (68).
> 
> Before:
> 
>  # sysctl -wq net.ipv6.conf.lo.keep_addr_on_down=1
>  # ip -6 address add 2001:db8:1::1/64 dev lo
>  # ip link set dev lo mtu 1000
>  # ip -6 address show dev lo
>  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 1000 qdisc noqueue state UNKNOWN group default qlen 1000
>      inet6 2001:db8:1::1/64 scope global tentative
>         valid_lft forever preferred_lft forever
>  # ip -6 route show table local dev lo
>  #
> 
> After:
> 
>  # sysctl -wq net.ipv6.conf.lo.keep_addr_on_down=1
>  # ip -6 address add 2001:db8:1::1/64 dev lo
>  # ip link set dev lo mtu 1000
>  # ip -6 address show dev lo
>  #
> 
> Other devices (before and after):
> 
>  # ip link add name dummy1 up type dummy
>  # sysctl -wq net.ipv6.conf.dummy1.keep_addr_on_down=1
>  # ip -6 address add 2001:db8:2::1/64 dev dummy1
>  # ip link set dev dummy1 mtu 1000
>  # ip -6 address show dev dummy1
>  #
> 
> IPv4 (before and after):
> 
>  # ip -4 address add 192.0.2.1/32 dev lo
>  # ip link set dev lo mtu 67
>  # ip -4 address show dev lo
>  #
> 
> Reported-by: syzbot+ded267b328e950a7c0c4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ded267b328e950a7c0c4
> Reported-by: syzbot+57f410c9a4f8d7a441d6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=57f410c9a4f8d7a441d6
> Reported-by: syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> ---
> 
> Notes:
>     Targeted at net-next without a Fixes tag as this is not a regression:
>     the loopback device has been keeping its addresses without host routes
>     when its MTU drops below IPV6_MIN_MTU ever since keep_addr_on_down was
>     introduced in v4.6. The only symptom is a pr_warn() message (not a
>     WARN() backtrace) that so far was only triggered by syzbot and the patch
>     changes user visible behavior.
> 
>  net/ipv6/addrconf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index cdea18e5ba1a..285ad5c3bca1 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -3948,9 +3948,12 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
>  	}
>  
>  	/* combine the user config with event to determine if permanent
> -	 * addresses are to be removed from address hash table
> +	 * addresses are to be removed from address hash table. IPv6 cannot
> +	 * operate below IPV6_MIN_MTU, so treat that like disable_ipv6 and do
> +	 * not keep addresses without their host routes.
>  	 */
> -	if (!unregister && !idev->cnf.disable_ipv6) {
> +	if (!unregister && !idev->cnf.disable_ipv6 &&
> +	    dev->mtu >= IPV6_MIN_MTU) {
>  		/* aggregate the system setting and interface setting */
>  		int _keep_addr = READ_ONCE(net->ipv6.devconf_all->keep_addr_on_down);
>  
> -- 
> 2.56.0
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
