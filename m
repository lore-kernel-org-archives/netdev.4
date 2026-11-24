Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530881;
	b=CVkMAitgxPL3Pb3+ETv5AnmNmxV3cpsmUAzsPYlWz793zu2LO5rpJAyh6HoEyo5ag3Nn
	 zQ6wnD40OW6aAaCK4+sXYgW0Owg0SEBrP0kuuSKQamkg+iR7sAZNA102f2oPPz/s20Mp/
	 8RslSoj0izMXb4MudVQU9BvSVO1rSEjZ4fKBQMVQHCGdfBTBhEdjjt1R2jk0y69lbEDyI
	 BYn7Orj/nWZYjRwABWxl6aU31bULR+Zk+ll2q5I7RZyZ4BNbNvUczvuzbeHLrfiRR+0Qt
	 D3+brquxMY6GFTUmol2fmacDhkoUhvFzoBRsibNwULbwV+66idUQJyoFqN62mgWtrYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530881;
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
	bh=7NWOY36L8THIVRTSjsdKQxEkj6Cg72/Pvmpa2uo5aBQ=;
	b=NKL6JEfODgDIQSJ3Xid6zOdidjY9I+oRxFt5xvCCMDp4BEA9SrjbmRx1GV1PS5zcVq7D
	 fj8BmaRvpiuNwXLx8pD9XZVxP+2V8yjBLHckmmV8evBhnx/M4kaSwJPvKnyYZooisIJwu
	 4XOuLX5a+T4fWCCyx8T2aZohUczmAvOcnzxVkAvegxgh/LnexriggTCwCDCy57CfylHrN
	 4SVYk1WDkqja1jQrFgNlBZKPp3Tcz5cGI3OO5uC1vVmf7R8u44ccuctBmHU+AueO4m06B
	 /JH+iPbkZvOUu72KQTRYtOXc5Zjn/zvQvIla8eTcD4j0xnI9bt/Z5XSP2M5Q4gzeIlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovgJ99fc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01077606A68E;
	Tue, 24 Nov 2026 14:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01077606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovgJ99fc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx52C9phI+VbM6pyUSMYo9jLHlgxmiOdpWeVRJ8eYhUMNxHFs5xO1KcsJMg8r3sEQWEPi3w5XXoPAcTbSofrIRrOi3aYzaLOPpZz6UrQB+EfTXoYcrMiyyjMMTPJuUWt5CmFg9qYYG7MR7xQ3jXhPCp4zAgfiOBBB4pF6+KvWhy/Uxa3Vz/E9g/Hz4UMr/C0laDJF8FL8WERLw3393+RMhiu15ECqxJ6OycLekTT1GbBjbb0KylulCRAo0satzbynuAX1Ry753/9+/J96zIGcTJf6YLtMbbgUpYLKNWFnYJSLOkLl3meQ/1lm50SjGAnzwUjLMYoglkUMoYqFXwaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NWOY36L8THIVRTSjsdKQxEkj6Cg72/Pvmpa2uo5aBQ=;
 b=uC3YWbPuGeTd25tuJK9oYZTynUKg4uKJs7DgD6voA1R16liS1KKFlZ5Fbprw8idYODGLP8jtIS4YduQtgzgJtkl+VCLIUjVsbxT5Zr/21jf8KoHl8hIuFZ59v0oF/LenV8nA8z8GdZQ2u195jH6NawjbTb9DzNJWMkB/VsyDo6g0aZJpUodOfY/wyYL2din00NjQq+XwopGZSeLXmcZswS5kqvanqJgWJR299A4X16WnQ9IXIt293zner3PU06S+JNpzwSYX8o4OZZ+gk92JoZbeKQYmSCCo2A1EHZN8UxTlC4sHn8A5ShX2exuayhQVD86FW7rzPYObSHN0AB52hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NWOY36L8THIVRTSjsdKQxEkj6Cg72/Pvmpa2uo5aBQ=;
 b=ovgJ99fcLo1yyW2uCSP54+tPmAsIzMRqMVG57vzVU2Bso/F8AIZ31FDBgjiIlgiaWpRAbBDaTJh+4FvmXjW76/9pPkSKRwroF/b+0TqOBiuUYqoQu456doQA1up/t2JS9eapvF6ysNIbvkrskRrY343JlGYrdb4JC/k/oV3Hb2arxqZer+fRnR5VYJyjKoPl3MWXGhbRLZsWHvgTnXeQdxUXPIYL2maxGzH2RToNTfBFfQqnkJAGM/qpvHzJQ0RuXSPqi4rrsYizHrwufzNSYbSO+y07Li+Ozl7hCWLuA9/MzvYCRuQVSdTAO0DaB+rp8Z3J8zzjLO+cUoW//6b0Iw==
Received: from MW3PR06CA0030.namprd06.prod.outlook.com (2603:10b6:303:2a::35)
 by LV1PR12MB509357.namprd12.prod.outlook.com (2603:10b6:408:516::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:34:36 +0000
Received: from PH1PEPF00062F2B.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::7f) by MW3PR06CA0030.outlook.office365.com
 (2603:10b6:303:2a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F2B.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:12 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:10 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 6/7] net: lan743x: reset the device on TX timeout
Date: Tue, 24 Nov 2026 09:33:21 -0500
Message-ID: <a6d08d5760ecabea5c77d6001a8281c820873512.1795027003.git.cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2B:EE_|LV1PR12MB509357:EE_
X-MS-Office365-Filtering-Correlation-Id: b68c9122-b742-4a6f-531d-08df4a38105f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|261028144727099003|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261022075727099003|261026140227099003|261026121527099003|261102123227099003|20046099003|18002099003|22082099003|18096099006;
X-Microsoft-Antispam-Message-Info:
	8Sdqkd17H+bztkINSCQv3t1VGdWbrt7qin8PRO8rqDOv6Lr4UYqnUdFhzQ8eS94vgv+y0xeVSR+7yclvxaj9O/U6I1SBoUOzZ64GEK3r2kCmgrxrZLimFELS2wKV1lKGlGkk+z7/p4aZ+QtvS/Whs8n/abDhy+Yl/9Gh9WlcASTlDSWEx89HGAc9cd0BZoGYzcEosKbAwy0V08LaLjNmq/y80zhtZ+dVX0lPRLntC3HGVoHeJ/jq3J9iwRpEQwg+LhWoXvq4SXP2iek0+4DnXXEFpPhEE+w+pZJ2wUbOpGYU2djhO34L93IRRxTXShLdjzOgGt55jaD5k0QhKHlDUsKgcSOyDtZ87048nKJ+cz3JA5PGJmnO1BzguZVLSaSiKiYzXPwlfKgBTZTZPWSEsT2kzF2qXmgq1E4Y2CtTDC0qP9e643fDdjiQTU9cW7CDgpKsFzo0IcHrtZ7P7jJV7aRdIcZkE502pkbq25/z4vhz1P6+DeYKPsSbqyfiBGfkkebvMdiEJ9Knd0D+zw524ifqSRq4FyPSHxcB5CPFo+rezpA1yaA2VPCQj/VL1c5Lo72iY+FODcRzwzy81G4vOUeZ/swhDqGlyc0IgNed5fWizRgNw3JwhCnzTs1BvkHOV/IDaDiHoRPYHHK3MhMu1QkfAp4k2g6fQtklDHjwBl8ppc9xrcJ9D6UOhws15BURohy/Y+5+oer3BPZU8UI8nA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(261028144727099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261102123227099003)(20046099003)(18002099003)(22082099003)(18096099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ndxbNAJyA41WITpoEtPcjc4H+uIWRIt2k4AoS56Uh5AUf+TfChBU7tP9Uj9p579Sb/5ugVXpEayGKesYqmMW2HjZ7UgkhL5sqPa8DUlBPUUsahf/hOqCggSqQyutkJjxmjausubXwfOL5NZ6nVMqMwzcC3m9DdIuXWm8fsEZ2VJwYhEzHcoup1bz1x+8mu+7CnlL74LfSeoGqCG2PSJzqXyk/vW0rHWCP3wi40AKj1IJq1jOanf31fNKLT+f26JrskEg3ckRbkj6QeCEOu+BJKXMPx4t3TMlMATgavQTNTtcayGasSWh6102+hItJsDF8GBjQ//OfTwN//6ArspkB9NBE0b2lX1KGRf+6D8O+d93DAb9EcHXUWMhxSU/5R5J0mD00I4wiwPqOdaPRW5ASRq8jNT5D+4T7OG9a92YH/jfszH/gGao5sHztb+GGMbb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:36.2245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b68c9122-b742-4a6f-531d-08df4a38105f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB509357

The driver does not implement ndo_tx_timeout, so the core TX watchdog is
never started. If a TX DMA channel stops completing descriptors, its
queue stays stopped and the interface cannot transmit again until it is
brought down and back up.

Add an ndo_tx_timeout handler that schedules a work item to reset the
device. Under rtnl_lock(), the work detaches the netdev, closes it,
soft-resets the DMA controller, opens it again and reattaches it. This
is the sequence suspend and resume already use, with the DMA controller
reset taking the place of the full hardware init.

Because everything is reopened, the RX path, PTP and the PHY link are
restarted along with TX. For PTP, the reset has the same effect as
bringing the interface down and up. As on suspend and resume, the PTP
clock is unregistered and registered again, and its time is reset to the
system time. Applications that have the old clock open get -ENODEV
from it, and the new clock can come up as a different /dev/ptpN, so PTP
applications such as ptp4l have to be restarted. The hardware
timestamping state is also reset, so the RX filter returns to none and
one-step sync insertion is disabled, while the driver keeps its TX
timestamping flags.

lan743x_dmac_init() did not check that the DMA controller soft reset
completed, so the work could reopen a controller whose reset timed out.
Return the error from the poll so the work can tell. Probe already fails
when lan743x_dmac_init() returns an error, so a controller that does not
come out of reset now also fails probe. On resume, it now leaves the
device detached.

If lan743x_dmac_init() fails, the interface is taken down with
dev_close() and the device is left detached, so it cannot be opened
again on a DMA controller that is still in reset. A later resume resets
the controller again and attaches the device. If the reopen fails, the
interface is taken down the same way, but the device is attached again
so it can be brought back up later. In both cases the device is still
detached when dev_close() runs, so lan743x_netdev_stop() skips the
hardware close, which has already been done.

As on resume, the RX filter is programmed again after the device is
attached, since ndo_set_rx_mode is not called while it is detached.

ndo_stop is called with rtnl held and cannot wait for the work, so it
only cancels a pending one. A work that is already waiting for rtnl
returns if the device is still down when it gets the lock. If the device
was opened again in the meantime, it is reset once more, which only
costs an extra link flap. On remove, the work is cancelled synchronously
after the netdev is unregistered.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 68 ++++++++++++++++++-
 drivers/net/ethernet/microchip/lan743x_main.h |  2 +
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 228b6ab539a1..3f129a22921e 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -1516,10 +1516,14 @@ static void lan743x_rfe_set_multicast(struct lan743x_adapter *adapter)
 static int lan743x_dmac_init(struct lan743x_adapter *adapter)
 {
 	u32 data = 0;
+	int ret;
 
 	lan743x_csr_write(adapter, DMAC_CMD, DMAC_CMD_SWR_);
-	lan743x_csr_wait_for_bit(adapter, DMAC_CMD, DMAC_CMD_SWR_,
-				 0, 1000, 20000, 100);
+	ret = lan743x_csr_wait_for_bit(adapter, DMAC_CMD, DMAC_CMD_SWR_,
+				       0, 1000, 20000, 100);
+	if (ret)
+		return ret;
+
 	switch (DEFAULT_DMA_DESCRIPTOR_SPACING) {
 	case DMA_DESCRIPTOR_SPACING_16:
 		data = DMAC_CFG_MAX_DSPACE_16_;
@@ -3381,6 +3385,12 @@ static int lan743x_netdev_close(struct net_device *netdev)
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 	int index;
 
+	/* lan743x_reset_work() takes rtnl, so it cannot be waited for here.
+	 * A running one returns if the device is still down when it gets
+	 * rtnl, otherwise it resets the reopened device once more.
+	 */
+	cancel_work(&adapter->reset_work);
+
 	lan743x_phylink_disconnect(adapter);
 
 	synchronize_net();
@@ -3485,6 +3495,57 @@ static int lan743x_netdev_stop(struct net_device *netdev)
 	return lan743x_netdev_close(netdev);
 }
 
+static void lan743x_reset_work(struct work_struct *work)
+{
+	struct lan743x_adapter *adapter =
+		container_of(work, struct lan743x_adapter, reset_work);
+	struct net_device *netdev = adapter->netdev;
+	int ret;
+
+	rtnl_lock();
+
+	if (!netif_running(netdev) || !netif_device_present(netdev))
+		goto unlock;
+
+	netdev_warn(netdev, "resetting after TX timeout\n");
+
+	netif_device_detach(netdev);
+	lan743x_netdev_close(netdev);
+
+	ret = lan743x_dmac_init(adapter);
+	if (ret) {
+		/* Stay detached to prevent open on a DMAC that failed reset */
+		netdev_err(netdev, "DMA controller reset failed: %d\n", ret);
+		dev_close(netdev);
+		goto unlock;
+	}
+
+	ret = lan743x_netdev_open(netdev);
+	if (ret) {
+		netdev_err(netdev, "failed to reopen after reset: %d\n", ret);
+		dev_close(netdev);
+	}
+
+	netif_device_attach(netdev);
+
+	/* ndo_set_rx_mode is skipped while the device is detached */
+	if (netif_running(netdev)) {
+		netif_addr_lock_bh(netdev);
+		lan743x_rfe_set_multicast(adapter);
+		netif_addr_unlock_bh(netdev);
+	}
+unlock:
+	rtnl_unlock();
+}
+
+static void lan743x_netdev_tx_timeout(struct net_device *netdev,
+				      unsigned int txqueue)
+{
+	struct lan743x_adapter *adapter = netdev_priv(netdev);
+
+	schedule_work(&adapter->reset_work);
+}
+
 static netdev_tx_t lan743x_netdev_xmit_frame(struct sk_buff *skb,
 					     struct net_device *netdev)
 {
@@ -3593,6 +3654,7 @@ static const struct net_device_ops lan743x_netdev_ops = {
 	.ndo_open		= lan743x_netdev_open,
 	.ndo_stop		= lan743x_netdev_stop,
 	.ndo_start_xmit		= lan743x_netdev_xmit_frame,
+	.ndo_tx_timeout		= lan743x_netdev_tx_timeout,
 	.ndo_eth_ioctl		= lan743x_netdev_ioctl,
 	.ndo_set_rx_mode	= lan743x_netdev_set_multicast,
 	.ndo_change_mtu		= lan743x_netdev_change_mtu,
@@ -3621,6 +3683,7 @@ static void lan743x_destroy_phylink(struct lan743x_adapter *adapter)
 static void lan743x_full_cleanup(struct lan743x_adapter *adapter)
 {
 	unregister_netdev(adapter->netdev);
+	cancel_work_sync(&adapter->reset_work);
 
 	lan743x_destroy_phylink(adapter);
 	lan743x_mdiobus_cleanup(adapter);
@@ -3815,6 +3878,7 @@ static int lan743x_pcidev_probe(struct pci_dev *pdev,
 			      NETIF_MSG_LINK | NETIF_MSG_IFUP |
 			      NETIF_MSG_IFDOWN | NETIF_MSG_TX_QUEUED;
 	netdev->max_mtu = LAN743X_MAX_FRAME_SIZE;
+	INIT_WORK(&adapter->reset_work, lan743x_reset_work);
 
 	of_get_mac_address(pdev->dev.of_node, adapter->mac_address);
 
diff --git a/drivers/net/ethernet/microchip/lan743x_main.h b/drivers/net/ethernet/microchip/lan743x_main.h
index d9495cf96b41..2697f0a2a83b 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.h
+++ b/drivers/net/ethernet/microchip/lan743x_main.h
@@ -6,6 +6,7 @@
 
 #include <linux/phy.h>
 #include <linux/phylink.h>
+#include <linux/workqueue.h>
 #include "lan743x_ptp.h"
 
 #define DRIVER_AUTHOR   "Bryan Whitehead <Bryan.Whitehead@microchip.com>"
@@ -1075,6 +1076,7 @@ struct lan743x_adapter {
 	struct lan743x_phy      phy;
 	struct lan743x_tx       tx[PCI11X1X_USED_TX_CHANNELS];
 	struct lan743x_rx       rx[LAN743X_USED_RX_CHANNELS];
+	struct work_struct	reset_work;
 	bool			is_pci11x1x;
 	bool			is_sgmii_en;
 	bool			is_rmii_en;
-- 
2.34.1

