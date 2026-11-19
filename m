Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088735;
	b=NbmPTDhgk5i6E+BY/Rtlu83hzk7YdPkNNqc0j7ZTXQ7D6xjpFtYYnArN1SHUFsDFi61h
	 l0Ni8RLbr8KMqUjbwthHMoOEwqh0OoL0T6prjmK3YwU3shHquX0AtLv+/u+9UVt4bKeqJ
	 NlzL7CLZKWNuLleguQXlM3U6DYQvPkUx9pR7MG6fHPA+vKn6Zys2+pcqRTktGeHDceS+5
	 Gy7ljn+j3667+HTHBVp4mW1ZlXd+FiLejXkKb+Zy2eRzLaTXJiqh5M7YbenrR25yN7yqX
	 4KtlBxKysU1fJinY1rGU9DeHZBhFUBe6XNH4wVM7vlZRFQHzlvzytxhBH7K4LbXzEZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088735;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=c0AK16xIDz+yTGPTst3ZRIWhZrisEyg0sJy7pHkhxWE=;
	b=kKuXgaKqdLHzaqqLBojCwwrscI1QV5X5s2rfd45CLiGt4NENTTxiAs0s/lP/kXmRdspb
	 LlI7kpjDRWcoHUudizKqz5wuGPRgafDY2dL28PimCfNU01+tDIkqFS3F2BE+7Ko/TMSGu
	 9+Z6NW8EsiPFqgBvu0rP+b4sj7HvM3R773Y/ZBnIu9OZjr+5pCU6YFqXZUG29wFHQacQW
	 u0lTBes5ks5o1f3vjdSvJkRknQaA4PW3kpyc4GB38bYeEsYAsnKo6GjjyNcfmcmenPPyi
	 lMuvLfoQHyRTMTql+kHCGLe8NUd7UKsAOD0Sum77vMcrcENFEIihSNnZ7E/N0t6lSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=i2XsJQwU;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210D606A332;
	Thu, 19 Nov 2026 11:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7210D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=i2XsJQwU
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E601A11AF;
	Thu, 19 Nov 2026 12:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795088731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c0AK16xIDz+yTGPTst3ZRIWhZrisEyg0sJy7pHkhxWE=;
	b=i2XsJQwUCRIyMeENphjxm6geSS+Gq3m/WCKD4V2/gDhsPLIA3BMADPcK7T/Gyis1G6m+TE
	Qzt0Y4204Bmkc7uGHpNSHOsUVl0rwH4wmMtB46m91KyweDCzhbu8CY4vIRuIIeETcBJmlp
	2nTBbvpdr5Nhmwpe0OauCRYstBQ1xwGzpF17Y5x4xkh/nXA5Vq/8G9mZmcGF/Ohjk6kwVq
	tDQD2sIJNHSi4D6VhaRkDe0f29SgVmAl95nu5CE20cSIo6ETLkpmqeUd9kRNObZiF0tgAd
	aTxVodNzeHyuBX6cT+DnUp2OSy354WdNdzb/9FiuBiCaaY9oLw0Tm/Bl6stzrA==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 12:45:28 +0100
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
Subject: Re: [PATCH net-next v7 3/3] net: macb: distribute evenly Tx SRAM
 segments
In-Reply-To: <20261118-macb-set-channels-v7-3-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-3-2dbc00f686af@bootlin.com>
Message-ID: <d594eb9210e2c9a31e965a47a2d5224b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Théo

On 18.11.2026 21:53, Théo Lebrun wrote:
> GEM has registers to configure the Tx SRAM segments distribution across
> active queues. The reset value is appropriate (even spread) but we need
> to care if/when number of active queues is modified (or if we inherited
> unevenly initialised hardware from bootloader).
> 
> To distribute segments, we take as input the number of queues (current
> context num_queues) and the number of segments (found inside DCFG6).
> Its output is a number of segments for each queue, formatted as
> powers-of-two. For example, 2 for queue 0 means it has 2^2=4 segments.
> 
> We define register offset GEM_TXQSEGALLOC_UPPER which is never used.
> It shall be used when an IP supports >8 number of queues.
> 
> Note that the manual mentions explicitly that only active queues are
> taken into account. So when we write 0x1 in TXQSEGALLOC and a single
> queue is active, this means we assign (1<<1) == 2 segments to the
> first (active) queue and none on the others.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
