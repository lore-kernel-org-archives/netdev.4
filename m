Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810996;
	b=obPEKNlx+V6akk5+DBN0I/p+clFY0RxICH7rPvUDxZUw/62TE/ZppQOqnowM8oc4p/iN
	 8xr9l0YuJzDx51qG8Mn3nxVzqGQDbjkz3PjlXI0ZPNQe65nH79mytAcCsz8h4mH2UOEHK
	 ZCARXUERHTJb2R5lKKsuqVXbq6f00FpVm7/fbRBrt/W6/wV7DS7YqRMo+JxEswpRQrmk/
	 o3TgjMoicD7cG3KVrtWsSEaPOwUZUERndRVSE/hdZCEvOqnDNKtz23cVLWmYpr09BxSBH
	 cS1ow6fMXnBQOvHEASgtiuFVDrmu+A3JAdma0Uc83PWdAET+JwmB1THA5qb7YnnD5Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810996;
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
	bh=U9K9sNH40599Vt+FFsfWItF8DlEXe1YUHw6BHxssBUg=;
	b=YSNH/6TGQ0P0+bVqyiVdjaRL9M6QymNHl0U5IwzfE3ZUsjlGjiPKPx/cgpJzfXjp9VB/
	 LD2U91CjmVvrhOi+xRc4WlYAdeQGVC2exdv46YDhi2gSVbOYsQiQa/6IuAcY3uZ8e1GD6
	 guUsjJ1huRGxWo+v5Nn6igrlRhg2B6LrCKqkWmpVIMz88CDznUmtZG8rL9tmu1iBfu9jj
	 sokwmsuGyaigrYMbPpm8yx62Ma5EIzXePSRk1frHjvdQKwgT7+EligzWUyKc01h6Y3uHg
	 8l+kuD9KFSXQ6a+IzX2P6IKwRwi5ZZA8W+sGWfMtNNLIzaaSLpVWMzL+SQERqFjDgNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=IXBUnIiX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.14
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC1606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=IXBUnIiX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCe04wtsapawRoYvdaAGTAmh7ngii4ag0W0NPCouQ/L6V9R1i/D/dX0XNgWgftEkZY+Xs6FN7LVX8LahvbkR1KM1/mBYL1jFCRUiM+7RJtMd/9FlxRTxtJ8iZSKdpEOu1v0rwipqGnbOXn59eNPEPwX0xyFl/VgdogXVT2ndaNNBVJMSaujarqoYgrMvr3lv+rh7et/OZlYAp9KyDvAMmOwlYvXBeTourop6OZPEyfUgesbJRBjTrlpK68zMXuzGRIVh4cySOLYjsFL0JsmVjtsS7lFr+8uCEOH8YBUS+1GEPD4AGWH96N19e4AkZElartLI6A3p2E2JdhskFG6deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9K9sNH40599Vt+FFsfWItF8DlEXe1YUHw6BHxssBUg=;
 b=iVoBPS6DuNxb/gz93VwGjFjfzL6tGQIPQKM8MS+ieHVxa81OQ2I6VajkSpvXrcNXTWOyii80HIntnZBtL5nOh6A4TTCkFN4zMy1ylQas2wzJm6mNMSeLr56LAeijVPUarH3p7yu9F+CZWDFBj4Q8b62zlWFUm/4D6wAhZM1r1c5kv3G6zH/Nulj6S93rxNoZYuxf23YUd7GjQtNrTjOo8Yt5HTNmW78AwMP6XkRFEEd4Z5RZA/Gqrp9RgaOsrhnuzkMxZ+cPyUwagAnSh63dECqCj8A+AGgtSFY1CUfND6Ftd4CK5oYVDIZtMN9FDdHto6R0o2sAEDz186WlYYhb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9K9sNH40599Vt+FFsfWItF8DlEXe1YUHw6BHxssBUg=;
 b=IXBUnIiXmpd1CZKhAYHi3OFT8jEikSlXPUj+0JRbP7P3DkVUoEXeUeuI5kIuH6XJcFQGxdr3O0SaxHvMLT5dLOxANV7kCh3v8eIVKFsuHw0hZuNCzbkPk5x/pPsnxMMiKyvWdnqekBZxF4JE0KPVyp5zZyxTAbZb+XIBHyuu+jkkl20+5c1ouIHBthP7zy8Te4Fgb0d2fYatBEjaEhCCuuI5vYWnD6HvVAtlCpm+obO5aip5+XLvRcDuLBSM99wNNRNSbIFgkRmEFUhuYS260xWOQUauGUcSduCBzHDH2+vv+My41pjlrJTjGykQ3daHa726ikfh941aWWkVqMqxfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI2P189MB3564.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:31 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:31 +0000
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
Subject: [PATCH net v3 5/7] tipc: validate original address of received skb in tipc_named_rcv()
Date: Mon, 16 Nov 2026 13:34:54 +0700
Message-ID: <20261116063529.6185-6-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: AM7P189MB1137:EE_|VI2P189MB3564:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d41724-a415-483e-0aa8-08df43abf351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|4022899009|23010399003|366016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Dftx/D4Nuw/YV73p/gdWGzWIbzCyJRYPV8/rrzeJ0qHlLrdn0dKm/Q4BmFR1MMaiCKGiVkh5HtsD+/xziiyt6yG83kQk/7ZIikAgvkFyoeOnmycx7sqLSojP1tRHe3XQ43FWpaWJ6IhtY02dCFT8E98DHjuiW/0O3+ptoWD3kTJoaWQQr8FjfJIGHASR9aKf21dCJOaUaRpqQzkgwO0MISAk2BhxYcSA9Ejll9lIos+KunY9PGllbbrEyBNU+3r88B0T1srEcw43kYbS3TsT1A7o7MdMRhu+2c6yJFcUpasQXIRY6cYshIrh5faMHxlfBkoZ3zT4m1hfJewf4gVjTaxSJP/UgyzyvF+Cyi0pkGm8gzW85uyzdQuHttQnfyxzNR4SIvHYCfK/lxRu0zP2i2tw8VR7FE/N6QTPe5ECMAlzO94mQLj9whpanig8wFt4P3uA6+GN57a3iiRqUZz422h+ddpAo1einY6xgIdEh0cM6YUU6QpyYIJyesKkNkIdjW5M3tjLN8yzMlEG2pVHVZgGa3dnSSxKc3PQWpjjfZuVmcEEZU0EfSbwwwKU5ax77qZAIDFjvIzZXMlNRoMCw6YQ9XnQw3TeB1w7MGFAPBJXYGnMeItsyRJ7jm6lqd8JeZdvrViMfUegn4sq1TKYdS2Z767w2F91wS4MeTX2aTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(4022899009)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pGrYHHoa/rKYBsj5zh76hjin6IArDNRXok2mZnWusZxKBFYxaHUCx19RW79w?=
 =?us-ascii?Q?9GxLIaR+oIsk4ByoR5qW+txjTSXFB3CJxBxqgaY8R5Umfv105Xfj45Ok1chs?=
 =?us-ascii?Q?7sm5KIwtCY+95gj/NxaGX3baLO2VHZU/6F5ASmj7AtGD3s6kgaTRrvT6OLoU?=
 =?us-ascii?Q?efSpE9WWkj762M5uRdk+YV+MQ3V5fXkfhZ9SUuo8T003umtPlCwOp2AYgrSQ?=
 =?us-ascii?Q?O79sR7lZ+CHduiguIC0q3aiZrJfq5djLlS0XYHK4laPkg/NyUkd9VzvRPAj/?=
 =?us-ascii?Q?mr4KtArudI3GzKgBzhNIA57Qpvliwfun++GTlodUjQZ+SgrX722afCQsle9J?=
 =?us-ascii?Q?V1oGRrAeqmSiMGOFdv5YyfsG679oG8xgylGnqgPtaatWKsBvg2+EqxewPVx9?=
 =?us-ascii?Q?GM4QFl8Hg+BBrjz0Eche0yOR413FRuFjnYATx8pQhcM3gKXqgfJqYgI06DXo?=
 =?us-ascii?Q?FHuPlHYU+MkHdWrBjHD9yM9oXhFXpEZvwJIlFKccSamdDoaXJayUR62pKZ6m?=
 =?us-ascii?Q?TpQjPe8+B/XZsXbx2Hd/jxYPl+ccvO6O63MLKUb+EYKrG4VkvxOAt6B9pFJk?=
 =?us-ascii?Q?WdsPoFSxzffRVqtUIa0eCzAqafyPavL+Ldmkny6udD4WG27L4Kx+Soiav10F?=
 =?us-ascii?Q?O7HjrT4+4/SFeYWijkJXsCyv9f/0ye7dyvGylgOZrd7tXsARRZ84E9tePae4?=
 =?us-ascii?Q?0ZIDfOzzlK50gMBJk4gQvFlsS/dTmSn6u1d655DwdPa81HLN+5VbHxaCk1IV?=
 =?us-ascii?Q?81krK460go2b8X6Q5DfEFnXA9+6Eo0DzqJx5ZWrQZmDqEo7hAdd8HiQXg2cJ?=
 =?us-ascii?Q?zC4jc3JlcckU9Iq9lZJg0UFnFC3JrR3PU2QVhgF5a7ha8T39jbPEEP4j5uyh?=
 =?us-ascii?Q?6ZtW2fDnPqx+CDi0K6/1+C1rUr16m3HZ7L5n++5tPXP43b4+NR14ekbu1lB/?=
 =?us-ascii?Q?AIdTn9RFf5kpMIEudPl92AOhJXOVAY6I6Y9dWPqYLavwPHg19Do4PlraZezu?=
 =?us-ascii?Q?E8scOxZ8/f4h3LsHtYsUaOZj5I0RuwjDOMT53gfzPyjNIOvFmiluw0usiQTV?=
 =?us-ascii?Q?ztjn3pRBdqx//cvAuASrwg4Wuu0KKYxjfzHT15i1cvVG/wkKXiRpAJ/D3pvU?=
 =?us-ascii?Q?NZmfqJm16WAsrmqCv9prNSEIROmc0elFUP922IfZw0NW1fgPnYB2pzxDMkyZ?=
 =?us-ascii?Q?dyb2IJ0uhb287cIl7Gdrrz1mds4LC2/c9n1iyH25OFKk9+GfpGxGIcIJJjzQ?=
 =?us-ascii?Q?+fUQv2TVWMWkr1KWzkaKlK78Z1VXaaOkHQmPYXZpsMYEC+MgSXsThiwgvKNK?=
 =?us-ascii?Q?z71k4XnhVYuaS6Nxx/4kbD73RoDx4+qfk5EbgWMbmDq6VKArLRP4JQgvR7w6?=
 =?us-ascii?Q?mgDga8jTE+wtv7yZblSmY9BGqrTvUhDz/NLP+503JEGiRlRFZHlx68trW9K4?=
 =?us-ascii?Q?4ur9y0PFEMRaKDmYMBw4mMnhv97xZ57PRywQLxeZit42FLRusL2yUlOwteVt?=
 =?us-ascii?Q?ScMhQnqp/PR2IXburtFxxioM6sO1inTD+f5C8SAjUuzjgxTq1XNGPrNlvOw+?=
 =?us-ascii?Q?Qfh6zVhqxtW4+VUF2c5fPOsPUGZCUGsMD7e/DNJ4yI+QlqtK7Ir+AmXCIW86?=
 =?us-ascii?Q?Hei3fZ5DknpDa6EcaSAd/jLuVIrCyFAmltDSsN8Qe8G/5eFD1ORQ5NtqGed3?=
 =?us-ascii?Q?n+XYWOjE+dTeg1H2lTBU96nxP4a2bodq7nXeGs1Dh1HUyDJPasvOYnD4tZf4?=
 =?us-ascii?Q?nx+iOXNYhvtgum5pg7tI5jx0QexrQj3ovv/gW9m/4sAXTEDzt4RL81X34Zzd?=
X-MS-Exchange-AntiSpam-MessageData-1: UG+PVDrqdINi2Kyk6aZu8SsvqevdJLI6/oQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d41724-a415-483e-0aa8-08df43abf351
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:31.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOMsKPb5cRWN7ktZ2kKQyGIUNFyKbZWRZrOaUJM2BUcWYXSJlIlbLqz+njx1qFVhbOgAlq5KIhe+k8w8rFwyeDlEvvUID4f4MDYjBboCHtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3564

Code inspection reveals that tipc_named_rcv() does not validate the
original address of received packets. This can lead to two issues:

1. A remote peer can send a publication message whose original address
   is equal to the local node's address or is unknown. Upon receiving
   this message, the local node can follow this execution path:

   tipc_named_rcv()
    tipc_update_nametbl()
     tipc_nametbl_insert_publ()
     tipc_node_subscribe()
      return NULL;

   As a result, the inserted publication is not added to the local
   node's publ_list. Consequently, the publication will not be removed
   later when this list is traversed for publication removal.

2. A remote peer can send a withdrawal message whose original address
   is equal to the local node's address or is unknown. Upon receiving
   this message, the local node can follow this execution path:

   tipc_named_rcv()
    tipc_update_nametbl()
     tipc_nametbl_remove_publ()
      tipc_node_unsubscribe()
       return NULL;
      kfree_rcu(p, rcu);

   As a result, the publication is freed, but p->binding_node remains
   linked to the local node's publ_list. Subsequent traversal of this
   list will access freed memory.

Fix these issues by validating the original address of received
messages and rejecting those with invalid addresses.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
 net/tipc/name_distr.c |  8 ++++++++
 net/tipc/node.c       | 34 ++++++++++++++++++++++++++--------
 net/tipc/node.h       |  1 +
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index 3ea5e900cb45..1fe650a95eb4 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -378,18 +378,26 @@ void tipc_named_rcv(struct net *net, struct sk_buff_head *namedq,
 	struct distr_item *item;
 	struct tipc_msg *hdr;
 	struct sk_buff *skb;
+	struct tipc_node *n;
 	u32 count, node;
 
 	spin_lock_bh(&tn->nametbl_lock);
 	while ((skb = tipc_named_dequeue(namedq, rcv_nxt, open))) {
 		hdr = buf_msg(skb);
 		node = msg_orignode(hdr);
+		n = tipc_node_find_remote(net, node);
+		if (!n)
+			goto free_skb;
+		else
+			tipc_node_put(n);
+
 		item = (struct distr_item *)msg_data(hdr);
 		count = msg_data_sz(hdr) / ITEM_SIZE;
 		while (count--) {
 			tipc_update_nametbl(net, item, node, msg_type(hdr));
 			item++;
 		}
+free_skb:
 		kfree_skb(skb);
 	}
 	spin_unlock_bh(&tn->nametbl_lock);
diff --git a/net/tipc/node.c b/net/tipc/node.c
index 870f84e2fb1c..dfbeed21dbc1 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -657,16 +657,37 @@ void tipc_node_stop(struct net *net)
 	spin_unlock_bh(&tn->node_list_lock);
 }
 
-void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr)
+/**
+ * tipc_node_find_remote - Find a node associated with an address
+ * @net: the associated network namespace
+ * @addr: node's address
+ *
+ * Return:
+ * * Found node - Success
+ * * NULL       - Invalid node's address
+ *
+ */
+struct tipc_node *tipc_node_find_remote(struct net *net, u32 addr)
 {
 	struct tipc_node *n;
 
 	if (in_own_node(net, addr))
-		return;
+		return NULL;
 
 	n = tipc_node_find(net, addr);
+	if (!n)
+		return NULL;
+
+	return n;
+}
+
+void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr)
+{
+	struct tipc_node *n;
+
+	n = tipc_node_find_remote(net, addr);
 	if (!n) {
-		pr_warn("Node subscribe rejected, unknown node 0x%x\n", addr);
+		pr_warn("Node subscribe rejected, invalid node 0x%x\n", addr);
 		return;
 	}
 	tipc_node_write_lock(n);
@@ -679,12 +700,9 @@ void tipc_node_unsubscribe(struct net *net, struct list_head *subscr, u32 addr)
 {
 	struct tipc_node *n;
 
-	if (in_own_node(net, addr))
-		return;
-
-	n = tipc_node_find(net, addr);
+	n = tipc_node_find_remote(net, addr);
 	if (!n) {
-		pr_warn("Node unsubscribe rejected, unknown node 0x%x\n", addr);
+		pr_warn("Node unsubscribe rejected, invalid node 0x%x\n", addr);
 		return;
 	}
 	tipc_node_write_lock(n);
diff --git a/net/tipc/node.h b/net/tipc/node.h
index 154a5bbb0d29..411fac8c00ce 100644
--- a/net/tipc/node.h
+++ b/net/tipc/node.h
@@ -103,6 +103,7 @@ int tipc_node_xmit(struct net *net, struct sk_buff_head *list, u32 dnode,
 int tipc_node_distr_xmit(struct net *net, struct sk_buff_head *list);
 int tipc_node_xmit_skb(struct net *net, struct sk_buff *skb, u32 dest,
 		       u32 selector);
+struct tipc_node *tipc_node_find_remote(struct net *net, u32 addr);
 void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr);
 void tipc_node_unsubscribe(struct net *net, struct list_head *subscr, u32 addr);
 void tipc_node_broadcast(struct net *net, struct sk_buff *skb, int rc_dests);
-- 
2.53.0

