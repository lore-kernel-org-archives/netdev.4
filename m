Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363135;
	b=mbkInLaG/Lk+VZ1melvOqO7Qcr3dLN97gv9hIU8sfBa4vEJteO3I+gRbMr6F4oRxgta1
	 /3fbDsy5tWm97iQycVEse78OCbiCsDD/bSeKH6dxNU9tBi97zsh545He3QihGSzuM6YE7
	 uTWFwUIDuAm4Ag4W1IKnVcH9TAJC3ZeebFZz+sBG9g4kl2ImbVgCIwMepd+ct8xAzhwaj
	 nSoMBGU+IYJLoqA1eDnwY3vGQdwxje0zSE63otJngYbPE0Z8WgkQ43jBFFLsVDmvj87s9
	 0rX2DPMkkbqQuQ0Ysqdai/MMiUFAV6MuCGZgACwm67DX2ZN0vdclL0Mtrkuk+znAX+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363135;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=;
	b=t/yw15XuQzSQr0sXHb6dRTnhWlhcuB7fbtJay5cUa+3pgzI0p857iehDqXvl/Zanvf4X
	 7FB//BH57X/LXsHzm6wjxAweyb9vucVuqhi/2PVq5zfVhU0BqcK+ADeLdV2taV/LO56hN
	 IfHU+aILYyxGlAVo4y3uN6n7xUsDQxUU3hvOnWq0L+ham0hUX2VTms5Ggo+S+uVJzmXjW
	 wNE8QmQ/5mc27RZlGyHlTafJQBLx8p+jXSNsPOoLJnoQMg/bl2Dv3EBxMR1tW61T5mx+h
	 0QwIDty4TfnmymyAd2IBu6VgGNMRGe64wyj+JpzVHfKjuOthxz7nU3d6/znCNOcahPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=4lEXrQEZ;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F0606A32A;
	Sun, 22 Nov 2026 15:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5F0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=4lEXrQEZ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDCFCA157F;
	Sun, 22 Nov 2026 16:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795363132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=;
	b=4lEXrQEZxrDyggcU/gr8xHKxGVKEtBXm1KE0CHNAsZYYAe/yR2fdv4/KxoE4PJ68qCUiXm
	Wa4EG6gQKhKJxwyZpZ+QoUnOXHVAW5F4vWj9bWStOh5lJuEDkbrlanXdwtymvXf3L+6GRr
	Kf4MwsZ8vOOOmiQkMfXojWszdw+UsV+U/Mc0AgrZ3uRwtGRkVLkL7puxG/UNUx41R8b2rI
	g91ycEdcDiwywkh6YNgR4TZ+dDWT3p8nSyoOd9gkKqEUm6qiJOU1DgrAm/EEef4I3Ixjt+
	JLvv77ElSVKk5bOkN/lhdekg+MCORQ37dldz4EF0vA43W0RYLrPh57DD6y92oA==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:58:50 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: stmmac: dwmac-sun8i: configure the
 pause time for TX flow control
In-Reply-To: <20261122144926.284857-4-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-4-maxime.chevallier@bootlin.com>
Message-ID: <19a0e0afd9e05731bbba69b6d765bfe4@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 22.11.2026 15:49, Maxime Chevallier wrote:
> When sending pause frames for flow control, we need to indicate the
> number of quantums the peer should wait before sending more frames.
> 
> This is maintained in stmmac's "pause_time" global variable (it's a
> module param).
> 
> Let's program the pause time value, and also allow sending the
> zero-quanta pause frame when the peer can resume sending traffic.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai
