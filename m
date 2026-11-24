Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515666;
	b=aCqmB0RaodlICeb6a658NIZCzQd0QDMQmPOPRWKd9ZzL8b/BmiO0TrbVfq/2IZeyk8Ut
	 wZ4i68hs1xheS0YyGAjWfzOHaRzKQ8yrTvyOr83z4tZQiErN3NNqaWvr/0dI3OdlMRk+D
	 1zOkHyhaxhUmBtvxkyNytahGjQK+iqMzwwmdvle3dxVFNqp+XBYDqsLuKDmwi0txm7iks
	 vg6oJd7XdsjUHWwpLca1eLa8pPqmj+pU6ULBHZhgOwh6uXGIpYqbu7ihSPeAg+6jSFd5z
	 B6L7JeN4r0UPoC85zIJCTZqFiUrkiMo05M4I3b+/7nFCVAIHG5O/NA6mIdGQwApfXEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JiO9APgfnhGYhz/2qxLTxOBrq/wfYcT9UcYmtGnvzMo=;
	b=Zf/NSIKgsuhIfk8BvpBLfEYU0SG6vORBRa9yX/t84T605JjLohwGXtMmBiAMCj/ZdTkC
	 2x7J27Byl4DUUCHwG3kozFl9x2s8+MKXEn3Sv5S3k68AVkvoROEyjEYb+C659FfzS0NAj
	 eeS64WfdlbQ7AfVLyZjBDF2d/nJUDbg1xw2Da89UCcF7sUoyTp3hlMvbEAZRZlSEbJrxx
	 GNwvok2w65IZ1OU4pdscZdTBKZgv9ZLyBeyY0jEKXBdeJ/+kdrjy1R+Fl35yV5vj46eG4
	 OZD/yv44E7oH2kRhI2zESHMbOgHjCK1MZqu03dTVE/cQsoA+fkbQHRmHEDrawMgYFnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="fB/8W1rF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E7606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fB/8W1rF
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6DD35205A10;
	Tue, 24 Nov 2026 11:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiO9APgfnhGYhz/2qxLTxOBrq/wfYcT9UcYmtGnvzMo=;
	b=fB/8W1rF1Mvd6ir4kay4d/+YgxzEBjfj27YAbP8dHtqQmVC2uU4aJJofUPiyUqmrzMqYyX
	FO16O/fXJTTlbzdC6NMbWFBGOjDdfyJHZMEWAjZl3KPN6MKzGVnjXoTW5FskM5++pZE8Aj
	XmACfrk+7EoloBeX+C5Zf/8yri8uFOVkMoT5WFektt+SpO0i1QZqGIPsvAKEE5mLCJ3YHR
	cvdG6Uf1xWMAWiKRokoWLLNcN2Py/bghiVDl2ZNMxPOXAFuXIazfEN4P9uHzxVdOjrOGrJ
	uuDMHrmaXEroPDjO9vU+Q6Hz70BAOOA1XJ8GZ7B4mSXBD8RPxFoIe5sVsu+seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795515663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiO9APgfnhGYhz/2qxLTxOBrq/wfYcT9UcYmtGnvzMo=;
	b=YMeWG9GcsxU7att5CzJUyyV7orPH4WUrVoIWwkkV5AHWh0H4iWdQbGKAfULQgXJZJaAlPv
	BqmpmYFcXjFq5QU8cojjiv1OrqHFvw91fp9ZWIknMqcOXZx+g+5Mut9WkhxEAD5I8TsPgl
	WE0VEk4mZPjH2uSeN2oGgaXMDQzDlYkhGOz3tEk0wOWO44imCUm8WocytvM/GgKBxXUQnJ
	6+xP+wugQFY9rx2MdEesHmqt5Epz5MKhdQGFcPqoF9yIFYlJJO9tsoUH98iyOz01wlpEGd
	J8WlmHFXFnTh1P4uleWQDqr61Var3e7MrpdtKrw2ZQirXEMC0+quBJi9GA9xFA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795515663; a=rsa-sha256;
	cv=none;
	b=RQaD/WlX9ufzLYWw1GkqSYbHffuAd8zWYS6zJB1y7AHqyrmXP8sBhutrwyW3nNgCcLNKdZ
	+W+RPa6KNc8sjKtoo3N93JKvnFFk3b8e7cPh3N3p7lIDj5XxM6IFh1Lss0QxRc+s41aJHr
	t3UxvkY1W58SmZrl53cYeAJOuxM2D4R1HPsgyB0y1BZUTCmUL/Z1otjuK30pOspJ3rSBiR
	MV025WNmNWR7BjSTtSNdkvu53PwkT7mEJaGyMJcRRzKBaKyIlSxSmHaatwHCReTvamfs+Q
	mdoICCcyaWftxMIzA/jFFPQuGd1z0At4/wMifrpRQDF4JiSSvh+vg3hs7yIeDw==
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id 4FEE53801B2; Tue, 24 Nov 2026 11:21:03 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Tue, 24 Nov 2026 11:20:50 +0100
Subject: [PATCH net-next 1/2] net: dsa: realtek: rtl8365mb: default the
 egress scheduler to WFQ
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
Message-Id: <20261124-rtl8365mb-ets-strict-v1-1-6ab01ad545c8@pengutronix.de>
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

Set the egress scheduler of every port in use to WFQ (weighted fair
queuing) with equal weights at setup. WFQ serves all queues of a port
in turn, so no queue is served before another.

The chip resets every queue to strict priority. With strict priority a
busy higher queue can starve the lower ones.

By default every frame gets the Best Effort traffic type and uses one
queue. The scheduler change therefore shows only after apptrust or the
default 802.1Q priority of a port is configured.

The next patch lets tc switch a user port to strict priority. No tc
interface reaches the scheduler of the CPU port, so it stays on WFQ.

The microchip ksz9477 family driver uses the same default.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c |  4 ++
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 90 ++++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |  1 +
 3 files changed, 95 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 6c11c3631eb10f8eebdb8526908534c2256ed12d..a81ef9dfaf970f45a988a1b496c011e0824ba939 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -3199,6 +3199,10 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 	if (ret)
 		goto out_teardown_irq;
 
+	ret = rtl8365mb_qos_sched_init(priv);
+	if (ret)
+		goto out_teardown_irq;
+
 	/* Start with all ports blocked, including unused ports */
 	dsa_switch_for_each_port(dp, ds) {
 		struct rtl8365mb_port *p = &mb->ports[dp->index];
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 5b9e1abe75c8b43b0cb6d07de0fd2ac09353f9d1..25d18cbc6fd1228fb0bf5c535b2a16548d614087 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -90,6 +90,38 @@ static_assert(RTL8365MB_QOS_1Q_REMAP_REG(IEEE_8021Q_MAX_PRIORITIES - 1) <
 static_assert(RTL8365MB_QOS_DSCP_PRI_REG(DSCP_MAX - 1) <
 	      RTL8365MB_QOS_PORT_PRI_REG(0));
 
+/* Egress queue ids per port */
+#define RTL8365MB_QOS_SCHED_QIDS			8
+
+/* Egress scheduler queue type: one bit per (port, queue id), two ports per
+ * register
+ */
+#define RTL8365MB_QOS_SCHED_QTYPE_PORTS_PER_REG		2
+#define RTL8365MB_QOS_SCHED_QTYPE_REG(_p) \
+	(0x0302 + (_p) / RTL8365MB_QOS_SCHED_QTYPE_PORTS_PER_REG)
+#define RTL8365MB_QOS_SCHED_QTYPE_BIT(_p, _qid) \
+	(((_p) % RTL8365MB_QOS_SCHED_QTYPE_PORTS_PER_REG) * \
+	 RTL8365MB_QOS_SCHED_QIDS + (_qid))
+
+#define RTL8365MB_QOS_SCHED_QTYPE_STRICT		0
+#define RTL8365MB_QOS_SCHED_QTYPE_WFQ			1
+
+static_assert(RTL8365MB_QOS_SCHED_QIDS *
+	      RTL8365MB_QOS_SCHED_QTYPE_PORTS_PER_REG <=
+	      RTL8365MB_QOS_REG_BITS);
+
+/* WFQ weight of a queue: one whole register per (port, queue id) */
+#define RTL8365MB_QOS_SCHED_WFQ_WEIGHT_REG(_p, _qid) \
+	(0x030c + (_p) * RTL8365MB_QOS_SCHED_QIDS + (_qid))
+
+/* The unit of the WFQ weight is unknown; the driver writes the same weight to
+ * every queue.
+ */
+#define RTL8365MB_QOS_SCHED_WFQ_WEIGHT_DEFAULT		1
+
+static_assert(RTL8365MB_QOS_SCHED_QTYPE_REG(RTL8365MB_QOS_MAX_PORTS - 1) <
+	      RTL8365MB_QOS_SCHED_WFQ_WEIGHT_REG(0, 0));
+
 /* Priority-decision weight tables. In the driver's model of the decision
  * hardware, a source ranks by its highest set weight bit (a one-hot rank), not
  * by numeric magnitude. A weight of zero disables the source.
@@ -294,6 +326,8 @@ static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
  */
 #define RTL8365MB_QOS_QID_TOP				7
 
+static_assert(RTL8365MB_QOS_QID_TOP < RTL8365MB_QOS_SCHED_QIDS);
+
 static u8 rtl8365mb_qos_tc_to_qid(unsigned int num_queues, u8 tc)
 {
 	if (num_queues > 1 && tc == num_queues - 1)
@@ -334,6 +368,62 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 	return 0;
 }
 
+static int rtl8365mb_qos_write_port_sched(struct realtek_priv *priv, int port,
+					  unsigned int num_queues)
+{
+	u32 weight = RTL8365MB_QOS_SCHED_WFQ_WEIGHT_DEFAULT;
+	unsigned int tc;
+	u32 qtype;
+	int ret;
+	u32 reg;
+
+	if (!num_queues || num_queues > RTL8365MB_QOS_SCHED_QIDS)
+		return -EINVAL;
+
+	reg = RTL8365MB_QOS_SCHED_QTYPE_REG(port);
+	qtype = RTL8365MB_QOS_SCHED_QTYPE_WFQ;
+
+	/* Program the queue ids that the traffic-type-to-queue map uses */
+	for (tc = 0; tc < num_queues; tc++) {
+		u32 mask;
+		u32 wreg;
+		u8 qid;
+
+		qid = rtl8365mb_qos_tc_to_qid(num_queues, tc);
+		mask = BIT(RTL8365MB_QOS_SCHED_QTYPE_BIT(port, qid));
+		wreg = RTL8365MB_QOS_SCHED_WFQ_WEIGHT_REG(port, qid);
+
+		ret = regmap_write(priv->map, wreg, weight);
+		if (ret)
+			return ret;
+
+		ret = rtl8365mb_qos_regmap_update_field(priv, reg, mask, qtype);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* The chip resets every queue to strict priority. Put the ports in use on
+ * WFQ with equal weights.
+ */
+int rtl8365mb_qos_sched_init(struct realtek_priv *priv)
+{
+	unsigned int nq = priv->ds.num_tx_queues;
+	struct dsa_port *dp;
+	int ret;
+
+	/* Unused ports carry no traffic; their scheduler is left alone */
+	dsa_switch_for_each_available_port(dp, &priv->ds) {
+		ret = rtl8365mb_qos_write_port_sched(priv, dp->index, nq);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rtl8365mb_qos_set_pridec(struct realtek_priv *priv, int table,
 				    int src, u8 weight)
 {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 9602807f7db5b9c5bf0202612e4cd77b85079cb7..1daeee16e47294dead49b0843a863991de9731cd 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -19,6 +19,7 @@ struct realtek_priv;
 
 int rtl8365mb_qos_pridec_init(struct realtek_priv *priv);
 int rtl8365mb_qos_qmap_init(struct realtek_priv *priv);
+int rtl8365mb_qos_sched_init(struct realtek_priv *priv);
 int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port);
 int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 				u8 untag_pcp);

-- 
2.47.3

