Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442896;
	b=zfscd0QSzGZ8QNna5fnHMwZJFmf4ubD9hVVoQZJyJ7j0jdPMZiihp46yvCZlehJZu2Pr
	 lw+UjQ2nGEWUJEdXnkUoqKRaBNEh5oRkwH1PPtIwrJ0vFqVRding9Bef0FWtirGl5fmz0
	 mBmQ2bujAiKwKjAjrRsK3wQRHls25WINFvp+Pt8y1sJ1FnSR6HyyDWKqygc36U08VBPbs
	 iJFCupFTebNZ8OseKEH3Frtywp3xgJY0kpq4KqPfne9CBW1oAFZr1+5XuyC3GAq22EGzU
	 5+9mZWhlY8tzJeqPPBKqk+Kw+pd98/O7/fjbWbZH9vH8XU8zLo0sbugCaolpSCxoSbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442896;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
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
	bh=iqk3WiTQ/4ZDsljcAIcWpLrNT3yJfM9UDyKRglNxchE=;
	b=m2Tp1Xsb9qUVL3pfyth2BatlK3TR+p7I5IYXOEWxCX6TXSox3utNJVRSrUJapG25evM2
	 8C89OQdMyhLysDwDMFzp3lWyLeSZPZENhzfApiywTE64vTsM5gPBs+YYD3ZDNdy9LBJ8z
	 oPlLVkOYbKziBkkUlvcUWsX6JY8ihTb7q7L6bew+t2Tgb5WXx+lSDO3zZpRcOdIV6ODga
	 uxWaBhUV9aRgjn79Kp3oEsRy6zrBHCiU1ldPX2Bh4BeGsMP3c7/POGdEx5k+Zqw+N3S5h
	 Wik4xpnozffbcdnhiIJxyn01C5AamlMofmnbb3FYbUbcmueLgFSzuAC8P6JK+v++qPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jkmNEQGz;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZrFm2XIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B45606A31A;
	Mon, 23 Nov 2026 14:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jkmNEQGz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZrFm2XIt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795442896; x=1826978896;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xceEmdoPPe7i7wduNUSahVI/RwzMVLGEoNbUO8ZL3Hs=;
  b=jkmNEQGzpFx/Use34ZW/mU9Hje9JyLHlwMcougfXKb4zdnl/vLTlmkPr
   HVyg5wPuKisDtKYbt50fOP1WiuOKvsGotqjHlUTUZ5GIcClG/yj2WJdPf
   qyCHDU5AqJGhvBYKpOd6iRer4UECmA2wfHXEcmnXv4f5nW1CK501WqyDn
   jVJkxGWO3aRXY7+IWAd8ZLirAixPTdlyVLLn4HMq//G5zw4ZAFfFa46Mi
   N6G854wKwAfi8efEhPDce6wpqkL4kWF5WBg4YxpG6lqji1M5wNisAukBy
   I9zGbzyHzrO/Zbm4UeCMVwUYUfv9XWcV4d9WjAv3IuGMa/boKqKBzUQ5o
   A==;
X-CSE-ConnectionGUID: H0OXLKRmTp2LJdWXxZQ2jQ==
X-CSE-MsgGUID: lOzW3FhhQtqRW0G7gINT1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4261634"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4261634"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:08:01 -0800
X-CSE-ConnectionGUID: bb0viXNxTEKPX0sRnamMeg==
X-CSE-MsgGUID: 5k5cw/ScTI+3sWXwV1hYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11389041"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:08:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:08:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:08:00 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:07:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYvqQeG9tonyruYpHVpog2npugWml8XH1gCieICAWTZ+F0VgQ3Ksj95bkQEsa4Wk1CgwywtYOj9ouwaBBQi5GQhSbsCNzpTvsMh7CZMlbngGseJm4ILqj/n0atrujsPJH3e9GGn8abGVzlOEuWNO27kR4AsdRtq1PggDPCZIHQasRY0eEI+TVZegGOQisufXR+U/tipPuHAI/TjD1iMVeUfbz8N6JvlUFJzQ16MfPu/vB/D2g1QnNBu5T2bBz5vKTFMxKuwRvWEUoaA4l1KUQ2IL0Lx7pQg/azWwW3k3OVTsVqUg6fLZXYMGx/fVhLx228dx0FDWgzwTQOprMX9BYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqk3WiTQ/4ZDsljcAIcWpLrNT3yJfM9UDyKRglNxchE=;
 b=r2495+lOda+xZoRARJwRKxvxDlHtmTyPEBcWErSxOQR0ugpZBH5sGC60OoqkGxwd3QleO4pn9srNY3YRjMPZfRSb10ur/2nU31umwF8vmT6gISJWtYHFjjVOmaq5OzfbVNRXkp2BloUnAObvd9SNVRoMMiobcGrFW//FnzPmSGt+8i/Otull3d5NEtGjsbZt4h4fWRz2dn0ZPAsPke1jaBXD6bqwl8L/DUO8OBrT1lEgShTlIKLepiQqntgF6XIMhjb9rE/Mzv1GIGfdljrHdk8vp9pkwtcuBz29ztQJkb5kTTsWTvJc6Gr8pxz2TxEm6Og8Rc0eo7VGMN9JD0tmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqk3WiTQ/4ZDsljcAIcWpLrNT3yJfM9UDyKRglNxchE=;
 b=ZrFm2XIte3lQkF0XRC/zvHtCs969BqT3ooZTE9Zb6PpANN3TC0BYVoGhzB9jJYpfdYMB/HhPTlEbhFrPRPlT9/KGEP4TsIZkrLojFV9jd9WdpBcyxHwv1Xa6vmkBdWuMIf9op018Pc51nbBr95dY1ygLzq/NJ/3eSYzQIMKGXA0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 14:07:56 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:07:56 +0000
Message-ID: <cec955ac-54e1-41eb-8a1c-3c4d65cd9a07@intel.com>
Date: Mon, 23 Nov 2026 15:15:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net] ice: release IRQs and rings in ice_dis_vsi() when
 the VSI is already down
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
	<intel-wired-lan@lists.osuosl.org>, Tony Nguyen <anthony.l.nguyen@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Larysa Zaremba
	<larysa.zaremba@intel.com>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Jacob Keller <jacob.e.keller@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
References: <20261106171657.583713-1-ionut.nechita@windriver.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261106171657.583713-1-ionut.nechita@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0174.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::11) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|SA1PR11MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: b9eb4ee1-e12b-4779-ef1e-08df496b2c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261022075727099003|10067099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021135927099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: Y3LWCwMCnvfHGroPUxlarn+JNE7/LrUoJULhQt3lAOgMg8fgVOGSE1TaUUmbUqCm7W9gA+PVfU9K/bA5yHtL8LbFrfainbuFVwfNVyPqPfqTej41zjlLwkPCwZJ3hE8/nuV8FxODsRWFZkZgJfUJXBZO2VaRE+i2FBfJvnhG+LMuy33oFKdMRcWBhqPbHRXLw9lEUcIHM57+5dSOfH1iUynjW/OhRTAcAPtcd+IGFoJRwkA7nyxO5SIZ7DiJbzrHu/jBlh/Z/ynNINBCx/hnamcc7GEZb6TH0a3nbnsHt0ECIwb+pCzc/40v0nMxGJc2NdvyaZvsAa/zVoBgbFttitnDuv8fLEWbpi96joY5VY29dd1shH67xlLelXGUl7tbfyWKe/9D42HUyNJWC+I8O7oP6o/T6h+BzNIK4cIQCzVvmuonjU6AcvuvX1QRXJ25xSAq5tsAh1kavFwmypFPUZGCO0vlgoTmDDjemk5veqXo+HJtAPIhzvxWE7uusbkN98/khcIBpn2mZf9qdZ0W1S/2dtWFWvnCoNvyYDfUBapoyAZfTIgakJDOqmjnEhlUMpMBFkBisIqgfeogqKlyLmsLi69dOjM/We8Mi76wJfQGv86pDQ8M7ZpxEAxZNWPUE99c5DVutwyGoNg5fmLY3ur6F5LX5GhUTu3O3lzEuk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261022075727099003)(10067099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021135927099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5iN1JYZ2tudFdRNkRJdFllMkU2NXpETzJXRFBCMmZ1VjNFaVBacnNzZWtJ?=
 =?utf-8?B?bUFUeXJWS1g4a0prWGhDZzBLTHNsVEUrbkt0bDVha2o0Ukx0aWtnaVh5Qmw3?=
 =?utf-8?B?cVp3TGZzSnNzUnorV1RDYjdVYVJ0eU1GS1Uwc09YcUNybUc2cmYraXQ5SkZy?=
 =?utf-8?B?dDUvM1ZQUS9GYkM4M1hzaUJEVEk0WGVMUWYvbTFiemxyUGl5L3o5anJrWjVm?=
 =?utf-8?B?SUs1M1RzRjFWanNZZUVYcEpqbXZ3ZmVGcTVQV1JBN1VyQkpkOXY0MVpUUDMw?=
 =?utf-8?B?cTY0bnp4elA5MjdKd2ZTLzJFRElmckhBdnRYYWhtTWNvVnc0QTZKSVRtWjcx?=
 =?utf-8?B?eThvNXYzZGJJTmRjOWNLSkh5NTBmMG9aTG55RFBUeGhhWmFWSmhBV0xDZDFa?=
 =?utf-8?B?YkNFYkdDZEVQM3hDdXZnRWluUWNNMEk4U0VKRitPLzJUMC82dll5U2cwWm5r?=
 =?utf-8?B?U3R5ek5Jd3BTMmEzYTc2Vng0ZlVtbnJ2VXhpV1pIc1J4akFPNEJ3ajBjc2VR?=
 =?utf-8?B?S1dpTXd6SWU1Q016WEJRQnNtSGdMSnFpMG1WeFhjSXUvVjNjd0lGdzhkZFJ5?=
 =?utf-8?B?OW85NVdlZUdXRlVuanE1ai9UaWVPV0RBbnJoT2RLRGJSK1ZIVXF3UnZ0bzlZ?=
 =?utf-8?B?bFpHRFMvZDlHWnpvNzUxVXJicWwzbFhhQ25zWnpKRllKcW5xZjBvNkRVRzFD?=
 =?utf-8?B?MHlhVk5UekppRW01VWU2YmRTMngybG43TC9YSmNOOUlKMFZCSjlZV2NsMG5L?=
 =?utf-8?B?bXRLSDQ1TDB6VlhCRDJ3cjNKczd4ZlVLQUVaTFJ5b1ZWbFNudUN6UWZaanNE?=
 =?utf-8?B?ZENVL3E4WjRqQkZ6UzFRejdEeE9JZ3V1VExTaGZUdVpoTTgvRUF6TTBOZUMz?=
 =?utf-8?B?SEpZWmVvR25QdlgvRXBmTzFsTkk0Wm1RVm1KYVJaSFJxQkdUc0lqL3ZxWnlT?=
 =?utf-8?B?OHJ2T1BSUFptRlQyeDBMTlBMU3RmWC9pSHQ4ZFAraFJUTTdLUSt0T3R6NVZk?=
 =?utf-8?B?TXFveXJseFl5NjFremwwOTZaVFBhL3IxUGtuT2hUSkhBOHJrZGtkN2JnSjN1?=
 =?utf-8?B?U3VGSGhoZ0E4Sm5KRGRJRFlHWGVpdmZmYno5cmFsQXZCUEVERUx6ZS9wZ3ZK?=
 =?utf-8?B?NGlqUnRyZ2FVeklOeUFkRnB4aW9FdkdpVGo1Z3plMW5lNXlGM2tDS1FaOEtC?=
 =?utf-8?B?V21PL09WU0UrcXIvbHluRGpaT01GWHJySkNkUFl0V3c0ajRhRmwwMWtaTmRk?=
 =?utf-8?B?ZWMwRTNPYkoreEpROG9TRzR6NmQyQmN5azA2eTJYeFo3ekNOTlZ4MGxpMVIr?=
 =?utf-8?B?NXFXazlORk4vMlMzRi9na21jbEtKbFdteERrRFI1d1pjeVJiVm5KbmxydVNq?=
 =?utf-8?B?SHZPQytpZGdNY3BKUmlYNDZoMG1wQU4xcDZwSzZCSFJuU0hOMFFieE1ZV0tQ?=
 =?utf-8?B?N09GeEFlSGJONnRuQ0Y0YUY1ZEtUcWx4dzcyeVFBL3IwdC9XRjI4ZmhQMU9H?=
 =?utf-8?B?cUJIdFRyQWp0cU5VTkJnS2x4a3NQN0JyR3p5V21JVUpocEVyQlFKTFgra09U?=
 =?utf-8?B?cGRjQkFXTVlPRXhBUnNaRCtXbXNLZlc2VEhMeURsdG5FU003TFZuWnJXbXF5?=
 =?utf-8?B?enYwS0tXSHN2RTdQdzNXZkRaamZSQ242d05MdERneUFJbDdzMzRybFlrTkw1?=
 =?utf-8?B?U3FKRmF4d1lETlhta0QxSmZTL2tCdW5OSi9CY2d4aGFUWmh6Z3E1QTZYSENj?=
 =?utf-8?B?Wk1VZ2ZqT3pLK1pUeHJsSUNCTTRxQlhOcHpvS280aGJSN0JTeUc1akZOVlJo?=
 =?utf-8?B?bkZFazl1RUpVM2M3a01xODN3R3lsYTNLamZXSC9mVTdyYWJYWnVqVHVqTVpE?=
 =?utf-8?B?eFIwNUVVOE1mRThBcmdLdFl3VkE4SjRseitrNk8vOE1HeVpPRmZ2OUdxc3J2?=
 =?utf-8?B?ZGJhVEhQZmh0aHhWMWlCWFNGWUFnU3VQZG15bFlMNzFWZGV4M3NjZTMwWVhZ?=
 =?utf-8?B?V01yTlFNb1JYR1ZnVUJmaExOdzk4QVJmOU1PckhYVjBXc3R4QjZ1dEJGM2tk?=
 =?utf-8?B?amEyemVZcm05aFBNU1gxb3Z3aFBJemQxaXRuL2laYXJwYUh3OU1TejRNd285?=
 =?utf-8?B?WE9XeTdCZUJPVWtxdWdwRlJWU2Rsd3UrS2hLTGJwY1pCcHB0QllpM0Q2TGpG?=
 =?utf-8?B?SmlEdWVlQ3RSTGpVSmxBa0NxbmZaZVRzQUhHeU5yc2NCQ0lPaXVhRDVpdlB6?=
 =?utf-8?B?Y3JQUzFvM1dGYUJLelkwRFJrVkhHNTJNalh2eXlXcnhCZHNDY01STURuU2tn?=
 =?utf-8?B?R0NTRWlLdEl6ZTM3azhpMU5hNUJLbjVzN3NDQnc1VEFhOXFpZmNVRDd5WjZn?=
 =?utf-8?Q?S4tYqN0ThskgBL+M=3D?=
X-Exchange-RoutingPolicyChecked: aB6l/4FdEWwqVr/GP6j3wONWnJsaEwq+1OKeSwCggkuyEyh3JrxCrVn9XL59KVzLcRJMZtPhHT++57wXTh/JlJsD8X6PRWSUaODNn6rbuUSptW/V+XB8XdvmcVnBOfjBYefNnZ5lHXJOY3divV49uQevbNOj9XxKtQi/KHrsH9yIopOo9w4ys98d4SyQOW/IBpStEICA4nhXL4B7mALqrPR8rWCxaXgBuQcoKSJgMC9cu5ctiO75ruX4OdRBLeG0s1Yt0ZcxGgBt27cD6nN6O7oJrNlcmmYRybOC3nIqHC4KpdlLtP+Ig5vo68AEnQCNJ4qosdW1hf09i4tqhEbh/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9eb4ee1-e12b-4779-ef1e-08df496b2c15
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:07:56.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZcBwcVZXlUU3mrUjyGUM7PTm2fLT4iUpIbVu2ipR2uTqUl8e7BKZAC9qZKOJH5pr7FKn1pPVakAFiM3IYu4Gq4Su+LYtuZwnlRunJwo6LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
X-OriginatorOrg: intel.com

On 11/6/26 6:16 PM, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
> 
> Since commit d8c40b9d3a6c ("ice: check ICE_VSI_DOWN under rtnl_lock when
> preparing for reset"), ice_dis_vsi() sets ICE_VSI_NEEDS_RESTART
> unconditionally, but still skips ice_vsi_close() when ICE_VSI_DOWN is
> already set. For a running netdev, ice_ena_vsi() then calls
> ice_open_internal() -> ice_vsi_open(), which does a full open: it sets
> up the rings and requests the IRQs again.
> 
> A running netdev with ICE_VSI_DOWN set is not always a closed VSI.
> ice_down() only cleans the rings. It keeps the ring memory and the IRQs
> so that ice_up() can restart the VSI quickly. If the restart fails, the
> VSI stays in that state while the netdev is still running, for example:
> 
>    - ice_down_up(), when ice_down() or ice_up() fails (the latter also
>      via ice_change_mtu());
>    - ice_xdp_setup_prog(), when ice_down() fails.
> 
> If ice_dis_vsi()/ice_ena_vsi() are called on such a VSI without an
> ice_vsi_rebuild() in between, which is the case for the DCB
> reconfiguration in ice_pf_dcb_cfg() and
> ice_dcb_process_lldp_set_mib_change(), ice_vsi_open() runs on rings and
> IRQs that were never released:
> 
>    - ice_setup_tx_ring() hits WARN_ON(tx_ring->tx_buf) and overwrites
>      tx_buf and desc, leaking the previous arrays;
>    - ice_setup_rx_ring() overwrites desc, leaking the previous descriptor
>      memory;
>    - ice_vsi_req_irq_msix() requests the PF vectors again without
>      IRQF_SHARED and fails with -EBUSY, so the open fails and the
>      interface stays down until it is closed and opened again.
> 
> On the reset and mqprio paths, ice_vsi_rebuild() frees the ring
> structures in between, so there is no WARN, but the ring memory still
> held by them is not released until the device is unbound.
> 
> Call ice_vsi_close() unconditionally for a running netdev, under
> rtnl_lock. ice_vsi_close() already handles a VSI that is down: it only
> calls ice_down() if ICE_VSI_DOWN was not set, ice_vsi_free_irq() returns
> early when the IRQs are not requested, and ice_vsi_free_{tx,rx}_rings()
> only free rings that have a descriptor ring. This is also what
> ice_stop() does for a VSI in this state. The race fixed by the commit
> above does not come back: ICE_VSI_DOWN is still tested, by
> ice_vsi_close(), under rtnl_lock.
> 
> The non-running and ICE_VSI_CTRL branches are left as they are. In both
> cases ice_ena_vsi() either does not reopen the VSI or, for the control
> VSI, the only paths that set ICE_VSI_DOWN also release its rings and
> IRQs.
> 
> Fixes: d8c40b9d3a6c ("ice: check ICE_VSI_DOWN under rtnl_lock when preparing for reset")
> Assisted-by: Claude:claude-opus-5.5

this tag is overly specific, please just use "Assisted-by: LLM"

> Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
> ---
> Found while chasing the same WARN_ON() in ice_setup_{rx,tx}_ring() with
> the out-of-tree ice driver on an E830 port without a module installed,
> where ice_vsi_cfg_lan() fails and ice_dis_vsi()/ice_ena_vsi() then
> reopen a VSI that ice_down() left with its rings allocated. The
> in-tree paths above were found by code reading.

thank you for working on that, and its nice to see that the problem
comes from an actual usage (instead of plain AI hunting)

> 
> Based on net (f66469d9905b, "Merge tag 'net-7.4-rc2'").
> Tested: build only (W=1, no new warnings).
> 
>   drivers/net/ethernet/intel/ice/ice_lib.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
> index 7cd2dd066ef5e..0421b0738abd1 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lib.c
> @@ -2852,9 +2852,14 @@ void ice_dis_vsi(struct ice_vsi *vsi, bool locked)
>   		if (netif_running(vsi->netdev)) {
>   			if (!locked)
>   				rtnl_lock();
> -			already_down = test_bit(ICE_VSI_DOWN, vsi->state);
> -			if (!already_down)
> -				ice_vsi_close(vsi);
> +			/* ice_ena_vsi() will reopen the VSI with
> +			 * ice_open_internal(), so release IRQs and rings even
> +			 * if the VSI is already down: ice_down() keeps both,
> +			 * and a failed restart (e.g. in ice_down_up()) leaves
> +			 * the VSI in that state. ice_vsi_close() skips
> +			 * ice_down() when ICE_VSI_DOWN is already set.
> +			 */

this comment is too verbose, and you have already provided the same via
commit msg, so either make it really short or just drop

> +			ice_vsi_close(vsi);
>   
>   			if (!locked)
>   				rtnl_unlock();

