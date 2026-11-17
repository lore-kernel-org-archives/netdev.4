Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937756;
	b=ayeVix2j4eCAYsXmS+qG/xnYPPeOGia/7wFpwDXBkLU/MxLOfUNLyfviPXrnykxB24Je
	 PbwEH2uJB3pTEz+lHZqYZKiELCvWvFHBOyl+Po13hPK2tt1LLuKypENnAlCkO89R0ebE6
	 valNNH5n/Q+Yg/rGJA5oYJTpH0WDfGpBEk6KvD9lNEAJU6SwV8QxydGq2otUzq9bR348O
	 3bajQIvcWxmPql3i7sDfUa4PdIPS7L8gTOqeQqwUOX/5Fqe5eWALhd0WA5gqS/Uc4+6kH
	 dpBaWshQPqOpdDAigRon3RUiAKZ+AhRYh2dijZk3ZdoXPDrvYvc0OTZP19BvSQWsvbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937756;
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
	bh=yFql7xVRXVY5VFRAUnlwdjlFrMmJkn+QmME14Vkjq60=;
	b=pUukeSTGQDRYIcatuwB9vraDK3xkEZ2Lq++502U/AJlwuF5JFd3EpkevnM6YkzrC3Y6b
	 8O/s7UiZS1A5a/t9mVwBLemHDSZN5IQt17B3Em5bR5mWsPBPje6j/x7FkKCZJ3rGlpakz
	 g2wSJQp+Qg2oa7AiJIpo7vl76b31Mx/EhFeNtvkZevGD9LRR8JI3lL3icjXp3AcawjLwr
	 ANgL6+FhhYLwkVzgRWx/4b6Iv3MO7EVdwzPFKkowq8ZiVkOdRIacx1fHAjUZOFaHMC0Fr
	 mVmckWPMZXrRk2GMMBKnCQpRKJgKIqY6jOhPPka5BPmtzjN11qk9MWzqRBkzRjEH/eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KUiVftwt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD7606A332;
	Tue, 17 Nov 2026 17:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACD7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KUiVftwt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5rn6LBmNhehx4WjozUrmZqy7C+LWeDieFhJuFk18uhLl/B8bUIrrCU9SZnBw9M0sNO5tkmLEj34Sy2mZwmeUGCHISpGr50Z4i5GgSHgEqBtxP39lRJszMz+Wya8GRRdugyZG73ds1MUriIOmW4ulQewxD+fwmbZPtlP6CATcnWv+B92JGyoUV5f0fOSmuNlDtlfMVbi2VI9banPYFs0dDBuy+blpZn7lpV17PXRjZFsbqG0UonDwnfaBJvU2LMhfm+qnH3BPRaI++wmw72VG8ScejlUqcgDfqL6iyRCzWY7HkJCHd4qvfpl4klHxpNlBhakcnxvXU5FfvfqSpLFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFql7xVRXVY5VFRAUnlwdjlFrMmJkn+QmME14Vkjq60=;
 b=nw4R/8X9WSt27DwYeIHBRnis3QjHm85Ah+6HThspOy5znclF910qlpnlaOTDmjahsfJxE0vLCQVQQTsic64s3z6tGYNJmfH70nx2G8YEnIYIx4sRp/QF15byRmj3lCFt2ntx74XC4UtuhzjFScVkEs9QtddGKeOBGXOrNa9BOnO6UTe+/e7Pj4ZZWnf2gUwu0r0OrCGr7+zHT3mIkcmo0lLkhuV2Jav1p69Y8sGE1M0Kw2WMyojmeSpgz+o8EjSME73rlnQTduGprkqzYxfgKhJJa2CSnZbWx0XqrxpLb/drdrKXf87ve3DItMW+GrKet/HwHFUkboVkc2lNWzpriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFql7xVRXVY5VFRAUnlwdjlFrMmJkn+QmME14Vkjq60=;
 b=KUiVftwtP8tzY6Sddd19EsjJC7inztxUjRN/FzvOPPLswqRcqHXpluL1A3dtTBYTbIpITOxrRTQd0iKwJ619DD98WzpBY1mq67cTNdpyl+kff8uy79XXaFm78I7n5AeyYNTbyK5JJjC+/tniRNmgfIDLzTJwEmUFGshGroQ4WvRTk3MUt00tgKSea/kLQty/hD/96bzYqClQjDXuPXG30iXcTMwKEG+xYCxDW+LqrlYkoMjSCVn67v0VQdNMWwUCo4xGFAHHw+vAgYwHzFB7Snxd4rOACVvPJ33qjVlckGsOALya95xvPAeRkdEu95ptM8U0jmEQ38g48Mcj1HgQlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:49:10 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 17:49:10 +0000
Date: Tue, 17 Nov 2026 19:48:59 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] neighbour: do not update an existing proxy entry on
 SIOCSARP
Message-ID: <20261117174859.GA943423@shredder>
References: <20261113193355.3820232-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113193355.3820232-1-hengyul@cs.unc.edu>
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e95ca1-616c-4743-de78-08df44d3155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	g3zeKt4RRru8hx9G+O9KWrZZtJBdu97Sg93XzJrM0ndIEhFxRXvhZYmPzxrll6w3mSiA4F4E5RqNkZmQDCpF0GbuChaYXxhUxdb0+6lhgF8GLE/s8rCecy2J61NhpCziq5CLOY0sBjeIRyMD3pt8Le6uaAPd46unvM8OQQD/SCb8dLGRQqr0kMsdaR466I2nlKsGDuWz8v8ToAuuatZwi//ItqF0jK7exh8oeJTrVJ8nXrvXnErrzBH7kKtm6qebYIyzhMQlbbtY2UGIWGzUbJmrrdA4tVE7XcN2Osd3zYtHJm70/SjpDC/zNjgdEJNf0WadfLW04AgaluTomgzrTcYSMLGVczcDSoKgovQluyJuktEbgFBjlY+haIi+LPPISvZfKJF5gZkKJ0cHxVr1wUOplItBiHxISblVaBFCdaBGJswAEyoQlYCmgf5SsXE58HdJp7l8ldNY+W7R+Ss6ptL7SiybxLzA1Xg3QFj4JfdY15/c+8PuQ0WtULRZbjx0VmVuEde725m+WjlBcUuvJYtrMxFGE7UQnoF0/D3AfrXXsQ5+P5EQjblcvLZBqkH5S/vB2CviqSRXyV3sCoiIh8C6xa7Zt4FCN3fVrs4JpvFxEvf4tv96U5cUAT2wBX0Uzav2o+qUuIlS3AjW3o+299CfIg8n2vZH8Q134IeHeCk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wDZ9ZkYs2wdTJnIq/5LvraLnIpgVbiGRSFLoCNohmfGRdfBdcf2uQaexYBd?=
 =?us-ascii?Q?3n3RcBT367+BNYWa+yMNjlspEn42V0GppXbngyNnDRkgN3ioDigivcy4UdY+?=
 =?us-ascii?Q?2K+S4B4LMOsejMSEgQMshx50oCYA36EFCw+RyK+yaCeS4wEscm6HqCzbXmn9?=
 =?us-ascii?Q?syOuqlH6Ld4tosXpGy3qG+7FgUWRriga5OSSbFos4vhOE6VOv5ncJT+2GTtE?=
 =?us-ascii?Q?P/IQQyIHvNG4xaEfvB5WWNhrXjWJTYFZu1jr9L+Jyl5s5Oz4mBrp6VGl8L5+?=
 =?us-ascii?Q?K7YbNWi9Z/3HMIzf1O+l6lcMJEqQ70UB4iyv+LGMA4KfpUajnPEXInmUt7ff?=
 =?us-ascii?Q?gSHoFiySEfXiVC1AzuUQ3agG8RgMQRV311SIAwQU5cZj8uFnX+jRXqQucICJ?=
 =?us-ascii?Q?SIF93m4ANFxhH+M6JtT4kIpVIfk1RVaGZ8dpJKHvjP/JwnQPxUWmWCQlxJBB?=
 =?us-ascii?Q?E7nApDNYmYSP6zVgBY/yrfyJ16IE648IbM5E5PwLfheWuiNpob/d4AxAVcqi?=
 =?us-ascii?Q?xzFcvICOgplqFGzfxpCExNs1CJ1TDxcZun1RulrOFsPLOYDnxHcJZJJHCXNw?=
 =?us-ascii?Q?ug9jhecwyMJBkRCrgbrxQ7FI5WrGVvpAmKK4vmqrJ170bJKHHiIZxi7WE+WX?=
 =?us-ascii?Q?8gnRvjbfc5a3cv1GYloT2P3zY95yBuwzbjYk93nViIEbybZbvC71+kXoBdVc?=
 =?us-ascii?Q?g5jDF1jbFeAGqnWOkdKc3BWhTu1mwY5gL3Nnk67ySovCQ3W9q70aI9g4d71L?=
 =?us-ascii?Q?vcaNLs77Uaakhg8wXC8B0jRrb/N+U6nyGE+DfJKx8DFHYpkg6rdnqjfx258d?=
 =?us-ascii?Q?eEYiBRamHkgEMORjUYhrwZVRGzctB65tfuemFWT+oEkGSzXEr+byHLbz00pI?=
 =?us-ascii?Q?BtsUYo3ehKMf6tOX8Eh3Mtlh/lNY5FmxJVAFhdFS9mpZQtYDN+DXtwkNGy7K?=
 =?us-ascii?Q?v0THY/kw1KtYpFNPBF30i7rzSbv7iuHFD1HrtdAadwEF23iQ28DhooZ9qo4T?=
 =?us-ascii?Q?/E2azeFsGQ00lVPMkC8jVYnNVhL5dxQ1UJD5Btpl06oRzZILivpLGdcGfmm0?=
 =?us-ascii?Q?BmrA3tuqrf6w9W2BpxiRKaXCWF0RXzz+Pl84NGSsiqbt5SmjDxc4jrlGAH2m?=
 =?us-ascii?Q?c0odICQMV8dcRrn/SNwwSNiUKNPC69V6hq1jFRn4gr+Zwhtt8kTj1FQjQuGV?=
 =?us-ascii?Q?rD/e+s/S/Vc1zHs6+tYzuBFcNGp1rYBoODX3tjQ+il4vEPRuPaH8bl5iL1bf?=
 =?us-ascii?Q?1LrTVGaPLfyF9hW+/PX6yrWxvrW737t939DQn9kpY05KOFJ9oIzUA+uyc5g8?=
 =?us-ascii?Q?swY6i4rgQE+YJoVPsXXf9frtxORPS/3dVnuN6w6JmAC25Du6eihJIPdBOxFa?=
 =?us-ascii?Q?WuNst7an0au+6n18CbdlBrV4EbnZrG5YwQ4hTVQjxv4DohpbDIWrGN4RT58U?=
 =?us-ascii?Q?I+BebEeGgt3vPQm7lFRVsRuk8dusn3emYe80nympFE7Mj92Ke3ztNxzx1WHn?=
 =?us-ascii?Q?e2aBLgxgDMkBQE+xytoZNIWSrVI/jli61bdX4iDdbrQMpsjRGr8sHoxKj9ZW?=
 =?us-ascii?Q?xpdUDT9uGTHN3l9SLnH1KvoA8jK7JY3o+vDmyC28vuwUW3Nb7cmjfaDw9K4u?=
 =?us-ascii?Q?WcnDnpM9LZjkxhSmIgySUFMieJDd6SLBRHL0rVHwKkrzDxI7A7dhxn2fBS+T?=
 =?us-ascii?Q?C51uJR6Jxm7pAI/wdDbRD9oDTws97y5kmLhlFKHZJ2LVguG4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e95ca1-616c-4743-de78-08df44d3155a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:49:09.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmKhYsj9XtFRzs3WNxO9ASgsSVWIXrUEL1Uej06E7HgDHqZ0G7L/cn+latR2wb8IJy16wfZnWUdXZMGr9AUlew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064

On Fri, Nov 13, 2026 at 02:33:55PM -0500, Hengyu Liang wrote:
> Commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create().") moved the update of flags, protocol and permanent
> from neigh_add() into pneigh_create().
> 
> However, arp_req_set_public() also calls pneigh_create(), with all
> three set to zero. As of now, SIOCSARP on an address that already has a
> proxy entry clears the flags of the entry and makes it non-permanent.
> The entry is then removed when the carrier goes down, and the host no
> longer answers ARP requests for the address.
> 
> A similar issue happened before with the protocol. It was fixed by
> commit cbada1048847 ("neighbour: restore protocol != 0 check in pneigh
> update"). Perhaps flags and permanent need a fix as well.
> 
> The issue can be reproduced with:
> 
>     ip link add d0 type veth peer name d1
>     ip link set d0 up
>     ip link set d1 up
>     ip neigh add proxy 10.9.9.9 dev d0
>     arp -i d0 -Ds 10.9.9.9 d0 pub
>     ip link set d1 down
>     sleep 1
>     ip neigh show proxy
> 
> Before commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create()."), the result is:
> 
>     10.9.9.9 dev d0 proxy
> 
> After that commit, the result is empty.
> 
> This patch will add an update argument to pneigh_create(). Only
> neigh_add() sets it, so SIOCSARP leaves an existing entry alone again.

For future submissions:

Use imperative mood:

https://docs.kernel.org/next/process/submitting-patches.html#describe-your-changes

And include the necessary info in the commit message:

https://docs.kernel.org/next/process/maintainer-netdev.html#bug-fixes

> 
> Fixes: dc2a27e524ac ("neighbour: Update pneigh_entry in pneigh_create().")
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
