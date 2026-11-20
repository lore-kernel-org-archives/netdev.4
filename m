Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169833;
	b=R86RhuCU/cKPZsm7INohEkph5AVb1OJ0Bs9Uis9oX1293QN8DXOlPzTodO903i/2HPJW
	 7VlJs2vgZFv871zZepjeETlx6kxCat/KcRNSWu+viPVzGC2/EKcUttzUSSzuqaT0swhEB
	 7kdZiG8qf4x8/ixFaMePiE+NU3Cwb46sENpWXsBIIVQP3l6VQLgOMq2GZj+EloHtkDADW
	 8K9Kf/oCWN3yuvO4I5uW6pmOmv1dar5jkzk9CxhdO+5Rggt5KOfgBkquGEEHO8HIUZsRB
	 Ip53rDn/8NCyqw7ugVansZQ3GizwdVCLO7vx5tf2r7gjLE8ERGt2Zjpsf5Hktetv8rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169833;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=MgStLKYMwedMucpNS/Nb51bIWFzbxU9eqONrm886hcPXEccvB8cYuMU00B8jojd+LnI6
	 WDXfgBzjOvLjHpWmgz1NVdyfpu9zHF4hpzO8gypOFs+SzWIRDeQzEAceJlwTsjeRGND1x
	 /0U6KiIX1mJEbgGEQvSk5N/vAkZHzThBNdAshUyC++m569Y5ENA6gvpvLu13otsbSgW4T
	 xPlNito6McW9Ln3oX0zJGzRqHYM6Ly8SMxeLDdh2EtrftiGZW/QuZ5MTEbmafK5FIRdla
	 A2GdjPXf5IaV0bUqzlQjdL333ouJATLCbodS4TbF8kzLVwAUx1xKdBtjWIGFDZxGJJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DRE+CP5F;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NpDNIrVq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6560A260E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B6560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DRE+CP5F;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NpDNIrVq
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=DRE+CP5FdMNZdpyukmWj15D2z3rtH1gVNn8fVtXj7Gx5GyRUyWjNgbQi1xjM7o7N/LW57S
	mK6kUPXqSHaHMrPB+zX9DLv1x7YCdMx0OdAwMEzQ7QQunGZnA3MkjQ1kd4P56G0BKaZUtS
	d0wr5q7d/UM41YCuifhd6aeDR910tbF2pLze+XLG1Q9vJAnJWaIjrfGlx/ekKcCCWL3XKa
	tl3xpdaYK3eKvKkifqs8EPhG53vh3Abw/olQOmEJPF0tcmydCrDL2mQVQW0ChsJ5kdE+wL
	6tsGf8KwBvR0zMy8alaDsi0MMtZkah4JctOFCI+l5OQWhgzF66S1ESKvoLX6hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=NpDNIrVqIVOT7Y4kWdaeLDF9U4qtp5e9KKKXS5M7xP2ON2SgiE15VLD4LQcVI/cY4a2n/6
	+aLKBdft759Bz9DA==
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
Subject: [PATCH net-next v11 6/8] hsr: Assign a socket for cloned skbs
Date: Fri, 20 Nov 2026 11:17:02 +0100
Message-ID: <20261120-hsr_ptp-v11-6-264c88f4f1d0@linutronix.de>
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

The cloned skb does not have the socket recorded of the original skb
because skb_clone() clears sk_buff::sk. The original skb is never
submitted but freed in hsr_forward_skb(). skb_tstamp_tx() will only
submit timestamp information to the sender if the socket is recorded and
the TS flags are available.

As of the recent changes everything is available except the socket and
the requested timestamp gets lost.

This does not consider PRP part of the stack. The specification says
that PTP-PRP packets do not have the RCT therefore these packets can be
sent directly from userland skipping the stack.

Assign the socket of the original skb to the clone so the timestamp is
forwarded to the user.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 net/hsr/hsr_forward.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 1d1d75ed8cd06..9cb3297a8640a 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -12,6 +12,7 @@
 #include <linux/skbuff.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
+#include <net/sock.h>
 #include "hsr_main.h"
 #include "hsr_framereg.h"
=20
@@ -347,6 +348,9 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_fram=
e_info *frame,
 	if (!skb)
 		return NULL;
=20
+	if (frame->req_tx_port !=3D HSR_PT_NONE && frame->skb_std->sk)
+		skb_set_owner_w(skb, frame->skb_std->sk);
+
 	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
 		return skb;
=20
@@ -582,6 +586,8 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
 		 */
 		if (frame->has_hsr_header && frame->skb_std) {
 			skb =3D skb_clone(frame->skb_std, GFP_ATOMIC);
+			if (skb && frame->skb_std->sk)
+				skb_set_owner_w(skb, frame->skb_std->sk);
 			goto inject_into_stack;
 		}
=20

--=20
2.55.0

