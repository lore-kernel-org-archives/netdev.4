Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445298;
	b=L4ZeOta42DYIisgZBeGE6OrwPqoImqP7Q56BJGBUr6l47qaE5B00K2sbI2CuMGBhdSVb
	 sXHn3Dxg4iooyhwp2uxHv5QMzPfNvVQY2BCT7SDDcMMs0yfzdVOXguKTLsXUsfHQTObfN
	 6iH9LX4hXoZhkOPP4mu18X4HUQJIq4hNvNVOseTs/WQibEZTim5ovVqgM561Oz1kHdBUv
	 SdSAtnP6PfZF9I2mDTokm2T6gvJqTx3HeZgkrRUa7f//ALJKa2F/bwyPCyhCsyIIBDA5Y
	 ee5iXRuM/RE0YZ9HOGQ66UDo7/YapBavfQzEAGkKXlX+nQf+mwEyUUoEwtA2Kju/kLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=gZpJP28um8ODV6DEpkXclzUEPWuaQb9sopdA4rmHZqc=;
	b=z4J1pLpOkSJV6SgsYwkmxcMpbXfAgQnPwrqj78S9fefMFbSraJBvL1oayb4htCbOhbFK
	 R1KDsexl4npPLf8tbuVZW07hTbE3JzsT/J6Q2/fuozBwJ3SVFmsOafT+qcAscGAm4kA4b
	 J6C57RW8gVo6tufqK9I0PP3rftScpHHz+e2F1gu4gtnVjvjEVqpFvwE2C9p/NsyTxLMrF
	 rgFxq4HY9//08fK/1bJuG11ThfDH+0ib246kHgUVoBRaP3iljMlfeiaBKfT8oiP5qevAE
	 NvvXYNLdVsbqnIAzKuflJ5KTuZw5HzMSbHrjX7qk+5nnQw42Ii3S1FEO+ge7lEDNv5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWq4wT1m;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YDhdedSR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285C606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B285C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWq4wT1m;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YDhdedSR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795445298; x=1826981298;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ikTccEH5IMYy3Wq0SQSwEZcdH7edRsSLue85zdjdc0E=;
  b=DWq4wT1myd8aJ+Nhe7pKQbC+D4mm1WONUrHUSMHDxD+/8RMdoGfaSJX2
   1/3OgTzdvUhu8NanCF66bZjYmasdIiA4T3a15muDCVxYR0t7oIkW0Neb0
   yBIb9fRaHnfa5HW+f5wT1mkf/mKgSp6R5XA7OtAXNMcb+owCvaxgc4ujR
   ti83RxDPiBXTyh0Y5cq2iLK3HDaJeUoLHNjkjTBaYOejEB+d77pjJdiea
   WapiMNh/5hC6c/1BGdNIfpoeXRmjbdjTYt7RniUaqg8lCzxsv6hdO3+QB
   9nAoRfqVFSTQfaM+zUhYOCAa9X4mtDJZKWQDXuARq7CGwQecGlHb/CtcJ
   w==;
X-CSE-ConnectionGUID: vMBC1uYmTDKGkxLTly8rXg==
X-CSE-MsgGUID: neq+a5dVTouKVtlZx7D8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4230256"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4230256"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:48:17 -0800
X-CSE-ConnectionGUID: RZ0tgZLASxCp3c7tpOUxFw==
X-CSE-MsgGUID: v4TiLHtKRjWWgheLD6TSgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11644305"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:48:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:48:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:48:16 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZR9YnUeMuE0YDK77fuZEUbyIpOOnTmhM0ooskXDsyh+RrJBmkIjS2bedPZW6l28TkkTR/DGgYDF+1BBxXioEEPoJPRXIVQSozbcJerIF9/GHFmc+zKazKVZTqwkneisdkdmpQJ/iav1jhdniSxzB045befvRUGb8Z8jZ0w1H5W1gOIpyLpkqBTrFUhRKQ1jxVK7KS0peXDgAb5FOOeeOU/mkKiTLgsyyEzeE5ULtZhNIx91viU8E9uwA4ZVtvnABD4wWS3+DqQjtX+a4KvI/Vj2rPN7K6auLqfKmiZt4odb3YZAD1JYlTiOmBTAEMOxcekZ5Bt2Otdr+LEsrmU//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZpJP28um8ODV6DEpkXclzUEPWuaQb9sopdA4rmHZqc=;
 b=RQe21GgPTJKoQB+TaQJCytUPAoDbTplp/MMo4MrebU/2tUf1iL1BKDcgTN3aeGom4gEWWwlmL2A03mRyx50G9bxQBsM1aggHOTWf6Ib3q08iJ29Hwcy8/gvxQEx70oE+AusTnn1TdVOFRxAaArzv9QgLSg8WI/zHyolMVrSNnNh/CxItDPAIFAnyaHKDhvEiIhIk9dEdgE/kQWanbumSvMgWduFL6kPZfsU+sx1b/R2vd1ThkQIN1EYnhC6k6guMRVtrAA54zoE2g04u+4GarKWrMmuBn8qfKd+e1hq8+zM8COvJPaGTK83OFoBwGabKYGOyxVVBhO7mX2OlydhbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZpJP28um8ODV6DEpkXclzUEPWuaQb9sopdA4rmHZqc=;
 b=YDhdedSR4MEuz7jp/PsDhR6xrS5VHzuJ1Ya/D2HTRBZQtmF0IfFUyeyzJosk6s33pfkcheJugFFQiAd+qk1bWE13ssHgElb8U11mbAL1ZbAwjijTzvjG4HxG1a+ph6y1cqSvosK7sue50CZYIo4yIYuFCdhslab4yDMiJo1ivZs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 14:48:04 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:48:04 +0000
Message-ID: <ab89dce9-c124-49e6-b6bb-036b69beef6f@intel.com>
Date: Mon, 23 Nov 2026 15:55:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Jakub Kicinski <kuba@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>, Petr Oros <poros@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson
	<magnus.karlsson@gmail.com>, <netdev@vger.kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <edumazet@kernel.org>, <davem@davemloft.net>,
	<andrew+netdev@lunn.ch>, <horms@kernel.org>, Marcin Szycik
	<marcin.szycik@linux.intel.com>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>, <intel-wired-lan@lists.osuosl.org>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
 <av2syi6lE/Vp86QW@boxer> <f7f1ae2d-a623-4eb7-a178-c618316beaf5@redhat.com>
 <0bb65ff3-2e27-4f2e-aaa3-2b8eb7cda356@intel.com>
 <fe1ce4cf-3400-4a87-8e46-072563f8fe9d@intel.com>
 <20261121162859.3522ab89@kernel.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261121162859.3522ab89@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0047.eurprd09.prod.outlook.com
 (2603:10a6:802:1::36) To LV3PR11MB8508.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::8)
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4417d438-c259-4de9-47ec-08df4970c717
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|10067099003|11063799006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 24wn2N8LZOGB+BbQxq8o7/vVFjvMmjcuFGJ4nYfkoBvt+GGrYRQuQ2x76/WJEm8uD6TM6cnmwFxjtYHaMXk66QnNiwYT4L8wtYIRweiQ6fxwq3hCsUy5y54bWLtDDXUBM9o/ww8qkDyIB15zZJBZ5E6wdXAD7Qz21J5rjIsm++gjBmtK4KTu8vWm+tZWv06O1zOj1CxkJtpeSUzasmcunSQvXOS3w0k2UBM8cnlgaD2e5k4c41gmm+F8IRcxHoheISKfulFo0nAWiSNDkLnXNHhs7BQhCaym3vykOC2tr5ivEbV8FYaeydg3+1q7kKk+pA2GwhuCRhf/1BCIQsW0l7NcmyVv8S7d7YKL6/T8q7A2wm9pp+s19r44u+pLThRxrEajzdLBHBLhFY7avlpOHMMDjBfVNQX8U3Tmd2q0pvEoWs4aSwx6f1xOjZLj4SgqrMiZ95Ry9qUX12sXJlH0plU9dDWk0xjBdy6yL2+ikKHPIRMH/YKJCN816FQ1ySBN7lPsCeFNl4KdxTZ94I0r1Mh7w43EnrZ5b46/VKSf0ulsS3yzLRR+T/rchMeRbF42Kd/HypYxbxHuOgMoMs82Sc8eVLAOFgxWs9GhoVzUFDdJpFVlhHXlP0yuXC/TqgRSxeSktyTiYO9Ml9xYA3AouaYMtACASBkyZxujco0Sowo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2p5cVQzVXJrMXNwaUpORmFMWmh5UGJuWnlENFBBMG1hUk1sT0FFcDRzM3pZ?=
 =?utf-8?B?NE1ONkhyK1cyeFZDeDFZclZtektyTEZSL0UzZ3FyOFB6SHhMNVVaZEdxWkpU?=
 =?utf-8?B?WGJkKzBCeUsrdGZpUWR5d2loY1JaUmtabko4VGpCTTVHUVJoTUFHWVZYNFhY?=
 =?utf-8?B?Wk1jWmJrRmNHMEJubVQ1dzBzTlRPWnpoSXl4dklJeHNsbXpIaG5sTFdCVEZm?=
 =?utf-8?B?YjEwd1lTS05ObElTbHlGSTlRZXlyVWlmMkhOc3crMmVVMk9HL1NYMnZkcGNv?=
 =?utf-8?B?YWVvY0txUDZnNjdpbUR6RzczbUN5NXFESVQvQ0JPR2JnOUhlL0tDMk9WeDBI?=
 =?utf-8?B?RXVYSWVoSC8zVGxDSlhPSG5ZVzBSMmFEei9LTGJSNkN5cW9iVldSQmhjNGdW?=
 =?utf-8?B?eGg5RGt3Ym13cEcyQ0lWMDUrT0ZxUjM3OXBqVnh0bll3bGU2YVdhUS9qT0Q0?=
 =?utf-8?B?S0JZUksrT0Nyd2hIT2phWkdTTG9WM0M2YkZEeFU1TnNDUzN4d1VQUnB5V1RT?=
 =?utf-8?B?NlU5UXV3TWtXc0I4VDJ5L0U4czNpdW56am9uaXo3REJtdFNiMmozL2VXeW1V?=
 =?utf-8?B?UzB6cXlMbG5DbGY3QjA0ZnE3Tk96NlpEUHExSENvbVE2VkVMRWRKWitTM01T?=
 =?utf-8?B?d0dEaWxRdnNISi9vTkVKWUltMFNIVkhscUlBWVJoMkNYM3NXWVhnUXArR0VR?=
 =?utf-8?B?bjc5RXFFRGpLQWhoRzFua2k1ZFhIYUhUaE4yT0dXUVMrRVRnbndhdUtsU3FV?=
 =?utf-8?B?cWJ6amt1dWh2SzVkNVhkZ25lRDdsSjZSMU9DMTIzRmV1NEFuOWxIeDltM3Zp?=
 =?utf-8?B?ejdaU25RNmVMblN5Y2wvN081d2lKcEgvb1F1LzBCWlpNNExoRDVwZzc5TTdk?=
 =?utf-8?B?dVAvbVpDeXZTdGdicTRQdkEvcGs4NVRpcllRQUNuOWdHemtHL05xTTlucEJM?=
 =?utf-8?B?c0xUaUNvTUpDRGtscUh5NmNlbU50NDAzYnpkQ3ByZktGV1NPSkpBbFZZVEpN?=
 =?utf-8?B?SVNJZVVsdGwrT1hFYTgyZTdtNDZOS3lLS3lKTTg5aFpmQi9seGYwd2lMN2Jq?=
 =?utf-8?B?SDdabWZZT3MxRTZoNjRyVmtrSWd1anh4SzQ5TzdQdmNRN0RzdUhvdHRNbjNL?=
 =?utf-8?B?R2xIZTJHenltdENZZ3ZNY1pmclc1RGI5OGY0bHFUMS9SbHU2cXNLNzVQMGRV?=
 =?utf-8?B?L1JXL05MVUcvMVlJU2VQVXM5WTNBQmVyUnlKWlhzSUg2Wjh3RjVOY0hlQjRl?=
 =?utf-8?B?SU92by9aSnlZWDZNdk9td2lMeGlDZGxFSjlPYi94Zy9hMWYwU2QwbUh0QVln?=
 =?utf-8?B?cHY4VzhnT3VUUEVoN29JM3FiNERPYzduNGRGK1VBUEhIb0FHRC9MSS9UUnJJ?=
 =?utf-8?B?VUhuWERhSDFZSi8rTXF5Wkg3cm51U3h1bytSUFNJdzBwNGRTeGpEWlJSQnN0?=
 =?utf-8?B?eW04YUZQcERxYXI1NzhLeFFrU09SMlZtcnVrbUdSbi9JWldXdThkRjVOZUNV?=
 =?utf-8?B?UW1lOG1SQmlBQ1AranZRcW1aamhPQ1N0KzhKYXZpQ2N3a20zVFBabGlRWVUy?=
 =?utf-8?B?V3I2ODd2a1ZsdVlZakJFMWFhSHBlUGFBbml3OS8rR1VXNERWaHlnVnVYZDFp?=
 =?utf-8?B?RHdMTGVoNkU4K0Vsd3g4QUxidUovY2VBS3pZTW02TnJDOTZuR1l6OXN5VVE3?=
 =?utf-8?B?R0liMmY5OE5rbUd5QWpxblloZ3BHQTE3UTBMUHE3V3Z5Ui9Oc2ZuTFBJd3JD?=
 =?utf-8?B?ck1DUmxnTWdKV1VIZC9rRE1Zd280L1I5eHd5ZW5PQTJJMloxS1Z2R3VpMmNu?=
 =?utf-8?B?NlVDeXA1LzhmTzZBdU9RQitBMmpNekp2bUx0eVgybXJvc0huNmRma0htN0RF?=
 =?utf-8?B?dGh6dWVvTWlXdDlSc1NodXhNUGptSGdmazdnKzNKWmFNQUhZcTZ5VTY0b3ha?=
 =?utf-8?B?Q3hKT2J2VmNOMUNZN1cwaEw4dDM3NzdzY0tKRU5mcnlDS3oyaFhRd1dGN2F3?=
 =?utf-8?B?RUd2M0N6cmppNFVYZnFGQTM1VXA1WThLS1FRa2lnbXNTUVB2a1RlQy9MRmVM?=
 =?utf-8?B?YllGQlJ1QUQrZUV4WlY5SWtpVzZLU3g2ZmkvT0QrSXZYM0dUUTBUN2ZweGRj?=
 =?utf-8?B?SVVNMnoyMUZFNlR1WUFlSkpzQXdjbEx2cHJueE90MWtkK3lKQ3BKNUdtdWQr?=
 =?utf-8?B?OUsvSW4vbSsxRlNndWJLaVYrK3lsTVpNRXIwVExrV25Zbkw1NHl6WnRrbHdQ?=
 =?utf-8?B?L2x2aXNVaFI3RUFib3lnSHJ3cVZjcm9Td1Bka1Bmb2JiOWc2dkYwbEF1Vlpz?=
 =?utf-8?B?YWhjVGFmZ2dWeXJHNEd5WlJhK1VkVUFXUGRNQStJdGxiTXVqUVRsUVl0TjlE?=
 =?utf-8?Q?MNXRG+BZH5Hcetb0=3D?=
X-Exchange-RoutingPolicyChecked: c8BhxSvpOGvohu/GfMztcV+UpqgGsmABUZB46pRodPsd1vYwBLrjPJgbK9/elE0Tq+FJ0R7cbEQmFwc6UI5UBJrl0CmxZ6ZxXjmgaJe8+cI7t2aHoNYUJQIig6rnOOZ4w2lal7eZnm2NgJ2+1A6HCO52H0YosIRk45v0wWlaQm2XN6joZDYUU3P5g3iP+Hx3iE5WehhzWDnNS1UUqP0EOJBMzjIxVTSqof5Ohd4tH5MEO0QRBssHNuaW+Ih1I8woODK6UndAnH9jbm1pb2gBlI5uBhxxjupe7uO/TcWXOUuScBouRMfYJ4UTwgSGLBZR3iKgi5OXjt600CjrVD4NYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4417d438-c259-4de9-47ec-08df4970c717
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:48:04.0196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ko2LN9NuOGqu0s9t00vDBzumuehn5dhEsCzpa6D5NUdFpkX67cfV/cZPJ+2Z2RN1qOxAeG61Km87okr2CVZqo6fWlOENULvV3dL9OGdobk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
X-OriginatorOrg: intel.com

On 11/22/26 1:28 AM, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 10:07:10 -0800 Tony Nguyen wrote:
>> An idea, but this would still increase the queue for netdev, would be a
>> separate budget for non-Intel authored patches. This would allow
>> community patches to continue flowing without being blocked by Intel work.
> 
> No extra patch budget will be provided.

for our purposes merging a patch from outside of intel, is the same of
+1 to the budget for given day ;)

> 
> As I think I mentioned multiple times netdev maintainers are happy to
> take patches directly. My understanding is that it's Intel that wants
> to feed the patches thru their internal QA and have the ability to work

We have ideas how to better utilize our VAL too, both Tony and I have 
opened an internal dialogue with respective teams.

> on timelines, let's just say, different than netdev works on.
> 
> We wait for an ack/review of a maintainer, from Intel such acks never
> come. Przemek / Tony can start acking things directly on netdev.

we will do it more now (let's say process is/will be different)

> You can also add another maintainer to your entry, or split it up
> and designate even more people.
> 
> IOW I agree that the Intel process feels dated, and life would be
> easier if Intel switched to an upstream first process.


With the current experience of me filling the whole of our bandwidth
for -next, I think we should also adapt - it's both a lot of work for
the people involved in the given series (feedback must be addressed
ASAP, this bandwidth is our scariest resource) and the same endless
waiting for all the other patches (that we currently hold in the dev q)

I think alternating two series (best if for different drivers) will both
give us more time to address feedback and be more evenly paced (eg: ice
at Monday, ixd at Thursday (assuming ice series were CR'd)).
