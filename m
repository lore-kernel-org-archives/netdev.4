Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510682;
	b=w1pltPshovvg0gGmIKSx7M9EdKxxZl/XL5i/CcMLc5qj76DvoY3kzhFKvUFvx4t5UTFB
	 pmZAItxlpb2ZuaTU95tZvcokPQQCi6ChGFt22O5dGXiSzkD59KQP4mgF7KC2CGgndjipZ
	 pQVFU4ocUOF+gcEFG6c7oFu03F35UuAOA/X1KoMpPAQhE2829dxEF+JkWlDkIGH7x4ca2
	 oINtfuLrNjWTZFXXbsU1R+9PZ6aq7Ys9MHd7JBJ7neDnsS4txXWeHv3A73BUVQmiBSs+O
	 L7xbXV4hy2DgkfbaqqobjUKahP1aijXaF1g0q/hxHZIjwM9YBR8tTGa64r+mbt5p8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510682;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=/qFa1O8vLOtR4YvjqkdMvi36Z4o8H2m460vWgq1RVbA=;
	b=GbUYVdFcUvBldGb/jNI4206poln75jZVv7bZ9WvqNkMYx0Fer8F273LPajYX4p1IxgA7
	 0JcUULs+jYZ6njD2dVf2NbtO5nPxZN8gAAARAGHjmWc6cKdAecF8Bw7tucsaxSQcbEmlo
	 K8kIAK1GAuq1Fh7EdKoPYUOdHW3Rd4xapa2nOIkHuF231MKgL7bQusHWqksc+MYvt4thb
	 ZcAvsnsy0GlhVMshHdWYF7wp+h2DS6tFcTftQYP2gIAOuSg7VjXcj3/tAD52bXhVr+sRC
	 IrRPhjha9CMvLgploSVfVeokeBwftJUD67HIj0AIQBdtTw2bUkb4ZXQS8YnUrpYKOqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=asjtSzQD;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18157606A688;
	Tue, 24 Nov 2026 08:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18157606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=asjtSzQD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795510677; x=1827046677;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=INdDh1YNRzoYMmEi0WV5FyymYa3ei+n7l2LBJuG2mys=;
  b=asjtSzQDbcbzdpstvghUWqLdimEVoBftt1f/8rZ1/RtesxUmTY2LCwd+
   8vuRAwFH0SsqRrvArE35AazDYRof0zzWL/AvKFHXFgeDfhx+0uSHsptHa
   yU9wbWrTdT4eau8eJ94QMtsbYvpmsfTGoS8SK4i0GaMflrWLafaFoujPQ
   pG5Rin4LQj/m7Jfp380EG/WtXa/pxrC/zmZP7Iq+oHYhS/hge2twd5F9i
   O8d1FsU9wKeeqagt76p3VhRv+7nEB9k//YYZVHkVVKz8T8v1BHIJfDlE9
   j8nnatjtEw50yAcSM6+Bqy3Q3pK8eC7Dh7RgYLBEfIAnQQwITyD5GXiIp
   w==;
X-CSE-ConnectionGUID: bhEfkTUYQGetrok10EnLRw==
X-CSE-MsgGUID: jyBF56u5Twi6z3zhynrRQQ==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="298378279"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 01:57:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 01:57:54 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 01:57:52 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Tue, 24 Nov 2026 09:57:11 +0100
Subject: [PATCH net-next 5/5] net: dsa: lan9645x: add bridge support
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-5-b930a1dae700@microchip.com>
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com>
In-Reply-To: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, "Vladimir
 Oltean" <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Add support for hardware offloading of the bridge. Up to 8 bridges can
be offloaded, and each VLAN-unaware bridge uses its own reserved VID.
The source port masks only forward between forwarding ports of the same
bridge.

At most one bridge can be VLAN-aware, since the MAC table has no other
way to keep the FDB domains of two bridges with the same VIDs apart.
Joining a second VLAN-aware bridge or enabling VLAN filtering on a
second bridge is refused.

The CPU port module is no longer in the unicast and multicast flood
masks by default. It is added through .port_set_host_flood while any
port is promiscuous or allmulti. The flood masks are global and not per
ingress port, so one port requesting host flooding makes unknown unicast
or unregistered multicast from every port reach the CPU.

Mac entry ageing can be configured with a 2s granularity, and a
requested time is rounded down. An ANA_AUTOAGE.AGE_PERIOD of 0 stops the
analyzer from ageing at all, which is the opposite of the software
bridge with an ageing time of 0. So ds->ageing_time_min and
ds->ageing_time_max let the DSA core reject unsupported configurations.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.c | 317 ++++++++++++++++++++-
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.h |   7 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c |   9 +
 3 files changed, 322 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
index de432772f639..a78410efb973 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
@@ -285,19 +285,15 @@ static int lan9645x_setup(struct dsa_switch *ds)
 
 	lan9645x_port_cpu_init(lan9645x);
 
-	/* Multicast to cpu and all front ports */
-	lan_wr(BIT(lan9645x->num_phys_ports) | front_ports, lan9645x,
-	       ANA_PGID(PGID_MC));
+	/* Multicast to all front ports */
+	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MC));
 
-	/* IP multicast to cpu and all front ports */
-	lan_wr(BIT(lan9645x->num_phys_ports) | front_ports, lan9645x,
-	       ANA_PGID(PGID_MCIPV4));
-	lan_wr(BIT(lan9645x->num_phys_ports) | front_ports, lan9645x,
-	       ANA_PGID(PGID_MCIPV6));
+	/* IP multicast to all front ports */
+	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV4));
+	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV6));
 
-	/* Unicast to cpu and all front ports */
-	lan_wr(BIT(lan9645x->num_phys_ports) | front_ports, lan9645x,
-	       ANA_PGID(PGID_UC));
+	/* Unicast to all front ports */
+	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_UC));
 
 	/* Broadcast to cpu and all front ports */
 	lan_wr(BIT(lan9645x->num_phys_ports) | front_ports, lan9645x,
@@ -306,6 +302,20 @@ static int lan9645x_setup(struct dsa_switch *ds)
 	ds->mtu_enforcement_ingress = true;
 	ds->assisted_learning_on_cpu_port = true;
 	ds->fdb_isolation = true;
+	ds->max_num_bridges = ds->num_ports;
+
+	/* ANA_AUTOAGE_AGE_PERIOD is a seconds-based field and entries are
+	 * aged after 2 * AGE_PERIOD, giving (2 * FIELD_MAX) seconds of
+	 * maximum aging and 2 seconds of minimum aging.
+	 *
+	 * An AGE_PERIOD of 0 stops the analyzer from aging at all, which is
+	 * the opposite of what a bridge ageing_time of 0 means. The bridge
+	 * expires every dynamic entry immediately in that case and floods, so
+	 * reject it rather than keep learned addresses forever.
+	 */
+	ds->ageing_time_min = 2U * MSEC_PER_SEC;
+	ds->ageing_time_max = 2U * MSEC_PER_SEC *
+			      FIELD_MAX(ANA_AUTOAGE_AGE_PERIOD);
 
 	dev_info(lan9645x->dev,
 		 "SKU features: max_ports=%d\n",
@@ -325,6 +335,275 @@ static void lan9645x_port_phylink_get_caps(struct dsa_switch *ds, int port,
 	lan9645x_phylink_get_caps(ds->priv, port, config);
 }
 
+static int lan9645x_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
+{
+	struct lan9645x *lan9645x = ds->priv;
+
+	/* Entry must suffer two aging scans before it is removed, so it is
+	 * aged after 2*AGE_PERIOD, and the unit is in seconds.
+	 */
+	lan_rmw(ANA_AUTOAGE_AGE_PERIOD_SET(msecs / (2 * MSEC_PER_SEC)),
+		ANA_AUTOAGE_AGE_PERIOD,
+		lan9645x, ANA_AUTOAGE);
+
+	return 0;
+}
+
+static int lan9645x_port_pre_bridge_flags(struct dsa_switch *ds, int port,
+					  struct switchdev_brport_flags flags,
+					  struct netlink_ext_ack *extack)
+{
+	if (flags.mask &
+	    ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void lan9645x_port_pgid_set(struct lan9645x *lan9645x, u16 pgid,
+				   int chip_port, bool enabled)
+{
+	u32 reg_msk, port_msk;
+
+	port_msk = ANA_PGID_PGID_SET(enabled ? BIT(chip_port) : 0);
+	reg_msk = ANA_PGID_PGID_SET(BIT(chip_port));
+
+	lan_rmw(port_msk, reg_msk, lan9645x, ANA_PGID(pgid));
+}
+
+static void lan9645x_port_apply_learning(struct lan9645x_port *p)
+{
+	struct lan9645x *lan9645x = p->lan9645x;
+	bool ena;
+
+	lockdep_assert_held(&lan9645x->fwd_domain_lock);
+
+	ena = lan9645x_port_is_bridged(p) && p->learn_ena &&
+	      (p->stp_state == BR_STATE_LEARNING ||
+	       p->stp_state == BR_STATE_FORWARDING);
+
+	lan_rmw(ANA_PORT_CFG_LEARN_ENA_SET(ena), ANA_PORT_CFG_LEARN_ENA,
+		lan9645x, ANA_PORT_CFG(p->chip_port));
+}
+
+static void lan9645x_port_set_learning(struct lan9645x *lan9645x, int port,
+				       bool enabled)
+{
+	struct lan9645x_port *p = lan9645x_to_port(lan9645x, port);
+
+	mutex_lock(&lan9645x->fwd_domain_lock);
+	p->learn_ena = enabled;
+	lan9645x_port_apply_learning(p);
+	mutex_unlock(&lan9645x->fwd_domain_lock);
+}
+
+static int lan9645x_port_bridge_flags(struct dsa_switch *ds, int port,
+				      struct switchdev_brport_flags f,
+				      struct netlink_ext_ack *extack)
+{
+	struct lan9645x *lan9645x = ds->priv;
+
+	/* DSA core does not call this for the CPU port */
+	if (f.mask & BR_LEARNING)
+		lan9645x_port_set_learning(lan9645x, port,
+					   !!(f.val & BR_LEARNING));
+
+	if (f.mask & BR_FLOOD)
+		lan9645x_port_pgid_set(lan9645x, PGID_UC, port,
+				       !!(f.val & BR_FLOOD));
+
+	if (f.mask & BR_MCAST_FLOOD) {
+		bool ena = !!(f.val & BR_MCAST_FLOOD);
+
+		lan9645x_port_pgid_set(lan9645x, PGID_MC, port, ena);
+		lan9645x_port_pgid_set(lan9645x, PGID_MCIPV4, port, ena);
+		lan9645x_port_pgid_set(lan9645x, PGID_MCIPV6, port, ena);
+	}
+
+	if (f.mask & BR_BCAST_FLOOD)
+		lan9645x_port_pgid_set(lan9645x, PGID_BC, port,
+				       !!(f.val & BR_BCAST_FLOOD));
+
+	return 0;
+}
+
+static u32 lan9645x_port_bridge_fwd_mask(struct lan9645x *lan9645x,
+					 struct lan9645x_port *p)
+{
+	struct lan9645x_port *q;
+	struct dsa_port *dp;
+	u32 mask = 0;
+
+	dsa_switch_for_each_user_port(dp, lan9645x->ds) {
+		q = lan9645x_to_port(lan9645x, dp->index);
+		if (q != p && q->bridge_num == p->bridge_num)
+			mask |= BIT(dp->index);
+	}
+
+	return mask & lan9645x->bridge_fwd_mask;
+}
+
+static void lan9645x_update_fwd_mask(struct lan9645x *lan9645x)
+{
+	struct lan9645x_port *p;
+	struct dsa_port *dp;
+
+	lockdep_assert_held(&lan9645x->fwd_domain_lock);
+
+	/* Updates the source port PGIDs, making sure frames from p
+	 * are only forwarded to ports q != p, where q is relevant to forward
+	 */
+	dsa_switch_for_each_available_port(dp, lan9645x->ds) {
+		u32 mask = 0;
+
+		p = lan9645x_to_port(lan9645x, dp->index);
+
+		if (lan9645x_port_is_bridged(p) &&
+		    (lan9645x->bridge_fwd_mask & BIT(dp->index)))
+			mask = lan9645x_port_bridge_fwd_mask(lan9645x, p);
+
+		lan_wr(ANA_PGID_PGID_SET(mask), lan9645x,
+		       ANA_PGID(PGID_SRC + dp->index));
+	}
+}
+
+static void lan9645x_port_set_host_flood(struct dsa_switch *ds, int port,
+					 bool uc, bool mc)
+{
+	struct lan9645x *lan9645x = ds->priv;
+	int cpu = lan9645x->num_phys_ports;
+	bool uc_ena, mc_ena;
+
+	mutex_lock(&lan9645x->fwd_domain_lock);
+
+	if (uc)
+		lan9645x->host_flood_uc_mask |= BIT(port);
+	else
+		lan9645x->host_flood_uc_mask &= ~BIT(port);
+
+	if (mc)
+		lan9645x->host_flood_mc_mask |= BIT(port);
+	else
+		lan9645x->host_flood_mc_mask &= ~BIT(port);
+
+	uc_ena = !!lan9645x->host_flood_uc_mask;
+	mc_ena = !!lan9645x->host_flood_mc_mask;
+
+	lan9645x_port_pgid_set(lan9645x, PGID_UC, cpu, uc_ena);
+	lan9645x_port_pgid_set(lan9645x, PGID_MC, cpu, mc_ena);
+	lan9645x_port_pgid_set(lan9645x, PGID_MCIPV4, cpu, mc_ena);
+	lan9645x_port_pgid_set(lan9645x, PGID_MCIPV6, cpu, mc_ena);
+
+	mutex_unlock(&lan9645x->fwd_domain_lock);
+}
+
+static int lan9645x_single_vlan_aware_bridge(struct dsa_switch *ds,
+					     const struct net_device *br,
+					     struct netlink_ext_ack *extack)
+{
+	struct net_device *other;
+	struct dsa_port *dp;
+
+	dsa_switch_for_each_user_port(dp, ds) {
+		other = dsa_port_bridge_dev_get(dp);
+		if (other && other != br && br_vlan_enabled(other)) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Only one VLAN-aware bridge is supported");
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int lan9645x_port_bridge_join(struct dsa_switch *ds, int port,
+				     struct dsa_bridge bridge,
+				     bool *tx_fwd_offload,
+				     struct netlink_ext_ack *extack)
+{
+	struct lan9645x *lan9645x = ds->priv;
+	struct lan9645x_port *p;
+	int err;
+
+	if (!lan9645x_bridge_vlan_proto_ok(bridge.dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only 802.1Q VLAN-aware bridges are supported");
+		return -EINVAL;
+	}
+
+	if (br_vlan_enabled(bridge.dev)) {
+		err = lan9645x_single_vlan_aware_bridge(ds, bridge.dev, extack);
+		if (err)
+			return err;
+	}
+
+	p = lan9645x_to_port(lan9645x, port);
+
+	mutex_lock(&lan9645x->fwd_domain_lock);
+
+	p->bridge_num = bridge.num;
+	lan9645x_vlan_port_set_bridge_vid(p, !p->vlan_aware);
+	/* DSA sets the bridge port flags before the STP state. Start disabled,
+	 * so the inherited BR_LEARNING does not enable learning in between.
+	 */
+	lan9645x->bridge_fwd_mask &= ~BIT(p->chip_port);
+	p->stp_state = BR_STATE_DISABLED;
+	lan9645x_vlan_clear_hostmode(p);
+
+	mutex_unlock(&lan9645x->fwd_domain_lock);
+
+	/* Forwarding is updated by .port_stp_state_set(), which the core
+	 * invokes after this returns:
+	 * dsa_port_bridge_join() -> dsa_port_switchdev_sync_attrs() ->
+	 * dsa_port_set_state()
+	 */
+
+	return 0;
+}
+
+static void lan9645x_port_bridge_stp_state_set(struct dsa_switch *ds, int port,
+					       u8 state)
+{
+	struct lan9645x *lan9645x;
+	struct lan9645x_port *p;
+
+	lan9645x = ds->priv;
+	p = lan9645x_to_port(lan9645x, port);
+
+	mutex_lock(&lan9645x->fwd_domain_lock);
+
+	p->stp_state = state;
+
+	if (state == BR_STATE_FORWARDING)
+		lan9645x->bridge_fwd_mask |= BIT(p->chip_port);
+	else
+		lan9645x->bridge_fwd_mask &= ~BIT(p->chip_port);
+
+	lan9645x_port_apply_learning(p);
+	lan9645x_update_fwd_mask(lan9645x);
+	mutex_unlock(&lan9645x->fwd_domain_lock);
+}
+
+static void lan9645x_port_bridge_leave(struct dsa_switch *ds, int port,
+				       struct dsa_bridge bridge)
+{
+	struct lan9645x *lan9645x = ds->priv;
+	struct lan9645x_port *p;
+
+	p = lan9645x_to_port(lan9645x, port);
+
+	mutex_lock(&lan9645x->fwd_domain_lock);
+
+	lan9645x_vlan_port_set_bridge_vid(p, false);
+	p->bridge_num = 0;
+
+	lan9645x_vlan_set_hostmode(p);
+	lan9645x_port_apply_learning(p);
+	lan9645x_update_fwd_mask(lan9645x);
+
+	mutex_unlock(&lan9645x->fwd_domain_lock);
+}
+
 static int lan9645x_port_vlan_filtering(struct dsa_switch *ds, int port,
 					bool enabled,
 					struct netlink_ext_ack *extack)
@@ -332,6 +611,7 @@ static int lan9645x_port_vlan_filtering(struct dsa_switch *ds, int port,
 	struct net_device *br = dsa_port_bridge_dev_get(dsa_to_port(ds, port));
 	struct lan9645x *lan9645x = ds->priv;
 	struct lan9645x_port *p;
+	int err;
 
 	if (enabled && !lan9645x_bridge_vlan_proto_ok(br)) {
 		NL_SET_ERR_MSG_MOD(extack,
@@ -339,6 +619,12 @@ static int lan9645x_port_vlan_filtering(struct dsa_switch *ds, int port,
 		return -EINVAL;
 	}
 
+	if (enabled && br) {
+		err = lan9645x_single_vlan_aware_bridge(ds, br, extack);
+		if (err)
+			return err;
+	}
+
 	/* DSA core does not call this for the CPU port */
 	p = lan9645x_to_port(lan9645x, port);
 	mutex_lock(&lan9645x->fwd_domain_lock);
@@ -541,6 +827,15 @@ static const struct dsa_switch_ops lan9645x_switch_ops = {
 	.port_change_mtu		= lan9645x_change_mtu,
 	.port_max_mtu			= lan9645x_get_max_mtu,
 
+	/* Bridge integration */
+	.set_ageing_time		= lan9645x_set_ageing_time,
+	.port_pre_bridge_flags		= lan9645x_port_pre_bridge_flags,
+	.port_bridge_flags		= lan9645x_port_bridge_flags,
+	.port_bridge_join		= lan9645x_port_bridge_join,
+	.port_bridge_leave		= lan9645x_port_bridge_leave,
+	.port_stp_state_set		= lan9645x_port_bridge_stp_state_set,
+	.port_set_host_flood		= lan9645x_port_set_host_flood,
+
 	/* VLAN integration */
 	.port_vlan_filtering		= lan9645x_port_vlan_filtering,
 	.port_vlan_add			= lan9645x_port_vlan_add,
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
index caad6871a657..90cde5e2ecda 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
@@ -192,12 +192,16 @@ struct lan9645x {
 	struct dsa_switch *ds;
 	struct regmap *rmap[NUM_TARGETS];
 
+	u16 host_flood_uc_mask;
+	u16 host_flood_mc_mask;
+
 	/* NPI chip_port */
 	int npi;
 
 	u8 num_phys_ports;
 	struct lan9645x_port **ports;
 
+	u16 bridge_fwd_mask; /* Mask for ports in STP forwarding state */
 	/* lock forwarding configuration and vlan table */
 	struct mutex fwd_domain_lock;
 	struct mutex mact_lock; /* serialize mac table register access */
@@ -220,6 +224,8 @@ struct lan9645x_port {
 	struct lan9645x *lan9645x;
 
 	u8 chip_port;
+	u8 stp_state;
+	bool learn_ena;
 
 	unsigned int bridge_num;
 	bool vlan_aware;
@@ -388,6 +394,7 @@ int lan9645x_vlan_port_add_vlan(struct lan9645x_port *p, u16 vid, bool pvid,
 				struct netlink_ext_ack *extack);
 int lan9645x_vlan_port_del_vlan(struct lan9645x_port *p, u16 vid);
 void lan9645x_vlan_set_hostmode(struct lan9645x_port *p);
+void lan9645x_vlan_clear_hostmode(struct lan9645x_port *p);
 
 /* MAC table: lan9645x_mac.c */
 int lan9645x_mact_flush(struct lan9645x *lan9645x, int port);
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c
index 3ad9afc27b45..0aa711b68825 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c
@@ -360,6 +360,15 @@ void lan9645x_vlan_port_set_bridge_vid(struct lan9645x_port *p, bool member)
 	lan9645x_vlan_hw_wr(lan9645x, vid);
 }
 
+void lan9645x_vlan_clear_hostmode(struct lan9645x_port *p)
+{
+	lockdep_assert_held(&p->lan9645x->fwd_domain_lock);
+
+	p->lan9645x->vlans[HOST_PVID].portmask &= ~BIT(p->chip_port);
+	lan9645x_vlan_hw_wr(p->lan9645x, HOST_PVID);
+	lan9645x_vlan_port_apply(p);
+}
+
 int lan9645x_vlan_init(struct lan9645x *lan9645x)
 {
 	u32 all_phys_ports, all_ports;

-- 
2.52.0

