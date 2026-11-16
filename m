Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810970;
	b=IVPQSJQrBS6ZLkCVLT4qPs/mJZgejasnVb7C3PP3VH23pn3N3al+My8RqQxJxpu9guog
	 L/r7UQUPm2FWQMU9gWj41uLQkW16EmW/gMv4j6zWAR0Ftji3O4GurUAmix++n3FlRb9Zs
	 bnGIEF/W7mwvlI5UJUidZhnca9jE63cu9MqxKk92ASiUY9Ybrv+LWa1tGEgLRW8E7KRWu
	 zYd2mxL9heLlsi6ySVnvP6kRF54TYiZV6VBYDTVMCenVyPeNjC9WpBIjAcsapu3cALgiZ
	 NFuG6pF4yA9fE/FPBAEnc7HGNmy2WmMI/xfgttum0i5CeHxKCQrD0gjM3OkXBSYIfqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810970;
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
	bh=HhKpkyc0mfRU403/zKtkJR+2qw/GUCWU9xEaXnZ5S+w=;
	b=ZxS+SG24znnhcFzJzt9Qxs5NsYJmPIHOVZQ6a3nzMT4f6afYtsoKMF6FRYF1aBWkYX02
	 48hCnRF0MofN+1Q0UZn070goqGfE07tv5r/q752/XTynSUq1iAivjdjTHk36JUF+/1P4W
	 a5FSxjZe4qDPEZKfCipYjS7oTXndQpnImR8lXWYjc7Ffgj6CBXz8VpnQfDSlD9P1O9qPE
	 8RV5Var8Dxpj/f08IPoXgB/t3gCZfsTPCMxjMbKDndQtdhgJV/OaQkqTsbpyzu0zSkAvh
	 tOTmmEuOQ1qRPKEZeC/PkI8UWCkv/PKSpvo1la3KJ4rxKn+16qYLtyJDRiumxKLPmjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b="V1/K7AhI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.43
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BA606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=V1/K7AhI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUAFjyddyo5K/XVlKudtF4MzHphD2Czas8rXiBrOjtJRmRrXFnozAVEJ0j1Nw/TtW1oLuPT2xHar2ABKt0UFP66wyLiVyaaZG3urGijEiL8A3klTUpGfjIXag3YfOd5D3INzZW1UuFOdwphc1AX7tZQXOP+avDTQYIPYDnrkJWvsJYtDOJPttiUy/PGh/2vfa0bLgj1DarK8+10Oec0J65OHZRDT4WNUB01Rbl+q3cCFFuhsHjTl4MJn3mDTcKbFonZZe7cjLCdGtLQTv6X5Znw3ehYVPK/1ia9SgszGbmiMqpDYTiyQmtIJP+wYXyq4Q6YKNGZIZkVhhc1sNp31jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhKpkyc0mfRU403/zKtkJR+2qw/GUCWU9xEaXnZ5S+w=;
 b=yI6IrXCwYw1e7RHXL9XzRdKkq3IY+RjbC4tumFUh98zs3yayEfr2husREDaoYhjERK74wKPoyiQdXlc+r7ff46vWU9XSy44OX2SSS5OxD2J5R8OhqmB8/aVi2bCVfqdu3Yp2Ek9vrLl8LbHsIY/Jiu1nmT/r7SOvTbepWw6pnDeUf0xLP1gcXZ/0LoMSjDstEIm9aKyTrl3758bYVQnJrefRF/eG3L7RVH9ZNmVUVIJk9P8tbtLBNOrKrLDebZr/FbrPX3Mf2Ze0gcVowpEl0Qj0D1WN/9eANYsRtheeVLUHRvnSqlSlyfSQb6V0T40lR6ZetuF+HAau6HKvfiJIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhKpkyc0mfRU403/zKtkJR+2qw/GUCWU9xEaXnZ5S+w=;
 b=V1/K7AhISyZClrjR2wbn/EP+r7knTNJofdksgSxzx7i+U1EW3yge73ygasYuagdRM/d7xxCmhD381L/BXp+P81Rlhj/+dHIvR8Pd7UrHjMnFjJhvcWHEJ7Jx5Ypi37jJJ3bT2/8oyNP6EcqWMK/0B5SQGEHCWgybLiC4Ah3+LP9ZsiSF6L+4mtW01ExuODN3rYBgfT7BepRfhRBzWi+ISO9oB+j17O6Dim0cNj6QpDWZdTw9gEAf/nmGOmYM1LQ4K6u5dLM3KKrNvaJKRgHZpPCM9PF/tBKaWQRydH8WKomL05drc67R2wgC8p/oQQDvctpx3b40zeNcIBOaN52pRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI0P189MB3463.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:07 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:07 +0000
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
Subject: [PATCH net v3 2/7] tipc: fix dangling link in cluster_scope list in tipc_service_delete()
Date: Mon, 16 Nov 2026 13:34:51 +0700
Message-ID: <20261116063529.6185-3-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 273666c1-3fa5-409c-56b8-08df43abe4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hQaYqtpIYIYgnJdMmYsG6MSuvs1soyeJkkBzogYi1v4/6z6cjCKPJQk+XN8RJd8HlvstTRawvXNWm5fH8S4ViMI13MCj2kVTzUnV1Gw12f3SlZv2Ej7/hrm/SwcSZ0XwNVAaOepZnTZMVAxha8volJ46duJdLNb8dviCoUWQ/s1Oq1dpV201zshlN0V61Rvx39/EZvv5CGq2f0g/cmstTPzuQclBjZBNe2qp8HHyKuXK9o5Kmg0mQ/DMtMyEQsVActilDvPczeHiiqHV7vdpyu2fQJnWDABsHkkMsH1AxKffYpF9B8PsjRU5u0ECRLDOpoTqEhwmzMh5dj7H6yxi8ezApyIFRA6rwycnQexn6svX1eQYLZ3x99wiGfLj2hmXR+0FBVaNQ8ochQNG9rNjmK8IREmCtr+rCAGNY6EdsQgJSg4rjDrOAEiKYifcDu0O0aQSFHXiZ+HSLG7ZT4PEwnQtABWKk/JuLNBTUeaeqdME6nCNTjtNBI+szpB8vz/iTHMlpGqXEfLTM8X7X0viYs152BTP15COlkUI3RNayh6LshoTiCv2nfpkJV7lrfYrNafcBLxXq80S2DzFi2GUzL/qT8RAAqUf1yV//Zb+XtN2/smC1EiFx3pZXuYNUGk6YnNxdHPfibZJHYbWBxyQIn66mqe/UpzqL7rwrW9IBT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sVPKBQKBEDLDXM4uFudatHj8bbum1Dh/w5YoSbO7vLye/j/iNa7neTWPh72y?=
 =?us-ascii?Q?mWsEt+RxiU8AlYuO8QzKArXu7j+aMhXOtdU4qKIWi1LPX88rvE1Pl3n+aMcx?=
 =?us-ascii?Q?uqMqdYk0se46wZ0FSl9RtdDzAAdF/e1Zmnj5W7ECAY0vcZqmeOAFmwi9/HB1?=
 =?us-ascii?Q?z4QN9fD5K9SmYnwgJUhXissQ4XBDZQWHU96SjNwao1N01s1wGniFyfZyCxy8?=
 =?us-ascii?Q?ycHQ7HDic1Oq3SLOS+oibHwy1t+FBhKqYLcJXlJBYOZ84Qda2gUQpC6S0Z9/?=
 =?us-ascii?Q?ecy5GR55ZyYWtPYhstr0xabzLw1HHaIuQW4SxQoxdP58g0hUqWe99pu5HB7A?=
 =?us-ascii?Q?K0puP9eOX7omjf/PTJqdBwJyE7HsqC50KiQUkczr+wWKqX8vSt+qFO7Gpbrh?=
 =?us-ascii?Q?f35/+XrjjpzDxIXiIH/NSd8LCZJe9WXX6K8U8FuayZZxM+d8sJ7DBz0I1mkq?=
 =?us-ascii?Q?tyvRm3CIfIvpl+t+Kndc5aJG2aFkLvdQ7aguLgWVn8c+DEwHataCAfNF7sWO?=
 =?us-ascii?Q?80K7+ObCTmJN8Ka3ZOxcEZbVvUEBGl8urHTDkbkmG5IDd8FiA4pcY9/P0tAS?=
 =?us-ascii?Q?p65zlddV4gmwoFhuqDTMxnUErm4QqoTkMjYFKOFjBHNQHw/JfZYFGBJkQr5k?=
 =?us-ascii?Q?qbLo+kYSsDB0xmRkt0CqfkstwYWKVxO8htl3HLuPYaTC+bgPeL7ucVnvsBS0?=
 =?us-ascii?Q?o1lwdQbHUAX7JNHeS+vK7quHDujaFjW9WF7m2NtZGlY2m5is+1fH9PRmZk8y?=
 =?us-ascii?Q?PGNAIGVk2rRIyouNCv1FSv9DsOFeciKBBExo+Y5iZ2vMwbkXkg7hJJxYynFD?=
 =?us-ascii?Q?UUaoGLxP6u29iJVv2viA70fI31eeiwNGQaWw2OxHL3Wt7/Mm9GJFCE43Oy8g?=
 =?us-ascii?Q?gV255hLQeESqb90gAcjYIr/ZzGUSSv9jFLQz0h+8yRVqiN0Ewhpk3GVBlUwr?=
 =?us-ascii?Q?kcVj6CCrBCbrHf09+sNhb1X2kysYu6eyR6lgmGkzpn4ah0+gZ18CuSdXcjte?=
 =?us-ascii?Q?fn+jXRZ/dXtmK3iWvXkqN7cB0WeejLUBZMhYLB7caeRcwPQqdY+hfCB3MslT?=
 =?us-ascii?Q?5vjSJzgPcVyhglHmNFCJR4na4CP0lDqvtTt1zpxMyOdNTWtN1EYsFiCI6yBL?=
 =?us-ascii?Q?BuWoLLe5DjIbFYhuBLP2uXwlgQ6yWs6lZTHdefaWHAiqyDI7BB+q/L+gwsT3?=
 =?us-ascii?Q?doeL1kIQttV0/DBjOgoOZ17Gi9kiM1w+rcKHtTSs3mv/YjUwwdtyO3DEXMVD?=
 =?us-ascii?Q?U92cU9fgs0X/VtlxEsKIGLSKk1nTCBImurIj4khpyFVS9kVEr4Iyyz1uKn9J?=
 =?us-ascii?Q?mVHra9SFPUrjY7Jtv7CMARlehKk4Idw6nRKFpXTfzPV3+a/PTcOhs2ja320a?=
 =?us-ascii?Q?uAjKzPqEBfqtFrhULFQWIEBEDBywLS1+t7PMiDEnhRyEVj6kWdvuCmFb3n7H?=
 =?us-ascii?Q?f5Vsqt8qp/FEMlwzN9uoYvCE6sonuUKMvHQO9S1nJI+QlkLfr9v8OWLuBGpU?=
 =?us-ascii?Q?1n8X9iQ0GN0EnnRpq+f9vx4s3vMZAxxXitJeC4iiTACkDTGdQHeggEcCHn6E?=
 =?us-ascii?Q?R7kzAc+foKK19A7aCRWDEjwbxop5LTWNlHcenjC4kDHkbf/p+tUIlvcMoaJx?=
 =?us-ascii?Q?Le8+bB11GN1q0faIJuRyOJM3g4CpNh4VuImaB1NpBzvWQ9gZ2K06/yLIBm9w?=
 =?us-ascii?Q?/DYPpY3ZU2MdnKAfQayWB3tHUmB3YG2S4LuDoJzK43TqkRyXVfwZFvUlPn8M?=
 =?us-ascii?Q?2bCz0g3gvNgHkOUNqfbkJ4sjPSgF18xgizOvO/r2nljzHu3WlczkNWWGXC87?=
X-MS-Exchange-AntiSpam-MessageData-1: uGNjpo7RfGtWt1BqNi0pWuhzweFiJq814yQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 273666c1-3fa5-409c-56b8-08df43abe4ea
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:06.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8aDBNDvdZuL38MzPJasn2o1nzvr02nOgUMzhZElsjmznWhy30WqfCkr04FdFTrLei66g3adfV+6DIprxBDEYfFnJaaE7NKuP6A77XpjfAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3463

The TIPC name table uses the cluster_scope list to store the
following publications:

- User publications with cluster scope from the local node:

  __tipc_bind()
   tipc_sk_publish()
    tipc_nametbl_publish()
     tipc_named_publish()
      list_add_tail(&p->binding_node, &nt->cluster_scope)
    list_add(&p->binding_sock, &tsk->publications)

- Protocol publications of type TIPC_NODE_STATE (0) with cluster
  scope from the local node:

  tipc_net_finalize()
   tipc_nametbl_publish()
    tipc_named_publish()
     list_add_tail(&p->binding_node, &nt->cluster_scope)

When a network namespace is destroyed:

- User publications with cluster scope from the local node are removed
  through the following call path:

  tipc_release()
    tipc_sk_withdraw()
     list_for_each_entry_safe(p, safe, &tsk->publications, binding_sock)
      tipc_nametbl_withdraw()
       tipc_named_withdraw()
        list_del(&p->binding_node)

- However, code inspection revealed that tipc_service_delete() does not
  remove self-node TIPC_NODE_STATE publication from the cluster_scope list,
  leaving dangling list entries:

   tipc_service_delete()
    list_for_each_entry_safe()
     tipc_service_remove_publ()
      kfree_rcu(p, rcu);

Fix this by calling list_del() before freeing TIPC_NODE_STATE
publications in tipc_service_delete().

Fixes: 1bb8dce57f4d ("tipc: fix memory leak during module removal")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3: no change

 net/tipc/name_table.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
index 6fda36ab1766..73b032ba2f8d 100644
--- a/net/tipc/name_table.c
+++ b/net/tipc/name_table.c
@@ -934,6 +934,7 @@ int tipc_nametbl_init(struct net *net)
  */
 static void tipc_service_delete(struct net *net, struct tipc_service *sc)
 {
+	struct tipc_net *tn = tipc_net(net);
 	struct service_range *sr, *tmpr;
 	struct publication *p, *tmp;
 
@@ -941,6 +942,13 @@ static void tipc_service_delete(struct net *net, struct tipc_service *sc)
 	rbtree_postorder_for_each_entry_safe(sr, tmpr, &sc->ranges, tree_node) {
 		list_for_each_entry_safe(p, tmp, &sr->all_publ, all_publ) {
 			tipc_service_remove_publ(sr, &p->sk, p->key);
+			if (p->sr.type == TIPC_NODE_STATE &&
+			    p->sr.lower == tn->node_addr &&
+			    p->sr.upper == tn->node_addr &&
+			    p->key == tn->node_addr &&
+			    p->sk.ref == 0 && p->sk.node == tn->node_addr)
+				list_del(&p->binding_node);
+
 			kfree_rcu(p, rcu);
 		}
 		rb_erase_augmented(&sr->tree_node, &sc->ranges, &sr_callbacks);
-- 
2.53.0

