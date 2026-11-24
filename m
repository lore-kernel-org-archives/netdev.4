Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510674;
	b=lXfKM3vPu04695fdQeKy8SeqQ9iLEfJKqW9kZ5KlO4WZvPN8WQwD9IUDW3g7z7yUACSR
	 QVE2h9BXLyr5vE6vecS5RDvYOn6SCqzJ/8U9FxSSpRvVXHeSiXf8ZlBccgOYuI/5RtgDt
	 32hwq5A3B2j+Rlp+07h8vX+8l445o2qjVOZTMAeRWXNF/Rt5MX0+YsegRSGOZEaNma2Yh
	 HGf6raiEKtxL8quYo/8QLPMxjLMYd6353RVBWKFBhgWFZHvgU6BOb5o3xUzugdALLLLDC
	 FZegcVFjj9Avq2/YwuEP54m4XBSdndpQsG1uK1dD9vS4vwnFO5hi111ej4FhjnoKI2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510674;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=/iN0vbF2XTuS/fbzK375mnaunIxnMOdYdltiy8tnPKY=;
	b=0H3tOE+KdQhSxxn2hiF1dIql4Q5hKe/n78M1Ee0MMMdRk8DfKRu79IA2L/EWrONDwpWc
	 fgtQxqhOH/go27BA/YWsf+rbpUEfBkhU5oxFJhuQx5RaDhrrzdbigCFqsUawqndcGWUrj
	 6y3Dogxlbha1t3kml0tSqUF21AaKoqzdRxeHpM+J/kT5YsDcEtsjOIzJE5SLOT+r1fphH
	 fa8Wm8RU4Jft2k29J3jHlRU6kYu8kKIjb9j/OmZQ2FoBcncFOyWkkhuwLBcpfw+gKSNIy
	 LdgrGUQEnSU681VEGfr7VaLArZQ2ie0OBKgSC5PbppRZILzao/1/0mL9HEiMfZGDc9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=e+AZTDDL;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF27606A69F;
	Tue, 24 Nov 2026 08:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF27606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=e+AZTDDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795510673; x=1827046673;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pyMR+YLP+dumekm3bxvPp0VRIhwiWd+uZaUIVmo0lM4=;
  b=e+AZTDDLtL9fAVUFRXU8vKh6UZRiofRAiLAMePMYN5v5ddrDF0TPzprz
   QQEwFpa+kXiRny6DMpIwricJE6AUZIakKAkQM1z8nh5jTONMU9W8MfXNO
   ro3G9tk7bSsrYD/g0U0cExyVriQ9tTSjYV4JeOonmPu6JJHew3AufJ9ev
   8vSqcLT4qvDRLdYbvOlWzQpkURr7BggsmpLf7Fjj1/pA/kkG1zK2LFo8t
   MTny77j/IGiXlwAEylFIq8uulvROigsOP9DgQg0w94XTS0decnkE5MFTs
   44UsA80l01ff09MV+stKfGi2iajY/m4hNEZvEZg5PztHQzAm6ULMV08gh
   Q==;
X-CSE-ConnectionGUID: 83lJOeMmSIGiKhSCkCvkdw==
X-CSE-MsgGUID: QDVENR2xRUCfprHJVWNZ3Q==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="65995593"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 01:57:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 01:57:52 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 01:57:50 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Tue, 24 Nov 2026 09:57:10 +0100
Subject: [PATCH net-next 4/5] net: dsa: lan9645x: add mdb management
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
Message-ID: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-4-b930a1dae700@microchip.com>
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

Add support for dsa mdb callbacks. L2 multicast and IP multicast is
handled differently. IP multicast stores the port group mask inline in
the mac table, and host membership in the MAC_CPU_COPY bit of the
entry. L2 multicast points at a PGID, whose destination mask is the port
group, including the CPU port module.

Each L2 multicast group owns one of the general purpose PGIDs. When they
are exhausted, adding a new group fails with -ENOSPC and the group is
not offloaded.

Removing a port from a group always succeeds. The
switchdev_port_obj_del_deferred() path only logs an error, while
br_switchdev_mdb_replay() abandons the remaining entries after the first
failure, so failing one delete during a bridge leave would leave the
other groups programmed. A failed MAC table command is logged instead.

IGMP and MLD frames are redirected to the CPU, and IPv4 multicast
control frames are copied to it, so that the bridge can snoop them.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/net/dsa/microchip/lan9645x/Makefile        |   1 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.c |  61 +++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.h |  20 ++
 drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c  | 256 +++++++++++++++++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_port.c |   8 +
 5 files changed, 346 insertions(+)

diff --git a/drivers/net/dsa/microchip/lan9645x/Makefile b/drivers/net/dsa/microchip/lan9645x/Makefile
index 70815edca5b9..2413d11fe849 100644
--- a/drivers/net/dsa/microchip/lan9645x/Makefile
+++ b/drivers/net/dsa/microchip/lan9645x/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_NET_DSA_MICROCHIP_LAN9645X) += mchp-lan9645x.o
 mchp-lan9645x-objs := \
 	lan9645x_mac.o \
 	lan9645x_main.o \
+	lan9645x_mdb.o \
 	lan9645x_npi.o \
 	lan9645x_phylink.o \
 	lan9645x_port.o \
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
index 904b51a55d93..de432772f639 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
@@ -71,6 +71,7 @@ static void lan9645x_teardown(struct dsa_switch *ds)
 {
 	struct lan9645x *lan9645x = ds->priv;
 
+	lan9645x_mdb_deinit(lan9645x);
 	lan9645x_mac_deinit(lan9645x);
 	mutex_destroy(&lan9645x->fwd_domain_lock);
 	lan9645x_npi_port_deinit(lan9645x, lan9645x->npi);
@@ -168,6 +169,7 @@ static int lan9645x_setup(struct dsa_switch *ds)
 	err = lan9645x_mac_init(lan9645x);
 	if (err)
 		goto err_mutex;
+	lan9645x_mdb_init(lan9645x);
 
 	/* Link Aggregation Mode: NETDEV_LAG_HASH_L2 */
 	lan_wr(ANA_AGGR_CFG_AC_SMAC_ENA |
@@ -255,6 +257,17 @@ static int lan9645x_setup(struct dsa_switch *ds)
 			lan9645x, ANA_CPUQ_8021_CFG(i));
 	}
 
+	/* Use CPU queues to communicate frame classification to the CPU */
+	lan_rmw(ANA_CPUQ_CFG_CPUQ_MAC_COPY_SET(LAN9645X_CPUQ_DEF) |
+		ANA_CPUQ_CFG_CPUQ_IGMP_SET(LAN9645X_CPUQ_TRAP) |
+		ANA_CPUQ_CFG_CPUQ_MLD_SET(LAN9645X_CPUQ_TRAP) |
+		ANA_CPUQ_CFG_CPUQ_IPMC_CTRL_SET(LAN9645X_CPUQ_COPY),
+		ANA_CPUQ_CFG_CPUQ_MAC_COPY |
+		ANA_CPUQ_CFG_CPUQ_IGMP |
+		ANA_CPUQ_CFG_CPUQ_MLD |
+		ANA_CPUQ_CFG_CPUQ_IPMC_CTRL,
+		lan9645x, ANA_CPUQ_CFG);
+
 	/* Reserve 1664 bytes, 26 buffer cells, per (port, prio) for source
 	 * tracking (resource 0, indices 0..95) and destination tracking
 	 * (resource 2, indices 512..607). These are access watermarks, not
@@ -470,6 +483,50 @@ static int lan9645x_fdb_del(struct dsa_switch *ds, int port,
 				    ENTRYTYPE_LOCKED);
 }
 
+static int lan9645x_port_mdb_add(struct dsa_switch *ds, int port,
+				 const struct switchdev_obj_port_mdb *mdb,
+				 struct dsa_db db)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct lan9645x *lan9645x = ds->priv;
+
+	dev_dbg(lan9645x->dev, "port=%d addr=%pM vid=%u\n", port, mdb->addr,
+		mdb->vid);
+
+	if (dsa_port_is_cpu(dp) &&
+	    lan9645x_host_addr_shared(dp, &dp->mdbs, mdb->addr, mdb->vid, &db))
+		return 0;
+
+	if (port == lan9645x->npi)
+		port = lan9645x->num_phys_ports;
+
+	return lan9645x_mdb_add(lan9645x, port, mdb->addr,
+				lan9645x_fdb_vid(mdb->vid, &db));
+}
+
+static int lan9645x_port_mdb_del(struct dsa_switch *ds, int port,
+				 const struct switchdev_obj_port_mdb *mdb,
+				 struct dsa_db db)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct lan9645x *lan9645x = ds->priv;
+
+	dev_dbg(lan9645x->dev, "port=%d addr=%pM vid=%u\n", port, mdb->addr,
+		mdb->vid);
+
+	if (dsa_port_is_cpu(dp) &&
+	    lan9645x_host_addr_shared(dp, &dp->mdbs, mdb->addr, mdb->vid, &db))
+		return 0;
+
+	if (port == lan9645x->npi)
+		port = lan9645x->num_phys_ports;
+
+	lan9645x_mdb_del(lan9645x, port, mdb->addr,
+			 lan9645x_fdb_vid(mdb->vid, &db));
+
+	return 0;
+}
+
 static const struct dsa_switch_ops lan9645x_switch_ops = {
 	.get_tag_protocol		= lan9645x_get_tag_protocol,
 
@@ -494,6 +551,10 @@ static const struct dsa_switch_ops lan9645x_switch_ops = {
 	.port_fdb_dump			= lan9645x_fdb_dump,
 	.port_fdb_add			= lan9645x_fdb_add,
 	.port_fdb_del			= lan9645x_fdb_del,
+
+	/* Multicast database */
+	.port_mdb_add			= lan9645x_port_mdb_add,
+	.port_mdb_del			= lan9645x_port_mdb_del,
 };
 
 static int lan9645x_request_target_regmaps(struct lan9645x *lan9645x)
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
index 1bf9f49dc231..caad6871a657 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.h
@@ -85,6 +85,10 @@
 #define PGID_AGGR			64
 #define PGID_SRC			80
 
+/* General purpose PGIDs. PGID 57 is reserved for a later blackhole PGID. */
+#define PGID_GP_START			NUM_PHYS_PORTS
+#define PGID_GP_END			(PGID_AGGR - 7)
+
 /* Reserved PGIDs. */
 #define PGID_CPU			(PGID_AGGR - 6)
 #define PGID_UC				(PGID_AGGR - 5)
@@ -198,6 +202,14 @@ struct lan9645x {
 	struct mutex fwd_domain_lock;
 	struct mutex mact_lock; /* serialize mac table register access */
 
+	/* Multicast Forwarding Database */
+	struct list_head mdb_entries;
+	DECLARE_BITMAP(mdb_pgids, PGID_GP_END);
+	/* lock for mdb_entries and mdb_pgids. Must be taken before mact_lock
+	 * if both are taken.
+	 */
+	struct mutex mdb_lock;
+
 	int num_port_dis;
 
 	/* VLAN entries */
@@ -390,4 +402,12 @@ void lan9645x_mac_deinit(struct lan9645x *lan9645x);
 int lan9645x_mact_dsa_dump(struct lan9645x *lan9645x, int port,
 			   dsa_fdb_dump_cb_t *cb, void *data);
 
+/* Multicast Database lan9645x_mdb.c */
+int lan9645x_mdb_add(struct lan9645x *lan9645x, int chip_port,
+		     const unsigned char addr[ETH_ALEN], u16 vid);
+void lan9645x_mdb_del(struct lan9645x *lan9645x, int chip_port,
+		      const unsigned char addr[ETH_ALEN], u16 vid);
+void lan9645x_mdb_init(struct lan9645x *lan9645x);
+void lan9645x_mdb_deinit(struct lan9645x *lan9645x);
+
 #endif /* __LAN9645X_MAIN_H__ */
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
new file mode 100644
index 000000000000..6864b89d5a2d
--- /dev/null
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (C) 2026 Microchip Technology Inc.
+ */
+
+#include "lan9645x_main.h"
+
+/* IPv4/IPv6 types the mac entry dest_idx is not used for forwarding. The
+ * datasheet recommends using 0 as the dummy index.
+ */
+#define IP_ENTRY_PGID		0
+
+struct lan9645x_mdb_entry {
+	struct list_head list;
+	unsigned char mac[ETH_ALEN];
+	u16 vid;
+	u16 ports;
+	int pgid;
+	enum macaccess_entry_type type;
+};
+
+void lan9645x_mdb_init(struct lan9645x *lan9645x)
+{
+	INIT_LIST_HEAD(&lan9645x->mdb_entries);
+	bitmap_zero(lan9645x->mdb_pgids, PGID_GP_END);
+	mutex_init(&lan9645x->mdb_lock);
+}
+
+static enum macaccess_entry_type lan9645x_mdb_classify(const unsigned char *mac)
+{
+	if (mac[0] == 0x01 && mac[1] == 0x00 && mac[2] == 0x5e)
+		return ENTRYTYPE_MACV4;
+	if (mac[0] == 0x33 && mac[1] == 0x33)
+		return ENTRYTYPE_MACV6;
+	return ENTRYTYPE_LOCKED;
+}
+
+static struct lan9645x_mdb_entry *
+lan9645x_mdb_entry_lookup(struct lan9645x *lan9645x, const unsigned char *mac,
+			  u16 vid)
+{
+	struct lan9645x_mdb_entry *mdb;
+
+	lockdep_assert_held(&lan9645x->mdb_lock);
+
+	list_for_each_entry(mdb, &lan9645x->mdb_entries, list) {
+		if (ether_addr_equal(mdb->mac, mac) && mdb->vid == vid)
+			return mdb;
+	}
+
+	return NULL;
+}
+
+static void lan9645x_mdb_encode_mac(unsigned char *dst,
+				    const unsigned char *mac, u16 ports,
+				    enum macaccess_entry_type type)
+{
+	ether_addr_copy(dst, mac);
+
+	/* The HW encodes the portmask in the high bits of the mac for ip
+	 * multicast entries, to save on the limited PGID resources.
+	 *
+	 * IPv4 Multicast DMAC: 0x01005Exxxxxx
+	 * IPv6 Multicast DMAC: 0x3333xxxxxxxx
+	 *
+	 * which gives us 24 or 16 bits to encode the portmask.
+	 */
+	if (type == ENTRYTYPE_MACV4) {
+		dst[0] = 0;
+		dst[1] = ports >> 8;
+		dst[2] = ports & 0xff;
+	} else if (type == ENTRYTYPE_MACV6) {
+		dst[0] = ports >> 8;
+		dst[1] = ports & 0xff;
+	}
+}
+
+static int lan9645x_mdb_write_ports(struct lan9645x *lan9645x,
+				    struct lan9645x_mdb_entry *mdb_entry,
+				    u16 ports)
+{
+	unsigned char mac[ETH_ALEN] __aligned(2);
+	bool cpu_copy;
+
+	lockdep_assert_held(&lan9645x->mdb_lock);
+
+	if (mdb_entry->type == ENTRYTYPE_LOCKED) {
+		lan_rmw(ANA_PGID_PGID_SET(ports), ANA_PGID_PGID, lan9645x,
+			ANA_PGID(mdb_entry->pgid));
+		return 0;
+	}
+
+	lan9645x_mdb_encode_mac(mac, mdb_entry->mac, ports, mdb_entry->type);
+	cpu_copy = !!(ports & BIT(lan9645x->num_phys_ports));
+
+	/* For IP multicast, the hardware lookup uses the DMAC
+	 * (01:00:5E:.. / 33:33:..) as the (mac, vid) key, not the encoded mac.
+	 * Therefore, this CMD_LEARN will atomically rewrite the existing
+	 * hardware entry. We intentionally do not do a forget before learn
+	 * sequence, as that would not be atomic, and leave a forwarding gap.
+	 */
+	return lan9645x_mact_learn(lan9645x, IP_ENTRY_PGID, mac, mdb_entry->vid,
+				   mdb_entry->type, cpu_copy);
+}
+
+static int lan9645x_mdb_entry_create(struct lan9645x *lan9645x, int chip_port,
+				     const unsigned char addr[ETH_ALEN],
+				     u16 vid)
+{
+	struct lan9645x_mdb_entry *mdb_entry;
+	int err;
+
+	lockdep_assert_held(&lan9645x->mdb_lock);
+
+	mdb_entry = kzalloc_obj(*mdb_entry);
+	if (!mdb_entry)
+		return -ENOMEM;
+
+	ether_addr_copy(mdb_entry->mac, addr);
+	mdb_entry->vid = vid;
+	mdb_entry->ports = BIT(chip_port);
+	mdb_entry->pgid = IP_ENTRY_PGID;
+	mdb_entry->type = lan9645x_mdb_classify(addr);
+
+	if (mdb_entry->type == ENTRYTYPE_LOCKED) {
+		mdb_entry->pgid = find_next_zero_bit(lan9645x->mdb_pgids,
+						     PGID_GP_END,
+						     PGID_GP_START);
+		if (mdb_entry->pgid >= PGID_GP_END) {
+			kfree(mdb_entry);
+			return -ENOSPC;
+		}
+	}
+
+	err = lan9645x_mdb_write_ports(lan9645x, mdb_entry, mdb_entry->ports);
+	if (!err && mdb_entry->type == ENTRYTYPE_LOCKED)
+		err = lan9645x_mact_learn(lan9645x, mdb_entry->pgid, addr, vid,
+					  mdb_entry->type, false);
+	if (err) {
+		kfree(mdb_entry);
+		return err;
+	}
+
+	if (mdb_entry->type == ENTRYTYPE_LOCKED)
+		set_bit(mdb_entry->pgid, lan9645x->mdb_pgids);
+
+	list_add_tail(&mdb_entry->list, &lan9645x->mdb_entries);
+
+	return 0;
+}
+
+static void lan9645x_mdb_entry_destroy(struct lan9645x *lan9645x,
+				       struct lan9645x_mdb_entry *mdb_entry)
+{
+	int err;
+
+	lockdep_assert_held(&lan9645x->mdb_lock);
+
+	/* The encoded bytes are not part of the (mac, vid) key used for
+	 * lookups in the mactable, for entries of type 2
+	 * (IPv4 Multicast) and type 3 (IPv6 Multicast). For these types
+	 * the mac used in the key is the 'real' mac e.g.
+	 *
+	 * Type 2 (IPv4 multicast):
+	 * KEY_MAC = 0x01005E000000 | MACLDATA[23:0]
+	 *
+	 * Type 3 (IPv6 multicast):
+	 * KEY_MAC = 0x333300000000 | MACLDATA[31:0]
+	 *
+	 * This holds for both the datapath and the CPU access path.
+	 * Therefore, it is not necessary to encode the mac before a
+	 * CMD_FORGET, because the bytes it changes are unused for the
+	 * lookup.
+	 */
+	err = lan9645x_mact_forget(lan9645x, mdb_entry->mac, mdb_entry->vid,
+				   mdb_entry->type);
+	if (err)
+		dev_err(lan9645x->dev, "Forgetting %pM vid %u returned %pe\n",
+			mdb_entry->mac, mdb_entry->vid, ERR_PTR(err));
+	else if (mdb_entry->type == ENTRYTYPE_LOCKED)
+		clear_bit(mdb_entry->pgid, lan9645x->mdb_pgids);
+
+	list_del(&mdb_entry->list);
+	kfree(mdb_entry);
+}
+
+int lan9645x_mdb_add(struct lan9645x *lan9645x, int chip_port,
+		     const unsigned char addr[ETH_ALEN], u16 vid)
+{
+	struct lan9645x_mdb_entry *mdb_entry;
+	u16 new_ports;
+	int err = 0;
+
+	mutex_lock(&lan9645x->mdb_lock);
+
+	mdb_entry = lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
+	if (!mdb_entry) {
+		err = lan9645x_mdb_entry_create(lan9645x, chip_port, addr, vid);
+		goto out;
+	}
+
+	if (mdb_entry->ports & BIT(chip_port))
+		goto out;
+
+	new_ports = mdb_entry->ports | BIT(chip_port);
+	err = lan9645x_mdb_write_ports(lan9645x, mdb_entry, new_ports);
+	if (!err)
+		mdb_entry->ports = new_ports;
+
+out:
+	mutex_unlock(&lan9645x->mdb_lock);
+	return err;
+}
+
+void lan9645x_mdb_del(struct lan9645x *lan9645x, int chip_port,
+		      const unsigned char addr[ETH_ALEN], u16 vid)
+{
+	struct lan9645x_mdb_entry *mdb_entry;
+	int err;
+
+	mutex_lock(&lan9645x->mdb_lock);
+
+	mdb_entry = lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
+	if (!mdb_entry || !(mdb_entry->ports & BIT(chip_port)))
+		goto out;
+
+	mdb_entry->ports &= ~BIT(chip_port);
+
+	if (!mdb_entry->ports) {
+		lan9645x_mdb_entry_destroy(lan9645x, mdb_entry);
+		goto out;
+	}
+
+	err = lan9645x_mdb_write_ports(lan9645x, mdb_entry, mdb_entry->ports);
+	if (err)
+		dev_err(lan9645x->dev,
+			"Removing port %d from %pM vid %u returned %pe\n",
+			chip_port, mdb_entry->mac, mdb_entry->vid,
+			ERR_PTR(err));
+
+out:
+	mutex_unlock(&lan9645x->mdb_lock);
+}
+
+void lan9645x_mdb_deinit(struct lan9645x *lan9645x)
+{
+	struct lan9645x_mdb_entry *mdb, *tmp;
+
+	mutex_lock(&lan9645x->mdb_lock);
+	list_for_each_entry_safe(mdb, tmp, &lan9645x->mdb_entries, list) {
+		list_del(&mdb->list);
+		kfree(mdb);
+	}
+	mutex_unlock(&lan9645x->mdb_lock);
+
+	mutex_destroy(&lan9645x->mdb_lock);
+}
diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
index 2571380f2c02..edcedd7723c9 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
@@ -166,6 +166,14 @@ int lan9645x_port_setup(struct dsa_switch *ds, int port)
 		mutex_lock(&lan9645x->fwd_domain_lock);
 		lan9645x_vlan_set_hostmode(p);
 		mutex_unlock(&lan9645x->fwd_domain_lock);
+
+		lan_rmw(ANA_CPU_FWD_CFG_IGMP_REDIR_ENA_SET(1) |
+			ANA_CPU_FWD_CFG_MLD_REDIR_ENA_SET(1) |
+			ANA_CPU_FWD_CFG_IPMC_CTRL_COPY_ENA_SET(1),
+			ANA_CPU_FWD_CFG_IGMP_REDIR_ENA |
+			ANA_CPU_FWD_CFG_MLD_REDIR_ENA |
+			ANA_CPU_FWD_CFG_IPMC_CTRL_COPY_ENA,
+			lan9645x, ANA_CPU_FWD_CFG(p->chip_port));
 	}
 
 	return 0;

-- 
2.52.0

