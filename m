Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617167;
	b=szOOLQtnWKYsSFan/4VLAbStlmobZdnL8FLpQkfrVZKNo+3dc+Yw4jINKk1r44/p5D4u
	 2nlhLo0sWLNCw4DrhifmGYT6Y2GXvPumlCgnyWVxAsQdoNPXkfR6/x/IRuNGvmg+9l7iF
	 dyf10FXqcIN2WHU/CqHArlAFvSzLWNePYWw1s+Au/T3Bv8rev5UCyivFDNrYmoXp9CpTV
	 JT9J/5r5Dvl0OnaOumGDeOQCe9Xsagk/q89i//zvzL+LGZcSluCIjGrMJ3l5TXDJGJp7H
	 ejsnKoC/48EWNFyxAQ2KeFuxZj5Iv3FHPDOZPRVI0Ln70tgzSN1L68GLvQ66qZH2DEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617167;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=uhEU72AagnIQ6N6cuBvIDwC0zrAoGIVHXK7hC5x3cFfm5ghqFXLrwTK8ByZfBrUnbEct
	 gb0pO9+sJvWaQsUrpUfiX2d+grkriggugr+xp3U4VHryD+EFUXmgbH4/yC7CJycxQFs/1
	 efsdsLqHM6GPiX9C4xfE4nmUdf4IfPcs5427ZoaEJD9L3vzZ2fB2I42RIJwwnUcQBnQwR
	 caxP6MdXndL7JU+mLxbOJbm3e4QXziv4OBuhRKf2zYX8vmCTqVS0r97dNKtJ9nx0kCqf2
	 l4lVCYIvPtN3J4OZZnzXdkQCj8XiPoQM0pabRwVKUaoU3qFQ6B/YP0xZOxMXkXBp34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bhMe5AAk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ecVdoKbE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D6606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0D6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bhMe5AAk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ecVdoKbE
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=bhMe5AAkTms0mOchI367tms+xNpTCN6G9liYTXJCtbhwLMZ7+RVCZK43UrEgbWAVwTPZzd
	xEma9498zh1RrDCw1AvFBgrpHbToi41IEfRGvuna1oymtVb9qBdZVy8XAKRqFKx2HLzRet
	gecwqO1IwuAJl/keDtf5TcUN//YQdLFv3a2niGLVB2f4GeIsCrBJj8w5Ir7kwS1aR768/l
	9ej/9ycJyAFvAHD3oU0W4ToNenx0awM6HVUOXxQB2peUJGCaXku7MARQVWtWcKLE3YFLYN
	d8rcCT7fBZTXRExt09mAY1Zj07nM6na/hq7313GS0sk4bpyufHzaTl6KxAV7mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWopGS2bI8XROBBmCVM7t13PvuhBwV4YLrZxWgs14Oc=;
	b=ecVdoKbEBD4c7A3uGh6zpNOpQ1xJsXAsctL7uTe5YDEdtMgdKEAwQFnglgacCa05pQSnDw
	phtlq/dvMq0Vs5BA==
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
Subject: [PATCH net-next v12 2/8] hsr: Use skb_clone() while adding the HSR header
Date: Wed, 25 Nov 2026 15:31:45 +0100
Message-ID: <20261125-hsr_ptp-v12-2-9ddd2a73cb90@linutronix.de>
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

