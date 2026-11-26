Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705585;
	b=FYRbOagjaCvuIDPewdzeHJGBracfHcMOOARNWyTD+IphDzHhvzokIM9hbM1vSktkrtW6
	 VAxtrmMqfHbgJhblF+ES9IUrXzi77C/T2ABvxkeFOyBYEFeE5BIotJnbrNRvIkc8mTD9U
	 aXCb7/YNxUphnpMlKnftS7sEsj19TR5E4nFwRt7E7nfcq42u1j9ar9LGMW2nXpFluU3Sw
	 jLH7OFZI+faktF9MsDtysjcEHTtYLq3Odwej8Lqr5Af2lTODnL6w1qNxUuxU5HR8LkMV4
	 CMdqBoUh/mnSd7u/LOwxczUYqQ8vwxddBjgOgHli6opUhWe04GjAYCu24tqgMbFIKeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:From:To:CC:References:Content-Language:In-Reply-To:
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
	bh=5Nui+v36aXrjtz4EKCvev0nXpr7tDSQ443gTm97/dso=;
	b=bNkpzO1cI9f3P4TDzT0jvBcLtgmZp92EXnTMqYoxUIyeVK8db+JvMxjYyA1vGfyrkVzp
	 xq5y3H7ICIDgV6yQqdpzXoF0fPoFUCnY3VbgDddpJhLKil91Qmr5fZrHpgodwHA/pYyE6
	 eHJ5+BVFCWPVA1Uav8EWX5aByGt+jhNiHafInEcCDQKaYWM0H+rvYW2dCSq7sCKSLKiM5
	 TXXHs+Lt3tb91sKhA4q3CWCCIfUmvlgAWZGPgv5cI01+2ydAuyOiRxVJ1RZ7TMQYRjF0Z
	 dhyaCdX9BAYcchwD/oX0tYhwNOkYY00FaxrpHFOT27z6tGb9DS3Q7m9A93XiDQVv9KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZxNHFpQ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VJZLShzh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B5606A329;
	Thu, 26 Nov 2026 15:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4B5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZxNHFpQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VJZLShzh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795705585; x=1827241585;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uGWBC/kUwUH5Fwyb+fOqSdl18jpSGQbpexgscHidabc=;
  b=MZxNHFpQrt6jtxBL+9pRtlCpV6e8jF4dTtlbUvD1B4v++tYiXdmRS6El
   Lyq1GsjyKE00iyWJzOZMQiDOtuEA0a+2H0PzyaLtpevMEDV8Wy00GsJ04
   1ObbOaXtHKum4kPTO4cDf1f46Vv168tRjaoj1anpvhPg4zwtXCExiO0oB
   o6bPmCVIjToTx08tLSt22fiI17J8u8JmdO3ZRnIaHY27fBGvRJk4KLAHT
   0+r4O4LyS0M4pjFC0ZlONDcSnGdbxeSQxdbQh9XoKAGTfFku/25swpxmY
   F7s936SpXpUoxuS7haCMnOdXDNCLLW2ZOsKvP93M1Nz8qhE0J5dKl0eTU
   w==;
X-CSE-ConnectionGUID: 2S4TIL5ITU6QoHl7WiTHOA==
X-CSE-MsgGUID: dAkdzDQaSh68e5vH9DT4PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4610224"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4610224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 07:06:24 -0800
X-CSE-ConnectionGUID: Yuy7agUKQRq4EuNeUdA54w==
X-CSE-MsgGUID: /3bnuoJxRvSkZbElpXMB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12082699"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 07:06:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:06:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 07:06:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:06:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFtjMadZura3g1c+TbmpimFAgprgIiF7wk8q/ATVh0xWUQBT4hr91AuTJ78PHTH2qRpKSPbgXq0Z2XG7KioSe7FDsdmKoCmMabx8ln1TqKwwT5UDN+nfz5HgR+1dAnGyoxuSX4WAdKmghNzHXs6TSc7cmAf6vygUNJpfU/rqKO7S6HZzt1xFiRYEfQa8Oiot0mQfSNl2dUaZTdJH4R/jvGIkJ7kZh00VuangpKt4G95jf6SoeNDTulcFqTll/r7Q21zCYM3KoMguhrcoE2IPUjE5oTlYEP09UCA3ZLD0BItGS3rV5rhm4IyLoIA9utMQnjSLYHxJ5CRxcn5bOiNqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Nui+v36aXrjtz4EKCvev0nXpr7tDSQ443gTm97/dso=;
 b=oRbn6OcCfjwN8AhFImNipqUcUsB9DRIQpKWkuTQqG9gmIn5HrbgzsCOK6XY/ZOXpfC3H/MLqWxFmodNGxHj0199wAIn1w6r40H/mlxlAPl59P0Y7rGynyodLY2zstYGBBMHOr2qASO8oR3DQjt9wPQU9uyBN531rOyzoMKifouxI6mgStZgBaz9IcbvCvDOdavfJ8jQ2aciVAfHwXRgR2YIasbOP/S3k7h3UJ43BycWtXyTcJtHYlocls175P6A/iOjT8VvnNN5Eq2xDYgA1fhJjAeJZyOssGLTqE0dDy6ragXLRx1KfCH5Hyzp+TgyJo7J2e8ldES4Q/6Fi0EfW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Nui+v36aXrjtz4EKCvev0nXpr7tDSQ443gTm97/dso=;
 b=VJZLShzhCqFkcKoKglOaELblEwAmRVyo19VgkXHXuwenbz+Q/LvZDYzLFYtZbVx9QLhvPAg6VqEM7Y1QC2R1+7AbjstRTHtus1YfsvPEbGefKGtv7Kp1omAit6XLDGXlp0fIbBi3zacOyiueD2rS0XW3TP6CCZEAe4fxigH4VNI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:06:18 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:06:18 +0000
Message-ID: <7cff0760-9b01-4aa6-87e1-45f43186f9e1@intel.com>
Date: Thu, 26 Nov 2026 16:12:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ice: retain the adapter throughout hardware
 initialization and teardown
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: Aaron Ma <aaron.ma@canonical.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<netdev@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>, "David S. Miller"
	<davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, "Jacob
 Keller" <jacob.e.keller@intel.com>, "moderated list:INTEL ETHERNET DRIVERS"
	<intel-wired-lan@lists.osuosl.org>
References: <20261019105155.3793063-1-aaron.ma@canonical.com>
 <20261019105155.3793063-3-aaron.ma@canonical.com>
 <62a43d55-f114-45a5-824f-c09f87bea537@intel.com>
Content-Language: en-US
In-Reply-To: <62a43d55-f114-45a5-824f-c09f87bea537@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B71.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::60b) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: e668aab5-7c32-4eb2-6890-08df4bced2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|11063799006|4143699003|6133799003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021135927099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: iHsrbi7PUJK0yZe1lcN3+hPoTK6c7tFrrZfen5HKpRXlf8MXcoOV0iGW4D3gIdcF93kimoLmvAPIRdPQmG8Shjk7EXHUBRGru9+XRFD9pvpEOF4OvxkfFxpmFvUb4rR9ylD3IpHnIGsehOmKb2GXlCdKUXzvN5X1xEewPMXRL57NF2cYswwvPIcpI/t6x5L8MGJgrDKC/w3b/HVaItW70hdcdgLOXf+4HmxLHZsX6OJhjTFH9Wjs70wYQLHURJY5UzsEHaKeMNo0eofxmXWb4Y/wDjTm85JqCKxEHVp7gJwZtZVi9n0fIQig/hM+v7IyZ3QlqaU/1Mc4oZ+P3YSMNk6jbV1GEDuvk8ARyUEUtMPU6Cgb1n5ugtndZyhxaYB2hRiXX1HfPIN653/ZEAeLb74mlM8LRhaj1xi4qLrgkRkRz38oDwfG+V/EZ6e+cu//+LH5V22nN0pKHbimhf5AyCYHn4XKGKyT5aKRtjwZPi+cOg45aiEunCb3V8ghI5iD3IOsZGATdNS8wiZJNdxvHBkYW4avTiZ0ARqBYxWYUIv59TnYxGuCeDvi3lR+p1XaJ+NR2rClihjUMDwgN+bGnQFO6FDDPPa7MKhNrkRPbxiiyfXPUqCjOH6t0NqbUjO+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021135927099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGczaXJJUjdTK1dOSXBjems3Nms5TWxieEhQRERjUFQ0OFFOQi91Yi9HK2pJ?=
 =?utf-8?B?K2ordlFBVTJRdGtwUTRYazJxSFFVYys0bUpib1h2dXVYUHQ5U3RoNDc5YVU4?=
 =?utf-8?B?RFdMd3hjczhYUjBUcElweG1hWmlRSTg4NVZpUTFKYlZhTkd1QkVXNng4MlFw?=
 =?utf-8?B?VFNyZmFXb3Zab1AyNUtsSG5Qdm8ycjdZSzRXK3B2YzQzZjdwVC9qRDZ6YWht?=
 =?utf-8?B?bW5MTFB2M2hVU21nOWRoNXhaSkZ4RjgrQWdlNnBCM1ZsQ3VXc0g1TUhONDRm?=
 =?utf-8?B?NndnR2Zyd0xlb1UraGVHM3hlaXBxMWZ1NTRYbmFkYVo2RDZ4QiswTkNjREd5?=
 =?utf-8?B?RGRlQ0JNTVgya1RTZHFCSnpwVWU1bzU0Y0ZVTG1YWk9IRHVhTTJLb1dOeHFC?=
 =?utf-8?B?NTk5ajdraFNmOXBBL0g0WUgrZXpyNVNWSHA5YzBrTUI4OGwzVE8yMHV5eTdR?=
 =?utf-8?B?amhSazNIZUg4S3h6QmJGazdKZXgwdnVjajUvTTgzKzRoSlAvOUdDRytXRXpN?=
 =?utf-8?B?MlJrQ1ZBUmxJU05qVGpTaHUvNXM1WFpmUVZuTjk5S1BZOERheUgxU29PMkJq?=
 =?utf-8?B?TUJlMEZNZUQrd21wbzFSdHFXK2dCTHBUQzUxUXFBcVhTQzJEYnlGa2lWU0lL?=
 =?utf-8?B?VDZDZU9RM2k4VWN0cUEyMlM0MFFVcUU5VkxSRURDaDNLU0U1TDk1ZGxCSnRY?=
 =?utf-8?B?NGhQdm5HRzVnL0pZOGxxWjhnVjBsWkZBVXRTcitRRHNJNDdtKzJSaS94cGZl?=
 =?utf-8?B?V3ZwTjBId1VUeUh6YU1QaGRJQy9KNERWSml6MnhFOGRtbExuWUF2VXQ5NFZS?=
 =?utf-8?B?MnM0M3RFUXk5MmFMVW82VGhBbDhFSzdyMGJRNkw2dmZCRlJDNlA5TUFDdkJk?=
 =?utf-8?B?UHZzOWluOVBXdWZQbk9ibHJheDZ1Ky9FWFhIQUZYSzNyODR0dHVzK29pUFJM?=
 =?utf-8?B?SW9kUm5xaTZQalo3VVE3bTdnTDBVN09IcW45OElBVStWYlNlNzUxZm1JMGNp?=
 =?utf-8?B?WWpaazVZMEh2TFFYOTNIdkpxN1ZrZGZsKzBtd1RRTGNNMTRIWkU4VXhhcWJQ?=
 =?utf-8?B?V2VhVDBDM3RxU3dwSEd6VDllcUdSVDczTzRHUlZXM3pJc1JpN1o0YThZT1Ez?=
 =?utf-8?B?VTJTUzFyNGR6S24vbXVPb29BS3lORUcvQzNFaUxQVzlQU1B3NzVkbjJlL05w?=
 =?utf-8?B?clFlRW5GU0Q2NW5uQnNVRlp0NWZtd2poOHR2c2FzZEdPQW1DdFF5OEx0ZG1w?=
 =?utf-8?B?ZmQ1ZFdKYmtiSERlN0haaW51UVp0MlM1WEhsMlF2RE9HRHNxTG5ubFVhTG1V?=
 =?utf-8?B?cUJvWDJKU0NOa3ZqNEdXZFA1aVQ0alNyUlVlekhRaDRUUTMvV0haZHRVMHBB?=
 =?utf-8?B?SlZDWFovOW9tWlZzTGZGUS9xMmRTSVdmemtXQUVIbWVjSGVzYUNzOGtRL0lG?=
 =?utf-8?B?U24wNnhMNEEwb21tZXZGTENGWS9DcWhORjFtOGE2ZlZCWERseG5oSjNWazkx?=
 =?utf-8?B?OVFzYlVIaXFpMFJyNENROWdFR3lxVk42c1ZSWjN6UEx5cmFHeEpBOVpmTjdK?=
 =?utf-8?B?cXcwaDJOUitSb01sTTFkV0Y5akQ2c2t2U3NJakYxQXpvdC94V3VTUzM2OU10?=
 =?utf-8?B?dkFSRis4S0dsQzljL0NJSGZ0WGZzeE81d0tIbE9FNVlUa2hhZWVIZXNYak45?=
 =?utf-8?B?eDd4dmtPdE8vdkgzdnB6aTZlSTNxSktHRDBUSFVOUDViVlRBV21QeDhiVk9x?=
 =?utf-8?B?S2lyVHpsY1RBcXhqWmkzVzBtdTA1K1BlYnV1SkcyNjJtUmF2NmpQZkNHZlNS?=
 =?utf-8?B?WkU5eE1sWkJFTFA1bGxIaEFzMmNtSngxSm5DMzdnOWtNYUcyampLT2s5bGxk?=
 =?utf-8?B?YkRjUEhTQlpxSE80aCt2VUlrT2JKUExKOG5yT2MrWndQa2tQbkZncW9UMFIw?=
 =?utf-8?B?MklGQUtGREE4SlBzWDNVcEpXdVl1cVNDcnRGbUZpd1U5bUJHTVkyMjNXT1ZZ?=
 =?utf-8?B?anR6S1F1MnVPWnZRdWhGZHhGRmd0dG4yRTBPaDNWakd5TDFNLzNWQVdkdnh5?=
 =?utf-8?B?ZGZ0aEVZQUtQRG1UZDE5bS9zcTlZSjdKN1R2SDdhbmsxZXFyNDdBbjJZMDE3?=
 =?utf-8?B?T1ZvZmdKY1FPVFl0czZsQldwclJvUm9RSEpUQ1VRamgwL05ZckIwMW9VeXVp?=
 =?utf-8?B?alRXSGxGN1pxUENhZFdqbmkwYTF2MFp6a2VxeExMaGcwOWtiVW9RTkRIU0ln?=
 =?utf-8?B?ZEhpcXdUWVVCN0UrK2cxUkVlMjA0L1htcENYOC80T1l3UUkzNVpsVnEyQjZi?=
 =?utf-8?B?Zks0cEFLM0lzZkwrdEZSUStVYzlQMWl2K284cVM2RDJzQ0FhZ1duR05qUSt5?=
 =?utf-8?Q?AoubLlYTdlayWHak=3D?=
X-Exchange-RoutingPolicyChecked: D7DYnrUgoTH7a8T5G9K0lZ8eIBqHv8zGgkYmjk2kM+6Yk8B2cVYJCfNBhnRvvRI0vXpxFu6We+UjAbQs916tWZZ7zMNvXAInYffdLU9AaXwMRitWuqAUVujv/hABAOPuh1/3YMDXk2Zdu/9vNO+GS4K4SxrBUl3r6cvi0x4nyQ881nhLicf1Q+RK1MCoff4+NOV21lNPYq1lDlc+L6kVgs1nz1oLqMzjSjsC7ZtODoJXNu2SSTJUQdYTCb5mYawc/+G9UDckpYBGojs8XU4g5BPvNx5qz2fCJHENEdHW91sPPhXCZdHeRIfIJrTehy+wZKknWAgsjShNGqsbdQx2yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e668aab5-7c32-4eb2-6890-08df4bced2c4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:06:18.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuT0nYTNMuUokcooXkTJwGBsb9asuxURd+TP4/KTof7Ytyl/K1z55SESIuumR7wzqSy4ZOdg/3P0cAjoRAXfHarBSvf1b8m40C2vjm0hKic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

On 10/20/26 11:24 AM, Przemek Kitszel wrote:
> On 10/19/26 12:51, Aaron Ma wrote:
>> Adapter-scoped synchronization must be available to Admin Queue users
>> from initial queue creation through the last teardown command. Probe
>> currently obtains its adapter reference only after hardware and package
>> initialization, and error cleanup and removal drop it before hardware
>> teardown.
>>
>> Acquire the reference before either normal hardware initialization or
>> firmware recovery-mode initialization. Release it after hardware and
>> device cleanup, balancing recovery-mode probe failures and removal too.
>>
>> This establishes the lifetime prerequisite for moving package ownership
>> exclusion from a module-global mutex to the shared adapter.
>>
>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> 
> it was me to move hw init before adapter init, to make hw details
> readily accessible to the adapter
> 
> but I agree that SW lock protection covering HW reinit will be great,
> and my needs could be achieved by other means, even if less elegant
> 
> so, I'm happy with your patch
> OTOH I have a big series that git-conflicts, would be easiest if your
> series will be merged first (so I will adjust), but I don't want to be
> delayed (will be CCing you on it going forward)

this was merged (just this and 1st patch of the lined series):
https://lore.kernel.org/netdev/20261117094913.100756-3-przemyslaw.kitszel@intel.com/

to make your and my needs met, I think the right solution would be to
move ice_hw init/deinit into ice_adapter constructor/destructor
then holding ice_adapter devl lock will be both easy and natural

the "init_param" param of ice_adapter_init() was initially meant for
number of PFs (taken from ice_hw), but I will pass in v8 of my series
ptr to ice_hw
(talking aloud to make it easier for you to base over it and/or comment
early)

> 
> the real thing is of course the 3rd patch not this one

