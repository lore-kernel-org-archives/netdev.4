Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111311;
	b=npskGzix09iKDm9kU7spP89i0qA+X4ix3fKUrrKIBeTJM1tY1gttDWieAAQ/lBvNi+vT
	 F/CUYFBf4dYpAG+5znzl/4ENQtaPFixJp6fGu4BYeIegRwSV4cMk0E2J862QU0u1qeMP5
	 8PqEYJzEnhZgexr24KtWa0n4JH6TOVE1POFdEjChKkozdqzb/yQYJW9AXxRQD4o+H1RIO
	 1wLV2wwp1vRkKHPOuiGkKHzH6KbcQpEGsSyUQ0QOb+kAGa7hoUS2+aE0O1RRpuH7Abmw/
	 7sUMyLwgbKwtu8JxJ0GFd7mA33gkvBTd4qDRFn55STRTeWhnwJMCVC3d9muOMF1zk2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111311;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0N1QSlpa54m8h0BVaaUCPe59uVavPXBZdfqCJfAbr7E=;
	b=fMc6jeoTjKX96ARkRgyEP2zLh6tdQGPlSVvCACUGX+MJUl1eVpdcK0OUfHhy2EftWX45
	 9RS687oJTZVZiR1mCdvFgo9Ly+XzQWOzXVjz1xPPaWrDg5U6dXNyVFpbk8VIXNOApMotp
	 bSWrVlSfxA5uOoAyGYNB/1DpFC+fNuK6D8PwhNCXy+TaSVAXDCG/1lmzoHuLqFmxp4G/u
	 6dxLVGXBjeYouEUWzp+zfAXv1+4enP7bTEJoMqePajkenPf3gPSms8p5LH5y1dtHKimVp
	 r/DchxX1EnGQpzI0TzMU6EoT1Z29PpJh+liN9+G4MGb2Q6i5Oil23pOD3b7Xlc/PQPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=SvkQpFNQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.23
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFC606A324;
	Thu, 19 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BFC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=SvkQpFNQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajoJgELKoVMCtpRsdnoe+e4lLDJ411qeMnDSofujQ2wN1Dfd4jheG4n2NaV0pH059v8XazHebUpoVZAwEiq1W35BrskZvwPKWh2atlR/kxn/EBsgo7aeCgXxVN+KyWnJvrL+O4vepEZVl9oDivZ5HjcdnEPPfX4soUtn2gn1QBRy4GjKV3jlB3qKJjPNPBN04IdVmhYDVnMHoA/S0AAShcsTG5igZ1J1QLOrITX3tI58rfj4odPxrq5Xm7tb+ejyKzYmGuCqe7NHyX+4slVzTBDcrO3yHFtNkHw1K/nqHQSBJEOszG0w1t82zLM6TQPJjBIlJiAuaYyVaH2d5eiLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N1QSlpa54m8h0BVaaUCPe59uVavPXBZdfqCJfAbr7E=;
 b=VRb+KSb1Z8O5Jswge/8RvxBpYeGqZ11PhPxvBUwo5QeKTwgq95i1/6aTf59hTtMirCovdflfy3QISoV7mgnOL0T0ozPtYVOBcY+sGo20/y37jmU8+lYUTQc2410oMaPMxdPWmSCl7msSad4GiiRu8hfBbFgnCTzr50otfA1zAMFq9naJT+fCaac8zBtcuyHYDaXjVOZtG1BFva3r73dhRenftBK9StOkD6RIN550HD7PhGjroOfm1GuoUlczz1b4rU+mg6WTmNhM1HSwnVxS0TKnaVS64xAVwRM5msYlHjju0pExo4SxKv/arJBPGyAyNcacuv6wCsnpoLku1ya5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N1QSlpa54m8h0BVaaUCPe59uVavPXBZdfqCJfAbr7E=;
 b=SvkQpFNQpMAu9ZyjwG7A9zAO6AbBqWhM20saB0JARglj4jkj5BfWyGRkbrh0iQ73CP6JScy+bsoq6xiN95+lYrfdeuaAB4/XZlkdNjUkh/fOA/wFuvsWL/3+4BNCqO+3Hk0ISvLgSwwRHiqRocYmQWpTTRJrTxQIXpdbEUgeskCRtAxIJ87YeA1a5z9VyXWpP3ouBVFU5WTuP0Kfvnux+Zjaz6/mg9RCdp3i4w1/FQKTCCzUq30Yl/jlElgiwBJpEbzy0RkU0OTZe0lc9Y/Ojeyepd4yY2Tc97L4ImYQ7QjCvIgH7pUreMrt6XXmYwsbtzVGsFLKr7tuF9EqPp1j4w==
Received: from DU2P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::10)
 by PA1PR07MB10341.eurprd07.prod.outlook.com (2603:10a6:102:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 18:01:47 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::28) by DU2P251CA0008.outlook.office365.com
 (2603:10a6:10:230::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 18:01:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 18:01:46 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id A0DA120FCA;
	Thu, 19 Nov 2026 20:01:45 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuniyu@google.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen0607@gmail.com,
	g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com,
	cheshire@apple.com,
	rs.ietf@gmx.at,
	Jason_Livingood@comcast.com,
	vidhi_goel@apple.com,
	Mike_Rudolph@comcast.com,
	Jeff_Howe@comcast.com,
	srichard@netapp.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH net-next v4 0/4] TCP Prague preparation series
Date: Thu, 19 Nov 2026 19:01:39 +0100
Message-Id: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|PA1PR07MB10341:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b86106-17a8-4ca6-077e-08df46672d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|921020|10067099003|261021121427099003|11063799006|56012099006|261021123027099003|261026121527099003|261102123227099003|261102130727099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LqO88aPhsOM/cl6wFMRcRGvmIEf9ULN6PjSYAkKv5ozVz6gVqjZmUdGGWNfICBrw1P5gFiT1OgFmtgfi+mfIrQA6ijGdikIaAVFbY5yifcWT6Wrsql2DXdKeDLH8C3AE/2BUOvhrlU/MRzAVXE1ICYCLwG15wvmZavHh39uKDij0w59y2cr0dXXrhRln93tlNZ77HAOsNDArB8Hiru5+KFiPQmgyjwXXm5StuCO5xS/P+oRuQew36vSfAjQm4vsH5nciNx0uEkGusid70nD9rGRgUKGx92rmBiFg4E/sy9JoDa074RF+BdExL2A9mPLNj+Dh8zGhqXagYZI87po0o0UvaIHezIRocEa5sWZQc3KphZFfP1wnBtXfn7+02rBCHTryhsoL8En52X8lw8/LJK0HteJihwJ9TX2hHbGtTyIwYlUnhYk9Q9mbgs3/Faz+XC+LX4bAx/6aRCriL1sChWzgksfBea9CIcnyjYNXN6Sz7lCqRfZVSQ4bjWA0nwFmFxk/NLtP7wmsIyHq4RBQoTHsl8W7J+UDDG2EAsYlZRjfraXhnZFOwsrBOyIxbx3RQ9HeUfrn3KSUxf2s1i1Xs/7t1iAowR7CcZRNSsHZWrB0MlYjm/JwB6OTGPVlcFAIOMykkmZDRewUx6i/vBoC9GoWoiZ2uvAIFLs3uHaNicBdKSOb5eMzjsVj2yW5jCRe5undiQWrFhuQBcBZz+GUoVUdwC72FY1X8QQxJH4mzp9FemdCF6/jxwAmVKRoZMcy
X-Forefront-Antispam-Report:
	CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(921020)(10067099003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261102123227099003)(261102130727099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n34ljtQF6qcmuiLMSLaLLxuDXUdkMdX3vgpVWs3ECB+FXgFhuoQyxmBl19OovqYCOpV1pYXkB0rgPMm8gHJ5DTlkJLOnz9P0nDThLFUZlKqhDjKb/i9hqCEE4FvUzcbWlMbZDohfPsSwNPJoqznA3T8umtA3pW6soROI4ApDqkgZ8XHmOo4iDnOKutJWKniz4rUwgOR3OYDgX9/2L8vZMqANr7YBxKCKFOuItMwO8MyPDcA5X50C5GrP24W3uc+yvEKUPscNqDu+TQRDSTdcbHgol4nbQuPLKgeLB6I3rM+vd5LL/vEVBk9KgZdT5AtX3x9bfWaK4zkLsA8XKXH+ONSom/gnTvtQRrWUn6qXc06Qjji0Re1ynmHzWYadfFaDUkE/0sX/lLcag1WpCBsq52JO+8eNYpKVwFMYut3/w0h92nR1KEWl2+lK0QZEK4E3
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:01:46.9277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b86106-17a8-4ca6-077e-08df46672d98
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB10341

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

Please find the v3 TCP Prague preparation series, and TCP Prague will
be submitted after this series.

This patch includes the following additions:
(1) Export CE count in rate_sample as acked_sacked_ce;
(2) Rename existing rename ECN transmit helper function;
(3) Add TCP_ECN_SEND_ECT_1 to use ECT_1 after negotiation;
(4) Add MSS ceiling callback for congestion control to limit MSS.

Best regards,
Chia-Yu

---
Chia-Yu Chang (3):
  tcp: rename ECN transmit helper function
  tcp: add TCP_ECN_SEND_ECT_1 flag for congestion control
  tcp: add MSS ceiling callback for congestion control

Ilpo Järvinen (1):
  tcp: export CE count in rate_sample

 include/net/tcp.h     |  6 ++++++
 include/net/tcp_ecn.h | 12 +++++++++---
 net/ipv4/tcp_cong.c   |  8 +++++---
 net/ipv4/tcp_input.c  | 40 +++++++++++++++++++---------------------
 net/ipv4/tcp_output.c | 18 +++++++++++++++++-
 5 files changed, 56 insertions(+), 28 deletions(-)

-- 
2.34.1

