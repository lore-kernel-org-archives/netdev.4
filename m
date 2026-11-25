Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617169;
	b=paZHBIyek4H6SbTec+EN8Tlc026Rdry4vQp2bDaCkiXLarl6X9ZShIoRbCMSbuxJSoTj
	 eT5kQGhyCIMdY4lyPGab19ajeIXr/M7Jjbn2h1fn+xnNANhQNXFlmKJ4Xlx6YsyRbSTVN
	 Ha1VCTBO6uZb1ixcw7j25Pqv0UDrYUfxYCInv/PZ16zK1OT5y68+H/VgIA8JAx9eTzcDO
	 KFk+Zpq4RsZJfEnatKYP+88osWkR1WhSwa9WfCGnDPVaVNeoec4mAAB515lHFB8aYWpgh
	 DlDDeXnrNu1CwovcfwNa7q2HNaY0sHxnTx4AYHvoqDOkdoR9cYuhAUtDrgWuwL8qikA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617169;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=a1vfiGzFNRXe6902xRshxQVZfYj8xk1vt1J8I928uCs=;
	b=WpqhECuZM4z2nV5jZHnRHPrpmcnDcVw2e2WD9nryX8tlV5B0AyIP9JvvzJpRnjc38tVV
	 ZawJmUUOjFown9uG52Ezymb7F29dG9tIyOLZlndLGNO7NWmInuq0TLNRedR6sAV9WJ8is
	 t/0ZqxV80uNMQpVKrgwgtWvcHeM378prNh2KpF7sKt3T/h1gdbp19PqhLwtkhrW9RD0ac
	 mnaaNAUTxt537JRIHGjN/lnmPz3xsktPEwDYwTQUO20b+onzDX7DEtpZu6rHZk/vkG4rD
	 E83louAts2kNZfGkf/NRFqPm98V8NsUPktpTtH6RZjineYDRYfSYfMeltAtcYrPoI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cOagc6JR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zxukkFa4;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D70606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D70606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cOagc6JR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zxukkFa4
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1vfiGzFNRXe6902xRshxQVZfYj8xk1vt1J8I928uCs=;
	b=cOagc6JRRtGzez59Iuk59qzzwvgw+2kwmAeFofNvWIqYCjmv6fugpaVXO3Uq6LtxCXJ/qH
	9uM/3SWgfFwfH3XkZnT0P7tfV7McKXR1dlshAsx2Q9d1A4EQq/ZtB0/kSzZDc5YeNQZVqh
	XHiIhDQS3jGpBjyxNuJSb8mYSwHlH13MqPbFEBb3v6Imjd+Z+0CSMX6goRPyc0DPX7vPaW
	KRDHkAblvfobsxdpuMnKdUFPqPK8sUNymNivc6Vomd4h2k4y0geVW8agNlk6MND6zAa0VY
	3ZSURn0OGiO9z4r+9d4aNF9n4reA/3uRdU0MLphNWW59uHVAid2/LijD8jfaQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1vfiGzFNRXe6902xRshxQVZfYj8xk1vt1J8I928uCs=;
	b=zxukkFa4JtadpTTJH9Ndm34pLFXOtRHzSDTHq9UYJHOp5N12LeLJO1kNaVvM2pqYZmK/Iz
	HQqNIkyhOLSItVAg==
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
Subject: [PATCH net-next v12 3/8] hsr: Add a magic header for sending PTP packets
Date: Wed, 25 Nov 2026 15:31:46 +0100
Message-ID: <20261125-hsr_ptp-v12-3-9ddd2a73cb90@linutronix.de>
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

Sending PTP packets (ETH_P_1588) via the HSR stack is pointless in its
current shape because the requested PTP timestamp is not routed to the
sender. It also needs to be distinguished on which port the message
should be sent and whether or not a HSR header should be attached.

To pass this information, a custom header (struct hsr_inline_header) is
introduced. This header is expected and mandatory if the ether type is
ETH_P_1588. To avoid any wrong usage, there is a magic field to ensure
it really is the header.

The inline header is just prepended containing the port and header
parameter. After the header, a regular packet follows. It is ensured that
the inline header and the following ethernet or HSR header is linear
and can be accessed. Given that this information is important for how
PTP is used, PTP packets missing this information will be dropped.

The two retrieved parameters are passed to hsr_forward_skb() and will be
used later.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 MAINTAINERS                  |  1 +
 include/uapi/linux/hsr_ptp.h | 20 +++++++++++
 net/hsr/hsr_device.c         | 83 +++++++++++++++++++++++++++++++++++++---=
----
 net/hsr/hsr_forward.c        |  3 +-
 net/hsr/hsr_forward.h        |  3 +-
 net/hsr/hsr_slave.c          |  4 +--
 6 files changed, 97 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b80..f41ce40c9e306 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12307,6 +12307,7 @@ F:	drivers/net/usb/hso.c
 HSR NETWORK PROTOCOL
 L:	netdev@vger.kernel.org
 S:	Orphan
+F:	include/uapi/linux/hsr_ptp.h
 F:	net/hsr/
 F:	tools/testing/selftests/net/hsr/
=20
diff --git a/include/uapi/linux/hsr_ptp.h b/include/uapi/linux/hsr_ptp.h
new file mode 100644
index 0000000000000..95e905441ebdc
--- /dev/null
+++ b/include/uapi/linux/hsr_ptp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+#ifndef __UAPI_HSR_PTP_H
+#define __UAPI_HSR_PTP_H
+
+#include <linux/types.h>
+
+#define HSR_INLINE_HDR  0xaf485352
+#define HSR_INLINE_HDR_PORT_A	1
+#define HSR_INLINE_HDR_PORT_B	2
+
+struct hsr_inline_header {
+	__u8 req_tx_port;
+	__u8 has_hsr_header;
+	__be32 __pad0;
+	__be32 magic;
+	__be16 __pad1;
+	__be16 eth_type;
+} __attribute__ ((packed));
+
+#endif
diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 59df647d2fd45..7e79d5b34e8bb 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -12,6 +12,8 @@
 #include <linux/etherdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/pkt_sched.h>
+#include <uapi/linux/hsr_ptp.h>
+
 #include "hsr_device.h"
 #include "hsr_slave.h"
 #include "hsr_framereg.h"
@@ -221,26 +223,81 @@ static netdev_features_t hsr_fix_features(struct net_=
device *dev,
 	return hsr_features_recompute(hsr, features);
 }
=20
+static int hsr_ptp_parse_header(struct sk_buff *skb, bool *has_hsr_header,
+				enum hsr_port_type *req_tx_port)
+{
+	struct hsr_inline_header *hsr_inline_hdr;
+	struct ethhdr *eth_hdr;
+	unsigned int hdr_len;
+
+	BUILD_BUG_ON(sizeof(struct hsr_inline_header) !=3D sizeof(struct ethhdr));
+
+	skb_reset_mac_header(skb);
+	if (!skb->sk)
+		return -EINVAL;
+
+	/* need to access the magic header */
+	if (!pskb_may_pull(skb, sizeof(struct hsr_inline_header)))
+		return -EINVAL;
+
+	hsr_inline_hdr =3D (struct hsr_inline_header *)skb_mac_header(skb);
+	if (hsr_inline_hdr->magic !=3D htonl(HSR_INLINE_HDR))
+		return -EINVAL;
+
+	*has_hsr_header =3D hsr_inline_hdr->has_hsr_header;
+	*req_tx_port =3D hsr_inline_hdr->req_tx_port;
+	if (*req_tx_port !=3D HSR_PT_SLAVE_A && *req_tx_port !=3D HSR_PT_SLAVE_B)
+		return -EINVAL;
+
+	if (hsr_inline_hdr->__pad0 !=3D 0 || hsr_inline_hdr->__pad1 !=3D 0)
+		return -EINVAL;
+
+	hdr_len =3D ETH_HLEN;
+	if (*has_hsr_header)
+		hdr_len +=3D HSR_HLEN;
+
+	/* Ensure the real header after the stripped one can be
+	 * accessed
+	 */
+	if (!pskb_may_pull(skb, sizeof(struct hsr_inline_header) +
+			   hdr_len))
+		return -EINVAL;
+
+	eth_hdr =3D skb_pull(skb, sizeof(struct hsr_inline_header));
+	skb_set_network_header(skb, hdr_len);
+	skb->protocol =3D eth_hdr->h_proto;
+	return 0;
+}
+
 static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, struct net_device *de=
v)
 {
+	enum hsr_port_type req_tx_port =3D HSR_PT_NONE;
 	struct hsr_priv *hsr =3D netdev_priv(dev);
+	bool has_hsr_header =3D false;
 	struct hsr_port *master;
=20
 	rcu_read_lock();
 	master =3D hsr_port_get_hsr(hsr, HSR_PT_MASTER);
-	if (master) {
-		skb->dev =3D master->dev;
-		skb_reset_mac_header(skb);
-		skb_reset_mac_len(skb);
-		spin_lock_bh(&hsr->seqnr_lock);
-		hsr_forward_skb(skb, master);
-		spin_unlock_bh(&hsr->seqnr_lock);
-	} else {
-		dev_core_stats_tx_dropped_inc(dev);
-		dev_kfree_skb_any(skb);
-	}
+	if (!master)
+		goto drop;
+
+	skb->dev =3D master->dev;
+	if (skb->protocol =3D=3D htons(ETH_P_1588) &&
+	    hsr_ptp_parse_header(skb, &has_hsr_header, &req_tx_port))
+		goto drop;
+
+	skb_reset_mac_header(skb);
+	skb_reset_mac_len(skb);
+	spin_lock_bh(&hsr->seqnr_lock);
+	hsr_forward_skb(skb, master, req_tx_port, has_hsr_header);
+	spin_unlock_bh(&hsr->seqnr_lock);
 	rcu_read_unlock();
=20
+	return NETDEV_TX_OK;
+drop:
+	rcu_read_unlock();
+	dev_core_stats_tx_dropped_inc(dev);
+	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
 }
=20
@@ -362,7 +419,7 @@ static void send_hsr_supervision_frame(struct hsr_port =
*port,
 		return;
 	}
=20
-	hsr_forward_skb(skb, port);
+	hsr_forward_skb(skb, port, HSR_PT_NONE, false);
 	spin_unlock_bh(&hsr->seqnr_lock);
 	return;
 }
@@ -430,7 +487,7 @@ static void send_prp_supervision_frame(struct hsr_port =
*master,
 		return;
 	}
=20
-	hsr_forward_skb(skb, master);
+	hsr_forward_skb(skb, master, HSR_PT_NONE, false);
 	spin_unlock_bh(&hsr->seqnr_lock);
 }
=20
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index b183358207506..f49d962337f8b 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -771,7 +771,8 @@ static int fill_frame_info(struct hsr_frame_info *frame,
 }
=20
 /* Must be called holding rcu read lock (because of the port parameter) */
-void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port,
+		     enum hsr_port_type req_tx_port, bool has_hsr_header)
 {
 	struct hsr_frame_info frame;
=20
diff --git a/net/hsr/hsr_forward.h b/net/hsr/hsr_forward.h
index 206636750b300..662dd369c7df2 100644
--- a/net/hsr/hsr_forward.h
+++ b/net/hsr/hsr_forward.h
@@ -13,7 +13,8 @@
 #include <linux/netdevice.h>
 #include "hsr_main.h"
=20
-void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port);
+void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port,
+		     enum hsr_port_type req_tx_port, bool has_hsr_header);
 struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 					struct hsr_port *port);
 struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index a546f70f9cc8b..5274ba6dd36e6 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -78,10 +78,10 @@ static rx_handler_result_t hsr_handle_frame(struct sk_b=
uff **pskb)
 	 */
 	if (port->type =3D=3D HSR_PT_INTERLINK) {
 		spin_lock_bh(&hsr->seqnr_lock);
-		hsr_forward_skb(skb, port);
+		hsr_forward_skb(skb, port, HSR_PT_NONE, false);
 		spin_unlock_bh(&hsr->seqnr_lock);
 	} else {
-		hsr_forward_skb(skb, port);
+		hsr_forward_skb(skb, port, HSR_PT_NONE, false);
 	}
=20
 finish_consume:

--=20
2.55.0

