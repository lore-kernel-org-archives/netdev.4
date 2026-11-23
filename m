Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445755;
	b=seEdIJl50cil7IWRSrJMdzK3NVwqkRbQD3ThfsLGHebq+gbCHzJa6gGea4jtlBCIZTuH
	 hO0RaHq66gGsg/9kuD+S62Qajh9QAyArZJY4qGXmqg66rV8mj2m4sFWXP8SDp/maayOYX
	 AKFNWcHqxTLO/uSAqWnge1mylnlg4N00D86sPLXAWI/VlwREoOcb+6H5qxM4k0AOdlnyp
	 z3kwhnDj1Xrc15kpz43nLCi2vGNq6xJyZcAWr+CGsMtztTsIkyf4hvG/fC7T48ZDe90TJ
	 jGx9jFF4ABzm4kZ8PNfou7Gw3vr1YnWwKXgiGE+lYGiz6Prjtrv6s2K7axfhAtagk7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=pQ4Lb3d9QjNGFcRXzQjd4OKzKPKVlRfQXSiBvxdkeWM=;
	b=1mLMzcfK/AMZ4sXoDdc6F1ynByKvcFoMlAHVC29B3/Stm4ENJyDF97eaNH54o0HYagDc
	 wiOykqco6s9zStgWzcfZlN9g0NxfLaJ9Ft3gOYR6Y429kCZ1lLiQoti7D1F+1VcG/5PHj
	 w01De/PU7Vz0ZafpCmEndqyhpZeBN8BLFjkq2qmGImx/xZYrBGzW6CmxaQGHhnmiuCerJ
	 v48Tg5c7r02lCCSAF0tz5h0FfeCtOUorxTLbMzlPu+1POAIjST/Lj0bSL4I1gL+BtjV7F
	 9utgQZMIYr1xUBII2rTIVd+dX9xzZ+7M5ia0Mbf5YMyxrFjW+hqTHED8xypFFoajQ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=gf4MqAD2;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C246606A682
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C246606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=gf4MqAD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795445755; x=1826981755;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=h+26WBDHY/YtvAefAK30UfvmvaeR2qSYVRv8FmpwRAw=;
  b=gf4MqAD2SuBOXUyc/a8tezmsWchUzKmaKVPz/8hMZ+4BOXdSWjfqaXA3
   55zyvua0Mn/PSSdd4sbfpZSV2O+c+fgzTf2BXsSYHBVrzrZJgsZ9h1BQQ
   Xr1xyJS3a/b4usMJeQkdzK4elbOtOBdNkH4jQczZ3FLMojNblx6SPLYzm
   Y2rnA58kh/1PxlRsLFdaQ9vP5iQ80LbOGJtoSyv+wOHhmABKwq1CeLgY2
   RqIlUdVx3uT0WsQJI/GhUFqYuwSGgXy/7uh3yBM2aGFEFH/VP/UWbJzIP
   8UYkErcxFPj0Or1PMtK6qYqsiiEdW76a62wZyhnD2GclHQaOBZd967jKS
   A==;
X-CSE-ConnectionGUID: Vi7ay+2XQ7yr4R7PUDt3FA==
X-CSE-MsgGUID: iSdTH3luT2+GWEyL94JjiQ==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="298335188"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:55:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 07:55:53 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 07:55:51 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 15:55:47 +0100
Subject: [PATCH net] net: sparx5/lan969x: remove MDB entries on last bridge
 leave
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
Message-ID: <20261123-sparx5-mdb-bridge-leave-v1-1-40b50d7b7a1c@microchip.com>
X-B4-Tracking: v=1; b=H4sIAPJTBGsC/x2MQQqAIBAAvxJ7biE1g/pKdNDcaqEs1ogg+nvSc
 WBmHkgkTAm64gGhixPvMYMqCxgXF2dCDplBV7pRShtMh5Pb4hY8euGQhZXcRRh83Xpl3WhsDbk
 +hCa+/3MPkU4Y3vcD0JPLIm4AAAA=
X-Change-ID: 20261123-sparx5-mdb-bridge-leave-db49b15ac354
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Casper
 Andersson" <casper.casan@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Haoxiang Li" <haoxiang_li2024@163.com>
X-Mailer: b4 0.14.3

sparx5_port_bridge_leave() clears hw_bridge_dev when the last port
leaves the bridge. The bridge deletes the permanent MDB entries of a
port only after the port has left it, in br_multicast_del_port(), and
the deletes reach the driver from the switchdev deferred work.

Before this patch, sparx5_handle_port_mdb_del() then calls
br_vlan_enabled() on the NULL hw_bridge_dev, so deleting a bridge with a
permanent MDB entry on one of its ports crashes the kernel:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000c10
 Workqueue: events switchdev_deferred_process_work
 pc : br_vlan_enabled+0x0/0xc

Remove all MDB entries when the last port leaves the bridge, before
hw_bridge_dev is cleared, and ignore MDB adds and deletes while no
bridge is offloaded. Disable the CPU copy of a host group before its
PGID is freed, as sparx5_pgid_alloc_mcast() does not reset it for the
next group.

The flush also removes host groups, the MDB entries that copy a group to
the CPU. The bridge keeps them, and does not offload them again when a
port rejoins, as sparx5 does not ask it to replay its MDB. Host groups
added before the first port joins the bridge are not offloaded either,
so this matches the existing behaviour.

Found by an internal test. Reproduced on a lan9698 EV board, without
kernel modifications, by deleting a bridge with a permanent group on a
single port:

  ip link add br0 type bridge
  ip link set <port> master br0
  ip link set br0 up
  ip link set <port> up
  bridge mdb add dev br0 port <port> grp 239.1.1.1 permanent
  ip link del br0

The fix was tested against that reproducer on the same board.

Fixes: 3bacfccdcb2d ("net: sparx5: Add mdb handlers")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_switchdev.c   | 41 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
index dac4dd833127a..65ce225baa023 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
@@ -172,6 +172,30 @@ static int sparx5_port_attr_set(struct net_device *dev, const void *ctx,
 	return 0;
 }
 
+static void sparx5_cpu_copy_ena(struct sparx5 *spx5, u16 pgid, bool enable)
+{
+	spx5_rmw(ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA_SET(enable),
+		 ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA, spx5,
+		 ANA_AC_PGID_MISC_CFG(pgid));
+}
+
+static void sparx5_mdb_flush(struct sparx5 *sparx5)
+{
+	struct sparx5_mdb_entry *entry, *tmp;
+
+	mutex_lock(&sparx5->mdb_lock);
+	list_for_each_entry_safe(entry, tmp, &sparx5->mdb_entries, list) {
+		if (entry->cpu_copy)
+			sparx5_cpu_copy_ena(sparx5, entry->pgid_idx, false);
+		sparx5_pgid_clear(sparx5, entry->pgid_idx);
+		sparx5_mact_forget(sparx5, entry->addr, entry->vid);
+		list_del(&entry->list);
+		sparx5_pgid_free(sparx5, entry->pgid_idx);
+		kfree(entry);
+	}
+	mutex_unlock(&sparx5->mdb_lock);
+}
+
 static int sparx5_port_bridge_join(struct sparx5_port *port,
 				   struct net_device *bridge,
 				   struct netlink_ext_ack *extack)
@@ -227,8 +251,10 @@ static void sparx5_port_bridge_leave(struct sparx5_port *port,
 	switchdev_bridge_port_unoffload(port->ndev, NULL, NULL, NULL);
 
 	clear_bit(port->portno, sparx5->bridge_mask);
-	if (bitmap_empty(sparx5->bridge_mask, SPX5_PORTS))
+	if (bitmap_empty(sparx5->bridge_mask, SPX5_PORTS)) {
+		sparx5_mdb_flush(sparx5);
 		sparx5->hw_bridge_dev = NULL;
+	}
 
 	/* Clear bridge vlan settings before updating the port settings */
 	port->vlan_aware = 0;
@@ -528,13 +554,6 @@ static struct sparx5_mdb_entry *sparx5_mdb_get_entry(struct sparx5 *sparx5,
 	return found;
 }
 
-static void sparx5_cpu_copy_ena(struct sparx5 *spx5, u16 pgid, bool enable)
-{
-	spx5_rmw(ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA_SET(enable),
-		 ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA, spx5,
-		 ANA_AC_PGID_MISC_CFG(pgid));
-}
-
 static int sparx5_handle_port_mdb_add(struct net_device *dev,
 				      struct notifier_block *nb,
 				      const struct switchdev_obj_port_mdb *v)
@@ -549,6 +568,9 @@ static int sparx5_handle_port_mdb_add(struct net_device *dev,
 	if (!sparx5_netdevice_check(dev))
 		return -EOPNOTSUPP;
 
+	if (!spx5->hw_bridge_dev)
+		return 0;
+
 	is_host = netif_is_bridge_master(v->obj.orig_dev);
 
 	/* When VLAN unaware the vlan value is not parsed and we receive vid 0.
@@ -605,6 +627,9 @@ static int sparx5_handle_port_mdb_del(struct net_device *dev,
 	if (!sparx5_netdevice_check(dev))
 		return -EOPNOTSUPP;
 
+	if (!spx5->hw_bridge_dev)
+		return 0;
+
 	is_host = netif_is_bridge_master(v->obj.orig_dev);
 
 	if (!br_vlan_enabled(spx5->hw_bridge_dev))

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-sparx5-mdb-bridge-leave-db49b15ac354

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

