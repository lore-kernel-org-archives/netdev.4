Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648964;
	b=zVLrG3kVjAJXFGhLPwyLGB2ZXlBTaUEqrp/a0cOwVAXWWqvd+SQk1NW1TdXTqL0mSTe9
	 yeo0tjPhki4IuG0Nm8E5saLozw/5Lt/eotViBDpEgemLxiOlNbAimruz8e/MpDbA9AvRR
	 FCf6rQI80XYsssdZ4KAv5CXr3RM4DsvumHtnmOHJu7+jhYZ1Zd0UMuAi+BFz4Rr8gKGiB
	 sHiDvDfzuoVP4YLiEHbOGlNTK6vxANsEqCXcjRe7rRVHAjBRp6oYZMtD9fRw8IKIomllq
	 SnHMMwgLYSEhzyzD8+hc30BNuE38CRhVxH5UsLt78L8uZMwp5iivwSWWW+M0lqH2eHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648964;
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
	bh=f5GNtEqFR9AMkrE7AJQWDQT7hYAahdeIpGr7ZcoNRHs=;
	b=4Gv3RYpbHMse9et8Ita80tfy7MyXxVNMY3JS4P0gOm9jYxrNcUFv64OQzK2ChRUkMgi8
	 o5ewc7mb4/kRgCcToWzOTXoVe9AGZQphSRFsvRWrfEoiLcEvrRr8cLylijeVu18epFNKf
	 3aUcqVFQEn2r8ipQfQfBdWqZMEqCjw5UQvcbs2LGNOpEf+PYKqyx9jTbEabYXTzTa+ubf
	 IXaylm7td6ZcM1+U9Y4+TcPuFAw8Nh38imbpJvWxzeYmSKisiGJxlES4iwQmFhER/GSYr
	 9eBp77Tun+/MQ2nKHptXINyEYVtcxLIoZTzNT0Nlt9tByX0+kC9xZtqPFiVs6TBJg8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xf1s5qBJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11B606A338
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B11B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xf1s5qBJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Djg25zaZVw57cn5zaV1NCSY+/vjPEtV5eXVQw5aqHVtYxACOyGzckI1jkM3YQB8y9wsmePtHiuSTOLVsoW+aSxex7/r1wy4QNQT3M7SNgR1KxTLRvfdSHXExGs1G97nUdcHTYyr1QAiZbBmhBbEJbqaTRFuJPnOxzN/8GqHqUJsNkBnD3U+s8eAXGsF6bAcFDQz1WMeZw05NAtUPoYNIoRnZp0PoCzHQG1Hrp5xpJbaIhpUnr1LA+ms9IEYRSrSTjqAevyH2wtRNUCtzPJYW9pPhqQo+5+gUwtIW4bO27mca098kRSBSQm9C0wA5/GpyWOno9DZ1y/G7GxiPWlYRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5GNtEqFR9AMkrE7AJQWDQT7hYAahdeIpGr7ZcoNRHs=;
 b=g4U7WOujJzEJ5isbIydYDjkJtrd1DSav/7j4VKrZwKJs8zj2cVNS5mLX5Gt/MoqMtFU4920F0pg+xOU3Z549G9Tjfd5+PsLMaOF9EQkWBexyWZLqIY5uJkNzOtAUfmyyo1ZyzDcv4xx9KxLSOjHJ62pXHcsXclX+icV/INqCON3NlzguqAuvxeGQSkB/2ju+jzd3Wi6Y6sduCcE6jcUp0QFl7Z3+3aHy/PzefFt4AB+fNVu9BC+L6zJgmJD0RdQid++ySpTvwC2SO7M9Lk5AEurzr4MKHej2X6x8P3M+APgZyGSAr9qwRAvJQ7YRYLrZQ8Tn9otpOCQdY4Sxh8B/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5GNtEqFR9AMkrE7AJQWDQT7hYAahdeIpGr7ZcoNRHs=;
 b=Xf1s5qBJSPewcCJcPbo9Cb739cuA2vKDPsG2xwkTIgiC5PKrR348NW7xdFhsO9DvQWc7YmTFJ/J6lGhR5Q5Cl0EXmDsiuWiH9yA1zdYuA9WlQw+dZsBkbj9GMIjDtFlcx+mCCAWZOojiPpr8TO9LWzBAPQdeAadUcRdW9Ohvs9M=
Received: from CH0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::11)
 by SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 23:22:38 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::6e) by CH0P221CA0009.outlook.office365.com
 (2603:10b6:610:11c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:22:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:38 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:36 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:26 -0800
Subject: [PATCH net-next v6 5/6] ionic: report the operational FEC mode
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
Message-ID: <20261125-ionic-get-fec-stats-v6-5-1ab49c729c00@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: bc928f95-16dd-49e7-5bee-08df4b4afef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|18002099003|22082099003|56012099006|11063799006|261009223027099003|261021135927099003|261102123227099003|261021123027099003|10067099003|261026140227099003|261022105027099003|261026121527099003|261021121427099003|261028144727099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XrQ9HKE9Wel9TDcRxNz9WIVT+ioMsbHkoDojY7DZFgB21pSdX5NoqP7xBQJEN9ymhn/lVVuzgsgLlt1jhxmPKv9n2A+MIoN52cMuVavTGInZd1fiCTq2srLrMbxotsO+7BLMfaw6uHEjKRLVE9RIndKLRUQrdZEYb0rxHQUIUa2npD6XE2Q9dTzztef2lolox+VBirLV+MdHrLVrERp67vQq5SHGZq9i2aItWDT7s8SmdZl47ILIQSkXsMlbfp03V/wSYnmYlQ0gxUgfhNZBdMURzzc3pysdmgQWjS2IQIujovHOG5WWPHdvv2ry3zh7+eHh0z9SneMy7l+tBMIXUIP+FsB5sQnZhesSuJyBDjaks18ygWKPJwfIDcGInwutn1pUgkJIMFIYbsDSfyZFv/VpxgipWyDA7pdXB7JDNSbpQzXMho8blsH/N3FmyzWW1t+vJhzhM+BO6GSg5YgcxmxMeqf/6gXpvINB/yQXV3El4Wo1CkPKroEf16cStWXS5b/rswcnzt+AJiEKYM2WwqaPdOwHOLRINqeVCqKEbywjQXaJQP3YjmZJhpHqvQ6I43dP8+It74gaoqfwaf10IUzCvTazCoueAPwkWXadoSxx1eXY6rUWSwapU2cv6Fu2SG/tu7HoamNUP9jLyqgarMpf3sJV7tM5ODQ+NNxAeRTFX17P32M7iQSUGdm9VVl2nJgQJJp6CsTEtUN2L5mlTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261021135927099003)(261102123227099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(261028144727099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1EeJbdRvWSK+yzqFpxKwaFO7r53CYkPN9RwytAUWkH3aPz0w/aUkg/15d3bNDWrpEOtUDAS2XWg/z02d3tlMXUOkaZtebfffY/5jUciXqZjzzwx7xlPYfnl33fv5eAacJipAC9wlD8n7sMHtST6GBJuCci3hwI+fF1ovLthUJbsps7ptRlbCqn4XVTUdi9Ft8Fk473EJMXsZwZsYUvZq8YPBrQUxlq7u5PjowJvl19rKH8PLsGbOEaoGnGYYaPRMlacIsXJ5EOjc6j2IbvN13zc8J6oZ5xJlPLgK51aO7oSyxt5spTNi8kWfLSJOS4S52QfWaZBo/l0fU6CkxXAaoLoe8tGQiqisPnjBT1XCK9T8P5XvSKUuyRUquysn4fWE5uUGyiZqXAiNtysu89QwbPVjyVErH7J0fH+M4op3STxSS/cuy0Hpz3cUm4R3/qc3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:38.6636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc928f95-16dd-49e7-5bee-08df4b4afef7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463

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
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 312cd3e5e404..3b6c436104d1 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -438,18 +438,29 @@ static u32 ionic_fec_type_to_ethtool(u8 fec_type)
 	}
 }
 
+static u8 ionic_active_fec_type(const struct ionic_port_info *port_info,
+				u8 config_fec_type)
+{
+	if (READ_ONCE(port_info->config.an_enable))
+		return READ_ONCE(port_info->status.fec_type);
+
+	return config_fec_type;
+}
+
 static int ionic_get_fecparam(struct net_device *netdev,
 			      struct ethtool_fecparam *fec)
 {
 	struct ionic_port_info *port_info;
 	struct ionic_lif *lif;
 	u8 config_fec_type;
+	u8 active_fec_type;
 
 	lif = netdev_priv(netdev);
 	port_info = lif->ionic->idev.port_info;
-	config_fec_type = port_info->config.fec_type;
+	config_fec_type = READ_ONCE(port_info->config.fec_type);
+	active_fec_type = ionic_active_fec_type(port_info, config_fec_type);
 
-	fec->active_fec = ionic_fec_type_to_ethtool(config_fec_type);
+	fec->active_fec = ionic_fec_type_to_ethtool(active_fec_type);
 	fec->fec = ionic_fec_type_to_ethtool(config_fec_type);
 
 	return 0;

-- 
2.43.0

