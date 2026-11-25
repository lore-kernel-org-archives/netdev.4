Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612162;
	b=Mnw1FNojfwcn2hQhLmEyen1apXGRIJJX1GiY04PO44b9vgCtKOLKyK4eWLm8VrYTi6kg
	 Gii5sjOi5iIH8CZ6KF+U8mv382zLPQkX7fxB6T2h0XQcZ7Bng51X205Dc5mTJUERAftBx
	 +iGt/un6puZcwqk06rYTD8bccbCKJw8f6aKNk0VoQLfOwhiQcB2tUF44fwADZ5ipX/TDK
	 qKiM7lolkEc24uPv+2IufSCRmXgUToPWKN2OHV5/6PIMshr1R+4XOyoXFAn4MvOG6AeaJ
	 vXymXeDzeoSJs6MRcEnjywPAZglWqsU+hJiWlkhA68G40PdfgXeQeqYc5gphCLM/SkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612162;
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
	bh=j/ZBNt8AZMJnVMXG6M/00wiCN149F/yfS0cWuSz4jzo=;
	b=TIYnVRPXMMy+GcH1s1jCSv0SIo9FFmw9JNhN/meZh0ttYj0oA+Gf+eLO4klh3O1pMOoN
	 07upUhTqxJx97bwYD1UUodqPwji8OwTQJookX3yC9rHyQfAge5n10q4x9RRywjJ3Om6R6
	 5w6WtDro+uqt5NVroqk9tQ3jGClfadGC9yIzSqlC+7/46UpSacOAn8ClrjfLjqCbh3sIC
	 1ekcJFv8R4beb5v1XrTyVisKhkhf40ydjgY0pJr2VN64M/eu1YX6mT5Bh6YljCePIDl8e
	 fQlnvWOenpM4ruyD409aqWHtg0A58zxYDFK8rTo8rDQO0VpLSqzHez9T+vVezuQ7ZRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LpZctUu3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.13
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C646606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C646606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LpZctUu3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXtMhWjRh7wtoEq0NQHhdIfAxPma7vMY+jxz2wZjZKhZw5mKx3zndZP6unCojo2n023ceRLbtqz/LmwgIPi4O0V5KyTJRhxnMUvBhir9IZf3VDYzoGXwvERKo7DleCCnocPNvjp9RLi8PJEYabqFeRAvCEWKsyocEu/zSqYOqIOhFbwdTLLlakYDIZWeyMhHJ3UMpO6oDbMYPIc/ugesZYK3Qd5+8eLDQD8wSE7kax/8Avyx2cN8yhIU2jd1uBVPfmyTMw91M+/yjxnjukev8VszYkQqdJkuqNnr9DziXoEWffUppDVwYdy+m0sM3ZWre/sUVy70cun+p5r2otPfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/ZBNt8AZMJnVMXG6M/00wiCN149F/yfS0cWuSz4jzo=;
 b=MZmS/DuBH5Mjyn0UbFb3dQze9FhnY85YjJ4kyG9ErsymZG3EkAwvAmrboVQit9nR0+vep5sSBCSr4uPt1Ty59JI0C2BgIVgQRtd+4nQL5Ss3IJRqjIL5lFekN8oLEaoQE/g/OXh/2H5tVZ62oEAFtGIBK3kLCsfjV0t0UriarUcfEZXa/fSS3x8qW8hApSDUB9O5B7lPqoWc/LdnclNp1IfWgqggB+vrvhQyDBvfuzm0CcYb4ARMze+HIphL5CJaTVnAWMQwNxW+jQj0dQG/JMrfDloWl8OtuXaUF2QPs5AFfB/bOmrG7dVbebt1GUeMXmRkqgWQLSRR5cLQWCiOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/ZBNt8AZMJnVMXG6M/00wiCN149F/yfS0cWuSz4jzo=;
 b=LpZctUu3/xO39yiJ3+Z9h4xD0Ny7inNPiKQzwDm0K/6HkJH4GIsTD2cEnf7H9Mh2px9CI6YXuxYRYt+ihHTp8cUJetBiEUMr6ySWFuBaKRUC/fNZdYaFJYddVvy003YmBZK4q6OZ0gtMM6NGZ9YGD17ciM8wKjiZE3ezeUFuflJKr1gSUFXnCzl46M1LNGeuJHDq/YFnJLRs4qb975pROi29RmUw/EhCa7yMrJ5L0K7gmNWT7rGP2TcfROtTZ85UxM6xRT4oE454J0VdHDgvhbYmscZcYiU6limYLMvnGHQ3vg8IdKtJmsWdZr8XfTwjp1FukVFDoVngKRJ2jBC8WQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 13:09:17 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 13:09:17 +0000
Date: Wed, 25 Nov 2026 15:09:08 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org
Subject: Re: [RFC net-next 0/3] net: fix route flush for routes using nexthop
 objects
Message-ID: <20261125130908.GA187957@shredder>
References: <20261120200635.95798-1-stephen@networkplumber.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120200635.95798-1-stephen@networkplumber.org>
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: c525c60b-04bf-4633-7a5a-08df4af54f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|6133799003|22082099003|11063799006|261021121427099003|56012099006|261102123227099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261021123027099003|261022075727099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cxMb01ivmjKdMqPHrynwHNX6FnlBlezcoN81iXAf90kJfufWzennNhNreKdr0+a0zC3pVqafSHJuaml1wVP5379PVEv8ktakFHg2CmIKtMEsPfXAEbwdcmmX2CSLLdFBSX1NjccK8rdRn+ZspfXkEBfZYQgJGN955fAitZf3sbd65eOAXwYDi1ghwvi+GclP73V/xBYd/zAllAiVni5rnRB545p4lx5lzO4JuluHeJ4pGcBd94mYVB8BXmybBIWbV0noSH0DLZwIhYXmtZD+nw0pADBM+SDLjyTyBMRAYMuMRAppfwQmTGyH8lYQLJOYmW2QZrs5BNEsTuxrgalK4PjKisp1tIOmTCYx1CJ3zaC7ATa7DloZ11flXdYEZ8eXGRM1N9a4evAxKBhiRKFVFNE6ldp7CxgCso4rO1lSuY4D2XyWuXdLufWZKtFOb087qM7f3R0cKkG/FYXWU90iLiQPef64KKj8a/Da8EAItQ16nGeSGZsrdCWzFOamRil54W9HC1bBjOM6b7yLGSqMCQSWPPl5YVvSHzZmBjWK272VQeRqzt4gvNThLMIvvfm334vyx0Zg0vekm2IUA7Rrf85N/ettqGVz5XaCCis+MhKt1FZ1N9g2M7eUI7tix1hFKjAU0lWNaMmYmJrA5jaBL0TmdYHE+bC6y8iDHm8BTZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(11063799006)(261021121427099003)(56012099006)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261021123027099003)(261022075727099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rFPv91nanTehPDDtu2t7ISKi/6pQ5cAHXTXzXX+nRGTuWgdpZUvrHi6qwBL0?=
 =?us-ascii?Q?innqvHKpgbOZ7uRV/vtSG+SvLRIIHVc/LXP8TOReQEpQWcIAAdeUCBVPtthZ?=
 =?us-ascii?Q?CcLySgzkPtA8HhJ3DKALurztVSrrmo/DqVhZc7jOmS27cVYnRf0w8M1pSqYA?=
 =?us-ascii?Q?t4pkMYAr60at+R+XBoJwJuC3JL1TCmO5klWTgHNssz8ovaMMNEq/cKoA1xLk?=
 =?us-ascii?Q?JYbGCu/rEYgNnZVyFQQ7kK2rMnyYcdIgOfWW9H2o6VT0OTfdIrUdNNX17Pvo?=
 =?us-ascii?Q?XG9Ijym3GVFCkWeu9guj/2ehLZqKdiuBmrL+CzRnUwMTL99ONdvL/FUj7U6o?=
 =?us-ascii?Q?zLDxIjog9Qbwfnri2q6MIjvW/Fwif/wdYIMf6BnXieYcnizBKeN1hgahVrS5?=
 =?us-ascii?Q?UIEPSsXjXjU5ps1KC4qiQT0i1Io6TXUTVL3I5w6HUv4uqLOOpddMRC7+rS5L?=
 =?us-ascii?Q?thEaWU+bt7HCdfOSB1vFzPMFRGZiusOcq7DCtg105z2R4Kx60xK205ZjhNhP?=
 =?us-ascii?Q?gsWd+p0GLxsFcQ4sNYf08jqlQL9lqmagaCXUuBF7RgaNwMb7v82E22swjheV?=
 =?us-ascii?Q?hhwP3/RRPVj9YCttLXolz3/ojUQbfZ4YccIv/W4vGcFQS/aqKIaM8Yq3KEqi?=
 =?us-ascii?Q?2PjWrdap0+ivWxY/NlVjB0/Keub/pWlZoLyFvA4TwRW9MH6G/YzEcV4/Fmxh?=
 =?us-ascii?Q?R/jCAwBC6Gnk6lVdeeGWBtUaWxCvpMstJ+tATgwWkrXKHr2wVw9cVskGuSkZ?=
 =?us-ascii?Q?voEdxGxANo4yUqIbtz5Bskh2lX7qDPdN+Aw6S6SHuzP8a1bcnkoPCv81iOgm?=
 =?us-ascii?Q?M4LlZP5phugd/MGJi2RSdNRxx2gN+dCNbxRH3YyZxBdlo+oPz2UkzN5JfhHV?=
 =?us-ascii?Q?iIU2X26jJDALZpW7Ji8YuK1AsINye9TMrOrEPFkV4ncqCijBlR8/Yo7TRYKp?=
 =?us-ascii?Q?oQSg11/DFXnVS2h0aA/yen8AsgY0uJg5zt9I2os2OJks1X4YrWzd//QArTh5?=
 =?us-ascii?Q?Z7IcJC5ljr1mnOX1doF0aeByqsL+8XUx2RDWp84NazWrY73glKXtFGQJk1S+?=
 =?us-ascii?Q?3A2zoJg9HwQ/L904TBRu/t965Y5oRKnUcWtcfzoh7CinPqr71eEDuMugmAic?=
 =?us-ascii?Q?5CJ3lXJ5lgXs4YIPYeSFY/K4IsDyvxhkcSvgHa1ZUbbhTHtvbCPKYays62OJ?=
 =?us-ascii?Q?+YEzOZLkmrbub2UcebF/SedolAQlp9DR+nd8hR8xoi6ibmG1JS30vPD1Mk0D?=
 =?us-ascii?Q?UtIyatuTgH3TQS7fr84vstf6LM47CC2ykxBpYkKh79NQBm0AC3cpbWTmozki?=
 =?us-ascii?Q?lu2l+pfdqaHiAiiy5bnAY2mNeEa95osA68r5ayjp+r7BdnGa58/p59SoMyzq?=
 =?us-ascii?Q?dSBaT6vfdaMbJUHZDHwhlEg9+axnb/dJM1MC4/ZYyk/gdeX6PLhB2QfRmaj0?=
 =?us-ascii?Q?F8fANUAuOviPRUUPtgqr2C41xJueXbc+xcNQ1snrDTR9KpN/UN1JdSUcFAU2?=
 =?us-ascii?Q?mJyWMGC8tkPwNwSGgIYfemC2woPqE6+44k+UNA8FkPz7BVdYtfkyDTFwcc8I?=
 =?us-ascii?Q?uLEDYTstPu1t8p2v4/J+JvQae76E6gRCx9jn98wcDlItk8iUM4mdxLTcFcq3?=
 =?us-ascii?Q?ltrIw9saNoF5aU5lTQkfwqNmpd+rPouYRQRaPG9O9eaBGUEZj8p+RTwnRZZ7?=
 =?us-ascii?Q?hGRr4I8xmuAmXIswWz6Yi/UD0G3mbrbAk5TIbWhJVKcsL+Hh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c525c60b-04bf-4633-7a5a-08df4af54f4c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:09:17.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egMi/cfFOzBEGMp7t+TqBlSOgINTrfAQg9QtaLEnEid/2nDFw0E6jbZvGhE3FLHjtnIGL57SsEJE8JGFTZ3mEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

On Fri, Nov 20, 2026 at 12:01:27PM -0800, Stephen Hemminger wrote:
> "ip route flush" fails on any route that uses a nexthop object:
> 
>   # ip nexthop add id 101 via 192.0.2.1 dev dummy0
>   # ip route add 203.0.113.0/24 nhid 101
>   # ip route flush to 203.0.113.0/24
>   Failed to send flush request: Invalid argument
> 
> The first attempt at fixing that was to modify iproute but
> that is just working around a kernel bug. Flush should be
> able to be done as dump-and-echo by flipping to set
> RTM_DELROUTE. This always worked until nexthop compat mode
> was introduced.
> 
> This series fixes thes by changing where fib handling
> is done on delete. I don't use next hop id anywhere
> so this is just a proposal.

Comments on this approach were already given:

https://lore.kernel.org/netdev/20261118084510.332821-1-zypulsecore@gmail.com/

To reiterate, I disagree that this is a kernel bug and I am against
weakening the kernel's validation for the sole purpose of making "ip
route flush" work with nexthop objects in compat mode. This can be
easily fixed in iproute2. The current design is fragile and makes
assumptions that the kernel never guaranteed.

Also, Claude found another example that doesn't work with the current
design and predates nexthop objects:

# sysctl -wq net.mpls.platform_labels=1000
# ip link add name veth0 type veth peer name veth1
# ip link set dev veth0 up
# ip -f mpls route add 100 as 200 via inet 10.0.0.2 dev veth0
# ip -f mpls route flush table main
Failed to send flush request: Invalid argument
