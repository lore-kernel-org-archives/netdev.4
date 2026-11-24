Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515666;
	b=nTBSetwtGJESiBC9kI8mqxzF/U79C9tTxF0AFsIQjM9dIspD99+kbStDMfWtcFfyBUhm
	 EZZ1QAVqNvYIbuuNH6yp3CdNcmaPLGYiFckMgXvyYOYtVZQ8XJJPR7rVmB4szRnYQ/W/d
	 omfUWTDGFjDK+6DVdyOJJRWYGnLGh/Q7pVFPFXGgWKFoMkw/8Rx6PgGM1T4VmMw9ru7EM
	 q3hwo1I04XdGEtHgsVMTa5BcjJIKSw3A66olofe2MQ0Kr3pBUX3MNDXDl1ONvIxdpuMlR
	 bKWSOaGC081WWRWYCyxKydb1HngWli5XM1afPvHUyaDjYApjOx9vzxoJquva1nNXcSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HQJNSY1nkpSMl/iNuW0ogEKZ9TYhudYYGxH9oPNIzeU=;
	b=VNqbf4gOVO7TeafvvHcq/s/bsi4DEPcLGGXlm4D/jQbyYpQ5H/mMWsfn6c0O5BH+sz0H
	 EYD8HzGwn8gRAu3DxO3rh1TsqG25XA3tB2ZFa5V3W//5PLNFnuuJxHEBIKNhr7TiocspK
	 k7nk0PJJ8YgUAZorCUJ2C/48lTL23XbFySEwzaRGfOGtvLu1zIdqOCoE/w0QDX1GWYJyt
	 t6ni66Bls9jP2hp72oPgEF1X5C+EvnPQQdW+ah72FhQaD5yfLXPnUyIG+7RU6NE0+bpNf
	 7X4c91/pJ9aLwgQoVg26OPOi42wi1xHK4hVSCNlZlY3S7lY62QTOYgMnV4y/+MB0KPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XAZv0uc4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A5606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552A5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XAZv0uc4
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5EDFB2020DC;
	Tue, 24 Nov 2026 11:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HQJNSY1nkpSMl/iNuW0ogEKZ9TYhudYYGxH9oPNIzeU=;
	b=XAZv0uc4oTNbEz98QuLVJTGIFWonNbe7sOeowVrDBiZkmaiATozPq5+wi6myFYrn3EmG9d
	e01vDp5UaEvSj4nInTrPkNYRonZQGAo/W+VIEOHJaW8YBB4gfvwSrCExHAK8wM5z+UlpqS
	0ZSvB/ju93OUiQRrAqbbYz81iYeoPqOiaJ4S0Yl1oWr63QJJr94h6iyH8VcEi3kXhq1lWb
	6GKVD8urdMhren371brlywQ8j0AAahjrkoBBLhEp0Fl3mKRo5+/RVIS+TkiCz8HRRKkO6Q
	f+dGgNP+MaAW4bjnzBUTBaBGS/YxHHY8q7wVbP14hCeYfsMVE3bAtAuxk1txXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HQJNSY1nkpSMl/iNuW0ogEKZ9TYhudYYGxH9oPNIzeU=;
	b=aRUPJyeBbKecIA6WDjAU0SW103ykIlmLyO57+FA2M60O0xt3aUHi62L/kuc3tJpI/yHye1
	ZVCO7Yb+j5Cl9F1ekP+MKH57R1s9KHmmTjrDJFPLFhA+cEDfIrnirBK6OKohx4GFEK61Aa
	Gm4QJwC48U6ueOLsYUR41+BrRzDvQYT5zwz2SBgVBFadptvU5iFddbKqBYkZJ6pHvp2xju
	eCXWpSdM4+DtjzXPrIVXBalnCqg6hlKYxOH87RUWSyzVnHbmmyKZgfDsH2k84imyH4YBwH
	Ti9tnOxBI6noU5Cf6VGHbnqPheIY/lHUGJ4/vvz8fqonIU0Cs1mC4xDfYnuutQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795515663; a=rsa-sha256;
	cv=none;
	b=B36PCGuqtYBmWoTotejtCvUDj4TuOs2iDMxynYATCqTLtey4+OCVfmAowKZEHWS+tr6oBk
	JhBsaEqCckLAogZsec9LSmc20BxJZskK2nXEJ8TpqhtLfYsvGy8CEyHLfCE/W+mEvp4rtd
	PxyEgxPhxJJuvfonB1XQRZZp/cgxNbljYAwm2KlSH7bgIkg3Fvu0DMEPBDchKZYo77nri3
	cdIjBvJkOw0CA3VxCdNrWSw36SGIRqbNXrwcfymUmHaSeFMe4WZ+/j+zx2nlSVjefAXWU1
	lUGREL8PU6RxdCtOpm/OE3Hddzd0qY86SJjDmJf42o7WmVqZQIP9zEUGBJ0MKw==
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 4EA9D380A74; Tue, 24 Nov 2026 11:21:03 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH net-next 0/2] net: dsa: realtek: rtl8365mb: offload ETS
 strict priority
Date: Tue, 24 Nov 2026 11:20:49 +0100
Message-Id: <20261124-rtl8365mb-ets-strict-v1-0-6ab01ad545c8@pengutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFlBWsC/zWMwQrCQAxEf6XkbMDs1iL+injY3UYb0FWSIIXSf
 3cr9DLw5jGzgLEKG1y6BZS/YvKuDejQQZlSfTDK2BjCMQxEIaL68xyH0ysju6G5SnEkioH6NLZ
 M0KYf5bvM/9srVHasPDvcmsnJGLOmWqbtdne49bCuP9K/D8aQAAAA
X-Change-ID: 20261123-rtl8365mb-ets-strict-113214ad321a
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, kernel@pengutronix.de, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

This series adds strict priority egress scheduling to the rtl8365mb
switch ports.

It uses the ETS qdisc interface, which is enough to express strict
priority. By default, the driver sets all queues of a port to weighted
fair queuing (WFQ) with equal weights. No queue is served before
another.

To enable strict priority on a port:

  tc qdisc replace dev swp1 root handle 1: ets strict 8

The qdisc must have as many bands as the port has queues, eight on
this switch.

To go back to the default:

  tc qdisc del dev swp1 root

These commands change only the egress scheduling of the port they
name. The CPU port stays on WFQ. The ETS priomap is not offloaded. The
ETS patch explains why.

Tested on an RTL8365MB-VC.

---
Oleksij Rempel (2):
      net: dsa: realtek: rtl8365mb: default the egress scheduler to WFQ
      net: dsa: realtek: rtl8365mb: offload ETS strict priority scheduling

 drivers/net/dsa/realtek/realtek.h        |  14 ++++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   8 +++
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 107 +++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |   3 +
 drivers/net/dsa/realtek/rtl83xx-qos.c    | 113 +++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |   2 +
 6 files changed, 247 insertions(+)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261123-rtl8365mb-ets-strict-113214ad321a

Best regards,
-- 
Oleksij Rempel <o.rempel@pengutronix.de>

