Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179423;
	b=wtFT+Sb0tK/OMIHtkwAdKlNQIcM+v4DFnU4Q0ZRqH5C8Z6s6WzVnSknJ9Ufkmafd2YQx
	 9AG1TAyjCMt9fBgQ1m8dIqa5K3gsU64AfPZFUR18+K42koC5Wfajfw5FQ/7lKKxlMdiqk
	 /mOpxs+noZO/80w9o0XSrCXu3nP4hdReLVeNISLobSqNU/XFFWm+4Vj6jNw1P8qepy2p3
	 uKreGBWwufiTXlUHmSmWt2qx+q7nTuVz8fN9SLcjMlJ42sobBRixHkPJjUUtyKZ3uKnvK
	 mLowfaGaR5BUalamC+bL/UK8bewNowA5sCc4Mfbm4pAePooNQhMA5jFnAhsI8Y7m6Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179423;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1D4i2u+zj11wzwgrpmYkCVgcifVwVVgQlGiFW7E5/MQ=;
	b=Cs7xUkeXDhQB3fD+IFq9otAXWvk2cQSQYDYogP+VyBKxUKJH1/JtY8ydWmwJOGYVR6Gu
	 m5K7hyfIhQVVqK4qsvOJQR1oPdgqtkPKOY0/4GgAP4RDdnwf0ZBoIkldWKMg8CV6E6rgn
	 lEMZyRX683jCB8TScPFHGRx7F6tBtUsuKjI9/T8RjF24v3bO+iqDedizOWCRuRoCZGTca
	 DSqO7+zZC9vUJ6doYr+2p+WChW8tok097IWr4bRjj57vRodA32WK4K/a+ZQRKPX+QXzNC
	 LghyoJ7XFMd7oVmcHgEtBdN+bHUVHe+IvAwX7N2T7r3QMW+T81YtSgMyd0OIhMCQBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=uN9uLFcy;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713EA606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713EA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=uN9uLFcy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795179430; x=1826715430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xWomUPti9XlWaBEJvdlfofiRPghVu46Ck544Dqexf8=;
  b=uN9uLFcy5ib8B+7cWunwwPSlrDKUOAAxWBd+ywLeA84ZeOonMrOcLLlN
   3gy+ID/0+plulm4O+oABSWCz0l9axPAjdouV9z5U9EfpoKbWC9kR/v1Hn
   1T5Ds5EjVaWhytI0DWwV7FM/5shJLtdd1UF1Sdp4T7NO8FoyLHtkwZdyp
   ylr0ih92JP8XZ5UxSVSuIp0zW+5Qz8a3Mv3CComPa/3fpq02YZcr3ZyXq
   TQGUf2FSk3jkI7igVu1k+tOYagVN26VaSVuw/ZMS6CvB/qlF0cgx0luRX
   ZfjNidyiKA+Z+vVo/rXBERETh+yaXBI1JK/2tqELExYb95TDfGvu7Ko3l
   g==;
X-CSE-ConnectionGUID: 0DFwHNflQmedJC3QO/9K5Q==
X-CSE-MsgGUID: RXLHOPIxRZidoQuN+5CxYQ==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="233873991"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:57:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 05:57:00 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 20 Nov 2026 05:56:57 -0700
Date: Fri, 20 Nov 2026 13:56:57 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <netdev@vger.kernel.org>, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>, "David S. Miller" <davem@davemloft.net>, Felix
 Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Neelima
 Muralidharan <neelima@ti.com>, Paolo Abeni <pabeni@redhat.com>, Praneeth
 Bajjuri <praneeth@ti.com>, Pratheesh Gangadhar TK <pratheesh@ti.com>, Richard
 Cochran <richardcochran@gmail.com>, Simon Horman <horms@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Willem de Bruijn
	<willemdebruijn.kernel@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v11 3/8] hsr: Add a magic header for sending PTP
 packets
Message-ID: <20261120125657.zd6njkjmupwgtpa4@DEN-DL-M70577>
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
 <20261120-hsr_ptp-v11-3-264c88f4f1d0@linutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261120-hsr_ptp-v11-3-264c88f4f1d0@linutronix.de>

> Sending PTP packets (ETH_P_1588) via the HSR stack is pointless in its
> current shape because the requested PTP timestamp is not routed to the
> sender. It also needs to be distinguished on which port the message
> should be sent and whether or not a HSR header should be attached.
> 
> To pass this information, a custom header (struct hsr_inline_header) is
> introduced. This header is expected and mandatory if the ether type is
> ETH_P_1588. To avoid any wrong usage, there is a magic field to ensure
> it really is the header.
> 
> The inline header is just prepended containing the port and header
> parameter. After the header, a regular packet follows. It is ensured that
> the inline header and the following ethernet or HSR header is linear
> and can be accessed. Given that this information is important for how
> PTP is used, PTP packets missing this information will be dropped.
> 
> The two retrieved parameters are passed to hsr_forward_skb() and will be
> used later.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
