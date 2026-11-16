Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810950;
	b=QP/u0FILj1SH/7yp8Q+UCmY+cMNBrsQm6RX1PcXKrQhsa4CIlyB40ISsMQHztPVu2Rus
	 VEau1vY1OjOkK9iDVmeehGmcFKfJyfJByamEMcTSIDa7fWW/wrmNHs95emVOMwAMP31Mj
	 g1jKKQgUol21oo2znY+F69zciVwtpbQrmkrqBYQebdfS2/WAOTeICeksb02wHdIo56YiE
	 KlvbMTksueftlDpp9aPCC6M16neIhv4nX/pjDDyjY+rPdh49eR3QiCvHUjnZZ0P2Hu76a
	 bkPAsK9dY2yF9vlJiqMJ6l2tJga2OXCWo4HZ5K65/As+/L5KWlfgJKTqyf9iUDHPEBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810950;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=umBj2giA3PDVF8Ui7mBhGRD+V32U/qTfgBV8ATXRNOY=;
	b=XxrwE+fA9AFUX7TvKX5Bm3/165997vfbmoaaqOitL1PdIWuLjEuwgS4KClxrN0vkfMLe
	 9f0vYIxidO4FcxOV6zWmA6j+VZJirx/TLnn2gRwdVP/h7HHb31P7biWwMpte4x6MaWX5G
	 ouo4INo26pnMjLbwrbUZsD6OX89uUAm+bOh+Z20sXIkJidpwPRwqMOY06pRoiR46d4Jnv
	 gk2YxBOOA0liUUc83wIHQpPWpBIuryRczaRWJHg9sQ57oX2CjoMYZyJE6jazvKt7zrkoe
	 BaUJAm3XKt4U8NCFkhXLJsQHEKM6XFgwy8+qBiWij4NqoqCUI9F1gLe2sq8BERa510w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=NaiBOy6H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D7606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=NaiBOy6H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbgjI2bVSI2PWlEqdn9AMKZWwFuehW7dC85i96K+pXIvVbLtDG+2NZjzhPSSAe9osIRFAtq13qLaOZ4diU62/2vatH733fsLvu4bP4KL755cPB346KiXaiI9GEzObWK9vCxMD4C1uvTw/TO1y3dTNTasZlW7Gn2iGIRdtIjyUp4zHfQIJ35zDJ3uXiVlQHI6aqWE5Z9+8n01BsVGbngqddBvvNvjuG6BpVH14LZ9pVYELlZ+d6a6Ik48eHYRJob7rAsNpdnECa+P+RnOrH4+7xiyIfPph/fub3nOwqgsJBTMaAmwVCTqQXOoP09UzrXs1MP2wXLeAUbgHB6ZHaujZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umBj2giA3PDVF8Ui7mBhGRD+V32U/qTfgBV8ATXRNOY=;
 b=k6A7IQD2hJCKdsFuHm208BEb7hBGtCW1uB646gNtFgDCisx7M27UUvOI/vwSFCOhC/o5YWAAwJSBY7XEC8aRSoTuRNKWaIaaUY+epR2MjSfgnkNGTDw8JomFwHEqvRut5gui0ZKJzr5g8nPBPJWVQMi7uX4PNX6yc05IuOCwYlfClcIpd+swEHfm3XGTRlE6idgsF7m8QgILwkZ9U2zT28blMZ8fk5xrqlRJCaNwRLl/Uf3kJuIrF2Aeuz9tpoXI0EqApJzyGjzi8nl+kOPKcikql0lQlCnIEVt4+8k+GC1qqkW8izh6S3vbAfim7a7LkK44+Y40JynVOMy59oYgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umBj2giA3PDVF8Ui7mBhGRD+V32U/qTfgBV8ATXRNOY=;
 b=NaiBOy6H76OJJtaY8zuuwfCykxQbSbIHhK2LqxYYXw0tmoDlnQl+qkJQIIN5pSqIa9PmHA6zhxtzLJlrQ1Xy/FxkLFRkQtD7u7kpLquBuohH1DuDTL+YpfMBy3JKvQ58pQx3SeoBS7GTVPKuRKz5LkjTxp+0B4O9Hp6YaLBnWkDmNay+TBTAYZrWKNgJoIijIYcZLaf2AUqeQzMzmfBLCGTWgxLakUgB1kZIk0qM5u1EWBfshXkOsIdOwt6SQ3ENuJ1lfgQTV5NvF4NF8dZ/V6HIMCQIsQcMNugNbtby02teXMlChdRoO4OXYXie0xOZdnjTv5FN5Z29iu6EmZlnuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI0P189MB3463.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:35:44 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:35:44 +0000
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
Subject: [PATCH net v3 0/7] tipc: fix deadlock and NUll pointer dereference in tipc_named_node_up()
Date: Mon, 16 Nov 2026 13:34:49 +0700
Message-ID: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
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
X-MS-TrafficTypeDiagnostic: AM7P189MB1137:EE_|VI0P189MB3463:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d586a2-3498-4797-525c-08df43abd75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0qkay9dj0FeBDDcRFrZTLiN4Jvb6iUFaprKi+9LaP9WxFeZQw9X2k8gdUU/FRmoL9p9l/qjFz0AhEfnZ8e5XhgoTHBCTWIQX5x5G8WuUuYfeG+2fG5aOPQcShviLgGU7PyyxepkpquXffgv8dloYWWFvKpk57WYvvdUfqwod1CZYHl32/v+breROjxaaN4PaOw0c+38FRMJaVWWXTsuLZp3F6gvF9wgu+ROQ1mmVyJRjimgazCLizC3M+K4wM+t0xPXHpemuHeCrfeoix/9PxtRcWS17sQHlZci4Y0ATvvOL4NqVS2OLAity0IzPKF2JLi/joEFQyFy6kockY8gtA9N06jFlMegD3pKGM0NhpxEUuO9cYrtfSIOC1xe2NieSTrM/Otu75ZJkhR23ViK8Z2dB0cNGFZfBP9jlHmTgJrDa0hkzLWCAsU4EeWCc3YqbGnmaKBHBROaH1LEqMp8VRwAOocbTDeiBKA9IuginH48f5Iyymj/82zNVeiLCkv1e6hkPeI2csEi0TdRq+rOFSdMQHFjjvb/8c6KRU2afvOBpmCi2tqQeY6MivND0KPFpcMiR4pHqadhfKubFo7H3rliGr0Yu5dvip40Bk76TK1sZ0gsOdqvXy2DHLEftvdU1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k2m2bCNfuestmbXPImsByNsK/CMLvi/j3r2V7Jl5gCoC/E9n85iFsn05ssjS?=
 =?us-ascii?Q?0syw/AWc6kvzjfLXorq+6ObaTFTOOy5HejSIj4rfENb7b9p7APwO2He8iSTK?=
 =?us-ascii?Q?3Q/aC2v9Ui5ZWCISVZ14uwtJs3Yajzexc1pZj/rLu0L8nEvWJZKHmFgRgLJ4?=
 =?us-ascii?Q?we88UTBSKio0Vnqa9oCcJtaky9sDOcVjLvwnDucqMTogxvTJP56ldd08lLwT?=
 =?us-ascii?Q?CrXv9WWyNETjyUKbXvpLjbEw80nC04iBhmAjv/aiSC2XhQbdY0z10IB0BlWZ?=
 =?us-ascii?Q?7AluGQuRIhnfiu2WZ40I9yYk4PolIG9SXmPXbIUnCNCygPGr88AtOlZ+dVgr?=
 =?us-ascii?Q?QWrlOQZzZs53O+fuGzirsuYXZuk824LFuG9Ob/aRYWZfT3ow3wbAVuJCeJFi?=
 =?us-ascii?Q?egY+Eifd5AoFOCj6ReOJ2ETwxISTaApjj+Ntf8F/TpuqGANY7sNlI060Kddw?=
 =?us-ascii?Q?C8XGF+RMajr3uwJMvA7c1XTisblt0At3MIuWPknZ/ePElYKxN10o553/hyaD?=
 =?us-ascii?Q?ht2pdLfARPjn3Bg2zQ3uprvC20EogAWukOFQiPd9i7sf62BVXiwU4oFjoJ/R?=
 =?us-ascii?Q?IchcYhkdjdArRA66qnchH+IE3w9AcoSVSxWqwgZrPSxcYlIxQE831PjBaH4Y?=
 =?us-ascii?Q?cNd2p/H2IUnQrHTAvSUKcXTf/GoWGa+mYTXZTi828tS7Ai08sO+MRB4WD3nb?=
 =?us-ascii?Q?spgsBO8VFf95dhYediOq759tNgv+kY1uqVXmywDa/ywRF7hEjbRggAj5FKxZ?=
 =?us-ascii?Q?nEM7qsRbuP0UU/s7CSvC+Z97RHaU/jzjx9bpV56AH6gQMiz54UZYq6ZFmfAs?=
 =?us-ascii?Q?mzNogH4twOLsVfl0XCsGxzhX1oWiTKfL4fVRVV9nWKZ+jndv5Dwj5a+oYp4b?=
 =?us-ascii?Q?dGxMaf4Lo4aykMEvLV/qoQy6xPI2jObykDEVeMz6dMb2X0e+otLfZO1uJYXc?=
 =?us-ascii?Q?9uXEOrPLHiNdh3mK2lPXmJk1DMLfQxOEnVh+XQ7hGQRvFBK/o8bDaYFWo6AC?=
 =?us-ascii?Q?vnq4AuTxQgYUa74//x4xTlZZny00yUB4O7pAg7cDkYz6ckXVRwqO0BRMb07z?=
 =?us-ascii?Q?BROZsckmOyS4gxNdtIlVRnO2EKUGkE1hkKX4N2oucbwkgI0nmc6E4CASQL9u?=
 =?us-ascii?Q?D3lNa4y82ZRnSH72gtzX/ckTuWMCJQjRVKXCyfL63HwQ5ySfs7PQEOe6wzSO?=
 =?us-ascii?Q?HtCFol9kWQJudIfz/RwsKlSujQF9N5+t1iFwYzyvq0RgH8eF+zGMMsdkaui6?=
 =?us-ascii?Q?Rr/M5Ko+TAZnuIsc57/TFWoAFDyfj1XImJMu2TZaZ4buy/RIbqppTnWGJ9S0?=
 =?us-ascii?Q?Bl+gYk9cvW2nWRwbXPhrm7zxMSREqUSOnBYQ1G8aSIB2BwIJq5X3bsaBTh+o?=
 =?us-ascii?Q?84fVkheQ2P11IwI05dwv9xUGLxn8mXKV7COL43SxUaOj7k9tkugiSGloO7vj?=
 =?us-ascii?Q?aJDcNQsizwRzM9KqoC6ad+J+UwVS0rkLNO+z416T8h2MztkmojMKWplJqWEZ?=
 =?us-ascii?Q?FFIdB9R/nWITiasQNPijx+bi/WNcTb1SL5m3rRUv6XvwvU8kVm2TZYC9liuS?=
 =?us-ascii?Q?6pIBEWEpKjUBaVOZzVePkQsfIO6HpKK43rVDZNlSSIKm+xm/LT/6sFxCAHdI?=
 =?us-ascii?Q?gNkkxGYKVMZLBO4JtcWOw/D0QPcGEdjnNgS1qoRxP0mTOG9Zl9zg79Kr0S9m?=
 =?us-ascii?Q?LmAbJfz8B+uxj9AtY5h1/5Ogt3UaQESoYxG6xZ+R0j1XG9cY/On+LiUd4+HC?=
 =?us-ascii?Q?plmGl1V0YYpWdzylSYEMFxKuqJngzlUtnFzDryqc6rVEX3yTAkpqqKjxAn/J?=
X-MS-Exchange-AntiSpam-MessageData-1: F7DimUbMASmgPijFHNU2ud+ZjYddJR1fFOE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d586a2-3498-4797-525c-08df43abd75d
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:35:44.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCXYE+XvzWhEgLFGI3nvdhVqD732l4c1z/wgJF6Eu0PvAMK6UfxfXB9aeGYWMJlVrKZWc5/3+KlkiC4OtohfWvY+phiyySH2iN6fVRJ69V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3463

Patch 1 fixes a memory leak in tipc_node_xmit().

Patch 2 fixes a dangling link in the cluster_scope list during network
namespace teardown.

Patch 3 fixes incorrect initialization of the replicast node counter.

Patch 4 fixes a missing link-up event when memory allocation fails.

Patch 5 fixes missing validation of the original address of a received skb in
tipc_named_rcv().

Patch 6 fixes a self-deadlock when inspecting tipc_named_node_up().

Patch 7 fixes a NULL pointer dereference caused by a race between the
tipc_net_finalize work and tipc_named_node_up(). This issue was also
reported by syzbot.

v3:
- Patch 3: Add Cc: lkp@intel.com to the changelog to address a warning, and
remove the unnecessary nt->rc_dests = 0 assignment from tipc_nametbl_init().

- Patch 4: Free sr and sc on memory allocation failure, and purge xmitq in
tipc_rcv() if tipc_node_write_unlock() resets a bearer.

- Add patch 5 to fix pre-existing issues discovered while reviewing Patch 7.

- Patch 6: Introduce tipc_node_lxc_xmit() for container communication.

- Patch 7: Initialize p to NULL in tipc_net_finalize() to address a warning,
and reset the correct bearer in tipc_node_write_unlock().

v2: https://lore.kernel.org/netdev/20261102034207.10639-1-tung.quang.nguyen@est.tech/
v1: https://lore.kernel.org/netdev/20261028033722.125477-1-tung.quang.nguyen@est.tech/

Tung Nguyen (7):
  tipc: fix memory leak in tipc_node_xmit()
  tipc: fix dangling link in cluster_scope list in tipc_service_delete()
  tipc: fix incorrect initialization of replicast node counter
  tipc: fix missing link-up event on memory allocation failure
  tipc: validate original address of received skb in tipc_named_rcv()
  tipc: fix self-deadlock in tipc_named_node_up
  tipc: fix NULL pointer dereference in named_distribute()

 net/tipc/core.c       |   1 +
 net/tipc/core.h       |   2 +
 net/tipc/name_distr.c | 133 ++++++++++++++++++---
 net/tipc/name_distr.h |   4 +-
 net/tipc/name_table.c | 174 +++++++++++++++++++++++----
 net/tipc/name_table.h |  11 +-
 net/tipc/net.c        |  19 ++-
 net/tipc/node.c       | 272 ++++++++++++++++++++++++++++++++++--------
 net/tipc/node.h       |   4 +
 net/tipc/socket.c     |   3 +-
 10 files changed, 526 insertions(+), 97 deletions(-)

-- 
2.53.0

