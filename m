Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794871222;
	b=GJAaLZLTFLNXKRG5+ufIMSZpyobJSxaie2dc+PAVH4LzfW/viGRgQDj0XXIrlMhxPjCK
	 krK8Rg6Cjjmkd6m6IvcS5L5PyJinRFsFbD1HpYLbg1JI6tm4GfYNFdwgdF7swBdWJH4K+
	 bg0fWJELrggAzYpDvqDG+H4ZnnHUrHsF3kYzeAHwzyFdbw0koT3DGaW5kzxg3Jpi7d5Qp
	 BxTuWd9VpjdNk47C/7hofvp45UOJiZRNTuLBPn4wBOxtkBmS/v4cND8GGp16zjh14TVYS
	 naM5La707SQGKLfHUgqrdQwHGxm3vGIJz1e7fierivvcI7qJR22dv0xxGJQQvOH4L2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871222;
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
	bh=YuDJKCsxusChRCRX/4DyfaktoKQzguqHaIICgCLaQvA=;
	b=BtO5tIbMcHZXQzvnfxEC3vt2qTJCQHK4r7GeDD/kdskE/ix0ZOeseGj5f3wmreVSSiB1
	 By5uTc7+nav8pIfDnh1plvQ7pD1f2lFYI2ExVAqcZ1yUhORAP+JF6xCxIX6tpdUpqlYpw
	 MHeNiqfxntS+fRqtkPqOr4K5CJwuEL8AC/RsRizdmuJ3jUIoA9tbuR9KLXOxf9p6tOGNh
	 k41zPoSlm8NBJVpbObcTRTcl0qicEXR2qzBfXloR2lNFertZBedA+C6XnLGUpggKnbV73
	 U0a2N4AnUWOBa5srZmChPTS7GeDaTZYosl3rMJSRafAVlrQ/3iJOaJAGh9WMsiHvoIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=34IzCaz+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.24
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE0606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=34IzCaz+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjrArKHBNMFruumSCU04nxOivJWaMt0UnVJsmI0KEdR56MQYDH62Abintk+PZ/K5Z6uwqVh2R+eVK+WPRnD/1x62o/f00I+Rj73xZU8+bAkYgIuUONMoTXzoWM6pEDx9kj54xmpZ4NCANyG3/WvckKJiMmXi1Jxa+c8pCAl/0sbzIoWxFkPewu5eejhd5Yh3Visq9dQ4hpGwP/h8M2kRbG7d1OcumLXo7U6q3dUYu32q6vEkRKtH6aJpUVYjSWhskO3pshTqoxs6fgy94KZh+ii3wo5h83LwmKxoxm8Nx8WdivrISMNQxCh4SnrCINcVJ7cGniGgdd026rDXWGZ5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuDJKCsxusChRCRX/4DyfaktoKQzguqHaIICgCLaQvA=;
 b=Xz9z5hWLNBbUHKKylkeDgTzL+W47MHPNjt6quxwUPCqmcmEKbAAbhuEHXqU78rScJYs1AhBiXUZQ+pecgW+zWGC+CB2voqGtHGdt9T/gemakliF6VGqjwvq+hpbRGOk0pTvz/4pUFS1R6zUKOJh7TKZc5WZH7GKt92cM8hFGkjXq9bsWizKIqUE8mktJf41eYXv23q87KexElorsfz8BXZ04sy3xeh/6P6uq6vBXU8rLnvPmKW7a0Hmd5d1Vez64/h6AxHnxJyk7hUI13zygdGDTIyl6zO41gtCBhNhdFBZFs7v+BpY4y4fhFWjoJp9CpJiqoeaFYlo6cVMgMeXgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuDJKCsxusChRCRX/4DyfaktoKQzguqHaIICgCLaQvA=;
 b=34IzCaz+YL18xp8MR0enxQd8LVgcMICX40Z8YM8r5ZvctGJm3GgA01U6kf0pkiatDOJ5pxFpphvH03U9/vDA16sMsA5Ulckkxe7eylidvHtItrPxMWzRvsXA3zXDsrpl3dcMTLdX5VyMqvd0bl7oNQQbDqm3Yc8/8IQRDJDKZGI=
Received: from PH7P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::9)
 by IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:20:18 +0000
Received: from PH2PEPF00048914.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::8c) by PH7P220CA0017.outlook.office365.com
 (2603:10b6:510:326::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 23:20:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH2PEPF00048914.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:20:17 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:20:13 -0600
From: Eric Joyner <eric.joyner@amd.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Eric Joyner <eric.joyner@amd.com>, <netdev@vger.kernel.org>,
	<brett.creeley@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<pabeni@redhat.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
	<nikhil.rao@amd.com>, <edumazet@kernel.org>
Subject: Re: [PATCH net-next v3 4/5] ionic: report the operational FEC mode  from ethtool --show-fec
Date: Mon, 16 Nov 2026 15:19:59 -0800
Message-ID: <20261116232001.2453595-2-eric.joyner@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110212623.2294818-1-kuba@kernel.org>
References: <20261104-ionic-get-fec-stats-v3-4-b261fd53d0a7@amd.com>  <20261110212623.2294818-1-kuba@kernel.org>
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
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048914:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d1cdfc-6c16-430f-2029-08df44382d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|13003099007|261022113327099003|261021135927099003|261022075727099003|261026121527099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	55PUTl52Z3OxDadSS9ULpe9/B+bexcAfdEsfKVI/aQofrHXNgYqjB2xBLYH6NiZmiaaEYOW2KPJvs1ObJkHvm3ePubQOfYjytCl2dKm7d9fRYqZ7ToxbpdEqSdUUr8YimUzTvon2JApXp+jPJnoo9aQDOCirExS2xl8uiTe4nPQc66qWeEqiNCUrWXryNTdzuWODlQUxcMujCob9S9YahPHM3a2tIGDC/VhhX1poj08ZvOph4ZCldlKFORjfDskd82bbz+iyclQXGoYYp9SBHeMuQN6A0CiNiX6jFrWlas9ZHIv3+sFATueexkzeMrB9XNYM2w8tugPslYzwDXoAz3AMa4QrIqiZOing7IVCwKFTy0w//cAwLws6zGwaGjVypspPvxWTHYIMvGc2YarjCWUgljk5xMt1aC8ULYeKuKwdy7m0CI36J7nTfZBI/XTKr5U3o3uJcp3y96s4pqK1vXKOagXmaL53zgkHtYv6p/KI3QqCbpch7eYjdlIR0O1hx9Qr+4DT5nWgOmJ7DAuhBcVtTsWPuz9AsG3+dW6CfoKAhk0fIJmYexMpwtdpUXXuvQuFhGGLQgTCpDOxtaI6pz27wu7/k4AG+NbQRJU6W7m79XY/4Gd4GauTSH+NLNoWO+sHfuC29FQJcNCritK/Yg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(13003099007)(261022113327099003)(261021135927099003)(261022075727099003)(261026121527099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CNkW3mTTjmMqT7A2hLET8dFw7fBo1ter+LsG2mZz0KF/vLV6hHx/udXJPTBe89oL/47D9zgA+T0h+SOriDFHPQk4tcMYqaZnwFbgSZqyu8PajUzsFDOgwBGDA0+eeqsgS1xVM3xn2t/n6cf7382xR75c7YcTqfoCn8JHeBHiL60OTeuvJkX0uBnnbVuHnIoDSc3PqIXRiGVAmaMNfHyfioYYL2hZdvCQVtYG33+vBxd1BepVkFFrpwO1wH4oq0rBG026wM+Syf++1Wi0WMuZXcEUGOIIIahzTqk0OsVbQlAssUboHlr4bZA+FA9xxksZ9mNT1NQtEwtDWHYffIrsCw0XEfDqbNXuH9yDup34PYNPvfBSo4QRMhYVaMpBriP3KTZ6TZ+thbfil3WhrG/TlyWjBFOzHkTvQFzy8WiH/pIKhxucSZ2zAIZ1+Flom0hV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:20:17.6534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d1cdfc-6c16-430f-2029-08df44382d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048914.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494

On Tue, 10 Nov 2026 13:26:23 -0800 Jakub Kicinski wrote:=0D
> This isn't a bug, but should this have a Fixes: tag? Reporting=0D
> config.fec_type as active_fec goes back to commit e95f922f4c2f ("ionic:=0D
> implement ethtool set-fec").=0D
=0D
Yes, v4 adds the Fixes: tag.=0D
=0D
> Could active_fec fall back to config.fec_type when !config.an_enable, and=
=0D
> use status.fec_type only on autoneg links? New firmware would give the=0D
> same answer, and on old firmware the wrong answer would be limited to=0D
> autoneg links.=0D
=0D
Yes, v4 does that. The .get_fec_stats handler uses the same check, so the=0D
statistics follow the same active FEC mode that --show-fec reports.=0D
=0D
v4: https://lore.kernel.org/r/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e8=
7@amd.com=0D
=0D
Thanks,=0D
Eric=0D
