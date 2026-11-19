Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057008;
	b=m5oEApZWncnqGeUw7SElTTi1RR2YO+e7QcTGkvT3fM+SwqOqxOAxJ1yplN6pMCYGoD4O
	 w44ke1TYaTPteGOh5eSykOgkoq990Yj/yforE4b/DovAdJgvVTEMPY9ssufnxFJmbZjg4
	 kRTiYMvJh7fZ1YiGYNqlAvT4dVDFBeCZT+2RxMlD2xeojaoNwQNEREAwNxLaD5yBC82NR
	 2BBcg5Elc0B4kncO3ul1Du8PlYMINf7bD5J+1SOtVgXjcM1IIMPqmIv7I2bhfe9XBb6nx
	 dcW0X1iS3B8oO/krztJt8PmSrgJ0ovJS17yXTjvMmLj9oUFYCXl+81nq2EZoDMX/3uQ==
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
	bh=rXG/lT8Ap0jQN1A852IPAry7KJz0tpq4y3nbOpsTgdM=;
	b=txFOm1VVLUo6J2gsYSoRDB5NFOIQ7e+yWX33M3Cr3z8avL2cdmtxCgX2lkQAlXYkk6z4
	 b8eLkQz7kbrtxq7uib6aEYg/TD9A/j/SJqb4yNF4c1YoQBZb6GHYELIjbCf51osnC/8O1
	 3GSMHva2xfakXn4Z5u8tujwgo4mw7B5P9oDMZWdOAB468wHmBVEyHD+itq4pvgn0KWpPU
	 uiH2zFzTFeh4ihtSfJfZ6xJ1Bzo3KjpTyii9S0sNsPdzxsnFxx3l1dhdF6JI/vtrqBVIG
	 LHHOs08pdpKjOSF4NTw0K6ihTX2eTRGpJrwq8QaWzvXr+mOTUXD0Is9hpZIakgmIA3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="ptSpPj/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF6606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ptSpPj/P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4NYXyNgo0w6rcA7TY8wjAgxfMYzTQ6+re2AGzzhzreUiiadIoD/jeew4yDA2Zo6rKuNzhIFNzjaMciT4sAkms09V4tlWhW6Gea1JmSUjxiYNXmT7MAn1mdqbP3avJIYSJ0G91kyoQicIPvTucJVcpKQE5CcwZps/C03jyVdXltOu/mfEEoWz++sWK6dAsLOPlFIfItEsV4Tzz/9bYceRxP91mRgpU1LcnfRiiggpt6ixGhOpFPQ7+hUpyHgMLUZB0I/sKuxGy5OLACVpK5RIZJ1CLvMgsVy72u7ZdkkMiB3JYcfzM6P0s1Jc8GvKpMnP7zscKwtP8ob/dSAsgXPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXG/lT8Ap0jQN1A852IPAry7KJz0tpq4y3nbOpsTgdM=;
 b=I5dQ/ndd5AJnweZPJv1teC63yDC1AojjR/PfOs3pboo9cFi4WqCodBiEwk8vxI+AIPUTSJTMImZn2KnUi+jkE3kFCj4xJQQW3bYoEOO4jSwd8EBMGEv+gyvdLxT6LHBfa8lpt57Agm4F5HsTG4WueuyykvdNs/wtUFECOQllKJMioMpNa2as6Kvpjb/4aQ+ip4yhW+lXCNkwVLcZGIyatLNQ4QebcHLBZ61oxdNK0/oABLqK0uMTCMfmV6BY8zcwChCa3yP36IWe4e3b1gwgGLo7ftEeZqqbyAKOD4fxdzbVujPBN70uHrjt+oszQP/Cx5mZjaj72PaTR+/LYOQu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXG/lT8Ap0jQN1A852IPAry7KJz0tpq4y3nbOpsTgdM=;
 b=ptSpPj/P1DBaefdejCKpO+j8ZCFbmpfVBlf0nOt3IC8YnXcs9GjwPMuN4vJ+pUdacyaqv6DYBiHnHk51xaI3Fy97SXP0Ii9iWbsd517vzSaoBi5uaDfuYxYZHscVgJ7rBs0hjJONUEACVvRWGtftoHZH2nS57QnQGgh/N2f7Jfw=
Received: from BL1P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::10)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:44 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::8a) by BL1P221CA0023.outlook.office365.com
 (2603:10b6:208:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 02:56:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:43 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:39 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:30 -0800
Subject: [PATCH net-next v5 2/6] ionic: report FEC off as a supported link
 mode
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
Message-ID: <20261118-ionic-get-fec-stats-v5-2-c9c0ee63df4c@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1acf66-489d-4382-904a-08df45e8be19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|261009223027099003|261021135927099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dQYclnlc264VpdSWAPpdRVl/77AeyX/gWogXP8Quq3Qh73mLEtzAe2lSRY8SxHusG++LUWi3cbE5gPwbeJkrAlpFrEJnXoAYiWEN5ZKltsAyx0xM3QbrnnLpYHtTGBgJytKAGBORLdUqBLuX2lxcqNpr0M2uqiKq5QH85oaiXPAFeokPA5RJtCk2bAG9hKCHHLsFtKxsJjgRNA9KeBBpiIJSkZTDPoIqdDSyHyJfFlp9tZ+yhJkFpCJJBjmANAtg9FZd/nP7ghbDof9QF+wKJiTx4B7b0WaMx7poNMqTz7PCrU/Smoo2uo3miA5DHqgaCNN4yYBBRk0jOyM1qM43dkz415Ge2B3t6JtOkwoQNkVyfJ8CDhhUDCs0hLy/tXXp+D80V5xfQGJOjUR5dqOidc7Mesbwg/Hf5LcVdVEwb+UhR0Tz/4ugTYUWcQUqOFA/+QiM3d0cPvtls/DKeXMDgOSJZ3nItjyg+cn6u7ItyPFJGrIO3kfNYr6avf/IfJCWp3pF+SaC/vc0iW5bwXqN8lRBVtIh9xM8pW2+vP+yhFMxOIgWI3agz8Z/pzR92IX4YicQSSWHROt1JrcQJJy+uta9Q3DiAfpXLR52i2oqdA2lFAj1Z36JzviBv+Egz+hzVAxHOZsAL5sbZHKZvfADQh2ghqID+LaYBq2JnS2i9A0BXgI8+jOefsPXLn8cYXj4wiFG3rX7bN8zjbU73weJlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261021135927099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SMd2wpBCOPf8pzfUUl+G0vzi7jbUzya3IPN1A59o1Ze1X/lr6MDas+X8/IR/GCEEuDRj9YdcfJc1D79QDMNliLfIe5MDA8BZIBRVvXDCBk5fQOBLXvG32vxPieifponq59JlvviTwW9t1O9iqBc50TTrwSPc21TqlfCUOccXmZuTLW+ZXsXhXgwzgyFkMIZbtkSysaJ5SHP8yPdQoxjDm99ikO9W7Yg0QRfcLbUT32jIW3Tnv0SRpIR12Tuxsk2RtSLyt2Uoc9lcKY3IMtwmM90qJA9E65fiGht+pS+tv8NEm86kMF9kYPSmcQwtwxIACWIHdd/CgAq9LVmQhMMOUpXIyJGo5CJzgu0y+9JKQbNUDaWIG3Ym8oHPwdnZJqU52cvWJq0PxdzYBEUTvS6Y2gVoTzIR5M7g2oEtDI2a7bBf3ygPEYXvP/gUddbU7B0h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:43.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1acf66-489d-4382-904a-08df45e8be19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655

ionic_get_link_ksettings() lists BaseR and RS as supported FEC modes but
never lists FEC off, although ionic_set_fecparam() accepts it.  Add
FEC_NONE to the supported modes, and to the advertised modes when the
port is configured with FEC off.

Firmware does not report which FEC modes a port supports: the port
identity has a field for them, but firmware leaves it unset.  So the
list holds every mode an ionic device can use, and firmware rejects a
request for a mode the port cannot run.  BaseR and RS are already
listed on every port this way.  Off follows the same rule: AINIC
firmware rejects it, while DSC firmware accepts it.

Fixes: 4d03e00a2140 ("ionic: Add initial ethtool support")
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 119ac720c078..3c24079fd02e 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -298,9 +298,16 @@ static int ionic_get_link_ksettings(struct net_device *netdev,
 
 	linkmode_copy(ks->link_modes.advertising, ks->link_modes.supported);
 
+	/* Firmware leaves the supported FEC types in the port identity
+	 * unset, so list every mode an ionic device can use; firmware
+	 * rejects a request for a mode the port cannot run.
+	 */
+	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_NONE);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_BASER);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_RS);
-	if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_FC)
+	if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_NONE)
+		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_NONE);
+	else if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_FC)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_BASER);
 	else if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_RS)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_RS);

-- 
2.53.0

