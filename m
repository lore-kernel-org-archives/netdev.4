Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795814116;
	b=v+2tzgQX7KJoYu7aW/+8CGDD2hf8pKgDakERoUxfEJqYEm2F43mW2dLdkghdgxUef/s9
	 Q7END+PXN+rETQM2gizIvWRuOTyHz/VZTa/oYfVi1VI04srF4F4cRASciyhIB1QZ8QJiH
	 gd10IZjnaPrD09FEtdOtCmMDm4PacKsodUWqXU7/LvjGm2OEJUoewFHok0PtPc7kT6SMT
	 dEcjUueab+4o5FzM2xrx9Rqf0lXnRpzK4XR9LaYXUhWKnQYwsCAAuyzO8R3bjrXG7Zl4i
	 co9wjJnhpIKj5N56go0fe+ci8bWhbK1BaWlI4Oz0GMf7d7bTCSeCptpADdte1GBJFrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814116;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=w5LsyNxszJodxeU+MPrJrgz6au3niM+vcMadvo3SNyU=;
	b=UI1Owu2eu7L+A/6utZx2vBNq+8tExFc19pAKify6Z/reRDs6Pal58+uDf5TIJ8fc3iTG
	 JnQK3+hh8SnxKx9/+peVS9ExImDMHozHfDV2rnDXbJz9d0AIJTXYgDIMNCAeYC+bwqlpz
	 W9fiV81GEVRezfAC2TIrGUrwNKJdvYOGZz1ioy8NtyIDlLHC3cE85q8c7hLp0ATXBz8/u
	 8pBidklkKhQuGJc02P78tHFmjUIVKiqRh+hYFAeaSKNpOEqXgzS4ZybA6cLI4f9t5LqYs
	 a9BtWaIZR4qjNzwWoTMdyfz12UyMBazA/4kA+mztojzUwyP9P3UM3lszUpxT9roJTYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOU+kQW0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81400606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 21:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81400606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOU+kQW0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795814115; x=1827350115;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i7SRQWH+RBD6qEWV1buOynhX+JB966GIRd5gWuvZ1mY=;
  b=bOU+kQW0lQRv9DWtqTyEl3n9QTZ+vrNP56DRRrn9bjj7Q4rboDep/5a9
   SPDq4IMq2V0H8wRURnvPPzMvqltvDpb+CxaBR/ovhEmpCApWFEnYdZJIT
   ts6bY6xE3gzpCKiCX6J1nnp/l1RDQyoPfsEbll0e0ORsp5r5vxt23DZYO
   s7i7H3lSixl8xWCk940G4iFql1BuvIDXFY9TTLpugOGymz/CC36txAoO2
   A9SMQ6R6xxDKFhfoijwZfJPD3BGt/+LTfRhskPR/L8kc0PasFqloXWcvu
   w3QwD38vBExHSnPyaPcUSW1i26v2VJhdCshWEfj5ayXxBLy7DuMlOAckL
   w==;
X-CSE-ConnectionGUID: HizfflJhTEyAPsZHPaA5mw==
X-CSE-MsgGUID: cbOmZ+0xS3Ccgh6wvKEOGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4633593"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4633593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 13:15:15 -0800
X-CSE-ConnectionGUID: 3raZ5m/1QMWTAEC+kpBEFg==
X-CSE-MsgGUID: /4+/c2V5RxmpV5+2ozUt4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12818570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 13:15:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:15:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 13:15:14 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:15:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cib6Vn1JEelGrZgpgdnUkcvUTfmZPMqsIbRbTBJDgm3UlQCspxN8raYqTiEcJCeOJUVyUHMEOwSdwqa+b4Y1CdWkPL/Ggo4dC6pwXs7jLdTPu8BrktwJUvqvhDDAzKLU7EwG8ZlM/Sul5c8qVn1uhWt9IprNedtenLk2Jphx3+fhQ0hpIymLpZuWoPm2RmTKjeikvu0i44Th/6ykbtwHI7NBaXLZoYQYLaT3GU1VEWvJdbtnX39a8QCD1w0JHFi32SCLhTiAXfke9YZ5ptRKvNA9R9QWbf9vgtpD3B2lnKosXOvBIv4Ifz03p7oebX8unzPes99P5MJ9BjE/3+rWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5LsyNxszJodxeU+MPrJrgz6au3niM+vcMadvo3SNyU=;
 b=cqx294KtD6LxBDDH9YbnZ0qKhhWquLpenAsJLuEhl2EeINZqNQf77/pLX/+PrFHcBVK7XaRP49CdiZJzXK5oSHdHgmkzryfGEJH66fU7vWHBq8J6XWXCpdh+fsf7CYgD52CcJKtsxYBwSfgsrZHUTEZXfwUhJSK+Dz5Z/yEW7gScPCfnTTUXgaEX9j9n+QQq8InaJNgSv3ul1aq3HUCOUxDFmir6jVyxcbpf8UVo5J8Lu8T0Zcwzvh4hJNqzTcAfJyhKvitXWsvwvHuHDkR2zM8eUqPDRskgQXn+lAd5gkYyzNH/auVotWW2wZiqEoBiCiq23iplADW9rydDEXflMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.10; Fri, 27 Nov 2026 21:15:10 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 21:15:10 +0000
Message-ID: <4737ccc7-1a11-487a-91df-2caba229ccbd@intel.com>
Date: Fri, 27 Nov 2026 22:15:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net] ice: bound the node count in
 ice_sched_add_elems()
To: Minseok Kim <kor8821@gmail.com>, <intel-wired-lan@lists.osuosl.org>
CC: <netdev@vger.kernel.org>, <anthony.l.nguyen@intel.com>,
	<m.wilczynski@samsung.com>
References: <20261126064402.87229-1-kor8821@gmail.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261126064402.87229-1-kor8821@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0242.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::14) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3950fb6b-bdf8-44d0-903b-08df4ccb8516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261022075727099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|22082099003|5023799004|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: Xa1ttUJTRWT4NXOBlHS+UmrCc5IwbrqHHz5IB6mDkNzrBkivv9+ExA5/+ufPK945iXV0NOxpyw0ZI1VFmXEBNpK57MIJfRn7e4y+6p0FMDKDHZG8SojGfKBVBgWV4bBaSKsITTbcrguuJCOSH/b8akveOBq88pIoRH5NVjI0Jrg7tJk77EuPdThLJD9+Q/ye3m790RwFTEqk7D8nm5vwtWbnxHuSflypYWg83o2gBsoheaX5Q8n5u58ZQPQjOo55/gpSI4TWbl1FCUPiOip4jvr9ere82yl7fZAcNMYd9ctGumh89ohsvfWmBs+xMguKf5u7cieWciW74XiCowkMAaf2qtV5AmAFwdFdT45Cz/BiTik7WKfNvS6FW9zdSXo2wIouhR1X2okthIxgPf0fHaZ48FN6D9xkDJQu0yNVj5MpFamYU+ossfxmMOjXikK+h9lzNCMO/VyW/t7Mfmdzmr4T2Qdc5jmqBcE5uoyTzV3H9vFXJShl6k3/Nkt9bQF7VSorB174uv9r7F5qTWbzBz+30clgBcGGozfSprPEDlOT1riycn72aPvQ+w4xYzjqVpRJ6USAS2ClDpRjnrtMTwFAnc8Pfsu8M/hnfl8W5MByfV9oXIL4Ry1wQhl3O4TbqYd3dn6qwCVXph1KBlxPm24gsLfG4WgZ1CCvEi5hbNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(5023799004)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NubjBOSVR3dWpjdmNlU2dyL0Rnd0VINXh4OW01OW9HWjJPTGpPNmVScHdP?=
 =?utf-8?B?V2NQQ0JJT1JiV0lGTTNHMEl4NCt5NThLQWNGeS92azE1SytpN0RpU1IzSTNY?=
 =?utf-8?B?REl4MWZ0SkpVcDlUdUVQM1d3N04wU1dqbzFiR21BSm5JbzJEYXY3ZE80VEo1?=
 =?utf-8?B?blYyV240MU51elhUZ2R6RDRNOXN3SHhaZlR0MTFRQlF5S0VSa2FEd0JPUXFq?=
 =?utf-8?B?MFdoMGZ3SHRwTDVpRDlOSnlYbW9TeGZJaE1lYTJ5bTZhSC95Uis3RVhWazVz?=
 =?utf-8?B?Zko0czVGNW82WlF3MWEwdk12aGRsa0xaaWdyNGtLcFo1MDB3WmtBZ2ZadzV0?=
 =?utf-8?B?S1VLVW9mc3pabUQ0WGNwanByei9LWk9PZ0htN1Z4Z1NOZ2hJMWVFa1VrZmov?=
 =?utf-8?B?bTczd1RBT2RNdS9oK2k2OVdlWkVnUkxSNytPaUVZOVE2UnFVOEduZ2p5bkpz?=
 =?utf-8?B?aE15UTBSMHdMMXpIaER4OWxUWmhzRGpxWjVCU2YyQjkwSmY3L3kzV3JUa0pW?=
 =?utf-8?B?SVNpMjIzeEtGZlovVGNneTdNbFJ2YUJMSlkwMmRqMXliUm5NbzE3VnZzQ3JH?=
 =?utf-8?B?QUkweXZ2c3RNa2VxaENnOG8vQS9wWWtlcUYxblVWR25ZbFNOeTZCTUJ1blNV?=
 =?utf-8?B?YUU3L0cxSDhUU1dwc2VFWG43ZkNVZThsZktqOHFkc2hOUUxNZVZLVGR2TmR5?=
 =?utf-8?B?d3V4V1ZwNGF2KzFZcTJFMWVXK3dmcy9RTndRSjZ6dE1jdVRwcGkvSXRndmVl?=
 =?utf-8?B?NnlZU2lCdmlqMit6V2VKOWJRbmFrZzRWK25DV01UbGRKRmNSSW9IbWRDSTN0?=
 =?utf-8?B?VFlRMnpxeTYzTlZqeUd1blRKODNXUW00anlLL29LcU8vSmdsOFdMMk52U2Rn?=
 =?utf-8?B?S2V1MGhObmFEaDJMRStOTy9PbU9ad0dXUkxObnhWNDE0U2R0S0RKc3Z1SGpn?=
 =?utf-8?B?emxTeExOdjVCeHV2YmdQclY1U09SWTFkZXlrdVhNSEZLSzI3T0hrRndPc2ZV?=
 =?utf-8?B?N2JyQjM1K1E1SWJSMy9Vd1JWTjk2NVQ2ZHBoQngrSUhDc0NrQnZmS3h5VEZh?=
 =?utf-8?B?ZllyZTAvZ1dkUmJWUlRCRW8xZ1d3NUlDbTYrL0hKSHVqYVMxbWJaQ2FINnRP?=
 =?utf-8?B?ZG1oSE5WZ0xmc3RHVVlDQVFRbGhMdVRpZFBtMzZ5aUY2OERnRzR0NDJ4eVJ3?=
 =?utf-8?B?T2FYZzl5Y3pabHhXQUlRNWM4cjR2dGZBaWdsWnk0V3hyNTJSTDJPSCtRa1BY?=
 =?utf-8?B?ems0NFFycXFVYS9PUmNyd0lOaFNUVGkyeDREUlJLY1hPSTFkNllTVW5GOStK?=
 =?utf-8?B?TXo0RDR1aGE5QlltbkFFSFc3T0lWL252S1E0NlV5UFBOVUdnVVhOQlNvUFRD?=
 =?utf-8?B?R005RXF0bXhTc0F5TVR6bjBDQk5XVk1ubWJOOTJ2K2VjZ01UVC9wZVEyYk1L?=
 =?utf-8?B?VjFNU3hSMGRnRHlZbnc4blk5ckM5RHNOKzZnVFpGNFdqS0dnWnBTeDZmWVZy?=
 =?utf-8?B?N2pDRGxZWWRRbURSOHY5WnM5NFRCTjBwNG1nR0tXbkJyRWlsQ3pXeXJNMUND?=
 =?utf-8?B?MGR0d3p3dlZrVnpqWmVZd1BsL2FTRGZ5U2NsYlhWQnlROXhPRjZBdzl6d3A1?=
 =?utf-8?B?YXJCWXA4ZXB0SmlaS09CemhENzFSc3FyM1kzNDRaaUg5L1EwNnl1UmRKbytk?=
 =?utf-8?B?WVBLRENNd3NoVGNDNVZNV1hHUUFBTGxnOWdpZWpkRTdpRjlMc1JESkZ0MTQx?=
 =?utf-8?B?Nkc1cUdQZy96TUlmb01qeGd1QzV2YVpxN1d6aTBkZXBBRUh4U2grZTZyS21S?=
 =?utf-8?B?OGpvcE1UYnlKR1BWUCtGdVZQZy9hMzNuck9INHZ1N3BYOXBBWmloVlRqampJ?=
 =?utf-8?B?a1AyV2RBeDhBWVJCdEZiZmJOZHdZSzAxQUkvNUFnMlptVm13bjJpMXFkOTJI?=
 =?utf-8?B?aVU3U3R1Z3VFeWxYSDlTdjZjdmwySmV0R1dHK1BvZlViTVVWUnpQNHgrNUxE?=
 =?utf-8?B?RnN3M3ZXT25ST0FqelZmVm1XSnExWXVNRHBnd25wNGltNm1LSk1VRjBKTU11?=
 =?utf-8?B?RnB2cGVEQXBOYkhaTVVTUkN2dHRFd0VCakh0ZklVMFpRNWFQZWVnWU82ZDJ6?=
 =?utf-8?B?VVhHY2xKUmdSWXljT0I2OUoxbzF6ZFNtbUVXMVBMMEpEY0RyY2JScG40cnNC?=
 =?utf-8?B?eEhtRm9UTFM4RVZYTitjcjdGSnpxRytaTVRxSzBGdUV1Z3JNalArTG9vdVNP?=
 =?utf-8?B?YmRHN1ZrTXpQT3VnazF2OGc5VE5vc1R2eDNvNGZUSWhlUVRQVGhYYXlBS3hr?=
 =?utf-8?B?UjFzSmd6QnVCWm8xY1E3VHFFL2pqWlRybW8yOENWL2tIenN6Y2FJWVFXL291?=
 =?utf-8?Q?iAj4IoJ7cuzNbQzI=3D?=
X-Exchange-RoutingPolicyChecked: CPii1i0g9TRik/a4M7Uf6s50oGOBkCiPgeXHN8rbLxdyoQLnexbZe26pVGSUDC45U6p76j5sJb90zhKtVCsAtPinX1TPH/w4tBhFvWjuizGyBeRfPd+zlwwmXju7bY/7MByVMiMEaU/N6tF6+gJ0FW5POPYnrzA2bXZwpHGVuqCQpYgdKcKH9MJJtiUVBDCxGRwtE9ECRUhBRkaofm9qgWbUxh1U8ddLXiK42ZZqUo3gmB4sCrEUc0OrJB+Lime6sl6UfyRZrWDsiAsgAtplfcXRuN5xBiO4SsZrhRd9nPaoCLdu6BbC17krhnopQBr3/lIXuunR/f83G6t/iGVV3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3950fb6b-bdf8-44d0-903b-08df4ccb8516
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 21:15:10.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh2GUtXRTVDstvWYOeVXJ1CkiRpIM+yNnDE7YIz2Ln9YSpk2n+JyrFRSgiNbpaqOcZFgluAuT0mu+BuO/S4J7dJiGKGGLAjQJHRVpp82k3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com


> diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
> index a5c7a4e1c..ae4528347 100644
> --- a/drivers/net/ethernet/intel/ice/ice_sched.c
> +++ b/drivers/net/ethernet/intel/ice/ice_sched.c
> @@ -909,6 +909,14 @@ ice_sched_add_elems(struct ice_port_info *pi, struct ice_sched_node *tc_node,
>   	int status = 0;
>   	u32 teid;
>   
> +	/* parent->children[] holds hw->max_children[] entries for the parent's
> +	 * layer and ice_sched_add_node() appends to it unconditionally, so the
> +	 * request has to be bounded before any node is created.
> +	 */

we have to trust FW, I would rather do nothing than add such prevention
--

side note: I was working on a OOT bug that manifested in crash a couple
lines down from here - FW was returning 0 as number of children after
a change to 5 layer topology from 9 layer

a fix was to properly re-ask for current topology during the vsi rebuild

> +	if (parent->num_children + num_nodes >
> +	    hw->max_children[parent->tx_sched_layer])
> +		return -ENOSPC;
> +
>   	buf_size = struct_size(buf, generic, num_nodes);
>   	buf = devm_kzalloc(ice_hw_to_dev(hw), buf_size, GFP_KERNEL);
>   	if (!buf)
> 
> base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5

