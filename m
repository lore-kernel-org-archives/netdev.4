Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444424;
	b=KCmcMP8H9xyAmxNxMOFROjVdDL1+ZdqRkxBbqEfjY6rUdgGlzLfFdO/kMsOSW0uU5mjE
	 kz9ns8p6+323ry3PqIXvA3kDdd/TmsC48ReYWz2tTOuFZGzXGL0baMY9speAbO9DywdAd
	 aIPu3j+DE05avVqnDwVaEuSAobXdnj54YNUNVjHEKrih4Ho0Iv8G7YF3a/rNwEat2pdVP
	 M5XMl4VZvU6tMVB0rn0RsG27SVowRpTUOt+3jCeB4jCY3SGOxMohtOQl8lDRni5q3xxPQ
	 96AZmmFVUFp8zuzkw5Dh14F5Hvc/B3HUeSZI94bC+nCGBHE7Xf9gtyMVvbFcrzEE5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PAIZwiK5qKowgcqUfUnx7bgiDvxuWelNXNLii6FeV8A=;
	b=N4cQ9hNNbJ5yb7A4dHX06L5YwOrsLDMjE9P3YJ5bCcd9Vuveqb5qnzY+5dRve0fwoLYU
	 tYQVXeV0LIEXfXVKFPKOWM2s9NoLD08IgfNWDZp1GrN1YMYPpncNgdhnQpAFGlJspU34F
	 O7TAdL5g1fHirdDzger7REd1cuj9z1IF1pPOjEP/rsBEv4/v7Bg12mIne/NlDStiuvjfM
	 C1KCCCR1z+es6UO7DAt8R9k9AwNW3COQYbeZMOTG20JB6tW/UMD/5poZ2zoB81sFxihV0
	 0qDf31UQzvA4I0Me2nDQxl7VnpipULJ8eF+0qoLa0YwAsBc2wCfgP3F5E/E0i4rnNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgtIOA61;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5F606A31A;
	Mon, 23 Nov 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgtIOA61
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028E41F000D3;
	Mon, 23 Nov 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444423;
	bh=PAIZwiK5qKowgcqUfUnx7bgiDvxuWelNXNLii6FeV8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QgtIOA61DawPVOSPQTA4zgawhZbWQ5WUTc5nGKJxuJxvhOgEDfcLPqH6cK0uzF0w9
	 Qo9cNpP9nNNbc11jiA1pvqfLOXeYqGGLdVX72EoFrKgZwzhRkkzpb7ltpruBzcrcnz
	 lWPm3zb1ho8ZTLGfKCL+DruO+jx7Ln+PUF4y+/GvchnTzzftoWyHLjua1uq6LYlrge
	 ofIxmzH0C/csZ4dCIUPX89p77HkzadDzcwZOM/zk0TB79URonGv03Vz8GsxysOwQFl
	 zdpusr//uo8gtyF8tOi1nfvTeHEIcF7rrQgtnLoG4uprRDWpC0uxSZakeC/hDDXgCR
	 Dj5LqZIjjts6A==
Date: Mon, 23 Nov 2026 14:33:39 +0000
From: Simon Horman <horms@kernel.org>
To: subash.a.kasiviswanathan@oss.qualcomm.com
Cc: netdev-bot+sashiko@kernel.org, sean.tranchetti@oss.qualcomm.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints with
 dev_set_mtu() and restore on failure
Message-ID: <20261123143339.GC31322@horms.kernel.org>
References: <20261117060737.2764327-6-subash.a.kasiviswanathan@oss.qualcomm.com>
 <179524464443.3135.11939584752095940965@kernel.org>
 <000101dd79d0$1e2a73c0$5a7f5b40$@oss.qualcomm.com>
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
In-Reply-To: <000101dd79d0$1e2a73c0$5a7f5b40$@oss.qualcomm.com>

On Sat, Nov 21, 2026 at 08:51:04AM -0700, subash.a.kasiviswanathan@oss.qualcomm.com wrote:
> > -----Original Message-----
> > From: netdev-bot+sashiko@kernel.org <netdev-bot+sashiko@kernel.org>
> > Sent: Saturday, November 21, 2026 12:04 AM
> > To: subash.a.kasiviswanathan@oss.qualcomm.com
> > Cc: sean.tranchetti@oss.qualcomm.com; andrew+netdev@lunn.ch;
> > davem@davemloft.net; edumazet@kernel.org; kuba@kernel.org;
> > pabeni@redhat.com; netdev@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints with
> > dev_set_mtu() and restore on failure
> > 
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider.
> > 
> > Critical: 0 · High: 0 · Medium: 1 · Low: 1
> > 
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchwork
> > know by including "pw-bot: cr" as a separate line at the end of your reply
> > (one such reply per series is enough).
> > 
> > - [Medium] rmnet_vnd_update_dev_mtu()
> >   (drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c:447-473) now
> > shrinks…
> > - [Low] The commit message opens with "When the real device MTU or the
> >   data format requires a smaller MTU, existing endpoints are shrunk by…
> > 
> > --
> > 
> > net: qualcomm: rmnet: Resize endpoints with dev_set_mtu() and restore on
> > failure
> > 
> > This commit changes rmnet_vnd_update_dev_mtu() so it shrinks existing
> > endpoints with dev_set_mtu() instead of calling the ndo directly. As a
> > result, MTU notifiers and link notifications are now delivered. If resizing
> > an endpoint fails, the endpoints already resized are put back to their
> > saved MTU, and the original error is returned.
> > 
> > > When the real device MTU or the data format requires a smaller MTU,
> > > existing endpoints are shrunk by writing dev->mtu directly. No MTU
> > > notifiers run and userspace gets no link notification.
> > 
> > [Severity: Low]
> > Is the part about the real device MTU accurate?
> > 
> > rmnet_vnd_update_dev_mtu() has only two callers, rmnet_newlink() and
> > rmnet_changelink(). The changelink call only happens when
> > IFLA_RMNET_FLAGS
> > is present, which means a data format change.
> > 
> > When the real device MTU changes, rmnet_config_notify_cb() only validates
> > the new value and vetoes it if needed:
> > 
> > drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:rmnet_config_notify_
> > cb() {
> >     ...
> > 	case NETDEV_CHANGEMTU:
> > 		if (rmnet_vnd_validate_real_dev_mtu(real_dev))
> > 			return NOTIFY_BAD;
> >     ...
> > }
> > 
> > So endpoints are never shrunk on that path, either before or after this
> > patch.
> > 
> > Could the commit message be limited to the data format case? As written,
> > it suggests this fix also covers the real device MTU path.
> > 
> > > diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > > index 8bf87c5ecb43b..dce436e4c6305 100644
> > > --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > > +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > > @@ -433,24 +433,42 @@ int rmnet_vnd_validate_real_dev_mtu(struct
> > net_device *real_dev)
> > 
> > [ ... ]
> > 
> > >  	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> > > -		if (ep->egress_dev->mtu <= new_mtu)
> > > +		ep->saved_mtu = ep->egress_dev->mtu;
> > > +		if (ep->saved_mtu <= new_mtu)
> > >  			continue;
> > >
> > > -		err = rmnet_vnd_change_mtu(ep->egress_dev, new_mtu);
> > > -		if (err)
> > > -			return err;
> > > +		err = dev_set_mtu(ep->egress_dev, new_mtu);
> > > +		if (err) {
> > > +			fail_ep = ep;
> > > +			break;
> > > +		}
> > >  	}
> > >
> > > -	return 0;
> > > +	if (!err)
> > > +		return 0;
> > > +
> > > +	/* Restore the endpoints which were already resized. Failures here
> > > +	 * are ignored since the original error is the one to report.
> > > +	 */
> > > +	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> > > +		if (ep == fail_ep)
> > > +			break;
> > > +
> > > +		if (ep->egress_dev->mtu != ep->saved_mtu)
> > > +			dev_set_mtu(ep->egress_dev, ep->saved_mtu);
> > 
> > [Severity: Medium]
> > Does this restore undo everything the earlier dev_set_mtu() calls did?
> > 
> > Now that the shrink goes through dev_set_mtu(), netif_set_mtu_ext() runs
> > the NETDEV_PRECHANGEMTU and NETDEV_CHANGEMTU notifier chains for
> > each
> > endpoint.
> > 
> > A PRECHANGEMTU notifier can now veto the shrink. For example,
> > team_device_event() does this:
> > 
> > drivers/net/team/team_core.c:team_device_event() {
> >     ...
> > 	case NETDEV_PRECHANGEMTU:
> > 		/* Forbid to change mtu of underlaying device */
> > 		if (!port->team->port_mtu_change_allowed)
> > 			return NOTIFY_BAD;
> >     ...
> > }
> > 
> > Before this patch, the direct rmnet_vnd_change_mtu() call could not fail
> > here, because new_mtu < ep mtu <= real_dev->mtu - old headroom. So a
> > newlink or changelink with IFLA_RMNET_FLAGS that used to succeed can now
> > return an error.
> > 
> > If the veto happens on a later endpoint, the CHANGEMTU notifiers have
> > already run on the earlier ones. If the temporary new_mtu was below
> > IPV6_MIN_MTU, addrconf_notify() tore down IPv6 on those endpoints:
> > 
> > net/ipv6/addrconf.c:addrconf_notify() {
> >     ...
> > 	case NETDEV_CHANGEMTU:
> > 		/* if MTU under IPV6_MIN_MTU stop IPv6 on this interface.
> > */
> > 		if (dev->mtu < IPV6_MIN_MTU) {
> > 			addrconf_ifdown(dev, dev != net->loopback_dev);
> > 			break;
> > 		}
> >     ...
> > }
> > 
> > In the same way, inetdev_event() falls through to inetdev_destroy() when
> > the MTU is below the IPv4 minimum.
> > 
> > Restoring saved_mtu only creates a new, empty inet6_dev or in_device. The
> > configured addresses, routes and per-device sysctls are still lost, even
> > though the request returned an error.
> > 
> > For example, take a real_dev MTU of 1284 with no checksum offload (4 bytes
> > of headroom). Endpoint A has a lower mux_id, has IPv6 configured and is at
> > 1280. Endpoint B has a higher mux_id, is a team port and is also at 1280. A
> > changelink that sets CKSUMV5 (8 bytes of headroom) gives new_mtu = 1276:
> > 
> >   dev_set_mtu(A, 1276)  -> addrconf_ifdown(A, true)
> >   dev_set_mtu(B, 1276)  -> vetoed by team_device_event(), -EPERM
> >   dev_set_mtu(A, 1280)  -> A comes back with no IPv6 addresses
> > 
> > Userspace also gets a shrink-then-grow pair of RTM_NEWLINK events for A,
> > for a request that failed.
> > 
> > The commit message says a failed request "does not leave some of them
> > shrunk". That holds for the MTU values but not for the L3 state.
> > 
> > Is this partial rollback intended? If so, should the commit message
> > mention the new veto failures and the lost L3 state on endpoints that were
> > already resized?
> > 
> > > +	}
> > > +
> > > +	return err;
> > >  }
> > 
> 
> Yes, partial rollback is expected here. The comment above the rollback logic already mentions that - "Failures here
> are ignored". 

I assume that the motivation for taking this approach is that both avoiding
the need for rollback and performing a full rollback is somewhere between
difficult and impossible.

If so, I think the trade-off made in this patch is reasonable.
