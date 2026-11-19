Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108154;
	b=ZlLiwarjG7XhTWRDukWeJWfTpdUbnr1Uj7il+uDPTJJytVsAkEYIkRi870tGMIER0PKV
	 V94+rhox6dzaikDhZmSGhP3d2OS3Ov/hXCx8/C9CllB+58+gRbbR6epktofvdqZOjk5GF
	 VvuqeIgPiLGbOglK1fLugbhUMyDxc0EtecCC7kjdwLGT1SVw+2VXPki/4xi6LzMFjdKp2
	 Y7AdIlTRzgpTZa8WVu7isq7JUsC8Xvh6hItso7wbyu7+iuMg0IMb994PAJojLn7cjXQjm
	 yD/fhCtcQwS3DVC1JvfWLX2Gegq0sdD1sEEzHhF7VT5ZZ+u+BZDqWqeVmjIIp9P2WIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108154;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oPTp5+Vk6QfYProopHZfzFzvz3yg3vGtC+2p3TGdMOw=;
	b=a9E6YUsppv6zSdnzCGW7C1IhIyTjSHy2ez+17NRYUUI9Rl/RX3/YcaoHjACMxA9ySZi8
	 x09v2fATDyFusuU0jugp8GgtCHOpf+Q/wx3HoIyQvspVDqsSLMrTQviitMMkoZ3FyJLol
	 5BwKOdeaFshJBEzQ5WcIAojTyuZbwWhK1Uxa6lNJZKsGtScTlV+kLIq89vMTRGcpYlGPD
	 21+d5SHR2NqVY9QO6l/07NFGhcivW3k0IPiuvMQv9SnHAVERXhuXLgeOTZCgLBMsr06bI
	 gS8ZDc1xPMC8afXuL7FEDIqEpLp2xBSlfkxQEMsnS8I9T7uAvw0+fC2BI/tVPQbgG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWkz4aXx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1160A6F6C;
	Thu, 19 Nov 2026 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWkz4aXx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282BB1F000CC;
	Thu, 19 Nov 2026 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108153;
	bh=oPTp5+Vk6QfYProopHZfzFzvz3yg3vGtC+2p3TGdMOw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mWkz4aXxT87v4e1yOXeQlOkBFoXFYWwf2xBje5f8Q60eJqs/2wgvah2tSZBC1Wbko
	 filneNcoSKdx4Vp8eYLKANhXpQPGluJvTswhCcogMgPKveIN+t6gjuX2+qmg654JJS
	 WgXCUMlJwpsdD2udPYL6cEqW9CLBbaR6pIwOSi6BSHMgQZlFsNsUfsJLCDCtTa0R99
	 F6ItYvRqiqxt+LcArh3spE3GpGKo7YOI2uuGhNBkzwIIZEfeDaRAW2vstH8urVPdyv
	 sSaoeERtgqoQMAbrSxzMvUGUbKskkBu1B95I6ukjfLnR4wZqOL0z6h1OjiB7SOCFjA
	 2lXVrDklETUzQ==
Subject:
 Re: [PATCH net-next v8 10/10] bnge: add cpu_rmap support for IRQ affinity
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:12 +0000
Message-ID: <179510815274.3136.16405156057280346310@kernel.org>
In-Reply-To: <20261116140653.1685797-11-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-11-vikas.gupta@broadcom.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] bnge_free_cpu_rmap()
  (drivers/net/ethernet/broadcom/bnge/bnge_netdev.c) tears down…

--

bnge: add cpu_rmap support for IRQ affinity

This patch allocates and fills a cpu_rmap for the bnge RX IRQ vectors
when CONFIG_RFS_ACCEL is set. That sets dev->rx_cpu_rmap and turns aRFS
on for the driver. It also adds bnge_free_cpu_rmap(), which clears and
frees the rmap from bnge_free_irq().

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 0e7c506af402c..507f920ea1d3f 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -2496,12 +2510,35 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
>  	bnge_hwrm_stat_ctx_free(bn);
>  }
>  
> +#ifdef CONFIG_RFS_ACCEL
> +/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the pointer and
> + * wait for readers that already loaded it before the rmap is freed.
> + */
> +static void bnge_free_cpu_rmap(struct bnge_net *bn)
> +{
> +	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
> +
> +	if (!rmap)
> +		return;
> +
> +	WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
> +	synchronize_net();
> +	free_irq_cpu_rmap(rmap);
> +}

[Severity: Low]
Does the reader in set_rps_cpu() give the guarantee this comment relies
on?

The ordering here does prevent a use-after-free. However, set_rps_cpu()
in net/core/dev.c does not take a single snapshot of the pointer. It
loads dev->rx_cpu_rmap twice with plain loads, with no READ_ONCE() and
no __rcu annotation:

net/core/dev.c:set_rps_cpu() {
    ...
		if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
		    !(dev->features & NETIF_F_NTUPLE))
			goto out;
		rxq_index = cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
    ...
}

Suppose the WRITE_ONCE() above lands between those two loads. The
reader then passes the NULL check and calls cpu_rmap_lookup_index()
with a NULL rmap. synchronize_net() does not help here, because the
reader is already inside its RCU section. The race is between the two
loads, not between the reader and the free.

The teardown runs from ndo_stop:

bnge_close()->bnge_close_core()->bnge_free_irq()->bnge_free_cpu_rmap()

IFF_UP is still set at this point. That means skbs injected into the
bnge ingress path, for example via bpf_redirect() with BPF_F_INGRESS,
dev_forward_skb() or tc mirred ingress, could still reach
netif_rx()->get_rps_cpu()->set_rps_cpu() for this device.

In practice the compiler will most likely merge the two loads into one.
If so, the visible result would be a KCSAN data race report against
this WRITE_ONCE() rather than an oops. Before this patch bnge never set
rx_cpu_rmap, so set_rps_cpu() always took the early exit for this
device.

Would it make sense to have set_rps_cpu() take one READ_ONCE() snapshot
of dev->rx_cpu_rmap? Alternatively, the driver could avoid clearing the
pointer while readers can still run. Either way, the comment above
should probably be adjusted to match.

> +#else
> +static void bnge_free_cpu_rmap(struct bnge_net *bn)
> +{
> +}
> +#endif
> +
>  static void bnge_free_irq(struct bnge_net *bn)
>  {
>  	struct bnge_dev *bd = bn->bd;
>  	struct bnge_irq *irq;
>  	int i;
>  
> +	bnge_free_cpu_rmap(bn);
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
