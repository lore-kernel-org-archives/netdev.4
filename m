Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057013;
	b=eldfAOQigLiAbgnreNAdcNTBUh5V7iUdmDMXXGMI7z8922ksfd+jcp9KXTJA1N0hMWWz
	 +llnp+uwtVxyqDRlN6+5kTrspVpZfudf25zV66YyjdApl0WpIG6xpU5egA7n46ivH+JtI
	 AxSUJqLG3aqOc1Aw0wJalJJfrIb1XoYER+pHsQBV6fugbC1AhFWs4Cimx+dQ27XPgONEq
	 YSTOH9ChNKm4tfGhY/GligWatDlyfSFuu78BQ7I/XWLgzM7j3G/YewKu6X1bJ5Ndit48q
	 uAc9Hn6HMriuxMjkPQuCbxBQBaeMUx/lqmEF+6kyyXJjash1+qxZYcX1O98cF7XokSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057013;
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
	bh=9uU3nesT+EWa/SQtE7toMu6kLe+WAjbOcZDm73lQa3k=;
	b=Ur91pEUMw4KfdtNl5ywg8DBE6DHeE+MLP3FQvX5inMA2e6wEZwtHpJppRWk+BTNOyLFn
	 mi1mZ/O7aL5c9MZBkaw0Z4fowCGZClssNLE1LM2H3Q3QIr/RoD4n/9wGZqlr7oursyb/u
	 DuI2uCzspWfu5tJXRD/8ZScpxD81+qMhrhvjWaV/zJ6TtTylep173hc383QKU55nxPcTk
	 ugALKrXAjLySzKTmjb4G5sSHRu/L+QQIoUYNiW2rdGW9GlfoRVepsGjENdoG/L70gVXlz
	 waimnJG2P93kwDwO43kVZanTnDqsUallQfOqYTLi1hvI5WDxfytJFzBqa/zDl2efXTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cQOervsF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.16
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013016.outbound.protection.outlook.com [40.107.201.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7FE606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D7FE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cQOervsF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rk8kfrHA/5RUb6Pq0a+NlM7tuvb83+/hxKLFBIB2ZTvOhWYNHR63oyAe/mS78Nmhyp1nmlPnA6MSpWF5gy3CBPVPc1UARLGxJVGsIRXckyNwaPXRd2MKt8E006EXS00QplCppONptkVNoSsoTjiZ6ZLgcfA2ZYBVDGcYPdd6ZBkzrFKn7h1HyX20P5/6OkLKdEVAjYrs1Nd97FIAzULt7KP3/5fvvJG1uldi+quYGHww4qcb6NMZmRsCXUVFBL2nrJ9SEU5FHKGWMrDEE18XmuIRBwLsc4wlRlvCujHv2a/5od3C4LaZfKlW4Ha8IDBMf91eUCdE96gfdPpvMRitEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uU3nesT+EWa/SQtE7toMu6kLe+WAjbOcZDm73lQa3k=;
 b=oTgC/9AfPXmreai/uHarvCy6ByDsnbgne7yHRUXxejmCPqWKpPKZ7jWFLlhXILQgcZDl7PAfSliZyvunbOUae7ReEGBegqcviKnzM3mtMzwUWhKFdmNtlLbX8qiHC5M7a3+71o7HTgk49I8TAFofKt1fZ2/znNcjMXpdjmFhXavHQdwuccHBZM2Mki76FbDXEP3IfmflypxXlhRkEBf/3PIOhcDkJ4o1c9CdSg6QmEUc+mbV4fPcduDhXpw/KyEVQagfRktzZZyIfXTdSvWrU/gAy57J6yP+gG1ng4suLuccZLC5+ioMYSWgMkmvqsxo2IyIsqCEECHxvzeo1mkniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uU3nesT+EWa/SQtE7toMu6kLe+WAjbOcZDm73lQa3k=;
 b=cQOervsF1nkmypDmcX98AlwTRFUqM9Ydp9J4OquAk9kqruUJQy0Y3cpLFkNuSihbtjEVckgL5mQKkerFdHm2MDRDBcd+EVXuw98zBUkLnRtrhrksdKOrx3G4twz1jNMdahTXCy8Dw1Yv9qKnpI42FputkzBlimKx6XgTIL0ufcs=
Received: from BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::33)
 by LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:45 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::46) by BL1P221CA0007.outlook.office365.com
 (2603:10b6:208:2c5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 02:56:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:45 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:43 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:33 -0800
Subject: [PATCH net-next v5 5/6] ionic: report the operational FEC mode
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
Message-ID: <20261118-ionic-get-fec-stats-v5-5-c9c0ee63df4c@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|LV3PR12MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 5accc533-24f2-4b58-c7e3-08df45e8bf6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|6133799003|18002099003|22082099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|56012099006|11063799006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YRlPsqYYN6YD9teTScxws3S6X9xxNVcuMyinPAN55zHRqppx8KqIQ4YPple9f4J0xeBX4+KCgu1NwWYwSHvKghxhMbrp2osb6ypoXWY+E9OCODy9kfHeKpQpmDRq0xa2fIsnvL3smlHOeZXraU+WJGgMXXxNkwgbscqfak1r/Nr30hvUCUwCKStlyT5sne2jqnEwk9j+1FOxbsyCL8454/BJDszLmAzqrROLUQuIS3J5rRI923KY4UmwJCjGgSxkpYRdrL/nCBpZDB1zWLxrpWhN7hWVfUHZhk3sSMTOKYhOIwRV7avn8N3UXuu+ZsYIGyNs/6Jcj5ZUZEy5PAmB155tK9ieFVu5iML+PLfyZDcw8M0/Dy8fQdG7mFVqpFos/k5Bisg61UQzR1JpetGSJxsOMsbSYw5pUbQs0ZcdoTupeop2iqv22LHnZnyoBDX3StXi/eyksfwrz1SVQRipID+H1RUd/Sv5dmHf0dULjDnrG0gicfNJiLRQSMRI3MsfK2rSXvA2tMtdeAs0H8JmuDGRaVZflijANUZtdoLZK8hiQqVTGRu+MCqXq9Ten1z09wrhu4L+uZx6qOIc/Ymnb0RUNXmSpIGLokOF3dCoZAC5niKXkFLutegl7AcJjNmHLuNoyqhZAf/aCeR6zu0PtKkjOMeBe4JDEzfaSuGOqg3bRsA6CKmw4z3J+swXwpeM+Pt5qzR6ieoqn18Y84ymqw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(56012099006)(11063799006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ClZMAekW5TOth6CPHsElC4B3UHSB/lE2tq52B3oJbbQJdo2k6ggCsb5Xl5g0jnKfQWLEomFSOH/r96JlSrwLG2f0duyFFSodqT4QUWOajoRY6ISyCKDKp8LPPZ2GmX6gUXSMLXBIkeCafBlZs4MdSA0Kp1EB38Jo6JB9AlimRYE9SzXJc/BBEh6bTSoTJk8FeYdnIDhapZ4CV6lFCYEKQ4jfVpbyvZHwMA3RAIxrrsl8J3gnSK0if8iTH/mmu3bhA+eBBQzE0amTxmTjGV3Bv6f0w05RkAVmkj+13Yar/mBf9qxjISSLN0mo01bxAPJQQw+dxbcNzaQg323FpaY334M3szfF3VOC6V9PSFXKO/RakvdEvZEziqM8Wi2Az8Ml7b3hKdpHEIPQEvYEdULHfu5BUWcT/nfn0dDHciWh/3/+jQpZcQxu9DdMqO3BG85V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:45.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5accc533-24f2-4b58-c7e3-08df45e8bf6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404

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
index c55148f3ae8f..d406d090d0eb 100644
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

