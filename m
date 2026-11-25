Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619069;
	b=YfOyj6lqcL6rpDIJDTQli6U4aXt+EftRfQ4I1eiCgFldd/8SQDNVvayz6YGxXzTE2dUO
	 KLDEeo4BIZTB+4ol3zOra+w+FHa6M/qYk6Ov0zXeDcqfhFPYXO8rNpE414dijalWWpFxw
	 czYoJ3flqL+BUc1C1S/NRcOcxfBLT10FOPw3GMBsi+5bu68mrEptbJPLmc55SsIuPbKJO
	 uH2nxTsIRYpie6Cs3t+qJvgk7v4RevK1E/QdXWQwUa6ui+JewvNhSnT1cNuTsjRoNyrYJ
	 eGQ6C018y6YyKyScMYEMK2tjn9KM17szUOLDVsWZZDyGwEJ6xyvHwkTFSRToqZVla+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619069;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2y0kJwJsoLyyGcTTrXsgoNVd5M0TRvSfjlFS6j+kO7I=;
	b=fSd8r0ro4Kadpb0MVo2AaqtVrm8b8JkHDcSaLX1Gv9Fp1jDE980y11J33+CvPeVseSe2
	 EOSZaowKp+8pqha/UrQY7VPY8uDP4nPknY7lfm/irO/KG5w7EkjDmDX+S65rQkpdckiZf
	 Ggt5zSqoM0iBu0/rX1PMu9o13F+JuiBO8oVECpbjlflUYtofQmLI9p4Bda2pQCynLgO7y
	 n5BvmCOe2dpce72P5vepBW+2qhrENElqqeEq/dh2CTYuPvtZbYY8ieIXic9M8H6HuH5lo
	 /WIV3ZdvU0Gtvom9cf4yjjbs2XqHBAHvdlzOx87pNzmOZ/WBllf+U7ZsPYa+9iBMGJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmDWAbJk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25589606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmDWAbJk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433791F000D0;
	Wed, 25 Nov 2026 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619068;
	bh=2y0kJwJsoLyyGcTTrXsgoNVd5M0TRvSfjlFS6j+kO7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nmDWAbJkHUUqa/wZt8Co1aPjoRrdgkO2JhfC5/gzA5HULQLuXEX56LR9xeO8xdkbc
	 FAZ8sC6fWcPHulm020zO9tGIPjBxCDGxoWGR6+CpD4zZoq2ckSLRRRENly651jZ9bY
	 LCUc2WdSUbz+njcgY1vUt0hIig0amZB8DpCvn5Pdb9sw19qc9J9Xshym0mGuohYmk7
	 gJOZrNDVA9LJUx14Pte+GaKspqlbQLt7Cz9kChdSpIn3v2/4Qs7HzVl1ApXrJVEuXw
	 vFdAILU5hxsFr3hMwAiQ4sh0XRhymFBtspb4W6iOKzR5wjKCJplmn6Ihh+q/MFoUKw
	 hRUvMi3JuDfqw==
Message-ID: <4a5e2005-a30f-4687-ba42-6e30b2c63fcf@kernel.org>
Date: Wed, 25 Nov 2026 08:04:27 -0700
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
Subject: Re: [PATCH net-next] ipv6: Do not keep loopback addresses when MTU is
 below minimum
Content-Language: en-US
To: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, horms@kernel.org
References: <20261125111709.126901-1-idosch@nvidia.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261125111709.126901-1-idosch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 4:17 AM, Ido Schimmel wrote:
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

Reviewed-by: David Ahern <dsahern@kernel.org>


