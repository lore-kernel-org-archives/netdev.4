Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000606;
	b=fu00hwCWimqM0PhG1rgd3usaVCYT6xnUai/gs/V7WdGrs3+c62zs7QJK1gANLcA4+vsA
	 5+RPoShgHPCkILiCpZvFJqVjGaS1N82Ka05DCMZTuAVGYIFjMyeQubmJKzoaDs7m2vIpf
	 6evCq0T3AmYL/xbgi42tdirQ4sKInGF67LLpEfrYTshMe5OJBj/UUZrwydkX4VGrdtEwP
	 W2Y7A2X0kePSy1vStmnfzMy/4cQHFIXpukwH2D5iWdbG21Jb6TK+B4MZCVPqpMlFKrvHn
	 5BGI2XQiYl9qk9VJVY5ilpd86QTEq31cMgvt6PXphg9d4Lda+LD675jtBwF9DAIzDZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000606;
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
	bh=y01dyxwMP0d4F3bPZ8lq6pdm5ZwU7ebwTCcraMeMA6c=;
	b=kW1kbun3V8XqeJRdpEgY+OvYIxW/3THFfMVS4AMXL+BLx4cUfkTZ+oy20Wup3EMPh0ae
	 tFFn7vBE4c5CYYNY0f20NfJSDO7MFWLETKOnGw7pk27+0DbpHsM9mlZ020OlLQuc+MsUq
	 pWkA60s9+gIw0Etli5z3ZgJKHesmTE6HaB5n3BJwFYsabXHkcS1iX9tt37rFDqmkMHIGG
	 5Rf5L1Zduk+w1NVPP0iRJnhdzCm6pZOaLGsP+nMvouj7J1DcjWq4kmLQih0fu8AwUi9sq
	 nHOwJ71f/90rXxdPpubbQvA2TANf7/fLkTXq/Tpyxbp48dgFFe3Inwr7EUpW7/iMNzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AkXkxG4K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.38
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A0606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AkXkxG4K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRwsuNn+fafU7/1Mb1toxNsmXtX94Js66MiPMg6Zsr0W8ORuPXQ+YpeXagwgiiuerb7nc3gedQ/FqOtVpVpPdknqYI3Gie6OAtdIznDrJ/xF/F52yyfrIpjkVtIzyhFHdHIS3Z0YqvdyB/6/CzG04Wo1a8U5s4+77GmGHtHN1oG3x47Ve04TWq0YyuhrhzLNe7TrAzOxdujtYbhdX8L9G7ltMqmE23doPzkRqE3TUjnuRtLEHIVDQmAmCQz2Cxw+fopY0mI7zqEMYobkAguUjtixzSKZnHrEL1WhUi+hPAj8xVSktdnMuzZgPwvtzJq1IjDxWQGo92CAvymE276yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y01dyxwMP0d4F3bPZ8lq6pdm5ZwU7ebwTCcraMeMA6c=;
 b=hy37qhnFZKKFo2+jT5YoU99zSK0Y4RTlPKgk/8ojLZZyJbuxqvIUoSznjO4IREgMYrwWMVq4vy7AUUh6Z3pl1YMGdvHhppH0SrZsPmfviM+q+nk8lchGTFBfs8JXcDex2tw4sJXuh46X7toH2YF6tMvJRvgN06zUkHzt1vGUufnpLyRDZaaFAvLl6tAbgRAPZanQi9dDj4RIif+mfdKut5knn646/Opd0C/bQ7Jgzof5GhfyRFIXlYGkL9IKqp6k6bwX/Iv3CFYHdt4IFNPvztkwGr556l52H3tTSn68IhWllqAiRVrkm929yuwvFvmEj1CH7M12o2KFm5ydTQp8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y01dyxwMP0d4F3bPZ8lq6pdm5ZwU7ebwTCcraMeMA6c=;
 b=AkXkxG4KKciOHCV4OXCaUYJCet5lVFTjDkAPc2mhJ4DOH/8CvDjEfKfhXXnZYqWgO68HG5ZiMjUAUzWhbAHQB+nYXo57d+2GioZoBXpWAY+8tlUXzL+k7zzdmScVvw7U+BLGWxddRDbuAUTsZGpcse65Nz4fXB8CrKnbnOR7ZLvPfXZ48Ifo2RZTJrVDJxxZhoPGmxdWpZEB0Lfq6cH/SsR2jOEfzgVpfxsRmXOPuxKFHiO8kAP+YioBay9J7rCv3AuXcIByTsMGQsAi14qOr4iHdrGrX+B+SAL/D2aEiijrNCMqv9ZUtJSB5XevL7z97ywItLSa1pjyt3pkoNFHGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Wed, 18 Nov 2026 11:16:42 +0000
Received: from CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591]) by CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:16:42 +0000
Date: Wed, 18 Nov 2026 13:16:32 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Chris Mason <mason@kernel.org>
Cc: dsahern@kernel.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	willemb@google.com, kuniyu@google.com, netdev@vger.kernel.org,
	josef@toxicpanda.com, carges@cloudflare.com
Subject: Re: [PATCH net] ipv4: don't let the transport header offset wrap
Message-ID: <20261118111632.GA1168718@shredder>
References: <20261118004850.52808-1-mason@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118004850.52808-1-mason@kernel.org>
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To CYXPR12MB9385.namprd12.prod.outlook.com
 (2603:10b6:930:e2::13)
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
X-MS-TrafficTypeDiagnostic: CYXPR12MB9385:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f714f39-c3f6-4689-bbe1-08df45656c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|261009223027099003|260925021311599003|11063799006|56012099006|260925021911599003|260925022911599003|261026121527099003|261102123227099003|10067099003|261021121427099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Z/t+zT++0ZIt0xliX6suDQXEK5tUzRhEdtgvjV/l3Um1u83RnLbVIOdaU7DOZ2nfKAGf3L8WcmqbmOryvujw8cDO5bHBDs0Paz7Pf/cNfuZ0q2F1F/s86/RI/L3mjrq3qKRhm4ATczc0vZNTyg7sUABWmn7lAf71Xb3gN9Hxbw6L/q9zRBVdQSyvO9jnrswABEbteTma69gYwBMgiGoYDm09GCSoYfQpD6zTlh0SBCWHhvYKuXLW7EZmzYY118FTc+fTPhhxye4gnvWnJgxKO9pP6E0jasiK+8HLoBbuCNYs1ArhYoi/xFkTghkcoc3nqn5Er9heaY/5mF5SSSWISh4msUiMLRG6CYMGxlz+nfq2i9BR4dMPhVywZWi4wAjkcGnTJeAuw4mXOuOjDQYcfOhqMtrkslfMmERzBHE0s9jbAiAiTQBArJIzYawXP5LCIjy+oSuvqlUfLPepncPbvBt3MnREDFRbPXy/78qRro4zvpBxBu2lENz03+j1SOODBdaWNo8feZJKyBZN6EGbMyVb6kKcK7Ow7Y1Ye5Pnw8O/UsqYLl/kJJRA6xgWM8erFuUiQVbAOpbjcBfD3tkgVwXZinTrytZpxLVyi6NYRGtweRtbJfWTCLwecT9jcmmbUd7JhKC0OfTUCJNs2TjCXqDKxsSde9LzXIxBePU4wSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9385.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(260925021311599003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(261026121527099003)(261102123227099003)(10067099003)(261021121427099003)(261022075727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g76m3PQXzg8G9aLbQlaWiYw4VO+x0aPKVqGggyl+GiuIHDglMMc9U+pAqUUV?=
 =?us-ascii?Q?NPxF9D2BQCdR/Tu/KrcgA7oIh3M2TmVPMwIEPUPoGxNlwnoV08hUNNF6p3xx?=
 =?us-ascii?Q?jZDqliiQcSrp8YVDU/1CIxQUJuokUMNJpoqfFq/xo3V88vXPfuP1/w9/7BiP?=
 =?us-ascii?Q?4QGS6BrSCfGWzEWDbbVfQPDwePJmidgFr2ML9JnpflBxfnWL4IZxKTEIrDQI?=
 =?us-ascii?Q?tcY3i2fLYSnXXW5dOOhn1I8IXilxUZUhSrd6rx4r0aW6m4JegOHG0EDMVGrc?=
 =?us-ascii?Q?J5odt3g0isKnmKe/6BwRXJ2JObAagzNdfRuO5Dl9unBEyFkFoFH6a3EZpsAN?=
 =?us-ascii?Q?EgPB9QhVvRnQ+4fI9G4W+tIJZJtdsm6zASF80Vo74oOIa8yo5Jas/KX5j+k3?=
 =?us-ascii?Q?lwRVPj9aobDX6M37PlteSWSbvrC6rOJYBVmJc82JGy1HI4Os/i0ZUCU58eDk?=
 =?us-ascii?Q?Zhw9SGp3bzNOMDxhHq7MhNgdD326ND513wDZ4tdB8VN79t+lFDdOUG5pBJRr?=
 =?us-ascii?Q?txGr4e0MjFbPuVxKTP4h624oM6/LPCUrDj3Y6a7inJOqxDv9jl++aK0HsLXr?=
 =?us-ascii?Q?IOCdgpkLEkPmRAxg5e244TUu/qVzWh5hj10oxzJAEjnIL2/BQgi7yhDdJ5Ad?=
 =?us-ascii?Q?RCht7QryBsOsu8fqHf2ht0GoeHDQn2u8zu36G/aJ6LYdsBNYwNruepaHVA8e?=
 =?us-ascii?Q?whczIXb3Y0YkwkH09Qbw36y6cHp378WZwri/+l9o/nJEE1TeJPpIpRuFXO1w?=
 =?us-ascii?Q?MjVzdj6UmpeqWfBkUdw6EXBJWzlpaUKMPnh5CgUBTb//SwSK/5UxX7xYTMVl?=
 =?us-ascii?Q?KM+eeXbpSAr/j02SlcZWHk4jycHrNcMMQ3sc+qLSudxfchmFe6gwVyZeRYzU?=
 =?us-ascii?Q?1mTNOMB0GeiCh5zvIJ2n7CiJBrFYDS5q2+aDCukjDl9CgV2izU+ZO2f+1NUl?=
 =?us-ascii?Q?MbCSDMoDxYplyxSQoYPmJCdn9+SWBrGw9G11eiN7cLPJQ1tMvzqUdLo9n6jQ?=
 =?us-ascii?Q?DQ6vI/Dy/YJ1DdJmA2IaelXSi/ffJ0QSiDsmT8FAc/Fq4/wPKYoqJAKFavEj?=
 =?us-ascii?Q?r2HlDzetZCDi7tZ4h052PDuxwpWewCO9zCmT9n0m9w49BPfXJ4/dsQ1+Bezi?=
 =?us-ascii?Q?mpuLPzHf5WCQb5yTodYVh9H65XQplLMnNsEgrabui74p1mv4z4gvzdybgbxb?=
 =?us-ascii?Q?82JFjWP03zYDHOYnISfsPZEPzaqcIaq7etO7Cr0uGo1SX/Y2oOYmY5zjOhQ9?=
 =?us-ascii?Q?A3oRvn07d9pn2zVTyqSj3BphC/59BGe0giYcYTx1uSmSWRJ4NeeiCzULMgG8?=
 =?us-ascii?Q?t0xbcSVgIqtiLWGVcEcmcK/HdSwMWq424mOKkUlO2KMnXcgxvc9asyFBDzSr?=
 =?us-ascii?Q?6SuB0pWGdycx38CTO7lRTHzyTtURGRwbVcr1VykzQWX98wh8O9hfiupW5xs5?=
 =?us-ascii?Q?kz1ufh631pZK4DZ0sz0243Vg1NqXsY/050QMdtf6nOdjH1D3xFsgKCNSyrPX?=
 =?us-ascii?Q?lgARPpBFfRjnHycZubxYx3LMGApbsdsnPL6fElV85ZvyAiAPSo5gWTA7OZSN?=
 =?us-ascii?Q?OAtvJvJ4WH1TZBzVimV7ZwM3HRySm4IWDC1RAMmrk9L59rH5AqXKYJuwQA3Z?=
 =?us-ascii?Q?EnQNNPLOLdSRu/x7Lqtop4RVixNILAfuPNvihBTlm6Vh/SiPgVHWKNwzEKp5?=
 =?us-ascii?Q?coUVonN6AUh6yBYsXN3PUJ1g0TzkNNsEmnQoRENK3m9sVAcO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f714f39-c3f6-4689-bbe1-08df45656c1e
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9385.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:16:42.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CQf38KFxL9Iwve4/YR8EpMsy09KzliCapz0hMlqWsdLXHmGtxY7Wy5YkqmL4nBOwg4+jxdXjMCjKqhJef/6vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343

On Tue, Nov 17, 2026 at 07:48:50PM -0500, Chris Mason wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> skb->network_header and skb->transport_header are 16-bit offsets from
> skb->head. ip_rcv_core() computes transport_header as
> network_header + ihl * 4.
> 
> These offsets are normally small. But a tunnel pulls its outer headers
> and hands the same skb back to the stack. skb->head stays where it is,
> so skb->data moves further away from it with each decapsulation. After
> nested decapsulations the end of the inner IP header can lie beyond what
> 16 bits can hold.
> 
> The fix used here is to set the offset with
> skb_set_transport_header_careful(), and to drop the packet if the offset
> does not fit.
> 
> The helper computes the offset from skb->data, which points to the IP
> header in ip_rcv_core(). It does not use network_header. So it also
> catches a packet whose network_header was already truncated, where
> network_header + ihl * 4 would look valid.
> 
> Found by LLM code inspection, and confirmed with LLM generated
> reproducers on an unmodified kernel. Fixed by LLM, and tested with
> the reproducers and existing kernel selftests.
> 
> Fixes: 21d1196a35f5 ("ipv4: set transport header earlier")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Chris Mason <mason@kernel.org>

Chris Arges is going to post a more comprehensive patch soon.

> ---
>  net/ipv4/ip_input.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/ip_input.c b/net/ipv4/ip_input.c
> index 9860178752b8..397043893376 100644
> --- a/net/ipv4/ip_input.c
> +++ b/net/ipv4/ip_input.c
> @@ -572,7 +572,11 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
>  	}
>  
>  	iph = ip_hdr(skb);
> -	skb->transport_header = skb->network_header + iph->ihl*4;
> +	if (!skb_set_transport_header_careful(skb, iph->ihl * 4)) {
> +		drop_reason = SKB_DROP_REASON_PKT_TOO_BIG;
> +		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
> +		goto drop;
> +	}
>  
>  	/* Remove any debris in the socket control block */
>  	memset(IPCB(skb), 0, sizeof(struct inet_skb_parm));
> -- 
> 2.55.0
> 
