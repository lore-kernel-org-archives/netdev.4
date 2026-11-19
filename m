Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057008;
	b=Gu9x2c5sUWAHiw90vfJMnbE0DwL2aB5qKT4I29XKuVOEOSqTJaDLFPk9YaS5tUcQYcuI
	 frKiZiyXNbkypdmLxLY0smSW+8K7ecisR601g7ONDrTjHHP1yXo6WNz4S02qv6YZoKXl5
	 TNZyBN/0iOI3jw4+DbXQTfBG2YBLeYNkiiQ9kzcD4cG+ujWk9SmMMp0oKzanaBBUefDRL
	 wBNGr2kjk/fmWf5V/NEXB3rQ7znx1xCTyGgNPY6GBimglvAHLoxObXQ+n2smFM7mPSyzo
	 iUifkRMsSQZT0WEYO41/vHte3dfk4PpJoYvLJ4wNs/MJ/NYRP6ldqxPSDLgFvfkH2Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057008;
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
	bh=VGy3K/+zNFcOeOZBSk0n/RwM6DKJGOu7Y90/E1gg47o=;
	b=Hkp3mTSrCZoi6KLxTTeLMWAXdwLUc0XKfTnbjaRKHC30F5vCj79KKlIP+YM5XIxSNbgb
	 uKbEFH9rw2Zq+CePmIT1UXQooRMiXLjapZnme/43cb9jucW9nz5p1deOHUOYxmLSb7Jjk
	 +0OHz6Rd+9T3yY2tuk8Qu/A1GOiS/wrE90VAB7CQ9WFH6FsJ+QcWG8saiIV65pycwOHDD
	 0dQrBPM2yk7D6M8rjHxzBdkNjHGzKqQKdl6fv54NG7Fe1gdXTEc2qU8NvII66qbN21qfe
	 EYSGzj6lT+J/ViK1aoo8bA9BqucY5g/ETvUzh8kKCv6llP7vOS+6xFNSvz9F+bPnKXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R8H6bh0Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.26
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C134606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C134606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R8H6bh0Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHY2eSB7zjegoD10DeVUsStIePC7ZLf4PXLV4/4zzhahmfaCpy6G+Ho8dsoRwmQKYLsp1eGhizyRfQUbQkmQOK9G/BHm70aXN7OXt4QBHmqoS0XV/SExLL/VR0BBrUbRHFKpS7h+kL3JA5n6V5tNWLeKmhYmyYMO7n0UuoQxeNPPeOP5Hhi2TVCPQYRh+hMFLHX4JHy0OiXlDrVLuyg8epS7xTgMBhsTtokbLllmzZ2TJlR69sw5mpd41bfpObxRPj5531auC2b38x2ZYZ9SY6TQdp2V6Q+LX+Tdka8bKjBR0COD6RqXdr6vF63RLE2aXe3EGbRXvpk/i94+mPMdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGy3K/+zNFcOeOZBSk0n/RwM6DKJGOu7Y90/E1gg47o=;
 b=OjBF/OVy6U/Yede0aUT8iFJM6l2jn89AL2q6OEMexD8gBvwxxPi32bErt4ZnOBPdjNsJlMwCgmmbDrbHF+HvCFGiplqpQZleiKlCim9YaIWhVCkjFoArfAEYrDbRxcxowgOzDdjlsPRfHnKd4XTuOoy0dUXVRrWOAYwY4tkuVA3ue2eDyb1DQqsW8DumsOrReT4ouXf10mfiuTn9dsLEW7NFBDPJ8j7lvNvzlIgn+VnKoPVS/1LbQ2mhcZS3PxcL70hEnE0mWBQJ9QPDJZiWPFz2AtUjFfTusQhFSXFYwf25Iis1P7pZ4lHg5piO5rovH0X47wVrbnWOgpKmAWMu8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGy3K/+zNFcOeOZBSk0n/RwM6DKJGOu7Y90/E1gg47o=;
 b=R8H6bh0QSmvW0ADf7Opg3ToTAXC3nRlLTGbV8180mVmWEIZnmx5jcaXnXgMcVyT5+JtGHLe5Ns/UiqjTqhYFbiLG/nqlkK/qj8jO1yTkAlFFaYfnP3Krn5uFuQueBi00tHdW13aLfuxOJIoka4ZByVqE+miirUGGYFj5SjmyGj4=
Received: from BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::9)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:44 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::3f) by BL1P221CA0003.outlook.office365.com
 (2603:10b6:208:2c5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 02:56:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:44 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:40 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:31 -0800
Subject: [PATCH net-next v5 3/6] ionic: report the configured FEC mode in
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
Message-ID: <20261118-ionic-get-fec-stats-v5-3-c9c0ee63df4c@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 0351ec7c-a50f-4790-1bd6-08df45e8beab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jO4qDvOKpOvl/TaYhLnBMXahVLgkfdRQm4u+jMLIoYTm3Szr+xXcsNrA+J2Tvk8IhRSGsI12fOVOjh/AvI0vFjshXGtFrO0ySBNOeFsAVp68m3WL4mgDkiKvVSmJmWo+OSSQAkDkU13TvYwoB00tw/Q/Olq5wZUD/dBtn1rQxk/NNWLG683HYplRg352N9tkEoQ3D9B6NYn6kfbZSTxMSNYmOxsL1Unob1OECQalf48rmHiMnJElL8q6nEDJZ4UA+cdjkL3hjX6wJWBxJMgi3J043nbEostuDGR8rnp2p4RFiOdakI6E+yzrCk//HwBxUEfUyHToDbMYXEg0kk6lEWvR8T8f2Epq4d3mt3BpjAesGxKJVGiH5pixj8SmHcEvUS6KqScZXkm1pamHs/Y7u8nrvcF5tegan9ImVsYC3m6jLW5VHzJYSGPj3H8ROrmrSlSTSA/sKuacI0BuczaLDoeD6OHIYWCwBGTpflLzMDjf+eJOS4MkOkEQee9c1TQtBwsM8E1J6ANV37U2/zr/1STZ7INGETRX+TL6q0q+mBwpXs6CQLrnI92j5O5EilZ9daPDKThS6fohJ9DaTbcrTG87j3Iww5zqWTrL3GpRYLEP9fGhwBM8ae5A944B1I0Yrdqbr5qzeyiee6+92B1QMN4BxGLPnDHASwvEv3+nzOfDqSeiQjcvFbCp5xjtoin6m6nkKaE8x2wHOhbOV/VMcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uNUwjDjQwfcrkXAtedPchM+bmtmwBwbUoO14B0aeBOpDSYlulb7K5sIxzU6BPLjimDKZLzPFQz4UrfKWQarv/7qCyo92nX2yzAi2QQinxlzr/QmJd9yieJHhoruxHlkVx/B5UHRx6i+COa8uZzjsS+WLT7DmHwtDS54oCNiiQTYHeXNVP6PainvNLiJqwY0hL/fflunhLxRMPkXVr0y/qM9lLHNa2fC5EUJfolMf85GQf2Tv+kQLqSdtV+0mJe0083QiZQEck4gRbwMsDYXfWdA0uw3T1Hfw4Scvmz3DezSzxMH/EdvxrdiukgLUiuN7UkulCoQekw93rbaoR+5GXM1ps7ncYsl6CqXu4za0OaJVUeUE/5fSYFqIyCgSCkEBeGAhlLBkJD+/vIoBQiegMRhSupQA7G5NfJOhyxTUwToW83r8onmZ3RqYRznykKio
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:44.3054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0351ec7c-a50f-4790-1bd6-08df45e8beab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397

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
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 3c24079fd02e..a192302c5e19 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -434,17 +434,18 @@ static int ionic_get_fecparam(struct net_device *netdev,
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
2.53.0

