Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011465;
	b=1D5ZXhpEiBZ1AKxjWXfMPIuEi33U/RYup37gPvAWld9PaPFVF3pvVYUfjLYnt3FgW0E/
	 Wk5BfJIOq9HebteurEfTeYoxEHeHM/uok3lDxpD3h7RAWP6AYybNAdz1FejTyar6U/cPO
	 lZgN72UqsQbIcIMJmybS6QNNtWGDvGhkVr6dEX0HBozj0St4P8eut5XZlkxiGOZCO9XcZ
	 2kBAig8izhOv+gKy0PWk8m3gTvK5bwkWVZ/iaVtI2NYqSBPWgY3QMhx3NIBALuM4NufGA
	 2IyOX3ymREYXyvhKqwMMJsr9i5eJzR+KnA0l8gYbQOSqByQGhu/6b++Rdn6iH1+uUyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011465;
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
	bh=5JnEp+7LnWA7L/A6Y7BFwj0nwfidEuWRaovexruHzMQ=;
	b=GXmGF4/+S7LNGSu8pN9HUfSaahqchLU2uDrnQSIjBwLpsHgBu2PuvI6Np19wnYWbgIDj
	 eYBFcJawWWWKXYTveslu2E7RiefMlddZ3IjJ+IQkm4y2X6IVOMXj4l7Us9+GMw2WRW9Yc
	 BDkHos5mhPgtCOmagWP/QD971g04kePzPCW8JqDAOh8i2ZPM1+oRIcITJUtM9E3yr/TnD
	 gNwwzb42WVtO25OMlAFF79EsXDPA1AyYiVhrefcrxejVDELfB7UZ3lqAHQKNGX9BktymS
	 bo6d9nCbR3ZXy5XdUDgz2u3fsd0QfMO1B/xl1TNGTaBD6+ryyQ0TC3Gq4SpI5xRKcyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XeTJ27n6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170FB60A260D
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170FB60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XeTJ27n6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7VpAphawcRlYZpG1Hz+RkLm4+I+0Ss/jtU/H0G2xhRCAG6kBkMZOSgj+pvISZPMQ24VmAmTsn7TksV2sILj18mNddb/tYJ9aeAVDiS203zF7u6EmCZp5TzMUNlnjNKV3BavpFxLwv/cgekdbmRnJI9Y3bsCHdOyaxUZlVlSeHfJFeX2RmmZEfRdfZy0uxOnKT7dAdJqF+52hZWLZiT1AJE7Y/RbfH3sW5I8FZoyNk3PFTLmY1tIEvIrCizKrDyOYiLhtxI9JZYFxSr0KNZrhqkmmn8F2oHAYzQ6ynme8JlzXH5yNRvHIIZ9VJ2auY0Ib6BUOzMNcRJxv17pwoMG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JnEp+7LnWA7L/A6Y7BFwj0nwfidEuWRaovexruHzMQ=;
 b=I+FuVITMSBISMr09beJI509dIA/ZJ3THBDcwUl8fNVU9NLEAFbgLMJfnfnfDUjgDW72dPPFdEcAqAO2xZaKatvaladWda9nxC6g7Ssx44kGFeNH7aBbaUIIgOefNycjuZCvXV4CFCrwyRABmnCm+pUPPVhWwZxaD8MwynMNzUWQU8h+uEgBP2iedJyCTmhoEEt6Xs1qYavkgufxK5E+9iOX0hRM6Mic4CMUgl8MvLrsOthj3cj6XT80QTOJ4DyLTZB4UeQJcov7Pdo17YHHVwr/mRjsZ7u3yIiOKsMxDfHK5ZWHHsv3r0z5EgOQMmc6OSyYT9l5fc5yxTikhk5Oi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JnEp+7LnWA7L/A6Y7BFwj0nwfidEuWRaovexruHzMQ=;
 b=XeTJ27n6/tbkxNaQgk8L2PjlkfllXIXaeXalVgA9KwMwcmoZZG1npuD5dl976io4d0FJTNZZzFLLqgZWiCmOE7P76+4ved+RaeIof+uIhM/gynwY2FinMUtCUvikdy9semHRhAXBWYQJxcYq7aNWvkvcg0UlEUzz5SYB2sCa0iY7V4KHRFH6bP/Z8aMDzYr2R5B0zOMeEow1AuFhK1vrqb+v8Ui81jWS+bwx+S5k6bMPLelWre0s96qcYQnV7bA7UqCc3k7x6+nW7DK2WQg4lDqnLhVu92ewicPrvP9zal/fBT/aFtmgL3YJuHOJhUZll8UBeaaksmd4H2XqzH6G9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 14:17:41 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:17:41 +0000
Date: Wed, 18 Nov 2026 16:17:32 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Chengfeng Ye <nicoyip.dev@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net v3] fou: reserve headroom before pushing the encap
 header
Message-ID: <20261118141732.GA1261066@shredder>
References: <20261116113845.166280-1-theodorlarionov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116113845.166280-1-theodorlarionov@gmail.com>
X-ClientProxiedBy: TL2P290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::10) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8db3d4-4ce6-43d9-3093-08df457eb4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261026140227099003|56012099006|11063799006|261022075727099003|261026121527099003|261021135927099003|261022105027099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rXN16yIn+qHJhWeLJW16iRc56h4vprwsExqCwG5aAG5ElXDynCri+fACyIlU+6XRe07gp4+yh2scs7SWutx27WzSO89vihv+rydGQdEkP+SK3ADMohSFVUlWcGKH0dLZ9n613Hu197Uy1+buWsSYD5SRY8eSzIyFVCs6xc6T2b/UOxlz9x0EMLb0boX6NOblLrHgA8dqf62OwXFW41YX9h00X2VEbQrsjGURYnO4WnwhHv2TF8gDOBGJ0ZQR6wAvx/FnZHJLlRLjreQJASuAkUANxeiKjnfxrsGTSgDWpddSBIb+50Ng/xWHeNRhV+r2dUZInlp43rQWXtdXcrx1Z9bGESw8BL8ItrlsL8ArkCO4YCNmCtYm5sH9fgqm7hUAZEACsF96hhUO8NHZGDa2py49p+MZ3DOz/7Fy5H9OvrbuxDif2pA4L0gJ0jrj6ZM6APyZWzXU09vJPfLo0iRtJegi5fw0omqRFBv73y98j3a2dUj7TtJMkAAuNiWeVbUPWYx4pRfezhgR8MUBa8osSa7RwVOYcsoPVXijaYDzNDD7BnBoGXM980a6GNGnslu+iGP2/ccLrf0BrRATAWeGadSI00b4sayrE8AiEse3+raDWsMHO+kW3YWtthRN98Z7e6SPZL3/ZWxYAloXSMdz8WYak5RBuDjUefSAFWPP7uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261021135927099003)(261022105027099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aDAvfNv5rP6dEdVbIp+HlkCMuvdMdjUDMsDMlEM2iaOwF+fYlpa38Pg8X2yW?=
 =?us-ascii?Q?ZAbgTst4P2Sm8+Cc79IdWPH4xZEv7vdHQfcUzANnTqNqqMbjLsycUdRn7n1s?=
 =?us-ascii?Q?qq6nnO/0xe2qkEDafczJ9ICJZb0bt4YmwctGzI7OiatjwBkdEJ/ri0hohqAf?=
 =?us-ascii?Q?zEFldf+e7B3ZPETadsN7cUYg/6pAYdUnlajBQjMyO9ryUdio4wJZtNZwH/gf?=
 =?us-ascii?Q?bRe8E/Fr8XaVIgWewVXTJy9ewazARkZq/+Eax3i/N89GzqTcpJH7lCVmB1pt?=
 =?us-ascii?Q?5ID2xfnuEjX2M26PLSytSX55LdPD8AyuvoQsBH7Gh2wADLjPaaFVOfgD8RNo?=
 =?us-ascii?Q?0gowz1Vyv8wVwRUpMDr5A8hlSYcj2YXdH63bU/tcSoywGzdwweyhQ3xuzhaW?=
 =?us-ascii?Q?iD7gv93tu9vX2NSr3kp/zGpMhu5d2bR5Ww5SDoHiy41iscEWx3M0U93729Yo?=
 =?us-ascii?Q?erp1/AnJarPDgAlaMWT+91r/UWqQxtmDQloOXdLEwOO/QKYW6d8UvXQ5qf1Y?=
 =?us-ascii?Q?X3ZWo+n/kpARzi8OdMjehHGGRb+gK/9N+Ad9HphfCoo8edbQQzfm44yF8csG?=
 =?us-ascii?Q?XVuKK6fQ++OheV48L+akekCPI6YAuufJGZM1Mn8+l46DiLOJ5LXQRkO4uPDY?=
 =?us-ascii?Q?wbds/5KFf4my4U8F/AJU/S6F4w/8M27tyqAf3Pn7lXPs5pc9kNov1ffTOsmV?=
 =?us-ascii?Q?Miju6Pn+q9yTFX/LhmIYYKrfNWC4pN+ZTbTK0v0X+VoXsaKKu7ncV1p/KWCV?=
 =?us-ascii?Q?+dZWgp/EjsI5G3FV0zJg88HdsvpQTqVe0FNg/IRz37gSW3p4HA9doILLbYTc?=
 =?us-ascii?Q?dkc/cDY9FsTChnh/ey2h7HO1yhmJKwOMC6r4EhgFX5cv+AsUM9VVL6vSv3kC?=
 =?us-ascii?Q?0hZkeyLk/J7HEjtcK0kSl1wq/JZp5mXAekwHyQCfmih1XGe/ZkULu7gPlxTA?=
 =?us-ascii?Q?xOYld+Pyrk0nAxx6zdzRoUaMTGKjgg4xVG2BEytKvNCIeHPbXP3OM56Y9wNO?=
 =?us-ascii?Q?7nPSuW1/ji48YuEVMom3zanZjJEmk44B9L9YaNBJ04S3pRlxBaCSeQlozqvh?=
 =?us-ascii?Q?4sqx47jDfylz0g7jLw/JsqqegGZfZzjG/08qdxrsvE92YxoiNv5k9XuSV2tK?=
 =?us-ascii?Q?CKtfNwscGV/xSIwW0AMCkKqDH6AVTMFIhAjrvK016eubuT3K/iDEMdaernyu?=
 =?us-ascii?Q?vBoLo+ZwfaGPOUTyaggB3VqKR0y6upMm9ojcAfJO3sZwOlKBWWTaWAqcTasZ?=
 =?us-ascii?Q?uGBqUkw2ArCWbEzwEtsLSACtLG+SYY3GqLYRlqIMBu7KUC8vZFVY3hjmvNlD?=
 =?us-ascii?Q?OUJ0lqQtKBl2s6BcKL9tzGzOZHqGGeeNA1QNmpQb3m52XjUueQiQBHvsJS6r?=
 =?us-ascii?Q?eD4ZZicLXedgplPE+od7Qj7AOVcAlzaWy2Ep8diQAU91y7adJndkRDERn75q?=
 =?us-ascii?Q?ieUo3SwY5SOcVaXEtWVeq1TiX2484SR1BaTK0NmQjXnacXdtJBU2sBCtsbEN?=
 =?us-ascii?Q?DXOYpk+Lxl3cj/+uKc72NlUBpPyVM5+LOaIIG3Zpf1TQliNhv8UpqTAaqmWt?=
 =?us-ascii?Q?ToXRmTevURbRJAsXD6sOOfN2BqolTn4UeEUuFFVwOQQseypoMiV6MxhrF+oS?=
 =?us-ascii?Q?gpiixnKmI6jV5T7I6KrPm7T73JVpmJK+9XnJi78SGwzcJ9Q42IXFsmWJrTOD?=
 =?us-ascii?Q?r0H1HxezaRlhm5g+ZV+Q9ySGlxoFxFJUtc7qRVyJXojNif8WW/8889vNs2T4?=
 =?us-ascii?Q?WOAB8esEug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8db3d4-4ce6-43d9-3093-08df457eb4c2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:17:41.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enigOfRCABgZy1E6f+KobsUR5nNLe6Ya6/8d6z6sEH05MM0cg8sA4B2Eijph0AW9mcGL/t9OgNReGzQ7LxnwuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

On Mon, Nov 16, 2026 at 02:38:45PM +0300, Theodor Arsenij Larionov Trichkine wrote:
> ip_tunnel_xmit() and ip_md_tunnel_xmit() push the encap header before
> reserving headroom. A packet redirected into the tunnel (tc mirred, nft
> fwd/dup) keeps the headroom of its original device, so fou_build_udp()
> panics:
> 
>   kernel BUG at net/core/skbuff.c:214!
>   Call Trace:
>    skb_push+0xcc/0xf0
>    fou_build_udp+0x2f/0x380
>    gue_build_header+0xfa/0x150
>    ip_tunnel_xmit+0x87f/0x21c0
> 
> With a mirred mirror, the push overwrites the original packet instead.
> Reachable with CAP_NET_ADMIN in a user namespace.
> 
> Reserve the headroom in fou_build_header() and gue_build_header(); GUE
> sizes and builds the header from one copy of the encap fields. The skb
> head may move, so reload inner_iph after ip_tunnel_encap() and read
> tnl_params, which points into the head for GRE with header_ops, before
> the call. sit's ipip6_tunnel_xmit() holds no head pointer across it.
> 
> Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp encapsulation")
> Fixes: ac931d4cdec3 ("ipip,ip_tunnel,sit: Add FOU support for externally controlled ipip devices")
> Reported-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> Closes: https://lore.kernel.org/netdev/20260801060115.3538849-1-nicoyip.dev@gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
