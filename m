Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791053;
	b=U0USxk2AoyiwwQ0grOTX/7l0gpnWHXtw8CNuXch2UiV5/JXN09Lgmwvu+P8ZE4HU2k4g
	 qC7I34HJXK5RngA2kjo6vHfmxVC9w4bb3o/PkUCg7Obv9XoxfQB5cYUTcLIHf1eK4ZRx7
	 /13AT+YLIvqeK20N/xJEiqf+Rsvt2y+bPr94M+eKwYU8GYVjxKvOMnt85s6N3o/vmMBcr
	 pwsairDb8OmVUrZCmJ6Gn6PLOFi3bTA9uEJ+XKmQqho5A6YCGfMj0+kSuCwncgVVQkhxZ
	 +6j29pGfvHsnRf5VMKlv1pULMCP1V4N9sdjB7tzSxR6bGH4O6yF1Wl01frlqwPbKkUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791053;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=aUd3T02Gc74duTmodEL7iM50DPzhk1ccT05XBht+77M=;
	b=v8AyB5byDFepCvXqAycMD3kFeVWzydLrKnRd2gPKM6enTk5k45fSlH6WULn6ICTWoZyE
	 1XJ9HBtpSjcQJj9mmxKMbu8jHHPXTVdSwY0grRX+1GtZOe4BEgQtQHTOICIEVP54jX53l
	 duAwke/rjzFt18QJtQslUADet1+k6Q/kGW7MP8iKxYDfKXboU53L/0IWckfWztSAolKq9
	 jUV2HzZu6Y57NbOPOEYMHknE16DopdCPRb7bm7S0OIKcFtgNw2ZFHt0CULCs7LNL011pO
	 net5ioBIz24GQRfP4Ja0bnTtzYh0GzSLuoRdN32NhV1LesHGjMc7puSzbJsZUDKL4uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bnNZJ8hv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E79606A32C;
	Fri, 27 Nov 2026 14:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bnNZJ8hv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791053; x=1827327053;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fnSC2nvMGZ7fvY3oROjbD97/wxW30z9c9EF/yrrlcwE=;
  b=bnNZJ8hv29CYa7zr0Vxmp/XJwiZ4TvP+Y6Rx17sCglspzSW6X2husLcc
   08PjnhGHVYbPKr+ExjKAUStgfe1yc0mWVqotX0o/yP+4i+6pGMoUmW9Ts
   PgDKW7xInHYKo3b4Jh5R6PNILiGuS74aTbtOCupxLLCdejA0YS/9et+Q1
   alU3yDmrhGQSxLH7VR69s1Ei311HpnAFMS6DbmDN2QNvXWfSjIGwwUG4r
   H1rPlEoTUnC7rNcUVsOgxnX1ib77dAZEZH/qmBBCfOzgFmYNxvOw1jBHW
   W1bRsBmYk1wx9tLRqQr4EMbcnQ6/bVDa1KbleVsmQMfHjPei8RZZgpi97
   A==;
X-CSE-ConnectionGUID: ysvXFK1SSJyVYbsexbRSuA==
X-CSE-MsgGUID: 0n0oPVHOSrKxmrH59MrfYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4614985"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4614985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:50:52 -0800
X-CSE-ConnectionGUID: ykY4GW1VSjGp/4wSDKvgZw==
X-CSE-MsgGUID: Nd8Tk76KTPCJ5W6PeWrP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12445261"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:50:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:50:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 06:50:51 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:50:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdhBF1y/YMwZTxlDJ4VOSiFyZ8RPRHEKzZPe7iTMu5tQyzNhASCwl2l3ulhTnlMjjGsQHcICBXLroNdPEOckU5E0aqXi8LjBGVxEM0pMFq3rkqOqXWkN52/k4+RXfYRZksvVulU05geQa6uuWCNotQJmzsv/xmIvBA1V8Kxk6tlEdqLTUgt9Ilid6hCGx6y19nwS6a+jL7HSfb9OVm1ROjQ2ZtMRyBMu5gQ+uWBPOrNZl80SwqUQ5NplN/0+YEKIcqE+pNAL3iVxPpgLMEnMmqbykzf0o9cChbJv38+0wBL5se97bK+c00RO18FwfdpMLvY0RQou3I2SBFzx4QwxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUd3T02Gc74duTmodEL7iM50DPzhk1ccT05XBht+77M=;
 b=ORBSWkDxSvUC2S9Q0dbClZXbmm9dRh7y94twTCiP5X56rBhittUL3m3Zt50xJ/aCYLaEzB7+o5L17bfnzumGs4c3wLS70QqeSgh6JJZpWjk6/HwRSQWMMtkwrXcVC2WRE+rSThQuECb2fkmS5SXKiLev9iucbTRCnYR4F39Cc0V+w40BTSZ0lpR2rdfDLxUUczPkJlDGCYGTEg8yUCj/NFV9ouXc1frDOawmJMcSme83GR8nAy7oPLhyQXKe9nyEdo8NTb5fCS8ipsJ2N+jPFYTrH5l7+ZnVn1781rMkYrlkENsUHNRK0cXZzP/ufkt6nF/VizsfVItbU7fBS8QW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 14:50:47 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:50:46 +0000
Message-ID: <c0b3a1c9-29ac-4833-84b8-59e5776b0726@intel.com>
Date: Fri, 27 Nov 2026 15:50:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 1/4] ice: stop the service task before the PF is
 unloaded
To: Petr Oros <poros@redhat.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, <netdev@vger.kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>, Simon Horman <horms@kernel.org>, "Michal
 Swiatkowski" <michal.swiatkowski@linux.intel.com>, Grzegorz Nitka
	<grzegorz.nitka@intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>, "Wojciech
 Drewek" <wojciech.drewek@intel.com>, Marcin Szycik
	<marcin.szycik@linux.intel.com>, Martyna Szapar-Mudlaw
	<martyna.szapar-mudlaw@linux.intel.com>, Ivan Vecera <ivecera@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Jesse Brandeburg
	<jbrandeb@kernel.org>, Rinitha S <sx.rinitha@intel.com>, Aaron Ma
	<aaron.ma@canonical.com>, <intel-wired-lan@lists.osuosl.org>,
	<linux-kernel@vger.kernel.org>
References: <20261127085714.1207361-1-poros@redhat.com>
 <20261127085714.1207361-2-poros@redhat.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261127085714.1207361-2-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0314.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::19) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|SJ0PR11MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bc416e-02f8-4651-7224-08df4c95d1ac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|261022105027099003|10067099003|11063799006|56012099006|5023799004|261021123027099003|261026121527099003|261028144727099003|261022075727099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: TlbOhaclP0OaDErBqE3gkN1El8k+NSfonSs/3VwKDLHaKYrNVWNgBnh8EJkuKhQbcjDWtxoXh+PsBC77MSQIwpAnf9BFyqo3i80uKqXnO7e911ZltD+VcGLtXvwezZSZnwxbBJOE4DMR4AjjadQ12MnwnZAsGKniyByTzyps1dVtI47tw/WCx0bWNpbgISnu6yJFkU+inIyDwmS09GSa7zirfjDoR3KnolZRBS18vckzaIXH/gXKzAhwB8Eg5745dlaksLCBN8vMAXrJpqTLLj21agN+wl4pP0k/0TKeYysZMNGF9p77cvacG6101wX05KfPud4XfdfMPp7I67dprwCTlIKugod594jTZL1TTbgqWJUEbpuoOfp0+q9bla+Z9MnqBWtQNCN3JKzcEux8G1FITj3nPjo2oM+3SAjAweqIyRudU6ZMPNU76LAkBOhwbDRVrYGUHjTz8tv1U5I4SBt0T7cEScvTkKCvBRm9imJ2yUc0sy7gYwXexiBmiylKafkqEFPADnf9mSuJlOlV04lkhYXqF2BXf3vWwdaHyqsdv795kODFZX5waYfVtEnBEghtBSH4bGlPGj56bQDCqDEoCSEhQVTrb5+Ni7a+p+76IoQCynuZyzLX3iFOFmC/v04eED57LwnqA2izaYAfcuHXcsczOIFuRStzULyH9HA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(261022105027099003)(10067099003)(11063799006)(56012099006)(5023799004)(261021123027099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJra2VEdU1mVmFMcFdrS0xhVnpNaFI5dzQwTzV5OVBRcjhBeHhOVlVkb0U2?=
 =?utf-8?B?ajQ4cllkbHlTTDhMK3hyUjluZXJaTExHL1c1VzdQUW5KRW9PWTkyNnYrMWFX?=
 =?utf-8?B?QXdOVU5vQTBuS3UzL3pqam51ZWtmTFl0MXJvamErQ2FsbENZQkFBQXlrRkt2?=
 =?utf-8?B?YlVtbUhER3IyUFY3VTBzR25OSTBQdXpEOXlZb21kekttdGJZVDFFeVZGbEdO?=
 =?utf-8?B?d0xLbHVqb3ZQNVkvVlpici9aN2luRzhHWkdtOVB0NHhZazBHeXVINmx1dkdv?=
 =?utf-8?B?Um1LUm9mRUx6a3V5Wk5VSjdWTXpEc3lyWTdFdHhmR0NjVStuUzM1cVFLNGwz?=
 =?utf-8?B?UGRuQmg2aUkvK2h2SndvbXJSL3lEaWdrKzEvNVlLR01wVFh5UkRnV1ZiaWdu?=
 =?utf-8?B?SU1yVGhudUdkRFdoN1czMjFVbDZUZzlXRVhGY0p3Rmw4a05xVCtZNDV2SXpJ?=
 =?utf-8?B?dEF6cGNsM0pVeDVVc0dENTEvS3hNOFdZZVUrUFp1cU4zL0xCaUdibW02WkZi?=
 =?utf-8?B?cmxTZ2w3a0NvcnhJYVh2am1jMGxNS3lkaFo5UEthdHNjeDBwUUZmQTdRd0Mv?=
 =?utf-8?B?K1ZIU2tTdEtyR2YyZTJZSWEwYnlrSlByVXhLLzZmai8zd1diWXpLOXl0VXYy?=
 =?utf-8?B?UVJsQVhQaFYxSHZCdlp3NHAwdGxHSThYUHFNY3ZSVU9selhzeVVWeFhCOElD?=
 =?utf-8?B?Y1draGxHZFRCdmJsQnlKMXI1TXY0M01BdnR4N1NZdUVaOVFwUTRVVlAxTkRm?=
 =?utf-8?B?UHZLV2ZydFhUZFlCa0xWOTFWNm9tTmR5c2krMzhFWmo4WENOQ0paZjYzc0hu?=
 =?utf-8?B?TVRCV014TGU3S1BHSWhvSks5MmpYL1hCaGpxV1hkTy96bEN6SEV0S3dqb1hp?=
 =?utf-8?B?Z0dJcERvc01wUzN1MWxVS21zeWRwRWNtYmRaL3RvQ1ZBcGJ0QUJrSitnVnpT?=
 =?utf-8?B?V0JqeXJaQi9YSWVFNjJwSXpheG9DQlg1VnFQdWw2NVBGMHRSYkNkNm5UMjlk?=
 =?utf-8?B?MjVOU09NSExpSlREY1B5cnhZTFJCbDNibUVsVTNZdDVoUDZBaEs1TUpuU0hl?=
 =?utf-8?B?MElsamJtT3V1OUN2cTdxOWZSZ2JLOVF3dnZNc1c5czJWeWlnVWZHZXlKUXZ0?=
 =?utf-8?B?UmdBZlVJTUtIWklRbE5GQU01YVVpRisrNHNOQldPbjZyYTRja24xcEFRbTlm?=
 =?utf-8?B?K3ZyaUFhYTB5U25xUyt1b04xYjZzSktLN05xNFNOaDNQeHg1NU80RTZJcjZk?=
 =?utf-8?B?Rm1QdUtIc21mOUpQWUlWUjg0VWFDaUljOWg3RjV0OGtKM2g3d2wzbm9zSy9y?=
 =?utf-8?B?cHdDcDdpeXBDeXdLZG9abzFKV3VQOXpZdFV2SVhwSE5Td0Q4aEdob3FiWTJD?=
 =?utf-8?B?UjZiYm05RTJXYlRHRm5KcDI3dkppbDhlTndGRFl5dWdCekZiU1R2RmFMbHFi?=
 =?utf-8?B?TkJmSWFqRi9wLzVoUFBYcGdrUUdicWxoOG40VjQzNUlyMmdaazluRjd2eVNo?=
 =?utf-8?B?TFdTQ2JOZ1BkekhiYWg1aTRMNWZHTFlTdXd6dWkyeDd0N1RDcnkvaGY2TjlP?=
 =?utf-8?B?NXBtOStrNUNzN2pmU0JtcVNMR0YxdlJyVDRDR3UybWtyTEphb0EyVmRCbjNi?=
 =?utf-8?B?cmlEaWxMNXBSUE1XSG1tZUl6bk51QTB4eVJHUEFMSDlWbU9NNExtaHJ0YVcz?=
 =?utf-8?B?bU02WVNjcUdtcEEwQm1VbE8zemFRdldGUGJEaEwxUWxnVHpwc3hIZVV0dlQ2?=
 =?utf-8?B?RGlHR1hlQkZHajFBeE1qQS9WOHY5VTdRbGovWXBmbDZhQUJ2NFQwdVJPdmcy?=
 =?utf-8?B?cGZSZmtEdFlUMzQwTkRDbm80eVBmYmY4cU9kS3hDWFB2RU5BL0NJdUJPWkhJ?=
 =?utf-8?B?UUhyN1JrSzUyL3prdmR6NGdLOE9XRFZDaitkZjBxWkdUdGlNMGpFOW9Pa3Bn?=
 =?utf-8?B?emFRYzl6czAzNzV3aHEwK1R6TGxoRlJBZXR1RU1EOWZ5ZnNMTW5DWFJqWjV5?=
 =?utf-8?B?VmtvTTdzajIzTlViNnVVcXo5YlVORll3Y2FBUWxNYkZQVGpMbWgxcVczRXFV?=
 =?utf-8?B?TXBDSXdRS2VSOE5HVzZjZ3hMdjN4T1JMUUsxVVNCbDhtLzVKUVhpMU80TFVT?=
 =?utf-8?B?V2cyL2Y0QkhrV2w2UW1sS2NxbzhNUDBPalJNQU42ZEZScUVFQ1VOS3NFSFk0?=
 =?utf-8?B?SmVZMmdFUWNwSjg2R1ZnQ1BGREw5L3huVGVJUkI3cjlVU01Ga1RKUm0xQU5D?=
 =?utf-8?B?UzdBK0FkZ3hTVkFDc2lod0FHUk1EdzF1cnZtSmJaWkFHWGFLaW9Ib1VTRitG?=
 =?utf-8?B?OFhDOXlhZzJVUnhsVXIvOU1weVBEVHRVeis5T09uWHNEakEwOEpicmlxZEo5?=
 =?utf-8?Q?lXAybNCBOEEJqI/c=3D?=
X-Exchange-RoutingPolicyChecked: cXidooGmfFCCslk7VMkl2G+6M2gKlsJ8GUTfSbkWFNf7dWQUB1g1t7neIsLK3Z6px+Vbl2oQAwMDkeEkveo89OUfDWnJkFdhn55tPzpTByhkR+jk73pUyCvhAlWVjmDpr9LlbNH8oGI0pMoIGofiYPDJ/G15ws44qjJHRJsxrZi9Tv8n0W6W2rvDwxk+sqlKYlS4hZZWOJrcJOAp//rGuAFLZcVGsOvclOzKFHQMGxNCUewQQa1cViDJrjkbm2iA8AF0e9MtJNmgWmvRiowqgQ4+Oh1KPkjx2Jb33ZWL+rdK6BWWmZcfni2774lIgpi8rwfgqtCII253T7vGgG4OTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bc416e-02f8-4651-7224-08df4c95d1ac
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:50:46.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0AFsXK20ArYD+SJ84Fx/Xut2xAl+fvVyUU/HnqjQNmO+GlK3OTnB0Bz464TNKzkoPicvmnsfh5MJ5Xmszic0tT0RKwZ0sDjxBRITWFnwNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
X-OriginatorOrg: intel.com

On 11/27/26 9:57 AM, Petr Oros wrote:
> Commit 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit
> paths") moved the service task stop and the cancel of the AdminQ event
> waiters from after ice_free_vfs() to the end of ice_remove(). Since then
> a queued or running service task can still walk pf->vsi[] while
> ice_remove_arfs(), ice_unload() and ice_deinit() free the aRFS filters,
> the netdev, the LAG and the VSIs. A last run that takes longer than a
> timer period also arms the service timer again after the stop at the
> end has deleted it, and the timer then fires after the PF is freed.
> 
> Stop the service task and cancel the waiters after ice_free_vfs() again.
> The stop in ice_deinit_dev() stays and deletes a timer armed by the last
> run. As before that commit, a devlink flash that is still running when
> the driver is removed fails, at the latest when its next AdminQ wait
> times out.
> 
> Found by AI code review. Validated on an E810-C (FW 8.1.1, ICE COMMS
> package 1.3.55.0) with a test-only 12 s delay in ice_sync_fltr_subtask()
> after it took the VSI pointer, armed right before a promisc change and
> rmmod ice. Without this patch KASAN reports a slab-use-after-free in
> ice_vsi_fltr_changed() on the freed main VSI, and the kernel then faults
> in call_timer_fn() on the timer function of the unloaded module. With it
> rmmod waits for the run and nothing is reported. Also tested by removing
> the driver during switchdev sessions and with four VFs bound to iavf. No
> kernel selftests cover this.
> 
> Fixes: 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit paths")
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
> v5:
> - New patch. The uplink resync in patch 3 queues a filter sync when a
>    switchdev session ends, and a session that still runs when the driver
>    is removed ends in ice_remove().
> ---
>   drivers/net/ethernet/intel/ice/ice_main.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 47c6798c97e8f1..6dede87b78944f 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -5387,6 +5387,9 @@ static void ice_remove(struct pci_dev *pdev)
>   		ice_free_vfs(pf);
>   	}
>   
> +	ice_service_task_stop(pf);
> +	ice_aq_cancel_waiting_tasks(pf);
> +

makes sense, thank you!
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
(would be fine for me to pick this particular patch directly to netdev
too, have not read the rest of the series through)

>   	if (!ice_is_safe_mode(pf))
>   		ice_remove_arfs(pf);
>   
> @@ -5407,7 +5410,6 @@ static void ice_remove(struct pci_dev *pdev)
>   	ice_deinit_hw(&pf->hw);
>   
>   	ice_deinit_dev(pf);
> -	ice_aq_cancel_waiting_tasks(pf);
>   	set_bit(ICE_DOWN, pf->state);
>   }
>   

