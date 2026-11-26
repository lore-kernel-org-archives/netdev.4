Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795651414;
	b=4lseZEX8f5G4volG3TXrOqHD6HSMb0VbbH3LBgKXsooeZvFLbU/5B/J6qI+0NQF1kpyt
	 F5qLffOg61hsVuS/E8JKpyGbTYlMbyUe9siz0H+fA2FAmTb3rsEoOEG7od9QMK0wiJaWk
	 EGorSby3Yedr6tukKIF/PYlEOT6yk9zR9CBds0+EdubDIAdxR+vAk4hiQIbZnLBYYkuTd
	 FGtj3EXUZIWWI/PpEX0/H7jKB4BWmQPOzPSBcxWiP+CkOq3E/NbQAFliDKhWSiB5BJAZS
	 FtrQnrllGbWNusz53AA5lGkfRhZAmHSLl1jy2SWdtLcR76wGOOm7A9dot+DXJ0VLr6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651414;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=4M3SrTXAKwLUYXFrS/6CMgF6vw6oLfuGSwn55rFXwL0=;
	b=D0F6/lI5tyZorEeZTjbHAewSYCfZBgDRK7MSckAkV30lqJo0iB/61Zui6Wo5Fu0+66JD
	 ysr1vMNOBfdxJZ5/4t7dBDt3Ut+GUn5JxGEsQmyqPBi1GW8FzPv84PIbcYEX/RDDsS2ao
	 z5iHm7fK3RBq7t47LGbWd4uTs3nq73lm9CMl9Dl1wmHKIbGjSOhbXjnUtdMII+/Iseh2a
	 hIiHZEXUYoRbHXrWPES1Q2zVLkZrs6suGxz9JS0NDJXLYCtUOekDGXrU0UyviJGoKeYgh
	 QihKe/x6kFa7llrCl82RgI5vBpTvOK80fztOdWUXWzACQ6HErDk6eBeZDD9p/0MeR8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFWozIXV;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WXec1Drl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A7606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFWozIXV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WXec1Drl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795651414; x=1827187414;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P1qOZ2Ghjq+izNg8mA4u/nUidFsBREjw6nGBBiBREZE=;
  b=MFWozIXVqLp8JocvrOJhT55eQph5nNldL7QeWXOLgKk55FMrtj1oPTxO
   fGstlMPxMkiscNtMWdtm6r/4Cwq8Xq0m+A470cr8Gx8kiEQeyTpMcWCGC
   vAwjZaFss7di2xmbmHloU/hCx/lai77kpbvU9Kstx34bg2JCTECCz6uj7
   eFXFR6zkG5gxRsEaAqF/mRgI8OmAp/MdY6PVT+K8/F0OceAgLMnwhvqRZ
   QGcuYK+P82L3EicTcTY3qCpc77n6LWpYYjW7cZbGdCcscAtL4JeFenYR5
   eyNNA+u0ynGmNQUOLnyhDm+fkpnUY+dvovWOXJdA9DZo99mJ+Lz/ZXxCe
   Q==;
X-CSE-ConnectionGUID: RIYHQ7z/TFmlw7JsZ/Mntg==
X-CSE-MsgGUID: mEXrZPVXSAyXO0utDr2m1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4457429"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4457429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:03:33 -0800
X-CSE-ConnectionGUID: BVH8BXZpQo6AmfGeqJ/b3g==
X-CSE-MsgGUID: HjwbZjn2T0S+V944grGWQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12150661"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:03:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 16:03:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 16:03:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 16:03:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc8ww9yyZXzcovhqc60LWDs24C9jzdTzg59/lewfdYVR4bzLyHBk5lw2+4/4h9W/O9X8NVLvcUwaefOnfGOKYUTykx18Llxdw7p1k59lcfVCENgXh+10xV7SaJe6nqwae7WJI0gXqshyRni5iLlpGPBpq3w7hCXJj7+dq69iasqaBhvS9nYwLDgRapnUZYJTZPG4C/RDuhX4IObqPBvhcmSHMHYOjziNJ9QCVXLUCjksYXTGtY+6Ex7TtokgVmVUsBm5+6gaxUgbyexhUliyFlCKuolxdOwnzbUP/ZjLelyZ+gew9CPhe+iYEVKrryDcrRzUXFR87+W3EGdomgpPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M3SrTXAKwLUYXFrS/6CMgF6vw6oLfuGSwn55rFXwL0=;
 b=KsuMtbeeZC3vx5dg4YWxTBzV4Y/ZtdHi3pq6gNey8WCDDuSvLiZB/xi9W2WCnI+z4I2E7vINcDyA6k3L9KwYpqvpxEzDIphlwLXJqyu5cJwm3LhSEFTUcSmEN4mjSAYxd7UNsyGNGu0zmkICpUiHlY+RfUPeYvhVtzwJA5+w46+joqOEGycHHPiDavTDFVXI5/AENTscRSs5+ayh08A3eS7jjxYemG43Syf3uQe2ryIcMhaoqOw66Qj5JhUp9pYUAfmmHGpPL3wI8uhNwCCNgYSjtKyWDd+WlmBCXEzDD+LTPbVRU8XSaTd9ECnM8ZCzISYoMM6Nd+JCfpfjXkkUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M3SrTXAKwLUYXFrS/6CMgF6vw6oLfuGSwn55rFXwL0=;
 b=WXec1DrlvC2Idcaw+F1YxmTpu8KMwXjdwSTNGGtibyolfwGc76B/A5LYG0VElXcCdSVi/xTUjRHrFntfuhkn87TWIcVts1+FmthKTxYe2A8bzfKIk0Hu7+jXGrK+Kfn727DBoHIB1wxA9zdfopnDFp6N5Eye4+gklQk4VxbSb9M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by LV0PR11MB9814.namprd11.prod.outlook.com (2603:10b6:408:382::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 00:03:24 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 00:03:24 +0000
Message-ID: <daa530a5-4579-4cc7-8f60-58f2ca14c571@intel.com>
Date: Wed, 25 Nov 2026 16:03:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/5] ice: ptp: serialize E825 PHY timer start with PTP
 lock and incval
To: Tony Nguyen <anthony.l.nguyen@intel.com>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <edumazet@kernel.org>,
	<andrew+netdev@lunn.ch>, <willemb@google.com>, <netdev@vger.kernel.org>
CC: Maciek Machnikowski <maciej.machnikowski@intel.com>,
	<przemyslaw.kitszel@intel.com>, <aaron.ma@canonical.com>,
	<grzegorz.nitka@intel.com>, <richardcochran@gmail.com>, Marc Neustadter
	<marc.neustadter@intel.com>, Sergey Temerkhanov
	<sergey.temerkhanov@intel.com>, Milena Olech <milena.olech@intel.com>, "Simon
 Horman" <horms@kernel.org>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>, Ayush Singh <ayush1x.singh@intel.com>
References: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
 <20261125224428.4126195-4-anthony.l.nguyen@intel.com>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20261125224428.4126195-4-anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To SJ2PR11MB8451.namprd11.prod.outlook.com
 (2603:10b6:a03:56e::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|LV0PR11MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2b4071-e433-4bb7-2e5d-08df4b50b056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|56012099006|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: CMDPwT6GKirhhR3WlHIiuipgfuOH+ayM8c947DEAwtVnyPvgimbCHzDnffrIjZhyBUtHR+igoLAwVC1cE2+L0MSEQ1Alxvgw7KE4JiayXpMDTSAASYeIzxb9YhSvBaLbIf1KLAYcFwmBGRIix+7vk1ymBcQBvByJXBGTDAnUdAaabwJAo+TkWfeTi31351sXfrpMwiKmvmXHOvib0f8AIa9YaS1BapUDB76rYnHEYlFF91GzrowoRJYuHIub72tSEo55CEJ9EL+mSsDeCZHWXaje31Ed7AAuW4mT67S+ircO3+Ws8w2mrEiDqRzHaDoytV3tjhq/3d5H97IzHdAXHT4RtCpP34S84/r9Hw0Bkik+Mq8pFrgm6iKO2iI/nsS1kwlEiMdt0+n0OcIWujcdhXhoSq9lIoSEuty8MCwUPuctkTRUrH0fBaWoZ2PrYNhomBAqhM0gFRR+tz0equX/4oaL1CCuODXJQ/+0UUpkcC/O8VRjzVozaVRWk+H1cOByauxS8rHLsGX7JwYY+bnxY1Z0tHGeAjfpjSthWMcsFVEYq5i7SYTENyQIkDJFD5HhhH7Nj/rh/ML21vBajSOViVYoakZahSrjRRDwJYgMqG/ut/NVl0WaStqyFDccwaUqSAat1U0+4o4brk0RQFIFDL7OHpr1QcVKcOqmH4iCGW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWJYaFh0SkQzRVdrOXp4OU1qTVMxOTcyNmRXMFcwazFjY1Y4aUZEL29FRUVR?=
 =?utf-8?B?SFYrckc0dFhHSEpGOGdZbmZsK0czcCtOc09uV2g1Q1NKSE5EOXFlTWJJYTRq?=
 =?utf-8?B?czhyQ05QYzd3ZTJ3M0lxUGRkemJtMFk1N3lybWtvV3ozdzRmbW5NWFlTdVZt?=
 =?utf-8?B?Q2xNUmlieWdQL3o0NVJ1Yk5zSVZpNVJHeHdpWE9DcEhNalkzUVovL1M1T00x?=
 =?utf-8?B?aUo1UHNtMFcyVG1rSGFtUkZGZzcwSnkxeGNidUZXUGFUTWFHYjI4Q1hKVW9Z?=
 =?utf-8?B?aWE1ZkcvUGNWVkZVdnV6TC8xcFdrQkk0K1B4Q1hLR0Z6RlJOZkdDd2Faa09s?=
 =?utf-8?B?WnFZSW4vc0ZLTjBCVlhPVGFaMzRrWGdJaFZvYW1xMFg0c3IyODNZUjNHR0pD?=
 =?utf-8?B?cWdjcmUwTnRWU3hJOFQ3OEdSdW5VVWtheTRNSmxiUldMN2ZoR3NkTWNYSTlo?=
 =?utf-8?B?aFgyT3paZjFyTEg1L2hDb2lWZGlsbVF0aWdzalJnN0RyTk5TM3FkcmhBWXpO?=
 =?utf-8?B?cXNMTk5od1dYU2xzaFVPbGFWeEVlVWtoelJTbTFRdTNteGpWQm41WHJkSWdr?=
 =?utf-8?B?YmdXanZncHNpMno5QWVSc2w2UDg2c2lEVXpSNjRESzB3SzdJaXdka2xpejVV?=
 =?utf-8?B?VGxNVVMwUTFKQWRYelp0ZkhrN3d6UmIvOGE3NFFDRnY3Umo3TnlMOGk1VDNw?=
 =?utf-8?B?aHBlN3JwS0ZLM1JZTytNOWZpSHdGS2JyMVRQamU0bWJZbHFiWENVQXZYR2Z4?=
 =?utf-8?B?QkplUWlvdFBxamtjY0JwNjVPcjhEY1JoamR5UVh5ZTR4NlZpV2I1dVNQVktV?=
 =?utf-8?B?V21hY1gwcExXVHpiNFlWSGxmdUoyNDJDSHl6SEREWjFXM1lPTXV5YTBYZ0ZK?=
 =?utf-8?B?L3kxYk5WOUErYm1RNGFscnZCZWlXQXZuMlM5eEhNbDV3WFF1RUpXbkkzU3NW?=
 =?utf-8?B?NkFEb0NTUzhGN3hVSllOVlpIY2NSWlZqYzNWN3cvNW53Nm5wNmtTYXdJTG9k?=
 =?utf-8?B?M2hSOVdCMmRnRzBFanRFeU1oRGNjZTBWbzRWMUlROUtldEFiVzJ3Q0JZcUtn?=
 =?utf-8?B?L3I2ZlVaZ09rc3BrMmI3UHB4OUo3QVk1eUQ3cDlPdkY3OUhQK2lWb2MwL2Zr?=
 =?utf-8?B?MVk5eE5Kbk85elRwR3dlSEhPZGVROU0wRzI4ZGswZlRaL05DTHNzRWV0U3hI?=
 =?utf-8?B?RmRxM3U3UjBBM2N0ajd6ZlhyMXRaVWhvNnIxclErWjhvK2loaDhvVFcraGJz?=
 =?utf-8?B?Yy9UTGJyRWg5QlVqTWRydTgyaVhCb3dURWk3ejgrRnRLaW82UVFWOVFGUEF3?=
 =?utf-8?B?OUtmS041M1U3TWovREY4Y3loNUc4QkVJN3gyb3o4cVVtZDU3OGZFZXdpamVk?=
 =?utf-8?B?ZTFvN2tSK3JZOE9pZHBkN0FiYnNRYk9qS3IvRVI1NU85RTJCYjFxcXlHeU92?=
 =?utf-8?B?SXpySUlaZWdaYVVWcHdPdnBVV0E0VkR6Rmp2WXV3d3RJa1lqN1lWcU54M2o5?=
 =?utf-8?B?U1BldDlmUzYzdTNvV2pUMElBajIxQnV5K3dtWFgrN09JZ2kzVmNkcjN1aitR?=
 =?utf-8?B?SmdYOHpWTUFrenhBbW5KSU1kUEkzMktvSWFQZk1KVGtnYVk1WXlIcUk4Q0pQ?=
 =?utf-8?B?ME5qN1BPVWxIeTBkQ1F0UjI2YnFNamlOOEVhbDF2MDVuNXF5ejJYTWhFRVBs?=
 =?utf-8?B?YUtqUXg1V1VaTitGWmN2TWhpRldDN1diUDdTNS8yem9rTjZ6aVJFV3lFRnRL?=
 =?utf-8?B?Sm91dS9zOGhUcXFMN3R0SXJ4SEVvYVBKeWI5T1hiZXBFT3dmRUd0VWxGRGYz?=
 =?utf-8?B?YlhiU0hSekJJcXJJTHlCT3RsVGcya1FLa1h4cnN6NkRudGpSekxnZHY4ZHY5?=
 =?utf-8?B?MTNGdy9ERGF5WExqUHRHekpETjUybUxCL1ZnVy9ka1ZJSjdjK0JwdzJ1MWVE?=
 =?utf-8?B?QndtOW9YUHR6MjhrRk1PUVRRQk0vVHE5SytscFNBZjFCR2MxRldFaGJoYmFi?=
 =?utf-8?B?TlJOakJ1MjlQbDNVQjBaTkVhTGREVVc2U0E5Y21LbFlOanhQT1YwWlRMMGtK?=
 =?utf-8?B?bWRqMnJrTU9hYkVzNTFXVERQS0FPT29ReDBzb3AzNTRGcFJhbmhJcHBGUWdw?=
 =?utf-8?B?WFNjN2UxLy9tOUhEUXZRdERqUFk4Mnp3Y2F0clVzSnZpaGZNQkZzaU4yWXBZ?=
 =?utf-8?B?OWhuaEhwU25XTk1PbUpIVmdpM21RNEo3Sk5YS0MwazlWUThPRUk1WVZKYWZ3?=
 =?utf-8?B?MTA3UkNDMkMxNVhKQmo1dldWSDI5UWVmMVhtdU5jRmlTZFg4N2s4bnB3NGRs?=
 =?utf-8?B?ZmM1Z3AxZS9QUzIyUnFzVEQ2TGdrdmEybkl0dVkvSXozb09MVjFJZz09?=
X-Exchange-RoutingPolicyChecked: TN/hrQQRhiMu7orhY5TkfcxB8wKvOXFiQiXDKdQjsr5RUvLazqDGKOQBgE8bzTfbMlPXMYnaj2sV+g1SENxEb59OVoiOHKS7Tx2VRkPrue4WQgX0I/sM1JaLw+Ih2IqsNv/oXUMlkz7TkGWRuf8Gh6yLCSil+pkYK5NujXJkMEZI8Uf37RPZwZl0BIwBWW6M37j5T9k1zUVtmyXtZQiIp0jP7c3lmhv8bEkW2sD4SALyj3V6nky5WUeKnLO1u7iq2wdJaiKpkljioajeGsgae/gO1yoXpmU/trMnAVGVzJmWZ9O+AtkHfifiujc0s2KC2tsjbAw2ZBEM498ziQi0Bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b4071-e433-4bb7-2e5d-08df4b50b056
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 00:03:23.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHlixZsVQAtp782wZtzx8Z3cB3Zq9m5L3FbxR11CRuykTFOUAkvNXfV0LM3OANluVWSP6E2cSkcsPXWzxQV7+PMTYQL0LlYVhEd9yuovAYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9814
X-OriginatorOrg: intel.com

On 11/25/2026 2:44 PM, Tony Nguyen wrote:
> From: Maciek Machnikowski <maciej.machnikowski@intel.com>

>  drivers/net/ethernet/intel/ice/ice_ptp_hw.c | 48 +++++++++------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> index 3a41c711e751..16333d4a34cc 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> @@ -2028,7 +2028,7 @@ static int ice_read_phy_and_phc_time_eth56g(struct ice_hw *hw, u8 port,
>  }
>  
>  /**
> - * ice_sync_phy_timer_eth56g - Synchronize the PHY timer with PHC timer
> + * ice_sync_phy_timer_eth56g_unlocked - Synchronize the PHY timer with PHC timer
>   * @hw: pointer to the HW struct
>   * @port: the PHY port to synchronize
>   *
:\ I don't like to do this, but we agreed on IWL that this rename is
unnecessary since there is no _locked equivalent and it is somewhat
confusing since the context is still locked, just not acquired within
this function.

Strictly, if this merges as is, it isn't the end of the world, but I'd
weakly prefer that we drop this postfix rename.
