Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172787;
	b=AXntPbJABkzvNGU+Tv7OA42QfnluQ4TIL58AS5xyRNCWPh2cUYhXUDUKXVG18/X0Qy/J
	 P4sK52lJLZmsfLpMPDS5UD8sX0P/AusjqklOvcngl96yQPBNTcNQ4s1g7Wm+C2tc1rpGx
	 O4y40YZKhRMQlebhe0OxS1a7n+nVNDNTdMtayJWN/jWPJvEqQLuV13dIZxLsDJNwtdFtz
	 uwKIV0ZwSWITesrAnl2+m/hDFV5CON//pj1PpVMaHvv0EUZfbKyKijqtwA9t+Ra1n3Kfi
	 tsa+FT0+yjpBYAGauvN8kM7gaRAOK2l5jOG1SGY6eNT8ER40hLsztmOyvGCweAoSEAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172787;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YYyqqP9Mt+ougXq/u35v5Dw9NG+MQo8EAqZGdlm0Rf8=;
	b=gSr/bDQkg75m6TivUF9qvDfynuN1DxH+4X6wpjVJ4GVPc9dj7tw09nTZ7jyjYodyfKUP
	 yKOZe3fuIDZILw3J7CZ7iuoe2jwS3VsxyoKOHb2HiQxaWvqyoeTitCXEdHMQQy555yVq0
	 kDgCJSUpZcNHvh1y7eCWWeBUxOimyoqceo+PSvIP6kb20ndENc/DJJhqFAA80tN2cMTNM
	 e4AzgaUQl0fQKy8I44nM0r0qykFvKQu9mOMvF1nk9dZ7z/TMJtj5dHpAJYxAH7Yr/xaoi
	 VYpsB+hOGlIQF84FVDSOqLTNXnZXbd/4HCJ7lCeUx4R6s0/1qs6q1t0TwQe05IWSAGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JL/4KeD4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64381606A326;
	Fri, 20 Nov 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JL/4KeD4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3501F000CA;
	Fri, 20 Nov 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795172786;
	bh=YYyqqP9Mt+ougXq/u35v5Dw9NG+MQo8EAqZGdlm0Rf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JL/4KeD4WWm/2Nsak1zGkpqHRgpRQbuvJik+YWthQfGT+QyyIEXm3iAtfJCELrlPD
	 dOaRli640Dwi+kq89s7B710onJaS4CWrb+xOpbet4AsZtiak4jfIJCfhVsuZVORKg3
	 lXo9B+mJcVGeHiCO8rbJwqUpavNTxN9nwEPKxBp1WTI50AKU03wmMyht7AxmkIogmJ
	 l/pNRdMQi565+vFyTlJaT5Zp15JI90y3hb7T+m9iiG+Ks9Po4ya4KJPoFWSUjDXi/M
	 WBlu4UwxX0nHN1u0pSiQ07+E6WHJ/ZZcgHuavnrCy/pQkHWb2ELa+DiqBZbsGrfp92
	 gag/thiP2aSOA==
Date: Fri, 20 Nov 2026 11:06:21 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: liguangshuo@mail.sdu.edu.cn, sgoutham@marvell.com, gakula@marvell.com,
	rkannoth@marvell.com, sbhatta@marvell.com, bbhushan2@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] octeontx2-pf: Fix potential use-after-free in
 representor teardown
Message-ID: <20261120110621.GB860048@horms.kernel.org>
References: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
 <179501121429.3136.3547762606402557223@kernel.org>
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
In-Reply-To: <179501121429.3136.3547762606402557223@kernel.org>

On Wed, Nov 18, 2026 at 02:13:34PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 1 (1) · High: 0 (2) · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Critical] The patch is titled "Fix potential use-after-free in
>   representor teardown", but rvu_rep_destroy() still frees rep_dev while…
> 
> Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but
>   rvu_rep_setup_tc_cb() copies per-representor pointers into the long-…
> - [High] This problem wasn't introduced by this patch, but the flow_cfg
>   setup used by representor TC offload has broken locking and error…
> - [High] This problem wasn't introduced by this patch, but
>   rvu_rep_state_evt_handler() runs from the AF->PF up-mbox work on…
> 
> --
> 
> octeontx2-pf: Fix potential use-after-free in representor teardown
> 
> This patch reorders rvu_rep_destroy() so that rep->flow_cfg is freed
> before free_netdev() releases the netdev allocation that holds the
> representor private data.
> 
> > diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> > index 0f5d5642d3f7a..662da7fc39536 100644
> > --- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> > +++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> > @@ -638,8 +638,8 @@ void rvu_rep_destroy(struct otx2_nic *priv)
> >  		rep = priv->reps[rep_id];
> >  		unregister_netdev(rep->netdev);
> >  		rvu_rep_devlink_port_unregister(rep);
> > -		free_netdev(rep->netdev);
> >  		kfree(rep->flow_cfg);
> > +		free_netdev(rep->netdev);
> 
> [Severity: Critical]
> Can rep->stats_wrk still be pending when free_netdev() releases the
> rep_dev here?
> 
> The rep_dev lives in the netdev private area. Nothing in rep.c ever
> cancels stats_wrk. rvu_rep_get_stats64() re-arms it on every stats read:
> 
> drivers/net/ethernet/marvell/octeontx2/nic/rep.c:rvu_rep_get_stats64() {
>     ...
> 	schedule_delayed_work(&rep->stats_wrk, msecs_to_jiffies(100));
> }
> 
> The unregister_netdev() call just above seems to arm it too:
> 
> unregister_netdev()
>   unregister_netdevice_many_notify()
>     rtmsg_ifinfo_build_skb(RTM_DELLINK, ...)
>       dev_get_stats()
>         rvu_rep_get_stats64()
>           schedule_delayed_work(&rep->stats_wrk, ...)
> 
> When the timer fires about 100ms later, rvu_rep_get_stats() would run on
> the freed allocation:
> 
> 	rep = container_of(del_work, struct rep_dev, stats_wrk);
> 	priv = rep->mdev;
> 
> 	mutex_lock(&priv->mbox.lock);
> 	...
> 	stats = &rep->stats;
> 	stats->rx_bytes = rsp->rx.octs;
> 
> It reads rep->mdev from freed memory, takes a mutex through that pointer,
> and writes into rep->stats. The timer embedded in the delayed_work also
> stays linked in the timer wheel after the free.
> 
> This can happen on devlink eswitch mode set to legacy, PCI remove, or
> module unload, for any representor that has RVU_REP_VF_INITIALIZED set.
> After a module unload, the handler could also run after the module text
> is gone.
> 
> The error unwind in rvu_rep_create() has the same pattern:
> 
> 	while (--rep_id >= 0) {
> 		rep = priv->reps[rep_id];
> 		unregister_netdev(rep->netdev);
> 		rvu_rep_devlink_port_unregister(rep);
> 		free_netdev(rep->netdev);
> 	}
> 
> This patch targets a use-after-free of the rep private data in this loop.
> Should it also add cancel_delayed_work_sync(&rep->stats_wrk) before
> free_netdev() in both teardown paths?

The above does seem to be a legitimate bug.
However, I believe it is also pre-existing and can be handled
separately to this patch.

Reviewed-by: Simon Horman <horms@kernel.org>

