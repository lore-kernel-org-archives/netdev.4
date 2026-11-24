Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527413;
	b=VW4vvTF/yIPE9lFYLyMNkUW18uoA7He3bOGLn8ea1OTDyI5Jz484oX87RVCkYWak0sos
	 zWOE/Zy+YjZuAMricHGeQHgV13Iw9BedUu1GsSJMKoIKaieGdWUf1uCTuKnOI7M3cpSI9
	 pELQctOwkVLsvIDtye6/I1Hhr/giH7j0GrK4MVAcjEMTh3F+XdcCFIqmzlkz1/2vUAat1
	 CQnBv3Tx0NIBYr+2+ot6pXpuX45BpkI1GiasSxP/lW2KLn6BeYRRcWEnkDAmANc5Gy2Qj
	 h6mwp9iBa8WOIdn9tv/BeDlGPtohEahdnyTU+qjC76ZQ6UWcrflPsMDctt2EWSnvQhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527413;
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
	bh=zh+rH8p2T7j36IQ3GY7bjJzGp0v8T381kEtpUgiiWbU=;
	b=4S6WPkEKCi/UliCdGkLVrl1uxOP4Y2FcWZWuZ4YDBjqikUjbLnYxHQB382Gew/FT28gJ
	 GccYICBiovk4KcQvRejJRG/qzQtMT3eNIdvywFUD6wDneteqLRVZfdlwYXou1sCJWOD4/
	 DWSLOOMA3gCwMgcN+QTPnsXud06vgGdaLuHfOrLJVkH4yococ55NuU71XqSJ6AavnPfxo
	 0nm34TYJfxG33lwCdMNaUcBEKJlw8M40VAtFjKX02EoLRRFvJDMkG21Wlz5NeZ7K4Ldnw
	 bbDlukpKpleOx/PNizFxtZEU4nk1/8t49Qjx/me6wg+RDPF91UfoU8PJIZJC4+hTfmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F2W4vhoK;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e3IdggZ5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F69606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F2W4vhoK;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e3IdggZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795527412; x=1827063412;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xTGgVEAqY3rfmo7gxsTzb7Ov3snTs7qNhdu1hAX4CPM=;
  b=F2W4vhoKdw2s4y8GL7+itNlvwEMIKQIi19HjNcsQcrYhfOyfLW2MZYDc
   3Kdanl1b/qYKJ10reqg3AUWT/lTW7m3qfUJxlIba4p85++qLqnlemhut0
   P4rB5imOBZkeiSmZqRv6Il9EcLL3wltpHkRQGnPr7G+J+j/JT5WAh5Qlj
   cOLFA+MB2L8dj9kftXE22t5Ll1R9uDbexKarUso4362oVHJJ+wwcsUNdb
   LL5iyLMRML7Bk01HAr2uaafHjCFzIELlewl85tcXqSPOEqp/HWCLMNSdV
   zFTJCu3oJ0IPWN+krcU2MHJtM07brULSPB+WjxaPDmSeBdlqsSb64+dlk
   g==;
X-CSE-ConnectionGUID: 5b197/YmSvGhYmAivTPfiQ==
X-CSE-MsgGUID: zhRJ075iRuKn+ihM3yQqpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4423628"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4423628"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:36:52 -0800
X-CSE-ConnectionGUID: u7FJsXRRTlOwe/bv9lS8bQ==
X-CSE-MsgGUID: bjdLW+KhSuiuDvd4VG9HDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13253910"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:36:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 05:36:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 05:36:51 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 05:36:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwJsSfMs3ge0LtpozvptPQAibKoPj2D5LsVLnG33yiO/Uht4hl7tNl39a3PpnsEg9ye3njaqYd0IDcSyPoEwHyIGjPksq6MyLFQBE6/Km1Wp92Ts9KIc/n+S7HZOHe01pg+tKDd5sc6gI/ILD3t7VkVQitPxzO/jp1TKVChq0SCJqdt8i1v0KZ7tMi+K3T8DYUV09PgDjOx5HOFcIclnMLbmTf+fElTIh1E+3kdJjlkgEL6j3pq3j3NGPjdKdtVGxQv6FMSb8MDkU9iUqkWjGr2Rz1Fkqy9PMyEagQ2rOWTZRfmk43zp6FTkS6tmjMt9tTMoMfVjEBApOxxeJZfDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh+rH8p2T7j36IQ3GY7bjJzGp0v8T381kEtpUgiiWbU=;
 b=Z1gg7OXFU2X53Xk7MzCto8WzN4UzbJuZ70PY4rWyo9059NQRRoON98O4m9BD5d4GOM7k+7VTDdR4wXolEeXFrwIrYPTU0GuOY8NQwmCYxARHtUXt4Soa9fSuqp5hrrkcd7XtxuNUnO2OHm3xThF5NkM1GJ39JH9icpucWUaCEE+jHbt+VBZgk8p8NpqiXXePSZ/IMGkJ3vsEXNMp4/uWTpT3Qal8RkVnsm3jlSyhlBoo55VKXa76nJgshe+DdUmGgwbBHzyPhK4nBTdu98WCfgbViULzByQLK9SoNV+OXfdFydFrELUoG5EPrFtZSae4JjzNlMpCapL0yy/C4d7TlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh+rH8p2T7j36IQ3GY7bjJzGp0v8T381kEtpUgiiWbU=;
 b=e3IdggZ5drCF1gseAHJIsueKxdbgkvB0/caKCMJPpw9N8Swon6YMQL1iQYoEZqdeYkcT0+HcR4nQ4l1imGQhVQqZ9yOZw8xL1PWDQJac40MfvfASt4FFYfyEmslfOtOIZUv5XNWZNHe80+uVwtfe+XXQ6NYhF+WX2arvDlNUgrM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 13:36:46 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 13:36:46 +0000
Message-ID: <f2f4f1f1-4b54-43e0-8e86-a76c9ba1506f@intel.com>
Date: Tue, 24 Nov 2026 14:43:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/2] eth: intel: fix unintentional symmetric RSS
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Jakub Kicinski
	<kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
	<andrew+netdev@lunn.ch>, <horms@kernel.org>, <ahmed.zaki@intel.com>,
	<jacob.e.keller@intel.com>, <intel-wired-lan@lists.osuosl.org>
References: <20261123205600.1794292-1-kuba@kernel.org>
 <a4e78445-d0b0-4347-85c3-acf0184ff66c@intel.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <a4e78445-d0b0-4347-85c3-acf0184ff66c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0348.eurprd05.prod.outlook.com
 (2603:10a6:20b:490::18) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7927c2-3c2d-4bee-96a3-08df4a2ffc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|10067099003|11063799006|4143699003|261021123027099003|56012099006|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Kfq7A+jcQFZ6ApDsn3xwZPPjz6NJDofPpqpP5V4qNxK+cFAsSGnYFbPNFgXXAsSwpGXYz2Csg+Tl7nMbBjcDDbURg6tGl+4JWju4TvKbDsI+rNy+4nNtQrAybhdRKDSbUr9CjkVeEaHaV9B503GfHbIyA3lSItTKrXjEVSB/0ujYJ5vdSB4AG1uhjNhE7D4tC/RU+PYSVdKUEjJBTGqtKtsMsxlZav/3yFOkKXOFctCHAuB1Gx9LQc13Z2bNIpDMxiteX8cOtOj1JwEhuER8a7k4nm0I5bec/98qMNtcvbNbHF+WamMSsjy8/ZiioBNxZFPwS13HucO4qMkBTYhHzu63euccbf9oLghnV2hdgIFtQHI9AnpdNKPO0AyWk86lbGViIzsdttwzYqCVSpzw3GEKpHqGa6w7gGi2/p6BhHfVGC0laG6XdCHbJWzpRNs0Q0w824Tgv60v5yts9hdV0XrYL1EgyI8588L2AE83E7PDu+pwpEwoGaLT1u5ag/XS9UsIpvTD3wNZCbo7dpt7zMz2SgN4+xrKB3o8QL7OLl5xWmouV+SyeOyUFdzIx/GQo3n+YuauptsmGjQzBjC/MDnujK6wNQFvseoRJCtsHS2PPR+eiMftqIT4Kk4wto3t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(10067099003)(11063799006)(4143699003)(261021123027099003)(56012099006)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnRpTFhjQlJSWktFRlJZSkFlYTlxWEVRclRxMnBLNndTQVdwc0xJajh0d0lM?=
 =?utf-8?B?TGxuVEJjRGlFMkptSThnd3VOVjhvVi9aVGNnOUR5eUtJbEZHNGVIcHQ0MnFq?=
 =?utf-8?B?Zm5EYU5kQ0QwcHQyWDFWQUhkR3lRQXVmVzZrd0lJZjZoV2p1dWxuTlUxK3Nl?=
 =?utf-8?B?eDhSQ0tETXlCR1NUVVcvVng4NEFJUTdoVldPeTgyUkdXZ3FwS0VlK0p3d3hO?=
 =?utf-8?B?bkczUXZvL3hPMk8wN09kV2FhYjhQeWNzZnlMWFhIUnA3RE1vZVhCNTc3M0dB?=
 =?utf-8?B?T25sTy8xTzcwS3JlQkNWQ0U5Sm1KdzBRYWVaeGQ3dEtrRTZMK2V5VVpMbjhN?=
 =?utf-8?B?WE90c2dRaW1GTWhVZFNjQUNIblpLVHVhYU1GTGpoaTRsUmtoTzM0VjdkenJ1?=
 =?utf-8?B?bmFpeVR4NVl1c0dldlM0TnhoUzREcjU2UVlMSjkzZGZ1V2lkNDVRNmdBU2Qw?=
 =?utf-8?B?S2RoZHB5UWJ4SUttaUgxOXZpdUYwRFJwd3p6SmFVTjRqOVJWRkJiZnJteGRR?=
 =?utf-8?B?ckxJQjJmRnNpLzkrS1ZqS0dJZmZRM2pldlFZUHJFZ3VWcTdGL2ovY0lJQ2dD?=
 =?utf-8?B?THpRRmN4bjJ6NzRnSjBKWlUzK0xLVVBPZmJSaklBOEx4VXFNODZNNE1XWEh0?=
 =?utf-8?B?SitmM2xuSGRWMzRobW9FSjEzWkdFdGg3eW9RUDY1dHgweXZQOTVZWTRNb0sr?=
 =?utf-8?B?d2ZxRmJXVTNrUjBIUkZHdWRVN2UzMCsyTDRiVnZCb2RwZTR6WlZjc0ErYktW?=
 =?utf-8?B?KzlTaktxOWtraFdFMUtCakRWOXhuUWF1VG1xVmxrY0JzY3dzVm1sd3V6Zi83?=
 =?utf-8?B?Ty9ud290QXJERXdhWnR0alliREhVeGxRSlFXRVVtN2VCMmtTdER6YTFhMk83?=
 =?utf-8?B?VjVLNVFlSjFWQzg5VERCWS9RM1dMNmw1MEpONWpvY0Vhb2g0OU9KcHZ1bUxN?=
 =?utf-8?B?K3FhSW1adE4wSndLTXVXeGNHWU0rUDhWRVRhb2h3eHhEdENNaGQ4ZTBrU1RQ?=
 =?utf-8?B?VUlIeTlWUWRReUU3YjF1Wi8waDJydEV3QTRQelhCSEhFVXpCNy90dTBodXNh?=
 =?utf-8?B?Z2VCdEVnYUNmcER3L2RiWWVleHZ3MHJYY2xoUUtRdnVtVjI4OFkrRXo5Z0Nu?=
 =?utf-8?B?bUUrTzc2b2RtZEFjUlNGZ0VBY0ZVSy9oR1FEd2gwbjFYRE1JOWJqUGtXWGk5?=
 =?utf-8?B?MVozZjNZY1VlYzE2OEh0T3VXN2JRcFMvV0JjTWZLWUxWUEZmc3lxWFowWUpy?=
 =?utf-8?B?cCs1dnlqQ28yQUFrMStaakNySkRYL05zditVRkc1ZWppcmREL2puNmQ2VmJs?=
 =?utf-8?B?RVIrOXM5NWJGVFVwLzNIaGpSNUpURVA5QkhrOEpmdEQwQzBrSWxtWk5VR2VI?=
 =?utf-8?B?MURtSlpqY1k3aUZQKytiOExLMGI1Tzhtc0xMMFVhS3lyR1AwV01Id3ltdGFM?=
 =?utf-8?B?RHM3cDZtbFp6RTluYnJBWVI0bU9NbjJRTEI1SVcwQkVkbzBRcndPRmVVN2Vv?=
 =?utf-8?B?WHFpZWRIMzRmanhrYy9CSW4xSEtXbE5FL1J1TThFT25uaVNyTDgvTTNpWUVK?=
 =?utf-8?B?TGVra0FOZHJZU25oK05FR3ZRWTFpTnJsQUJBOUlWb2hFUEJWU3pQalMvTVRx?=
 =?utf-8?B?dHh6S0lValEyblJ3eEpwTGRQZ3RubGZmdk1YcEVWRVAyOTRUTkRBRHBYOEdU?=
 =?utf-8?B?ODkva2hQVWJQQjMwa0ZtU3V5U2pHbWkwTGhIa2h2Zm5TZzZrL0p6bWZGYkhw?=
 =?utf-8?B?TFdGdEVoTjRzb0VDeXZiVjZIclJxUTcvWEs1blE3Zkt5SXdFaHA1dDBCNmpa?=
 =?utf-8?B?UFgzVlQ4c1g3ZUtKZXpqaGx3WVE4Ym1UUkhOWm9Sajk5MTN4TGh3aHpqSmNR?=
 =?utf-8?B?a3FzK0hHQzRpNmcxTkY4UEdnUnR0Sjkrb3JQbTh6RHNXRW1rd1BFV3BPb2Rs?=
 =?utf-8?B?bDBTY29pRmpidW5VQW1QWEhqMkp2NnJIRnJuWnBlcU5kdzQwdGJGU3M2SURO?=
 =?utf-8?B?SVk5VFZKdWlOb1lHR25mZXptL0E5N3ZWb2FhSW9TbU1hU05qY241ajE1b1gy?=
 =?utf-8?B?ZVZXRi9WYnNkSmIxSElTemdhdE1RbDJzbW5BeFIxZk1CRG5xN0lyUmlQV0Zp?=
 =?utf-8?B?NUNuMWl4d3pJeTBzcFN4V3VpcUZUVGlHdHNiZU80S2VVRDdPUHlXMnlQK1pZ?=
 =?utf-8?B?QnAvdmVDSzducUFKUzhlc3VyWFdtbjE5ZzViV0ttamhQdUZzNHh4S0xQNnlV?=
 =?utf-8?B?eTZDc1FxczZHQkljNHVEMEpwVXNKdlNtWlNtSXRxVTUrZlA1STN0MjgzYTlL?=
 =?utf-8?B?ZnB1N2ZtOWNiU29jZ1I2ZUsyK1ZCUUJyeTIzRUJDdXFxQzI1ZTF6Ym1Ld29C?=
 =?utf-8?Q?tZwuZsMEPtgQ2s7A=3D?=
X-Exchange-RoutingPolicyChecked: dqwbJ+Bgsdx2jMQqiCSXNz6tAS4itwgb3fH2P/JuRAakLKk/xNwhI1KHaers9a8zg9L4UFk7K6ZvHtvb6QEaoLxXa4P3Kxx1r5ZILxrAck1x6z6N2oYUZGC1AecTUTPcKefg9FK5GAo8FO6NkYhwz+d4O5+iluuu2oAn7/+q0w+K7ktcqCJq0ouUGdtA7whyLprWFBZfIhMJAxop7gCaz/DZk3d/WrI5mqOEWeF05G8bCmUM2Yo4fdHT4Cc1274Qkyq49ZAaaK1f1zSFzLtF0UNXaCU7QOmX58axUfcQ2xfq3OxtGSHPw4DtDLzxHGE45o/BNSXA4i5jzIGd5fC9RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7927c2-3c2d-4bee-96a3-08df4a2ffc18
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:36:46.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VwGBkAY3KUZkwgXye1Zi9RHkmTO0i8MuyMTErHZXhjvBowp+M3CSQeqv5bKhsPSEP0DxvjhafR9fv3jYmCXiSGlVxpjyDT71GdLTFlyaAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com

On 11/23/26 11:46 PM, Tony Nguyen wrote:
> 
> 
> On 11/23/2026 12:55 PM, Jakub Kicinski wrote:
>> Fix Intel drivers not handling RXH_XFRM_NO_CHANGE.
>>
>> I had an urge to "fix this in the core" and hide RXH_XFRM_NO_CHANGE
>> from the drivers, by fetching the current config instead.
>> But "NO_CHANGE" values are already part of the driver facing API
>> (hfunc has ETH_RSS_HASH_NO_CHANGE). Besides we can't _completely_
>> hide RXH_XFRM_NO_CHANGE from the drivers, since we want the drivers
>> to be able to populate the defaults for new RSS contexts.
>> We need a "user didn't say" value there.
>>
>> ---
>>
>> Matt pointed out that the upcoming RSS sizing series breaks
>> NIPA tests, this is because the fix we shared in June:
>>    https://lore.kernel.org/20260626152636.1e48330f@kernel.org
>> or Maciej's version:
>>    https://lore.kernel.org/20261007200311.730443-1- 
>> maciej.fijalkowski@intel.com
>> is still not upstream!?
>>
>> Recent discussions suggest that Intel maintainers may be willing
>> to ack patches on netdev directly. Let's put that to tests.
>>
>> Note that I think this is a major bug likely to bother real
>> users so I'm targetting net. Przemek's series will have to
>> wait for net->net-next merge.

will do

> 
> For the series:
> 
> Acked-by: Tony Nguyen <anthony.l.nguyen@intel.com>

works for me too


> 
>> Jakub Kicinski (2):
>>    ice: don't unintentionally switch to symmetric RSS hash
>>    iavf: don't unintentionally switch to symmetric RSS hash
>>
>>   drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 ++-
>>   drivers/net/ethernet/intel/ice/ice_ethtool.c   | 9 ++++++---
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
> 

