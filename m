Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176617;
	b=0rt28ZxCdZb4F2IItgSA79nKuPM0wyhYj/2eGQfAeGGk9Lx+Awx1/7/H4P4aAFYrYK8E
	 ZtvOl8uJ3LU29zgy0g1CLyNREGSO/at0pSBShuDhD9QRRnuj1oGJNlsFLCTvw7KBn21aJ
	 mTUBu/RU524ObCG0W8uGT65H+2WMjWQCe3gYKk7Sf2Te5NmyXdESK10ZWNoqblDqqAiO4
	 AhbiHa+hTjBxAshWZEY/hAifcFgvzBDdi6wE/gL0wByMzEhXUjqhT8CtKRftJASzo1U4Y
	 pxnqvNtyOwDtyTHC9kKaX6fZFDqPcPDu+DdZ6LZgaP/fBXhWVvErYFENTi0xIJ86rkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176617;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s2rs0plMO48j03OnCl+Ng8gXqswSTTEoHrnkgjREWjk=;
	b=LE6/aFckyRF07XPIm05GY9aB+BkHLlWjOz+MksuloOM4hL+RcmzhXgIM+B5dld4K3ycI
	 rZmvraCF40FMH96V6ZucJH0ZpHd9EvWjH7c/zL2tRCGy80okvwa0UIJo+2ue1HYbdpsYf
	 SXpISsBWc114gV1YLuora6DYpXytPtgN9tlrHSBpFQSPgcc8ZlUB/CO4byFTRB9nvRDJx
	 mEFrTOQ3j6DD85sbm0A65UvuhD2Y/golsZoqA/5qhwB05ZNCn8qhHIfDU7JhQsAW/qmtL
	 Yc6p7a6gLCJA4P/FOAFTQcVI3ysX1n8o+TShkWMgjAP/8emroCIzMA7EO5oABHiXHuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=aywTINql;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WEdgPjc0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E50606A32C;
	Fri, 20 Nov 2026 12:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E50606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=aywTINql;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WEdgPjc0
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAiLoB118237;
	Fri, 20 Nov 2026 07:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=s2rs0plMO48j03OnCl+Ng8gXqswST
	TEoHrnkgjREWjk=; b=aywTINqlOIvkub7v+om3dAxBkPJGM8BaS3ITaHHxclYeQ
	0qArSstfM++tdM749JhGTjGfrP/TLrrunr1E5tTWUX2lsJ9yrBz7xyA8k+MmF3/o
	IvMCN9AFjH4OWDkrzKckecJkv0JhWwcDxovfHrHZVfJPA7bA+rbE9PVi/Nzz6FPa
	ylNeY6hoKdCH4K4mIYoPr+RVx/qOBfe2BrYvpmGCcz/PaGQvgAUzmSc34IqKkrXE
	BzLlx4VoAwhZF4+EKBXa55LjCDpOqBGnxJhbrsKemXcaO09HolIXe9wEjw8yNupT
	HsmAyvR1wLZC/0L94n8Z3FM63oUjm6WG6QSSvw4yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=s2rs0plMO48j03OnCl+Ng8gXqswST
	TEoHrnkgjREWjk=; b=WEdgPjc07tC2rfVntxli4Wsu7yTJGdsnl3o026pYX0nHQ
	tqqaC4Z6whSXfGY2iDLm2wJDhxxNfSHY3+qPtBjtynqKnQUpLtzYVrfmIQ9yT+sA
	1Mayicvqtv0ekYrjlnAhlh1HS+X52a5dyCk/llyGOgfq16OsiVt6MsbHFwZOO8/u
	02BrePbrgfQrfHak8f9+JdGoFskB55UHKi05t6Tla+fPeVnX/N3Za3jtcKDci5dd
	611Ks2/959z01YI0Q6hQeRneOfXLE0bL9nivR+LZJRGLe1PXXl9d+mu428bzU4zN
	vEOYQMS+kN1hGt986/9VvCDFCCooDaZMzoIZhb9UA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j2knwrq3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 07:09:48 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szn5VhoGgrnMl6a9CkV/mXV4aLXuhBNlBAPfkfErEI8WbxNnsVhjFuddWYhuFn5evH037UW0cbvJU9Ec4VPvl/0GYBeGbcTD3xsdTa9F7RVJcjHhpP1Qxr6k+aQrmW+klBUxvaCj3Fo0KkpuzgFS8Thku2wh85rNMTJmGdb8B7qPMQINnkIFThsGMOSJCs4fguyvRyiVm1iYm4H9BmILnNelZIp5p0Ge6bFZQhvEWGtuBHB/blIt2TReqO0FmNp02F9/1yJ87tRrO3h3EUN3sAy4dAN5oTLw8zuITSQWNzw9tQJ7zftMswq3z6xbAnA8ZrfQDpJoy7KdsfWiwGaJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2rs0plMO48j03OnCl+Ng8gXqswSTTEoHrnkgjREWjk=;
 b=hn8yydLva5DsI87XHe/TvnqEkblmhC0xyn0LN5C9/KdsJ/vSTN54PQWDdzNAShJqRIRgIqpbs0h79Yj7G/dDvBG1UA1l8foUK7ucSkbXjA/5w99rUaa4dDUkdHmuUifeJQu2H4a8ao+MyXwx+7BohnAdfSakGkjgi9Wl+I+HJoxMjDFr8f/llBJOmZao5pqJRRPbXT8ya897mCIkYSSe1D1kltI3Ojrkii/uMMJ3CEtwMTpz5w0HzH4EfceIUm7rXyuBh9hDcPPQ2lRiRX5/Na+1eruMUmbKoSj6mNjCJQP14uQxbD7gAvWzjg4UTToemLuOTb4nzYRvTt4hDB5glQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB989377.namprd03.prod.outlook.com (2603:10b6:303:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:09:46 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 12:09:45 +0000
Date: Fri, 20 Nov 2026 13:09:42 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Linus Walleij <linusw@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taiga Ogawa <zectaiga@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: tag_rtl8_4: add support for RTL9607C
 tag variant
Message-ID: <awA2z07l0ZvzcWtc@analog.com>
References: <20261119165129.26693-1-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119165129.26693-1-adilov@disroot.org>
X-ClientProxiedBy: CPAP307CA0009.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::15) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MWHPR03MB989377:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe856a5-ff4e-4e41-f231-08df46ff2a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GUtWTpJxldMMQZxZxPhkJEEiIKnBrqvJPLvIreko7DYL5SgpGpuoadAf64+yslDEQf8gM6K3r+FqO8MAYpK6D/UDTA1yPRxWacqekfPPf3euvpTJvU7foN7WJ6fGSA4oCnfIt0q4XObrMyoJ+Ig7OFX7iUwpSw2soOivMwa8xex4o8YOy4mOO9nmylrswSXVTV6NC+4DiANVVuu8+3DJATLNhqeFDgD8HREINRWdosrldjLBDmVZu+CuRfpghcvV2dchNmA+gTt/kY7Dp/XrnmGES1UP1Ee59qNZGysXN2FRtNOql8CWOt7YIDkdQDMsbbHQmIUv0Ry8RtUx7div2cY6Shv/JII3HfUsYsxeDBnd1jIjzsVaxnmrhbbScWSsy0lZel6w9eVoRWpnKOx8l5kVoPcDNv0JngAhb2Od1mSwu7xz5lHN+TeXi99JRZG9ZEqlLpLUAetXYYsBAyG7pNNWoFkO+vSvXIOTqpCJ6BraIhT/CM0gt89io9nqMg8ptg5Ux5mVaT27+lrrwwUqPVHbT0H+LnEIt4SzlehofpTCRVdGA+NkMWn2Kp2WrQYjGSxsCG8YVWkxwr6mW/83WGTP5RfVgSDNk3MbkpK2+CGOxo42fRHwLXvCmjWImjR3YzB2IcTeQ2/IHHum5st18UbtwlPnZVjH68kdYhNNrU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGQzVHpUZGNEeWNHelJwNWJrVW5vUmc1MHlCSGhsRit0YjQ5REp3ZkVKa1ZG?=
 =?utf-8?B?RnUrRk1keG1Vc3hFdFdnUllzcVloNHUyYTlwTlZsVDIyN21HY1ptaW9wTElG?=
 =?utf-8?B?bjJWb3duRW80c2tFVXBIV1JwU09KdzdtbmpYZjN5WmJZcHMzTHQ3U29zbXBj?=
 =?utf-8?B?b1QxSzhLaXcyN2NEVVBwdjZjRGRWYjhUSDlVdDV2enBQNVBnQUpjWjhNbVBH?=
 =?utf-8?B?NE9NNVR6dW8vZU1kdlFDRDdmRjQzTTBnVmxUSnFYUTUvZng3T3llWlM3RDVX?=
 =?utf-8?B?cjE5SlVScGYwd0FteVZ1ZGw0WjdMRVBuM2F5WWthMVZkUitGaTgxL1Z0WnZ2?=
 =?utf-8?B?QnhJRlFRTnM2cnA0YUIyZXVVakJLRkNqd2U5RytHS3FLMFAvNEZVTGhFM0g0?=
 =?utf-8?B?WDA5djhyRHgxVHZNZFhCSEcvejZFejZxbkNuQzhjZjN5OTIybEU1SER3enBU?=
 =?utf-8?B?K2NENWJZS0ZZenptSzZLYklOc09uNVZyNEl1SnkyeTVTUi9QdkNVQzJ2VmhE?=
 =?utf-8?B?Wi94U3hGUlFlamJCeDZ5Z1J6RkozNWRHMHZiQ0Jhc29kL0gxZEEvVmRDQlpx?=
 =?utf-8?B?bFM3bC95YjdRWU9BVUJHSlkyY3hWekxsMnNIcnRJYmZ3bHZXNEZINXpoSGNY?=
 =?utf-8?B?L3Z6TXUwL1o3UDk4QStVeDZYUk9oNVUwaHpxaFJRQTJGbEt5NWt5Wk1FR0tJ?=
 =?utf-8?B?M1ViazlHb1FONVpseTVkNVJIbnRqUjFjQjFNdHJVNWR5ekVFYnpLZkp0VDd5?=
 =?utf-8?B?OENyR0YwWWYzWWU5Rm5vRWQ1WC96MXRXMnBQbXM1Rk93cVg1UlFMSXhUL1I2?=
 =?utf-8?B?N1VnY2NOVUIzK0lUY1ZXY3NFVkhkZ2RYOFNtZnBxeFM3ZnNlV0FFNHNxb2to?=
 =?utf-8?B?V01PODc4MUJuMnlVUktCdnpRRjd2UmxnUnNNSmEyZDdmWno3M1dVbmg5N2dR?=
 =?utf-8?B?Z1JOMGRuT2VvaDJBNVJLeGFFVWkvVVdnNTlNRGhGNVJlcDZYRGd4Q0NmMVVz?=
 =?utf-8?B?eUQxY0VyNVpRWlZIK3RsNURHRTAvZU5saERRMExDdEVPMVlPOFNNRlluSnhz?=
 =?utf-8?B?cjdJQzdFSXJ2UUI3ZlBKdHZvZlJEL0xVYTdJUVFQdjBieXdLdmhhc1BaL1Nx?=
 =?utf-8?B?OUxBb0FmbTZ2Nm5kWFdma1hpYS90ZFNkZkdzaXc4MjBLbElnU09URDBxVXZT?=
 =?utf-8?B?Q1dPUUljQURRaVFsT0YrektBNWtZT0VzelJYZHNmUDJmVjlLVTY3T2ZmblFn?=
 =?utf-8?B?K0VJTUlLbDluUmJPWUNNdkt6NmxMeDMwMUNhYXJZZVFaK05wL01acmZXZEhZ?=
 =?utf-8?B?bEhtUG1mR3RuQkxWZjFmTnRydXloT05JcGpaRjZRd2Vob2ZqOUhadXBWcUJC?=
 =?utf-8?B?R2tjaERaeXprZmIxa0lTcWlFS1NiRGJBRGM0aytWRnExU0x3dE5MWm9iUkZR?=
 =?utf-8?B?WUdMdXY2WVFhVXUrako3NThUOEJaWGxuaklCaFRqTnVNRzZTNXR6YUpWT3d3?=
 =?utf-8?B?aU9xUmhaOUlLZzQwZGpSekRxbFdENDRES20vd25sMjY2Znl6TWtNRkc1dEw1?=
 =?utf-8?B?a1MxS0R4L2RHZFVIZGw1OTNiYnFjTk1nRW5QRUlEbXQva2NOenJsQWg2T2Vu?=
 =?utf-8?B?UGcvY0czTFloRHBsM0FHWEpBWElOQllJS21CckliUm1xSzIrYlRzRXBKcnJL?=
 =?utf-8?B?UWtucGpON09zLzZJZ2ttRXRpelZvdTB4cTJ0RHM3SXYxbmJkMC9KbGpYY3h6?=
 =?utf-8?B?ZExtRXM3L1B1VlZ4OUx4N1pNaDc2cHh5UzdSMldHQWkrcmpUeDVFc0pMazlj?=
 =?utf-8?B?TnZxdGpRTXV2eU9EOHhJR1IxM3p2cWFWZWdVY3kxbUxwT0xHZUQyTWxYdjB4?=
 =?utf-8?B?SStIVVI3VzVWVzBZMkx1b3FCMnJKQjQ0UVBGRGZLRUhZeGpXSEN4U0RQNkZH?=
 =?utf-8?B?OEE3eWhqOWlIVU1DRXBSS0owVG1aNEsrbWVWK0g5d1hyL2VNNERIQjZHSVRF?=
 =?utf-8?B?N1NWa3BnMEEwRFpwVTY4K3VjVmh5dVZSanR4dG8xWUdpVnNqSVRuWnl0TnJR?=
 =?utf-8?B?eGIwRFpGekdyN0lMcVZxYXY5WjNLVEFGY3ZhVDRGT2lTYlBlQlpYYStOTWQy?=
 =?utf-8?B?R3VqdmVNVytGYmpiWTNmbzRDb21adFV3YWY1WkFuM1VFRU80b2JLUFgvcGdG?=
 =?utf-8?B?elVoRHcvUUZpa0Nubk5MYzNzaFdmdGgza1pNWjE3N0Yrbk1iVGVtODlTTG9t?=
 =?utf-8?B?dTkyVmtNTHpvS0owbXBNaDZ0eDZYR3I4MS9sSHp6M2U5Tlo3Qk5vS2xCV1VL?=
 =?utf-8?B?QXdTcU9YckMzdVBGWUh1K2dvMmg3M2kzdjJEZS9ENVN4dHQ1U2hrUT09?=
X-Exchange-RoutingPolicyChecked:
	R69WA5Hfhy5X9XUR+uUQnh44Ma+dOG+IAnSzLd92jah7il1lQGymV/1P23Szbgyjn3YAnq0Pg0S948qbkdlzejv3xE8GTyTRJ/nslLPoZOOUxjAnQWy2PULymHp8QYHmAUXFBLSLD40z3ypgwLHhDWk08uNJBxPweiTeK1qYbiuvqh/Tm2350yVQ+Wzg9neKBG2VYQwjPIKz31KpLo0LKHm5/4imCcJ6vQsxd4uFQwJYF7LMG6WdwAX8BJEMtS4OLzW0n8dQs/RldwBlo3TxApzACeqlYdwoBBoJwZLNE8J6xqW59cix42nK+z7zGvk5Rx/XeRautnI4C8B5yMawPA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe856a5-ff4e-4e41-f231-08df46ff2a41
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:09:45.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: froOfb7p/2SWnZGDIcFvJyX+OZrDSx/f2c4w5dHOdxHS8UhSRlVNw2bWsSg9JW5JTn5qYodfBe+fRfvKcp/3dI6ooutQ5c5h1TyR81SVmKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989377
X-Proofpoint-ORIG-GUID: R91ZtLPSx-IFPq-o0Bi6Mt-54HV9-gfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfX8Cm+kFqBogv+
 hll5cYuwzU1SfpubRj2RWERWpjHy5CaOBdBxEkh5y8cLbFh6/hVXhQO8DwXXtwj9/Q1pez3uAi9
 vFE0E/l4qCyQmFVwm9ThoPUVDHRUgEqc40o3ENkkl2q8788sHRb93id739srAcQJIFRAkMO7q1U
 SHFdZl1TO7yaaydeh6yo/dz9WHgltPC3eU1Vdl5nL/GzPaEjgTJxUWVNEk5hl7jSlcD/AUVZu1O
 7SfESiwSV282279aJqaEtRWRMJsPczA0h1JYFieCODrWPBOw2WtpNVIE/B1XSO7oESPoRslglmy
 ybmb6FUgK+bamMWS0kefOim7sMf+EAbBjlfrdZ8NmjMlcpp+8qiB/cCUU/BdyX8Xr+8eypBRTOl
 V1mtTWZH1P2MPsa3kow0fBYQBIPW2y39GoE+5IIkBixYtOl8yc78psIyB6enVd2DxXrfs5/y8Aq
 eZnV/3U1BSw9NK6ERxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfX7YkMeMW1xLWi
 RtFCRtfNBHJvc6mhypm0ys8AlyQRWBkHVWOuxiKH2B3t/5QqE8gy1oHNFfrnBHy+b70uXiryVBV
 o0mTaG7lUIW1wiQCkTssynFa7UZD0VY6WAc4TQEnzqGCwZgs0ue/
X-Authority-Analysis: v=2.4 cv=CNa/zhrD c=1 sm=1 tr=0 ts=6b00388c cx=c_pps
 a=pBKQozjnJ70feg1GU/QmFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=LpNgXrTXAAAA:8 a=nMAUKEHV6oTgcqWiOPcA:9
 a=QEXdDO2ut3YA:10 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: R91ZtLPSx-IFPq-o0Bi6Mt-54HV9-gfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200048

On Thu, Nov 19, 2026 at 09:50:51PM +0500, Rustam Adilov wrote:
> The RTL9607C family of SoCs have an embdedded switch that utilizes
> the same Realtek CPU Tag protocol 4 with 8 bytes in size but have
> a bit different of a layout. And that layout is also different for
> TX versus RX sides and introduces new fields not seen by RTL8_4.
> 
> Add basic necessities for this cpu tag variant to function.
> 
> Tested-by: Taiga Ogawa <zectaiga@gmail.com>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
> Tested on OpenWrt with 6.18 kernel version [1].

Mainline doesn't have the requisite DSA driver to make use of this
protocol. Andrew, is it normal to accept tag protocol drivers without
the corresponding DSA driver?

I can see that the OpenWRT kernel has a DSA driver using it. Why not
submit that together with this? Otherwise it is kind of dead code IMO.

As a side note, it's unfortunate that Realtek recycles
EtherType/protocol ID values for seemingly different formats. At first I
thought this should be its own file/module, but I can see why you put it
here. My one concern would be whether the semantics for the common
fields are actually the same for both protocols? If not then maybe it's
better to separate them after all to avoid confusion.

> 
> The RTL8_4AP name was mostly chosen because Realtek gave the RTL9607C
> family of SoCs a codename "ApolloPro" in their SDK, hence "AP" part.
> Originally it was named RTL8_4_RTL9607C but that feels weird.
> 
> [1] https://github.com/openwrt/openwrt/pull/26496
> ---
>  include/net/dsa.h    |   2 +
>  net/dsa/tag_rtl8_4.c | 193 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 194 insertions(+), 1 deletion(-)

Kind regards,
Alvin
