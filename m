Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795535022;
	b=AsJgzE5AKzZhv5i/nj4SG60TspYPHnoduKfofuL33i2cssmsC71Wm/zsk8cqfYhQnpqI
	 7CXMZSAmq3XOf9Umy+3M8pFNxfBjh4n+bPX0WQL7JMRlye7ZUOT2FHxI7SFL8NH3+zgkt
	 lfI02qPu+oR5TCZObEh8LsvvnQINk1rZejzZafYwfxxNkYmc66U5bNElywF8crVl7QSoP
	 ildA7X3Frwt/AnwzYP+8bNqJvwqn3FGwGbrQflVZ99Of/Sf10QPgN4TTVIxR5QPyyRrXD
	 b9hqlHI26eSdre5IYu/7u5WQwiZy3Za8sc7CFeWdrRTsHqbqfwfSLU1oUaH7hjgnlnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535022;
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
	bh=zAv6qhzrixhqJa17ftLlZAF2IDPf9MB1MXk96TjsXfs=;
	b=X0Aa+NaOToN4WcUcoj3VZ/wCQK8HBPGZEI7zVH2VAf7ZjXUo/G5TGRHo7UINXxAgXmPd
	 ez3xIRF9eFcFANbomnUtVx90V3fW3vOFjXd0bgK1KrXb7gI5j+2rzkeleGuoqK8RW2YdL
	 5GDO4pPrteIXpIOdf6Ge0exuA35cTARFOhhQi46EWVqBGaXXt/HCQspjv/klrI6DqosiH
	 +B9PDb+ZoX6gLbPIZqKbdAA0LkLlAHM1gnLglnJEBHbneRxTxPw7HumArRQuoHuy+Ckqc
	 yMG6KLtGCL2CHe5RF/nfX/YbsuyRIM3yFAptpouH+cyKSmF6Pl883oYlEW6DhTSOLTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZ2bkmqA;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YfkJ5p7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D35606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZ2bkmqA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YfkJ5p7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795535021; x=1827071021;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AJ9KYRHiLojK3i05U75NLtxAX0Lgv/LvXg5YB/cp4Kw=;
  b=nZ2bkmqA3Uc4XO03o93PirwqnZFG4mqVR37XA3tXHArxpHK1KXZ1IMfw
   /E0cJhVLAhT1qiqPMBCY3/OpVZNBa6pEnTHliFf8xuOFzbGG971q5FYlY
   sKJk0Zi0oXAVoJ1E1mWGovZas3f7XWDqNkHlUCVONZfML40ISrTiiGuU1
   l0FXPgdXM07V/JoVpvzrJDy2blWpGq3i8qe21ysy/76+S+GuV5ym419EU
   5uusl04Joxo+NA7HUF0TWzj6eF2xzBSX4KsywWVo57Z7XVCGYqdnCeIJp
   AApEJOFxQdPVlkblsG+BjYi0N0Wn46+HgLNf2Nyi63hJsZ4gIRBgHqeVo
   g==;
X-CSE-ConnectionGUID: +yRmZZRcTF6PbrAoLLZjkQ==
X-CSE-MsgGUID: SZ7EtbaqR7yddqvdgKDq3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4468362"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4468362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:26:15 -0800
X-CSE-ConnectionGUID: gRrhN+mNT4G+z9SUABw0tw==
X-CSE-MsgGUID: pyYPsxPxTf6Mvv/midt82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11568534"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:25:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:25:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 07:25:55 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:25:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTfChzbkDtyWk/nwFk1diBF037FHtopT6YFgX1TjsR8Y+ImUH6iSEfnCMlhClh4Lbhl6FwQ71imM/2ki9qwSu6dWUQr8fEZoyzoOkZb5rE4qnAEi1dpctyVqRnbFsiuEH9Zup8mqz3jH9nARNvySPLQrQVjS6ad98LDh1/2Yopf2eWgGV1todEYv0frhuoulQdzBSRh5OiOfNAvkMkhLIifTNbrNrh8u5+wSvoPiPV3DcVOULdriYG1eC8U9Da4pqoXohhdyaq+NU0gY9NwetARDBn3iYCiJ6U7EPgbc9e9t5s0UuEnhqyg1fo6+FEpn8h1ninH4jxOL7hzfh5I5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAv6qhzrixhqJa17ftLlZAF2IDPf9MB1MXk96TjsXfs=;
 b=pT4JDLAD8sJyRsMrpD71o6Ncc/yhHF79nzRRfcK3GDRpmYSDId40P9xUjFGy8ocJzb0hQXPyGCjW6NzlhH/cj/4Hhfin34jwxIP5SnU1wQkMe0vTOak7ua4D+/8iRcjK9JPmWw1ZItc1yQLVOvFoEx1grH3EtX6u/81K384To9yyOIofMQioyl9mmy1UvBkBkiANkyMkPyJkZekRRR5Ir7PEujQyENI+mxt5oGwm/2o1qS9aVAq43y0FCf6VRgZz7VHIvw1xY9J/tOlhSi+0m+UA0oMy00v76y2NWB2/mJvCEl+Tdh36SaEEpQFmadAlYkJh5Bs5BJcBjonlF2p1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAv6qhzrixhqJa17ftLlZAF2IDPf9MB1MXk96TjsXfs=;
 b=YfkJ5p7X5q5BGqPUe0a8PTGyD0Y5O/SasAO/su/C6CO9RXcwTwKm7rvTmUlr89ORUYdhBN8/qYH96z34OEoadGSW/zvb4rL0DvgDHzDf1MNJVEQJXgCuVZix6+PCCng681OuMMT7vkiAyzc3bCvnXfM5VRRofVGDw7aSPDHY3dg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 15:25:52 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 15:25:52 +0000
Date: Tue, 24 Nov 2026 16:25:41 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <magnus.karlsson@intel.com>,
	<stfomichev@gmail.com>, <pabeni@redhat.com>, <tushar.vyavahare@intel.com>,
	<kerneljasonxing@gmail.com>, <bjorn@kernel.org>
Subject: Re: [PATCH v5 net-next 12/13] selftests: drv-net: run the AF_XDP
 tests over veth or a NIC
Message-ID: <awWsdRFsI4Z9/lkl@boxer>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-13-maciej.fijalkowski@intel.com>
 <20261123172946.54f8323a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123172946.54f8323a@kernel.org>
X-ClientProxiedBy: DB9PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::30) To LV2PR11MB868673.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: fe866e10-8b31-4731-b0c3-08df4a3f39e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|3023799007|56012099006|4143699003|261028144727099003|261102123227099003|11063799006|261022105027099003|261026140227099003|261021135927099003|261022075727099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: e9BU8wbIPKAjUlPbm7LjF6mHK8g/8t7ZmLq3PHCqgt09AVk/AC6w20srEy630qhAoUT6ukOaqOhOJ/FDYGqS3x73an8VpDE6KnK+Q4uMZ07ibV2HrhOrcoyZTeCq6KP9k5p57mEwkKdroRvjqN4r3kljZ16m53fFl+EevzzDfmNRfwzIQEWiOPARu3W+DSH3tGtHBrElSX6iKkPjxBHkcP4nY2zhr8iaZbO+SMjygXuDqKuXQKonUsrTk3Pf2HhSOGb9caSjfl7B0nQPzLxtfIZf4QsuMaqJVEWGvKyTV1SpRcF4pv3/nqZ37pMk3Ys8uFtyg90GpOBv0vvRhXc/aBI03Ld4g3NrOYVja6Jxkg4GZ54wLEG8NxfcR3MLglniY0AaxeFGef9uHHThclrlj8Xe6e4FA/cf0qnIjs7eQPz3jSbmmd1QsG+jaoYaMlnMXlhgaojxMwkRHomzFXtLnQLXR08jJ+bbxISjB0SjJKCn3Ipm+OeiUrG6m00H4eEetRJFuGc8oEwt3zJhTlEtCsF4AakxeLaHJ9iDzgUcDlYMBPmljL1Ort0H23XpSuvS+NImrN+4Qf2uBJTAHNK2j7pi33x2RxAMvMFEPykNzRCJhIyovhVej2899mmta8mFEQ64OZqz4/dnT6Wf81p4J5woklJ9twJ0k7usgHsBFUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(4143699003)(261028144727099003)(261102123227099003)(11063799006)(261022105027099003)(261026140227099003)(261021135927099003)(261022075727099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4ggQzdbvUFHTbi7hSjuspKHXh8bOMQXHGFgDH6e5OIBTo3XEpe5AUjP/C5E?=
 =?us-ascii?Q?+PNJ0wprZFRsBSBMYawuBEYOR9tuA09U0mvSPHZ2ZTspOaf8skDp79K9pR+C?=
 =?us-ascii?Q?de6aTnSRbdZcp1BsZDV6oB2N+HcKH1W1DkYhZ7T30mgZCnJyIH30fY17ADNw?=
 =?us-ascii?Q?oZXI0NhPID5VQNw0Q/WQ9LvuELW0YjEAKDxiG7dz9oz1c91ggYV5JGMFhBAD?=
 =?us-ascii?Q?agVLA7ddP8Cy1CgZiPm+EeaUn9BvaIKC1Zh1t/ZdJGXo/nXmPfBkBns7Z3FN?=
 =?us-ascii?Q?7NLTDIkscXfJacF9QJFgdLVqAnU6MX+SrDy+dKFoH/5KRvnDkA7nyoDNIF7B?=
 =?us-ascii?Q?E4LhH/HTN+N+/tMd/AIKCDcS+l0Cu9nA3U3GXiB3LIAH0Liy40tUOQBUnaX+?=
 =?us-ascii?Q?DkAajjL/9G3dLR+ETW9UYylrTf4z2lKZDC3tT6oUmkf4nhIOUPQEKGdu9c+t?=
 =?us-ascii?Q?U4KXzGnYKn6OwNI4TlnKayWcrZih9VWBDuLEseEPvphrkXcyM2pQpPYWAu90?=
 =?us-ascii?Q?iPjjLpUMDsSkJVkiiET0mwKkCTA9iPmQ8QhWFzg3ZYi1N5DkZFYfhUnlnVen?=
 =?us-ascii?Q?bCZZ7BqNJ53OACOJW5jLEbHYdpPFoBstiTEb+7EobC444fthhDRU2Zd0Ol3l?=
 =?us-ascii?Q?HyF64erb5S73UMcGz/K1WADrdhqsQYOxiwUXWsove4iZYUwYEvA4TxgC2k+k?=
 =?us-ascii?Q?biWgqZmx2Wkw36A6edBawa6ak+dvLdIUGXt6jaERHy0MYJciU2zfTouDfjGQ?=
 =?us-ascii?Q?WjlZXtmFKab9vUt5m4RSz3AvVfGp0rKdi+rXcMBPAgp9SS3Qc7jvYI5TFLXl?=
 =?us-ascii?Q?f4usk0yI2hJteK7LY4ZFDIRI7tsMw8qgbViSOvBkIbPeiA2SheUMRYrd5aVj?=
 =?us-ascii?Q?cJeO2DXrv+Xoaf+bZAiA7NGIdfwQdi/KIzZ8zloDnm3ER4ffpseS81Oo9OrI?=
 =?us-ascii?Q?VpBgu4XOtrOs4QY8NWLt7r6xzF1F00t3xlHDVbVrE/cUCmJEdBde9MpPNiSc?=
 =?us-ascii?Q?/zY/+G9idm4O8fc8Nj80bnGesfYoy3PPlGPLf7r5gsiY4m5qhoBCd8CMo8pG?=
 =?us-ascii?Q?YaNtQl+YklR/oM8AJXaRyQsrbteBByt7qCCre05YBHBITELeOg/h2DljbImG?=
 =?us-ascii?Q?qcxPSPfE0vspRo09ce+s51yBZcprp2tdCuzq5VRp408kOSJW51lzea7hExUt?=
 =?us-ascii?Q?x/xMuio34q156wxBBiAH2e5bp+CN2VDh8yhw7ZWKanY84AQAOhNrjhZvb1xU?=
 =?us-ascii?Q?cBLUjPTlutuDIlJadIYOZ6Kb4Sa7EviR40mU2fGFNI7nT3uShNnvFU5F7LDZ?=
 =?us-ascii?Q?wsuTxBJI1oOCqJG9j7D6pPdJ6cw/Xq82w+ImKq81L7FNESLRzMfgaKtloz25?=
 =?us-ascii?Q?dyDYVXKNeXU7peREDwywtNITKrO6w27KhdPXClN6AavOSVaTIw1rGJFTC6Fm?=
 =?us-ascii?Q?tDwn+xspv/oMZ4l8dD1sQzKAurTWT+iai0sFwNfg9XEWlj6YJyPowOmU9/1j?=
 =?us-ascii?Q?uI8zZl1tNLn+5TEnXv1cZFmmRJD+AgTRPlWNSPJcSYJDQYzoA6UW6Z4RRkYU?=
 =?us-ascii?Q?qOUZAChEcFW4IX7voOXjgQ8xfXIbypQmHhk6iCyN08HNfQemSwZkJZxA65jX?=
 =?us-ascii?Q?tsm+fB/MsBC3lnasXwBj+AyD9vcVc2OY+AzWy/XGHHlqtOS6C5FfoOK8O4EC?=
 =?us-ascii?Q?sd20QMsvL+hGuRkm29tuBhEyiJThpifE+uJH5Y+LujKgVTZ5Tb3MTS+sRpEr?=
 =?us-ascii?Q?IRJr7ETqmdaYormRtIYh5YWPigAo1uU=3D?=
X-Exchange-RoutingPolicyChecked: mGFhZPn29GnShxPSWLIWLhCs4NuebWOxZPoc8/TU4gCaN8/PGjFmoBZtOn3YdkDDjcdGmVIqOVfVMozHmf0iCYln0T5QklgmUu0eSpHQAybi3qAm/RylioZnyvAsTUtTYkcLzZEdl5XiuIO0/tx+YORgkMuS987jMVtCdQCI/gJTcs3H+p4qiLNFi5korREDWioXZLfsNzH31CiewKKU5drlvu+W2J7RMeCyr4XaIutlF8RpVZhDqx4fGemaOKgwMRGw0+2DW5EmA4d54u+fKtuAfIqiVgNcmmxwcAFI9dvdmcJcZWbJVCIXxhb0oDN73/D2OLbjTJ3xnsiJ0GxPjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe866e10-8b31-4731-b0c3-08df4a3f39e9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:25:52.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7nM0v37JhKO5W2fTjKRpn5I/ZGr+XXA1YG+a7qob/of/cBq5PKeu8zt56RcFuj0eJk3OgVwPK/tmV2gEUNaGQO3bFcGSSVYJN3Wifihpek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 05:29:46PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 17:46:35 +0100 Maciej Fijalkowski wrote:
> > +Without NETIF, the interfaces are a veth pair with the remote end in a
> > +network namespace of its own. Each listed case runs in SKB and DRV mode,
> > +with the local endpoint receiving in that mode. A copy-mode socket sends
> > +alike in both modes, so the remote endpoint sends as it would in DRV mode.
> > +The variant name starts with the mode, e.g. test_xsk.drv_SEND_RECEIVE. The
> > +cases in VETH_XFAIL cannot pass over veth and are reported as expected
> > +failures without being run. veth does not tie its NAPI instances to its
> > +queues, so a socket on it has no NAPI to busy poll.
> 
> I think it does now? Merged last week.

I'll double check and if so, gonna lift up the xfail cases.

> 
> > Only the initial
> > +network namespace has the net.core.max_skb_frags sysctl, so the remote
> > +endpoint takes 17 frags. --max-frags hands the sysctl value to both
> > +endpoints for TOO_MANY_FRAGS, but the cases in TAILROOM_CASES size the
> > +UMEM tailroom by the value of each endpoint, and are expected failures
> > +when the sysctl is not 17.
> > +
> > +With NETIF, the local endpoint runs in zero-copy mode on NETIF, the DUT,
> > +and binds to its last queue, and the remote endpoint binds to queue 0.
> > +Before the cases run, main() takes the DUT queue out of RSS and adds an
> > +ntuple filter on each host that steers the test UDP flow to the queue of
> > +the receiving endpoint, and it undoes that however the run ends. A NIC
> > +that rebuilds its RSS indirection table on a reset, such as one for an
> > +XDP, MTU or ring change, puts the queue back into RSS, so a case fails if
> > +the queue is back in RSS after it.
> 
> Yeah but that'd be an outrageous driver bug :/ If AI made you mention it
> - drop it pls.
> 
> > +# The TX ring of the sender and the RX ring of the receiver that a case
> > +# needs at a given size, 64 being the default batch size of xskxceiver.
> > +RING_SIZES = {
> 
> We usually "glue" this sort of cached state onto env and check for it
> being cached already with hasattr() but I guess global is fine...
> 
> > +def _setup_busy_poll(ifname):
> > +    """Set napi_defer_hard_irqs and gro_flush_timeout of ifname until the
> > +    case ends, so that SO_PREFER_BUSY_POLL of xskxceiver -b keeps the IRQs
> > +    masked."""
> > +    for attr, val in (("napi_defer_hard_irqs", 2),
> > +                      ("gro_flush_timeout", 200000)):
> > +        path = f"/sys/class/net/{ifname}/{attr}"
> > +        old = cmd(f"cat {path}").stdout.strip()
> > +        if old == str(val):
> > +            continue
> > +        cmd(f"echo {val} > {path}", shell=True)
> > +        defer(cmd, f"echo {old} > {path}", shell=True)
> 
> ctl_file_write(), ask you agent to check for lib helpers perhaps?
> 
> > +
> > +
> > +def _restore_rss(cfg, indir):
> > +    """Restore the RSS indirection table of the DUT. Reset it to the default
> > +    first, which leaves it to the driver again, and write indir back only if
> > +    it was not the default."""
> > +    ethtool(f"-X {cfg.ifname} default")
> 
> IIRC indir table of 0 size is the same as reset so you can add below an
> 
> > +    req = {"header": {"dev-index": cfg.ifindex}}
> > +    if cfg.ethnl.rss_get(req).get("indir") != indir:
> > +        cfg.ethnl.rss_set({**req, "indir": indir})
> 
> 	else:
> 		cfg.ethnl.rss_set({**req, "indir": []})
> 
> instead?
> 
> > +def _reserve_queue(cfg, undo):
> > +    """Take the last queue with both an RX and a TX ring out of RSS until
> > +    undo, return None if the DUT cannot. A TX endpoint fills no RX buffers,
> > +    so in zero-copy mode its queue drops what it receives, the control
> > +    connection included."""
> > +    req = {"header": {"dev-index": cfg.ifindex}}
> > +    try:
> > +        ch = cfg.ethnl.channels_get(req)
> > +        rss = cfg.ethnl.rss_get(req)
> > +    except NlError:
> > +        print(f"1..0 # SKIP cannot get the channels or RSS of {cfg.ifname}")
> 
> No no, never print() in netdev py tests. You're not allowed to output
> any TAP directly. let the ksft_run() handle that. If you need to print
> something - ksft_pr() which does necessary escaping.
> 
> > +def main():
> > +    """Run the cases over veth without NETIF, else on NETIF."""
> > +    # defer() works only within a case, so undo restores what main() sets up
> > +    # for all of them, however the run ends.
> > +    with NetDrvEpEnv(__file__, veth_test=True) as cfg, \
> > +         ExitStack() as undo:
> > +        cfg.bin_local = cfg.net_lib_dir / "xskxceiver"
> > +        if not cfg.bin_local.exists():
> > +            print(f"1..0 # SKIP {cfg.bin_local} was not built")
> > +            sys.exit(SKIP_CODE)
> > +
> > +        # Before _setup_nic(), as ntuple-filters can reset a NIC.
> > +        local_dmac = _next_hop_mac(cfg, cfg.remote_addr,
> > +                                   cfg.remote_dev["address"], cfg.ifname)
> > +        remote_dmac = _next_hop_mac(cfg, cfg.addr, cfg.dev["address"],
> > +                                    cfg.remote_ifname, cfg.remote)
> > +
> > +        cfg.udp_port = rand_port()
> > +        if cfg.veth_test:
> > +            _setup_veth(cfg)
> > +        elif not _setup_nic(cfg, undo):
> > +            sys.exit(SKIP_CODE)
> > +
> > +        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
> > +
> > +        saved_hugepages = []
> > +        undo.callback(_release_hugepages, saved_hugepages)
> > +        cfg.hugepages = (_reserve_hugepages(saved_hugepages) and
> > +                         _reserve_hugepages(saved_hugepages, cfg.remote))
> > +        if not cfg.hugepages:
> > +            _release_hugepages(saved_hugepages)
> > +            saved_hugepages.clear()
> > +
> > +        cases = _get_cases(cfg)
> > +        _set_args(cfg, local_dmac, remote_dmac)
> 
> You're doing way too much outside the test cases. Don't optimize for
> execution time, let each test case prepare a clean environment. If
> we want to optimize for shared prep we'll do it later in a structured
> way, inside ksft_run(). Not now.

Ack on all above, but here let me just explain myself/express this feels
counter-intuitive to usual coding approach ;) hence my previous attempts
to put repeated stuff onto lib side (and pulling out common things
different .py do onto common place).

Anyways, clean env.

> 
> > +        tests = [ksft_variants(cases)(test_xsk)]
> > +        if not cfg.veth_test:
> > +            tests.append(ksft_variants(cases)(test_xsk_busy_poll))
> > +        ksft_run(tests, args=(cfg,))
> > +    ksft_exit()
> 
