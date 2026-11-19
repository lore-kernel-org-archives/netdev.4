Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795096981;
	b=NOukuKqha8cgBHTVG0oVOBSM0sIjL4xjY5yZMyhhG1aHSd0QhxbnvxQb8/x2HrHUX7xl
	 D6BkpdMAwAPu4n3Df03e+y9itqtNXXLj++qQV3C4XTjFwAcbvNHXPm7TvMGtMwshcKffM
	 mCZ+7+j/NbNiL9CX0lXpUDt/hrITTEShII1Aveb4r/uMyh75HGOgXvSeqthusTj5Uf66g
	 tessuJ4NXZr77sAWMze6bEAUMc520rHozB+pCmDFtiMSlxIO7MPexiY7VC7zt/mn54LIi
	 d6NgcdSAaq5+HPAFzpJUYiSYeWCGdWTPrd7+PwKY0Se4rMeFdutYLgUFEfy9+JQXItw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096981;
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
	bh=FqkuA4z72d+bVBhnhKNWVYhtmOpWF6cdkmoNfpePy3s=;
	b=K1W2Ob9Buu6G8uB8Hb44BHJJfB6qp1g/mVi9vK6wHom9L5LIw8k0I2gobErPEf9gGqkx
	 QZppN66V5lvQWnAPwntc86hc+Z5ZotKCb6Y8j1dfyhGVu+jia7+5ZXLUoNrvadryVsakS
	 5M+yud5SCsELQ6Tp4NIP9xen7abUMXJISyQATQHUdoBXS/G66tTrnUruGUfql8E1eEVft
	 mDfi8SDb0VxtzC68veb9cQgCguiP5aKkpaTQ7oC2WoDXv5o05MAQhahW7qk7+jOD9mg4o
	 /jtctc4KPtcKTG1TAis3Op9VbwZ3GyqnOa4h4v5kDiFzNPdHQC+hrULy2X50rPCLozg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Hyc1aSA/";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gKMwlQG+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DF7606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DF7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hyc1aSA/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gKMwlQG+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795096981; x=1826632981;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GiAlscuuLSUIpPj0hJP89gttwx2Bgn4fJN2rCHMmr8s=;
  b=Hyc1aSA/ceEvj3gyyXcxSl6r57KHzjLICX3oLCVOyh6CcLs3mfXB2tM+
   zXWRxuXg+vWPDMoyYBaiVuZ++QwP+rQvwLGJUI0zm07avregIiht6hWJ4
   3CGXso8qYUtUJ9hjAZtKOEwv0csaJYHPpJwviNlvPcNf8naOaHfi3ogy7
   FrsNuOwWEc/llEDZ0QGGzLPpd16Q272SSPm9XNK4vhIUPSNfWCg6L8K3s
   y5CIQzb6qxCoeejLpZsqvPyl36awYG3NSaXW8SzgLqwWIsnEMj2wAhc8W
   7WB0BLzlVZbFFYPNHpjdOuEoq1QfCwXEzkOn/1RYQHX5lBPvc4EifRHrw
   g==;
X-CSE-ConnectionGUID: HFxDER61RUCMLKzM/CKGIA==
X-CSE-MsgGUID: Y+Zn8WGBSgOZ42ZwEKW+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866425"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:03:00 -0800
X-CSE-ConnectionGUID: E3A/f2pZRUy4mc+Ol06jCA==
X-CSE-MsgGUID: 31fzXswHTB67sQiOTYjFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10305946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:02:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:02:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:02:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyF2vIuEVud9+ka9aboxiV7Go88GmwOPlbF1T01ZcZhea49tO5O+cCrAWLVxXiwmX9L3kDWCUmE7Os2DQG8XPUISoBdN8ii0Busqp/J2cwPHPbaGvCfUGtNbtcdMktaxaL+LYetkgziBEuL48gW0ssZfByv3DylaQSTvoJVOrdu1eJLjl2P1zcF2M1ZGGeVoz7pX42pfYjSyfAwmdawUP1+vPmrsDxxvaCwa7rI0KrwbRkAcA/3/3czlD3dYoYq8HyXoR1/pQL+GvjMMNYpCWNsOwi1QbdVGONiaIqQXadCY45mT+F5Wn4yxCrsDHfCkyvSTwNJxyLeu6nysNhBsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqkuA4z72d+bVBhnhKNWVYhtmOpWF6cdkmoNfpePy3s=;
 b=I3ZlB6JWNE9X5n0CXGo688MKht4bcRVcHCg7pyBeiQT4FRhjWXf6+cQDExPoXRrDMejiZTC7xxVnBQhRmW9y4Ufj+ETcy/VDlpTWdofdWJXLqEEDd1RB0nR7yY4shlxU0/scFTECp3TYMJE4hRoxXT5xOOnRuI4Z8yBmAOrpGxz0Yz3vca+hPRa4jqTaKpTdI0agDNigWewYSH9JUfLhHMGiJjXx+U5q1GZliyTXMiNciTEpyavLDm/Uc4KMc5t/hzkxCR8XR9NL8SWj+/s71pYyMtxUKuJTHPRIvYZ3M0V/iE9pNKOQulxatDfO1GanVf2HcLtn9kC0DLF7MoaNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqkuA4z72d+bVBhnhKNWVYhtmOpWF6cdkmoNfpePy3s=;
 b=gKMwlQG+928wcGHXAHbXsPxbGKsg7kwbyeamTvkbKibcA5jMacmeRz/Bqao6s1RBB7tU6ysHmcHsLJbkdqc461yxkY8/DUMA7wjoMNYvZ3E4Z4WUt3+ES2GR4aTrhxaWQ+mU9iBnUVEYY2PiTRxLVzdCpUNIZGANzbZuCJ5K6Ug=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:02:49 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:02:49 +0000
Message-ID: <947c9fee-8d85-4b90-9018-7c021da9823e@intel.com>
Date: Thu, 19 Nov 2026 15:02:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 12/15] devlink: give user option to allocate
 resources
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
 <20261110141534.95614-13-przemyslaw.kitszel@intel.com>
 <20261118170003.2f6501e3@kernel.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261118170003.2f6501e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::20) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 60df8c2a-9109-4906-268f-08df4645cb74
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LN9kVSfEozHMJ+5rpivyOYW/AowK8xDDMkpBOIFKUBi0cYoinpUNb/2MK9ZI2rS+eQ65JJqfyMp4cd24YiQ2f720owKOkJ1r3spdMP8Qlxl/OlLQdP8QUfj1JLEG5hKFH3UQEdgG3VvFaYkVk6VOmUc0tPisxFC1A0bwCIDemTgkJsttE8FFGqsuW1wwiXjGUjh54x22yft35mp7w+LuGvSlmYAoVdf/jSD/EhEmA6EwJhnxssZ5rxhp2RjTHBlu0dFm3mQxuXSrvvc/ZdY9BZXF0MoRyIp2S4i1is3/ECCOTRab9txIP61mEpSnpZfC+lIDwpPkERZG64jiJN6Sx8UWXJP2DwgerrSU4nNhkPRX1EDu17ifJoF2HK6XOK3tK6ffLMAiAQO3kQJzO52oxMKkbo6gVh8+xmTsRIMpAqG/6WuQUt6fCmyAsWtpJzQUO5lMn7Txnnx5FgEeOkvf66d8ocMxoz7vH3IxG8r8hrLxdWjbkLoTVLhkA6g0kW3c4BDsXSwD9qcUODXRVC9CQaBVh5sxAz3uLpGjHxX9DySMFTyiBSoDg5hapieXea+NR1spXLSx0aYGRJrqK/2RowLLVSjq+fmQpJpinXe+PS0P3HjEJVuZbd1jJiLSH31H88QYVHcSNToDIi/YTifQZFrdTLQbUjIOGrnmaqjBp9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUkvRHVVK1psZmxIY1RhUlVEellZL3hJaFlncUpMbUw2L21zSEs1SUptT3c3?=
 =?utf-8?B?RFZrQmxrWVNHV3hEMm0wcHBNNFNmSjE0WnlPQkhQS3hLR0VFZmRCWUdkNnlE?=
 =?utf-8?B?cU1FUy9lWXhaZ010UzN2MjkwN3JTNVVJcGVFb2lTcWVNUkx4a293LyttUjJq?=
 =?utf-8?B?VkxRY01RUjNremtoVlNlcHFvWHF4REluTnU5dXBtdUNEcW5GQU41c00vRzcr?=
 =?utf-8?B?TGZmdkxUeTJDdW5xK3FTVGI3NkxhcE1vYkp5V3NBdTVBbWxwVk1jbDRsNStq?=
 =?utf-8?B?M3gwV1F2TUpEYm5pbzJLbEhFMFdBTDZqRlA1OHhWcHNNZU4yRVpIOHJTWUxM?=
 =?utf-8?B?aFJNelFrVTJYdjNpQUZjU0l3L2pZRk0rRnc0cUcxVEt2TWJEcUl4Q1UwRFlB?=
 =?utf-8?B?NURnd0hlK2hlQVQvS1ZMZk9QU3FiMzY3T20rTi9LQUhOVnNDRG9mUWR4dFgv?=
 =?utf-8?B?YmFhSkpodFVQR2dPSjdMVnFNYVFoclNodklZVktSV3l0MzJnSHdoaG84Q3FS?=
 =?utf-8?B?L1cwQ2dVWUU2dTMyU21sTXJVRlJGelpXWkRLbTF1N1hyK09EVURTdGs3UFZD?=
 =?utf-8?B?RkUrL2l3OTlPVDEwalU1VXVsWURvdVRsM0d1d2VLek1hZFgyeS9vNDhlM0tZ?=
 =?utf-8?B?dU0wdVltakQ0V2xnemtmZ3hPY2RqMWdDdWlJVFNEZVlBMXIyRzNGaDFvcjEv?=
 =?utf-8?B?NzRVMlpWdVkvY2tVa1A1bGFvWHdhSFE2YWV6SmQxVzUvVFJBdm5mTDZSSjht?=
 =?utf-8?B?MFZ4M3dObWovMG5vMStZSWNEOHRSMVNrcDFrWlBVTFEwYVlYK2svMEhXRko3?=
 =?utf-8?B?MytFbXBBNGRoaFVqOWgySWpUUXQwU1BEZ3hTSFFyalFSL1UyZXhvRDd0cWxr?=
 =?utf-8?B?VTdWdmVFUTJYRkQrOFY0SUU3Wm56UlYwRDYwWnlWbGJoLzlxYmVZemJGUVR5?=
 =?utf-8?B?SWVDNEJSTzNRbGFxK2xnTGRwSVplbEVrZWdFT055c2FaVGswQjhtWTF6UFZa?=
 =?utf-8?B?YTV4M3hxckQvVHh6dWlYTlBvSWV5NVU4Qjh1RjBlUlkwMEdYYzk2RitoYnJy?=
 =?utf-8?B?VG1jaHU1ZkVyWVc3S0JnMU9tRFQydXM0WE5YeWluK2ZFd29ObWxZbm9qc3pB?=
 =?utf-8?B?azF3SkRjYlJLdjRmdTZndlFmc3E2SU8xM2VwM0RVWHlla3M4NERxaUg2UGdC?=
 =?utf-8?B?c08vaGt0b1hRY0tnMlFKWGc4SXdSbTY4N2Z3SlRIZUdXTURTT0R2WUsrczBQ?=
 =?utf-8?B?QTVSQzgrYWxxQVdUN21wTGVJd2xra3BNWDNvOHRqSnFoY2NlS1JRd0pFNlcw?=
 =?utf-8?B?bkpWbUlQclMrWjNJTDh6TGoyR1UvMnBCRGhMekpkMTZIWXlObHpyaXVUMEhW?=
 =?utf-8?B?anliVGgrS2d5NkR3R1ZzdDdNekNnNU55QUI2d1FxQkR1N21tNmdkdHR5U2xC?=
 =?utf-8?B?RkxXM0JJaldhdnh3NE1PVlhNYVpSeXJMSWxkNTNwcnpjWkEybEUrb2JVOFJu?=
 =?utf-8?B?SG9YZGR0WDFnMHBsN1ptVS9yUGRaUE1IeFhXbnRELzR4bStUVWtzSkdkaEh6?=
 =?utf-8?B?c0VjMlMxQndhbENwbkZWWjUxK21kRjNQQm1SRDFQYnNTMTFtZG1TNzFja2Q2?=
 =?utf-8?B?dUt6T05HSCtEWnkxdUswVzJDbmNNakRGc2lWeHh3SWRUcXNSZXMrbDRTcUhZ?=
 =?utf-8?B?SkpCMGhlNkQyZUZ5eWg2MEdIQTZEc09ucGdzWEhEalFid2x3TTE1TzVqRG8w?=
 =?utf-8?B?c2RCTnUrbnhxY3RONmttdkwrcjAwaGVNRzNhMHVBd2Jxc0c3YWZxZTFzWkR5?=
 =?utf-8?B?SkYzeWlHS0xvZjBCNlFtbnY4SnV3dHlJRDJXcFZyRWcyNTI3Mm41aFFtR0Vz?=
 =?utf-8?B?R05iT01rckNEMEczNFZyOWNxdkJ4cWhvWEVSY3dNT0dwdHlhUW5GRU1ZTGll?=
 =?utf-8?B?cENrVEVHazVmb0ltR0Y4VTc1WWk2K3ppbFNKd2NmalB5OURveU92elJQVDNr?=
 =?utf-8?B?R2lPRWVZdDZZNEtCQi9NbzU5T3pYclJzdmZCdTROL1puYTNMSTI2U05aV1Ax?=
 =?utf-8?B?UFp1VVI3TWNQcVFNaW9TVUFGQ1pIQlNSZVBYT21lNllIL2p0ZDVJL2cySDJl?=
 =?utf-8?B?WThDRWx3Z0hPWUFqeVdjNFB5OFlidExLUHlHdGM5QTUwMXRhRTNFb0paS25q?=
 =?utf-8?B?YmtRak5abFQrRldvZnR2UExCVndyd1Q0cC9lY1haYThwUkhPNUgwN2xXVTdh?=
 =?utf-8?B?cHJLdmpVK0MxZVplY3M1ZlYzQk4vTlpZa3hWSHRyQWRWbE43MHRmYTdQQ2tZ?=
 =?utf-8?B?anpwbXpkd3ZMWlJyVkliM0xrYzZ0VGlVUFpsaDVDNHdtcUx6LzZUd2xPNGJF?=
 =?utf-8?Q?kTftkrZKxOVN2gEA=3D?=
X-Exchange-RoutingPolicyChecked: Nh2BkgP7ul/oFK1MZ4nM7iUtA4t1yLu/Q9a9rb71d1DSYsyKpRYY1/UJo45jqiyGunYlmkIyZtCj8moHdjcP4rBYnvlKNTb3mvPdNHX/ISr8KAVJ+Brz29Tzqz/VnxactLMUt+7RMgbHp3QQq2R4W01UTSpJc20AbQu1+0dgTzzJ9eCp/hEvgD4fKkMqjYKirMSzeVhiq8rxZGdX3buWziHxVVDl1JqTKh+MbeMY3zs4+Vv1coGrSVJzKl/UmuvT38pl/WfqfL71RyFjGrWRcItIk+hH4VlGO7JrxnMf3LKwD5ekQ/qzglx9rxaQfFcSsEuyCNTnhPPIHxLge076dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60df8c2a-9109-4906-268f-08df4645cb74
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:02:49.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9/IBIHhT0cWX+GQ6Ji8kTcEh0oczoTSVGQZS3EL2aNhd7QEzqVFnau2loqVGGybI4KjEh8njD0ldqEifxf8QlnVa78S0aFRPz0M6SfuFjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
X-OriginatorOrg: intel.com

On 11/19/26 2:00 AM, Jakub Kicinski wrote:
> On Tue, 10 Nov 2026 15:07:21 +0100 Przemek Kitszel wrote:
>> Current devlink resources are designed as a thing that user could limit,
>> but there is not much otherwise that could be done with them.
>> Perhaps that's the reason there is not much adoption despite API being
>> there for multiple years.
>>
>> Add new mode of operation, where user could allocate/assign resources
>> (from a common pool) to specific devices.
>>
>> That requires a new .occ_set() driver callback, called on
>> DEVLINK_CMD_RESOURCE_SET with the requested DEVLINK_ATTR_RESOURCE_SIZE,
>> instead of staging the size until the next reload. Driver registers it
>> together with .occ_get() by devl_resource_occ_set_get_register(). For
>> such resources the getter value is reported as DEVLINK_ATTR_RESOURCE_SIZE,
>> as opposed to DEVLINK_ATTR_RESOURCE_OCC (current occupation) in the
>> "legacy" mode, and there is no DEVLINK_ATTR_RESOURCE_SIZE_NEW.
> 
> I haven't read the driver code but I wonder why you're making such
> changes. It seems like you want something like param cmode - your
> size change is applied at runtime which existing size_new stuff
> is built to require driver_init. Why not add cmode to the resource
> to express when change will be applied?
> 
> Why you're messing with "occ" I don't get at all. occ(upancy) is
> current use. See comments on the driver patch as well..


Good idea, resource with cmode=runtime matches what I need. As far as I
can tell now, swapping my occ_set for it does not turn the series upside
down: the driver still applies the change synchronously and can fail it,
size becomes the value set by the user, and occ goes back to the current
use.
