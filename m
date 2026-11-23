Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795474032;
	b=syQt9gbx7HxdINHJojM7P6BpwidnWwjjN03tDxlYWCn6tff2SRA5um68NQU9n6A6J3by
	 34i1uny+SLipngc7pO6A0YtGKdVj+XobgQrmJIESE8wteC/J8uUCoQrUPOXUV82mKprrS
	 U0+k1ldtGqS9lIEDsqTv8YoAr72cumhWoZzfsFE7s7Ry4Ek7WuTDyEy2gHDpmNBsB2y5M
	 gpMaXg36V2mILGufEr7PAFROge+cxFpAdkJBgpTvQU2lKXqia7dCNCbm9tYjNq/Ohesi7
	 Km3KRliNaF1tWSAzJ5WcD62cxDntYcNo0jnJG+cwZURrSwRt55Kgr0kWiPHXsHYDvEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
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
	bh=NALa9Wr6VpbSvo/LtWdyyrY35Lk7zNRaxr4wcyvQ/lo=;
	b=D4Q70v8cY4NyIwzvvYEH3pDC3zT22cNIS5e0qP7SjjfNTmFVym3U9kf89iXIA86U/ln3
	 fnwDggYk7GgkQz/CIyVhk6AstV5XP46gM89YHFHaZ0mgx/ieNjLfX+HsYH5WiraX74UU2
	 IsOoIih+1f3jSLG4egVcfXcByhEoDR9TFVKRzbs7Ot0XaBlhwWf4597k5sySKNZCVvldS
	 m0ECP9PKlm3k6hSPQ0pnVzLn90Dn2wxCfLx9yChyKmzoG9lU94KO8/U2k6jB9TTgF0nvH
	 K0revz6q64uidix/iQiGWXruuv3o4kc5ah1lqoDdYKhQ2r9pFOgKaHl5YHzuaD4mLIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHbFzIQC;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PNjatB6a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162DD606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHbFzIQC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PNjatB6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795474032; x=1827010032;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ptubGmvaDfCxHnnv4o824iUuB9IERiCwTiR7I2vmtHU=;
  b=kHbFzIQC6O3EAl8i38xot8QsLvUXFVbPAgHR0P+ZrYeSP2CA+kPfmftw
   WgGwIEiZ/K0r+xZFs54yD0q15wc0V0wDg0XFxpbhI9RaXZNPh8xSIu5qu
   GwSKz25TVTj2GbpnjjbTtQVxIsTmQEOm7h4kmPxkuUyXXjAtiFPPNl7Jx
   oAY/Xv0SFPUpc5JIVS+AZtbnk/Xgdn9bmLw84t9kWg2xamV2ugUm/x6W3
   ELBwjjBTu64eOp/RBWV9sy5VSaj69bwd2p9V9LplIqizr/ZYxcXsGVPek
   VmTQPJIgH8LLMr0e5ktp7g+jckpwaN6zfRiZWq6ZhtUmfhCOE+NzT0awU
   g==;
X-CSE-ConnectionGUID: +XQP6gtHRcyO1qViWxgNMA==
X-CSE-MsgGUID: ZfqDrfeuSUK8pB+mI9CaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4284738"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4284738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:47:09 -0800
X-CSE-ConnectionGUID: eBQ59PQIQ9yOIeAetKDXHQ==
X-CSE-MsgGUID: AErYV5zFRfuWUrD13+mDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11723311"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:47:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 14:47:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 14:47:05 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 14:47:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNA9FYNrpHjfXKUnfwt5ieh+1/S4dXTl/7oFKbNRcarCWUZ3cVaBSYl3BouLqKKaCZOymVntO/1ydL+GZguKeNvoSFERSEnnCKjL+ZH+FjIJoREoty9YRm7TGweRc/lrdAXyowoYjcl8HeRV2tPUrzeYRB2oW0ygnb+p9LZM2YBhYPLK4yxXyQv32FnCxwZtAd+zMKTGmdIEjhEWHP3rWzgR/plufINXc4EkLXsFao2pfew+kGlCoeqE86cWyybV5kYxngHi77RO3qGXIjQ0Byzp9pRmOJwgfVFZ/VNOSqLjhLWqQhGXz1pThU/VbsrStU0/xwaVPTIc5IFwPF/0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NALa9Wr6VpbSvo/LtWdyyrY35Lk7zNRaxr4wcyvQ/lo=;
 b=UjA8S4uhgoXrymz5xkyN+9d+CxB1Ar1t6ruLGIcbl1/zdrjfT0fzYbeRHTLQnefbF5v8zrc0jsB9q+X5H3sCsJ6SIPVII2pLQDzwgxIP7Wn1j/8MITJs0uhoe24PF9roqzJQ5d9JU3XF3YgMzIqLrYScl6Y7QYQbmO6+lNK+zAqltFlOaVFCq3OpfHMuAbod5XxV9Wed3sjhEWWCyZJPxk9edSjqRUuSTLFlbZVpuOw0U0C0YEOdhBMCveKjiIdKKZ20y3Z7pMQQ3zWinNrIFqCi6AOnYbqdvRqcPV1iSKF27LmHLoF8DSqxgSa51wet4g3/YrvNaC5EpD6TqeEDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NALa9Wr6VpbSvo/LtWdyyrY35Lk7zNRaxr4wcyvQ/lo=;
 b=PNjatB6a6kuNjBuYw/Wxl4YQyvwOgDQeVDg9sdYdgX0d2qTcAb+C3HqRZ6RY+ODMzYXYvTV43g8Cpce53GncMtxkkShjfFbhu2M9nz/qh8zvHobR5P1IJXgaXwH9Ct3+YiWp5oIGW3TYqn8iplxbWjCHEBS9FW4RR1060Gq1muI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 22:46:55 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 22:46:55 +0000
Message-ID: <a4e78445-d0b0-4347-85c3-acf0184ff66c@intel.com>
Date: Mon, 23 Nov 2026 14:46:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/2] eth: intel: fix unintentional symmetric RSS
To: Jakub Kicinski <kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
	<andrew+netdev@lunn.ch>, <horms@kernel.org>, <ahmed.zaki@intel.com>,
	<jacob.e.keller@intel.com>, <intel-wired-lan@lists.osuosl.org>,
	<przemyslaw.kitszel@intel.com>
References: <20261123205600.1794292-1-kuba@kernel.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20261123205600.1794292-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To PH0PR11MB7710.namprd11.prod.outlook.com
 (2603:10b6:510:298::9)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|IA3PR11MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fd666f-c02e-4d2a-b2d7-08df49b3ac9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261102123227099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: OZwACUjiDwtUY9YfKesKQspjB9pSlBTw2zCZQ6Ldmw9xYo6s1kJvtYjR1vdG9/Ty0Aj4EViZ9yOpNZlK4mXCOMDKoHLxkiJpzVtjM7k/m/QZVZjKkMus4GSxemWZcMLhaaJ5QcXOjT3SfhxYRNtw0REYBVSehEMC/LoooGWh0TOuEV+9yndfAELGNYHBI4zkXvMG9tsmmFO6zKzN4dsA5YmxcHx/bPHIJct4YtVBQIq6M/qyG/xuOBFypmfTVGC/kkI/JVCOXrDY1w8IUvB1NTA6tLzMF/BzrNPG5RP7cuvrPHbr7oT8vJn5Fp/Ck6LgRcBde4S8OcBwPEIS8qnWv3qTmPR7XHaztPDpJau2HbRS1dOaGIBYnetopwxuGUm+8CzkbGIRNiUXDA/7DHmJCyJXxd/cDTTkmfpS4gxCPJ/plorKIT14uuVFlgjNYzlLgRIv32z9Dcnbre2b8u5k+AJtcXHdvH3tgpBIfomwX9AyyA8JbDAaZXgzIOaajyYX4X+sIMijuJKcDosuk60UtK2h2gTR2tgt3n1QBdFmoskE6NHJ6+AogosTr2cvOY7ZnHdC7Xxta+9IH1q9qfFqT+Ji87cVexPY2VIAsoYLiTnXA0UZMmaDhLA4X/dYPjSN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261102123227099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHYvaGs4azR1SkZWbC80Q05RNGl0aGd6b1FHYUFubFY3ZytvUU03UUFQYkpW?=
 =?utf-8?B?YmIrQUkrSHJidHRVTDBSTTB4YkpWVkZFZ0dpMkJIRitYWTZDU3JwRC9ORklz?=
 =?utf-8?B?djgySXRxb1ZvL2RtRkgzcFlydnBjdG9HS3ZlbHN2NlFKNGM4WStyNGpqS3M4?=
 =?utf-8?B?L0I0ZHB3NFhtbGllU01HNFJBMWJGNVU1WUd1b1RxdGttZHpjd3hxT00vcFRC?=
 =?utf-8?B?SGhQKytJRmRvNlg2TkQ3VlB4SnZJK2pQUWF5UGZUNkNWVFB2QVBUelNRdWJM?=
 =?utf-8?B?bEg0QU5ZeHh4Um5xQTFZMXJVeXdERmZRaFZjelRJQ0hpVlFmOHVjZk5hMjZZ?=
 =?utf-8?B?WitOUExIN21iMll6UElyL0MvaDZNUWFiVjFsckhRM29RWmRHcUg5a0N4NDJv?=
 =?utf-8?B?Vm1EM0IyOWJ1c1NnTVFzVlUrdnZLOGRibUdlTEl0TVAwdW9xK1hxamJnaUYy?=
 =?utf-8?B?TlR4dEdFcEVTSjdMRlV2S2YydEtiZnJSeDA3VjN2a2lrL2oxWDZ4MzI3S2Zo?=
 =?utf-8?B?cDNHcUV2RitscHRzb0FlWDNWMGlVenZJSklsK0hib2V2OHY4b21jbnh3Ukpr?=
 =?utf-8?B?NVFUWnZPS0Q4YTNYTmlER1NuTWVhc2hyZ2hwQmRFdEs1TkplNW1XZGdyQ2Nq?=
 =?utf-8?B?cS9SZXhZN1dGa05oSHM5RjQyU3Z4ZkxyL3lzQW81UGRZdFI1OGVwYjJOd0xo?=
 =?utf-8?B?elVOS2ZDWFBOUG93U3lGenVqVTZwSnNqLzhTYUJ1d2tzUlRmK1lTSG1NZDY0?=
 =?utf-8?B?MldIcVVWWG41VGJWeTRzN3o2c1pNREVHTVdpUldoeXVnWFJyblNVSVBwMmQ2?=
 =?utf-8?B?VlZ2d05UZlJXWU1YTzBQckhvNk0ybXNTdGRzUjRPQWwzejFYUytyQ3ViTTU4?=
 =?utf-8?B?VXp5TnlSK092RWMxaFd1NTlUcGhJYTd0L2E2MUg4NmNhVFI2cmxhYTdIT3hT?=
 =?utf-8?B?U1lMVkkxQk5YdFV6dkVEb1Arc09CV2RKY3NIbUdSNzJnT1NhMXVtTG5ySFkr?=
 =?utf-8?B?eFdaRC81N2x5K3pVTE1lTkdpVnQxRXIvRTczVkFwQWhjMktjTTNZenNpcSsv?=
 =?utf-8?B?QkE5Q2VFQnpiMDBSUk9Ka1NUSHF0K25FTkVHODdMOXBySVZVUVZZclgwV1VC?=
 =?utf-8?B?b3A3SGRHcTRtM1NWUlBDZ2tXdjlGVDRrbzVFMzBRblR3NUI5akNHdDBFV3Z0?=
 =?utf-8?B?aEd4WXhGb2dGQU4zcENQa3ZwS0V4SnBFYWdNMS80czhIdnA1cXNUWllybDBr?=
 =?utf-8?B?WVNoMkVFTXpsQXd1VUx6azdnaW1yRFUrblozVHVFa3U3Rnh1a1Q1NS8wWmpP?=
 =?utf-8?B?dC9YU1U3cjkvczRCRkxnTk1BZ0xiMVBmZ1BUMTR0dDI5c21IbkNnQmRPandx?=
 =?utf-8?B?RGRvY1REL2tPYy9RS3gySVpaS0xYN1plNFh6TDdkdGhSbDJhNGk1bUlLd3BP?=
 =?utf-8?B?aGUzY29ieDMzUG8xL2t1eTAraXBoNUxneHJsaStxaHhCRFczRjVjWDcwSjRh?=
 =?utf-8?B?RmhVakI4UFREb0sxamRQK0JVMmFpUmE0RmpUMG1tajFCdEpGdm9ZbngxT3lm?=
 =?utf-8?B?RFpVYTNzV1kwdktENURvbmt6azR3Q3Ywa3NlOUpFNGdaMVd4b0NqNXRQajMx?=
 =?utf-8?B?WW1oS3UvNUpzL0pnM2x6MFJoWm4wR0pid0t3SWZVeStVNjlUczU0Mlg1TEcy?=
 =?utf-8?B?eHNVVEwyd0tjcTBqNXE1ZHJmdEwxSjF5QjlIVWVXNWwvaXlPMlZQY29jT3NE?=
 =?utf-8?B?VjJWdTdvckVpVjhpN09Ca09sMlZzSlhsUGdFejNrdkRlYkxyOEl5KzNCOTdD?=
 =?utf-8?B?U0hmREsvbC9NWUsrYUVGZ2dkWVlZMmxXN2FxaGJUTzNFUG50Z2dlYUpaNnlp?=
 =?utf-8?B?U2RveGcreTI2MlFUU3VsN3UzUXFLVGhwR2RFN1BIUUxiWFJZQUNWbCtTNXYv?=
 =?utf-8?B?c2VIRHBQZk9wSzM0Q2xpK2RkM0RnQ1F2TzhGZytvOEhXQnZxMmszMndOUEhv?=
 =?utf-8?B?Y1RQNzNjYzRoNXNFcXowbXkwNEJzOVRuWVNCU0xGa1NRTzgrTDdkV3VxOGYy?=
 =?utf-8?B?WTNOU2w1UjZYeDIydmIrakVJcW1FMnA0TTNTY1E0akNscmRyMm1VSE9LMm45?=
 =?utf-8?B?V0hubDY3RVh1TXd5N0hrNXErS0FhdGM1UklDMlJhWjFxbGtnNlcwQTB0Yk1a?=
 =?utf-8?B?aTBtd1QvMFlFQ0Z2ZXBDdGtpaHEzaW9WaGd6VmdHZG9YTXFYNG1yTnd3KzRo?=
 =?utf-8?B?Q2MzS1REYmVEODQyZC95d0tRSzBraGQ4TTNLZGNaaDNQOS9qbHJSUzVETUM5?=
 =?utf-8?B?U2pMQ2g4U1k1RFh6d2luWWJ2RTc4bmpaOWo1aXJHaE1kZXlkOGpiN2hXaEp4?=
 =?utf-8?Q?YCLIsdLb9ss0265E=3D?=
X-Exchange-RoutingPolicyChecked: YZJ+zx7WcRu6HkbILQEGTVceU8tM3BVTIsBbnoNeFASsj5pbw6865dNYxNgRPBKSXrnpMrG3Zu3ylO8m766EG7vHdy00iTfB3E3/zpRs0sgrlhR3JYWUVe0yvnKkNB0Xes412MlwPZ7RULT6gG1VcwMicNG286KVOtB3A1JADuyz/JWZr/tvVr7biXbqxUvNCYzpJfo6mNeHEK5/3M2xct77DR1PBsaSVz8lMflcn/it15ZynbzydStnutZG2ADUoJwEp9YhQidr8xHZ2J7cm5RqfaoY3mNmgg4keQoMvR9RtqI/S6laoFQzxIvrgqL9y6XlJ2z+sQCZk+G6tvz+ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fd666f-c02e-4d2a-b2d7-08df49b3ac9c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:46:55.5489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCkjnG34EOD94WgD8aYeU+QrjtKTKJ+aoXT5a2ufPVa1u6tS33LXnf20XeA2rKgdTipY9gvmSjMQ2FKMFSW8BQ/rBoe93P8/969DZ5Ni0pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9136
X-OriginatorOrg: intel.com



On 11/23/2026 12:55 PM, Jakub Kicinski wrote:
> Fix Intel drivers not handling RXH_XFRM_NO_CHANGE.
> 
> I had an urge to "fix this in the core" and hide RXH_XFRM_NO_CHANGE
> from the drivers, by fetching the current config instead.
> But "NO_CHANGE" values are already part of the driver facing API
> (hfunc has ETH_RSS_HASH_NO_CHANGE). Besides we can't _completely_
> hide RXH_XFRM_NO_CHANGE from the drivers, since we want the drivers
> to be able to populate the defaults for new RSS contexts.
> We need a "user didn't say" value there.
> 
> ---
> 
> Matt pointed out that the upcoming RSS sizing series breaks
> NIPA tests, this is because the fix we shared in June:
>    https://lore.kernel.org/20260626152636.1e48330f@kernel.org
> or Maciej's version:
>    https://lore.kernel.org/20261007200311.730443-1-maciej.fijalkowski@intel.com
> is still not upstream!?
> 
> Recent discussions suggest that Intel maintainers may be willing
> to ack patches on netdev directly. Let's put that to tests.
> 
> Note that I think this is a major bug likely to bother real
> users so I'm targetting net. Przemek's series will have to
> wait for net->net-next merge.

For the series:

Acked-by: Tony Nguyen <anthony.l.nguyen@intel.com>

> Jakub Kicinski (2):
>    ice: don't unintentionally switch to symmetric RSS hash
>    iavf: don't unintentionally switch to symmetric RSS hash
> 
>   drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 ++-
>   drivers/net/ethernet/intel/ice/ice_ethtool.c   | 9 ++++++---
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 

