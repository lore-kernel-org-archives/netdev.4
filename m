Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473507;
	b=qF7v8UbNo/3c+lMVftG++fkvGbtYF79UvPbZK869h3YOI0OLys7rI5QYyAxTMXsBcTU5
	 pbsQBcCeEpDajZ+XHHi/nwbl0/PVBHP5k7j4pI0RnfOkg6VAi/TYhphfR3Dv0608SJRqb
	 orfVhWs/1b/w6LhRFLifHccXkQ75qCYAyHL1KK9PlIwVin8/FFE3GGjOAPqD2Q9PlP9L6
	 AiYLTnIqNxuL2tH/CeNm5izfobH/+m9P//vra5x1ZcVLky51g9336mBV+SblaPZ8R+zfw
	 TrOWPaaov5RV01brTBGuu5vFT9UkqjX9/H8bY7FAqxtH329BewFEKQUdQWqbuY5eHlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473507;
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
	bh=dRevLf68eGRZgwnW2AR1+kJ/vw7jKhX1qdcdxSnp960=;
	b=1WJIDek3P0zgr4DTGQDIcD3tQWHdgWUyRmAGsu/lLWUO7vPWoDQA26RWfJBovkkgCDJx
	 GkbUPwajEJKtOZXsR11/AZ94EMIUILKN9cSfiK3UqRvnoH9HwfRbeIy69oeJVzJChuK1G
	 N5aQiaQ4sSIXyZoRqEFqqtOg6yWsJjl2yZ6xitR540pDJ3grLjYEXPC56ewDFv8/o9hmW
	 Yc8XjcAo0d9b57trEEauXAN73gsamtWPRJWaWhaOp01a6PwrvwZdLl9PXWZrb7DAW/tmn
	 D6U5jSeOEwUWlS9LZHi2fJqn0JBxcEFeJJks9qLGSCC0NagR6UNwaqT8gsD+uoEg2vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEJxN9cw;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=P6t+9QjD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B83606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEJxN9cw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=P6t+9QjD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795473506; x=1827009506;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o7n55YGUwwSxDsiHAJkF3BCuUCDCecGZU1nBmTQYZDU=;
  b=dEJxN9cw1sczPzn0/L2/9bWru/ONocjJpLNlhM615rhcv1WxmBd2LX5s
   +sSbG1Xj8FrlC5RJccYLnc+6oN1k7zmuYo1Tk0kgIm0bPUSC7S61Yb+Az
   EwXeQLerhRsPG5/t6qBNi34vgrKv65nye7cdR+eM9dXMWsZnOMpnI56GV
   WS3V9q3eTJOvXsKaGf2Yukg6Fu4qxxQ/NRFTIH36B0A4AmVucoWzrEu7c
   ug7Z+k5zXDiXktn0e8e9Wxn27bcJBPkw2xayLjkhkYoFKQYF+4iM9aJuY
   phf/cuRjWXVFE9xs5b3VtqOcEU/FMne5VtJ6BVYuuPiNLLDdMFNlOKyMF
   A==;
X-CSE-ConnectionGUID: 49Bi4uPWRHmnoyCuvW1I0g==
X-CSE-MsgGUID: gplH8B1wTSeKBOn4AfEZiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4194322"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4194322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:38:25 -0800
X-CSE-ConnectionGUID: rS2xKv0mR1i5U8a1S9tutw==
X-CSE-MsgGUID: Hj5KKqbZT12owJwIhsd6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11388456"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:38:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 14:38:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 14:38:25 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 14:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwTp3gHtNR2of1XmrzV1/pYRIWBkJoUHSYBRypT9XGazCwiKGACt6wUe+44kWHbVR01fuq+RXpZVRyebfLCuMpD28OElvIWVCjAOHRjgZcTtsmm55WXXB/6Z2ACjOuoZanbEjADbIaiFrydJk5OAmSKfmGzG7zgqBHuWdu3sj2OrpPdHRU5SSJkgGK6LgwCdd5eJyWALZvbF6vJqc5kB5DYGaTwTqiGy8Iyyd7DVTYJO7gAQb98/ZapfLDl1d6UZ55+Np78hgQggmGL6ZRWORfpVdWw7lVAW0uUM8CfTbsuRrLlED13kM1PEP97y9mGr5b2t7Gm3R4YqTvnKXGuRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRevLf68eGRZgwnW2AR1+kJ/vw7jKhX1qdcdxSnp960=;
 b=D6rQd0k4LdUqM1kX+Qzk6/M1gvT6X39AQpg5NlVT5dVBypCaKZMOkdEpLqRSd1WXPGEf9cFD1LQTWEnBmF9XSO1GBxp1k8vwg8jtnd4V5khPAiej36kpOaCjKl4fQC2BVzZ+z13b22P16I+t69pM6bKZaH9625OfiBpT9e7fwkJGSgHG9AN7nzmcHuBB6LSYdIJ+UcbLthD2GFA8UakwwcxpVR9cGtWC4mE7MwJHDhXMFFEG+t3XpXb8QttFTJIaNfF3WHkMCBijMWHCz6XlVX7SEj8LgaytxEZmT15dCDcvzl5TQ1jYd2OEjaECRXLbeIyuEHeCyiYxje422bR/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRevLf68eGRZgwnW2AR1+kJ/vw7jKhX1qdcdxSnp960=;
 b=P6t+9QjDUdoOisyl6FFUrYpFv27KRRfVQHTWruWoFP8aZKXD8iFGlSLVq/nTXK+tUWoHtKJAZCfnlMf58bAdteKbhpZXXRxcRXmusaXakrJXMeUr1ZpmRL4I/LyFLND/yHdjSKpnszooHzEg0WZ/PntRfkA6w0fTAOaLtgvQcls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 22:38:23 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 22:38:22 +0000
Message-ID: <37d8a917-f113-4d34-b152-a4d21a2871dc@intel.com>
Date: Mon, 23 Nov 2026 14:38:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] ice: don't unintentionally switch to symmetric
 RSS hash
To: Jakub Kicinski <kuba@kernel.org>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>
CC: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
	<ahmed.zaki@intel.com>, <intel-wired-lan@lists.osuosl.org>,
	<anthony.l.nguyen@intel.com>, <przemyslaw.kitszel@intel.com>
References: <20261123205600.1794292-1-kuba@kernel.org>
 <20261123205600.1794292-2-kuba@kernel.org> <awSrrR6RfQYjhPU1@boxer>
 <20261123134109.30ba46d5@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20261123134109.30ba46d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::31) To SJ2PR11MB8451.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d51a68-d5f9-4ae8-34d7-08df49b27a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261022105027099003|261026140227099003|261028144727099003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hBEyNa9yIIm6bPcDth4xwx1hMvs3y6g8O7iWxQvF280WSXBMF3In+/Sp+isMvUVo7KrRfgBGwjLC489Qctn4BNHHsZ9Rk4+BeKHg45dSksg4DWcTmDqEcviFFfwmKMToXvnFUD0VGG2L/wkmI1Un7Qybecc1uRBGCL4WNtBr7CMM5JlXqMlNZ/ZrnrLIZjrH8gKUFV2A16W2kX7fsL4iWuHXs1XoylLpvpZB9J5XZjPXbsAuZmWdTJfKh4HnLsYdPwU6WON+jCaQy0BKUVyFMJxL3fqTKdJ2TAvI7Zx+Kz9U1loipOcXiy8UIpN1ebhtMa8bMzNC0bb4IooJFyJOBdZ0zYaVghnD1zLvLE+h0sDGcrfIxE8iZhOuteZ8z489Z+da3ZGu8Aeq9n2KhHhyzb5Cr4CJtTddEZDNgxihwv8iNn4P7FvOTpguidbfBHZJvp4oQX1ZXubJegFHnVOBuv+erHjg8jPVln/R6UqzTq0IyW+SL6ptF8lNwVY6yo9xeRQB42NvR90uSYUNIb9kyzLUi4t7QtLBV2XZouCpapwS+Lxp2iwmheLxgp0R3d0ADEz+tyOKRc8zFN1Ho08Br3ZaCut+BBLhVHoxkKrBAfX7snXjiOMWWFXncF+71hztZ+cQqQLRA/znoxC3+pV6JhXyzdbhCjppReokWNsLG7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhRUUd4ZEZwcExvZGtrQ1UxSzMrQk9FRFVZdTFtQURWMDNQQUt0YnhpVnNS?=
 =?utf-8?B?VmxYUzlaT0FuOHNLdjRIbzlTVk5xb2RuM2lDNEhqYzhHa0pCNzVKWUVBZ2Vt?=
 =?utf-8?B?RHdYWnJrUytYM3puc01ldTdNNXNDREFXd2VkSlJZY3dmN3lRN1hqRkJzNUsw?=
 =?utf-8?B?MExvNTlLUVk5RERGdEFYdEFEeDNJYW9RZEd4Y3d3aEJoMTFNMHhRT04velRh?=
 =?utf-8?B?NHBCRDJVeUdhck1JUWZGS1VuVDdHNmdpNWZWd2IxbXlydG5YcThIOE04aitT?=
 =?utf-8?B?UmZQVjRtME1sRjF0SXArUDhhalpwWXFtZHgwWGllbkdCcE00NHA2K2UvZklj?=
 =?utf-8?B?djVnTllGM3ZBaGxFbFkrVlNLVGQ0YVZwa2RFTTg2TndycmJxdzlmT3VxU0xO?=
 =?utf-8?B?Zk51NDRZOVhnQ0RoZytxZXFYVENUOVRMY2NvM0lwZmtjRm1XTmFXYTl2bUgz?=
 =?utf-8?B?bi9YMjFFZGJMV3NaaDU3TXZyVUdidGpOTnJMTGFiVmpRYVdEdzR2TDNQTnNu?=
 =?utf-8?B?cERsalMxRTZ2VHlJNnhVNTk3Uk9LTGpQNlJISkJESVpzcThFR2MzN1NMVkdo?=
 =?utf-8?B?RkhBODlPL0JHSXdJcm5BOHorWHcwSlA1cC9PZW1WQkFkQ3BHRlRzd0lEUzJ3?=
 =?utf-8?B?TmtlMmM1L214V3o0UDk4NUNiVmMrSldJZUpia3NZK1pNZW1iWW8wQ2d2VXh0?=
 =?utf-8?B?bTJrYmRZWUZnNlN6SjM0ZDYvcjI0ekFNRkRyb2djOU9IQXN5QkFCWjhqN0RY?=
 =?utf-8?B?ZVRnQkp1QjIvYTVzL2M3OHVIcWcyS1hieVhKb3M1ZVVBblZOcDZWeWNHMTlO?=
 =?utf-8?B?cit4UmpNNXNzQklyRHR6NVNLd2pRdWR4NEtRU1VxcnVnTzJ0S1BYd3E4N05N?=
 =?utf-8?B?Q2lTNC8rVWhqbHEyK2JSYmI0emFwNWV0ZVhyN3ZhcXZBVVpDRjQ1dUVFUFI3?=
 =?utf-8?B?dnkvZ2JCWkc3ZGJmenU3enRLYlI3SmdMclpLUUlQTUppdzF4dkFHbmgyd1lV?=
 =?utf-8?B?NmdJOU5nUFBpTEQ2U0p3czJyczZSN3ZlMXBWQXg1RENmSW13ZGR0MlpaTGND?=
 =?utf-8?B?SzNwcVJZdlJhc3NGN2MwQmYzbVNESzlMODlJYVJtZHlXODVlZTN4eVpuRGJw?=
 =?utf-8?B?dmpjZ3ZvYlg0YXQrZ2ZmbDM5YnJVNE8zZ3FxZkUzOGFBVldZZ2xYSERDMTNW?=
 =?utf-8?B?UlpwV0lmQ2Z0TFJVaFB2bGNJd3hVaWlKUFNWTVR3MGxHRnlXM3Bxc0xsS1Jx?=
 =?utf-8?B?N25ZL2RhNEs5ZUlpZzlzZWZ3eVRSenpIaGkyUkdtMFJPblBwZVlveERtUEhk?=
 =?utf-8?B?SXphUk00aGp2WGw0QWNmVi9uTE5vaUtmQjZTN1ZMeGVWa2IrRVc2a1IwT2JO?=
 =?utf-8?B?QlF5d3NlUUQ4TjRIdUlVZWxLZllHcWI1dEFQNlFOS3hmNmlLUkZUa1lQZmNH?=
 =?utf-8?B?aEVPdWNmc001WU5HbkdZK3hrYVN5bDl1MjZ6ZERtLzN0K0NxcmhGczBDR01a?=
 =?utf-8?B?UmpCdnR1VytvbXBOR1ROdHJDdG1PYjlBY3NRaDY0TVNDcmtIdUFLWk5PVkUv?=
 =?utf-8?B?NktiK3JZaklDN0d5RWRhQ3I0MWhKSzlmWTQ4WS9YV1dxNHV3U3QyaUNYTW9q?=
 =?utf-8?B?bjBYVGpyeHFLdHY5Y2lBQU1saWVjUksyeDZ6RVhHZFhVU1dta1g4OGt6Y1lQ?=
 =?utf-8?B?S3MvR0IwSWNKZURxS3Nua05KSkw2bGI3aHZOTU1DNjlldkRldWRCVVpQL0kv?=
 =?utf-8?B?QXNLd2JBczQ3eGtyV2hQTk9BYjJySTc4TE1Lb0N0MTlMYUwvRjNCWGJVdVEw?=
 =?utf-8?B?RUVtNGRCK21Gcml0ZGwvVklzN1hVYzV4K3ZkRzAvcEs3NHdJQzIrcWpQTUNN?=
 =?utf-8?B?QkdFQmpselN2UC94NTJldDdqb2dsdUR0cjZzdDFqb2kxcWEzdjZnRTZ5MEhX?=
 =?utf-8?B?U3hhOCtZRzBnbVAwb0toNmIyaUJGUUErWE5TN0h2akRrZXYvNUtJK0d1TldT?=
 =?utf-8?B?cG91ZmlvOWN2b2I2UXBTYWN1VFIvL0k3NDI0YURySy85aTJodkhValRJTGM4?=
 =?utf-8?B?MkRCeTZ1MWlhbnZBUEhqdVd0TzRzVWVlVkpJRnAva005T0o4NHRHWHp4Q1M4?=
 =?utf-8?B?WXNIZGJ3KzdlaVJCYzJ5Wkp3cG1RM0psL0s4b3c2Mlk4ZE1KVDJlWnB4bytX?=
 =?utf-8?B?cm16NmRGT1BGM201cjNvMkZVbS9EYzBWeTJ0Q1krVnNOZWYzSTNRSms2MkhC?=
 =?utf-8?B?RXJDZFR3SWtUVktFNElwRG1xTzF6MUVNbkJuYnkybTNpQWo4d0k4Nkdtb01B?=
 =?utf-8?B?ZTJScEowYjRsbFNSZVQ4dGo5SkROVWRncTVyU2NuQWZ3T3NXU1JOL1BNTEo1?=
 =?utf-8?Q?ktydRPlnoOp7a+bI=3D?=
X-Exchange-RoutingPolicyChecked: afmrzM9yXD5N8UUg3qKUNH7qlRaMw6nbUomBk4tS+h9GapgL6SYd10wnBoErFhVbHKXM3cvwRVVnbAdEHfOBS9IVGATzT59mlw5PECDO5FDlQd1QAI99/zlWeCGB4WphGKc1+N0/gF629xIARR2Et8T5ddffZ6VHbkf9vrqxiMKfCp8MfntyWhI/Jl8y402sXtWRwlwh+omLyG//QoU/9VkbJJl1W+UiVhqgW5zpfHkAkczUmXf7zUC5nUEzcuAN63rT8K1vTZ3Yo6QHNYuWDMFBIEW/AxrYNVpcAqiTS2Zp7GeEeBYNpVXnaTknwjL6Wd1goYFOdWwrvd3yk9i6vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d51a68-d5f9-4ae8-34d7-08df49b27a8d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:38:22.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfJvjvxjLOfsBj8sRmrnKfNlIFSt0yj1a++vcSNkcMQNgdltc/GyZzM1LWcNRfhxw5xwXDXW6a3i5gOeChsKCTf4nOtUs97bJ2kh3VfKIsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
X-OriginatorOrg: intel.com

On 11/23/2026 1:41 PM, Jakub Kicinski wrote:
> On Mon, 23 Nov 2026 22:10:05 +0100 Maciej Fijalkowski wrote:
>> Let's just get this damn thing fixed ;)
> 
> Thanks for the quick ack! 
> 
> BTW I started going down a rabbit hole of fixing more bugs in RSS
> handling in these two drivers (eg ice assumes that rxfh->indir == NULL
> means reset to default!?) but I gave up after 30min. There's certainly
> a lot more left to do... let's see what Clashiko points out.

Yea, we have a lot of "side quests" like that which still need a lot of
work :(
