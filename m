Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458850;
	b=c8rLMBsJHsSYdKVBb/9Wm6ccBLABC6/mDGYrxDfbIe/LOvOVFSRQ3RMrzjQ8GXsOQxDi
	 +KDxsxQfxqhcUAok0dWAJDgKtUKifFnNzCsSvXL2fLydVWfU3/5eLh61v/s1zKclmgVyP
	 upjSsi+MPBvXSrSoKuXLnFq3nbRWWVSct5m20MDmRx7kXGofcSv9m0xHj7TWh7T+LdNhU
	 04VH+Mw5zXiNcmoyy6PA4fOHgLF64YVWWw31Zl0e2b2l/K8Rhgm3RtNVPT5DEyi0rTl60
	 Fe6YN+ud9t6LfNxJP8nApHxGXkqPfZ37ioGH+RogwFMfUFrtHp+RTtXy0zI5nf98ksw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458850;
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
	bh=6WFmeBx9kIhFTSBruQeGbxaIwq1o/lRAPAcgeRM0qTM=;
	b=XMNYln3+tXXbth49TnjefOk2e9uog8gSWiIq50U58tkCfj6bLJJ627bi+8z96QQ6UJNP
	 CyCim+RYXhFyoAi5A100jW7rH0Hyxl3pqXE+yuzNtNQ+G3TQ9fD2Aeb8VvvhrgOCz00Tv
	 AL4ua0i87WY9ZIS9NvHZhqMQ9ZvqY5KdqBgz9ubj3FNxGYA5/jxobyp8EYiWmaG/f8DP0
	 o6e3HXEYPFdividrZy8C1stBCSFk+IlaeiV0w7gYo7uDu7m6SBBOvf6yb94nGLzCpyeAV
	 AJegjHrho+HdMNnS5Nhfmbcn6StbHKMqiCc8m7ZIT0lIP0YcR1nehasNDcgUblG5yBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DU6LXoMa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.50
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A11606A31E;
	Mon, 23 Nov 2026 18:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A11606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DU6LXoMa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leu7N8yJlWyNbtrvMw7+tid2bHflI5a8OTywu7y1fOlsgtNobwYXBtmyn+GHy9M4pN4JGl/P8LscmjW7iVTQtLiXW320Gbpy9IH+py0WGus/CNC1kEiSXvLiMsdNEcn1ZuCUReGzXQ/h7UNncVktMTx5ZwjNY1mB3L6rVUQvvCsma+MH2nH1KTA8dWdQcLVUegPNtR6+hUgROMDnAJ9IXiATyNAplyjVdcUG5YxBlHCncXB53GY9LeaHInusWZPspo06zjo46L/w7bw09cY1qIB3khQQ3pTgB4bTVcCNvWsRY2zJJ3DW1bh6KZ9X0JpaA8hwFLqJ7VQdJ/qF5JWNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WFmeBx9kIhFTSBruQeGbxaIwq1o/lRAPAcgeRM0qTM=;
 b=h7gNsoxkcQooeCbBh48ZSzdZH7aD1urhB+YIhOeps2XwGv8gZeCdkkW5nnVACZ/L21h/dXgaNS1JfUl9cfb9QK66ZlRGK+2gDo+i50ZUtGh4Eg9WN8fQclid7j1uZ2WCXIN2XNlemT0kW9D5O4PWJnUyGjNOZPPmwQeE82JDTYViuspUWdy7YK5kbnCNmlmzojTAVsDHXPKV9mHjMJtvR331JX2wtUg7Uq2w6ULCkvrK6PFKHejWIro8gZ8Lmtf27fh/IKy7waGDs6bb9CT+2dhK9d6gHz9H5UVLoCOWwdYAxGQH58hZGERZ+6iCYt1dWXqyCVlgla/ZRFg7gPQaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WFmeBx9kIhFTSBruQeGbxaIwq1o/lRAPAcgeRM0qTM=;
 b=DU6LXoMa+gvgjAdi3g4wjR/jQHsIOwjPI1zg7wD26olizDn65tI/qMWkH8HZA0kwBglBKjqCj5ZC05ycROG5mlt7w7dmi19s8hLYLBIEUrXcF4Dfho29KHYkHo+3z1O0HgpOtuW1MtFPfft2V3/n6/DEjKYqo+Lm/kP8HLQE6xdhJbjSZiqKHt5pUGCU3rkATZh9bMysaglhcDyVXg7HAUTguX/wo8fEDmMvncjrYORt8QkxA5j23dDddSgetO6KCL8Y99AWhso5AqJcOmHFhB960N1/RxSo3GBPYw3Nl0nk0ayhFBx9iM/03FTzOg/X8Ynyko9ssJKTqBdiYXgFvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Mon, 23 Nov 2026 18:33:37 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 18:33:37 +0000
Date: Mon, 23 Nov 2026 20:33:30 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: 18983559317@163.com, dsahern@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] igmp: use copy-on-write RCU updates in
 ip_mc_source()
Message-ID: <20261123183330.GA3587849@shredder>
References: <20261119125112.540125-1-18983559317@163.com>
 <179543961529.3135.8092538762905615997@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179543961529.3135.8092538762905615997@kernel.org>
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd63e20-1f92-45c7-be56-08df499049e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aTMJEXpusL76DKOscdJu0mKqOKkZIrp4aexoIfATXNf4AT+MF5WK38fwGSVUnqU4uDPuu0SVdtq/pW+Et2XjuwauLIcLu7UeETf/PCz2RL4U4j1siGeTlCZTWJuIT4yqEZY//04Dmu0q7RRj6bYR4to+3liFmiHzbHl9GxOGRr9Tr/psS8ItM+7ycxM+AfjLUmrg/aG4r2cBDvczyJZMukjz2q/5zGigB8cEPrGXqjG0W/grbAX4oKgRjCDyueJX/wE7dLsUfTvIx1qSaVVUrNLdCnbOesaoAUQcsBmbXZ6A1hSOaBo5mUFhwJLmsaWRrfbrYYRmrch5ZZB1F0oekZEB5uXyLGKyMC7OcJy/mMIegXcPb3mPKiFAZSwftXOsKdaBwsvPbUAyw31eszU2aZbAO7rOv4i0g0DU6wDtZ7y/gV28cuA+hdXZZIX652gMm9vwKaNJbXZHzdoZdPOb152Sd/l1wlGOJ4ctRRgYpqLvnnmRjPyTbSuqGTC/IJOp74UwegW9yrLmNlBWKg5pCvMTJRG3ywqQ4arKGNQ7GOERy/9boEbqbxp0rW/qa5oYsUnZlaIXAvQzmeQAqfQA1vAu3KOZAqAaTz6BWwMwFikDj38AsYu0Z6JxllQYniJOGWZ/YRN+BcA3/iv6L2xcHMQKdI2cLP3cElVYRpifZ8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rKi4Y6x6e+mRLe9jvsu/bl9XZNdQS+doaiFTkOnuu77L1mSz3OXpf2VFMML?=
 =?us-ascii?Q?LoPzGegONDkf0v03P/UM38+1faLbiqeyxNmmeZkjxmNyMq2S6FzQdiMJh4cq?=
 =?us-ascii?Q?2Dy3TOHzNJzP1RlgB1TDLIYvL4HeKfaHO5nxa4hEEb/KvbJ+yZmK35gSbEP+?=
 =?us-ascii?Q?C+5Xpx3kcplXy0Ilbsovo/pX8F5SWNYjOx+UlGORnqtu3sIKNj/gqRPu8DrC?=
 =?us-ascii?Q?o+TZsDxuabIoH3w+BW4mR0o80zsA/WVXolkR7w+DiSevBLACNmdcHKqo/7cG?=
 =?us-ascii?Q?kCSiuy3+RKF6IuCDsVVweyBiyM7pO4brosA6mS3w4OfCS0QlEuxdL2Zq7N3e?=
 =?us-ascii?Q?LnoR3w1VhSw5/Dz25mRLkvvw3/cAb6aX68Vf34LRiFPK3FKRc+MXxAeHiTCI?=
 =?us-ascii?Q?siBTDcHmYUB47WkaYHIidgbVqvGX9htV/UsR8btPDSji5L/rnN5FVFvxBAcs?=
 =?us-ascii?Q?ZrLo71L39TILCXrgfJn/RCyg7t46KgIX49/ur7Thuhtxr6N/b0mUKuY196B+?=
 =?us-ascii?Q?5xd4M5W9Ygsf+vZRA6xsYshlOGtKtkNdTXuuJgBamUcKRMSFdKMsCC4qmBy4?=
 =?us-ascii?Q?MRCqWYFUT57VYFgvT0vOkSGEx4tCSOiIkj9w8ak3yM+biN/xGXanhWabGVKL?=
 =?us-ascii?Q?KQYFpKap0ehdcj0WVo1s1gDgkAdXWkmb5fM3yZ7Pun169oxoDXZgYtGUPD5M?=
 =?us-ascii?Q?PgLeq8siBkTxyVjSs9QN6HAslAKO1FI3NEp2s08VsHYQLHO2Q2A3NGy7npvB?=
 =?us-ascii?Q?XaIy0rEHIgfQwB2KqU1ct8AZb92yXEjSsZAsYg+6lfnzwkkMo1euPbmKnXoY?=
 =?us-ascii?Q?06l6Vglat2XQjJPddsNl9F3+J/ckk2vnsQhhW0bt2871tlbOM3iq2HVDL10u?=
 =?us-ascii?Q?ghnVJhRDuFMosGnlmfCk/uxQB1m8A1b0x3saNvuKedR5xOd7OKZVs1ps2xjl?=
 =?us-ascii?Q?2bZvpmLaBHt+CPwh5u2s5nyuRkbqZRgVJ4mcCNSLhDsyexnIPoMb7yRs6yXk?=
 =?us-ascii?Q?ibhDHW4OYNr959SvxPIuW8cpQ/2Q+JYzzo+Txfxf/07Yz9x6qnGqb3khgC8H?=
 =?us-ascii?Q?r8abZ2sDSCl17TGRiE+dUtM2ReGdkb/8cM1pGhzQj0HbpgdiVQgavIpJhZkk?=
 =?us-ascii?Q?7z5nf7hIZ5+xKvxgXBxoNkKxjLiMKEuEAAYuck4sHUoKe7affw8WTdoXDSBl?=
 =?us-ascii?Q?wMCcDKMMuAx9c9UtTBP0QquSxvOQV5nfXb+uDN6tTH0pRWDQiij1iVeCw1No?=
 =?us-ascii?Q?YAFcyvK6rTho0HOzHeYF/QhgDoL1y78YGIalVQT+9z8eU/hoh8GLg26HhjSn?=
 =?us-ascii?Q?H7B1MTOp216nOT3dCEPA06+OFxaKukmUbe7F0b9U4h5Srn/Oiev5+0i6poef?=
 =?us-ascii?Q?cc0GO1tZIsajgEIU/xvKCgYavCJUX02zotXj4XpW4T0rBs/qUWGoYN3DL5QV?=
 =?us-ascii?Q?lJ7Ibkz9ndWKv9qcM/kUpvDfbnpR3I0DzyLcBPCe2+dV5bddUld9QujkGVeX?=
 =?us-ascii?Q?KhMDLPI50cxB5LOaVjXidT2UFvzd1iV6Oy9hzLZdKpVCuBW9qR7Im3EBx7VS?=
 =?us-ascii?Q?+WqsNFyhzeENAX954u5mDoJZyi8gCWMvpMp+SwiaJPPKXhtsHGOTEcUH1gEY?=
 =?us-ascii?Q?MFPxq/bH1g5aIbWU1sjLELpbaEG/d5TBCi2KH9uSeeoLya20+NumFByejRJb?=
 =?us-ascii?Q?xLsZyCQ2fdfmPQxydaXxJG1lL++2KK4rP6SXoZtHhbtfatD3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd63e20-1f92-45c7-be56-08df499049e8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 18:33:37.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4iVJHAJgFKEffd7gyj6BB734h9cvnLuL15GWP/kA02DZZtPZ1XlhHZtM3hc/wm22bmfdfgplooki84A7mT+cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072

On Mon, Nov 23, 2026 at 01:13:35PM +0000, netdev-bot+sashiko@kernel.org wrote:
> > @@ -2556,13 +2556,33 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
> >  			goto done;
> >  		}
> >  
> > +		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> > +			&sk->sk_omem_alloc);
> > +		if (psl->sl_count == 1) {
> > +			newpsl = NULL;
> 
> [Severity: Low]
> Is this change in setsockopt behaviour intended? When the last source is
> removed from an MCAST_EXCLUDE filter, this now publishes NULL into
> pmc->sflist. The old code shifted the entries in place and left a non-NULL
> list with sl_count == 0. The MCAST_INCLUDE case with one source becomes
> leavegroup before it gets here.
> 
> The mode check at the top of ip_mc_source() only allows a mode switch
> when sflist is NULL:
> 
> 	if (pmc->sflist) {
> 		if (pmc->sfmode != omode) {
> 			err = -EINVAL;
> 			goto done;
> 		}
> 	} else if (pmc->sfmode != omode) {
> 		/* allow mode switches for empty-set filters */
> 
> Take this sequence: IP_ADD_MEMBERSHIP, IP_BLOCK_SOURCE S,
> IP_UNBLOCK_SOURCE S, then IP_ADD_SOURCE_MEMBERSHIP S2. The last call used
> to fail with -EINVAL. It now succeeds and switches the group to
> MCAST_INCLUDE with S2.
> 
> This matches what ip_mc_msfilter() and ip6_mc_source() already do.
> ip_mc_sf_allow() also treats a NULL MCAST_EXCLUDE list and an empty one
> the same way.
> 
> Since this is a Fixes: tagged data race fix, should the commit message
> mention the change?

No. The Fixes tag will be removed in v3 and there's no need to mention
this. The change is fine and consistent with the IPv6 counterpart,
ip6_mc_source().

> 
> > +		} else {
> > +			newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr,
> > +				psl->sl_count - 1), GFP_KERNEL);
> > +			if (!newpsl) {
> > +				atomic_add(struct_size(psl, sl_addr, psl->sl_max),
> > +					&sk->sk_omem_alloc);
> > +				err = -ENOBUFS;
> > +				goto done;
> > +			}
> 
> [Severity: Low]
> Can removing a source now fail with -ENOBUFS? Before this patch,
> IP_DROP_SOURCE_MEMBERSHIP, IP_UNBLOCK_SOURCE, MCAST_LEAVE_SOURCE_GROUP and
> MCAST_UNBLOCK_SOURCE always succeeded once the source was found.
> 
> The old list's charge is subtracted first, so the optmem check usually
> passes. However, sock_kmalloc() reads optmem_max at call time:
> 
> 	int optmem_max = READ_ONCE(sock_net(sk)->core.sysctl_optmem_max);
> 
> 	if ((unsigned int)size <= optmem_max &&
> 	    atomic_read(&sk->sk_omem_alloc) + size < optmem_max) {
> 
> This allocation can fail in two cases:
> 
>   - optmem_max was lowered below the socket's other option memory use
>   - the GFP_KERNEL allocation fails for a large list
> 
> In either case userspace cannot drop a single source, and an
> MCAST_EXCLUDE block stays in force.
> 
> The error path itself restores the accounting cleanly. The workarounds
> are IP_MSFILTER with zero sources or leaving the group.
> ip6_mc_source() can fail the same way.

Noise.

> 
> > +			newpsl->sl_max = psl->sl_count - 1;
> > +			newpsl->sl_count = psl->sl_count - 1;
> 
> [ ... ]
> 
> > @@ -2572,49 +2592,52 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
> >  		err = -ENOBUFS;
> >  		goto done;
> >  	}
> > -	if (!psl || psl->sl_count == psl->sl_max) {
> > -		struct ip_sf_socklist *newpsl;
> > -		int count = IP_SFBLOCK;
> 
> [ ... ]
> 
> > +	i = psl ? psl->sl_count + 1 : 1;
> > +	count = IP_SFBLOCK;
> > +	if (psl)
> > +		count += psl->sl_max;
> > +	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
> > +		GFP_KERNEL);
> > +	if (!newpsl) {
> > +		err = -ENOBUFS;
> > +		goto done;
> > +	}
> > +	newpsl->sl_max = count;
> > +	newpsl->sl_count = i;
> 
> [Severity: Medium]
> Does sl_max now grow by IP_SFBLOCK on every add? The old code only
> reallocated when sl_count == sl_max, so the spare slots were filled
> before the list grew.
> 
> Now a new list is allocated on every add, but it is still sized as the
> old sl_max plus IP_SFBLOCK. The spare slots are never used:
> 
>   add 1: sl_count = 1, sl_max = 10
>   add 2: sl_count = 2, sl_max = 20
>   add 3: sl_count = 3, sl_max = 30
> 
> After N adds the buffer has room for about 10*N entries instead of N.
> 
> The old list's charge is only removed after the new allocation succeeds:
> 
> 	if (psl) {
> 		/* decrease mem now to avoid the memleak warning */
> 		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> 			&sk->sk_omem_alloc);
> 	}
> 
> So both oversized buffers have to fit under optmem_max in sock_kmalloc()
> at the same time.
> 
> Assume the default optmem_max of 128 KiB and a raised igmp_max_msf. In
> that case IP_ADD_SOURCE_MEMBERSHIP, IP_BLOCK_SOURCE and
> MCAST_JOIN_SOURCE_GROUP start returning -ENOBUFS at about 1600 sources
> per group, compared with about 16000 before. Large lists also become
> high-order allocations.
> 
> With the default igmp_max_msf of 10, sl_max stays at or below 100.
> 
> The delete path in this patch and ip_mc_msfilter() size the new list
> exactly. So does ip6_mc_source() in net/ipv6/mcast.c:
> 
> 	i = psl ? psl->sl_count + 1 : 1;
> 	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, i),
> 			      GFP_KERNEL);
> 	...
> 	newpsl->sl_max = i;
> 	newpsl->sl_count = i;
> 
> Should the IPv4 add path use struct_size(newpsl, sl_addr, i) and
> sl_max = i as well?

Already mentioned in my reply.
