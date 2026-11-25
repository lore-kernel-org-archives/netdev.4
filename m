Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795594942;
	b=Qbvpx2vP2PTkj61FHURGplELG13aYYES6uzS+GwXA4XqI3H9/e5WchMbjjXvCmtgk0l9
	 5zqzTohARdeLewsK9LvUZe6IjIpMydBkB3dMnPWOIwzMl2GIouqpgh7MuXLrpDlu8UqMO
	 OlJSxF84eY3tSXJAFrAzLlhanooNLnOqcLYopjp2LS+wlkZDRYpi7MxOf/vNmaywhJsdJ
	 eNk4ejEeJ6Ag2FDFyyAaDyZnfIqtqFlMS4qOYREVQIujT28nyypokiD+PFOtIqQHxG7wo
	 6VLrCL8Bl00IIcnPBNp4idaXdkm3fQnz2JkUYEf4L/QLhvh5VCPJrLlqbT32wcc/bbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594942;
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
	bh=YerLzP6OXrNcSjStfZTDc7s6mR/Xz/prthiSVvQWblI=;
	b=k1k+j4UvtXxxSug+YQG19XbOuPW6p/mfWfCtrx4T283h4259eTaEKfcLcTopQqryuIHT
	 pIwln9n61BGfcSr8VA+gfxe38WjfRKcRtKcdE51oNXKfD1SkSWkuKFqvBUFn36J9P1VcI
	 LaxfpmvRv+D2ZlP7hS0MxzfqMnOy3zC9BqVkVSzH4E6sout/yzM+oEJP53txS7/PS4yQO
	 iBDRdqQcw6FwN0eSDs4BA3RzCgowxB7a5ZlOTCII+uGJ42KQVKDvsL6c8InOoB/3D+K72
	 qOXxHdB0cYlUHGC7L2RvuvfTTUM/PZRFcTJk/Uy4fY9uyqxnuF1o5LYajpvIsq7ujsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XlEbkE0e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.9
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A8606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8A8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XlEbkE0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKS1bG9kJ7mBz5B2v6Dy4eKpr5rCyQz7NHs2bERV0CDYso9Rs8nx26hO7qwCuFkpjQMA3Rx1MENq+8I9ruH8yTjib3ryOgkFQpFmD/7L75rQBDw1u7cqYk4pmlt4HW6kOayYYcYIjAOQMLwWKkLVWQNMu1fDOJfgvElG1xYAUPBUKGmKioIyYcM+Qa0dIZ6iuTb36QnI+ml5LSUsHbkk+zErvgmmM1TXL0yaKMNmc8MWwRqtjtv130T1OG8ifst3Pu0A2lIa8ifl6TluFDc8jaRLx+lqLC/L1YVeIg5OIaPUFsnVqpBcG3QkwBHtrUq43Sq09n9ky4kF8cQ3n/j9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YerLzP6OXrNcSjStfZTDc7s6mR/Xz/prthiSVvQWblI=;
 b=wzxjhB1PQJuoDYer5deOtY65UQVzWv1liU+mXwCx38EQ/iZbfEIFhGvnNlNFZ09hofonvDwxp4rhg9KSpBdeXs0+Z/f6Z+D1rT6yFjkEwZ54RmjWChHTj1QEkO7gfEGpAIGgNvPK7ucLoqdePen3zcUcHorBTYiDENK5mR8iPCz2w4axfl6BMg8kXBbLnpejdKi7LgafTeVhHaRAW/d1FYs7UZt3N4SP5l81n6zzoOiwWithn+ERgfTpHUr0THaHFA/gHziXs56b4IY/0Vx8ExfZOuPMfLAe2ISI0GznBW4Al6DLwWPCdPSteQ3xTt5iAa62tlJ0cS+JMN5CucJ8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YerLzP6OXrNcSjStfZTDc7s6mR/Xz/prthiSVvQWblI=;
 b=XlEbkE0e02KIBVVo0sKeRuqKAUZEViieQpjAow2qUExGNOMK3zzPXori4ohup5fmgnUwt3FNAeehfB9sKd+AhDrIlXtn+t+2Mdc28Ij73oaxtH6Pj2S2mH7WffeHKAtHpwHGGNawOkqb5USS8Rew1LAMCBXT2+q/2HD9BOVJz1vtpk8GxNGHE2GOIFOYmb0UH3bWAcsWMjZ8TxqSnYaLpZv0a4655xCypAdiCfD01ktMODtq2vx4MGZNX+tl04kcB8ef31zjA7ssYKoEmfjL2sZv9V1pfO/WriphkUg4SSlTHhlJfnvmvuT6xzdMuPB9LLpkLcTVtdMmV/I26333hA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 08:22:18 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 08:22:18 +0000
Date: Wed, 25 Nov 2026 10:22:07 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH net] ipv6: mcast: do not pass uninitialized bytes to
 dev_mc_add()
Message-ID: <20261125082207.GA4158835@shredder>
References: <20261123124458.205233-1-edumazet@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123124458.205233-1-edumazet@kernel.org>
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: c56440be-57ec-433f-715c-08df4acd3853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h/QBst8AP9H10YGHm2uiUXnneJ5wXpS1VbhiFJ6trS4IBUmeAScww+Vj520+8JgvA4Ny7SP8sEP2jUKyaabNKlut77ikau9NzY0n1dxm6+bk58LxC4u3PWDQ2rYEjrrA5XrVzjF0SE8heC/QN/dcDm299tokGqmpMG1pVunmIp+Lol6pnAQd+0HSBGjtYi6pMZzZ1NZc8SAHOdy2RQ8MEUtLipRC9a6ABciBqtIj2Uq12IX60mZ817jBD8TMhK5EU4GvEHZmge2wBQs80Ubw6Nh6yKhPh8zJ8wQHmazy9zqUT4cgdBhALeoxVUYBpuysohsCb9vw6FIRurws2PZFIy6+jRDFWx1GhGb64G9RQ4J8b1BZ/9smDwRo+Y2ovFWYHIfVj6hqSbRGY2SX/uskAHg+KTYZ0gs6cJpmYtJVio/CV723paIK7DLXaZHWHoGTmAy+zSKF4dAyUE71b810QPjFXqLiOyHYSwZ7GbM7fjmQ914i3NGjlZ8e7GD7+Tsz0rI1vpRX7o/uO96/POhe14NFh4hlxojEf17NhZ1h7gTnq4ikKqQAQgvqDXq0AaP8s9JZZQJUcYCtB3vHG2uCQVwXtABbCvBXPTBB5k6X5CW07k3IgSqluf0eYXqmZtjl0VM2y52ypYma8uDQbtOEiph99f+kyB6Bk42QQwdzaDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lwayjJ3Xpauthd328qJGdE0STfQu+uSF1tM6yVKZ0hqNrhOgc10wmwiIl6yr?=
 =?us-ascii?Q?rPYAMucojj++3mkuiFhrER1YQaQWhkJNzlWbknQDez1Fj1EpunZVHS4LcyJ/?=
 =?us-ascii?Q?JQAqAVHMWbrjD/vbaCyYc85emH00D9WWqvf3Ln62usWRS7LLxoWn6Haitg/5?=
 =?us-ascii?Q?9OCtlzaEPfXiBwBukuWqwDlBMVvCHR8k0MJRgch0HiIGJeIvUvAZxYTtam+V?=
 =?us-ascii?Q?Jzb6tPXKrEQjDKGV5L+mA5k7UVAv86i6qheXZ1jcxmzP5jCSYTnUYF0Hr5IW?=
 =?us-ascii?Q?ruk7UqJ0E8bgGcx9G//g2Xj+mz/He0ZBRWhW1lCyJHUultO1Ozr7+SNVQDkU?=
 =?us-ascii?Q?foZyj9PHUu8WY9rG9PDzgyiluFpqNb3TImDif7W/vTN6fwqjNvJgeBDWqRAL?=
 =?us-ascii?Q?4d8s0+Enq2Z1xT80MeIPnlMc8UI4QnP+hu5oJGRgbDIhOh76CUQg14WfFVFn?=
 =?us-ascii?Q?tqmwDmR8bUxF00zICI+s7buBjyFPjh3sdlR8lzHYJKll4mJWHGv+D9XkNa+q?=
 =?us-ascii?Q?aqbovdgpR3ibaMm3ybicDOfeXtniC4WkRMP2oO6A/aZ4bGTiz2Y1QGGpT+hj?=
 =?us-ascii?Q?2Og1XtDAn2Olvb2QokCycnYiBpuPmBIk2s+dCfhkgLOg6lMpcAOo7DtJquxH?=
 =?us-ascii?Q?bgr8fVNw5v7S5CYUp3+8Y2Rb3CUa9J6IqODriR+B+EC8nvxSL7gATt+AE6pR?=
 =?us-ascii?Q?EOVcXvjmllcqhCw+eeM9Ui3ULYAW6I28Pi5PevuzJ5COMd6ifWM8JHYb/jcn?=
 =?us-ascii?Q?+ILqf63H/em3b2/kRXoYnsp1b1jju0B7HjbWOf9aJG58gWH8O6nmC9hwrM6P?=
 =?us-ascii?Q?+xmJN1NwpSh0EU1SuIdTt9ylnZtaDBKAXc12/dM+nWXS71wA4NLX1lvlNsBi?=
 =?us-ascii?Q?D1K79dnIxGKQ65UO22taAlQPHjsbRvJLibeFyukcpz59yY7tTIxhoEBZIV/c?=
 =?us-ascii?Q?v35drwm03w+IdqsYVE7R6DguG74VAJmze3vG9NHQOmPHi6ke2w9B8L05R6DA?=
 =?us-ascii?Q?XdO4jmhFW+v/fZdYsMubKX1nrC/cmAf9tP6ka3Yjc4FwfXxX6P/p2JzXBwmn?=
 =?us-ascii?Q?BMuSB9E/Ox1sGU+1cRyCG7xycZU2Oldqc9OIvQXmSi277IGR+Fcd9RL7FqqJ?=
 =?us-ascii?Q?nMZgsz4KqVHu2DPOgu51lO9q1k9281og+r4lggL2KCyamUjS5W7MQgtUsoqx?=
 =?us-ascii?Q?WW4ctsGRL79laArt3lF1W879tr6krvJghVWVxLfE+1h37ipZ8KXbnlYPx0ag?=
 =?us-ascii?Q?zFhjSu9XgwTxv2GN1hSk/AeDzBPglV2cm79FfSgfUgYLefC0zLE8ktIcTAEm?=
 =?us-ascii?Q?qZCF+vdNEXYg+3ms+JjSltF7x7c3FPTBx3bWs2J7ssP8vrWiudB11IT1vXN6?=
 =?us-ascii?Q?lDQ+jgSPdH84HlONXG6u/00PS2RVW2MYcJ/1VjTta3WwEW6CAABWCOIteTwG?=
 =?us-ascii?Q?EkpycEKXb3/5LeN7OiRGzmPDaLpQpwDLdInjV/2tEycR/wNZny09O9bNbUO8?=
 =?us-ascii?Q?dPZUKX9UL9KSztgX5+ltO+SWv1z9ChCH4+nvDyIr6I6ZTUMlu4+DKFyE3Exo?=
 =?us-ascii?Q?zSoydRyaQl9S72IsQnxKR/Q4s9bbfA23uT4cLC3DHBjnD46lZwW0mVL46qfb?=
 =?us-ascii?Q?LzTA1GzDxgL3MI11Rb70ty8BVz/RdCKFRdj61ZmTvvMXfAsOmxSYsxxFZ4gR?=
 =?us-ascii?Q?+aWoDWS2n1elAvpYMuv8bCBgoJm1cJLxHguUUKPHvB2165H+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56440be-57ec-433f-715c-08df4acd3853
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:22:18.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ujn6P1ac7qq8mHbdfGTXBMcMApeMV8VucBBij/wO6dit7LHWnOrzOwxL7PSRXIEDzfVQ4egpn5oycqajgQIchg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

On Mon, Nov 23, 2026 at 01:44:58PM +0100, Eric Dumazet wrote:
> igmp6_group_added() and igmp6_group_dropped() build a link-layer
> multicast address in an on-stack buffer with ndisc_mc_map(), which
> fills a number of bytes depending on dev->type.
> 
> dev_mc_add() and dev_mc_del() then use dev->addr_len bytes of it.
> 
> Since IPv6 multicast joins and leaves no longer hold RTNL, dev->type
> and dev->addr_len can change between the two steps, for instance with
> TUNSETLINK, or when bonding or team change their type.
> 
> If addr_len grows (eg ARPHRD_ETHER -> ARPHRD_IP6GRE), dev_mc_add()
> copies uninitialized stack bytes into a netdev_hw_addr, which can
> later be dumped to user space by /proc/net/dev_mcast and
> RTM_GETMULTICAST.
> 
> Zero the buffers.
> 
> Found by Sashiko AI review of a tun patch, by code inspection only.
> Kernels built with CONFIG_INIT_STACK_ALL_ZERO=y are not affected.
> 
> Fixes: 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.")
> Link: https://lore.kernel.org/netdev/179512665919.3136.5931555157250030152@kernel.org/
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
