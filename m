Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616432;
	b=p3zbUmtOVPdyJaNiDrHOP23mvBko2kv435ulpDLQ1Ut7A1348bFLZ0K7w+JUY2bPpaQm
	 Hc5JsQQWFsw2TNW3JWRaw1vylAAavEYwmjqfYZG6MUT4Zu1xVQAC9RXFDkkxegbOCaSiv
	 EmEo0MRMEEi0U/3GwtDUNM204yLf71LgXKZE2pXFlpn37KRUdIvBKnziTHBe8LURtGALc
	 7AITXOOiymxZRwc0iJudKqT1sMTVQpAaWQ+z1xcR08JJV+ByM0yG2AMDlsC/DBak8sKwe
	 PTdhZAJCc8Piy07bzMmG695LVYjuT01OzW3P7JYr8MIgw27xr1N1hJlqp5cJ1i+LO+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616432;
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
	bh=q5TL+LPd6aWWBwTIjh+0mmnCkPqTUgTxaF5QuqaF5D8=;
	b=XgLBNzTQHw1LTgJXjuv+Qmiudh12625M5SSO0V2C+02dlOpwUa2MUg2/MVRSAB0uiPq3
	 +YB1gWJtiF3gDSI6c1dkqt6JPdJFLKfTTB/2twlw7YqLLXwrVY3dfkj6gVjYFSTn84r7+
	 08ao45LuSjKn/ixcVIWx+AYZbZTNk69xYDh8ALCUICRMi9OssQtxEpGcDADIggJfNtJdT
	 6uY0R7FVxM+PG+Qd17C7vuFh+ncqIyiZboX32B3gvB4V9ppSQE6MukNw+iIOUVOm6Fn59
	 Pwvgak6nHe1FMuU3WJc9VSNuBPRr52rQQHGjpbL4T3hHB1QvcPJx8q3VjkQQ1ZMoPow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ODapImrd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F197606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F197606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ODapImrd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKk5A/SxaCSihtBBMw9FEpyjimrk+7TnF59Mto8ZLnbZKb3PNQ23cwKjuCTRb4kaHrLfqS2tf0sr7XbVzJkz2uld6a9N3aM7qJdTJPUSuPzRvHfucrl1uCCjBlAfxfnlzzddEx4OdUA8cpp36XoC4InRDGOcY32QhbeEYvlnIUQ45SoHIok63bfUT8rcey/d9zXHDXkdvzd3gCo/+FnSLRR7SeNBhfXQSGTLHbXhCZ+p8Do8lbKTc2mdsp/QWdzHRD4HS5hWMTxjyKetbhcDwFLN7KBp1COlRfA/fPkffmAGETkcrmrmWb9BsPOMvHzi2H8YTdOfqmBIDLfzuT/Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5TL+LPd6aWWBwTIjh+0mmnCkPqTUgTxaF5QuqaF5D8=;
 b=sRht9t+cuWhKOF+wR9HMtcs5jsEbtjj5y4mijR0Wt8l6ISdsLZUYXzh2Bm7ZyYXKXUqcucyyVCA+NdvzBfrvilf/6o0OH9DPmKIa56bTagJ6b10U8cCKxHmieovHRL2tdBIyQolavzVzn4hyJIWUAnyvcdZWHjqynAL9tfQ1Bopit/XRFioGE3QojivVkgUoZeXmoLwGPn9OvBStvopiYIW9/Nkmg+CYbR0GpwnF47HgYg6xMS1ozjGdfrdRJMNM1sCsgsnbRUa+8rzOVhMLBYjC+iBstpWbdDs2SPqh3f9NekqTJMknn6ZHpCk0wsGWYy1UhOrSQZqjtsPEv2uD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5TL+LPd6aWWBwTIjh+0mmnCkPqTUgTxaF5QuqaF5D8=;
 b=ODapImrdEy7ugwt7tNZx9aiRH4Gq4gFHgMrslpOuOQEUGSH/bGa30/39rTHFXt4ngZ8IsxbTdyqRKwL5J9xX1PeSngQmCy8bRLeKiZUMoLjf2dKS0B/3GAEpPZ+BITljHjntNwhBqPBjH0f4qx9ikCvQzpfPoIINaqvKYXZpGIRmQN6wGQMOlFQbMy6SqFv3aU61R1vgX1LyOQnNDg3wSmbhgR3Tl5wcaQTHTl226ZppbGL5uBHwXYmtVXnSqIKAzxE68wNFnMCmjOeqRMR4+1XczTdM1Ni+EexuHTmHsLr5xGE+kpj1oJ6y2qspWFVCJgHSYHqj641uDGGPmizWSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 14:20:28 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 14:20:28 +0000
Date: Wed, 25 Nov 2026 16:20:19 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: reject released nexthop object routes in
 ip6_dst_check()
Message-ID: <20261125142019.GA251368@shredder>
References: <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev>
X-ClientProxiedBy: TL2P290CA0030.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::16) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da9b639-62a8-49e4-ea53-08df4aff4151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|10067099003|11063799006|56012099006|261021123027099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ce1ELM38uGTTLLJDj8SRjfN27gKdiICmL2n++iId6UD9lG08TKkFGkSCK0eJBgtjJ/Fpbm7tHcwFMer+6RWPXct2VSjcENgDfaal7tPbvXKcoWcu172Y3DpZtkU5OM5VJ2n6YFCNm9FZZvBEtYtGDJVNzBfIvCpf8O6DQ5T/BxhPeXMPPgclv/w0WOPfmLIhtSGxp4weixIgXiPsxyBMk3YYEQ3Uu6vxHwb2zFq9zj32FWarfLXLtAdWfonmz8wnAbNl0q5dNq5gJ6FB93zT2rBTEuiUzGJiR4Y33gsLLtQ8cJTU7k9ZlJUHCGTnGuADVa+rY7LE43Yu7e1H3vQtg4MlHm+iVr/aRav+OIU9Oq0NNF6ROAHHjTOktCIdlbfwJ+ccSkvIruFhsIZg1SDKkze21H+4uAUwNYjqfo9M64VbddnaoLDcJTeakR/fqv2aBJQ307fM9LfEWhbVQX69xbnEXy8eUgOeWHXLPof4Ej/+TUz9ZVlA82LANyfX3LlNcZaax1RgOFLAyquTH2EwKjz7v5M4gj5e1ZjDwr5muAbFjo2+uYseQMmht6wUQjLL6yM8lSp/O/7jvn3xTYPTai/wyYn1uhK2RpNRXuCvwnZVosr/Xf6uzE/iNTEzLt4/xEVBKa5dVhPjpMC4zZnGoLUFfdkxe5PKQG6w/lppGjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cuozyluGOCvQWnpkoVZSwRH5v3Cn7Kod/v1/1Yvo2sqQF4yu2TzRqfHgjxA/?=
 =?us-ascii?Q?MJfo8IqhcXPpycnqKeUkZU/MiVClirmZAuaXxVV9odxzQqE2za5jY7KN0l2Z?=
 =?us-ascii?Q?SlcJOvIH8IkanKCLuisCFVMj8M6K7OUnPBB81yAseIgeocKmMiRwXuS+x+3G?=
 =?us-ascii?Q?Tilq910O1vAp6PBcBHsQIo5OHivVvqnRfcrzKEBK7lBTMjQWkfSn2ORmiZkQ?=
 =?us-ascii?Q?dU+dOpAzObKKP01M9fH7I+0PPnOO31Xu3XWACGtSFSenU5epc3Bw91RFKqla?=
 =?us-ascii?Q?pLCVnHnguLSd9p10KHwON2ZWmYG+pY7pZehdJ01bXeeA6vRmq/LgKERBLUAr?=
 =?us-ascii?Q?TvvWYGYi4R7ERnsnNa6kkvyBvaPU5MggC++2Ox86ZhhHQtTU/IiimGi8/tVU?=
 =?us-ascii?Q?AzEZaO8JCPpFCv7yJx3qjHi8mPO4JyxCqa0QIfSArOzTKJMQTNJFrA1S1Fc+?=
 =?us-ascii?Q?+OnhvgHcXo4/40tfqdT6oLJ6pzT6kbl4frY1+tok8iEkUExJctmd3bhVXcZ8?=
 =?us-ascii?Q?me/aYcq2KRmxJkwQzruTuqSuZy6GtO8/N3zAZDex3f3CpshW31RexppX/DAv?=
 =?us-ascii?Q?bs60+I+Hi95kYrurunvUD/5xirsTZHRAhevcijIWwJ5ZSLB2BoebRW89AKiq?=
 =?us-ascii?Q?xnYW0VSodBSg6WBS6AsZg5HYWdZihHAj0oBXW4AoHKFW8UEY3musmILb9KNx?=
 =?us-ascii?Q?9nNmibCNlVe0J9iiZup+pr7683sl/B5uupDViBJaqQHAxMxiv3OQgn4jjuYj?=
 =?us-ascii?Q?7bmObgaTBpdPwHWs3bjnzZu4ZekhKIWi+Gk/4q6tPxnVcxS0KfPTrLbxjyT7?=
 =?us-ascii?Q?U4BpVcCP+VLBcNgNbbR/hqp53xVAK6Sjj+k8FgN5TpWEZJmfzKLMOzU1zsdw?=
 =?us-ascii?Q?XsfRY3sv7+t4FL5VtUYS+e0xLpx6Oo0xq04A3yu5CqqYSM0KLkdizGrWFQ3K?=
 =?us-ascii?Q?mJJOlP2tLoDg+OLSJlhwvCLT75gWnTSz+l4+8OtfceAMHgDyRyiJXmFGZuXH?=
 =?us-ascii?Q?/xwrq4ZDYReXb0CCf3wCt4EKA0yFZJEt5QNcMObfzujcFUO5WxSo8W5oSEQw?=
 =?us-ascii?Q?zyvkxHqf1a3h4F1VtmkSM3TZlcvr2FzDZn4ktTe+/RF6FdKohSrs+cGaduRW?=
 =?us-ascii?Q?zmGjo63jh9N67JG4h+boE/ymqdU5fr4f4pPsUIbdhNtnp3dfLnuIdG2WhZsS?=
 =?us-ascii?Q?ZJsAVDquCvNWfOY9emUgkKYZeHGjP3Pi1kz8uneOSvtU4gK4++f/B9ZNPj5E?=
 =?us-ascii?Q?da+LI/ShnVPAygcNlgSo3gNsl6dWSsmXvuBmLWj0Zdo+Q/VwE12rYTaM95l4?=
 =?us-ascii?Q?t5bTHBhRQsTR7Q8sFCuCduRbtFb/GyswsfqQoVEQNzXkh9HkqhJMrwXyS5oS?=
 =?us-ascii?Q?XG+lyYMArJfGGZftNK0XFwf3Z+XEbSZmAkP8TZ6WsZRc/oz95+mAsES+vFNM?=
 =?us-ascii?Q?WGFfBDNuj7OmsOuFAomDIOVA77wjYO+bwAXGSyR8WQqrmo+RqY+DfGyV6MGS?=
 =?us-ascii?Q?vItLuu+gx3otwNXJKwjzLXEn8YU4LsKOW0PZwuX28J+BGgd2Crq5J+gMrRXK?=
 =?us-ascii?Q?TdvWnrbNaBpntYxvDKXoN142TotpVDd9v3CyJzyxVBc/pY4ssyejXQGzcsi9?=
 =?us-ascii?Q?kAehUeyqzq6OY8wo1kk/Ff3wLWTJUuh21gUyE45qHBB+gBodUMA8Vpr/iK03?=
 =?us-ascii?Q?wf/akbO9LT9sqdBLU/GDV2iLX3HpJDlkjpDzhPsMUSucgaVYeag0A+ERIoEc?=
 =?us-ascii?Q?mbas5auVaA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da9b639-62a8-49e4-ea53-08df4aff4151
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:20:28.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/OmbsgqYyknkE8iaOZHKSyqgAxKrXvSY+Os9W5A+FODqnZWEPaPqUANNGra7KMSOwzERQ5C+WS10LSY7lC9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491

On Mon, Nov 23, 2026 at 01:59:13AM -0500, Qiliang Yuan wrote:
> A per-cpu IPv6 route through a nexthop object records the fib6_sernum of
> its netns, and ip6_dst_check() accepts it as long as that value matches
> the fib6_sernum of the netns of its device, without looking at
> dst->obsolete as it does for per-cpu routes without a nexthop object.
> 
> When such a route is released with dst_dev_put(), for example when its
> nexthop is deleted from a group or replaced in place and the old
> nexthop is freed, it is pointed to blackhole_netdev, which belongs to
> init_net. For a socket in init_net the recorded fib6_sernum stays
> current until something else changes the IPv6 routes there, so the
> socket keeps sending into blackhole_netdev: send() succeeds and every
> datagram is dropped.
> 
> Reject routes that dst_dev_put() marked DST_OBSOLETE_DEAD in
> rt6_is_valid(), as ipv4_dst_check() does, so that the socket looks up
> its route again.
> 
> A connected UDP socket in init_net sends 3000 datagrams, one per ms, to
> a route through group {nh 1, nh 2} taking nh 1, and nh 1 is deleted, or
> replaced in place by one through the gateway of nh 2, after 1 s, with no
> other IPv6 route change in init_net. Datagrams that arrived through
> neither nexthop, 5 trials, median and range:
> 
>                before (datagrams)   after (datagrams)   change
>   delete         2060 (2049-2064)                   0    -100%
>   replace        2061 (2059-2065)                   0    -100%
> 
> Fixes: 8f34e53b60b33 ("ipv6: Use global sernum for dst validation with nexthop objects")
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
