Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515619;
	b=rgaBQkFusNTUDfMoaAOP7v9fJTTXXLu9HLH8GHeNYOW1UuAQhjFsVJ33mzDPlDwJxqYz
	 Aa1IrIwkq1Ni9AacGKjzhsjHZh+XgFzm2Lyal4LTZaM2PKL13xHWkXgNEItSUSApFXTQ4
	 V6q37UHGRwqcEvDprgsNsCg380Wk/fFf58zIBj4cBiS2NGsddEbOrYlhL/t1Y0WuJ0G7C
	 vPS3dKkfyjKihk6QxqX4YV6tA6mJprT6cDL4baoxo45GTnpPwlzUt0Pol/5uexeWxkp90
	 5mjUPAuOyciq6fGF2uWB2E7YgB+mY6QCBuIEoG80cCfbcLx9x7k9jyeZXCOpIqVE/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515619;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=GsnROFcsYXomd+mYJ2qpR3czAnhWQbAw0bqGUw9Qmzg=;
	b=vJVxaKAsOFJ0VoItvFIO9kG0luGTzCR7Fy/5qSdAvblFesgV2e3lmGmABhOYtasx+xJe
	 baIUmMLz3PpWou87e1uC3UhDWFQSA5EgzvvvQsEicohIZJAkG4BXsSopwumSb81iE08zi
	 iRmYVX8BaHKlH6nYnR7eZ29t53/ir2BlIjzvplNKxL+2mkO9VycZywUkH02TnpbcKj4IW
	 vAHcdXFPx9ankYkkynTOuIkFp0FOYPsxD4WqGnBvEFYZpwT6tY55dPDxOdV5G7yiXNXhf
	 zI4X52MeGMwNgo+uOS/NrL0emfT4O0cCGkqTjARbs6dqnJT0tP5eQcI/Lnh9RZRxSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2bHQ0P7W;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029C606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E029C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2bHQ0P7W
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 063A74E41698;
	Tue, 24 Nov 2026 10:20:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B68A6601E1;
	Tue, 24 Nov 2026 10:20:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ECD411E6A5DB;
	Tue, 24 Nov 2026 11:20:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795515609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GsnROFcsYXomd+mYJ2qpR3czAnhWQbAw0bqGUw9Qmzg=;
	b=2bHQ0P7W/l8TeEHSYVfNyc61BbMDMmiECw2bz8pf3ROEwZVhsmOdXj1vt6oR6e6AjZQ/DU
	0OfKU6xtl9MuTk1MXuhOs4MuZppKuBlTAxdsI8nx+yReWa6SWjK23T+wA92RkFqFFXKcE+
	iGI874x9lmpNdRIeBkXfv80YCoAXTxWbebSf0DmyfpMEpTZRWtkW/z7ZgjlIa5tcdTBnSD
	2LBaflyeaLKBbCsBZ3QlKO/Y+0Hs3CIk0Wg7uBV0dko6BZs5/j3g7D4kLXRCcckjppNl5B
	fLycFdOb5674zhQ8fql3DWm94n0COu75XWh8UBb+jXh9WceQhcjKrSe/yKQ5kQ==
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
Date: Tue, 24 Nov 2026 11:20:04 +0100
Message-Id: <DN3D5TEGSJJK.2RDM2BPVIQF1B@bootlin.com>
Subject: Re: [PATCH net] net: macb: don't disable an IRQ wake that was never
 enabled
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Sergio Prado"
 <sergio.prado@e-labworks.com>, <netdev@vger.kernel.org>, "Dom Cobley"
 <popcornmix@gmail.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-nb-macb-irq-wake-net-v1-1-ccdd60a9a1bc@tipi-net.de>
 <DN2R8R6SGV27.DU4IEVFTHBC0@bootlin.com>
 <36b47d8ba8e6c52ac3ccdeea0f057e06@tipi-net.de>
In-Reply-To: <36b47d8ba8e6c52ac3ccdeea0f057e06@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Nov 24, 2026 at 7:12 AM CET, Nicolai Buchwitz wrote:
> On 23.11.2026 18:09, Th=C3=A9o Lebrun wrote:
>> On Mon Nov 23, 2026 at 4:38 PM CET, Nicolai Buchwitz wrote:
>>> @@ -6589,7 +6590,11 @@ static int __maybe_unused macb_suspend(struct=20
>>> device *dev)
>>>  		}
>>>  		spin_unlock_irqrestore(&bp->lock, flags);
>>>=20
>>> -		enable_irq_wake(bp->queues[0].irq);
>>> +		err =3D enable_irq_wake(bp->queues[0].irq);
>>> +		if (err)
>>> +			netdev_warn(netdev, "Unable to enable IRQ %d as a wake source=20
>>> (error %d)\n",
>>> +				    bp->queues[0].irq, err);
>>> +		bp->pm_data.irq_wake_enabled =3D !err;
>>>  	}
>>=20
>> Your error handling is surprising to me: if we get asked to be a wakeup
>> source and fail doing so, we should refuse and error out. This will in
>> turn abort the system-wide suspend.
>>=20
>> The risk is that we might be the only wakeup source. We'd sleep for a
>> really long time.
>
> Agreed. This also would match the WAKE_ARP check, which already aborts
> suspend. We could arm the IRQ before touching the hardware and return=20
> the
> error, so the flag goes away too?

About the irq_wake_enabled flag: yes it can go away.

But for the error handling, I still prefer my suggestion that was later
in the previous email, of moving enable_irq_wake() into macb_set_wol().
 - One less error path in our suspend callback.
 - Signaling early to userspace that WoL isn't doable.

>> What's the behavior on the platform you noticed the issue? I can think
>> of two reasons that still make it work:
>>  - you have another wakeup source or
>
> Yes, the bootloader / rtc alarm / power button. The GIC is off as it is=
=20
> on
> rp1 too, which is in reset I guess. This makes WoL IMHO impoissible.

It all depends on your platform and kernel! There are so many types of
suspend and the one you do is dependent on your hardware design and
your software implementation. Nothing prevents you from doing WoL on
PCI MACs.

 - For proper suspend-to-RAM (S2R) you want your full SoC to be off,
   meaning your wakeup source must be signaling directly to the PMIC.

 - Otherwise you are stuck in a compromise of keeping your SoC partially
   active so that it can route the signal to the PMIC. That can still
   be labeled as S2R.

 - For suspend-to-idle (s2idle), you could have a setup where both the
   SoC and RP1 are still active, but PCI link is down. But again this
   needs to be hardware designed: wakeup signal routed so that the PCI
   link can go down, and an endpoint that has its power supply separate
   to the PCI link.

 - Or lastly you can do s2idle with the PCI link still runing. Here not
   many things are suspended (but it is also the fastest to resume). At
   this point you are pretty close to cpuidle, but with most
   peripherals disabled (if drivers implement it).

I kind of have been carried away; I know a guy who gave some talks about
suspend if you want to hear even more about it.

Part 1 (suspend, runtime PM, their interactions)
Video:  https://www.youtube.com/watch?v=3D_jb6U40ZCZk
Slides: https://bootlin.com/pub/conferences/2024/eosseu/lebrun-pm/lebrun-pm=
.pdf

Part 2 ("how to reason about PM", RPM advanced features, power domains, PM =
QoS)
Video:  https://www.youtube.com/watch?v=3DG0Ji-XKRzUg
Slides: https://bootlin.com/pub/conferences/2025/elce/tleb-pm2.pdf

>>  - some other interrupt (PCI related) is your wakeup path.
>>=20
>> In my mind, we should instead propagate the enable_irq_wake() error in
>> macb_suspend().
>>=20
>> To go even further, we could move the enable_irq_wake() into
>> macb_set_wol() to report early to userspace that WoL isn't supported.
>
> There is another downstream patch I plan to upstream, which sets=20
> MACB_CAPS_NO_WOL
> for rp1. As this in kinda feature I planned for net-next and just fix=20
> the bug in net

Can we rely on enable_irq_wake() to fail at set_wol request? That is one
less capability flag to worry about.

>> Lastly, if this is indeed a PCI related topic, then we need to
>> special-case the enable_irq_wake() call. From my LLM report, many PCI
>> MAC drivers only call device_set_wakeup_enable() at the set_wol
>> request. Then everything is handled at the bus level at suspend: a
>> pci_enable_wake() call made if the device is on the wakeup path.
>
> macb is a platform device behind rp1, which is a mfd. PCIe is down in S3=
=20
> anyway?

See above. :-) It probably is on the downstream (#7514) as that is by
far the simplest option, but it isn't the only one.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

