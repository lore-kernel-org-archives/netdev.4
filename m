Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795100747;
	b=fBp+fGyWgTRsnjubao95r1elmrLcRhIR73Pn62mWi17XJQ+QMfDvjgD0wsPIvxeB+/uJ
	 l69ZHnh9b1gWfB6v1vsziU7EKG6dYCfwzzEZwXUrlD/VVw6lF7KxSkNZ/uAvdpLGYNbAw
	 ESlYtspQ5zUfBWh9U/Jh08hVSgcNjZ+B8y6RUwAVfCTlf9VNMZAPcwYNfa9OisE/Cw3oA
	 q58P9coWqaSIttyPQqPh7F53j/4/ukfRt/D0TYnxVqNHwDl7uUJW5xKMhjPRVWWMTqGHt
	 +rQS4TA3QMpPXyDAzls8cytuZBwCfu9KvzMBoEht6bEFWnJhLOpi9Qnk7qKD5ZsVpZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:From:To:CC:References:Content-Language:In-Reply-To:
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
	bh=E/7YztUOCIorX7o/lr2MMv6vJKIDqgIrHGbp8xzusAU=;
	b=npaBSHuXq2cX+xhyYAhxulwZ1EfiBYFz2zjp9GF80WGdln6Urzvk5l+ZUtSZWmuVSzSw
	 FaCEN9Y3iRPiXjaq61X4pQ7mmKc+ONvjycNrCSHdXX/4ZY+jtuUyiLP19oyxJ5ohaRwOi
	 a5MlEjizHfaSccYXm6xS313oHelTsOQ3HZwe+8pAQ/lfxp5qR390GntR6gAFLRN3sv1aJ
	 8AkigLvisw8nHFtHLMUqmqkB23hd96DOeN9blXJgkIVWpi+jQ/6AekzfsW/ymc1IRj6Sx
	 llx6Mt2sFKaF/Mm20qsJr1fvZEAbxsRp88XYnXOfaZ83vIOHGk9Dy37OIT+2Bvlu+gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KeUwp0Dw;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AgyXkzka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F50606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KeUwp0Dw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AgyXkzka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795100747; x=1826636747;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i9+3rKPYM+e27zKdYetGW8D25ThNHlxs1VW5UU28Mr8=;
  b=KeUwp0Dwnu9TcXKOZ4+EPMqxSZclmK+i10GrLVGXAcfD1jBeUuQPek1y
   DCI/u0IC+hdCdqFEEApUqSpSs6AylKe5Cs8Z2G+/q4UqPWhqS/TwOvn7/
   pilBklGhj8irN/rpTVFT5LsCgkmBgAjYjgc7eKhBdgK5XnWGhMVCamV9o
   eDOSOSrqYf+MfBDpHX1t5Lqh9YuvsQT8dCBzSZASWK+qfWzaYreNolbA9
   UpR5gsmSQpRh34xAc2d+9+D2L9Zy17Jk+vB57i25IirjGC5Yknyh0Ff1T
   L2q5DHJUjVUn7aNxUKR72PJT0leKKIEcukOPQuqxORz0mCd5EphE5b9Kz
   Q==;
X-CSE-ConnectionGUID: bgDZlFmySo+vWAijAmLNOg==
X-CSE-MsgGUID: y2VgKtz8TNiCm3GIDil9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3846876"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3846876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:05:46 -0800
X-CSE-ConnectionGUID: H5bNf1qlQkaYEHi2RuEuiA==
X-CSE-MsgGUID: e3E63VW3Tq28HlwUk/Kf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10351246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:05:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:05:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:05:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:05:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuwmRkdLLBYWszgbXO6Lo9mMQXbIDJhNwiUOMCkcFqCbWs/MdadZ2Syco9arRUkkgHISXrOBhJ6MEdjwwhH9eoA6gj/nrDPtAAVzD1276s60EL4xNTUfEjVC0D3jl3pOPSFZJ1vIeQ+w2QfTHgbM6O9KydOBHngPrJzKSZiVmt76WDuskMHStkGC9tXYBPNskUtcNtBzJ7+XPF4K5R8YFBYcYSA9i5NYNvzoFp5OK1GjcD6k6e1kck1TyDbspKrXYxqRb+oaNcDOE7A94iZxCEe9B/i/ZSJ9auzSgtNd8Q0W7WGp+tRpnz6zJxkx960EXiiDk1/uONtuoizhgEawSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/7YztUOCIorX7o/lr2MMv6vJKIDqgIrHGbp8xzusAU=;
 b=qPrVnFvDirtTqKAZopiYlGrtvZnAL6IfBV514qv7xBq4tQNQjAKA9hNljuDvGwNqO1Lgo0n/Xwzvu624frtF2kzp7BX9aNOwJDylZt0OUMVdOvVQBi9ubqcXe/laTf5PijO6MXiUD23FWBIhI+oxv+jQU/IIZGAN1fH3O0vRKceKQB0OKW/fK0VQZNwUEYRF9GUcxBEoqW63B4OkMvkOFpyoYF/78DGtqHYLNYq3a2coIalJnm5dyl0qiQF2K5oAlTzVcBp0yXseg7xEWV0n8GNPr5EEeXOlIRU9J36663mKWcRfAZKFwaJ8EmwMw/JKqld8NtsZ+N/iQ1C8YVn5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/7YztUOCIorX7o/lr2MMv6vJKIDqgIrHGbp8xzusAU=;
 b=AgyXkzkaRgzUlgRY+e2ORNLzEOX9wotbSzJqoiFwP0QcMJdyfs3dN9YWm5/aDrejnw41mH0LdaaK2GWzLHPSg288m2q7So4cvQ7gUxRXn/8LtnTyKABmOfrjJu0+ayFTvRIwifGIW7LtlpQuKQmVSsHqlIgUY/0wCl7K9oB+cNM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 15:05:41 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 15:05:40 +0000
Message-ID: <efc14fd7-647c-4491-8df6-7652b17b8094@intel.com>
Date: Thu, 19 Nov 2026 16:05:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Michal Schmidt
	<mschmidt@redhat.com>, <edumazet@kernel.org>, <horms@kernel.org>,
	<pabeni@redhat.com>, <davem@davemloft.net>, Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <andrew+netdev@lunn.ch>, <saeedm@nvidia.com>,
	<tariqt@nvidia.com>, <leon@kernel.org>, <mbloch@nvidia.com>,
	<jacob.e.keller@intel.com>, <jedrzej.jagielski@intel.com>,
	<anzaki@gmail.com>, <brett.creeley@amd.com>, <ohartoov@nvidia.com>, Petr Oros
	<poros@redhat.com>
References: <20261110141534.95614-1-przemyslaw.kitszel@intel.com>
 <20261118171241.74a70bdd@kernel.org>
 <15730f22-1283-441a-95a9-b68874b35f43@intel.com>
Content-Language: en-US
In-Reply-To: <15730f22-1283-441a-95a9-b68874b35f43@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: db1aa5c1-0027-4cab-8c26-08df464e937b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|261009223027099003|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: pXRnLzLefM3G6vCxews/1Aflz1ZtcNSxW44e7nTmvo1m2gt0yHtszwOW6p9YhS1LY+NXJ+g9LJjVOziIgwMgGnj66030WzE08zcXFBbiyp6aFSCVwPLWcRLNhVp3axytJi4YH3rZUyhCRaIwUrnDBNxgkqjxnly2R4QxGqPfWhMzG64KXxsNYiMtts48EhrT+nQ3WtGCBqRpISZCJ/VD+xqI+WVCcwAF8KmRzYchBEEu2Q4HWsn7pzLsStRr6mGv0QLq56+vJHfo/vyjHaF6CE+Auer7pyAHKUDenmafSZ73v3P8XAsqTTOfM9lfY6CMO9UncJxQgi6m0yv2zAcfVVAlZ9Do2gxXybGnjEChase1+SZfU5/6NWQRhZ9Z4AxfFOrgFYRN2nPh2sh2TcAXgwyCiOgjEsTN5awSfOBFIHHnD91EmQYaezdBuRQe4FEybvmPOFZq6aBCgjRwFtoscYZMx6Oce59Z/OFpuBuCFkoJU0UX/7B3xRcF0/gTkdRKJtstVV23rLWenY9z+KLwp+K4j8B/stAOByNFFQE0Bo4M69A8Ga35rY8klI4ubFHBI7NQ0QRueq0Gfzv2vatuNM2HLgkmiptUpe65DNPmL+2UxR8hqmY35+q897l+la5S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUVrNE15dCsweHhJWkhCRVFxSlNOczdxRDN5NGl6RGo0RW5vQmJnTlZROWxW?=
 =?utf-8?B?SGUraDRpdGZlUFJDbU5reDlpS2p1ZWYxK0o0T3E1bHFLMmwvaVZzNitwUGph?=
 =?utf-8?B?Q1JLQjg3dTlMUnFYRDJ4UTJkUDc0TldzSXN1MHM3SjZhTkRCdmljMytHWTdW?=
 =?utf-8?B?VUpvSURxa2JiNFlRYnNUYXBSRHdHNGUrT0xLdTRydm13M25zcXFINGVDdHBi?=
 =?utf-8?B?NXJYUVFHL2t3Ny8xSS9JWVNXeW54T0MrUXFWNndxUVk2cG1GWDI1WWl0VDIr?=
 =?utf-8?B?QlBoR3F2dG5oaE9XV25jM0FOQ3pvekNoVzg2WXRhcGtUa1hpWjUrSytaZVhR?=
 =?utf-8?B?Y0JHYTFURTRGN0VKYXcrSEhMUVFaVmVtb1pjUTJrNGlZNWNPQWs1cUNxN1J5?=
 =?utf-8?B?M0pCOXorUHBPOVBiQU03RnljK2tDcXBzWFpJNlpId0FVdC80YXkrTHhhcjdP?=
 =?utf-8?B?Tkl6TS8zUlpZK21idU8zRWJxaURHTldIdXdqYnFzVGFDR0hsWnBtZXRIOXdQ?=
 =?utf-8?B?VWxVU0JSbHdkZTZFNkJhdDl3TGVROWhmVlJySmtwaVhwdzFNR3hURU5KOWUv?=
 =?utf-8?B?d0p2bTRRUzdNYjM3RmVGOVhMNXYxNzdiL0xEaHVCbFFQMGxwQXdBc0d1SUhM?=
 =?utf-8?B?ZWs2OXQrMFpBUWxwTTFYNms0Q3VCMjNUWXgxM3pydjdQQjcwblh1alFpaFJY?=
 =?utf-8?B?bkJDbXREZVVyemhkLzhTYzRISlBNajJFK3pCbXh0eDlJQ29uNVUyNWRFNXAy?=
 =?utf-8?B?Y1FBRDM5dUxqMnhsNHJLVWpBUkE3cDRMaElxcU12UVkwTk9WbWZ6WGNFenR3?=
 =?utf-8?B?NWVtalJ5UWwvOUpYVERoT0FMWFRkaFRZSHIxc3ZoZGZKZ2hNOGRlZU16NG1n?=
 =?utf-8?B?YzdMdmphcVYzU1NmeE16RktUNlM5WUJKVzd3eFdDUlE1WXUxQTA0K3F1ZlQv?=
 =?utf-8?B?ZXdqY2ljTEZ2VG5WZllQVmpoM2VRbWNIdUtTMG5JeXlTbXBtT2l2b1ozZGZ5?=
 =?utf-8?B?RUJnN2oyVTNReG1PRk16bFdPQy9MUE5QSU5hV0h5RlNiUFZyeXNwRE1UcFZr?=
 =?utf-8?B?TUczR29Fak1IaDVzYmUyK3Rpa2ZEeXliamQ1SW9zV2JjazlNczZmS040dWFz?=
 =?utf-8?B?blFWS2dqbDZiek1zaHczell6WGUvajI4OXZOdTdFZ2d3UXBjRC9aNlZRcWJr?=
 =?utf-8?B?UzNpZ09pOEdMNzMxc25zUjNXTk42NE9VazJWc2lORzVrSGJZb3pVUG9JRGNB?=
 =?utf-8?B?bW1ScHF3dEFlZGJLOEtKTHJYdGRLOWpKMFZkd09aV2tjV0JMQUk2cnoxYlBB?=
 =?utf-8?B?S2ZYSnFwSFphWnNQTkFMK2dHV1NhdHVZeGZ0TGJWZUJhbmU1RFVaU1pHa2JJ?=
 =?utf-8?B?NXh2dTB4OEp3YkNEeDhQSXFGemRVTktqaG5TaS84Vk0zVTZ4cXlrMXZpTUl2?=
 =?utf-8?B?d3hHMGNVVXFac2JENkRqUG1LbkMvL0ZSeFVOZjZNbkVyem1zUGx5NjVsRmZq?=
 =?utf-8?B?YWt4MzVodEp5UmN6cithNmZrOXBLeEtScWxJVGtoZENZWXhrVWMxQUtoTFov?=
 =?utf-8?B?WjBDVXFyUi9oaWMrY1FGSGVIOFpXQkR3ZTJRU2RtNlpFdDN2d3BpRytRVnpI?=
 =?utf-8?B?L2dTSjNxekxQbTQyREw0VHZ4cWVvWkFNTmpyb2o4QnYwOU13MndLN1hLeXd1?=
 =?utf-8?B?N1dRU2JNSlpST0xCS0RoaTlBWXZ5UERrY0NpVmoxanh0eVNIaVY0d2FlUk9O?=
 =?utf-8?B?dWY4NzJmdm5QMDBZSytoVnhtK0djMHR1RTBYN09RSjBrRGFCYWI4ZTVBSWg4?=
 =?utf-8?B?Y01XbDlKaXhPQS84RE9aWG1vZFc5d09oZFNaN01EWGNmZCtTYzl3Nk1MOXZV?=
 =?utf-8?B?Q3FjbUNOdEJHdW9pUW84Tm4xd1EreDd6TlR3KzdYaTh3NnQvZGlRWGRwa1pY?=
 =?utf-8?B?dGNnbTBNZVNOaTJJYzlpWWdqN0t2Q1ZNVUxpUFpyTklmV2lnZkVUR1lsWUpp?=
 =?utf-8?B?WVBsMTdMeFZsZnBBK1lqWFR5WW5aenI0MVlxL3kxOGlWVk10ellDR2dEUjBi?=
 =?utf-8?B?WVVSaFJPaFBCWk9ESWVtNzlCcE50cm05TWVrempDRDc4K21nWDN1SHZQWVhW?=
 =?utf-8?B?TFFoSDlhc3EzV2lQQldPSG9HVFNQN3dTU2h1ckhpYkw2SmZkRnkrNEJ5REVM?=
 =?utf-8?B?TGtuaDNGTzFmTVJkSzdTZlZibHZJdHJSaDY2Vi9PcGMwNDZ4US9MTXlaY3RZ?=
 =?utf-8?B?MGNZamEzZEZ3dlVLazd3emtDYzVRSHhmTCtkbUZoYnRqak85TlV2WExOMVZq?=
 =?utf-8?B?L2orL3NxV29mL1h2SGd5bXpqbS9HaGNBVTJ5a1VRZFlTODA4V2F6VUpWTzYz?=
 =?utf-8?Q?vV15Y69pvv7ZvP4c=3D?=
X-Exchange-RoutingPolicyChecked: MFAmF5rA3rHxeTb6alxs1BfDaTG704x9DwfAn2SNh8ETozmfuCv23WWAOlBkENBCF3jartTNSBSmpTcYrLywob6rgzblbIN4v2Px9wnDgtqQ4lhCw4/5aUcH+wkibMYUA+5JOgXnJe/2e47XudlPEYjCciRpKf6Sxp6Y3tar0uBM3Hngua50OWdoFRb6UeztSJUD9ZaoMZOuthAitlLy2dU5is9F5DnHZ1+djXP5phNEn88cI03t4Imb/jnA+LZ5fMDBEFeHi2EFVkeTe9BL9KN0ZDvVNgVXncXQ2k/9T0kerTegz2uuZ3SyNb7TGRWUiNtrQ1A1ra0MpPSKyH1KJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: db1aa5c1-0027-4cab-8c26-08df464e937b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:05:40.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTwzqbVmki7WXm9WV/F3EboJh6t68pUiE/kIC9sISecp1BuL6thDOJ2mFuL19dwPerKNdmqXdWYHxEhihSPFn6g2TqizJRFbXYb6XTWMprw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
X-OriginatorOrg: intel.com

On 11/19/26 2:10 PM, Przemek Kitszel wrote:
> On 11/19/26 2:12 AM, Jakub Kicinski wrote:
>> On Tue, 10 Nov 2026 15:07:09 +0100 Przemek Kitszel wrote:
>>> Also available here
>>> https://github.com/pkitszel/linux/tree/xlvf-v5
>>>
>>> The purpose of this series is to allow iavf to use more than 16 queue
>>> pairs, in two modes: up to 64 and up to 256 queue pairs.
>>
>> Doesn't apply, please rebase. When you do could you chunk this stuff> 
>> up? First two patches probably stand on their own?
> 
> There is already [v6]
> 
> there were a simple git conflict in the 2nd patch resolved in v6
> 
> would be nice if you could merge the two first patches from there
> 
>> There's likely also
>> bunch of refactoring / prep you can pull out of the drivers?
> 
> will see how it shapes after addressing your other comments

I have a sketch impl, will test it more before sending.
Turns out patches up to 11th are not changed (thanks to me laying out
the series that way in the beginning ;))

> 
> 
> [v6]:
> https://lore.kernel.org/netdev/20261117094913.100756-1- 
> przemyslaw.kitszel@intel.com/
> 

