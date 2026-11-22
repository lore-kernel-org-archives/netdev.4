Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795337242;
	b=FmkAz/LvXjFEkGs3vP1tj6Dx7DkcbgfyQHjgpMi/3kybcyKvzD+vDiN2A1Mb13jNgtQR
	 NabTegjwoZoSqFzb1zGpPsiqrY68hve1BfY+EV80CneJ+6qMRgilltw6GkG3zMQyPtoVx
	 dfjVkQihUf17T0JqvEDfwRUGqBV9A6oMCTQwRRTVH0g54KcKk/uK8DTT5X03Wks6ErXuS
	 XTVB4tBhf9ni/kgL/AG4FWNi8ipr4Si5pen8Jl9+blq8lg+446852YGGps8/9KMN+CPto
	 FUww+Y6pkXjn6S7Pz8ANVHkFtvvIINj8J3wNG7zyaO0ARQSYjbfRh/NyE6ZxZ3subiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337242;
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
	bh=jBmxpDZZ8+IH2vx9hoEo1/LM91/FMSmC1q6rEOU52s8=;
	b=KlobWBAOO+ZyV8fOgtdRi1CsspDr5VXcC9oveZx0K6oMWG7R8X4KS/Kiqb1QPea/mP/E
	 8UuX3ziZPM2pmupjIaPUtR++J2ZyhVdYPFJ9bfh/eabGk7509ovBsefBqVgwMtoggkr39
	 12IkUXnQvE8By0YvUEPVsVKTPnc4brpDlSsy4HPTPAacxvp6DSrFfjbAS6df0/UFGkc/M
	 hw3afjm07pZCbOA2snLIWXHaIcLcoyOPasYJOvFRZ7PDIVcPITTbb+HriQYdqSiDD9gQG
	 MohgtUdqR2Hdkp8HEsbiLSlQHG52ze3Qxz/VGxMHETjFXVp+H70XincoyieHB8MKIKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jxkklpVw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.66
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013066.outbound.protection.outlook.com [40.93.201.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00900606A320;
	Sun, 22 Nov 2026 08:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00900606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jxkklpVw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkpIGJUj4Pq3hdv4iCLTZbxcKs6yqHuKvINCKFkeOeGvKZ0UzdCtJAmVjk5jU5NCcFC+sJtU4XPQZndC0/qLu1Zqarj8B/o/40QjzPqxbhbAMdGV9GeK1bA6AUpl8kkd9OxEbja+hCgJZu5IRd0OuR5uGg/e5ocnlpFP7LNs/7bXRPdr12U/mPFNEjrnqAdkoGyV1hiGV7QMCYi+qXw6/4WUc+m2UKoA6aZ7sCYMS7+zqAiNWwwx2V3g3b4GU4lvUmfx5C92xU/wPp93w02x2ZkUj3kFkgfdaU5uJuu/gvbn8RqBhZLZW4K9vye9GDvaIGQZ9enG5W7YhB/Ii37OEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBmxpDZZ8+IH2vx9hoEo1/LM91/FMSmC1q6rEOU52s8=;
 b=VrcqQYE/Dxbt+DZ7VjHPv1cZa7HpN5BKRXU6WkW5z9QL33lFFj4XVtstdFrKnZpWKTR6TPt+UFIgxbR1P0BIfx3T2zLN9jxVFfJo/sVXImqqTseeaqqaMPHECCaIOCo+gUQuvx8ouBHNAwRYljMr0K/sRxJSlJh1BP7mnpP/HHzFmgj1xJftS7TFtQx0v75uGbu0f0OhTQ+G+dshAWjVrJa0j/pjZPO3uaJCbflAE76AT7KsGF6pztHVTmlNCKRGqvpmW4Hb9MYQI/rwaVy/FeXGrB497po6t/AgfkE37AxMV5ulEbBJPAJ0TCJa1jBqaK/0L1km6CPBP6ohLwckcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBmxpDZZ8+IH2vx9hoEo1/LM91/FMSmC1q6rEOU52s8=;
 b=jxkklpVwCqbKqHgxpVafZ7jBzHS7i+Y9DB/tqTMSZHPyXR2LYrMKSmQxJBWxy5MqfRHgWOQLgJa8xo+5z58xpzvsmY/t7W3hooDlQExJrjoGYOXxz0ds9HfdndgCyPXasVyoS2J4Fq+OtVvToeYclY+DrYIkvVGK8PDjYqJ5L0qaW25GHiz5Vp8d738Jm8+bB3vNhWrZ0vyZnMnxibScVE0fzWxifC7FyJ2s/WZluLHasw+drZrL3FFOU9aD/F/mvXqiOJWxotyVoJKVtoo0/Pe9QcxN95luOc0vxJo0xbHsl7EQyT7WaCBpkgnxAkkgyrxP8FI1eI2KtJyciq3UHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Sun, 22 Nov
 2026 08:47:17 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 08:47:17 +0000
Date: Sun, 22 Nov 2026 10:47:09 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ipv6: splicing a fragmented UDP datagram over an xfrm
 route warns in __ip6_append_data() and fails with EIO
Message-ID: <20261122084709.GA2656753@shredder>
References: <179497871649.630760.14878797494884573363@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179497871649.630760.14878797494884573363@gmail.com>
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e5f2f2-c644-4f7c-564b-08df487536a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|3023799007|11063799006|261026121527099003|56012099006|261022105027099003|261022075727099003|261026140227099003|261102123227099003|261021121427099003|261028144727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cvQmEAEPK9wIaJHAF2qw5UacYLQ0Xy2jkHnl732fnUO0YDf9d34m2FT+7VUiWQhUc+SnoOj79ubVRfeuQQKGaAdvS2y2Jzv3MiKSXbRSUIdKEEoWZZgZf46eQzdcoH4aLyOjTk5PWVJEXSDGPq2149e3OAPcvHlmNN2aFQowbC572YqtW2okMjS3jXM47G04S7mWI1CcW6K5BSlgwSPeqJfRR0Amu8BpBCFP9DSyjyuPmyzgAjQDa1RvBm6fYBt69VilDf2Ar5DFmElmKiZFIeQsKbBiKEc/juLToKr0DYIA6uKo46Yk25qcpQElu4T3B/3xma4GUHrE3Qg6EZN6Hgr0AHUYjxlepnX85NiSSH4OeiN8sQ0feCh3oLgofjSWFBveY9lO4L/U3VHS8Dmep2+S854oG1Ct3hI0l7k1rmONtkAjyd8x49Pgh5ZqNvlWqzw2o/Cqum3mQITf3cIszaI/rDhKU7bnuK9+yEHqYaybW/Y6FlZuqhW1p93qV6Zn1gxWte0QTjgUnR0vbtHMTyaKIGy7B0WMkqScR8VzT1GuErL9yv5banWVKoZfPOEfi/OjNzXYjZyQUKDhHhnPXZ8dlRzF4sVp+I+umtmxrQHJ2QBbwZYrKiZvr2GPj3XBszXjoh7C9Odji537HSuNACdVeLGwlcK9MLt4AS3/ZoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(261026121527099003)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261028144727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9DUodnCawC3TIkX4Bf1zQXBPQ1SI5ATc4pMvdTWL0Y+L6vTjRfygpuED2Dq?=
 =?us-ascii?Q?9bOzaGAK5H+Vfbl6yiO+3a3N+MwYRgiuOWxubwGn5XCD25ZtKSk0z1vnnNXb?=
 =?us-ascii?Q?qIV879Fb6c0et75x8VKBg1UnZ6cQGWXoHzus4zNN0fZFQtLKMujZR+92CNQl?=
 =?us-ascii?Q?95xnHaDzRCI/EVl5+wxgV28fHEMEuBlMpUm4CWkisBq6aSrVBfydW+Bjkb8M?=
 =?us-ascii?Q?TiWgqZhI3kobBGPKVVzf9YVwnC3Jnc8VqtJ1i9RmWh4aYfv1/Ij5j6jMUW1N?=
 =?us-ascii?Q?6wCHEgiw9T09lT0mavagXAbZfWWW8BdLTFKd8OpW4ZEpuXS50W9PnTf9j3mo?=
 =?us-ascii?Q?QuCPaSKNpuSuOqAI8BDJie6iSKu9bJN4n7lPLsvi3g2T1Mf8MeKlId4VZZpn?=
 =?us-ascii?Q?ttYQS/iRpzsSvKXxEm8X2gaSL5D4a7bjPXNm/C+DEoRmii1ca5prT9/ssHGS?=
 =?us-ascii?Q?1OOCk0KDYV8WwxeOLneeOwKYDl7zjLr+idnyz5H5LqbbSipG+sEXSBydYbk9?=
 =?us-ascii?Q?esRRI1QzjbVMnouYDe7EkdLchrPuHIt6DKxjuu/12BMVlqxFT6JSrHfrdfxU?=
 =?us-ascii?Q?F0rMGOumP+nNvAVBX4LnSp1Tbf+9qa2gN/JOAd++dezVL9W7endDlTIhFzJK?=
 =?us-ascii?Q?yKvgxfHoJA1RLHMXkPbsA2t12sMU4Ifqj664fGJkYLRc3tUamkiwS3k0cM3o?=
 =?us-ascii?Q?0TdF6LrwoDoBJcbpKTvM+DtvmPptUZpwTgUfDh0skYISBYGQWyNco1ONwy5W?=
 =?us-ascii?Q?E9Gvvcxnz243g/2Nq+u+IvkhsNRTmndhvnVRtOtH7q2/1/nxig03CYLSofDC?=
 =?us-ascii?Q?mNA4qI74y6Nnmdy6Z85QZqN/7SqIFrCBvWFJd5wg/213n7sOg6zReO3zX+GS?=
 =?us-ascii?Q?EqDHeOCWTqBCI0P7WyIRloTkZ13xBKLaLOpplTTEveUyIxLQ2jmT/9Y2SAXC?=
 =?us-ascii?Q?uCO5BgiYGu8G7VUvnJQNfKMQm6170SUnr1fyzBzsi1rbnDvvLBNSuHnZW+TQ?=
 =?us-ascii?Q?rWJ3og/J/vde9/Gavnl5Jmc60YLsxYHDGXq+/IUjhsfA+JvZ1UAtN28TWDIg?=
 =?us-ascii?Q?sXgc2z4wNywWx5cRvEDcEAtyejCPmx5E5REk2IxFXyss5rTp23SgflkMEkpp?=
 =?us-ascii?Q?16CkRGbtlxcVtuuDqAdZVh1BChu3NohGRz72V+xtRZwALpGMdSm/hYg32E7+?=
 =?us-ascii?Q?lJtAjCPw8I/COGP/gQmhMuYRtnYbKEqbrEK3g+8+1NeEHQUeHIPtMV/u6Oz/?=
 =?us-ascii?Q?vCWW28fv+uVn+ziEK/lOnm7V5/FNAN3EjMaJ5A849nv7nkSZEnpu4/XMB34j?=
 =?us-ascii?Q?vQE06yo/Rhb4MNxJj0wm+xuLHVXOYpyCyxBJaxHClmxEvrERZIykg626LCn/?=
 =?us-ascii?Q?PvZh9sUvWIvLyovXScfm+NXqTBkcEipriY9lnvnIkZVuE33ox6t7yaiAVT7k?=
 =?us-ascii?Q?oHRsB6bkao4rZb1uMMvsUK6yWeNY/+1Kx4j2S6QWjqabpVVnybiipfWbmu5Y?=
 =?us-ascii?Q?/AGe5vHtI1O28Di0ARja1onm4IuvzuzK3rgvXyu75vGWpddFCbu7EtWjcen+?=
 =?us-ascii?Q?U2p2Jq8RKSqafZcIr9ShGGcPf2AxhXOxSJqkT/6rk7PUiRoMRJ4WT5hQSuVM?=
 =?us-ascii?Q?x2uakLaMk3WE2WdSevAS2za7tWv/R92yHxUUFviyu9vPRjChexnBsYFRoQoQ?=
 =?us-ascii?Q?s8wlByXSDC2Jh3P0XRPAEPLVmvPJUZpNdQxV8KUJhuEP0KY3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e5f2f2-c644-4f7c-564b-08df487536a6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 08:47:17.6223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+AY3i2oK6350BB6hpncGJfg+KCGvLEwZOvRRh4bisVSmbxY50n8GlJHHsk5NbEFSpPMgEWAbRMIZKIMpEmj/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742

On Tue, Nov 17, 2026 at 09:11:59PM -0800, Kyuwon Cho wrote:
> Hi David, Ido,
> 
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that sendfile() of a UDPv6
> datagram that needs fragmentation, on a route through an xfrm tunnel
> state, hits the WARN_ON_ONCE() in the MSG_SPLICE_PAGES branch of
> __ip6_append_data(), and every such sendfile() fails with EIO:
> 
>   WARNING: net/ipv6/ip6_output.c:1796 at __ip6_append_data+0x17ed/0x4b70, CPU#0: test/115
>   CPU: 0 UID: 65534 PID: 115 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(lazy) 
>   RIP: 0010:__ip6_append_data+0x17ed/0x4b70
>   Call Trace:
>    <TASK>
>    ip6_make_skb+0x24d/0x420
>    udpv6_sendmsg+0x1f6f/0x2d70
>    sock_sendmsg+0x21f/0x360
>    splice_to_socket+0x8fa/0x1180
>    direct_splice_actor+0x164/0x6d0
>    splice_direct_to_actor+0x2b3/0x990
>    do_splice_direct+0x12b/0x1f0
>    do_sendfile+0x91b/0xf40
>    __x64_sys_sendfile64+0x195/0x1d0
>    do_syscall_64+0x116/0x630
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> When __ip6_append_data() starts a new skb for a fragment that is not the
> last one, it treats the dst's trailer space as data space:
> 
> 	if (datalen != length + fraggap) {
> 		datalen += rt->dst.trailer_len;
> 	}
> 
> On the paged path, pagedlen was computed before that, so with an xfrm
> dst (trailer_len > 0)
> 
> 	copy = datalen - transhdrlen - fraggap - pagedlen;
> 
> is trailer_len rather than 0. getfrag() then copies those bytes from the
> message iterator into the linear part, but the branch right after it
> also runs when getfrag() succeeds:
> 
> 	if (copy > 0 &&
> 	    INDIRECT_CALL_1(getfrag, ip_generic_getfrag,
> 			   from, data + transhdrlen, offset,
> 			   copy, fraggap, skb) < 0) {
> 		...
> 	} else if (flags & MSG_SPLICE_PAGES) {
> 		copy = 0;
> 	}
> 
> 	offset += copy;
> 	length -= copy + transhdrlen;
> 
> so length stays trailer_len larger than what is left in msg->msg_iter.
> On the next pass the splice branch finds copy > msg->msg_iter.count,
> warns and returns -EIO. IPv4 is not affected: __ip_append_data() does
> not add trailer_len to datalen, so copy is 0 there.
> 
> The branch dates from ce650a166335 ("udp6: Fix __ip6_append_data()'s
> handling of MSG_SPLICE_PAGES"), when copy could be negative on this
> path. Since 736b380e28d0 ("ipv6: account for fraggap on the paged
> allocation path") a negative copy returns -EINVAL before this point, so
> dropping the branch should be enough. With it removed, the reproducer
> runs clean in 6 of 6 runs and all its sendfile() calls succeed, where
> they all fail with EIO before.

Please send this fix with the following tag:

Fixes: ce650a166335 ("udp6: Fix __ip6_append_data()'s handling of MSG_SPLICE_PAGES")

Thanks
