Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089256;
	b=D/z1qusWCi5hFfRBQ+P5VRGSW4Jj9XceOGZLRyP6QFiiXfy9gd/8NQNpENY+yhXYl1Wz
	 JspQWrhN/JF1S3vgRmFYG5l2bLVFg+gyw08DLEJEOJF9waQhp3ZKYSWdRbtQKbykw6NPi
	 dpjiGVEfC1NGIsZiRUi4Q7XQ2XLLDG6THcazoPLvq0uOdAt/m+AGo5dHmWVps0V/4Ma8d
	 hlkbV16d1NykeuFSa5SLIF2EraCNCiUdISe59zWqgCVpl8LK6QFtQ8qRTRtSNwPOg7h4J
	 CeInGbtQyL/BwNf7sQYWEeohROHE/mXzhARA060SE4vfoqnD052KeoJyl0b6fW/7gig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089256;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=kazK3jP8RDwEUVX6vo6nPdibxxigNipPp+bbhgW8KEo=;
	b=VshVQmt0yROfawmlVjkMli/lkzz14jANcrusbI9WTPNPsj9Qh8wMLvCZbiKULgAOEZ6u
	 QKcNViMZdrOLOWfvGEzZKNENKFm1J6gRO8b+1YMkqxIG7UYpp3N1JBkdBHwIUwKuAfaWZ
	 xwb9B7en9KimggsVa+ziTVYHsl76xUChDauZ+PgehZMiQGec+a1Xtid8F+hWosH+fzHIl
	 HXUeBNqPnINiAtCDEzCxbAgfXGKBOCZB9nEd2X8ACxSBLm1uz9e089H3nu4/hVfXHviW8
	 1ucFqRrdyYRZnbhe8G7a7bGU+ZG7ZJAW+wkOdROsi6zc4/AL5x9zPSH3YsHkaC0kP+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=SJnORjOz;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B53606A33C;
	Thu, 19 Nov 2026 11:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B53606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=SJnORjOz
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25344A1569;
	Thu, 19 Nov 2026 12:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795089253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kazK3jP8RDwEUVX6vo6nPdibxxigNipPp+bbhgW8KEo=;
	b=SJnORjOzxVOkNj9XFT4lFk4txb+eNozSdMBVMMvo2/vtEKzeT7xm0xRECwMqyeQSyshOBR
	rPQapNrtV7EVeacZcacTePAgXQnpEUAEMSm5TikTxACW6j0ZM2/NOZYM4sUPoD4gjRYMKr
	d2IpQe4PwtEOouDFTRs+p5x3tfvoQXrRQR2zB1+oxih1/DsrSGtdpv1UXpJ9M4/pBtjuhD
	DFoSxvUY7evP5E2kSI1Fe59kJCvx5HrmjZ+NyCa6Ki0w7AbQfF5BF2zqzWxBlbb/jPiLeD
	B4795bSEP4CM/6qSZq2bNmfqWvaP4DBaL21c2hLx3I3FSePDtViTjz8OJE/lkg==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 12:54:12 +0100
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
Subject: Re: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
In-Reply-To: <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
Message-ID: <cc50263bc4f161b2fff96e04306868cc@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Théo

On 18.11.2026 21:53, Théo Lebrun wrote:

> [...]

> @@ -3376,7 +3398,7 @@ static void macb_context_swap_start(struct macb 
> *bp)

> [...]

> +	if (new_ctx) {
> +		old_ctx = bp->ctx;
> +		WRITE_ONCE(bp->ctx, new_ctx);
> +		wmb(); /* ensure IRQ enabled below read the new context */
> +
> +		macb_init_buffers(bp);
> +
> +		/* Clear DQL (only on successful context swap). */
> +		for (q = 0; q < bp->ctx->num_queues; ++q)
> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
> +								  q));
> +	}

The queues we just dropped never get their BQL reset, not on close or
open either. So after shrinking and growing again they can stay stuck.

Maybe just reset all max_num_queues here and in macb_close()?

> [...]

> +static int macb_set_channels(struct net_device *netdev,

> [...]

> +	ret = netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
> +	if (ret) {
> +		if (running) {
> +			macb_free(new_ctx);
> +			kfree(new_ctx);
> +			macb_context_swap_end(bp, NULL);

swap_start() cleared TE, so HW is back at the ring start. Doesn't this
needs a gem_shuffle_tx_rings() like link_up does, otherwise Tx stalls?

> [...]

Regards,
Nicolai
