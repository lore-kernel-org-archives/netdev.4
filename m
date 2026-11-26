Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684876;
	b=ZBNOhrH4gETRLtmKhY8wUlh1lscpfQolbJbQiOdLJqAesJGJac68NVOXbRKCgic7900U
	 LLb4mjHPUovGAyl0dP5oWTbHUXKfb1yQChsvl6NUkujOoDiXpUpE6QD0nsE+2AUKqt2gI
	 PlggqhOOeZJNGFuxonRtRTnBhdVaJc+nnVM35g1Ge5Qw1u3bf97Uc2Mt06yDplhBU4SvH
	 jGsBWyKf8+dwy/CzBQH4Zlz1dDE2lTAWyMZS+rsdqS+bS3asm5QM/vAcqOOzUpXbq3y/A
	 ArMA6+POmZoXFsNp686C7NVGDFp1PFjG2lbUIV9jezCWSDElBqLEchWxAXpy6Vbg7cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684876;
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
	bh=YFb4pmXBO/WWeZt4Snr3enSEykNqdiwf336VJBdkHZg=;
	b=ai/hB1Ebt7GD3pvpz4/lSXFTZmwtzmtegTeSOaGegfqu+4+UmjcKZLKMgBoqYcQr7wuB
	 /71MqFE0n94AkdKe+qdPy81+c5btQxT7XCr1TFyUKqAly+aEAbx8adtY/nuiQ/hxOrgfX
	 mfekPzOLtQkTA762H4jVxMvjmz/jtV4Mm/PAvmx+RCFUyGSclz/3uLPb8JRbI07uja1Vx
	 FeddZrYkSCMKWWkH0rj5V8fU1Nc/KH48IWx55UxW5ZEgDe1EL8En/4Dg/sWRecW+5KDGr
	 yjpiusfq2n3uDYZa/McgfeguYoO1euUPizNCNZJDDIp24oJ64P7SeFNmNy2RpLJ2hlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="n/ohYzuO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.43
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E9606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1E9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n/ohYzuO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnl25Sm2UFpoao4VpZWGwSdjxROMya+ebGZoL1OX2vzbOHohppVqYRN/CCFx/aw5N9PyuPFX/4L/KcstH0PxqP7mO7l3nx6lYWGJeDdgtgBu3FLPxTRyJFGcr1pmzQ1vxDy35ljW98IFjca1FEbpUWrSoDw/RE3qw0kw3Uk6YN7P2R4uRygslqixAoVNR7hDVwaPLRSoES2RO/+2buXvMQTQFeIoM6sNzckXsy8I8awDvARE7C9aG40DF4o1hUlqvEnQ1qp7ktBORNkc2m8Mix/G2ZOvuWSpPH+xEbnjl9yRDAwJgUxqAsl3fpTAZfp9naRt5uPWvGxEN5Qhs/USwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFb4pmXBO/WWeZt4Snr3enSEykNqdiwf336VJBdkHZg=;
 b=uJyt58AuGbNLOQy8E1QlQRS8tPoPxnJRythnIzOXedXvDqAcjJ5OQXcTAiHQDU8Ui4EP4eWPjxVRzlztIdjH0LBjOLRszAzzTZ3ezCEoY73jZeAX1DVl5hzsByyYh8ig5PQhEDPHIPcKtyo3lNEzAwtFlgYYcGoOLy5ToOqaeroChb3NNezT5U+nlDSyQMpK3/L+jrX+cJ5eccT/SFr4pnMK3gW81EWBSqb/3qIRvEgWD12kJwN90iUa+4tyQxfrdkfAxJtUZvLqnV/tuQPUJvLFip4qHBpd111FxMAGljEREn8axgfoXqdbv6LyvwKLYgZbm2Vhl22BX5XK5lxG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFb4pmXBO/WWeZt4Snr3enSEykNqdiwf336VJBdkHZg=;
 b=n/ohYzuOUkf73kMtygjd3CuwFptQGU2Sv7YU7cO8romTEGt/Px6m5a0+HHT0opECebAWGpO9oq2SRSDCPCLsdksbctLvf6mzoQHBzrrtUZ5xkKDubdijwLwDuCKnvHuJHAXc24N9cWZm7itXaK3sF/n3Mqzy1pOO6/C6wImlFXukc4dc3qNS+r3IhqR0WU4vEv6VqtkPUSL5y2sjehnQQhVt2nYL4DX0Zbryxp8Teu4A2pLK7nkIsmTfdOadr13nX6z8kFefcsofKkpE/ImsdfejJZSf++futFTzqm42RfbcYMUGcZqaprZy4cL0BAtlYbOUSNh4/HQ3mQd0UaGmSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by IA0PR12MB8893.namprd12.prod.outlook.com (2603:10b6:208:484::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:20:28 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:20:28 +0000
Date: Thu, 26 Nov 2026 11:20:20 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: anycast: delete the anycast route under
 idev->lock
Message-ID: <20261126092020.GA608373@shredder>
References: <179552107133.1345245.9532670970901182620@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179552107133.1345245.9532670970901182620@gmail.com>
X-ClientProxiedBy: TL0P290CA0014.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::8)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|IA0PR12MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f86f9f-d6d2-4561-da8d-08df4b9e82fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8J0grtoUx6odXHKn5U5vlmCs+dS06clzXrKmoCLPYRKg6+s0SsA1kPu0YnpNPzrp4GawrHmOPR8Qxbw4NdWAtIerysTXzDg634kqIonV7UDbEfltHQciD9wDaAnJMvxZj/VSN5fM6TAi3LDKEWTMKLnCAIdhPBBU62MG7aZnuTP3pWcHTxDMqVvHCm8q7LMOuMtupFYD3nvuBsyFvb6pDopRz+Q+0xJvp0fbu97noyoagKS5F06IqJ4IfgS0NaROiJZv24RF2GO8ugGREiSFWhrFZ/gXJwaitFTg8TmbbZSKCjEcRGxPVI3MpWsfy47p4s4f9Pkj2eidHPCxc8LsCMEKpjtB65hg1X1WpyHtLVm3dzf0WzQ8v1xDjJthySc1Stw49+QaxG6nMhXVCHuZRiWiNoGD+WsRyzVD7rLvzpJ0vF1I+Liklok4J9+LlnEVZvexLap/a6+gMx1Kd1koTl+mPg7JoM8ow0x9PYWd0MvYpLWkxK1q/abamVpzPmKmOzfnuF8uSaWyRNDYKF6J5fvqLUGrdX6y3alNIJTrMi+6tHZFjAPpWkFuZc2pxt2FnoExKtnKZ0RxhLACvZzhNZ7KmZFsZUO3xafCT/xO8IuiTvMA5RpaozgnVB9bc8oDSOAmMAxq6CHQv8bhHzEBhNuSFl3JEJjsqll34jtyJbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EcRwRoS/NfQNioaYNw8wSZk1aDxif+QuMbMexHYF9/ZmJjWxOhHidOBCXZjM?=
 =?us-ascii?Q?ydsnJ/Yk/UcSMl9KFg0iNc5quyJgrXie+APiNzBNQocEc9NKu1LSiqekEtqe?=
 =?us-ascii?Q?QNMsXl5pagaNlJRkhDEWgK2y8seDnIFtMsKR2GyZENiTt3c15RsSzHRe37Gp?=
 =?us-ascii?Q?9imiO4SGgGbtY+iqrHsg0OZon1Qo5qKzfyXIZ0OV7Su2G5+r4xBUubQ4Ilsh?=
 =?us-ascii?Q?9roVyVy8s5Wd7d3DLxcrd8Gs1BdFH/abbTQY6vD9JbSXhE1kUb8Lrgaxz61k?=
 =?us-ascii?Q?T2gS25IO2rxbDeVzw36N8dyP9DZne9dRUJ6+7j4SJ12rlQCUUKNn9cPUsOHL?=
 =?us-ascii?Q?OIMGR0j6pDOGkQY9MAU68uvaTAfWkS/siLRungPjGqgn75qqUTjEoQn1TI9M?=
 =?us-ascii?Q?jFI5uIlcTMjBsW888yanUl/iGbPxaMZ+pFRszzrzcpR6g7MF6jJPbs4F4CKc?=
 =?us-ascii?Q?oAd3A0ur5mMaMjhn0+pqiKLWaYOYj8u5r5AfpkCqMG+A5q2jOL00/dL2w657?=
 =?us-ascii?Q?Wq9Sb491U4Hrs/AyHWrq/w66V6Nkr0Zv9bh9vSl62i6y2FAbjoJTIGHF2x58?=
 =?us-ascii?Q?YODhRV+BsAgp0YyC+GaZ1qwbfDqjyKm4hSn2HPn95wHQSVGUdsEr+J9gLQAL?=
 =?us-ascii?Q?JXGRWniVkGmuJimW0Rp3Uja1fseZXSDkZjxCSfkk+JIbgBl0tnbK9wH8Tkjs?=
 =?us-ascii?Q?CLME4F8EIhPYxpBE2SpO+b5JJ6nc3n7vpiNokB06UXTIwAqu0RLfYsRvRdeS?=
 =?us-ascii?Q?V0IQNqSwOANDZyBBEqDVBTnR5RRm2vfSi/j1qtMlebIaBoRFs9ICNAdMf9Ny?=
 =?us-ascii?Q?cBJdkoCkSLzHLquRAEs9Jhz8Zqr6qLXIeYZA2RVi0qIF0HFFVaJGVqOJdkiG?=
 =?us-ascii?Q?JUWHuynVzWZC8RY0PNgBQmW9g/HlCBQagsMIUfT3PcQgsy74wOk3Qp7byOUf?=
 =?us-ascii?Q?eMvaTF42s1HgvJw0lfCTONuhZVmA5RVlX3Fzana6fbTdzRvXRhMVNZRbSVps?=
 =?us-ascii?Q?RV9Z2gpZg2h/9k+44q8WQsL6/4xPlgxvkwrYKgOtVqHUmIpO4XBqW/T94CLn?=
 =?us-ascii?Q?x8bVH2RLLkUQwHWS9LF+tdCnNIifI80/fdzvPdQVHZlKurwikQ/pUGFvwbdt?=
 =?us-ascii?Q?TLxe9Zea6wvKjy1+ow70rrEAWTmvXhGeeEeiriJzz4VlMAVBMB9795UieVbt?=
 =?us-ascii?Q?NgZXnPH7W05Q8s9FCbyPMpJtdrJPIiM+cxeCGGB0GizborXtFsEXzGMrMwt4?=
 =?us-ascii?Q?+dRKmO+ptKFcXNihZTbhbAChxC419+XyBNnwEpjqsikDOGw16rEPbPNw7cWM?=
 =?us-ascii?Q?+Lvab/y0B/qvIexzb/AYh/gQVjfOp1pnd+8+Jp+mOfkuQE7PSzzICnC6cKaW?=
 =?us-ascii?Q?auYWF2A/WuQTzRRWlvmnv8ZevCw6+brLzWeCI+MGWW0MbgHQN1usqz9BFQrX?=
 =?us-ascii?Q?LWFXXwexwr57BhsCuWxj4aq549YiO7I/8TkFtWohVDNY98zGTI3luY+7X0/V?=
 =?us-ascii?Q?/Cm73ZtvLnnkOHZApeCCB0TNWmSFesnpuoYWQ8cdgSKk6n52pUrZJm5jH7lB?=
 =?us-ascii?Q?mUAppIpaOqY0VfneaWVUsJuObvoylVQq9unPzET6kf9/pp4OGIzP2sW2VJk9?=
 =?us-ascii?Q?/5nShcw6BRi8ggcAnKRZhK6nlxMUusrP9fKl44EGsmP7lcZA9vxrmxrobuHx?=
 =?us-ascii?Q?8+yZN8yVNUFT09q45+kRwKZErIa2TvmNc3pJOHz7kLWDSyUs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f86f9f-d6d2-4561-da8d-08df4b9e82fd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:20:28.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o72thmfS0cH1uD/c77mVIzlD6xEl9c1tEyBpmJYNv/g/7WmLeedJrciVfOdgreVzGt4B4GIp6zY6xg0ZEa+jDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8893

On Tue, Nov 24, 2026 at 10:32:26PM +0900, Kyuwon Cho wrote:
> IPV6_LEAVE_ANYCAST no longer holds RTNL, so a join of the same address
> can run between the two halves of its last leave. __ipv6_dev_ac_dec()
> unlinks the aca from idev->ac_list under idev->lock but deletes its
> anycast route only after dropping the lock. A join in that window finds
> no aca and creates a new one, and its ip6_ins_rt() fails with -EEXIST
> because the old route is still in the table. __ipv6_dev_ac_inc()
> ignores that error, the leave then deletes the old route, and the
> address stays joined without an anycast route in the local table.
> 
> Delete the route before dropping idev->lock.
> 
> Fixes: f7fdf13bf103 ("ipv6: anycast: Don't hold RTNL for IPV6_LEAVE_ANYCAST and IPV6_ADDRFORM.")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Note that:

"Avoid having more than 15 patches, across all series, outstanding for
review on the mailing list for a single tree. In other words, a maximum
of 15 patches under review on net, and a maximum of 15 patches under
review on net-next."

https://docs.kernel.org/next/process/maintainer-netdev.html#limit-patches-outstanding-on-mailing-list

And according to patchwork you already have 17 patches under review for
net.
