Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169831;
	b=bCk9uCqM+vZlJ+vN5xShCx8L53xyl89UYqKD7DYRO36UawaSS0pLtb5zn75lajQiSCVK
	 L5WHbCrDJBD6XHK1psMcnn/yUp/t2x5wugO29pqpN2O8mRkmc1blcb5yf7T+LlDtN7FcF
	 fXOiPXWNqP5LpMHVuJJD9ggUSmta17oV4Ouil4wrSgz0iacnvBPippIBfDxx1jv7fd3s2
	 ufd2bd6vW3QVQ2fu1uCtOLUFXmEomhNs6WCxu0uKpJX3QEZkoAUQXE69ikIjol7UffY4J
	 0/ZaqfPqzRaHkX9E7o3fcS5rxPxR4BRQBAscwDhoDPhxok7gI9Eq7CX6M5WgecTeVig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169831;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=4vXzHd9jg+vNGBnUba2NYwFgE/umXf137Uq6eJ/iOVLNJ18fj7li00Q64vrU+JWDQKGU
	 jIoxhWDhDXSdH7tbYmGT4WA0U4e2bmnHfqxe3/0OCG7CIzF9ncH156TCol1KpTuLwhC3q
	 9orfRmSJAEKSY3NYDgR8iRMtuhdH2hRAikeM37aKWXpOoKveZaUTWO9Frq96tQc72SQV4
	 Ef8Okcn/MpwaZNogE1fCwq6/yjs+JEiI0UY3XnxWYSUh0BkoymhbkC0rLYSgN+JJ/kWCh
	 35GLkVzHYo/VXuxJiH0gsZoH+EAe8x2JoB+OPYKwNDZ6nXj/DlWI5WybUpTeFwabfpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L2ecgBV8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=u6MRp2dg;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62613606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62613606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L2ecgBV8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=u6MRp2dg
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=L2ecgBV8molpFNj/yMEFLH5y+UgTOyKxBBsxm1m/jERkUgDLL5FJOpqdHI3zYVkp5Au6k2
	gTo/ayK57UXZgJfdBQmJr3yhlfvIi2gb9QqQCxcc2kAV3GGVsHkQbraFRiD8UQNRlIdLO2
	ek8FmFHZZi6QbiuEvNcofoSpNhbXrvtA5Knrew4hpuQp0aE0kvZCMn5aisVtLfdvtA8mNv
	tLb3bXjoURoYEFAfXQahjxmZLZcvl8l5Y6pLjHim4ZYO9nFBBbFo6KuJndn3mo8ispdZHy
	MNHJa7Soipj2IvnLKcoglD+Ocjg4zyLFBhd5jSnPnOMazGrf99+tQdNikPSnFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=u6MRp2dgQpTkNIP3BHQkV0DGU1ASYD07HRI8zfpResiBKHIY93o2WYnsTfOUDVknYdRhTK
	VJSOU1GGkj3OIbAw==
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
Subject: [PATCH net-next v11 2/8] hsr: Use skb_clone() while adding the HSR header
Date: Fri, 20 Nov 2026 11:16:58 +0100
Message-ID: <20261120-hsr_ptp-v11-2-264c88f4f1d0@linutronix.de>
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

hsr_create_tagged_frame() creates a new skb where the HSR header can be
prepended via __pskb_copy(). This does not copy the skb_shared_info part
of the original skb so any timestamp request is lost.

An alternative is to use skb_clone() where the skb_shared_info part is
shared and then skb_cow_head() to make the header part writeable. This
avoids touching manually the tx_flags and tskey members.
Using skb_clone() allows also return early (after the clone) in the
offloaded case so this can be unified a bit.
The clone case does not need manual adjustment of sk_buff::csum_start
because by using skb_cow_head() the head does not move relative to the
payload. Should the head need expansion then pskb_expand_head() will
move it and update sk_buff::csum_start accordingly. The clone also
preserves metadata (if available) so skb_postpush_data_move() is used
instead of memmove() to move both. Finally skb_reset_mac_len() is added
to set the new length of the header after expansion.

This is a preparation for PTP handling where timestamps are requested.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 net/hsr/hsr_forward.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 44f6d9c83180a..b183358207506 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -331,7 +331,6 @@ static struct sk_buff *hsr_fill_tag(struct sk_buff *skb,
 struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
 					struct hsr_port *port)
 {
-	unsigned char *dst, *src;
 	struct sk_buff *skb;
 	int movelen;
=20
@@ -342,33 +341,40 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_fr=
ame_info *frame,
 		/* set the lane id properly */
 		hsr_set_path_id(frame, hsr_ethhdr, port);
 		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
-	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
-		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
=20
-	/* Create the new skb with enough headroom to fit the HSR tag */
-	skb =3D __pskb_copy(frame->skb_std,
-			  skb_headroom(frame->skb_std) + HSR_HLEN, GFP_ATOMIC);
+	skb =3D skb_clone(frame->skb_std, GFP_ATOMIC);
 	if (!skb)
 		return NULL;
-	skb_reset_mac_header(skb);
=20
-	if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL)
-		skb->csum_start +=3D HSR_HLEN;
+	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
+		return skb;
+
+	/* Ensure the cloned skb has enough headroom to fit the HSR tag */
+	if (skb_cow_head(skb, skb_metadata_len(skb) + HSR_HLEN))
+		goto err;
=20
 	movelen =3D ETH_HLEN;
 	if (frame->is_vlan)
 		movelen +=3D VLAN_HLEN;
=20
-	src =3D skb_mac_header(skb);
-	dst =3D skb_push(skb, HSR_HLEN);
-	memmove(dst, src, movelen);
+	/* The entire header area needs to be linear */
+	if (!pskb_may_pull(skb, movelen))
+		goto err;
+
+	skb_push(skb, HSR_HLEN);
+	skb_postpush_data_move(skb, HSR_HLEN, movelen);
+	skb_set_network_header(skb, HSR_HLEN + movelen);
 	skb_reset_mac_header(skb);
+	skb_reset_mac_len(skb);
=20
 	/* skb_put_padto free skb on error and hsr_fill_tag returns NULL in
 	 * that case
 	 */
 	return hsr_fill_tag(skb, frame, port, port->hsr->prot_version);
+err:
+	kfree_skb(skb);
+	return NULL;
 }
=20
 struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,

--=20
2.55.0

