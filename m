Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794834043;
	b=f3Wpu4NOmcRF18YKrVZhLmlVyuT5Px1EGDvFXmd4jKCsdVnZRlfcBAsdWzjI68yxAvuC
	 Zns6douxDJODbp22AQKMzYNy3V/z6MRUGquH+NRHIaYYF6e9UVlGWmNbHhRQBJ+SA7Gyf
	 /XIZ86BZD1ac8Pun4V9SMmmY8ebLYfdaF3qR0iePXWKo7WF+boMo65vwfkjS5tRddQANE
	 zhCWRtUT30c0Kw2hewUdBubOWZ6MVRgWnLxdrdFfcG9BxXGQELmHTQM6M6+hizWXx5Hcq
	 F2HjyZL5/EtRh1Rc1ySqQXMpJivcbdciQhu0jsBe5ynfNkIUHtcsNtvnW0NNkI1SGLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:User-Agent:Date:
	 Message-ID:MIME-Version:Content-Type:X-Originating-IP:
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
	bh=jDI2bQm7AtbAeYheaI5hUPueHdfimMnvSMT0CH7fLVI=;
	b=smAAWdGxt75y1XbteoMIYJwHZIUcRzqGjBpgeyT37bboaU5JC/9QqBc7HfyeId78yuiE
	 lzAMQ1chW/SpjvA/qB/vLC7cr7ak9pegrBDhXstCTub/k8R7DR/OIUmD5LC+k6KjB9c6j
	 RnbFMvd5sD/QHrBsWbdyd7Pa9IIyXeryRGJLP/xo5siqRLesquzzDNcwrBZpz8k1X7I6E
	 Sxx4DFcdnCjDt1GJUhwSq/R5ZTV0oMLtmt7Pv4JY+Z2UQSmFA8+vBDzzrRvHtdFX2yWkw
	 ugvNs9fCcpKID9Rbam9sJWevlNvclmX39GPPOyvJ3ofMiCkVWzqfbSjjMMA0T+9gtMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LrIcT+bN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.24
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6275606A336
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6275606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LrIcT+bN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/OUIczw0YcjHYT7RKfw7MRv+p6eo7QheAzqUMwLuCraXo6cRHhm5fz3NLvdqZdIHIrsodWuKQqZEiJrrI7xaVc91yntgTWWHre0Qt4GqzcVFXnyRJjLvS7bnlG4PCedMRc+5GKwdXjwE/pfW8j05GjjNB4tBjTujKTWnu7+EMU9XjEEkbcpE3Gq0R841QtwPPLH9yg160NKCNnWPQ1zugoBvsT+WyDXKPu9lwmLhHyuwzJWFoOFZQbzO/kUyGFYHWEC3xjb3IviIgrDbcTzegzDAKDHAMLSBcnS5c2hh8oHN7yZ4ZsqPHMOBhNQ5FD/mJiQoXRPwWpdwCERUqo+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDI2bQm7AtbAeYheaI5hUPueHdfimMnvSMT0CH7fLVI=;
 b=smnBfEbodyskdgYGklVc7OAfHCmRGDWmktnPxvvEVWZ2b+DvdIRQJNiuYwIQa7U4y7ctcKStsOyh0m32xmiutdALIm0XvClJE4rz8iAPorG03CZDvLKoi+4y4mELGzP+gLNTTh/D0nyyZFUKaVOnoWbK2focAT8bkdU0Xth6IuqLPeAPT4fwUyX3j57I+Sf2Wt2pOdrTtgmwEJ/OCaxDx2jODs08MYgQh+GBdv1P45WufuzMn3gJkBYFnU3aMDEE7F62d18WckrMyF1WiiidJlLWGc51frvZUKeU2uXS/UjvZkPsX8pB76d/WZc29SHL/T5/W1ALhzsjNgjJRH8ywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDI2bQm7AtbAeYheaI5hUPueHdfimMnvSMT0CH7fLVI=;
 b=LrIcT+bNhYnt5ykiN3CiRCEXTfICSi/OW8oFlcChijNsM1RHcBLbJmYkN8xwhfd48E5qKlFOMOBfBPIC1rZBcM0sZ0MhES/+SIWdH/4/WSU2f1KhymcK/BHuXkAqRg6cNMDwsbAfdHvv5yhkL0dj2RO+eg6xKKqBy6QxYaZiZzQ1OghC2p0Hgd49NoGPEf6sjVnhkXde2pklpi5VbIGxdxfjfkd7aHKTdTvtHvumrlCNgAMrUo+79UfPz4ZQ0/+f1VhY7dFyrpiP6PTPsRSDVCdc1aEq2vi6GMs0FWA7fF5dzTOHQZBLLeJe+QRo5ZfqecoYoKtbNEucOpiNRAe/MQ==
Received: from BN0PR04CA0123.namprd04.prod.outlook.com (2603:10b6:408:ed::8)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 13:00:32 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::35) by BN0PR04CA0123.outlook.office365.com
 (2603:10b6:408:ed::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 13:00:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:00:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 05:00:08 -0800
Received: from tuxedo (10.126.231.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 05:00:03 -0800
From: Petr Machata <petrm@nvidia.com>
To: <netdev-bot+sinfo@kernel.org>
CC: Petr Machata <petrm@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: Re: [PATCH net-next 0/2] mlxsw: Fix teardown order of CQ NAPI
 instances
In-Reply-To: <179482451886.3291.15742045980159368371@kernel.org> (netdev-bot's
	message of "Mon, 16 Nov 2026 10:21:58 +0000")
References: <cover.1794823524.git.petrm@nvidia.com>
	<179482451886.3291.15742045980159368371@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 16 Nov 2026 13:59:58 +0100
Message-ID: <87pkw5vsmp.fsf@pmachata.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c804a7e-a1ad-4f93-ed42-08df43e198ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022105027099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nTz+EmyeEtNMSFulsnGkrrLMXgeVrReW5KQ2t77DBC02H1irDsUyDKkXJ/Xo5o3w3DRYo1l6A02JnMpEftDjGn9uWW+aSjgbLNI3FXHEqW8eto2J++a+5bvCHK4wHYhNu+UOV65aTAEqKuO1Lyg/YA+DegDTT51xUfUGZ9uPNRi6mqj86UMaG/tCoFWtwGwxoyqDHeUH9fcwv9NkuJJQc6HLhuDq0sTKb+I+NDFdIfjMQmrhlAXqkv3ShqG8RtA7+tzKqxrJSDA7JPfaPUc2Dic6nYJ3UHgSUQyuL2i4tU6LxJqETRoBbDwRipuYOK4x6D0nBFSHjMkVcuyIPOlpNL3pgzINNy7KuQV9je1iGJO1U1HGfYc/Uxw4GDZmXCpgV3nfMj7JlA/TWHgKepye9te8n40RpAG4FUMLOVWBtrMkjo/6TEnGkufow01enJ31bQ4SMRtQMV3q/RAHbbKrzcTmYQY8yw9K0AwYHCqHNkdWBx1P6nqP88U/wqlHHIkPZ4X2Hr0f9Cqe0U7e6WhtrUMDdn+QfktuDW1/4G2hxM5vrmobr9PSmEOQPMJMPWakfReBhYZgNFMToKzgMUL5Xfl9kyXAd9knlDVh2mnb1JisUj2zEmGY/o0D1SHZsFseQi9GFVJii/lL9NsmMU9hF46KiLYgkY4AKPuGLlZBPmJOLojE7I7KFsLV/IOLgCuJxYy4aYkdkuKwcVmkinLkNA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022105027099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1+52gkPxRuFdbPAnVGAAcP0VT7HIF/wMZDALcO1ZIq8z62tb/DMioP3PqKfNdBJ7N6MCUthhYod2aC70VO9AabX91sQuYxNKzhi32VTrUcvfNR+HBKD0bWbqdusCgAZEkA7hURilzdex4FS5Q/N6mR0qCr7EnlkwfIEx3KAA2gYpwI8Z09mM0kTFUVvOTa+0b1Qn2zyYCwphTa4IY6jFaPl7AjXlAJokrpTx92F2U7oc4PW0j+XH2nePg8KkBtYJ7t4wyURtmZYQgL2UTTcRU+Si2W9cxe3q4txD+m5kuI2nR7mPrlvYMWHOVE+qX9XrC8+oGVaKtMpmH/NseRWYsUw5yuhf6QQNFWkYnDPURbScbLRnUr7yRJg9ytusnXO9x/+QZFcijRWKGakdouaAi1z+AIJGbQVvbcEnBLVjkSnGaihlRc5q+d01RcHnyFGJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:00:32.0578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c804a7e-a1ad-4f93-ed42-08df43e198ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

netdev-bot+sinfo@kernel.org writes:

> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

In Myeonghun Pak's original report, linked from patch #2 and available
online, the issue is claimed to have been discovered by static analysis.
A second report that came later does not declare the discovery method,
but given the circumstances, it is almost certainly not organic either.

We have not attempted to trigger the issue. When pointed out as such,
the code is obviously wrong.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The patches were tested across supported Spectrum machines as part of
our internal regression for about a week.
