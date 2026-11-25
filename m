Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648966;
	b=fYEED2O98X9g3EjWJbs+BTdT0v+sNnHteMGIydVeM74SEJ6EGfF3TC/NKbCEy43LlGRy
	 irf+3dpin74S3jHPZh25xiGj9uMlUR9/HdohWhqvos6Dvr/PERA1QJV4zKILM+x2qI8vD
	 JMqtIoGxNOWQrWlMzqPqrsKhbBlcLnP3r6W9uyjDLDl6+OkKEWPROWMQL4oDw/Qt2jIeF
	 AvXm/VKRRbt87WVXqnvc/IOUKk/yr8rjma3cpl6kmNZ+AaYTNTwvEELZHkYM5ywginFwP
	 4sxHRQgFyBx/SUcbXrbzCQwgCEvvu/KWAkXXxhkDM+gYmZfWkD0Nyl9cari+EGC2kcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648966;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hZH4AKynAhE7SqQ3ROXJO17loh3dbpkRfWQP36dOwj4=;
	b=5GDEFKH5pqb+ZtFqrN4Jsndrwy7WemzDlw2uFQ8jB+d18Do0NoE9b9RyHK0kQVFaQMKe
	 0ab1Hg1OiYEJvk7eR3n2/VNocPP3qB7VF9+ybj01VK/ZOW3j6+PWNG52gLNR1GCiSCV1R
	 y3Qru0bZlvwuu5nU2NOjwlb3DmipAm9BZbYmw5nE9FfkuP6i5jr2fPxF8HgutGmnF2C+e
	 P+/laXOW0RjO6bzIhiKUsNBzDdhuiSLwrr4T7P5loJvS6n7ko/6+Kk68pK2t3Jg050F+y
	 ZyFz0TQj3zSzmrepGZ33HXkOguRoqB+OFMTFRN28YXXmrH66KhJHdIlo3qw3MgS6Syw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CU4qqrVS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5D606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB5D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CU4qqrVS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxExOkOTBEAu4B02B3n0zxysOmfx7kJf7+YkeFPR0G0Q/Zvn9rRIPBgrwvc/P4YkXv90gFjp/AOJYCwFCaF+1CxAucwronHhmSkZY1rAiHNCX43TlN7rzjBxR42/DpjHyPF5Jut1y1j5qZsQNlF8ZLFNSezPX3x4BiyWpqh2aHCTlkIVLKROE5XgpCR2ioGg9em1DThQ+vBoHG0BttBtZrZ95wLh9TNSsumBFSf9c2SzxxjbbJc7CEEJt8zQR/wibz6pUnbbmwABOF6CmER5P+aXygBGOUAPzqDhp2C5Ujq+kAOQryX5FKdJYgiMRXqM3u4Umhd9Ausooi5OVtYKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZH4AKynAhE7SqQ3ROXJO17loh3dbpkRfWQP36dOwj4=;
 b=AwaqV4w5nBzlJWb0btuPbjKSySHm1cEi5C0YmHpKflgq7/KNqkkGxMaMOfaFoFQeNhziOO1mf/Njs3jy1vxr9HdXEffwdJivAYh3VQv7YoHOD0eFKWY4wW+J49B5Vs/n16wm1AgzW1/ECxGPjbCS6DsrChr1JEV77yXAv/WRHi6kkiETOS0N+uMABRIjvWaGm9/zIhU8QGM2k+hyH4Qxs7qyB6GqsOb/xuk1KTH6pmOl/hEM1KpOOd/EVdA+5T/iCQI4GyCOtKDnsp/50IQF6I6LiOIs2S09ZXjjWMXlqNSZayyEiFr4owJSJJ76S/+btRqZVkvS7Xz7NeICkjEmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZH4AKynAhE7SqQ3ROXJO17loh3dbpkRfWQP36dOwj4=;
 b=CU4qqrVSG+kD0ExoBFXdcadBMLnIFwXy3nlqE7MXB+EOygwsp7ZNBrlzMcnjXGtDCtKBXEZGfo2E4sbWG26eNqp2J51FrD9b6STY5mc1lCKluQVZI0HKeBJzhw/BZYez7PTKmIgyTANncj8cpw3GvTD7FKnJGo6vPDL1qCzaMME=
Received: from CH2PR17CA0030.namprd17.prod.outlook.com (2603:10b6:610:53::40)
 by BN5PR12MB9537.namprd12.prod.outlook.com (2603:10b6:408:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 23:22:41 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::7e) by CH2PR17CA0030.outlook.office365.com
 (2603:10b6:610:53::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Wed, 25
 Nov 2026 23:22:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:40 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:38 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:27 -0800
Subject: [PATCH net-next v6 6/6] ionic: Add .get_fec_stats ethtool handler
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
Message-ID: <20261125-ionic-get-fec-stats-v6-6-1ab49c729c00@amd.com>
References: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
In-Reply-To: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
To: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Shannon Nelson <sln@onemain.com>
CC: <netdev@vger.kernel.org>, Simon Horman <horms@kernel.org>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, "Nikhil P. Rao" <nikhil.rao@amd.com>, "Eric
 Joyner" <eric.joyner@amd.com>, Breno Leitao <leitao@debian.org>, "Arun Kumar
 Prakash" <ArunKumar.Prakash@amd.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BN5PR12MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9341e073-6aff-4da8-b7a8-08df4b4affe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|10067099003|56012099006|5023799004|11063799006|261022075727099003|261021121427099003|261021135927099003|261009223027099003|261102123227099003|261026121527099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MhOidFJIQAeg9yNNrkJeb7e/0caCzHrTEhNawdveOvoMR9NowbAyzpT2/5ve/YG84m1alca2mcX43q3Xvy39ZqwTY5tLRsDMoIGGpO2jIv1hqD76D/8BsKOTRExynfr92B/GQVPoUKpn0tvMB7QYxj8qweZ/HNRLXabftr7SRehN8ulMnwVSfmwHaLmwnapsUizoopxfBQPSdIE4nEkl4JL35fkl06bgC2nj2N/M646on0DYZe5/XHif9Z8OnNmql+b+e2QIavr72OSIrPMxL4O16+iKbZpR5f/boGYeA5NyrTPWN4d3YRh9REylNwi7g6fv5PvHlGHseeL9ecFpt8FSUYz+aBPMX9HxFPRoWNDtDOS7gZ4gbadkaeqmqZfrxFVWt8MSMHNGHhQHbZuaQzFlTdKrDOAddnXyBsrcNIpFfVFN+chX79PRKMxM7TEXuYyOc6FWtwG2WJux/8pSi/oUNBFuE/N8ut7TEDFVz5HKwYw9blNf0gwXjutj5TuJQbYXEFqg12I2Kn+PEtkh0kBlNcntTKXO3qdTcXogCvwepg1oNtcZ/iTqYSvy6ONP15k5O/CZv44RDdXIeP7mJtluMiWHjrqpadMGk6ZXMT3IECngL9Qiv38jl3mHJnl6548mGQx/ZTCVUIP4gFjFRJbNfyJQU0G9kwYTWNDafvO7qCwgCZnxEuASZNUYN01Po9IlhUpzYHRQ+raBni3qbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(261022075727099003)(261021121427099003)(261021135927099003)(261009223027099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9oT3L4NKOW1oEoHAY7MFegtchUXYDNFHP+QKSV20zHPS/eY1fwq/2iVMV6XbJxd8kk35DyRb0QM97iqYmD8YTrxAP9cg1ySZKK5z/L6ZkmJQP/45o5zmmdEYSQfbep3qrvxhvoOrNZSwEiF5ZZHVjHAeUOI807u0bKLo0f4/AzVyarJNzZEw1Mm04iT+yGBrRRb1H1ouLTgGTDiVXgC/unCEGNsewcAKAqFzM3mvL+mPEh/LmyEC3bHHfxyM3uEx699FdzqxzR1fyjI3txwB2QBgE5vyrydHTba/lMa+vdqxWzLL8n18lHasvYAZInUktZ8adexGDRxnm9V9a/jj+Pr+HvR0WWhRdfkoKePDbAaINsIbpZG44Uwrr1olVvqGHYurEOAX4rOA9TDjGUi73YYjcgFrsBXz3F5Jcg2qCG5tZ5tZ51+rVO++HxOoxivN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:40.1878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9341e073-6aff-4da8-b7a8-08df4b4affe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9537

From: Eric Joyner <eric.joyner@amd.com>

Reports FEC statistics totals and an 802.3ck FEC histogram. Per-lane
counts currently aren't supported. Every counter reported here comes
from the RS decoder, including fec_corrected_bits_total despite its
name, and the only histogram format firmware produces is the 16-bin one
from RS(544,514), so nothing is reported unless RS is the active FEC
mode. The only devices whose firmware reports the histogram do not
support RS(528,514), so RS on those devices is always RS(544,514).

These are physical port counters, so virtual functions are skipped the
same way ionic_get_link_ext_stats() skips them, rather than reporting the
port's counters as if they belonged to the VF.

The reporting of these statistics is gated by DEV_CAP_EXTRA_STATS and
checks for IONIC_STAT_INVALID, since only the newest devices support
reporting all of these stats. Older devices can only report some of the
statistics or not at all, and so the output will properly exclude those
unsupported statistics.

The firmware writes these counters by DMA while they are being read.
Use READ_ONCE() to ensure that the IONIC_STAT_INVALID test and the store
see the same value. Counters are still read one at a time, so the set
reported can span more than one firmware update.

Co-developed-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 3b6c436104d1..ceb029dae0fa 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -466,6 +466,91 @@ static int ionic_get_fecparam(struct net_device *netdev,
 	return 0;
 }
 
+#define IONIC_FEC_STAT(dst, src)			\
+	do {						\
+		__le64 __val = READ_ONCE(src);		\
+							\
+		if (__val != IONIC_STAT_INVALID)	\
+			(dst) = le64_to_cpu(__val);	\
+	} while (0)
+
+static const struct ethtool_fec_hist_range ionic_fec_hist_ranges[] = {
+	{ 0, 0},
+	{ 1, 1},
+	{ 2, 2},
+	{ 3, 3},
+	{ 4, 4},
+	{ 5, 5},
+	{ 6, 6},
+	{ 7, 7},
+	{ 8, 8},
+	{ 9, 9},
+	{ 10, 10},
+	{ 11, 11},
+	{ 12, 12},
+	{ 13, 13},
+	{ 14, 14},
+	{ 15, 15},
+	{ 0, 0},
+};
+
+static void
+ionic_fill_fec_hist(const struct ionic_port_extra_stats *port_extra_stats,
+		    struct ethtool_fec_hist *hist)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port_extra_stats->fec_codeword_error_bin); i++) {
+		__le64 val = READ_ONCE(port_extra_stats->fec_codeword_error_bin[i]);
+
+		if (val == IONIC_STAT_INVALID)
+			return;
+
+		hist->values[i].sum = le64_to_cpu(val);
+	}
+
+	hist->ranges = ionic_fec_hist_ranges;
+}
+
+static void ionic_get_fec_stats(struct net_device *netdev,
+				struct ethtool_fec_stats *fec_stats,
+				struct ethtool_fec_hist *hist)
+{
+	struct ionic_lif *lif = netdev_priv(netdev);
+	struct ionic_port_info *port_info;
+	u8 config_fec_type;
+
+	if (lif->ionic->pdev->is_virtfn)
+		return;
+
+	if (test_bit(IONIC_LIF_F_FW_RESET, lif->state))
+		return;
+
+	if (!(lif->ionic->ident.dev.capabilities &
+	      cpu_to_le64(IONIC_DEV_CAP_EXTRA_STATS)))
+		return;
+
+	port_info = lif->ionic->idev.port_info;
+	if (!port_info) {
+		netdev_err_once(netdev, "port_info not initialized\n");
+		return;
+	}
+
+	config_fec_type = READ_ONCE(port_info->config.fec_type);
+	if (ionic_active_fec_type(port_info, config_fec_type) !=
+	    IONIC_PORT_FEC_TYPE_RS)
+		return;
+
+	IONIC_FEC_STAT(fec_stats->corrected_blocks.total,
+		       port_info->extra_stats.rsfec_correctable_blocks);
+	IONIC_FEC_STAT(fec_stats->uncorrectable_blocks.total,
+		       port_info->extra_stats.rsfec_uncorrectable_blocks);
+	IONIC_FEC_STAT(fec_stats->corrected_bits.total,
+		       port_info->extra_stats.fec_corrected_bits_total);
+
+	ionic_fill_fec_hist(&port_info->extra_stats, hist);
+}
+
 static int ionic_set_fecparam(struct net_device *netdev,
 			      struct ethtool_fecparam *fec)
 {
@@ -1200,6 +1285,7 @@ static const struct ethtool_ops ionic_ethtool_ops = {
 	.get_module_eeprom_by_page	= ionic_get_module_eeprom_by_page,
 	.get_pauseparam		= ionic_get_pauseparam,
 	.set_pauseparam		= ionic_set_pauseparam,
+	.get_fec_stats		= ionic_get_fec_stats,
 	.get_fecparam		= ionic_get_fecparam,
 	.set_fecparam		= ionic_set_fecparam,
 	.get_ts_info		= ionic_get_ts_info,

-- 
2.43.0

