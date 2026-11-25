Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641404;
	b=N/d4dXUQ0t7HhJq/1+pEoXvOHT8O+mEsQmeh79Uqkeal0kVfOp5Gl2yFeAMWc9pU3peF
	 R9QiueNjxXxcTikFXkjkZEPtd877Y6m9Dn0jV2xh+PyuujpnKWq1kB22aCDrNYm3UU1l5
	 /dxU+NZ3UgLL44fEyeEUJVgRSGn9Q0EjQ7GtJ3djs2m+xN/cAjBHBa6F/3VzWZ4/Jm90N
	 3EyUpCo71fDKzFUmYelENlvBzpjcbiTMqHOMQm2y5sAgR8y/jfVrVtFZxEH8QKWgZGfqa
	 gld5tcf+OA+N/v2Gl7SYhMrPAqiq70mu8qE4++oDLaaSRwCJOnW7dBakMhF8KG48IGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641404;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
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
	bh=ycV+5ea2zBzuJNOLw1HICBe+fopJ2tGflDhRi13ZxPo=;
	b=Lq2zjcEuhUQw/F60G4q/JeJIOZ5jlkr56SD4LxKpjh7WR8GFYtXB4c2hfZCTgmbzrXWF
	 I0IlZBy2hZRl8Eo+m7MrZuxsF6cKvWM5EJnNgB/8p/hQk6mMQgrDSiHCnDZLtbvr4XsGy
	 8hjZub+mYXRBoLC7eFAiB85Pt6B9HF+jDY49TGGRcPYPhguHsFjCA/6ehq+OPFpbfjnZk
	 XP3Wbed/L1/HIoNu+7QY/yMlO/19XvzWwO37qqCPydqRoWnCZWzau1nbBuIuxcO27ol+9
	 qWc8mUiuwX4qBef1ayMJgcy5R+T+rk47Q25pIsGDENw6WqUGzUg0ZE8np+s4BVOF0Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekudCG0e;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="P/LdaD2Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BA606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekudCG0e;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=P/LdaD2Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641404; x=1827177404;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7FvcqB9kOZF/upMMc6004Uxnzq+h4HwxEkTfdjUlreA=;
  b=ekudCG0eGgP7fkMRf3Ncu16zWoMMOUhfM+er2yNJFqqGGfSeJVAgUkdR
   T432lH0x1K2ZFk3i5drDtG9yYh5kOZ/q8Efu7+89rJSVWeREo3oeRF5oA
   Dp27iMIUQm+2mQjzU+BaB7BkrhbSO4AgSX9MLVoSIwTtSIQQPMRrsa9ZI
   1w6il5C7F5QC8fgoWGQY26OT2wwp+CAk58OZhITa/yvKy3Wduo3QTOkyW
   XQaXq+XUZCbMdpsjG0S5LNDR1/3P0tD4onC7XQ9mw/hNtINJC/ZWLQ0tG
   ecU236r+41J28tViy9rkxW7Xf1quxjTVa1mS+Ovv6fNz0NDkK1jApRj6A
   Q==;
X-CSE-ConnectionGUID: oYRNmnf4QrW8L1RhKxc5DQ==
X-CSE-MsgGUID: bOcjl7DHTm+I/122BXzpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4426448"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4426448"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:16:44 -0800
X-CSE-ConnectionGUID: Gn/LGuTAQkisOJi4t3XDsA==
X-CSE-MsgGUID: ftDFj9ANTwyQMaEhZq3e+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12561821"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:16:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 13:16:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 13:16:42 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 13:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5FeRPWpy28Z5lyfk7WR6XDqgZR5mjFho2q4bW6hh4lZyifPXaUNsgcOCac4px09UeAaP+cb98BU/Un+OLpEk/kWJ68pXgVJIR8i77tz+ySdXsefcFuE63HyCddQcinh5kvcvfb8c18wWgDIPThH5A7gW9WOP2K17xcIMio0vktaA9q7eZunv6LVPQuzX7N5uJn5BmTlcqWxaNTfgsMIxFBta0NrIWO83yg1bikmbzsPgAOW/NeZYhu11tOhjKU7Fp1xp64ZlcLN7NovAgff2FcWJifi0Ed6g1/OL1gfyyfPMVBWAIrh8PRWSI50bOMT9Qpj06vvF9vyOt9bvyU8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycV+5ea2zBzuJNOLw1HICBe+fopJ2tGflDhRi13ZxPo=;
 b=jWCXrJIKHEpzvMdI+Pe0qNEcU7LeYQl8LFrxRVxL/PS7yUEsUdosiUTnnRLo1b2i1xj/3AAOAUF3bPf0SdHqzm1i5kMLBMq7YhQ2cZwdcolysxixXcxGLxXMk6K8JV4vXNqHNzIXbXvd5R0GD+X/d3qBaac95J2HFiGM/dxf6uzMCFBdlcZr+gtgFME0dQfKPjU0h4wqvL8+j9xMHdvG6hj4tiqJw1/KnPcNoyYi0g/8clkjaEa289l7+SAgiml1KS7B9o5fb8snmArcet+pQhmipCuJsWeVsxkiTwWqLGuLQqhHt8yFlT/2Phi8tGbfLPXUmHsGekpW/CQJRzMjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycV+5ea2zBzuJNOLw1HICBe+fopJ2tGflDhRi13ZxPo=;
 b=P/LdaD2YjwQwR18LSGxEjiua5Cqq/R/IyecLsRU+oQLa01eYP2U9JYiaRThoXxD2QbKhdJNPwTm0LG1qGqwK+NDLibdoL2rR/L8XF7I4zYg8Mb4ox5lCxNBC4+bPd9VeN38hwNHvnf8JPpul4FfeLTwBfydTD7qp5MVw2Vc0GNw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by LV1PR11MB8844.namprd11.prod.outlook.com (2603:10b6:408:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 21:16:03 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 21:16:03 +0000
Message-ID: <81c519b6-2d94-424e-8cfe-22ed8c1d728b@intel.com>
Date: Wed, 25 Nov 2026 13:16:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Petr Oros <poros@redhat.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Jacob Keller <jacob.e.keller@intel.com>, "Maciej
 Fijalkowski" <maciej.fijalkowski@intel.com>, Magnus Karlsson
	<magnus.karlsson@gmail.com>
CC: <netdev@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
	<edumazet@kernel.org>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<horms@kernel.org>, Marcin Szycik <marcin.szycik@linux.intel.com>, "Aleksandr
 Loktionov" <aleksandr.loktionov@intel.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <20261125124652.3843638-1-poros@redhat.com>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20261125124652.3843638-1-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To PH0PR11MB7710.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|LV1PR11MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9529a1-9a27-449a-7329-08df4b394fb2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5xhgiQ39GQWjsGeXbu0rvdHGocCx6ScuSqvTnwzt5lwj3ICd2HK7yfVeZ4SGhKxUopCfGCGgd4kCCEq06kycAsDjzMeBPzm+HK+RzY6HnAkpzyjNxYo/2T4GhuJKe9EpV+kzuImAs4vBvySR9NEigXmXDae/Y1N1nfREufoZkAYJ5Gpbf9lgQ5xnqNgzMqydpsreKBWuJntEbbLMFBcysNfr5T8CGSR2cJl3GXjp6qG3Yof1bNM3HDbqmMB0k99AnMa4NjzQ49Be1r7VATy5pnSOQlBko817SwH1E8QODdikGDLoSp4xgtLkfWd/c+WUHX+2eeiTXQLbtLCLE3khl8aCdYwPGhPQL4iMDG+i5oQgGOAiIIVSdMuHBjkVHcBH+hU0BLXhV1qkGFQ3vNBfKAT7wBjgX5rksBlzEmArYIVvZxXJH7wbkSf/WMRJwuixiDCkufpwhNjFSGZ+JHC81HPDCafVx72tv22T/5Q5KRTzmlpTEC2lkPzYGesRnxjyZOMXseGPSRD8ph1nKSAck9F+gzxZvQAWNEgxv+fbO6+dPNiIeTC2AbvVxoF0nsalWiXy2Ahk2LYrJjVP1gZXHdouVfxlapXLCTYmsjs7haPMbTW664HQ1ZcS4XLhsrdkgph3HURtzxWrOeclJ9KFnXCRCmmyVMQAVT8zEV6+mAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnN2NnR0dThDUEtkQXEweHNKUlVEdHNmbGwvdjJDWXlCbjM1MkJkSWs2eVpB?=
 =?utf-8?B?dWRWcDQzM0M5Ky9SL2hhS0FFZVRnYlU4VGxIWUc1VlVrT3lWZ3kvTFd5cGpt?=
 =?utf-8?B?Wit6NmZUNCtpT1dRd0hYZjVJZW5FMjBwWEd6VVVHWkd6NGVuV2VITFUwNW1G?=
 =?utf-8?B?NzhMdiszeXowQXdjRXNXc2V2eERZbUw4RjBEMVZ3Tlp6NjlQU0VoMkJOUjdT?=
 =?utf-8?B?ZWZSdDhDL0FWOUllbVU1aHpwOUFaMjZpdVV6VWhtN2ZhVTNYMXFvZ2NTYjNm?=
 =?utf-8?B?U29zSllrZEVLa2FLc25xWkVwbnRaaVhkTjZRVEVZdTRDRGJqK3oycC9nbHo1?=
 =?utf-8?B?TWp4RGxwZjkwc0VsdElyVkI0ZmJnSlVhMUtGR1lTNXo3ZkdrUG1zZ2JRUlZI?=
 =?utf-8?B?UVllSC80eXRpTHlhR3VoLzY1Q09HYyt6MVEzQUxTUHF6ZGNOaTYvaVE2MDZn?=
 =?utf-8?B?a2V1cy9YLyt0bnEzaFpZSThteW9kRi95SjJ0NVNCaXg1SWRrK3R1dEtCV1l0?=
 =?utf-8?B?YmpteXhmNFl1UDFkSGxMNXlpRVkydHlGVzA2RUpyNlA4N21pMnpvTXJlVkJG?=
 =?utf-8?B?eWU1R2tiazRUUFdUUmlzc01xUjZEcXM2YThWSW43bllRclplYTFVMWlZekZz?=
 =?utf-8?B?RmhOK240QTVCQ1dkRmVnWVcycG9FMlgvWkM3Y29mSzhZb29TOC9iRUgvcHcy?=
 =?utf-8?B?R3ZOY0ZiU0ZsQVQzbzdLNlhXdUd4RkYwTEFKZVUwZzRHVnhYREhtc2FVaUR5?=
 =?utf-8?B?WHM2S1pFcWRPSWNTNDhaWDU3QVFSYmJFSU9UQ0J0VG9RQTcxckdSNFJpWGM2?=
 =?utf-8?B?WU96OENRTWl5ZzhpeHdZSzE5OVBJcmZDWkdvcFBGTHJXYnhlWnF2cmJidVhs?=
 =?utf-8?B?WEMzK04vQ0YvL2hOcDZZTndMYXFtM3VKYkZVV0lIYmxZTW1UWWxScEc1T2Js?=
 =?utf-8?B?NEY5SDdnVjRnRUl2VE9FNDdkOGVOUGwzdnBReHVDTnZ3ZU05eC9scEMwaUc4?=
 =?utf-8?B?Y2xzZFl2bmZESkJXZk1WV08xa2NwakwrVE9Rd1U1U0FTQlBaaXlzUEhKWnB1?=
 =?utf-8?B?VGIyTDhSSmVHSVBSNFBpOEdKbjFDcHFmUTFPWmFaSVdDdjZ6cjdOTkRXWXV4?=
 =?utf-8?B?V3dkTTJqNExNNFM1SEh0NkVmWVNLZjNSbWE2ZUNROWZTTEtUYVZIcFFrcmM1?=
 =?utf-8?B?VjJKeDFIaWo5QVFtS0VyYU5uZndVaDZwbVJoMzVoNFVPM0VRWFhZUGF4MGhC?=
 =?utf-8?B?RDFzUGRqVmU4Y0FESSsvemxnNDhFSnNISy9veWlFa2dJNnkreUxUMHhxdUlZ?=
 =?utf-8?B?MG1JMDZoLy9Qa2cvM1plZ1EyQWc2V3paRW83MGd1S2s2aDQ3TUFuVWJGcWtW?=
 =?utf-8?B?eTYydThObWdhT3FpdTF0cHBvSENWTEN4TmJhdENhZXQ2eFkrSHpsY09JMmtN?=
 =?utf-8?B?N2laREgxUjNjTlB3bks4RWVZY2FXZGg4NVV3RjBmMzY5UkdCNkZYbEhSUFFm?=
 =?utf-8?B?MjUxR2d2UTRnUmRFKzdabjVGNFd2RlhBWUlid25oakovbzdXb1pNamFmdzJo?=
 =?utf-8?B?dkUwQ0taK016MVJEcnVjaTZKSUZINHdCK0NJYzFyV3J2cTdFbWJDc3ZkTXRj?=
 =?utf-8?B?a3VhUGVVZ2NzSFpoczNJYUdLeW10WVVtUjBpV0dsekROOEliU1JvYU1jaG5E?=
 =?utf-8?B?aGtWYWRrV3JOQVBRc01sYzBJUUNCdlFMQzN6ZDErVFJOSHZUd0R3QmhYdkpO?=
 =?utf-8?B?NTJhdm9pdTN1VGZieVZDQWJYS1J5T2Uwc0htTGtNdmRYZ2JmaGFoVEhkcG1H?=
 =?utf-8?B?WDZtRDFwUHZ1dFdiYU5leGdVUG1HNTV1R1cwNUZINDUzajVXZjBSVFllQlhC?=
 =?utf-8?B?Tk1Yc0J4cTU1bVlPK3ZNRld2Y3dhVXpGR0k4eWdRd0NpTCtlSHFMVDVMVUNG?=
 =?utf-8?B?YmlaV3BKQUtMUWttTlAwaHpHWDlxSHQrVFBMdVhxYkVUWWdYdmliVEMzamRr?=
 =?utf-8?B?bENRcVNLZHI0TWN4WEdSYXNscmFreUFvUEpMNk5Sd1BWYlViY2pDMzFFZ2R3?=
 =?utf-8?B?T245eUZMaWdPemVDaVJGQkt2M2J0N3RSWFlRRU9hcjNua0F3R1hCQUtOREl3?=
 =?utf-8?B?djlWd25hSXpycUE0RW9IRDVpYkl0cGx4RFdwY2kwTzZYL2tFOUZQeWVsWTlI?=
 =?utf-8?B?MEFLWUZ5QVRNZ0s2bE9SSHZkQkNlTkV0a3lBR2YwUEdJWmZKSXZ3RW5iWmUz?=
 =?utf-8?B?NWcwU1E4MFRFZnFBNURGT25DNWE3d1hkTzRHdVhJc1A1eWhqdUlQOWhBM2tZ?=
 =?utf-8?B?cFk1T3ovOHFNeWVXcUlBcnFIQXZMUWFBdHlnTC91UzdMcDlJY1g5c1h1bUZD?=
 =?utf-8?Q?+w5PV7DNIhFSZuGE=3D?=
X-Exchange-RoutingPolicyChecked: B6rbsPnXX4umEeNZwLqvq/lx61nYx+Z803jpuBy8qvEloqxvcsQczP8zjKfIo8epvoC6+wAm2ZVBCGt+jFrf2TdNvUYfbYBSnOcDjt8UB72LBJFY/5JL5CLU3k1j9rpgUjzxKVMpJFoRD+A0e1VMSrh33SYVmF11DQ2E2obfnulYlnoTCdnp7mwKd4GcMAM9t+kGl9mP8bjYxglZwLcE9GKYkqLCyeoodxWL5FpTpJJTPcDhxL9y/Yaz2hdcBx8khCl6Hey69A/rZY/+08Mx8QdkYKkez6E+OryH/Lz272L47LgW2GmGqpQJDUYLnCZFpt5fwDBKGGJ0/haKmaYmTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9529a1-9a27-449a-7329-08df4b394fb2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:16:03.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8AGQzY7oFdHfxu2pSQLugQ202dMW5gO+U6EtUnMm8d++gUj2LkQFLm9tnnEl3albkNHyiW/edoqmUbSa9tyXYcxMuBAw8VD5GOOVSQOvKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8844
X-OriginatorOrg: intel.com



On 11/25/2026 4:46 AM, Petr Oros wrote:
> It would also help if Intel updated the MAINTAINERS entry to match and
> kept it up to date, so that it is clear who acks fixes for each driver.
> Jakub mentioned adding maintainers or splitting the entry, and the
> details would be for Intel to decide.
Yes, we plan on making updates to that file

For netdev maintainers: Is a Reviewer: entry sufficient to be taken 
directly?

Thanks,
Tony
