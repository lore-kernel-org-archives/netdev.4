Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617171;
	b=vOZL8w3mVb1LVXVaalpcRCOSRnDV5vVjEnoEEdPmXEKv1i4gsGFhs3kKIhzOwrO+9Mjw
	 n3Rqub7tyKtdXZOFuJGH8eMGYk8NavF5a7ves++Foo4h4CJ3TV0Q7vX8DWnH2YUf7Bk6M
	 prXOQBJPkeVUHYlGaJB/NDAbdXg/UowZLfnrRo3VpCu5CIp5kn0Ynv1NzBi3Ntcuf1c91
	 qESlv8S1A3Uef2Nzj3CDXB67KXGUvsm9XcHJ7JQ5qnjAB0Hf3xN004Mz9/+qEoxS64Sgt
	 iX2+xUKhOeSATFR8OpWDuNKxaNXLmXWtmwDsQco+uJrYNWNxyfYy0IvTCuCEEl338mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617171;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=I9WRJJ4eC6GXvFoBa7Kmnuh8Y6bKtxpRqiT4z9kWyw1VXQPu3kDcCzyfhirnN4ilwfuo
	 JBipN46z/paM0DbZeR+AfQso2W6Q2HMRTiTSXC3oVFCaWaD4rWWLs+ivSskRpmrIcvMfF
	 YZNOPb2N2AcZ1J6Wzjhb1L33DL3tI1slIS5FmN4UcaSJjRtIaXKX3JgJ64z5oOtObVJ5A
	 c/SMeiTdrjhh6jSq2YHB1MQKoe7EZGc+438xvwHfMntByGb+KwjNupt1UtUfiR9B4XG1U
	 4t8W9+QK/EjRy4/YYOhfPLVZMDMTU6lAyNaFX1D6Cmib/YeWchRtNuj6/FIKNqzezXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1377YgjL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iZlcU8jv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF82606A337
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF82606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1377YgjL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iZlcU8jv
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=1377YgjLQSv3v66JKhTkp4HTkaCIl4QAoRTzZ91pSL5ZpOQAMokqfmOcJPRy2w6lg2EDTA
	5hoggxibKSe8XM6SnT3DZs14sj5TO9tqYLayCNk6Rn4SRoORaxKX6L9V1IKJjbmIByW3jo
	YAtZcgT5ang6cm6axSYPbIahkA48e34GoVZ6a89l4db2LuIVSyPcrQfP4byzwC/WTPRGY/
	gze5bPQ4+NPPPI0A+IGzcVc5WBLxw4nwXK1b2Y88xpgTsKRDKfiL+xprqBSwxXxxuy14vz
	zQVmm0R5K8Fyw8qYFFCdueeP0zReqqDAFtGypok4eYQLONPEqAqrEGPMRrHwWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwpG6VmvKDfDxRWSRFyRgDQSZNtSM0ZoDrxOLJ+NYuM=;
	b=iZlcU8jv1SZTSInfYa6Afj4bsOVHeTrC/t7MQMXweVYPtPgLe9w/N7n1ciiA3AbcMpCSWH
	w5B+vrSpygydQECg==
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
Subject: [PATCH net-next v12 6/8] hsr: Assign a socket for cloned skbs
Date: Wed, 25 Nov 2026 15:31:49 +0100
Message-ID: <20261125-hsr_ptp-v12-6-9ddd2a73cb90@linutronix.de>
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

