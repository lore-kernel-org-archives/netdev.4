Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105208;
	b=H1jlQYhficNEE5vyhN7ac4L3BCUnmWagtytdyIWGkkIKd5KJ/FpF4QhSZEPCTLmnzLfm
	 KcO9h+fsRnScNJmKxI3ZlbsH1+tYUW1feK2bcb+Z+m1R3cgalDdFg9S5PbIHTStUU20Z3
	 l5DU5qPw96eNo4ddSFVxYdNiLwob+2Kb+yhGuk5t1Jm0XNCttYhvI0LI4FDOuHr9gy7MF
	 6RR0/Ed2GxqlzvCmDUlgrQ/vD7vcVbeVAiH9AaFIv8LU62LfUyzoCjX/5xkcMjmyq8rMw
	 PXbHkZHwVwzHa4GAKCCinF+CJETkI2XQKRKBZ1ZFvwqL/+3ZUwmwwl6tRdsWDCGT6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105208;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=RVJh2xVangVJBwzgstXkIQAK+55cvVoeAY88H9/9n10=;
	b=HEUWp8+4URYgxksP3+zHQWRL/wsLNdGOnLrZYnCgzTdxw+2rSRDQ98/JozHau1nSdLnb
	 AUqQmcWGtGMtUXDPgf0XpM2pg6xm3DF7ccgFkBUlMVfdVcfm4DQqqqJA83F7Z3iI9alGG
	 PIhNDLsuGWW0MUKwl1w8I3oe6psgRXMeofuor6qXtqm84wK4Fv+efNPFGI8ybCmr1rSpF
	 PaHNlIF0JmuvJjKGW7TpDezCtm6hDFNaRQ2Gv9gFudvJo0PiRwn359Z3+XfGWpOFGi56x
	 /aRjWyv4b8gn9Y6TVyoNqEJUpxsnoyGCKFV3aGfw81IGkBDdOEH061eEyhEra6eUXCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="S5/M99cJ";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D54606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S5/M99cJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A831C4CBF6;
	Thu, 19 Nov 2026 16:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A8A35FF9A;
	Thu, 19 Nov 2026 16:20:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F6B111BC0CC9;
	Thu, 19 Nov 2026 17:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795105201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RVJh2xVangVJBwzgstXkIQAK+55cvVoeAY88H9/9n10=;
	b=S5/M99cJq76gM4lfm4/KPAMwaNOLURrsn2xn37PPMLNQZlgjLOkklLJybB0ViQb0dhjVmm
	v6sEH4ba/M5lP7Z5V8WRm0hqdSep+bhZQaSsNlV6LmgbK6vxsYZ2st+zPhDSu6t9VuMlME
	iNLKGw0p8yfT9Qi0/yrOsQXkfvjjr6w/SvVEN1ZKbfZa5bN+C2e9/GvsNwQpuZCLfjQKum
	1o/6ZRq8CL9rvUL7wr8YzV54kYf/a+AjPTMop96yu0d9YQMY6F7B9iDUQu+iQ13TchXMjs
	SJMngqnF8KXW3sqwtDFhFKhRNgzDMNKGEa04cZCGkY2iSW4nZt8EykBUeO3UOg==
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
Date: Thu, 19 Nov 2026 17:19:57 +0100
Message-Id: <DMZBON30TWI8.1KLN28QJP6TNN@bootlin.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Russell King" <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Paolo Valerio"
 <pvalerio@redhat.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
 <cc50263bc4f161b2fff96e04306868cc@tipi-net.de>
In-Reply-To: <cc50263bc4f161b2fff96e04306868cc@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 19, 2026 at 12:54 PM CET, Nicolai Buchwitz wrote:
> On 18.11.2026 21:53, Th=C3=A9o Lebrun wrote:
>> +	if (new_ctx) {
>> +		old_ctx =3D bp->ctx;
>> +		WRITE_ONCE(bp->ctx, new_ctx);
>> +		wmb(); /* ensure IRQ enabled below read the new context */
>> +
>> +		macb_init_buffers(bp);
>> +
>> +		/* Clear DQL (only on successful context swap). */
>> +		for (q =3D 0; q < bp->ctx->num_queues; ++q)
>> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
>> +								  q));
>> +	}
>
> The queues we just dropped never get their BQL reset, not on close or
> open either. So after shrinking and growing again they can stay stuck.

Good catch.

> Maybe just reset all max_num_queues here and in macb_close()?

That's the safe solution, agreed.

>> +	ret =3D netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
>> +	if (ret) {
>> +		if (running) {
>> +			macb_free(new_ctx);
>> +			kfree(new_ctx);
>> +			macb_context_swap_end(bp, NULL);
>
> swap_start() cleared TE, so HW is back at the ring start. Doesn't this
> needs a gem_shuffle_tx_rings() like link_up does, otherwise Tx stalls?

Argh! I had missed (or forgotten) this implicit behavior when clearing
the TE bit of NCR. Yes gem_shuffle_tx_rings() is meant for that.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

