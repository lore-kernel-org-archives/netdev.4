Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795531394;
	b=OyTEtPH2kKo69OVOdha8PRz33Oto1myBQdoR7jCi2ZWsSkL3dTr5CqGk39tePO5KapuB
	 +8vGgDO2a8HFDnBee8X+nspjxIOQGtjv1B/YJQd/6XSlTIvAi9yVRfU8MXVC5qjsh1H6Y
	 JXu4dGPm4/zSKbPJAfmvwPBYDSBVJgfXi/TauBDnWsJYLiLxllwDAOviMriiG4E1CCc58
	 rUJN/NFkaSIopdG3o781i0CZt8Fci3sYYceKR0ju/oMMyfSYP7/XmsCbf8vkOU3dHsPPw
	 p6zhnfy+NeBOwAs9wO4iXMbtHmNiMmmnvosddo7cMC4Vucd+XDy40hhrxslvjmSxqtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531394;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KqXB+AAuDQaPweKCPXonGy8lZRtNRAwyYIkP+qDfhzY=;
	b=5dsixVX1wXhV+EvS+slR0vBurT25IeElztGJZgCSFdMJZmqcwIUsRy3GYttSnTAJUFlA
	 8y7BFJz6fFTW/jOUWgN9q5rm26uBKY/0flaU+Ear2g0dVlqkWXwCj2BqMxCVXydb56F4P
	 k5hvrHLyO9fKDGrP0bEBkqgghp/bWzhXuQW/MyhAlD9iJ65fA2Nr/udMFu/5A1asJ7oMp
	 6aqdGf4S3i0b2EXb929lqIYNs4ujlKOhgFu9YAZiCMcJXZ3/ucxOJiZqKWVVMI3VYNF7H
	 2OQTY9wfCyJ1XHO8afKh0y4f9gjWBrZBXGOQWcmDaoHWsydfhGKJs7ltpWMJ3QpwcGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SSuqkRgd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.26
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F3606A31E;
	Tue, 24 Nov 2026 14:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SSuqkRgd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqBxJSNbg5+BFLBZkbOnzc5gMdlua+upQc3rFhbXAQmhpSdp5JtlELJ8dsSwU1echMMAa/08y1IwwI+6Mm0h9VitcBZnUGCZTVlCZz1WQbJ2drKJ/qja0cuR74edGl3x27+ytRrLD68740g98Vic/pBdURjJVXz2MuQDeOlaGR/2RP06P1a16fsuCtlSHKlTnYutNmV5r+njvJRi2czYpBCGJrdYHzjiZRNdjUMfuiZe+oyuuMvM0fbUfieec8Zk/s3Uoz1VERidhusS8zzkuI3vuAcuqRWMwWyUY+8b3yf2n4wxK38stNCTJMfJAFBmo8N1waW+qeqQmV6RA3qHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqXB+AAuDQaPweKCPXonGy8lZRtNRAwyYIkP+qDfhzY=;
 b=g2HqRpqrsvcPfpWSpqNGeXRx0ekJcCnLez3jwQoh8INirGrij0YqKsYat0dlSDceq9esnuOxqqKASmC62bXRpkR6qMF1u5HYo3fEGoKcrOmWO4hFrRlt+Ap6Pb2gtJFJBtDjMh6JUkCYffTbzaiOX7lIvuCg0tF4a4vj6qkB8p5HOyU//0vGIaiY95Zo1/DpvMgUlDjGNem+c9E8AzN8vyFvKErqoRwF832xectiqDUTlUJExY3wseZZzINyNsT2DdMlx9rGR9Kxn3bTsHiPJrWKmJQu6Arhcg+nwJ1kIsgwu7Ic37y/P2lc3+lyLTN4wH/+a431CPoLzYX+NwjuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqXB+AAuDQaPweKCPXonGy8lZRtNRAwyYIkP+qDfhzY=;
 b=SSuqkRgdpMB1H+N9+qfvXK4vgJOtVucrIBkfQnvQAYles01Zs1xo5wSiZ0/48cA/ZCiy7uqhZDK3vo27re6+HyodkiA8YJ2jnNjo4TBPSo48oyY/Lz/IfeDPfRui84K4bhTpk+7k/JawNhdCJQYMnBYeKNPSlDF49OLm34ItFskPNXseRoJ9q8gPkqd+xvap0lhVRUa6XfuU91Yau0q36u5Vj/5vTWu15QyoTXyrVeK0VGVmUFVgOghKkuweXNwewM3kfj+9wcOt1t1cyXJmqnIHOFNjc/KBh9Hv3EinpnVCC7iOtSouFMJY1Jguj4O5ARmsBdjM+JjTlYjEJuHJAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:41:27 +0000
Received: from CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591]) by CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:41:27 +0000
Date: Tue, 24 Nov 2026 16:41:18 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.org>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net-next v4] ipv6: check mc_forwarding before calling
 ip6mr_get_route()
Message-ID: <20261124144118.GA3904967@shredder>
References: <20261120032327.18375-1-sunwenbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120032327.18375-1-sunwenbo@cmss.chinamobile.com>
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To CYXPR12MB9385.namprd12.prod.outlook.com
 (2603:10b6:930:e2::13)
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
X-MS-TrafficTypeDiagnostic: CYXPR12MB9385:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6bd44a-e770-463a-965c-08df4a390523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|5023799004|11063799006|56012099006|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+k4ILS03uROH3El+/d2/pm5j/xkVuyuZQP8Xok00Nu4fxylLbt+J7dv47q7lKCdaEtsM5JLzMlzEuwMIh/CkixPURWrtsvi6MSHipOXUK4casxIMerE3rOyqzlAmEteCp25W90D6YLQ2lvxLgStOSBizh8cPlGa9k3sEqbwTMHi95slZSHdHVHLUxYWJSy8Y3W0eTu9Ca3yeplyIgEGfofYPlBhwYtiCynd3kvLKYYHEIbmWGuiuCo1IJmVEpZiXtsf7LnGEp4PrJ4P5ifoJM+ROhuzR6l42taCKMF+Z6cgogC/QlOpSu0ceZzdYyjGPPNhI5Qsl9yhbliPGE24/kwSmu1TruvkOCc4WgsuPEPIfHGr3T7hbLG6MASw1L6LNoFPg4qco9nMHktdluKJhTRA3xyQ6oGFLK2kxjRWBn7RbtBx1dlocv4f1DPKpuMZY8pkyZ99gu1yAYYSoEtASHzqjt3wiSJy4iaiATjB49vE1ORfKop1cP3MButLzBSRWutHidB1hFKuU7lLNLfpU3/M7AJVB8LcROf4Cd5Y/RAJi7a44c370I6c3gOha7Xai3dfvvBvjNAGGQWj0ZiJ4CDlKimWsgRsDpLz7Kq6oncUjiGzJjR7gKU8aExg1cyOvyuHnYJh5/F9ozSskHHL1HpFvPR6ybxL//KWpPNOnAA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9385.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mIpfQDhI0t9GLQl7FfgrqEYM9NTLP7S7QzUhGmNaPN2qj6aeJZQ9MGvwkrn8?=
 =?us-ascii?Q?DQN/ig5ZovRTvULFBoUzb40ZOo4sY7PvpzZO5KvNcCGYtkuhJPyhIhNYYEbe?=
 =?us-ascii?Q?13bwf02R/nJxzDlXyDJ/SulAlRZgX8t8mI7CkyKzKC4KM1TzqjrPBepbpKai?=
 =?us-ascii?Q?GYF1WgQLPo1at9GQbMDSj90UtnmcRtK5xKCsf6btQetBBkLiyewaGl8bjVKK?=
 =?us-ascii?Q?zJlpUIa5J4ZdU/F6AokivTFWyXswUNSrc1Lid/N1Cedyp0REjmdE4bFRkf9g?=
 =?us-ascii?Q?KECO4zn4CXvzPOQPD5+cY2lY68euSrcer764RIySiFdPfEZa2ydarEDvHVvu?=
 =?us-ascii?Q?J/gjVbuGxISlykbhR/2KY+0QjvNXD84iXPYMJcPg8Nnc+kkJtLDqZe5xiCwj?=
 =?us-ascii?Q?zcbiwHhDxvPWEu8bFPMGX4fPP+8gtFQ4yVPdplQV0EDUNJdMdTDCss/3PxNh?=
 =?us-ascii?Q?ttlpbXu+A+5TsQmDBHxRzyl3NMN/vWVFQK0YLVQUWEfm98vtAd1VLFNGAfiu?=
 =?us-ascii?Q?Ew0NDeNIecbDDKbz6/HqVCCDp1jQBaPtOp9jZZQQaEyMdBzQoWjHpYNIWA9O?=
 =?us-ascii?Q?ZPLn8DDVDE3oBc8uLaW+vFibrG18yj2EnNAZSXlkeXIj7xNu+sCkDfhdtvhT?=
 =?us-ascii?Q?gzfOfE4E2RQyWcW2nIdOc01z3GoH8ZqUfnwT4ftqYJtE+6FFKubjVHxlmJfA?=
 =?us-ascii?Q?OSAKV8nQyvAo7rXUmORhHV7Rr4ue1ejr2l2lwXyNxpkBkE4zpHzAlsOTbhM6?=
 =?us-ascii?Q?d8tQ1TyhgoPtdJCWxS3gY5xcecLKRlzoR0TCM0hT1wH7o3tF8yZOugkOcDHs?=
 =?us-ascii?Q?8EBr3Hik29bvCTJ6l6Nza0hVybJQiKuaQ9kWrNA+jrvK2mmi1ToWgS4DBXjH?=
 =?us-ascii?Q?srUEQctOYuqk3TV9mKvLTm7PX0/qjOePmGKqqxKFC8PIlocexK5a9HvZAodc?=
 =?us-ascii?Q?qPOxThHwQWMO25ymAqrRvcVY5mBIIzykaLshI4q0fkFgtqFD6YUWbV69JCQq?=
 =?us-ascii?Q?MZu0ld1nWuGgsxVqfcM5lo7NF1RG2TT8b/l/ixO9SPoPeu5YKXzL8ltwNca6?=
 =?us-ascii?Q?OItdgnOPG0D78dFxlg1Gs3DaZy2BZ9H5tfhxyvHcwomDXFTNqrqHMPxjwqVl?=
 =?us-ascii?Q?YG95viJfklbKckTmgkwg640P+jmxepa/GzSsqRTbjPU82QCM6T3m6l5q0LZi?=
 =?us-ascii?Q?EwnuA1ZGQZy7GaZ1sH7IXCJIthSt/hAtGHRPZEAV2SP9ef0mwc+SUKf37HWE?=
 =?us-ascii?Q?vifjYVy34bgQK37rUIkujJBPjOlSjrXBmAya/8xsMrEiVmaAnFnPo9RErW+m?=
 =?us-ascii?Q?kYhBnEXMMpYwmI6WRW3o1y/73ZAnAhEDOzlz/jelr74eI9zyzbu1lqOW1liZ?=
 =?us-ascii?Q?CHCD/c/y9uqIITWAcnAukUc1GEXycUVBeOSw91JwlJlzceebIf0HjK7YdZD+?=
 =?us-ascii?Q?WmNpF+FI/YuA2UvOZ2t+nG3kIqOTZo0UlcnYVdqgTJV+9dXkCj2S4/shpA2u?=
 =?us-ascii?Q?+Z4Lec4tUEA/q8LnARQZp3zOfXQgC2aku+GTDZkhBl3XVwDokD6vNWcR5z+M?=
 =?us-ascii?Q?cr9aWVXVNku7Ey3jZnPAsIfY0TEhow6owmWcDLRwLBxuoGlcX4Iw2GjH+vaJ?=
 =?us-ascii?Q?QGzppxt3TxdWQe+fyQLBy8t7SK3K8ymmaQ/rjgmEE+Ek05C7OHBdK+WLLYnQ?=
 =?us-ascii?Q?UEBiaHKqUohvlE485DKQmzZB84ybZEPrP5zNHZlIJm202gw0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6bd44a-e770-463a-965c-08df4a390523
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9385.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:41:27.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0RvuadpPB2OcnevLLtmXgIGd6RUqiEmTUWzWwNB6fC10Ev77wV6kryXdb/HERoDaQwM1JS2g0h6/y5F9Exdow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098

On Fri, Nov 20, 2026 at 11:23:27AM +0800, Wenbo Sun wrote:
> When CONFIG_IPV6_MROUTE is enabled, rt6_fill_node() currently calls
> ip6mr_get_route() whenever an input interface (RTA_IIF) is specified and
> the matched route prefix (rt6_dst->addr) is multicast.
> 
> However, ip6mr_get_route() should not be invoked in three cases where
> the kernel does not perform multicast forwarding lookup:
> 1. Multicast forwarding is disabled in the network namespace
>    (mc_forwarding is 0);
> 2. The queried destination address (dest) has interface-local
>    (IPV6_ADDR_LOOPBACK) or link-local (IPV6_ADDR_LINKLOCAL) scope, which
>    ip6_mc_input() never forwards;
> 3. The query requests a raw FIB entry via RTM_F_FIB_MATCH (where
>    inet6_rtm_getroute() passes dest as NULL), for which IPv4 uses
>    fib_dump_info() rather than ipmr_get_route().
> 
> In those cases, calling ip6mr_get_route() falls into the cache-miss path
> (where skb->dev is not set by inet6_rtm_getroute()) and fails, causing
> rt6_fill_node() to jump to nla_put_failure and return -EMSGSIZE instead
> of emitting RTA_IIF and the matched route attributes. Note that
> supporting MFC cache lookups when mc_forwarding is enabled for routable
> multicast groups would also require passing the queried (S,G) and input
> device into ip6mr_get_route(), which is left out of scope for this
> change.
> 
> Align rt6_fill_node() with IPv4 rt_fill_info() and ip6_mc_input() by
> requiring that dest is non-NULL, the matched route prefix
> (rt6_dst->addr) is multicast, dest is neither interface-local nor
> link-local multicast, and mc_forwarding is enabled before calling
> ip6mr_get_route().
> 
> This alignment was identified with the assistance of an LLM-based code
> review comparing IPv4 and IPv6 multicast route get handling, confirmed
> in a User-Mode Linux (UML) environment, and verified in UML that
> routable multicast queries with mc_forwarding disabled, link-local
> (ff02::1) and interface-local (ff01::1) queries with mc_forwarding
> enabled, RTM_F_FIB_MATCH queries, and queries matching a non-multicast
> route (::/0) all succeed and report RTA_IIF.
> 
> Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
> zero new warnings or errors.
> 
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
