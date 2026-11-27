Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766342;
	b=nijRRovqefKYFycCtwNiayqmEwm0zoE0YLwBPSto72lcxMvvREdku1QZLx3Ktg02bK9E
	 xmwSHLgMo8yBMDOAQlQ2WQO8x3YotFWHXWzXVjfbsI6g1QJfaDCOHESEQBURXRr2JhGUe
	 W77GHkaMTg5D3FBy370fBLHoyDfjuLN4zAGCeC1PekyHjHQ2/iluWpTSw7pLajfnnsaPE
	 qu5XnkU9wZ7LabTzEYT+BvIMh8OwwzUpzxPFvscmhAEqxKnI6YEohdZf2gOrXogBq7d0I
	 zmlexPWSO6vHlDTuHEVuSdlgRZuOzccTsLZrjNxLf/G1nRv+09+NlzBG0AUzx+iEuPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766342;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CtZbt/tfzmKPSU31UDREqAdG4dDhUUMR0uBNSSV+qXM=;
	b=Pw49qCrEr6plk5YVxas5/IPbWOX6VJD8kPnxKbQztSQ/fLWabnfie6dRRKCODBGxQrWZ
	 hOsSnrKtGALRU8iLbMNruBNtp2QSqDZLd088hVL0IcqIWgEFkCXQcxbggQWTpASsXD0FI
	 tRNwmDPZVbeoR8muVoRt3RbHmVQV41wG1ziSV+lLdpW5ttbhg5PFRXn+INhbjZ1KjncUE
	 jPmJQyYRUYKrGIn2d5mSza0DJsrecfs4/ssX60RlcsB4hbJXoUf/nfgkUL5FucYpLgVqh
	 V0/aak8U1y4Sr0Btinkyzu6yfWMGjLByiJX/SdSDOOgx/NEp4SCf15LFbCXe4F8TMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y8rrQ9xK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BxBxEV8B;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82D606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE82D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y8rrQ9xK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BxBxEV8B
Date: Fri, 27 Nov 2026 08:58:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795766339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZbt/tfzmKPSU31UDREqAdG4dDhUUMR0uBNSSV+qXM=;
	b=Y8rrQ9xK581d9YAq/jwns7vg95VkGJ3NtDY5Y81C+wxReF3IfcmcIr6ZU1cpDgD9Y0AefC
	nmEkfHOWfUhhzQIlW+6Z+dijjdMkrez0fVdXrwC63OSxEvSBHQqmS+gap02N3lOhFmyTd8
	5fd2BueBFlfsIZ/gCw7iK7qafVjuH+1/sKsrHQEowpZlUcGwyV2Sm9SeGSx+u66PI6mmV/
	mCaR5crvfiuHmW9VpOa33ojRDD/4l4bikMLZpSfZbirmUdpMM2It6whtz8vZFqPZi8QvcS
	1xNRZm+Ga9FPsZF7ipSnl8C57cbcOKkBjiX4iils81MqXeFGzp9+s3YNHjpI6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795766339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZbt/tfzmKPSU31UDREqAdG4dDhUUMR0uBNSSV+qXM=;
	b=BxBxEV8Bq8dCocbfjRF4w9qpV/zJzojxYtGQpL5gix+c/qBckao5ny5NlmlMrpyul2Wgd4
	Obj1373Xjf9eu8Aw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v12 5/8] hsr: Use the port and header
 information in hsr_forward_skb()
Message-ID: <20261127075858.Kc5KdXY7@linutronix.de>
References: <20261125-hsr_ptp-v12-5-9ddd2a73cb90@linutronix.de>
 <179570403859.3135.16584243126137502674@kernel.org>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179570403859.3135.16584243126137502674@kernel.org>

On 2026-11-26 14:40:38 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
=E2=80=A6
> - [Medium] The commit message says the new behaviour "is only used in the
>   pure software version" and that NETIF_F_HW_* offload hardware "need[s]=
=E2=80=A6
> - [Low] The patch makes hsr_fill_frame_info() check
>   frame->has_hsr_header: it sets skb_std =3D skb, skips=E2=80=A6
>=20
=E2=80=A6
> [Severity: Medium]
>=20
> The commit message says:
>=20
>   This is only used in the pure software version. Hardware with any kind
>   of NETIF_F_HW_* offload support need to be addressed separately.
>=20
> Is this limit enforced anywhere? hsr_dev_xmit() accepts the ETH_P_1588
> inline header without checking hsr->fwd_offloaded or the slave features:
>=20
=E2=80=A6
> The new req_tx_port filter and the has_hsr_header clone shortcut above
> then apply to every slave. That includes slaves that advertise
> NETIF_F_HW_HSR_DUP or NETIF_F_HW_HSR_TAG_INS.
>=20
> For example, TI ICSSG in HSR offload mode does this in
=E2=80=A6
> Should the inline header be rejected when the slaves have HSR offload
> features (ksz9477 and xrs700x are similar)? Or should the commit message
> drop the claim that this is software only?

Yes, this was brought up earlier. Hardware supported offloading features
will be look into once the software part is done.
It wasn't working before this series so it is not a regression.

Sebastian
