Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648957;
	b=BHLbj159VIm+HvzYVJjSADV4u+u+Yvx2Vd3KAuErCij54Xq2+7cT2yezuWwTBq4gkEKc
	 9YP4ImB9xw6Ss65EfGIXS2hcYozoGstQ0OfLDPwAlrrVAMXfn5pizjfiQWT+OY/ZTLu25
	 N07m637+WjCDRJA+LKaRg1bAQtD41ncA3R5FeJGR6NCcjCkbiL2oTJAMvloVrTBYTJtiH
	 el2K7rAw3OiT10l0hKt2iimGeEJ4Oghe2MxU46b9GPmUOnReNrgPF+uS1pUkPyUzktwGa
	 sJLF8HMSEIraT5LZeqReTIy6KQuuHd9G39S7ZidRRj8V/kn5vUZewiZ0vsWTax15XKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648957;
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
	bh=lMAWE4Jan6qYp6wPmrN37hHHePsSL7U5aeGxmbQshz0=;
	b=qAeWNrJTpglAKwFgPVmfh/W+kAy+wNn5f1EZXbs1ZGV5GH8AEZLBRBBnCNXTyCthsJrt
	 GS8dZBs1O02lDr3wqn0IE0CxShv4/bFJ5XQAThu+N24NjW4iXjw7Sxr5CH7812SIa4rfY
	 V1jItsuUg85ulug6uxIHKYrKZYapepIb0e1jw4Lo1pvJEsjH7K80ZHuWeGpHvTv+Swc4I
	 DWzzaCVKMGfX/OeZICJvKDYKQhaYWd3zarg38pGFPHKGFLfS2fXA0Ofv+E6BPU9Qr+kQw
	 gyM3YMsnWjb+2xHqtQ2PKfqo76qInxnqq5DgNA58ZnejA6YynZY5nbPKGEh63NXqlzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nBl25dcG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.27
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF47606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nBl25dcG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeF4kehW0YSoRUcEFxcPEsa/ENNCKWiahFGSE28iKju934qLZBoNlTyADpiVLSWSSwZeIr/KkiX1Xf7/xhT3ycRVcp8uGi7ynSaOChRTXV9wc1S+/XznDX/8JtwbRPEllaPHkvBdYykLThRMVGLmKQfRiVh3obNiRCxI0058XA2+ziBJm64tPGpks3MiZ+impPrO0gk3fkEQOf6sjQJJ5Pl1WSdY+S2AqnGYVZVSvj4nR6fE3iak7gIEsYd+nXYM/aX4KsSq/zn1ogO8KkMjiwDugJHtxOTareSmOyVszYEqzH+aXxfwLVIp7FfybbnCO+YDNDPGjp84FJgNaI3+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMAWE4Jan6qYp6wPmrN37hHHePsSL7U5aeGxmbQshz0=;
 b=J04vYzMFjmXW/nyJjj1cL+OVCJGJJyBs92NENKFcREMz3eUyx/xAt3dd3e3S4mq5l3jWo18ALd6lsZ7z9YFhEqrKKPuy9LRvkNGdQ/Vs1+TFrqSa50P8d0WEnvIXSW0LOQwHOEjVe/qAbjzCGi5YXOvdwhHTzt3jgWyQV/qTzD7AA22TpVADizSdHbPOWkQRYDTOJsdfLIOWJcHrWsaEKyimdRUTgSYCBjLJn3krcGyt+9/OO1hxNZm9rRY91GCwQHWCMFTCvprxFcwlNO/HonPHPzC/R4VMqL0Vqhgx4wVZOM1t+4T3EJ0uoClrlKPe/IFFC34836v3J4k3dJwkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMAWE4Jan6qYp6wPmrN37hHHePsSL7U5aeGxmbQshz0=;
 b=nBl25dcGLef5TxVDAL4Z1Ru/UbUurnj0PbY6pQrXV/ryXz7T8sqjN5of/I6ndTQ+RkjdNE1CdijFcNl35GTui0VhuRSgauBmv6AJnlgsOyapFeoEWBSAPvV/6BN3tiwNLmPB5QFIePgwwgMWU+H917ZDVRLE47Hhoyu8sYuwN90=
Received: from CH0PR03CA0351.namprd03.prod.outlook.com (2603:10b6:610:11a::13)
 by CH3PR12MB8282.namprd12.prod.outlook.com (2603:10b6:610:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 23:22:33 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::3) by CH0PR03CA0351.outlook.office365.com
 (2603:10b6:610:11a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 25 Nov 2026 23:22:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:32 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:30 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:22 -0800
Subject: [PATCH net-next v6 1/6] ionic: access the extra_stats counters one
 at a time
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
Message-ID: <20261125-ionic-get-fec-stats-v6-1-1ab49c729c00@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CH3PR12MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c3a263-696e-4088-8eaa-08df4b4afb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|6133799003|261009223027099003|18002099003|22082099003|56012099006|261022075727099003|261028144727099003|261022105027099003|10067099003|11063799006|261102123227099003|261026121527099003|261021135927099003|261021121427099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	8LzpX/NAUW6RVENEfmEtwhaMutwj8fH9L0Q30EJzU7auEsowoLgybpu5WEFX9BmDr4B0dBIe2ZH0HXnTjLl3BK2IsKUGIjtoVgtlr+h8K7Gia3dq/xJCAfimXbd6LbrDqtksFG1dJRxovPjBrM4RKv1q1K9I+4wsy627Lo80ZFIVd+gKMCK1IRX+Ud3MBTT03WryDIcnEET5mBrXXnLyU0icOc9h3oyIEfA6PxeS8yMBqng4Q96i/v3TRnvBcOJh4wi9cWlgIZN1ueGXS26dxjuJW89kyD9oU6O95ll2JVsejBYbBNuy9yfyprKAlHOC/ePvMdJ/DJ2ez6P6YRXSpECXDvMEnCnNrNeunu1UHwY72llvj4+N5hBHkTmOAqKkPXkUqgGddcgc4zmAfDDKV/qIgfKJZszV/BwgxENieIIPA7hq9X92PaLwrRXiAXZYIWOkqoDFP6q31hY9ZRb8ADlbHTDHU+zQa2/WIsNKIyFR0C2SzmDCMhkVSL4bhm5b3pWVMcnIuYhrMu3xgENINLOwCyNy1FkVmWkKEWE2NqNkDpnK8KZowt/G6mMku0vIfyxWBVHdixStQpb+FUT9IbcOls33aOqEcwJlS1GgqzNC6Hvaf5XQ5TwN6KNg/igroLvT0EUa6UY6YbWWdPY+wcwBbG06twUovZvfuBJqcRTaM3e8W+LCc8X9pBfOIGrdxsqqbjX7vuTR40BD8Lg6Bw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(261022075727099003)(261028144727099003)(261022105027099003)(10067099003)(11063799006)(261102123227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1dgzpopc0OnbNLCxwr32a9fZOOr/eg7fL8nkJnunn2CHGRx/lH/wMeYu3b9Jw37C8daPcn2ozNXftSTeduacy3dLy3n7k2oQvZfoTK1uHH5rehhJlc0bPgS2MQ4YTCaxm3PXTQe67dq+jZa73fMq4h/YifQnwGjRBTtaBVSfv4m6aBXZX4bCu+6bmpkTNCTIg6rv7nL4CV2eqHl49l6LC19L0SqPw8sis7U7Sletklfh75lw9luBsDOGdQLw1tmRh2u7Ir0ympcru6Z8qxWH0AO7hFjFTJfFU+R0kQ7WujDuv8dDUQCUPFKM2YmzgJkXJMRbRTEtcBrJBq7m1DJwMCp+uVu2ZQHNMN5mUtjHlsUFVPAjTn6X8pURXkOUgXjPCvQQARYtLFyEfMjx4j0IZ5oop1nyMFPBMsrSGeIdHW/naKcv98t9Am5Z3Poy+ZV/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:32.6552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c3a263-696e-4088-8eaa-08df4b4afb62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8282

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_port_init() marks every counter in the device-written extra_stats
block invalid before asking firmware to refresh it, so that a statistic
this driver knows about but the firmware does not is reported as absent
rather than as zero.  It does that with a memset() of the whole block,
and ethtool -S takes its snapshot of the block with a struct copy.

Both run without a common lock: ionic_port_init() is called from the
firmware recovery work, and an ethtool -S that got past the device
present check before the netdev was detached can still be running.
Neither memset() nor a struct copy guarantees the width of its
accesses, so the snapshot can hold a counter that is neither its old
value nor the marker, and ethtool -S then reports it.  The
.get_fec_stats handler added later in this series has the same need.

The block is entirely __le64, each member naturally aligned, so walk it
as an array and write the markers, and take the snapshot, one counter
at a time with WRITE_ONCE() and READ_ONCE().  A counter read on its own
is then either a complete value or the marker.

Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_main.c  | 8 ++++++--
 drivers/net/ethernet/pensando/ionic/ionic_stats.c | 8 +++++++-
 drivers/net/ethernet/pensando/ionic/ionic_stats.h | 2 ++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
index 1ad5f529e600..16c1b1fd155c 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c
@@ -12,6 +12,7 @@
 #include "ionic.h"
 #include "ionic_bus.h"
 #include "ionic_lif.h"
+#include "ionic_stats.h"
 #include "ionic_debugfs.h"
 
 MODULE_DESCRIPTION(IONIC_DRV_DESCRIPTION);
@@ -728,7 +729,9 @@ int ionic_port_init(struct ionic *ionic)
 	struct ionic_identity *ident = &ionic->ident;
 	struct ionic_dev *idev = &ionic->idev;
 	bool allocated = false;
+	__le64 *stat;
 	size_t sz;
+	size_t i;
 	int err;
 
 	if (!idev->port_info) {
@@ -746,8 +749,9 @@ int ionic_port_init(struct ionic *ionic)
 	/* If the driver knows about more "extra stats" than the firmware,
 	 * make sure these stats are marked as invalid.
 	 */
-	memset(&idev->port_info->extra_stats, 0xff,
-	       sizeof(idev->port_info->extra_stats));
+	stat = (__le64 *)&idev->port_info->extra_stats;
+	for (i = 0; i < sizeof(idev->port_info->extra_stats) / sizeof(*stat); i++)
+		WRITE_ONCE(stat[i], IONIC_STAT_INVALID);
 
 	WRITE_ONCE(idev->link_down_count_init, false);
 
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_stats.c b/drivers/net/ethernet/pensando/ionic/ionic_stats.c
index 428d5cca930f..89926e5a2f3c 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_stats.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_stats.c
@@ -237,7 +237,10 @@ static u32 ionic_extra_port_stats_get_count(struct ionic_lif *lif)
 {
 	struct ionic_dev *idev = &lif->ionic->idev;
 	struct ionic_port_extra_stats *pes_cache;
+	const __le64 *src;
 	u32 count = 0;
+	__le64 *dst;
+	size_t i;
 
 	if (!(lif->ionic->ident.dev.capabilities &
 	      cpu_to_le64(IONIC_DEV_CAP_EXTRA_STATS)))
@@ -252,7 +255,10 @@ static u32 ionic_extra_port_stats_get_count(struct ionic_lif *lif)
 		return count;
 	}
 
-	*pes_cache = idev->port_info->extra_stats;
+	src = (const __le64 *)&idev->port_info->extra_stats;
+	dst = (__le64 *)pes_cache;
+	for (i = 0; i < sizeof(*pes_cache) / sizeof(*dst); i++)
+		dst[i] = READ_ONCE(src[i]);
 
 	if (pes_cache->rx_bits_phy != IONIC_STAT_INVALID)
 		count++;
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
2.43.0

