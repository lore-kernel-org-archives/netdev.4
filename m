Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617166;
	b=eOv/A9PSe3IrYs+u/NTQgtUwKTaCBE6N+34iZuPh7GF5JZDJxwnd008kpdSoD7Kbt660
	 WzUkn0uKKBuhg6YcVcMncocWspkLY5J7gGQevodQA7k/u4jFKp1cO5DV64NpBLgZRgX1P
	 2SST/S4Lmzz9CDnZdSoiYba6XEiIrXOwthKP1cdYo+KEkfuNLEAiX+RmZ6mhKb31sJyl5
	 OaUqRzB6+irpMjfXbvK60p+OjTiuBeQXi2t3JLo6lLpb1rr3kdRzLTq4TXQ2try02wB2T
	 TWTDRyXK+eiYuJDaIoqzFcoins8cbjA4nikFsU/g7EGuDFTLkgcutGjuTVDSFj9oeGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617166;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=GukupxZ1RKuvCzgloFIj51PbZSCneRS5qLgIFCYSQRw/YEWLkzSVJB18dA+S72WTVanz
	 QZvPJrlH1uBL1kKRBrYWWkGkRQd4p5QeEGWsXIXSgPmkFcVdku4TqNdlBycZzmSU0ROBP
	 iOYvuUx+/OfpKDpGcz84/IoNKGmrocpOwpGsj5hpRqhD6VR5/tRlwFiLAFbvvV4alIJuG
	 AEPdNww7W29//c+UITR+KerstoBknjgFzAkWi/1ZbOOaTlKKusbLzzg27lw3X9l2cj831
	 3IOF5DbQ0th1NFM4nruWMcUrkyGkVO9HctBGoFeCfKjOmMSydTKYDD5CSwFwS5ObJ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z7VY+lxT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eXRtCGt3;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF6606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CF6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z7VY+lxT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eXRtCGt3
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=Z7VY+lxTsyvBZVgPuTkWWTasYcVXNzWHnSiUUsOq9yyMyVen+cFtigN/CBtSzwEZjOZVwM
	KYpxsxbVWi5rfs52m2iwMWrrA/6S7a+hWEj05Hf1ikxflVW/FZq36ZofaNhxdpfhq3VgOq
	6FmlrHZqX0FXrQsFir22W2iijj3DErcHQ1p+sCpj3sdWvgrgRI0J6FmGIHSSKlvFDbU/1C
	D7kEvDer56AHE+N1U1hV4MNOfdvWM+Lvl2TGm7h++P/gfSe1E4kKKwk2RGQZISUQqz8XgT
	G8o1Wf7ySpRniIkuV/QotwpZFGncFceKVMUIqv9HF+hGKvgpJbKRj3kK6hwhLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=eXRtCGt3MCv2dPZNYGerkp4UfMAZt13i69QzyzppNHh5CFKv84evjmtD1OmCn8SRwlKf+e
	JwmuYk8PqDIG1OCA==
To: netdev@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v12 1/8] hsr: Add header_ops::parse_protocol
Date: Wed, 25 Nov 2026 15:31:44 +0100
Message-ID: <20261125-hsr_ptp-v12-1-9ddd2a73cb90@linutronix.de>
In-Reply-To: <20261125-hsr_ptp-v12-0-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-0-9ddd2a73cb90@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable

af_packet uses dev_parse_header_protocol() to assign skb::protocol.
The hsr stack does not assign a callback so the field is assigned to 0.

There is nothing known to be broken because this is missing. Having a
callback assigned makes it possible to use the protocol field later in
the series by packets which originate from the AF_PACKET interface.

The header used by the HSR stack corresponds to the ethernet header for
the "first" part so the protocol member is at the same position.

Use eth_header_parse_protocol() for the hsr_header_ops's parse_protocol
callback.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 net/hsr/hsr_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index fc512204600cd..59df647d2fd45 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -247,6 +247,7 @@ static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, st=
ruct net_device *dev)
 static const struct header_ops hsr_header_ops =3D {
 	.create	 =3D eth_header,
 	.parse	 =3D eth_header_parse,
+	.parse_protocol =3D eth_header_parse_protocol,
 };
=20
 static struct sk_buff *hsr_init_skb(struct hsr_port *master, int extra)

--=20
2.55.0

