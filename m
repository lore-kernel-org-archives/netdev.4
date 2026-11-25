Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612493;
	b=AGWFZTm7peEg9/Uc8giKTKlESqzVh6KseKSLdyBJvnC16E0pMbcswc8KlQ/Ns+qv2oVy
	 Ye6K2w/tqOg2F7FTTXCrlqv2jsPEmhrYWEr5vpHRoI3cF5DrAyxZjkpiTjYTSUpmakDNf
	 mRgIMGxVbnEg4n8KQfQc1O67CnCllWT+7ytbcQvPMG0N7x6ZSymrgKU6TaCUQMA19iQrq
	 Q2LEKOLl0zoJ6E/SxY+DQ+8AcdjPclI2yRqzTJHu/J5etH9tNL4lZF1Bf8zxGypthF7EZ
	 c2Hnm2oiics6cXVqkb7SoSiXRDtGRnSaBPRP6kEohZUx858lTyY9F6A3ViMyMVsgf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612493;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/n3t44YEMmmCq63KUFEjGWIQzYqLU5gYaUwKU4iJWzo=;
	b=WPau7FBdtwjMU4TSEFKgEuSK7AmMiRqK7ZGeBVgw1gwB0EO5dZrM7eF0E2BGfFFmzEv9
	 uD1SY8P/Tx+TK6xAbU+5WPLQ50mC31zdTVXRSW0ARmfqqmXAp3/4u7Cc6IedxuTzrS4Zk
	 uKJKGnNbyIww3hgLftVPCISIu8jzI9ZradRbKx7KGHE2kdZXkO8KkPgSW5VKF6ZAdTpUX
	 fPCf5bqODsYFvhIL97x/qR0JiMvzz1IC32+C55a5Qw/H09YD8AxhTOgf4RHcbk0sXuBL6
	 wRR2+ZfD5KCLTWRMJDa5T4tEr8dOdVLqDbW7RcAK5NLjaXyjm3OCSKVSY4o7GEatPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIqjGYyn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE3606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIqjGYyn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE351F000D3;
	Wed, 25 Nov 2026 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612492;
	bh=/n3t44YEMmmCq63KUFEjGWIQzYqLU5gYaUwKU4iJWzo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZIqjGYynpekfFEJei9ZMc75fykkeBScwgcrIMIsCrSv5EsyLOfIMOZw/XEtNIPfbI
	 bcPPVYufaobYkTYoIyO3STBb9ovHr8n+n2/MTHNCyxaMLeW30vQvFNMPWjQ0JlXrGi
	 /iEMcI6IAIFEy3uVRL+j0Ctsgcr0O9y4H61NT6Ixdrw+iN25n7gea5dP9Ijo0Ih6sQ
	 Q98/oJW0qfE40P+KyMJQDSZtrKY3qMy/4l3dWOOFEbE/KSDhM7HTpBYpJU5YHYKFlI
	 1xei2q7Q7VM1k77M19Lw/9xr6HSfQI+y6igMbCRES0DvaxgwA5qthhn1T8m2BR5v6N
	 4+yWccFHVorjw==
Subject: Re: [PATCH net] vlan: drop the promisc/allmulti references on the
 real device on delete
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, sdf@fomichev.me, willemb@google.com, horms@kernel.org,
 netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 13:14:51 +0000
Message-ID: <179561249161.3135.16028121153100336999@kernel.org>
In-Reply-To: <179552079831.1290967.13072162433438626338@gmail.com>
References: <179552079831.1290967.13072162433438626338@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch drops the real device's promisc/allmulti reference in
  vlan_dev_uninit(), but it leaves the VLAN's own…

--

vlan: drop the promisc/allmulti references on the real device on delete

This patch makes vlan_dev_uninit() drop the IFF_PROMISC and IFF_ALLMULTI
references that a VLAN device holds on its real device. Since commit
27b918007d96, vlan_dev_change_rx_flags() propagates these flags whether
or not the device is up, and nothing released them on delete.

> diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
> index bca0a3693636c..5286c79188714 100644
> --- a/net/8021q/vlan_dev.c
> +++ b/net/8021q/vlan_dev.c
> @@ -647,6 +647,13 @@ void vlan_dev_free_egress_priority(const struct net_device *dev)
>
>  static void vlan_dev_uninit(struct net_device *dev)
>  {
> +	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
> +
> +	if (dev->flags & IFF_ALLMULTI)
> +		dev_set_allmulti(real_dev, -1);
> +	if (dev->flags & IFF_PROMISC)
> +		dev_set_promiscuity(real_dev, -1);
> +

[Severity: High]
Can stacked VLANs deleted in one batch drop the real device's reference
twice?

The reference on real_dev is dropped here, but the VLAN keeps its own
IFF_PROMISC bit and promiscuity count. Nothing records that the reference
was already returned. vlan_dev_change_rx_flags() also still forwards any
later change:

net/8021q/vlan_dev.c:vlan_dev_change_rx_flags() {
    ...
	if (change & IFF_PROMISC)
		dev_set_promiscuity(real_dev, dev->flags & IFF_PROMISC ? 1 : -1);
}

Take veth0 <- v1 <- v2, run "ip link set v2 promisc on", put v1 and v2
in the same group, and then run "ip link del group N".

rtnl_group_dellink() walks the device list forward and calls
unregister_vlan_dev() on v1 and then on v2. So list_kill is [v1, v2].
unregister_vlan_dev() has already removed v2 from v1's vlan group, so
v1's NETDEV_UNREGISTER does not unregister v2 first.

unregister_netdevice_many_notify() then calls ndo_uninit in list order:

vlan_dev_uninit(v1)
    dev_set_promiscuity(veth0, -1)    veth0: 1 -> 0
    (v1 still has IFF_PROMISC, promiscuity == 1)

vlan_dev_uninit(v2)
    dev_set_promiscuity(v1, -1)       v1: 1 -> 0, clears IFF_PROMISC
      dev_change_rx_flags(v1)
        vlan_dev_change_rx_flags(v1)
          dev_set_promiscuity(veth0, -1)

__dev_set_promiscuity() only guards against wraparound when inc > 0:

net/core/dev.c:__dev_set_promiscuity() {
    ...
	promiscuity = dev->promiscuity + inc;
	if (promiscuity == 0) {
		...
		if (unlikely(inc > 0)) {
    ...
	} else {
		flags = old_flags | IFF_PROMISC;
}

So veth0->promiscuity would wrap to UINT_MAX with IFF_PROMISC set. veth0
would then stay promiscuous for good, and later "promisc on" requests
would fail with -EOVERFLOW.

If veth0 had another promisc user, the same sequence would turn
promiscuous mode off underneath it. That user's own -1 would then wrap
the counter. netif_set_allmulti() has the same missing underflow check,
so the allmulti path looks affected in the same way.

With the nested order ("ip link del v1", where v2 is unregistered from
v1's NETDEV_UNREGISTER), the counts stay balanced. That may be why the
single-device reproducer in the commit message passes.

Should the VLAN mark that the reference was handed back, or stop
propagating in vlan_dev_change_rx_flags() after uninit, instead of
relying only on dev->flags here?

>  	vlan_dev_free_egress_priority(dev);
>  }
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179552079831.1290967.13072162433438626338%40gmail.com
