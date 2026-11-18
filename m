Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024626;
	b=X6zpix4D8KypfuuTqxqDj8quyukqZ5p0hHbBJQLTetmKqBgJGp2EE0f7OkFhCQE9m5Vy
	 OjhXJAX5SSNEFClU4HyXHrTo7nkseqS1Izp+iysmb3ro8k3iTdfocrYecGgGfSGi7IaUn
	 7WVhLaRJ0aC/KlRJFi8D2MIzxemWWA/MwdluaitGi1041WIDRDGmpKChlehvVzH27LFnj
	 9QncfPbRRCjS+XuCbECiEn+Vvd2153hl0ZPIPZMEmS1wK6+iL0SaDUJ3a2PRrJ0sP1UM9
	 bfal3aNnUBKysp0N9fX76/Zw3T1ha7bJg74+B2xej4yk/I3lM6bWkwNRBbMTeTz6Z/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024626;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=228KQJ6URMBlHpySeauUAIbmNzS+ein6ZxweO0f/KQ8=;
	b=HCZwk75Xz2KVkaQRKYCDX234rxasO7m8cr/w3OoZquAU93+4HpSTVzGPBRCu8eul8Sjk
	 oHYlTG0vn8bwUgMwneDN7RcpyZ0PF6OU5v2b4XU75GzUI9YlPkaHB7pAzcDA7EDdpgVkc
	 hmF8/acEkPzXDfPQuq9O1idKb9uqz0XDwo3mIipf1gMR+j9sd3jrhYAV0RH5mZqF0Oe1L
	 uXrM0tBcsyoVFEHPjkSf7TwUJLNYH/CowtKmnPk3WpbNx/VRtg6ZCF7QOAbsSbfKo5vOK
	 0xgEGbL1p1Vf6Xu2/fY9EZTioF90JCNlFZM6wZFfPqKoRrmZ8vhvPLSrtQZXB5uBJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F43GLJiZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D106606A325;
	Wed, 18 Nov 2026 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F43GLJiZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6AB1F000C4;
	Wed, 18 Nov 2026 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024626;
	bh=228KQJ6URMBlHpySeauUAIbmNzS+ein6ZxweO0f/KQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F43GLJiZfqIwmG19kHrjZ/oWi+rmfDHnHV6vSVzCVK+Pl8JNFP2GaqwsbMtrupdDt
	 ulpVekSsQVnAGRenFteVM0l/OTmDeWnA8ccXTEHh3se2ltx+DRn/1HiNeSMCr7k7HK
	 DJphiLiUkV87OYmQiAk2m+8k1lJeOMuDCNhX4EDzR8bvSt8yKaaaVAA8m7cdxTIALW
	 f7R1niRz/+GnxNKInEtwa/JJ/1PZGioWq7eYR5KBd3EXhH1iABMRbjuMNdmhdNGlXf
	 cwGizGrQwPqtVfWz5O5D7Lwws+cYOm2Xgfgr1ok9jdO62jFm+gEAHDSHQ3S8nnArc3
	 z3JxeeGaazETQ==
Date: Wed, 18 Nov 2026 17:57:01 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: sunwenbo@cmss.chinamobile.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, hangbin.liu@linux.dev, kuniyu@google.com,
	maheshb@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net v2] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
Message-ID: <20261118175701.GO860048@horms.kernel.org>
References: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com>
 <179483705411.3136.2665029224845053782@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179483705411.3136.2665029224845053782@kernel.org>

On Mon, Nov 16, 2026 at 01:50:54PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete.

Hi Wenbo,

This does seem of concern. Could you comment on this?

> --
> 
> ipvlan: update port flags only after ipvlan_set_port_mode() succeeds
> 
> This patch moves the write of the shared port->flags in ipvlan_link_new()
> to after ipvlan_set_port_mode() has succeeded. The goal is that a failed
> creation of a second ipvlan on an active port does not change the flags
> of the ipvlan interfaces that already exist.
> 
> > diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
> > index f29864db662aa..5732b167c5b3c 100644
> > --- a/drivers/net/ipvlan/ipvlan_main.c
> > +++ b/drivers/net/ipvlan/ipvlan_main.c
> 
> [ ... ]
> 
> > @@ -691,6 +685,12 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
> >  	if (err)
> >  		goto unlink_netdev;
> >  
> > +	/* Flags are per port and latest update overrides. User has
> > +	 * to be consistent in setting it just like the mode attribute.
> > +	 */
> > +	if (data && data[IFLA_IPVLAN_FLAGS])
> > +		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
> > +
> 
> [Severity: High]
> Can a failed RTM_NEWLINK still overwrite the shared port->flags here?
> 
> The commit message says:
> 
>   "Defer updating port->flags until after ipvlan_set_port_mode() succeeds,
>   after which ipvlan_link_new() has no remaining failure paths."
> 
> When ipvlan_link_new() returns 0, the creation is not yet committed. The
> caller, rtnl_newlink_create(), can still fail after ops->newlink():
> 
> net/core/rtnetlink.c:rtnl_newlink_create() {
>     ...
> 	err = rtnl_configure_link(dev, ifm, portid, nlh);
> 	if (err < 0)
> 		goto out_unregister;
> 	if (tb[IFLA_MASTER]) {
> 		netdev_lock_ops(dev);
> 		err = do_set_master(dev, nla_get_u32(tb[IFLA_MASTER]), extack);
> 		netdev_unlock_ops(dev);
> 		if (err)
> 			goto out_unregister;
> 	}
>     ...
> out_unregister:
> 	if (ops->newlink) {
> 		LIST_HEAD(list_kill);
> 
> 		ops->dellink(dev, &list_kill);
> 		unregister_netdevice_many(&list_kill);
>     ...
> }
> 
> For ipvlan, the dellink callback is ipvlan_link_delete(), which calls
> __ipvlan_link_delete(). Neither function restores port->flags. When
> port->count > 1, the shared port survives with the flags from the failed
> request.
> 
> The IFLA_MASTER failure is easy to trigger. A new ipvlan has no master
> upper device, so do_set_master() goes straight to the ifindex lookup. That
> returns -EINVAL for a nonexistent ifindex, or -EOPNOTSUPP for a device
> without ndo_add_slave, such as lo.
> 
> For example, with ipv1 on eth0 in bridge mode, this command fails but
> leaves ipv1 in private mode:
> 
>   ip link add link eth0 name ipv2 master lo type ipvlan mode l2 private
> 
> The port->mode change made by ipvlan_set_port_mode() also persists on this
> path. Moving the assignment within ipvlan_link_new() cannot cover this
> case.
> 
> Would this need port state to be saved and restored across the whole
> rtnl transaction, for example by restoring it from dellink when creation
> is rolled back?
> 
> >  	mutex_lock(&port->pnodes_lock);
> >  	list_add_tail_rcu(&ipvlan->pnode, &port->ipvlans);
> >  	mutex_unlock(&port->pnodes_lock);
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112064821.85624-1-sunwenbo%40cmss.chinamobile.com
