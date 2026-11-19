Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088988;
	b=L9hpShlbqa15TCtMzjEJytuT7CzHgQurUOpnzUHYZyMDBFR8y5OuJ/gCqziOMUNDmMWK
	 xahVg6E29Gxtu2NUHwNoYQLBYGSwrm6NL0EZzqFr4NRZt4ieJrYvO3hpI8zVxqXMshhsU
	 9GqrinfC6wBNC7NnJ7Vk9QlV9yxQu6F/QD4PufeG+WeQhSBz7/vqJ/jqFPZKWjx2KchAO
	 lPzzLShVaKV/vXdByL8RjLkQW8wAY+7J9ycYPDT9lhoJki6fqS0Lz6cAilDaX5SQ0Sk6T
	 DFS/3eJBytVNE6xgGct4QVPr2DEcLF9ItFvdoOMpH7NGZAycOBCO0u60vk+xe0j0q+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088988;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=O95fuT/hByszdcGnSYNlRTqiDcHHAEJOmaLksYsfbos=;
	b=bWKIvSXjgzdxjKZelwPf+HuBISxh/p+UFX0QCtufuJe/nurjjjC6AEISjFlv/ZhpTv5k
	 zVMEdQ7JVWK43lyIMgf69z564KMZacbLxhpe8aOTISub0rEBhLHKXwyaq1AdL63WGcVbB
	 p6NrQT0FyQXHnYAYKmErUD4AS+iclF3/c6xEQ1rmmWpLbQfP4k0dNCiCVq5ryClGqLQZq
	 cCgM/cdu5iZWNpQs8NE5uxdTsI2rh/VRR2BvpJf4J1mMcelE8OdU9WH81NqWg9MxaNz7/
	 i0ZlNCTSWpv4xWPN0Cj9oqbHwYL34s3A8QxY8WIgPTaGx/Oja8R+JOjwqOgBTauwbCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=hpPLAHSC;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65E606A32C;
	Thu, 19 Nov 2026 11:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E65E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=hpPLAHSC
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 716C5A11AF;
	Thu, 19 Nov 2026 12:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795088985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O95fuT/hByszdcGnSYNlRTqiDcHHAEJOmaLksYsfbos=;
	b=hpPLAHSCrwQrSD/G9ycqd7DIsbzUmIBurKWCe5HUcdwHWd5UmFONwGcHn4IRbgUR2Weg8O
	qU38EH6hf2xOBL468Kbs0YIosp6SUY2GPGIN9zGrWvIflxG/RmdDJZJoT5eeG6e0uFQLe7
	OxjHJAN50uQWRmHiQ34Kf4+8wVzd4q7/dtM3IgEIudSMkPWFgM2gcF+RC+lTqqknu1xPI3
	koxE7iuR1NL62txT1zuslBcEnkjwlVDVpwKWPHrwBe0Hl7p2gCfNRymwp+iHYTk4aB8k0Z
	CxiRfSdawDI+M5WNa3U3cI5ar2kC1UTNJWBo4nONt2LbcKpyaT59/HsqEP1C7Q==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 12:49:44 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Valerio
 <pvalerio@redhat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across link
 down/up
In-Reply-To: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
Message-ID: <b8bbd8e8078d9c27ccfaad2ac5001e42@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 18.11.2026 21:53, Théo Lebrun wrote:
> Currently, ENST is not explicitly restored across interface close/open.
> If HW keeps its register state then ENST is kept, otherwise it is lost;
> but we do not write the ENST schedule again on open.
> 
> This causes trouble if the config is not compatible with the new open
> and link-up. The two issues that can occur are a link speed change (as
> all timings are configured in a unit relative to the link speed) or a
> change in the # of queues.
> 
> The latter is the main reason we do this change before implementing
> ethtool -L support.
> 
> If on link-up, the cached ENST config is invalid (link speed changed),
> then we drop the cached config, log a warning and explicitly override
> all ENST timings previously configured in the registers. If it is
> valid, we explicitly re-apply it.
> 
> Take this opportunity to replace a kmalloc in
> macb_taprio_setup_replace() with a simple and tiny (104b) stack value.
> 
> Drop the old hack of checking for pm_runtime_suspended(), which has
> little value because we could race with the runtime_suspend() call.
> 
> Synchronise our config using the existing bp->mac_cfg_lock mutex, taken
> by macb_taprio_setup_replace() and macb_taprio_destroy(). To avoid an
> ABBA deadlock between bp->mac_cfg_lock and phydev->lock taken by
> phylink_ethtool_ksettings_get(), cache the link speed as 
> bp->speed_mbps.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
