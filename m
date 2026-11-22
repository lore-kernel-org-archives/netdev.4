Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363064;
	b=0WHK0qARVM2ygF3uEPbP3IOWurW0Vcg3OqSfUalr1oSZXLlyHG74K/t/3BkSjQY8kfRB
	 RJ+xyGTNP2P/XxwqEvnPunb+cakbo9KYhwdlXjx5us0e6yR3mfZXI+BMEIfgVb+EF1Ivq
	 Si7iv/jpSgnoICojZZw7vx8SXw9twesFWCKeVUYK0gauP1ea8zpG9bzrV6QbMgoy6CkDP
	 79+PLUd5xWFzPS6TxJIO+1HEcIQiT3Jrrp1wf5zOteR3yIUy5Gfh585BEQbVmbG9GGnez
	 Rmt4AwmJRF+gD8vmnQqx7Xm3wX6GLWHRs61VVIQkse3GpG1Ovoivg7Dec5rAGmJ8JYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363064;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8XFKXyx1GOfO5xGIHtXdRmS/LrQDe1E2/0CLeb0IQjQ=;
	b=m8mspJuNQrqJdMp5Njw8fkUh8GMpfGW5tO3jETYMLCdkbMODk04mmkUW6cUAz+veLPZo
	 fgjrVcIFfJzdKlAEdojRnE7Xiw05twSxgCDpr7ZjA5NPAydawJFKHK2LPAQMHO8xtFNHZ
	 CVs5CZXDoKanTiKurotJP5UzM0lbz7CqMtEVp40/hcqnsFV4YinpbzUBCwSov/yaTDj5r
	 H/KLptnB5VhVFgHQKJZ+7GURs15XLpLIH6VUWz0nyJ+Qzg0oTHwOQAsYwx49cQuolRcDj
	 Uf2S5gmd5e5vi8Dp/+cNvy660PVccfUAeVXBtbU4FVe+HqVR+B4L1niyfv6zI7ffWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=QMoncX0k;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54C606A320;
	Sun, 22 Nov 2026 15:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D54C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=QMoncX0k
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B944A023C;
	Sun, 22 Nov 2026 16:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795363061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8XFKXyx1GOfO5xGIHtXdRmS/LrQDe1E2/0CLeb0IQjQ=;
	b=QMoncX0kbUNktHVsqC7SkFlEI0N7Fs7OwtUaYespsF20PTXAK/En3B9Grn0PPamfmiPJdU
	fyiTim553wM3e/omRjM8egf24MnL+jqrsVGGvR5cr0dfxM6tim/TvsWykJBV4xJUpyLWyu
	0Q4ACmWEPc0y/JvPdF1dSCXcDpsxIFjV9MlJ4ICjGykwIZC0QffHaWXo2HD/kV+fcU4RvF
	Xo5rx7fQ54OI1barIla3Nh8HUxzf+QasyJGERXkSf/J8sFm/XU2xARWNxRbZuXtVo7MW+Y
	uIbWXBkgFhGa/FO8xrS1koyBjqqY+Srk2amcMal6qoJaK1LipUr6mJ9/RDk2yQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:57:40 +0100
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-3-maxime.chevallier@bootlin.com>
Message-ID: <5eb47dcb49898e948968a54bfa992e72@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 22.11.2026 15:49, Maxime Chevallier wrote:
> The TX flow control mechanism needs multiple things setup to actually
> work:
> 
>  - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,

nit: finger off by one :) TC_FLOW_CTL -> TX_FLOW_CTL

>    this is already done
> 
>  - The RX fifo thresholds needs to be set, to indicate when the MAC 
> needs
>    to start sending pause frames based on the RX fifo occupancy, and
>    when it should stop.
> 
> Let's configure the threshold the following way:
> 
>  - Send pause frames when there's less than 2K left in the RX fifo
>  - Stop sending them when there's more than 4K left in the RX fifo.
> 
> This was tested in Allwinner H2+ using the ethtool -t "flow control"
> selftest. On that SoC, the RX fifo is 16K.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai
