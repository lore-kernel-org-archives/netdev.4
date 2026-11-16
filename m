Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824260;
	b=DfEMCIg/qjBN7g0AgeqsyfMJFQBAOZ62e3wIK9KvEHLRsrCqTAIjbJuGGvQdadWZ85Ti
	 wJ6rGIaRouchb7pLP31n9npKYkiPyIS24YNudaqPdyU6FrJrM2Cen9NX/R+r4r8XO9eqs
	 8HH38XM1m35AoFp6SBHolG+xEZTj1wNjf4pX5vmeIE8ekePZuEXYMDcDpzIoKN6jcc0LC
	 olHDjjK3LUReIU2CGfqrP4bNJU8I3aC54vVAejuvm+026uOW1nik35Wie2uSZqGKGZ2ky
	 Yw8wKmLObWnB/65Zp9mjzXpw8y6qewlpowNvBAMOKSCd2VKUxG1gQk9UWI89jfRR2PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824260;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=Ua2u8VOh04OjB79+soRzXzn7UnWSnFrmol4zaqkXOJE=;
	b=oPgcuCnfYtYLmtPQNVtm3Nuxmiy+oBqw/yaO1+r651WmJTAOcPJ6+FoT/5amL34wb01V
	 CmnchST3P0FBoYUmidhqLPARrIVZJGdmBp/X4Uy+GZ3zDCuKb194aafLAWu34O4e6dMcJ
	 oXR0jYjLEl3ABJ3EOhEfe4iZaMksqrlVQvrDVZvyicI4iV45PKB098NRKoyts2wkgI1gT
	 yTl/ZV4Zqv38eA/24J1oC2o2WR/tWQ+pamF4mLPrHnTnYVTXqYKd8ivnOtUNmjLqxu6PM
	 HMXB6xavY/iLi/qFEu1TYlzrlCOs7qfWQN+ke+V4Ippuq8gPnpMremWfvEh287hbyCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mh+Rrf+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.57
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FD606A880
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5FD606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mh+Rrf+H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ/c+6EXZNieA0Og+dipNIVbMhCMAy6qyjCBN7w1NeiAZIkkkRyYelC/QdVhF1IxKnVJDmWmENoNcgcivYzE81sip1LPiwuBR180vb69hZrvBhpUaqGnP41PNdVkYwiJU1IQGhOqwQmJWT1mXiMAkYFhr3ymIj0iPxXYdKx6JBJGEZwyZeaZknq+0Yod4zBSscCJJuxxEQlYtRqihUHLz6QoEwVF8xPTwlYL7MTgb5sNbkfQOZcl19v7k0QKBB8YZ4CValkwi7CRBPsPX+W4BsVTIEYycsithzuB+mro/YnVCmP1dZhcqNFrfqRJrnhR1myvhmJbFLuXGTBDjmEH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua2u8VOh04OjB79+soRzXzn7UnWSnFrmol4zaqkXOJE=;
 b=xdsf27RSCESD1225cnptDbiODXfYmsuofnM4gdeRtiL64JpALUCy9ysHGXro1BvZS3TsMndW3jeFpNyUO+HzyihbVaIpz68PCDlzyG+RWRXQrejQndoSUVG3LWKv5dc6jkiDG/RuU1DAQl4oSGL5rA3TytaS/IDgjGrqoB8qcxe2Zg+yszFYRjOeGw561oIpM8hFFgfYep5rIGQHM0qqZG/uTBFBg2RHNO1K3K595USxC+kW8UkvnePVxhCsYRLyeXrrEWg3jO8UNUcvSZE/1wn/I3PyDm9R33RreouOnXiPDw1s5tve1/EP4VhW8xWuN4aP0INlDbubxJldd/yGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua2u8VOh04OjB79+soRzXzn7UnWSnFrmol4zaqkXOJE=;
 b=mh+Rrf+HrpGi+IuYl2JcRMlmxd5kSZLn2EU0cUmZ7o1qhWVhJ+oC92iMBwIQRqllJSUDGTNjL7DhIFGX8OygxzQJ2upEkhW+Gnh5k1JkxkUpzGaXdfPj/ZETb1dldHdn4Y2D2dW5qrONC638tmbnxLXxT8qhOr/6FxmTsfpQNRzLHZEXz6OvWzkgc6k98Sw4yU+AbIsxXc/jLTwp8UvqDgyae09NlHrdBBWF29ixODmwhCU/OnprM18AyIfNiFZshETbME925eTcNapvLZm3FNWDAC5+hA8toCY3RxrNyW0IYQkXtV1hfP9upZ83dlCXL1pPLU/MmcoQliPbcjHu0w==
Received: from DS7PR03CA0327.namprd03.prod.outlook.com (2603:10b6:8:2b::35) by
 PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.10; Mon, 16 Nov 2026 10:17:36 +0000
Received: from CY5PEPF00000E74.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::39) by DS7PR03CA0327.outlook.office365.com
 (2603:10b6:8:2b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:17:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY5PEPF00000E74.mail.protection.outlook.com (10.167.247.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 10:17:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 02:17:20 -0800
Received: from tuxedo.docsis.vodafone.cz (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 02:17:16 -0800
From: Petr Machata <petrm@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: [PATCH net-next 0/2] mlxsw: Fix teardown order of CQ NAPI instances
Date: Mon, 16 Nov 2026 11:16:45 +0100
Message-ID: <cover.1794823524.git.petrm@nvidia.com>
X-Mailer: git-send-email 2.56.1
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E74:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 320403cc-5d20-4f74-4a0c-08df43cad51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|5023799004|11063799006|56012099006|261021121427099003|261021135927099003|261021130227099003|261021123027099003|261026140227099003|261009223027099003|261102123227099003|261026130827099003|261022105027099003|261022115727099003|261022113327099003|261026121527099003|261022075727099003|261028144727099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bFxd2YhLk3m+ty6IxFflAnLnOT0YB5S0C2Kh5Ie6thxX5hZB0jUuqRJgOwwnNYXKlQZbyJXF/49hKkZmlQDyL8lQr78y2o3UfaDYxp5gC/CN3yHD0EYaXDJHUbt7EHHlY1aTCT7jKzUTNq+ST0V+J2ZbCLmGSxoRyTtjYAgXUph5fdQd8NP/9kMU/XHtAMATSXpSYVHjD+vvu3pNE+J7wshhr+5YoILNb8PPGL1zIc2gOTjmmHm3yS8/Olmd5YHn0WQ/q5+jWu6gU5fJ3hi4jMncRaO7SSzbhjsdl8JKhz0Q6WwToWrqmPD8OEj7OffR63/M9NQnsDb+B7MQ9eMmyATKUqBgQ+xkz1CU5bGuHN79uZCeGk4h510XeDYa4M4HNVR+OJdQDbRKqohRxR5f4RpgOTE8pypdlubok+zgJRE54k9TfND01bAELEyiDKUSKKMZnasggnQ7MpCoi/lTh6DmFbxo9ufz2JbPi7iN1FMjAV1fCZZBU72FZZhW9+Q1wZlDP6J4C0S2PtSebiv6o8rhwRv6XrKXSmyIsM9CrAZQlV14RZOxe7VREbQPVcYvQYKyIyjyMTe1HMY4foqVIu9hr0Q0sjZZ6KCAIn5vxAPZRB3l/Abf+uvfg2Fyd+xphp8r5xIcnKzvsbeCmUDl9E/U0MOUhdDTub6Hi5axEwcVO/qqzTzGMHCS21RU4kA1N5U4QWhDrHFOuPOdQoUdgQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261021130227099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261026130827099003)(261022105027099003)(261022115727099003)(261022113327099003)(261026121527099003)(261022075727099003)(261028144727099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vgPDG/+z+D0U7jGG0razp2D3N/L7GjslNtsz+bp7+ehYv/zh3ImHyWSlbf0wFuj1gwiovFTXiUVhQriUfZ3J4c/qZYOK9GhR9eVvXqyoMVn88xJGpABcVtTlHVPenhQzy5YbYNyMLfXMtA3PWO+lgntXMrkqZ0T/Z7l9a3mlDCftpLLZnnjwFQWjnl0x8z5LicngCsNN2TBr4eTcl2FA0opw6peoL7FQsy53edSbb+8/QmcFAlknCFUbdjQza/lfLZ8v2vcvGYKkVDcsxdq0oxp9hZ8te/5KYnnD6VhilcBXvF7ij2sAnjqIr/IzG0AaUkPtADzG4YMA447ZiyZrev4s1T1MVxXkf4myQW+Y3vB4faY8xtu9ejAHVqeXZfJFkibOj+KAk0V1wSi8k66bJVbngGVoWSv7l+tkKlQhwIsmN6nT/+YolRSlsoQK62mD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:17:34.6728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320403cc-5d20-4f74-4a0c-08df43cad51c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

There are the following principal objects for processing of hardware
events: event queue (EQ), completion queues (CQ), and receive and send
queues (RDQ, SDQ). RDQ and SDQ are then configured with a CQ to which
they report completion, and CQ is configured with an EQ, to which it
reports completion events. The order of configuration is therefore EQ,
then CQs, then RDQs and SDQs.

Further, there are NAPI contexts for processing CQ events and working
with either RDQ, or SDQ, a tasklet for processing EQ and scheduling
per-CQ NAPI contexts, and an IRQ handler that schedules the tasklet.
The order of configuration thus must be, first the NAPI contexts
(associated with CQs), then the tasklet (associated with the EQ), then
the IRQ handler.

The code however initializes the queue together with the scheduled
entity that processes that queue, in order of the queue configuration.
Thus is the tasklet initialized prior to NAPI contexts, even though it
refers to these NAPIs. This is actually a problem during destruction,
when the tasklet is destroyed after the queues that it refers to, and
SDQ and RDQ are destroyed prior to the respective NAPI context that
they are processed by.

IRQ handler is then set up as first, and torn down as last, which
is correct.

In this patchset address the ordering issue as follows.

- Patch #1 folds the current tasklet processing directly into the IRQ
  handler. This is possible, because the amount of work is relatively
  small and strictly bounded. The heavy lifting is done in NAPI queues
  scheduled from this code, and the indirection through tasklet does
  not bring much. The reason to actually do it is because it
  simplifies the whole situation, and because the tasklet interface is
  deprecated (see include/linux/interrupt.h).

- In patch #2, per-queue start and stop callbacks are introduced.
  These are invoked after the queues themselves are initialized (and,
  respectively, before they are deinitialized), and are used to set up
  the NAPI context after all relevant resources are ready, and to tear
  them down first before tearing down the resources they consume.

Petr Machata (2):
  mlxsw: pci: Process EQ in the IRQ handler instead of a tasklet
  mlxsw: pci: Fix teardown order of CQ NAPI instances

 drivers/net/ethernet/mellanox/mlxsw/pci.c | 77 ++++++++++++++++-------
 1 file changed, 55 insertions(+), 22 deletions(-)

-- 
2.56.1

