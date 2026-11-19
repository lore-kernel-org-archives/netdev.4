Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110229;
	b=W6jvpey6jUC1kameSjlAZLd3gld4cHhu8u0MCiTFdeGROIBrU4r9B1SRE8/SHiD6p5v8
	 o6JeYcyOyZPE7ZF+kzaY5A9yvRBQPyPrpur2NTTzb7EcwhF9hJKsFTWcR5iVK0cb2aDOh
	 Osv1Psvnz7FeLZEYItG+yNK6zoXfRcWf2dy37WW5mDaaUBW+09iHv82Hn5eLQQL/dqYXi
	 Z6+t+q2dI5QL+v028YcU3TPW2PO1Wuz0AxwKycnRA157P+xP7flwyiG14u75A/082f63P
	 gUmLw9A9mibtbYiuiLUZq08RT+Remu+tk/U2t/TSVx+awogSp12bOR3txxQbrfPnifg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110229;
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
	bh=iTnIZJl7w79nR8gEmZtoM/2MSfZpQskNhTOJ5rpEtIo=;
	b=QY5JdAAkpzzMirgwZuoRwLheOTpa2uCkVmaFOLiilC1jUJEHZUFo8Bys/WlWB4x186Un
	 PepZpCkVJyifK2EafacwAiLsPL/EkD66xs9fHyT7HCLrwtrfY5iWI+x7vlJ1atrnk9y32
	 aPeYF11isHQqnVsHl47K1WCabH76VPYthadl3coxE1azKgUi/hak98gL61U802P0TK4uF
	 btf7YzMj4EoeqX5kmbgHpdD8lHzujJqrbDbpQBr0qaOcy8a0Jxuok8KWnqF2WzMs81n9h
	 vVaJdXFaMHN/OZrstSMsnaNMXhWLDEmYdj0gjvj16JOn+fvri0DwMLw/as23qG733Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7bXhmqm;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LL5QeMyv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC0606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FC0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7bXhmqm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=LL5QeMyv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795110229; x=1826646229;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YaBdskXv9/2opkcDFZaxiZ/uMp0H8csuGzRXyvYv7pM=;
  b=I7bXhmqmK3sSaJfxtaX2JkPxUsR3zNxo5NDHGLNMmac2lwu/PcD296DR
   9G1osLwdeSL7/nHUPzC3rF3rv4qzhUo7NRCH264t/ejtGaiZvzXkQQS0Y
   eRsFjL7HeRefVhi6np7cVsMy1WPm0SFlwbNMRrhT9s8Nc4VrTVjqEhxIs
   ccSUluvZnSGHo20BaEwPcoPb29vOHhCVUwcAPa1nFJBJYU3BWWCfy9xVd
   PiFQIOGlskMt3sg2qOv+JFJQ+zotxpa0w2lzkHwYeHUuopZokkqA2oUlJ
   d4NHBsago6XrPQ3VwsCUGykJ4rB7COeknOWkI9/SRVbyjN6LiCDD7vQoT
   w==;
X-CSE-ConnectionGUID: T5rwRu54SjeQbTO2JoMRJQ==
X-CSE-MsgGUID: 3IcnlIbMSTmph4IFXZAZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3820853"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3820853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:31:13 -0800
X-CSE-ConnectionGUID: FAX/C09rS7Oub1kLbGXrJg==
X-CSE-MsgGUID: tO45G2QWQYqFios9VoWjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10483657"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:31:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:31:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 09:31:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:31:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZInKaAoQ1wlDSOEaq/3sQcXElhYDEVtuqKHnutat1xSu+wZwKhiZtY0ae7nAXagIdEUMvZ/0FIiVkrplWzPPhaMDd64w451P/+ZxxE0LHGMvx18vksC+rKC25DSxi140eSm3xD8IxlSACCnPDVkDI5ZuuUPWIYnEb2AFte1Dh2ko2/vkqjl73dPWVu4jtocHTQbZxBupeezGY4Kb3b70laShfGqM17fDd5MAU6LRiLw8jJO5YFPxPQbCkCKWnxMqaM+DjpHm6zSSx5gFBiGlbF4H9mwULCOUjWmBwsXAaAajvv8fT+n5oaIKaZmO4hiYEfNxUuSXQ74jnAtiM32gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTnIZJl7w79nR8gEmZtoM/2MSfZpQskNhTOJ5rpEtIo=;
 b=eDu23AW/cUkFVVQFe/FNQjXJxHpwF4vEVCHMuYMQzSfUqFQCfDKEWDo5EjQyiUu8+edI+qj5uxTtWyabOyEBr+MlP02pwFTvs3UtbB8I9n6iHa1Q5EC2TqAP1ZULWH34o4qdx9/0j+viMibmT5lcPrMAE2koJG+BfqX7Jn+guPd0J9WiKDCAC428o+AsR7PalpvSvvtDulUCEbSkgluExCxIfpVKEaxQJfHmwOf0I8rDSqkPeth5cWB5JSkn7V2xCoaIVP+CxU0VAT/CxSjU++9ueKD7R6vr66BQDVL6T8Lt+MbhowyZ7dNApMJxxUwD1Tk0rLVgmX14nUMpJjDIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTnIZJl7w79nR8gEmZtoM/2MSfZpQskNhTOJ5rpEtIo=;
 b=LL5QeMyvYej1xyrRsnXXsXt7LEqCQ+OFoX3OFkzE7578KxJ84lFmzGQQS4qYVXq6f7EZzZ3wIsYZEwZOXm4aQ3r1R0s0Db0fvIwiUyZnk7yW3w9zSGL1dUMrpKaRHUuHuYAYqepMHzezmEiVJzbDvm978GVHQ+HX90M2PVbUrDc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 17:31:03 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:31:03 +0000
Message-ID: <a9639f30-7465-4241-841f-a22b1af54356@intel.com>
Date: Thu, 19 Nov 2026 09:31:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (i40e, iavf)
To: Mohammad Heib <mheib@redhat.com>, <patchwork-bot+netdevbpf@kernel.org>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <edumazet@kernel.org>,
	<andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, <fballuch@redhat.com>,
	<aleksandr.loktionov@intel.com>, <luoxuanqiang@kylinos.cn>
References: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
 <179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>
 <av7qBdVhmyhFKdai@mheib-thinkpadp16vgen1.rmtil.csb>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <av7qBdVhmyhFKdai@mheib-thinkpadp16vgen1.rmtil.csb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To SJ2PR11MB8451.namprd11.prod.outlook.com
 (2603:10b6:a03:56e::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: bfad95d5-e0ee-481b-661a-08df4662e27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|11063799006|56012099006|4143699003|261022105027099003|261028144727099003|261026121527099003|261022075727099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: dzzNVy1F+QMSmJRkA79D8A+U+jeT1tMz264UzMVgqscn8WBOrqpqRlgJcckFYTtr2Dv5y+sKD0uztuR2yXgvJXzhZElThU1lKjPbQQfvuP+q1gmIgLXqaMSY4IrBxxsS1A4vD4jJ1gt+0bw2j9BwHQhGgF3oib167x/9siyQDQtGK3wwmQXFccj1tLWE/HByOunfJ/oJDSkJapS5/57QQi6jD62mVY/LeDZAhNfAJuUZ8Xqv6XmHrwghLB/XdjlQWl+xNDPcnU3lSOCIYhQ0vAMCw1PSaGQAa7U4zsyNWVHHtm9bh87h4dHEP5vjcPuk9/lTuNbGvBAfSNM7ATGTgcHxxKJ+7GCIrVDbfDMxoaGtEwmkWmgQptO51whLKRviP/OXs0Iu/Jci8NCdQ349Eqb/7JNSypuoE2cRokJt3tEHB/c3Z52CdGb0kfJdbBaBK8sUGERkoW/MHw9PoC/lfQ1ABmSMl4qavDtXZvFLQi5+niPVesVOyG7n929OISQP0eLvjNe/V148c6mSFdTGqsSCxXgrN+3eKSLsH+fEFDjgml4P4fvNMtb5qQGtnM+KM+S//dUSR6PGmY5feh8tsOzVKaFdbqkTOAdnvH/Rw1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261022105027099003)(261028144727099003)(261026121527099003)(261022075727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dnMWFYbXYzaHhNaytmcjBoc216cmhhWTZ1djBnUXM0YUdsR2FnS2x5ZGFs?=
 =?utf-8?B?K2JNMXUzM1BjT2QxNUpXdmhGOVRzUzRVVVRrWGpJQVRnajFQSEZBb01Jd2ps?=
 =?utf-8?B?WnU3djdZc0xNbEFVMUdZc0lSMXY0OFVoWWwvSjdhV1g3b29LT04vK2lqQ0tP?=
 =?utf-8?B?ZysweUZsbTBMNWxvVVdJQkVudzBUS2xaK3JwcDYrZTN6VldxUGZpS1ZDWGlR?=
 =?utf-8?B?WTFYbXJ4WmlUV1ovM0dDQjZSQVlId0M4ZnBrVUlWMVpvOS9adjNaaytkak9V?=
 =?utf-8?B?VzEyZ1MyMlE0NllOWXcvbXkzK2VTSnRWYTh4UE5HQmphUXE2NnZCS2laWG5Y?=
 =?utf-8?B?TzFwNEF1UkRrZ2ZQWDlaZ1Q1SGFzbjhmbHZaaHF6dVBoelFIZjVsUXhnbXBw?=
 =?utf-8?B?Vmk2SWdicUdOR1QvWEhLWWR0MWJmTFEzWGtOT29rWVptOGxxcS9KK002VllW?=
 =?utf-8?B?SndGVWxBZU1BTGNCdStjektWREZTMUdyY3B1MW1HZ0FMd29zNkdOTklVeE54?=
 =?utf-8?B?Uy8zRUtHMkFiWkJQR0hQeVUwNlFrMm9zVk10ZXFNUDRiS1BiMlV3YWt3T2Vy?=
 =?utf-8?B?K0J2TVREcTBnRUoreWlaTTluWGhpTDFHRWRXYytKOGtGTWpscjVsaDhDMEN5?=
 =?utf-8?B?SjBHQVY1VnhGRjFIb0s3S2FtazkrQ0I4Z1lwWGFiVGl4SklUOWY2aFhMVGFj?=
 =?utf-8?B?L3RQMWcwTDk5MnVGbCtONktUQkVESktKKzZrOFhrZ2xoaWplNGUralkzWmhk?=
 =?utf-8?B?MjZTdGVVY250dXhuRlZqS2NucXZWVjVXWFZrSk1PQjVNWkhxa29ITnB0b09z?=
 =?utf-8?B?VE9hTzhMMXpOWEYvTXB3YVRjSms2MTYzNDdVaU5kTW5mM252MlRxZnlGVHY4?=
 =?utf-8?B?dldBR3dEa08yYVlOZmp2QXR2bHVsd1o2U2tLY0UrU1RzaFJNWmdGa05vRHdD?=
 =?utf-8?B?dWgrMVVQRmx0bnNId3ZjdXdFcWJqM3JVSFhyUU5XczljUWNHQ0hnbmJsTUdO?=
 =?utf-8?B?S21WY0NqcytuZC9qZUxxKzJFOWJ4cnJYTXk3ZjJka3NCbmNSYkdLVXcvbGNu?=
 =?utf-8?B?RWRjbkNhWWdLanJBZ1F4WXdxaTVqUjY4cHlMdXlGbDc4U3RmblZHZmtoZXN5?=
 =?utf-8?B?bkxrZW5NNUFmc1FvcjlVRUhLWHRkN1kwNk5zdzNzejhKZmZvVks4alYwc1N4?=
 =?utf-8?B?YU1YUTNkclhYWW1LZGcwck9pOVJ3L3dkRGhDTVVjUmZUOXZCaWliQ3Z6bkY1?=
 =?utf-8?B?U2FtU1dPME9XUUNZZmlnT0FaZ29McGo3MzJ3OUxOSFowajN2WXQ1eFBva0w3?=
 =?utf-8?B?S1lRalVsQU84R2xEQy9TTUFNdFo4OEowdW11Y2RrVXJtcW1ZanJ6ODA5Vks4?=
 =?utf-8?B?TWJ3S0p3VWNySUZwREIzL1prVmlhclViREhxUDBSNnZ4Tnp0QWpqUkZEL0Qz?=
 =?utf-8?B?ZTZBL1ZDYktlRUFpZWpYSkxBLzEvQlcwYnIzU0xSOEIvMGhrQWducXJoQnc3?=
 =?utf-8?B?ZTFyT1NxOUtLRkNuazk3RzNzT2hFTTRWQW9hd2ttY21YNmwyWVc5a0RWQ002?=
 =?utf-8?B?dVlHUTk5Y3JGdDVtb0dsRnc1NWpTQ2tHYVhFWmppbmJUMndMT09hVG92UDdX?=
 =?utf-8?B?ZzU2d3Y2S1lVTDNBSDByZFpPTEYyZWU5RUtsMnNndEJ2S1BCZVRHMHFac3gy?=
 =?utf-8?B?MW1WUVBqZUpVWGtPUkcvV1R3NFBqUE4yUUxOQ3drN3l1aWRXb21sU1NGT0dn?=
 =?utf-8?B?R1pOK21GOTRsbTk5dmRpcGZNd3JEb2U1dE1ROGt2amhzWWt4MVhmOXFIdk9v?=
 =?utf-8?B?ek8zemxwenk5aWRmeHhVK0dXNThETlptaytvRGpuWXNkaE5kNTJoK0RqYzlS?=
 =?utf-8?B?WWFWN2hSRko2UVJUb081WE5vUzVQb1NPMTNLWjNtc0NjYXNEOGNnWFlEVTBC?=
 =?utf-8?B?S2hLeWxGTDk3dmwwOStLWUgveGR5azlROGtiRXMxV1RGb2lxaktaMnVuZ1hN?=
 =?utf-8?B?SURzU1F3blI2RkoyeUhJL1BOMGNsaTZrOE50by81M0JoWWNtcW9GUFd1WWRM?=
 =?utf-8?B?N3E4cVBlWW1QNUdtdGc5bmRDWXMzTTFmSS9GZnU1UXhNczV3Tlpkb0xiRkhI?=
 =?utf-8?B?SHd2WXMxTDBXbjJ0eUtRWEt4OGI5VjJCY0FyaEJvaUpuNFUvVHlsdmp0NTQ2?=
 =?utf-8?B?MUpHVS9nQTVQcml6OGE2N2FSTlV4VTZFNWhIL1h3Q3VSbWUzREZmZU1GdThj?=
 =?utf-8?B?WE9vVGpQMVR1TnRoKzR5Y1AxSERFYVRoYzM5VHNIOUozVXFleGtWK1paRWxN?=
 =?utf-8?B?N1dlejAxeVhDdU1pK2FOU1Bnc00wL1QrenBhQ0ltaFBkUEhkVU5yakEvY00x?=
 =?utf-8?Q?WlXZ1iw6ss/XtLA8=3D?=
X-Exchange-RoutingPolicyChecked: iSb8pMPayhB6QTXthM9IJhfISd+eMpSmbZvdO9M3McS+YQDxJDyiFJlBqwXtKeD8cZFZF50nq8FBBuSxBwf1fjQx4DnGlswSZucKF3Fs+kbnecJWnlSTsE0Tv4gwr74IAtfAE9I/TX722zmSMMPD+fF7GCs3qwGbrwzRyumu1FcS0O8BYV1YpE5TF76Xe0n8SUmUILkQvq1TTLZ/5RuHnmM3Dq46O+ILJAaiXI+3XACm/6gXRuQsVYm9tWtb5N17baQ/047Ny67ZpAqwXd3qojgiBYETndqWWHooGNtHiyMwc87hx0Ed0vmzfXEPN26WKSWn7bN5PNT9Gk9t88bO5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfad95d5-e0ee-481b-661a-08df4662e27b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:31:03.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkCoxdj0gJQYfmdt39TsGQbFipsxqhenpcJPGL0HC4xstCbdxSzmF8Dyc7M6id54oXPE8vuSxnb1pok8If2ADdwF/+ZXIxVLMI+vfobvQok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
X-OriginatorOrg: intel.com

On 11/19/2026 4:24 AM, Mohammad Heib wrote:
> Hi Jakub,
> On Thu, Nov 19, 2026 at 02:00:07AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
>> Hello:
>>
>> This series was applied to netdev/net.git (main)
>> by Jakub Kicinski <kuba@kernel.org>:
>>
>> On Thu, 12 Nov 2026 16:45:54 -0800 you wrote:
>>> For i40e:
>>> Mohammad Heib adds missing set of VSI down bit prior to calling
>>> i40e_down() as is expected by the call.
>>>
>>> Filip Balluch fixes incorrectly provided Tx rings in error path of
>>> i40e_set_ringparam().
>>>
>>> [...]
>>
>> Here is the summary with links:
>>   - [net,1/6] i40e: fix napi_disable hang in i40e_down() during firmware update
> I noticed that the entire series has been applied except for the first patch.
> Was it intentionally dropped?

The patch did have a "high" comment but that one does really just say
"shouldn't you also fix this in ice" which to me shouldn't be a knock
against fixing i40e..

>>     (no matching commit)
>>   - [net,2/6] i40e: fix freeing of TX rings on RX allocation failure
>>     https://git.kernel.org/netdev/net/c/4957f668681a
>>   - [net,3/6] i40e: avoid resetting BQL state when freeing temporary Tx rings in set_ringparam
>>     https://git.kernel.org/netdev/net/c/e3916fa03f4d
>>   - [net,4/6] iavf: fix QoS capabilities memory leak
>>     https://git.kernel.org/netdev/net/c/65f6ffb9001b
>>   - [net,5/6] iavf: fix ASQ command buffer leak on init failure
>>     https://git.kernel.org/netdev/net/c/2a1f106379a9
>>   - [net,6/6] iavf: add missing PTP adjustment callbacks
>>     https://git.kernel.org/netdev/net/c/adbc4d0fff64
>>
>> You are awesome, thank you!
>> -- 
>> Deet-doot-dot, I am a bot.
>> https://korg.docs.kernel.org/patchwork/pwbot.html
>>
>>
> 
> 

