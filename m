Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117485;
	b=2EKcHvaAWd77DJbVaX6n7NNS1ILJRsrCAKX1Z0y8OuwIHmxZsrFdh0g5RhUaWC+ZU/oJ
	 jWBc2+MI/3mu+wVDywC2Y2niroDS1DTvNSnZ4rOvlqbk6Irq0qGfQt8ajDxP26yJ/+Eky
	 2ab6bzhoRV/Mj6FHqZQpLqoc6nbrGAUKkwqx3N9GbCAyPjt5a9W6ZYNqwkl6iPcEvsdJi
	 ycn9leTyHQzHoLNf7QnHMVY5wic6rWue3qSISTTBAJLvtvVioJzOBwJ6XX6hoKXbjqaeN
	 raWHAF0X04jVxjwpMLbvAw2opkeAff2rgi9AEFet9ZmNmt123uHx8U4MCcHV8fKT9Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117485;
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
	bh=LBt5m5p2Fp/7CBa53VtLXLEqyKYBzSaKCfW7YUqH4eQ=;
	b=B2+cJ31OPU7TOkwh+1JXwZmOSkpvYvdDB9O+gtpCljs/UETkTBI/XesKOBaKWgltqKZ/
	 tIR9EFBa/5a90ygPy2drSsRHSAlbXkT4nAk6SSaReoNAI0KLoULame36iYjW8tvIfBjg9
	 JRyNdLRrraK5yPm1w7PPPgmo3Mo7JBChrz6CwDZ5YcOL2/PU4xoZ07ZEDMYYnd0SMzMbr
	 ofRJC75f1s+ZwGfIXJ2n1JUmuL7UntltvLtDwQw/URuP7uf833TzYr44M/lMTJ2uj/DwC
	 ubGifanQ/WBeEYP6JdGemTs/LpcL7R5vteBqy9BHrG+C5QkNHfNPnt+o07wk6lN4Tog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiOIYIj1;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=konP8vg0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E8606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiOIYIj1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=konP8vg0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795117486; x=1826653486;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WUSJKkN6+CfCm4Fszb6J6/vRH4ero6YLn3LQsMLDFuk=;
  b=kiOIYIj1S0iK23JOwW+WIeZXLm+nGpwZPrkxg5qqDr2mgVsPs0UvM+mU
   T9KE/65WW2xmSapzrMatXhxOMxMNZUKN1m+Qi2Ec6tWC6naNVUanTTUEP
   pdepx0KKyK7ZfTMiD49KCbgNDHYWiaZtNKiVDgoPn4x8g9fSVsnyZ+iXX
   /1OtWsEShutbeKCAfMwhLZGss+bHVQV3oP0DbWt+RS812mxc4Aj4B2xOd
   6Qv4WBu9JLkdMLlt7uS728xTS0nLBClMEDMIb3t0FxYFd+p/+T/2+mr7x
   ExVkrGT2DqehlQzJ9fODEtrsn6RDZKGlYmCFMVl2j5nxURHxd37dbxk1M
   g==;
X-CSE-ConnectionGUID: ByqC+LW7QruVKejslh+iVA==
X-CSE-MsgGUID: kxssNJBMR3+jtrZ0XerpTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3879909"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3879909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:44:45 -0800
X-CSE-ConnectionGUID: QaTeexTwQmKDTg7c4kfbgA==
X-CSE-MsgGUID: ZBtry4JlS9eOD2icQOcIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10805893"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:44:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:44:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 11:44:44 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:44:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ1xPibxbWMCY0o3jM9wAcd/uQyRqg5fur/nOw6qt2Cz8PhRimFJ4lBH1bOSVH9hRMMXLeHwUgA7T3cpCEK4fNMIHV/0Ubj4IV7vOHE9ZtIQKvsg0W+NxC0+pTzvtHLxEDdA+QxVsuHLMoVtKKO+lRHfigEEs0F4knwOGE0FdN5zds/RfKMFaCQPI9trJYdC78V1D9rgY/KlOhKq3zbjJ1vqhAgvI9oXLl2rKrvkS040kq26g01HLucF6lswr9wk9QSVKqO7FdLZVxQniHmC/jhyGTlhB0dkDDpjvmwoFhyDjr9o6+YC6GfyoHttnrBMV32a3qKn0yZVlQxNu+eHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBt5m5p2Fp/7CBa53VtLXLEqyKYBzSaKCfW7YUqH4eQ=;
 b=Q15OwZbg6TcOxW2DHyOQIOd9W8eSJ/hTl3cBiYo56WWqTC890Gh/rbmwgFkL5L3NBXbX2LYYvWCT7paJuCVXFEDHnnt0XnH5tuXJmLNuO0xZwQTqFYwelt/HCiCPoT6dHCxPLbqz810FMqy0GO8RR73DopGtUQsnw0gWOUAVX/pj7bArUbl8YXK2gWOZm29N6vC75EiHqdW923LPVzEfgOHTgLumGoNLRKy9U5pfNBkZ844YmID6adfw4VvFuYzdiJyXBPTbxm5b5pVKIGbEn2DMomXtw+obEGa4SO/GZPjMS6VGj5u7yTpwJ+FSK2m9p+yMYnzlFVkM1Gf7KvWAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBt5m5p2Fp/7CBa53VtLXLEqyKYBzSaKCfW7YUqH4eQ=;
 b=konP8vg09AEcovihi86/sCVqqEeeNqHIsGY6pqA5r4F9qKcnrlphh0J5I4rYDFzuOIpf6n56lC1udEfWb1kGAhuvEqr4aGozN1NsyWvaHdyn57G9T40cZBbXpDTYE91yq1mVm0O9gv43nhxVk+ZaX3BsmlGxssFCFRCkFN2zhsU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 19:44:26 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 19:44:26 +0000
Message-ID: <8f362b3d-4b54-4337-af61-b7310d353507@intel.com>
Date: Thu, 19 Nov 2026 11:44:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (i40e, iavf)
From: Jacob Keller <jacob.e.keller@intel.com>
To: Mohammad Heib <mheib@redhat.com>, <patchwork-bot+netdevbpf@kernel.org>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <edumazet@kernel.org>,
	<andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, <fballuch@redhat.com>,
	<aleksandr.loktionov@intel.com>, <luoxuanqiang@kylinos.cn>
References: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
 <179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>
 <av7qBdVhmyhFKdai@mheib-thinkpadp16vgen1.rmtil.csb>
 <a9639f30-7465-4241-841f-a22b1af54356@intel.com>
Content-Language: en-US
In-Reply-To: <a9639f30-7465-4241-841f-a22b1af54356@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To SJ2PR11MB8451.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 00128272-d404-42f1-2f90-08df46758461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|261022075727099003|261102123227099003|4143699003|56012099006|261026121527099003|11063799006|261026140227099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: n9IWLaxCJrCRV2UQEFgR36QLc1BG23LFxw/vuABRpd2yTsD6/3AzWjVswauTrUPlLCSEcPTO/q0wiEs68QfQXmGQRMlpt3NSAo/sH7elnNF0swsJL8te48Xj9zBTSMaRMIaGVZhw5UECwY0kE9o46Sai/f3O2E5mWGtUO82iijb5Bh19QIiiOiHExZRshr8o3WzKnFqKAOdRKF4KmD9JXVuAq7anBm9YmLohDQZBmJjsAI7Bg3N5ScWdy8ovYDmbdRVLixb9J8t6h8IFOvgPgyKEUcjiy00qGiE8ItJ0cLlHeQe2wDhe9xuOvAqyD+oFYdNPgehw7ioeZB2DI3QQbE7Bic4HBhQcen6uu2Fg08nGU1vXA9NG2x6wvuz8hlzKhZkK6q/KEYJUrNaYH5hFOXr8p7NWWyCteZoHC/gyOBI75WvoBzPPYr+FQzikmgfXD19lT4ajb9SRKqajnlFEC6UfeddBAc9NF1KUGWvrtRT+x44Icn7CKEx1HXGRuJVDohnDd/t941oyVSwP/5x12BMDUZYPyh8wYe3EU6wPlvzm5TfWfP8f1Sk3XTYiedwe/5251ZwJqWz0SLit4iMcinrTCduOJmfUvgN1QNRgRgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(261022075727099003)(261102123227099003)(4143699003)(56012099006)(261026121527099003)(11063799006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTU3RWN3TFloZTNWZ2IvSnlnYWE1ZEhzejg0QnV2YnZXNmVwdi9QVzdBSmJ0?=
 =?utf-8?B?N1FUQXhBa0p1RDFHTzNVdCs5eDdPcnZMR3lJZGh4c3ViN0pFei9xUHNZcDdm?=
 =?utf-8?B?WVhzR2hTRlZlT3Rtb2lSNEw1R2hKNFdlOC9qSGdRcCtXT1hYNlVxUXAwTE5i?=
 =?utf-8?B?UmtxSnAvUFZxYS9GR2QyVFA2V0FmMnhuNGQ0NWpaMUd6aENjazQxc2pvR0sr?=
 =?utf-8?B?SjRsUGFWUHdpQis4WlRYQ2Y2cG1tL2lkOWlXVUhtcTU5eGFHOXdsdmtrb2tZ?=
 =?utf-8?B?VXg3azJadTBVcWlyMVFScXFORVZjQUtYSmZvNWRKaHVIZ1B0S3VBUmV0RFJH?=
 =?utf-8?B?WjdpN3FsTEtkZjNUc0VVQjZQbGkzc1EzSkJVelUvSHlkUkdnemtUMFYvdSt5?=
 =?utf-8?B?aGNFWnJmamVoWFJIL0kzOFgrNFRKb2ZlZVBRK0dESC9zNFJJOTZjazJ5UDl3?=
 =?utf-8?B?Mm1PblIzNnF0b2NsVUVDRGFIellzSjc4TklKWDVrNkxIV3pDSkFHeFNIWGFB?=
 =?utf-8?B?bjk0S05wcUlNb0NIWmhNMkVwSHlKK1JvbHIwamJnSUt5cWUybGxMZXFkeEl0?=
 =?utf-8?B?T1B4YUhQaFZHU1Mvc1FaRHo5NWhGTk9OdGdlUUtseStydTZTRlRnRGozendo?=
 =?utf-8?B?eUE1L0RJVkFBSUZKVldQeGlJZ25FVVF6cG5wWDNueWJRdG5ESjkvRmxOVFdi?=
 =?utf-8?B?NnZ0S214bTQ4eFUwKzFIU2pVZEh2dDFZUlE1NFNQanJFd0hkbEZaNVdQeHIz?=
 =?utf-8?B?eWJMMEtxT3pDcWMwa1VvTU9JQlhvNEJuUGhxTHl6RzVkc3VrRkhTU1d3eWNm?=
 =?utf-8?B?eFFna2szU2Uva1ZrK1c4T0RBT05wMk9zVmd5NkZjQnZLYjhTczVBanZlWE5E?=
 =?utf-8?B?Z3BPQmxXeElsOWtTSEJEcThqSEh5aDZXZ1JqWjFveC9WNzB5ZU8ycEtTVm82?=
 =?utf-8?B?bTJpWkxLSmF5dVczd21qTTE2T0ZqZDhUbi9jNjlJZERnY1hHRXdFcVR5Q0ln?=
 =?utf-8?B?UEIwSHk3Z0pqYmRveEFtL3JzNFNNOGdiK1ZnUFg3K3lDdzVVaFFzM3RYTWRB?=
 =?utf-8?B?bkpYK3RyelN6c1Z4UURjdVpuUlYzd3NFcGtuOGpMTTZLUXFzQzRoUWJNakRs?=
 =?utf-8?B?YUk0ZHYzbHdSQ3ByWndiM253ck1Bdng5TjZMbmdCQ3ZaYk1VWm91Z250SGFv?=
 =?utf-8?B?MndDb3c5YVNqL2FFNndHakRheXhYRkt0QmUwT1RHeGJRRXFZaDhXMTlibHhO?=
 =?utf-8?B?dEE4VGhZZ3g0cWlQNmlpV015bVphRDdiWThFZHpWOGszZjdhblAwQXdOZDNM?=
 =?utf-8?B?OEsvNFovaUJ5djNFWjlLQ1NyMVJpOThpc3g2UkRpaE9Edm9ERlBmTkpaelM1?=
 =?utf-8?B?K3JjZW8yb2l1RkFPWlJ5WGR1SUs2c053VTVqWkxtSmZ0MmMzQ0lWcTJkak9y?=
 =?utf-8?B?TERhRE11ckF3cjdzRko1RndUdUZ6ck1ET2pCakMwZVJoajJKWUFockxBQVZ6?=
 =?utf-8?B?NW9PckJzV05vdjZGU05OMzlmc0dTWmZ4enFETWtqVGhiME9NVGZTVDhlZWxz?=
 =?utf-8?B?emZmU243U2dydGxoQU93cWxFdW15NFVxbzVSa1d0STB3VDREYTZqVzByTVNz?=
 =?utf-8?B?L1pHbi9SQXVhczBBaTBXYi93akFSNlFFWTBGL1ZUNnlUNHoyZkdnNTUwVzIv?=
 =?utf-8?B?aU9Oem5rcW9IZllRTGRUU0E2THdTYVlvekVPenRWQjhlNzE0SzZJcVRVc2lD?=
 =?utf-8?B?clRVVEdOODlyYk1kbXpITGpxbUdMWmJyNjJ4MWNzVkxZblF4OWdFejcyY3NK?=
 =?utf-8?B?ODJkd2x3dXRVRUFjM0RnS3BwQ3hzVVBJYTZ1ZEYydFNmcUE2T1JzWXRDQ0Jo?=
 =?utf-8?B?Z1BHRFdpNnZjZk1pU21SL1dVTDNYNjcxbnNMZ1l5Zkd3N1IwSis5Z0h4Q056?=
 =?utf-8?B?bXJRUFFXUHljNTl0b3ErK1ZSNEQxN3lLTVdQN3BFVmYvL3lld2ZRRndZT1VK?=
 =?utf-8?B?T3VBR3lXNVdVS0k4VU1yVytjZnNzTEtkMnBZTWpRSWsyTXBBbnZEa3ZLRVRX?=
 =?utf-8?B?YVg3WUpwSkgyaVRsSGw4ZW9uT3d1NFpkeXl0eXE5Z0Y0bWdVMGxGd3FKWXdH?=
 =?utf-8?B?OGRyUXI2aDk2cGpua3RQVE0xNzFObjFibG1WNXNrdDZRdFlZUnJYdnRHL0Nv?=
 =?utf-8?B?bXIzMFF1cEZkc0MxZzFZMUpZZ2NyOFQ1cXhFTUJSa0w5OEppaEpTNlIyU0hR?=
 =?utf-8?B?RThpajBOUFFnZUEvUVd0NHMwdzg0NjA2N1lzYjk1TWFLcm1OY1BkMGIyZGtr?=
 =?utf-8?B?a1JQS05FelhQdXV3MEZDdFNNN2M3ZW43aVJZR2dpZ0NEa1JVODdnK0ltd1RZ?=
 =?utf-8?Q?70MbYshorLaJZfwo=3D?=
X-Exchange-RoutingPolicyChecked: v2BRYUZUnWHNnEPolF3EwSMgemfRTAJxLtCPQQL0uGFXIGQfqXBkQkAnA2yVr4fdk+FHt6hyRdpVknFYWZKNHh+JFMAc5ZR8fbfKdiTl3X5yNvDZORwZl87Zo3rhE2ntoKwK0zprYDUFRwr5fU26Vmks31jWPluD9wMcrbBNddK0aozGLzFRfb4fuwRi6zwdf7uC++p3F/aUKUCEPG87wXRJQ1I+m35pw0ETlWj/SMsyXYcqA0sudOROugY5E8okjg7rUDyHvloaFT6uPI+cFEvNdZZ+b8cz2525Kv5MJvQ7uh102DnQ62GhEVlBhY5lxPhsg9IzCyUxa15jcKOOHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00128272-d404-42f1-2f90-08df46758461
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 19:44:25.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqZT9bMyl+u6jrceyPYuZzSg3g0t8wUzIeCTFD4lWadAnnwsCUVW+UOgFvnNpW0GbbIWxbk25GxDgBmBCKUXXA4KdWXpaLzyToRYX7FQ8UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com

On 11/19/2026 9:31 AM, Jacob Keller wrote:
> On 11/19/2026 4:24 AM, Mohammad Heib wrote:
>> Hi Jakub,
>> On Thu, Nov 19, 2026 at 02:00:07AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
>>> Hello:
>>>
>>> This series was applied to netdev/net.git (main)
>>> by Jakub Kicinski <kuba@kernel.org>:
>>>
>>> On Thu, 12 Nov 2026 16:45:54 -0800 you wrote:
>>>> For i40e:
>>>> Mohammad Heib adds missing set of VSI down bit prior to calling
>>>> i40e_down() as is expected by the call.
>>>>
>>>> Filip Balluch fixes incorrectly provided Tx rings in error path of
>>>> i40e_set_ringparam().
>>>>
>>>> [...]
>>>
>>> Here is the summary with links:
>>>   - [net,1/6] i40e: fix napi_disable hang in i40e_down() during firmware update
>> I noticed that the entire series has been applied except for the first patch.
>> Was it intentionally dropped?
> 
> The patch did have a "high" comment but that one does really just say
> "shouldn't you also fix this in ice" which to me shouldn't be a knock
> against fixing i40e..
> 

Ignore me :D I can't read. The comment was on a different patch than the
one that didn't get applied.

Thanks,
Jake

>>>     (no matching commit)
>>>   - [net,2/6] i40e: fix freeing of TX rings on RX allocation failure
>>>     https://git.kernel.org/netdev/net/c/4957f668681a
>>>   - [net,3/6] i40e: avoid resetting BQL state when freeing temporary Tx rings in set_ringparam
>>>     https://git.kernel.org/netdev/net/c/e3916fa03f4d
>>>   - [net,4/6] iavf: fix QoS capabilities memory leak
>>>     https://git.kernel.org/netdev/net/c/65f6ffb9001b
>>>   - [net,5/6] iavf: fix ASQ command buffer leak on init failure
>>>     https://git.kernel.org/netdev/net/c/2a1f106379a9
>>>   - [net,6/6] iavf: add missing PTP adjustment callbacks
>>>     https://git.kernel.org/netdev/net/c/adbc4d0fff64
>>>
>>> You are awesome, thank you!
>>> -- 
>>> Deet-doot-dot, I am a bot.
>>> https://korg.docs.kernel.org/patchwork/pwbot.html
>>>
>>>
>>
>>
> 
> 

