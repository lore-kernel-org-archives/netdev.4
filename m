Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795096947;
	b=WjmaBtRLuWwavP492+DEf1xy60nw41708sqmPYMQad/q1K16ltVdM1tsRosaonQCCG6H
	 PDsAx/kLloqqTsG1Ib6/gvZGkl00W/XkaJN4xOMcc2WNRcB8MBU4ZJhWl0+pY+FtZMi+k
	 VqhXCNJMY+p5pc8WY2hSzjCq8E0lvM2B7Eu/PyvNoJPRM2qAwpLtY+LvWovddzmdSNAU9
	 uLY2dSkFCjF/qthq4xYILF6lP9LxOCl9R9EUHi8smvNnNoPHT2GuLGOyOLJ49YEWJEyy0
	 gX/no0gDzyUken/vi7tDH2PlDtlbrvQBk1dASdGBssNa7LvC3gHu3HbH3rGHEDizCmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096947;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=Nu1sZkFG3ySZztgWSOZ7h1GKLNn5RQV39RDCGDJxWTw=;
	b=LYXFyUnQP3oX8mH7xTjnFGpEPl9/836tNx8aDtLSeCy0xsIXCHb9wkn6a/rFfAAJk71z
	 Y5qy1C7+FEr1Gjf6gxc2BHLiBvbTBtooOmgNIz3hjiSChWPNTgb6r27emBi9027bjK7xL
	 BwoAW0g7/2nwJKnThGR0tOWBlBTX8atv4kBrQ1aXxqH78dp9NwDq2JoSCSLr0uXhHj5bV
	 bzg7pcItV1LuprybOp5+2feghlzGGK2SJ/BWQRgkLgAuhK6Y+aasjJ65HY6mzA2PfeRFp
	 pJjN842oc1tSJA/h1hzL/FWEmXCN6zEA2tpepyZesixfhVOoSIN9/DerH1YPQuv2ebA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=JXOq0H3Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.110
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022110.outbound.protection.outlook.com [40.107.193.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2603D606A326;
	Thu, 19 Nov 2026 14:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2603D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=JXOq0H3Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cprYSFlf+nY6xxPwigjU1Jk8rpcYyyg1dDUUVFQwzZ6NiuXUVWw0ovnv+2PAAW6j+MBMsXY3B1AXy/yB81HxeWD3EyUPgp94vgxTXeEUvJrFZfwiIYIGcNtMxPM6Ed6LKGvs1FPITiZ5Ea4VpXOZjx0MHdKiaexBpPq8P/8/q+qRnmRkg5okkJGbTaCwQwDqljGalG2G8jmQruMRG1wxzlhbsEP1dId3xAMclc2okqxE/Xcw7dFEm35L4rKltQnYFXZdSOLgnNnjF3gXTQSNrtIlTQ/SEpWC2OTMDyqTIGS6qWaAcyLpoWOz+F8Pp+6bISSKt1OCY/vhuuWSyFNqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu1sZkFG3ySZztgWSOZ7h1GKLNn5RQV39RDCGDJxWTw=;
 b=ROaHvEDeiMjdPdCimVSqOVPv9WH8iKFVSMmgiHB51G1iO0Ohdr2yimmHZxUpoM5ybyQi6SQDy0yYDObJsely/F6heEuUrgCuCBy6GNgM+tFqQZ7f9gP1tfdByPxyoLp+va7a9X0BI55p+cy0yBpjB2Ag4SAyH3MdqaX/5L8mq/QQYVuP0PldZezBbs0LFAHpl3rwqNyZQLpWWT3rLObRndYSNlF0/xES4vNDRiQOFq0G5KCULmaCqTggduqxe7owzNoKMPjh0MYxPpekY8aZ5MPCu+K6liilmajqBTWpLru2qj9PFw6qRJhb7AEcP5GXjXnbp/rqTqkz6DNvMka2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu1sZkFG3ySZztgWSOZ7h1GKLNn5RQV39RDCGDJxWTw=;
 b=JXOq0H3ZRarogz+ZHQzHUkgkdOM+Kfuc4cGKFvEZ2xqQy5swcT4+03DX2pvqrs84LI2BnGcE3qzK68eOwgoCk3TPN6EScMhPUJQYNxiREA0ubrBVZdKCc5KUxq5+ek+hAFx28VmmAMtK7SDumS7mCBBTi116efSss1/tG2I9a/s=
Received: from YT4PR01CA0469.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:d6::7)
 by YQ1PR01MB11904.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 14:02:22 +0000
Received: from YT2PEPF000001C9.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6:cafe::3e) by YT4PR01CA0469.outlook.office365.com
 (2603:10b6:b01:d6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Thu,
 19 Nov 2026 14:02:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT2PEPF000001C9.mail.protection.outlook.com (10.167.241.21) with Microsoft
 SMTP Server id 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:02:21
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 7FDDA9628;
	Thu, 19 Nov 2026 09:02:21 -0500 (EST)
From: Curtis McBurney <cmcburney@telcobridges.com>
To: netdev@vger.kernel.org
Cc: Curtis McBurney <cmcburney@telcobridges.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	toke@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: keep txq->trans_start on repeated netif_tx_stop_queue()
Date: Thu, 19 Nov 2026 09:02:17 -0500
Message-ID: <20261119140219.3069996-1-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <179506670286.3136.15475785780493881467@kernel.org>
References: <179506670286.3136.15475785780493881467@kernel.org>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PEPF000001C9:EE_|YQ1PR01MB11904:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c77e19ca-1361-40ff-eaae-08df4645bb47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|261021121427099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VxbRqtXuQHuH05YBmvME9jb53DHYt3Li7krY2HXGJGCA9r2DmoU4ohRekOR2YrEnLY8jn5rgCdcopuFk3ra1WYj44Q/x5hat30eSJwFrCUnZ2FLkTg4EKzfsOcdsRm7LdLn0RNIx31Ie4C2sftXxI27bcpDG1yLRSrTbTtjVOmDDy7vskDrML71y+ru9oKP716T731NTSIp63rQd9w20Yui53bvABAbqIHG3GQV8irxv2J3rU/4Kv1wPdnDu0hO2ra4OMyxVAjmDl14hf8B79cWmcvx/jLe5Lb6xiCkggKR6F4KxwoXvafoli6tXOVTzNPoEsOukx6fC3cOaQK1OtPZ6etLutpk87I2zzPp3OQy7pMyDol1OUU+7yV1Lz2WqOOUzFqcL7uzdex4FCks1pdjUn8Lvlzda/nnkX5Z4994qsiyveqA37rBLOZO0CTH9kFxQXln8VBw5YEP7+4Awih+tqMJ3s5EbMEBMOb+O88xSZNGjlvU94IxI0ielFtyzv89ZyoFvYj8gSnvMLYN2ce74DZfcM32hELUgdMIooSUHGR14Zm5dnUNpr7cV6fJnuzbvzMY/BMxPUFzeqeLATDo8q4xWSNxlk4C4QQi5bwxU2ZEA6577zqw+lbXEp1CLcvrbwjPtFsjU0qTIgoGew8QFJ5H/9uJ+1BqXxG23vCduXu7zsSVeZzk0beSo9c8z
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YOizejRXlOAe13OjphIiN6cHZnyxjEI1jCw5NEg/51oT12WYRnQ5+3weQlOUYpAbgIp86XXZK4Ec7qe3xyjXaaeM8hFbeNGp2Oa9m179nkNOMwe5eokxkrtndGeuYRDUBfWjZxAaRO48segsu4T9p+dDZWKXtM60NG8N1aFSKU9ZC5rELYNNFPMoeFRJUxPi4hqpSUDisT3Q4sEWkAPl5hJccoUX3yOMQ2ua7YqkCRU5saPHgL4UwQ/42c4/9ycNXm+Y6cT/naacpRL6iWbI5VaFPBlAFfKqSHRSRKi34CU2JCk2sflPE0nYcuU3nN0b24Cp4ofYOKuOjJZy9dohV5obim690uBCK0ivwG6T2NqUvUDKiX3c0I3d7i9Ru7t5OyOM+8TRBeBlfyzZkJMjQ5u9lTw7i/mBrM75iyt1tXk5c1R55worLa7a11nDVJvc
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:02:21.8101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77e19ca-1361-40ff-eaae-08df4645bb47
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT2PEPF000001C9.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB11904

On Thu, 19 Nov 2026 05:38:22 +0000, Sashiko AI review wrote:
> [Severity: Medium]
> Can this leave a newly stopped queue with a stale trans_start, and lead to
> a spurious "NETDEV WATCHDOG" timeout?

Yes. If netif_tx_wake_queue() clears DRV_XOFF between the test_bit()
and the set_bit(), the set_bit() stops the queue again with the
trans_start of the earlier stop. e1000e calls netif_stop_queue() from
the print_hang_task work item, so the caller can be preempted between
the two and the window has no bound. The sentence in the changelog that
a timeout is reported only if both stops together last longer than
watchdog_timeo is wrong.

v2 returns early when DRV_XOFF is already set, so such a stop writes
neither trans_start nor the bit. A racing wake then leaves the queue
running, as if it came after the stop, and the next stop writes a new
trans_start. netif_tx_stop_queue() is the only place that sets
DRV_XOFF, so every 0 to 1 transition of the bit follows a trans_start
write by the same caller. The early return issues smp_mb() to keep the
full barrier that netif_txq_try_stop() expects after the stop.

> [Severity: Low]
> Is this comment accurate?

No. v2 replaces the comment, and says "repeated" instead of
"recursive".

pw-bot: cr
