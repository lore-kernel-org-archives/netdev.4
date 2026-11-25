Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617170;
	b=EWzyhEyu+lt2luoSnGYoww1FpXtVhB8A9UfsN7fXng6DBsdC3MlMwY33KaNTSH5KOkkl
	 To1pDfv0j0CVFkp7q9UfS45r+s7rY+/QDk+kCbWuN+/sxj6qSgEjsOp6g1s6s4OdNLTS1
	 Q01Y5Tp9vx8n54o4b1hUC9RgqzCDfP+46uC2lIDsUuaXGBIQlGkAh+BloKcFyaXo51g9d
	 UNRzoJKzdhLqDCI9G3F2b/oewGd/A+i0BstXTtRpL+/cdAgxdEIQwMZAMRBEYgzqnJcbi
	 K0SxFaqkzwUsjdZuj5uH8Zte8TvQlOTmBCwT3BYgY/uJB2fmNyS+CvtuhgeNdExdxBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617170;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vMhz5wBioPFyCYnw40TBhwFfNGE+6yx/y9Xk7tpAx9A=;
	b=oO0dG8zN6OhMvNwYsQOk9DBwfx2mFZ1RDI4vPadRVTCeqLbl4vu4x/ef11nlrsEnx3NP
	 J5MvJmxaBl9LLQhYbC3MT5VVVbUP0DlqEyun9fi8FQt7gV7S3dg4KNcy9O6l8HB9/3vyA
	 3nWwH/+MUQosnX0bluf0x5u5+983X6qbBAqr46UCQGPu5cwCWU8MaJc2nsvXE9A0MsOXK
	 UrZ3Ydz/kBgD+18i1kZQ9jHNgzRj6DpRBH+QefFkZuSXuW4BT7+q68CN/l5+FKRppguf7
	 2RR7UfNoM/ViRDJwIkcMAps3CairbhPTib1qKSEuoAQr5WqyxTD1h9k1PeFYqtn8ZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bJzCBDE1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=as8gW3cO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B44606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bJzCBDE1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=as8gW3cO
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMhz5wBioPFyCYnw40TBhwFfNGE+6yx/y9Xk7tpAx9A=;
	b=bJzCBDE1PtapyYgD6+DJnCXthhWQspDFqezLlkUFCcGppJnsjQSSn5y5OZUvnr2AnU+oUa
	jQ1hvZzjQDA1z02fMs7LJFYWQiN8KCu1nSozygAVnHnXkWwkyaATlRV9tcO8GDMCVDWYrA
	hY3c9W109FfxwS68aCjgaxQVXpto06wj4AzAy4nOyZqnBbDBw5FkX2ZpumJA9VbLhbDsbH
	iuZV9XVjFZNLyRb5uoF5jTEg/kW1V8q+mW4ga7XWq1rwP+tpcCeMKtu3m2OLHA2fsjpY/W
	zeGnzp5YXhPed5srWHmu/6NlpuSmJ6XcwO9sb2GVJZ9Iv7lBCArtlIu/1dDH8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMhz5wBioPFyCYnw40TBhwFfNGE+6yx/y9Xk7tpAx9A=;
	b=as8gW3cOTYfVY3s6ff2XlPq/Ty4diS4zRBEhDmkfki04d2CTOVqwj25QQkbvnToJZ2BhlG
	dRE9O8h3lylR+9BQ==
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
Subject: [PATCH net-next v12 5/8] hsr: Use the port and header information in hsr_forward_skb()
Date: Wed, 25 Nov 2026 15:31:48 +0100
Message-ID: <20261125-hsr_ptp-v12-5-9ddd2a73cb90@linutronix.de>
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

The upper layer can submit a port on which the skb should be sent and
whether or not a HSR header should be added. Use this information while
forwarding the packet:
- If the port set, deliver it only on the requested port.
- If a header is already present then skip parts of the stack:
  - The packet originates from the master port and we don't want to
    assign a sequence number to it, it needs to preserve the original
    one.
  - The existing h_source must be used (and not replaced).
  - The node should already exist in the node_db if "other" packets are
    exchanged. If the node information is not yet existing then
    creating it makes no sense because it is used for deduplication of
    incoming packets and this is not used in the PTP case. If no other
    packets are exchanged then the node_db will age and then removed.

This is only used in the pure software version. Hardware with any kind
of NETIF_F_HW_* offload support need to be addressed separately.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 net/hsr/hsr_forward.c  | 47 +++++++++++++++++++++++++++++++++++++++--------
 net/hsr/hsr_framereg.h |  2 ++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index f49d962337f8b..1d1d75ed8cd06 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -426,7 +426,7 @@ static void hsr_deliver_master(struct sk_buff *skb, str=
uct net_device *dev,
 static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
 		    struct hsr_frame_info *frame)
 {
-	if (frame->port_rcv->type =3D=3D HSR_PT_MASTER) {
+	if (frame->port_rcv->type =3D=3D HSR_PT_MASTER && !frame->has_hsr_header)=
 {
 		hsr_addr_subst_dest(frame->node_src, skb, port);
=20
 		/* Address substitution (IEC62439-3 pp 26, 50): replace mac
@@ -552,6 +552,7 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
=20
 	hsr_for_each_port(frame->port_rcv->hsr, port) {
 		struct hsr_priv *hsr =3D port->hsr;
+
 		/* Don't send frame back the way it came */
 		if (port =3D=3D frame->port_rcv)
 			continue;
@@ -570,6 +571,20 @@ static void hsr_forward_do(struct hsr_frame_info *fram=
e)
 		if ((port->dev->features & NETIF_F_HW_HSR_DUP) && sent)
 			continue;
=20
+		/* If this frame has a specific outgoing port specified (by the
+		 * sender) then send it on this port only.
+		 */
+		if (frame->req_tx_port !=3D HSR_PT_NONE &&
+		    frame->req_tx_port !=3D port->type)
+			continue;
+		/* If this TX frame already has a HSR header then forward the
+		 * frame with it and don't add one.
+		 */
+		if (frame->has_hsr_header && frame->skb_std) {
+			skb =3D skb_clone(frame->skb_std, GFP_ATOMIC);
+			goto inject_into_stack;
+		}
+
 		/* Don't send frame over port where it has been sent before.
 		 * Also for SAN, this shouldn't be done.
 		 */
@@ -597,6 +612,7 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
 		else
 			skb =3D hsr->proto_ops->get_untagged_frame(frame, port);
=20
+inject_into_stack:
 		if (!skb) {
 			frame->port_rcv->dev->stats.rx_dropped++;
 			continue;
@@ -661,6 +677,13 @@ int hsr_fill_frame_info(__be16 proto, struct sk_buff *=
skb,
 	struct hsr_port *port =3D frame->port_rcv;
 	struct hsr_priv *hsr =3D port->hsr;
=20
+	if (frame->has_hsr_header) {
+		frame->skb_std =3D skb;
+
+		WARN_ON_ONCE(port->type !=3D HSR_PT_MASTER);
+		WARN_ON_ONCE(skb->mac_len < sizeof(struct hsr_ethhdr));
+		return 0;
+	}
 	/* HSRv0 supervisory frames double as a tag so treat them as tagged. */
 	if ((!hsr->prot_version && proto =3D=3D htons(ETH_P_PRP)) ||
 	    proto =3D=3D htons(ETH_P_HSR)) {
@@ -702,7 +725,8 @@ int prp_fill_frame_info(__be16 proto, struct sk_buff *s=
kb,
 }
=20
 static int fill_frame_info(struct hsr_frame_info *frame,
-			   struct sk_buff *skb, struct hsr_port *port)
+			   struct sk_buff *skb, struct hsr_port *port,
+			   enum hsr_port_type req_tx_port, bool has_hsr_header)
 {
 	struct hsr_priv *hsr =3D port->hsr;
 	struct hsr_vlan_ethhdr *vlan_hdr;
@@ -725,10 +749,16 @@ static int fill_frame_info(struct hsr_frame_info *fra=
me,
 	if (port->type =3D=3D HSR_PT_INTERLINK)
 		n_db =3D &hsr->proxy_node_db;
=20
-	frame->node_src =3D hsr_get_node(port, n_db, skb,
-				       frame->is_supervision, port->type);
-	if (!frame->node_src)
-		return -1; /* Unknown node and !is_supervision, or no mem */
+	frame->req_tx_port =3D req_tx_port;
+	frame->has_hsr_header =3D has_hsr_header;
+
+	if (!frame->has_hsr_header) {
+		frame->node_src =3D hsr_get_node(port, n_db, skb,
+					       frame->is_supervision,
+					       port->type);
+		if (!frame->node_src)
+			return -1; /* Unknown node and !is_supervision, or no mem */
+	}
=20
 	ethhdr =3D (struct ethhdr *)skb_mac_header(skb);
 	frame->is_vlan =3D false;
@@ -777,10 +807,11 @@ void hsr_forward_skb(struct sk_buff *skb, struct hsr_=
port *port,
 	struct hsr_frame_info frame;
=20
 	rcu_read_lock();
-	if (fill_frame_info(&frame, skb, port) < 0)
+	if (fill_frame_info(&frame, skb, port, req_tx_port, has_hsr_header) < 0)
 		goto out_drop;
=20
-	hsr_register_frame_in(frame.node_src, port, frame.sequence_nr);
+	if (!frame.has_hsr_header)
+		hsr_register_frame_in(frame.node_src, port, frame.sequence_nr);
 	hsr_forward_do(&frame);
 	rcu_read_unlock();
 	/* Gets called for ingress frames as well as egress from master port.
diff --git a/net/hsr/hsr_framereg.h b/net/hsr/hsr_framereg.h
index 127a3fb64d5f0..dc13819d04098 100644
--- a/net/hsr/hsr_framereg.h
+++ b/net/hsr/hsr_framereg.h
@@ -29,6 +29,8 @@ struct hsr_frame_info {
 	bool is_from_san;
 	bool dst_in_node_db;
 	bool dst_in_proxy_node_db;
+	bool has_hsr_header;
+	enum hsr_port_type req_tx_port;
 };
=20
 void hsr_del_self_node(struct hsr_priv *hsr);

--=20
2.55.0

