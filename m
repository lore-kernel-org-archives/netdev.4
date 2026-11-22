Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347223;
	b=yGRh12diiGa/TixHqSRWQQEdDd7aurHQB6H2cRNdM9mCBSaURMwbKgzV2JDPVUYsj8rI
	 QbCtu4AW7u5vzCUV0YCYaN1qnL2NkFXQr20nzCe8RB3yULzaj97RLCOTUQY1pjxV4y43W
	 Q0ID/s6NJQDSlQWOspTZs7B30vk24L+65E3mjXQpivvs4gwCDQkwrIAIJvGb5imXqk1Jr
	 gFvadBsqHslCuke3KXI4FlBxO+bIuMCk81xN/acpTw8HVv186Qviy0cDtK2hf+9AiSTx+
	 39xTlY/+1I6UEXl89FD+fzj/sC29RYoXLZoHu2hUdM2XKmZofhprrmNw4Zd9O/lAgcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347223;
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
	bh=rXjifSK8z+I1b9+pVMowsFHLchnD/12XbUSriOuvsXo=;
	b=AYuqZgaNcjGo8IOsrn7qrYFGNB7BADw0CHATImux6BmVEzxxCWZJrgnhCUHoA3g9CHs4
	 b1vfnvLpPaxdPeCiPR4EZTi2mERWqlnlqIq2Q6tUHffdyIEUh2OhEbGQXG6cXqfwugtQk
	 a86ODvwc9oj9fkNo9kqkxAtdQ/sevNZuLKycbS+q6qAdk1qn0JKG2c3cSBWcB285W7jln
	 PMnAdJiYXwGkVZH3eyUSchHPWvKDZxkgpbM+M6x2q6E26OHR2nx/5bEhbbyipjS7ZdGhp
	 1QjOymP9ACnQn3stb9mzUk/MDXSs2l8wxUog8M9AGHgXHnJo0e/Pd8qF6Xd/ejuokYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rj0XoYU3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66C606A32C;
	Sun, 22 Nov 2026 11:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C66C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rj0XoYU3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hirTWvFE/YluZy7b+6+e4A4cqHjctLO/ST5KB6a6LlfGivRNowFoxzFYa32tsMDbOHnfyeBbgOhac4UyM2OvFbiVR2hPeUSm8icnCIk/Jow+pISXcqB039hdlVpW+ZkuDazbx5kOASV5thFt2CmyfX2LYJQTfDN/L9Hums7Ci+J+xhdKDRWG/PsR2maa6JZ6mibHazMs1zzljO96tl9RGLfb0YBcxjmopueazYCN4xijvHXnCx4vjjHdonGbKYutrpZ+emWYZc55PTfVG7KyOiUeBpNcPd5HgfgmMUsGijggn4hqcgJxWg3QoEfRGGpV278GrbtgT1hK6OoZi9oPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXjifSK8z+I1b9+pVMowsFHLchnD/12XbUSriOuvsXo=;
 b=gvD7ZPr/p+59RTuHPoOf7H3NiTEFCs7zNb3jpsBQLZq4ZM61XTeAKvhD+rOkFvqpLb8IjQAEL6xOBi3cI8u28lNFmEGeuHLndXPuUC9i4TVhSEUUEyPAOh9xADascDZ/4x753bKvAnpFRg7ZQ0hWCTTcoP+URw8jFSUngXRtfZwkyZL/spfefZb/pZPu9KxmREChk5fQJeGalDxOxEc58FVxaU/XAmcdm2oUdZtiSrsRbr8cmIDHX/oYDCjcrakfT9x4lZlI/XGXj19ltRtFoE7zTwPeyvsN7qLY+TX1GO/z0n5sD+UZ9dCr0qpeIRfn+vFGwk4KmouQmWFPSXs4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXjifSK8z+I1b9+pVMowsFHLchnD/12XbUSriOuvsXo=;
 b=Rj0XoYU3eMCHQ7Lt0al6cRYvGREiS58BnS+TtQ13IZ1BaX7buCZcFUKAa2czl5vqj20E3ksbA3FmNhsu+zvhEldk5diL84TyrPvKEbNGpKYCvhp1K+smlY/XSteu3oEL65CaBRYio2f7jzE2rSKukvjn/KY/I12TFJvCcJ1OYncfk0vg43R03+Ncva+3Xu0gyAOQvbxTcgzcDUp/tazkA06EoowNEQNj+lJzlLosE6GD9RmpBuQMNxVT7jR5WzFqutBn7VRMqWL/dfN3e5v/CGRK6YEq+LamV3G8whAD4dEwdXcDLTXxkBZ0HNGbtV4w1LVXaoZxFCK1OXDMeix05g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 22 Nov
 2026 11:33:39 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 11:33:39 +0000
Date: Sun, 22 Nov 2026 13:33:30 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/1] ipv6: fix MSG_SPLICE_PAGES with a dst trailer in
 __ip6_append_data()
Message-ID: <20261122113330.GA2781890@shredder>
References: <179534083350.2499182.16169984227830330896@gmail.com>
 <179534083350.2499182.16621119046570934510@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179534083350.2499182.16621119046570934510@gmail.com>
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CH2PR12MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 32529a80-2fdc-4ea1-5d50-08df488c7408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|261009223027099003|3023799007|11063799006|4143699003|261028144727099003|56012099006|261021121427099003|261102123227099003|261022075727099003|261026140227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	d9A1g1YjYwSpFToDcb51B+y2mKLWDtbWB2z/0yKprAQqqmEFJCJ45si+k+fKjQn1jrK0OG0+Ah8GHsmNSIADitOiBRZfHfbkQC38HoiwDQPizCdX/KNSksqwz8VhCz+2hs9ITvtBEcTLH7Ed2an1fpOZprM01XwZQS/IVa/6I0vd42D555qsvKUmGU3ofolqsVVYcL7STaeVSNOtskI5nAykaSd4Zyqz/0L0ludrYjGTd/UPk5GgRgh12GlNHU6hOaUp5F0bXTtkSwUycGa/0qcwetivEe9uBLc+CGrEIla6JCi9/UkorQplSCRh14byKvpdODvlUkrAK+WezAtlXSXEowqRbfNEp0NYKjjDetsHuJ6Fn0W7n+GHwaPfIpRnogoKiUwj0CX99WMmY7VH+tCxzCpZNfOanNo4wlRz2BZn7iiwKPsTjNx+S0JOIujlveFpLKixyBWRmp5dqZAbbuDS8/f8WrkI2Ig6ywY19w6e5/SwiuxLOwWMb9TCMhmq1FK1AWgjoC/KSaQoxZHS02sS1mPZph73RUyYTTlW0SYGJyHqXY2wFv2vwmHrhnyZyTfPGlSuMyFWthjp6bBsRH9MQfqJum6VGpEznlmcIvIkP2nGdSjo8h9/SZQ+YfV3uMU7qUEWFBxXzz0Htr8QTs10cttoDl3yDDawoe44iqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(4143699003)(261028144727099003)(56012099006)(261021121427099003)(261102123227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wutYft3MRjsnapFmo0TzFxUKveqkOb47RYLUQ4AQL68znTunzpuvJEAM08Jw?=
 =?us-ascii?Q?wGbrkKequeIfZ47YZNPzsZjFZ7ab6Zs7Yl7LUlsWoVlfuczy5zKKRj8YsKtR?=
 =?us-ascii?Q?6/7v4dJhktnOrjj1k44539DVg64GNikdvHubI1WRaxy5yyHqyrCoRtJQDOt6?=
 =?us-ascii?Q?E83RypdArVMaebzB+fHVVEjqmZEsESNsOkmfUQifwHa4pSDBcX0xksKqlMEz?=
 =?us-ascii?Q?QYrRWHY1lR130Hbw/lnSusRa1cjFi4XyOYgcSFOJMZRJkW3hLS8qr6b/Osg1?=
 =?us-ascii?Q?+bIoCP/lXwnw2ExeKYhFocqWTeGLBSyRODTGSER6kGfsgXN8AKaZDfxrPGAK?=
 =?us-ascii?Q?ap78nQXCbNYJc88rHdZLfVrugcP0+mqNVWdvWlYqtAzRTr6m27myAFrQV34R?=
 =?us-ascii?Q?sK2WdtIEqtHTw4CeDBNoU/YqpTZKeCB1qLjjGdfnzpPAETAqTMONNQQF/vOJ?=
 =?us-ascii?Q?BvUtvBxrKjijIe0PRSSHIboOqmLbqJoO29K24u9fv5Cw2ZpeKHLbeIj0numa?=
 =?us-ascii?Q?q7w/BSycgnFTMxPOm8BnXpzy3OuWLE9OfoBBs4pEO7U99KGb7/CaWh1s7Lcg?=
 =?us-ascii?Q?oAlWbtwYetxBZflb1XE5GGtcYtXYcr78QVBz9a1iWxoHC6AeSNQTRMO3qGfT?=
 =?us-ascii?Q?68FWiAASuT0lZA4RL2j9VCf3z3eZeu32IVkPMYQuqpRsRXuBNuDeOomqtSV6?=
 =?us-ascii?Q?ToXCvU8w1bgVxm3mDhQw+Nmt5nzRrWpfId25ENs2cGcmXuWm6yDSwZ0Zdllx?=
 =?us-ascii?Q?PFsUphU11UFBSMNsUpnXw7l50KryVAyYJTewMkgc4DDORXUGK/Dq95MKG5Sq?=
 =?us-ascii?Q?o92e9d89NYuA9DBgTdfyduYZsjiiP8cXrABM5Ij8kxMteMizchfY9BFDOedX?=
 =?us-ascii?Q?/m6eUcn5Yeb0krKtyBRL0bK6ljCnsKwL9ZXsg17Ne4AmAjwoNDDO+HA82ENm?=
 =?us-ascii?Q?vq68yXLTVF7LIZTd6j6Ueoz+Kj5pAgP5vxmNOwRF4aGoorBcb2oU0MAUrzmA?=
 =?us-ascii?Q?+xa6YfVbziTTB8f2i9Fp4MH+8QqQk+4hd6oX4qsjNA2prXi4KHfj1M0u0N8p?=
 =?us-ascii?Q?Vyc0M+S3FZj1gYUM1rs+HfyEcsrvI8tQ2c+jzlNqG+KXBvoq4PzCw5iA84cs?=
 =?us-ascii?Q?ErwN1YpDEaC0nWjd+31iR+0aOqdyLtickhajMNVTheO/fVQAIfWPU0S6YB+2?=
 =?us-ascii?Q?AsmJ6XqChn4waZhc2d+WOUDvlHT3Z8owrmW1OHgzVTjvErrWHlbPMq8YjR4P?=
 =?us-ascii?Q?c60UImvvxiI40ZdxdMNCqaAE9+ZldLMlUec7ozQpVOUWiHylHvqJ/Rb54xyw?=
 =?us-ascii?Q?Uih91ZzEUmlSM9Niltzj+PIE1msR2QPmLUZTgMKlgY4Ekorkhsb4bsi64Jia?=
 =?us-ascii?Q?RceMWVBAAKz70x6i5xjPb/B/JdGwWZqdcCjaCeGZtnb4WmIa+sBVEqQxUkt/?=
 =?us-ascii?Q?A6oySGfEyQwRFlb8CRkimXSU9rujIvWYbViSzpdkMvK45MeVRlB0MSoE0rFh?=
 =?us-ascii?Q?4x2UrTC1wiKTc8srUly3Yi/WRdUlccQCMfV83MxS3jpGZj7roaIqJUgTqNYJ?=
 =?us-ascii?Q?P04gMhsOSwsMJiQ4NCq/nbG3lxiX/Dwz7f0MHuLYsxFErK9PDKuSStnqAJLB?=
 =?us-ascii?Q?/cHRB6gu4K89PYAnf2fo1WKFHaEkJCwERmHN0tdEhFOJ6urQ7Ab+irUNqqFo?=
 =?us-ascii?Q?xSaoRi7qSeB1X3akgCPAfamn093ynj1bMAgmw1JvB/R4IUCm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32529a80-2fdc-4ea1-5d50-08df488c7408
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 11:33:39.1635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZg5kEGXFzE/RbKix45ro8njU56ISS7V7S9BW+Ff0psiGxP9skr978QKRq7qXEfQgVcIgJ8z4FA/ZI6HTckkYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541

On Sun, Nov 22, 2026 at 07:24:07PM +0900, Kyuwon Cho wrote:
> When __ip6_append_data() starts a new skb for a fragment that is not
> the last one, it adds the dst's trailer_len to datalen. On the paged
> path pagedlen was computed before that, so with an xfrm dst
> 
> 	copy = datalen - transhdrlen - fraggap - pagedlen;
> 
> is trailer_len instead of 0. getfrag() copies those bytes from the
> message iterator, but the MSG_SPLICE_PAGES branch right after it also
> runs when getfrag() succeeds and resets copy to 0, so length is not
> reduced by the bytes just copied. On the next pass the splice branch
> finds copy larger than what is left in the iterator, warns and returns
> -EIO, so sendfile() of a UDPv6 datagram that needs fragmentation over
> an xfrm tunnel fails:
> 
>   WARNING: net/ipv6/ip6_output.c:1796 at __ip6_append_data+0x17ed/0x4b70
>   RIP: 0010:__ip6_append_data (net/ipv6/ip6_output.c:1796)
>   Call Trace:
>    <TASK>
>    ip6_make_skb (net/ipv6/ip6_output.c:2097)
>    udpv6_sendmsg (net/ipv6/udp.c:1717)
>    sock_sendmsg (net/socket.c:841)
>    splice_to_socket (fs/splice.c:811)
>    direct_splice_actor (fs/splice.c:863 fs/splice.c:1114)
>    splice_direct_to_actor (fs/splice.c:1023)
>    do_splice_direct (fs/splice.c:1157 fs/splice.c:1183)
>    do_sendfile (fs/read_write.c:1351)
> 
> IPv4 is not affected: __ip_append_data() does not add trailer_len to
> datalen.
> 
> The branch was added by commit ce650a166335 ("udp6: Fix
> __ip6_append_data()'s handling of MSG_SPLICE_PAGES"), when copy could
> be negative on this path. Since commit 736b380e28d0 ("ipv6: account for
> fraggap on the paged allocation path") a negative copy returns -EINVAL
> before this point, so remove the branch.
> 
> Fixes: ce650a166335 ("udp6: Fix __ip6_append_data()'s handling of MSG_SPLICE_PAGES")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
