Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795360374;
	b=us0trVd2itIua9bLy30AyxtDn2gQnEYjwOQJMWW+bWWNx/z4C5IhM98i+5aPIZt36fiv
	 ffsyPilYaJ1ECceFlt9EkBYU+X4JGa2d+bZojdZh8zfFChPM0rDBwTeEvYyWs2SZCyNNx
	 3skoS60GGye4B0U/lxOrKFkhzHxrdyiIM42cgepxlR+yTGfIwztXCH5/v38z637tTGnkK
	 8NZeFzD5vzFFcZXwgyFaopfx5tsltVlzgcrNhyufsWT0UqNK/Y+J47Qv44Lo5bkqTnL9Y
	 Xvr7ZAVyyozJXMgRlACtulptFU1W0QKNjUP56F2MgB1l3hOeI3992CYHRs7uNXvc5Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360374;
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
	bh=71LobZoCWAOy/Efk9pIDnS1iseXZHhhz1TP8Ggnb3S8=;
	b=NXsd6G3+3DVxm/9R5nF06w8AIE+DI3QWsa4O7nwtZDxQlVdsTqfesvOfSerMQO/PtD1i
	 GMYO3uqOvOh5cd5ykgDvqv95GgZaLP35hVtjlQhVZkgbcOd3w6lbitjlRE898VLccP5EA
	 SjxOjQdELDq4ioAuhQ2QH1SuRy8y44iaujCJkbt0mOlLc2BiXZ9T3hhMEoIqrV+EGXhHR
	 0eKWPqAiqj90fu9xtFAbND3aqoIZ94Z185FdeyOloY6YmCxYT3cBZBSPtrO0r2nFnNTtf
	 606yDbJfdp66zyzZoDu/Uz07aLr9KabYjiw8gn3j73dUNMciXEwCWtl1KNThpIjCR9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y10Ha1yr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.14
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D80606A320;
	Sun, 22 Nov 2026 15:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D80606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y10Ha1yr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5f8xSvFo7WpKdhEVuM3io2Ma5I+4SxkcpyfOt0D0ng44iaFAdDIoNvN8VGvdTnOddozCN2qGW13rSVQlREMEXnHESFVZTfxX0stoxDtq5ZptQ80uwQqfRY3xxL9LvNzmSlyPTBQ5RKlIsoI6s0DcIHnjdIrENroiGeNnm23rOZnZJIIJIS+8NzbafWa5T1bC/dkzo4C4pKZiwIvUBuKZO/Ukt7lN7atC5jzYOQAF1Q+95srBWWZVngXJ/IBIdvelqMYs64yfVCxUF7wpVHgJYDZW8qqMsTcvjyWU/Dod5zTRrZjHHZPlKhR03j9OSEbnnm/e9NhLNf8yGQ2x5hbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71LobZoCWAOy/Efk9pIDnS1iseXZHhhz1TP8Ggnb3S8=;
 b=Ge9HEfoVNMJIS61TyGMj7QSR6dIMbxFQsOKoWIfUVbs4qKJX80SYiouwYtAU/tl3aYXp7SkdELCRl1lyGbl9tGZ2IOUpy3qEa0sPvOw4gD2/Ya7TP6G8Oe+kpEW4AcOSUJrXweH8I/xP2fgxA+d6WkwBUpKOmKWUisru1nCmpau0bk0AfmAMnTOxmpmrlJTgFr97ZxNEEWX0+VmXhB6IQQqKTEUohr97xlG8cnWsAbV5MrrBEH00fi2ZtIEP0NBjTVfZMssjM3t/wq2foDYs4oEDvlmPAjq0/1cIbxket+owDoT0yrP/lU4rcsixIAKDhX37x0yWiwoKyT++Jq1IXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71LobZoCWAOy/Efk9pIDnS1iseXZHhhz1TP8Ggnb3S8=;
 b=Y10Ha1yrTI/6lnH8zrSaaVdVETE8l/9pWxAq36xx8ZldNyhpXnPB51czlc8vkxA4DtuRfcQJxalzz57aXg30O3vsk2MPrrRj5soYnUVj9Uc2+pCpY51cJwDJzpZUY0hK/6fIC9QqGO0GuO1KEfmG8z5izvmnviaGzAAK0sZgxPH5a5aSIEWAt7qYgtVLfVmC7AJa3TXnIgIiQepM3nXZScune5T7d96vWIJVPrfPhx2KwYmmHm5EBKVbooN5rB/wXQ1flGM9KvpIkB/pw+zWR+uJOmJpQq8BvgF/7c7nxJYuJaQgxFvBWlqDsBBd5xv6j0cQwqridWBm7HxDUhyLhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 15:12:50 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 15:12:50 +0000
Date: Sun, 22 Nov 2026 17:12:41 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
	xeb@mail.ru, yana06070@163.com, netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net-next v5] ip6_gre: fix changelink conflict checks for
 L2 tunnels
Message-ID: <20261122151241.GA2955065@shredder>
References: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c24e923-f985-4553-05e4-08df48ab12c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	f8ENIujTwxbT2MjY5og0Nua9LiFy2AUvproz6ysToSLk7C4+IecP2Nyl0RB2r48s72eAvkWfzLmSds66rxMLZtYm5dSaJBwnaq/42k2L9Nfm1xu213IP+PcAvtfOYcGdvM7FbJfIHOCf+Lv7rjuR18OkRfF6FNCc7Z7jDCuYaZFlF1hEPIZaCnyqtoDfrgedeOPeOcARNDF5XecLzgR1YfJD2H1XN4GE4QSX3wYjQ07qxQ6Tt1nXmVcwVYGN5AU16l+LKnPHWGrx/q2iVfyKW2GujAXafcGt01JFmq5qC0loB6465opjgHsLeV99Czx7Gf7+iU++J9b8beLjwLtzBI3SnAXmuNBzKrT1clZ6DpFKDECoDM6jy9uLWrSvYnzsuRddCawsWMvg+ffrijMKVK7Ud3AQLP4QGUg4lxJiT9dMVJCZIBDCjn4oSDA1pQfXmnij8dug6vgvSBD7R3gu/9xJ+7ihXI4kAr1HFnNsao5E0XrY9JQo33MOsyGkLtuHDnmsAhNbFVWamwgndbo5xm5RTt/xvPP0jwbU6VIfO1kiPxZ5U4v9eZbBqTVCKu3LEeFcFl2APhzltWdX1y+K9fOLHUAWqFvlQoxY83D2RXfg05ox1E2KSKi2vEnBwrQ1C15+FcYLpzeoKblcG7yq5pjyXlCr7tY0zWOK7EJL3Q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+PpzOwoY/8e0AHsNMKY0I+DiBa9zNTRduuTVqxYJGle8mYVFVhP656Hl8PDu?=
 =?us-ascii?Q?iQYvyGwFWVyPbpMP5PrGJlf8yE9+8/ycwODPEtdRlQ1OJSoE5RjenoyAnKi8?=
 =?us-ascii?Q?bAOz3yAR77RwmIrqVlSMNBzolPt5+zReqBfnd4Zz70sCLprw9qovVDgyk2GX?=
 =?us-ascii?Q?U8Grcqg1rasygb/DOmjSJZ/bbONmfKo3jA6NlBOA4z289dhQ0mgFibVtXL+J?=
 =?us-ascii?Q?1zZd7V/Tekqf87zhh1UvXZHEqtcC8ZTzXcQQ01Ax4MlgbeIx7B1Zkl8Pu6uf?=
 =?us-ascii?Q?JATNA0LSEFXnvYRnpnZnKLSX5UDoDUprKiPJqZGp315QRoDR5C2tox/udW1e?=
 =?us-ascii?Q?ET6uAZTnAlRjaaXO4H2fWYCjI7SwarPaQbwjnNfhkAuGxHCUHNaJTRLhbeXD?=
 =?us-ascii?Q?ArZ6ypYGA74DmgUEPbGla+1xJWHLEY4nu1xog/x44KUSO661eDnv4haRMJf7?=
 =?us-ascii?Q?TkG3SPoSRdK4Xan9jypCrDZ+VCNp208yXZHoD2nKeeL+91qfKtvC0m4iTDde?=
 =?us-ascii?Q?l2gdsLdSfYkItK9tUW0f1GFtEqyL5Dabg32QNWZ6Uu4EiX8fXyppkUTUQuZp?=
 =?us-ascii?Q?Ut5k9Lz0f9eGGcyD1f4rU6MhklF9q8Hvdna1HI1wDZsXaipncWGz8NBUz/ws?=
 =?us-ascii?Q?zYn3goXZME8qUL0yxXYWoCoFainFRlq9lhWcp1rRQPzVtlazj/lLfk2wzBby?=
 =?us-ascii?Q?6EeeQMLJ7fNwJqviFI+tBLods0a47f4siL0i/nqoWv044NQO+AbepuTeYmRR?=
 =?us-ascii?Q?plJrnQmRDgZrz8xQYgN4kX3MSEHFWR9NltjLB1IynhINO8uY7qQ0hcjkZRIa?=
 =?us-ascii?Q?GPrRijyzaALdXCQZhGzH5y3ISwCofBwLvnsFYMP+EEfxxQvMVxhaJA+hRupm?=
 =?us-ascii?Q?OzDw4aYErdpswmvss7s64b6mhVJf/dbfr99x4DGuRtPbPuZbEnuuNcIMA9vF?=
 =?us-ascii?Q?csPR5xxTA67x2Dmrped3IN3rUHcTxliMQTrePlba7BcBxoiTXOO3c06a8Wp1?=
 =?us-ascii?Q?9WJjlAeIkDo0w4xjyvuLbnjgjc7iWl5vK/wO+M+8yVy5MGjrSthg0alumgSv?=
 =?us-ascii?Q?H1KFV5C5H364C1KnZiMVXpfL1DXetyKEBSm8V9H5orzbwg2UMAiNJ9Ew/Mqd?=
 =?us-ascii?Q?GL04Ra2Q0EoFTw03wtNJdapFXzu/wv0Tjpe2uuk1IdTngZN30gDkDT2BCfaS?=
 =?us-ascii?Q?Tn+blF1h1aXKLmHdyeuAIpMr3QX7I1g8O39/I6ILypf/QcMZfpi4KCvAfpLd?=
 =?us-ascii?Q?f1n58g5pWJkm8eaOiqjHibSveUh0QECzbZUfXXGqOmqS1tYQLeRPO7l0EOTB?=
 =?us-ascii?Q?CS7U2TgblLsd1ZmGrj4fS79mP6ovEJNVxygCee3B6clcPmcBNF+fY4ObpQbt?=
 =?us-ascii?Q?51YZeNjcb+EKNpz+YyXxX9LbTmQU9ifscGry8HcSuVA3up2qHsaP9e+SEnf7?=
 =?us-ascii?Q?u4wxB6i0ZMKePw4E4dthT7Ag/YtATYBboNdR3VHx2KFYFru9y2j7Qb6mYSW8?=
 =?us-ascii?Q?jzIAmX5HGdCTsZLASbe64A/KTsPJDthWJgCxuhliGfsXODCvkbdYw64ahrGi?=
 =?us-ascii?Q?xNiWbvECfCs4MCtEaVUq4JDrYxEGtaa7vBYVoyFCgDe3s8wLT/dRKVCGsYr2?=
 =?us-ascii?Q?fWIKX2be5hB5NV4/uiuc+oYagZ2aU2Xk+heArBUa+dElGRc7yRMU+XbX65KL?=
 =?us-ascii?Q?2DqCShBPXUy6QLk0JPLZb4PY1vNSerufp+zoMiKCkrKyV2jm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c24e923-f985-4553-05e4-08df48ab12c8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 15:12:50.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWHWWMhohF+F8kAKyyb5ehcXdv4Mr4zM3Hq20EYTbPrlq0xbDiSqNKWLRsASusQvzGaVJifvq7fwYPufVy4V0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969

On Sun, Nov 22, 2026 at 09:42:44PM +0800, Xia Yan wrote:
> ip6gre_changelink_common() calls ip6gre_tunnel_locate(), which only
> looks for ARPHRD_IP6GRE devices. The same helper also handles ip6gretap
> and ip6erspan devices.
> 
> An L2 tunnel can therefore change its parameters to match another L2
> tunnel, and incoming packets can be delivered to the wrong interface.
> An L3 tunnel with matching parameters can also make a valid L2 update
> fail with EEXIST.
> 
> Use ip6gre_tunnel_find() with dev->type, as the newlink paths do. This
> also matches the device-type check in IPv4 ip_tunnel_changelink().
> 
> Found while comparing the duplicate checks in newlink and changelink.
> Reproduced under UML using existing netlink interfaces, without kernel
> instrumentation or fault injection. With an IPv6 underlay named under
> already configured:
> 
>   ip link add tap1 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 100 dev under
>   ip link add tap2 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 200 dev under
>   ip link set tap1 up
>   ip link set tap2 up
>   ip link set tap2 type ip6gretap key 100
> 
> Before the fix, the last command succeeds and received frames move from
> tap1 to tap2. After the fix, it fails with EEXIST and tap2 is unchanged.
> 
> Tested on net-next under UML with W=1 builds before and after the change.
> Standalone tests covered duplicate and valid updates for ip6gretap and
> ip6erspan, including receive-interface and payload checks, plus an L3 GRE
> control. Kernel selftests were not run.
> 
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
