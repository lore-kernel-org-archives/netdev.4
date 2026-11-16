Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794811009;
	b=LzAevZC8izEJv2DfXXBy9Emu6qWyNl1/aO4dPEEgxpF/sJGUUmaLRskzBhrgdWBr/FUU
	 Tk6o5YiO8AOvDExVcY7GKkgSVXYTALdieHatbzZAHF22pNhpn+9kQxwWNHW3iiDpqwRZJ
	 qR3D0D9lFQ6FvWb89whmtD/sJuEONdhntb/On0DDyE4QYVuMvSiDXZTrf8ZLUT3CfDvIu
	 p/RUqiYF7fkfUQpLlO6m0v0quCoy/SfB4zhtA5QtVcySylSg1R1Oeeyh8b9OkndEN/Sg7
	 fv3mOzIpgS11M4AwdBEAWC9RarGp6GVs5/5ng+LSyUkENUkGhfXS6CHeAIKQdYqNDpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811009;
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
	bh=0WxHOznhy2yD+5bkOlaDbl0Avv+7UVKM/H4xashpG2U=;
	b=WyXZSYUA6dTKYUHKWhgsJsFUzudkatbjYSo3EaR9PfwDW90UoBy/iTB4uI8dDyKxyw4Z
	 9JXczQGJWJL5s642YytH2gXNzVbHWk7h/kWHj4IaMRwFNEs2l8PHRFV1TAKL1XbkrfL9T
	 yR+5TeaY62GQhzZwCrQzmzUa/bDO3q5RG5UK9aMQElJM1L93uhdO7GVeuv3CVotDngWjB
	 3pQV3z5xAwnUbN121LfAbnUoYLvWB9wPjTbyb+8u4PEbeahEUn2nGhOIasnz75X8rw7Yt
	 RUK2QKto55cwXX0sKPcAbA2OGdYHTt8RhoRFCftHY2DJmzCDHaa4hCTChKii9iD7ZDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=tW5JW6xf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7C606A88B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E7C606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=tW5JW6xf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrNk6qBJSIq5xKkmGyp5uOzdlLvdhRF8Kq6EfXizFWxyxdRTd0d1LwrnXYA0pkJsCa/EukVM+WJWz/kiJzxDSGMdk5mu2CroIagXsq2m0gxSOWFXLGWVCCYJBW2xkSYmaU3tJRdVulANHkEnDZvJDog/BL8zyw+s9M7ZQg4ilXNsEgKxJiXdC8jtM9CF5UE3ScIWQQY9T5O6SeReGYodiNGByzXR090gnL7yWz2/jRjh8qjFnZGMucITuNlZxtvLVomlUZMpMkPuhzWT8537DtT2xtR4I3qLK0YyOPilohWzHJtZZJq6+Vgvzh84+b+XwZMH+r5KOb9pCZrg/XWb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WxHOznhy2yD+5bkOlaDbl0Avv+7UVKM/H4xashpG2U=;
 b=PSlky5IlO9fqXc9xE+hdOX9Txx3YV5vPq84ST6flWSUYntr6NlHcKYDNwfeR5koDj99d8aW2SokMGfkSTGDOSt1VlsCxuXcMdqpJmQ220pZhY6qDAoPlSx97+Tp2TUvKoJMVJ143DkvM+l5xOiMJfuXXpPTgIOtwAkuFtYKeg328HqFMzyqrKPXrWN2tb+wEJGz0VHJVMqMyid0LUwdGhea7p4XlsBDbxZot+tF82dGbNESsHjIX6yTk0HsDAc579wLRTcZMxqxyKguTayBr/E9I4L68Adn34CaYcGDE+yf+xlx1v8rwXq11+OhlRdCC9QbNRu2N4D+phIH+yYg/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WxHOznhy2yD+5bkOlaDbl0Avv+7UVKM/H4xashpG2U=;
 b=tW5JW6xfDcnlouSYvP5IG8ncmjfH38LOeDurMXkn6g4aQBWBoJZZtBRsu9vR+gNzTEG+HwCFVf5LqoXc3kXXNBSCuGJU0sYSeZDowa9BmCckgWul5tkq0+QXaZ7Ep5gIJ/dSpKv2yW866JKLM+MIKCa7nHoGoP+ARyAPki7+fAGyydY63zEv6+DAe2JrDfUzX4qby1NTzmwkyHa3BJJ7YQj7LNo6Ak3Y7btsWEmqQI6Dt8kUySer1ap30wc3Qn32DlxUagl8JaVogVMLzmpRO9c82+zyXCA+ELU7ETIFy313De0cFmoegfmX2c1lGPmO8cPGuv2WtrxCI4DtajQeOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI2P189MB3564.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:36:46 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:36:46 +0000
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
	syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH net v3 7/7] tipc: fix NULL pointer dereference in named_distribute()
Date: Mon, 16 Nov 2026 13:34:56 +0700
Message-ID: <20261116063529.6185-8-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
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
X-MS-Office365-Filtering-Correlation-Id: fcc2f8da-989a-4ec8-00f8-08df43abfc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|23010399003|366016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	v/Y0ozObPeu8VpO8rSuyIi9u5eya/sPkGsj4GvpiMZrj/Zp7KR5OOiMd3Uh546yKejTgP0MfOAeaQbrrkFjot2fhxqDXGRsYpDIi/Od92lsWs6BQqBeE7rTPWfos0JpDbExWrIb/Qapee8DNrIgnSZh/CjrcVcY7LeVJIsPiygo0JXU040Xw8zcA6Uzhdf81I+7HN66lgV9M0lW7jp3Z0urBOMvfJGVjsk2miPqQarNkFCQR5BAT1wlBTQ4VMJEA/zurPJhIFRO07GpkIoG/09pw1z20j9YbpdXGmNobohYafI+P8LdMsqEEknj3OyZkY9PgL1382tttkoaTxoBH/BmJ8jocELFrH6VuDmXdnWcVJCz5gyPcV6bRerKmVbmNOQ7YpklpfjAkLkWz+R349pv5jq9+SC/elovm6bMiRjqChGmLooR3z+exUEjQ3GKK9h/7l4PLqsGS8xl7koy/MNAKfXNHLPqXet9NQWOBVVjKKcXLFiYb71hXvlGdJozKhhtBOa2S1F/hbjaUSGSN29luMy54WgloLULRsFcUw8+l3ozPJv6A+UBz4umQW6YfatZbL2qKsXhXBWgb/Q+BoYAci7p1qY53jKDPHMCDI0xmJ5APzIPF6LDoxZZDA/ip
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sC2fuLmVwFB4xlZdKe3hKH6cF0dDQjDuIm2xFtIVHFlH5DPw/OwXzSJjwO6x?=
 =?us-ascii?Q?FHWUhcGQILjYDjnvQEjHIbzzkN8PpkOU/FT8sDg/MEeuwwmGCaiCs+zWnK1X?=
 =?us-ascii?Q?S88uQSKh+bQnUOHhIRaq5msnSZHgYnVEeODT7HjOSuEBDYXtgQbO8DSU7Gfq?=
 =?us-ascii?Q?6JmcinXNYv3bzrZZDioh5eF2WhA2dAlsM8p0grImKv0wperdjgrzQbeDZ4WF?=
 =?us-ascii?Q?lgr3OaLoaZcywl9t1YUj42ZpdZ6hxiZmNckslKT8mTr/wh8KemeEwEnmhrJa?=
 =?us-ascii?Q?rNwQ7MHPa2tPTV1jfz2ErOEagPm3oxMFeXNE+qON3RZlY16exUMmVzYuv5OI?=
 =?us-ascii?Q?RRr6Am4RPmyHKyeGEo2fUgMQD90nnBydq850eIz7edJInh2Aln0/f86Zr23W?=
 =?us-ascii?Q?UyoSbaDcgJv+lSTobWqWpVYwqUyPgNxNSSPCKOzlcLcYFh61OybBrZtsVlJS?=
 =?us-ascii?Q?4fKJMhF2ZqlA1ilQUevCwIARrkF41Mx1YuGu73ZLu6nosASaLB/lGBrlHk/H?=
 =?us-ascii?Q?vor0B5Rxey6z3uixvUvVpVvmw+CrWYb0Kh8MA1K43x5bxF0DlFpb0GVJ4xvJ?=
 =?us-ascii?Q?XXIfxRJKCxk+nrJvBdDhdbyZUnSKzn/Xv4dbuNd2lfQWTmjqhlSbO8Dx4078?=
 =?us-ascii?Q?X7ZMdL3KAq8pN1Fu8bVvjeszKEs0iupb+a+CeGXagNWSP27E76UBNEdNNLlU?=
 =?us-ascii?Q?sIjKHBlv8/tQ+qDDsTIE/z3HBhChwlIVyipI2UvufdJv6opNZumMCN44MLYf?=
 =?us-ascii?Q?PazKwfF3J+mG4lQeaZG8sZE0+5fDmwAycrSxW+TgYzOmB/gacUHJ8uUOQ/3j?=
 =?us-ascii?Q?wUkxbqKxxcK9M7DPn0k4lyiX1fL3WFfJd0Hyz8ToxV1ke8h0a0LisPirpIXW?=
 =?us-ascii?Q?TO7xdLNAoWPOnx0slwbwjeUktx+qKk5S6BXFAbP//oOjcSvkT/qvdsXLS07O?=
 =?us-ascii?Q?UB3+s5r2tVixU1udJS+4zuaEQyCNbiNgTNU7qsz8uobtelwYQCzouifl8ZuF?=
 =?us-ascii?Q?AWYnZD+XGQfyjhR+T/RMQ2Spcs1EHOD995OEhvZNRU7HHISbvaesOBnG9frc?=
 =?us-ascii?Q?335OjEqh0cChkUHjAXAXG3IYQ8u4dARZlgxq5CCB8Hdg7VVem9dMy1yi3a/q?=
 =?us-ascii?Q?O7tUO63gPFcdfSdYBtaWm6zaVPkcLYKeoDRgdu8P8+xTpziqGqwQiji+49Ej?=
 =?us-ascii?Q?z2QBCCIGtoJU3yG5JdCByotGdlNJUYZHTOrNmhOz2wFwqjYWAzSUMMs4duBW?=
 =?us-ascii?Q?inW/2soaxcTDuXSmviL5M/vgja8OWPWUu0ytBAJPAJmfH9dU+wqm8omE7ToT?=
 =?us-ascii?Q?x5Io7paOWLVX/jcCTDTepBJTkg2LXwvow/Mn929FJelYeDb8Wb5tYd8ILU6i?=
 =?us-ascii?Q?iaypLMQOU1A9xX0Z5cyuKfeVmtVDa8yZDcJ+j8jr4pzCy2w0bELw95lRsB+T?=
 =?us-ascii?Q?gOxdiImNdO+3IBJptEf0jaPwd44Afd3bpOtj1ihk76++f8aS8YXMVf9DPwsw?=
 =?us-ascii?Q?JNiEbVOZcIjACJjyIH/k/60sXMo7sMLDAJpOcYhbds+L9WqH8qRa6XVKNopC?=
 =?us-ascii?Q?nHa4y1rA+XNHGSOXGmMNgsQhkaU7UFv6jx7MULtAvZBCEWr49QhK7BYTF9rB?=
 =?us-ascii?Q?KT+OGar+C8x8SDUV+zFKzw1jwqtXYxSQ3D+vM+p4FW0u1vERAZarJnH1INmv?=
 =?us-ascii?Q?PXxCO3zrKxOX0c8+UbDibNdwQO7VmZUA/xaf95Eqm/mNlHDomsY7DhKtU/xd?=
 =?us-ascii?Q?MajEUhYDs+mHO6sM5SnRfWglYqByWhqwkaK2u2Fyt8pU9Cm4/xx7sZX+fPVs?=
X-MS-Exchange-AntiSpam-MessageData-1: J1JZgLIPs1Ug7iWvGXX7oQxw02UCP2qns+8=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc2f8da-989a-4ec8-00f8-08df43abfc1f
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:36:45.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjXUzJqIPMLZo2LMwr38xJN8QktliXjwkj1Mys0BP+WBOUpyX85kV6O9mLxrsq6nbsXoNdTKch50/OJArV+8mtIVeyGF5/IiX8Z0dTUH8Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3564

Syzbot reports NULL pointer dereference in named_distribute():

...
RIP: 0010:buf_msg net/tipc/msg.h:202 [inline]
RIP: 0010:named_distribute net/tipc/name_distr.c:195 [inline]
RIP: 0010:tipc_named_node_up+0x8e0/0xb00 net/tipc/name_distr.c:221
...
tipc_node_write_unlock+0x2ce/0x4f0 net/tipc/node.c:428
tipc_rcv+0xb55/0x1020 net/tipc/node.c:2196
tipc_l2_rcv_msg+0x2d9/0x470 net/tipc/bearer.c:671

The root cause is racing between tipc_net_finalize() and
named_distribute() as follows:

   Thread 1 (tipc_net_finalize) | Thread 2 (named_distribute)
   -----------------------------|-----------------------------
                                | ...
                                | list_for_each_entry(publ, pls, binding_node) {
                                | ...
                                | __skb_queue_tail(list, skb);
                                | ...
                                | }
                                | ...
                                | hdr = buf_msg(skb_peek_tail(list));
   ...                          |
   tipc_nametbl_publish();      |

If 'tipc_nametbl_publish()' (Thread 1) executes after 'named_distribute()'
(Thread 2), list will be empty. As a result, NULL is passed to 'buf_msg()',
leading to a NULL pointer dereference.

Fix the this issue by checking for the node's self-address publication on
either node-up or node-timeout event. If the publication does not exist, insert
it into the name table and publish it to the other nodes.

Reported-by: syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=64197f7577a09686ffdb
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611022356.UddfVq4D-lkp@intel.com/
Fixes: adba75be0d23 ("tipc: fix lockdep warning when reinitilaizing sockets")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3:
- Initialize p to NULL in tipc_net_finalize() to address a warning.
- Reset the correct bearer in tipc_node_write_unlock().
- Correct the return value of tipc_nametbl_insert() in function comment.
v2: https://lore.kernel.org/netdev/20261102034207.10639-7-tung.quang.nguyen@est.tech/
v1: https://lore.kernel.org/netdev/20261028033722.125477-3-tung.quang.nguyen@est.tech/

 net/tipc/core.c       |  1 +
 net/tipc/core.h       |  2 +
 net/tipc/name_distr.c | 93 ++++++++++++++++++++++++++++++++++++++---
 net/tipc/name_distr.h |  1 +
 net/tipc/name_table.c | 97 ++++++++++++++++++++++++++++++++++++++-----
 net/tipc/name_table.h |  4 ++
 net/tipc/net.c        | 18 +++++++-
 net/tipc/node.c       | 74 +++++++++++++++++++++++++++++----
 net/tipc/node.h       |  1 +
 9 files changed, 265 insertions(+), 26 deletions(-)

diff --git a/net/tipc/core.c b/net/tipc/core.c
index 315975c3be81..351ced173866 100644
--- a/net/tipc/core.c
+++ b/net/tipc/core.c
@@ -61,6 +61,7 @@ static int __net_init tipc_init_net(struct net *net)
 	tn->trial_addr = 0;
 	tn->addr_trial_end = 0;
 	tn->capabilities = TIPC_NODE_CAPABILITIES;
+	tn->nt_self_node_exist = false;
 	INIT_WORK(&tn->work, tipc_net_finalize_work);
 	memset(tn->node_id, 0, sizeof(tn->node_id));
 	memset(tn->node_id_string, 0, sizeof(tn->node_id_string));
diff --git a/net/tipc/core.h b/net/tipc/core.h
index 9ce5f9ff6cc0..8f5a94dbc1fc 100644
--- a/net/tipc/core.h
+++ b/net/tipc/core.h
@@ -145,6 +145,8 @@ struct tipc_net {
 	struct work_struct work;
 	/* The numbers of work queues in schedule */
 	atomic_t wq_count;
+	/* Node's self address publication is available in the name table */
+	bool nt_self_node_exist;
 };
 
 static inline struct tipc_net *tipc_net(struct net *net)
diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index 2e07d50a2943..f77d49883ce8 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -142,9 +142,14 @@ struct sk_buff *tipc_named_withdraw(struct net *net, struct publication *p)
  * @dnode: node to be updated
  * @pls: linked list of publication items to be packed into buffer chain
  * @seqno: sequence number for this message
+ *
+ * Return:
+ * * 0          - Success
+ * * -ENOBUFS   - No buffer space is available
+ *
  */
-static void named_distribute(struct net *net, struct sk_buff_head *list,
-			     u32 dnode, struct list_head *pls, u16 seqno)
+static int named_distribute(struct net *net, struct sk_buff_head *list,
+			    u32 dnode, struct list_head *pls, u16 seqno)
 {
 	struct publication *publ;
 	struct sk_buff *skb = NULL;
@@ -160,8 +165,9 @@ static void named_distribute(struct net *net, struct sk_buff_head *list,
 			skb = named_prepare_buf(net, PUBLICATION, msg_rem,
 						dnode);
 			if (!skb) {
+				__skb_queue_purge(list);
 				pr_warn("Bulk publication failure\n");
-				return;
+				return -ENOBUFS;
 			}
 			hdr = buf_msg(skb);
 			msg_set_bc_ack_invalid(hdr, true);
@@ -191,6 +197,82 @@ static void named_distribute(struct net *net, struct sk_buff_head *list,
 	hdr = buf_msg(skb_peek_tail(list));
 	msg_set_last_bulk(hdr);
 	msg_set_named_seqno(hdr, seqno);
+
+	return 0;
+}
+
+/**
+ * __tipc_named_distribute - build a list of publications need to be distributed
+ * @net: the associated network namespace
+ * @dnode: destination node
+ * @head: list of publications
+ *
+ * Return:
+ * * 0          - Success
+ * * -ENOBUFS   - No buffer space is available
+ *
+ */
+static int __tipc_named_distribute(struct net *net, u32 dnode,
+				   struct sk_buff_head *head)
+{
+	struct name_table *nt = tipc_name_table(net);
+	struct tipc_net *tn = tipc_net(net);
+
+	/* Node's self-address is not set yet */
+	if (!tipc_own_addr(net)) {
+		/* Defer the distribution to node's timer */
+		tipc_node_set_dist_bulk(net, dnode);
+		return 0;
+	}
+
+	/* Node's self-address publication does not exist */
+	if (!tn->nt_self_node_exist) {
+		if (tipc_nametb_insert_self_node_pub(net))
+			return -ENOBUFS;
+
+		tn->nt_self_node_exist = true;
+	}
+
+	if (named_distribute(net, head, dnode,
+			     &nt->cluster_scope, nt->snd_nxt) == -ENOBUFS)
+		return -ENOBUFS;
+
+	return 0;
+}
+
+/**
+ * tipc_named_distribute - distribute all publications to specified node
+ * @net: the associated network namespace
+ * @dnode: destination node
+ * @bearer_id: id of the bearer
+ *
+ * Return:
+ * * 0               - Success
+ * * -ENOBUFS        - No buffer space is available
+ * * -EHOSTUNREACH   - Destination node does not exist or cannot be reached
+ * * -EMSGSIZE       - Message's size is too big
+ *
+ */
+int tipc_named_distribute(struct net *net, u32 dnode, int *bearer_id)
+{
+	struct tipc_net *tn = tipc_net(net);
+	struct sk_buff_head head;
+	int rc = 0;
+
+	__skb_queue_head_init(&head);
+	spin_lock_bh(&tn->nametbl_lock);
+	rc = __tipc_named_distribute(net, dnode, &head);
+	if (!rc && !skb_queue_empty(&head))
+		rc = tipc_node_distribute(net, &head, dnode, bearer_id, 0);
+	spin_unlock_bh(&tn->nametbl_lock);
+
+	/* The link is congested after the list is inserted into
+	 * the link's send queue. Return 0, as this is normal.
+	 */
+	if (rc == -ELINKCONG)
+		rc = 0;
+
+	return rc;
 }
 
 /**
@@ -219,8 +301,9 @@ int tipc_named_node_up(struct net *net, u32 dnode,
 	spin_lock_bh(&tn->nametbl_lock);
 	if (!(capabilities & TIPC_NAMED_BCAST))
 		nt->rc_dests++;
-	named_distribute(net, &head, dnode, &nt->cluster_scope, nt->snd_nxt);
-	if (!skb_queue_empty(&head))
+
+	rc = __tipc_named_distribute(net, dnode, &head);
+	if (!rc && !skb_queue_empty(&head))
 		rc = tipc_node_distribute(net, &head, dnode, bearer_id, 0);
 	spin_unlock_bh(&tn->nametbl_lock);
 
diff --git a/net/tipc/name_distr.h b/net/tipc/name_distr.h
index 767f9f69624d..a5f11265c3bb 100644
--- a/net/tipc/name_distr.h
+++ b/net/tipc/name_distr.h
@@ -76,5 +76,6 @@ void tipc_named_rcv(struct net *net, struct sk_buff_head *namedq,
 void tipc_named_reinit(struct net *net);
 void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
 		      u32 addr, u16 capabilities);
+int tipc_named_distribute(struct net *net, u32 dnode, int *bearer_id);
 
 #endif
diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
index 6bb0333f39bf..5db218394444 100644
--- a/net/tipc/name_table.c
+++ b/net/tipc/name_table.c
@@ -789,26 +789,34 @@ void tipc_nametbl_build_group(struct net *net, struct tipc_group *grp,
 	rcu_read_unlock();
 }
 
-/* tipc_nametbl_publish - add service binding to name table
+/**
+ * tipc_nametbl_insert - insert service binding into name table
+ * @net: network namespace
+ * @ua: the service range is binding to
+ * @sk: address publishing socket
+ * @key: target publication key
+ * @skb: buffer containing the publication
+ * @err: error code
+ *
+ * Return:
+ * * Inserted publication - Success
+ * * -ENOBUFS             - No buffer space is available
+ *
  */
-struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
-					 struct tipc_socket_addr *sk,
-					 u32 key, int *err)
+struct publication *tipc_nametbl_insert(struct net *net, struct tipc_uaddr *ua,
+					struct tipc_socket_addr *sk, u32 key,
+					struct sk_buff **skb, int *err)
 {
 	struct name_table *nt = tipc_name_table(net);
 	u32 max_user_pub = TIPC_MAX_PUBL - 1;
-	struct tipc_net *tn = tipc_net(net);
 	struct publication *p = NULL;
-	struct sk_buff *skb = NULL;
 	bool protocol_type = false;
 	int error = 0;
-	u32 rc_dests;
 
 	if (ua->sr.type == TIPC_NODE_STATE || ua->sr.type == TIPC_LINK_STATE ||
 	    ua->sr.type == TIPC_TOP_SRV)
 		protocol_type = true;
 
-	spin_lock_bh(&tn->nametbl_lock);
 	if (protocol_type)
 		goto insert;
 
@@ -831,24 +839,91 @@ struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
 		 */
 		if (!protocol_type)
 			nt->local_publ_count++;
-		skb = tipc_named_publish(net, p);
+		*skb = tipc_named_publish(net, p);
 		/* Local-scope publication is not published (skb is NULL).
 		 * For cluster-cope one, skb is NULL when named_prepare_buf()
 		 * returns NULL in tipc_named_publish().
 		 */
-		if (!skb && p->scope == TIPC_CLUSTER_SCOPE && err)
+		if (!*skb && p->scope == TIPC_CLUSTER_SCOPE && err)
 			*err = -ENOBUFS;
 	} else if ((error == -ENOBUFS) && err) {
 		*err = -ENOBUFS;
 	}
-	rc_dests = nt->rc_dests;
 exit:
+	return p;
+}
+
+/* tipc_nametbl_publish - add service binding to name table
+ */
+struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
+					 struct tipc_socket_addr *sk,
+					 u32 key, int *err)
+{
+	struct name_table *nt = tipc_name_table(net);
+	struct tipc_net *tn = tipc_net(net);
+	struct publication *p = NULL;
+	struct sk_buff *skb = NULL;
+	u32 rc_dests;
+
+	spin_lock_bh(&tn->nametbl_lock);
+	p = tipc_nametbl_insert(net, ua, sk, key, &skb, err);
+	rc_dests = nt->rc_dests;
 	spin_unlock_bh(&tn->nametbl_lock);
 
 	if (skb)
 		tipc_node_broadcast(net, skb, rc_dests);
 	return p;
+}
+
+/**
+ * tipc_nametb_insert_self_node_pub - insert publication of node's self address
+ * @net: network namespace
+ *
+ * Return:
+ * * 0          - Success
+ * * -ENOBUFS   - No buffer space is available
+ *
+ */
+int tipc_nametb_insert_self_node_pub(struct net *net)
+{
+	struct name_table *nt = tipc_name_table(net);
+	struct tipc_net *tn = tipc_net(net);
+	struct publication *p = NULL;
+	struct tipc_socket_addr sk;
+	struct tipc_uaddr ua;
+	int err = 0;
+
+	sk.ref = 0;
+	sk.node = tn->node_addr;
+	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, TIPC_CLUSTER_SCOPE,
+		   TIPC_NODE_STATE, tn->node_addr, tn->node_addr);
+
+	p = tipc_nametbl_insert_publ(net, &ua, &sk, tn->node_addr, &err);
+
+	if (p) {
+		list_add_tail(&p->binding_node, &nt->cluster_scope);
+		return 0;
+
+	} else if (err == -EEXIST) {
+		bool found = false;
+
+		list_for_each_entry(p, &nt->cluster_scope, binding_node) {
+			if (p->sr.type == TIPC_NODE_STATE &&
+			    p->sr.lower == tn->node_addr &&
+			    p->sr.upper == tn->node_addr &&
+			    p->key == tn->node_addr &&
+			    p->sk.ref == 0 && p->sk.node == tn->node_addr) {
+				found = true;
+				break;
+			}
+		}
+
+		if (!found)
+			list_add_tail(&p->binding_node, &nt->cluster_scope);
+		return 0;
+	}
 
+	return -ENOBUFS;
 }
 
 /**
diff --git a/net/tipc/name_table.h b/net/tipc/name_table.h
index a66975ef8546..4d421548705c 100644
--- a/net/tipc/name_table.h
+++ b/net/tipc/name_table.h
@@ -123,6 +123,9 @@ bool tipc_nametbl_lookup_group(struct net *net, struct tipc_uaddr *ua,
 			       u32 exclude, bool mcast);
 void tipc_nametbl_build_group(struct net *net, struct tipc_group *grp,
 			      struct tipc_uaddr *ua);
+struct publication *tipc_nametbl_insert(struct net *net, struct tipc_uaddr *ua,
+					struct tipc_socket_addr *sk, u32 key,
+					struct sk_buff **skb, int *err);
 struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
 					 struct tipc_socket_addr *sk,
 					 u32 key, int *err);
@@ -132,6 +135,7 @@ struct publication *tipc_nametbl_insert_publ(struct net *net,
 					     struct tipc_uaddr *ua,
 					     struct tipc_socket_addr *sk,
 					     u32 key, int *err);
+int tipc_nametb_insert_self_node_pub(struct net *net);
 struct publication *tipc_nametbl_remove_publ(struct net *net,
 					     struct tipc_uaddr *ua,
 					     struct tipc_socket_addr *sk,
diff --git a/net/tipc/net.c b/net/tipc/net.c
index 82f6d2f6ab89..2114c5ef09a9 100644
--- a/net/tipc/net.c
+++ b/net/tipc/net.c
@@ -125,9 +125,13 @@ int tipc_net_init(struct net *net, u8 *node_id, u32 addr)
 
 static void tipc_net_finalize(struct net *net, u32 addr)
 {
-	struct tipc_net *tn = tipc_net(net);
+	struct name_table *nt = tipc_name_table(net);
 	struct tipc_socket_addr sk = {0, addr};
+	struct tipc_net *tn = tipc_net(net);
+	struct publication *p = NULL;
+	struct sk_buff *skb = NULL;
 	struct tipc_uaddr ua;
+	u32 rc_dests;
 	int err = 0;
 
 	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, TIPC_CLUSTER_SCOPE,
@@ -139,7 +143,17 @@ static void tipc_net_finalize(struct net *net, u32 addr)
 	tipc_named_reinit(net);
 	tipc_sk_reinit(net);
 	tipc_mon_reinit_self(net);
-	tipc_nametbl_publish(net, &ua, &sk, addr, &err);
+	spin_lock_bh(&tn->nametbl_lock);
+	if (!tn->nt_self_node_exist)
+		p = tipc_nametbl_insert(net, &ua, &sk, addr, &skb, &err);
+
+	if (p || err == -EEXIST)
+		tn->nt_self_node_exist = true;
+	rc_dests = nt->rc_dests;
+	spin_unlock_bh(&tn->nametbl_lock);
+
+	if (skb)
+		tipc_node_broadcast(net, skb, rc_dests);
 }
 
 void tipc_net_finalize_work(struct work_struct *work)
diff --git a/net/tipc/node.c b/net/tipc/node.c
index 77979a850df2..496ef262f315 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -111,6 +111,7 @@ struct tipc_bclink_entry {
  * @peer_net: peer's net namespace
  * @peer_hash_mix: hash for this peer (FIXME)
  * @crypto_rx: RX crypto handler
+ * @dist_bulk: flag to redistribute cluster-scope publications
  */
 struct tipc_node {
 	u32 addr;
@@ -145,6 +146,7 @@ struct tipc_node {
 #ifdef CONFIG_TIPC_CRYPTO
 	struct tipc_crypto *crypto_rx;
 #endif
+	bool dist_bulk;
 };
 
 /* Node FSM states and events:
@@ -400,7 +402,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	struct net *net = n->net;
 	u32 flags = n->action_flags;
 	struct list_head *publ_list;
-	int rc = 0, bearer = 0;
+	int rc = 0, bearer = -1;
 	struct tipc_uaddr ua;
 	u32 bearer_id, node;
 	int err = 0;
@@ -421,6 +423,8 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	n->action_flags &= ~(TIPC_NOTIFY_NODE_DOWN | TIPC_NOTIFY_NODE_UP |
 			     TIPC_NOTIFY_LINK_DOWN | TIPC_NOTIFY_LINK_UP);
 
+	if (flags & TIPC_NOTIFY_NODE_DOWN)
+		n->dist_bulk = false;
 	write_unlock_bh(&n->lock);
 
 	if (flags & TIPC_NOTIFY_NODE_DOWN)
@@ -438,17 +442,46 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 		tipc_nametbl_withdraw(net, &ua, &sk, sk.ref);
 	}
 
-	if (rc == -ENOBUFS)
-		tipc_node_link_down(n, bearer, false);
+	if (rc == -ENOBUFS) {
+		/* tipc_named_node_up() calls tipc_node_distribute() and
+		 * tipc_node_distribute() returns -ENOBUFS.
+		 */
+		if (bearer != -1) {
+			tipc_node_link_down(n, bearer, false);
+		} else {
+			/* tipc_named_node_up() calls __tipc_named_distribute()
+			 * and __tipc_named_distribute() returns -ENOBUFS.
+			 * Force the node down to retry distribution.
+			 */
+			for (bearer = 0; bearer < MAX_BEARERS; bearer++)
+				tipc_node_link_down(n, bearer, false);
+			return;
+		}
+	}
 
 	if (err == -ENOBUFS) {
-		if (rc == -ENOBUFS && bearer == bearer_id)
+		/* link has been down already */
+		if (bearer == bearer_id)
 			return;
 
 		tipc_node_link_down(n, bearer_id, false);
 	}
 }
 
+void tipc_node_set_dist_bulk(struct net *net, u32 addr)
+{
+	struct tipc_node *node;
+
+	node = tipc_node_find(net, addr);
+	if (node) {
+		tipc_node_write_lock(node);
+		if (node_is_up(node))
+			node->dist_bulk = true;
+		tipc_node_write_unlock_fast(node);
+		tipc_node_put(node);
+	}
+}
+
 static void tipc_node_assign_peer_net(struct tipc_node *n, u32 hash_mixes)
 {
 	int net_id = tipc_netid(n->net);
@@ -576,6 +609,7 @@ struct tipc_node *tipc_node_create(struct net *net, u32 addr, u8 *peer_id,
 	INIT_LIST_HEAD(&n->list);
 	INIT_LIST_HEAD(&n->publ_list);
 	INIT_LIST_HEAD(&n->conn_sks);
+	n->dist_bulk = false;
 	skb_queue_head_init(&n->bc_entry.namedq);
 	skb_queue_head_init(&n->bc_entry.inputq1);
 	__skb_queue_head_init(&n->bc_entry.arrvq);
@@ -833,9 +867,12 @@ static void tipc_node_timeout(struct timer_list *t)
 	struct tipc_node *n = timer_container_of(n, t, timer);
 	struct tipc_link_entry *le;
 	struct sk_buff_head xmitq;
-	int remains = n->link_cnt;
+	bool dist_bulk = false;
+	int remains = 0;
+	int dist_rc = 0;
+	int bearer = -1;
 	int bearer_id;
-	int rc = 0;
+	int rc;
 
 	trace_tipc_node_timeout(n, false, " ");
 	if (!node_is_up(n) && tipc_node_cleanup(n)) {
@@ -850,13 +887,33 @@ static void tipc_node_timeout(struct timer_list *t)
 #endif
 	__skb_queue_head_init(&xmitq);
 
+	tipc_node_write_lock(n);
 	/* Initial node interval to value larger (10 seconds), then it will be
 	 * recalculated with link lowest tolerance
 	 */
-	tipc_node_read_lock(n);
 	n->keepalive_intv = 10000;
-	tipc_node_read_unlock(n);
+	remains = n->link_cnt;
+	if (n->dist_bulk) {
+		dist_bulk = true;
+		n->dist_bulk = false;
+	}
+	tipc_node_write_unlock_fast(n);
+	if (dist_bulk)
+		dist_rc = tipc_named_distribute(n->net, n->addr, &bearer);
+
 	for (bearer_id = 0; remains && (bearer_id < MAX_BEARERS); bearer_id++) {
+		/* 1. tipc_named_distribute() calls tipc_node_distribute() and
+		 *    tipc_node_distribute() returns -ENOBUFS.
+		 * 2. tipc_named_distribute() calls __tipc_named_distribute()
+		 *    and __tipc_named_distribute() returns -ENOBUFS.
+		 */
+		if (dist_rc == -ENOBUFS &&
+		    (bearer == -1 || bearer == bearer_id)) {
+			rc = TIPC_LINK_DOWN_EVT;
+			goto link_down;
+		}
+
+		rc = 0;
 		tipc_node_read_lock(n);
 		le = &n->links[bearer_id];
 		if (le->link) {
@@ -869,6 +926,7 @@ static void tipc_node_timeout(struct timer_list *t)
 		}
 		tipc_node_read_unlock(n);
 		tipc_bearer_xmit(n->net, bearer_id, &xmitq, &le->maddr, n);
+link_down:
 		if (rc & TIPC_LINK_DOWN_EVT)
 			tipc_node_link_down(n, bearer_id, false);
 	}
diff --git a/net/tipc/node.h b/net/tipc/node.h
index 499e8ea8c753..cff34e1a8bc3 100644
--- a/net/tipc/node.h
+++ b/net/tipc/node.h
@@ -131,4 +131,5 @@ int tipc_nl_node_set_key(struct sk_buff *skb, struct genl_info *info);
 int tipc_nl_node_flush_key(struct sk_buff *skb, struct genl_info *info);
 #endif
 void tipc_node_pre_cleanup_net(struct net *exit_net);
+void tipc_node_set_dist_bulk(struct net *net, u32 addr);
 #endif
-- 
2.53.0

