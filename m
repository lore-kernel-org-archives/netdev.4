Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708662;
	b=uzyKgMMFBGxUqNe2hj0yCvRDmjEFm2A5Ihm6JeANQ2kvTQR+bAosWuE36IUrH8YxBkLo
	 EfS9YXW91M1Yzl9n37pSnlZf4Q1IPz4VvyLZULdi5gPMsXo3+4dN7JzFzef8xfGqVxOfM
	 rrjsCMHbM+8cn8gckB6Pw1LCos/FHOBeMvYW68Aj1XNzFax9DaVT3r2oh8clKvjN6zDNw
	 FKjFoBOqQLm7/8RLKo9PwsHXDg8Mu8Jpfz4JPAnTTA8Rb53DDX3pjcuJkQ9B6yehVTHhM
	 FFWuOpe1VU9+SNIsMflaamaA3iMgK4riFJ0srbGq7+gG9eqWtKjh/JysLnZbjySoMfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708662;
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
	bh=KiHCtxW4FpEb6Bci1nSd2HMDWrSR8HOv05BYzBzjfNk=;
	b=WPA+uCOS/C92X/znJFCxYIqqrw0pZvjLoMWQfgRYxIRXVdQzMKOvkAfcOsfWnHwZEbYu
	 uqD44WJr5aG3wbaAC3rFaUgPZsnSCqjpoT2a/zZ4wdggAGGBkPdbFWhRlcv4DDljHOVW4
	 HFteLsVs3bmb156DsRluivAe1pbBsk0Byxvx9QyAkfysxJ+u9I0cyJzxfyvgSwun1TWr8
	 /liEs9yeTXLwlu3wPdwsUw7xj5O7l81t37XyJ9oTlswqEolp+Exo/KzTG6beuNiNMSAy/
	 xM48T0NwSoqv16gmntL7BvK6YE4yREXnokTqD0UEQbE/T3lQY39zL9Ijgc0USGxLvfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sWiNKfb2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.27
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F0606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sWiNKfb2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1NBvpcQAJDAH9q5pSn3jRUGJv9CF4ejSQMlWjpO8U2gbWkqaRIbVplNsY/wV4SiPRkz61lY+6ROV0U9gmWkGG3h9Rw0xpjKyWb7GGd37AcBFVaf+AzIDA80w9HqHUJfz+lgcdMbdwtxQ63hp9hIWd7UpfJ0htng7ZAfknHHFjzv108m/H+Qu3zV2lpOT12PAirAjb6jdPyZiYsjXSRNsnKuLPcDyQn2WbGHymvgUVzkdQauLq5kyWPcCZwA+iii8wuTs7w0dxCfDHnUFjadPFmDgmnigTUY45rtvv/2jeJ31Jc3Au9ZNBxQexAokA3FNzyIJJrNlorR+h0M6qvgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiHCtxW4FpEb6Bci1nSd2HMDWrSR8HOv05BYzBzjfNk=;
 b=YIepSGKsuUuHn8fbPiAUKiDinCy9uuPJc4qTYS/KDecq7y1IfcD3vt7YMvkXgeTONm7fIiGEXgYAy/g32vHzhNFMjgha2Knwla2ShP/G4hUlAb+U3vNQ7pF7Mmw9P/o9Lpw8r2+AapqVbT/ixLpD3BVassk6mRGbi08G9rQ5mv06McOTqfX7GjYijsvQpAHsvcZj9U1a8CCmvuqlhHEEtWqoBlOfCRczB7VvIsFYPinXFqt1JqhRphUXMAGjyuBP7D4KbXU4FWiPQlGNS/DblQXb1nwHdJI2dNqUMh3v957jFzrddkJzz2m7VBe3vpVO7Fpuhx3KY8I0sek1RKmbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiHCtxW4FpEb6Bci1nSd2HMDWrSR8HOv05BYzBzjfNk=;
 b=sWiNKfb2ff3J16N3TBgVpm96BMk6jaldy1YMBbmXBj5AP6qy6+hwHix12TybyCFgQ3Oaw34+QSKCqQJBkLACe0XkUex/iApgAym2xqI0+zzdeTJbTVq2Dnn34WVjK27Va93xevFBT9Y4jrfrwA0M6MlXUoV6sSr4DGbiS81oh6CNiKsp8GBekuAOqmxCazAiImuRhJwLNS7bl3JQIv95nIuhp33T0nhVCmccxhVNeXHm9fGPTUEMP1v34shoU5+HeDdGmpajwoHiPKFTJfeQSklbSUABZ2rduUemUAlr6fVtljCcKhg+CXS/li5zmDJ5FbgsRA5D3BtL1ubvLrDMMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:57:38 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:57:38 +0000
Date: Thu, 26 Nov 2026 17:57:30 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>, Thomas Graf <tgraf@suug.ch>,
	Cen Zhang <cenzhang@linux.microsoft.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: skip walkers of other tables when a route
 leaves the tree
Message-ID: <20261126155730.GA890398@shredder>
References: <179561512100.3216623.16734853197511150282@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179561512100.3216623.16734853197511150282@gmail.com>
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: ce962941-497c-40ea-7e8b-08df4bd5fed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|22082099003|18002099003|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	fT7AbsqzRzT/CsI84jqyHP51EVwFu6N/Jw+/LTfnk2IcwuLZzTynWQU8WZcJDnpJWTWoSeKoMRRxWavjVtM/pZmyEIC6uERNlHMz/Bh3vVgcLrZSE29XvgGH2SC8rJN+P+TrldNlTeoKYIqVwkxUjPts4WbmU4in05ygJGQgcCFZ2gl9xoE8bmu4F3CZdSwEd61JML1b9f6ugFRuHKcY5T9keM/Ar4mBcfQ4+e2R8UPlIY2KaFk5L6/AzrJtRL8312iiZ9lFiTVSPp3Y4dYUyKPItTOp4Iztghv7kZUEEh/jyyxCD7M+d344iYLMmE7EW5zvZ5hX0leAF5rnRNe0wrkzt2awgYIgi32uoopB3PPzUQg8FcoidDhlu/u3yXvYKS2uZk7semt7dC1dN0oU3t/i4bdXgFivXyPrw0lEanq1TdvZs1RfuOauNknFnVMjZrTpFm/Kj2MbS/AET1xCQEq36JCjiF46ZdUBPimOX6ceK7f4du/FnyR+2jXfGGDJ+6yYzATDUCqj1cMnZYOhGrXMbgrONia3cAJ99xk0ignvI32yS0UaHGSKbOWRKxl3EUzmWinCNq/ZZ/7XYku96u/5De8Zucl78qEXYpQiv9T6Dd0cagiYV2O1/CN4RJ1ILqx8tf0Hu0p+ImFeIfh7RKj9jQDAp2JIU1Ti6uhikHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(22082099003)(18002099003)(11063799006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MIjLz0BD7Kq6mh0+Jiv38qVAa3w0zyyiU4KllavoWT9IGI+WlCRPFsGIXkdD?=
 =?us-ascii?Q?3BTUg6zq3VespoW4DBto5CMCEFwP7NIw8SpJLo8p1TUghmxVBD6yswC13Jmy?=
 =?us-ascii?Q?Cp4dzuxPAsSaNdqJYJgNGc2PBpgYGZLC/6/o1wgXFa4qrzwnhO2eaRqN6enM?=
 =?us-ascii?Q?yQX/lfhXQxr9I4ZhCpOO6ZL1sDP8itpb8sMmHL7odB3hCdIaGQfW4NAGAAM+?=
 =?us-ascii?Q?bNgIrezHUc+iAabZJH1yQZcx8rgO7+m7fhFJZ38t41C/8JxBMy6EbhnvtT27?=
 =?us-ascii?Q?NOAyXR/pp7K9qK9c2mQdPxjIGOp6/sNZxs7GSTdjyOy9yIHRBzODqO6MHdsy?=
 =?us-ascii?Q?aLnAEsIPX4FLJ8tJ70t2CWgyAhMzJbHD6C4KpgV7mQj9iggN8LazB5ZyE7x/?=
 =?us-ascii?Q?DKwfNWFes5EbUTWLjZSwKnjZuLBA48FOqnsP7j1OuNs/fTBRs7uChgbOdk/H?=
 =?us-ascii?Q?OgXB6a9LYlOTEJjyiOZrHMcot3YqV1Mv9Lcuvs/JpQSeZJS7hiHk6V2gmOMi?=
 =?us-ascii?Q?/0Rq2KTledeiw2z24uzXdN3LG0iHLe+ViEb3VrjBdp4fnWDlYWigj30EBbHw?=
 =?us-ascii?Q?6QfVVor8GylaAeQNxSazRxHrPAXaO+M0B8Fnh4vT0AT46GD5LeVw5YToklOV?=
 =?us-ascii?Q?C5LBsyW9oDa/agVesy1o2kBQyQZo8LIQtdJTQtvV1zMwF4+2Zevq17pUhDVE?=
 =?us-ascii?Q?ZQkQcOggdOq6ZNkziPtrv9jwkY8NVrF1PDrAxIR17Tw6onUUq+tRMM/TvJCB?=
 =?us-ascii?Q?y9vl5T+FcWzXIw6CEAN6ib5vijq4asgBPQrk4I27TqdF9rzHEygnNoSFmuIF?=
 =?us-ascii?Q?mBMqKO88H+6vxaVnpjKtgPcH+N+xFc8LodFTLEmpHQNj9wahK+G0irZ9AB4w?=
 =?us-ascii?Q?YsXBj+AkNpYLoRU+QYu+ZvEVSrpAoqAo/nSPHtCxfZVfkQ3ItirhxwNi8U33?=
 =?us-ascii?Q?ArScqabq8bllLvp+aCfoffaYCgfq4Qy7SvlQD/1qU1XoD0yIP97T1LByxb6u?=
 =?us-ascii?Q?dHFOZkdyMDLL9GY7L2hFy96aCxk0bHbqeRsr9GpD0BckYs9EzlCV2irPeHYV?=
 =?us-ascii?Q?xhW6KtRysaZH8ahJBK/zcNOlIZpIRDeIGdFtVGaPxalDZ65UfKjEzgAfkeZW?=
 =?us-ascii?Q?dR7Apr/seU+d3oD7flLQSBQOYe+dExU1XPCLd20IvaEHRZy95YPSH/vzN8nT?=
 =?us-ascii?Q?ylw8yzxGFJ26NnkSQyswgdrREJMzggHym/5esVVJwbXj5QpzWFhas9dlXn95?=
 =?us-ascii?Q?Gp8ClrTQhpyeCYHtS127wCMJcBPYQoF06BEects8NZBh9wxt3B52Zb0ZVkC1?=
 =?us-ascii?Q?EfWv69vUUZ0guBdwVYonprKM16D4SbXTfGA81vU0V9k7uHaIqNtMb/tRG13i?=
 =?us-ascii?Q?uqM+ce5/0wjJGlAUT7v1wundP0135G7jkulIAqxtb5l7jSAMUBXBGQq+/zzX?=
 =?us-ascii?Q?ovOkUKMsg8o4rxImpsOeKOOBUUr5UeMsRryhiMpNoYFVHlQRhBIcx0bWf8ox?=
 =?us-ascii?Q?DFTrj7q1uU86ydXqd7tGAYQq3LdcWM2LP30CM5FIgLKYGTK/daE1fi1WPYWT?=
 =?us-ascii?Q?Jx2+Qj4BRzisAJtAmIGjn1L09Vd92I39cELMoRZ82xMEmF+LY84AEMeQaK9e?=
 =?us-ascii?Q?XmGmipQ1d4X4tTidwWH4IgxEmBR6Pq3xOQ9BNCNPgArQ+Ky3TqRG2QAg89bT?=
 =?us-ascii?Q?C5tHCnxnPz8rqSqXFtiZqe63bP9z3nPwy7peuxOyZMrdXGnT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce962941-497c-40ea-7e8b-08df4bd5fed3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:57:38.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPtXRSj16O8CMCywSnZQzyWQCzxrReWCtdaAYmDVKC4fMj7furVn7JeTW1YjqOdUDsIgbGZQ0kzogi66x/GrMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

On Wed, Nov 25, 2026 at 11:52:58PM +0900, Kyuwon Cho wrote:
> fib6_walkers_replace_leaf() runs under the tb6_lock of the route's
> table but checks every walker of the netns, including walkers of other
> tables, which run under their own table's lock. Such a walker can be
> anywhere in its walk: fib6_walk_continue() sets w->state to FWS_C
> before it sets w->leaf, and the walker of fib6_clean_tree() starts with
> an uninitialized w->leaf on the stack. A route delete in one table
> while a link change cleans another one compares that value:
> 
>   BUG: KMSAN: uninit-value in fib6_del (net/ipv6/ip6_fib.c:103)
>    fib6_del (net/ipv6/ip6_fib.c:103 ip6_fib.c:123 ip6_fib.c:2056)
>    __ip6_del_rt_siblings (net/ipv6/route.c:4086)
>    ip6_route_del (net/ipv6/route.c:4235)
>    inet6_rtm_delroute (net/ipv6/route.c:5686)
>    rtnetlink_rcv_msg (net/core/rtnetlink.c:7169)
>   Local variable c.i created at:
>    __fib6_clean_all (net/ipv6/ip6_fib.c:2315 net/ipv6/ip6_fib.c:2344)
>    fib6_clean_all (net/ipv6/ip6_fib.c:2355)
> 
> A walker of another table never rests on a route of this table, so
> skip it.
> 
> Fixes: c71099acce93 ("[IPV6]: Multiple Routing Tables")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
