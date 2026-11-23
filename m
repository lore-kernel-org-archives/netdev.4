Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459836;
	b=dHDXntpTbYu3bbHpx+Koqa0zsAS607129fykfOOMG4OSOaunvlLd4k2OxG7cdGcV/+Fs
	 YfV/2UIIEQpHw9WY42KW1MNggn4orVdlrpRuCyVJLciPS566tNZGe9vo6nooWhG9mw2hp
	 Qdi7zue3ZaVV5+2zaRlJBNKyjoQ+gJjDjEfaoWvtwsY+h9uUl+edATSTEoIhhpRsBF7yT
	 37iMnzZ88qQsDsgHqVtesVH3q6IE0+CAid92TcdoI0ZMEJNJHGoh0U6jYWOj066jcm1E2
	 LwLivjnwinef5nsHIJlJCqurXQ3ZerdmiWyZK6JzGRAl75gBGlAMXqXNvXCreMG0hoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459836;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=b+4fU8GUHMfUQSEEIN10ewQnlXfW4gN/+OEy1aDtAy4=;
	b=3JA3sz+aJIme1Hrxz4/TRYIMxKGp2JRRNgLzC8RFzb/1S3ROB2g5WcBiDbub7t9JDiEN
	 boX4oKPjkXDOCyax/nLFWiSnlyPMKskZEt7NYWAGBGlik4OLlSQObYp8TloQZMMjO9B7d
	 EYfy0RmvgqySxYHlRpM0kAPX0Vx8siMUbyaAzWBJV2tXljnglssNClXuvNXs0hiCNJmhU
	 7U+ztUUdLSII0lABiZ0aJ51RCaf2tAMb4QxbnsSQ5+8W1I+EY+bJb1qm0UmHnANHPleBQ
	 JdYj1AFzbwKr+0Tf4Oxe80MT7FrUApF6tS7Q/mhjnAtjQHu4Dnfl0qeWKQ/ERwQWcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OKefz29i;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEE606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CEE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OKefz29i
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 03A044E41721;
	Mon, 23 Nov 2026 18:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0BE2601E1;
	Mon, 23 Nov 2026 18:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0DFF11E6A90D;
	Mon, 23 Nov 2026 19:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795459827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b+4fU8GUHMfUQSEEIN10ewQnlXfW4gN/+OEy1aDtAy4=;
	b=OKefz29i0VY74QF7ONwAO7dXb4FAPy9MWvXDw8oihHIRsngzi0gnGXeqFdedh/m587zvsF
	oojlhDtZpCN/DBoUlipsMOf7ToasrEONGKTchSYrXHO3v8TrXFA7Ph21zdwRhhmOK+id6o
	/uZxbNx3i8js77UHTNnMgywmpvkTwmZPteoL1Tfp/H750Bwz7WOG2MSnkYoob89e25Qre3
	gBFoL0m4l4IggXoOzzqsoEjKURf0fFdu7I/FPahIYAFKlC8q9JRjmp6xPJyWiXx2jcb1F5
	HMXJmHMYVmfkmOqUYLUq1tt1F4wnuJFusgxf8AI7dWiZJChi72rNHD76wF38uA==
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
Date: Mon, 23 Nov 2026 19:50:20 +0100
Message-Id: <DN2TDYY9HUYK.3KCMO2YKBULO@bootlin.com>
Subject: Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across
 link down/up
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Nicolai
 Buchwitz" <nb@tipi-net.de>, "Paolo Valerio" <pvalerio@redhat.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Vineeth Karumanchi" <vineeth.karumanchi@amd.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Russell King" <linux@armlinux.org.uk>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
 <fe08db37-4415-4b4b-b226-cc1a0ec4f029@amd.com>
 <DMZAUI64FXCL.13646UPPGKGTC@bootlin.com>
 <0933f10c-8d74-4d98-afdd-1a83409c2402@amd.com>
 <DN2S4TWF22LW.1ZF2FB4STUM0W@bootlin.com>
In-Reply-To: <DN2S4TWF22LW.1ZF2FB4STUM0W@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Th=C3=A9o,

On Mon Nov 23, 2026 at 6:51 PM CET, Th=C3=A9o Lebrun wrote:
> On Fri Nov 20, 2026 at 7:44 AM CET, Vineeth Karumanchi wrote:
>> On 11/19/2026 9:10 PM, Th=C3=A9o Lebrun wrote:
>> <...>
>>>>> @@ -972,6 +1010,7 @@ static void macb_mac_link_up(struct phylink_conf=
ig *config,
>>>>>  	spin_lock_irqsave(&bp->lock, flags);
>>>>> =20
>>>>>  	bp->link_up =3D true;
>>>>> +	bp->speed_mbps =3D speed > 0 ? speed : 0;
>>>>> =20
>>>>>  	ctrl =3D macb_or_gem_readl(bp, NCFGR);
>>>>> =20
>>>>> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_co=
nfig *config,
>>>>> =20
>>>>>  	spin_unlock_irqrestore(&bp->lock, flags);
>>>>> =20
>>>>> +	if (bp->enst.speed_mbps && speed !=3D bp->enst.speed_mbps) {
>>>> Why drop the schedule on a speed change? The taprio qdisc stays
>>>> installed, so the user's configuration is still valid;
>>>> Could we instead recompute the ON/OFF times for the new speed on
>>>> link-up, and only disable (with a warning) the queues whose intervals =
no
>>>> longer fit the hardware range at that speed?
>>> See explanation above. It felt like a good local maximum: simple code
>>> that probably doesn't introduce rounding bugs and solves it for most
>>> usecases.
>>>=20
>>> In any case, we will sometimes have to drop the qdisc and warn about it=
.
>>>=20
>>
>> yes agreed!.
>>
>> I also looked at a few usage scenarios and at how other implementations
>> handle this (with some AI assistance). They lean towards recalculating
>> on link-up:
>>
>> - taprio core: keeps the schedule on a speed change and recalculates its
>> speed dependent values (picos_per_byte, max frame durations) from its
>> NETDEV_UP/NETDEV_CHANGE notifier.
>>
>> - felix / VSC9959 TAS: gates are in ns; on a speed change,
>> vsc9959_sched_speed_set() updates the TAS link speed and calls
>> vsc9959_tas_guard_bands_update() to recalculate the speed dependent part=
s.
>>
>> Typical scenario:
>>
>> - Autoneg downshift 1G -> 100M (damaged cable, 2-pair or M12 cabling,
>> PHY downshift): fairly common in the field. Users expect best-effort
>> traffic to keep flowing, a clear warning, and recovery once the cable is
>> fixed.
>>
>> That said, I am fine with either approach.
>
> The more I think about it, the more I feel it is fine to drop the TAPRIO
> schedule as is being done by this patch.
>
> Really, EnST on an unstable link that got downgraded to a lower speed
> makes no sense. It is used on Time Sensitive Networks and the link down
> is the major issue in that case, not the EnST schedule being off.
> Userspace must give us a new schedule that is computed from the link
> speed. It is just a bit sad we cannot report the qdisc got dropped.
>
> Anyway, this patch is way better than the current situation, and we
> don't have an easy way to a perfect solution. So I say we go with this
> and improve if we feel like it is needed later on.
>
>>
>>>>> +		netdev_warn(bp->netdev,
>>>>> +			    "TAPRIO dropped because link speed changed\n");
>>>>> +
>>>>> +		memset(&bp->enst, 0, sizeof(bp->enst));
>>>>> +	}
>>>>> +
>>>>> +	macb_apply_enst_config(bp);
>>>>> +
>>>> Could this be a single macb_apply_tc_config() (or similar) that
>>>> reprograms every enabled tc offload? CBS needs exactly the same
>>>> handling, since idleslope is also relative to the link rate.
>>> Yes sure!
>>>=20
>>> Do you want to take over and handle this? You seem to be interested in
>>> those TC features.  You can either copy the patch as-is or modify it
>>> under your own authorship, I don't mind.
>>>=20
>>> Or if you prefer, I keep it here and iterate. But if I keep it, I'll
>>> continue with ENST and then at a later stage we'll add CBS & co onto
>>> it. This patch looks like a good starting point to add more onto it.
>>>
>>
>> Your changes look good to me (after generic struct/api), and I am happy
>> with either option. I can take over the patch and make any necessary
>> adjustments alongside the CBS changes, or add CBS support after this
>> series is merged.
>>
>> Please let me know which you prefer.
>
> Now that I have the patch I'll iterate on it! Thanks for the quick
> feedback; I'll make sure to CC you from now on.

I just want to bounce back on the "after generic struct/api" you said.
Your proposal was of the sort:

	struct macb_tc_queue {
		struct {
			u32 idleslope;          /* kbps */
		} cbs;
		struct {
			u32 start_time;         /* ENST_START_TIME register value */
			u32 on_time_ns;         /* gate open interval */
			u64 off_time_ns;        /* gate closed interval */
		} enst;
	};

	struct macb_tc {
		struct macb_tc_queue queues[MACB_MAX_QUEUES];
		u32 enst_queue_mask;
		// ... etc ...
	};

	struct macb {
		// ... what already exists in struct macb ...

		struct macb_tc tc;
	};

But actually I will keep my patch as-is, because I would much prefer:

	// same for cbs, etc.
	struct macb_queue_enst_config {
		u32 start_time_mask;
		u32 on_time_bytes;
		u32 off_time_bytes;
	};

	// same for cbs, etc.
	struct macb_enst {
		struct macb_queue_enst_config	queues[MACB_MAX_QUEUES];
		u32				speed_mbps;
		u32				queue_mask;
	};

	struct macb {
		// ... what already exists in struct macb ...

		struct macb_enst enst;
		struct macb_cbs cbs;
		// ... etc ...
	};

The benefit of the latter strategy is two-fold:
 - The structs are independent: less patch conflicts and each part can
   be added one after the other.
 - We can memset/memcpy a state; it is used quite a lot in the current
   patch version. With your proposal, it requires iterating over the
   queue loop to partially memset/memcpy (or equivalent) each queue.

I wanted this decision to be documented here before I send the next
revision.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

