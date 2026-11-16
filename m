Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794811002;
	b=zdBTWO+syhsgNWfjBfCV59yH2lvL0HIBkyWwxh0g4meqoaq7GLS5PeubezAhprP0QmIW
	 zhCOFUK4/JO4KmyFe8K6QS1E4LdZfmcG59MgjlTZ0hOql+MZErPKXfBug7+IGlgxQ0sJ+
	 g6TeXr/nH7DKu92NThEZg9LMvjhl6YziA5GEgekLVwTpEDYGNu26CNKsV5CmxWSP/u5Hr
	 n20u0R8KvtQzhhkNRtnXNnqbTA9/nylKgbGVrmglLS1TwrFR4L0DTKeHR42L3YEC2wdcu
	 yBXT2+8hxhWOt94DIATpxksHcmpu4esZ9Wdnw9MX4h3FEW+eCVC+YBseuuLMqGpdLGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811002;
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
	bh=An7BDSg3wUpVOUxX6R15igvqdZlPKr64WUgMcc1hVlg=;
	b=lWB6M7Donf3XH8D0uiQfsDKNBEPFWxzlhaua+VFuu56zD8F4Fy0XReZZTCTFxwPZBoNZ
	 yHiEM5yskBsoyiRjJYPz/bG4yo9q4Ecz3BskSQ7KMwPrepgvhR55gbVBLOUtPM5BrEhww
	 R2RIfgpxHNIv/yU1+5SbhUC4gIyFzmORkvl9NFBEzHdYQCvVlVD2b2BpOX+uFvM2MiBRx
	 1NDNPqiGZ2LhrKfrE/uTcqjqXr5NWe/NQRUZcFWThpcm6pRig29Akf7Lz8YVsS0BRHQ43
	 joH20MzSy9NykwDHYwiM6jxSjzfP5Fn3CpEykI1bvibn+6YUso8opoML3xrCndZh4/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=Gs9cFKXA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.64
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E3606A8A3
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833E3606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=Gs9cFKXA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTeR+wf8XzD7bSbdktHgvGVgULrOfYbTTQyZO0YaZYOTmGd7mYHtx3qakfS1YSBazLKZPW3WgKm+d6oQC6V7+nBIeKaHZm+N4g7Pz+k9OSX/z8Gjl1k5uAUOlJZEZ0sb14gCK4/B/bnfs0n0mV96PTh7vS88bQKYzNDkg/RBYoqp9RWRVW4NnczCOWu0H3omocwYwN6bpAhOKHUIGKgaOanMJhqvLEBF128rPqj+uj7YKMD5vsGr4vzgzVlQ0M6syNPK10DXOlYWFGEUqMH9qiHHRHRtgNETo+xhzMFyZHXdsET/TCXi+AlQFwbCkMBPN2tVE8A2k9k7S3F0gKdPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=An7BDSg3wUpVOUxX6R15igvqdZlPKr64WUgMcc1hVlg=;
 b=t2VBVOzUqRFAQ4iSsM1l6vZcRWN5HUd7oH898Ahrs2UuMLhcS7SsQX9lcM6sbyDFgltlGs6BaewH1CrNzb4md8Pit+s9Wdf7BYsFbYl/oxvtlrUew6Ng1S9BWrZKugl4Vx9/TTCxXE3pO/tMox36RvJ8XYCsacHGQjYXhZXSXChAiGfILx8/Fg3X77IlhFEfhkB/4FUBANxWQcCcrVopv9pS3uFQYdzB0R9iTJPXcuVURuzFoMi1rReJuCLfKI+QVSzSzJms2ZGGD7yECV0bjERdvEJ1lzzP0Xldv8CtWgLIW4JtEYVDq9GjU6ykqQJy0np8LvzoeqNoXMGDWjaCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=An7BDSg3wUpVOUxX6R15igvqdZlPKr64WUgMcc1hVlg=;
 b=Gs9cFKXAbYCj9qZ1FScY8vwQgR8KSVCIlCYhiZvBgXC6LK9hjcXllRwmqwQDh0xTwnj+GshKnuImq9T7GzdwSYmAU3GAGz1GTdo51jgoLDJAH8ZBfFxIvCLAjd/0UEMI1FeP04XMVHoxHwevaxQHbBSr/nOMFE+oPesfA2g0pEzYQ9M424/TYvOQA/wEoXhnBSlbNgfuFMN7N6DDwIFSp+6pk8A9U3A5u1IJ8o40SZEsYgYscDqqkElBG8CNK2LB6rQQwn0NaeNkpeWqmMDc7IyRxhPoOHyjEjSdi1+B+mEfhmr//db28evsciY5CKVGf3N0TH3p2cvIYco6NY3kSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI2P189MB3564.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:38 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:38 +0000
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
Subject: [PATCH net v3 6/7] tipc: fix self-deadlock in tipc_named_node_up
Date: Mon, 16 Nov 2026 13:34:55 +0700
Message-ID: <20261116063529.6185-7-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
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
X-MS-TrafficTypeDiagnostic: AM7P189MB1137:EE_|VI2P189MB3564:EE_
X-MS-Office365-Filtering-Correlation-Id: ce679e8b-5ac5-4b48-602b-08df43abf7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gmOJWIrMfOhRy40Pv04JnovLzHxvheMVlYY3Kb/2CdSzWsFLEvQl2sYiIH5vbsJXs1No3LythoF/jSXUazhDt3xIxBUctHhXE73tB8wQErNaCCZDKpHL8t7cQq+gkZdTwspZFhlyeU5r8Z5Yil4vQ0w4Yec43hsS62uVcfcEv+naxsYsqWhvdUnXMX5ULZTxXBQutdnDnuaGnsXqWtde/j1GDSHHcj1P8WO0udit6fnDjCZ1l/wK7YkeEBOPnFnHDvu/NvAXNboq862wnl1ZS1m4OzZr+SzP4D9TEW8qQ91dPER6zIempICOCv4CgAO781UpHzHwkI4idXiCQXQRxuA8ibdDilE6y0lJg7bxwWkbF0NeaNXPLd9b3m/5JSodq8goc5jOiipF4v0aSPyqCZnx4TTPh8ihz/hmK6b0kBEUVZUBoxnJ/OkS8QBBr1ZHtWlkke9BP3VY76bTbUm75/ZP4SWdsFsb3S/CiilLF3CskeTyC7fkQys4oV7pHRE37Hyena4+S0f/1L4YwccWv1L65cNwexE+eQ3pdtFDLiQcF+bB/RFtuDliVJDj3EezRJx78Ru6dyKnuYlKl46aw9os1rzjSVLCgP+NBOJjWo2RHGNIuqgp4KYXA3hlAmX1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wDG4xO3S8hD+D7n5gNV6kLQUThVCdtiBul5shdUT9TAnRcZW3kzj4BxtnWLu?=
 =?us-ascii?Q?A+Q4fd7+hGR1Ted/Oq/N+gPEe5adREr6Mwf5WRYd37jexaqUA1U5K4XiUVOh?=
 =?us-ascii?Q?yKaHQGTVWX77/nopzqn2lk1VW+Mz/Nb7L/R1MDmI0lf3njszSgfnimoSjpnJ?=
 =?us-ascii?Q?isRwDKGR2qze6T7vRzdMMCNzjOwwxiT3mM/07oqb6xyLs5KCTQOoEMrRm8QX?=
 =?us-ascii?Q?cWdqr0FFJOCa3Fu7u3e+D16wfmvAL/QnNA9oAsdTu879qaTGA1L3ImUaP4BS?=
 =?us-ascii?Q?XTQVbvAzjlon2lImXe0Obdp+dSdeVdw/ZjiB8S/ytQ0h6cOK6j5PnG16zXnn?=
 =?us-ascii?Q?eD/3bFvnAgbVUX4sDRej3WHk+C8axNRnWnDmBfH/+ud662J2ScWyBFXa8znm?=
 =?us-ascii?Q?9WPU9HP8d5VqqGpc4vlxcYqgwzPmz46EblKu0EBxIktbBu1lyvn9svqHwDji?=
 =?us-ascii?Q?rPPRVU+q8nK86c55GHGHxknR0lli8Xp8vTgpoTB9iV9bssnIaBdJ12lmFkrs?=
 =?us-ascii?Q?SIq3h1FIr6TaxsSWQ6Bd52fCOjKv8bZdic1EfRy7ow7ZOyRujXEkH3T6oqIE?=
 =?us-ascii?Q?opOL9waZsXqKnqNBvpEeOoTMOLxLWo/mw66DaZw/khgMevZsNiaD+c5fnXMa?=
 =?us-ascii?Q?/wwjRGwjsY6VbwW4NEBSd7S1M8xtFGoYk0cvDNzLMB490cbmIvMLvWnGZh0m?=
 =?us-ascii?Q?jEzkpar+4fwhhibVRvPXn+TBCKkvX3pzSvq9DqJi3SWsaASAt8ffiPWL5fTC?=
 =?us-ascii?Q?TTQXbvzfn3zY3OKVpM8Wab/D/IQf4x+VSqpSvJLnAXJohPwlUtugKUiLj2Bs?=
 =?us-ascii?Q?rYRWsUATup6FXe7Yvb3hdcvC56IAS7wShfrwz81/miGbraN0oLbXjRGccvBl?=
 =?us-ascii?Q?nmFItgemaXEmASpcc8hJ0OPmJRo8ggnFi64SP7bYagLESPzrewTcLQnBQO/g?=
 =?us-ascii?Q?gAzhsqh1ChKCkP7s9Tv+WbabjTH3qvXLuZebIWgNr34lnN1k0bd/Tg4OJKpm?=
 =?us-ascii?Q?7l+q80+F9Rk7fBXe4qXnwwcmBjIU9IXLFpNthwzUReWONpJKxXdDVQuPkTrI?=
 =?us-ascii?Q?g5dPVSsFwYAnxAmpxpH1lsvwlwL7feZ5bCFHkmA9IgfEduXK4gdvXcEkJuRJ?=
 =?us-ascii?Q?XGPGWB02grEqUKBRiUn1ixe7VrQ7RQVVWb4mgfv1w8qi7jlX90tv8ZoxDOCL?=
 =?us-ascii?Q?4SezYfPLb6WTvPCPxeFSac2hCqtOWpi/ApY4IxfIj057rpQekXHhVEgwrg9/?=
 =?us-ascii?Q?agcT6vKBEJsTRifk22bsRsH5uynj6skqsLc1EpuOxOZNWhD9MG2kKKHIyGkP?=
 =?us-ascii?Q?AGwtoVB/q3Kh0DEPhjM/UgtjofbvddPPkW9U5IY4j6/9VvTZ7Ep/9AVTpeyy?=
 =?us-ascii?Q?ayRLidrkCrf/ETK2Y6eFSPKeE+37+GVSzvS3PgAgy8c/wh7DP5ptcQYXVAi6?=
 =?us-ascii?Q?jG4+lalnkGB6RRBONPpYcFbNu7dceOFyzVFUkw31EiXJsoplo44vk3KDOAoX?=
 =?us-ascii?Q?qHlI/1yTbM624JQ4sClsgVrDdCAHfDlqLeCM3Ry1XiKKNLlHjvhRnIzv9JTF?=
 =?us-ascii?Q?22x4FKhleEfZk8mWlD3g5nWwPBwDp2Lj38fNxDg5cqSax8R3ZzNct0lvaohW?=
 =?us-ascii?Q?p44rxZ/QRunesnjJe4sCx1lThvDdySD/wqka/JapmtjEv5GKAIbHWirJo8wy?=
 =?us-ascii?Q?357t1HwTlbNgvjjL5Z0NOw54zUw3L+qgg/duSuZmv7FiYJHQSz31v7zt7Dow?=
 =?us-ascii?Q?MLs5PlKTedCH1pyOj442HfZG7E4iSWMazag+yOrZ8hlB6SbkwgHkgN3QQ/YD?=
X-MS-Exchange-AntiSpam-MessageData-1: 1DZ9+E7ZNR3Qjt+zQrffsXyBQhEhAJ5kJHs=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ce679e8b-5ac5-4b48-602b-08df43abf7b8
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:38.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgd2fKY2+ZicczHgDVEaEs51TAX8+Y9HV11IZtSiXdnYg3Dr3dbcDmuASw7+Trr7a2bG7NsmJQmuNIgXg9iigpomaiuTUTUMyHyf5lq/HYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3564

The following deadlock can occur, as observed during code inspection:

tipc_named_node_up()
 read_lock_bh(&nt->cluster_scope_lock) <-- acquire read lock
 named_distribute()
 tipc_node_xmit()
  tipc_node_link_down()
   tipc_node_write_unlock()
    tipc_nametbl_withdraw()
     spin_lock_bh(&tn->nametbl_lock)
     tipc_named_withdraw()
      write_lock_bh(&nt->cluster_scope_lock) <-- acquire write lock

Fix this issue by:
- Removing cluster_scope_lock, which protects the name table's
  cluster_scope list. Use nametbl_lock instead to protect the list
  against races when multiple threads concurrently call
  tipc_named_publish(), tipc_named_withdraw(), and
  tipc_named_node_up().

- Introducing a new function, tipc_node_distribute(), which is similar
  to tipc_node_xmit() but does not call tipc_node_link_down().
  Both functions call the newly introduced tipc_node_build_list(),
  which clones a list of messages in sequence and tipc_node_lxc_xmit()
  which delivers the list to the peer namespace. When tipc_named_node_up()
  returns -ENOBUFS, tipc_node_link_down() is called from
  tipc_node_write_unlock() instead.

Fixes: 988f3f1603d4 ("tipc: eliminate message disordering during binding table update")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3: Introduce tipc_node_lxc_xmit() for container communication.
v2: https://lore.kernel.org/netdev/20261102034207.10639-6-tung.quang.nguyen@est.tech/
v1: https://lore.kernel.org/netdev/20261028033722.125477-3-tung.quang.nguyen@est.tech/

 net/tipc/name_distr.c |  32 ++++++---
 net/tipc/name_distr.h |   3 +-
 net/tipc/name_table.c |   1 -
 net/tipc/name_table.h |   2 -
 net/tipc/node.c       | 151 ++++++++++++++++++++++++++++++++----------
 net/tipc/node.h       |   2 +
 6 files changed, 142 insertions(+), 49 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index 1fe650a95eb4..2e07d50a2943 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -95,9 +95,7 @@ struct sk_buff *tipc_named_publish(struct net *net, struct publication *p)
 		list_add_tail_rcu(&p->binding_node, &nt->node_scope);
 		return NULL;
 	}
-	write_lock_bh(&nt->cluster_scope_lock);
 	list_add_tail(&p->binding_node, &nt->cluster_scope);
-	write_unlock_bh(&nt->cluster_scope_lock);
 	skb = named_prepare_buf(net, PUBLICATION, ITEM_SIZE, 0);
 	if (!skb) {
 		pr_warn("Publication distribution failure\n");
@@ -121,9 +119,7 @@ struct sk_buff *tipc_named_withdraw(struct net *net, struct publication *p)
 	struct distr_item *item;
 	struct sk_buff *skb;
 
-	write_lock_bh(&nt->cluster_scope_lock);
 	list_del(&p->binding_node);
-	write_unlock_bh(&nt->cluster_scope_lock);
 	if (p->scope == TIPC_NODE_SCOPE)
 		return NULL;
 
@@ -202,25 +198,39 @@ static void named_distribute(struct net *net, struct sk_buff_head *list,
  * @net: the associated network namespace
  * @dnode: destination node
  * @capabilities: peer node's capabilities
+ * @bearer_id: id of the bearer
+ *
+ * Return:
+ * * 0               - Success
+ * * -ENOBUFS        - No buffer space is available
+ * * -EHOSTUNREACH   - Destination node does not exist or cannot be reached
+ * * -EMSGSIZE       - Message's size is too big
+ *
  */
-void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities)
+int tipc_named_node_up(struct net *net, u32 dnode,
+		       u16 capabilities, int *bearer_id)
 {
 	struct name_table *nt = tipc_name_table(net);
 	struct tipc_net *tn = tipc_net(net);
 	struct sk_buff_head head;
-	u16 seqno;
+	int rc = 0;
 
 	__skb_queue_head_init(&head);
 	spin_lock_bh(&tn->nametbl_lock);
 	if (!(capabilities & TIPC_NAMED_BCAST))
 		nt->rc_dests++;
-	seqno = nt->snd_nxt;
+	named_distribute(net, &head, dnode, &nt->cluster_scope, nt->snd_nxt);
+	if (!skb_queue_empty(&head))
+		rc = tipc_node_distribute(net, &head, dnode, bearer_id, 0);
 	spin_unlock_bh(&tn->nametbl_lock);
 
-	read_lock_bh(&nt->cluster_scope_lock);
-	named_distribute(net, &head, dnode, &nt->cluster_scope, seqno);
-	tipc_node_xmit(net, &head, dnode, 0);
-	read_unlock_bh(&nt->cluster_scope_lock);
+	/* The link is congested after the list is inserted into
+	 * the link's send queue. Return 0, as this is normal.
+	 */
+	if (rc == -ELINKCONG)
+		rc = 0;
+
+	return rc;
 }
 
 /**
diff --git a/net/tipc/name_distr.h b/net/tipc/name_distr.h
index c677f6f082df..767f9f69624d 100644
--- a/net/tipc/name_distr.h
+++ b/net/tipc/name_distr.h
@@ -69,7 +69,8 @@ struct distr_item {
 
 struct sk_buff *tipc_named_publish(struct net *net, struct publication *publ);
 struct sk_buff *tipc_named_withdraw(struct net *net, struct publication *publ);
-void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities);
+int tipc_named_node_up(struct net *net, u32 dnode,
+		       u16 capabilities, int *bearer_id);
 void tipc_named_rcv(struct net *net, struct sk_buff_head *namedq,
 		    u16 *rcv_nxt, bool *open);
 void tipc_named_reinit(struct net *net);
diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
index e8b768699ab9..6bb0333f39bf 100644
--- a/net/tipc/name_table.c
+++ b/net/tipc/name_table.c
@@ -963,7 +963,6 @@ int tipc_nametbl_init(struct net *net)
 
 	INIT_LIST_HEAD(&nt->node_scope);
 	INIT_LIST_HEAD(&nt->cluster_scope);
-	rwlock_init(&nt->cluster_scope_lock);
 	tn->nametbl = nt;
 	spin_lock_init(&tn->nametbl_lock);
 	return 0;
diff --git a/net/tipc/name_table.h b/net/tipc/name_table.h
index 3a15dcfcc2cd..a66975ef8546 100644
--- a/net/tipc/name_table.h
+++ b/net/tipc/name_table.h
@@ -97,7 +97,6 @@ struct publication {
  * @cluster_scope: all local publications with cluster scope
  *               - used by name_distr to send bulk updates to new nodes
  *               - used by name_distr during re-init of name table
- * @cluster_scope_lock: lock for accessing @cluster_scope
  * @local_publ_count: number of publications issued by this node
  * @rc_dests: destination node counter
  * @snd_nxt: next sequence number to be used
@@ -107,7 +106,6 @@ struct name_table {
 	struct hlist_head services[TIPC_NAMETBL_SIZE];
 	struct list_head node_scope;
 	struct list_head cluster_scope;
-	rwlock_t cluster_scope_lock;
 	u32 local_publ_count;
 	u32 rc_dests;
 	u32 snd_nxt;
diff --git a/net/tipc/node.c b/net/tipc/node.c
index dfbeed21dbc1..77979a850df2 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -400,6 +400,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	struct net *net = n->net;
 	u32 flags = n->action_flags;
 	struct list_head *publ_list;
+	int rc = 0, bearer = 0;
 	struct tipc_uaddr ua;
 	u32 bearer_id, node;
 	int err = 0;
@@ -426,7 +427,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 		tipc_publ_notify(net, publ_list, node, n->capabilities);
 
 	if (flags & TIPC_NOTIFY_NODE_UP)
-		tipc_named_node_up(net, node, n->capabilities);
+		rc = tipc_named_node_up(net, node, n->capabilities, &bearer);
 
 	if (flags & TIPC_NOTIFY_LINK_UP) {
 		tipc_mon_peer_up(net, node, bearer_id);
@@ -437,8 +438,15 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 		tipc_nametbl_withdraw(net, &ua, &sk, sk.ref);
 	}
 
-	if (err == -ENOBUFS)
+	if (rc == -ENOBUFS)
+		tipc_node_link_down(n, bearer, false);
+
+	if (err == -ENOBUFS) {
+		if (rc == -ENOBUFS && bearer == bearer_id)
+			return;
+
 		tipc_node_link_down(n, bearer_id, false);
+	}
 }
 
 static void tipc_node_assign_peer_net(struct tipc_node *n, u32 hash_mixes)
@@ -1704,6 +1712,55 @@ static void tipc_lxc_xmit(struct net *peer_net, struct sk_buff_head *list)
 	}
 }
 
+static int tipc_node_lxc_xmit(struct tipc_node *n, struct sk_buff_head *list)
+{
+	bool node_up = false;
+	struct net *peer_net;
+
+	rcu_read_lock();
+	tipc_node_read_lock(n);
+	node_up = node_is_up(n);
+	peer_net = n->peer_net;
+	tipc_node_read_unlock(n);
+
+	if (node_up && peer_net && check_net(peer_net)) {
+		/* xmit inner linux container */
+		tipc_lxc_xmit(peer_net, list);
+		if (likely(skb_queue_empty(list))) {
+			rcu_read_unlock();
+			return 1;
+		}
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+
+static int tipc_node_build_list(struct tipc_node *n, struct sk_buff_head *list,
+				struct sk_buff_head *xmitq, int selector,
+				struct tipc_media_addr *maddr, int *bearer_id)
+{
+	struct tipc_link_entry *le = NULL;
+	int rc = 0;
+
+	tipc_node_read_lock(n);
+	*bearer_id = n->active_links[selector & 1];
+	if (unlikely(*bearer_id == INVALID_BEARER_ID)) {
+		tipc_node_read_unlock(n);
+		__skb_queue_purge(list);
+		return -EHOSTUNREACH;
+	}
+
+	le = &n->links[*bearer_id];
+	*maddr = le->maddr;
+	spin_lock_bh(&le->lock);
+	rc = tipc_link_xmit(le->link, list, xmitq);
+	spin_unlock_bh(&le->lock);
+	tipc_node_read_unlock(n);
+
+	return rc;
+}
+
 /**
  * tipc_node_xmit() - general link level function for message sending
  * @net: the applicable net namespace
@@ -1711,17 +1768,15 @@ static void tipc_lxc_xmit(struct net *peer_net, struct sk_buff_head *list)
  * @dnode: address of destination node
  * @selector: a number used for deterministic link selection
  * Consumes the buffer chain.
- * Return: 0 if success, otherwise: -ELINKCONG,-EHOSTUNREACH,-EMSGSIZE,-ENOBUF
+ * Return: 0 if success, otherwise: -ELINKCONG,-EHOSTUNREACH,-EMSGSIZE,-ENOBUFS
  */
 int tipc_node_xmit(struct net *net, struct sk_buff_head *list,
 		   u32 dnode, int selector)
 {
-	struct tipc_link_entry *le = NULL;
-	struct tipc_node *n;
+	struct tipc_media_addr maddr;
 	struct sk_buff_head xmitq;
-	bool node_up = false;
-	struct net *peer_net;
-	int bearer_id;
+	struct tipc_node *n;
+	int bearer_id = 0;
 	int rc;
 
 	if (in_own_node(net, dnode)) {
@@ -1737,44 +1792,72 @@ int tipc_node_xmit(struct net *net, struct sk_buff_head *list,
 		return -EHOSTUNREACH;
 	}
 
-	rcu_read_lock();
-	tipc_node_read_lock(n);
-	node_up = node_is_up(n);
-	peer_net = n->peer_net;
-	tipc_node_read_unlock(n);
-	if (node_up && peer_net && check_net(peer_net)) {
-		/* xmit inner linux container */
-		tipc_lxc_xmit(peer_net, list);
-		if (likely(skb_queue_empty(list))) {
-			rcu_read_unlock();
-			tipc_node_put(n);
-			return 0;
-		}
+	if (tipc_node_lxc_xmit(n, list)) {
+		tipc_node_put(n);
+		return 0;
 	}
-	rcu_read_unlock();
 
-	tipc_node_read_lock(n);
-	bearer_id = n->active_links[selector & 1];
-	if (unlikely(bearer_id == INVALID_BEARER_ID)) {
-		tipc_node_read_unlock(n);
-		tipc_node_put(n);
+	__skb_queue_head_init(&xmitq);
+	rc = tipc_node_build_list(n, list, &xmitq, selector,
+				  &maddr, &bearer_id);
+
+	if (unlikely(rc == -ENOBUFS)) {
+		if (!skb_queue_empty(&xmitq))
+			__skb_queue_purge(&xmitq);
+		tipc_node_link_down(n, bearer_id, false);
+	} else {
+		tipc_bearer_xmit(net, bearer_id, &xmitq, &maddr, n);
+	}
+
+	tipc_node_put(n);
+
+	return rc;
+}
+
+/**
+ * tipc_node_distribute() - distribute list of messages to specific destination
+ * @net: the applicable net namespace
+ * @list: chain of buffers containing message
+ * @dnode: address of destination node
+ * @bearer_id: id of the bearer
+ * @selector: a number used for deterministic link selection
+ *
+ * Return:
+ * * 0              - Success
+ * * -ELINKCONG     - Link is congested
+ * * -EHOSTUNREACH  - Host is not reachable
+ * * -EMSGSIZE      - Message's size is too big
+ * * -ENOBUFS       - No buffer space is available
+ *
+ */
+int tipc_node_distribute(struct net *net, struct sk_buff_head *list,
+			 u32 dnode, int *bearer_id, int selector)
+{
+	struct tipc_media_addr maddr;
+	struct sk_buff_head xmitq;
+	struct tipc_node *n;
+	int rc;
+
+	n = tipc_node_find(net, dnode);
+	if (unlikely(!n)) {
 		__skb_queue_purge(list);
 		return -EHOSTUNREACH;
 	}
 
+	if (tipc_node_lxc_xmit(n, list)) {
+		tipc_node_put(n);
+		return 0;
+	}
+
 	__skb_queue_head_init(&xmitq);
-	le = &n->links[bearer_id];
-	spin_lock_bh(&le->lock);
-	rc = tipc_link_xmit(le->link, list, &xmitq);
-	spin_unlock_bh(&le->lock);
-	tipc_node_read_unlock(n);
+	rc = tipc_node_build_list(n, list, &xmitq, selector,
+				  &maddr, bearer_id);
 
 	if (unlikely(rc == -ENOBUFS)) {
 		if (!skb_queue_empty(&xmitq))
 			__skb_queue_purge(&xmitq);
-		tipc_node_link_down(n, bearer_id, false);
 	} else {
-		tipc_bearer_xmit(net, bearer_id, &xmitq, &le->maddr, n);
+		tipc_bearer_xmit(net, *bearer_id, &xmitq, &maddr, n);
 	}
 
 	tipc_node_put(n);
diff --git a/net/tipc/node.h b/net/tipc/node.h
index 411fac8c00ce..499e8ea8c753 100644
--- a/net/tipc/node.h
+++ b/net/tipc/node.h
@@ -100,6 +100,8 @@ int tipc_node_get_linkname(struct net *net, u32 bearer_id, u32 node,
 			   char *linkname, size_t len);
 int tipc_node_xmit(struct net *net, struct sk_buff_head *list, u32 dnode,
 		   int selector);
+int tipc_node_distribute(struct net *net, struct sk_buff_head *list,
+			 u32 dnode, int *bearer_id, int selector);
 int tipc_node_distr_xmit(struct net *net, struct sk_buff_head *list);
 int tipc_node_xmit_skb(struct net *net, struct sk_buff *skb, u32 dest,
 		       u32 selector);
-- 
2.53.0

