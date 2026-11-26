Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717541;
	b=J7/bZ0hyB9elGYxBjRD19A43dZPUjjKbc1oJm6PPtfgCy2APkha9Ssf9DR1CCl9TWw4v
	 TBWkmOTDoMMnqzUxyDbsGJT5lTKFSFUUglY16y/zL9FpZtbogHQZtgv/bEHsFCIFGC2FA
	 5EijLqqxUPdNjQpTHONusO4Tz7xbzU40CPec8NZPGKggTDIwGm9m23h6oFRD767sAcBxH
	 0BO6GwTMxsByxjl111I682mp4/+up326xOlxsqU4aHWqaebuPGzfMyHYyPx2MbATNWtoK
	 aKvvHfgGNRRzODYWnXDWEiOqPesmqHyvVm8Vu5uGtNzWmHx04uW/r9x69nuVqPhXOdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717541;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jCXJULIhsnp+bFDh1KidS4gZWKxEmxsNyLdgN6ZCyqY=;
	b=NFgx2gyw2mPnX2Vxr3VUscZYzJi16j21RfkbgxMRI+xnSv6o0M0r7YOC5cD6XsN7Nr1v
	 mDR68WRNw2IC5u0a4zrbMwb6JoOvKRRZJE09I7lG22LvinWyu+vb8G83ilFTgzPym22JT
	 xbSNfYcOWWW9NbEgikKCNQzXfQOPD+6aEQwLpXAjdrMKXQ2e2sQnJeEju4KjZ5RmBN6FK
	 VS2qyFtkDXBTUzJ3+dcsn5XQM5JJH/mucgmNvbzcDj2qrCP93iHHfR8np/KFkouNXjaHM
	 ksiQwHydlItcMoZ4fTFwMIPvuGoIPONHNtPYMOwhwGIU93eEIE05lL/mZX1fp4lK4ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qq+ODna4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.9
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D49606A683;
	Thu, 26 Nov 2026 18:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D49606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qq+ODna4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjSlL8/V+tHoDn4VHYy310e1pDPLC3ROxRDWOHyegAEZcuf2W/a01DEg+YPEhuEyLhfJFj54AbVMzFAYLHXBdx49txMCb0QXRCpvDWBAsHE9yW2U9H6f3Dh/krPSBkbAx2MEPSVYDlcmjv7MAsq6QTMBSYY2uc4GrwTq/Jvzj3YQp2Qmhm+uTRmy9TGUJt2FA4ffkwg9s+vLZcBlO+moXMk9gXshJOS+L73uxnYyv/AWuMKZVQoOWNapunxCLbd6RzyLDtzIsCW4DxrCbvNPqtIdy7vYKT6cuaOXxxM+g8dB/iADtf9nFJ/YtT53sLjGeRGLfRyUWazYJ02jvFJQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCXJULIhsnp+bFDh1KidS4gZWKxEmxsNyLdgN6ZCyqY=;
 b=WfVoLdL6WAyrXCHPu2BgANejaZQN5KvzoSpzrHxBdbrPuAHNmCobDfF5n6QSJtGNaszIGscUge7fxUyuwL7hmuv83EF/swTpw2eX5KXqMGdaAw3JJBl2MLMALmvLv3HFtl3j8geHBGFnDxj/U2q2fPgJHRDU4nQRDYyu1doo7W5fL2T/S2XKpfy5ybVnnmevTEIUuRhewki+ScIURwFY1dDumZMRp4AeF1wN+7fnlnr+8M6pOQvpaE52qh7m7JlvVDj6IjTFrnxhrJR5ycyyK4Yzu7eggXD1+U8OrdPrrb7jiUHLx2ZJpq81cwPxyRSV/LFCrv5UqiDxJxmq1imYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCXJULIhsnp+bFDh1KidS4gZWKxEmxsNyLdgN6ZCyqY=;
 b=Qq+ODna4rSMDxe4XooOlIfgDa6jeCi7QPwlt7A+ESNY3oMXgJhOhWXweco9dB1wC1C760EZT5zv/stCjqZyNiz8P0uXRiJPjWLmTWVG0h3sUKYP2jhXW5DuGDdnc6Y2btvR0uo9CAYIiej9yMLJ5qPww0wVQswGDexkyhQi/dVcb/+Y28P/EykyHi/UgY0vR81WZC0YExefvAxqbv/MPpSPX4fFZ4aNWi7Lrv7wEbhAN1+bmKihzhXKUM+eYW4nwp23mMR3LhCs4feW3U4Sh1RaDIUjdYyvjTYewaoWDQBguAUzOk0IUruO7j2xstyOs2WHJrC0ZGksBJGIGLkadEQ==
Received: from DM6PR02CA0132.namprd02.prod.outlook.com (2603:10b6:5:1b4::34)
 by LV8PR12MB9665.namprd12.prod.outlook.com (2603:10b6:408:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 18:25:33 +0000
Received: from DS1PEPF0005344C.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::3b) by DM6PR02CA0132.outlook.office365.com
 (2603:10b6:5:1b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 18:25:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0005344C.mail.protection.outlook.com (10.167.23.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 18:25:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:16 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport; Thu, 26
 Nov 2026 10:25:13 -0800
From: Tariq Toukan <tariqt@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, "open
 list" <linux-kernel@vger.kernel.org>, Shahar Shitrit <shshitrit@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH net-next V3 5/5] net/mlx5: nodnic: Add health monitoring
Date: Thu, 26 Nov 2026 20:24:48 +0200
Message-ID: <20261126182448.707782-6-tariqt@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20261126182448.707782-1-tariqt@nvidia.com>
References: <20261126182448.707782-1-tariqt@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344C:EE_|LV8PR12MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: e7238aaa-0083-4306-a460-08df4beaa871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021121427099003|261021123027099003|261022113327099003|261026140227099003|261028144727099003|261026121527099003|261009223027099003|261022105027099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GOAOuNwaqhiCtryt8TUkPQmME12VPM91kbHT3HyjVfBs8VJayFBiHRKZhn8C7qq8dAmonfvTC+FYoG3gDuUlWFmAFa+Js2yV8msViRM6lkK0tsPAY+B9I7Z+hFHHACy5JF9HPBTRSru4G2CtSZXHTa9fK4WuHPHqsbH8b6NXyMwTmMylUGhxrLBPRsyywRgk1ZN9nyWwA7ZTAvEEkwNpeAL3ojdc821Cg0QR/lY37XgSQLVF4sY2X7Bg7cmXy7KifzpTrewFiU/cbh+N5mjGL78ek0/3OBEcm19nEoa9DNMR2ZdPheFQbWvJNEbGgyJXwuooCllttTuhBotT3ELbtVHOLw4Q/mbJFGgobElfVLmiBWLnISBgvRT5yxsx6qDpLVVfz7KMz/lZom3H1PYVOlFFyVKIG65lPUUuXI8Uxt6iodyRqgbh+1EtySA3niRIRenPeFJc464u7lHTOHtzhLj9TgE214NEc/xTDOXOd1rmMeUoHO8GxBXrdvQ00V4n2ylZVQAVViatpNeCTI0wRbjLR5e4ClF+NYde++Z2o9wra1sOQHB6xol4+hpHmuF1Oipx0Fe4m1EW7PL2sLf1Ixmnjec/S9b8M2UM8GILi0yhD7R9SBP7Cp6RpvhM8XpZFTNVHtiJguQ2l/kJwsPg48EtiUhI86l9OOnMOSokQsd/kuB4zGxC+hrPHQdLt5UlAw++WGj5WuX1vGYkwyn0KQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261021123027099003)(261022113327099003)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2pDS3kgssxHxS2lKhosY0gPbhc7Q+4q243+Zy0jKhQ3oGqoDzQ22IBuaR9E9NHAsjPOluPqwy4tvdFBsxV1xcYt0oJ18OIyO/Knv5+zh3KHQoxpINj4bAegtyhtwiXEcMJwT7dSAlxGT0AHRENauvXvRHLiogd6VaKwfVIwy+fJLE/QwI/NNLYqOELipOhvWsVLo97uzAWTUEQaKRPTZhx/fzprXrOVJC8hD7tyg8ck0rGiqfGWM31Np/JfCj18Gw4OjmHot6b/oWJUbpJd6EmIpuOdYOppluVPL3shsrVhhRzZ8pAjWlmLYFMT1QBSfnaDYGRwAyJ216E4lcXC3Su3UoyTPmx7LI0ioAlBCTrOByxZFKpb1zuerWC+mND8UUcYd8pwc/KgvHLvls2jj1iiM9s4hNyIYAiorr3QGHyx03kD5Pb0OQWgaqeeZNgGu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:25:32.9076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7238aaa-0083-4306-a460-08df4beaa871
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0005344C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9665

From: Shahar Shitrit <shshitrit@nvidia.com>

Monitor firmware health by periodically polling the health buffer from
the initialization segment.

Detect fatal device conditions, firmware health counter stalls, and
syndrome changes. Report health errors together with their severity
and mark the device as unhealthy on fatal conditions.

Start and stop health polling as part of the device probe and remove
flows.

Signed-off-by: Shahar Shitrit <shshitrit@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
---
 .../ethernet/mellanox/mlx5/nodnic/Makefile    |   2 +-
 .../net/ethernet/mellanox/mlx5/nodnic/en.h    |  12 +
 .../ethernet/mellanox/mlx5/nodnic/en_cfg.c    |   6 +
 .../ethernet/mellanox/mlx5/nodnic/health.c    | 303 ++++++++++++++++++
 .../net/ethernet/mellanox/mlx5/nodnic/main.c  |   2 +
 .../ethernet/mellanox/mlx5/nodnic/nodnic.h    |  25 ++
 6 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/health.c

diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile b/drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile
index 25865d7244d8..c60418875e2c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_MLX5_NODNIC) += mlx5_nodnic.o
 
-mlx5_nodnic-y := main.o en.o en_cfg.o tx.o rx.o nodnic_pci_vsc.o
+mlx5_nodnic-y := main.o en.o en_cfg.o tx.o rx.o nodnic_pci_vsc.o health.o
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
index a5812a2205d6..24258bfb2217 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
@@ -123,6 +123,16 @@ struct mlx5_nodnic_working_buffer {
 	u32 alloc_size;
 };
 
+struct mlx5_nodnic_health {
+	struct health_buffer __iomem   *health;
+	__be32 __iomem		       *health_counter;
+	struct timer_list		timer;
+	u32				prev_counter;
+	int				miss_counter;
+	u8				synd;
+	u32				fatal_error;
+};
+
 struct mlx5_nodnic_priv {
 	struct mlx5_nodnic_core_dev *core_dev;
 	struct net_device *netdev;
@@ -138,6 +148,8 @@ struct mlx5_nodnic_priv {
 	struct mlx5_nodnic_dbr	dbr; /* one shared dbr for TX and RX */
 	struct mlx5_nodnic_cq	cq;
 	struct mlx5_nodnic_ring	working_buffer;
+
+	struct mlx5_nodnic_health health;
 };
 
 void mlx5_nodnic_build_netdev(struct net_device *netdev);
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
index bdbe76b8dbcb..04cb990b2d07 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
@@ -918,6 +918,12 @@ static int mlx5_nodnic_open_locked(struct net_device *netdev)
 	struct mlx5_nodnic_core_dev *dev = priv->core_dev;
 	int err;
 
+	if (READ_ONCE(dev->state) == NODNIC_DEVICE_STATE_INTERNAL_ERROR) {
+		netdev_err(netdev,
+			   "Cannot open: device is in a fatal error state\n");
+		return -EIO;
+	}
+
 	err = mlx5_nodnic_init_uar_map(dev);
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
new file mode 100644
index 000000000000..a2038eea9717
--- /dev/null
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+// Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+#include <linux/kernel.h>
+#include <linux/random.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+
+#include "en.h"
+#include "nodnic_ifc.h"
+#include "nodnic.h"
+
+#define MLX5_NODNIC_HEALTH_POLL_INTERVAL_MS 2000
+#define MLX5_NODNIC_MAX_MISSES	3
+
+enum nodnic_rfr_severity_bit_offsets {
+	NODNIC_CRR_BIT_OFFSET = 0x6,
+	NODNIC_RFR_BIT_OFFSET = 0x7,
+};
+
+enum {
+	MLX5_NODNIC_SEVERITY_MASK	= 0x7,
+	MLX5_NODNIC_SEVERITY_VALID_MASK	= 0x8,
+};
+
+enum  {
+	MLX5_NODNIC_SENSOR_NO_ERR,
+	MLX5_NODNIC_SENSOR_PCI_COMM_ERR,
+	MLX5_NODNIC_SENSOR_PCI_ERR,
+	MLX5_NODNIC_SENSOR_NIC_DISABLED,
+	MLX5_NODNIC_SENSOR_NIC_SW_RESET,
+	MLX5_NODNIC_SENSOR_FW_SYND_RFR,
+};
+
+static unsigned long get_next_poll_jiffies(void)
+{
+	return jiffies + msecs_to_jiffies(MLX5_NODNIC_HEALTH_POLL_INTERVAL_MS) +
+	       get_random_u32_below(HZ);
+}
+
+static bool sensor_pci_not_working(struct mlx5_nodnic_health *health)
+{
+	struct health_buffer __iomem *h = health->health;
+
+	return (ioread32be(&h->fw_ver) == 0xffffffff);
+}
+
+static u8 mlx5_nodnic_get_nic_state(struct mlx5_nodnic_core_dev *dev)
+{
+	return (ioread32be(&dev->iseg->cmdq_addr_l_sz) >> 8) & 7;
+}
+
+static int mlx5_nodnic_health_get_rfr(u8 rfr_severity)
+{
+	return rfr_severity >> NODNIC_RFR_BIT_OFFSET;
+}
+
+static bool sensor_fw_synd_rfr(struct mlx5_nodnic_core_dev *dev)
+{
+	struct mlx5_nodnic_health *health = &dev->priv->health;
+	struct health_buffer __iomem *h = health->health;
+	u8 synd = ioread8(&h->synd);
+	u8 rfr;
+
+	rfr = mlx5_nodnic_health_get_rfr(ioread8(&h->rfr_severity));
+
+	if (rfr && synd)
+		mlx5_nodnic_core_dbg(dev, "FW requests reset, synd: %d\n",
+				     synd);
+
+	return rfr && synd;
+}
+
+static
+u32 mlx5_nodnic_health_check_fatal_sensors(struct mlx5_nodnic_core_dev *dev)
+{
+	u32 nic_state;
+
+	if (pci_channel_offline(dev->pdev))
+		return MLX5_NODNIC_SENSOR_PCI_ERR;
+	if (sensor_pci_not_working(&dev->priv->health))
+		return MLX5_NODNIC_SENSOR_PCI_COMM_ERR;
+
+	nic_state = mlx5_nodnic_get_nic_state(dev);
+	if (nic_state == MLX5_NODNIC_ISEG_NIC_INTERFACE_DISABLED)
+		return MLX5_NODNIC_SENSOR_NIC_DISABLED;
+	if (nic_state == MLX5_NODNIC_ISEG_NIC_INTERFACE_SW_RESET)
+		return MLX5_NODNIC_SENSOR_NIC_SW_RESET;
+
+	if (sensor_fw_synd_rfr(dev))
+		return MLX5_NODNIC_SENSOR_FW_SYND_RFR;
+
+	return MLX5_NODNIC_SENSOR_NO_ERR;
+}
+
+static const char *mlx5_nodnic_fatal_error_str(u32 err)
+{
+	switch (err) {
+	case MLX5_NODNIC_SENSOR_PCI_COMM_ERR: return "PCI communication error";
+	case MLX5_NODNIC_SENSOR_PCI_ERR:      return "PCI error";
+	case MLX5_NODNIC_SENSOR_NIC_DISABLED: return "NIC disabled";
+	case MLX5_NODNIC_SENSOR_NIC_SW_RESET: return "NIC SW reset";
+	case MLX5_NODNIC_SENSOR_FW_SYND_RFR:  return "FW synd RFR";
+	default:                       return "unknown";
+	}
+}
+
+static int mlx5_nodnic_health_get_crr(u8 rfr_severity)
+{
+	return (rfr_severity >> NODNIC_CRR_BIT_OFFSET) & 0x01;
+}
+
+static int mlx5_nodnic_health_get_severity(u8 rfr_severity)
+{
+	return rfr_severity & MLX5_NODNIC_SEVERITY_VALID_MASK ?
+	       rfr_severity & MLX5_NODNIC_SEVERITY_MASK : LOGLEVEL_ERR;
+}
+
+/* Syndrome values from health buffer (same as mlx5_ifc.h) */
+static const char *mlx5_nodnic_hsynd_str(u8 synd)
+{
+	switch (synd) {
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_FW_INTERNAL_ERR:
+		return "firmware internal error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_DEAD_IRISC:
+		return "irisc not responding";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_HW_FATAL_ERR:
+		return "unrecoverable hardware error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_FW_CRC_ERR:
+		return "firmware CRC error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_ICM_FETCH_PCI_ERR:
+		return "ICM fetch PCI error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_ICM_PAGE_ERR:
+		return "HW fatal error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_ASYNCHRONOUS_EQ_BUF_OVERRUN:
+		return "async EQ buffer overrun";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_EQ_IN_ERR:
+		return "EQ error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_EQ_INV:
+		return "Invalid EQ referenced";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_FFSER_ERR:
+		return "FFSER error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_HIGH_TEMP_ERR:
+		return "High temperature";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_ICM_PCI_POISONED_ERR:
+		return "ICM fetch PCI data poisoned error";
+	case MLX5_NODNIC_ISEG_HEALTH_SYNDROME_TRUST_LOCKDOWN_ERR:
+		return "Trust lockdown error";
+	default:
+		return "unrecognized error";
+	}
+}
+
+static const char *mlx5_nodnic_loglevel_str(int level)
+{
+	switch (level) {
+	case LOGLEVEL_EMERG:
+		return "EMERGENCY";
+	case LOGLEVEL_ALERT:
+		return "ALERT";
+	case LOGLEVEL_CRIT:
+		return "CRITICAL";
+	case LOGLEVEL_ERR:
+		return "ERROR";
+	case LOGLEVEL_WARNING:
+		return "WARNING";
+	case LOGLEVEL_NOTICE:
+		return "NOTICE";
+	case LOGLEVEL_INFO:
+		return "INFO";
+	case LOGLEVEL_DEBUG:
+		return "DEBUG";
+	}
+	return "Unknown log level";
+}
+
+static void mlx5_nodnic_print_health_info(struct mlx5_nodnic_core_dev *dev)
+{
+	struct mlx5_nodnic_health *health = &dev->priv->health;
+	struct health_buffer __iomem *h = health->health;
+	u8 synd = ioread8(&h->synd);
+	u8 rfr_severity;
+	int severity;
+	int i;
+
+	if (!synd)
+		return;
+
+	if (sensor_pci_not_working(&dev->priv->health)) {
+		mlx5_nodnic_core_err(dev, "PCI slot is unavailable\n");
+		return;
+	}
+
+	rfr_severity = ioread8(&h->rfr_severity);
+	severity = mlx5_nodnic_health_get_severity(rfr_severity);
+
+	mlx5_nodnic_log(dev, severity,
+			"Health issue observed, %s, severity(%d) %s:\n",
+			mlx5_nodnic_hsynd_str(synd), severity,
+			mlx5_nodnic_loglevel_str(severity));
+
+	for (i = 0; i < ARRAY_SIZE(h->assert_var); i++)
+		mlx5_nodnic_log(dev, severity, "assert_var[%d] 0x%08x\n", i,
+				ioread32be(h->assert_var + i));
+
+	mlx5_nodnic_log(dev, severity, "assert_exit_ptr 0x%08x\n",
+			ioread32be(&h->assert_exit_ptr));
+	mlx5_nodnic_log(dev, severity, "assert_callra 0x%08x\n",
+			ioread32be(&h->assert_callra));
+	mlx5_nodnic_log(dev, severity, "raw fw_ver 0x%08x\n",
+			ioread32be(&h->fw_ver));
+	mlx5_nodnic_log(dev, severity, "time %u\n", ioread32be(&h->time));
+	mlx5_nodnic_log(dev, severity, "hw_id 0x%08x\n",
+			ioread32be(&h->hw_id));
+	mlx5_nodnic_log(dev, severity, "rfr %d\n",
+			mlx5_nodnic_health_get_rfr(rfr_severity));
+	mlx5_nodnic_log(dev, severity, "crr %d\n",
+			mlx5_nodnic_health_get_crr(rfr_severity));
+	mlx5_nodnic_log(dev, severity, "severity %d (%s)\n", severity,
+			mlx5_nodnic_loglevel_str(severity));
+	mlx5_nodnic_log(dev, severity, "irisc_index %d\n",
+			ioread8(&h->irisc_index));
+	mlx5_nodnic_log(dev, severity, "synd 0x%x: %s\n", synd,
+			mlx5_nodnic_hsynd_str(synd));
+	mlx5_nodnic_log(dev, severity, "ext_synd 0x%04x\n",
+			ioread16be(&h->ext_synd));
+
+	if (mlx5_nodnic_health_get_crr(rfr_severity))
+		mlx5_nodnic_core_warn(dev, "Cold reset is required\n");
+}
+
+static void mlx5_nodnic_poll_health(struct timer_list *t)
+{
+	struct mlx5_nodnic_priv *priv = timer_container_of(priv, t,
+							   health.timer);
+	struct mlx5_nodnic_core_dev *dev = priv->core_dev;
+	struct mlx5_nodnic_health *health = &priv->health;
+	struct health_buffer __iomem *h = health->health;
+	u32 fatal_error, count;
+	u8 prev_synd;
+
+	if (READ_ONCE(dev->state) == NODNIC_DEVICE_STATE_INTERNAL_ERROR)
+		return;
+
+	fatal_error = mlx5_nodnic_health_check_fatal_sensors(dev);
+
+	if (fatal_error && !health->fatal_error) {
+		mlx5_nodnic_core_err(dev, "fatal error detected: %s (%u)\n",
+				     mlx5_nodnic_fatal_error_str(fatal_error),
+				     fatal_error);
+		priv->health.fatal_error = fatal_error;
+		WRITE_ONCE(dev->state, NODNIC_DEVICE_STATE_INTERNAL_ERROR);
+		if (fatal_error != MLX5_NODNIC_SENSOR_PCI_COMM_ERR &&
+		    fatal_error != MLX5_NODNIC_SENSOR_PCI_ERR)
+			mlx5_nodnic_print_health_info(dev);
+		return;
+	}
+
+	count = ioread32be(health->health_counter);
+	if (count == health->prev_counter)
+		++health->miss_counter;
+	else
+		health->miss_counter = 0;
+
+	health->prev_counter = count;
+	if (health->miss_counter == MLX5_NODNIC_MAX_MISSES) {
+		mlx5_nodnic_core_err(dev,
+				     "device's health compromised - reached miss count\n");
+		health->synd = ioread8(&h->synd);
+		mlx5_nodnic_print_health_info(dev);
+	}
+
+	prev_synd = health->synd;
+	health->synd = ioread8(&h->synd);
+	if (health->synd && health->synd != prev_synd)
+		mlx5_nodnic_print_health_info(dev);
+
+	mod_timer(&health->timer, get_next_poll_jiffies());
+}
+
+void mlx5_nodnic_start_health_poll(struct mlx5_nodnic_core_dev *dev)
+{
+	struct mlx5_nodnic_health *health = &dev->priv->health;
+
+	timer_setup(&health->timer, mlx5_nodnic_poll_health, 0);
+	health->fatal_error = MLX5_NODNIC_SENSOR_NO_ERR;
+	health->miss_counter = 0;
+	health->prev_counter = 0;
+	health->synd = 0;
+	health->health = &dev->iseg->health;
+	health->health_counter = &dev->iseg->health_counter;
+
+	health->timer.expires = jiffies +
+			msecs_to_jiffies(MLX5_NODNIC_HEALTH_POLL_INTERVAL_MS);
+	add_timer(&health->timer);
+}
+
+void mlx5_nodnic_stop_health_poll(struct mlx5_nodnic_core_dev *dev)
+{
+	struct mlx5_nodnic_health *health = &dev->priv->health;
+
+	timer_delete_sync(&health->timer);
+}
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
index b905deda56dc..0e511970402a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
@@ -807,6 +807,7 @@ static int mlx5_nodnic_probe_one(struct pci_dev *pdev,
 	dev->netdev_registered = true;
 
 	dev->state = NODNIC_DEVICE_STATE_UP;
+	mlx5_nodnic_start_health_poll(dev);
 
 	pci_save_state(pdev);
 
@@ -832,6 +833,7 @@ static void mlx5_nodnic_remove_one(struct pci_dev *pdev)
 	if (!dev)
 		return;
 
+	mlx5_nodnic_stop_health_poll(dev);
 	mlx5_nodnic_event_irq_cleanup(dev);
 	mlx5_nodnic_cleanup_netdev(dev);
 	mlx5_nodnic_dev_cleanup(dev);
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
index c44b0fdbe601..6f8677bf1aae 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
@@ -78,6 +78,31 @@ struct mlx5_nodnic_core_dev {
 	enum mlx5_nodnic_device_state	state;
 };
 
+static inline void mlx5_nodnic_printk(struct mlx5_nodnic_core_dev *dev,
+				      int level, const char *format, ...)
+{
+	struct device *device = dev->device;
+	struct va_format vaf;
+	va_list args;
+
+	if (WARN_ONCE(level < LOGLEVEL_EMERG || level > LOGLEVEL_DEBUG,
+		      "Level %d is out of range, set to default level\n", level))
+		level = LOGLEVEL_DEFAULT;
+
+	va_start(args, format);
+	vaf.fmt = format;
+	vaf.va = &args;
+
+	dev_printk_emit(level, device, "%s %s: %pV", dev_driver_string(device),
+			dev_name(device), &vaf);
+	va_end(args);
+}
+
+#define mlx5_nodnic_log(__dev, level, format, ...)			\
+	mlx5_nodnic_printk(__dev, level, "%s:%d:(pid %d): " format,	\
+			   __func__, __LINE__, current->pid,		\
+			   ##__VA_ARGS__)
+
 void mlx5_nodnic_start_health_poll(struct mlx5_nodnic_core_dev *dev);
 void mlx5_nodnic_stop_health_poll(struct mlx5_nodnic_core_dev *dev);
 
-- 
2.44.0

