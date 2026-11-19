Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111639;
	b=dag5heyLaNArrS2XTo9mlgAvR0mqxi8J3ocPGYUduf4/5AtwXtjCsPhBveILoTnX8ehk
	 XaozRhopmFpDFpMwTf6HaQyyQ04Fo8Zh2E7kqh9Iih33IOQZ9p/0sFljXvYsHfexLldnt
	 hcJ2HnwHh6lB2Q6ymZi5wz3fIUPdn2kNhFTT2lA7RxLYKkFMh27oNpSut41kBW0goCrs3
	 TlYSJ5NxedInf0FGv0Z9NwJBkFdxkDDsJrTX0eqjkQnbwaN8VFgYmpLQ/iNCI3Xu6y37v
	 5HhHMD9XXzHqvYlloRcsZEc8Rx+zyzumcKgWq+gi0vhdWX3zVki3uwTtLJk+TUobPnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111639;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
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
	bh=l49Hr7i3VXc2hFmvRyrkJaCWOVt3UFj4rSOmK/7qguQ=;
	b=kJ1NmqC6eLhYYrWAc8+mrkijBgKwrYgU9dRLuYHEJ9+aguAqxKPj4jHsNIBOUKLDi/1r
	 10DykRsyayOpeErtra9SHfIgWv4pHjYkdKcbF8bfi9CDDdi9FUY3m8ichFPrbpewtbOZx
	 5tuEt2YOVKh4OhWmKfhIGjIh8r1ib12Rdu59traRgVLpe1jdWk7g8gz2olNuGhsL3F31K
	 unsFWuQuhqMuv1sbnt6gK1jdvI0S+uL5GUD9IuLGXzXvzDM1yJ+ZGYMmbEMHqQowJ2unz
	 J6eiGdZiRQBbslKervKFLI3LPMcYLUg37sYmg8YHuX79EzHl8U5jQ2F3/vtpal9WR2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eq8m8SQ9;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=C4JlPPmK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E27606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E27606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eq8m8SQ9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=C4JlPPmK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795111639; x=1826647639;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SaHAxOpcXeJW+Bv6tQlj+YSvnUA/O+s22a22AnWwGwc=;
  b=Eq8m8SQ9OuPHBMQUaQwLtsGnukwtlVGW27vO5zHEGHlgbdlPwj7ePws4
   9qEjcTxZfZmTJff2fe4TC/iIQtuShyXBt3oRGvSRBXOROn6qKtUNi6ffU
   gzTCGLofkftIN27+MJ4J0cZbYoQ7bsSrlVXah3Js5y9p02hSa+96dOv2w
   +LGcFQ4x/GzCAi9gqWwLHVHKTmwL7G4lt1GKOyBPJoaQc3G/8TM80B6DV
   Z7aYIFf46bzjxHFoWYIYcnCM2TD2x9fmg7/K5wGICE3PiDjlJSDzKoMeq
   deSK4kGqMcit34QupREJmuozEQcczZlniLqIhX5t/F4VHzCKWilioOrT/
   g==;
X-CSE-ConnectionGUID: sXLgEoueTLq8hcnrJY18Ig==
X-CSE-MsgGUID: faNK0S4GQeOVRCy3ZIBVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4001969"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4001969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:07:18 -0800
X-CSE-ConnectionGUID: 4WwBlHLxQF6l8YOTiDp0JQ==
X-CSE-MsgGUID: vVXZ3oYQSXm3QoQ1E38fDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10401073"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:07:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:07:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 10:07:16 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:07:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1tKPjB6FeAdUwGBiKmZR85YKYvbFKGBycvq3tdsD1kYFY57HOR+5RY/sXYIgw5PEugvluObbepOu1CvXjYv969nbEi4Gn/CX/vbzVLC8zfRbowUhGvOIWGXGCZss/9HR8fXwHZjSQMpmghR87WWiQBwR/RYuD7byLJtIxDLu+gutb3c1NKMkNOl+szsCt0uBq2QyTdNqg6eBer/Js7s3WPLJay+l9JqCa5mj8cfcHOr87fZdH8Nno2P72a+eLzxcev/G8tHSjb/+Pofno1n2bfqVRb5FTC0CRBN3JpzDF1O19c3j4lKu76XXl7qVgehuTOHIxt4qt/uqCjyrF4+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l49Hr7i3VXc2hFmvRyrkJaCWOVt3UFj4rSOmK/7qguQ=;
 b=e8vWst8M40g8UEFB7I/+P2lUq4fZxwFatrhFD840UEN3N+luyXZh4R+G4FNYsJGjTa5GRGf0Jyi8hA/RGq9ii2Nza8JrGhb2UijMGlb3ODZ8jgg6AqXaKPc/Y0hUzyRH61Q8gKorm7mLiLl78u00niYcvk76RsBwOTv1mb/u8D7Uk1Wv3svegEDWibxyevWRTdxyMZL3yB1JbqOTRGYasBxrn8aBxlSFrhiOe5AUuy1ijqMzHe2APZlpqpFhdv/KLEf2676ZpC2IMZA1ZHf/IuX+RUiEKsfdkmV8kfmoFBlVTQFEKzeQi3+t7WsgL5h5JHGjh4bCXueitpI7dfuNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l49Hr7i3VXc2hFmvRyrkJaCWOVt3UFj4rSOmK/7qguQ=;
 b=C4JlPPmKEuLD+nTtjkQkeL/SnjppGL/DxHQd90A3HmT7nuFSIYoUk+8gAC/XdPGIWJPyquOrYUVZ7oKvXhRxFVLsYE1xG2Pt4du5aPFIR+P5bGNRziXSQ+r5SeuZuKp3JpUp6uRxaXQXeO3Z6A06SD1RgQ8bRO94F1qJuKl59m8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 18:07:13 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%3]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:07:12 +0000
Message-ID: <fe1ce4cf-3400-4a87-8e46-072563f8fe9d@intel.com>
Date: Thu, 19 Nov 2026 10:07:10 -0800
User-Agent: Mozilla Thunderbird
From: Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Jacob Keller <jacob.e.keller@intel.com>, Petr Oros <poros@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson
	<magnus.karlsson@gmail.com>
CC: <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <edumazet@kernel.org>, <davem@davemloft.net>,
	<andrew+netdev@lunn.ch>, <horms@kernel.org>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Marcin Szycik
	<marcin.szycik@linux.intel.com>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>, <intel-wired-lan@lists.osuosl.org>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
 <av2syi6lE/Vp86QW@boxer> <f7f1ae2d-a623-4eb7-a178-c618316beaf5@redhat.com>
 <0bb65ff3-2e27-4f2e-aaa3-2b8eb7cda356@intel.com>
Content-Language: en-US
In-Reply-To: <0bb65ff3-2e27-4f2e-aaa3-2b8eb7cda356@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To PH0PR11MB7710.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc64baf-7cc8-40c4-f139-08df4667ef90
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|22082099003|18002099003|56012099006|261021123027099003|261021121427099003|4143699003|261022105027099003|11063799006|261021135927099003|261022075727099003|261022115727099003|261026140227099003|261009223027099003|261026121527099003|261102123227099003|261028144727099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: MZAWRZP4Zgo7RmEis/zB3Bg/EI2mN3cGXyvu+IUgGTCH56HKADpIaxLklHsizfsIHnujiBPa0du7z8ChE2B0moR/4KybZ2LAg0tiO+YjUS57s1EkSPw/2wdGQhn1UuazzP7N8xxoeVUzUWAcUaqrayijAbK5eL3/daM0Qn4SZBMgBE+lDRklytuVyQEr/Nb8rMvj64PY9k61g63sSrZCCnVkMuGURf8SiQjUGOGLwTrovXtqbQzvoA9lO49JsNkH0Kv/FDxEh4djFwpmTC8yLK8dUjxunX+3Y0CYUF/AXv3mucfN8NNKMEKoLdO786WwFSNC4SQ6Ye0TYVMPn9WR/GMQqQEfUHFI0JTDSjx6/COWbjWs8HD5uiDH3U3Mqoz7A2EDCHUvwaIIdoMl0Gq0EVNO0Ngh2z0rimJLC72ApFLSBesP31iVbs6UDGDAs54sFGPkiXon0+sNAOyN/KuYMnwKS0UqFrF25suj2eU5rGD73jWQAcLtwWhqPqRhzqw7ZneDHl185vNPqulZPgePRiqSvvl68W0MgRUBmM45qVYN5QY5GgQnV5MdvnzL26MseRdlHQ1sNQppO0LbyfG9y5i3nl8LdGNgW7+cznDlcnOJu32UAiEBtwh/yZ2pFOEy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099006)(261021123027099003)(261021121427099003)(4143699003)(261022105027099003)(11063799006)(261021135927099003)(261022075727099003)(261022115727099003)(261026140227099003)(261009223027099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZhNmt2eXBhTTd4SGFZM0RWbUlZMWxpRDFaekRoeVFrc3p5VGcrVmQwZVcw?=
 =?utf-8?B?MG1BanpaSTU4Y0Y3S0JLaTBPNkxncVpFV2FXYytCOGxHaGIyWlg2S3c5aGlP?=
 =?utf-8?B?NWJYaDROK3B4Q3c4a2xFQ2gxNG4rNHA5Q3hET2hPbmhKdVN3NkRqNWlQdEhr?=
 =?utf-8?B?bkZmNVpoSnlnejZ6ZVZIcVF2NUkrclI3Z3M3aEdXQWg1OHVOTWFPUnR4elI3?=
 =?utf-8?B?UlJ4eTdBalZieG1vN0grL09McXhFaEJyTnBiMXEwM1FKSVZNTGl0ZlY3OFk3?=
 =?utf-8?B?NkpQZFRvTGZkNFUyV3dBOWlCcERDSHZYQnVUMDE3N1BZNkpNcSttTzdEQlZV?=
 =?utf-8?B?cFVjeVhHclBQMkxMNWUwcC91WHJldTU3NDkzZU9pSTdOb0tHb09wUkJ5d211?=
 =?utf-8?B?ZDVOZjJxY0s0WDZBcFhSRlRVcWhLc0JwcnZNeVU4eTF5cFpVZFVscy9tZ05G?=
 =?utf-8?B?VzJuOGNuWUJjN0srT1ZHaFdobk9jVXpuTktuRE80dndXY0I1U3F4bTY1U1Yr?=
 =?utf-8?B?ZnlRWXdFVXp4ZExNYWZpVjBNR1ZtaERJTmhQbW5lcW96aS95aCtkemx3Tm9Y?=
 =?utf-8?B?ZjFGZXFmNW5VR3U4Tmt5dHlCSnFOQi83dElmZEgrL21SdlV5VUQzdlJPMDRS?=
 =?utf-8?B?VGViejhUWGU1RUhBdEZ2a29ubWVKZWcxUFVIc0lRODA2UzkrTzdhRy90RUI0?=
 =?utf-8?B?Z2QyU2M5YlpTbjQwMDJ1UStaVmZRTHFZRFJYTGpxVGdWdG5PUnhEbEc5OVFp?=
 =?utf-8?B?dEt0VEpUUW5iK0tFWVdNS01DOEtnOUtFbDEwL1NheXl1TURJcEYwVlhXem1W?=
 =?utf-8?B?c1hFYzIra1I0R1hDTElPVEd4VjJPZUhqSktuWnM5R3lNbnRDbjFTMWFtOUtU?=
 =?utf-8?B?WGE0VEJBLzFMdTJDYXQ2OXg4aENFdjFRdDRGTzJpQ2Faakd0eG9ZNU9kZmRv?=
 =?utf-8?B?YnZmWmJMT3VSbytjalZ4cEVlRkVsVDlaNXlGWG5oWllFSGZYZGxvWXZUWGM0?=
 =?utf-8?B?SExQN2plSDM3WndUeEg4ek9zWTBLbzBLNDdES3gvTVNNK2N5RzlIQ0pJRmNq?=
 =?utf-8?B?eU9IU0UzVUZJbjNvYmNySTFEcGNPYUw2TU9ncHNyVG9SejVUZ2dVckIza0FC?=
 =?utf-8?B?dURld1ZuSnJHVXYwaHdtbnRXWG51dFF1N0NZT3FsZ245QXVUZ045NzF5SmlQ?=
 =?utf-8?B?Wm5mRGdORXNzbDhEenhJV0lqRjVuckJQVjNVV3VGQUlQamcrK2RpZU9kL1p5?=
 =?utf-8?B?VkQraGRHZU14dHcvTHFNOFFTRkR0MUZ0SFFyQ0lnUzFUbFNUOEJJeUl4bXA3?=
 =?utf-8?B?RUJ2MEhHTDZjeFRLK0FEaHNXRDhlbDBSMW1WMWk1UzI5bzBQNU54V0VDT285?=
 =?utf-8?B?dHFsOXVPamUzMDJ3TDQxS0VndVJ2bEhUZnhuSGF6SnIySDBQNE9jYlh4dmph?=
 =?utf-8?B?T1FyeGVoSllxWmlQT1FNVlk0dWM1RlRUSWkwSzRXR1QwYUlZbmQyZWYzN3My?=
 =?utf-8?B?ekFydGJwZ05sTU5mS3crbTlwNkJMVWMyQk5kejV4N3lQUjlPUm11SFQ1Zk5h?=
 =?utf-8?B?YjNiWTRaYkRwRlErRWUwWkx6VW85Z3ZjVXVpb0xDMTRHZFlBSzdRMnMvby9m?=
 =?utf-8?B?RnRyZnNaVXIwR2lCSjIvQ0VHRGwyUnQwTXJ1MXdhS3diSXZQNUJ1SzJCS3Fy?=
 =?utf-8?B?Ukt1SDVDZmhDU2VzSC9NOXdWUlZCMzNYQlpKRVBhUzJ3K0sxVjcrNE9FbDg3?=
 =?utf-8?B?QWxxUzBzdzJtd1hZOVB4QlZqU1M0OVhxdGlaKzRMRW5qdzVEV3hpWmRqQUNI?=
 =?utf-8?B?WkZpNzNQVUtmZkU1VmI0UUM3YkNEbXdYTTBTaml4dmx2ZDlyVXhTTG1hRllK?=
 =?utf-8?B?Y3h1aHFrckdDemUrdXB3TDltZEJCUWxCTVFYdEZGeTNIeTdQWjhoT05TRVht?=
 =?utf-8?B?RWZsVVdScUxIWFh4ekRaRm1ZU2ZYZnBsUzJhZ1FoVnFTVzJxZXJFMlYwczhL?=
 =?utf-8?B?aWtuRmhtSnN4cjFZQWFyWVRROFZWZ0xjN24xOW5Jc0F6Q3FYWXFtUGJjMmt4?=
 =?utf-8?B?QzF5eHBiWjExRVhxcmQ5blord3RmNlVPMlhPNE4xZisvOC9SWEZsSGxLU0RW?=
 =?utf-8?B?SUk0OHFscHpKMmZsTWdBRzBscEs5YVFwZE9iWS9ydEQ2ZFE4aDlqc1lBMGdD?=
 =?utf-8?B?MmVJZXRtZ1krM0NIZDFUQkNWc0krNlNLZzFxckVNMURtZjc2SGx0QXQxODBL?=
 =?utf-8?B?T0pSenFJOFFYbE5nR1ZNUVJTK0hlaDVsc2dxZjdIN01TVlUwdjAxbm5xQXU2?=
 =?utf-8?B?Nm9VemlYVUh4L1haTXVFWS85VlNqNjZSWGZhVGMvZHNXemQ3N1NpMy9KalRs?=
 =?utf-8?Q?rn0Unw1sg1LhQ3Sw=3D?=
X-Exchange-RoutingPolicyChecked: NSE9mDRWSNHEaz3Bw6cnai79OrMkQ/9EHZ61keqGk94dOYi3TyjjYsvS54p2BXboswCuiGWmjt0D0kuZdXgO3HwVtTFdsncxQAjcDaiBa4BBiocq7w+GEAGxJFgqCidnPZJqt18RkCMAy9cgqAYje2p/G1nYVU7sSlUKyfxzqKICT8DmXP4KwA99PmcQ7BkfDb/RoUaGRav2wjOmNTkOgB7K08w1JlkFISUHKrL5e528YqUY8JgTAfSsxr0C55RZjynkmtC9l0KLEFjgD4V/YDCaDoMq446vxaNBXzAfPXfmCbqqmo+hhN8tOol5wl7wwcgemsFigTBpm8Y6YaPtgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc64baf-7cc8-40c4-f139-08df4667ef90
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:07:12.7279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VALWz/12LscuZ0oe+CRwuH4fjHlaX1KxwYhQT+LTa0ys+qxO2ckuSt8orLvSCzm+YOtP8VUx7puKMxbtJOb2hf+4xVm8AmHxeYZ90fLiVJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com



On 11/18/2026 3:00 PM, Jacob Keller wrote:
> On 11/18/2026 5:51 AM, Petr Oros wrote:
>>
>>
>> On 11/18/26 2:48 PM, Maciej Fijalkowski wrote:
>>> On Wed, Nov 18, 2026 at 02:37:06PM +0100, Magnus Karlsson wrote:
>>>> On Wed, 18 Nov 2026 at 13:00, Petr Oros <poros@redhat.com> wrote:
>>>>>
>>>>> I think this pull is a good moment to ask how fixes for Intel drivers
>>>>> should flow, because it is not the first time a fix spent months on
>>>>> intel-wired-lan and then hit a wall on net.
>>>>>
>>>>> My patches 2/6 and 3/6 have been on intel-wired-lan since June, v4 on
>>>>> July 8 [1]. They were reviewed and tested by Intel validation there,
>>>>> and four months later Sashiko found real problems in them on this
>>>>> pull. I have a v5 and will send it once it is tested.
>>>>>
>>>>> Jake's E82x timestamp fixes went through three pulls before a part of
>>>>> them was applied [2], and Maciej described the same loop on the i40e
>>>>> pull in September [3].
>>>>>
> 
> Part of this is that local Sashiko runs do not seem to mimic the same
> results as netdev Sashiko does. Partly this is due to lack of access to
> models, and possibly differences from the version netdev runs. I am
> still trying to figure out how to get our local setup working within the
> netdev fork, but haven't had good success yet.

We are working towards trying to replicate Clashiko results. I heard 
recently that we have a Clashiko instance up, but I don't know how 
similar the results are yet. My hope is that we can get something to 
better replicate the reporting so we won't need so many revisions, and 
time, getting accepted.

> My series ultimately blocked Tony (and myself while I was covering for
> him) from submitting anything else for *months*, due to its size and
> scope. This is the result of the 15 patch limit of outstanding
> submissions. Because only Tony "officially" submits work to netdev, all
> of the Intel drivers are limited to effectively 15 patches per week at
> best (assuming 48 hrs to resubmit a new revision after feedback and
> needing at least one revision before being accepted, which seems to be
> the case these days, if not worse). This is across multiple supported
> drivers including ixgbe, i40e, ice, idpf, now ixd, and the client
> drivers like igc and e1000e.
> 
>>>>> I know Intel patches go through iwl and are not applied to net
>>>>> directly [4]. But for fixes it means that the review which decides
>>>>> happens on netdev months after the iwl review and validation, and every
>>>>> respin goes through both again. And if iwl stops cross-posting to
>>>>> netdev, as Jakub suggested [5], Sashiko will see Intel fixes only in
>>>>> the pull.
>>>>>
> 
> Yep. Right now we get reports from Sashiko.dev for Intel Wired LAN but
> these only seem to report a *fraction* of what netdev does, and my own
> attempts at internal reproduction also fail to reproduce the same
> problems while consuming a large part of my allotted token budget. Using
> the larger models sometimes helps but rapidly burns my available budget.

Yea, Sashiko.dev runs on IWL patches now. Clashiko has not not run on 
iwl-* tagged patches so there is the same Sashiko review coverage with 
or without cc'ing netdev.

>>>>> So does the iwl round still make sense for fixes? Would it be better to
>>>>> send fixes straight to net with iwl in Cc, and have Tony's ack and the
>>>>> Tested-by from Intel validation on netdev?
>>>>
>>>> Glad you brought this up. IMO, it makes no sense for fixes to go
>>>> through iwl and it makes contributing fixes (or new
>>>> features/optimizations) a lot more painful. Sometimes even to the
>>>> point that you just stop contributing something. I am not in the NIC
>>>> team at Intel, but sometimes I have to do network core work that also
>>>> touches our drivers. In this case, that patch set goes straight to
>>>> net-next (as iwl cannot and should not take core patches), but any
>>>> driver fix that I find on the way needs to go to iwl-net so that it
>>>> can go to net and be backported. So the fixes that my patch set are
>>>> dependent on and that should go in first are instead sent to a
>>>> slow-path (i.e. iwl-net) and after X weeks/months appear in net and
>>>> then net-next. But my patch set in net-next is dependent on these
>>>> fixes so I have to either wait or just cross my fingers that my new
>>>> feature is stable enough even without those fixes. Not optimal in my
>>>> opinion.
>>>>
>>>> So anything that could be done to speed up this process would be very
>>>> welcome. Sending fixes straight to net would be great. The validation
>>>> team could pick those patches up from the list and run the regression
>>>> tests against them, or would that take too long?
>>>
>>> Regarding providing Tested-by tags, could we lift the policy where only
>>> Intel validation is allowed to bless the patch? Nowadays with AI regular
>>> dev can spin up a nice pile of tests by themselves.
>>>
>>> So if you send a fix and you can find a peer that will test and review it
>>> for you, I don't think we have to wait for validation folks taking
>>> care of
>>> it if they are swamped.
>>>
>>> I also don't think it would backfire on us and we would introduce some
>>> bloody regressions, given we have {s,cl}ashikos in the pipeline.
>>
>> BIG +1
>>
> 
> This is really a question for the maintainers. I suspect that they may
> not want to increase the number of submissions. Checking now, the
> netdevbpf patchwork is already at nearly 1200 patches waiting, with the
> oldest being only from the 4th. By contrast, Intel Wired LAN has ~300ish
> patches in the queue with the oldest being from March 27th.
> 
> Personally, I'd be happy with anything that increases our velocity of
> getting fixes out. Frankly, I'm very frustrated by the run around with
> Sashiko AI reviews. I do find that the end result has been for a higher
> quality, but the delays and difficulties are straining. Its completely
> understandable that many other contributors have pulled back as the
> burden increase.
> 
> Part of the problem is our own mistakes and legacy of poor driver code.
> As a result, we're accumulating more fixes than we can submit with the
> 15 patch limit, and this doesn't seem to be slowing. The rate of
> acceptance is certainly not going up. Plus pretty much every bug fix
> I've worked on in the last year has come with 2 to 3 other "side quests"
> reported by Sashiko that need investigation and development.
> 
> I'm not sure what compromise the netdev maintainers would accept, given
> they have already repeatedly stated that they're flooded with work.
> However, I think Intel Wired LAN is nearly at a breaking point given how
> long fixes sit in the queue, blocked while waiting on other priorities.

As with everyone the number of patches we are getting has increased, but 
the rate of acceptance for us has slowed causing the backlog to continue 
to grow.

An idea, but this would still increase the queue for netdev, would be a 
separate budget for non-Intel authored patches. This would allow 
community patches to continue flowing without being blocked by Intel work.

Thanks,
Tony

>>>
>>>>
>>>> Anyway, good initiative. I am sure there is a solution to this that we
>>>> will all like.
>>>>
>>>> /Magnus
>>>>
>>>>> [1] https://lore.kernel.org/all/20260708125755.706263-1-
>>>>> poros@redhat.com/
>>>>> [2] https://lore.kernel.org/all/20261021-jk-e825c-timestamp-
>>>>> processing-logic-fixes-srcu-v5-0-72289a4ac8eb@intel.com/
>>>>> [3] https://lore.kernel.org/all/are4rBUJO3mzrkO8@boxer/
>>>>> [4] https://lore.kernel.org/all/20260721174642.7749143e@kernel.org/
>>>>> [5] https://lore.kernel.org/all/20260922112216.41e6f8cf@kernel.org/
>>>>>
>>>>> Regards,
>>>>> Petr
>>>>>
>>>>>
>>>
>>
> 

