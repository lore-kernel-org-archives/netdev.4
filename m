Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530885;
	b=15nyXdLofbL/KW0kWvhuV/iETEN6ltz+XnOlZnvdHbsqrfvHgtZJjUFQ59WbwddhMQ2x
	 YWrosgEgF/A7WFl2mge1jIKuVLx2JIp+kE4ohkytQGRAidYE1A7XKF9gcKIBr3narKWV3
	 qzCAVl4O8xV5Z5wSwv0FZEoYsbHk5WNxTo7YSVXMYMR4JlUWt6clU1FIrBCzQITSXXyYF
	 tF1Rk6qYb7jZjb7tyG4GvVhHv+KSCVA4OA8gn3q2sgdu5GAbyD6lAZAtWL4dXJd0YTWCY
	 M9JmpYyqjZlwwh0lFY7HhigsGNVZgK+3gFLr7En2i+El/8JXZ5/z9cVyvkrUj7NnFmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530885;
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
	bh=1YKbmR4Ct1EIQ9qfSLkU73YY2920bPmIWTHh63lZeHo=;
	b=Z6VRQVS5V1tqXAfPoPKephkfvBTQ/SB+wTR4bkI74b2QsFSjkzkB005oqrzN0fvqcsk8
	 6y85L9gCF5QpYAoGGYEsH7uCbLvoSY3//6LYnhZ2puOfKwP6rmFV/33wBAyYTdeyk5ufM
	 9cyHjHFgA/44V1OtKEd8zhHI07GNScDCZltkCl+vcOY0+Jj8AxvWyfnaD4odZCbwrGXDM
	 fCBgyjHWPM/GuAkQ2ltYpVaUeIpmDD3j6ZGRL6yvaZgYR6ve08fv5HiWoeLHuQbMf00Tv
	 D0ll2a4WvhjZYCqQyEvginZTkQ3sQMyX17L33VLOZX4kezmac8NThwocOb0dNU0aVLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QcqesAuG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.24
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593FF606A693;
	Tue, 24 Nov 2026 14:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593FF606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QcqesAuG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0r1kdF1Lz9QmnM7ixtNi1tlF5DvfbZ1QXNMXeAnRWuYUc+1wFuDVmbq+S3qUp1DgiZpblVwR6/+Ttb77I72QHgmYyoDt5KTUe1LrerdpwDSs7QRhdVavwsst063eJDFPyjwgc4dMMe81EkXKLNeTiZZpK8CtoLRC4YxaNPiYA2LEWb7Edti/ceDRWXbxiVB6FAVvlKFICR9P+QWLut64QG18unmkS82ZzSWKiwqKN4VFdUHYrLuKxaBaVgN857aAaNwmVMFCnXVBQxIeBojpLqvM5mvJaiOP81dRzHsqJ8PMR2hA0ceGZlICfGdWfV5kYpjBo81Gck08KbPhIsc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YKbmR4Ct1EIQ9qfSLkU73YY2920bPmIWTHh63lZeHo=;
 b=UMIDVAGtz05erMYJ4WKF8HlUBZujGQ9qVMrOibsuPEWNxUQgrb0PQVnLX6fY2/ikOYdXf4TIWgTkt3MFu1LREIdfw1aj1+qx7994mUbOMmHbeUv6pVp1nHwLItrruKbsICBmG7S9l1GZ25YHTY5lQz+FDXNt39yt58uAnZMppuT1fFONDgam2Mk/13X5ihAwVSZcvDm/g9kR/4qzaDMLJtWw1FfdV1Ewtuap+bmg8cnniKTuYpOe59Q7e9WEBKfg827uSf9jDKxRX5ckcfersEwtJu1DesH/g1sop2Ig05M1xpM61N4K05AHlSaPQUn5xzmclQUvjGc9WbwmQ7rI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKbmR4Ct1EIQ9qfSLkU73YY2920bPmIWTHh63lZeHo=;
 b=QcqesAuGmnm93CDyh2TGF9tte+N4AylnBL5GsvCbFglOHiXrPp+nOp2AdGQlNJmLIR36VklIOu1qKYUncYG9XvIte7Pl+7qR/n+3Q5kEa1lSfu9iJlHpUkLO5DY5SvOfYnHh0sbOPKZ4L6vCwtAxJoZ4/56AaUlTihkSnx5126Rpu/KCqTPRfI3uZpKSus9D2JzRlewpr4PJ6U4LUgDN05BKecSStDIsQ//2ny7RXsW29X2/cySfUOiexggwaWvryDb7qF258eKgSzLz6FlfMwyzyNPzeyncHw+PIYlPcCyzSqxYYistX+r/MnxwJKGCCWNuySQ/8ZnM34YeHiKHdw==
Received: from DM6PR02CA0123.namprd02.prod.outlook.com (2603:10b6:5:1b4::25)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 14:34:27 +0000
Received: from DS2PEPF0000710C.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::7) by DM6PR02CA0123.outlook.office365.com
 (2603:10b6:5:1b4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000710C.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:06 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:04 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 3/7] net: lan743x: start phylink last and stop it first
Date: Tue, 24 Nov 2026 09:33:18 -0500
Message-ID: <df1845de5cbdd4c556a39a48faa23848e02d4944.1795027003.git.cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710C:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0ece9f-b659-4a9d-63ab-08df4a380ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|11063799006|5023799004|56012099006|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x9vARWLgGCWIzjOVxxsF85pesQ9PmiI2wB2UxSvhWWK4dmVydgx6UNTx7DLjQljgS4O8EnvAj0VizX2eJ4WC0OyL5xR0uCxa5BZbbWyO8Q5JNQXiSzN6jLOHxXEQV0WIImP1zi3caXQXmD2eNZ54YEZ/56x5wr3qVfWxJVtYch6vuw+inxfHpicI3e2CveFNAQoZEe8zy7Ww1CQMpPx7QzUJ9EDIz5KmPC08KD6S9qFyPxIFPHUzRoYd6fd1XDnYmdaYE2FonD7t1HbCS/zH1uIiW7XM6z/aDrZwZPthGLGetBE1nMHxymi/UTbswEqOzC+SGPXi7SmODpdQNEk3fcKxNuFJkfmS6pOuWWEm46FpyIguxAebXC7kylY+8xnoH1NUnr2qfIVwqo/t/PSn3BP5mGSJZHo1OkxgG3lZX/Dlnk5ewKQyOZnmwXkRIz8BE2jqRmhy0VnQmtYM7DEhxALBKaCFKmO0yDhDE2jfnSv7lfLcPssUHIcfdifSQ8e+854MK0T1uAR/pH0B4jbW4CJkEHO2vK7OF37CoPyNy6JGWUAKYXJDXOeMlXpLan4JLljuNhUJyKTyrIdphXqf8qMelKCPguqcmo7RU+l1jYsvS9R0zC2XACKPsWTJan+bLGquEuwxV8mQWWTurfPtQDQh8gLC4Lbc5wLY6vWCb4B8etNeXctIPfnRCmBM73QEuXeBi+xuimXw2joTxqWDsw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OMYUZGSXItCkgnjsUIBJ0DjSgR8JpMWSlYFcWprzl0eCbGm8k6jjAP7a/zRVYkiDcJ0EI8cC1FewTbQQmISnGJyoxH/xnx060mlCQPeYXPh3fJpp/1LJZCO8dC/g/OnTvBqIKrxZaq9HS1n7t72O0T78SkfkBf0A8grc9viKWZ0+t5WrVkWRvGJrutFfkLQg9znBEG3mqmVouSfezo0v48X31Mk2oxZaaVx653LUiDsUNS8AkS7WkLz9gCjdQFUOdnFGnDVQ2roEDa68ykTpUl2KMX+a1uLNLTABmfD9Y02CUIA0wsZj6hnwn6VFzrODzamZTPLxkgzpjt0iGt9wO4YLZlIRwR0OJtLEnWsyV+/uosCRy7IKP/iC6xQa4M7vUoCev1jHCSXehsMp6JeU3eOUCGjRYcheUALLbn4qUc49uzcRnABVfC23JHiCgxRB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:26.9805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0ece9f-b659-4a9d-63ab-08df4a380ae2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000710C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648

lan743x_netdev_open() starts phylink before the RX and TX rings exist,
and lan743x_netdev_close() only stops it after the rings are freed. The
mac_link_up() callback wakes all TX queues, so it can run while there is
no TX ring to transmit on.

For ndo_open and ndo_stop the qdisc is not active at that point, but the
suspend and resume paths call lan743x_netdev_close() and
lan743x_netdev_open() directly with the qdisc still attached. A link up
event in either window lets the stack call ndo_start_xmit() on a channel
whose ring is not allocated yet or has just been freed.

The error path of lan743x_netdev_open() is also wrong: a
lan743x_ptp_open() failure jumps past lan743x_phylink_disconnect(),
leaving phylink started and the PHY attached after open has failed.
Every later open then fails because the PHY is already attached.

Connect and start phylink as the last step of open and stop it as the
first step of close, as other phylink users do. If phylink fails to
connect, nothing is attached, so the error path only needs to unwind the
rings, PTP, MAC and interrupts.

Fixes: a5f199a8d8a0 ("net: lan743x: Migrate phylib to phylink")
Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 57d52930f89b..8eb0645493e6 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3375,6 +3375,8 @@ static int lan743x_netdev_close(struct net_device *netdev)
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 	int index;
 
+	lan743x_phylink_disconnect(adapter);
+
 	synchronize_net();
 	netif_tx_disable(netdev);
 
@@ -3386,8 +3388,6 @@ static int lan743x_netdev_close(struct net_device *netdev)
 
 	lan743x_ptp_close(adapter);
 
-	lan743x_phylink_disconnect(adapter);
-
 	lan743x_mac_close(adapter);
 
 	lan743x_intr_close(adapter);
@@ -3409,10 +3409,6 @@ static int lan743x_netdev_open(struct net_device *netdev)
 	if (ret)
 		goto close_intr;
 
-	ret = lan743x_phylink_connect(adapter);
-	if (ret)
-		goto close_mac;
-
 	ret = lan743x_ptp_open(adapter);
 	if (ret)
 		goto close_mac;
@@ -3431,6 +3427,10 @@ static int lan743x_netdev_open(struct net_device *netdev)
 			goto close_tx;
 	}
 
+	ret = lan743x_phylink_connect(adapter);
+	if (ret)
+		goto close_tx;
+
 	if (netdev->phydev)
 		phy_support_eee(netdev->phydev);
 
@@ -3458,8 +3458,6 @@ static int lan743x_netdev_open(struct net_device *netdev)
 			lan743x_rx_close(&adapter->rx[index]);
 	}
 	lan743x_ptp_close(adapter);
-	if (adapter->phylink)
-		lan743x_phylink_disconnect(adapter);
 
 close_mac:
 	lan743x_mac_close(adapter);
-- 
2.34.1

