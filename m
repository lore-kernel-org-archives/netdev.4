Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810987;
	b=x8Vs3vvrSJ2BMYQbTFOpdDUEzDPGLo9B734QPg6zA6Vg2XKbQWI7kyo3HzVNRMC6Tk7v
	 PwYEEmiDpw5hZVDgkCPUVmYGXlTalGtBRzCYBvFzumKZCcXJ9sKi2GwAd/8MuwIkphsay
	 JC1fmrcpdu2CVPG8F1pZ/ecYba/PMOcYw0oyZX+YXmzfW1rU6kB4tnUW+3oTvONWNbzDz
	 ApHehPYb7DKQtuPST7O1Ib3eWXgq50LnwDGhXq7BzAtJlggLJNvoIZK6r69jx+zVhCr9y
	 75NEWKh4DfAyDIEzRGS9TATD/2N07TMoNmeovWeGrPxs3z9ABNvBQzRKnJxIZcYlhiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810987;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dDefUP59fRDfQoxY3x8OvJhpf8iTtEovaYiI4ir1fYY=;
	b=WChb1RnS0g2ht3lgOvihewGhWZhgEGmjAOQsXUJu/97mnN/Dg3t8W8I1Ssx8oITpgQ37
	 XN2RtgN+wU18/VU353Y13ZuiR+hAS3NLFEExEvzrgQ6II5RPs0F3JW4RQKtKy+Fobo19e
	 9+wVFl+c3JwQ62ZwpO8+KovJUQN8N91L78i/AR3jhzJajvazBgK5BFxHwr58ll+KPS3Jg
	 PR5psZXkQLPKHRPqk+7KTWaLLrNnPoF9hWCjrcHdUF1Y1BbC+sw0BMsedsXlxNIsLH8RV
	 a74nQwvyy7qonhhWXonpfrFWXeOky+jl7NLeJX0eYkgHIOHtMCmftbTn/p+jUY1igVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=WYbooEu5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44440606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44440606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=WYbooEu5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/NcGFR6U0kGIZBzuooNHTdED7GDDA3JtMV3FgOQ6o7bTtboT9yN3/cXum0h5xkPk94Rl0XYICSmEUAtoSScJnCmQDkvAYz5/nHvanshR4j+hi9CLiqnVXQmAlKpq9SPBVmB5gCcH4wjQHm3xWtWePF2zuHPTWFiGvgsnNrPr7wnRx0ZNsYQFOwNYpzmEZ0r0LpMg0XI5X4iI6DetgpmO9V1y41t7FltAjKhYo3W0rZcjQvCCJ39THNbzRORLCjG7OhYhRIPwHtocwU+DZFySjK15ji6aob5xjTaLcw0ehdtCFfoOffFYKJ5/L2HJTrWE2Z2VacB2/w35+YqjKneCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDefUP59fRDfQoxY3x8OvJhpf8iTtEovaYiI4ir1fYY=;
 b=qeEFhlEYw5BhcRUe2h1rxAaPn8LLLYBvdQ0a/scB+NC8TSC1vJ2CjHOJxNiWvWhGcbiil7TZiAQLEF5Fy44iFO9L77AjNi+6GjQ94QV25v8IQ7BdYTCuqXVR0jPxYifmk+oI7YMuBcZv+5zjI2+tAHPVrNB/zbnhRXss+zLyYItc8lI6YWxIqhWtHd67dDxbhd0eB1UtIjdtSKZp3vHRCKQR2layWT76oMsdwvH6WjDd7VUS1lRENsWN8zy777QeSHWhHuTKVUHiD657QCDTdPeoIRrDcWBH7Rsu+ZmR9xw8VzC0jzFtUdjsrtq2B/5+Vc3tD67xGPuToxCszkdrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDefUP59fRDfQoxY3x8OvJhpf8iTtEovaYiI4ir1fYY=;
 b=WYbooEu5YdUVrMsnjB0LMZR4YG2jr+csIu6PR/C1wMixzXa+2qgbOGcWiX8nYyG9uwlIHyqVjwQp/nMfBIW3gN2eA5FXVIjzhAzVLwstGcRnplIV9EoSYu3ciBlOroGkOYYpGSCpCNmn1qqVReX+R8L9Xk5TKSTSNHSFnsP6LQMCddEEMoWWJ8RGKyUWiIAAIetrpEsuFnk63ws+oJNcAWYVol2IlobdM3gyPwuJj9TCdEoifyygpyIXQ1WnOL/szOCuGTER0Z7Tso01adrMZERelqJKOxAaNGMULGae32ojFFgCAQcjFtVQQmPTUrTkFUUKlPEleI4vGBCX79C1dg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI0P189MB3463.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:24 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:23 +0000
From: Tung Nguyen <tung.quang.nguyen@est.tech>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	jmaloy@redhat.com,
	horms@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Tung Nguyen <tung.quang.nguyen@est.tech>
Subject: [PATCH net v3 4/7] tipc: fix missing link-up event on memory allocation failure
Date: Mon, 16 Nov 2026 13:34:53 +0700
Message-ID: <20261116063529.6185-5-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:17e::23)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1137:EE_|VI0P189MB3463:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de28fdf-1365-40c2-9732-08df43abeee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/68W9ufGRTpDvnBvpt9MtAFxBNL+0E1DIOrDPqMznm37wcKq4X+TofWiXIEqhVmt+TmuVtVBYEmQraaTuexUHfoWeMM+aiukGDVnNyD5fPSYzAmEKslucpVA9mgOCCTzJmEQyPfVeCApB+N+ypHuc1DnKOgfa2EGzIv7TCwkU5XLDiJqlHlyCfG8Wl/mH56yqNNpZ0SY1ttwQdX2aYz2iR7irHjTYKHoTWd688y87cw3DdZ1QKwlP1fZppG290WUyB4uTCrUglqBV48Mk6KF8aK+dttKfbYiMKbUAgzB83tIUCWanYMlwcyl6oV1Jx8ZE3P1F+yofvcDToPBhr3hufE2NKMRDjTNoNKvNP8ezP2Lx5v/JKHWaEqahOvPRTHhzBBIDVqMNVwu1rWT7gOIeMS1sfvlQ8oY7WbIhXFGGTrdv6BQrwXZdmybQqZsTNsSRJTuZ56qfk1U8gYaUSuxYBsm1wN1jF3sfKqxwa9KwqGD+3XF9uqvadZJpYAY4pxC6KOS64gvi9y7dOVM/bMPZ8Od4XhmyxiCyi4VIVN4e05g+FRWtLHW+2MHLor10Oy0pPTB7GBSeHehngxTvkmUxD9I91I1yCx8Q9/vxn235eNqURBQov+CiJ1VpFSjvfyb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f+rCNadyYeQWPxPjgczODdAI6j26T3TmIQRlKWcX/nCXvpqrWfMONMNkKAwu?=
 =?us-ascii?Q?lVLt4LwDdIXCtqAbF7mS+a8ew/GGcHv+9tBN9kySYWcSY+L0G842q1ViV6xS?=
 =?us-ascii?Q?pnzGx6uKgs3A23k3cQ+6rzLtfJa8c9H3LtlbhmXZbWuuAHd5/NwcNZLQrhV/?=
 =?us-ascii?Q?TCIJsjASCSRwhIBH20nq0+B3gjniywyT3fNwUkCnJhg8Z9lb3OWP17xZRZtL?=
 =?us-ascii?Q?o6tbvephr9FbwWXd8FZEeoYNExUCHnp6JF8qTGQoqwDnHhIDqE3d+8JAqsWt?=
 =?us-ascii?Q?wI971Ku4+ygzEqnt8Rhzl3Oey0asGVLUeW/Ixt736x8MLaMgYaAc37YG++hz?=
 =?us-ascii?Q?DXPL6rcSqsEcuhfu4vwOgip/rELnKl1ZWgofd7RW7eoomtUN+1F0uolsU1cf?=
 =?us-ascii?Q?lRZDueyOzL/EnFXAivS5U35cAU2UIxOqxwT1PDO2vJEwufTBW5U3dfC0QC/2?=
 =?us-ascii?Q?wE4cN/R90NZNB+EKYIVj1yvI+1/5RIr+9mmpp3HcXQI4yLprKyG8HtSDurgV?=
 =?us-ascii?Q?3L9HIlJIt755TUTZOND9TxxHEPIzQPsPKC7rILMF4ApMHh2c76wGF89SA/nf?=
 =?us-ascii?Q?C7LtWciFY0Ey7X4eUYarsICdcX9y4E0J5EqpUDdDYpV7gEMP7XZU3L4m2LQs?=
 =?us-ascii?Q?2GXDqfDW6sYSJSQEJcSR3pLB1dZ8eYY5VOs/evdiB9HgCZzFT+8C5ccAvNws?=
 =?us-ascii?Q?M1r7+MIJ1lU66Zn5AhY4b7M1el93DDO8ctAIr6FBGoP6NnSEXrpDLRz9rqCq?=
 =?us-ascii?Q?j5q5o0dx6JuzWZI/GalJkEfZLv2CwjFI5mpZPkwL5VnyG2ANosS3SdWTkz6c?=
 =?us-ascii?Q?aUwznVr4IaJ4GWk0OjIq8Q1YyIEfSLdE027W8lPyGCYD+cU4HytACWhY2SZc?=
 =?us-ascii?Q?6txTwCGsne9guj8jgSHh61YSF/SiM674K82srSBHEyHvrFiaOhiffmEssytk?=
 =?us-ascii?Q?EQd122nnS3eF+KfjVPfnwnP7M7ZP7stMSKaC5khi22xg35g8gpRkIC79oTi7?=
 =?us-ascii?Q?0llOZZQdGT3hdEjgy80gJ96XcYJCNvGK0o4HlFkyhGT6VLXOdfatyfwPmNc8?=
 =?us-ascii?Q?Yepuu+/6OcJpKoTQ1WwVlmcF3/7LpOvoX9S8Ev0XoyaQ7AEbpWxHT4XgBN+d?=
 =?us-ascii?Q?djxafPWdjxLzvjZHUtVlyS2G+O0GjMh2WoG3Dsli0h8T2krxXG28Miqwpq/M?=
 =?us-ascii?Q?QBP7dNa0A34+wpeMjyiY8MHzN5LYXMdbaZDW75+ZxMvz6aRhVJm6rJLfpKRX?=
 =?us-ascii?Q?9n8u3E9YpteCOTuiqIMzueihx742zgwPV2STkRxeZrXYzO7s3UStqb2+XDgF?=
 =?us-ascii?Q?U/V+Uf7mlfXmIYBxNxcRdCNfSpfiVZzkn3hikCctOPpUEYkarqvltKrUowB3?=
 =?us-ascii?Q?YMPO3/iJ3fv3MvJHdmhCx6OKiGwHNhkeTlykKTB2Fvt8wqjH2XXjsrN+KiUE?=
 =?us-ascii?Q?Jv4pRAKDNmddoMCBXx5KCQTHbraVnxAzOmlVyMtMhgJmzoA1NB/cZgfI8T++?=
 =?us-ascii?Q?U+S7LgCKPdSU8gcjBLmtWMIzNhnHULEQ2B915OW2AEj8+DH5UVY0fU2D+wUZ?=
 =?us-ascii?Q?lkmVxLXhg2XoKEMVpkZEpGpXETw9eNi7YLjOEaUuAsWLNhRMtWQjzjvc+yXL?=
 =?us-ascii?Q?nAq2c85WUMp4MbTACWCDUcEOhedvPUK+zpT3EUvtOYLveldocXmf2gAHek6P?=
 =?us-ascii?Q?1k4psIDKuuqhChyiGgB4x4oMctPUpMgYPhTyeypQbv5gsh0DQNhC81hj9Q5I?=
 =?us-ascii?Q?UvUdxqSFE0ikKeb4gt7ybnA72uNnmoplvD8Ym/N4ELtd8STO4nmZmDEKNNmd?=
X-MS-Exchange-AntiSpam-MessageData-1: ytrUduanR7dirQ3IbhNv769l5NV+r7onXm8=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de28fdf-1365-40c2-9732-08df43abeee0
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:23.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GDstezS7e6NKzql28v03uLiguTqnE5ulxrHe9/FUMGYTjDtV25y9gyb6EVYqpp2ltWjtU0yprNvQ8L1ViN+Ky35e1kOhy/QSa+Rt0LdWek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3463

When a new TIPC link comes up, a protocol publication of type
TIPC_LINK_STATE (2) is created and inserted into the name table
through the following call path:

tipc_node_write_unlock()
 tipc_nametbl_publish()
  tipc_nametbl_insert_publ()

User applications subscribing to this TIPC_LINK_STATE event will
be notified when the link comes up. However, code inspection
revealed that if tipc_nametbl_insert_publ() fails due to a memory
allocation error, the TIPC_LINK_STATE publication is not inserted
into the name table. As a result, user applications are never
notified of the link-up event.

Fix this issue by checking the error code returned through the
output parameter of tipc_nametbl_publish(). If the error indicates
a memory allocation failure, reset the link so that the
TIPC_LINK_STATE publication can be retried.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3:
- Free sr in tipc_service_insert_publ() on memory allocation failure.
- Free sc in tipc_service_find() on memory allocation failure.
- Purge xmitq in tipc_rcv() in case tipc_node_write_unlock() resets a bearer.

v2: https://lore.kernel.org/netdev/20261102034207.10639-5-tung.quang.nguyen@est.tech/

 net/tipc/name_distr.c |  3 +-
 net/tipc/name_table.c | 74 +++++++++++++++++++++++++++++++++----------
 net/tipc/name_table.h |  5 +--
 net/tipc/net.c        |  3 +-
 net/tipc/node.c       | 16 +++++++++-
 net/tipc/socket.c     |  3 +-
 6 files changed, 82 insertions(+), 22 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index 1dfe8475a75d..3ea5e900cb45 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -285,6 +285,7 @@ static bool tipc_update_nametbl(struct net *net, struct distr_item *i,
 	struct tipc_socket_addr sk;
 	u32 key = ntohl(i->key);
 	struct tipc_uaddr ua;
+	int err = 0;
 
 	/* A peer-advertised binding with lower > upper can never be matched
 	 * or withdrawn and would leak the publication; the local bind path
@@ -299,7 +300,7 @@ static bool tipc_update_nametbl(struct net *net, struct distr_item *i,
 	sk.node = node;
 
 	if (dtype == PUBLICATION) {
-		p = tipc_nametbl_insert_publ(net, &ua, &sk, key);
+		p = tipc_nametbl_insert_publ(net, &ua, &sk, key, &err);
 		if (p) {
 			tipc_node_subscribe(net, &p->binding_node, node);
 			return true;
diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
index 73b032ba2f8d..e8b768699ab9 100644
--- a/net/tipc/name_table.c
+++ b/net/tipc/name_table.c
@@ -329,7 +329,7 @@ static struct service_range *tipc_service_create_range(struct tipc_service *sc,
 
 static bool tipc_service_insert_publ(struct net *net,
 				     struct tipc_service *sc,
-				     struct publication *p)
+				     struct publication *p, int *err)
 {
 	struct tipc_subscription *sub, *tmp;
 	struct service_range *sr;
@@ -341,8 +341,11 @@ static bool tipc_service_insert_publ(struct net *net,
 
 	spin_lock_bh(&sc->lock);
 	sr = tipc_service_create_range(sc, p);
-	if (!sr)
-		goto  exit;
+	if (!sr) {
+		if (err)
+			*err = -ENOBUFS;
+		goto exit;
+	}
 
 	first = list_empty(&sr->all_publ);
 
@@ -353,6 +356,9 @@ static bool tipc_service_insert_publ(struct net *net,
 			pr_debug("Failed to bind duplicate %u,%u,%u/%u:%u/%u\n",
 				 p->sr.type, p->sr.lower, p->sr.upper,
 				 node, p->sk.ref, key);
+			if (err)
+				*err = -EEXIST;
+
 			goto exit;
 		}
 	}
@@ -368,9 +374,15 @@ static bool tipc_service_insert_publ(struct net *net,
 	}
 	res = true;
 exit:
-	if (!res)
-		pr_warn("Failed to bind to %u,%u,%u\n",
-			p->sr.type, p->sr.lower, p->sr.upper);
+	if (!res) {
+		if (err && *err == -EEXIST) {
+			rb_erase_augmented(&sr->tree_node, &sc->ranges,
+					   &sr_callbacks);
+			kfree(sr);
+		}
+		pr_warn_ratelimited("Failed to bind to %u,%u,%u\n",
+				    p->sr.type, p->sr.lower, p->sr.upper);
+	}
 	spin_unlock_bh(&sc->lock);
 	return res;
 }
@@ -478,20 +490,40 @@ static struct tipc_service *tipc_service_find(struct net *net,
 struct publication *tipc_nametbl_insert_publ(struct net *net,
 					     struct tipc_uaddr *ua,
 					     struct tipc_socket_addr *sk,
-					     u32 key)
+					     u32 key, int *err)
 {
+	bool service_created = false;
 	struct tipc_service *sc;
 	struct publication *p;
 
 	p = tipc_publ_create(ua, sk, key);
-	if (!p)
+	if (!p) {
+		if (err)
+			*err = -ENOBUFS;
 		return NULL;
+	}
 
 	sc = tipc_service_find(net, ua);
-	if (!sc)
+
+	if (!sc) {
 		sc = tipc_service_create(net, ua);
-	if (sc && tipc_service_insert_publ(net, sc, p))
-		return p;
+		service_created = true;
+	}
+
+	if (sc) {
+		if (tipc_service_insert_publ(net, sc, p, err))
+			return p;
+
+		spin_lock_bh(&sc->lock);
+		if (service_created && err && *err == -ENOBUFS) {
+			hlist_del_init_rcu(&sc->service_list);
+			kfree_rcu(sc, rcu);
+		}
+		spin_unlock_bh(&sc->lock);
+	} else if (err) {
+		*err = -ENOBUFS;
+	}
+
 	kfree(p);
 	return NULL;
 }
@@ -540,9 +572,9 @@ struct publication *tipc_nametbl_remove_publ(struct net *net,
 	spin_unlock_bh(&sc->lock);
 exit:
 	if (!p) {
-		pr_err("Failed to remove unknown binding: %u,%u,%u/%u:%u/%u\n",
-		       ua->sr.type, ua->sr.lower, ua->sr.upper,
-		       sk->node, sk->ref, key);
+		pr_warn_ratelimited("Remove unknown pub: %u,%u,%u/%u:%u/%u\n",
+				    ua->sr.type, ua->sr.lower, ua->sr.upper,
+				    sk->node, sk->ref, key);
 	}
 	return p;
 }
@@ -760,7 +792,8 @@ void tipc_nametbl_build_group(struct net *net, struct tipc_group *grp,
 /* tipc_nametbl_publish - add service binding to name table
  */
 struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
-					 struct tipc_socket_addr *sk, u32 key)
+					 struct tipc_socket_addr *sk,
+					 u32 key, int *err)
 {
 	struct name_table *nt = tipc_name_table(net);
 	u32 max_user_pub = TIPC_MAX_PUBL - 1;
@@ -768,6 +801,7 @@ struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
 	struct publication *p = NULL;
 	struct sk_buff *skb = NULL;
 	bool protocol_type = false;
+	int error = 0;
 	u32 rc_dests;
 
 	if (ua->sr.type == TIPC_NODE_STATE || ua->sr.type == TIPC_LINK_STATE ||
@@ -788,7 +822,7 @@ struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
 	}
 
 insert:
-	p = tipc_nametbl_insert_publ(net, ua, sk, key);
+	p = tipc_nametbl_insert_publ(net, ua, sk, key, &error);
 	if (p) {
 		/* Not count node state, link state and topology server types
 		 * so that maximum nt->local_publ_count does not prevent
@@ -798,6 +832,14 @@ struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
 		if (!protocol_type)
 			nt->local_publ_count++;
 		skb = tipc_named_publish(net, p);
+		/* Local-scope publication is not published (skb is NULL).
+		 * For cluster-cope one, skb is NULL when named_prepare_buf()
+		 * returns NULL in tipc_named_publish().
+		 */
+		if (!skb && p->scope == TIPC_CLUSTER_SCOPE && err)
+			*err = -ENOBUFS;
+	} else if ((error == -ENOBUFS) && err) {
+		*err = -ENOBUFS;
 	}
 	rc_dests = nt->rc_dests;
 exit:
diff --git a/net/tipc/name_table.h b/net/tipc/name_table.h
index 7ff6eeebaae6..3a15dcfcc2cd 100644
--- a/net/tipc/name_table.h
+++ b/net/tipc/name_table.h
@@ -126,13 +126,14 @@ bool tipc_nametbl_lookup_group(struct net *net, struct tipc_uaddr *ua,
 void tipc_nametbl_build_group(struct net *net, struct tipc_group *grp,
 			      struct tipc_uaddr *ua);
 struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
-					 struct tipc_socket_addr *sk, u32 key);
+					 struct tipc_socket_addr *sk,
+					 u32 key, int *err);
 void tipc_nametbl_withdraw(struct net *net, struct tipc_uaddr *ua,
 			   struct tipc_socket_addr *sk, u32 key);
 struct publication *tipc_nametbl_insert_publ(struct net *net,
 					     struct tipc_uaddr *ua,
 					     struct tipc_socket_addr *sk,
-					     u32 key);
+					     u32 key, int *err);
 struct publication *tipc_nametbl_remove_publ(struct net *net,
 					     struct tipc_uaddr *ua,
 					     struct tipc_socket_addr *sk,
diff --git a/net/tipc/net.c b/net/tipc/net.c
index 7e65d0b0c4a8..82f6d2f6ab89 100644
--- a/net/tipc/net.c
+++ b/net/tipc/net.c
@@ -128,6 +128,7 @@ static void tipc_net_finalize(struct net *net, u32 addr)
 	struct tipc_net *tn = tipc_net(net);
 	struct tipc_socket_addr sk = {0, addr};
 	struct tipc_uaddr ua;
+	int err = 0;
 
 	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, TIPC_CLUSTER_SCOPE,
 		   TIPC_NODE_STATE, addr, addr);
@@ -138,7 +139,7 @@ static void tipc_net_finalize(struct net *net, u32 addr)
 	tipc_named_reinit(net);
 	tipc_sk_reinit(net);
 	tipc_mon_reinit_self(net);
-	tipc_nametbl_publish(net, &ua, &sk, addr);
+	tipc_nametbl_publish(net, &ua, &sk, addr, &err);
 }
 
 void tipc_net_finalize_work(struct work_struct *work)
diff --git a/net/tipc/node.c b/net/tipc/node.c
index d84b0274fefc..870f84e2fb1c 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -402,6 +402,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	struct list_head *publ_list;
 	struct tipc_uaddr ua;
 	u32 bearer_id, node;
+	int err = 0;
 
 	if (likely(!flags)) {
 		write_unlock_bh(&n->lock);
@@ -429,12 +430,15 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 
 	if (flags & TIPC_NOTIFY_LINK_UP) {
 		tipc_mon_peer_up(net, node, bearer_id);
-		tipc_nametbl_publish(net, &ua, &sk, sk.ref);
+		tipc_nametbl_publish(net, &ua, &sk, sk.ref, &err);
 	}
 	if (flags & TIPC_NOTIFY_LINK_DOWN) {
 		tipc_mon_peer_down(net, node, bearer_id);
 		tipc_nametbl_withdraw(net, &ua, &sk, sk.ref);
 	}
+
+	if (err == -ENOBUFS)
+		tipc_node_link_down(n, bearer_id, false);
 }
 
 static void tipc_node_assign_peer_net(struct tipc_node *n, u32 hash_mixes)
@@ -2193,6 +2197,16 @@ void tipc_rcv(struct net *net, struct sk_buff *skb, struct tipc_bearer *b)
 			}
 		}
 		tipc_node_write_unlock(n);
+
+		/* tipc_node_link_down() was called in
+		 * tipc_node_write_unlock().
+		 */
+		tipc_node_read_lock(n);
+		le = &n->links[bearer_id];
+		if (le->link && !tipc_link_is_up(le->link) &&
+		    !skb_queue_empty(&xmitq))
+			__skb_queue_purge(&xmitq);
+		tipc_node_read_unlock(n);
 	}
 
 	if (unlikely(rc & TIPC_LINK_UP_EVT))
diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 65cc0c4964b3..a7b046f1d1d6 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -2920,6 +2920,7 @@ static int tipc_sk_publish(struct tipc_sock *tsk, struct tipc_uaddr *ua)
 	struct net *net = sock_net(sk);
 	struct tipc_socket_addr skaddr;
 	struct publication *p;
+	int err = 0;
 	u32 key;
 
 	if (tipc_sk_connected(sk))
@@ -2929,7 +2930,7 @@ static int tipc_sk_publish(struct tipc_sock *tsk, struct tipc_uaddr *ua)
 		return -EADDRINUSE;
 	skaddr.ref = tsk->portid;
 	skaddr.node = tipc_own_addr(net);
-	p = tipc_nametbl_publish(net, ua, &skaddr, key);
+	p = tipc_nametbl_publish(net, ua, &skaddr, key, &err);
 	if (unlikely(!p))
 		return -EINVAL;
 
-- 
2.53.0

