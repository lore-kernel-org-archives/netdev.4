Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370655;
	b=3xEUGYrU7RcFaxQaOBQq8MD6VGAMXE++iYG5ErM6bBdfDTO/C7v2H6js4nc8AYGzcIYR
	 1YjIGAiUzrJ8A6W3DnrWF3YfNVbMcBpxj+12Is9NB45G5uNRJEC66St6lEoTMW79NSmBL
	 JoLa0xJJhxNguZx6EVdQOQDh4iK/uVax1wkT3aIh6AvEcBaJJty/TKIKuYyQ/KvtdRqAb
	 20YCtrf2bCXG9uiqPMJI11zxjZtk6fCS4WIbCz474eW/8fXHGTSOdeqlKVFdBedWsue7e
	 rjBCr1L5YUuYjuPHDiXfBoFy+m8QM8Pn8mFI0Kgh0QJ9Q1MHhS8qzKPLQT+6b5UkA4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370655;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=6Lc651tZw591zP/x8gbrBWohPZ7rxL+7CL7hNZTGcfE=;
	b=Igag3T0dOURVbK1kzaIX6Yc3lRQ1AmjhQQRnomPhNiD92H5a2nKuRhUL40flfuV4Juct
	 qFicQquk+2esqeg9fbcH85/NeTqz7UtogzZ6zoJIhCP3+tNh+P7VnnoNmxWf+Kzn1gVlt
	 q4MiDJpldSv9DdHpGPDYmiTRE/kx/MgVrl2qdtNrMRGCziedkAlUk8dFTPaZFzSBhgwni
	 JrsJuBdujfbwMt+pQycuKTcHBQZtGpG/4XwB4uEiynOrttu3M6i4aQ3hBGkgRMNmTBxJj
	 KVtnhIzijSeUbtUJgGJNiz4Fx+z7HbwOssW3BpyTZ6vZd/zdsVrvvcD3JzEeIQmGnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=C8Aia4O1;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73A606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C73A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=C8Aia4O1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 571F7A1583;
	Sun, 22 Nov 2026 19:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795370653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Lc651tZw591zP/x8gbrBWohPZ7rxL+7CL7hNZTGcfE=;
	b=C8Aia4O1UzdCosPUW+fBV5O/aDX9Y9p/gNu8GbiReBroU10OujAbziYi05tijAEWDD1awz
	C+wIdv1qHxnv10+jIO+ZJ78e5tXY+JyGuPwwNnDxYeRiGjj2blWl/ucuLCjptUVJpDRPD6
	IxKPiBFkpc3xMFcy0PoF4ckbV7EmCCU/sTZehnAH4k5tFVUr437CJBydvgQoVTnT+n9tMD
	WYD8/YMBmb6WlDWTFY+TTUwQgGLrY77xJbBYM6rgQMiCgsjXKYudFxQq+c4pTwGDitZd+Z
	N2A1t9Jy9hWFzu9FQh8MmMRXjkrIpLajoC7p5eMbxpFcpkpLi3x4IRkhc3ZLuQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 19:04:12 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: maxime.chevallier@bootlin.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH net] net: stmmac: count XDP_PASS frames in rx_packets on
 the XSK zero-copy path
In-Reply-To: <PNYPR01MB11444552E41C2B17A992492C0FD762@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
References: <PNYPR01MB11444552E41C2B17A992492C0FD762@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <76eb00ac442816ff06e7b9d338d9bf1d@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Anandu

On 6.11.2026 07:12, Anandu Padinhare wrote:
> In the AF_XDP zero-copy RX path, frames that the XDP program passes to
> the stack are handed over by stmmac_dispatch_skb_zc(). That function
> increments rx_pkt_n instead of rx_packets since
> commit 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics 
> where necessary").
> 
> stmmac_rx_zc() already adds every processed frame to rx_pkt_n, so each
> XDP_PASS frame is counted twice there, and rx_packets, which
> ndo_get_stats64() reports, never counts them: on a zero-copy queue
> rx_bytes grows with the passed frames while rx_packets stays still.
> 
> Count the frame in rx_packets, as the regular RX path and the code
> before that commit did.
> 
> Found while testing AF_XDP zero-copy on an ADSP-SC598 (adi-dwmac,
> 100 Mbit/s link): rx_pkt_n grew almost twice as fast as the frames the
> MAC delivered, while "ip -s link" counted almost none.
> 
> Tested on that board with a 6.18-based kernel, whose zero-copy RX
> accounting matches net. An AF_XDP zero-copy socket on queue 0 received
> frames of one EtherType while UDP traffic was passed to the stack. In a
> run with 60 s of traffic before the change, rx_pkt_n was 1.88 times the
> frames that reached the driver (MAC frames minus RX FIFO overflows) and
> "ip -s link" counted 55 RX packets. In the same test with the change,
> rx_pkt_n equals the frames that reached the driver and rx_packets 
> equals
> the frames passed to the stack.
> 
> Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics 
> where necessary")
> Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
