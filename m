Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617086;
	b=Nk/abI6dc86U1/W4WEr2REHAIhLLq722PuccaTIw33pEaIrJsMhAp4fMpyh4RWZcWoue
	 IQ5ZI3js77u/Sx0tNPt7dyia/KALCCYx1QTwemgaa5dGwBSlbDW7WzbZEv6HKF/bIHxeA
	 ySvSXBnRpeDegnnQa4BDXPjzmNgyfEpegotuBojL8tONTwzMMolhJ1GSbp/LQLU1OR8bZ
	 wawIQQtB+SxS+YS/LUMIt6+XSfyGd8l6HitFoS+MiPIuvFqcp+itdSoLvtKPXLOaQeuxB
	 6w8PrJSXxaVZnH4NsGcZrrsZxektzXQP5BSHYEO2FSMFWM0c7q07mCzyUiBfP0cDyeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617086;
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
	bh=RPO2cq9VZoSjEQASARb2dUfIrWp1dg3KPb6NKJxfuB8=;
	b=FtAl/lFrJ67+L2n3aAaa3EUdzYFu3jrv/JuCXZhL6nWIryWBQXafsE9ZW/aKI5zeFxa/
	 x5OLChS7c0jtQuLEx5q20uQmTSo4//FUww3xhb7mJOScAWnGR3N64bzsW5nhSfn7+fYIL
	 0dVgESiNg40hzWrrNvJIxE0FTgm3WIivd5Sg0Owu69/qn5aeTiV+F4HY3IVWnqGgDvDda
	 QYMOK25TNoD6Kw3g0EZlUTdXur5O51MHtWw2hltkRMOrE9FwpkC71pAeB0XVNgDSrRCfY
	 JTPLplHSzZq1daoWDHHT0yE27m7MtAbGFZsVQY0yK4//DP/rBi7j9U6KmeePgVtMZOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PlJWekTN;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VwnfbMH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17B606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B17B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PlJWekTN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VwnfbMH6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795617084; x=1827153084;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wUj0ZdIPgCranayi03VC7KQ/fXjSiQRN5mhb96XC2wo=;
  b=PlJWekTNPZ3iPvWrkMoXkYrwigV15oxSZXP8HbrEqEe7LIRJ/htwECiY
   2ABjxHRSxZguwIOGH/RJuBdXVtrATAQlKVD1MV5V30vQCetYkPZeFeXjB
   s4ZwXcBydJKzjYmMeeHUpKZjRXLv++Y2dxQh19JD/ThG4nGvFFZgnmP/S
   /G06RGhMmUm4rlGc4xe3DvkXv7EhnSARvU9EbvCPkLhXuBNduu6DEWFNm
   RSdeIR6Zz+rZhxj1eOF+rDqZkqEfb5cHrtecozsDsCojoMjKpQ5B/ADdu
   x6A1XfTtVjYY2R6miowggmPpOHO7JWj31sBx/N82R3xaOHaeHi3SKJcVw
   Q==;
X-CSE-ConnectionGUID: MW/6LO7mRzCCCIA2aqpemw==
X-CSE-MsgGUID: NIlvrOh7S0ynHw5zWN/VYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4378696"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4378696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:31:06 -0800
X-CSE-ConnectionGUID: 7hTzCLeqRRKG2399604aoQ==
X-CSE-MsgGUID: TGLazwAoSUKtwfEPCxXLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11763707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:31:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:31:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 06:31:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:31:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWRVL6cQwrdFn+Cm7M+1llWmPw0mrM/xAzMtYNpnc1+MVvHKucXNMQ4Fo7qpekLXQ6Nyjuh8O/g5r5IW7j/HjKaW7CFAcF085mrbIJU+CRlCzwlU/h+CSMCQoumGlyFaQkUcmWddc2w8ddGlQjypZEWrAIxCLxMJW+M+ha8rpTvA1WKVQzO8c9Y3N7QSEy23EM+Ht9ARxumnVoYl2nAU6Q1MHkBv61FgoYUni6pnTdMSCgDrw0yPnebdl0vEDpRClSp6mNUUQCQPQmOD8eufcxkROD4dALLADJVBAp+c1JAgRV/4vhSMY4P70rrrBfyrvzit8jNV5XjgCOsoVs8oLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPO2cq9VZoSjEQASARb2dUfIrWp1dg3KPb6NKJxfuB8=;
 b=JjQ1mO5TiLTbrmQMDM10PRhloiXQBgVCPuf436kDvGOsszA+f15UYXdGojYOF8flVsORUbwuBFV0cQ4MEQrYUBlrmLp3J0S5Or9M7fAPEVnD7a06sseaoxhBADqc2S6tIg+MP71s0L4Hg7plnaUB9Swy+BZvapehrga1W8J4nueDkBdhNH3UOeIOzWGmPdR4dHgSb7a1DtK62ZIrDRngARcu7pMVevrWnj9gb1yosY1UMz/swdpq2qbnYnNmUNkQqCZzE0VwRtF7ZfupNZ1VdNSThPJIIeZ1F6LBZyfxpvLh3m2PiR82xHeG5AuzKvpMF0wUd4BxovhVuwv7QwEljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPO2cq9VZoSjEQASARb2dUfIrWp1dg3KPb6NKJxfuB8=;
 b=VwnfbMH6gU/0yKuuOb9Ohtw6uwhYwazWeMJYqkR+6bUuTAkelWqRuh72ZWhNEsuGhxAX9TYunBtpNaFlCPR+dh0zYNeoWil6B7Axxm1HlE7TSGYWjedIOZQAP2tvjMxefeeA5ln0srlAb6vmq8dE8cDgvA7HKLrQ5rBs1m5aqQU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 14:30:57 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:30:57 +0000
Message-ID: <6ce9cb98-d615-4bf0-990b-35aa4b970503@intel.com>
Date: Wed, 25 Nov 2026 15:30:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Petr Oros <poros@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Jacob
 Keller" <jacob.e.keller@intel.com>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@gmail.com>
CC: <netdev@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
	<edumazet@kernel.org>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<horms@kernel.org>, Marcin Szycik <marcin.szycik@linux.intel.com>, "Aleksandr
 Loktionov" <aleksandr.loktionov@intel.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <20261125124652.3843638-1-poros@redhat.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261125124652.3843638-1-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::35) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b116600-58f5-4bb8-5992-08df4b00b7dc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: bWTBj4dmMF4T3ygdoFOxsEWdQeaym0GnfeavnE/UvCZGEDx03H66f9otwV60RFB8fExgyU5MepWNX2lDta8FNhW0NIwTMDgVUYOhXMiHLlh6AtjF14/X7v/Mn4kwzRuzODtkSWNZDUXryadeO0mVy/W3+E/7pn3NPQ91x9B/+iOgTt5HfiDN4qciLsv2cDI/905r9vF9f2EjZt0owhufnx5MVCcjlSCm1obcRGfWWLMFU6pEelQVH1juCGj597J4PLe9xJQyEjLdE8AzTH0tWvIx5okBMVna9ugdPob0MoimHCNcGfla/fZ6ET3iKl59h+Ffrz1Q8FV9+FB6NqFB27cakoaO8OScgaLxA2u5I1ApWpl+c7Elxtk++wQqDFmx/B+kNa9U8Cgm7AahP2LrjyiF0bIjTZZlXn1LAsajb8QYhu7ApD7ZVrl42e0ZUgX6F4rv41gts8ATLqvQNUo0aXPAamn30H86sepgh9NBhgT5gYE52kQ69jj438cIkf4NTh/rNVk6IkK7xzaRZF4woqNzis6t0yDfHVdhoNXqJt6h5b0Z1lH6UHZ2HnXdOU9swS6oewY8Gf50tcO1Uanv0IOuopPXEIlFdOsIWZ+reZrciA0rcRDqO/AYZYof/LoVkum3uv1b0QVyAWiOPa/IejaukdMdwGZS03Lwppktabc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUV1d2lIeGNIaVdidVAzU1RPZGxUQklKYWE2dGxoeE5vMVkvemZrRExWZ0h2?=
 =?utf-8?B?TUJiM1p4TCtOMnNwTzNISVVhRlhKRmh4NFdXb1FmcU0weVlBbEFBNkx3USt6?=
 =?utf-8?B?OE5pV2w0dDNXODdkRFVQVWZEOXVvS1EzbStETStsK0tCYVJINWM1c2dIaXBw?=
 =?utf-8?B?N1hHWVNCVkxkdlUzUktpK0ZwVmRBQnpVbGZ0MFgvcytNU1dDRzFjRW1WWjVv?=
 =?utf-8?B?eVRyRWxiTTNhbTFDcUVjQk9rWXJVL0dZYm5BVmd2U3JGZ1lBNWdycGdQZVlt?=
 =?utf-8?B?WWVtRGwrYjFKK0IxeFFXQ3lkWllxRmFYZEZQdXM2Y0V1NkpER3NsZkJWK0Ux?=
 =?utf-8?B?ZHI1VUROMGt0TkxUMzFHdUgvNkwrWXp1SEpnclhTdGZlRDFsZVBQS215eER1?=
 =?utf-8?B?WDIzdWxEQnloUnZpeUpDcEpzL2JleXFWb1RHQW1qemFRWFNPWmtGZjBCcm1J?=
 =?utf-8?B?alZNWkZiSWpjeUoxQXRubXJvdjhTU3FTR1lhOFFIM04xd3NLZ1VqWGQvVW0z?=
 =?utf-8?B?VDMwVWZDN0RURDJpdlJBZEpQMEJzNlUxRm5VRHJtZmxtdnlLNmZUZTBSR2Uz?=
 =?utf-8?B?b2pPMEd4WmdHUHdoNE9xbkxCdE9aYmFoUkRnZk5sOHY5Z09WZkZLRmZaeXZ1?=
 =?utf-8?B?NVVSRzROOHVlbUN2SEtVNTN5SFBHbkIxOEpRcmJpYUh6QlJzeGdDZythYkY0?=
 =?utf-8?B?ZmlrNkJGbmZ6Q0RJWDRqbU4xK2VyUUZ5VXEreWxEaWlxbEZwK1NLYS94UWNE?=
 =?utf-8?B?UFZSQ1k5a25EMmtLbDdOZ1FXVld4TnRFWlpKUVBwN1ZzRHlxYko4WTg4dlYz?=
 =?utf-8?B?eHFPNUhZTmZhbWFNaCtPbFVydFZ4Tk5HNEJYalJ5WlB2eW5QZ3c1Vi9JV0px?=
 =?utf-8?B?VzBWUFRzWXZXOWxiSktReW8xb09yL05LcitDOTNKbFlacUoyYTFLYWYyaVgz?=
 =?utf-8?B?NDJ1STNOa1NoT3JYaEJqemN4TFpraUJJWmZpemhWaVJna3VKS2ZNMDhCMXhS?=
 =?utf-8?B?VklBc0dSbW9Vd0N4bXBsU1hBdFZ2MlNnNWQ3YzM1bUFEdU11MXdPcWljMjNQ?=
 =?utf-8?B?WnJ3M3JRY3owb215ZmEyVEtSRzNEUEZ2ZUpLTy9yMWVoR1F5ZHphU1FPZTBo?=
 =?utf-8?B?T3prVFR1VTRZM3pjWnRwSjJuZUdxVWF3UldWaWk0TzM1dXN0RXNQYjlsQUJQ?=
 =?utf-8?B?MEtkVmFwWW55RDdSdmtBaVFDaTUrd3J0QmpzYnBlQzVsUWdRTC9oWDZCVkVh?=
 =?utf-8?B?ZlErOVV0bTZNUmV6aUlzSnIwZ0p1a0ZOOEdCSnV1ckQ2dVZPaDVlT295Zm5o?=
 =?utf-8?B?OVNkMWJwdGtJQ3dYdzgxREZwRk5ZQkRJVGVXS0F6Z0J1SWx6TmliTlozRUpw?=
 =?utf-8?B?V2daQ3pkN05kZFpLN01samZKYjNFcWVsUndHMXhFWXdIdEd3eEJzK2JiZTRK?=
 =?utf-8?B?QzIxdTdNbGFuQjVNdGU1SHBheVM0YTdDejRBc2hiSHVUdTlYSXJJN1UwTkVi?=
 =?utf-8?B?WXNLa01QS0gyQ3dQUGVNeVdLUWVhNGNzYW1jaXVGcmhPZld4MkhWTENBeCtv?=
 =?utf-8?B?dUZCMXUyd1ZxN25FcEo2dHlycVhpbWZVVHlwNVNFenROendUNDJPR2Y1N0N2?=
 =?utf-8?B?SDJwNE1taFZlbTM3NHl5WWc3S0JSUWdyN3pTbHdkcHVGS1MvRHZTR01GYU91?=
 =?utf-8?B?cmExeFZNQzlWNVF0L1FvUjhSUUQzZVk2NXBGZXJtMWRKMHhBa3pvL3N3RjVK?=
 =?utf-8?B?Q1Z1NWFiblRMbmZEMi92TEQ4SHdqcCtyWW5USnZiYmFYaTNoVUdHeUxDak9V?=
 =?utf-8?B?MDZlNFI2dERERnZaNmZZdWF6enEwV2pHMmU2anNFcXhzK3lCd0VLNk1FVUhw?=
 =?utf-8?B?a01lL3ZrY1dJbE1Hb3ZjVDZsRDNaME9lWG9kMWUyUUJwbHliSlVJZFBvUG5t?=
 =?utf-8?B?U0tLTENYdmptcjd6cHlvTTFkNHJXZ1ZuTzR3bklRSis4b1lWOFd5bkVHK3lL?=
 =?utf-8?B?S2s3SzRtQnpyQVN5ZjZLRmFMYTdsaHh4cG9HN1pIY21RMEFOUWVlcEdCQXhH?=
 =?utf-8?B?MkhtNEt1Yksxai9NVmtBVDdYdTRQekdhUWhPaFJHalJPbnQ2cXo1Wkk4K1ow?=
 =?utf-8?B?M0t6UVpJWG9IZ3V1UUtPRjRCMFR3RVVwZWluTjBrQjJ2c2d3WTBCSWF0c3JY?=
 =?utf-8?B?N0NKVDY1MUc1Y2dtTTIyNVNyY1BJMFgyUnV4WjVVWG9HTm9VTmNQY0hDNk5F?=
 =?utf-8?B?UjVpWFF3S1NQbk5uaWlGczh6cFpEZE5UdlRiQ01VNGdyZmpCU3JkOEYxZ2ZI?=
 =?utf-8?B?K1c1NzZ2NHZpRVRMNTUwMGg1VUFLUzVmaENrSkw0MlpDcHRZVFZTR0hyZVZn?=
 =?utf-8?Q?oSyOAsNSljAqmg6M=3D?=
X-Exchange-RoutingPolicyChecked: Tt4TEIjYB1/QNHWnFyjU2gltRFgvGN+/8dc/Nt8+2Ai/t8X7Cr9oS7OQnIqdoMORCLD/8q/nURiuQJLeWi/IUeIScsRysMNe9Grfg+LtVV0l1DgFplIL2fqjGOOroea3cI7iPDhC5LErwOMjdHdUo4j36ZKu6wIt7lWtJ4DGA/Q5FVT0X+mUTuInNlKBrAlpm9nG/AOgiknxYV/eK56Xr7zyOS3whvXGPYwuKBcpNZqbgBYDWPxc3G6zzaOp0ipYvieC7tGk6+b28aikV+4wRVGdqphBCK2nwCXEwvAEa+RkgSceZnQzj4ddFxGveQa+wEKT2tpicwNaFu+lliGixA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b116600-58f5-4bb8-5992-08df4b00b7dc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:30:56.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dnj40XkmemOEpKi3dZ1D/BB4GTgALKlGfEcNyAka3N2JKc+YnjBKb3N9BShYj9O5FKTOyg8Rw3IjrYk03iRakyHGrFdLu01gVfxs+oxjOzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: intel.com

On 11/25/26 1:46 PM, Petr Oros wrote:
> Thanks everyone for the input. Jakub wrote that netdev is happy to take
> the patches directly once a maintainer acks them there, and Przemek
> that they will ack more on netdev. Building on that, here is a
> suggestion for how it could look. It is only a proposal, for anyone to
> comment on or change.
> 
> 1. Fixes could go to netdev as [PATCH net] with intel-wired-lan in Cc
>     and be acked there by a maintainer listed for the driver, so they
>     would not need a separate round on iwl-net.
> 2. Patches that are already queued could be sent again directly to net
>     by the people who originally posted them, the same way.

but please not everyone at the same moment ;)
on our side we will try to not only human-review the code, but also
use local sashiko and to run the code

the current time frame for that is ~3 days, after that in netdev
patchwork series is marked as "awaiting upstream" (yeah, weird name for
"awaiting intel" :)), another revision of course refreshes the timer,
but it's not good to repost just for that

> 3. Later, once this works for fixes, the same might be worth
>     considering for net-next.
> 
> It would also help if Intel updated the MAINTAINERS entry to match and
> kept it up to date, so that it is clear who acks fixes for each driver.
> Jakub mentioned adding maintainers or splitting the entry, and the
> details would be for Intel to decide.
> 
> Does anyone see a problem with this? And who can make the final call
> on how to go on?

that's correct summary

> 
> Regards,
> Petr
> 

