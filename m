Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686706;
	b=31kLHDg6m6eLSOhWxT1DoKWHBOY2ZN40dOeeyHmvvzAuagthxnfN5MInl5sX5Dyz+76+
	 cW2kn7E5PYiSwgVidVqlHbjCfKBAw1JKkKFSoV2aUiazoBFgcNywYdievv8KtymMofVnB
	 FGbz+4a7OreRVvZ89zoE/rM5S0bxC9gQjKWM7rr90/56/xSGiASztz/7/8WX5yjK3FI9S
	 RRPVw2h/Qf6gujBYhTbk9a2MjAZQ+qur47A85AY6VGNvW6FZjrTPVD+FbKMXneLz52JJ8
	 f1NUzCEQ5HNFTON+/KJsuSy3hE9RF+mvu8uyOAejP4LjKL4XyISYeCabndA3ly8n9Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686706;
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
	bh=S94iykths7GMFkPmiiPYU8TD7TaHEhlr/lHUuwkeYa0=;
	b=e/GVUcBFx3P3Pd18e7qEZY0R2O/8A3YhRLNfp/BGp387hVP+ApIR/oKIpPXIW6qOI2ew
	 rTRNofdjRi3oMgnWyo35gHhAqB7doI9rSjwxbFBstccCb9uPMWmCKXqzuhV+2kuJn1TsF
	 HXslvxmabkazCWxq4HotoeQJRSVP0Ur6FZCdx0aZ3Cp4sVC/8KLsmEiykjc1V6vMxzoFK
	 CzufU3MJL+mEUZ7U/j1bZk+2VrLPY+yDcRHwrag0DxFQKTDDpocYnFnYNkNYM/3HyI2KU
	 o7tFhCULeIMaWmms/Gt03O3CidD44eC0DxsujtORLbkYgKvSRMB8ZB5Vk5OqMggb+9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=my8jshKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.31
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F6606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=my8jshKs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVmseF50pwVVlmgnzYEp5uBQo8T6po8kE4wmDfCWcidWqsYdmBycgEierqzTOIY04ptWmI5jj8I/yjE9Xf+PhaR7ju6RBu0J8s6N+JAGQwoafxtaY4pxCX0y9ulz/otpOlBkk7Oby3UVxmYCMioyatilbKL6XkbndPui9JU9HIaiuDtSUnYQ9FFsLGty1GZ4k7/QCAGs0hXARV0hxjcLsOPDU292bUkOKAkSBZcu8b9vMCVRHrdxxkSW48i1Xar4usl6F+W4ZAOpWVRQB189L33yb3Im0XKNJZ9kQLcUsy3ynDSA35vYju0wrCnmMXnntb+S/7MZ4VSQRUohNxgqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S94iykths7GMFkPmiiPYU8TD7TaHEhlr/lHUuwkeYa0=;
 b=oou+tt8m+HCn0o67w0/jBiUpFsTtFlFZPcLiMO06kh93ppKs5bPaURdUMYNrl6fhd+K4D9/WBjZvSVI44Qc8mNGui8a6EfrShK1mVxLby0WBEsCidh2HedwRFrUcjnDcH8mbW/v5J/Ud8Aa27riqfeJScFMaeKX8fDm1SFdgEQshBBJAgRT7ywFqxS60xrK10jY05cn6GDMZ7EQiv/phSE8DaogNES/L8EQBaZbuaojfgCVWerq99oG4mQ+talxmWP8dbCjfWR3cdaa18jETJsuMFlcI48Kajcsswl19+4qcBGuJctUWbbjlSsYYO15YLjrICsvvY4yi1mqwakoiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S94iykths7GMFkPmiiPYU8TD7TaHEhlr/lHUuwkeYa0=;
 b=my8jshKsHS0vSQbqeLANa+IW/71sqTbQBppkYmMT7iIjmN5LIYwLP0HsBlAcmiS3/1g7tBIgEpUpjln90Ge+uTJ2pBeRyBaf6ldmkcWSCOFSPrwSOYNpXSBvWarcVqQnScHeveAZFTzs2iAtIneEkaq8ViN490YZEXjPUqmtY+2AFDOSbxZHy6krdXlOPjC4i+WmOPnYRSe/oGVDMmDm3wdu6f8I41cVapTnWIf8NojWdcERK4S+sHANx2NA1cFTTaToluLWGVt2ve+GCvj1C6F72ndcSwimMn961dOr2Cw6QKwdnrFmxrrj00A4ZBr3wEz+bedVO7Wkg4bGTcsg4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 09:51:38 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:51:38 +0000
Date: Thu, 26 Nov 2026 11:51:28 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>, Thomas Haller <thaller@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: keep the prefix route of an address with an
 infinite lifetime
Message-ID: <20261126095128.GA629435@shredder>
References: <179552079832.1290967.7922979459179290523@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179552079832.1290967.7922979459179290523@gmail.com>
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5cb61e-8a62-4450-49c0-08df4ba2dd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261021123027099003|10067099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	4a+fWPeJ2fylCVbfY3/PujOK3L8iPiY01pQk8lM/Q6dii5urk3bBNgreHDVWO/Sm/tBs/YQuwTIUv1nl4q2JGR+m4nucOubP8zlfzBBpZDuhXKZwes5oEqf3yREFdXU3a5cWJicFgTHohb2i1RuuKJVoP10zzqMpenpwy0QqAzVc1SY+/iMZmgySMA14DedkgbH81IeUi7WOEuB0RrqSltSghG1N0st5egfkaigJ45ebi9cIITFvBEZfsxwrr6On7kTp5xGjOxu4mFgdkjPR/QVrP76p5qJXWSSXng4tSv9nfD8yP17Dx1m37z6K9Wp3lsTyif70sKTwaZ0z79qGwtjKm3BfJAWCV1huZrWisg+27+PzTVPNrpbz9pC3Q1lI23PT5IQJCJhXua60AjIgp18ZiMY+8AJmVeZrZJTDoyLl5Ui+Boumgpjis448t9qLoTSiUnlexRrGwRyUC2rUyZxktEX3CYtqlIAU+LvMAoHpNG+ufLuUsvFyml/NbFlaQsQoULDC+q7ubSvdCZyiQvsUxdAKXd6grdNqrz0hQCLqLqlHokV49h1iPDg7Snc/IDNbmntASxi+TwQn4h+aL/tpE6Hv1448O1Tu+bWzdmdrttwH1phxcGQhhe24UC3ocxZChBhk6AolErlOpjHF3kYGZL7BHoNyhgb4cmasjn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+H/1UHxtZ3tRs0x7aXJ8wzYi9Uwh3T6kG4hqMWDV88cFjmBjxkMj/0xrKaE?=
 =?us-ascii?Q?VE7xOpYiUlBgNJrdcMsBI3/7JhbDKPo4PjbU0P2u3fnTeM0clY4CmkIExatT?=
 =?us-ascii?Q?YR4YKPMNRj9iPfJdsWVQsRZ1OiX4qtwUPQMsP4HFfDxV2un5/KZ3cLKNFEIT?=
 =?us-ascii?Q?JNUvl9wJAkZd3s+iBEfxXewbMtSZ1tcAl2uFwUjDiGBEYtKZpT2/ubAyxOWh?=
 =?us-ascii?Q?PTeZsySAj0Fa9s+R1zm38cTosaZU4gehJ9t0j8QohobFnurY7vFCLV2O59DP?=
 =?us-ascii?Q?HPQQlnv3L/kCEfIIHr8l3bg+7dE+TfgJM5eXXRrW32/mdTcU5YpFKCGyrsCL?=
 =?us-ascii?Q?o6kmimZ9IivtA+brV7xUh6K9Z2FybeXA3oT0n4StNkhGFOsi7lrR7GDaAcGC?=
 =?us-ascii?Q?EEwVMNDWH2NXkFj8ILu5+qyHXFJ4sMNxqFlDGANoJbZyzqQHYMvYfYQIIheD?=
 =?us-ascii?Q?uzAnBeD8zZJOzhs8+NBJ2E52DTUtIVrCpvBOcXk9jM+tbOKrJCaqe4EssocV?=
 =?us-ascii?Q?5kudstQZOHzA/XgD9SZMzZd23kF9MgKUEe3aMFJ58saNGyfgfx3661evoMQ1?=
 =?us-ascii?Q?uJvzTgJ3+5TZzxheGw7Yy6kh1o5PUD0UM9i7dv/FDq52FUv5mDWYfw4Tzdcr?=
 =?us-ascii?Q?kC4lsO7U6fvGRzf23fS5OLOZvayxcIZ3ejtzYxmY+GZ7i6r/J3bmNs8bBlZ+?=
 =?us-ascii?Q?jltWIrkoj+ZwjbnL6LBPueV5Z2f7buxruI2bTMHXkD8x1USZzE4Pc5n8Uaui?=
 =?us-ascii?Q?rBoghPJ22l9XCVpdhyC8drT9Kf4n0IMu/xg6coOUjk0qmCa1ltw2cT0lnGvH?=
 =?us-ascii?Q?SLCn0kw/dR+YvhhItiMbgbidk9mojI0SD8wPgDEOvPiTjZZD27gAeQxE3a3B?=
 =?us-ascii?Q?iBHBGtYS4c5ya2ZqRfFe6E2+XnZBAROSpeDGYx+WDZBLt6S4N0UEkJJV9jd5?=
 =?us-ascii?Q?BelhnMt60tRGV5k5EeDfpu856w8/RZkPT2j9Aw9OaJhKcWFxSVWjkLxhDuyQ?=
 =?us-ascii?Q?Opig/iVyqYKRYiJYe4jdLAiDvkow6f7CsjL4ko1Zmxusm6OPkuRDO2CIV/ND?=
 =?us-ascii?Q?JwygtQ+cp3zhbgxgPwOYHFRSRb9CJx+O75mivz+ZhoGgzJUQeQMC4YQ1BEep?=
 =?us-ascii?Q?a2XGxYBzqTjus+zy0IIMdjJs1u9qpMYV9ccsAh7xjnKpgRrepxzguCx+kEie?=
 =?us-ascii?Q?npyhnk0Igr3xbpI5vsPIV13iICYiLVKI/Z5z/Ai8LHl75Uc5mka8lWKa63pD?=
 =?us-ascii?Q?F50fz0QdZCHK2l0e4T6mIMkkNKFPPfAAb+5k41LZZoVfmlb+QAss8WwVZs3A?=
 =?us-ascii?Q?9xw37Gj4jLiFRE/obM4dOGkiKRm2K5iS1uJdfUb4ghSuGPRUqFE7EJxHFUlY?=
 =?us-ascii?Q?yzsPqK7I04GCvM/MV2nGLi9eAlyl8FjmHeZg1dqL4K1I81xWwVNQRSBDo0KQ?=
 =?us-ascii?Q?BGbFjCOzDlppQvVZgG+DlPytmVIgltlNqmYAKx0wAynT79TipYiRzRw8JcEI?=
 =?us-ascii?Q?Z/BeEgNuI0Y3HTBxVTgBI/Y/DgYJ/PYdvxIBUnxAjw+GH/3gkwKWWrVkkaPc?=
 =?us-ascii?Q?Hky8uzATiuvPHeZVaTCz+j8j4gkCuU9AOJBlOd98ehqg96cxSbuv/NAPyIX7?=
 =?us-ascii?Q?V6jqw0dg1Ergks4OF7CGiAKQEq5tzFD0Sye2FWNyDof4V24Jjt9h+5Wau+F0?=
 =?us-ascii?Q?S3TApfA3ROHXJEUPyDGov2veFjRRRv1K+2NhdDdcmqUBD7/A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5cb61e-8a62-4450-49c0-08df4ba2dd55
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:51:38.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpBavJ1NXtPOl2oD2P/rSU26N7+8P1rNuPzly2QbiR55KfP83xg5o/ndWaD+kEF6yLwIZ+WFfbuTpAoNOQWysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

On Tue, Nov 24, 2026 at 10:04:10PM +0900, Kyuwon Cho wrote:
> When an address is deleted or gets IFA_F_NOPREFIXROUTE,
> check_cleanup_prefix_route() keeps the prefix route alive as long as
> another address on the same prefix needs it. For an address that is
> not IFA_F_PERMANENT it sets the route to expire with that address:
> 
> 	lifetime = addrconf_timeout_fixup(ifa->valid_lft, HZ);
> 	if (time_before(*expires, ifa->tstamp + lifetime * HZ))
> 		*expires = ifa->tstamp + lifetime * HZ;
> 
> An autoconfigured address whose valid lifetime a Router Advertisement
> set to infinity is not IFA_F_PERMANENT, and addrconf_timeout_fixup()
> returns ~0UL for it. lifetime * HZ then wraps, *expires stays at
> jiffies, and the prefix route is removed at the next garbage collection
> while the address remains valid.
> 
> Treat an address with an infinite valid lifetime like a permanent one.
> 
> Fixes: 5b84efecb7d9 ("ipv6 addrconf: don't cleanup prefix route for IFA_F_NOPREFIXROUTE")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

FWIW, this doesn't look very interesting and can be routed via net-next
(no need to repost).
