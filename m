Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206290;
	b=0fK7TIkxL1EpvHBhpp2J6AiEJMeSFIVl27HF7EL5oIc0ta0vjcS0VyUrbpwQGaNwT7Ea
	 RGau0N0zfZPyen7Q27UYz0U2m+2UuZ20Yp5fnwHv8zmfI6mBT03oMI00w/OVSYWpY0Wxu
	 FyHebB8e2WBi4YtCPBhuH3+M8nfxIhEkHqp7EwtdqrX3D9t2oPRuH6lDAFFsvfNBnOi+o
	 6dn+tW8mVjuCDcp38qTqTpJhSirq8StWjpzQg6oJKAbtZ6fy1BEE+VPjZ4V0c0rVik8cb
	 RRrORpgm/WOiS8WbPcOUwG+xtWkcV4lb+Whdtf66feTDahngIp172riVbaNuPsGy1hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206290;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=5M3qg7TNb+IzHJHDIOme5wNrrpvxtG/dLpSwQDeTA7o=;
	b=q9YDoSKGgi10YLAaz+XFVoo00COI3eSuCJ+uaX0n02B+3SnPV6f1R2gQrYiymaqSF+x5
	 oNDt6/V7LMWo1DhsU1fcQnEWmQSfm+wcCjytRpSHXqaWd5WjYWNDzfSdZHfVdmnS1TwAo
	 FjGqs/D2WJqJiS0eDIMMsiPlmCr8rdhHyQhRqZHDWIXtfsCE8dnXwOrTuG4pQDR//V0MN
	 Ulf3MP056KJKCqpyifT2S34EpJ/yzWQWaHN5ZuvbHuo4HOdn3di083yM87fhF9odcpuCU
	 JeCIXryyD+uTO1k7cloUxPve0/XYwCfjYZqPaq3asUfQ8kJGAyd7z3jQY49qzoygiZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xl76QL4O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.28
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DDE606A6EF;
	Fri, 20 Nov 2026 20:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DDE606A6EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xl76QL4O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwWyacEabKyfAX/vQkjh+05HpYd1Uc2b9i1O/PprvyWDrZE2hgUmgFjrBEVtcf9IYcyDFbkHUMWVHF+iJN33nrNMUu6GI4/IjhfDmH4sGdCxg2CPipQrxO1hafAtQZyZ78FTVlzMmM3QUlQkkzNwCUBEjj9SWdZ522O77UJ4an/lk2jJSe8VWD+86IbP6XPW4ikAvMdcKkeJYE/KDG8y5JgfnUth8XBkFyexFKK6fD4+3eUVm+RQ4cXtze6Q8WdOWdKlUKWsG+KF36+yEyI3Dyo7W+ZUSw6rnm0Cxz5k93PaR+Kla9cKtyG8iz8M8VptLFSgVn++ZrGh696Lula4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M3qg7TNb+IzHJHDIOme5wNrrpvxtG/dLpSwQDeTA7o=;
 b=MpYE2VnHb+HGgq0GQTAf5/F9S/kUjCvR5nh9zQyMECYjnppAsW1Pq0G8WUBH4ddpuQD2jT7mvTkeSA2wWdVt0LfkjOtcqGESVTbXwBL0Saftnf/NQyqpTs7d4sGkUR2IngMcccz4QsTTqbKV+wiOlc/1WbsGwoQ9lZScNiAag3Yk0k2LgRyVTMPvKtfp7VbeA1BjJiW3yzNy59Gisu588VGUTFUbmByij15rtYKkTkFwFPcV3pDVNeb/cXkJMIHmNQHLr1FCkhZNqrT2UQF98/mKxRrkyemsi7rVzmuDaW/CPIaEmMonIJPYEtDwfITJGt1CzI5rcQ7/TD1ONQPtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M3qg7TNb+IzHJHDIOme5wNrrpvxtG/dLpSwQDeTA7o=;
 b=Xl76QL4ON6FQHtROW/Hmr09DaY5FQpdhbNSmwaZw0gge6cR3iiw4Cn/J+AHuQiwwTMrVZhIKV0dGOMGlCEmfpb/7JOySlriLFszFyqGVr55+/TYsKvC1POk8we2ETOEOPXs01fD1eGWATV7TEs1GS/BbRUbjtvvCSRV2c6o6/AsEgNc4EJY9bI5wQukPwUSMT/N8GWpiFAQ33YRw3boXU6kw5rVvPiepFg9HQb5deFGFJH1/npnpgnxIcjJ9aJIDahzc0/ZuUM2qVp+w722EV/w0UYWDZEXCaQQSP1tYWJya0Qz0fK8yko7vGuPbfJW6sYxisLgi9GK94z2IUa2nkQ==
Received: from BN9PR03CA0431.namprd03.prod.outlook.com (2603:10b6:408:113::16)
 by PH7PR12MB5617.namprd12.prod.outlook.com (2603:10b6:510:133::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 20:24:38 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::2f) by BN9PR03CA0431.outlook.office365.com
 (2603:10b6:408:113::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 20:24:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 20:24:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:19 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:17 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <davthompson@nvidia.com>,
	<cbabroski@nvidia.com>
Subject: [PATCH net-next v1 2/2] mlxbf_gige: disable MAC after kernel panic
Date: Fri, 20 Nov 2026 15:24:03 -0500
Message-ID: <8fa3f8fcbdc45e58b815261d6c2c1decd884f5d1.1795206150.git.cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795206150.git.cbabroski@nvidia.com>
References: <cover.1795206150.git.cbabroski@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|PH7PR12MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5c45dc-2c72-4ef9-b465-08df47444cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261021135927099003|261026140227099003|261021121427099003|11063799006|56012099006|10067099003|261026121527099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MrZIrk1nw4l3WlWv9oY6iD6LXK/sg367IbFezl0yvll+VtU8rww4Jsqs0DEhLY0f/sl5aIVZVMnvArr0gyvlBli0oN3rHYO7ywwZ18ihfoc0T2/nhGoL+ISXFmxailm+sK8/EE5PLrk9c16LWEv6hq6QKK0CnoN0/cU53b1iJcTvwKhDV9YD6dz4IpcY5PXIOYljci1WbzSPT40SNHOHUWTh4IfKjp2a5h8X+CgGUd4gD8qV4p55jht2ax9rswd4ZrsZ7g3uNB2vDvt0/BLMCfXKDVe5O91n7qwEKuIh5Uk+0KVmSUaHg+ldZZx5y/ue197UiE3avKlrBxMN/vmlvU2R+WpIdylzjkkMjBieLXPIt64bXmpdJNIA4gGlZRRAkNzCy5Ngt/KSvBm+5XjbdkhBEKAZU3LAAq7YV/zOxedAJz+t4CNLuaKdQ1X8fMUjlWecJNqQTcGbXtP/FQTcp3+ezc/QNkXmu913fwRr+yX8qAv7g9yYGvUzDa2F9NXuBT8+0H3gqL4wnfslVuD71r7fvAd3CbXoqbvFC9272uwPqmtryoZGfTqqTwF24dcaljSzq63FhV+SxYReEyFIwiqtvVuKGdfHqRgLgJ7OYiovlkgVjkfljzv7hths7DOGHlD5+8BWTTX+Rby2SiQvyBFaqWq9PsRw0hBjKyVJPFKZSXyUSx7iI3u4PGO2xah29hT2c7jOEJQ0OBrKWrMTbQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026140227099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oZH2N1Tz2R5lUQco+gcVETPM1/O2KRDiE8YGizVYJR5daCAy4NhpAjuGFigFTi0iYkDizsH54EFs/CNc180cY0kiQuto5mqmSs9HU/kP7fS98/564rqu7etCJcMF8jZRbOgZtG+KKnvDyV43P2bj2HGXpSuwVLxCdZjeC5UDzazRqXY1tFY+BZI1uZsqEokUA26We6ChczWs57r5aNKgNdBbK/iEEs+bQzASkXkTy40U2kwQv1qVZEkFQCB4tLcWpBXb1vxjJThSezOZVhG81bBu066dtbU4TNXUcaoJF5yHugyiRkyapKcuhhctZUHplhliiIMr5hjlpvWSVw6GJ9IQJ+/EaGrD4XB4097vb1q+MzHi0Xra3aYLTHmuClSBdjQR8/epTPUGoSE26wEGrOuYsfkvjIbVu313L1g1Jz+0tuvqwfuLujvMB/xZLXv7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:24:38.3224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5c45dc-2c72-4ef9-b465-08df47444cfc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5617

After a kernel panic the MAC continues to receive packets into the RX
FIFO even though the driver can no longer process them. By default, the
MAC HW is designed to repeatedly send pause frames to its link partner
when the RX FIFO is full. The internal Ethernet switch on BlueField that
is connected to this port is also designed to stop traffic on all ports
when it receives a high number of continuous pause frames from one of
the ports.

What this means is that when the kernel panics on BlueField, it is
possible to reproduce a scenario under steady and high network load
where the network becomes inaccessible for other devices connected to
the 3-port switch, namely the OOB host and DPU-BMC.

Register a panic notifier at highest priority that disables MAC RX and
clears the RX FIFO to ensure that the MAC can no longer receive packets
or send pause frames.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige.h |  2 +
 .../mellanox/mlxbf_gige/mlxbf_gige_main.c     | 39 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige.h b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige.h
index e7777700ee18..c63bdfae4344 100644
--- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige.h
+++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige.h
@@ -13,6 +13,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/irqreturn.h>
 #include <linux/netdevice.h>
+#include <linux/notifier.h>
 #include <linux/irq.h>
 #include <linux/phy.h>
 
@@ -130,6 +131,7 @@ struct mlxbf_gige {
 	u8 hw_version;
 	struct mlxbf_gige_mdio_gw *mdio_gw;
 	int prev_speed;
+	struct notifier_block panic_nb;
 };
 
 /* Rx Work Queue Element definitions */
diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
index d1f8a72cae53..76da71108345 100644
--- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
+++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/panic_notifier.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <linux/rtnetlink.h>
@@ -127,6 +128,27 @@ static int mlxbf_gige_clean_port(struct mlxbf_gige *priv)
 	return err;
 }
 
+static void mlxbf_gige_disable_port(struct mlxbf_gige *priv)
+{
+	u64 control;
+
+	/* Disable RX DMA */
+	control = readq(priv->base + MLXBF_GIGE_RX_DMA);
+	control &= ~MLXBF_GIGE_RX_DMA_EN;
+	writeq(control, priv->base + MLXBF_GIGE_RX_DMA);
+
+	/* Disable port */
+	control = readq(priv->base + MLXBF_GIGE_CONTROL);
+	control &= ~MLXBF_GIGE_CONTROL_PORT_EN;
+	writeq(control, priv->base + MLXBF_GIGE_CONTROL);
+
+	/* Disable interrupts */
+	writeq(0, priv->base + MLXBF_GIGE_INT_EN);
+
+	/* Ensure completion of disable writes before cleaning the port */
+	mb();
+}
+
 static int mlxbf_gige_open(struct net_device *netdev)
 {
 	struct mlxbf_gige *priv = netdev_priv(netdev);
@@ -382,6 +404,17 @@ static struct mlxbf_gige_link_cfg mlxbf_gige_link_cfgs[] = {
 	}
 };
 
+static int mlxbf_gige_on_panic(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct mlxbf_gige *priv;
+
+	priv = container_of(nb, struct mlxbf_gige, panic_nb);
+	mlxbf_gige_disable_port(priv);
+	mlxbf_gige_clean_port(priv);
+	return NOTIFY_DONE;
+}
+
 static int mlxbf_gige_probe(struct platform_device *pdev)
 {
 	struct phy_device *phydev;
@@ -446,6 +479,10 @@ static int mlxbf_gige_probe(struct platform_device *pdev)
 	/* Write initial MAC address to hardware */
 	mlxbf_gige_initial_mac(priv);
 
+	priv->panic_nb.priority = INT_MAX;
+	priv->panic_nb.notifier_call = mlxbf_gige_on_panic;
+	atomic_notifier_chain_register(&panic_notifier_list, &priv->panic_nb);
+
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (err) {
 		dev_err(&pdev->dev, "DMA configuration failed: %pe\n", ERR_PTR(err));
@@ -497,6 +534,7 @@ static int mlxbf_gige_probe(struct platform_device *pdev)
 	return 0;
 
 out:
+	atomic_notifier_chain_unregister(&panic_notifier_list, &priv->panic_nb);
 	mlxbf_gige_mdio_remove(priv);
 	return err;
 }
@@ -507,6 +545,7 @@ static void mlxbf_gige_remove(struct platform_device *pdev)
 
 	unregister_netdev(priv->netdev);
 	phy_disconnect(priv->netdev->phydev);
+	atomic_notifier_chain_unregister(&panic_notifier_list, &priv->panic_nb);
 	mlxbf_gige_mdio_remove(priv);
 	platform_set_drvdata(pdev, NULL);
 }
-- 
2.34.1

