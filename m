Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104642;
	b=FGx48c+Oh2S7/P4iVBB+23ppddOiXAMR8Bm7OsNm38dv09Z9tuTurkgLJeWYj9osqcFG
	 hjd6asxahvjBc3zWM0FQcug2ZyuejqQiDJJk1bE3tWbeiQz6IEbDKU0ywoROF5Pyi4V7q
	 b76UVnBmKeccxhAroJK3ivfmeDMQIwRCttmzkPhnM/Jqt1K97JYdSLJUeCFcSOVL+Jk4d
	 lQnp5Ioik+q+a6+o87/J9oh7k2yIf78XMdXmsfQnnDkQenImtFpMIFs4N1WdXHuSyhUBY
	 AKrJfzBR2vwzzUNJ+vS8Amrke8+ZIXz7NOu8eR574y+dU6wbzgn9Gzzh8lvgxck4q7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104642;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=eutdWw7ar1SyoyZTH6YxznbRF/qGYooUmoW9rTnUaCc=;
	b=d6mW306yHs+zwRGll/oHlVECIKR9ZVTapuOBYVVr/Fxq1bhoecML3aWMWa9inbRQhkrt
	 oG+YPlhz4gLRRoxxfgLWHtmk146qXM0AKcprw6/4Nn0iL+xoDtFDfe8FPoa/Vcigs7iV4
	 yfwURZLWk0v6gCFsChbl537T0/ZwGJ/iiMAuzmBykmFbxEIh6tDIuymLSVXDAxOO5ODPt
	 VAoW1iA1ycstIDtr7+7tNfQMY9v1zjrg0EXKJjdCl8mYefpbeE5wSPLjURo3prymRpQHj
	 NaM66Jrij2XhcK0Inok1pCseo9mKJeEtmPf3/c5zmpiu4XxTWW4G//wgx5Mr3aChAKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="11vh/nvD";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C66606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C66606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=11vh/nvD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4BB8C4CBF6;
	Thu, 19 Nov 2026 16:10:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79D0A5FF9A;
	Thu, 19 Nov 2026 16:10:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E1CF11BC0D13;
	Thu, 19 Nov 2026 17:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795104637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eutdWw7ar1SyoyZTH6YxznbRF/qGYooUmoW9rTnUaCc=;
	b=11vh/nvDA9/D/C8zFkmzv1MC3ofM75VUSPvcFI6RY84pOIlDkOKkFIrCdNHjJwWtQUw/3U
	3jVa8bXIsGgqfvpQ0vBhy9X1KKv5gTS4YIZa+30Gh/cAQ9rRK747m8LAl2Kgv2hvnTFTPj
	4toAZJvELyezA32vhhwrqYrD9EzRl8RIUWWZBMAzQvc6aXt6rd7kRhfq35bbqrPTDGUc8i
	uoCaX9+hz+G39SqR90EL3bwfCaRsqqz+fPxn8j8M4C/1Li39RNH0HdyPhWSa9JAnoD+xM5
	Wl7imoMcmOWQO3TlwU/hHCtU+bUHf/h+5Scp/VlR+XdbkWdqN8wXWh1lSAE1Pg==
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
Date: Thu, 19 Nov 2026 17:10:27 +0100
Message-Id: <DMZBHDAP7B6U.SVPBZK6JHFEE@bootlin.com>
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
In-Reply-To: <DMZAUI64FXCL.13646UPPGKGTC@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Th=C3=A9o,

On Thu Nov 19, 2026 at 4:40 PM CET, Th=C3=A9o Lebrun wrote:
> Hello Vineeth,
>
> On Thu Nov 19, 2026 at 1:36 PM CET, Vineeth Karumanchi wrote:
>> Hi Th=C3=A9o,
>>
>> On 11/19/2026 2:23 AM, Th=C3=A9o Lebrun wrote:
>>> Currently, ENST is not explicitly restored across interface close/open.
>>> If HW keeps its register state then ENST is kept, otherwise it is lost;
>>> but we do not write the ENST schedule again on open.
>>>=20
>>> This causes trouble if the config is not compatible with the new open
>>> and link-up. The two issues that can occur are a link speed change (as
>>> all timings are configured in a unit relative to the link speed) or a
>>> change in the # of queues.
>>>=20
>>
>> Thanks for the patch.
>>
>> We are working on the same problem for CBS, covering the four scenarios
>> listed in:
>> https://lore.kernel.org/netdev/a04aa4d5-335b-47c1-b969-e89b18c9b142@amd.=
com/
>>
>> Since this patch reworks how ENST state is kept and restored, it would
>> be good to introduce a generic top-level tc structure here, which ENST,
>> CBS and any later TSN offloads can share, instead of an ENST-specific on=
e.
>
> Sorry I forgot replying on that thread. It is still marked as unread in
> my mailbox!
>
> Let me quote it here and reply:
>
>
>
> On Thu Oct 8, 2026 at 5:27 PM CEST, Karumanchi, Vineeth wrote:
>> On 9/17/2026 3:02 PM, Th=C3=A9o Lebrun wrote:
>>> So we write cbs_control/0x04BC only on ndo_setup_tc(TC_SETUP_QDISC_CBS)
>>> callback. As Sashiko pointed how I think that causes an issue with HW
>>> resets & suspend:
>>>  - what if configured then link down then link up?
>>>  - what if configured before link up?
>>>
>>> Also when not using CBS we hope tx_sched_ctrl/0x0580 is at its reset
>>> value (0b00, fixed priority) for all queues. I would expect an
>>> unconditional writel tx_sched_ctrl/0x0580 in macb_init_hw(). This
>>> solves the down/up issue, the speed change and also ensures we don't
>>> inherit CBS or DWRR from the boot stages (super unlikely though).
>>>
>>> Also, it might be simpler to always use tx_sched_ctrl/0x0580 rather tha=
n
>>> sometimes tx_sched_ctrl/0x0580 and sometimes cbs_control/0x04BC, which
>>> are aliases.
>>>
>>> What do you think?
>>
>> Sorry for the delayed response.
>>
>> I tested the current implementation in the following four scenarios:
>>
>> 1. Configuring CBS while the link is down: CBS cannot be programmed
>> because the link speed is unknown.
>>
>> 2. Link down followed by link up: The hardware retains the CBS register
>> values, and CBS is effective again after the link comes up at the same
>> speed.
>
> Here you talk about link-down followed by link-up.
>
> But about a close then open: this behavior might be board specific.
> Runtime PM does suspend and this might shut off the IP on some
> platforms and not others. That would in turn mean the IP loses its
> state.
>
> There is no easy way of knowing if that occurs on any platform that uses
> MACB. It sounds probable though.
>
>> 3. Suspend/resume: The CBS register contents are lost after resume.
>> However, the CBS child qdisc remains installed in the kernel and is
>> still shown by tc as offloaded, leaving the software configuration
>> inconsistent with the hardware state.
>
> Again, this is platform specific. Some boards + suspend combo keep the
> SoC and its peripherals alive enough for them to keep their state.
>
> A board with little runtime PM doing suspend-to-idle probably won't lose
> CBS register state. A board doing proper suspend-to-RAM will surely
> lose its state.
>
>> 4. Link-speed change: The CBS register values are retained and shaping
>> remains enabled. However, those values were calculated for the previous
>> speed, so the resulting shaping bandwidth is incorrect.
>>
>> I see two possible approaches:
>>
>> - Retain the requested CBS parameters in the driver and restore the
>> hardware configuration, following the saved-state approach used by IGB.
>> For MACB, we would also recalculate the hardware idleslope on link-up
>> using the negotiated speed.
>> If the saved request cannot be supported at the new speed, retain the
>> request, leave CBS disabled for that queue, and warn the user that the
>> configuration is invalid for the new link speed.
>>
>> - Explicitly reset the scheduling configuration in macb_init_hw() and
>> require users to remove and recreate the CBS qdisc. This establishes a
>> known hardware state, but leaves the installed qdisc inconsistent until
>> users reconfigure it. It would also need handling for speed changes that
>> do not invoke macb_init_hw().
>>
>> Please let me know your thoughts on these approaches.
>
> Option 2 is not super doable. There is no API for the driver to
> say to the network stack and userspace "I'm dropping your qdisc, please
> re-enable one if you care".
>
> So ideally we would do option 1, but dealing with link speed changes
> sounds complex. I'm super afraid of introducing bugs with code that
> recomputes the timings on the fly. I'm sure I will create rounding bugs
> in the edge cases.
>
> That's why I made the cached state be in number of words and store the
> link speed alongside. This means we cannot introduce such bugs AND is
> less code overall AND is the common case.
>
> It feels like easier and smaller incremental changes.

To expand with some numbers on this.

 - For link speed increases, our trouble is the max on/off time interval
   that can be described. We might be asked for windows that we cannot
   express with our hardware registers.

 - For link speed decreases, our trouble is the on/off time interval
   quantum. We risk introducing too much overlap when the desire was to
   have none (pretty common with ENST).

      link speed =E2=94=82 10M    =E2=94=82 100M  =E2=94=82 1G   =E2=94=82 =
2.5G   =E2=94=82 5G     =E2=94=82 10G
      =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80
      max on/off =E2=94=82 105 ms =E2=94=82 10 ms =E2=94=82 1 ms =E2=94=82 =
419 =C2=B5s =E2=94=82 210 =C2=B5s =E2=94=82 105 =C2=B5s
      =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80
      quantum    =E2=94=82 800 ns =E2=94=82 80 ns =E2=94=82 8 ns =E2=94=82 =
3.2 ns =E2=94=82 1.6 ns =E2=94=82 0.8 ns

So only ENST configs that have all timings in that .8=C2=B5s - 105=C2=B5s c=
an
safely-ish be described. But at 10M with the max on-time of 105=C2=B5s, you
cannot even transmit a full 1500 byte frame.

That is talking about the extremes; it is true that it could make more
sense for less extreme link speed changes (eg from 100M to 1G).

Overall, this still conforts me in the current proposal: cache a
link-speed specific config. Userspace must have had looked at the link
speed to pick a sensible ENST schedule anyway.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

