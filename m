Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795358689;
	b=zyd0xCWl6LFmlvXisQLTgpUwfzCE7W9l/db5lah/sI/tFng2vZPYGitJBdSDdW4/Bv+E
	 pwwFtEMvwxPEcGIxxaxIkecZNGgpsvlUWhM1xkJdKKnKR8SxEOeNBl2TQRs9TSHPWg4gT
	 nxsBSdRVGbc3tyvI5d0pWXet+16+l6PMJmYmeKnSjjfgh2Ox6e6ARbAym5U82Xz6HAnQ8
	 BpoXe+4a+5cxrHfNgSHir/zqkYxG4BuGTMPRzspcN+BT7xzEedgJHfK/vr5gxwUWD10MJ
	 M0OGJE/rtHJKDMMXHxuqBECtLyepRLX2G2K78G2MLp3Q65CHuolJrfXXcL1pyn3zyjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358689;
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
	bh=eBjUPVHWryoZjrsWJOLKpXubiIEUKvlaU1ugK15INd8=;
	b=kghofRgxkhqAxMrBjk/rhdS+kMBWhBy6LJyMliyZqnxmwqpF0wee57Wgt+tZxNaY0VLn
	 Z+Kn8Fl4hEktRp5yGeF2yHVG0gv3NUvYk2SUv3ZvTGsUeU15N4zyk4+2/5kmug/ReDSOs
	 V4sFtwjRJWzwAoe0XZk52v5RbkDCmL/T4/k0fSnrVkwkeP+KpNILKGNY3OeKYP4xDTFbH
	 0JWk7Xr/6BufVlMHH1IFPbbGFGMLJitQ9EINhyHq8pi9DPnv71MJ0JFpjPlbaeUcv78WG
	 RAjWh2jNOMMVEDNtvZynKOdfrj4odQKG/yBNzjfnXsZpaslBM077xOZtgrhRSJWQi2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QdOC23yH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.33
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E0A606A32A;
	Sun, 22 Nov 2026 14:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QdOC23yH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBIG4322IHs7Lj2U5/Bs9zqaduqxB4peOFKrKARXVBIS8WXkCnlAJdq8F7l36aS7M0cmx2+SHa+YV8lkuUAj2e0bDrZhPIeZOLlKdQ8XQYuwd0Iy4Awa3fyTAuf5S0um6fFqotuoKxW+PGdOuuA/m706LU7BfP5Gqh3eWqz66OT5hRMlU2tF/Qs/PuTbQBuPx8suUAzivWQgF66M/7NG+Cz3Ev4jIGPTzGo4Zl/KvsXTXBhxSkCLXuGYuGFOrIMZiNDm7qcNwUbFSd3/0iMNVNS7+8Bwu6TcAdtvMa2Ru9IndZVKcFswVPn/qAeSBMA9Di/ImN3p0K/1CJFmphHbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBjUPVHWryoZjrsWJOLKpXubiIEUKvlaU1ugK15INd8=;
 b=wMSgro/6BYy1HsUak20UUMe0cksB4XwqHPgv6w7ieDlBQQvFLLwt3BJ/VOtquvhGOwxXm8IpGI5jtozFByuOqbyTqYLYal1imTJ/7954oFmQl2PPZMDS2QpgyqvHRxZoB+LaoASTsNAyJlKcQGCsi6hUWfzMYmFfYxXL+KPVPG7y7VQCiaSJRuT1iSynDsV8wR3eaJVa5RnY+Ngg4BVEI98igL37DB/ouwJ/QF6o1NmxTZjif6Z0aXQOhaqD1b+bR7fGwMvA6fLV4t/Sroe/L9zVHbqgeY3OuLZYzPwLdRk1IMtLAwF844wVeysYw1Ku5SpnQtBG7GVOiuJk9GIXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBjUPVHWryoZjrsWJOLKpXubiIEUKvlaU1ugK15INd8=;
 b=QdOC23yHBWNBHgRb4k2sWe2jTjRwmYuKwUxLONu5Uu9LE54SH/3tvebZoBqFyF4v/CSzSPCNZC4fNWgz+dzQbTrLWhwQtyZYoPocu6XxYn19nKpo/Zdlsd55OmxfvDk2+05T96q1ykcl+09WPJn9b7yKW9LEzD930rpeNgI6QHx20P4DM7j/F8qxN5HsIaDO+CRRtfEKh5oJd86kUV/hW/WVELcUNBWyPJBGGPeJ9ZFkP/yOdQkd7wIx3S8GoI/A2RcJWKqUCztl1ZA1qzC+dWt+3txy7KCoew3am3Y+SR4+ZYsylHuVbNSyJyQaD2S4Zy6blve42lZd/CPpS7EHAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sun, 22 Nov
 2026 14:44:44 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 14:44:43 +0000
Date: Sun, 22 Nov 2026 16:44:35 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Binbin Deng <18983559317@163.com>
Cc: dsahern@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] igmp: use copy-on-write RCU updates in
 ip_mc_source()
Message-ID: <20261122144435.GA2918036@shredder>
References: <20261119125112.540125-1-18983559317@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119125112.540125-1-18983559317@163.com>
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: a556ed0a-5a31-4c20-2cc2-08df48a72570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261021121427099003|261021123027099003|261026121527099003|261022105027099003|261022075727099003|261009221227099003|261009223027099003|261009221727099003|261009220027099003|261009223327099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hCcKTQAUfj65kudzYrbJ/tpsXh2OigIF4h5N9VIuUBAvG7KZ6tsLfy6DEs8iNywfRTYW5wZT6JlAxGG4huhMAY9qPTRriuhMu9tR/QUyqUGo2MpjitKNGDG5No27r1McYGYwAz23WeAnd0ZszIOnTHqJ33hPHQhKcLd/Zvi+kyWPmD7tvxoFERq1ttnm2oLR7bA/1c01rLrI2ydZNN4Kwi+54szajSkwbTuyNgbtHWqlPEaH3URKpML5KhA8dOVIBJBcDzsSxfWsOW1cvTs6Z6/2Uza3jTa/ywixiLFl4Rkt71S5ugSrUSIgE4+Ggmv80AOK0fwsLkytq9TEhgPW1xpj+Z2yB+D0DuHvTpR6awcA7NOGUw8WeYOE91+q2VdVJmO9AAe4N3ehCfdS5PwwaT+I2GyeU/XDOWyIw1Z6EyG90MGwX06j7txrcGMRszwrlZa3HmX8MEoiF4Cwm4M2jJEYjtedvvW3RFPl2RLYvuQLz6AnQcLf5dFpPtITwiedOgkwrTznCsRzuZVpPvKi7n+251/OqbwjWVA6DlDhePU0S/py0wob6JFxXwJcoZYnphC4m4q9wPKRnXvdBog2egvUDwqO4qY/jMYMHltiK+TiBgue3CqHM/ZVYkC3U7mLICYzpcpfQKdf+xx7PUDBKAycwegw2lQKhnnxqzq8MoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261022105027099003)(261022075727099003)(261009221227099003)(261009223027099003)(261009221727099003)(261009220027099003)(261009223327099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EluVNPKREip/BUdPVlQhb1pbfXPrMPSUMeAF7+nYsDeYB3d8rchnhPJ4zIC1?=
 =?us-ascii?Q?qvqMerx/60Y50nsbj0esuXVS0PtQ/xmrFF89Mc3AkqJVWg6bVlv4grooaTdd?=
 =?us-ascii?Q?4jqnwHVvIwxjRuIB1B/DQob7IRo1oMGqeMBvUtT0e84Yz7e737BWajc8xdUJ?=
 =?us-ascii?Q?I4hRHh9Etc4e526mYV9mvWn4QdJHZ8Awz1i5kKTJg5X8rHEVhI/e+WO6eAOK?=
 =?us-ascii?Q?2Ur7q9gGkCM9iFyfS7nRoRICGTvs7+gmKPrzvdrYbo+Hr2cQbk23tg8PE2RY?=
 =?us-ascii?Q?pKmUp9gwuFwiXPUakkTqSupd5VZM7x2JEXJYyivf023XVrDPkVaZvfMbZhWD?=
 =?us-ascii?Q?Qe+Y4hSuDgJulo4TkEw4DuS+GC07LNSq0uh2OJn/1iqeZ6TABihXjPCSW08U?=
 =?us-ascii?Q?1Zbl+mLtuZGKFzo7L/bVB9raiiVaD4iARgRR36XNcxq9mk9nVWiyrcKe1hJY?=
 =?us-ascii?Q?hxXziLSPHD3h51quMMQW06XTYSE6stORpQVP3NnHBSRN3GvZ3MX0nZUlOwPc?=
 =?us-ascii?Q?CT7v6BuYhEUTLzEzK5bz5Lwcx1aMgha5gZgCa0NFnrYcourtBIajMgbSIviA?=
 =?us-ascii?Q?1EmOe94UEnBXgGI7zhLn3W8e19bVNm2asHkddD0LOCPrdNM86ofau+S8LC38?=
 =?us-ascii?Q?Fi6vh4L6rfF9kb0ORg6FWPBnrP+AYtAkXZTgwWmdp6MTS4jQkWWL7fERFoXo?=
 =?us-ascii?Q?29qcVfmUe+c+EuWOjDb8M97Ep4unCOLLzsuTEVyIRZBthXwPLSheMZg2DqV5?=
 =?us-ascii?Q?JoZyBC6G5s+AaQAPSRv4TTu4mcWQRz+UriO3dExePwvEzx/Lz+Q+YG0ATDgG?=
 =?us-ascii?Q?2s8EOu+RuzWXDFshOJTQTnJRJDWRaFJhRhD+3OfpCUZiprnJB3KBIGk8RgR1?=
 =?us-ascii?Q?7fIo4msy7/ha0E3548YfFeqxWGSxFfoEWg8b5x/Nssu2RbwzSvw3qGGES3dG?=
 =?us-ascii?Q?CuEjZZoaULHdVd3XgmgsCwCTm1qXRLcbJ6XAvRNRQRuI3XTgFnKd6AgyxdFr?=
 =?us-ascii?Q?CKs4MkXDQuJgYvQpAXM0hG5F5qKUmEYN6Sq/tl+PIR/BiAnxPUBv0pdQ9QdI?=
 =?us-ascii?Q?ugaG0mCKlefHUSGqXjWJsU4edxMTXliQmLJ/BPF9mkm132VazS1OnNQl0HAC?=
 =?us-ascii?Q?GyTOSVAWB1jKlqL/lBpeuVikf2wW3pWyYYn69fc7CD+43lp87V9NzD+vvEUj?=
 =?us-ascii?Q?87QeRc9eQOV3Mm6p8FZfZxA13cMCusEzWsqtHCMZI9MRiyUP82rDVoIJQ+D3?=
 =?us-ascii?Q?8mTVNaSsv/hTMThCfA9Lk64siy60S0zsbEMOkfzxs2VSWAGou0S52BePkg5m?=
 =?us-ascii?Q?igccbXhmcXwajJxkza7zx/vwg7/WuQUcR3BBKQ4M7Jkfa+dS1fxjPiMpMG0u?=
 =?us-ascii?Q?1gzIfoQRP2w84F4tAmL88u0gbZpSi5oaz+XI+27reBiPHJH2YHKWNHDPB5av?=
 =?us-ascii?Q?2M+ZbzQDvUsyq0ZrTrbWkc1iQAZxRp9VRgip8rhVrTQSM04E9t5hTnnzLdlo?=
 =?us-ascii?Q?aMMnKWjX1slkGJzN8107aPKZXyONYKVaOzpAMFIFsVZQ0vJTRPY0KOcwxLWi?=
 =?us-ascii?Q?nsncMUMb9rYST68wgonHClU8wBSZXY04LvCn7gwJMGsU0E6jBcodqK6HvwMn?=
 =?us-ascii?Q?r0ZoOba9Wr9vkmZJhSYCIX1zWCsJMvmV6hiyQxqWsBClM+rn4a+7GlbI9eJh?=
 =?us-ascii?Q?Az3mgCiQFP1k2u0DHUdXizCkkYMB/l14so5PoOb+cEKdp3Vh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a556ed0a-5a31-4c20-2cc2-08df48a72570
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 14:44:43.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myx8BYiH5sA6lOQurRhTw8BjH6BDc7ip4RbSIyHU4kzUm+iemk8CdZeCEFsartd4EUMoydim3q57kq/b8yH4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765

On Thu, Nov 19, 2026 at 08:51:11PM +0800, Binbin Deng wrote:
> pmc->sflist is read locklessly under rcu_read_lock() by ip_mc_sf_allow()
> during packet reception in the UDP and RAW multicast receive paths.
> 
> ip_mc_source() mutated psl->sl_addr and psl->sl_count in-place when adding

s/mutated/mutates/

Why use past tense? The commit message needs to explain the problem with
the existing code. Same in other places.

> or removing a source filter.  Additionally, when expanding the filter
> buffer, newpsl was published via rcu_assign_pointer() before the new source

s/was/is/

> was written into the array.
> 
> The setsockopt writer holds RTNL and the socket lock, but neither excludes
> ip_mc_sf_allow(), which traverses the filter inside an RCU read-side
> critical section.  During an expansion, the race looks like this:
> 
> CPU0                                     CPU1
> ip_mc_source(add = true)                 ip_mc_sf_allow()
> /* RTNL and socket lock held */
> allocate newpsl
> copy old sources into newpsl
> newpsl->sl_count = old source count
> rcu_assign_pointer(pmc->sflist, newpsl)
> psl = newpsl
>                                          rcu_read_lock()
>                                          psl = rcu_dereference(pmc->sflist)
>                                          read psl->sl_count
> shift psl->sl_addr[] for insertion
> psl->sl_addr[i] = source
>                                          read psl->sl_addr[i]
> psl->sl_count++
>                                          apply source-filter decision
>                                          rcu_read_unlock()
> 
> The in-place add and remove paths have the same problem after a reader has
> obtained the old list: the writer shifts or appends source addresses and
> updates sl_count while the reader iterates those fields.  This is a data
> race and can expose a mixed old/new filter state, with duplicated or missed
> source entries.  A multicast packet may consequently be accepted or dropped
> contrary to the configured filter.
> 
> An ordinary UDP socket can trigger the race: one thread updates a source
> membership while multicast traffic is received and filtered on another CPU.
> No special hardware is required.
> 
> Found during a static-analysis-assisted audit: candidate sites were
> surfaced by a Coccinelle rule, and the reader/writer paths were
> confirmed by code inspection. The issue was not observed at runtime;
> it is identified by code inspection only.
> 
> Fix this by allocating and fully populating the replacement filter before
> publishing it with rcu_assign_pointer(), and by reclaiming the old filter
> with kfree_rcu().  The socket source list is therefore never modified while
> an RCU reader may still be traversing it.
> 
> Fixes: c85bb41e9318 ("igmp: fix ip_mc_sf_allow race [v5]")

Given that:

1. This is not a regression. Never worked.

2. Not particularly interesting (e.g., no memory corruption / security
aspect).

3. "The issue was not observed at runtime".

4. Not a small change.

Please strip the Fixes tag and target v3 at net-next. The AI bot will
most likely ask you to add a Fixes tag. Ignore it.

See more below and don't submit v3 until the AI review is posted
(tomorrow).

> Signed-off-by: Binbin Deng <18983559317@163.com>
> ---
>  net/ipv4/igmp.c | 103 +++++++++++++++++++++++++++++-------------------
>  1 file changed, 63 insertions(+), 40 deletions(-)
> 
> diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
> index d56355aca797..fd067858dd3e 100644
> --- a/net/ipv4/igmp.c
> +++ b/net/ipv4/igmp.c
> @@ -2489,10 +2489,10 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
>  	struct ip_mc_socklist *pmc;
>  	struct in_device *in_dev = NULL;
>  	struct inet_sock *inet = inet_sk(sk);
> -	struct ip_sf_socklist *psl;
> +	struct ip_sf_socklist *newpsl, *psl;
>  	struct net *net = sock_net(sk);
>  	int leavegroup = 0;
> -	int i, j, rv;
> +	int count, i, j, rv;
>  
>  	if (!ipv4_is_multicast(addr))
>  		return -EINVAL;
> @@ -2554,13 +2554,33 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
>  			goto done;
>  		}
>  
> +		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> +			&sk->sk_omem_alloc);

Nit: Alignment is off.

> +		if (psl->sl_count == 1) {
> +			newpsl = NULL;
> +		} else {
> +			newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr,
> +				psl->sl_count - 1), GFP_KERNEL);

Likewise.

> +			if (!newpsl) {
> +				atomic_add(struct_size(psl, sl_addr, psl->sl_max),
> +					&sk->sk_omem_alloc);

Likewise. Did you run checkpatch???

> +				err = -ENOBUFS;
> +				goto done;
> +			}
> +			newpsl->sl_max = psl->sl_count - 1;
> +			newpsl->sl_count = psl->sl_count - 1;
> +			for (j = 0; j < i; j++)
> +				newpsl->sl_addr[j] = psl->sl_addr[j];
> +			for (j = i + 1; j < psl->sl_count; j++)
> +				newpsl->sl_addr[j - 1] = psl->sl_addr[j];
> +		}
> +
>  		/* update the interface filter */
>  		ip_mc_del_src(in_dev, &mreqs->imr_multiaddr, omode, 1,
>  			&mreqs->imr_sourceaddr, 1);
>  
> -		for (j = i+1; j < psl->sl_count; j++)
> -			psl->sl_addr[j-1] = psl->sl_addr[j];
> -		psl->sl_count--;
> +		rcu_assign_pointer(pmc->sflist, newpsl);
> +		kfree_rcu(psl, rcu);
>  		err = 0;
>  		goto done;
>  	}
> @@ -2570,49 +2590,52 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
>  		err = -ENOBUFS;
>  		goto done;
>  	}
> -	if (!psl || psl->sl_count == psl->sl_max) {
> -		struct ip_sf_socklist *newpsl;
> -		int count = IP_SFBLOCK;
>  
> -		if (psl)
> -			count += psl->sl_max;
> -		newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
> -				      GFP_KERNEL);
> -		if (!newpsl) {
> -			err = -ENOBUFS;
> -			goto done;
> -		}
> -		newpsl->sl_max = count;
> -		newpsl->sl_count = count - IP_SFBLOCK;
> -		if (psl) {
> -			for (i = 0; i < psl->sl_count; i++)
> -				newpsl->sl_addr[i] = psl->sl_addr[i];
> -			/* decrease mem now to avoid the memleak warning */
> -			atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> -				   &sk->sk_omem_alloc);
> +	rv = 1;
> +	if (psl) {
> +		for (i = 0; i < psl->sl_count; i++) {
> +			rv = memcmp(&psl->sl_addr[i], &mreqs->imr_sourceaddr,
> +				sizeof(__be32));
> +			if (rv == 0)
> +				break;
>  		}
> -		rcu_assign_pointer(pmc->sflist, newpsl);
> -		if (psl)
> -			kfree_rcu(psl, rcu);
> -		psl = newpsl;
> -	}
> -	rv = 1;	/* > 0 for insert logic below if sl_count is 0 */
> -	for (i = 0; i < psl->sl_count; i++) {
> -		rv = memcmp(&psl->sl_addr[i], &mreqs->imr_sourceaddr,
> -			sizeof(__be32));
> -		if (rv == 0)
> -			break;
>  	}
> +
>  	if (rv == 0)		/* address already there is an error */
>  		goto done;
> -	for (j = psl->sl_count-1; j >= i; j--)
> -		psl->sl_addr[j+1] = psl->sl_addr[j];
> -	psl->sl_addr[i] = mreqs->imr_sourceaddr;
> -	psl->sl_count++;
> -	err = 0;
> +
> +	i = psl ? psl->sl_count + 1 : 1;
> +	count = IP_SFBLOCK;
> +	if (psl)
> +		count += psl->sl_max;
> +	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
> +		GFP_KERNEL);

No need for 'count'. Size the new list according to 'i', like
ip6_mc_source() and remove 'IP_SFBLOCK' in a similar fashion to commit
c073d1b070f1 ("ipv6: mcast: use copy-on-write RCU updates in
ip6_mc_source()").

> +	if (!newpsl) {
> +		err = -ENOBUFS;
> +		goto done;
> +	}
> +	newpsl->sl_max = count;
> +	newpsl->sl_count = i;
> +	if (psl) {
> +		for (j = 0; j < psl->sl_count; j++)
> +			newpsl->sl_addr[j] = psl->sl_addr[j];
> +	}
> +	newpsl->sl_addr[i - 1] = mreqs->imr_sourceaddr;
> +
>  	/* update the interface list */
>  	ip_mc_add_src(in_dev, &mreqs->imr_multiaddr, omode, 1,
>  		&mreqs->imr_sourceaddr, 1);
> +
> +	if (psl) {
> +		/* decrease mem now to avoid the memleak warning */
> +		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> +			&sk->sk_omem_alloc);
> +	}
> +	rcu_assign_pointer(pmc->sflist, newpsl);
> +	if (psl)
> +		kfree_rcu(psl, rcu);
> +	err = 0;
> +
>  done:
>  	if (leavegroup)
>  		err = ip_mc_leave_group(sk, &imr);
> -- 
> 2.43.0
> 
