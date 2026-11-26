Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653677;
	b=fr/hNsCFTrETTVI3nAEBwfz/oI23GeOoR7IVWrMxT138+xpzHB0gnWqMCdMW8au7Rd0d
	 Po0ULdK9+mCRPQBBd4SI0fCism0nKv7vP1YK98PtQQkTrbWPMOY8M8/lwuOr7CfmfTazn
	 Zw/d+aFKJbwdI6/ZSLml0xE7LVLS9ltHet+v3njtcrrz7kUItJ6fltPvGoDWLhlfKkA1H
	 li9GEVzq6U+EUgxdW/orOqzBhj/lPwBJcVvimkK4lxmkDQ3crlIFNd4CXpC7CIcXRI6Ln
	 +VSog/7NdAB8NnavgzzvnhP3bhyGXIpVOrfYXbEtNCnRGAY7MiB1KOLx+ZPdRMYl88A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
	b=kHIKUdN9/QmK/AsZVhdIBPE0ShdYHueKGLWETYLCbKJJY1Vft18zvtLzMCvV56jsm8wV
	 F5QH27PFhzwzYL5qZhjai9akZY0c1761y1eUKOiITtO6F/LXsldUTu2z1C1CxdxszShpP
	 abPW7fOWf6o3Bjg547IaSQ5eEonX9JtWGiAGE0bCY1yOO6FsNHRj+kZvXQYExzspdGS2S
	 hrvpkE4iM4Sw8XOOc4yx9/oJsBkAod5CgEacDeIS/Rboxb4rHK2yU4hj0QrpScxIn13qU
	 X+nK7svK+k/agEAzJ0nSert06xZxbJZziXOOprY1+ncRtKTcWiBWyH9OfOiETDfb5pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tbywnl0N;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF6606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AEF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tbywnl0N
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3458209a91.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795653677; x=1796258477; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
        b=tbywnl0Nq7DCkKcThKGhp1H8EQrxuHIPkWozGFLuyrP/hH6qJmLEJoiyFWAuREc/ah
         T7RF3bsaggfirGoC9bg8pCBbUZgFWbGeK+tHu5Ben8s9PKKf1tBs4PtUXo6dQ+FMHork
         hZ3NYF6UqZk2FiGHo5SPpJ1rK06sjVsfWPYHybiasArX+7Wcdv5bnuGzoDdlcLqnJiet
         pEo6H3cxtElGJzKiWZ1APRw3rU61wGP4O1SVHURed0PCwpl5RsLrOXLCu8BsEGkeXSJf
         lGPd8eidVsNztwmwEt1CFvID9JzLw0DnDivi6lrNnp4sfAAlmRSnfuE8W7KZAMJUWfdK
         wfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653677; x=1796258477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
        b=gIup7CKDk2pE3G0hfpGf8y0reMe01apjhbrCUSEvkRZ3rXeX5MvelwqdRVfxkE6kFw
         bhiQo2M+hqUURueFVgY4b/3W230gkj7zEPbosMoptnsa89VJOFg0t9WaZXTWNxu0MTLP
         xrgoWXVLeon9Xbo8PaUTxXNrRAMI8EkMJs7uNxSWAEYIDCv3GiejU7PMlBBObMiQptUk
         uaO+/t5AnqDdd/NUH5tX2fNaBhMz605wgmgscuWcUKGbLw0OFKyNq76aWSGWh6ku/jyj
         9aXDJLRsYZhAob5x+7M141pqpzc64SRhPSYJzusyN90fjLdSmcOP6pQr8vgnxAqNplIi
         pczA==
X-Forwarded-Encrypted: i=1; AL+hErE1HbE2N3dsoaCTYJ53CBGtqc+4pW6s7VYoEPt6BnCR02OzlrNiSjWGBeQ11cdEFikHxYe+TGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oP+5QaorsLb2iFuRS7WgSbWnaKJ0zOX/2h00i6L7DijbTt1Jv
	DynslNeLOT/hvK+oPiy7p04PBatGKvCErwqpYov6PRtnemNrSLB5hUTvdItdy4YvH2M=
X-Gm-Gg: AZFdTZe08Gthmjp9AmH2BhPLbxy5ORPwAVt3wiWBrQQVOIoq1JJ02ZNUwQozIk24O5U
	+/u/NNLoQKc5mUNU4gGy5bgQdNKUno0vx3H/2Mk/4hnKPekm3gvwaPALkLZVN8jVdPY8nmpaYq4
	qBU1KUlIkB5PwkncRx8jgZaAhgGG+9AxbL0JSaFEnfBxg/Br6C8N4wKSe4C0OvrvEcoTYCqP0d+
	flZD1JgSuNqecOqFIoTQfBnObb0a9Zip3TQmLdNLFgFZpTRZsBCKJKlqRGNpt+Cvd6S0kql6JXU
	dtPJJIIU85bhsTu0vemjJNWDTX8Mj1innVL539ZZa804Zu/SYWdJlwQuj7JEEVd0Ji6jx0bdgyj
	BT9F6goJnUEtXIpyKxwW2lNHt/J6jchh4OqCLfDfInQlWYDXdftL1jaaGXZnUhH+Bw1KnXmAghg
	Lpzh2rY/Aqnarazi5ZADB1NhVx6vBXiS9JfnSsV55RvEInv2PguvuVwz9L4Pjqp+JulXD0LmL/w
	V8bvIanWM7l935a8+WQ8hokQ7+zX5BKBNte7xvDSnaQgAWHLRmvak2+SBreqGeJn2+yRwLhZaIX
	4um7Dx0K9WbjoXVFRIs0pfhHkUptAwNE9g9/dZLhIsQ=
X-Received: by 2002:a17:90b:5109:b0:3b4:1621:ba5d with SMTP id 98e67ed59e1d1-3b41c95afa2mr19198117a91.38.1795653675091;
        Wed, 25 Nov 2026 16:41:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm28823022a91.7.2026.11.25.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:41:14 -0800 (PST)
Date: Wed, 25 Nov 2026 16:41:13 -0800
From: Joe Damato <joe@dama.to>
To: willemb@google.com
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, prashant@broadcom.com,
	edumazet@google.com, horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
Message-ID: <aweAKQ6cUk6df/L6@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, willemb@google.com,
	netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, prashant@broadcom.com,
	edumazet@google.com, horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-6-joe@dama.to>
 <179545866419.3135.14423996277439097165@kernel.org>
 <awTJWtBSMubj4qQ9@devvm20253.cco0.facebook.com>
 <willemb.1401f0f6ad765@google.com>
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
In-Reply-To: <willemb.1401f0f6ad765@google.com>

On Wed, Nov 25, 2026 at 07:21:31PM -0500, willemb@google.com wrote:
> Joe Damato wrote:
> > On Mon, Nov 23, 2026 at 06:31:04PM +0000, netdev-bot+sashiko@kernel.org
> > wrote:
> > > Thank you for your contribution! Sashiko AI review found 6 potential
> > > issue(s) to consider.
> > >
> > > Critical: 0 · High: 3 · Medium: 3 · Low: 0
> > >
> > > If you believe none of the issues are legitimate, please reply to each
> > > issue of Medium severity or higher and explain why the AI is wrong.
> > > If any of them are legitimate and you plan to respin, please let
> > patchwork
> > > know by including "pw-bot: cr" as a separate line at the end of your
> > reply
> > > (one such reply per series is enough).
> > >
> > > - [High] Possible deadlock.
> > > - [High] bnxt_reset() decides to call bnxt_ulp_start() only from !silent
> > >   && !BNXT_STATE_DMA_STOPPED, after dropping its locks.
> > > - [High] Incomplete fix.
> > > - [Medium] bnxt_reset_task() discards the return value of
> > >   bnxt_open_nic(), and bnxt_reset() calls bnxt_ulp_start() whenever…
> > > - [Medium] The new DMA_STOPPED check exists only at the bnxt_reset()
> > call
> > >   site.
> > > - [Medium] Every non-silent reset now unregisters and re-registers the
> > >   RoCE IB device, including the common case where DMA is never stopped,…
> > >
> > > --
> > >
> > > bnxt_en: stop the ULP around the reset task
> > >
> > > For non-silent resets, bnxt_reset() now calls bnxt_ulp_stop() before it
> > > takes rtnl and the netdev lock. Afterwards it calls bnxt_ulp_start()
> > unless
> > > BNXT_STATE_DMA_STOPPED was set. The goal is to keep the RDMA driver
> > off the
> > > device once the reset task has stopped DMA.
> > >
> > > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > index 9daf053293a42..2abb721d87de8 100644
> > > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > @@ -14710,10 +14710,14 @@ static void bnxt_tph_update(struct bnxt *bp)
> > > >  /* Only called from bnxt_sp_task() */
> > > >  static void bnxt_reset(struct bnxt *bp, bool silent)
> > > >  {
> > > > +	if (!silent)
> > > > +		bnxt_ulp_stop(bp);
> > > >  	bnxt_rtnl_lock_sp(bp);
> > >
> > > [Severity: High]
> > > Can this deadlock against bnxt_close()?
> > >
> > > bnxt_sp_task() sets BNXT_STATE_IN_SP_TASK before it calls bnxt_reset().
> > > bnxt_rtnl_lock_sp() clears that bit only after bnxt_ulp_stop() has
> > > returned, and bnxt_rtnl_unlock_sp() sets it again before
> > bnxt_ulp_start()
> > > runs. So both new ULP calls run with IN_SP_TASK set.
> > >
> > > Both ULP callbacks take rtnl_lock():
> > >
> > > bnxt_ulp_stop()
> > >   bnxt_re_suspend()
> > >     bnxt_re_update_en_info_rdev()
> > >       rtnl_lock()
> > >
> > > bnxt_ulp_start()
> > >   bnxt_re_resume()
> > >     bnxt_re_add_device()
> > >       bnxt_re_update_en_info_rdev()
> > >         rtnl_lock()
> > >
> > bnxt_re_ib_init()->ib_register_device()->...->enum_all_gids_of_dev_cb()
> > >         rtnl_lock()
> > >
> > > ndo_stop, meanwhile, holds rtnl and the netdev instance lock and waits
> > for
> > > IN_SP_TASK to clear, with no timeout:
> > >
> > > __bnxt_close_nic() {
> > > 	clear_bit(BNXT_STATE_OPEN, &bp->state);
> > > 	smp_mb__after_atomic();
> > > 	while (bnxt_drv_busy(bp))
> > > 		msleep(20);
> > > 	...
> > > }
> > >
> > > Suppose "ip link set dev X down" runs just after a TX timeout has
> > scheduled
> > > BNXT_RESET_TASK_SP_EVENT. sp_task can block on rtnl inside
> > bnxt_ulp_stop()
> > > (or bnxt_ulp_start()), while bnxt_close() spins on bnxt_drv_busy()
> > holding
> > > rtnl. The comment above bnxt_lock_sp() warns about this exact case.
> > >
> > > Before this patch, only the rare RESTART_ULP and firmware reset events
> > > called into the ULP with IN_SP_TASK set. The frequent reset path did
> > not.
> > >
> > > Should the ULP calls happen only while IN_SP_TASK is clear?
> 
> > Yea, I think this is real.
> 
> > Not sure if Michael or the other Broadcom folks have a suggestion here?
> > Maybe
> > the minimal fix is to clear IN_SP_TASK before bnxt_ulp_stop() and call
> > bnxt_ulp_start() only after unlock.
> 
> > The RDMA teardown on every TX timeout and restart races below would
> > still need
> > answers, though.
> 
> Are this and your questions in the main thread a reason for a v7?

I don't understand your question. The above is one of the questions in the
main thread.

I'm not sending a v7 until I get feedback from Broadcom.
