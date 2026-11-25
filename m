Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648962;
	b=OWhQx8GYwORVhQVVRm+0+6kb9S5+fSGe9GGZhMNhMDqMCEJ5fCWMTgExVjqG7K21WP4a
	 H5AdDqTeOQxxd4+dE9iIxVGLqV138+OyRKqTi0gxceeRW3+EEQscXoTaUeVZNV6AHoCS7
	 oZ5OMm92IHt5hIJ6JmzGKfUi7YRlOpYBWtz1Yd3SQyCx91HIJYef8nKi4QztvJJihEE0A
	 OPjkIjOWV2z4nNSvymznmMWWho5Z/UcvUBRt404IuQTFlmnH4b+wWog+nVpL+dx7EzMkE
	 jKrY5dbdYht0MhEbVtRXJD6yit9bUKo3TkqlM0oqO3GwLc6gdk7cBDOlOxb6MrySuZQ==
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
	bh=FkZMqhGQOyZhLMhSS1Y47PYNVI4zBckvVIPTX+P3pSM=;
	b=xn2Lg37o7uMRq5nBVB3WC830meU10N+er4ODvyiVLiYC9/eqtdbOdXWszM5ZmLiKaWy9
	 Ye9LgY+dglbjgwwzl57AsUzmR9OlszBhwm8VtQ/QZahYkcYQjS+ebrK0FNfwA2mQK6O/P
	 BK811LrFe2U642e39LpGcYbAi8YoetDXMUrBU77Ty/Z/nn1Jcle4mDa12K9MuMsbxhLJA
	 XEjZphIHRWA3l2KzG0YJzETk93OAKqaTFtuiIIDDUaYYrKy+jexCHD12YfE1EbfVbaSCE
	 7Tzx39MjE8fB2ZB3Dw2jWLKGQa+8oyIon74GaP01UTuix5sI9dzU1vuyuZTKxBA9G7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CZXsc4nK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.56
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E41606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E41606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CZXsc4nK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRST2vj8BXmkdxWL9axYFanPTRnCDJPb21HoHaA/WHbVqZeSOYCU4zJG3AlWQwq6tbUa/aiIlw+IOkfabmjgdjaopeM8cB+brH/3iDv3rD2+H5MQDW4d+JC0DbZrW1nuHd0KF0NosmEc3u/oU28RpYYO3OWTFoPO4hO7+794bwE/yf87qFayclBuRzrl/MDF0tmV+bgEULb0YXZVrSBviDOQlc1Dnn8AqJhhZnGjVWdzAuqYfUnAmSTLJLJGSr24ca6Azit+ebdMAmSCsr8Df13zMbQG96TVJLnvC1Pe7xUgf4RQ+T24y2Ne0eJ+SGJQ6VZ4HCgI1FiZH5Sg8qEKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkZMqhGQOyZhLMhSS1Y47PYNVI4zBckvVIPTX+P3pSM=;
 b=RGtCuIOsFD6NS8QCbMP1AX9ISJRD152E9++10O6v6xb2e7AIZim6I2hJs1pwKB0JsdKbJXXSDiXEUVNO17nfe4Z2jfsmTLsAbfsvHg+henD8FRLUXG3YArtNYmuyET0BeB3koMZfsxAkn9QIXov0cJQpkB2SygSHTxyYeAwpZXpkR1ESD38BKymfe6jTohxoY1dWXxBoCNa7dwHQvvaY6C4MignVstQ+akSfXbhhffv4SIEDJLOvqsaUxWqWEKrjEL0Bq6+3PDJbflRvLF6n5O7Gw3ZMI6w6ADpTfBWnKusSEoFcnc0DIdPeCbD66O5sK5SbEkdwAddNpCs35p5aAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkZMqhGQOyZhLMhSS1Y47PYNVI4zBckvVIPTX+P3pSM=;
 b=CZXsc4nKON/YbIJv2LrFKUxx2wk2KYM+3fHZ7cd/Gr1MDWj0G/GmIZ4rzEphu8vz/fZVMcHGaTWjdVH14gL4Btm6ys0KvUUrVeIVxFFgwgn5iQH5Xtt0c9RIKk+8/oL7ZV60hhFu7BETXqgn5K4rIPmmyq+cczULiXuIydvUB3g=
Received: from CH0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:610:b2::12)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 23:22:37 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::2f) by CH0PR13CA0037.outlook.office365.com
 (2603:10b6:610:b2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 23:22:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:37 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:35 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:25 -0800
Subject: [PATCH net-next v6 4/6] ionic: map the FEC type through a helper
 in ionic_get_fecparam()
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
Message-ID: <20261125-ionic-get-fec-stats-v6-4-1ab49c729c00@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e560208-07a5-4d6c-cc0f-08df4b4afe14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|82310400026|1800799024|10067099003|11063799006|261026121527099003|56012099006|261021135927099003|261021121427099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SAITm+jb8mJ3+SoMEpntolujFB6QfLgT7o8Mm7+ueG7IAxMAIp8Ys5bDJEWzxouP8XPb3YzVq3bzD8qQoQFT0wZYe6DmLxsdEVxQGfkcfO/kyWyVnAwYYq6etO769dw3Wxs5ESTXujVYWgjIX05rJeWX4g0qa7bHaAXupBP0QhkgbX/xXbYAifDg7L9W2VCDU+dq1pHRwDblW8F3YmUjM2LSm3kvmjxrYc4G9vMO2vUpFAPYhlZCgwaM23/L0n7ZA4UGaSSg63d6kor4KAzg6TN+XP1dM2nmrCmE7k2Vp7PgA8X/trG1SrR8xCBiDXKQrpB8NswZXxZ986VgXr3eesl3lIKIrDJkG6ksYyTTUc9oC5T9IF3Rh4Nz6dmxG3z/NdYy/4JQPsBd8s5VQxol9LFwo3Rnxm2mvEZp2QOghmAeLzYJMrtQpAadcHhPWrsqq/yJHbm3Lox7h9Yk31owas1rblt4B5h7wl7OgH3K4ouskaHDPBc5Ak50s46D5J3KvDxfb/X2zX2ZtMMM8kPmnGz9UmbpZO5tYHfw7vnyHx8wjO0U9UZmcXz8n7FsMTVuzG0Xl2Ia3FV37eNy1NxVr3MOT+g0CeoDUBEF5CBpDgTF0xlglVs9PrzQREQKINpyEAMA/ZgEvgqXx5DDTYmP/grJE7w7xLGuhRWX6ueur6JW/QaNP+Qzolt3RkmLb0ddH1tWVLMefUcgsAw6akXDUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(11063799006)(261026121527099003)(56012099006)(261021135927099003)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h/VFRbXf9o8rpg1kh4tchKztWZulB5Ir54L3+F4+JbsJZ+n0QSDAxfTsIRVh6E3vDYLJMoHuzfdR1dZU+qeg5beiMFsJlvuIULdPg+Qb724IpLHb/WjI2nx1dRBqCp6KlX+sgyy040jj2YcM0LbZoHsuDewd1fdVn5PUQV2y8xnc1wyi4AKXOqaQYtTm9gXBTALfw3o96zaVCSkarbXh2EbGZ+iWHg12f0zMa6phm9D3puCdVOiYGteAhk4sLp6WuS4uulbKkqxmAUDZxomUwtRDaezc7P75v6GuVYPS5i5CAwrQYwZuVAsYRcvN8Bqw+K6nPtZBTIdBLEhTfZcKqHAbZbR3ydyUU0asq8jswQGTCPybFc992m0Xl/C8feVdvYLzUVWzLxUjlOyp3dEuU938fFLkpbrQG8Vos93iToZqZQnipMaWj2rqYRjhrokn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:37.1803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e560208-07a5-4d6c-cc0f-08df4b4afe14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_get_fecparam() maps config.fec_type onto the ethtool FEC values
with a switch that assigns both fec->active_fec and fec->fec in each
arm.  A later patch gives the two fields distinct sources, which would
mean duplicating the switch.

Move the mapping into ionic_fec_type_to_ethtool() and call it once per
field.  Read config.fec_type once, as the switch did, so the two fields
cannot be filled from different values while firmware rewrites
port_info.

No functional change.

Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 36 +++++++++++++---------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index e7262a842eda..312cd3e5e404 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -424,25 +424,33 @@ static int ionic_set_pauseparam(struct net_device *netdev,
 	return 0;
 }
 
-static int ionic_get_fecparam(struct net_device *netdev,
-			      struct ethtool_fecparam *fec)
+static u32 ionic_fec_type_to_ethtool(u8 fec_type)
 {
-	struct ionic_lif *lif = netdev_priv(netdev);
-
-	switch (lif->ionic->idev.port_info->config.fec_type) {
+	switch (fec_type) {
 	case IONIC_PORT_FEC_TYPE_NONE:
-		fec->active_fec = ETHTOOL_FEC_OFF;
-		fec->fec = ETHTOOL_FEC_OFF;
-		break;
+		return ETHTOOL_FEC_OFF;
 	case IONIC_PORT_FEC_TYPE_RS:
-		fec->active_fec = ETHTOOL_FEC_RS;
-		fec->fec = ETHTOOL_FEC_RS;
-		break;
+		return ETHTOOL_FEC_RS;
 	case IONIC_PORT_FEC_TYPE_FC:
-		fec->active_fec = ETHTOOL_FEC_BASER;
-		fec->fec = ETHTOOL_FEC_BASER;
-		break;
+		return ETHTOOL_FEC_BASER;
+	default:
+		return 0;
 	}
+}
+
+static int ionic_get_fecparam(struct net_device *netdev,
+			      struct ethtool_fecparam *fec)
+{
+	struct ionic_port_info *port_info;
+	struct ionic_lif *lif;
+	u8 config_fec_type;
+
+	lif = netdev_priv(netdev);
+	port_info = lif->ionic->idev.port_info;
+	config_fec_type = port_info->config.fec_type;
+
+	fec->active_fec = ionic_fec_type_to_ethtool(config_fec_type);
+	fec->fec = ionic_fec_type_to_ethtool(config_fec_type);
 
 	return 0;
 }

-- 
2.43.0

