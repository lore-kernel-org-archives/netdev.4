Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169831;
	b=APWd6VJwVXROdW1Uh0QNsctzhMvN/emNQ9QsRbsmHqqyODG5VvTGDuDAqjpd5JfAelEP
	 PAdNGFEraOEr4N0b3RMrDGA75oWa5emWzFemNYsWkHssUy1pTmP5Cn80c5G4q7SNo+I/V
	 PHxTLS+uoVxMX9f0BqmX493w6MUjJIf7SOaA5BxCk5QHbg6tv3U6EV7GQJWJQ5489tulZ
	 WfZASDDQ+PqdlNk+A2R25LPAv2EVU+uOr/qRstvJOzWphmdMHU9G0pGI5E3La3twIbOyq
	 0x9xBMf8hL40YcDNffK8EH2ZEwcQJ3urzybWK+D5JmMTcBtoWgCplZQwQG/DYX5zpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169831;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=K5cy4h3W0a2XMceZBoJ4TIOdR4CNM1Z0mxy0yGdX6lSiIznhVM+csqSncwqWcMYuElSS
	 Yf6r0NwANsQdK1qbI2hDt5kEvwpz2QJuPozlws/LNaMNAu0ZAWvasKfTkfE+O48VFqVYw
	 /Y1H9gpXIDE8vUuDlNgh5XWlPaHXd8oejD9vaUXuV3QeVUR0LFX084KQPi8kZNVwxobWE
	 qsOQYIrPJA3Bs8D76EUyaGnqu4Kp39iDU+QQP5zjgdXUH60pC/2E8IxmfmMrmP2dnQz45
	 9FhVHHYAUm+pS78RmtcVGWBQS8oJ95q+pQtrKJv/0hfTz3onzPFnJ9nLKL5Gf3AJBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VZwNsu3S;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="ME9OHT8/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD76606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD76606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VZwNsu3S;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ME9OHT8/
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=VZwNsu3SvG9TWrUfFUblHZPXbii2SukkkcX5YNY/H4DxI9R54NkspWlDRn5y8mljB/4vbr
	+2DHlqkYfYUalBdwaYmnlvvcwJWiHHDNflWU85n0Yf8AxF2trcAyKuq0HlSOZjnvDAFyW8
	kEfp7iPPP+jzjPQaE5JINtK54LhkI9SRzRw434VsXYjfgF105BlcL844T+xAAl9WMRyjhn
	sBD8UKfvMI9rIh8lcvQhlGKwYqXkmX/r0ETwUWIMGxASWqxgypmFM4SRUpuondof7tdJ/4
	lbjgB3lhoOySy9dGG/XjsT8h9b43bPBNu4eJviGJM/lhOk4Az7quYo9/ryxKnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwMJLSwQi5QgKmuoaNuJE5cJB35PRmK3VezLpjLxHZQ=;
	b=ME9OHT8/ZsJvVc0GFoqWdGLPdj42dmsn4Y+IB5tjjZ+INov0p6jJ7ZF6n/UeyU0jrBnkv7
	iE+/bW/8sj90onAA==
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
Subject: [PATCH net-next v11 1/8] hsr: Add header_ops::parse_protocol
Date: Fri, 20 Nov 2026 11:16:57 +0100
Message-ID: <20261120-hsr_ptp-v11-1-264c88f4f1d0@linutronix.de>
In-Reply-To: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
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

