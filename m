Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.90
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684466;
	b=ALiko+//CvxHbeePmeYpPqoYrSHBIf2kWzjdaUMY2JVcp/F324iu2M8GebZRV9PheO5S
	 XoN8Ur1tQ3Ub/lhfU9ODGJT72lO6s6jKLhZPVGdyvVbwwGWhxCWVqGFjuyF6Wrpg78GT7
	 a9BH51IVD+QTc+YRc67HBxOqNbvg36TIP96fk8XU2LPU7CrVu3QbJoPT6jxSIREOBnraV
	 Q3FU0mk6FvuxRlVJg+/S/jyLembMkCA2zf+Lw8MZWFBCIBFXyoi2NUySeKOtiZijS2Rly
	 KY4lnnN9hrN/5C91KgyyK8k9qg/2vdAYJy+bBaOvkEIf0TbyTjDlcM9N9WZUqmOjMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684466;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lwIyBSU85VshwGnHE33sLl75KEBowIohtQRD7IW+A9U=;
	b=CXochuzaoPxfnbJ+VNHncIz2b6EGUdKRqqn1WltVTlpGeR/ILSC5d2DC1IsO6nfYnjDD
	 0d6eGDJyUZaywlCIHi2U7+lT5h1SgY6rbkgXRy8bEncnGycpQzKdKfL8qRc0j6tUH+jDQ
	 EckzqFnyOI2Os1vo3WXzbT0gQRmg00bGMYti0P4yPL6Gy/LGvM+UQ19opy+Tl3ROu1VNF
	 Dnpyf4bPxH0UHtkVIVBxk8nwQ/D5K3g1BN8CP++cdNp6F/ci+g3+WGzYSCm/qGLfSZSin
	 wflT7xMn8erpfeVw2KqPO8d72agyGmjwhHUnSUytWLHh2BJtHc73avqKXCJO8F77COQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XEpYFC0L;
	arc=none smtp.remote-ip=91.218.175.90
Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E5606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 402E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XEpYFC0L
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ChKEDs8LmfRwZ2jDmobqG4bvv10gyRZAaC5qy8msmOE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795684462; v=1; x=1796289262;
 b=XEpYFC0LTnuh9ic1T4wjud+OggYFa+p6VV4l/4sOS9wOqt3NW2uJspc72l010LrvaXOO2OxI
 x+3O+soXYapPVOX4VQCSy9JtIKd3kKuXYOMdmf4iXSwNUjrbFFCmksogphbxrWnx9RNOdnU0Kmk
 4b8VygllqLXLuBiEvAbjGEHc=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c239ecf2dd67665a;
	Thu, 26 Nov 2026 09:14:22 +0000
X-Mizu-Trace-ID: c239ecf2dd67665a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 17:14:12 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org
Subject: Re: [PATCH RESEND net v2] vlan: drop the promisc/allmulti references
 on the real device on delete
Message-ID: <20261126091412.GI33976@Liu-laptop>
References: <179562437889.3453587.11037378125876087336@gmail.com>
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
In-Reply-To: <179562437889.3453587.11037378125876087336@gmail.com>

On Thu, Nov 26, 2026 at 01:37:04AM +0900, Kyuwon Cho wrote:
> Since commit 27b918007d96 ("net: vlan: don't propagate flags on open"),
> vlan_dev_change_rx_flags() passes IFF_PROMISC and IFF_ALLMULTI changes
> on to the real device whether or not the VLAN device is up, and
> vlan_dev_open()/vlan_dev_stop() no longer take or drop those references.
> Nothing drops them when the VLAN device is deleted, so the real device
> stays promiscuous or allmulti for good:
> 
>   ip link add link veth0 name vlan10 type vlan id 10
>   ip link set vlan10 promisc on
>   ip link del vlan10
>   ip -d link show veth0    # promiscuity 1
> 
> Drop them in vlan_dev_uninit(). The device flags are still set there,
> and no instance lock is held, so this does not bring back the recursive
> locking that the commit above removed.
> 
> After that, stop passing flag changes on to the real device. When a
> VLAN and a VLAN stacked on it are deleted in one batch
> ("ip link del group N"), the upper VLAN's vlan_dev_uninit() can run
> after the lower one's and clear its IFF_PROMISC or IFF_ALLMULTI, which
> would drop the real device's reference a second time.
> 
> Fixes: 27b918007d96 ("net: vlan: don't propagate flags on open")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> Resent with netdev and the other recipients in Cc; the first posting
> reached only the four net maintainers (Paolo).
> 
> v2: stop passing flag changes on to the real device after
>     vlan_dev_uninit(), so that a VLAN stacked on it and deleted in the
>     same batch does not drop the reference again (Sashiko,
>     https://lore.kernel.org/all/179561249161.3135.16028121153100336999@kernel.org/)
> v1: https://lore.kernel.org/all/179552079831.1290967.13072162433438626338@gmail.com/
> 
> The issue was found by an LLM-guided test generator that we are
> developing as a research prototype. The commands above reproduce it as
> any user under "unshare -Urn", after
> "ip link add veth0 type veth peer name veth1". With only the
> vlan_dev_uninit() change, a batch delete of two stacked VLANs wraps the
> count instead:
> 
>   ip link add link veth0 name v1 type vlan id 10
>   ip link add link v1 name v2 type vlan id 20
>   ip link set v2 promisc on
>   ip link set v1 group 5
>   ip link set v2 group 5
>   ip link del group 5
>   ip -d link show veth0    # promiscuity 4294967295
> 
> Our test also covers allmulti, a VLAN that is up when the flag is set
> or the device is deleted, and the stacked VLANs deleted one at a time.
> 
> The patch was written with LLM assistance; we reviewed and tested it.
> With it, both counts return to 0 in every case, with lockdep enabled
> and quiet.
> 
>  include/linux/if_vlan.h |  2 ++
>  net/8021q/vlan_dev.c    | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
> index c863cdf60f01..c0cfb87d6682 100644
> --- a/include/linux/if_vlan.h
> +++ b/include/linux/if_vlan.h
> @@ -168,6 +168,7 @@ struct netpoll;
>   *	@vlan_proto: VLAN encapsulation protocol
>   *	@vlan_id: VLAN identifier
>   *	@flags: device flags
> + *	@uninit: the promisc/allmulti references on @real_dev were dropped
>   *	@real_dev: underlying netdevice
>   *	@dev_tracker: refcount tracker for @real_dev reference
>   *	@real_dev_addr: address of underlying netdevice
> @@ -184,6 +185,7 @@ struct vlan_dev_priv {
>  	__be16					vlan_proto;
>  	u16					vlan_id;
>  	u16					flags;
> +	bool					uninit;
>  
>  	struct net_device			*real_dev;
>  	netdevice_tracker			dev_tracker;
> diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
> index bca0a3693636..401ae08f16f4 100644
> --- a/net/8021q/vlan_dev.c
> +++ b/net/8021q/vlan_dev.c
> @@ -520,6 +520,8 @@ static void vlan_dev_change_rx_flags(struct net_device *dev, int change)
>  {
>  	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
>  
> +	if (vlan_dev_priv(dev)->uninit)
> +		return;
>  	if (change & IFF_ALLMULTI)
>  		dev_set_allmulti(real_dev, dev->flags & IFF_ALLMULTI ? 1 : -1);
>  	if (change & IFF_PROMISC)
> @@ -647,6 +649,14 @@ void vlan_dev_free_egress_priority(const struct net_device *dev)
>  
>  static void vlan_dev_uninit(struct net_device *dev)
>  {
> +	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
> +
> +	if (dev->flags & IFF_ALLMULTI)
> +		dev_set_allmulti(real_dev, -1);
> +	if (dev->flags & IFF_PROMISC)
> +		dev_set_promiscuity(real_dev, -1);
> +	vlan_dev_priv(dev)->uninit = true;
> +
>  	vlan_dev_free_egress_priority(dev);
>  }
>  
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
