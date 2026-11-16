Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870441;
	b=ze2DLs6JqLaW5XTYvQJJ3U2LAVo4nt9BHzY0jaxJ2X5DHOFnBz//sogf1lM1O/a4pW7Z
	 xeBq2PuBgsXbsHwdmvtmEvtJi0a0d722TGqURhursMjZhq39axf/yqgPU/nKqmC8gnvY7
	 wDkM5LU6z1D/GCeZLowBxoBNwXXg74tlS1grnbmExYVviRD9S4C4GmU1jnsmDubxFZXeo
	 qmqVc1kW6A6d0pdkA4DKw/Cby33I/rJ93j6JhViw2KobUve/8dvBG+J8mv7adq6JJRSNE
	 7RTLUGuN39n3iyAYaiqoVYw1FErM/k2HWouiyisqgwb6X2dCzoPKhf3IZMuqt1QmhMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870441;
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
	bh=4kSD+n5Qs7T2vroaQRkdYmJMbZavCpiE3nP/D6yVYBI=;
	b=XGJmENsQ68JQ+QSIlxk4fdWHHaI2ME4V6e4XW0HPeZ/gLVMMmMS+2igUgZuCpF3gnEU+
	 jZUExExne85tKuXJjlqqGX+UPpAbc7HtOFLw5ATRKbi1BR1+T4mhjfq8QrD0fbrgcMrZ0
	 fROkqb/08HJ2dwjiVqIYxqYZRkUcYKstDGK+xxphHpPU2dsl2BKPgd/DZfB2K7Xdn97XQ
	 AYGJs5yQOg+J4jYNFB4QacCuU25PHVzPB9N72r0NHr/+4vZeSXx+Omav7f60E3SUsGWfk
	 ZE9c3f9ImpV6nFWzZm5YHEttZeRbwUmqP2DPeaJcuUaGe4Bb+KO6tZ6Oy0V5HBkDWIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PTA4nsWx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.50
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6670E60A2631
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6670E60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PTA4nsWx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3FoDEwE7CWpBCcaycJfYFuovTwx3BGiOWXoagRKacajivsmkGccdTP7QCYW9X2GH4x6a8uH1TQCLnlnCJ3ClLf2nbOHb67853Ouk2tCCro9/aD2uldjqsoB/xdiwKEGCr2B5taeq2GtF3vpte5ep01H5aw2kzhY/jHGGFiv9PemRbzc2HOJO9TCBTXc2M50llGjrMy2qyk29VSqVdvJLFn/lIqO7ox15m6983hUHSddxK7OEkjHOW3oFFfXj/SAhi4R+A3/mZ3gKWFSWbZmvBh1356HwMZoMZNHWsiFtJ5j0PY8eAtBB+pACLmFvt7Q6rcTm8mVgSvkWMkagrgSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kSD+n5Qs7T2vroaQRkdYmJMbZavCpiE3nP/D6yVYBI=;
 b=flgrUyACvhpJfHFJkVLt0F9FUAh80hFNZrTamqDMXRCZGTbtzsfU83sJvHPr1yv0VxrX7VerDo4kRQDGPJVO9Qm8MBu4JO7I1MvPz+ULP+VkhbPBKWIyd1+PpVwhsRg2BbeE2/gPVFK6SHg1JSBbphMZaPzH52Y757HZI5AWpxg0/kQqgkCqXaUwJ1bH/VlK3wL0/dim7VCTc8VNITy63bZ3bfBeAQPNhvxkgmuDmQafTkWttes5E1sylR+Qkic4nG9DI5OB8eZNwfY2b/lunnEC9oRPCzfq2ni12DhRoqZsoD0SE86HbXIT0IyaBrEIkHPsa9uHP91PwHtdN+hJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kSD+n5Qs7T2vroaQRkdYmJMbZavCpiE3nP/D6yVYBI=;
 b=PTA4nsWxyJtOrk+3wequIoYHM9TM/ovnJXzsEZVbNgyazWzX/9doPtITES3wPvNvaybOUEQeupwXcpaHS/o+sGhVv2ibGgml/PSEY1OqfrNKWb7zR3qK6Lqgv7HChHRAtEWljL7sXkMq/EAw3kGT/CJSRPePegHCPCji7adMHXw=
Received: from MW3PR06CA0028.namprd06.prod.outlook.com (2603:10b6:303:2a::33)
 by LV1PR12MB295477.namprd12.prod.outlook.com (2603:10b6:408:513::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:18 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::69) by MW3PR06CA0028.outlook.office365.com
 (2603:10b6:303:2a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 23:07:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:17 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:16 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:58 -0800
Subject: [PATCH net-next v4 5/6] ionic: report the operational FEC mode
 from ethtool --show-fec
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
Message-ID: <20261116-ionic-get-fec-stats-v4-5-d25cae9f1e87@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|LV1PR12MB295477:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ec46e3-7fab-4b31-dea4-08df44365c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NbtLYr0oZFY3nNFPHRizE3Rsq7t+Fh4MASyajnrP8MkG8BmGH72tDedXmS/2luhoyj/ScWco1+omEMy/ip0dJMHb1LhY+shFskKpDJjAwu4PWNnAg3f56oBXaUVAwPyAQ1KcQcWsUDua8F3PoqBHOnhRa+gfgrELnq0l4xIU7kNiKb3xTJ6/mqOCpFQrk/twiN+MFy82oYDLo/VGwawYPcVea4FoxO8v4qiH4ErnMJD5maRiMqZcebzsNL2KUL7rzZz82fYAZmBa60890usdIQs3fKDDfWOmt6S1+QoOvr8pDf2TuVWMInazyPQLY8Wa9Aa9wRtwElRZ8YekN2Au7sknu8SS6oTg9UIxfBK4W1uTy9sQVUxQ2Cp4dBXuuR+qxrq4ifbcPyfF34neVHRITyuleQNPxglN7mlOiZeAX5nSBqKsgYtq9H/r5ztJ1rzUFcWv37/hJJoTUupGQ6t7tAIl7DVeMq5rTbMdS87A2AnTLCdeLWFUFYSbMQaP5m24g82m4vHNAZrUbHdC+rgIKssJ1pmfxJDYV1g+Qc6i4Fy0vlUGVStwAyulflFZQQZWfxS89iTYTs2o1C8H0m2ASaRHn/Di4ehLV2lLBda1/DYgaKAahzz9lCU1X3GEK3csozdPxCejibmgpJfyMx2A7lv4KCy96EmKJ+h+Z/QfAhPcHago9wWPjya/gWugdpkLpITxAChamVI04yvorTaHxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sz5n7A5Yxr6pDmVKqrJsy5aqn//mrE4VfpRM6hpzETXMMiuSvxmRX180EVEioH8ZS/PfvFZ0SZn/F+RUOQVQKt93nhWnwAU5hVtFBI1tX76XjQcYT32R9v8d9myn14cPX3/WTCFtmLbqhQeMyg3R1Y26EuNYmbs/h+/WxSeTljM/XyE1HN9JBhp7ZilP+ODXFprXHDtyycC6NdAYEV+00QUaaa5h8Jeuyu+Mp/ihDB1HY/V0lyCwIXeoLXO7kkKqQ840UCL3qH0h+XvsAXZ5RVSKs8qpbi/dnp0abEa7puaSf7D75tPA5oS9YH07H019Ujo30AlxnfisTlTAadNSXObjw4rX+TDl+9BzcIlepxSh6CFNiXlEz1ZlYYFeCSwS/LE4LAZ4JkXFp6McoccGMQJJ22uuolLQlFf9t0qP2UM08aBor7x2H9JAF3pkx3s2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:17.6968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ec46e3-7fab-4b31-dea4-08df44365c5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB295477

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_get_fecparam() fills fec->active_fec from config.fec_type, the mode
the host requested, which on an autoneg link is whatever was last
programmed while the link negotiates something else.  On an autoneg
link, read it from status.fec_type, where firmware reports the
operational mode.

status.fec_type was carved out of the reserved area by commit
c4e7a75a096c ("ionic: updates to ionic FW api description"), and
firmware older than that leaves the byte zero, which reads as FEC off.
With autoneg disabled the port runs the configured mode, so keep
reporting config.fec_type there; only autoneg links on such old
firmware report FEC off.

Fixes: e95f922f4c2f ("ionic: implement ethtool set-fec")
Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 8f0f1585116b..ac728b8aa780 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -440,6 +440,18 @@ static u32 ionic_fec_type_to_ethtool(u8 fec_type)
 	}
 }
 
+/* Firmware that predates status.fec_type leaves it zero, which reads as
+ * FEC off.  With autoneg disabled the port runs the configured mode, so
+ * only trust status.fec_type on an autoneg link.
+ */
+static u8 ionic_active_fec_type(const struct ionic_port_info *port_info)
+{
+	if (READ_ONCE(port_info->config.an_enable))
+		return READ_ONCE(port_info->status.fec_type);
+
+	return READ_ONCE(port_info->config.fec_type);
+}
+
 static int ionic_get_fecparam(struct net_device *netdev,
 			      struct ethtool_fecparam *fec)
 {
@@ -449,8 +461,10 @@ static int ionic_get_fecparam(struct net_device *netdev,
 	lif = netdev_priv(netdev);
 	port_info = lif->ionic->idev.port_info;
 
-	fec->active_fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);
-	fec->fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);
+	fec->active_fec =
+		ionic_fec_type_to_ethtool(ionic_active_fec_type(port_info));
+	fec->fec =
+		ionic_fec_type_to_ethtool(READ_ONCE(port_info->config.fec_type));
 
 	return 0;
 }

-- 
2.53.0

