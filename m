Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787127;
	b=bT+En8jP5yb5EMiN/sSSHZ4MIh1sl7BZkIv5B1DehwrF4LN1dK/Kslt17ZsCMc9CrbKU
	 1KOBvWG6OLWgANlHvBO2BCOziFI47CCR7JCZBh5CDDHn7aXh1L0LZIZwD4fTnwic9jpOq
	 VpPuNzf4P/rtfPEmsQEkId3m/13/eq4WD96TApb+JDk/I2mFU0duyLjROox/p57h4a3dE
	 5UA1GtU3DoMEBzF+uT6IZXRyBd443tevfqb9xdYcodFhAH2G3BUcYXMB6w8PGnCltV9EP
	 s8fcnXNQvjfm5J1PEb3lg29VOZjX46Ozfz3OvW8+TU/9JvsKjnxCS591ptQ7xOQGlWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787127;
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
	bh=QVE4/DfAodPWdrZ8HCaz2k0HE26vQvOrrfdXfmqNy8U=;
	b=o1T5SxkY2eeSIJKut30gkhFkrsc6TjEBiVkBk64pL1N4imtTgoGCIlOJ7AfBZzuMjVQY
	 JFTXmIj+kk8MOg7q0yeAiWuAInof5ZuYOv6jG/MzL9M+ZKxCACMmyTlO54iVCW/KXXnzz
	 sJ09iRObqmFfe6M8Lc8dtOxXN/y4GBjNiVflbHMfikI3swtCRWvdc0olqwKfRjGWkTN+b
	 KEcgIoA/Q2q/GMM/qTQWsEv/dLAIAzva/aVsWFS9LTMZSQUNOeY+a5xVGuoxZDVbti9IL
	 dep7i7UwphCvOMZ1yIlGDpMq5DmdK3aLrJxaPSjRSzzMUDlZjuuxshpUZhjd3sgXdTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hR7XB1Vv;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HpQVQxFk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D64606A333
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D64606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hR7XB1Vv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HpQVQxFk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795787126; x=1827323126;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gHNzhi2219im3RbFP+bL4Fr0GUF606e/WFbOWHZYKEY=;
  b=hR7XB1Vv4nsH8gGtx+vz65iJyJOz3jZAb3ZzkQR9xSw+7yZDPd3628q8
   TPf73iBE96qMoFhBVOoRwaQYJ8iGNs57DOc9Nrb7hGeyd+jOFLbngjBqP
   cNHuylmkjSKTQkVRu3HkxvApovfW1LjhDVOWN9BqtbfmTdLf02aYCk76v
   3YJqv94wTuapQnGeRaYH3e9wfzvOLwIZLzOfyRkpd0/Rn+sfZlkiNZZ2E
   q/6GA2LRCs5kWsOVU9q/9kPtiZ7cVw9T0S8bvz7hv0ZEICqBMW/fWdcZ5
   Esa82tQQDNeOiGx027lwFFE0OKxDSKKJ0qyTUpYPVYxtJ/snRWd+GukPj
   w==;
X-CSE-ConnectionGUID: B0TWI/EbRb+w65R9XH4DBA==
X-CSE-MsgGUID: uhlIIrxnR4SGx5vLZtUCKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4609136"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4609136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 05:45:25 -0800
X-CSE-ConnectionGUID: TmtyBfY0RGmGnYkjZrBnWg==
X-CSE-MsgGUID: 6/JDVI7YTz2LIKGMlxqWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12694267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 05:45:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 05:45:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 05:45:25 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 05:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNZh6Id2yXxLCCaqEufLuyaePNySXsNUgdMQqTP3nO4Zhs2lWufdLF4hHzCyMoxgNwaYw37zQmN5FWwO/avKZoG9HmlR0sIR9h9vkj+FDrwKsAkvx8wdYU+cpLyW9b86ggOWznq8Ry1h6LrhMudTueACRl/+e1quVrSpu/vqzo0hGi+l/kwvQshbbo/utZQMxOJBqyKC9DzNTm4HJzCcyYrl3zEUYTlXaz9pBT/C3jRX+PQ+2NWjTYNZ3yjPziYi0b2fQXdzV+F+hwOzk2QndSBCVn0yaZ1GgWXAMWuqd4JiXTdqB2YPNRq4R1LIbQCvfkccopyok45l0pzpqBtTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVE4/DfAodPWdrZ8HCaz2k0HE26vQvOrrfdXfmqNy8U=;
 b=o6CXCE43/zeKe9NQtICzNjuGmBMFA7PvONzqpafhJHsxQBslbscGWZjACSsD8rHKRk9RVyawAmkZfDtKaa0ON6iOqlWDkHmYBA0wDGnADRlwOw2oDS0OzFywq+qwFMGiw1YNoNE8uvW/tSanuHfMhKYCfHL0SGb7sWAbfbfdyhz3ppxHJespiCPanOiBbeAuyAjNBRPm+gm0sCfKSwodFcDX8/y8xLmBTb+Z2NFxrEHLLdLG/ZYP3Se8u95EBkNCnRVwEl73iBbTVCqvrnijeBYv+Kp3cefSGm9fbHRC6uajHAJyKu/hJXTUJvtpxlxUBkt80ZHdY7xJfflwjizWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVE4/DfAodPWdrZ8HCaz2k0HE26vQvOrrfdXfmqNy8U=;
 b=HpQVQxFkIOjuuCH52F1s57S3bNy+Nz4i1raMH/VnPSc01I/5cckfV6bxCh4AT/9Q7piL3cRMsXpD10ODPdLV45wUxtgHnkZbszLd/dXgack9F18v+gSU2bd9ImZjY2N8X2CIC2zxQY5eDMSYo2vNw4CfqBH5feHK/CoDT91mj9Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by LY0PR11MB123582.namprd11.prod.outlook.com (2603:10b6:404:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 13:45:10 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:45:09 +0000
Message-ID: <489c2667-b109-4dd0-89f2-b0aa6088f0a3@intel.com>
Date: Fri, 27 Nov 2026 14:45:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next 3/3] ice: share all RSS hash profiles between PFs
To: Jakub Ramaseuski <jramaseu@redhat.com>, <anthony.l.nguyen@intel.com>,
	<intel-wired-lan@lists.osuosl.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <netdev@vger.kernel.org>
References: <20261126123114.893916-1-jramaseu@redhat.com>
 <20261126123114.893916-4-jramaseu@redhat.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261126123114.893916-4-jramaseu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|LY0PR11MB123582:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ceac134-bced-4a5d-f799-08df4c8ca6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|6133799003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: cr6OmCyDz2BVS8fpxQA1e3UOGMGMDJQUsRwgiACNueysGggfNyTszIBSFff/88jNdnbQUkV/ABZGcqMUHCcChGBfpETWlOouYpEkPsJlBfqmRJuz47+MNHQanxNKMQTN70rMqOQttZkpi0ZWxickFxXYZApqmx21nCmCbxo+MqiGff3SozppOHWp/09LfS0l1bXZdbToWhLBcB5BXHlHim9XfmDEvvQkuNEwiOYSUnh2qp724BTTIGZZKcWJ0OzARtBTukqVu/WMzJkiOsd/nYDPGANXbdPDeGWp1qUKv4cArfKLBZLWcwDzbJl97o4MQ8GkygR52HAAWz5WubiLnLcD+UTHExEXrFn94I40YI1H6oFytTGdQ7dy4gLwPMHdYUWTPGr5vAl+ANW6IY1+KgwEXcGUvPJa1JnUg+rjkridZ8m2ST4cuY/WvjRx9EdnHd/2Dc/kEAlxAjNSXl4thKh/ND7bCHEeA254l7SrFG88rPYsTI7aP5c4bEe4zNwYMra26gIYlCPy/IdL8Rt1ck5xC0GO6l7W/rN7ShxK6pFy4xQan7zGIWHAL1sUTJgPTEXnP+JH4WdxBrb64dgQGzL0DhsIefNxObseG8aZ9ywMqok8UB8kep06uc3lTsw7MDW4P4HzRrl/vb7qAw6JENp+jKFmg2Ao40TFmH7tNsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K283bDIvaGI0OGJsZXhKZERPR1lNNzJkU0svK3phekNDVmxCWWpLY2JHWjhZ?=
 =?utf-8?B?SWoxL2dRaHMvM3Q0bHVXdTZacWFrSDA5SVM0ZnJaTWE3MldyOFhaalpaSGpW?=
 =?utf-8?B?bXVUTGhQOFR6L2JjOEJlbC9ST1Z2U0tLN3ZHRlBpWnF4MnJYRTEveDgxTW9v?=
 =?utf-8?B?bHQwbWc0ZUhNNzFuREpzeVBVUkl6Um1GZzRieVBac05leDc5UzFFbzNuVG5t?=
 =?utf-8?B?TUZzOWtQenMrVmVZa090MXgvRG91YzZnNjB0elh0aWRDSmxPV1dIM0dXSisx?=
 =?utf-8?B?Q0JmSDRmdVU0R1NuQ1k0cHprUnl1MnBkQU05dCtmQmRKeUxEL1lWZ1cvdzJE?=
 =?utf-8?B?R3RZKzJEdVcvSWh4QlhpOGZUSUJvOG5KTVQrOUlyeDFSaUZ1ejFTbzl0SEZt?=
 =?utf-8?B?S3Z3c2toNDBvU0F0dCtva0RYNzQ2VmpaVDhoZXlYTU8wSFVzZXZ4MzN6V3hN?=
 =?utf-8?B?Z1NWVjZnSzJwaFIvWjhhdnR1eGtDVTM1bHRPOFVtMFVCdDgzOUlNZThFQzRy?=
 =?utf-8?B?QjJ2NHNtMGRoOXZnOWllU2gwWnJreStxQUk4NE44eDZQYWNaS2pvRzRUNkNz?=
 =?utf-8?B?c2tRWjR2VGNlSy85QWYremxkVUovUzAzaGhJVzVjcGZWNytVY0p1Y1ZRZEF5?=
 =?utf-8?B?ODBVN3ZwNHAzV1M4Z0V2S240YXpvcnVFcm0reGdJYUJhZE5Ka1dWY0poWDFw?=
 =?utf-8?B?YUwvZnlMRWpJbmZ3c09JcFMrN2YwK0R4Mmw5L2lENnI4QWxNa2tUaVZGdHkz?=
 =?utf-8?B?cS9zUkQrOTd6SkZnUW9PZ1ZQRmNhSVNteWNVeHBDZ2Ntekl1MXZoRmtsczEr?=
 =?utf-8?B?Y0JrYTlGZFFuTDJLNDhFbG5NWkozQW42UVdYTUlWS2QvWWRjdURaR0lPZUhR?=
 =?utf-8?B?Y3FUSzJXbGlvazduSEZnekVzdjVPa2FvTjgrdjNOY1JTWkwxRWVhR0k2TG5T?=
 =?utf-8?B?eGlHcndKeWVwYy9Cb1pjbTdRUmJjbmliVW95R1Via09NMCtVOTdJMWRZQWRB?=
 =?utf-8?B?aVVWRXdONjhVRXh6Y3ZLOUErVWtDK0dHeFZ3TjFoSkpEZHVoWmdBMHY0ZU9w?=
 =?utf-8?B?Qy9nbW03SlVpeit5czcwSmxZWU5BRWU2WnVEQ0RBM2hpT0VMZDBXY2FEV3hT?=
 =?utf-8?B?NndNNVZuMHAwVGMyUkVDc1Q1SkdtOExubklSWFF5UHEwUlFrSkc1dk5BSFFU?=
 =?utf-8?B?NGdSY3c5NWhxZFMwUWlaNHpHRThBSFdyNzhZR1k3MkhQWjZiODExMzhPOUdi?=
 =?utf-8?B?VUZpSHZUVXlmTjJmRzZZb0ZmZXpWd1FUUWFXdzdFVkcyNlIwMVRGTWZRTjZ2?=
 =?utf-8?B?YXgwdCt4VmNXNE9uQlpxNEZOMTdNZ01KMDNJekNKRHE1d3ZXK1J4ckZzL1pE?=
 =?utf-8?B?Q3VnQ2xkMGlrb09hN2tRcGpxMDNQbzE5dEVRSHgvRGJMTGZhaVRhTGJqUStD?=
 =?utf-8?B?K0FxQ1lRVGZ2dWlPRmh5MnV1UVRBZFU4VnZFcWcrbEZnZnZhTzFOeXFZdXJs?=
 =?utf-8?B?eEtkUDlxSktoc2puU3A5SFQvVmVHd1p5MHhhOUc2dzcwL08vWWd4cVFWMXJr?=
 =?utf-8?B?M0pGTGxCblZvR3dUOWZRSGZZQlZNQmtxdVdWNUZidlNtRWhKTjFtemFRbWtW?=
 =?utf-8?B?bXdiWjFZcE9EZElydU53R1k4dzBWS3ZGN1BmdjNWenVoNnVaWWJvL05hYzkv?=
 =?utf-8?B?R08zSUJINm1iazUxZlFKWlk3YkRBR0pjUnlGTU5jOFRTOXlvaDBWa29wa3lt?=
 =?utf-8?B?VjZOUm1nMXg2MndLZnozWnBSamdrVGl5Q0MvUFNXc3d4UHZFeTR0empUQXQ1?=
 =?utf-8?B?Ymd6UE84TUNIdjVaeFp6anBDNURCTHk2NkZPdGd3R0djOGM3dmdGRUcxc0VX?=
 =?utf-8?B?azhqRVhSUEpsanlkZi9KdllDSXR3d0lQZUllVXZIdWtDYU1WNkwyVnd2Nm5y?=
 =?utf-8?B?UnRxZnJ1NHZEWVZ2a0lOeGlkUWptcGMwcjMzM3IvbmhLcWRkQ2pjZmRLY09E?=
 =?utf-8?B?ZVpzTkxnbzJIU3ovM0NWRDR4VmNpQ0U3MmRoSWJEMjQzcDhZNzhKN3dxRmZr?=
 =?utf-8?B?Sk42Qkp4cTduWnl1NEwxWFFGcVBtemcvNGFMREdZSXcrREJETWFGRnpvTElQ?=
 =?utf-8?B?Ujl0YWRjOFc5azFhdzJkRTVlZzZ0MTgrTkVIbC85SWtoSTlPOVhwZTZ1amZF?=
 =?utf-8?B?Si9MWGxrenhZRTlNMmd3YnA4aWQ0eTkrcHcvT084eHdqRGFocVNIVys0VG9u?=
 =?utf-8?B?S2FKbU4vUnlqRlpOQ24xWXJ1NlRKc3JvdnhuQXdsd1dOeEtJNkpHanJqRDdB?=
 =?utf-8?B?cUtBQnZ6NWlpZCtibS9kTnFOUXgxNE05K3BNK0llSDR0NEx6eUsrVE1ubUR0?=
 =?utf-8?Q?LD8lB/zx0I/6RzwU=3D?=
X-Exchange-RoutingPolicyChecked: RIynbM6EEtmBeB23oO2hA6aYlvUw/ynJEHlhTUAmi8hIaj8zAaHZGaWTaB/1mAHccVHZZoq/J3qU7yFkBhEb1LdqdOe0thyl33L5D/1fhIL9crS8B14Oa0PukMGn0Z7uDBMosMTQBhgCPYsNKza5BEx2ST+kRQzRmYIyTfMoDwwSbc2GFMtg5kqRGPsyf1Db9p/8gPvRuPJ7RZI35wiHzUaMYVgfs8pikbJ+XIef22Bjb1ud4dX7K9Vmx1j1QgOs/Hd+o6fZIIc//H60X77pO9SIsmvrN00NQ7w6RW0Sg2XPhSDQhl0+oPsbkugZL6XXYtRMy/NWhmdifbcHRBeCbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceac134-bced-4a5d-f799-08df4c8ca6f8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:45:09.1879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJdqz7u2S2xsyrHx2RRKqC3qL9zMGz3ECWW1ccAJKeO54zYHhLibaYy0YboY/3pfB38LZM0P4Px+fCt4eLFejBRRi3z3VIRmT7klwZd97ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB123582
X-OriginatorOrg: intel.com

On 11/26/26 1:31 PM, Jakub Ramaseuski wrote:
> The previous patch lets the PFs of a device share the profile IDs of the
> default RSS configuration. RSS profiles added later still take an ID per
> PF, even when the same profile exists on all PFs: with a VF on each of
> 8 PFs, the default RSS of the VF VSIs and the same "ethtool -N <vf>
> rx-flow-hash" settings on all VFs take 4 more IDs per PF.
> 
> A profile ID depends only on the extraction sequence, everything else
> (TCAM entries, VSI groups) is per PF. Share the ID of every RSS profile
> added through the flow API: besides the defaults, the ones added by
> ethtool, by VFs (advanced RSS and the AVF hash enable bits) and on replay.
> As before, profiles using field masks or symmetric hashing, and raw
> profiles, keep IDs of their own.
> 
> The shared flag of the RSS hash configuration is not needed any more,
> remove it.
> 
> Measured on an E810-CQDA2 split to 8 PFs (NVM 4.30), with all PFs bound,
> then one VF created on each PF and "rx-flow-hash {tcp,udp}{4,6} fn" set on
> it, reading the IDs the PFs hold from firmware:
> 
>                 IDs in use     IDs in use after   failed profile ID
>                 after probe    VFs and ethtool    allocations
>    before       33             65                 0
>    after        33             37                 0
> 
> Signed-off-by: Jakub Ramaseuski <jramaseu@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_flow.c | 49 +++++++----------------
>   drivers/net/ethernet/intel/ice/ice_flow.h |  2 -
>   drivers/net/ethernet/intel/ice/ice_lib.c  | 10 ++---
>   3 files changed, 18 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_flow.c b/drivers/net/ethernet/intel/ice/ice_flow.c
> index 9be769b105cca..02337d9d3de56 100644
> --- a/drivers/net/ethernet/intel/ice/ice_flow.c
> +++ b/drivers/net/ethernet/intel/ice/ice_flow.c
> @@ -1444,7 +1444,6 @@ ice_flow_rem_entry_sync(struct ice_hw *hw, enum ice_block __always_unused blk,
>    * @segs: array of one or more packet segments that describe the flow
>    * @segs_cnt: number of packet segments provided
>    * @symm: symmetric setting for RSS profiles
> - * @shared: the HW profile may be shared with other PFs

(general rule)
avoid trashing - please structure your PR in a way that code grows
incrementally instead adding then removing things

unless you really want to get first two commits via -net, and this
one as a feature
