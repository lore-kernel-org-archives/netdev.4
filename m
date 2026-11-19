Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057004;
	b=4okWkVlxT3dsEXgdLo60ZsCHbc3lG0Y1URfbtTI0eqnzPHcFsFZnvWeu6e3vVYaBwPpj
	 s1afXGqmw9pk4GoQexBG71XwBmiytWWbzUWBSEzLjlAKJ8jAQdqvO+o6/h9yUa5Nbu/7M
	 iX67Is/mlEo7ZgP0CHlMqMgmEVxgftQBMrlIduhxSXlP+yGVTT3e/LRT139nzqW0ZtdHp
	 VGjFesVT6kpRPUsfrEw+xENRQFUXkdLODVaINFN0mNmQ4S9jJodhkBuy9nIh9rhukpUEt
	 h9u7OKMLrT8WRwRLMANKQvQwaym5OGK8yau3JfO4gmpyMdveQuH+8bQVhR94KVxuoUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057004;
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
	b=gegs4RFgKCL9OY0o6TrzeKORQdM4oAUz2FjLP63BjGnoHqmHJ74mgbQnlNP5C4Kx/DwA
	 DhNnlVh36f2c12svWELWqfW/wHfgOFI95IRxLCMkQpO4gbyLUmilIt2NhGmvktbXHd+5+
	 9K82zQ6jkfplsTK6495AU/Nbjf6z/uoEVt5oFDVtgWzfa5wFAiRyP4XnTeMj/82+KJdo2
	 oXxW5st1eFIB/Cqgu4ls3uposs4f/oprZzrYJ6gbgBd3iYEOKbyXW9CFmcnUat5n9ER7+
	 1V27smk/Hk5F5YfzmZThlIwMz58O9GFdd4SVkMgmqWFGZUnWvf+MqsDuSTWAT3I7m0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Jqimz+24;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF2606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCF2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Jqimz+24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmMhug5Q9mjSPYKTJqyr6Hw4wEzS3t3H1So3CdTggDknqTTJXZ8Zi/SN/tbbyLZW30RdMEO12EtdK5ToYGXwH6CMz7/PFhf56E9+OWheJuhR3nunNmqba4C3QwWgtNAEGOYB/eQSkTFoyekd9Xv/+APP3ytv7EYj/xZWCzofR5VJl7/YgesojV8hDvlGuvWJANRfTFua5xnb5gc9CQNOjR826FyPljE5vNkMS+J9xx+kQPwIZV+kqw9mQakYKrQ/+V+TsXUsG0vU4tDddr05qNHLhpBU4c0Y47JeGp7j5raAdoYzhWQ8smDeHnZxaxKYg8XCdNYqveE0J73nVdwxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHvK+R0ySAJ0BWEThcpF3MvLC3etMxB090zISrbSwtg=;
 b=wJio1ukb/myq4l1HvAEGfI3xxD9KoLweZkpn8FXlxtcWV4YXsq8RLaBuWe64Xbi0/ZJNj3IljVwEb9spb/f30s91AUSO0DeVzwNnE2lEofzRXx0Fr4Yb/fbwyRhl2BAWz7++O45gZ/A5dSXd06FQRrBBVHoexktePuXjgbZpKaJoNF3CK72bxuHYazpuUhS+nrVR5VIRIXiXMJsKWRK8J2bPBxU99faZ9Fi9VAMiFeJO0O16F5N2VTNQ1IVoTM5T35PDHRUTzcsylLNUQBT+PZT3/i2MhYEaQ45m7xuH7htTDI6EU0CoM+ZCN4Y2zLR80V47eD0dueQbe1FYa9Xr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHvK+R0ySAJ0BWEThcpF3MvLC3etMxB090zISrbSwtg=;
 b=Jqimz+24Whvjz81MSL6nwHWbWwyj6l7Q7gb9uJh/axSdJoNkL/ijgojvtKhTgiNO71mLAFvrzplk8ErtE0Xn3LZFryXf+J96JhLoaz9EQi8m1XYORiaPlCRsC+Y8MeO9kCUZAFamXVSMNKLsrmUnjfk5ab1a+293aEDCUD3qJSw=
Received: from BN9PR03CA0394.namprd03.prod.outlook.com (2603:10b6:408:111::9)
 by PH6PR12MB338919.namprd12.prod.outlook.com (2603:10b6:510:3dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:39 +0000
Received: from BN3PEPF00022BBB.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::3b) by BN9PR03CA0394.outlook.office365.com
 (2603:10b6:408:111::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 02:56:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBB.mail.protection.outlook.com (10.167.248.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 02:56:39 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:38 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:29 -0800
Subject: [PATCH net-next v5 1/6] ionic: write the extra_stats invalid
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
Message-ID: <20261118-ionic-get-fec-stats-v5-1-c9c0ee63df4c@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBB:EE_|PH6PR12MB338919:EE_
X-MS-Office365-Filtering-Correlation-Id: 172f8875-dd28-4215-7614-08df45e8bbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|261009223027099003|22082099003|11063799006|261026121527099003|261026140227099003|56012099006|261021123027099003|261021135927099003|261022105027099003|261021121427099003|261028144727099003|261022075727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	4mMZlt1kcHAW4zBpe5RXMkxf7PyljRO29wVZSbRqTJxiGgVXv3vKLRu2bpWc1+AeSNLXL2QdGt/nDft1aB0Bvxycj//5Lps+F5r2tOefVRox/ted5vO9qHYckeR23lyWRNEBjrEw/dpXcPLMFGIDi9nO53oSiL4aPebbVwV5yke5wK6PJSw9gkkHkYxdPnhmuG01XVBgJfsj1MYBUMTRz/68U6vvJ1v7/0D6v0J9W15PTInLpjaZMNZy67qUHN0XUVGKoV9F+AaXUykShlyEfEjhouVK+6WZZkrGqlzKd96vs7n49jF5GDHVfbUCD4dd2IjvdW/5VYrb6NHxN3oSo+0Qw7uSDS/F6CzrQnUDhzJJSf+DKh3nMG2hgV74g7TzrY+lJ2uRF0mVkLrVFy6UB7G9uncUu1X2Se36A1t9/Zc9HlPJIv/ESl08LQZ3zd4gLI6nYU2iXNnoBxLGrf0dDA1MqDBoorK18u24N5zKGVdY55Lvqvw4kB8L99K80zFT4do18T1TYXx7kIQkyCMy4q7Mp6oBERz62WZPwoPZuDDLJXKcuNNALvhoUGDqflsZfRk9q+aOt3hgB/1L4DcVGIcaG9z4fJmV+dkn7qlHUVC/mVTYW7+t0NS7gGObvELvnKBXk8gxxcXhrYHjzl7DftW0Gh7t/ErIJT6UnuL06hJpZzndj7w3isG1MUauKKSBsO6xPpXhc3O0B5YYbco/UA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(261009223027099003)(22082099003)(11063799006)(261026121527099003)(261026140227099003)(56012099006)(261021123027099003)(261021135927099003)(261022105027099003)(261021121427099003)(261028144727099003)(261022075727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ZLrwKJC+CiGUIhar5XHZAvXJGejGbE9KTatVGJX8+3/6Q9a31dWv2LwpF7MQK8UbGkWASIGigL/13T67wrTff5E8/Fz4VwLx/644sFXivHhkAFDJgM2i5Vzhq2WuBNxat6uJyNnUFsx6LR+H24eyshiSBVh8MKdpDqHP8PaPRUUrDuyLPGWffXQx0Amm50CJO1Q2qlEuQnVu+vuG09xyuFDFxGLTf/iHp6x3wtACgkKmM1GWAdGQuJts++hj7ttIgTSL5ftmQDek3nb5YNpKct+7Awudk4ZZjg59DkIdPV7gkew3q2CCtR7qHVDid8o5VG0kvLNP/ZCf0SKsybLPiTQog6C+OhiOn1a+F8FssGHupfEKKD4MU2cWntzU0eCftuSUIRQN2agB4RC1pndmU8MuUIa769XUxGXpRkWTSK1moMJ/gVoxoTP/0cUb27S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:39.6804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172f8875-dd28-4215-7614-08df45e8bbe9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB338919

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

