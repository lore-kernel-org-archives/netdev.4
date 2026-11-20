Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156910;
	b=IAVIZ7Z8aO64V5FI4nehMWdEdd0pVAPJl65GyWAvl68YLJQru47cSbk5/p6e99e0Vi6w
	 i2+kZxy0wGqbzEI58IK1g97YscXgyENZyaPu9hSv4Q6C2wKkrs2BCA+ebo/9ySJ0BPGD3
	 Qxoo0U1y6M60oEZkcapxzTxu1WsQbWbqVwMV+ck06ahd3lEqf92UYPyZCkyi4qqLlGTM/
	 1GHldukwKP7HcilTE0QZ8/HJ+t+8pXdaOSMNYMKKSKmdDA3EEIKRjGEbYtNSfesKRbbAB
	 1EVF3m2uEO6rw86jQMDv8onfA1DJ3HUZPtKGiWf8cYfIKW3+XMpB1SK+FGc5uDxp1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156910;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IRZ/wGMOyJ5LcJ+jaX3m0mIFpWsy18PNSRPcCe3MKuE=;
	b=D4hkqXRm6PI4wOT22Y34iMRlBnRC2W2KoItIXoNT+ro//Gmx69NwqPXDUbPW1ij7/Rva
	 Yl0IMAnlUgyIT+l/j2fVDaU7OPILpP+d5gydLId/NMmmLGIS6H6GgrbTNJBqY2OlkuUSa
	 dVW5rn3wh3gU8tFq8BadKIxD+AWo8ABYr5FZ7ze9OgSqfgWTUS84GzqsolQ+fdd7GqmXe
	 7odA2XOIQspBUyQa+NVBUZRAGc2UBzvCxRihoITdQ8fmynQK4pKRn+wtmjDhxxtgYkDJ4
	 a+3m0fJZxvC21hXiaSv/UXF6HWoyUOyq+y+shXlpV/4liU58fmq38Z4VuzZ+VJXysCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fn4gF4jR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6A606A338;
	Fri, 20 Nov 2026 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fn4gF4jR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605AB1F000C4;
	Fri, 20 Nov 2026 06:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156910;
	bh=IRZ/wGMOyJ5LcJ+jaX3m0mIFpWsy18PNSRPcCe3MKuE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fn4gF4jRKevviH9eBsmOfW6t6x8UvK2FDmhQAFtog2tZ2O62cXmjn1mdxP9ulVhlB
	 VY34HBtiYo6Y8w9khXRUryF+xU3i08z3RIpfRJKc5jQVUNacxwQ5AoBzRdH/K8mBiN
	 EbrlwteoEs0YZDGh9/F2wWzeN633n5rRY7BLMCx23Tpu+JSZ5YVFmbfqF1cao4/w4i
	 kWyrFlqzeLOnqf+SejstU9dMhC7Qc76IDjVGy0YNSPsS13EX2kmEV4oO8YQG8HCg/m
	 rXmDyE0BiGKjYnGCVpenCl5EY06kF26kxbS/5hyKkY1RbQuxWH10gm7waot9XiMZmg
	 sCrjO13r2764g==
Subject: Re: [PATCH net v5 05/14] net: pse-pd: do not reach a freed PHY from
 the notification worker
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:41:48 +0000
Message-ID: <179515690895.3136.4077280921885475671@kernel.org>
In-Reply-To: <20261118183957.2031311-6-github@szelinsky.de>
References: <20261118183957.2031311-6-github@szelinsky.de>
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

- [Low] The new kernel-doc implies that a NULL attached_phydev is
  temporary, but the code makes it permanent.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  pse_send_ntf_worker() can still use a freed net_device.

--

net: pse-pd: do not reach a freed PHY from the notification worker

The notification worker used to keep a reference on the pse_control and
then dereference psec->attached_phydev, which could already be freed. With
this patch the worker looks up the pse_control and reads attached_phydev
under pse_list_mutex, nested inside rtnl. When a second PHY takes a shared
PI, pse_control_get_internal() now clears attached_phydev and warns.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 0894613515e0d..b8cba6f86a7fd 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -31,7 +31,9 @@ static DEFINE_MUTEX(pse_pw_d_mutex);
>   * @list: list entry for the pcdev's PSE controller list
>   * @id: ID of the PSE line in the PSE controller device
>   * @refcnt: Number of gets of this pse_control
> - * @attached_phydev: PHY device pointer attached by the PSE control
> + * @attached_phydev: PHY device pointer attached by the PSE control, or NULL
> + *                   when several PHYs share the PI. Read it only under
> + *                   pse_list_mutex.

[Severity: Low]
This isn't a bug, but "NULL when several PHYs share the PI" reads as if
the field is only NULL while the PI is shared. Is that what is intended?

The only writes to attached_phydev are the assignment when the pse_control
is created and the new clear in pse_control_get_internal(). Neither
pse_control_put() nor __pse_control_put_internal() sets it back.

So if PHY A and PHY B share a PI and B is removed, only A holds the
pse_control, but attached_phydev stays NULL. The commit message describes
this:

  Events for that PI are then no longer reported, even after one PHY goes
  away.

The new pse_control_get_netdev() kernel-doc has the same problem:

  Return: netdev pointer, or NULL if no single PHY is attached

It also leaves out the NULL return when the single PHY has no
attached_dev.

Would wording like "NULL once the PI has been shared by several PHYs"
match the code better?

[ ... ]

> @@ -1014,13 +1017,18 @@ static void pse_send_ntf_worker(struct work_struct *work)
>  		struct net_device *netdev;
>  		struct pse_control *psec;
>  
> -		psec = pse_control_find_by_id(pcdev, ntf.id);
> +		/* pse_control_put() frees the pse_control under
> +		 * pse_list_mutex before its PHY is freed, so the mutex
> +		 * keeps attached_phydev valid.
> +		 */
>  		rtnl_lock();
> +		mutex_lock(&pse_list_mutex);
> +		psec = pse_control_find_by_id(pcdev, ntf.id);
>  		netdev = pse_control_get_netdev(psec);
>  		if (netdev)
>  			ethnl_pse_send_ntf(netdev, ntf.notifs);

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but can
the worker still use a freed net_device here?

pse_control_get_netdev() returns psec->attached_phydev->attached_dev
without taking a netdev reference. ethnl_pse_send_ntf() then dereferences
it in ethnl_fill_reply_header() and ethnl_multicast().

Neither rtnl nor pse_list_mutex excludes the paths that clear attached_dev
or free the netdev. phy_detach_internal() clears it without needing rtnl:

drivers/net/phy/phy_device.c:phy_detach_internal() {
    ...
    phydev->attached_dev->phydev = NULL;
    phydev->attached_dev = NULL;
    ...
}

Its own comment says "Drivers may detach without RTNL while dev is
unregistered". free_netdev() on a NETREG_UNREGISTERED device does not need
rtnl either.

usbnet_disconnect() is one example of a remove path that does all of this
outside rtnl:

CPU0 (usbnet_disconnect)            CPU1 (pse_send_ntf_worker)
unregister_netdev(net);
                                    rtnl_lock();
                                    mutex_lock(&pse_list_mutex);
                                    netdev = pse_control_get_netdev(psec);
                                      /* attached_dev still set */
->unbind()
  smsc95xx_unbind()
    phy_disconnect()
free_netdev(net);
                                    ethnl_pse_send_ntf(netdev, ...);

The PHY stays on the MDIO bus in this sequence, so psec and attached_phydev
remain valid, and the new pse_list_mutex scheme does not cover the netdev.

Does the worker also need a lifetime guarantee for the netdev? For
example, a netdev reference taken when the PHY is attached, or a reg_state
check together with serialisation against phy_detach.

> +		mutex_unlock(&pse_list_mutex);
>  		rtnl_unlock();
> -		pse_control_put(psec);
>  	}
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118183957.2031311-1-github%40szelinsky.de
