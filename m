Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530878;
	b=lsjhi5+yuoKZQZfKm2nAhcCabfbqn5wH5/tM5TciX+Sr7hAB4QIbbD1QjysnKGGl0l00
	 fS4bszg++H7GkuxngLzQEDQ9FxeKuqmfZXCK7OFLMNxibkh5I6WrgtU3VNEBK4EhoeF53
	 5IbdWYaZzw/2syRmdYPf78wo73dmzvFwk953EqHPBJNW3CaE/G2bHe18bBmGGHAfrZtG0
	 ZF0RNNesy/VoUFAct+w+hYAQiWEGR8hQ+ueVTdCIpz1s6XVKiLP+gKQ+Gk6ONdw4b43Fd
	 XuKzbVNnTLJF9el2NNkNutXhTQVaHhhMB+kuO259LpgKM2qbL9JIz8vUckiQY1M7ptg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530878;
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
	bh=ViYIAuEgnJuRhzS5XyiLvBx9NJr0N/A9yGFxhodzjD8=;
	b=QAqbHTco690NCHNxPx4aYD/RQib01nb6jxfV7D7nmMJ64Tf8gtVBE+PIReEjC5H7MtZp
	 /dSBd2yzlMWAhbGtmVnHJsMbYzVh2oygufen7iN2Dw9WPu9A0TrKN5EL+fv0aamK5It5S
	 OSk9jM9UJ/yA2Zd4LOa2aY8ui/TG6HKbzefFUzSgOkruPoaVHLKsM0/3AbDN0rAHyklxn
	 jRYujrG8+i9pWDAO1Wqzxqf1CNLvhexYIcPgQwu2uj5NBaTtf8ra/q/t0bD5ttmEp9e2S
	 uQbWK29037it5mWNeegW2BLRFnoh9bFDCtDYBFJfvm5c6GQbV8xSMX6JTB8HmO54CXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GYUDy7yi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD2606A31E;
	Tue, 24 Nov 2026 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GYUDy7yi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGpMdENprmWivj8Bj/aY5mL1YmOLXOG7wMym2Bqifl7SAOh9hjsLPFqDwzaWdSe2yfAx/akgA3o21p0eWK9x9nqjTy9swDqVwIq0I4olWqbMSU/0aalCtZUooGqljQBOes1yrac6j4s57K30RZfP4ld0Aw0q0l2Sk/FwGuR7g1dcosG/Duno+0pWydahkTLFE9ktJ3yKZuYWbMcqXmk74Djd1ZHMTroASGOVhRJII4yM4m8rjS2LSwk0J+9TccCSU5GOzO8eU8pw/dPmvkjMOwC5DXjV2qGvqVhbBPgqnYvUiS09i51pbZto4co0h9XHz5RHy6Q3SK2jpSHDxvDssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViYIAuEgnJuRhzS5XyiLvBx9NJr0N/A9yGFxhodzjD8=;
 b=IivDChBDLjsuKbtzNRLbOgL/a8igthPXDK0wxYoSWgK6ktXhYVBwJVn1QklVfOjxNxTWuE9GZ+ehcY6mLBEkffskkPeNGGvpiioKbrS5tnFT1JEhFNT4Lad6OidgWWFTMiYJZhyzFk1GdeaxRQSgTMRoSrcw4y4igAUcvOj8OjjhqmETMR2J4yYR183JHH8IgH70kOjkXOLxmql+DFxcxekZWV9qfYdTu0Hs1ty+23FgM2wEsmTD+4UDW3XtZPBWdGjFskD6cjRq2xbUbh8R+Lg2kmwNIjnVDSlADg9ZnlcWjHceYVEJqDYg1i+5PuwLPAt626xX8XM/JfOHmKMD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViYIAuEgnJuRhzS5XyiLvBx9NJr0N/A9yGFxhodzjD8=;
 b=GYUDy7yiNAXVhZzMCplHl/hc42rpBYa2dFhnSRRx3tQNnAAqXr7SQppDm4yaKT/X21xPWnAXyzoiY91ioOBx2VzGu5XrVtjS1ZxrpsiVn4vJqaS0jy9L7gnUivlxv0TnwlyXb/TS2VrSaVvolnccoTTRiQv8tNZYA18j0LCMcffoX8/h3gUxHhfFmu2nlKjagkIwo6M8Jd6EjvMT8CAs9I8orOeVLuDJY2zD8KYqRJ0IOk4VvxBQW/LmXsmxokyqPm2ZpY1snBna+wzl2rDwJgY5gey5xCCxPSCgiMBqv0zTEh7XwW3f9jfLn7GWrLaYoXzqgc7SPu33TIJ9Q1Rb9Q==
Received: from DS1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::18) by
 IA1PR12MB9739.namprd12.prod.outlook.com (2603:10b6:208:465::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 14:34:34 +0000
Received: from DS2PEPF00007108.namprd05.prod.outlook.com
 (2603:10b6:8:455:cafe::65) by DS1P220CA0014.outlook.office365.com
 (2603:10b6:8:455::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007108.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:10 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:08 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 5/7] net: lan743x: handle a failed reopen on resume
Date: Tue, 24 Nov 2026 09:33:20 -0500
Message-ID: <614c536edbd2cf29e8a53076612404d1091d18c5.1795027003.git.cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795027003.git.cbabroski@nvidia.com>
References: <cover.1795027003.git.cbabroski@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00007108:EE_|IA1PR12MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: 592a98bb-3026-4613-985f-08df4a380f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|11063799006|56012099006|10067099003|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Yd8IJ/xSVNiSjiS9ERDIJuIk5g6W7YTJXnJFEnclzQrF3+kjf7l2zdEK3muvLju8R5RVErzpT8KwKhAhFGyjomr1R/2e1Rnu+k4TfaVY7oHe4aP/V7Jme0tq1+Z4Pl5Oe+oy3v9FoJhVwoCeMoMMiXaoApCFTLaC5kwDfYQPxZqMIA0aBXekSNumcqjtXIpkEWko50NVdrf/3mGlO5YeKbNvEbXvzmcPyJeaznCo4OMVKHmTzkytyq96iiyutl9e8ylWt+2WPEM4b7yO/FLqDIOqs7iabem01rxigyIpxqnU36d/UTQ3NK6jLsK+AvBXazfQqrzefjvsNd4KIUXaitjRvtgTPfgzq51NMeyhw1BGvGB7WBFgKaGgNSbSWR0n0s3KzBLnrWsQdXGlmnzIn8OWZCWKpb5nPHVbTIJJWSYGvpTtZmAH17N4U/bOXh36marmPBZOMYg+Jn3FpApYPISIQlT6TgjE6TiUYQD1mnFqiVRoHAvBpNAVUU3MdvtO8hQbdqyu0NJkIMO11JuvUOjxIILA6sc0P6ZX0ahSxF6LkHcJ5YjHMboF+fyZgZOqjm6Uw5FSVe5dqeQRy+8vDba7b/LGzYRbVtiTZQ/2MorYxPTZY2tTaxPJefNYUohNKiBmFwKmcA6bt0aABo+M5m/U1G/gGmVN+a87gHjA9Mjvi57OP77Uuj8kjECEpCVgFt2K+3OqcUnl/J9ohyhBaA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V5DVJDMIvQBUTjgYbr9NYWUWFqjUwMM0yxrcq2DIMAKMX26hKObout3pIlr2IQ0EQfYiHahkAAcM2fj83l6w8i8pEg5W/qnrTUdHXF/BUEYIFU1d5umt5PCzQ+cbqLryeply9+a0suW2pDihQ424Tqm1sIv4q18Hkan8FFYxI3SX5xoDqsjbZYWs+8ALHQgkkVBqDOII6TWlICJY8l0PUy20Q1CxRIYEzCIWhEvObnxDgOce9pXymDVqC8kUPHkMcvviY2DEEVioB/9lFcEgiPEMl+MwuTdJMNpYvQy4Lj+LMOQaEiNDUGg59dqrCVJINUJ9OuMunFUU+Iv4EgRi/bIZ+Awv2oSwQLqEUyfuWci8XNZBYjLVZo+91r3mvPe6nyXXfJFGBdpebSz5I28aykhB0sdekeXhO06zaiG7aQgkX/Uo94rtpBC2KtxS9wuN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:34.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592a98bb-3026-4613-985f-08df4a380f30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9739

lan743x_pm_resume() ignores the return value of lan743x_netdev_open().
If the reopen fails, its error path has already closed the channels and
freed the rings, but netif_device_attach() still wakes the TX queues. A
later ndo_stop then runs lan743x_netdev_close() a second time, and
napi_disable() on a NAPI that is already disabled never returns, with
rtnl held.

If the reopen fails, take the interface down with dev_close() before
attaching the device again, so it can be brought back up later. The
hardware is already closed at that point, so route ndo_stop through a
wrapper that skips the hardware close while the device is detached.

If lan743x_hardware_init() fails on resume, the device is left detached
with the hardware already closed by suspend. Skip the close in
lan743x_pcidev_shutdown() in that case as well, so a later suspend or
shutdown does not close it a second time. Also stop releasing the PCI
resources on that error path. They are taken in probe and released in
remove, which still runs later and would release them a second time.

While the device is detached, the core does not call ndo_set_rx_mode, so
address list changes made in that window, such as IPv6 multicast joins,
which do not take rtnl, never reach the RX filter. Program the filter
again after the device is attached.

Fixes: 4d94282afd95 ("lan743x: Add power management support")
Fixes: d6423d2ec39c ("net: ethernet: microchip: lan743x: Fix driver crash when lan743x_pm_resume fails")
Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 35 ++++++++++++++++---
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index b226078bf3a9..228b6ab539a1 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3477,6 +3477,14 @@ static int lan743x_netdev_open(struct net_device *netdev)
 	return ret;
 }
 
+static int lan743x_netdev_stop(struct net_device *netdev)
+{
+	if (!netif_device_present(netdev))
+		return 0;
+
+	return lan743x_netdev_close(netdev);
+}
+
 static netdev_tx_t lan743x_netdev_xmit_frame(struct sk_buff *skb,
 					     struct net_device *netdev)
 {
@@ -3583,7 +3591,7 @@ static int lan743x_netdev_set_mac_address(struct net_device *netdev,
 
 static const struct net_device_ops lan743x_netdev_ops = {
 	.ndo_open		= lan743x_netdev_open,
-	.ndo_stop		= lan743x_netdev_close,
+	.ndo_stop		= lan743x_netdev_stop,
 	.ndo_start_xmit		= lan743x_netdev_xmit_frame,
 	.ndo_eth_ioctl		= lan743x_netdev_ioctl,
 	.ndo_set_rx_mode	= lan743x_netdev_set_multicast,
@@ -3885,15 +3893,20 @@ static void lan743x_pcidev_shutdown(struct pci_dev *pdev)
 {
 	struct net_device *netdev = pci_get_drvdata(pdev);
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
+	bool present;
 
 	rtnl_lock();
+	present = netif_device_present(netdev);
 	netif_device_detach(netdev);
 
 	/* close netdev when netdev is at running state.
 	 * For instance, it is true when system goes to sleep by pm-suspend
 	 * However, it is false when system goes to sleep by suspend GUI menu
+	 *
+	 * If the device is not present then netdev has already been closed.
+	 * This can be true if a previous resume failed.
 	 */
-	if (netif_running(netdev))
+	if (present && netif_running(netdev))
 		lan743x_netdev_close(netdev);
 	rtnl_unlock();
 
@@ -4076,7 +4089,6 @@ static int lan743x_pm_resume(struct device *dev)
 	if (ret) {
 		netif_err(adapter, probe, adapter->netdev,
 			  "lan743x_hardware_init returned %d\n", ret);
-		lan743x_pci_cleanup(adapter);
 		return ret;
 	}
 
@@ -4109,10 +4121,23 @@ static int lan743x_pm_resume(struct device *dev)
 	 * For instance, it is true when system wakesup after pm-suspend
 	 * However, it is false when system wakes up after suspend GUI menu
 	 */
-	if (netif_running(netdev))
-		lan743x_netdev_open(netdev);
+	if (netif_running(netdev)) {
+		ret = lan743x_netdev_open(netdev);
+		if (ret) {
+			netdev_err(netdev, "failed to reopen after resume: %d\n",
+				   ret);
+			dev_close(netdev);
+		}
+	}
 
 	netif_device_attach(netdev);
+
+	/* ndo_set_rx_mode is skipped while the device is detached */
+	if (netif_running(netdev)) {
+		netif_addr_lock_bh(netdev);
+		lan743x_rfe_set_multicast(adapter);
+		netif_addr_unlock_bh(netdev);
+	}
 	rtnl_unlock();
 
 	return 0;
-- 
2.34.1

