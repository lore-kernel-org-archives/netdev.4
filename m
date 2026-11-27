Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798295;
	b=Mc+seGvyvJaOZjjT6Hyt82Oi/4j1cPz6bWvWszPBW2mNiX5czqxjAWfUIwqbpNITryjj
	 W+nCE+TnrLxBa8HgR5qY6yaF9JkySi4lxNcCmR7YeXdR79ZbWcI3WZssJ7pFIc4Ap6ajR
	 VfjAKnANy26gq7LPYTW/D+fsu/KRHQKD77RAHjLiCLYEbhzTTabGZF1l+OGKeNNmZaymH
	 wh4+M+pzLfCwSaZjGws268J91PL24gXD0HcJ5Ok+DnmbRpwC4dNAKVf0xrhTWsXW4RpoC
	 28Ob1g+tRrTztLeXMxb1pmXt6oxvwtHiRAHQevFw3jriiA/pFD7sXfco/MgPwJPrpvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798295;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=dQSR59RiW0IbkNtXBm69k9/kOvof6x0Vm6WyyZtX8xU=;
	b=WwrYTgRBsNYl7mvSOORUc3RHLO2ywwl/ID/q6zELEHH8OXM1tp7evBDXnyENPzZjkKxK
	 JOwg6uD2GBeItSagBY+UCnQ6soT+Kmfad9aSb5khaUUOQ0ccwmMQLw40XgkUjvq6pPpqE
	 IErDOV229Wnsoy0ah3j4PmfN1BPLQrfcQSDZ0U+MGDPWXEGdx6GHJ4TsGjlS7Yj06FaWK
	 Q1e2XwfV4JiRCPn2MaqQQ7fJWXQFPz465iOFeSLjX1MGIU2+vRsdYNjP0IHMv4Hx9tNoj
	 TE+uRVP/MGs5yj8RLnuhQLkgylLkWEVPFisi2uGMJGUa7GadnE+3BLfkyS7U9ric2KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qD9uDFxM;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611A606A31C;
	Fri, 27 Nov 2026 16:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1611A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qD9uDFxM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 08E844E417C7;
	Fri, 27 Nov 2026 16:51:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C01C66049C;
	Fri, 27 Nov 2026 16:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13ACF102F013F;
	Fri, 27 Nov 2026 17:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795798290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dQSR59RiW0IbkNtXBm69k9/kOvof6x0Vm6WyyZtX8xU=;
	b=qD9uDFxMmT/3UwZss6BngA2505nHpfyDQFtRUDcN9b6w69+GYiKTntpfeWpT8THJb2LLX8
	58b8pTOIFU7R75i5v8qSWKoUQObC9XzLVEq0cXEWKBmxmrKOnDyhgY2H4BlgeMTSZEb3fV
	BMdbAzLrNA83CvcCKlG+Aqpo9U6RTaKeAdTrDDVdOBtDOopOZVrB0FMxIb0ed434vJLSqM
	K28JplMzCQFA4GX6JXy6Vx4c5j7sC1L6QUvybtGFnvwP/Eo/59RahA6cRfTC3s0WI29snB
	QvhB5CgCiKaXmYW5tA/2vZMpU6qaL7JcAIK1ef7SKM7XdKegZ8CZCvLgKyZR8Q==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 17:51:19 +0100
Message-Id: <DN65D0SH90VI.2OD8UAD9HSLHI@bootlin.com>
Subject: Re: [PATCH net-next v8 1/3] net: macb: cache ENST config across
 link down/up
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>, <vineeth.karumanchi@amd.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124-macb-set-channels-v8-1-770cf8e50e6d@bootlin.com>
 <179571152363.3135.15940503307792785015@kernel.org>
In-Reply-To: <179571152363.3135.15940503307792785015@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Thu Nov 26, 2026 at 5:45 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In macb_mac_link_up()
>   (drivers/net/ethernet/cadence/macb_main.c), when the link comes back=E2=
=80=A6
>
> --
>
> net: macb: cache ENST config across link down/up
>
> The macb driver now keeps the ENST (taprio offload) config in bp->enst
> and writes it again on every link-up. If the link speed has changed, the
> cached config is dropped with a warning. The commit also caches the link
> speed in bp->speed_mbps, serialises the taprio paths with
> bp->mac_cfg_lock, and removes the pm_runtime_suspended() check.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 9f6111661b40d..1e06666921160 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>
> [ ... ]
>
>> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_confi=
g *config,
>> =20
>>  	spin_unlock_irqrestore(&bp->lock, flags);
>> =20
>> +	if (bp->enst.speed_mbps && speed !=3D bp->enst.speed_mbps) {
>> +		netdev_warn(bp->netdev,
>> +			    "TAPRIO dropped because link speed changed\n");
>> +
>> +		memset(&bp->enst, 0, sizeof(bp->enst));
>> +	}
>> +
>> +	macb_apply_enst_config(bp);
>> +
>
> [Severity: Medium]
> After the link comes back at a different speed, the cache is zeroed.
> macb_apply_enst_config() then sets the disable bits for every queue and
> writes 0 to the per-queue timing registers. ENST_CONTROL is not enabled
> again, because of this check:
>
> 	if (bp->enst.queue_mask)
> 		gem_writel(bp, ENST_CONTROL, bp->enst.queue_mask);
>
> From then on the MAC applies no gate control at all. Only a netdev_warn()
> reports this.
>
> Does the taprio qdisc still report a fully offloaded schedule in this
> state? netdev->num_tc and tc_to_txq are left as they were, since only
> macb_taprio_destroy() calls netdev_reset_tc(). In offload mode the taprio
> core does not call ndo_setup_tc again on link changes, so nothing
> reprograms the hardware.
>
> Can the schedule ever come back without the user reinstalling the qdisc?
> struct macb_enst stores only on/off times already converted to bytes for
> one speed:
>
> 	config.queues[queue_id].on_time_bytes =3D
> 		enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
> 	config.queues[queue_id].off_time_bytes =3D
> 		enst_ns_to_hw_units(off, bp->speed_mbps);
>
> macb_taprio_setup_replace() discards the nanosecond intervals from
> tc_taprio_qopt_offload. Because of that, macb_mac_link_up() cannot
> recompute or re-check the schedule for the new speed. It also cannot
> restore it if the link later comes back at the original speed, for
> example after a temporary PHY downshift or a cable swap.
>
> Would it work to keep the ns intervals in bp->enst, then re-validate and
> recompute the byte values on each link-up? The schedule would then
> survive whenever it still fits the new speed.

This has been discussed; read the thread under [PATCH net-next v7 1/3].
https://lore.kernel.org/lkml/20261118-macb-set-channels-v7-1-2dbc00f686af@b=
ootlin.com/#r

Conclusion is:

 - If the link speed changes, then an ENST schedule makes little sense
   and userspace should give us a new one. The idea is that a schedule
   is scaled based on the workload to know what is emittable in each
   timeslot. Once you change the link speed, all timeslots now can
   contain more/less the previous amount.

 - Also, ENST is about Time Sensitive Networks. The link down caused by
   the link speed change is already massive trouble for such usecases.

 - It'd be nice if we could drop the qdisc from driver code.

 - I do not want to store =C2=B5s in the cached state and compute register
   values from the current link speed. This is more code and many risks
   of bugs (rounding is critical to avoid ENST timeslot overlaps and
   such).

However, I would be okay to keep the existing schedule around even if
the current link speed isn't matching. It would allow:

 - 1G link =3D> userspace assigns ENST schedule
 - 100M degraded link =3D> delete ENST schedule and warn
 - 1G link =3D> our cached schedule is valid, reapply it

I will respin for this and for a low prio finding on patch 2;
the one about locking bp->mac_cfg_lock to read bp->enst in
macb_set_channels().

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

