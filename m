Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648962;
	b=ftjKDfrp8kcq2n2j85OjbUyFeZzv5RBJsf+/Gffg3nqbbw950txQX1+rP0Q36BibbZ4Q
	 o0EXE7++9LOPEXceiN3wdgjysx7wp8jxMuXzg/ZQeiJxSr48kCNM+Ob5yfTVWaKBJoWI/
	 jLYcbfploWYhLar0Dt6y0uX0OJ9rRR0+++/C+XVLHmE2oO5aLazMAh/5gNoK8KCMkHDxT
	 OrGtUUoKkoxfHsewKuMAZsJpzRzOWNQ2c0tandM4hwtdRPlCP01gYCUPWcydvuxmkyOdP
	 rTfKhg7npXCIni4rtzi6lY4qH40FCxIrzTxWX18/1BMKlCRsEYgVA1XZ37hmr3nV7EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648962;
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
	bh=YiQE/ooS4bQYF51AFCfQPZ3gnhTu57ynOW4UjPg6bv8=;
	b=w3ZPfdoJuNiaWlH0Q6i7g5AFLmiDBIqanM75NWQGV0oGqpU9h88SK8e90gd6iMmHklyp
	 NhaTTZWW+nDQtx/A9tHEFZYmPhfGGuvWDmd8VwjKKgBP9WbpzaqqtAPgVp0ISDz8QRI81
	 aAbbAeVzoXhaVEcfwDnvZi11uLw2Kxxip1HyfmbVYkyQjoix80aTMMuAcJDcOzQTuVYR9
	 TxMkONwmvT2R2iJ6+2AAJqkMhzGLhFLmARRH8yfe+4/qJqkI+F1DzQY76q82oZiu18ekw
	 Yt8iVxV+rZkdATodu8OdM2UjkAxzYP4n6h9UGUPIweojmyJ4ZtpLVaHULgwrQOMklwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NDlRFUBA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.4
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83663606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83663606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NDlRFUBA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxap/9NCLSDWYbJ6NP/5I/RMrfR3eTaYznqT877Am7l9YPHjuYq3YBPsj09GtovF+o/sS2IMm3nRvpaZPSwWHY+UDTZ9djHPJNrrsc/nkg45BaUNRfNXwsZbXBvbhx81njnbmPUOWkTb82spcA0bdo64EbRvolcsJI+B7NoD16w7WNTTVRz41Xg6oI8F1aX/EjNv3mT+5t5AyDhvXVWitD6ACDAkbBFrxiimQEHM6zUWU5YpyPWHzJyaVbbgjZDDuTGzNwGZKZbQ6g6CY/L3Une0yr7BIRALMPNhZG9u5mPQSTjuDj/PW+bL62uXsqW6iHxqiKMNFVWCmSQWY3LqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiQE/ooS4bQYF51AFCfQPZ3gnhTu57ynOW4UjPg6bv8=;
 b=hNO6jLj/le2k2o5LRHeNnmzO4ZLedtOyuvc4Mnx5xBhpnGzctUyBfT/SPyS0dLOf5+79F+2YBogJLJv3xSPfuAiu1RNUqiSnxi70reJq0Ji+QpTnzgE35BFpxCnEjn2e+PIDOvPNSXL5Z9ZpxD7jYxDqxjiAY7xS9lPj0U1TJjWYpNXW1i0Wu2Tsz+y3ltxQ7yQUyIPGYNYiPQC2Fc3cAoTRpls4c+9UdtzmF6UAtg505k3gHTPydaMcpQEUDthy8Mw9+8DeopgIN/iASCy70/IG3oqR9BSxpCgt11jcTjpZFXbtM0jmJ1ixzSIxW3Tnzw2IB4gs0jPEViynZMjBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiQE/ooS4bQYF51AFCfQPZ3gnhTu57ynOW4UjPg6bv8=;
 b=NDlRFUBAP0SrhiAP+ORHtPvg85ofl8T45xJwmKijNRbRe2wXJSBFa6pkrZr1TFJDj7M3rm0UitMzVbs8dbsYwt7kaFGBebQczlwq4VAFHqa9PBgvoHvsdaZ1k3sadUVMrQvaFgU6ATRjZMDTfoBmpB7zgqxQ4oAYR8uZRAabPdU=
Received: from CH0P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::16)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 23:22:36 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::5a) by CH0P221CA0012.outlook.office365.com
 (2603:10b6:610:11c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:22:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:35 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:33 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:24 -0800
Subject: [PATCH net-next v6 3/6] ionic: report the configured FEC mode in
 ethtool_fecparam.fec
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
Message-ID: <20261125-ionic-get-fec-stats-v6-3-1ab49c729c00@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f0073f-8e4b-4303-f94c-08df4b4afd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|6133799003|261009223027099003|18002099003|22082099003|10067099003|261102123227099003|56012099006|11063799006|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	ImsOepjwI4MZvobfXDvnsUTWwfktrUaeC7Jmy9+X3ZtP68sIwr/crNtKekYdRWqKZn9pzljrlDmlVpc/U9MfXpnDngso/GXHY8LWpOmNFHGmnd2jCtlOvKHZF03B3IDoLD3/CxicUJs8i/+v/JlrqC/dWYE06lzrjjY+AwRH1wcFz4czVE0GzY6GlbUMyIwDN7W2hR8YopWBnMlYCuakxGToKJ/0Z2ldpAls1/1S0dtBD/lZdUirDEK1BytUcUTacYYDRJyiqSH3diV6APQqpCOv3CIvBmmbX3D3jBrd1/MG3VxCGPN3d2HZqQcd4if/NHB2O2H00Pv4n9BEW43P2T7ZJwatR79KrHppjRa2A8fpcb5Ss5kr6HeJ94V44BiFMvpK1k9xyDLQoqhkUB8ZKr1T2FgJewuUbszHa5V7WvXX5HTNdRJFXBGDaEIsCO/fuONXsbD4M2S6dGyYXLmTBaZco47HFw84q0/yXA4IIqhgCWz0RZlit48+wE2QsEbr+4tjG+xpQCpqEStWunUaRUx+IkJnoF26sll0tBIiGnouAbOExvyCa7ml7mwvpxtSQm+PMcSNHI9EBCSZel9qn1cDjraJGcUuS1Xb782dGKm3YtcbQUmb6loSt3U3wTE1tcEnynkrcdAJlwdd6abiYeBj/mgONr5iw3tWLiPNfrqva6smL4Avyjnizhn40xlIslL72ZfPjmFM+fnXJV2L+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(261102123227099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LeouV79yXzpFPnEsRjWle2OzXR0Lldo1J2x1UE6QVLxpieFdvBFL0mCzyz2ATyJp8PtlzqXdkvVk1uts7iPdn8IZ2f4cEEZ7QRyw5uMmPqAFR0siHLqDMa3t+DALhCZbh47lyRlrfJy1f5Nf8Gy98XPWnAm6vgaxVkZIF8K1tGrZxfr2ftCK4d3KBPQklq+ikqcsNU5zP7E2npBuYtBEnSQy7Ffznvgp/UHwb18siHvOqvsWoikQAw0uLs9AM7YvMdn1oyZUD9DRNedo7Hz5zp01H+eka8nZDCbBPWNC5JQCXz9NljGrzEqC6gLJ4FsJsFyU34wGkS+5LnN0g2nuE0weqnehwn0QZujo09123pqCSHNUeBGm3y2VRRDrdGYYLeHwW8G/MfhZWq33c23FoFkA0RcU9c2Mc9RFINPjlsePfYeBxD2T3MT/QPBhBOXo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:35.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f0073f-8e4b-4303-f94c-08df4b4afd2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_get_fecparam() fills fec->fec with the constant
ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER.  The uAPI defines
fec as the configured FEC modes, so a port configured for RS reports
all three:

  Supported/Configured FEC encodings: Off RS BaseR

where it should report RS alone.  Take fec->fec from config.fec_type.
Supported modes belong in ETHTOOL_GLINKSETTINGS, which
ionic_get_link_ksettings() already fills.

fec->active_fec still reads config.fec_type; reporting the operational
mode is a separate change.

Fixes: e95f922f4c2f ("ionic: implement ethtool set-fec")
Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 16c6e4c9852e..e7262a842eda 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -432,17 +432,18 @@ static int ionic_get_fecparam(struct net_device *netdev,
 	switch (lif->ionic->idev.port_info->config.fec_type) {
 	case IONIC_PORT_FEC_TYPE_NONE:
 		fec->active_fec = ETHTOOL_FEC_OFF;
+		fec->fec = ETHTOOL_FEC_OFF;
 		break;
 	case IONIC_PORT_FEC_TYPE_RS:
 		fec->active_fec = ETHTOOL_FEC_RS;
+		fec->fec = ETHTOOL_FEC_RS;
 		break;
 	case IONIC_PORT_FEC_TYPE_FC:
 		fec->active_fec = ETHTOOL_FEC_BASER;
+		fec->fec = ETHTOOL_FEC_BASER;
 		break;
 	}
 
-	fec->fec = ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER;
-
 	return 0;
 }
 

-- 
2.43.0

