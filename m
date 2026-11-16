Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870437;
	b=mifGYFcGDVRIc2Ry7RBmZdgT1M6sx4jMfIof7CBQAq///2A6Vz341Ojya+Ry2IDcbTuC
	 7zPkW1Lf21PIZXd+c6xhFnaAV6s84eVI1G9k+/Gz2O91lOlhYCuNk/GE4eE4oI0kS4sx+
	 NDmYEnO0Mfx4dxza35jA4Ec954Rdy+VUQTWnO7vIUBf9DRaI7E9ik6bitnQLYfQTje4Ih
	 LbMcYOSBCP/CrOYQNmWj2hlfoyfQ68x2uNxMS1rMmF/F7GZeGwcrq9NHzBpweQzWGwQR+
	 YaulEp7JYOGtyizao79jwmY4Wzqg2xQiCaIQL9M6jE5oGXP/aGCS0wv0gI8xozr4KWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870437;
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
	bh=DHvK+R0ySAJ0BWEThcpF3MvLC3etMxB090zISrbSwtg=;
	b=3vlFq5Yso9eOUt7jessqIUP59RrEGOHqS+zh+5//KGaCrllWacd5lMJ3186hB1T9J055
	 MXSl9am/phCIN3kHngblZQIu2RAOu41SMk5Gp+EQve7kTPb02DjHEfdStgz1eqe/qlIo9
	 vgiasAE+P+nqjEUB9HW5fN9XgAsFiRWRCejXoe8vQglYjLqNa2xR6v8cuptgh5wFPMAa4
	 DnCaUCG1jmnEF/biQDK1JbG1QNge0QYwmoIbO1VHGxhdZ26+uRURXbu7ACCFgVXMbWLyT
	 ISvTm14UMYtsx8QKE/tFbmONvUsLsZLH1wkN9eT5KD6uUfElqX6uyUoVh04nGZGcGdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zX59r+kd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.37
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814E606A888
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6814E606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zX59r+kd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn9HLF1maNFCIikqEsXwjAQ/qc2yUrPb/wrPEdQglvZSzB4ARDi8FGo8azRCnnEppqSZqjJVF96PhzSvJPYGxtWoaDqWMF2cTaRjKzXRvgSKuHx5DT5MSavMa66j4ZJCygeGcL8FnDNQLYY29Ux2kS3GEWN9OXI1iNFjN2gU6E3e/jUK2rvd3MG4wZ9TswvK2e9afjEOI0qPf+9LkJ9TbpoesD/M3ZANEWu4N/d9cbVWbhQ4dc8qjujm9wlJVhdfzUHFlILWx+oh+TXtxkI1mX2+3tm9n94Nj/lx3IWkHk3Ka3WWcCq0ikPGrPkGuvnkuyeFziDh946pHQqe8M3Y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHvK+R0ySAJ0BWEThcpF3MvLC3etMxB090zISrbSwtg=;
 b=EBNHPEylAm9ZL/QR5EukaDnM76qA3KAbIglhTcFLt9lb78lXmL7AOR7EhnhymntETT53gA0dlU7prPiNlRXboipVvKmGV7jceCc0zWZW6jqRXo1g9f//9GK3uR7F0aG/iERoIUyyeNrb6+9rTO47BdJWelY2OD9fmY+RzImwdqzudC2JZ/M8oweGPRRQZbksL5oYGelUC52SF6mlox+vd5A48d8x4hFDR2KrQY9sAvpC1IyP+rUOPbdEiLX1FuWcOVtZ68UiZf1wlB+GG44xkmh1RGwvONf222hlcyzArhLENl1jOOCaIiBNNk6LTPf4KvCU2KXphVZhY8b242sPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHvK+R0ySAJ0BWEThcpF3MvLC3etMxB090zISrbSwtg=;
 b=zX59r+kdBcNo1aPw11OF0J2ZqxO984AECJexv7oUcB6PZ+B3P6A7yE2PHgr1sRhV8+4DvEzBgu5FVfSWMY4qJSIQ0RDAxMorpWUS1w2gBzqQGZBWfkpnk/PSjrfgKpTDbQ17FZicoffDlkO22NxYviC+Pt4t7t4cWBEnY/yWEB4=
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:12 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::52) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 23:07:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:11 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:10 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:54 -0800
Subject: [PATCH net-next v4 1/6] ionic: write the extra_stats invalid
 markers one counter at a time
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
Message-ID: <20261116-ionic-get-fec-stats-v4-1-d25cae9f1e87@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 8801ebfc-f3fb-44b7-b704-08df443658cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	binHMFx5oac/S7yaHVjaqz1rJ8UohkW6xxrGtZoQHwJ38ZZl6pvosqJkCi2q3l0VgnIxrAPUKZ7/7U7Q7dlVNx8V/pRB9Re7e1MkOvOQYLbw8F+n7AJu9Oqlj92j6Ad70SZ0jpqmQ+mmumgAx8ADECh7mbsmZCvJBSYCGdtTIQ9dO4ERkwlgYjsXk9NToWAkZi2WFw09908p127LRvRxv57qCyNTUz9o4MmW83wzP6OmMsnggs9EOf41HdSCW96voY0IbVWgdxrtedz3HOuOlaxoXTBL1QM06dtU0r2uUOlRxpkJ45eBZk7EohI7g9+3DlqzpS3gMYMawocup3yqPLKwwqMuKHDR5xw+UYS64TriTfTYY2y3my00TrY9puoD1U+slIxiLEcJ5kc1nCKZH3BRGcP/QqlCEKrTT4L/a5Jy4Ek6o9Grx8IIkX5uMdetExQL4p0Ll5MLDjR4SWuHnlDxumVpFLE/i+FzNkCy0H6++qS/ob0H7NlCKRfEFm49OKiH51RMe1C2+WwQG0mPZVvQI28eVLnuMwhoKTqWWA0cA/oSHHbB4U7vxGPgWFhoJu7Me0EFafcFQtCA9OG/hF2aQ6zjWNc73p73sMnlWixmnyc6BUU34zbGOtyvlfhQiu8+HwoylpvhcfIb15wFD8CHwEKp3zDsg6IwIQ/4x8MMhpcKGPCbTcLQrSwS13ZEsgX/eiGN3dv84z9+8OOSNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cm7AkGWrpDpicMByuFH6exxMDROsphGJAAAdnxYzFJG+1gYh1NwXbRHsZfehgD6CcjI0RwiHz/eEXYaeU4uqMPGK+BOwfPHaHVeNyRxVJsQ3Wp19Cshk4TCYuIu3D86wvfA2fBeXwONntqRCTQ8O2eyX0BJxzFmG02FB9jgJovIlg6UIzg0xJkTAp5ZGVm9SMF3tpud03duAQbUXkInTloEdFm+Yofm/Q4M4UxKnqz5KiVU7Vu8/+Z/o8HX5KuM7h7B8XM+WRJl4PThuJzpRxeIOyYajTH4rjejBR3oq4bD5D7A3Ig1ipxKw4f2VSqYR/GwK+2XYXHRO7S/lUlR2n5EytnyoU0yL4A3mrC/nXej8/vQH2Di3P0hMCQCJ8ZftvBMSVzW4VuhpNz4zp0EpTiZrNrVYwSH0rT1LkdkU6q8yZ/1qxrrx4ewJD0RfJEnL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:11.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8801ebfc-f3fb-44b7-b704-08df443658cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_port_init() marks every counter in the device-written extra_stats
block invalid before asking firmware to refresh it, so that a statistic
this driver knows about but the firmware does not is reported as absent
rather than as zero.  It does that with a memset() of the whole block.

The .get_fec_stats handler added later in this series reads those
counters one at a time and tests each against IONIC_STAT_INVALID to
decide whether to report it.  memset() gives no guarantee about the
width of its stores, so such a reader can observe a counter that is
neither its old value nor the marker.

The block is entirely __le64, each member naturally aligned, so walk it
as an array and write the markers one counter at a time instead.  A
counter read on its own is then either a complete value or the marker.

Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_main.c  | 8 ++++++--
 drivers/net/ethernet/pensando/ionic/ionic_stats.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
index 9955ab77d86d..b8d0ce597176 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c
@@ -12,6 +12,7 @@
 #include "ionic.h"
 #include "ionic_bus.h"
 #include "ionic_lif.h"
+#include "ionic_stats.h"
 #include "ionic_debugfs.h"
 
 MODULE_DESCRIPTION(IONIC_DRV_DESCRIPTION);
@@ -727,7 +728,9 @@ int ionic_port_init(struct ionic *ionic)
 	struct ionic_identity *ident = &ionic->ident;
 	struct ionic_dev *idev = &ionic->idev;
 	bool allocated = false;
+	__le64 *stat;
 	size_t sz;
+	size_t i;
 	int err;
 
 	if (!idev->port_info) {
@@ -745,8 +748,9 @@ int ionic_port_init(struct ionic *ionic)
 	/* If the driver knows about more "extra stats" than the firmware,
 	 * make sure these stats are marked as invalid.
 	 */
-	memset(&idev->port_info->extra_stats, 0xff,
-	       sizeof(idev->port_info->extra_stats));
+	stat = (__le64 *)&idev->port_info->extra_stats;
+	for (i = 0; i < sizeof(idev->port_info->extra_stats) / sizeof(*stat); i++)
+		WRITE_ONCE(stat[i], IONIC_STAT_INVALID);
 
 	WRITE_ONCE(idev->link_down_count_init, false);
 
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_stats.h b/drivers/net/ethernet/pensando/ionic/ionic_stats.h
index 7ed935868e84..8a0edcc86fb8 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_stats.h
+++ b/drivers/net/ethernet/pensando/ionic/ionic_stats.h
@@ -4,6 +4,8 @@
 #ifndef _IONIC_STATS_H_
 #define _IONIC_STATS_H_
 
+#include <linux/ethtool.h>
+
 #define IONIC_STAT_INVALID	(cpu_to_le64(~0ULL))
 
 #define IONIC_STAT_TO_OFFSET(type, stat_name) (offsetof(type, stat_name))

-- 
2.53.0

