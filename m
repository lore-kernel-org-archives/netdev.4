Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458420;
	b=GIwDlYN/4lKCwP40dRnGuvOiZNOtAGGo6wicsULAuUupptfa+Ak0qxrVtZ1o9XU2YDWZ
	 w83TeN9Jc8xkL67eJQ3tN8VXecZyoXdjtbw2CFNwqJTOzDrBdVZK9nUBUcDchsga5qfqc
	 pww0Y50Y7/OAC6xLc48mW9GIaYMusCUlKuJRsexuxxNyOF56jF1eWF/XjuUc+oPySQUnp
	 rCZKHlz9jZCt9O27by5pmcf1HhGeFgGHj34hx+S0pt+yL5o1bfmtC/Or60HxM5LndXitk
	 ENZ66oRMhyi7OEsDQdm7jht8d/rvFfJ8m6RMDjKBtG11zYCmQWgKSbqFxr36ETcAPpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458420;
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
	bh=K2nJStfnnz82291S89OZ5LNxNeQoV2VQ2lfoNNG7XVQ=;
	b=jpv14oxfiLAutiHnQSz80J5oYwfnRlhWwM/coh6lQ/1itH9jTq9lIHnYd5pZ6G9x4P+b
	 WRvufCv3JbnbmGsOSOCrPfi8dP0MY8RNjYovfrkW5l6JwIHymUVMuAwdcNa/dM/D5QJOP
	 M2LJ15aob52v37V+uWANtVMMqFtx+tjSuc5Xg1A79cFck1DnyXqwCFqcZddFxP81U3xhb
	 uUSt0FLfAXDBAsk8ndymJ0zIvifX0BJBUBSQtOD7wQ4y8FoyF3hGRilqaRHgX1HqZbVbi
	 YvhkU+Wo12s0uEPFIXYkFAz4Blt/Jj2IeivMtFn+TN6jBMLn63ti4kSeJ+gYWeo00mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SWeBVSUP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.43
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCE606A31A;
	Mon, 23 Nov 2026 18:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SWeBVSUP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXCR5/5lYnjf6RxsrsHpUT1OkfaNdP7eRhdwHgEq5hA5fyKJ6WRRqbe/yIkFtNijOIUl0yN6c/Au2gYcwuZ7imPZZx2yH4C5ashClarzLSsWfMOkJ87hdvGanj6/f0mCAU5gsezjezfr7mQxP1Db4ydxHvHcXarIWrmXSklH0lxPNlmLDX5H/tFYp1oXUIZ+G59HhyWtiqpoNxK+TH0K8V8ZeisZSE8dOju8YVQKfmuMLDuzKXC0P8U5RyqRwaQCHQaGOARKIT35TCCKPXvyUxtAqveCGyeLCOKAs8vHeRBmUQ0CfxaKFJUYsYoPXMtaPoJYn/qPf5EMBdId8JxJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2nJStfnnz82291S89OZ5LNxNeQoV2VQ2lfoNNG7XVQ=;
 b=EzXJUfqGYiciR3AwJJTM5UAweJAcLuN3IDWVd0q/Dpd33EalSE7ICeBAro6YpWGeeS7Ufb+TEU8MeM8A0b72UKTLAHqhYwmqMWiy/yumFTXFfdsjjduOG0u+kW/MozMs/qMcDLswi99SsjQO//MiENRDzDntOZb5wJZ6VajlQL8zi+PqfCJaMkGi9++eGaSJXbvCP5Chk3/5LfYFdQgCk8JpcNqGNq/m0527/IyTLOrQi6EnPNZYMU5CxCT+hx9OZJ3HTWC+Sd6Jqycogu0o0fDHRpRCwKqPgq3jn2NskYbWI2VduWuEMiLqiiBWPs4AziuWNKhf130VnbZ7ocYzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2nJStfnnz82291S89OZ5LNxNeQoV2VQ2lfoNNG7XVQ=;
 b=SWeBVSUPD9qCXgEDr6HQI+9eP5kTjUkJO0Ev9kEpxd3a55ap48jluyr5VHzCcpuJxWXzOzmDfRwZl3NJ9Qg+JeHJhz0g3RyVc3JIxvRiqTt4pDDOpNDTzfWq/liW0yRMAbevwtI/Mh8oLSt2mj+jRJzpUAPnsUVM1ZUQWZhUR2e3S1BG4t9b4KJYv4g3yWcrpT6G4I0MYftx2QJB7/2i8yshoIKZoGqoHWOlhHSBNSMwqUfRCnleoF6zZf/yEjb3cuFpGRRLqRGEvTu7Mkh2CGjELYRf59dN6EJMfrzLER9IQ0a1JRaJK2g1kg5dMfdSbLL7omyOdY8cTm658gUkLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Mon, 23 Nov 2026 18:26:49 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 18:26:49 +0000
Date: Mon, 23 Nov 2026 20:26:38 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: yanxia@cmss.chinamobile.com, netdev@vger.kernel.org, dsahern@kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	kuniyu@google.com, xeb@mail.ru, yana06070@163.com
Subject: Re: [PATCH net-next v5] ip6_gre: fix changelink conflict checks for
 L2 tunnels
Message-ID: <20261123182638.GA3579507@shredder>
References: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>
 <179544145061.3135.15862505318599577492@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179544145061.3135.15862505318599577492@kernel.org>
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d9f3d0-afa2-48f6-f574-08df498f567a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RsWzG0E/6fMgIn1nZ87yElOZH3uu+cZkgoqrVtlxejMda35ZYG5VFcVbSmhqx517+FQOOw03AJQoVQzYWuRSyQUwgDh8YHHliEEkRxUZgJBPNFFE688cyhvcm/f0VkOtWNSt+QDafc60ThqMn61w8Lt+A7cw1J0Rqa0SGhL0O9UEF9P/G46WCTltCRjdigU2M93bNA7l8tRjSTaOWWcnch9wGDs5SUl4Gjx4b29RRrcsMHAnjZ4L/R2MGgcz1hEPbFpyZa+4vOykLWW9Z8LhCknuC0QViS8/NR1PwvSa+cAPneO8NcuUzk5GCSyZ4HwvGl4xi64D5uWrJ9M6Bu07LtArKVnrMVqE6/HnJ1v4EkoHSjjUqrF41aaC1fDdEGq+SfddWSZNFscHBF2LgNVCTaHTOJ0Au1IvCrm9eB/jqdPpY7vZGII+56MEZhpTeWYgayS4p99BQS2tugj1drM6FIQbeugd3PhKqYaT5qDvPvwLbMaNA3Xs2c+Y43COBHUh73gJvXnd7lSvihvekM0Jo3pAcGabQVPZWlgQ7RMy/KU92Pw9O7gs2Yk24TuPoGANWEgZZpLj1g+FF0Mj27Bo6CE4oZ/A+AVS3/gs7T6MMybPNdEvHcW7L8Zp7UejN2GYQtgUwj68+EkkEQ+MbRuxoqHAuN45St1L01sha3bAzSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rUhD0l1wdviTFXCJHszZFu/55ge9bFTyRfPtcop9IEBT04ClmV+pCZSsEQ+z?=
 =?us-ascii?Q?fszS8AK4X0acjqiPWqtRrhm4fEvkvdkx9uMl/t6JAFKTBEdwLj635r0/GYDb?=
 =?us-ascii?Q?LgHL0nA88UgjaeTyv5HFh4cNhQgNd6mhLPj0cZZXRVelBKrNZ3HkLYPaBCXr?=
 =?us-ascii?Q?Yh1AJeRLPEYnB6DlPDPi0V5D/HgX1ZlA83Ksf8spjcBiWf9+Qvny17aYD3nG?=
 =?us-ascii?Q?eGs/EeiRtCfVaaT9QgRm9vHAbwCm4FGGxxDr4Ud6Jk8v4TK2no5Sk/XhYcW0?=
 =?us-ascii?Q?oQe5OLNmeoyMdr/ndCS3IMZCWGSN4hfcf6BWmjxL7mbV4UuyJW/TmbK0Ns5h?=
 =?us-ascii?Q?ptoBMZ0jAX0xB58D5S0zJt9bja+oodpzQ6OJ99yX7j9jk1DQg9OIkjfVqa1t?=
 =?us-ascii?Q?lm/xhEb/mKh1zdPQHe3hkMSjMJIsdWjC71Tq2v9UJVBXjznB5mFVlcVYjovO?=
 =?us-ascii?Q?/h4VmtLa0lGhrSxx7BI3MOtjCWY80o4ZApFm2Glbxdt7cfAL8bdZ1EBuS1o1?=
 =?us-ascii?Q?B0qUvww7UE4W/itpFZahk5fHjUEq53XNTw3vjcP1ZxlPx5TNWmdCcXfcMt59?=
 =?us-ascii?Q?RBt1GwQDA+tTJXn/JKz9u0LKCPJENf8G5rJ6Tzj8HY0vnVjDcvK7fk3y+n0Y?=
 =?us-ascii?Q?3OZxtyWxsDPKJJXYxCOfla5OVQlKWrxiGyO1KySHKLd4Etdk2u8yXKHNQlzI?=
 =?us-ascii?Q?stL4GDbJdbHZYEpEQ3/n0LjEEJiw28v1MNj9Z4VtBtuJ7R9evs5wGUyO/6Bu?=
 =?us-ascii?Q?zwIt267MwDF6WMJXbPZeo6bkyKMMEuXijRxUOlnqBkzyJUn3UdDTJCyHJfcz?=
 =?us-ascii?Q?WQwiGr2+ErJq7yu5E3/O8ctrncRTgJ1RGqrj2oykkPlmbKaI9uzfVfkzx4h4?=
 =?us-ascii?Q?mtRgIOx4SGRRFaYzWHF37eVIFukI7P20HyTrcItAkpq/gl/OSRnNzkB6kb38?=
 =?us-ascii?Q?3e6ikINuCeSyvaax0cyCE+V1WIsI/mq64/c6weRfC5C0BWQlarCdxi0l12bF?=
 =?us-ascii?Q?2yzQAZUQo+Rbygmgu5oaV3/7X5c8NUVfit0G4MfAHQEUhJLOiUYqOk763We8?=
 =?us-ascii?Q?1N8nNdAJk5wlmN0KGUQa5pXBqcAaiOU0J3jhi4kCi4oaGcYvo2dPtgxia3nu?=
 =?us-ascii?Q?A/yQxld7fzcfJMK+3uum9vbKlwVtPM+CSH/Y1GiroQzFvjuy9ojusu6l3AXE?=
 =?us-ascii?Q?v5sz5qQx/44g5l4IAI5uq4rhqOfU/CN3y/p6i7jxciig+tVx7c3qNlih2vGv?=
 =?us-ascii?Q?WZVrapNMwyeecPjyXob+fKejqqiTBx/8lo/5JlX08FaFldYeOCtrvgCKJb0g?=
 =?us-ascii?Q?/vly2WCN96jRqdrUDE6OE5/mA2G3317tRqz6+CyWVjrtxyHMtj8S2x6w/2Y2?=
 =?us-ascii?Q?F8STH7f9I2xZbFjQ3AkLfRK5XpqNoGcRFRLi0EIpi4rEzJ6y9iERyitEITCI?=
 =?us-ascii?Q?Fj4GUEPZXt2B3XdveS2eJkMu6di2Rd+UJnUxpys5g68EvzJfraNwBRzD4D46?=
 =?us-ascii?Q?wwxPDV3znylC0VeM2N8+urf9ESqcN0jxPDDXuuqObQ3nmydIqxAA/QIIfa7H?=
 =?us-ascii?Q?GzcaNB9WdeX0i1oPCgIhopAbeSGBgUnsTw1slrp3t9PhPJV9TwD2eqH6No/X?=
 =?us-ascii?Q?f+DeBjFFJlu5KA2YYHVEQH4uJZuvVUJBYJoK1QegCLTwUZ2JLDVJJD8AzRUu?=
 =?us-ascii?Q?f2v13HQ2B3NrmmPp921Il4hYE2qVnxIkqioaMM1Pg+T4vEgm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d9f3d0-afa2-48f6-f574-08df498f567a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 18:26:49.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB2g/WhJTeKYCWlKgEmLE/dPk8vwjaRrT6JxPHNgUkC+4RuFB02Em4d3XUvR4f37GSTtzxpNsQI6KLPBJMYcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072

On Mon, Nov 23, 2026 at 01:44:10PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> The commit message says this matches the newlink paths. However, the
> newlink paths skip ip6gre_tunnel_find() for collect_md tunnels:
> 
> net/ipv6/ip6_gre.c:ip6gre_newlink() {
>     ...
> 	if (nt->parms.collect_md) {
> 		if (rtnl_dereference(ign->collect_md_tun))
> 			err = -EEXIST;
> 	} else {
> 		if (ip6gre_tunnel_find(net, &nt->parms, dev->type))
> 			err = -EEXIST;
> 	}
>     ...
> }
> 
> ip6erspan_newlink() does the same, using ign->collect_md_tun_erspan.
> 
> ip6gre_tunnel_link() still puts collect_md tunnels in the normal hash
> buckets. So two ARPHRD_ETHER devices with the same wildcard parameters
> (laddr = raddr = ::, i_key = 0, link = 0) can land in one bucket. Two
> examples are an ip6gretap external device next to an ip6erspan external
> device, or a plain wildcard ip6gretap created before an ip6gretap
> external.
> 
> Can this lookup now return the other device and reject a valid update
> with -EEXIST? For example:
> 
>   ip link add gt type ip6gretap external
>   ip link add es type ip6erspan external
>   ip link set gt type ip6gretap external ttl 64
> 
> hlist_add_head_rcu() puts es at the head of the bucket, so
> ip6gre_tunnel_find(net, p_p, ARPHRD_ETHER) returns es. Because
> es->dev != gt, ip6gre_changelink_common() returns -EEXIST.
> 
> Before this patch the lookup used ARPHRD_IP6GRE. It matched neither
> device, so the update succeeded.

No:

# uname -a
Linux virtme-ng 7.4.0-rc3-virtme-g57f165ff2f30 #103 SMP PREEMPT_DYNAMIC 0 x86_64 GNU/Linux
# ip link add gt type ip6gretap external
# ip link add es type ip6erspan external
# ip link set gt type ip6gretap external ttl 64
RTNETLINK answers: File exists

It failed even before the patch since the lookup resolved the fallback
tunnel (ip6gre0).

Regardless, unclear what's the use case for configuring two such
external devices in a single netns. By the amount of reviews that these
drivers are getting (unless the patch is simple of course), I guess
nobody has such a setup.
