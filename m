Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795056967;
	b=DCz0vkn6cct3VNylUh2lIk6uHL/e+Cr13JnEkBc+OMbJDxaWxiNO/Ty7NacBynCQ5R6j
	 Yq+QdNn33LWkM/EE2uocJkNHIuiUGbO6zrXUOfSD0o7XHGwkOh6OOr9kgHC0LKeO+FSKZ
	 lpxc078VZsLKYomjTIUFsqO2YUKElSmd/XYpj0ieCyNMaMy5wORSv9qalVoKRU61RQaDb
	 Po1+VY42CQlkNN6CNV1hsDYEX7nKpi5dize4iUBLZ8PzBdzK6JUzcOY+npPiYeo9m5gCm
	 Jh2KsGzJbMbRqFta11pnxwhLtJA8DQksc1wbC2x6K4bW0jKIfx+WBOyfoeuy/fZb2xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056967;
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
	bh=QP5ShPgRO7IWGMMo024z18F/BLtIEyxjExhsDUKZXu8=;
	b=m/1XkddZsZYbmzGhhk0ArFeZ85dkMEoxmSMg+2+SaOpIuWIyQyzc9Onh+Uz2/8L1wvMO
	 PzpH38ekfgMEjD7qYuLpgUfwVaGAfuMGb0+UdJrtBYM3RBmeXKBG9D81ANIostP0K/3+i
	 cyykD8bCkS7QGdbrPyWpuD1yACgp8P5IZOj+rptGzoopUmc/N7Ez6id3MdCRA6dXDuhu3
	 rv2fhGKeSXWlwvXuFwEY4MD/orST9UGs3Ib+yA+P89zZexDx7K5grkY3hOreZeb9JBU7j
	 nr7nkH1q1fou329KBmFX7kjlE8siuks4jHYWuVUauHquVJElgC/QeGh3EAkokZqJnkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yV4LIUEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.31
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA8606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yV4LIUEc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWBFynqbWilFXulAyNL14DU3l/EIschJoCPD16uwR10iG166S2FqeJTwNQy5nafB34vL/oza6L5C+wcnF2ANf0oWXE6hRUsJZ+QMVSkfZAfj3uZG+3q+kIbvh19Ze8RHC1K51MSCdlhJbVtVUEN0zJBkhFMnUTxygYolngSlUR60lcXEnamEofiDP7vwTIkQDdcATC3SaavWfM9zKB5upDqfd6bssR9PY81aYjAxVqoJf05lxC1a0T75CWdAnkSR4Rta8E6XMN0kZpk2cnfJiia95ycUXRDFJtm0met+igWqlxqJg7rZlKoi+bl9OlDImBBgW4/xNUtkSL9nhMEeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP5ShPgRO7IWGMMo024z18F/BLtIEyxjExhsDUKZXu8=;
 b=kQ6hvLVoGEUwPpklOQbha2GVDmBVjVmGIzv8xKELzpLqfMsSMCFUHsd34c+JZyUtIJVkz7SW4mqXCRwPe35oPF5Smb1QfpqR2hD9xP7OoCOYj/EBmPxvp/iEK0MWP6W0+3HLrl7ijvh2JEYMi5UyQyaTX5C9I3gkceFXvdKQ+fMGONBzwkeLQvXeK4MeBXBD8r+wi22cDOhtRJKbJgH6WhurOhXnCNlCcor18IQOPmYjsbXMC+FxyFn54F9qEkHyBsSV6IVnOjGVQyAy7AfewYVErjyD2K5Mgyip2kLfASR7zCGRYwukqw/0Okv9+S32LkjqaoxIDxUFxoZm0cG8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP5ShPgRO7IWGMMo024z18F/BLtIEyxjExhsDUKZXu8=;
 b=yV4LIUEc6xPZ/mR3NhjEZwQBS1uV4S0mAXTNA2hCFO3zdv69yZEMhmk3vC5fhsVA+AGmwWkJitbGtJ5Gr3cRYm+DuGIbHAriheYejEjo0EyuhjeeX/FJay8oZilsSvBj1Imni32bedZu3PN2zOTfLVNnzQ8ZsuqndYTSjywrbGw=
Received: from BN9PR03CA0483.namprd03.prod.outlook.com (2603:10b6:408:130::8)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 02:56:02 +0000
Received: from BN3PEPF00022BBA.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::52) by BN9PR03CA0483.outlook.office365.com
 (2603:10b6:408:130::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 02:56:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBA.mail.protection.outlook.com (10.167.248.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 02:56:02 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:55:59 -0600
From: Eric Joyner <eric.joyner@amd.com>
To: <netdev-bot+sashiko@kernel.org>
CC: Eric Joyner <eric.joyner@amd.com>, <netdev@vger.kernel.org>,
	<brett.creeley@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
	<vadim.fedorenko@linux.dev>, <nikhil.rao@amd.com>, <edumazet@kernel.org>
Subject: Re: [PATCH net-next v4 2/6] ionic: report FEC off as a supported link mode
Date: Wed, 18 Nov 2026 18:54:46 -0800
Message-ID: <20261119025548.53327-1-eric.joyner@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179495702693.3136.14857089621112634448@kernel.org>
References: <20261116-ionic-get-fec-stats-v4-2-d25cae9f1e87@amd.com> <179495702693.3136.14857089621112634448@kernel.org>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBA:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b50d494-28eb-472f-6f98-08df45e8a57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|11063799006|56012099006|4143699003|22082099003|18002099003|10067099003|261022105027099003|261021135927099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	UYjI+iFhXQIW0W+IzCtSeJb3OYZX3qZQi/wAHaIYhOKKddN+6p56tIED0VoLTmBI9AGqLywI9FfltgZfJzQKslxMsOD/BypYtLMvzZk61E27NTK2fDJHPLyuqR4of+KXYNRV3fEBMrFz41x5Dhv4TfL/lM07rgIFbfee9Zld2gtf854hgKwz8Vu20r9HphWuhjf+LFxDj+tUseIpMDllYhZq0t2Cx1TjSqmfZZYKjHKxAFaz07bEfY465OpKiyTOTaYcZlJ4keBFYt9tL86zQbKNorLlSacoMhOBwcZGeSD1hIOOZGL5k7sIsTzVB08r06y5wSMmm3jkpdcng5gIkaKDTOv7FCcbxsaHuX5yPqZm1uujKezsxlBpxpV/MMUKi9rzebdl6KtUoKOBxfxWUyST72kLHUG9Io5uVrzaINhbm/m/FPPyWanZ1dhsISNFbUjls8Ynv1iBzfPwEZy6+UgSroiNm+AiMgN67w1rpwfhaiGKhuGcF8UCNqSbXpv24WctFjzADgNHL6LcBKzNZD2GjMYgI4ps9rpBq3+ddtXrSFXNiSAVA2WMt2ynhPLpV1csiXAhhisYAl9VSXOj8P3ZV+VleZwrAgl702sJ6oIeE9FTSHlKeVwXzZt2yHhBXEHLNNxK/ylpeNGRdcjyT6QNMFaTX2Yed1mnYied4308mv+eQO4MAfHDXRrz34lvKhAPjCHIQzudMH4fFN7lLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003)(261022105027099003)(261021135927099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WW54hqklTrlNlJdHYzhoRXnZwzwjM+YMXsUrmHTltJCmj1WFaXO7OiCj/VtnN2QMgl8i/1m/B8OD4xVcqHdkKJDO416xmuZs0Tb37mJi/skNoGbDd08BmxwJhtzC09vwFInnEc2RYKPYMRhFkd7DdxDKh54ukmqqb/0YkcFVFr+YwTEoiW8TXSyJPO9rFC8yoY5ZrCBOiLGECO8FK8CDL1GnhKWszcRoVKdSZTe4tIiQIWcYVMHXQTP/glIl/dWIM0sAQ1jfv1ymGa2VOKjEUP11N0R5WqGShSroA3ON8k9BcVBPQsvJjtg9wmZT1omM2cX3xiD1ENnXEJYRdS50ob+QAIqh6rrc0C225uFY4SdcUSdKFtfya279pYKND4KVI2XPB7XnLsoCo/J91BwQYzFjPP2UpQLz3bypi7npT7CJHIrFq5Zg/e3vY8RTFcfo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:02.0445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b50d494-28eb-472f-6f98-08df45e8a57a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652

On Tue, 17 Nov 2026 23:10:26 +0000 netdev-bot+sashiko@kernel.org wrote:
> Is the claim in this comment accurate? The firmware ABI in ionic_if.h
> seems to define a per-port list of supported FEC types:
[...]
> If firmware fills identity.fec_type[], could the supported FEC set be
> built from it instead of extending the hardcoded list?

Firmware does not fill it. The port identify handler zeroes the identity
and sets only the port type and config, which is why the driver never
reads fec_type[].

> If firmware does not fill it, should the comment say that the field
> exists but is not populated? As written, the comment contradicts the
> documented ABI.

Fair point. v5 rewords the comment and the commit message to say that
the field exists but firmware leaves it unset.

> There is also another way to tell the parts apart. The driver already
> reads dev_info.asic_type in ionic_init_devinfo(), and
> ionic_doorbell_wa() uses it for per-ASIC behaviour. Could asic_type be
> used to leave FEC_NONE out on parts whose firmware rejects FEC off?

Whether FEC off is accepted is decided by firmware, and keying it on
asic_type would hardcode that firmware policy in the driver. The list
already includes BaseR and RS on every port, whatever its speed, and
firmware rejects a mode a port cannot run, so FEC off follows the same
rule.

Thanks,
Eric

pw-bot: cr
