Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795207436;
	b=Ax9HD5M+gF9477SlZ3fvi0WBfanyyotrF4VsRKlijRBQBJ50K4GJYmG42VUjEgiGE65v
	 31PXTowKuTXo4my9wCLGSnHQLQ5A+ecjaB10QnJYc+Se+8VeTLv/WUK6Oo47LFJq1oXSL
	 yk+dKgwdzKYyTZ4s1zZ8fxdrcKZvHpcnuay1fZ9YIV4IA8Yqitf2gFu7BrT22K+rDo4Ke
	 H1QUEhMdLbcwp3U64LRxUeGuiNcbkTpohOcfzDyF+Kqq5/IkXuOL0jbEqvLS3lG1AglTQ
	 OkQ1b3jasG+LrGtZ5HdMb74hbUrCkbnAlrU+9/dF4Wn/aEr6CCjtvoRSJ2x5PTTQW1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207436;
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
	bh=oO0G9k5wxWJ9EMmTUsO1ytQSk7ouBp1mqeB7r7E2dqo=;
	b=KcEy3aZnmv02nQA/HD1VgyM0cVfQQdbT8z6c3tHfmKTfhdxLKPuhePpML8ioZhfP8BK7
	 sgIbmWCNU44MROldd27ucwf/jjiSJwI57ixR9kB7wxGsSAF4XtCElTPiCnm9oixNu6jqc
	 TyWLG9lrRqDL/TYwhp1oSfY4Jx+P4N5O3Y/9Hy9luEqALBgfffwX60jrBFSAdyyK2W1XH
	 bzpmDtCwND3d3O51DFwm2UM+HTb6/CA31u/EJpm8ZgKjBX1cEx9AgmXbRrHyUkXbndfvU
	 LwYbherHcKnA6TBi3V9P87QBMfWfpz0POiBTmOl2RC2Q/tvw5z3RnUpKynw3c4o12wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkzdXZyl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.44
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1811606B714;
	Fri, 20 Nov 2026 20:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1811606B714
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkzdXZyl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpfX0sJzjCMUx3sUQ8vNhmlm5gsP8J3wxD561NoJbj1cL8hxFGvlo/du4HU2WYXkIJw8kdm1pIF28mPkmKDVEuuobhxNX/WExrBrHZ643d62Mw73PQlz7PZ67GoskvdNBJy/9QTQusp9xpp6MdMT9aJ2XzmaMliGUhjsUTp7MEMhoqoq7Zkbdyiai1DxGQ90MOEAxKIxCNXdhw8Cq4bV/gfG0XDLI2vF0C31MyYWY2vv4YPTj48+yfItCx+C3rvnJmISgAloz2WfbpnDBtvWvz13WnCJLd2/Xy6bYRcvHnpDCkRdiSO0EtnGBz5SLrOAL0xV2c2C7yDyoJKv0N+/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO0G9k5wxWJ9EMmTUsO1ytQSk7ouBp1mqeB7r7E2dqo=;
 b=R2sVXIYKt0bSOR+4O5mAkBdJBs7oWL0QuvqxxJKGxQLPIt5t1s3512ZN1HB7/dJTxKh+SeewBKoJucptNIsLfQCtcUrWS5wgr7U/mOwUGcvcSUdGTOQ1STa6GwIZTaZ+T7XkkWyIFzW3KgxhAKwRjaVxCUcJaPhCf0Evrsh9JT4TZ0GTi8kBOjD86uEez8xuR0wcQwmHPPyhlRrsEvUK1UQC4IOHhxXs6Cn7Ap/T+Llc/OMi5y6pf5P5uq+OX1I9S5UtLMmul/Cz11W9q3uxgYnWH9VtVJDpv0vchx3YQ04EE+Mv5deQv5bh4mYba6R9etj5LBLm9JCy9s74KMznoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0G9k5wxWJ9EMmTUsO1ytQSk7ouBp1mqeB7r7E2dqo=;
 b=MkzdXZylM6Qg6Y/maovi/XFntC5HwXD4HoPR4+PHHFcOMGtpkXwWL1HADRr4smU0bT/xJ6wgZrLbI3Wpir7/5yAR/vHmpTHGjogibWHYS7JlmyjaHbC0SIbM2Pr3/O/N51nmpudR/aoTndjNx4SdMfXQAQsIJ4JCDr8djvwdK1I+yPtLFWEXHjQFREBwipca+B903wgV0uWJrABA6NyJ/LWprrNnTMNmCvYTvAUmbNDTKv3+i9C9jVb5MWnd30ZVjDu1uc4ccZQGMtkq/+DTmbPGWB+jaVfq/SeDIuHCvU52QmHQXWs2fc6ToZm2z5fjnwtxY8p3x5aFByeElbsnyA==
Received: from BN1PR14CA0005.namprd14.prod.outlook.com (2603:10b6:408:e3::10)
 by CH3PR12MB190143.namprd12.prod.outlook.com (2603:10b6:610:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:43:53 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::7e) by BN1PR14CA0005.outlook.office365.com
 (2603:10b6:408:e3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 20:43:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 20:43:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:43:28 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:43:26 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev-bot+sinfo@kernel.org>
CC: <andrew+netdev@lunn.ch>, <cbabroski@nvidia.com>, <davem@davemloft.net>,
	<davthompson@nvidia.com>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>
Subject: Re: [PATCH net-next v1 0/2] mlxbf_gige: disable MAC after panic
Date: Fri, 20 Nov 2026 15:43:09 -0500
Message-ID: <20261120204309.587701-1-cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179520642352.3294.1018427060462107443@kernel.org>
References: <179520642352.3294.1018427060462107443@kernel.org>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|CH3PR12MB190143:EE_
X-MS-Office365-Filtering-Correlation-Id: d57bc1a5-314f-4c06-5a89-08df4746fd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261102123227099003|261026140227099003|5023799004|11063799006|261022105027099003|261021121427099003|261021135927099003|261022075727099003|56012099006|261026121527099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DKXhXZ1djfxK0YGmg9cfHVemTaM8SHpHfT18en6SsoKwiLIvk2eWGhrgu7zZRsBbWnOrdHc+/TNpwLVSrXXGgS8znbkW473OZfOM+Vi8HgEFeNOGBhXrSEQu8tq4jjYh2oQvsJUkGK7CAiULI4VMud5Uk9Xc4uaG2cseHqmkFFRknDtYRo6DZ3bEQYqhAKCfoFqYiD1DM0OQWoWqe6zLudcy2AawxRlsXr+zmqLZn02BlrP3nWudd+gbRdQoOQ9b9ZFZp8Slum6hUYPu2WcHIzZKCPfUw4y3EZ2/sk3BsCyU4nFivhasgZTC0QEKFwLh4RS5/ACBziGtJvUXeF8Cx5+eczJKA+OBmUYJS0C9iUFSMpTaODD4DbP8i+cc/C1G6SdWlwPx09AZePwDfa2/ZC174bwt2fOyBsq9YHE5aUWPiGCMS9z6jnpuYs1K4sfR3xQ4fd89CsKEj9N8ICQRGxU8Fs/KR8i8azEmbdXMt+HLQU7iFOIJfpyQ/TqR4k2L+v51Blw2AQ/QawzNsncaog2HHk2I4BsgdxrxQ2nvQT4mb7pcoOyZ4ZRpRK14BoNt9q94NSYc/Z9GsaQ5eCMlGHojVz/RiKkRTUGX/uQNiWqpWg0AWW4/TiT/glgEzMignXC71gEiiM8JsRAc0EQbLyQ4jhkyqEgfFEwC8NU1hh4On2ku+Kzss5LPql1mpZhG/1gGdZlAgiyPCB5jb6iHLA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261102123227099003)(261026140227099003)(5023799004)(11063799006)(261022105027099003)(261021121427099003)(261021135927099003)(261022075727099003)(56012099006)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	boyNZQJVTmnkRamo9SSop6Dj3ZrVYBffgiS7nJkeehk4onheXfbAoL7EWVAW9pC0skJw7eTUa7B3cl4Onr2B70t2hnGU07bQkKXz1jSbvEFG8DYdqgRUnNG6DYPhtwADTy7sF2XJf+3Gy2bJRFay1PW7ikqwTs6bXZO+2nJDQuXCEk+wraqcW8SjFar/JJYBq42r4elXJHWQUeLz7CTvBIdmjMyVR4AQiSqou/CcafQVDbkX3hCOB13L44WaS65ngWLCoq/bXPU6sWTS0gMRirSUuAvT+c/94rBKvcuS+OlK5yDHO0TgY/vrXVw+g6jlXAIvfazp6TmXEiXCjHUoUw9QrcfBq7sjeXtPLvGIc+UEzejyRJy52huhGI7YfMfg82hEGoi8Ap0g9y/u+XR0d5F0rvtLIzeA2blQgBpFS5YjSuKJISMk7mL9Cia/HEmq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:43:53.0903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d57bc1a5-314f-4c06-5a89-08df4746fd48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB190143

> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This is a theoretical issue that has not yet been seen in production. It
can, however, be reproduced manually. It was found because we hit a
similar issue in production last year that caused OOB network traffic to
stop when our UEFI FW could not process packets fast enough during HTTP
boot to keep the RX FIFO drained (see cover letter for more background
about how this affects the network).

After fixing the FW to prevent that case from occurring, we decided it
would be good to add protection to our kernel driver to ensure that a
kernel panic does not leave the OOB MAC in a state where the RX FIFO can
continue to fill while nothing can drain it.

Chris

