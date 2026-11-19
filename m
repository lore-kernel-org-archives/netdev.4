Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057048;
	b=tKK9bTbWmJlX+yu8jjkNpsJx5c9gylOYzCM4jUtCf4MVMSsVfKR3J0d7h/5WtsIxBK4O
	 cNq47xE+JJucTKqYp1axaBC5vGP0zzVXAcN497Qv6t3S/7fgY1ZQqYdI4Wz8NHAMfHnGc
	 9trdw5XH8/fOQec5A36Kn/7N2F9wJnCpNhyeT9Ncr6emIlDeSh0LwXqFxqgJ2SjEr+nyg
	 BdN2g2LTaMeq/togPjHYqREWoDE/aQiKfbz05aETcTzA2IlbNa2glESVkYOOwl9MjQc+h
	 s5bBC6YB1nb1fXIwL2XBhANUE3lbsBw+DVM+NSdb1ghP0e3Ky0qSm9eWmAItX9AMJ7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057048;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:X-Originating-IP:
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
	bh=EAZZrr2p+sL3zqDCveXpo4EA81zgfDChN7koovH9jrc=;
	b=08jPyqrGZrziLrohj838gJaD+PGhSVuBlhkZ5iGqQiUYy1c7GFwZ1uKxUhi+job/z9j/
	 yMubFlrWXgLAjXZ3LU5dxmS/dObrQEkQ8plXFetbE1Pbg+UXAt9JtklB+J1dSa8JTRaxd
	 Jdzk2g2zvQ9hVG82t9he3r0ERc6zMcY9ggXFcKr2RleBFyMJct6O5K5EWiVTQjyrwE/WM
	 JclJzQuZPjgeX2o6LsKlKMKL59xtQeHZqDdWDCzcfsIStp/x+oSPlxGkphnqqs7hibE2H
	 Bc3TWJF/bW7eXtcQlMULqiyEaPO5yHfzyiEgkFRe9y25XsH99rgKyzFbGnzfxkyQxfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wh0Rncsq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.11
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D820606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D820606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wh0Rncsq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nwj4i8A7C/dELmX4nitKKjShg36kKOyJklaeY/iV7Qs1yw+Y/wBqtaZ/B7MC/IshGEADUPSec6pus8MxrPMxahscKDbtrnZkYAFx1zj0ES5/2L+adgKIN17oB1fSIYHfQhUV7XJbO0WbXSmE+BJCk0jWKOnxi13vekwjMSTjEW6uNtUqyv+9bbAJLRKtZIzown0wvOTYcxmFDQrAwEzHubGP0Jo088W3UFpibkON9unszbKnQ/JT8vRPTR7U6giLDFcb6N7y6fHOHzsoMz9a0B4er2FJE3FbCEUMGgtFHGktdmi8XRHHHCwZ8pf3ElTCSFFn/02PkB7krpcDbO5/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAZZrr2p+sL3zqDCveXpo4EA81zgfDChN7koovH9jrc=;
 b=aDbOlfXlPnBXnbpkutlsjD/VXfmfnj4m9e24w5vQbpY9L80TkxClfUXBQRbE93CWFyzY1LUdLIKt+I8FimQbHv/+GBTacH0zGEV/XQdVmkgwIhVcw6PFj3X+tm/A0Eq9Ey/cxKcBQyK4Fs0luF7W8WQ7zkg1/FzKnidajJ06v8D+la4qPkC/WpZBk+DP9U8mWYY2z9pxBTtrr8O/CsKfnmA9yHDsS/ABa+1X07M36NzQrRENuS3kPs6Est11J1N8mFtRwTgy+81P+DEzepR6F2VNB1pwUfCyd8p3tV2Rf7dBI1SCr56VJLkyqmhPNnFWgxH39BTOs9fV+TJOjCqcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAZZrr2p+sL3zqDCveXpo4EA81zgfDChN7koovH9jrc=;
 b=Wh0Rncsq8Jnx6bLRDiMpifi0/9TGzclmKj9QNhGwPwfDsUw2FkfFSZ/MRa2zhgsYMvezV+fLoILj+ZyhJp0SEKse8rfvL4eVfwpRLBfhcTDdPDZh08QC/wf/CRCA7gbNRemo/INV/x/DWAGi3Oh8wrUpdHSreBYCfeuLV/vkVew=
Received: from BN9PR03CA0394.namprd03.prod.outlook.com (2603:10b6:408:111::9)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 02:56:13 +0000
Received: from BN3PEPF00022BBB.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::94) by BN9PR03CA0394.outlook.office365.com
 (2603:10b6:408:111::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 02:56:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBB.mail.protection.outlook.com (10.167.248.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 02:56:12 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:11 -0600
From: Eric Joyner <eric.joyner@amd.com>
To: <netdev-bot+sashiko@kernel.org>
CC: Eric Joyner <eric.joyner@amd.com>, <netdev@vger.kernel.org>,
	<brett.creeley@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
	<vadim.fedorenko@linux.dev>, <nikhil.rao@amd.com>, <edumazet@kernel.org>
Subject: Re: [PATCH net-next v4 5/6] ionic: report the operational FEC mode from ethtool --show-fec
Date: Wed, 18 Nov 2026 18:54:47 -0800
Message-ID: <20261119025548.53327-2-eric.joyner@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179495702938.3136.7315548716381258707@kernel.org>
References: <20261116-ionic-get-fec-stats-v4-5-d25cae9f1e87@amd.com> <179495702938.3136.7315548716381258707@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBB:EE_|CH2PR12MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a49c24d-10cb-4b40-ed64-08df45e8abf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|18002099003|4143699003|11063799006|56012099006|261028144727099003|261022075727099003|261021135927099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	tTGLt+TAwkLcggR00LfRqDdO5V7y4GWCuoBeb4nS9Aphgjo1IJFpmXfbOJBlWq0WgoO8RzrpcqT7HX4/6gw2e4swiUDpUY8/re88jUEq/1ey7Kac+XiRzR1CBOlwYLTJwKY6q1b/HyDt8pg1sBfYSn7jWdQ7rPi4jGzA2pp2/vRARuOlsU1P8t5tiQZQiPHeI3QMqoBeOza+IO2ZFlm/XYCvJerPj3LvvF1XG/cmvdyzJQIRsgfmtSqnlPJ9Y0f/aTYg92sAHTXYKqcX7UW0z5n8aWm2HDtO6y1rkuMjD90Tq0d1l5HanCJsn8sCPwjCyY5ZK3aN5mFdFaVRfc5HaF0k+z20HT4uxNNPkFwBi3C7Ye4PxfAHYFfFTw/oKtFgnfmT9CXdHEs5JOSOyVf+dzX5aAxTXd73VThJ175PK2hzQgxdGW46QdqzhkSfJFAaBIM2drq+9bxaLJIHyQu+yp1Pa/GI75oMNnVz5YAp7RAWk6LhCkOCrVZ/GG7upJXjlBfuGvu34hisnctQt55cU/bJT+UZ9nFAkYQfXrwu3yXsJ806N/qvm/pbb3kJnw9UQnW0uaQJfALCDAnhDhc42r5HK8/NUe0waDhLGWKy1NnGC5n+dev9lkRJgGqinPrVZ5xwXJxwsk/B/WJ61AkrWkvMC4Gho4zyE9/hWUgYRXCLuGUrvvZBUMTsGpuV8RdvqJLoFkJZXvXdRpX1X799YA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(261021135927099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A1nkBv1LyNMSIo+xoSoEfjoSZGOv4VV4OesbzB1ZsGK71AvG/uc5Fs100V94Ntp3FP8cwqRHBGRC9uOekAnvQFtQJIYdkPQd+iR5RBJDQBIEny7NopLg2kbjSMzEXIQtN4zYCXNswq0qlin4b00Hj8+0a4OINyejjMEIs5KiPdsVZMBiWX8DK0t1rrGvOiWxYEn5oX/1JYGuR8fQKNfud7SsXYXFgO+zMJxY2m+tr8Kz1xinVCFg44y2zQ/TUMDFb9Jni9AwcLOSh9FuLzvleDHyE2thT0X4+8PbdziAbnXzIQVInF2JKdBqFvyZ1G5Z+bwGJlSBLc5bHeHNYnvJEh5QouXSoerlkot7cEdj2vVOHPqD2l2glys7EGdSKpfn+n/vUN9PC2bLE5xh0VSOztMdBfNjO0G15wDPvh4wdr27F6gRVAttoH/uxn0JkmJY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:12.9262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a49c24d-10cb-4b40-ed64-08df45e8abf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520

On Tue, 17 Nov 2026 23:10:29 +0000 netdev-bot+sashiko@kernel.org wrote:
> Is status.fec_type actually guaranteed to be zero on older firmware once
> the device has been through a firmware reset?
[...]
> Would it make sense to clear status.fec_type, or the whole status block,
> in ionic_port_init() before PORT_INIT, the same way extra_stats is
> handled?

No, a stale value can't be reported. During a firmware reset the netdev
stays detached until ionic_restart_lif() has run ionic_lif_init(), so
ethtool can't reach ionic_get_fecparam() before then. LIF_INIT makes
firmware write the whole port status block to the host, the former
reserved byte included, and firmware that predates status.fec_type
already did that. By the time the netdev is attached again, the byte
holds what the running firmware wrote.

Thanks,
Eric
