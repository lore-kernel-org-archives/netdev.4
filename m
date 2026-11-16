Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810978;
	b=Ew1G7s8PGcGGm2fDJ+9nFTIqP5Mm68ndXxu/4VgXPxV0kOVrCtPUY7gzCqa+tH1xGroc
	 A+KFmlJkfMntIorD9QaAouF6bNTSfirbqik/psF9gf1JP4iWNDZmM0JzMV8TpXyLarC3J
	 ubXsadmEFyRbrpnmXyshgmcC3JOzWU8Qkbkuvx32snrbJfPjl53GDXBTI06FFHk/NzR9A
	 hei+H0Gyepf1TGKZfmtl3RXysfKKDp1a4s5+zCXBBw7MgF0VIcuH+eWbNl1xULtUiAmOp
	 jUo74ZrczMw7m9YZH6oo6LdmVY2XLjB9BapEllGgGdc58n2y7oY4zBxN5eEmaqOHNRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810978;
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
	bh=McUNPD5O1mXc+oKf1E7SdsbQKWMTV6iH4Q8DPdQ1DdQ=;
	b=yNe/hmhzgpINrGfnEdjt/Lk65y9s1ohsdlmiZdoKYzaJBXWeYXKMHh4gmWJ0xBe6v5rX
	 kwDc6e+J9ZdFjq7LpAyOBavM8bEW2PlW8lbYV/BN2U8TWHR8RSJTkNtKw7C57LUH7oGBB
	 u5sfp87ezFTY6I+QynzX+qKRZJOpz1DB1N0Lw1XbaIkDSycyeogC6AxaNxzNfruEs20cq
	 XMfd2KPI/Bk9HEl01gdtk06wrGMyWV7TY6VQnoWBFxufj6o3nvFpn8ISQcbJiLg534XRk
	 3xI4U+MBndRjVBM/cdF8Y4R71Icb9IYneeoPf+ajW1pd45Pk4HiqHFZf1pU6mTV79uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b="e0IP/oD9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4CC606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=e0IP/oD9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyjAv3G7ASIXf7UdZE3wXmo2NS5SB/xeKrc3tx86VGloXTHcNDu1ZRkJYlNZdRmpPI6EKljTdGMY2GFgjECggJ/1JKZGvUv9yVeE8o/rvLhKtQ/Uf1DG/FPNpxF7yIbyabE19rB9Isj69jFi2hki93m0zl5X+En66qbe1JMzAeb+6yJq3gLLWnQ/NJqlKDt5GUWzs8Qzs+nya0mqN+gfYzaW4Vapa+kxqhR9+DmEG3r8/hcBdlyOSkMJOeRoRZ9SxVlVN/ubTKIyh7IqY3jKRguEdSapWGN/O8S2jL1u/ojYgsrvovoRi/RLSBQJVU9XUJsc4aR6gk/aeSSttCp8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McUNPD5O1mXc+oKf1E7SdsbQKWMTV6iH4Q8DPdQ1DdQ=;
 b=qBR90pWMjPaX6F6OZPRKaN4OP5OZguePlIz17ZA/DM4QqaHEQbwtngpknnlEbyR9EpHTKScVNBG0cNs6LELwORDtjJjHy8qi84eBTosIAgzhEFKA4H6QaCEsih48AEQLoAaZ2reYOCfmmJeZgdQSTgK3NM0VN6VLToMLKak7lGHZ73Q+vN36Z6KtX/0xO3h0v+uI4B/ByABo0JEd3ztzlBEl5TeoyAmCujFPRFFc7LFut/Vi/8SbAcNVTUKSwTsIuII4TZKyP1uYzAnPepbbbhW3FmX9fN14NQ0oXL2K3grQiaAMOu6t2LeHBXahXnpVLUyH6wz8ArPLIP4rDuFi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McUNPD5O1mXc+oKf1E7SdsbQKWMTV6iH4Q8DPdQ1DdQ=;
 b=e0IP/oD9ORf12+P9QxtL+nSPDWvHh/OMC1q7G4hYKvVXcnhSpoE5CjlFRbnJj5f5FkquYfOzvO//3EJEbjeWHl4KweL7aFtDS+xnAuOjs0d1Mm/ftwh1jkZsUYRkzkcJ/lz+ZyPaEPDIWXFTihvDTN9vuERaRj1Ni0AUQkZVawr896607vKst/dUiHJR33R3nDiKz+bl+LF2NekMxaLhuNHLKa52unzSxlFlwYFs8c+/hE62aRbpC88lKvq0EWb8AigKpiSlYgN+gOaWM+n6EnUvbvDHDH2LWIK8q3ud7ugAtlo1NDneDYZKS7AqyaMPJtDUvAkihAW8TIxvXAhuxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI0P189MB3463.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:15 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:15 +0000
From: Tung Nguyen <tung.quang.nguyen@est.tech>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	jmaloy@redhat.com,
	horms@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Tung Nguyen <tung.quang.nguyen@est.tech>,
	lkp@intel.com
Subject: [PATCH net v3 3/7] tipc: fix incorrect initialization of replicast node counter
Date: Mon, 16 Nov 2026 13:34:52 +0700
Message-ID: <20261116063529.6185-4-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 59859ad5-e34a-4f2c-5065-08df43abe9ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GgOHeEdqqg0BP+bAw5z+Sauwkg07POndqQvfZocGU3k/bkD9g57rEphFNmpeDyF7mznUnMUyJ1Yl9C8WP35f9wgMOQw/JJiJJiZKb9aDQ28lhiiZZemF+xJY3QaO2XFgV18cdTK57yOwdAXSf+GgpfchygtElPP61WPIVPwX40Ixc94tkDuSn3x2UJVGGsdIUaS7jW//IGO1dXG0i8iXBLDiYA9NPt0jC9kmWant7RvYpoau5TvjBA24ahNLHTrrlQypsZKtPaYmxwvBZnSS3wydwFqC/LK20LHQdM2BpfzwXbqTmrfpb+lc68WDpCpaHzoWvbt3EmboKh5DCBezpqpnunfwm5xw3DFrd3u1PYpaaJnhK3qo/XSKD25cASKH+GegxNJsvE83sY8c5M/4v0O+1kYoFhXO2HKEz7As40E8NYlSKBukaV8OGgJ+LQMPG96kQzsqU3JWReWLnhlc+FGr6rNBazFsC5SORCX1Y5VGqJ5ZVAbVHtHapvlf+FlS6IAIbjQZeaLRzsNQkJKHgcXDJ4vRkHopCBIpPTdFWuR4FrcJC/KAj0LKOWMKADfjUNSsAdI4le0kEzFoNVjAzUwTg+6fRuyE3EDky6twhkT7RoksMauzXi1FqvPaAPEt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXXE182eoPxUapHBiWsncjYhwp06ii5Kw4troByMhoRv8wQuvCPx1ywSdcWv?=
 =?us-ascii?Q?6YeletAotuu14TpIUXPJF0q+e2ZGR+SPU5NIuKJBKWYrRKrsFip7DCT6tniR?=
 =?us-ascii?Q?SQ5FlBNtDoc4nHkcMGi/yVWk6xX6Fq0NhmwWpnAGD61UUoXUesSr3XefBqRs?=
 =?us-ascii?Q?ViGgpUkEMNcNLxpHAaojChSf8XanoWL71tWUw9cfVUMkOKreI60Ul32DUO6A?=
 =?us-ascii?Q?TYwiF+xXTwQs02T3s6T1eDnABnW8fG+C24jWXrLPrTv9ysAKSgj8fWORSi5g?=
 =?us-ascii?Q?uDNwTVDuHh4JfEmoNb640YfYgnN8n5sr5f1ktEQOkPQ+pKhXUD/TqPRpsmud?=
 =?us-ascii?Q?E/ILaf0UiTfqh/T5rOh0CRpMxX3ANc5UcMrS0aCNTRjVT04R4QVFTxR93a8c?=
 =?us-ascii?Q?lDm/05S9lXze3ZVRod/9RV8q/AuHZXnTLXY/XxyupgF9ozw51iTv4Lij7hi1?=
 =?us-ascii?Q?8LkBYZ+UwRvL7C/oadn8+VPa97HfL+XxSNKqJhIq8/i4eUDqq6lcdJkngwZ1?=
 =?us-ascii?Q?Kmns5tUYOIcCLRtVrIv4bn/sg9wRyBDsG94lCMS4utRgYbII4hUC18VTVJXC?=
 =?us-ascii?Q?0xu0Nqjp1IQfYz9q9hg6OAbjygQ4myuzGMlN5O890X1nzDnpY7BxoOksyGgy?=
 =?us-ascii?Q?r7gdw0hGV/uxmf3b1fyzEIAG5jtF3yuLnfgHA8DSrFrPBHawN3Q0Y4B4Ha12?=
 =?us-ascii?Q?eEpTDCiaHmTZtaecZHfKznUPFYhTw6IUv81WiCOCocL8bFXjGbj20PjtlDUk?=
 =?us-ascii?Q?dJ6eSkwzxLcW/FBxoGiLgP8Xu0QQOlLubmmbmjgTgZyoiVJy2PROGDPE4ySp?=
 =?us-ascii?Q?gmosXhph4pIWnbz5M2f/JRBJg9fPazh+y8KXPUQsd2eGJI+d7UFzUoXE5wXq?=
 =?us-ascii?Q?b0iwlyvGzxKpupt/hQ65QluT5UJwCsXMzvTLSbEVzB6D5SXEgYEGh3rfVhEH?=
 =?us-ascii?Q?oR/2kNi1EUbbEw4oc+S1+mHON7sPMJRUkjGTcM8JVLgjTGjur5lNL+qhMqJE?=
 =?us-ascii?Q?BC+hxHzFs9uTdxCbSQiIGxuOOhbaY05tX9tUOSc1mk8e2VEITOXmu58ghetu?=
 =?us-ascii?Q?ZllXK/+RFoD90fT9RGy319AGspIEokh9rLklhBbfQWmLa0u5RGseqkpc0ZSu?=
 =?us-ascii?Q?6w6CQc3nsxO4Y6/gxAcgGe/uoWZgcjOYhASuxoXf0EhkFXh/ZhAO3+TpjTuN?=
 =?us-ascii?Q?mQjRmUATJWu4/SSgayY5iAqlPB5ZCBuUg4aDkpsIfhwoD2UYBhhAKWWtdEar?=
 =?us-ascii?Q?bFP98GwsKGzeU38YHM0XU72sy+YGJ9MYS1GmlEvlZZ7f5rz1kLPsqTht9vO7?=
 =?us-ascii?Q?cm8aQ64QBW9OXIJ/1jpYHEme4k+ztuaOM3RAv8f92jKyXZkkzS/DUI1wfw6a?=
 =?us-ascii?Q?RyLWZ2Bs1H15dqrJkFHwYryC/8Qw2N/zQDpbkZmhc6jJAnu8COcxnhNrtUvQ?=
 =?us-ascii?Q?DtIY7aCVePfIrAN2MKGGFHG1dl/LhMwq5456HpU/pHiZKIcZ48kO8cFCJhtl?=
 =?us-ascii?Q?CG0+6JkAEiyfE9es4f/G1n9QF88OcbrBdGmNASHD9gKi6GjWxsnLL2gHTsMK?=
 =?us-ascii?Q?tfDy2lKeEHVS5pIGpZ8z19mqzUDIQL778/RkRCpN7ZgwSlWLPuDrZwS/K8H7?=
 =?us-ascii?Q?xEO1ymyXGodD0D/sk02ADogx9AlIC07asyAAPQGezu3g9eejTdNttzrWT5B2?=
 =?us-ascii?Q?DQg38LxeSLA5c/eukBuPECdrZ4EXQ1XrOhDn34Q5/GfJoMAaUNg4n+31MbBP?=
 =?us-ascii?Q?zxC6tc3WYfhp57zc52vm9NfNkLy+gM8ZOIsMuDHTrDQcuCbUFqMoBYBKCx6Y?=
X-MS-Exchange-AntiSpam-MessageData-1: 5XLQtcnMTvPpdjRuP5n+v9vtHAICqwCWcUI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 59859ad5-e34a-4f2c-5065-08df43abe9ed
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:15.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7jPMm8Ebm6O1qiy2e+sT9uA+r+W4OQGGVz4qn7hKWb+QXW2vTW8/2BXHiv+48u26kiESG/CwS0F/dNBMImk5wm9pfUXJunAFNKHUnqewnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3463

The TIPC name table uses rc_dests to track the number of nodes
available for replicast transmission. This counter is used to decide
whether to use broadcast or replicast links when sending bulk messages.

However, code inspection revealed a race between tipc_net_finalize(),
which initializes rc_dests, and tipc_named_node_up(), which
increments it, as illustrated below:

Thread 1 (tipc_net_finalize) | Thread 2 (tipc_named_node_up)
                             | ...
                             | nt->rc_dests++;
...                          |
 tipc_named_reinit()         |
   nt->rc_dests = 0;         |

If tipc_named_reinit() (Thread 1) executes after nt->rc_dests++
(Thread 2), the counter will be reset to zero. As a result, two
unexpected behaviors can occur:

1. User publications are sent via the broadcast link instead of the
   replicast link:

   tipc_sk_publish()
    tipc_nametbl_publish()
     tipc_node_broadcast()
      if (!rc_dests && tipc_bcast_get_mode(net) != BCLINK_MODE_RCAST)
       tipc_bcast_xmit()

2. nt->rc_dests can underflow to -1 when the node goes down. As a
   result, publications are sent via the replicast link even though no
   replicast nodes are available:

   tipc_publ_notify()
    nt->rc_dests--;

Fix this issue by removing initialization of nt->rc_dests in
tipc_named_reinit().

Fixes: cad2929dc432 ("tipc: update a binding service via broadcast")
Cc: lkp@intel.com
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3: 
- Add Cc: lkp@intel.com to the changelog to address a warning.
- Remove the unnecessary nt->rc_dests = 0 assignment from
  tipc_nametbl_init().

v2: https://lore.kernel.org/netdev/20261102034207.10639-4-tung.quang.nguyen@est.tech/

 net/tipc/name_distr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index ba4f4906e13b..1dfe8475a75d 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -415,6 +415,5 @@ void tipc_named_reinit(struct net *net)
 		p->sk.node = self;
 	list_for_each_entry_rcu(p, &nt->cluster_scope, binding_node)
 		p->sk.node = self;
-	nt->rc_dests = 0;
 	spin_unlock_bh(&tn->nametbl_lock);
 }
-- 
2.53.0

