Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515666;
	b=A8Gwa99FnusfoFibJg6+EBlfQlpg9pMA3LLdlj242WnXQw7w/I5Lw7CIjrwWlOkCJjU3
	 8R+q5hanbMAvHNWeEqiIOEmQIb/aLkCplryXZ6jG59jD7lrBOJZfz3M3sOw0nJfHv9NUI
	 w4kMTeTqGyJWt9DsBGQ+HquEtyy7AuirIAJ+hhBWmQNwNKRCoyAESplCV3RWQuu9QaDzh
	 FbY128ctRg+ru0Gl6F6KQioGtfXPNQ1+KHUaLV4pPc/DIsOkNeUIdf8s7oKVpMcv5CjZC
	 +jcj2PMX/yozH5LTg6CiLd9DOqoDW4o1kscYXgEM19lDgZEVBeIQhS8QHdBMcsjtBcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=iMYZ5kUExsk2fU7Al326YiSXtbIpMNBxDSj4BuuH8wQ=;
	b=ymuXLc4pZtmrqRePPNCOH8VfgY/EztaolmDdfSWMx7qmL5fBeKtRK9grPIPkTtHSbN8z
	 fXXK8h+eqT1o1kI8pZy0t+uhz0oBCKEZUa+/VLXybl/Q/+wagm4CKc1HZ/WgVfjS6ZOVa
	 kKwSUdLaqNV8TRXSx8v++at4o34R4oD3u4LDyM5/nz2ma0331U0fO+hVYwv8DwvA0PHqy
	 L0wy/MBejFZkU0A7yPvvGDaVnne8jZ2udztQAbqnkTXpH+qJ0hJbWIZRSROStclmKtsY7
	 mo4ISIKWPZr0ze1m6xYRv601tBkHt2W67bkM4hTV/an1PCtQ5jnwnef67xQ1hbHnRpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aCrPBQlz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55186606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55186606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aCrPBQlz
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 72B9F205A1C;
	Tue, 24 Nov 2026 11:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMYZ5kUExsk2fU7Al326YiSXtbIpMNBxDSj4BuuH8wQ=;
	b=aCrPBQlzzrYoycKcz42TmZQQHD95YotqrYOgIhdljxmmNcugdeh98aZUSiTiqnQWjivhc4
	iYNleZqL6AgpyWMWtvoBoceZgfCKz5/kSpjhUwjbixtVTjjWuwyuxBtjK8CUwx8UvwSLN8
	WmlrzHE8F/YF4dJ601wJWHHIicq3SILeg6tBlFhI62BmZiukLqnSjCRBggF89pcGmxVcDE
	n6P/AquZagHIaFFSAFh1iyQ3aNUFibqR2abSbxju6VGHQ4Iwq9Vm1cB/JnvFBydoMYrBmJ
	DIMqAVQ6KJyqABLMKXD+B/70Mzm3hGOIsgxMXEHjj6ZqiW8WpL1Xxud2OPlX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMYZ5kUExsk2fU7Al326YiSXtbIpMNBxDSj4BuuH8wQ=;
	b=S/ibA8inNacO+QQQo3o4F/DgmXnyRR6SZucC/dJ5S9rSsR3GoG5Uw6KliyDfJuzLBgziQW
	4Xk6U+0Jt9nNWw9Vyvdc1BKPfiRgw7m5exQ8k542/tJS4mTtGcWKdnj7jUETig0ijPxJq7
	brzcevSsBHo4rpnpQcHuEK6pj9nJg1VDteRpeGx9XD1pXfWHNJGInE1krbTHNestT/Gp35
	JeZEQ09bgEM/7HRkyA3yvfXGFpVt7mKIb5X20QSu7MZRCuI4Qu4D259j0m9yY9chZ2FapR
	3jiZbGORhOr7lu8WHznSC6RlZFLieljNMUIvuHGKKrRTNmJ3VmUPx0PAjHlS8w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795515663; a=rsa-sha256;
	cv=none;
	b=GXqlEzSdN69IzN4PKaDr6fpdjAjpg+GcvuzZEkqSPvMmnVT0fjZSELy6HrCFPZEQkrFDOH
	9NZXSvREfRBwVEefD8P/Ig+mQZ/wrqnlJCE0gk/WAsYQqhN6ht1VtH4W4P4lNRs82yVP2d
	uA4PUhpG6Cb4iMPw3cX9+53E98r4ULhp7tmoMDimcCMfMnwTYZl/AfRWAIyI7iQx9rNRFe
	cTZLQTbve1MVKnb6QXjEX00y0K/FOjMBupyWF1C5bEk7xDyfY8vI1HBMtmQfK8fM9DI9BE
	fFxIW7ivsfLY3LuDyuwiToRvUChHkopmuSEnrLHiVRFidCh8cuLXHa7MqXjvPA==
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 5123C380D1C; Tue, 24 Nov 2026 11:21:03 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 24 Nov 2026 11:20:51 +0100
Subject: [PATCH net-next 2/2] net: dsa: realtek: rtl8365mb: offload ETS
 strict priority scheduling
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rtl8365mb-ets-strict-v1-2-6ab01ad545c8@pengutronix.de>
References: <20261124-rtl8365mb-ets-strict-v1-0-6ab01ad545c8@pengutronix.de>
In-Reply-To: <20261124-rtl8365mb-ets-strict-v1-0-6ab01ad545c8@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, kernel@pengutronix.de, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Offload the ETS qdisc so a user port can be switched from the WFQ
default to strict priority. With WFQ (weighted fair queuing) the
switch serves all queues of a port in turn, by their weights. By
default the driver sets equal weights, so no queue is served before
another. With strict priority a higher queue is always sent first.
Deleting the qdisc puts the port back on WFQ.

The driver offloads only strict bands. sch_ets gives each
bandwidth-sharing band a quantum in bytes. It is not known whether the
hardware WFQ counts bytes or frames. Even equal quanta therefore
cannot be offloaded.

The driver requires one band per queue, so the qdisc describes the
whole port. Band n is not queue n. The switch sends its higher queue
first.

If a root ets qdisc breaks one of these rules, the driver logs the
reason and refuses the offload. The qdisc then runs in software and
the port goes back to WFQ. An ets qdisc that is not the root qdisc is
not offloaded.

The priomap is not offloaded, for three reasons:
- Frames that the switch forwards have no skb->priority. The switch
  queues them by its own classification. It uses the default of the
  port the frame came in on, or the PCP or DSCP if that port trusts
  it.
- Frames that the host sends get the default traffic type of the CPU
  port.
- The switch maps traffic types to queues. It does not map
  skb->priority values. mqprio and taprio set the prio_tc_map of the
  netdev. sch_ets does not. The tagger therefore cannot apply the
  priomap to host frames.

The driver therefore accepts any priomap. Refusing a priomap would not
make the switch follow it.

The patch uses ets, not prio. The hardware picks strict priority or
WFQ per queue, and ets sets the type per band.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

---
Q: What does the user see when the offload of a root ets qdisc is
   refused?
A: tc succeeds. The qdisc runs in software, and "tc qdisc show" does
   not mark it as offloaded. The driver logs the reason as
   "port N: ...".

Q: What happens with hw-tc-offload turned off?
A: tc stops telling the driver about ets changes, so the port keeps
   its last scheduler setting. Until the offload is on again and the
   root ets qdisc is installed again ("tc qdisc replace"), the port
   may not follow what tc shows.

Q: Does the switch queue frames that the host sends by their sch_ets
   band?
A: No, not in the switch. The tagger leaves the PRI_EN bit of the
   CPU tag clear, so the CPU port default applies. With PRI_EN set,
   the switch would use the PRI field of the CPU tag instead.
---
 drivers/net/dsa/realtek/realtek.h        |  14 ++++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   4 ++
 drivers/net/dsa/realtek/rtl8365mb_qos.c  |  29 ++++++--
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |   2 +
 drivers/net/dsa/realtek/rtl83xx-qos.c    | 113 +++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |   2 +
 6 files changed, 158 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index cfe56d30f5cb1c6fabf381dd55e73934cbc66abb..af8315a80c642175b955bd4a16c9d34c7c9efdb3 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -45,6 +45,11 @@ struct rtl8366_vlan_4k {
 	u8	fid;
 };
 
+/* Size of ets_handle[]: the most ports a switch can have and still
+ * offload ETS.
+ */
+#define REALTEK_MAX_PORTS	11
+
 struct realtek_fdb_entry {
 	u8 mac_addr[ETH_ALEN];
 	u16 vid;
@@ -98,6 +103,9 @@ struct realtek_priv {
 	int			vlan4k_enabled;
 
 	void			*chip_data; /* Per-chip extra variant data */
+
+	/* Handle of the ETS qdisc offloaded last on each port, or 0 */
+	u32			ets_handle[REALTEK_MAX_PORTS];
 };
 
 /* apptrust selector slots: the index into the trust[] array of the
@@ -192,6 +200,12 @@ struct realtek_ops {
 				    const bool *trust, unsigned int n);
 	int	(*qos_get_apptrust)(struct realtek_priv *priv, int port,
 				    bool *trust, unsigned int n);
+	/* Set the scheduler of @port. If @strict, the queues for traffic
+	 * classes 0..@num_queues - 1 are strict priority, and a higher traffic
+	 * class is served first. Otherwise they are WFQ with equal weights.
+	 */
+	int	(*qos_set_port_sched)(struct realtek_priv *priv, int port,
+				      unsigned int num_queues, bool strict);
 };
 
 struct realtek_variant {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index a81ef9dfaf970f45a988a1b496c011e0824ba939..d08c389eeb7f0222355774ac18464d92331d1915 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -125,6 +125,8 @@
 #define RTL8365MB_LEARN_LIMIT_MAX	2112
 #define RTL8365MB_MAX_NUM_EXTINTS	3
 
+static_assert(RTL8365MB_MAX_NUM_PORTS <= REALTEK_MAX_PORTS);
+
 /* Chip identification registers */
 #define RTL8365MB_CHIP_ID_REG		0x1300
 
@@ -3487,6 +3489,7 @@ static const struct dsa_switch_ops rtl8365mb_switch_ops = {
 	.port_get_apptrust = rtl83xx_port_get_apptrust,
 	.port_set_apptrust = rtl83xx_port_set_apptrust,
 	.port_get_dscp_prio = rtl83xx_port_get_dscp_prio,
+	.port_setup_tc = rtl83xx_port_setup_tc,
 	.port_stp_state_set = rtl8365mb_port_stp_state_set,
 	.port_fast_age = rtl83xx_port_fast_age,
 	.port_fdb_add = rtl83xx_port_fdb_add,
@@ -3536,6 +3539,7 @@ static const struct realtek_ops rtl8365mb_ops = {
 	.qos_set_dscp_prio = rtl8365mb_qos_set_dscp_prio,
 	.qos_set_apptrust = rtl8365mb_qos_set_apptrust,
 	.qos_get_apptrust = rtl8365mb_qos_get_apptrust,
+	.qos_set_port_sched = rtl8365mb_qos_set_port_sched,
 };
 
 static const char *const rtl8365mb_supplies[] = {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 25d18cbc6fd1228fb0bf5c535b2a16548d614087..b3e43a4e136da6fff126a04835a1967963fcc12c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -368,8 +368,9 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 	return 0;
 }
 
+/* Under strict priority a higher queue id is served first */
 static int rtl8365mb_qos_write_port_sched(struct realtek_priv *priv, int port,
-					  unsigned int num_queues)
+					  unsigned int num_queues, bool strict)
 {
 	u32 weight = RTL8365MB_QOS_SCHED_WFQ_WEIGHT_DEFAULT;
 	unsigned int tc;
@@ -381,7 +382,8 @@ static int rtl8365mb_qos_write_port_sched(struct realtek_priv *priv, int port,
 		return -EINVAL;
 
 	reg = RTL8365MB_QOS_SCHED_QTYPE_REG(port);
-	qtype = RTL8365MB_QOS_SCHED_QTYPE_WFQ;
+	qtype = strict ? RTL8365MB_QOS_SCHED_QTYPE_STRICT :
+			 RTL8365MB_QOS_SCHED_QTYPE_WFQ;
 
 	/* Program the queue ids that the traffic-type-to-queue map uses */
 	for (tc = 0; tc < num_queues; tc++) {
@@ -393,9 +395,11 @@ static int rtl8365mb_qos_write_port_sched(struct realtek_priv *priv, int port,
 		mask = BIT(RTL8365MB_QOS_SCHED_QTYPE_BIT(port, qid));
 		wreg = RTL8365MB_QOS_SCHED_WFQ_WEIGHT_REG(port, qid);
 
-		ret = regmap_write(priv->map, wreg, weight);
-		if (ret)
-			return ret;
+		if (!strict) {
+			ret = regmap_write(priv->map, wreg, weight);
+			if (ret)
+				return ret;
+		}
 
 		ret = rtl8365mb_qos_regmap_update_field(priv, reg, mask, qtype);
 		if (ret)
@@ -405,6 +409,18 @@ static int rtl8365mb_qos_write_port_sched(struct realtek_priv *priv, int port,
 	return 0;
 }
 
+int rtl8365mb_qos_set_port_sched(struct realtek_priv *priv, int port,
+				 unsigned int num_queues, bool strict)
+{
+	int ret;
+
+	ret = rtl8365mb_qos_check_port(priv, port);
+	if (ret)
+		return ret;
+
+	return rtl8365mb_qos_write_port_sched(priv, port, num_queues, strict);
+}
+
 /* The chip resets every queue to strict priority. Put the ports in use on
  * WFQ with equal weights.
  */
@@ -416,7 +432,8 @@ int rtl8365mb_qos_sched_init(struct realtek_priv *priv)
 
 	/* Unused ports carry no traffic; their scheduler is left alone */
 	dsa_switch_for_each_available_port(dp, &priv->ds) {
-		ret = rtl8365mb_qos_write_port_sched(priv, dp->index, nq);
+		ret = rtl8365mb_qos_write_port_sched(priv, dp->index, nq,
+						     false);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 1daeee16e47294dead49b0843a863991de9731cd..d89cf12b4fe436a010f5f777ddd49c15ec9039bc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -26,6 +26,8 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio);
 int rtl8365mb_qos_get_dscp_prio(struct realtek_priv *priv, u8 dscp);
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio);
+int rtl8365mb_qos_set_port_sched(struct realtek_priv *priv, int port,
+				 unsigned int num_queues, bool strict);
 int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 			       const bool *trust, unsigned int n);
 int rtl8365mb_qos_get_apptrust(struct realtek_priv *priv, int port, bool *trust,
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
index f294222987eff8ba283688600c6eaba983669ea6..388013291d50244b251b865e0615e9ae0c084175 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.c
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.c
@@ -16,6 +16,7 @@
 #include <net/dscp.h>
 #include <net/dsa.h>
 #include <net/ieee8021q.h>
+#include <net/pkt_cls.h>
 
 #include "realtek.h"
 #include "rtl83xx-qos.h"
@@ -208,3 +209,115 @@ int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
 					   ARRAY_SIZE(trust));
 }
 EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_apptrust, "REALTEK_DSA");
+
+static int
+rtl83xx_setup_tc_ets_replace(struct dsa_switch *ds, int port,
+			     struct tc_ets_qopt_offload_replace_params *p)
+{
+	struct realtek_priv *priv = ds->priv;
+	unsigned int nq = ds->num_tx_queues;
+	int i;
+
+	/* The qdisc must have one band per queue. */
+	if (p->bands != nq) {
+		dev_err(priv->dev, "port %d: ETS must configure all %u bands\n",
+			port, nq);
+		return -EOPNOTSUPP;
+	}
+
+	/* Only strict bands can be offloaded. */
+	for (i = 0; i < p->bands; i++) {
+		if (p->quanta[i]) {
+			dev_err(priv->dev, "port %d: ETS weighted bands are not supported\n",
+				port);
+			return -EOPNOTSUPP;
+		}
+	}
+
+	/* The switch does not use the priomap. */
+	return priv->ops->qos_set_port_sched(priv, port, nq, true);
+}
+
+/* Forget the offloaded ETS qdisc of @port and put the port back on WFQ */
+static int rtl83xx_setup_tc_ets_restore_wfq(struct dsa_switch *ds, int port)
+{
+	struct realtek_priv *priv = ds->priv;
+	int ret;
+
+	priv->ets_handle[port] = 0;
+
+	ret = priv->ops->qos_set_port_sched(priv, port, ds->num_tx_queues,
+					    false);
+	if (ret)
+		dev_err(priv->dev, "port %d: failed to restore WFQ: %pe\n",
+			port, ERR_PTR(ret));
+
+	return ret;
+}
+
+int rtl83xx_port_setup_tc(struct dsa_switch *ds, int port,
+			  enum tc_setup_type type, void *type_data)
+{
+	struct tc_ets_qopt_offload *ets = type_data;
+	struct realtek_priv *priv = ds->priv;
+	int ret;
+
+	if (type != TC_SETUP_QDISC_ETS || !priv->ops->qos_set_port_sched)
+		return -EOPNOTSUPP;
+
+	if (port >= ARRAY_SIZE(priv->ets_handle) || ets->parent != TC_H_ROOT)
+		return -EOPNOTSUPP;
+
+	switch (ets->command) {
+	case TC_ETS_REPLACE:
+		/* sch_ets keeps the qdisc when the offload fails. Put the
+		 * port back on WFQ so an earlier strict setup does not stay
+		 * active.
+		 */
+		ret = rtl83xx_setup_tc_ets_replace(ds, port,
+						   &ets->replace_params);
+		if (ret) {
+			rtl83xx_setup_tc_ets_restore_wfq(ds, port);
+			return ret;
+		}
+
+		priv->ets_handle[port] = ets->handle;
+
+		return 0;
+
+	case TC_ETS_DESTROY:
+		/* sch_ets offloads a new root qdisc before it destroys the
+		 * old one. Put the port back on WFQ only when DESTROY carries
+		 * the handle that was offloaded last. The new qdisc can fail
+		 * after the driver has offloaded it, for example in its rate
+		 * estimator. In that case qdisc_create() destroys the new
+		 * qdisc. Its DESTROY carries the handle offloaded last, so the
+		 * port goes back to WFQ. The old qdisc keeps running in
+		 * software.
+		 *
+		 * With hw-tc-offload off, sch_ets sends no DESTROY, so the
+		 * port stays strict.
+		 */
+		if (ets->handle != priv->ets_handle[port])
+			return 0;
+
+		return rtl83xx_setup_tc_ets_restore_wfq(ds, port);
+
+	case TC_ETS_STATS:
+		/* Report the qdisc as offloaded. tc_ets_qopt_offload carries
+		 * no extack, so this mark is the only sign in tc that the
+		 * offload was accepted. The stats stay the software ones. They
+		 * count only what the host sends on this port, not traffic
+		 * the switch forwards.
+		 */
+		return ets->handle == priv->ets_handle[port] ? 0 : -EOPNOTSUPP;
+
+	default:
+		/* Child qdiscs (TC_ETS_GRAFT) run in software. If tc has
+		 * marked the parent ets qdisc as offloaded, tc warns about the
+		 * graft.
+		 */
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(rtl83xx_port_setup_tc, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.h b/drivers/net/dsa/realtek/rtl83xx-qos.h
index 06dbfd24b1af5cced870f463f15b1b39eceb56ee..8103c3c42840b55a54e85198d283d5d79d6c6c91 100644
--- a/drivers/net/dsa/realtek/rtl83xx-qos.h
+++ b/drivers/net/dsa/realtek/rtl83xx-qos.h
@@ -16,5 +16,7 @@ int rtl83xx_port_get_apptrust(struct dsa_switch *ds, int port, u8 *sel,
 int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
 			      int nsel);
 int rtl83xx_port_get_dscp_prio(struct dsa_switch *ds, int port, u8 dscp);
+int rtl83xx_port_setup_tc(struct dsa_switch *ds, int port,
+			  enum tc_setup_type type, void *type_data);
 
 #endif /* _RTL83XX_QOS_H */

-- 
2.47.3

