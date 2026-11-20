Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157071;
	b=mEgtpIkjf+T0MLBuNP1BdGtufkiKRGV++6xqKGMQg3Xw+DqdGcGbTrj7moRwPbfDkx3U
	 9yljDJDJ9BUYXBf+h+MmrWzgsLmT3wknFeUX1vqyvXziNSpNGhJOExW1G+P8pHG1v/NBY
	 pXCgd83BovvFNKO0NVev1urrFqFvpbdKUeaIx5EnxH3IrB7KoLlciCCkKfUCgjlG93WGE
	 rXTwDkANh2N8cCwh0Phk7DV+l9Vmj+W71duX2lpbiLABIa8UDJtz0vO2e21kMzK+CC6qr
	 eElxkgi/2VE8MsTVScRPWMk1XB4Z9mJ5K1p6BPSwmaN9DoyVzp3SyknBZy3TwmN1dRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157071;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JwyRm4MdOzyfx5eAkoS4NxOtfiLUu7fyhIHNm3BgQFE=;
	b=GulunAg9mdKBw3jXCcM341vHfjvDO4+0bunaxk0RvpjV0xkyF9HCogSVVQUhYL/ZGJ+U
	 T70R0SOH65bi6hf6Q8cA2H/RkFUVIKv3jVxZToG3gFE8o3VJDk17yeiJRnrnkuvxyVXI0
	 g7U1zVLnLTVEp8cirIYnYU3ngmgQYPz5/cNuw9HoM7VRhX0vy0mwUSVUmE9grDG5dvDSZ
	 kokc5GmwfKAxHDFMuoG3q1X+wGy4GQBs/AlXj0EkniOOlWaffbknWNE4/h4WJ5GKA5fHK
	 2oUkLkV5/lVutXYKcwGfX/SuD9zw1DbpsVHFJTrEMEb2OxQif71Iq/UzHMja+nAQUOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tzDpHN7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09806606A320;
	Fri, 20 Nov 2026 06:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09806606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tzDpHN7r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yatC005s/86epgrS+u54q27jY1B3YMeXsYiI5trdfEuN6CpohErVkJ4JlbDz9M0lUGT6Y9eHpPJnw/Uqbj81nkI3Y6HSgY/nkfHW1UMC8q8z18Jb4TjuXQAtJTcl7hNeMA+9JvRE5mxgLk9Uok00ys+Gt8OFQIx6xnZKeorJLDtT3rzBkPRBxmusOtkBvNw2sOJhXdYf3GIWXyT7qOwR12YwSINKP5WOKmiR2b8sHajBOiQ5hEXFYT41zlxhyED6FWzLNUa6Jc/7cO5os7TXwjNWPFOnAYEVvVqf9m7pNggvap4fMpKYEIxpPSV4GR7QsF5xngOGS3DPoqZihyMiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwyRm4MdOzyfx5eAkoS4NxOtfiLUu7fyhIHNm3BgQFE=;
 b=rX4rXEC6im/0e4s1/2rcbUODoX7hqlUC0pEYeN/qhUjsWpQlrTevPlydW8t/a9FeAHv6SFfaweFYehkyJoczsjmI1zkXtElVuz3abQDX8JX0FKhGwaB6YYBMfYiGr1lrOFUx31/3DKOYHzMeNawduhBVPWwJ+90i1vUf25nIOfTOpqgNOaUEJvcYlnnDnr4vPhywTKzFs4NiH9uAgDPCUues37H8x7GY8nBzBVaoeVv8Z2fIbarKp/t5fhSAH++3gkpxGkJUbm0xwrCX87Ows+ZGeW6DkCh9M2ANgtSs6dGT5Nhx/VpEbcMtmqiUmGfyGsXK2zMo3k/UOnAx0JsViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwyRm4MdOzyfx5eAkoS4NxOtfiLUu7fyhIHNm3BgQFE=;
 b=tzDpHN7rVIavi+GtOBw1oTvWp9O3H0SSTwzA/L9uAi9bPx+nEMtz5gO/Z56eEY/UEGvIvi+fA4iXDmnNG+B9t1s1VRcok07WUfUnRry1V6p3KvQsQl8W/m2nZI5dM64TpAAlqdb8FIiYB5lvz9ZL2GUgqE6F4gE0ZEMi5oF38rI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14)
 by BL4PR12MB9482.namprd12.prod.outlook.com (2603:10b6:208:58d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 20 Nov
 2026 06:44:26 +0000
Received: from SJ2PR12MB8953.namprd12.prod.outlook.com
 ([fe80::f3b5:fc98:8973:5c0b]) by SJ2PR12MB8953.namprd12.prod.outlook.com
 ([fe80::f3b5:fc98:8973:5c0b%7]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 06:44:26 +0000
Message-ID: <0933f10c-8d74-4d98-afdd-1a83409c2402@amd.com>
Date: Fri, 20 Nov 2026 12:14:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across link
 down/up
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
 <fe08db37-4415-4b4b-b226-cc1a0ec4f029@amd.com>
 <DMZAUI64FXCL.13646UPPGKGTC@bootlin.com>
Content-Language: en-US
From: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
In-Reply-To: <DMZAUI64FXCL.13646UPPGKGTC@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::14) To SJ2PR12MB8953.namprd12.prod.outlook.com
 (2603:10b6:a03:544::14)
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8953:EE_|BL4PR12MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5812b1c2-7a3d-4bf9-91cb-08df46d1b834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|11063799006|261026121527099003|261021121427099003|261022105027099003|4143699003|261022075727099003|261026140227099003|261022115727099003|261009223027099003|261028144727099003|56012099006|261102123227099003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A1+tPD+cjimfJx8mut4UKx7c6UblTrMxXOlG+a/tePkfrSSgoJd8sLAgwsnJ4ym1a5TkD332osBP8goqag/0YzE5URaM7VJd+LrnHiYtDvVkBGSjnVtOlkaq9OVJhyfmvrSLYao2hMEDB+arnrvxRmePxnNDInf+QKPOHk3Nbbqc3S+FJyIpV0YrEgagdOL/myRRFsJDfFzcYJYV1VRCogGUfGL/AJu5tyRaODN5es1OmKAlzfqnaMRZ68q+1J+tstBoJP0lDWulib1sGW9Cl3H0EJXRPD1bHQ3GN3J+UIifxiRkiCWl071UMzTa1DME5fwCQOUh0lIhtL+l+nAbM/mhITIKyxTaeF4dgPpCwGjlRPsmMbPl6q/+IDFsVMzqpO4VGmywnPGCQBid8cxzT8ts8o5bEcCk5A0P/t9BzPL/Zmj/C55QUx6b4mkBNcr4n7iRwWrBuTQ17+B4b8i11KO5ral+VJ233jMQLOTHJ+sup+0nokp6JcpQ5hHLGm5rbCU74CTs2qu/k6BQVquGcEbYoJI1oX5IEX2upB01cBRpfVTiya9otPdnNOOh/mHGj510Ynv6KkbhqitA/V5Lx5EQGZjnetyN4dhzw1EfSRhQVVa82U4g2i0YKJoMJU2gYPHi0YVLSP3fFb8guQ1YZkzXhV67UYZBlQwvL0xGPLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(11063799006)(261026121527099003)(261021121427099003)(261022105027099003)(4143699003)(261022075727099003)(261026140227099003)(261022115727099003)(261009223027099003)(261028144727099003)(56012099006)(261102123227099003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5CREtWUDgzY3A4Z25kZElDSVFEUG5YUmIrZnc3MmpZd2RFdFpjb3FuNVUv?=
 =?utf-8?B?MGQ4L2RXSUdwWmY1ZWxjNW9zb2QzMXNDZDVJS1BIb3BPb21WRUwzVEdNOThz?=
 =?utf-8?B?aW1pRHdzRTE1K0xVcWx1OWswV09saG9qdURRa2N0UGpqc3FRQzNXWStqNGJl?=
 =?utf-8?B?dTd4SHE4ZzFtTDZ5dXRiL0cvVmpuakptM3hQYWZJaU90b2FwZXRNc2FwSk5J?=
 =?utf-8?B?Sys2S29GWWMwRDd5Z0UwL3VmUVVJUitzNlViQmZJZDI1amt0VmtWTEJnRUlq?=
 =?utf-8?B?UWg3cnp0OVk1ZnJPTERXSnRzdnRHS0l0U1BSQ2NROVo5K3dHWHFzZTh6YU9W?=
 =?utf-8?B?S21vWE80bHhvWDBkRDNXbC9aSEMxQlVvSTBPK3BMTWkrb0EyMy92bDVmUFF6?=
 =?utf-8?B?cG5mRVI4OWdRZXU1djZpNTFoTFp2MGVmNWtxM0lJQ1E4U2JkOHBtLzhsM2Jt?=
 =?utf-8?B?TEhTS004WXVGRzR2Vnlvd2FsZWpiakNZeWExQTF0Y3NxSit2bDlHL2lVK256?=
 =?utf-8?B?ZzU2cUx3L1R3bDVNTWxNUnVoSk5zd2g0S1hxMzF4TkpkbmFJeHJ2R2xEdFpl?=
 =?utf-8?B?enorRG1ZTStXUkZMQVV4Z1lQM2RkdjA4VTNLcXRvODBTTlpSYUxxd2xLQzRv?=
 =?utf-8?B?S215MUJzTm41eDRGVWlrT2M0WGNVYk5naVJIZVF6WEJ3RWx6U2tSajNweVlI?=
 =?utf-8?B?aTN4LzI4RjdvZHlxRXE0eHJpd3A1OWg1U0NUVzRMRFhKZmZvRU8zNmdsVUw0?=
 =?utf-8?B?MDdQbXdQcjBOVkZjSUhJY0dkVTFEcDlzN0dUMmhPM2VBU3dseEJmYlpickFy?=
 =?utf-8?B?SndlTzA2Z21nVUVvZWExY1lNcDh2RkVvbEExNGE5REE4NEhDVUNWbFJVemNF?=
 =?utf-8?B?MXVoK3ptc0xNeS93SG1ORm1DcEtGRm45S1c1ZG1GM2ZoVkVxbnpNZDlOeXNO?=
 =?utf-8?B?dWZ3ckZVNlZJbUNodHcxLzNCajhUNzcyOXcrdExHaEtqeXBaYXBqL3hnSGFj?=
 =?utf-8?B?T1BFa0U4bTlJL3ZMYUl5MXhwV05VYTNlMXhrZVhxdlRzTGdmNXA5TGVDYTVx?=
 =?utf-8?B?VkhNeHpXQ1p5RjY3RmhuVzRpc05sb0kxYlV4SXkvaEVqU1FTM0JBc0kwQlpO?=
 =?utf-8?B?cjdMbVdzUk5jQ1RCRkp0MnRpK1UvbnNVTzFITE1OQWtlaEp5RWVPRkJFREM3?=
 =?utf-8?B?blpoT2FxYWwwSEs4Y0thTWk3ampqUi9RemRYUmVvSFdzRWhwbVZCcnBtWHJH?=
 =?utf-8?B?czkvOTA4K3NxSmJXYnY2WjJURHdvbDBFK1VHcjlUWjVyWVA5UHY3Vk1zblBu?=
 =?utf-8?B?SW1YOGRuZTc2d2lnZHd3NVkxL0MxMXdsaE1rdVhKT0EreXVDZHNiWmhjU0Vz?=
 =?utf-8?B?RGMrNjJkTHZ5S1Z2aVNIdkoxUk82Y1JsZFQ1ZHM2TklWeHppSk5CZkxkY3ZU?=
 =?utf-8?B?WnZ6bnZ5bDA3OHF0T0FjSUtBVTB6YTU1elB0VGdkOW1hOVNGK09ldlpWclN1?=
 =?utf-8?B?RmluY2pZdXJzMkpxdVdFWUllWVAvR2F2SVlQdGk3eFlzcThwbmJqVEZ6RHMx?=
 =?utf-8?B?VTBDM044U3ZCaitwM3gvL2E3NjYyeGo4OUI2VFJacHVEbEkwL25aM2RBQ0NB?=
 =?utf-8?B?Nm04N0F5cm81ejhJNWN4UVROVnZrTkJOV0NTYlNQbDNmZ3JFTWZBR0ppMEtp?=
 =?utf-8?B?RjFkcXNCc2s3d3FScDE4aE0zeDk5bTZ5UW1xU2l2U0ZodlZrelc0dTdYTm9y?=
 =?utf-8?B?R1pad1ZnNzl1VW9YZEE4b09MN2dCKzhpb2VUMXZjeEcvSkMzWnFGMS9SUytr?=
 =?utf-8?B?dU5od2lQdjJuVk5qSnV2dzlkL0FJL296T0ZrMjE1Mis0eUhMaW5MenFpTUh2?=
 =?utf-8?B?UmgzZ0dzNnY5Ynd1TW5xQjQ3dkgxa0plTzFNZ0NrclFINnlMSVRBazhkb21R?=
 =?utf-8?B?VXhCMTM2YnY2STBHN0gwaWs0RTM3SXVuZkVRb29tK1J5ZEdJWGIwa0FFTDJU?=
 =?utf-8?B?UTU1dHIyZ2ttcDRQRlRIL0htVXJxMlhHeHBOOGliMjBlMG51L1MvSlNiZ1FB?=
 =?utf-8?B?ekV3R2I3cE5rbll3cHNsZHoyRUhRRFNXVDVDYjhCUytFQ3pHZTFldnptLy82?=
 =?utf-8?B?OVZDOFE3Zm1RU2lqRkJOQlJueUhHOHdyOG5VRGZNditkWXN4STdsS0RCUDlS?=
 =?utf-8?B?V1hZMk4yWjJ2ckdydnY0aWkyT2N2T0xkZEZ1bzNhY1JuRStvSTZzNHJ3VjAv?=
 =?utf-8?B?YWduQzJqWk44bkFQOU1nb0pPWmVRTDEvcTZXaTFscjh4NWg4VFhwZjVkV28w?=
 =?utf-8?Q?Y3N6JfLc/zZkGwP7yd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5812b1c2-7a3d-4bf9-91cb-08df46d1b834
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:44:26.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAbbG1izKJmUlsaPWbH5aIyBYYOEk7OwV7Egj3EKQLIgj31vcHyR92fRkSvs773A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9482

Hi Théo,

On 11/19/2026 9:10 PM, Théo Lebrun wrote:
<...>
>>> @@ -972,6 +1010,7 @@ static void macb_mac_link_up(struct phylink_config *config,
>>>  	spin_lock_irqsave(&bp->lock, flags);
>>>  
>>>  	bp->link_up = true;
>>> +	bp->speed_mbps = speed > 0 ? speed : 0;
>>>  
>>>  	ctrl = macb_or_gem_readl(bp, NCFGR);
>>>  
>>> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_config *config,
>>>  
>>>  	spin_unlock_irqrestore(&bp->lock, flags);
>>>  
>>> +	if (bp->enst.speed_mbps && speed != bp->enst.speed_mbps) {
>> Why drop the schedule on a speed change? The taprio qdisc stays
>> installed, so the user's configuration is still valid;
>> Could we instead recompute the ON/OFF times for the new speed on
>> link-up, and only disable (with a warning) the queues whose intervals no
>> longer fit the hardware range at that speed?
> See explanation above. It felt like a good local maximum: simple code
> that probably doesn't introduce rounding bugs and solves it for most
> usecases.
> 
> In any case, we will sometimes have to drop the qdisc and warn about it.
> 

yes agreed!.

I also looked at a few usage scenarios and at how other implementations
handle this (with some AI assistance). They lean towards recalculating
on link-up:

- taprio core: keeps the schedule on a speed change and recalculates its
speed dependent values (picos_per_byte, max frame durations) from its
NETDEV_UP/NETDEV_CHANGE notifier.

- felix / VSC9959 TAS: gates are in ns; on a speed change,
vsc9959_sched_speed_set() updates the TAS link speed and calls
vsc9959_tas_guard_bands_update() to recalculate the speed dependent parts.

Typical scenario:

- Autoneg downshift 1G -> 100M (damaged cable, 2-pair or M12 cabling,
PHY downshift): fairly common in the field. Users expect best-effort
traffic to keep flowing, a clear warning, and recovery once the cable is
fixed.

That said, I am fine with either approach.

>>> +		netdev_warn(bp->netdev,
>>> +			    "TAPRIO dropped because link speed changed\n");
>>> +
>>> +		memset(&bp->enst, 0, sizeof(bp->enst));
>>> +	}
>>> +
>>> +	macb_apply_enst_config(bp);
>>> +
>> Could this be a single macb_apply_tc_config() (or similar) that
>> reprograms every enabled tc offload? CBS needs exactly the same
>> handling, since idleslope is also relative to the link rate.
> Yes sure!
> 
> Do you want to take over and handle this? You seem to be interested in
> those TC features.  You can either copy the patch as-is or modify it
> under your own authorship, I don't mind.
> 
> Or if you prefer, I keep it here and iterate. But if I keep it, I'll
> continue with ENST and then at a later stage we'll add CBS & co onto
> it. This patch looks like a good starting point to add more onto it.
>

Your changes look good to me (after generic struct/api), and I am happy
with either option. I can take over the patch and make any necessary
adjustments alongside the CBS changes, or add CBS support after this
series is merged.

Please let me know which you prefer.

Thanks,
-- 
🙏 Vineeth

