Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471603;
	b=QWcEe5HGTUT4umy9F4276nykb9USXVcmG5ZL60qiKumUyfsgc5cmSLBcvJyxYYkWtff+
	 szXbnZEq15Mca5zGlhWrdcSNusKbP6iKyq3rcmlcIyScEgF9bFFwIvhKUsCuBs/kXv8by
	 /4caBVbnawEQnf8cn9Y9Tj16DazltQjjhBf7F9QCmqpz90HSHXiMARB/ZDJnljwDYDmKi
	 8Bo1W+6PZvVUxilFNpc4yQFYREQ25rCO70Lo/kxXqsPH5YKwTaXAXjR/OrIyfKI4IUV51
	 vhwe+bpuVdvSmV/RbLSH24a/7Slmm90h/QlhAjB1j+UCr4W7RXD2TCTCiNZYvJ0cumQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=0drHj/w2vtRDV2wZLf0itao4jsQaq2iCYkG8xAMoDcw=;
	b=RZ/nHAnm7u7hkEEcrgr2FhyS2Cgq3fjXKp7uEu1gyuhRIxlvqf223COu+/nB8MBlXNky
	 UTBOkX06Vi+rQdE4Oz3JGHH8N8MqNXfhdWtodlSouuWzdlvqK2AQcCaDlNXTjtXFm7/oc
	 nslzyW3RA0+69t/189kdbhNSKgpFmUw8vc1vrsKvvviZLNwTbEJ8h+48uvoz/v983cEWY
	 yJlPrWnoXUA4+G80kjhwbiQ4kUkry4hS+lp471QU57rEjQKK1swdpNMNjRz3hv5qWUV4g
	 9E8+vzgYMRkj/P9qzYkjSDFG0cU3XAcnjNKvXJ5PABs+t/UZAjvln8uwhOglAtT9HUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHVkXaRz;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Br5Ghzce;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1A606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHVkXaRz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Br5Ghzce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795471602; x=1827007602;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=K6ToW8W9mgm5mOasAjk/GwQiSzMBXILasG2SX4+DzC4=;
  b=MHVkXaRzgQz7rq9zVdlLMiWb0TRqKPl6g8JZRi4KKrStDIcfggNj9iSv
   q8jdZ8mjrtQ/pKKsqTznr85clbmTiE4AQdgOmIkHu4rE3SmkYden5pO6F
   Cqlu1bW5EQUteoYetTPbMGsbPWHo3LKUE6yUHaJs96cuXqpj+Faq0XAZX
   UDohKK4S3SpoI4OsOh4yE2vXF/Y7kws+EQflsDgsqxc01kZXrCdIoFCPb
   KUrmYURPTSdLL3j4Z7eo0QGQ2Uet+js68g3ywyKxntbJnMgXC9LPiYZkH
   0GdrlNXURiDW8xdDJzgpYE/rSlWzTFO4RCKErAWYQG3GJNzLahjP8rG1M
   A==;
X-CSE-ConnectionGUID: D1sxIgZJQrm02yrYxNJ6lA==
X-CSE-MsgGUID: pfFis8AxTV+HEKtWS9FQCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4339471"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4339471"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:06:42 -0800
X-CSE-ConnectionGUID: l1oody1UQPKI5Ys/E3SnPg==
X-CSE-MsgGUID: Fn3ILiA3T52HhNh1dNg9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13199659"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 14:06:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 14:06:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 14:06:41 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 14:06:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHp1r6VFa3p5142kJU5ZVsTrDJT/rUco9eucsjwZeq9BFDE2v+c/Dafizo9zLkmNaKEDsgxAsoL8IReI6Cx7FfxXhuDbTaL2T7Ab00ntWuYz6y09BnuJo6GAhegzzxikXVceILU/o36J8RUVJbcbdxZHHcl5D7ZvOzqD5EnQMkWoY5qhsHg7WCAR+M8cE2GezMwupCZx0MHxt9iqUD/lmY3YFK5/5BLyj6Kc2kd5///H4VCO+OdwhMioEBmmpZwJ4kEsmJZ2D7TbkU6OnotzeExyfW+QRXrQqLVGl6uaZyQFu83FF8JHkJKrWgE9H5Wfe+DZitkPXRNY9lRsCH3r/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0drHj/w2vtRDV2wZLf0itao4jsQaq2iCYkG8xAMoDcw=;
 b=TEGWyZXB4RT8aIOwcbccC+Vs989/3UN+m5sP0VbFDvPLr2Nwtdk3M6a7tv5Xlv1jDoOxhT+Cws1W6MujXNN4eUG85jZuduDmE3LL2aaqGR42kjmp88vEzMx24RF+CXM+KpAbBuZoCrsPVkz/B6/8p4h0hAiOtQp56oSc0Jjd7Jo6Tcb8nDbE2x37R4jeNEh3QDCxk3yJXZfxys6NjPak/jgyZAj5JWMEcDHO6h7yjlES/DCO+0mFOxXFfugWk1AiutkohV3EWdK9oeTV0NLROYi4ntxxTfl1RShN//rnB7EINf6i4f2lUMdd1hqK9XR13bAUlk/T0nvZZzdNfaxhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0drHj/w2vtRDV2wZLf0itao4jsQaq2iCYkG8xAMoDcw=;
 b=Br5Ghzce45h38BRKeE7TGXgSdZ4nj6z2FeMjWOlYeuWKxlJ3XAo7GChharKByAS8prQ0y1a36yTmj6P8k3Mnucvpbc6ZDWfSsktzeRyyap2eiHnUDlxDY5LoI64zxOOGT0Y6mjs1aIrdmexNojYTJxGXw2K4SPYApBsXeXm3xKw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by DS0PR11MB9480.namprd11.prod.outlook.com
 (2603:10b6:8:28d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 22:06:39 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 22:06:39 +0000
Date: Mon, 23 Nov 2026 23:06:29 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <magnus.karlsson@intel.com>,
	<stfomichev@gmail.com>, <pabeni@redhat.com>, <tushar.vyavahare@intel.com>,
	<kerneljasonxing@gmail.com>, <bjorn@kernel.org>
Subject: Re: [PATCH v5 net-next 00/13] selftests: net: adjust xskxceiver to
 drv-net
Message-ID: <awS45ZCH6Wtj9hYJ@boxer>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261123131306.1b76d6d1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123131306.1b76d6d1@kernel.org>
X-ClientProxiedBy: DU2PR04CA0204.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::29) To LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13)
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|DS0PR11MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: d1965089-6aa9-4554-6396-08df49ae0c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|5023799004|11063799006|261021121427099003|56012099006|261009223027099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: daIotkVGa0AErnICVKuWcf02mFbHrx/98XOUVqI51CUprmykOXkgSHOGYZtddsJXS7/HVlxEumxcqJ4G4WNJZTPN1J55wWY1TcOCJr2itJpd1VSlxkVwF28YvH7gtDDBt36ilh+8GshBRXl1qrOIatFUqC4W9sFbUzs73OtodyoATv5hzkYwukIWfFz3P7CmaaRWzvt2kJNm40Oxl0R8GXcXFBbmNA24oN4lVxhsoNwPeOcDScBsAAbjFpSMk0z13/oWjWEinj4EpnonYIsjszXJYaevhHMR1DVlDU07KlYXJoRLs677KNNKzixV9SxTao+tz1jZfoNdp9OXGU7oMpAtsIUvsrFdk744hXfHtIhD51ey8iR4xcMZrK+Id4xzIh1tanonPi4gUc/sH7Xg/doCjkPiHvm3yuF4ruWlHPNv2x9xR1kS078r7OOCIDZzOxz/YJs6OM/BdKMk1oJHpr4DwqCHOra7Ctm/PKH+oC1hH6MQ4lylz24Xm3gMfw0985Z+e0zMV2OmFJVwbMlckTl0tyTYYQr6LqLD+p/fhrnGr/fX3Lt/5ZGt/dxvVfIBOJv7f9Wf5a/Oz+W84q0wpvN1u8maPaqj18QuuA4rZKnAuCmyJRvWqmgu3fDJ/n00
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(5023799004)(11063799006)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/sxKrTz4Oc5xInmBZjYOmWY073vdQtLHHRXEB+QE9bDX4OhSmbGS2JExR95?=
 =?us-ascii?Q?alTVwRftJK1kdVZXXw73vUzSkDogyAiloJz6RVxfYzCq4FTPfP4V3q6ABq8x?=
 =?us-ascii?Q?3uM7BAmUIOAeqe4PYkfIu94mEMLrPqHMEpvuOsaF/4m+LapeuqwAN+/6upwy?=
 =?us-ascii?Q?0wS3Quq7sDP3IYXGOOctMcrO8v0M53rtlAEsZr/vzQ4xuyD8Pgr8TlLnEWl+?=
 =?us-ascii?Q?snwzRzoHw9Xa6kg2/kXy21j9pWvGgP4xTWVn55ci8K7lwkw4PAzV+8h1Pf2v?=
 =?us-ascii?Q?FoQ27oHsgm7xlCjrFLwDSLEch54XT3QcNPGhlXryPrdBHc+gxWxqjp1ss94U?=
 =?us-ascii?Q?fh6birsM39Gp6djSU8m9CYU3MZ2Dl+Ec+cjA0qjF54HwTnnOHZKUdwUTYB8g?=
 =?us-ascii?Q?7AWLCWEGwan5VgnFbkeH2YK2BMIvSCpHqNkGPTF2/THp0NVibWcxCu1oHf/5?=
 =?us-ascii?Q?x5g1aVx18mtnzPRqDGwiSwwMVohJQvyw5s/2LS4gNJkRCo/oL6QNCm5LLbqM?=
 =?us-ascii?Q?rYmwhqA0BkmzhzRGqgz1+1Syat7+w67PbLR046RYy5/PP7+c+NfJDt4s03B5?=
 =?us-ascii?Q?NlRmQJoZ3HR96FyDE8HO90FyuK67G2KxEkCjEKF/rSAmG31D3mxaoKZmFJ5J?=
 =?us-ascii?Q?8brJLcvdWzaTQAZTKV9t4mQIf7xb9Y2cFj30VNm72ZPWE/TqrV7GLIE22m2v?=
 =?us-ascii?Q?P/tLouMYhtScdz1tCGQQz3sI2+oJvxrA4xb26z8qNN9JHZMbbjHrWuITkecf?=
 =?us-ascii?Q?ITeEwfFe81kbvZoF+XOo5pLn2n51WmtS/2PgkRX9MHkBhWqyOftr+zPQf0/M?=
 =?us-ascii?Q?jDlk4w1elmZSO1EGjt+Us69UM1yaocNrLJz8RgAxZNjCaZIAVmJU/wvx7WMA?=
 =?us-ascii?Q?FS7wqUWbrxK/lwDieuQbG480wL/G4i6cXOOPw77kQsMVghAwj7HsXtSa7W8c?=
 =?us-ascii?Q?ujvP7iyOqbKuA3i/jdvaIB4ina83VUdC0yfmeO/TdopUDlgY9ul6cLFwomsX?=
 =?us-ascii?Q?ErptrTurjcj8i2p8tOzOMQ/vC6eXC/p6aqRt8wl6vCwoZObK0g1filPGu106?=
 =?us-ascii?Q?lnOp5HLcM2zt4eMjT/Wadm9Q3Ag+gslDQnuzCA15XPt4OcMAh8Rc3ULSlj99?=
 =?us-ascii?Q?gRUdmzA9dL6Nrs42i75TXGxYjyES+qxOZX9pGaNt1+2E3gxQ8P4qdP+Uipir?=
 =?us-ascii?Q?8EgsMErl8U8XLTo3sryIpHSgYO0wdkCqNHk3TMjYGWZJY9SWzLDgnTUmzrRG?=
 =?us-ascii?Q?WGA3HeLGA+jV420pVsCzdxNQ5YjT71irq6eGhtJBq1p6wjQKK4+rMRYxQF0s?=
 =?us-ascii?Q?meMjZLl06HvQYJq3QlOZIt6eOMXOuRlD5WbqBkB/aCJPqPX7uJwgxUVTmpSZ?=
 =?us-ascii?Q?mKtSMS8MQTGHkTKcSY1Ro77raxoVdKMDwyc/e9Q3ui7nqBC9nIenxABAaBgn?=
 =?us-ascii?Q?SpVq6HejwQfVypvDwoZ5Nef/YyZsrlraravgtd0JbHZjB1w9ChjfLIyex2EJ?=
 =?us-ascii?Q?VmhDD7SUOxC/aLYlW2CW26PpyRRAh5AgcanimkuzRPUijit14TpXItAgf5ly?=
 =?us-ascii?Q?/d+HK+7NCZ3HybU6p8JVVIfvJGGtnkVn6RxHNfw4KESEKA/3UzW4CvDfA2l6?=
 =?us-ascii?Q?EYqvv1c/bodsfIwNXo+7DI9zhr4f936gXzCNWxVtJD3uSHVmsNmcIsWo3fED?=
 =?us-ascii?Q?FsoRD0S9zXtYtdAHh833uxESn4yreGeB7cm0O6o/YMvU/9RVKFkCmqtTK3dg?=
 =?us-ascii?Q?ylNalnc3AXAYf9fRaziXrokurhcCg4E=3D?=
X-Exchange-RoutingPolicyChecked: ca0bBZAcpTN+zWAUrfZfvLkG7GavlBe/gVToFrYYK/hdYLaHm0UrNcBGStvKaHrH7hpvf21qcTqiPSlFNk7ofoHCD2bjxVR1KCqPuuwPe1oxdhrDHnXd8ULIW7CbQkUIoIonkbdRBIeby9BXf7pmUshJRQR9C8B5LC/nAj9iEftvOwBnCE8u1a0FGMhTuc0hkdjN/0awDYsnUWCJmbUyQUh/OdvY4kMUVExgY+Bs9lnIHcGwM0MFmokAJLovzW1DeFipCr6qMF0aUMBDGuWw/SQOvOOxsiNGYcJIXQYfLcKQTZiwXPsSQ/75ES23n1lyIPOrv/xPAJxLRUQYsz4asQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1965089-6aa9-4554-6396-08df49ae0c4f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:06:39.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n5t8OqwE9ZPP64u9n+FSE3xkXJna3+4FjKkPG1GlBIMum813b9LfnBErM3Azhj0SuXt3c1vB/yzuUiEeyxtyrmnpEddgzLHsnNNA92U+uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9480
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 01:13:06PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 17:46:23 +0100 Maciej Fijalkowski wrote:
> >  create mode 100755 tools/testing/selftests/drivers/net/xsk.py
> 
> Haven't had a chance to look at the patches yet, but it looks pretty
> flaky in on debug kernels in CI:
> 
> https://netdev-ctrl.bots.linux.dev/contest.html?remote=virt-net-drv-dbg&executor=vmksft-net-drv-dbg&test=xsk-py
> -- 
> pw-bot: cr

I would *really* appreciate if you could at least scroll thru 12/13 and
see if python side fits your needs...in the meantime I'll see what's with
those two flaky stats test cases.
