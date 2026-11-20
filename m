Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169833;
	b=a2aX+BkALLS7tWUv/9T+ixtxeokeGpiQE4Bpq9OrAF3LA8hHgtB/6yvdQ6SZ1HIHpsfY
	 ck4+dfsPv73BpvoZTip7Tynz/Fba3NaW7ZFbSO5PFvminNNUr3euNCOHtRHYfZeipLJ2z
	 /fmgo23mU1tlvqSB2qssLtHRiTEsj0mVFrD+OhzdhwcR6izReQjNHFneKMw/wT5Y+rmuc
	 L0oR/V3IxfT0CDZgEue1uuX/3udmvKH/idxb4my6O7SktPcPPsxYvdk9IieKcBwnYPwiF
	 /OZbdeE+6w1SNDdDv2JGDUgdTmvqI67TJoRnFFGEY6Y8creqHWg3PYQWGNFsMxOtPPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169833;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TxSFGvzroXMP1yCKj5gXKh91OPMqff9Hzouu/ZStk84=;
	b=OZEbessnhch+mJKUq+5Rqk2DW/hRu/xrfnXpjkE/bvSA1YQjl6XGDPVYDvtXP6UnPfUx
	 WMg0hj2hPlRjSu61H3QoId6E3a/uYD1/LPT3RVXoYCXA+o/j6qY7P3GYfUzeNJJ63515B
	 Uhs1MDgZlr9W4DaZ+nM9EH319Mr0oOuwm0nGNObayy96HR/tyExnGo6ZLeGIKrI4KzzwT
	 VCVpju/eLPZ6ohsQSTZOKa0o9GNOSJzCAWOohz53ZQDSKfI0Xity6q62LvWdZN/aq1GOr
	 cabb3IawJxOKfVOdjuP1Xh3q761iGFFd0VeL/OGwUi/YDsNA8js2hG6Qjyk00rJ39xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zLkDLwEX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s9vh6g42;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A253606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A253606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zLkDLwEX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=s9vh6g42
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxSFGvzroXMP1yCKj5gXKh91OPMqff9Hzouu/ZStk84=;
	b=zLkDLwEX8J6dR8052tprVYnIvT5Y/bvwq+gKm9NNe/Qxd4JR0GUoF96GKElPxFSVpeyfYU
	0Om8GyMjl/88JlsNI+ET/0xdbN4lRsIuS6TjUuiE5/2G2Jp4vG4QKMtHlHRcCJNUQh85kK
	roAmnEHlNkCANIpqdoQcbCP0hIPrrEfT0YyO/YXUp4E90xK5iUYgw0O7BwLdJC6oxlxCsi
	Vkwo6a0d57L6vxj1wpec0nALuHzKjhQ/wDo34spykRLEDOhOyLhlbX3ufQJiMwLy9n2/ks
	kFJGpJRQVzRLa7kXCLpETeZ2E44WXWq94RHx9SfIvXjP+G0tC5e8N3E6zeDxqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxSFGvzroXMP1yCKj5gXKh91OPMqff9Hzouu/ZStk84=;
	b=s9vh6g427ul6mWj5yZvaOUPwrw4aHWW3/Vj6ZOGw/xZG87ljNv9tbHBn4Y2R2z5Cb+IKV1
	yGD+Jo9kelwpxWAQ==
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
Subject: [PATCH net-next v11 4/8] hsr: Drop received PTP packets
Date: Fri, 20 Nov 2026 11:17:00 +0100
Message-ID: <20261120-hsr_ptp-v11-4-264c88f4f1d0@linutronix.de>
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

Receiving PTP packets via the HSR interface does not make sense. The HSR
stack will forward one copy to the user and ignore the duplicate from
the other port. The PTP stack is however interested in both copies since
they will have different content (due to different processing times
within the HSR ring) and different timestamp information which is not
forwarded at all.

Forwarding a PTP packet by the HSR stack is undesired because the
forwarding takes time, it is not accounted in the packet and this makes
the outgoing PTP packet inaccurate and therefore useless.

Drop all received PTP packets. For the PRP configuration it is the
ether type, for HSR configuration it is the encapsulated protocol, that
is checked. A PTP stack that is doing PTP over a HSR network needs to
retrieve the PTP packet on the original slave interface where it was
received. The PTP packet is dropped with RX_HANDLER_CONSUMED meaning it
won't be visible by packet sockets bounded to protocol ETH_P_1588. It
works for sockets bound to ETH_P_ALL which is what linuxptp is doing.

L3 packets (PTP over UDP) is not considered because it is not part of
the HSR specification.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 net/hsr/hsr_slave.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index 5274ba6dd36e6..a5b47f016abd7 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -23,6 +23,7 @@ bool hsr_invalid_dan_ingress_frame(__be16 protocol)
=20
 static rx_handler_result_t hsr_handle_frame(struct sk_buff **pskb)
 {
+	struct hsr_ethhdr *hsr_ethhdr;
 	struct sk_buff *skb =3D *pskb;
 	struct hsr_port *port;
 	struct hsr_priv *hsr;
@@ -44,8 +45,7 @@ static rx_handler_result_t hsr_handle_frame(struct sk_buf=
f **pskb)
=20
 	if (hsr_addr_is_self(port->hsr, eth_hdr(skb)->h_source)) {
 		/* Directly kill frames sent by ourselves */
-		kfree_skb(skb);
-		goto finish_consume;
+		goto finish_free_consume;
 	}
=20
 	/* For HSR, only tagged frames are expected (unless the device offloads
@@ -64,15 +64,28 @@ static rx_handler_result_t hsr_handle_frame(struct sk_b=
uff **pskb)
 	skb_reset_mac_header(skb);
 	if ((!hsr->prot_version && protocol =3D=3D htons(ETH_P_PRP)) ||
 	    protocol =3D=3D htons(ETH_P_HSR)) {
-		if (!pskb_may_pull(skb, ETH_HLEN + HSR_HLEN)) {
-			kfree_skb(skb);
-			goto finish_consume;
-		}
+		if (!pskb_may_pull(skb, ETH_HLEN + HSR_HLEN))
+			goto finish_free_consume;
=20
 		skb_set_network_header(skb, ETH_HLEN + HSR_HLEN);
 	}
 	skb_reset_mac_len(skb);
=20
+	/* PTP packets are not supposed to be forwarded via HSR as-is. The
+	 * latency introduced by forwarding renders the time information
+	 * useless. Userland needs to capture the packet on the original
+	 * interface instead of hsr.
+	 */
+	if ((!hsr->prot_version && protocol =3D=3D htons(ETH_P_PRP)) ||
+	    protocol =3D=3D htons(ETH_P_HSR)) {
+		hsr_ethhdr =3D (struct hsr_ethhdr *)skb_mac_header(skb);
+		if (hsr_ethhdr->hsr_tag.encap_proto =3D=3D htons(ETH_P_1588))
+			goto finish_free_consume;
+	} else {
+		if (protocol =3D=3D htons(ETH_P_1588))
+			goto finish_free_consume;
+	}
+
 	/* Only the frames received over the interlink port will assign a
 	 * sequence number and require synchronisation vs other sender.
 	 */
@@ -84,7 +97,10 @@ static rx_handler_result_t hsr_handle_frame(struct sk_bu=
ff **pskb)
 		hsr_forward_skb(skb, port, HSR_PT_NONE, false);
 	}
=20
-finish_consume:
+	return RX_HANDLER_CONSUMED;
+
+finish_free_consume:
+	kfree_skb(skb);
 	return RX_HANDLER_CONSUMED;
=20
 finish_pass:

--=20
2.55.0

