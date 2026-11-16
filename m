Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870445;
	b=cVfWTGlRBSHinz2x8sYlc6XG8u5crMYVU5H2A9gelXSavWS2Iyda3CEdgN8e0v7iflzA
	 RA/RhUTtlavK0AvCPMYElmVgA1ACv05OQPrmsAEifiZTxPBVNM3C5gkdHot8CBwz0EcUZ
	 x2KdfIyunqKz3gqluAm2GwTg+AU9fkE8NY1EYBP9f7YIw8Q2csYY9Iwbl5mvkpG4aKZMs
	 kqVwy2T1as7JwowDS79YUWzqXl3WOEfZKcD0DJ/gsLu8Jlrxyi9xbiZHlxTt+cTsrPt8e
	 CglEUvtFqGZnsc7KOMGigu8p9wEgM8ELQl0y6bI1iZijKhJSzTA5Lz0TSZ5NV3lbg5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870445;
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
	bh=QbfYuAf6IRmV5wH597eTdAkd1iBhpW9aYdNIJ8cxWqQ=;
	b=gWZs/8qNICDemZ7u4iOPtnO8VWqsnfhcj3Elu7wnqZZGGXiWtW6sTVdpQegrViVGfMRe
	 yW+wQ7r4Om4/km9EH5fGfz2ecYyBUEpVMrFBFLXJar/MVdGcb3KkCFKYixd2zR4RupDql
	 fKKD02Bl562QPgnojMI/q+tu735Ky6eEzawdpKATFlHbpDelr7HbB6BSVTyjCvsak8R/K
	 F9vdTJRWxrojUbMoEGadQIZsISeO+QedYbflEL3JzvjKN18Kx593xnFEUKWl/6/lB9cK0
	 Hb4XusHqEnX+ezvL6FxZUqBl/xF1DZI1w9VzIakC1ctrTdYK7TcEXvgfpe0bphawQpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IrmZlHmo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.56
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D9460A2628
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D9460A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IrmZlHmo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwrGUTsidglW8nPkrdAfg7cfviyJMX3hATfcGt38a8jOALDnSfpsFsrL7PZ3UxFlOoak3B3qBHlkVSxOGXpxAKMOaF9XIWxz9BLd0P6mN//8HcfADTmXMvf+kRrqG9BqG/WuZk+lK5AeEdwAPtXMG4ObFMh3A59GNVdD0ydA4NM34iEtUMeBUpemoT113mVuqWEobZfrfjT8N8IfaJthr0p7VoA+24NwWJYXY4agy2ef6OrgaGJ3vYUiFUiIWRW85/eeQ7WJ5TOtMOkbkBq+Vz38Ean7rWkTptfiqWqdRx8hhKAtL0xIV5vDiUXdpM3RpA2XOPPh6iqvDD4CGdl6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbfYuAf6IRmV5wH597eTdAkd1iBhpW9aYdNIJ8cxWqQ=;
 b=jUHnERGGVI24lBmNGYdMSSPAOzqrLKxQ7Q+uwtBiOedyyMA7Leu7kFjSDYwykPRi2j16gtrabUc5+Lxd0XVM3GiyF/UbP+G0OplHWBqGGOZT/WlOoUMxYNMUTfmJsE+WgK/IybIDbO35/k04bam6afrNJjlXNDAsk7DsjpFYZC8Qo7qfw2HgoMtLcemNCpOQNroa51vG9a3qxmvBYrPMPyjsgcYvi1yQwIwN4zhDlrW15ZqHmnnZSQypf7luGy06ZzW7/u6XbsZBHC5c/tayZt5jvpSzdzDdaIjx01rFGKMISfkxA/ezQqMakea+rW+FGJR4/qKDrikmmWjSzTN8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbfYuAf6IRmV5wH597eTdAkd1iBhpW9aYdNIJ8cxWqQ=;
 b=IrmZlHmowLvv18kh1HqApechTs8g9BxVPUhUoQk0vbcsUKcfK8tYuc/shoo2w3Pu7YpzlphgTtM8gQqq8etnV4FYDKm2MRr2EjmBZyOwANMGLiPQI1i/JKAZOPluPH78Ah0AVsbdxfmakqB/sJbNUpHOJAwYfFJjaQjTSSg6Dko=
Received: from BYAPR21CA0016.namprd21.prod.outlook.com (2603:10b6:a03:114::26)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:19 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::95) by BYAPR21CA0016.outlook.office365.com
 (2603:10b6:a03:114::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.1 via Frontend Transport; Mon, 16
 Nov 2026 23:07:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:19 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:17 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:59 -0800
Subject: [PATCH net-next v4 6/6] ionic: Add .get_fec_stats ethtool handler
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
Message-ID: <20261116-ionic-get-fec-stats-v4-6-d25cae9f1e87@amd.com>
References: <20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com>
In-Reply-To: <20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com>
To: <netdev@vger.kernel.org>
CC: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "Nikhil P.
 Rao" <nikhil.rao@amd.com>, Eric Joyner <eric.joyner@amd.com>, Eric Dumazet
	<edumazet@kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd5bcef-7def-4e73-a652-08df44365d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|5023799004|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gLrimPiwxWyvvsVLRlTADg+eb6yU638zvN2ofYnP6vDBZGUw32oGWkxFwMEOefJO4qxvQon0D1NfAP+6sWUpkjYEaxhYw1hxLs3ieY49qQ5ypVDTRnSPLkY8wyV+wIZ67YT48zDvASIpN63ET8vrfetmeC4IeZPDGvXBZJPalfKjgsPMFdWNH4/iotp6WGVQzP7BZZWNFZb3stZiObzTRLLMNKa2Be7nThgUYOJ/toi7C0Z8qNloo4SLQ9+0ZJ5MbFZy+xAxiouDXnNIB/IIlr2UFskMh1d1omz8IklFpa3BTd9CvYRSPBT0rgYW+nXzaX5zTgzJV/8ALuVMxMekMprc8d+RNu761PSAMP9Y8ztsx1Wvd6JYyARxo4lSs23Bs7BL6gZ/K81kJvaHYEHvopN9Ve9gI2v77yIHuXnzpaS4Z1vN+cUqqJcJWlWMO4NzRGPOXREo6Pxk138SymseLJyckZyGK+Gq6YWLUGkIoDHD3cjRhrPD4HDExKyACMWyp5q/hlrKUdiulyNM4Bz3KoO3eGia4+qHScFEb2edO2D5J9r3BwbHAsmGRmY4VI/FwXWAp001+aQSXNkCu8k7B8GCzQvMQzHKJMxhBh/1Z4xbkfpGHjqxE5W3JqIo4MmSU0mf07hjLSZIMk+/7O8BJdpGybG0sOTT8VBpaB0S8rLEFR5iPyoqiYeQgU/nkS0un6XRbnONvWYtRqh+LYeO5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(5023799004)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QdbqGWSnYDzggKXIuEnM/7qqhAdf0vaOciczNH/8vsohZTmQsg5fXTwwkh5Q09g6g/CljpLWEWirvS65zAeq+y007iehnvcAHroHuZbGPWzeheZBTOCQkFcvAN32cv3ISQluEzUkDZihRQSQRPGufbblU8xCt/H677CfyqMHg1Z3ASpPV2FkaBakwVUPLJQ8FNwekBTBbSiCbSY/p3WpOEQgTj8IPyWm4LKuAlzri6tCg8zYZhUS2kXcFXH7/5Emgi/1LRYlTVI0kctDRluyZ8Y0GbDsasFF7dMebc6SiF8ulGqqK1+tgPWcDvMqFNtb7OLg1Nig4sAASLNmoNXwFlfkzXkmdALOPOJR5jK2G6weg6duF8mUcyOwb1m/BMB6MZA+MbeXrbjCLa4uwJnzbuW+2JdXHrdNO74Eaw7fTq8uqKM/sP43dtaYqwUqFK//
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:19.0061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd5bcef-7def-4e73-a652-08df44365d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

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
---
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index ac728b8aa780..b4835cc52cc7 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -469,6 +469,88 @@ static int ionic_get_fecparam(struct net_device *netdev,
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
+	if (ionic_active_fec_type(port_info) != IONIC_PORT_FEC_TYPE_RS)
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
@@ -1203,6 +1285,7 @@ static const struct ethtool_ops ionic_ethtool_ops = {
 	.get_module_eeprom_by_page	= ionic_get_module_eeprom_by_page,
 	.get_pauseparam		= ionic_get_pauseparam,
 	.set_pauseparam		= ionic_set_pauseparam,
+	.get_fec_stats		= ionic_get_fec_stats,
 	.get_fecparam		= ionic_get_fecparam,
 	.set_fecparam		= ionic_set_fecparam,
 	.get_ts_info		= ionic_get_ts_info,

-- 
2.53.0

