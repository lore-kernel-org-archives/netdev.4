Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448294;
	b=N9o+UKBZBeXvwEOkhUGtdIeJFqvoWcaya/u6WMqbbq7XR8HZvWxYDh/QIBwU13ctOjzF
	 +EdCnejXgx/s9922AY+AWjhPUJJTeGuVmbnptBdmmqE51Ogl2z1JcUKabn1pSM19WvE4m
	 zT+fTmad/vDtIm1pT7RNKG3VUIGGoBcckAX49OlZUqsrvcaT3Jl5P7/V1mwfkkFW+EAhg
	 DUaEWD3YJgqrYb1tTKghIw930n+7iMERdDJxDwiYgGN+RUzi7ZYID42yyrwE65FuThQ3o
	 nysZLFN1rOTRPjidw7SyB85DROUPMUsNBVFEG5yKWfsUqvUUG1dVIeItDm6RGFLcVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448294;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=JXfTo/7yQyJEUlRLOhk+4+o3LBtZIqKsX620uWGEpps=;
	b=Q+7F2llX7olgn78A2fO/ZcrnS9h/sKsE18LcOZym7ws28SUoDta2P+xcrmGwuszor6L4
	 5HM4pE70gYiX7hjIF5Z7BVnS78inHGPoeXWM2CJHlKOckIKQyEIJNCc9F3WY8JhX9gEXq
	 ZPIHaqTr/c+tkI5Jy/XDbILmyIW52h8jHmuWE6YE7hAL+u2oU9xkg//DXI8GbilD9Djyi
	 SjlMNxEHQm8u1qJLNx3GEByBBAthSFodpobUcIogOUNlqfjJweX/mb1D/Icbvkchgu6K2
	 bUSAHMmjeuYIiZe5kROpAn6F9qIYh+WQaDmZC08vi9HtaQJI8C4Q2L+41f2nKnPA7Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mLztQAYt;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A517606A31F;
	Mon, 23 Nov 2026 15:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A517606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mLztQAYt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1245D1A179B;
	Mon, 23 Nov 2026 15:38:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5ACA601E1;
	Mon, 23 Nov 2026 15:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A2C311E69A3F;
	Mon, 23 Nov 2026 16:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795448286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JXfTo/7yQyJEUlRLOhk+4+o3LBtZIqKsX620uWGEpps=;
	b=mLztQAYtiPKDfCyWtI19DhYXxwewot2szyIvmLi8NBWmkaLU1okzRNuyd6cbppVHRkjoTT
	swYNBKVpcvcfI9u9iQvIwib9aBLMlZy/cdWa7YUzpRLAU/0A1tOebrdQJyJYzvLzDJgHZ6
	Q6ohhzEKCU2BogkgSKfcldthC3b4YJ3nvRAD9Fdp+HWCeepMSW2OgpCbXPkKMbChlOMyRT
	yRXxQOCxhGn8BIdJgTH7PCZGScwOK/7FEdqKbYlWFUgef1sgODzFM/1LQEDldbtj9pq62h
	dVHz60v732M24NafkUv4Fq3nyiRrC3rZKOYliWtu/aMp7pa2lq63y2Pwrzp4IA==
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
Date: Mon, 23 Nov 2026 16:37:56 +0100
Message-Id: <DN2PANJIGO0C.14LOQ76W0VAJS@bootlin.com>
Subject: Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across
 link down/up
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
 <179537769127.3135.3406600332849226108@kernel.org>
In-Reply-To: <179537769127.3135.3406600332849226108@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Sun Nov 22, 2026 at 9:01 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
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
>   (drivers/net/ethernet/cadence/macb_main.c:1051), if the link comes=E2=
=80=A6
> - [Low] The commit message describes a user-visible defect in the
>   existing TAPRIO offload, but the patch has no Fixes: tag.
>
> --
>
> net: macb: cache ENST config across link down/up
>
> This patch caches the TAPRIO/ENST schedule in bp->enst and writes it
> again from macb_mac_link_up(). If the link speed has changed, the cached
> schedule is dropped instead. It also caches the link speed in
> bp->speed_mbps, serialises taprio replace/destroy with bp->mac_cfg_lock,
> moves the per-queue config from kmalloc to the stack, and removes the
> pm_runtime_suspended() check.
>
>> This causes trouble if the config is not compatible with the new open
>> and link-up. The two issues that can occur are a link speed change (as
>> all timings are configured in a unit relative to the link speed) or a
>> change in the # of queues.
>
> [Severity: Low]
> Should this patch have a Fixes: tag?
>
> The behaviour described here goes back to commit 89934dbf169e ("net:
> macb: Add TAPRIO traffic scheduling support"). In that code, the ENST
> registers are written only from macb_taprio_setup_replace(), using the
> link speed at the time of the tc command. Nothing rewrites them on
> link-up.

[...]

Yes, I'll add a 'Fixes' trailer to reference the old commit but I'll
mark it as 'Cc: stable+noautosel'; this feels more like a feature
(capability to keep TAPRIO across close/open) and I don't think it is
useful to backport.

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
> What happens to the installed taprio qdisc when this branch is taken?
>
> If the link comes back up at a speed other than bp->enst.speed_mbps,
> the cache is zeroed. macb_apply_enst_config() then writes the disable
> bits for every queue into ENST_CONTROL and zeroes each queue's
> ENST_START_TIME, ENST_ON_TIME and ENST_OFF_TIME.
>
> The taprio layer is not told about this. The qdisc stays installed in
> full offload mode, so tc keeps reporting a hardware-enforced gate
> schedule that the MAC no longer applies.
>
> The schedule also does not come back if the link returns to its
> original speed. Take 1000 -> 100 -> 1000: after the first change,
> bp->enst.speed_mbps is 0, so this check is skipped and the zeroed cache
> is applied again. Gating stays off until the user reinstalls the qdisc.
>
> Nothing can recompute the schedule later, because struct macb_enst only
> stores byte units. macb_taprio_setup_replace() converts the nanosecond
> values and then throws them away:
>
>     config.queues[queue_id].on_time_bytes =3D
>         enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
>     config.queues[queue_id].off_time_bytes =3D
>         enst_ns_to_hw_units(off, bp->speed_mbps);
>
> Could entry->interval and off be cached in nanoseconds instead? Link-up
> could then recompute the byte values for the new speed with
> enst_ns_to_hw_units() and check them again against
> enst_max_hw_interval(). A lower speed only raises the hardware limit,
> so the schedule would only have to be dropped when it really no longer
> fits.
>
> The later patches in this series that add set_channels and the Tx SRAM
> segment distribution do not change this path.

So this whole paragraph is correct, see discussion thread with
Vineeth. [0] When sending the series, I wasn't sure about my approach.
More and more, I think it is the correct one.

 - We have no API to drop a qdisc from driver code.

 - An EnST schedule is, by definition, link speed sensitive. Userspace
   must have looked at the link speed to compute the first schedule. If
   link speed changes, userspace most probably wants another schedule.

 - EnST is one part of TSN; the whole point is stable links and
   deterministic usage of that link. If you get a link speed change,
   the ENST schedule being wrong is the last of your worries.

So I will *keep my approach*: on TAPRIO_CMD_REPLACE command, we compute
our schedule and attach it to a link speed. If we go down and back up
at the same link speed, we restore the cached schedule. If the link
speed changes, we warn and let userspace deal with it. Sadly we cannot
properly drop the qdisc; we can only log a warning.

This is any way much better than the current approach. Currently the
EnST registers are only written to on TAPRIO_CMD_{REPLACE,DESTROY}.
 - the EnST schedule can be lost if HW resets with close+open
 - the EnST schedule can be stale+invalid if the link speed changes
 - DESTROY cannot land while link down

[0]: https://lore.kernel.org/all/20261118-macb-set-channels-v7-1-2dbc00f686=
af@bootlin.com/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

