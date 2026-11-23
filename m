Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445784;
	b=0vNZT7zqNrH5ug0uDQGhb0pYRWJP9Mji659MOJlx3yAULXiAphz3NQUoAMpIegow3wWZ
	 1jkx5kVvbhCaC2doFuPZ1cLa6LIe7hxHRAiByCvagyBuVrKBSfN7eFboSCtsOXVtLlYzT
	 F7d+VlmRN/IuMMsmJeXh/JEgtAYKpxm+o8QfDlNAXW9W+tbhm+04f2VutEeTXZtuenjXB
	 2DwPAyJjhqyw81Y8C7vFVrh0j7rCwKUgOjosnjoxM8FgbEEGhuyW8bcxNYuBYC8URcpK4
	 YImqyFx7W7iLit9ssfm6RrRmsYX6Jp0E5eUhf3TWwTAhwKWZ44RtUnsY4mcBa4L43Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445784;
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
	bh=pcPSMjoI+pyTAMJoCFt7X/O6a5MgPTazHNbnX7QuQQo=;
	b=qpDrfTV0Ei+d3JX4uoxZMSBPH6Q8vq4h1StUcxfNVU3aM+fOMvlftr/0YFUZU/TOhPgH
	 pD0q2CMFVoYGX45C1kLV8hJhLin9S69SZ1yiGJMwQu2g0DwC4kCzEf7Y7w+zrkSrlvQY/
	 G1VGS0fnNPCpGAbnYbYdFy6ON6qhMphE8KCVCj9hDXloUG+rz5AYeX3VFLPoHbt6FczXx
	 aTyci1HF7oxsuSM1YjoFLaOXWuzUYFeLLlULe6I7t/3ldK5XrTvFSQLB+Hfg8bQhWSDxp
	 WpS9YVdxtbVKBNnXr5mvxI5WaBy9+L2c2XyN43sklOofvhXodCmSvesjA5KljLyiAag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SmJIlSqH;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=C7lcp43X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900F606B089
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4900F606B089
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SmJIlSqH;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=C7lcp43X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795445784; x=1826981784;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KLS1SixombBRzLP0KKbzzvY1VZ4oCTcVvP41FZkw5xQ=;
  b=SmJIlSqHOUImSvDq71dteJrmDxpO2zWKSfdW8Tsdcg4Rv16wby8oVX3x
   v8IMe42OO92X+Mq8sTuZppmKqJjS/M2cs0rFwmMiaLy5yhcsBnooUnh1E
   T/2FltOUM0N0m5tBuR305Wd9xEi+uunmq+rUac5PU760lMi7XwWYbPvyD
   er7/+PVFv7ql9ccpbjDoa9iKdEcvJFJ+nE7qNJtLr8skpptsy+5m00H9Q
   qf2RDR1MS68fk5lrTMWHnNTGd3gnxdS2qlS8QETdaoZtD569Eq89dUEti
   spPtJaWBVwP4MMZ9BnFesBjOBcaJuemU9wizaaNyNM/N3UyXLPmot/b1O
   w==;
X-CSE-ConnectionGUID: v2K19lyTQW28NpSsNGrGhg==
X-CSE-MsgGUID: IJ+L/zsURFevzNpEwFRpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4157356"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4157356"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:56:22 -0800
X-CSE-ConnectionGUID: l0/aeje6QiKh0i3P1yx9kw==
X-CSE-MsgGUID: GD7wreWEQA6+LCiNw9WuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13111027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:56:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:56:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:56:21 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:56:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmQj0TP26jXaWDMsAXB7qMuzZXv/rY78kAz69LSviSG2ynvDQLbhwDNu6kZetD3Sv1M8wQW8Q2wwdIVe6XPW2krLKLymWn2BOidULWKAS/i4rIz50UhypWe2ECy6e9JIHAI1vY7/v1WtGkI84tT/nBqP902RE7Uk07ncaT2Ulvl6ckIVwpFKGBBMj63JnVeZVynolqPG1GkMEktAq7n7yffrKwtd2UgFmCAK1hQIRZLA2782emUxyEIRFY5vN8FXZbw/GhsWb93dPsc0yMCeQ1kbAHFZ3uFHTdnMFavGLkzkARKRgektgLYXrs2q6/MCYsqn4Cp7eQw6gitJdGCymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcPSMjoI+pyTAMJoCFt7X/O6a5MgPTazHNbnX7QuQQo=;
 b=l3QfRRgGAOZotsKidx37PU5t0jfANcG3NgXfgTchWTXsDAGxFhkDNsmLp0hwAklHEcxwxzCC2n+zPuQpWfCFKh/KQBslPp12aIYAA56ESnfGAAkjMpl0PiXvxhAF2LQ8BK0fB31WNYKrmM+t+Pxz6UxPYxkSZCYw4PsrOk5R54v98HHKeFZxK/PyDeC5vqGE8XmUxQBC9/MTmpK69SumvEyWGV18n5qRNLjWiuzvl1RLeSlRQGE55PDq55ognMgLSAuSZ6Ib6ySYCKHWxU4JQGbYLj2QDZJdhysd3t4mcqMKhkLpdRp3lj+hB22yRjph5aFU+iDiHvjBhZkbqddCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcPSMjoI+pyTAMJoCFt7X/O6a5MgPTazHNbnX7QuQQo=;
 b=C7lcp43Xl3+51h2Lw6s2fjqAJCN7O1JB2haFeq77y6O7dapKcWKHH14YJncvhd50RTYZx/KZtn+UxnqgXyQWurUCdougrrHz+OH0QpZTopD8tiIl216t4PMT72u/Cwzxq2wYZD84/GKsrbYFvyGtgliCoFVBE5RjGFjV1N0QDDU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by PH9PR11MB666607.namprd11.prod.outlook.com (2603:10b6:510:41b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 14:56:10 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:56:10 +0000
Message-ID: <7c6728af-cd51-476f-81dc-f977a6f85963@intel.com>
Date: Mon, 23 Nov 2026 16:03:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
To: Matthieu Baerts <matttbe@kernel.org>
CC: <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jiri Pirko
	<jiri@resnulli.us>, Tony Nguyen <anthony.l.nguyen@intel.com>, "Aleksandr
 Loktionov" <aleksandr.loktionov@intel.com>, Michal Schmidt
	<mschmidt@redhat.com>, <edumazet@kernel.org>, <horms@kernel.org>,
	<pabeni@redhat.com>, <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<andrew+netdev@lunn.ch>, <saeedm@nvidia.com>, <tariqt@nvidia.com>,
	<leon@kernel.org>, <mbloch@nvidia.com>, <jacob.e.keller@intel.com>,
	<jedrzej.jagielski@intel.com>, <anzaki@gmail.com>, <brett.creeley@amd.com>,
	<ohartoov@nvidia.com>, Petr Oros <poros@redhat.com>, Donald Hunter
	<donald.hunter@gmail.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
 <9cc095f6-fb9b-48d1-9aef-f40283e84a78@kernel.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <9cc095f6-fb9b-48d1-9aef-f40283e84a78@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0032.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::8) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|PH9PR11MB666607:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae17d40-d6d6-4f34-931d-08df4971e956
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261022105027099003|261021121427099003|261021135927099003|261021123027099003|261022075727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: DQQrfkzuv0dOyydCAzKKOMBy/J29w6jge5R5PgeD1223mkH1YyySlYEXbW13au3srjPQWBZuGK8Oe+FiW1GYTrKy9JmjeNL/C+9wSEI1GtS7HqUkDm1Clcal5xq2BgMIXc2DpsNfYi4DLYR1BLHgZZP3LzLYv3j9b7p9neTkrG2YXqTHoH92tUHOQG2bCU4tp19h1nUs1c30XhXeBQ/4/aaNvqmKzdMPqXEF1tuhn8bJCq8629InneNXitFzw99f96qWcMIyA9p79nzrnjfVK/JHbKJ4eA2CkfWth02GxClds1Q9NVW91Iot+ZaU4OqNHIqiFpbHs648PkfGiwYqUin0Q9ypX0Ijf0RB/7s6QH+pTszzPsEnYbj1Exy656MQjqv0dc701+O/v6Cn0f92yPo9u06f3VxTPQZ2wveFGhYgvUo5mh0gh2c5oORBN/hjFMOgvmVFf95xatzTsAYY7O3b9bPj/UKckhE9C5EpL/aZXpM3TSezej8ulqn6OlGL+NGeP2zpXsZt2uum70xiyqOpymTjWNHQr30DVB1x8CCJCKCgr1Y1OlAzKhvoh34k50Zt1FyaQVsGdlBvkap8SlUXcXhrmoJPA7U+GxXQ8f1NVgg/QLCpxWqT3qV22+Yd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENVaXZSbG52a21zRnBaeFJzNWw2QzhRdFMrazNyZHcwUTdReGVnajUwb0N6?=
 =?utf-8?B?UFB4TTVITUkzalFJc2s4NXdKUmtnTWtrdEJrK2ttTU9tMnA0U1F0WEVLaGFt?=
 =?utf-8?B?MVBCRnZkeHhIM3dacjdvaXpyZWlGMVlxOXNQWE5UVkZGZWthK3ExU1c1TkpI?=
 =?utf-8?B?cTZVVVVrZU9jRzJVMGVXbGRlQk1DUjFsZytaZHl4VldCMmxMV1hXYys0WnFZ?=
 =?utf-8?B?Y1QvV0VhQjdhTjUrSnFvSDVtS3B0WWc1U3FvcWNtRHc1SUJ6S0xMZks0L0VJ?=
 =?utf-8?B?L1Y4b3BBckdVMTR6cVBXUWJQN2M4V0J5WlVwanVKOVV2MTZYTTFpMXFHSkRQ?=
 =?utf-8?B?VWYwR0RSM3dGbnJ6bk1KbVNTUEZKYjJrTEpwd0JxbmducThydUFXV2xsR1BQ?=
 =?utf-8?B?OFRjS1pDUWlleWlOZTYvVWg2ZStBU005OWhwZ1ZsUEwwdlNjayt4ZXExSWo0?=
 =?utf-8?B?eW80cTFtT0VTUDVGL205NytIbk82SnpWSjhMdFNjdWRxclpHZVdQZXlvenRZ?=
 =?utf-8?B?VUVNZnAzbUUxeUU2amY2clk4clB4QTFtYkx1SmZJcExGN3pJWG5KcVBmWXNk?=
 =?utf-8?B?UlRkcFlURHBKQUZ1WXd2Tno4aFYzOS9PK0k5aGJGSHlmcEtTQ1A5YmNzTXFU?=
 =?utf-8?B?WE1idW8zanZ1V0JpODRZV1hQcUZrbXlicmkwYXJQcTgwVExveTBZaFAzamI0?=
 =?utf-8?B?Q0dPVVlucmxDSXVzc0RnNVpTKzdwQW5TenBTTTRJdlh6V0MxamY4VU5EL0xu?=
 =?utf-8?B?d1NxRHJFZndKS1NscTdaM3JKUWtKamRFZ05xV3FtOEw1aXBVOTN2Qjd6Nml6?=
 =?utf-8?B?cmNDcG5PSjBoYU5WYy9IUHZoejM0alVwYmdsQjRUT2JJSzRkTVpoK0lycGYy?=
 =?utf-8?B?NDFmQjVqeThPajZHeHJwVUpTTXkxUllMZnd1ZnJUSzV5dGwwL2o0UkJnMGVt?=
 =?utf-8?B?ZnA5QmdQWUxibmRKejBrQkV2RHB1ZkpYelF2TGs3eFhLWUpVNThDbzkxaE5N?=
 =?utf-8?B?ZXNtQWMwcGZHSUpRcVVucFRqd2VqSE80TDBnYUlFTUEzSWt6WlNBeHlwdENx?=
 =?utf-8?B?RHBYL01RZFh0a0lMaFF4LzFSdThaaXNjVGRwWjZ0UWZKZkQ4QUlpUGhmWWtH?=
 =?utf-8?B?RVRYSWUvZ0QxZldHbzZjdXV1RHdkYWJTYlo1OCtZS0JHMC9YZEU2SUkrZWZZ?=
 =?utf-8?B?M01EUXpzcnJQYjkwek5QQThFWk5LaU15c3lkNUViWC9tRUlXL3A3S1JEVWVT?=
 =?utf-8?B?a0JqZmk4L1Q0MTZQMjV0U1hRWTFQVlUyWGZFUnVlZW00a3IrQ3Y3WFd5bGpQ?=
 =?utf-8?B?NnZ3aVlmaTFTOXF4S3hBUlhTcHJLV3k2Z0YwUHlPZUQrNVlSdUVCK2FIOWM5?=
 =?utf-8?B?SXRBUFozVUN6WU5KdDlqRXc5cS9iN0NQN2VDSWllb2V0TXZTSUlCVGU4RE1w?=
 =?utf-8?B?UHYrTVhMV2tqQzh6c0RlcEl1QWIxM2pMOFpFaGs3VmZkT21iWTd1NkdpMTFY?=
 =?utf-8?B?Zzk5UlM4OWJSTFNwVU1ZOTN0N2gwY04wcFZZQmxVU0xHK2o3ZmtweGIvQnVr?=
 =?utf-8?B?Q2xRbFZuWklJRUJQMlJPY2w2TVBLK1J3a2xQV2ljVG9CMjg2dnV1Q256NVZo?=
 =?utf-8?B?N3R2b2E1NThCREN2WWV4WHhDYjVLUzZJcXgycUlzNXo5bytZeEhQOEZYbnlD?=
 =?utf-8?B?NDVkLzFFZVM5OUdTRXQ3QzNSVGNPdi9rck9zc3ZIeVVyY05xeVF0emRiWTVC?=
 =?utf-8?B?SWFPRjF4Q1NBbVVXSm9iU0phRWFCZ3BER0RrcEFucC9Mai9TYVl3VXI4ZlJJ?=
 =?utf-8?B?dmJ1QVZyTUgzN3FTelNhY1BNYjBnN1lINkhtbTRaZnVTY0xoS2s0aDV0TGN1?=
 =?utf-8?B?a3h5cEZqck1EOHBJcWJ2SzdzKzRKNm50cWUwVkhYL3kxY1RvamFjTEJvUXVW?=
 =?utf-8?B?NFUzajk5d2xUa3ZPMC9zK1ZXOEw1ekdPcmMvNVZsd1NhWXA5RDBPM1gzR0FZ?=
 =?utf-8?B?b3JqWFJMQzhVR2dCZC9Gc3BwNURlanF0MUVnaG5Ld3Y0bzhhTm5Ld1ptQUJh?=
 =?utf-8?B?ekZ1N3VHc0FoWHpZS2tKbHFaelNhbFhjYUNHaDRoalNobU1Ub3ZWeU1WM3Bl?=
 =?utf-8?B?czdONU41VGovNGV4My96MDJyWDhDb0FRNWhLaWtyOSsyNDJGYWZJSStiU2hX?=
 =?utf-8?B?Tm5mYTRTNXNsRHErRWtCK29HR3F3Nkp2bFJPNWc0dzRlZ3pVYzMxUjJFeFll?=
 =?utf-8?B?Mmx0VFFXb050RklDMHcxS2dST1JtNmMxaUdHdTVOUVUrMTZzbHk3dTFmck9D?=
 =?utf-8?B?TGVCUFpiNUc0SU9GWW1Tdjd5VFZXYXRhTG1uT2tPcW5MWFZQYUwxV1RmSXBv?=
 =?utf-8?Q?is+/iQg3jf5zfsw0=3D?=
X-Exchange-RoutingPolicyChecked: NioCGt+p9YOUnAvVKykgcqpu7+tzPPhl+aaf6qcktE/rsDQ9YmPjHRUz9LX3FB/8ASS62thCh7ytVqN+3Uey5I2+4d+MW6NpVZD1BNem+EgJX5JzhHtdBYiYw02gkR6aORo6kVprRIlFXxjXX2eNjrBMZ5SmJegZXCU9YsGWEzkMmfvF/nBm5c5UQG3AIxgF8OgrhKYKJCD6+NqsSG+vlv0NAeCCrEJKH1bEXZx7151vvo+XFxm4z4TIxYcSvOsUAHpIeoPHnoKVGe+aOuBSUTXVf1D2gD8amVZH6tH/POuE7AlU95k2PS/Moc8IrYaOo7n33sOLIgH/MuK8NXef8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae17d40-d6d6-4f34-931d-08df4971e956
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:56:10.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRaENAtznI0TUO3+frBKSKcWhnXy1S8hVfA4oEFmCmqEQPgkJu1FItgHWak8K7CdB1iTrGs+2cdIDSzdVxDLn6FpQyr+ljqy+/MBmyNwNEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB666607
X-OriginatorOrg: intel.com

On 11/23/26 9:53 AM, Matthieu Baerts wrote:
> Hi Przemek,
> 
> Thank you for sharing these patches.
> 
> On 21/11/2026 23:55, Przemek Kitszel wrote:
>> Also available here
>> https://github.com/pkitszel/linux/tree/xlvf-v7
>> (no mlx changes, just kept series name)
>>
>> The purpose of this series is to allow iavf to use more than 16 queue
>> pairs, in two modes: up to 64 and up to 256 queue pairs.
>>
>> In order to support more queues for VF, we must give it a bigger RSS
>> table (GLOBAL LUT or PF LUT). There are 16 GLOBAL LUTs on E810, and one
>> PF LUT for every PF on given card. Both kinds could be (re)assigned to
>> a VF, while a PF must hold at least one of them at any given moment.
>> GLOBAL LUT allows VF to use up to 64 queues, PF LUT lets it use up to
>> 256 queues.
>>
>> RSS LUTs are exposed to the user for assignment via devlink resources
>> API, which I have extended to make it possible.
> Recently, many HW selftests have started to fail, mainly on ICE and with
> tools/testing/selftests/drivers/net/hw/rss_api.py, but also on CX7:
> 
>   https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-22--08-00.html
> 
> I wonder if it couldn't be due to your series. Do you mind having a
> look, please?
> 
> Note that because of this series, the following WIP patch is no longer
> applied, and maybe that's why some tests are starting to fail:
> 
>   https://github.com/linux-netdev/testing/commit/d00ba0185d53

We have the very same fix enqueued for a long time, apologies for not
speeding this up:
https://lore.kernel.org/intel-wired-lan/20261007200311.730443-1-maciej.fijalkowski@intel.com

I've checked that my code git-conflicts with the commit you provided,
albeit trivial (`patch -p1 < ~/d00ba0185d53.patch` works fine with
regular heuristics).

> 
> I suggest dropping this series from the tests for the moment:
> 
> pw-bot: cr

Overall I would prefer to merge as much as possible from this series
and (then) the adjusted little fix patch

> 
> Let's see if net-next-hw-2026-11-23--16-00 will still have these issues.
> 
> (Feel free to also look at the other flaky ones on Intel NICs, see my
> other email thread)

will do, thank you for reaching out

> 
>   https://netdev.bots.linux.dev/contest.html?pass=0&branch=net-next-hw-2026-11-22--08-00&pw-y=0
>   https://lore.kernel.org/5aec31d5-d042-4263-b3df-fa5a6a1399ec@kernel.org
> 
> Cheers,
> Matt

