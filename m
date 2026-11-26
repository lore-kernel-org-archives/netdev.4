Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795667942;
	b=MDEHnVNS6Wbr9e5CV327pa7IjoVDvCa0bfiW4zNLh5DmTjIs5Z6Pn4ZdAihEAWZ3c1xm
	 DqJzHo2QagABcAPVuqWMT0YvFm5rGMCmePTckwxmcF+FY0/DIJ8mEfqOKEsyPmX+pwRL3
	 RMR1yYpHmYOgtd4MIPcHPFBfG6lDqQAtm92qPJRBdIfkIKR9oJBWr3yliTnMnrdXrWdWe
	 dTB1qyJhdfeoKSP3O5dxsomjy00mzAGlerhJv86ScDI7BEqWAS6qkD9btf+WrJLOm1Sci
	 zdd4cuzsqao2VqcOZYb4CVQm2JWdHryqbKvETr0u+AC40jvrIyzP8Gap2BSyYJRqWEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667942;
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
	bh=i21bEBHiWZ9MdbOW3KZjW8JVlGsICBWHeOC5tml4LoI=;
	b=Gz4An77ENQZOamJhW5xlBIbMdqlLTNyuPcvBPjx81uMoky91qE3m8TbHp9UEKDLYZ7Bi
	 hma7GN0EEyx3TDoHn8vvFjWkZUkEjq/w+lDJoLIzTFBzDDXlzMW20NdU058u2Biz6XbjL
	 S6aV/0IXvwNxIFOu9taz61PdUlMuPpuMsFX+QeKAspbKgXJJ3RWumxX4uRscWc6saKDPg
	 NJOoBASDC5ouavZJK8NKWBHlUhm0ctQBJJYxUjVPi/03ITc8bvMxmFFukpF1CGwJsfvpG
	 1poDJ1JTc15G7uemoHTSwoCQwXreXsmnGxiv1+tL6KvbOFdCLI1ESBXySeWNM7BA/Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dqqe0bqC;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nzw70VCJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63B606A31E;
	Thu, 26 Nov 2026 04:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E63B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dqqe0bqC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nzw70VCJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667941; x=1827203941;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WrOplxz9Sgwbl1O9Lon1c91ST5l1Luf8Xpua+t+xltQ=;
  b=Dqqe0bqCwV2WT2N8yCYWdtzh5QE2GE/jb2qhIrulSu+ZrMWtRgm1eMlw
   mfaMdddWugnP0H8xgHON95QUfM3RiiNV/B8VqQQL269OdRw5t4cu25u0/
   xzrgVn+j61657wCJL+VcYqWYjk3930MhqdBduvqs6HPUJRjRkhU635OdC
   ZbGcWai0Ss0oUFeF21JQlWyE5K6rBFVLB0C3G28LsMpJsmv2jBdjhJKhr
   Vvdbf++kOPadvxZ39QE3H1LI65AuJj/GypLX6+AcozGEdVsnji0paPNec
   aerxXTJQUIqJzj4JabJHdR+9SnSxEaTi93sXV1fdSpQnkf6sagxAouJpF
   w==;
X-CSE-ConnectionGUID: TkkYwyfcRxOLGoxXjapCBA==
X-CSE-MsgGUID: tbGLbRWURvWrXXrsGAUDKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4574220"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4574220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:39:01 -0800
X-CSE-ConnectionGUID: sgMOMO/LRqWR/2ZogrGC6g==
X-CSE-MsgGUID: K9WC1ST1QFe5vsUQd6dcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12392825"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:39:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 20:39:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 20:39:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 20:39:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKrhwc2Xuiv85VbDaFN7AHipD5/qE8NNDHCFlCMpjAda9sw9I3alUKu/t3eSCRZE4hwfA6qJ2Twd3EstS95Z4s1PWrP/hLNwA07xX9K6FZQAAOGshIpwifERAhuGOsRF6u0zZIEJbttSRV8RmCFZm08wA3OU8Z/0/FDbO6t0+mw95ybh1Kzz9MF27JeYhNmXTMOHKViaSdTrJZ6SgDxo5u8YACElFy1IkwHopXy9cHSh1ybn8piGozYNvrvjeQ/T281Y+sU8flnPC50ExXjLaWS9DHHGMzajAEfrEaksYdCbpCiAJq9trNz2WbmBZUv4PaLC+hNP45qjjiI+zNompQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i21bEBHiWZ9MdbOW3KZjW8JVlGsICBWHeOC5tml4LoI=;
 b=PCoNF9HkR9zs6RSFvPSlOlMp3rZuVpA4OA3W3FnUOKoGU5jwvlU015m1rBxVAr0WyTaROYt66NzkMGKVBh1dVNJkKgXl66ByLAiNHqPugcGrmakxG68tU1jhS4+VNC47DpFxuPfqVT5i2bENsXUlf4+Qjiu+apc8h6+I7itmf0BbFr0iWzlMaw2p67mPbe8/TIEP7RsE0w23FSUbJ1dI0SJEDHgIvOdYT3+JXw8zxXqaHIWFDp3h+/GQJXtsmObMnV37iCLgbCO9R3gy1JMNPCgVqOVyrKCw5kPGWCOikpobl4MgdRlNc+45iO2hNl28D53XOymq8fgh60zo8+Skhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i21bEBHiWZ9MdbOW3KZjW8JVlGsICBWHeOC5tml4LoI=;
 b=Nzw70VCJmpAIi8PnSaamolw0qFC5GhcI0I4QYBie+IyTJ0RJpzufzvkoNMo6voD1NJJQa8C2AjNt4JVZemYKzL/cHRpioqYMI4aBKIRI9ip6oZD22ASnCAJyanfd5JR7bVrjxHOB1sv8W0QfH0taSd+cK8ZErS8bJiMoVsNcSpU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by EA8PPFBCD0F742B.namprd11.prod.outlook.com (2603:10b6:30f:fff5::797) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 04:38:58 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 04:38:57 +0000
Message-ID: <776edf32-c9d3-44ad-87a0-0fc2c4861ea4@intel.com>
Date: Thu, 26 Nov 2026 05:38:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net v2] ice: release IRQs and rings in ice_dis_vsi()
 when the VSI is already down
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
	<intel-wired-lan@lists.osuosl.org>, <anthony.l.nguyen@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<larysa.zaremba@intel.com>, <maciej.fijalkowski@intel.com>,
	<jacob.e.keller@intel.com>, <wojciech.drewek@intel.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <poros@redhat.com>
References: <dfcfedd2-7232-4949-97c3-bc51d28c6131@intel.com>
 <20261125152850.16261-1-ionut.nechita@windriver.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261125152850.16261-1-ionut.nechita@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:10:234::26) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|EA8PPFBCD0F742B:EE_
X-MS-Office365-Filtering-Correlation-Id: 296de8c5-5194-419f-d51d-08df4b772f42
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261022075727099003|4143699003|11063799006|56012099006|261102123227099003|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NWTGsYFpguHkYU1eCrzy2L5G6YBw+SVn/Qf9hqeBsej+G+VQ6SwBeVN0RhL+PZKtq+y9CpDCv8YOPLP+G3KKibJeQRLzHOPBDsOLau1ciZXdxT+CaEyolpihT4+QHpV6KAVt9qXM5oO7lCokOLwqchMVM7o+bVTncj1avxHmZY3nXT8GGm2FhOce16BBNc6G0TZhgyOcdQ/6F1esIipkXhU2DNpRv5C+3a5lhDq313iip16u3yPCrgq+fPxb2/MYeTzmR8vxrpsXp9ErAkjUocoUdX342/QAPfFqLtR05BBFDZLi5JHjBN1nV71FRM3NTajOOzJE6aBSN9O4Z9Wx52oa5V6PrynX5cgj2p7xmuoNIM8uK7RqKsbGCVx/bjDW/AZDKx7mNMsrt8bmbKqPhxRNKTUzWFllq/lTnqLbkTRBT9zcUffsBy/xcds6COek0M5nFiRmBC0A54ieAoxAnA/jC+GVXYBvLVoG0+f62bJebtzh7AOFEJ8xw40EoHJF5v8+9B2husOCopLC80tTT/rJSAFM2ueDqgg9ooWQJnZ7bMRAvCd+vxxnCnibfuwiF6DNFxK3P2tbsKOLJGdWKSpuveIfCToKp1g1XEx/FRHK+FqILWG2b/33c3uZbp+u
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVsZE5QY3lvMHRJOWRWdkJZejFwbU5NZlVKSGZGQ3lvNTFCTk1xQnRCdkti?=
 =?utf-8?B?NjBDMjNvdWZDTE10a2ZyWWlRZTBFTzJVS01JMnZMajF2SmRZN1hYWERIZm12?=
 =?utf-8?B?V09hVTQ2N0JmaU5ZSEYrVUROSXZHRjJkWFlwSFZUd2FKQmdlWmFaQWtpNDB3?=
 =?utf-8?B?ekROTkJXNkhqb21QdXR1a1crbGEzNjZjamR1RFo5VDlrZHZJc1pzV2VYKzlx?=
 =?utf-8?B?Rlc2U0g0dTBUVTJ3MStlMkhJQjloYWt5K0JrWkl1Tm1rUnA2QWhyb1p5OHdk?=
 =?utf-8?B?Zk84QVFoZnBxWmxEcjlQUS80dVZ5ZDYwRCtHQlNmR2d3bEkwLy9QOVlkdEVx?=
 =?utf-8?B?b01GTmVFNytiWXp4QitldDM0YXYwclh0WCtQQ1pELzAzWmY3azBnaHc3UkQ1?=
 =?utf-8?B?QjNYTmwreDFDaldTU0tUNk1ETUhnODBER2VhbkZ4YnpScXBvVUovMklvUkRL?=
 =?utf-8?B?RXlVUUNYUHU1MzBESExRQ1NFcDBlTTFhbUNXbHhmTWxxUWdPb3JxbE1XSEFl?=
 =?utf-8?B?bGhHbzgxWkNyWERBckFBSzRuZG0xOVAzZ1cwV0VnVXlYUkx0Q0dHaTVWa2xh?=
 =?utf-8?B?NGoyTW96Qi93OVd5Sm5IWGtqVEQrNWxXM0Rxa01rNWh3bDRXV1JEWHlYb2ZH?=
 =?utf-8?B?ZVhiYWtmemEvWVNocy92YnZna1hkdFJ2R25xQnVLZy9jSGlKaXVVS1UzVVNP?=
 =?utf-8?B?Y3ZVQTYvdmdWWVBvd1ZZb3FnTXpVUUdyQnEwTkc1VmswRjM5TjhKWDNhT09n?=
 =?utf-8?B?bGJCYXRBbjFuL1cxWWVYSmVzL0k4Z00wQkNLemlsOTdHQXFzSkMvQTZIazZh?=
 =?utf-8?B?QjBkSFZ4TlRLWnY0R3RNdzF6eXhOM21XdlRmYTFPVTUweXBYVzZSaHN3dnZX?=
 =?utf-8?B?S2NMSUtYTkF1MnpTMmN5T0x4TzJTS0JHMW1SWklUWWVRYkt1VWRRNjR3KzVw?=
 =?utf-8?B?UXptRnR3YmxYQXlzNWtjTC9TOVQ1dUR2K2oyRlNtc1lZNHV1T2ZJQThKaTBm?=
 =?utf-8?B?OGZoZmxvREZ0RGhqdURVUFpieUE2QkJRdmtKRFViajR5NDlGU1ZOMkM5UWpS?=
 =?utf-8?B?MkZ1dXNxNVFtakRKMWsrbHY4U25NRmdwRjI4NnNVWk5MQVlpSTBDQWVlZ3By?=
 =?utf-8?B?ZlI0L204ZFg1ZFVjUjgrMzBsM0s5Z0tNdFpvdDJBT21BNUFxZHVBczVQNGdR?=
 =?utf-8?B?bUZKZ2gzbTZnWkRjakVJbUUyMFQwZzBybk5kR2ZGWFFrLzlHSys1ZC9mK2J3?=
 =?utf-8?B?RmFxUlk3WFZpbE1LMS9KRzJ6cTBiVmx3cXF3RVZkbmNCT1hsK2ppN3VRbW1y?=
 =?utf-8?B?MndNOGxDYUIwUG85R3JlSDFad2dYZEo2aHdEUnFNaFZzMERVd2J1eEFpNDRj?=
 =?utf-8?B?cnVheC9OUGZSNUk0RjIvSk5zOFJvaWJtckNTdExVa05QS25TT2JHMllQeGMy?=
 =?utf-8?B?eGhQYktiUENtT1gzMjl4aXYwaDFuWWl5VUZ6NUo4bDlxL2JFVlhhbWp6blh1?=
 =?utf-8?B?eGVrQnNORnV3VUQwTnAvRGFSb2ZIY1luU3NRYlJmdlZzekVQclZ0VDlrWWsz?=
 =?utf-8?B?TnlsaEdyLzRNOXFOV2pEZi9FZHF1M1Y4ZVFBbi9lVjBRbW1HOS8waGwxVzVi?=
 =?utf-8?B?TmxOMmxVN3prU3BzalJtQTNab3VIblRBR2hVbE5tQmxsNlhTekRCUWRuMUc4?=
 =?utf-8?B?QmRyamN2QUpLWk05Qmk4YjltOCswNWxCdWZRbmsvZVM5VDBSN0tucXQ4Mlpr?=
 =?utf-8?B?TlhCcFhIb0p4MXRBZjJOZzlhbFJLdzAwdnVnUHNYNGZaSzNHN2NQeHg2aE5h?=
 =?utf-8?B?MWVObXlYRHNWbFdlWW5xSG5MbzNjcWJWM1pNaFB3V2RVNUtSQ2kzL2dTR2tw?=
 =?utf-8?B?bDFoc205VXQ2WlpncjIydFp4OUlBQ08xckE2VUtCVWxRVGREK3VoYlVTNW1K?=
 =?utf-8?B?bWJXTkF1L2JoWUxOcXBnbTc4dVlVczg5SFpHK082ak5uZUNmQnpUUmFlaFho?=
 =?utf-8?B?bDMwaUZ6ZmtQcXZwT2xjSU5IU3hYbTFtTWRtb0xqajhnZlZWck5odzlMamlI?=
 =?utf-8?B?RXdKM2JKdXBBSGJpL3Iza0R0S25pMTd0RUNGNEh0MHY4blEwaUJjMnBsVEsy?=
 =?utf-8?B?NVhGd0tITHBISGxYQjFsQUFsMlVkbUFJeFJuUVFQWEJLUEVzSTVTY0Z4UHRF?=
 =?utf-8?B?N0xIQzl0azJ3bGFGdjlCYWRlOGFSTkNKU2hvd3BNTGNpTEQxd1hUZnk4YVhG?=
 =?utf-8?B?Sk1GU1pNajQwYWdHdVdjYTBtUEN3QjRpUEhSY2RhVXU5UG5PdE5RMFR1RjhD?=
 =?utf-8?B?OVExSHh4ODg4T0RIMnNiNGw2SkdWb0VGaWpGTytXQTE4ZUZ0b1A3STJaOUVI?=
 =?utf-8?Q?l7JT5nypbx9w7aBo=3D?=
X-Exchange-RoutingPolicyChecked: cx6HhdQvPqlX9Bv8/uMl+xdyDtUGBsjs6WFvdkkqaRfRfYPTHA5YGXD1DptymQvIwRXLuzrYu6EfoLPJd45l6dFR4EciwEF6dChaGgsBfTCgpR6nsGGQ5Kazcb6xL/vsQvFwpCiqN9XNw3wYSB9nrlMq/Em6qg0E8V4d+XTVXRdMGg/Q9gEQwZ5qL6IWNjDx0dn2a6y+NnYAHY0RwmG1LwM9zo004rtvT71lmckFEphjjYSkFgMB51N2ItYFvzdvudV+8IF1BIJU/z90tq1YYwhx55cjJ1tDauP58Fjhlg4W2Zhmk02W5yWcecL2a8bPs/jeu+Zf5v91KH0M5hGsOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 296de8c5-5194-419f-d51d-08df4b772f42
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 04:38:57.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnnm2t7P22Sgw2AV7nnb1ldfBHbsWCamtb+PH8lM82ICv76UuN2Lkbg9n6hiPo1+eZxlBfS4jKbHr9QzUN4N++ueCAltAQ1CeMjPOqd1Y50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPFBCD0F742B
X-OriginatorOrg: intel.com

On 11/25/26 4:28 PM, Ionut Nechita (Wind River) wrote:
> On 11/25/26 11:51 AM, Przemek Kitszel wrote:
>> I've run your patch through our local sashiko instance, and it reports
>> that your patch adds new problems on edge cases. The same issues were
>> reported both on your patch just on top of netdev/main and
>> tony/dev-queue+some more fixes (meaning those problems are not "already
>> resolved elsewhere"). For the first issue (DCB) both my and Petr Oros
>> patches were applied (not yet on netdev main (aka -net)).
> 
> Hi Przemek,
> 
> Thank you for running it and for sharing the report.
> 
>> [Severity: High]
>> Can this free DMA memory that enabled hardware queues still own?
> 
> Yes, this is right, and it makes the patch worse than the problem it
> fixes. If ice_up_complete() fails in ice_vsi_start_all_rx_rings(), it
> returns with ICE_VSI_DOWN still set, while the Tx queues are enabled by
> FW and the Rx queues may be enabled with buffers posted. Today that
> memory is leaked but stays allocated and mapped; with my patch
> ice_vsi_close() frees it without stopping the queues first, so the
> device could DMA into freed memory. Pointing to ice_stop() as the
> precedent was wrong, since it has the same hazard.
> 
>> [Severity: Medium]
>> Can this now reach a NULL vsi->q_vectors?
> 
> Also right. ice_vsi_free_arrays() sets q_vectors to NULL but leaves
> num_q_vectors as is, and ice_vsi_clear_napi_queues() does not check
> q_vectors, so the already_down check was hiding this after a failed
> ice_vsi_rebuild(). My statement that ice_vsi_close() already handles
> a VSI that is down only holds for the IRQs and the rings.
> 
>> [Severity: Medium]
>> Does removing the already_down check widen races with code that brings
>> the VSI down without rtnl_lock?
> 
> Agreed that it widens the window, so the reasoning in the commit
> message that ICE_VSI_DOWN is still tested under rtnl_lock is not
> enough to show it is safe.
> 
> So please drop v2. The underlying problem is that a failed ice_up() /
> ice_down_up() leaves the VSI half up, and ice_dis_vsi() cannot tell
> whether the queues are still enabled, so it is not the right place to
> clean this up. If I come back to it, it will be a fix on those error
> paths, tested on hardware rather than build only.
> 
> Could you point me to your and Petr's patches for the DCB path? I would

Petr's:
https://lore.kernel.org/intel-wired-lan/20261113161453.1234851-1-poros@redhat.com
but we are expecting v4

mine is linked there, but for your convenience:
https://lore.kernel.org/all/20261102105346.30739-1-przemyslaw.kitszel@intel.com

> like to check whether they also cover the case I originally hit with
> the out-of-tree driver (ice_vsi_cfg_lan() failing on an E830 port
> without a module installed).
> 
> Separately, the NULL q_vectors with a non-zero num_q_vectors after a
> failed rebuild looks reachable through ice_stop() already, independent
> of this patch. If you think it is worth it, I can send a small fix for
> that once I have reproduced it.

would be great!

In general we have many little bugs on all the error/unroll/reset paths,
especially if they intersect. Sometimes its hard to fix even an obvious
problem w/o making one of those unlikely paths slightly worse, but that
is the new quality bar we strive to achieve ;)
So, if you will be able to cut off any of the problems, it would be
great, and it is likely to be easiest starting at the bottom (at leaf
nodes of the bug-tree).

> 
> Thanks,
> Ionut

