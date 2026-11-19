Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057018;
	b=jSnLaZ+/Fbm4vhXZ+V7xXnrp69E3GGT1CL6ItQDYhK+ACMHrVi4wgSAB3syLEc4zDuOc
	 7OiUCETdgnbsELgh3WfftcZhz/bjqiNMqLzq8/ZmZ77smYua2g0z0EkSZFaVCewLb8jSR
	 owhswMwp6Ycmgik1XCZLeEWksnvS5eDF/M8J2LQNWBXgTpZRE7sYpbag9okAZ4No9TArG
	 FuN6YT5wAuTZ6rPpYANJySY0SonaMfY42SBQ2VEvm6IDxt1MZgFgq4wQ6a40RiMYTQZkj
	 EncHzmJRbSuzDk/oHVzIuZtVi3TZQNuBkkcdR19AYNAdTuqTTklw7ab01H258N3pP/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057018;
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
	bh=20rPoad1B2RiKOVU3bhH5kEPx1AsAuuPrtRLgn1XzVk=;
	b=fFYW7OAGBe3BVOaO+ALddDn+4bBsquGUMtzvd75qokbjfvCsPVPnfYGrm6+kkweEW7XL
	 z17aFScIUr3QwkealU2TVVFke9OVAhsvLKA5lhujpFm8iokA5UP4fTiPBNXr9tO13r8m4
	 MXYgxX3InYmHeknz8oIhNilSHG5iuyg263Y0Hww7ZrSqgvT+kV+3vBRwpGbywzTijrXju
	 dEyRiImTjI0qGz8hyxESVPGOYCkuTpRVytWdZ9WzgghZldYeUL045j7bnKcXFERgoN1u5
	 RZxOcThOnbKwqMpmfHbwk/UoB83FIVpiMZPSqhr4LmF5m8H0jiu385+Pde9wDGaQUEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="LYT/fCG7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.21
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64124606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64124606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LYT/fCG7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsuQiC/fkNaLohMGqCHr/ur91pX7pHlKgmbZ8dIu2QksVSQFqGepIVAKAdaKKseZpO/AXEawTVr0tetmvy/xjqKOWAyrl6B1+0/jzLgB/GbzygZRiZi5FKT3WlcWvFVBJD4o//oOxuFAVG+OjdgL/SdBJupXOOHEntiOSTRMuJKEpxDZ3wj1N8YWbC7haP+DjDo7LwqZ7Te/1KrafVX+bvNoBnh89NM40bQvLNNvjsyD175G07tBWOjZfx8vdufHpW+EOhTtbZpKzfw4xQpIajhbKaHFvW17Q4THvnel0bfp+ycT5svOGIz90yjwE4D3NykOFmm7OGtkB22rgLFJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20rPoad1B2RiKOVU3bhH5kEPx1AsAuuPrtRLgn1XzVk=;
 b=KNNZIKkW08LmlkAEgXmtPU5DfT7/SBoCG814NETiIZ2M0fciKON/dRvm4rePgIjGFoP8klsF0/SQhcs7RqTwm7Q59TruUm8NCk/UTB7LdnLNH4OOjBqVeYEvf/d59K6oar3IDLvxKvbLEcTkc+IV7vtss/0EXU7MzjY9v21tPLUftNXgSEwHFJWjNCvNa8XIWHJaF5ifXG50ipTRBHR2+L1RpVTe0rPK55ZlGXcRIWEeiAFLyBb38fMQG4RYxxAidUkK2qqM+9RiULt8NnNL9hOe3oeFRnP+LbPyxo9tr2TRcCw68ZkFtNn9e2gU2ZOumX3Rg2YGLMbWHT1KwjNpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20rPoad1B2RiKOVU3bhH5kEPx1AsAuuPrtRLgn1XzVk=;
 b=LYT/fCG7rmAJtqlcBqIjxZ9IpOaC6b0iTwKEhowU7EPFAvfwOqEXwHs3SGQTNXsQe5/TyvrrxXkL4qKGoQ21/dGmnecS/sFArWziFq4uiG0jGk9U7GtlN6d2RJSfkyHDLzMHy+tV7AZvJ0y8zkZ4G5d7WiJdv41IX2O3F75QA90=
Received: from BN9PR03CA0695.namprd03.prod.outlook.com (2603:10b6:408:ef::10)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:46 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::63) by BN9PR03CA0695.outlook.office365.com
 (2603:10b6:408:ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 02:56:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:46 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:44 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:34 -0800
Subject: [PATCH net-next v5 6/6] ionic: Add .get_fec_stats ethtool handler
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
Message-ID: <20261118-ionic-get-fec-stats-v5-6-c9c0ee63df4c@amd.com>
References: <20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com>
In-Reply-To: <20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com>
To: <netdev@vger.kernel.org>
CC: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "Nikhil P.
 Rao" <nikhil.rao@amd.com>, Eric Joyner <eric.joyner@amd.com>, Eric Dumazet
	<edumazet@kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 69153cab-39e9-49eb-5137-08df45e8bffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|261009223027099003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|5023799004|261102123227099003|261022075727099003|261026121527099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	S0gssXtS37LHbsjYMR47PenklLqpgYE1/xcCRPrO32qk2IUIecRMwGFQV1dSLMYe1lU0v3n33CDdr0BgDSbh6gTj+6LNwD6QwIIAXpAUcVgqPT/8fQZGMfFcbz4ZEB1dAWBY+Jl0fmq+IpQz/jok/LMrsqfjodou7yRVuX9cvP7ARtVQH7upOuO6970pjFK56e4Li2lCcVdZ8CIfK1pP46P534CZ3KX0evKMd7rAhNTz0C+0TphCYo8K/UXmICJk/7WEUyyH4dIwxHL20AWeOUeE1kmyh0uRQuXL6RGVpDcpKyqKr2RGx63LDU/g7Id5qWhpu7DvURu0JDhmFkEnBVWu0vsUao2fiHJ1vzCZ4VluCVGr+UfKOPo9WLm+WJY/xO7dVSmkM+TF8xz4GcScTlS1AozoZ7I9l6qDLY5rPHMNxPUMg88KsxHYFs28UzxkbS8QQujqnQUaQj8Iq0GjF7U3A7y1uoRS13QrVXIiKGCYtnj0NPC2P1rG6iMlo8Qpl24a6A/bJRSDLmMgnOZ7QIY/Sdazt15Uqp3r/ixTPvgTK/CxVIJ2vVk5eWmftCHx2sRVeyUnZXn/QxvEi/oDLMMxRK7Iir8QXjgxIv978XPD1ld88NTj+KUOT5V9USLQ2s5QmTotpof//Zv7efkSFXxaeNurNFhypgrJKRuQDmUkDWGjjHFDiZWSJQUeyMrNU3jw4euu+JjHv7VT8ryfeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(5023799004)(261102123227099003)(261022075727099003)(261026121527099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3/w5BeCGj2Q1xIM5f1bRqmic3WlZBUwvSRLGOIBJURLML1N/g+/924zdRRFzatHo5wtuQou8APA2iRo4o/e0RQv2pKXsbBcQLXCSrnI137CdhLP7L36AVpm6GaYAcwEHY6X2as2NyjsrehS2VhMXo482/E7Fe9gGz7mtseUMMya6Ct8cg298ix4Oh4GpkccpMwNkk0ma++CJILMse/Gj8b5cN2MHj54oPb+qAnR69j6nvqsTKqLWeLfTTSJ0FdmRlRSKJ1/sny1A8B5EfI+oWoaEJg6RcCGQtcn+/U4d02SJiUUFDfDK+PqlllNp5TxL9ms0upcEVMSqGNlnzAFvllAy+VUpH/Jx/zwJVIf4GOK1tPakTO29vBZt2B7GFvLxz5nYSxfImMsEgI/HQ1Z9fgiWtayJ0dvJzlwtthr6S1s0BgTsopjM64und6swuoXo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:46.5162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69153cab-39e9-49eb-5137-08df45e8bffc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866

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
index d406d090d0eb..7f29113f39c8 100644
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

