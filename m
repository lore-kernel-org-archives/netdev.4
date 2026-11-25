Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590979;
	b=ht2UapiQza0mM6r6LDGBZ7q5a93Ui9hFDs0GHWiXDoFpGE5E4FJ2sBOc+Fkir6g4gG8q
	 UQUrpIs6Fd8d/gdWPR/s2/KcYyDEZXSfCf5UmiBLqBm0srv2JlL+fibYT8RNSRl2P8KmR
	 rw8m6UH/ZYafs5RkhpQIxAuAhwItkYvFI+UcuoDUTbep80kB/auMz3f56uiX5UpgCCNrI
	 AGBlpp1+ezEREfmZWZQbvEu8ole8WonASUKWz69EHTHtRP1CGdbjsueXrk7MuPYeeD8Ow
	 IJfswU8Goj6bYGaTZRR+79NxuLp/a4yOVYzPH39kII+I7ooJpRFyVr6vHhl0/JQt+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590979;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PBcxJs4YJ9Kl1J7kvgU+nHQpIaFyg5LVBkk9xBDYPhg=;
	b=Erl2yfQhOhyjKnPz/BrhBIO2Kgld2KfGjM+xrm26KL4ALlKjK7GQBan4fr0EdEvQxRs7
	 K+xCStKTVbBqeh7U+7JntSn5hAPJYFzugOmhkk0DDVTwnVPSm62GEHAUXBB2jCUPDcYKx
	 d1gC9xoTcKKaMJNq1D9Zh0FUy0M4QRT3vf9H9LLAN0z+yCGtGCmunLw2L4BvUwsZZaYRp
	 WlRkcXZB76VB6GIn9LrYetY0Hu0+NqiB+uyI2Gd0UXSrk+Niwor2mnEt9ZYwI6p8Hbs6w
	 NXAdmsCLdO54PSNwt1b5NAhMHo9RbKlatOLpw6+RvloTtcrOk5mjWwkaKLu/svmKGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mxz3oYUY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B3606A6A7;
	Wed, 25 Nov 2026 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mxz3oYUY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9AC1F000C4;
	Wed, 25 Nov 2026 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590979;
	bh=PBcxJs4YJ9Kl1J7kvgU+nHQpIaFyg5LVBkk9xBDYPhg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mxz3oYUYhhDxwTdP2KvTBZLCtg3uZ6xpdGtkvxlOf/AXQrdbcOuuqiIjKAxpm6vI/
	 hlw/YcisvZ/io+dy/e9J/yCPVia6QIXujsOCFxoGwuneHxEUR2lL4PgaxvzXQnT/9r
	 xlNkPzyNy3CFnKkxmeDY2Z2Eg4h3GyC1gixZxasgBJRSjSVx4HdUVYUVRRnNNaw+0e
	 ZpisdRuHM3mWSH9r7nNhdrY61zjSRhPKumYTMSFZLI2xoJU4/GloBApVd6f7pdyA4N
	 DmJR4gcqq0ho4N567vu2IwQ1c4MoR5x5V6k31uAjjOlZbjaHhGlzAb/I1P0oQETrQr
	 j0jJLx9IUcIMg==
Subject: Re: [PATCH net v4] net/ncsi: fix use-after-free of ncsi_channel in
 ncsi_remove_channel()
From: netdev-bot+sashiko@kernel.org
To: 18983559317@163.com
Cc: sam@mendozajonas.com, fercerpav@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 07:16:18 +0000
Message-ID: <179559097851.3135.4122236304109940542@kernel.org>
In-Reply-To: <20261121065625.27934-1-18983559317@163.com>
References: <20261121065625.27934-1-18983559317@163.com>
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

Critical: 0 · High: 1 (2) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

Pre-existing issues:
- [High] This bug predates the patch.
- [High] This bug predates the patch.

--

net/ncsi: fix use-after-free of ncsi_channel in ncsi_remove_channel()

The patch moves the free of ncsi_channel and its filter arrays into an
RCU callback. It also wraps the device lookup and the list walks of all
NCSI genl handlers in rcu_read_lock() sections. Separately, it drops the
leaked get_net() references and pins the net_device for the SEND_CMD
error notification.

> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 1d63958c4429b..79b2a56c5a935 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -242,17 +242,21 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)

[ ... ]

>  static void ncsi_remove_channel(struct ncsi_channel *nc)
>  {
>  	struct ncsi_package *np = nc->package;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&nc->lock, flags);
> -
> -	/* Release filters */
> -	kfree(nc->mac_filter.addrs);
> -	kfree(nc->vlan_filter.vids);
> -
>  	nc->state = NCSI_CHANNEL_INACTIVE;
>  	spin_unlock_irqrestore(&nc->lock, flags);
>  	ncsi_stop_channel_monitor(nc);
> @@ -263,7 +267,11 @@ static void ncsi_remove_channel(struct ncsi_channel *nc)
>  	np->channel_num--;
>  	spin_unlock_irqrestore(&np->lock, flags);
>  
> -	kfree(nc);
> +	/* Netlink walkers may still hold the channel or its filter
> +	 * arrays; the arrays are only reachable through @nc and share
> +	 * its grace period.
> +	 */
> +	call_rcu(&nc->rcu, ncsi_channel_release);
>  }

[Severity: High]

Only the channel free is deferred here. The package and the
ncsi_dev_priv on the same teardown path look like they are still freed
right after list_del_rcu(), with no grace period:

net/ncsi/ncsi-manage.c:ncsi_remove_package() {
    ...
	spin_lock_irqsave(&ndp->lock, flags);
	list_del_rcu(&np->node);
	ndp->package_num--;
	spin_unlock_irqrestore(&ndp->lock, flags);

	kfree(np);
}

net/ncsi/ncsi-manage.c:ncsi_unregister_dev() {
    ...
	dev_remove_pack(&ndp->ptype);

	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
		ncsi_remove_package(np);

	spin_lock_irqsave(&ncsi_dev_lock, flags);
	list_del_rcu(&ndp->node);
	spin_unlock_irqrestore(&ncsi_dev_lock, flags);

	disable_work_sync(&ndp->work);

	kfree(ndp);
}

The synchronize_net() in dev_remove_pack() runs before any package or
the ndp is unlinked. disable_work_sync() does not wait for RCU readers.

The new rcu_read_lock() sections still walk and dereference these
objects:

  - ncsi_pkg_info_nl() and ncsi_pkg_info_all_nl() call
    ncsi_write_package_info(). It reads ndp->package_num and
    ndp->package_whitelist, and walks NCSI_FOR_EACH_PACKAGE() through
    np->id, np->node.next and np->channels.

  - ncsi_write_channel_info() reads nc->package->preferred_channel. The
    channel now survives the grace period, but its parent package does
    not.

  - ncsi_set_channel_mask_nl() and ncsi_set_interface_nl() take
    package->lock and write package fields.

  - ncsi_set_package_mask_nl() and ncsi_clear_interface_nl() take
    ndp->lock.

  - ncsi_send_cmd_nl()->ncsi_xmit_cmd()->ncsi_alloc_request() takes
    ndp->lock and writes ndp->requests[].

ndp_from_ifindex() returns ndp without taking any reference on it.
ftgmac100_remove() also calls ncsi_unregister_dev() before
unregister_netdev():

	if (priv->ndev)
		ncsi_unregister_dev(priv->ndev);
	unregister_netdev(netdev);

So dev_get_by_index() keeps succeeding, and ncsi_find_dev() keeps
returning ndp for the whole teardown.

NCSI_CMD_PKG_INFO has no GENL_ADMIN_PERM. Can the unprivileged
PKG_INFO vs rmmod race from the commit message still hit a
slab-use-after-free, only now on the ncsi_package or ncsi_dev_priv
object instead of the kmalloc-1k channel?

If so, these two claims would not hold for np and ndp:

  - the comment added in ncsi_pkg_info_nl(): "the walker is protected
    by that grace period"
  - the commit message: "All seven genl handlers now resolve the device
    and walk the lists inside an RCU read-side critical section, so the
    grace period of that callback protects them"

Should np also be freed through kfree_rcu() or call_rcu()? And should a
grace period (synchronize_rcu() or kfree_rcu()) come before
kfree(ndp)?

[Severity: High]

This isn't a bug introduced by this patch, but ncsi_unregister_dev()
removes all packages and channels before it calls
disable_work_sync(&ndp->work). That means ncsi_dev_work can still run
during this teardown.

Can that leave an armed monitor timer inside a channel that
ncsi_channel_release() then frees? Here is the sequence:

rmmod
ncsi_unregister_dev()
  ncsi_remove_package()
    ncsi_remove_channel()
      ncsi_stop_channel_monitor(nc)
      ...
      call_rcu(&nc->rcu, ncsi_channel_release)

ncsi_dev_work, running at the same time with nc == ndp->active_channel
ncsi_configure_channel()
  ncsi_start_channel_monitor(nc)
    mod_timer(&nc->monitor.timer, jiffies + HZ)

Nothing cancels the timer again before nc is freed. So
ncsi_channel_monitor() could run on freed memory.

The work also uses ndp->active_package and ndp->active_channel outside
any RCU read-side section. Neither ncsi_remove_channel() nor
ncsi_remove_package() clears them, and neither clears hot_channel or
package->preferred_channel.

Could the work then dereference a package that ncsi_remove_package()
already kfree'd, or a channel whose RCU callback has already run?

The work can be pending or running when ncsi_unregister_dev() starts.
It can also be queued during teardown through
ncsi_request_timeout()->ncsi_free_request()->schedule_work(). And
ftgmac100 calls ncsi_unregister_dev() while the netdev is still up.

Would calling disable_work_sync() before tearing down the packages and
channels close this window?

> diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
> index 8cc538358f6a3..3310a9ca2de9b 100644
> --- a/net/ncsi/ncsi-netlink.c
> +++ b/net/ncsi/ncsi-netlink.c

[ ... ]

> @@ -462,23 +501,31 @@ static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
>  	nca.info = info;
>  	nca.payload = ntohs(hdr->length);
>  	if (nca.payload > len - sizeof(*hdr)) {
> +		rcu_read_unlock();
>  		ret = -EINVAL;
>  		goto out_netlink;
>  	}
>  	nca.data = data + sizeof(*hdr);
>  
> +	/* ncsi_xmit_cmd() is safe to run under the RCU read-side
> +	 * critical section: it only uses GFP_ATOMIC command skbs,
> +	 * spinlocks and dev_queue_xmit().
> +	 */
>  	ret = ncsi_xmit_cmd(&nca);
> +	rcu_read_unlock();

[Severity: High]

This isn't a bug introduced by this patch, but is the request timer
that ncsi_xmit_cmd() arms ever cancelled when the device is
unregistered?

net/ncsi/ncsi-cmd.c:ncsi_xmit_cmd() {
    ...
	nr->enabled = true;
	mod_timer(&nr->timer, jiffies + 1 * HZ);
    ...
}

The only timer_delete_sync() for request timers is in
ncsi_free_request(). That runs only when a response arrives or the
timer fires.

ncsi_unregister_dev() calls dev_remove_pack() first, so no more
responses get processed. It then frees the packages, calls
disable_work_sync() and does kfree(ndp). ndp embeds requests[256] and
their timer_list objects.

If a request is still in flight at that point, could
ncsi_request_timeout() fire up to a second later on freed memory? It
would read nr->ndp and take ndp->lock. For event-driven requests,
ncsi_free_request() would also call schedule_work(&ndp->work). The
pending timer_list would stay linked into the timer wheel from inside
the freed object.

This seems likely during probe, where commands to absent packages
always wait out the one second timeout, so the insmod/rmmod cycling in
the commit message would hit it. An outstanding monitor request, or a
NCSI_CMD_SEND_CMD request sent from this path, can trigger it too.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121065625.27934-1-18983559317%40163.com
