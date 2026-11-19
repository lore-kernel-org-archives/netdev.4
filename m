Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107118;
	b=DTkNPXA9aIei6m2KHbwB3gull9rC/ys4soX8Wt2pS8q92ctdOhwvJmEg92l5/q7MTSSP
	 8HvoSaWy26p8ZRve2wMRcjy0KQaOYQItrhgwCzUm8DyV1P8D2Wca37cXIXMo/7u5GMKTt
	 SYsl1LleIfEEFrWJu4uvUDWnJKAu1P6sYe/us321s4GzXzc1+1fCh5BTCMPfSQGnDXWgE
	 ZAm/SMMR4kIQv7qRcFNY9GYD6LxgZDQqaumcJ7Q3qf/CqZvxb3Jk58ZoFD4RxPlwXeRO9
	 Q7w6ZH1SwdWNoV5XeFqAuTKo8iRW0VnWbi2ZNBj28AvoZc+G2ArlF+W72iJtcKz9r8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107118;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=CK6H8UxcdqZxMMEKsoArEvfGurq2qnQzRpmIjroAPoU=;
	b=O+kI26vYdbqZOb/Iec9Dw7cGJQVWwspyNF9wkoLcFwf1fvJ64DbyUYAWqBL1N5+72svG
	 BsBt2sqbxg+c//9uzkSBXqBBlaO+H/LtTGeDdfPD24CXXlNDwhgv0cuQn7RZCtdJ33g1j
	 Dmi8cDRSHNtlxUTsxS3s0BIPRvY+ravCblvcyPhZmA9Yv3UUfnAijf3/Ef449Y8vBe3as
	 FXaLTnnFI5Y2C1MPprf5ENgjDJ+resPGGePGjI1WQCnTVgIO6RzOTDiI/XRjVJ+ym7UlN
	 BmDTxqQctEz8faTrr/Da4+k276aGEOqiUCdwJVtcGYMgUFThWcw53YyMLzkzh+HwKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b="k7ZzqB/p";
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46AA606A325;
	Thu, 19 Nov 2026 16:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=k7ZzqB/p
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EA18C8072C;
	Thu, 19 Nov 2026 17:51:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFZu99wPaFvu; Thu, 19 Nov 2026 17:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795107115; bh=gAFPSv6ZknuLs8T1YbWCSzo/xWEAGUJtXZO8RogVuLs=;
	h=From:To:Cc:Subject:Date;
	b=k7ZzqB/pJdiShuPBegI3Plo5S5sfGQmgVJpPI0+MbI02mQ/bG6Jx1RBttNRnTzd0E
	 SEXECv+bFHQLt20ZLXfo8oNL9UD6IewGVRLtCXDw4+1BiI0+IKWXZRNGzs3R4WjWvx
	 hM95NQkT2gk4b/yZs4tgDVuhpO8HHx263lae42ClZM7NuAwxTLR8OxZhrr41DW0IHF
	 PX60rk3fyagJIc3M3HaiiqwhlDTs+u+X4CCHHQZEx3h5eXygzDL69xnNc25mH4q0kU
	 dvA3uFxtV280GOUf78Qdo02UV3HsiAqlUygh2JodqBahV4nB1+B9y/FHFUa8RdM10w
	 gQjhFzm/esnnw==
From: Rustam Adilov <adilov@disroot.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Linus Walleij <linusw@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Taiga Ogawa <zectaiga@gmail.com>
Subject: [PATCH net-next] net: dsa: tag_rtl8_4: add support for RTL9607C tag variant
Date: Thu, 19 Nov 2026 21:50:51 +0500
Message-ID: <20261119165129.26693-1-adilov@disroot.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL9607C family of SoCs have an embdedded switch that utilizes
the same Realtek CPU Tag protocol 4 with 8 bytes in size but have
a bit different of a layout. And that layout is also different for
TX versus RX sides and introduces new fields not seen by RTL8_4.

Add basic necessities for this cpu tag variant to function.

Tested-by: Taiga Ogawa <zectaiga@gmail.com>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
Tested on OpenWrt with 6.18 kernel version [1].

The RTL8_4AP name was mostly chosen because Realtek gave the RTL9607C
family of SoCs a codename "ApolloPro" in their SDK, hence "AP" part.
Originally it was named RTL8_4_RTL9607C but that feels weird.

[1] https://github.com/openwrt/openwrt/pull/26496
---
 include/net/dsa.h    |   2 +
 net/dsa/tag_rtl8_4.c | 193 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 09f3043d57f0..6f86c7625304 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -63,6 +63,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
 #define DSA_TAG_PROTO_LAN9645X_VALUE		37
+#define DSA_TAG_PROTO_RTL8_4AP_VALUE		38
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -103,6 +104,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
 	DSA_TAG_PROTO_LAN9645X		= DSA_TAG_PROTO_LAN9645X_VALUE,
+	DSA_TAG_PROTO_RTL8_4AP		= DSA_TAG_PROTO_RTL8_4AP_VALUE,
 };
 
 struct dsa_switch;
diff --git a/net/dsa/tag_rtl8_4.c b/net/dsa/tag_rtl8_4.c
index 4da3beebef75..c934c232d330 100644
--- a/net/dsa/tag_rtl8_4.c
+++ b/net/dsa/tag_rtl8_4.c
@@ -74,6 +74,54 @@
  * software or hardware. To avoid this issue, if the checksum is still pending,
  * this tagger checksums the packet in software before adding the tag.
  *
+ * This 8 byte switch tag can also be found on RTL9607C family of SoCs with
+ * identical protocol "4", but the format is slightly different.
+ *
+ * On switch->CPU the bytes 4-7 look like this:
+ *
+ *  |-----------------------------------+-----------------------------------|
+ *  | (3) |     (3)    |    (5)         |     (2)     |  (1)  |  (1) |  (4) |
+ *  | PRI |   EXTSPA  OR PON_STREAM_ID  |PON_STREAM_ID|L3ROUTE| ORIG | PORT |
+ *  |-----------------------------------+-----------------------------------|
+ *  |    (1)   |           (15-bit)     /      (6-bit)                      |
+ *  |    FBI   |      FLOW_BASED_HASH   /   DST_PORT_MASK                   |
+ *  |-----------------------------------+-----------------------------------|
+ *
+ * On CPU->Switch however the byte 3 is also different:
+ *
+ *  |-----------------------------------+-----------------------------------|
+ *  |              (8-bit)              |             (8-bit)               |
+ *  |          Protocol [0x04]          |         TX_PORTMASK_LOW           |
+ *  |-----------------------------------+-----------------------------------|
+ *  |     (3-bit)    |(1)|   (1)  | (3) |(1) |(1)|   (1)   |(1) |(2)| (1) |1|
+ *  |TX_PORTMASK_HIGH| X | PRI_EN | PRI |KEEP| X |LEARN_DIS|PSEL| X |DIRTX|X|
+ *  |-----------------------------------+-----------------------------------|
+ *  | (3-bit)|    (2-bit)   |     (4-bit)    |           (7-bit)            |
+ *  | EXTSPA |   PPPOE_ACT  |    PPPOE_IDX   |        PON_STREAM_ID         |
+ *  |-----------------------------------+-----------------------------------|
+ *
+ * With the following descriptions for new fields:
+ *
+ *    field           | description
+ *   -----------------+-------------
+ *    EXTSPA          | Source Extension Port. Relevant when port is CPU (9, 10, 7).
+ *    PON_STREAM_ID   | PON Stream ID (GPON) or LLID index (EPON). Relevant when
+ *                    | port is PON (5)
+ *    L3ROUTE         | "This frame is an intended routed frames" as per docs
+ *    ORIG            | The received frame by NIC is the original packet's format
+ *                    | before switch lookup and switch didn't do any modifications
+ *    FBI             | Flow Based I...? Only relevant when REASON is FB (aka < 64)
+ *    FLOW_BASED_HASH | Flow Based Hash Index.
+ *    DST_PORT_MASK   | Switch lookup destination port mask. bit 0: CPU, bit 1-5 are
+ *                    | extension ports 0~4.
+ *    PSEL            | PON stream id (GPON) / LLID index(EPON) selection.
+ *    DIRTX           | Direct TX, whatever that means? Used to be called L34KEEP.
+ *    PPPOE_ACT       | Egress action for PPPoE header whose Ether Type = 0x8864.
+ *                    | 0: intact, 1: Add PPPoE header, 2: Remove PPPoE header,
+ *                    | 3: remarking PPPoE switch TX mac action.
+ *    PPPOE_IDX       | PPPoE index pointed to an entry of the PPPoE table in the
+ *                    | switch. Switch TX-MAC look PPPoE table up by this index to
+ *                    | get PPPoE session ID.
  */
 
 #include <linux/bitfield.h>
@@ -84,11 +132,12 @@
 
 /* Protocols supported:
  *
- * 0x04 = RTL8365MB DSA protocol
+ * 0x04 = RTL8365MB / RTL9607C (aka ApolloPro) DSA protocol
  */
 
 #define RTL8_4_NAME			"rtl8_4"
 #define RTL8_4T_NAME			"rtl8_4t"
+#define RTL8_4AP_NAME			"rtl8_4ap"
 
 #define RTL8_4_TAG_LEN			8
 
@@ -97,13 +146,63 @@
 #define RTL8_4_REASON			GENMASK(7, 0)
 #define   RTL8_4_REASON_FORWARD		0
 #define   RTL8_4_REASON_TRAP		80
+#define   RTL8_4AP_REASON_BCAST_TRAP	203
+#define   RTL8_4AP_REASON_RESV_TRAP	215
+#define   RTL8_4AP_REASON_IGMP		219
+#define   RTL8_4AP_REASON_RMA		220
+#define   RTL8_4AP_REASON_ACL		227
+
+#define RTL8_4AP_RX_LO			GENMASK(7, 0)
+#define RTL8_4AP_RX_HI			GENMASK(15, 13)
+#define RTL9607C_RX_HI_MSK		GENMASK(10, 8)
 
+#define RTL8_4AP_DIRTX			BIT(1)
 #define RTL8_4_LEARN_DIS		BIT(5)
 #define RTL8_4_KEEP			BIT(7)
 
 #define RTL8_4_TX			GENMASK(3, 0)
 #define RTL8_4_RX			GENMASK(10, 0)
 
+static void rtl8_4ap_write_tag(struct sk_buff *skb, struct net_device *dev,
+			       void *tag)
+{
+	u16 pmask = dsa_xmit_port_mask(skb, dev);
+	__be16 tag16[RTL8_4_TAG_LEN / 2];
+	u16 pmask_low, pmask_high;
+
+	/* Set Realtek EtherType */
+	tag16[0] = htons(ETH_P_REALTEK);
+
+	pmask_low = FIELD_GET(RTL8_4AP_RX_LO, pmask);
+	/* Set Protocol; set RX (CPU->switch) low forwarding port mask */
+	tag16[1] = htons(FIELD_PREP(RTL8_4_PROTOCOL, RTL8_4_PROTOCOL_RTL8365MB) |
+			 FIELD_PREP(RTL8_4AP_RX_LO, pmask_low));
+
+	pmask_high = FIELD_GET(RTL9607C_RX_HI_MSK, pmask);
+	/* set high forwarding port mask, KEEP, LEARN_DIS and DIRTX */
+	tag16[2] = htons(FIELD_PREP(RTL8_4AP_RX_HI, pmask_high) |
+			 FIELD_PREP(RTL8_4_LEARN_DIS, 1) |
+			 FIELD_PREP(RTL8_4_KEEP, 1) |
+			 FIELD_PREP(RTL8_4AP_DIRTX, 1));
+
+	/* Zero EXTSPA, PPPOE_ACT/IDX and PON_STREAM_ID */
+	tag16[3] = 0;
+
+	memcpy(tag, tag16, RTL8_4_TAG_LEN);
+}
+
+static struct sk_buff *rtl8_4ap_tag_xmit(struct sk_buff *skb,
+					 struct net_device *dev)
+{
+	skb_push(skb, RTL8_4_TAG_LEN);
+
+	dsa_alloc_etype_header(skb, RTL8_4_TAG_LEN);
+
+	rtl8_4ap_write_tag(skb, dev, dsa_etype_header_pos_tx(skb));
+
+	return skb;
+}
+
 static void rtl8_4_write_tag(struct sk_buff *skb, struct net_device *dev,
 			     void *tag)
 {
@@ -153,6 +252,84 @@ static struct sk_buff *rtl8_4t_tag_xmit(struct sk_buff *skb,
 	return skb;
 }
 
+static int rtl8_4ap_read_tag(struct sk_buff *skb, struct net_device *dev,
+			     void *tag)
+{
+	__be16 tag16[RTL8_4_TAG_LEN / 2];
+	u16 etype;
+	u8 reason;
+	u8 proto;
+	u8 port;
+
+	memcpy(tag16, tag, RTL8_4_TAG_LEN);
+
+	/* Parse Realtek EtherType */
+	etype = ntohs(tag16[0]);
+	if (unlikely(etype != ETH_P_REALTEK)) {
+		dev_warn_ratelimited(&dev->dev,
+				     "non-realtek ethertype 0x%04x\n", etype);
+		return -EPROTO;
+	}
+
+	/* Parse Protocol */
+	proto = FIELD_GET(RTL8_4_PROTOCOL, ntohs(tag16[1]));
+	if (unlikely(proto != RTL8_4_PROTOCOL_RTL8365MB)) {
+		dev_warn_ratelimited(&dev->dev,
+				     "unknown realtek protocol 0x%02x\n",
+				     proto);
+		return -EPROTO;
+	}
+
+	/* Parse REASON */
+	reason = FIELD_GET(RTL8_4_REASON, ntohs(tag16[1]));
+
+	/* Parse TX (switch->CPU) */
+	port = FIELD_GET(RTL8_4_TX, ntohs(tag16[2]));
+	skb->dev = dsa_conduit_find_user(dev, 0, port);
+	if (!skb->dev) {
+		dev_warn_ratelimited(&dev->dev,
+				     "could not find user for port %d\n",
+				     port);
+		return -ENOENT;
+	}
+
+	switch (reason) {
+	case RTL8_4AP_REASON_BCAST_TRAP:
+	case RTL8_4AP_REASON_RESV_TRAP:
+	case RTL8_4AP_REASON_IGMP:
+	case RTL8_4AP_REASON_RMA:
+	case RTL8_4AP_REASON_ACL:
+		break;
+	default:
+		dsa_default_offload_fwd_mark(skb);
+		break;
+	}
+
+	return 0;
+}
+
+static struct sk_buff *rtl8_4ap_tag_rcv(struct sk_buff *skb,
+					struct net_device *dev)
+{
+	if (unlikely(!pskb_may_pull(skb, RTL8_4_TAG_LEN))) {
+		kfree_skb(skb);
+		return NULL;
+	}
+
+	if (unlikely(rtl8_4ap_read_tag(skb, dev,
+				       dsa_etype_header_pos_rx(skb)))) {
+		kfree_skb(skb);
+		return NULL;
+	}
+
+	/* Remove tag and recalculate checksum */
+	skb_pull_rcsum(skb, RTL8_4_TAG_LEN);
+
+	dsa_strip_etype_header(skb, RTL8_4_TAG_LEN);
+
+	return skb;
+}
+
 static int rtl8_4_read_tag(struct sk_buff *skb, struct net_device *dev,
 			   void *tag)
 {
@@ -268,9 +445,23 @@ DSA_TAG_DRIVER(rtl8_4t_netdev_ops);
 
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RTL8_4T, RTL8_4T_NAME);
 
+/* Ethertype RTL9607C version */
+static const struct dsa_device_ops rtl8_4ap_netdev_ops = {
+	.name = "rtl8_4ap",
+	.proto = DSA_TAG_PROTO_RTL8_4AP,
+	.xmit = rtl8_4ap_tag_xmit,
+	.rcv = rtl8_4ap_tag_rcv,
+	.needed_headroom = RTL8_4_TAG_LEN,
+};
+
+DSA_TAG_DRIVER(rtl8_4ap_netdev_ops);
+
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RTL8_4AP, RTL8_4AP_NAME);
+
 static struct dsa_tag_driver *dsa_tag_drivers[] = {
 	&DSA_TAG_DRIVER_NAME(rtl8_4_netdev_ops),
 	&DSA_TAG_DRIVER_NAME(rtl8_4t_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(rtl8_4ap_netdev_ops),
 };
 module_dsa_tag_drivers(dsa_tag_drivers);
 
-- 
2.56.1

