Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706877;
	b=DcC2y2RoQ4iEUFAygL4GgpVo1iFqiEcQuUo2tAakEOXkox3SNp6/r9LlPAWAk31jjeqP
	 +7ZUB4BXtV+qG4e9/Wy00BH0hVE0lWAeibUeqg9m6gB7cnPae0Mu4UrSiD4V9ev8QMFHZ
	 jhdT1xB8AvRyGx3hatH99tMffiQrIVe19Y1UDFphfKD+zrq/kQApwEcg5j6P/Be4+f/MV
	 NfUXjXycgJ/dq6qMJAAQnQM41k1UzayT8Y0sQT1+4u/sOkj0GM/Jza4LsyPwWZItcQw+s
	 Fhvih9Ygz47Auc7oO+Yszd1jSOEyaXtQVHdQQeku2tXe84yQtNanqfACaMzDveBPQpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706877;
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
	bh=mH8FfY72KSbU79x2dDjvBSyebWXoJRNxdZ7GxP3JiEs=;
	b=xU2lf3ztB+Sop6IY2r5JcspiJEl3d9LFDhqtAS1ZT7bYaWuItgSA9LsIukH0HQ7KEwAB
	 BavE69F5kasIGuRVAzeQA1Hq0TBRs5LcRY+/g/4+Ipv3Fr6X1pdz+LbPwJ6fAvdbJMGIZ
	 4nwL56CmXUDDs8nOnQ6GKWMW601VWv1e5hvT+jM8jQwRHB+464UUDkjukRUIz51NEXniW
	 ZjkqnxUEKPBBG89/c8JKCiH4CUmc+gG5NJ0nOsrWKxHfOabss6jgEW9RfrZQged94Yx95
	 ifn70JNHoFXG5wKvyiD35Q+ihYukqiU9YCMePmmEMooBXLGadCO3wP32dFOUjTs1Pug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n0X6mBV3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.56
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E10606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n0X6mBV3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7YgFo05dgqQYrgQNlF+4LGESQfBqZNUrtQp6lvtCYX5LHBZNPHQgFn7GXS//RLSLhs5ihpme3jMob0pFKX005Jus4FN86qeCaQyWSQyHM59shg1H+X4TJYFEoQEL3VtXKVS2lc8MQCPRouoROsq7QUUGZ/M/od8HxXbH60lbysWAubizPAry2PNfDG331Sr+2nRr3y8GHb7s1xAyW/JmfQWo9DzUyfaS1qe8YFDWWXeneOTNKoJx7pY06k0PL1BY21hNcJZ6EYTsia/xxN0nktonJXAJ0/5SGeQviVIMalqXThty9Tsk9Ztaquwtl5OZJNgPRMkKvY+dlrCG+LPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH8FfY72KSbU79x2dDjvBSyebWXoJRNxdZ7GxP3JiEs=;
 b=FC+yjGmO9i7mUEZZp0+6jO8VuOZyTYbRXIv1D8flSV2HW+0BjteyrjNaXCwChMeFrXTE+0ZuCzFdgTmuAPnOafKlCDX6AL5rqP9WnkwCabg5etzo7TVj0P0jLiTBwRM3r87ffW14/gXKkjIIOs5qcV/WyYTteV+aJ3rbWgy+xnk9z8a7v2+F7GauBRW2WMNra+B9qsnb4UsX51UIkWsxHpl9mqFAJ6wddW//a5Fiva8xXZ85oibhhq0uIThwqYGDCuoQLcEewiHrT7FhYkSou0OEwTdhPPky9oKVNGHzTUBE8JIQMvk55pgdg76iI6eNyHmxvdOnnENVmELp2NMLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH8FfY72KSbU79x2dDjvBSyebWXoJRNxdZ7GxP3JiEs=;
 b=n0X6mBV38vnzt915t1thmwD2wwIHl5p//68Sc2k4nQd+IFxyhDeW5jwettIhjpaXi9LLDtnJS9+kXAWDVXe20jPHIQ8GxNourJHoe5GB5pMtkfF3EWevR3qaqAB3/mR0AShehb9FFbY4PXiHqAyxyU8b8aEfdtjIJOWjr2VuZoaj/l8ttCTecFGFKHB3z/4LZ2hAWRCN6GgPdHgiPzCTDmHOXjdJfOyV84GFo6utyeA48NqYFpQCptj6Z9IsMvPDKq0JCRI8D25WUZebo3aEABgjP4NvlvJ/XE5RjNo2S4uzYER2NI2CZ7PWyRzapDEtgPhxeVWsMGC7FtoiQu6lwA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by LV2PR12MB347031.namprd12.prod.outlook.com (2603:10b6:408:417::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:27:55 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:27:54 +0000
Date: Thu, 26 Nov 2026 17:27:46 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Xin Long <lucien.xin@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net] ip6_gre: return the full header length from
 ip6gre_header()
Message-ID: <20261126152746.GA861118@shredder>
References: <179553307366.1670514.6802805102726706751@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179553307366.1670514.6802805102726706751@gmail.com>
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|LV2PR12MB347031:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a56dd9-97ee-4d38-1ce0-08df4bd1d762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|261021121427099003|11063799006|56012099006|261022113327099003|261022075727099003|261026121527099003|261021123027099003|261021135927099003|261022105027099003|261021130227099003|261021133027099003|261022115727099003|261102123227099003|261026135527099003|261026140227099003|261026130827099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	31XQCvwDvlqpteeEgMMxBkVak6TsOeFeCzzrpk/3tMfsonx8ZDsKATLu6vy8dQBuHkEzTTB7gyKK1DxBk3JFhkBTV0mjZrgVZuwpDGpqbHMz2PA0u32vFFjYlUdBXmKPuEutaWStReH1Kv9pruovYwOxjbKwXSWQHtZhMfqdTz780Vr6xVFLW8kl/Zx7smEmBzqMZiDSiHVVs3SeAsGs/wX48TLSEZh/gMh7aWdLURzp2rajnl2ULF9tuu5uUsfbCfXAebrYhPju6dh68NPoQW8ltDK6HX8enmbClaMuFCJy1goVDK+aWYGujr6Jn/llcOSsq9WPXbOAs7o52QsSzBgHYpz/rCK4Xj9Y8ZcNsB1q1dasy9jbRPlQbjT1szZvim6SpjixJ1A/pD+1wDStveDvfGYWITIOwz1UkG5oyN2ThqVmtTrJsHLWKsC61a9+IKZquCQvC/1WzMlTqvgITxgDfmI1JZSgGHNptGeVA/vni/1Zv9XRjEjfgcfyPQNJkHEyZost/mo+BbE3GNho81MKSOkXHR+PyH7roVkkty3CikJFLmNqKr6lWgTBJbrpzUsRtowcpzIe7zj2x99+N6hkwEO+FrIH6r2TM7OiFbCXV27s6Wwu3l0s1yPnUw2jzt7DlzeqGkwetrLIPO5jWoZYFDae92zc0/TfuycuC3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(261021121427099003)(11063799006)(56012099006)(261022113327099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021135927099003)(261022105027099003)(261021130227099003)(261021133027099003)(261022115727099003)(261102123227099003)(261026135527099003)(261026140227099003)(261026130827099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0DQAEBGa/JttFbMFq3+qMFX+AeplKa9xbB+4B4lSt7xiKUQw6BgJCMSAfG0y?=
 =?us-ascii?Q?cuM+W/SzgM0RgZoYOBLdx9MEX/tOrmFbN12v+7aFGN8xPW/UoI7LjNs9hsAP?=
 =?us-ascii?Q?bpY/zmIKYUF/pbq3kPbWKl5Vli2WUfG9dr6A2nSWNWpSBb6WeG9aAbpcZylo?=
 =?us-ascii?Q?tWBqoV2trd9b+cE72PcCEWkOR0mHDRY4ihnq1rPSbUvgZoneD4ttfSd5brhC?=
 =?us-ascii?Q?ph9erjWR91W3Nixmh/Xf31b3+evI0xogsrSnwnMwtbWDuwgZDiGiNQhBUMH/?=
 =?us-ascii?Q?vdp7vfVY4cZp3uV6Oif+fJX5fEfsOml2ME3FCzePTpgU+YUTUiw3EFXMxtZy?=
 =?us-ascii?Q?JueIpv1zpzFA1LKraInyB1cvWrilW6Rt2YhqXd8TzkEfvwTCO02VkuDgpT9s?=
 =?us-ascii?Q?z3fOVnU2WZJ/BpISO02pBOMAiaTzOhpuSo7ezXUGE5nqZp2CxrihKmu801yF?=
 =?us-ascii?Q?PT0B/w9//yNiNTbm6FnRNpuQrRXoLFaWFNXmDQSeZ0TPcNvBo6JsTWnSwVAS?=
 =?us-ascii?Q?zyCJY1BMTeVPvnuwn4/iaMmY8b8amEgnQJR0F+u0L03dkzAApHzWGQpgSEfN?=
 =?us-ascii?Q?HaJMTuxdICL6sDnPzyiuL+JeLad3VjkxzMnZyz7/Ua31mjdZ3l6zFHasQHZ8?=
 =?us-ascii?Q?DKnnFgCnabxBFomlPqpxqT7yK0r6TAHngEzYf3TGubGtE3zbUl89hsSiC1Wm?=
 =?us-ascii?Q?w6tc+PySrbEN34g5kxfLH48o5EN5fowJ0dJk4UXUa4hlt2bsWmiS90unaK69?=
 =?us-ascii?Q?zhMMcpZuYKwaYXWc2InGHfyBuplNQu/TqsCXE57kd3Y2FhI78VyysdbDrcEv?=
 =?us-ascii?Q?GS10eSgwueGWcopAabRNXDjmrfZ/Lz4pf64Ihz9k6rPFigS9TXlezy55zA2H?=
 =?us-ascii?Q?7+4Fhnc6ZWfRWgJX0ovKauWQ9SXJm7VjJmsA7sSlz3Podsp3QcB36vS3W9Dc?=
 =?us-ascii?Q?ZcOuDHUFNH9VLmLS1Dz1PGNktT0FOE9Cs70LGn5DJmILzRbmok4RA2lUSrdp?=
 =?us-ascii?Q?FpWFOj3LcFoatw/NqiSMa6Osgvi1eiXSahuI4xPdVNnbzrcjSGjvOVV1Euwn?=
 =?us-ascii?Q?kOhypGpD2CAT04nqDMLWNxJFAXUZkOAVIeIXC2aj6XReYhZbiY6/EganwPys?=
 =?us-ascii?Q?ZSLlUz8XZlbdWdhqkS0Bd+/sNgBdchXGl1/zmFaAUb/Cx90iFdSIYTrgMf3R?=
 =?us-ascii?Q?tMGqxmzbUiuilr3zy/ub1XR7iQpodeug6+buiUOJSYwMbtcsHGWs0EcKoJ34?=
 =?us-ascii?Q?Ywk2PDe7AIpPeNs/MDIHFqGJUvrUmdswQG5+AJJ69JX3L9yd0kdAOb+Hvckb?=
 =?us-ascii?Q?gnX4lBQM534x52ggsP15CbyunCbK3bCDzTW50Jdod2P/if57Zf7UDnBAHj93?=
 =?us-ascii?Q?wmNtRflE97El0dCFeQsoigI/nK/OAM5wbKt52ROTZfr0lrRHCBu8TkslTrXl?=
 =?us-ascii?Q?eKhlbXW9vtQ+Gcuqb5YvMQp/PQMOJeJ2BmUIOqgUQXcf1a6Teuurtfntg4GO?=
 =?us-ascii?Q?A1WNGWNvI/i373AMzKNMod9sA00OPWvI541BQXJwwUJwHb06AfWFNOqTscfA?=
 =?us-ascii?Q?cugho1Ltc0R4dDIKJBg1mgr8j8im846RSNQaVLwxq+5LkNlz0Z+N2gkLguSs?=
 =?us-ascii?Q?BHPfqaTFSL3rQAG3k+FgrOtL7qkBC83opHWsXuyovfqzRIWhJZdhBfQrRS2P?=
 =?us-ascii?Q?usvvew8oWmmbYFY6N3O+AwlYu0yy1YxwIQRddd1KYdcPvnfj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a56dd9-97ee-4d38-1ce0-08df4bd1d762
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:27:54.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32SatvP3fvjJiwLHBV6zJk0MrdTAq2cup6U0149AuL04Bx8imS0nn4VCAJo7HWiawizIVzYl+SbsG5wjYqXkpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB347031

On Wed, Nov 25, 2026 at 11:04:42AM +0900, Kyuwon Cho wrote:
> diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> index b5d6ed8f0c36..9b30fb2f4bcf 100644
> --- a/net/ipv6/ip6_gre.c
> +++ b/net/ipv6/ip6_gre.c
> @@ -1397,6 +1397,7 @@ static int ip6gre_header(struct sk_buff *skb, struct net_device *dev,
>  	ip6_flow_hdr(ipv6h, 0, ip6_make_flowlabel(dev_net(dev), skb,
>  						  t->fl.u.ip6.flowlabel,
>  						  true, &t->fl.u.ip6));
> +	ipv6h->payload_len = htons(t->hlen + len);
>  	ipv6h->hop_limit = t->parms.hop_limit;
>  	ipv6h->nexthdr = NEXTHDR_GRE;
>  	ipv6h->saddr = t->parms.laddr;
> @@ -1415,9 +1416,9 @@ static int ip6gre_header(struct sk_buff *skb, struct net_device *dev,
>  	if (daddr)
>  		memcpy(&ipv6h->daddr, daddr, sizeof(struct in6_addr));
>  	if (!ipv6_addr_any(&ipv6h->daddr))
> -		return t->hlen;
> +		return needed;
>  
> -	return -t->hlen;
> +	return -needed;
>  }

There's another info leak in this function. It only initializes the base
GRE header. The optional parts (e.g., key, sequence number) are left
uninitialized.

Before this patch the payload was likely written over these bytes, but
now they remain uninitialized and leak. I suggest a memset(ipv6h, 0,
needed) after the skb_push(). ipgre_header() has the same problem.

Please wait for the AI review before sending v2. As I see it, it should
be three patches:

1. Add missing memset() in ipgre_header().
2. Add missing memset() in ip6gre_header().
3. The current patch.

And use the appropriate Fixes tag for each.
