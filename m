Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075913;
	b=sMiJHE7MYI9EC5hdQppJb2aTynEqufpGKGVIQiCszVhsmC0UCoXtB4nMQkkQxXvrEG2A
	 ebiR3+J2pKH9BW7GVNvBLyv1HYKuj3lXO3+VO6XNh+a7p9MVfe+zRrmACsyDdfNi+IpMD
	 Q8n8XXzeU0cleCueIKj3aPynfz1Sihxx4Btm8jibQN5JxYIVF8ivinPRaXiqAraGJ3E/K
	 m9O3VER5tJh24DJ0mt/E5mRoxh6iCFEBzkbd7rbSuGjI9jaNNejHfxj98rhVolyq4I6eG
	 49AnRYuwxZ7cXr4i+e9MPatrNOOlOxhbhLRwp8/2+ln/ibYhwlGLjNjBZ+UFC6n0LLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075913;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=T1rFmIXI9Vtq+VPQvdEZbQO8ggDZxd/bsr8zkz4UqHw=;
	b=m4wy8DW91R+rn6bYyvUQAO6j30/W/LmrrYqwjoI+gIiPBiJrQ72Zu2QyZ0vBDgR/ABMN
	 kOS7kJu89bY/f4yLcoQCa94Iok9pbd5UL+tRN5yjwjYcywtqieDiCDzpn6PP6hy40r0zV
	 LZFK+yuTY8yzbWthF6RlLg0pxPhgXsg6LobrqRoIwL5RHgwoEFXD7wq8B+EE6rEfRxM0G
	 i7sAuQ+cL+3xYRbzDUVPZ+qCquGwc/D3MdWT3fPPEgTRU+TDWJu9EdlkTerKHohlTUBAR
	 yNdPCVtYuGtvZdmFaMRKU4ltx9Gl7Hlbn0TS1M2z0HxrFHR31pSPj3qU9hQ+UVNCJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Vs/BByUx";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DC606A320;
	Thu, 19 Nov 2026 08:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC8DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vs/BByUx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28853C4CBEE;
	Thu, 19 Nov 2026 08:11:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAE7B60237;
	Thu, 19 Nov 2026 08:11:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1866611BC2B18;
	Thu, 19 Nov 2026 09:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795075905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=T1rFmIXI9Vtq+VPQvdEZbQO8ggDZxd/bsr8zkz4UqHw=;
	b=Vs/BByUxQWYmKEspH7dZ1tXTNEwBQkZVLuxqCAx159QRR0DJeqhQ+K2W+HD+BEaydWWgV4
	EM3vl05cqVffuUy1S5b8rSupFrrWkZBnxYivhHEBFBYPSHq3E7g0ROp/h2LE0VsGVisF/x
	qLeh4+yI/xxR/RkMbWB5Nzs+NMKpNpJbNeN+IkrhBG1m7Zo47rpWfEBH81IMYKyJvp+kfU
	E2avhgf8OWtZSk6Aj1ZGwF5Ic+Qe+6BfnDL59nD6xuLEZs5cwha1tAB/0AUB+u/2lcHcId
	cK4Aq7GPW6EKNfjenlZ9r6rY3qNBq3awRx+s7Hi7lmBKsAF9gEaJvXFEjZImTA==
Message-ID: <e822871e-73ec-47e7-96e5-e7885e725555@bootlin.com>
Date: Thu, 19 Nov 2026 09:11:32 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac4: schedule RX NAPI on Receive
 Buffer Unavailable
To: David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, Jose.Abreu@synopsys.com, davem@davemloft.net,
 rmk+kernel@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com,
 luis.la@mail.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261117042754.96177-1-david.wu@rock-chips.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261117042754.96177-1-david.wu@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

You're missing some people in CC, including the network maintainers...

On 11/17/26 05:27, David Wu wrote:
> Once the RX ring is exhausted, the RX DMA enters the suspend state and
> no more Receive Interrupts can be generated: incoming frames are kept
> in the MTL RX FIFO and are dropped once it overflows. The RX DMA only
> resumes after software refills the ring and updates the RX tail
> pointer, which is done by the RX NAPI poll (stmmac_rx_refill()).
> 
> Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> enabled the RBU interrupt for dwmac4, but the interrupt handler only
> updates the statistics counter without scheduling the RX NAPI. The RX
> NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
> the RX path hangs forever once the ring has been exhausted.
> 
> Schedule the RX NAPI when the RBU interrupt is received, aligning the
> dwmac4 behaviour with XGMAC (commit 6338488356d2 ("net: stmmac: xgmac:
> Add RBU handling in DMA interrupt")).
> 
> This can be observed on a GMAC4 based platform with Split Header (SPH)
> enabled under high TCP RX pressure, where the slower RX refill path
> lets the RX ring run dry.
> 
> Tested with Split Header (SPH) enabled, running a large file download
> over TCP:
> 
> - Without this change, the RX path hangs permanently once the RX ring
>   is exhausted: the RX tail pointer is never updated again and the
>   DMA channel status register latches the RBU bit, while the TX path
>   keeps running.
> 
> - With this change, each RBU interrupt is handled and the RX path
>   recovers by itself. e.g. 3 RBU events within 6 ms during a download
>   peak, each one self-recovered (the RX tail pointer resumes advancing
>   right after), with no further RBU events afterwards.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>

In essence this looks correct to me. This fixes some real hangs, so
I'm wondering if this shouldn't actually go to net.

Please re-send to net and with everyone in CC, you can add:

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

