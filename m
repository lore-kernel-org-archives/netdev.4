Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102863;
	b=OvsZQnjqfqQ2EJ7/8Iy7dSYAy/8emhjFjdno+j0XGXNi4JrbBifhOyVOCoaSV/iGsjM/
	 ocES+EA5dWJ6ILoxeJ+wRIXAbKf7hrZ8TeXRgqoewrq/CWK/6Qy1874O/2G5lkN2AJa6z
	 kKX0RvTuLED+z/ngCfbBAEwlvn7njaBhnWNspOhFzjkEXKMSeRPz3xeR6YX23Ic0NldOJ
	 hiMrT/cIPHf0Y7NG8K+xpxl9UBTJxAqtuVP4IGDKhCcpwc88et2/pdKgPfuDsp+nXzlwm
	 lyTa5xuzB00YrkMNgWZ4Xoe0Aa6vWpYwKyJai0r6QYXCQRYLtThnmczq3x+lPcr0Tng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102863;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=o5kmt8hhzKF5OrYesOkJl14fhGDdkFW708qxasoOJRg=;
	b=aSX1t/1b+CFbXOYCZfzoLKqYe2G9dljpZohtI5wMlg+8pQO6naSovsZyGQfCPej1CYlO
	 IQ0VW7T1M6ZV4XY+4t1wiWo6OSVoL96vESgL/1RZSNEJBSDkhA2LU4TBdgKnC2q/42y8S
	 ekuHrQcmkbmPxjzURrZqK/5T9aflmf2noVHmPZQsL9GDbFcFM7uIqbL0Q+/Nj1SumgDlQ
	 tQu0Xg6Hi2NOZiD76FxfkOiXCMeZSCpl5OjtuIBczagqQVnYV8EHN4UlgZSIL/UU7m/Rr
	 L3aBcEYZNUZ3b6zJeLgu9G6ULrMuLuErFzSc+WOI8qFeaa4VevPqKA4EV9U73ZbWS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ym5EYz4S;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA71606A65E
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA71606A65E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ym5EYz4S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3A89FC4CBEF;
	Thu, 19 Nov 2026 15:41:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D894C60237;
	Thu, 19 Nov 2026 15:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D1AF11BC0D1C;
	Thu, 19 Nov 2026 16:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o5kmt8hhzKF5OrYesOkJl14fhGDdkFW708qxasoOJRg=;
	b=Ym5EYz4S8NhQ2EEsVEb/MQ81IvhmdzAm3J7C34NOX941ZJP9pdlHUXdzqSY64V7YsuVXEh
	jLoThyOHRrVxqM6+n/DGrdUrqersL1w8k6yOJermVKaEOFldtUOsF3CbM47y+dPrk3nP/w
	WKgTddk+SjQ9TpthTQlUQQ3l7wXV4THUqPuuTz/sDWCNALYwWdiCv8wgELzNrhIsWyBxHH
	B1mZtqHb0K6OCdy1SBFEpOb8zNdiHZKgzyG+V3Ahcpug0yTyvAH03zmW0uqvZMuuthCKpx
	IGRTuVydMWehF77zCqjqNUfnhIlmKuAyONjlHOTbaFcNcWpSYoUjp2GfvxS7NA==
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
Date: Thu, 19 Nov 2026 16:40:35 +0100
Message-Id: <DMZAUI64FXCL.13646UPPGKGTC@bootlin.com>
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
In-Reply-To: <fe08db37-4415-4b4b-b226-cc1a0ec4f029@amd.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Vineeth,

On Thu Nov 19, 2026 at 1:36 PM CET, Vineeth Karumanchi wrote:
> Hi Th=C3=A9o,
>
> On 11/19/2026 2:23 AM, Th=C3=A9o Lebrun wrote:
>> Currently, ENST is not explicitly restored across interface close/open.
>> If HW keeps its register state then ENST is kept, otherwise it is lost;
>> but we do not write the ENST schedule again on open.
>>=20
>> This causes trouble if the config is not compatible with the new open
>> and link-up. The two issues that can occur are a link speed change (as
>> all timings are configured in a unit relative to the link speed) or a
>> change in the # of queues.
>>=20
>
> Thanks for the patch.
>
> We are working on the same problem for CBS, covering the four scenarios
> listed in:
> https://lore.kernel.org/netdev/a04aa4d5-335b-47c1-b969-e89b18c9b142@amd.c=
om/
>
> Since this patch reworks how ENST state is kept and restored, it would
> be good to introduce a generic top-level tc structure here, which ENST,
> CBS and any later TSN offloads can share, instead of an ENST-specific one=
.

Sorry I forgot replying on that thread. It is still marked as unread in
my mailbox!

Let me quote it here and reply:



On Thu Oct 8, 2026 at 5:27 PM CEST, Karumanchi, Vineeth wrote:
> On 9/17/2026 3:02 PM, Th=C3=A9o Lebrun wrote:
>> So we write cbs_control/0x04BC only on ndo_setup_tc(TC_SETUP_QDISC_CBS)
>> callback. As Sashiko pointed how I think that causes an issue with HW
>> resets & suspend:
>>  - what if configured then link down then link up?
>>  - what if configured before link up?
>>
>> Also when not using CBS we hope tx_sched_ctrl/0x0580 is at its reset
>> value (0b00, fixed priority) for all queues. I would expect an
>> unconditional writel tx_sched_ctrl/0x0580 in macb_init_hw(). This
>> solves the down/up issue, the speed change and also ensures we don't
>> inherit CBS or DWRR from the boot stages (super unlikely though).
>>
>> Also, it might be simpler to always use tx_sched_ctrl/0x0580 rather than
>> sometimes tx_sched_ctrl/0x0580 and sometimes cbs_control/0x04BC, which
>> are aliases.
>>
>> What do you think?
>
> Sorry for the delayed response.
>
> I tested the current implementation in the following four scenarios:
>
> 1. Configuring CBS while the link is down: CBS cannot be programmed
> because the link speed is unknown.
>
> 2. Link down followed by link up: The hardware retains the CBS register
> values, and CBS is effective again after the link comes up at the same
> speed.

Here you talk about link-down followed by link-up.

But about a close then open: this behavior might be board specific.
Runtime PM does suspend and this might shut off the IP on some
platforms and not others. That would in turn mean the IP loses its
state.

There is no easy way of knowing if that occurs on any platform that uses
MACB. It sounds probable though.

> 3. Suspend/resume: The CBS register contents are lost after resume.
> However, the CBS child qdisc remains installed in the kernel and is
> still shown by tc as offloaded, leaving the software configuration
> inconsistent with the hardware state.

Again, this is platform specific. Some boards + suspend combo keep the
SoC and its peripherals alive enough for them to keep their state.

A board with little runtime PM doing suspend-to-idle probably won't lose
CBS register state. A board doing proper suspend-to-RAM will surely
lose its state.

> 4. Link-speed change: The CBS register values are retained and shaping
> remains enabled. However, those values were calculated for the previous
> speed, so the resulting shaping bandwidth is incorrect.
>
> I see two possible approaches:
>
> - Retain the requested CBS parameters in the driver and restore the
> hardware configuration, following the saved-state approach used by IGB.
> For MACB, we would also recalculate the hardware idleslope on link-up
> using the negotiated speed.
> If the saved request cannot be supported at the new speed, retain the
> request, leave CBS disabled for that queue, and warn the user that the
> configuration is invalid for the new link speed.
>
> - Explicitly reset the scheduling configuration in macb_init_hw() and
> require users to remove and recreate the CBS qdisc. This establishes a
> known hardware state, but leaves the installed qdisc inconsistent until
> users reconfigure it. It would also need handling for speed changes that
> do not invoke macb_init_hw().
>
> Please let me know your thoughts on these approaches.

Option 2 is not super doable. There is no API for the driver to
say to the network stack and userspace "I'm dropping your qdisc, please
re-enable one if you care".

So ideally we would do option 1, but dealing with link speed changes
sounds complex. I'm super afraid of introducing bugs with code that
recomputes the timings on the fly. I'm sure I will create rounding bugs
in the edge cases.

That's why I made the cached state be in number of words and store the
link speed alongside. This means we cannot introduce such bugs AND is
less code overall AND is the common case.

It feels like easier and smaller incremental changes.



Now continuing onto the original quote:

>> The latter is the main reason we do this change before implementing
>> ethtool -L support.
>>=20
>> If on link-up, the cached ENST config is invalid (link speed changed),
>> then we drop the cached config, log a warning and explicitly override
>> all ENST timings previously configured in the registers. If it is
>> valid, we explicitly re-apply it.
>>=20
>> Take this opportunity to replace a kmalloc in
>> macb_taprio_setup_replace() with a simple and tiny (104b) stack value.
>>=20
>> Drop the old hack of checking for pm_runtime_suspended(), which has
>> little value because we could race with the runtime_suspend() call.
>>=20
>> Synchronise our config using the existing bp->mac_cfg_lock mutex, taken
>> by macb_taprio_setup_replace() and macb_taprio_destroy(). To avoid an
>> ABBA deadlock between bp->mac_cfg_lock and phydev->lock taken by
>> phylink_ethtool_ksettings_get(), cache the link speed as bp->speed_mbps.
>>=20
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  drivers/net/ethernet/cadence/macb.h      |  47 +++++---
>>  drivers/net/ethernet/cadence/macb_main.c | 187 +++++++++++++++---------=
-------
>>  2 files changed, 124 insertions(+), 110 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/=
cadence/macb.h
>> index b7b4b6a38298..00258866623f 100644
>> --- a/drivers/net/ethernet/cadence/macb.h
>> +++ b/drivers/net/ethernet/cadence/macb.h
>> @@ -1327,6 +1327,35 @@ struct macb_context {
>>  	struct macb_txq		txq[MACB_MAX_QUEUES];
>>  };
>> =20
>> +/**
>> + * struct macb_queue_enst_config - Configuration for Enhanced Scheduled=
 Traffic
>> + * @start_time_mask:  Bitmask representing the start time for the queue
>> + * @on_time_bytes:    "on" time nsec expressed in bytes
>> + * @off_time_bytes:   "off" time nsec expressed in bytes
>> + *
>> + * This structure holds the configuration parameters for an ENST queue,
>> + * used to control time-based transmission scheduling in the MACB drive=
r.
>> + */
>> +struct macb_queue_enst_config {
>> +	u32 start_time_mask;
>> +	u32 on_time_bytes;
>> +	u32 off_time_bytes;
>> +};
>> +
>> +/**
>> + * struct macb_enst - Cached Enhanced Scheduled Traffic configuration
>> + * @queues:     per-queue timing (zeroed for queues without schedule)
>> + * @speed_mbps: link speed the timings were computed for, 0 if no sched=
ule
>> + * @queue_mask: queues enabled by the current schedule, 0 if no schedul=
e
>> + *
>> + * The timings are expressed in bytes, so they depend on the link speed=
.
>> + */
>> +struct macb_enst {
>> +	struct macb_queue_enst_config	queues[MACB_MAX_QUEUES];
>> +	u32				speed_mbps;
>> +	u32				queue_mask;
>> +};
>> +
>
> Could this be a per-queue structure shared by all tc offloads, so that
> new features only add their own part?
> For example:
>
> struct macb_tc_queue {
>         struct {
>                 u32 idleslope;          /* kbps */
>         } cbs;
>         struct {
>                 u32 start_time;         /* ENST_START_TIME register value=
 */
>                 u32 on_time_ns;         /* gate open interval */
>                 u64 off_time_ns;        /* gate closed interval */
>         } enst;
> };

Yes sure!

Either

   // as you suggest
   struct macb_tc_queue tc_queues[MACB_MAX_QUEUES];

Or:

   struct macb_enst_queue enst_queues[MACB_MAX_QUEUES];
   struct macb_cbs_queue cbs_queues[MACB_MAX_QUEUES];
   // ... etc ...

Both would work.

>
>>  struct macb {
>>  	void __iomem		*regs;
>>  	bool			native_io;
>> @@ -1427,11 +1456,14 @@ struct macb {
>> =20
>>  	/* Redundant to netif_carrier_ok(), but set under bp->mac_cfg_lock. */
>>  	bool			link_up;
>> +	u32			speed_mbps;
>> =20
>>  	u32	rx_intr_mask;
>> =20
>>  	struct macb_pm_data pm_data;
>>  	const struct macb_usrio_config *usrio;
>> +
>> +	struct macb_enst enst;
>>  };
>> =20
>>  #ifdef CONFIG_MACB_USE_HWSTAMP
>> @@ -1532,19 +1564,4 @@ struct macb_platform_data {
>>  	struct clk	*hclk;
>>  };
>> =20
>> -/**
>> - * struct macb_queue_enst_config - Configuration for Enhanced Scheduled=
 Traffic
>> - * @start_time_mask:  Bitmask representing the start time for the queue
>> - * @on_time_bytes:    "on" time nsec expressed in bytes
>> - * @off_time_bytes:   "off" time nsec expressed in bytes
>> - *
>> - * This structure holds the configuration parameters for an ENST queue,
>> - * used to control time-based transmission scheduling in the MACB drive=
r.
>> - */
>> -struct macb_queue_enst_config {
>> -	u32 start_time_mask;
>> -	u32 on_time_bytes;
>> -	u32 off_time_bytes;
>> -};
>> -
>>  #endif /* _MACB_H */
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 9f6111661b40..1e0666692116 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -847,6 +847,7 @@ static void macb_mac_link_down(struct phylink_config=
 *config, unsigned int mode,
>>  	mutex_lock(&bp->mac_cfg_lock);
>> =20
>>  	bp->link_up =3D false;
>> +	bp->speed_mbps =3D 0;
>> =20
>>  	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
>>  		for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++q, ++queue)
>> @@ -955,6 +956,43 @@ static void gem_shuffle_tx_rings(struct macb *bp)
>>  		gem_shuffle_tx_one_ring(queue);
>>  }
>> =20
>> +static void macb_apply_enst_config(struct macb *bp)
>> +{
>> +	struct macb_queue_enst_config *config;
>> +	struct macb_queue *queue;
>> +	u32 queue_mask;
>> +	size_t q;
>> +
>> +	/* Short-circuit to avoid writing to invalid register offsets */
>> +	if (!(bp->caps & MACB_CAPS_QBV))
>> +		return;
>> +
>> +	guard(spinlock_irqsave)(&bp->lock);
>> +
>> +	/* Disable ENST for all queues.
>> +	 * Reconfiguring timings must be done with ENST disabled.
>> +	 */
>> +	queue_mask =3D BIT_U32(bp->num_queues) - 1;
>> +	gem_writel(bp, ENST_CONTROL,
>> +		   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
>> +
>> +	for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++q, ++queue) =
{
>> +		/* Configure queue timing registers.
>> +		 *
>> +		 * Those fields must be zero if the queue has ENST disabled:
>> +		 * notice we don't bother reading bp->enst.queue_mask & BIT(q).
>> +		 */
>> +		config =3D &bp->enst.queues[q];
>> +		queue_writel(queue, ENST_START_TIME, config->start_time_mask);
>> +		queue_writel(queue, ENST_ON_TIME, config->on_time_bytes);
>> +		queue_writel(queue, ENST_OFF_TIME, config->off_time_bytes);
>> +	}
>> +
>> +	/* Enable ENST for all configured queues in one write */
>> +	if (bp->enst.queue_mask)
>> +		gem_writel(bp, ENST_CONTROL, bp->enst.queue_mask);
>> +}
>> +
>>  static void macb_mac_link_up(struct phylink_config *config,
>>  			     struct phy_device *phydev,
>>  			     unsigned int mode, phy_interface_t interface,
>> @@ -972,6 +1010,7 @@ static void macb_mac_link_up(struct phylink_config =
*config,
>>  	spin_lock_irqsave(&bp->lock, flags);
>> =20
>>  	bp->link_up =3D true;
>> +	bp->speed_mbps =3D speed > 0 ? speed : 0;
>> =20
>>  	ctrl =3D macb_or_gem_readl(bp, NCFGR);
>> =20
>> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_confi=
g *config,
>> =20
>>  	spin_unlock_irqrestore(&bp->lock, flags);
>> =20
>> +	if (bp->enst.speed_mbps && speed !=3D bp->enst.speed_mbps) {
>
> Why drop the schedule on a speed change? The taprio qdisc stays
> installed, so the user's configuration is still valid;
> Could we instead recompute the ON/OFF times for the new speed on
> link-up, and only disable (with a warning) the queues whose intervals no
> longer fit the hardware range at that speed?

See explanation above. It felt like a good local maximum: simple code
that probably doesn't introduce rounding bugs and solves it for most
usecases.

In any case, we will sometimes have to drop the qdisc and warn about it.

>
>> +		netdev_warn(bp->netdev,
>> +			    "TAPRIO dropped because link speed changed\n");
>> +
>> +		memset(&bp->enst, 0, sizeof(bp->enst));
>> +	}
>> +
>> +	macb_apply_enst_config(bp);
>> +
>
> Could this be a single macb_apply_tc_config() (or similar) that
> reprograms every enabled tc offload? CBS needs exactly the same
> handling, since idleslope is also relative to the link rate.

Yes sure!

Do you want to take over and handle this? You seem to be interested in
those TC features.  You can either copy the patch as-is or modify it
under your own authorship, I don't mind.

Or if you prefer, I keep it here and iterate. But if I keep it, I'll
continue with ENST and then at a later stage we'll add CBS & co onto
it. This patch looks like a good starting point to add more onto it.

I'm mostly focused on getting a set_channels implementation (to then
have XDP/XSK) and I fixed ENST along the way.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

