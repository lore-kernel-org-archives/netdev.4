Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461165;
	b=B/eXkwEUX4G2Mrp2PvBJHabdQ2De/+Qo4gDNe0WF7sB960098rQT+QV9/SrNae8JZEqf
	 EFKL3zODR064ht20R1d1UHZfV44vC5D0gIP2RzsbYw9MnqWksI8DxEobmCtedvKI7scDM
	 44nm4Uz8/hrTyR0tfQdLjGL/2AK6P4ISjB1x+a/8yvikMdS4g2RuT88FvjW0MWFq3drdX
	 RFWsjGT8b6uekAJ/bLV9vR4k+T4ItFFfWY1vv6ni5uilx8toXcd/fNguI6inOA5m/UVHD
	 KHcYoZ2ddxRNwW+/2uNMWeWPv6/yigMNLGezd5LShZ1CJWg585qTd7wH5a7MwaZMJcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461165;
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
	bh=xvXbgKg/bytxqOMppRBWFNSzatZssVm5wM+pwkBAhxc=;
	b=0V8/VP6du1bK8lMFJDbNCLgZS/rnnh59E9G53EMfcWMy16fIBJYWUn7M+lutwpIu+isM
	 y9feMRu8i37gacUFGpJTxEdW5b/EjIGZYYV3hAgfodwMW4ySL5Ui/jEs+K9wyNw2YbHfz
	 esd5G4vHl1jEF8z4SQQUZuijyIdjHvER0VEfNLhRkLfiSiblAF7j2J4zbrRIJIy4sOiYL
	 55tJcznu7hK3X75lYU31Z0gYlpTUvx0oq7qK6bM5UegA9GN4rnBuTgPlScR3XbCpxEumw
	 2ZAaJoCGAb/hBo84AHtqK2XTrG7dRWERa+VrUQro7qlD6RcfozsPKYGpXg2ZBhHTWwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d19q41BR;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d4hqBZmj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D978606A31A;
	Mon, 23 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D978606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d19q41BR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d4hqBZmj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795461165; x=1826997165;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=42wSJXtawkM+yAA6AVNn6dye9IcZdOJCyrHre2XFs74=;
  b=d19q41BRjyMwgX1Umt/7YDMuVKQxT8W+IaDArADVP7UNMme0WX/QE1xI
   57j9BD6sbtd8nLrIWBIfuBy/c1arw/HvaZfVbbXQ1AJ/s2B6VoohR43tU
   kXFIia+147NTSm9BOTNIdzbM6de4WAx2JnCHUB4YKGH043mR9d1S1xlkC
   uRkdEaWagyJXIBh5Lm8132V/Cu5M2z/T3+e0ZZiwMw03aTYFAgD1DoGBu
   2xzky1ZGmTphvsZNeAtaTsEZ93HdnMA7tJWmgoMVQPwJjMcKdjMjFJ849
   k72uREUigg1deuE0/MSGa4ArELkDNDLt8uAg4RL6PxIDRraQUUDxXPrhK
   A==;
X-CSE-ConnectionGUID: v+kmjao5S22w6zF1lN4GQg==
X-CSE-MsgGUID: FfdvbrhjQcKXGA3YmCwONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4179169"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4179169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:12:44 -0800
X-CSE-ConnectionGUID: XO4aPeQZQJyyRhxMqv8uXg==
X-CSE-MsgGUID: qc29BDJhTwyhdbFVb6SBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11328806"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:12:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 11:12:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 11:12:43 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 11:12:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icEo7OpA68DeFZYJVQv5xwytd8gkkVLMSLE/Nydx+7A5MeGkd7pA3/urTd9sCEKt6+95U9Z9a5jTZVZ+5OUxUcCS4HUQ72GKbZlwhvvDH8M+9wUGnCS0UbJhxjOfob8Gcgb9sUNCtBZ7UX5ilPz0KMpT7lsAfWi9ckHM6eRf8HT/Ls9dvGgVFEizHgB08rvEAY5brGDLRQ1Nmm4ck5wPUwo3hSzqZCoJAXUQUurMIMwrw2PpQCGowtq/RGnB2ewYiQVh2DuF5MDHNA1fOy9eRFCV6XlgqxJb4ARX1yvLVCU+5Vh8jC9yumqpaoSj7iWu8eIkFfRNp+Bcj73msyuLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvXbgKg/bytxqOMppRBWFNSzatZssVm5wM+pwkBAhxc=;
 b=fQRMqeLkC1Af09QW5W6n8QwAjWZRHZJ9n2RSBbTbkn9PTFZpff+9w7D1fsJ5WGggLvs3LU9nvMdN+C/Mrt3dYGDL3OWpLpjaZ6bBHTe7g/8OqQBG8PXsiDNcayXtSe75QN5C05GtOWYbAUmK5aopwz81jxSiq35v1OOzpJKUNAvkXcpshpvDOPAgnkwXHWmNLsDSA/JP6eYZSfUdI+hX48Z4Gaqn+znKQothiYn1XtlR8WKRkKpS2guDh6S7B88mb36Oj5YzUbjYeyghipE3CoVxfXGPdfGU/7UE8eGHcshjr0waSQICqNlgwShRGnSGGm6vAEEgiDBNls13M55N9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvXbgKg/bytxqOMppRBWFNSzatZssVm5wM+pwkBAhxc=;
 b=d4hqBZmjqmIdColoa58SVtNK5VeRMQcnvtZ0l+QJv0ByMnkJboCxDVOep0cLOcpVBtaRPAohVdWof/jt5pV4U9pNZEmX+yQ/z9X1MGhhQieCAimDE1/ofVfdPmrOT/Ilz1UPB3nUjYwchrM65bFWzPM9B3ZZ+SfGF84AErsStxw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 19:12:05 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 19:12:05 +0000
Message-ID: <2f8cb15d-0aa9-4eea-b2fd-0561aaec7531@intel.com>
Date: Mon, 23 Nov 2026 11:12:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net] ice: release IRQs and rings in ice_dis_vsi() when
 the VSI is already down
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>, "Ionut Nechita (Wind
 River)" <ionut.nechita@windriver.com>, <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Larysa Zaremba
	<larysa.zaremba@intel.com>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Wojciech Drewek <wojciech.drewek@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261106171657.583713-1-ionut.nechita@windriver.com>
 <cec955ac-54e1-41eb-8a1c-3c4d65cd9a07@intel.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <cec955ac-54e1-41eb-8a1c-3c4d65cd9a07@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To SJ2PR11MB8451.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be0a4e7-d20c-481f-7edd-08df4995a98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8UMewrMTiRkOhe1Tv0Rq9VqL5pUEwA3aB+dNsI7CrJEpfiEKhOAi/SntLGSstWBDwQrMg0uZBlGh8vX5ukeaBKsY+sW2izOlU5K9z1rmmYGBsuKYi+iwhAGcUOZ2zrDq7uf6F3qyrcNaSJuJoekByTkBvIfNgoCO1CudrsJZ3csgy+Qn9kc6dU1DCo03buQCo7aVVOCpAid0oDCPuIDA0a74JEZExhtdPfTWC28ZhEB0/z6SgfSlRhyrffksCDWT29Q/Iouk5Eo8mPIZ0HL1Bin9iNQ7IfHWXNTlrT0W966xDl1Sy3On+hLwiqT+FCpnmz54iitr+CGh/CygxqhtNDYv6aMl14JRVHARjYzGMeIowOlrRY+2IdXN5n1+z5PnMSw90BDdeCNVx5bPWsKl6V7R9Le3WtvB4h2+N58oQhHM9lDcLpwnJg7+GNk2Kugpz9PEr2JdPpmoiAB79Fs/h6jsc0PMcZAFhQBgz6T9PnKUd48BsGCcg9i/F3REsS/Gm2VNiEObEZnJEmni8qOaFCjWk0VcZpReq1Nj5tfTrO6pqaxSibsfQB+XhBJS3AguFpiP53Qk2BMR7tLvUASp2D/xgekvfVNW/D6MdifVYJXPj/dSP9xQ6aWrRzutpdo+didKDwz85G5bdqSZ0O0+AIbbjwd/4Cml0AOQNZMbRpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZsWm5Wc2pucEsxVmJIVEZuRURJejNubmxjcS9QMXYrVyt1L0hrY1ovUjRK?=
 =?utf-8?B?dmt4QkxuOWVJaWFyT2hqdVlSLzVNZ3QzVTNCZjFFMGZzQm5DSHYzRXFSb2Fr?=
 =?utf-8?B?T1Bjc3hFdXg0d1M3aVBUSlBnQjFXeEd0ejdYOXBtZ3dKN2FSVHBlL1lyRVh1?=
 =?utf-8?B?QTYyY3d4L2lQcUYzZmNWMGNNbUNmMWNmWUFOUmZzUHpXOUlveEZLTzBYRDVa?=
 =?utf-8?B?VEFOOTB5U0xIZlZwWUpoTSthN25FaThBRWNXbEduMnJFME5RTTdZcG56U3Bm?=
 =?utf-8?B?czdQYWk2M1pRbFpRVjVPRHdpcjl6WkcvOVpBQ3FKL1A2Uk5CeDQwR2oraHBi?=
 =?utf-8?B?ZjVldW85STlvejBBMUdJZ1JqQmpsSTJPVTk2bVQrRlowcmRYbzNmTU5ERlhE?=
 =?utf-8?B?S2lndmdOYXp5c0dDck1PVmRpMWM0d2tLYVlGUmNHYWY1dll6bHlGbnRBRGhv?=
 =?utf-8?B?UlhxaWs4akoySkRMNTBLRXBNTnBNcENOcEUyMkxyVlpic0NPOUo1NGF5V0hO?=
 =?utf-8?B?ZGs3ejVXRlFEQzhHSHpPSXhwMnZJVWhKOXRpVTBqUHdSVTNJbUJBYVUrQnhs?=
 =?utf-8?B?NXJ1MFZmTXZRUUZPV1ZoSmR4b3VaRGpFUzBKeVEyWjBIM3JMa0dSQW1FRURV?=
 =?utf-8?B?Q3ZUaG50N1kzN24vYWozbjRhc0hBeXVqWlA4bS8vU3NPVFBYRWdDMDlaY3E5?=
 =?utf-8?B?Uzl6YjNBZkZpMkJpVUtCRGFiV1IvQUJRTnZ2WnVXUVllbEk3VmdOam4vS2lt?=
 =?utf-8?B?ZjdRT2JSNkZiWktEUm8xRGZwSmthME8rdzNkNUdiSGVySXhOeUMzbjErZEZC?=
 =?utf-8?B?elJzUHJrS3VudUxPalNoQXhtNVdIQitJOElSRkY4WFk0YXdVOXRjOWVkR3Vv?=
 =?utf-8?B?VFFnc2NkYUdtdk1nWFpySVJ6bzVZOTlNRDBqOTM1VFRaZ0w3dXBRTTAvT3Zp?=
 =?utf-8?B?SkZnaUtPeXVHZkZJa1JJMjhGdDkwNkpLcU5DUUp1dUp2WjNuUEttRXdwdEdi?=
 =?utf-8?B?R3ZNaklNSVhVeWJQUXMxY1pDcFRrcDViL3ZRdSttWTVGQnlVM201QXIweXd0?=
 =?utf-8?B?WWhTVk9Db2J2aU5zYkd0WkxOcTZDdDg4ZlFHLzl5aXRsS3pjSXBmKzZIdGwv?=
 =?utf-8?B?NEtPRW5COUY4dnFTeE1zWDJKdm91M2ZISk9DenpISUY1RzMwRzNtd1VHdHVS?=
 =?utf-8?B?OXQ2dDFTZmEwU3M2RkVGQWdDZFBOUkRiZFlWVUpRQ3FlQWUxYURsekhtemhL?=
 =?utf-8?B?dUwyOExvdlU3QStOMkJMWVFKa0dCc1kya1NyaDBDckFiZVFSeVZjM1RsU3pX?=
 =?utf-8?B?anhaQjJWVWJhSFpmbFZabDlMcFBEWUxya2lDQWk1V2JFcElrdi94NU1lWWdo?=
 =?utf-8?B?WlJNOTZMSCtOS3V4elZBOGdFdUQ0RDJaQkZxd29TQXg2Q3hWQkdzVzF6dVlJ?=
 =?utf-8?B?ZXJrQjR4Y0RUbktWWDlXT0JiMlNOVFdjemtXUk1NUkxnR3lLN1BXZEw2bnFC?=
 =?utf-8?B?TVJOMjR1S1NpenE2dkFZZ2dRMktTY2d2d2xZenE3dkJnaGRqcWVjYWozZ3Yy?=
 =?utf-8?B?RkZpMFNObW9wK3A3Qzd6RXVGaU4xeUplUkZvbk9jYWMyVER3MEt2aTFNalFp?=
 =?utf-8?B?aVZCdS9OOEVzRWw3bng3Zm9uZHpnYlVjMnBZd1VqYU5pMEtsbmx0aTlIMmhz?=
 =?utf-8?B?QVFPZVp1WTYwdW9kQlVMaFJVREQvVzlLaGlzMnFUck1jK1RnOGNlK1NBUXZ2?=
 =?utf-8?B?OTJmcXlyd3MyalB0R0EvTUhtUFNGV3owQ2ozUUo5T1BpaGQvYWMvQzQzWmpU?=
 =?utf-8?B?bVNHa2ZIV0F5K09mQnpkc2lUcGtDZUp5NEJRc0tJRzB5OTh2S3RacFZ4Nmxm?=
 =?utf-8?B?NU9jaGFWSFF6ZGtCTmVPcTY5YnZRZHV6YXRFbEQ3dzlGQUxscnI5Zlp6K0FK?=
 =?utf-8?B?RUJRdTQ1Wm0xSE1nVGpTeDI0MGE0a0ZNaHpaYXhnNlZvQU1vYlNSZG5lS3NC?=
 =?utf-8?B?cHVjb3luYnY1YW1TTXRhRUFwc1JFSFhSM1hlQ1BUSGkwOElvQ1Fad2hQc1V6?=
 =?utf-8?B?QnVpb1RWUWxicC9tbDNSV255NXlSSEVVZWZpV0x0YlpVTFNLcVpxU2tFblR6?=
 =?utf-8?B?NHQ4b3FrQjMraTYyUGtRMFdTdHIvRHdCVDJaVFhYcTUzcUtnYWlLOHVzZnJv?=
 =?utf-8?B?eTh1UW9SbGxEOGZMSGZKMk9RMXE1c2hEcVNpTWVHQ1B1TTY4aEF1MHB4dkox?=
 =?utf-8?B?b3l1aFlJMk1RV3hFcG9mSWV5ay9sd0dSSmdJMDNQWVYySWNpTW1Mbnh4M2xG?=
 =?utf-8?B?LzNtR0Zma21UNEFqUHNQWnFkOUxoL2xEREp1RzRWU3E2akE2SDlUNFdlWXNa?=
 =?utf-8?Q?HuMCvj0k+FMgFVv4=3D?=
X-Exchange-RoutingPolicyChecked: DKkmCxeKMOWNtEBYFH/RAsfn67NjTFaTG4svYJ2esnhudeQ11LWHRK7z5jzTI63vlUDsgwZPeWoVdliwbUrUp56hCqQJ10jOt/eQhvD1CMsaM+pj6o+gyOt0EbPpYDe8gysOvkq8/uvc8NFrJVQF5lgO1Y2MSlTnfkNcjZet7QkWMwpbK8b008NhiTh3Qe1F0iv+26Y550XDF2S0JnBnvApgALwdCkv4Rwa9I//8stqwCbu0fTAxA8ZeDfMDl4cvD/gFyxByNXyYLnkcZtx7B40M8jgSpnWookgcWo5/+b2mRYGY4Okr2kTnSpjt/U1NpTS/grP/dNddbpFv9mOylA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be0a4e7-d20c-481f-7edd-08df4995a98c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:12:05.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTDTM9wIKC1dCRzYPH1J8eyAA/sIbaBKGkywu92O4QtpL3Lt9g2dTzieTv7Atx6lski+P/IzFXmFHlhhDmUkT2WplLCTr7AWXPxtQ3i3odA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-OriginatorOrg: intel.com

On 11/23/2026 6:15 AM, Przemek Kitszel wrote:
> On 11/6/26 6:16 PM, Ionut Nechita (Wind River) wrote:
>> Fixes: d8c40b9d3a6c ("ice: check ICE_VSI_DOWN under rtnl_lock when
>> preparing for reset")
>> Assisted-by: Claude:claude-opus-5.5
> 
> this tag is overly specific, please just use "Assisted-by: LLM"
> 

Didn't the policy change to not even bother including Assisted-by: LLM?
Checkpatch complains about an unknown tag anyways.
