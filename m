Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093879;
	b=vLBVDbbloJMXinQhVrkSPT1kzzBf+XsH9rZskMmxVGtjYZJ3RRov2/2Yz/u5COhAc3l3
	 a1uSJAGj7VDAl2FejuvLiuVmsr1/s1LcSktJGNb8Fbu/Wd8PnejgopaqUwoycrtKNZ2Qb
	 X7FZeDjDoOI/rNAt/I8ZviE9kBCWb8CA5m6uZhyv3WMP4Ec5koF4fsxa+VU0pQCHBDm7z
	 yM/7tTGCry+QGU5DY3dsK7PfecL2IrvDWjp6IWR8Hh4zbDzTMdLSIEdHbtdXKIGbH1jdI
	 QRCkfWrADCJFda96UpWSnOozrILd6ibSzvd1dOH6mjmoIF6HVmsCS/D3zvzLuXXpLzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093879;
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
	bh=V+gmNCyF9iPmK8pTSRkeS2wsiG0P9AldUIFdbELcHeY=;
	b=H68Nksqq6IH4caUa6SmsoXE3WsdaAK7McKddabVVo41TJ26fv2d8h8w7osrpVOy6qar9
	 KngnFNBY4Ha/bvS5nr1cNNSYGnvUNeAsuMHCPBh96ebIePnIlrWVLliQICHICk0tqO3OE
	 /KbaQY8DEKT54xoTImKzz/Y2DtvECEo3IpPW45TG8dqULkTfnUFiPlw/fvLT8Fn1PPY+w
	 iyNmWqoPTGvM16wCV1DuAuoK5tBmFaGHhZdlRCHyDu/JvII6hpZkeoeY/16AYilX5DGMq
	 EKJeW6YonUnenDiTICrNJcdPhxK665xgDV2GS6bdOIY88okzYEhmX7yU4pCIedolLQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="SuBd/0aa";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LTEOnLmV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2A606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SuBd/0aa;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LTEOnLmV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795093878; x=1826629878;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uPLl85t11BcfToCP+M8pWXNmeLXLGOA3p/rczUQUBlA=;
  b=SuBd/0aaRh0QjsdybdJyLrkBF0fma0g+q2n9QgV9N9MBg6k0ETPgq4M6
   VrwEldHQRmwOmrRIgUHYpqX+yOcGJwq3U26p3Ef9X9d/XOPUR6HtHCncT
   LNUE0NPWxc/igksPBkfvytrb+4BH5m4lzF0WQSS4Q2F+Cd3fJbuHTm320
   8d8sctZrdT3DHC45I9eLw7B9lJiSvqbX1iBbKIfsph9EvkFk53ZmjzJib
   aFvwoI7b1uUD4+OWE9XbSSiH2sZZeQ8VbS1pXid1QCx9LYgtw+k1wGN6I
   oIE5llqFBQzNSbmOPKLjnvHtNjiyVpvotR41HkR328LR2fPK8pWI5hV2J
   w==;
X-CSE-ConnectionGUID: 1Ue5b2C7RPSu5WWzilCvBQ==
X-CSE-MsgGUID: d7URoqTTQSq+v2rf8U/DQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3950003"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3950003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 05:11:01 -0800
X-CSE-ConnectionGUID: BavMt9NkQHmqgfqKA59phw==
X-CSE-MsgGUID: V//dQ2IHTE+vP/bGEa+Ilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10239098"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 05:11:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 05:10:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 05:10:59 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 05:10:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC1Nm7vs6Rfmtl//T1MsuwtxwjQYqcVRwz7wk5q3DtAdqjAQFx7oNcgq0+3MrASd4w/zmATH3YDxyZV8lKrCTfkRQOBbI9toaL8EF/nV5O7YaQpUwE3kwLvkg2ZVnC7X5RRks46HVhMlB0R0qGkV+SgWAAXvv9jr/4er3CBae1GXB+MuJBSrBbdaZ6aDmeeC0VC70SCid5SIqwnx0VSyQiPrEmczX+uWLGG2HUPuH9aloKdRFyz2qpI79W2vaHL0eqh2t9Hu1cLqvvlmvYsSONAOTDCzC7EcAgauW9EbtxNzxuFgyMh+kDJCBcfs9x+mpx8kkjPB+aIFFqd06qfx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+gmNCyF9iPmK8pTSRkeS2wsiG0P9AldUIFdbELcHeY=;
 b=cns3iP62/wUc9hdkA6IvCKE7DTxx+x3mSd3o1taBYPYlZ5YuxVC62ZIjRxSIXY2enJARQNCBRg1r/xbp6IeRelmCCfPGOScUhGhPqwPJ9q3574f0DldDjEMnYkiKZD5VgW5Fk3zD1gqa07gGgBJkSeDeENQnG4LdiKut1Y3Seo/sPNNwghevxHdNxdf9M92AFCt/n2VYE2VhG0mfDzCMVABeqf9h8jSvM+/gXnf6HRwbGT0AlzcGlU1Jm3q1anSt/kP7yEwzU/QXb2uNblwTVOKHM1T0gYpZmeuG5YZZQaaUL+tJPn58kreJk0zAf4BRBuiB8yB/vOMW3E8djI2sIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+gmNCyF9iPmK8pTSRkeS2wsiG0P9AldUIFdbELcHeY=;
 b=LTEOnLmV0OpCiNoqwadF/VwGvBZnukqKegsc0aje6BUVMaaia7iYUJx8vjJd0tQSziWQkbVp93M1ActZYOo8cV5HZfCCx4TsoIUge0IwD0QrQgIgCBi4KlGINBi/4Op/P/V80G5SAggxZtQB8mtAy8t/n1W8JB+KqGD3DfBVajg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 13:10:53 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 13:10:53 +0000
Message-ID: <15730f22-1283-441a-95a9-b68874b35f43@intel.com>
Date: Thu, 19 Nov 2026 14:10:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
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
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261118171241.74a70bdd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:10:110::31) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|SA1PR11MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcbf6ba-8181-44c0-c1e5-08df463e8a43
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|4143699003|11063799006|5023799004|56012099006|261021135927099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3xZ2qO0Po4cOxy/YkqL5LgWwBEjYGqITqHHogSNUN5TqUAtQqq+NQXbV5t2t9wDW+clU5ml693t0SSdEVMeNtw2OkHD+j9IqDsNpDIyO9xtiMpTCsS84Ci8R2wLozOSHDqKxogyjFjHPWzDbyUxpcG1sK3/zqyevwRB4j6bii5KsZnZa7Loezn3QDSD3eHVRJmlkx0s99iQFyVyBG459rFuhVQr+WCnzvE5wc0DJ2utC8cMS8o2sEqR8IgwNRr/7Ezqg1octXtRUYAQjoGLed461WZ+uXVR+wXoV25SgOxioKEuL7larWB6BNMASffg2ImTarC73LW8qx82Gs8doVwaRuorxob7JQOvF/WcuryLUtCF9o7fpj/1zZHAp5Nzsw9IOEnm3MXOH6aPT4pqVdNIW65yGonUbBhXtLZT3lRyGq1pUGTbb70iqMTGTIL7Ni/bC+r0PV1MLyBPCJKeZpDxUI+VCMHJ3riAZzXYrqsxRk9rS2HMMW2YBsDNdXGDvQKBCQh30eWp8/i/cQitKTBAxRp9PdNns+ecmOKzZs23mVeJpbuChE0dIBqIJEO6cotd29LhFfG6ZQ9eITIz0V6pV/BvUgYsFC1DOCrKzOoi8M/IVHXywjxeyeDcN70an
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T285Y1BOSnhFSVBPdEZEWjJKTlpzZUsrdGdEc2VKRG5MVC9mTi83MGoxMlVa?=
 =?utf-8?B?Njk0RTgwSGk3dkFhcXB5WUplYUxGeHFIWU1tSXR3OXh6MDlERGVPTHRLMkhV?=
 =?utf-8?B?UWNnMGttL281azhFL0Q3ZVVPZGdFOGMxb3lBS0tZWG1LZHByY2JZdFZqQ0lx?=
 =?utf-8?B?RTJVVWtJS2t6TDBjVDA4ZFlGRFFUQXVZblQzUTI5bWx5b1p0VzUveUVQdjlQ?=
 =?utf-8?B?b1V2bDF5R05Jd1gvMDdsSitrMEVwcXNSTGtNVGhUMFd1Vk1JdW9uc0xxa2Fl?=
 =?utf-8?B?YzdUOFN6Q0tRbGI4ZzEwU0EzVEVENysrRjBFeFBnN3g5ZklHYThBbUhYREta?=
 =?utf-8?B?endZTU1VK3pvNjF3RXBaMTBrQzhwbUFIMTdzN3hYVlc1NlpGOVMwMmJYOEdr?=
 =?utf-8?B?OEQ1RDBMTlFKR2RkTldSc1JwTTIxQnRjNkdxcVVTTXZGc2ZxMHROSUZ1T0Jv?=
 =?utf-8?B?dHc1SWt1c3cydk1ZOC9YOTQvTEoxc0F5L3VPUy83UmNvblNoWncyeCtseXRv?=
 =?utf-8?B?S3NtSjVXQ1NrT3JoOFE5aTBRM2UrWXNhcEpNQksvUW5iWGVUbUdlUE9nbGFQ?=
 =?utf-8?B?dUs2Q1JvaTNZcFo4aG5hc0ZCc3Jhb2ZpZnFmclpGWk1FbUFwYklnRDFGT0pU?=
 =?utf-8?B?d2hBYW5wLzVEVVhsVlFYYUFGYjR6WStlUlFSOFFINVU4OHRqT2hnb2RQNnow?=
 =?utf-8?B?emF0d05QSGJLRzZodmZHbnBYSlRzR055cXZJVllXQWlPbG9vcmxlK2NLay9N?=
 =?utf-8?B?MmY2RkNGSnEvcW5INFdqSDFjektnT0NheDRsRFM2aUdBMWw1Uk5EU2ZrcDY1?=
 =?utf-8?B?QmJUbGdQWEJEUGhjTzFWc1ppc0NTaVJ4VlN2dDFNOVdFMEx4UE9ISWhZVGZR?=
 =?utf-8?B?cFBNZWFEb2NlOTlJVlhIWGRPalYwRGdYQmc5dGdvUnJNd1VYdmpPMHZhTjlL?=
 =?utf-8?B?VjlnL2tjTjEzdGlSNzgwODRGQk16RnAwdWVHUStVM0Q0NEtLK0R1elFyOFda?=
 =?utf-8?B?RkQxRk9uaGhxNHRuNUE0ZXNVU0ovWjNwOVBVOW1zaXZLUEhXbmZxYzRTb0Rw?=
 =?utf-8?B?YUxYeDh1LzdyVDgvU2VkVk12dzg2OE5oUXlWb1hxWVZ3cXpIT0lRTSthNFZM?=
 =?utf-8?B?WlFpejUwQWdudGhhVlhTbzU3NXUwTDV3SlU0WEdFTC9RL1RQbVdtSVNwdEFR?=
 =?utf-8?B?c3lRSDdUeHZrc3ZvN1R0MHhzU1pPbGs1eXNqM1BIR0FDY2xjYmdTNFFLL2JT?=
 =?utf-8?B?ZDdiMVovdnRldll1eXF6U1NCYSt3cGp3TUJkVm9td1dNZnQ0d084cG5XbkE4?=
 =?utf-8?B?eUw3dHVURmw4dE52VThHeUxTVjA0Rm5Ga2NpamZ1Rk1wUTY5cnZNcTVncHhZ?=
 =?utf-8?B?d3pSaXQweGtsMnBabXlIejBMakhEdTA0Q1IySE1oR20va0JneDcvcEFGM2pX?=
 =?utf-8?B?MTJhZUlHcWp4QXRKaUwrOS9kZUZKZWRPaWdKR2N4aHlnWjdRYjk4Z2lLZkJQ?=
 =?utf-8?B?OXVhUHdjc3FyZnFLOGtVSUFSTWhYUTA2RkRTQmFXSE1VRVlEdEt5bjV3WEdj?=
 =?utf-8?B?WTE4OU5zazBQcmhjb2FLeGRkV3VWQnBOWTVBUnFFVWtZUDdZWHphN3ljVjRx?=
 =?utf-8?B?SFJ5N0h3cEZvMVp3amVKdVk1NHFlYjB3dHpCdER5RlB6VmhtVGlZV2t2VWdm?=
 =?utf-8?B?ZXBhVWMzOC9RcC9mMU9WTEN6bHRtV0JxUXhFb0k2Q0tZMWhDbS9sODduQXVv?=
 =?utf-8?B?RTZFSWc2Z3ViaXpWQTRnZU43dnV0aSs0aVRhdGZPOVN4K21IeGQyYUdBOW5O?=
 =?utf-8?B?N0RVZ3dBRHUzK3ZhcjJxdlJGN21kYzZxbWh3RFJ0UjczeWRPQlFpMDFpWlRL?=
 =?utf-8?B?NE51STdaK3NQT3E1TjNKV0dDNER3VTRpcjI0ZWFZMDZHSTZwUEowR2tITkJ3?=
 =?utf-8?B?ZHdoOVhlQjN3Wlc2ODJzRjFERUIxclk1Sk5Nb3ByVFNmMXhsR3BFOUNXcW15?=
 =?utf-8?B?Q3lQVHpvYkdrckNZSHB5bytZbjVoUzJITkZneXdUNURUaVFqalNGM2ZWZEZF?=
 =?utf-8?B?TGlwOE1jREZYeDQyOEdBd1V0Qm5nSjhhZyttYUdGVzJRQjArMjFOVEp2a3Yy?=
 =?utf-8?B?akRjakt2NE9PSDBRRW05K2pwUFozVkZtYlg3WHgzVXZnbkgzNXJ4UWcvRjBW?=
 =?utf-8?B?UmYzazc2M2s3L1hRcjlUeHNEZUJsNkxHbXNwc1h6dCtSNlY4emE3QjQrUCtS?=
 =?utf-8?B?a1hzdDNEQzdxZnAzSXZjKzRrbk5GMlpVSVE0TTlVaDBpS0RWbTd5dUR6czZj?=
 =?utf-8?B?by9PdmtvaVU0RWpTcWhVR1VaekZDaFllbFVTbnlRMG5KQ1YxanRkWkRVNVA5?=
 =?utf-8?Q?4FyqVlyKf7Gby9ac=3D?=
X-Exchange-RoutingPolicyChecked: F3zjZa0jlVsDN0btCWgxXEB50l7NsOz/HmmTETorbkiUf8jRJhw0pxFjmCXL3K4b2rBl2MBXWkRVgjZVvtUAJB6jzXb7YN5QuBOlrzYg6pAQwJ80Y8k8Nm1Y7pILrj0mNEJxcK/px2RPc0O2xrwOpVOWMHeOMpHa4YV+T/+k0xMnYjp2sjjaMelnrAsaBuXi5ubSWF+yKhez5nI2KVIOwdFgm1NN7aqHsuYg3WCQrDzCiJpxfdhDOROqcj5Cj/nUwjxIGjJ5a4sS74SsICXT0EokE3C5aP02qzH7iT6556LRyel2qVyBik0T8THDU15zDRH8+OnpK0NjXA5xLrco9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcbf6ba-8181-44c0-c1e5-08df463e8a43
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:10:53.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzgE7iPzowiKWQir5X9J509L4xGdxINPqJcFQcp3b5Zw5jFdJGXamq+IVb7GsRah/z4y2C9ycGSYiAERAvK2saM8j+vkUJ4UTzSDaxPC0Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
X-OriginatorOrg: intel.com

On 11/19/26 2:12 AM, Jakub Kicinski wrote:
> On Tue, 10 Nov 2026 15:07:09 +0100 Przemek Kitszel wrote:
>> Also available here
>> https://github.com/pkitszel/linux/tree/xlvf-v5
>>
>> The purpose of this series is to allow iavf to use more than 16 queue
>> pairs, in two modes: up to 64 and up to 256 queue pairs.
> 
> Doesn't apply, please rebase. When you do could you chunk this stuff> up? First two patches probably stand on their own?

There is already [v6]

there were a simple git conflict in the 2nd patch resolved in v6

would be nice if you could merge the two first patches from there

> There's likely also
> bunch of refactoring / prep you can pull out of the drivers?

will see how it shapes after addressing your other comments


[v6]:
https://lore.kernel.org/netdev/20261117094913.100756-1-przemyslaw.kitszel@intel.com/
