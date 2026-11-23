Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468260;
	b=dDM0av/lKHxQww4qHkU2i5Sk6lQwNIQ/F2Wsu/99c1DBBkz7PH2PJOTtxn4HsiexQxvX
	 QjyKDpwMrlMjj5jpKZlLI8b9wR8CkUd8IQyPa4JRAYjyDn3nyPZf1TaU7wl2d4Y9tpE9B
	 XsZ8TmH4pRDnY1WypdY6MC/BrpBL48tPOPkPvU3Wl8TM5x2GVN4/jbwd3JdXy9JeQu9MX
	 J3H63qHhQp38rZIaVld4GHPcZ+v6vh55ZPPSslrTaLMxktXNGnELnxVtFFcWPb6WpOw1t
	 2u7Kp9HqAMIOl3KNdyQlEpDMA/ADTL/zk9irft5IbQe7Mp8x1KczeLhVRm69nW19APw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468260;
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
	bh=zhHtrZIgyhB78q5+Uy67PR6W001FhcqbJmTLwQPLHa0=;
	b=qbp0aztXieisar52JBx27yJhwDL7nten8TocHS7JCgMtygoifqhphOBbFKmMLaBClj+8
	 wLv46pe6AEnF4uWsQ5F63dn1POYAnuPrHvNbsgPl7qMYErU7LSsIJyeCXoRFQocl0mwEY
	 Lw2Smbb/6ZPwhYK6rzObzxVYE0RciA/5VOevSMm7HWjCytj7eK+xrvboMgpGTWUSMx0V9
	 1H3Ph6nt1TO97muxOahypl0q5SPUJC26xxj/INk/owJgsc8p0dq410O4WAzXoEeyV+KS1
	 LBX0qvEGipnEo1YsmbxNLGEn4Zr+Vanm37DpVPlMIDehBu41Hhd5woZkFTjWC26+gSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzbzo6NA;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OUegDXML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F30606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzbzo6NA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OUegDXML
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795468260; x=1827004260;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JFC+ncHbQrHcFsIfjhFtWc0J8WvwB5+VodH8NZkSdFQ=;
  b=lzbzo6NAKSNrz4lxRpgO3sfJAXl0Zs3sZMBz9woAgIFkLFB/dQuD642K
   2cT7ZdV1UqM3dhFVBBSlEau/zDsp3buGLuhppZxTX3jskwOR0SV2/h4sq
   HWxAxEiYGvSSohHr9A1h0p5YT+5M4QP/GqXSuOWvMCC8BenLz7deyPeB4
   UcelTRgUVQaR8R/k86yyfafD8lim4PUvnP6ZvgsN/xXbwMuPXzFcyT8Jy
   Xsavpl9w6gzFmcelCMjIbzSmCBs+4iSaWLVR7FqUN/NifPyVmV5ZewvT4
   rIDE2NYy05fSk4CW3TqUJF2GMm6r3aFFwOK93jLlVQ1Yk5c73r1/OuTKr
   w==;
X-CSE-ConnectionGUID: WrtOX3coSMWADQTDo3pFew==
X-CSE-MsgGUID: 3EW8lpkHRTKkH3Nu6a34Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4184414"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4184414"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:10:59 -0800
X-CSE-ConnectionGUID: Wheir6RsRpeJiMj8+8D67g==
X-CSE-MsgGUID: 1dP/w00wRQ+ol0RTpBFgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11768012"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:10:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 13:10:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 13:10:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 13:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD0Jy0UQXsUKJZPhIxKzoE4wr8uB56vMqr0fny6GNMDNpytFprhJ7isk8GdfapPT86BYNbPTioQxEWLg+Eph424cn6wjYCETkWs84O+QGgPGkKZOoPBmZNR7cZp+kPKo5M4v6uOlp3Rw82QtOZjYQmgXLn9i4mWTqyQs6tCMCdvprA7uoM9AxZ8PLA3Ibt/NX+Xh+eRcD+Totm9JrPRflkto+SXUynuM4J07rHSNqEKVRn+dW98we0cybq+uwN+bs2Hc8uT1KVz3uAtsi1gd+SQMv4NxD2om74C3lLztpAX0T1AMRsMkEgtz/j28VOaikE0cp1R74bCOLdDqeyZh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhHtrZIgyhB78q5+Uy67PR6W001FhcqbJmTLwQPLHa0=;
 b=WIwhu90dhckKiHlvfQMbH+nAcFuvhKr9xyTvAiYvjNv5znZNZ7kCEDDVPEKG53vQ7aldENgX56BTx4rNUmBZvU36JtgScEbWmXYM7GAmpwCEahi9JMWOU1OpAiIXLthjPy4loICfogelFuqCQDFJ1PttvfqyjAjTXjssrM09oCH7gjtwR0zTUVbjG2FjSqRPWyOF+0fKzx/G77j9PeYleP1K3WojUYAEIrM4EWuaFwOTDxTCL/CUxESB9upclbB9t0IkVaduNsaj3feWZ1lTt12n/TAfLmPYRO+ZC9rDLB1+/jzbs6Vr1p+8QY4/lyXDxtgW9CC1J7IoCF8Dr1Jfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhHtrZIgyhB78q5+Uy67PR6W001FhcqbJmTLwQPLHa0=;
 b=OUegDXML6dxzpANs+zjxEKHEOZNIqJBptkuAyVXNbGnaTAqfbvWm7pX/C9qVB3nBt2EcUqGmOyOlgBElIsz7cGsNLBiUwh6ihAAghpfS3N/Yyos/zSdrYO9J3QMua1qjPrbErAl3hd8b9G00NMcafV5rtBbkslZwgRRyhRyU8rE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by DS4PPFE90FA9325.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 21:10:54 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 21:10:54 +0000
Date: Mon, 23 Nov 2026 22:10:48 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
	<ahmed.zaki@intel.com>, <jacob.e.keller@intel.com>,
	<intel-wired-lan@lists.osuosl.org>, <anthony.l.nguyen@intel.com>,
	<przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH net 2/2] iavf: don't unintentionally switch to symmetric
 RSS hash
Message-ID: <awSr2JTNYsEbCvAW@boxer>
References: <20261123205600.1794292-1-kuba@kernel.org>
 <20261123205600.1794292-3-kuba@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123205600.1794292-3-kuba@kernel.org>
X-ClientProxiedBy: DUZPR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::8) To LV2PR11MB868673.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|DS4PPFE90FA9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a05ef29-ef00-49b9-d97c-08df49a642ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ggAqEELGVm6h+DQOw0OW572CjLWM74y3fNHaEKf/JCd7x58dbj+Pv04WAoxQFLuuKFiA1eXxCnS//CeKijE780gA5w2qig2/tobPPUBkgnJ06kU9X2uVnYQvOVXEIntN5x/tEYmhZ+caWMzl9fZwqdEecKDys74dSQMsPBVUmlfhd+D8mXbqW+LDZKh25BcY1m6jVCpYoyQdeTSkN/VYbkoaqEMGEwCuru3tkAjh+G01fdosAbqbw+Cv7OxgEr/p/wL/2lo7PFdDJXMeNXzb8IWFLWtmLWRq9E6aZuyJNCiN5kOJLWkgreBb3fwehKXz6S30fz9wysdlMwLwv4uNKiR+V5xabSyMbKBYLwjqLHDaa2VV/X+FwI5Uq3+EuGW54rtQ126jqbZkcSqENLemznlzHtR2wLgcBnRr/trrpQeqwOalGoWjxB0VpDVouzViButwN/fUIeLcHY0T1ShiEn/LFJucYkKQpNoDZ6vb0qfQ6vLtGsFogVR7DLlEdYIPuJ5PA9j5Awwf2akBDG0/b9ZQdXWQdmjrOuOS6XwQjHPiZ+p9ljDEOth4J5IQhv1y4MK42/JO2stNCBoRL6GHsD7uUSVW5no58PekHKBgT2d3VU23ya7mwWbeghnw2SX/8suqn7xcl43RRD/SIe5zNVLbqw8bhSbbqmzdm2tiHxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GBtaoLXC9Q0mCMlSTurTPcayd2H98EulE6PQCeETwKbjgwAkDSKCgJBo6UsJ?=
 =?us-ascii?Q?KR+CWFHRbx2RMD7eoa21BpzIuzK608gjVvHF4pUTETzIbJxYS15EQzdaZEZE?=
 =?us-ascii?Q?zPgzbtfVm3jPjMF6GjxmBHu5ed0xE0IQ5pY38r4e857MPwuN6tgEd1Hs0HeW?=
 =?us-ascii?Q?s0uvCk8l5IUqbM+pyHxYXS/2AqZEVlGnX3aYcwhiWI7Ck+YHn2R5qeVm2nsn?=
 =?us-ascii?Q?q6Itlfvoj1GY0tiD1ZN33uumJC+viy31TDv8ht5Bc8TE7kU+0EecLOef+O/X?=
 =?us-ascii?Q?n/0COv5cKetL3dK8K00AsJN6nqQoXVctpGsF8WpFvPL74qlzZ+/OsgmIkbRr?=
 =?us-ascii?Q?69YbSQD7xthcCHXG+WX40k3sCAPzUiT70ySq9zJ6WTQhKsVyTPaCT5WduKN5?=
 =?us-ascii?Q?g/BwHAkJUf76TugegtRxbGQJ8yqvK3bZqsgest1coAxEFaIj26JRULnDuauD?=
 =?us-ascii?Q?s+uqO8jdZkk4GqNqtbnPookMwO7OerxN6QIu+VwkjnL/rhRySdy154oqlaS9?=
 =?us-ascii?Q?0hoqBVhMpowJXEQf3pJHsaNo9wmS/BxebUt+9k20k//i1Eqky/o7d6Hh1a0F?=
 =?us-ascii?Q?vKkvibfUonwoVlPmbThQKgvTB8NHn8UBajnzYJiyy86eFeY5eZvEH99JDZMV?=
 =?us-ascii?Q?NhJQrNOGVnXD6vNSVBba66INeHhn5uFG5gKwd2v3RnYSezhOQaFbgwtDIH1u?=
 =?us-ascii?Q?W3OK8od65gWEZcXkSVDlJL8Hi/gDTqYDsw3ohCc2p402nx20avAPD5KFVb5t?=
 =?us-ascii?Q?ewBoPmxlfYpNMmvo7uThXg9yxFUd87L2PONRpmT0H7vgV0J/hbZ0k/UweuSS?=
 =?us-ascii?Q?OzpaM5ZEO9F+WP4VmWyEAf7Pkbk7X0Bhho1uX/L8MEMac41LItU6lsZpW2PE?=
 =?us-ascii?Q?LuK1efD9DOP0mdr0QbYGp67NVeyCukV8klXpFKmxNbk8WFth3TZPSOPulZAY?=
 =?us-ascii?Q?EpJBzuvLP5yPmVtM69TuN/aOcxw/7RJsxttp53OEk6TxBWRQ1l9yK05DdLr3?=
 =?us-ascii?Q?0xMFgtSy+oBeSnXFb4yoAiF4mw73viaEyxlUV4x1dr8SxYphHDq2RH2SVhDt?=
 =?us-ascii?Q?pZBkMk89fbfOZwxQLfYZBG38dZUudAj6yv6rcYThxIKlogpgWtxMfELwH2tG?=
 =?us-ascii?Q?500hvx+80SB2rPi1a0RrZPudJMZu7fBpWCpd6GXE9jbjqC2JGqpGdlFme10d?=
 =?us-ascii?Q?c5/NNpSRjDiA5P3jGLBXvnPwC3QqRrCCkWtMi3eYDJD6BSk8ivTksMaNqWf2?=
 =?us-ascii?Q?y4UvhDfpyXdzfvp7mzaFND0HvKk5JPYmXW3q2bDE3khzi8mpdAdZxH42zX5E?=
 =?us-ascii?Q?2iPUi4UAOaxbgSitoXqtudNOiL06M78EYUU9QgZudgK6BqbV4oSGf11ePLSV?=
 =?us-ascii?Q?7NwIACKJnjzGGxZOFOaCHHYqIz5SPwddGF/zVlytjWlIZPzpqHziAhZ68e0b?=
 =?us-ascii?Q?hjyfYEUZmBWgj/kUAIzQ2Y1ie1yM7whtMVi+52tAHkT3mjuWoLzYSIgCvl4e?=
 =?us-ascii?Q?jkdpe/MT6nZEaUC9ESRqPipE7UnvzioJUCO09R+ELdksGmQVgFlYASRwZ5Sm?=
 =?us-ascii?Q?UgdYGlc0Gb/jNIcA43/KpjNsgtAOr16vvgpPwy+48ThrVbhBvzwPdCw4WEk9?=
 =?us-ascii?Q?JNgAS4vcPEaPZmd7mqd0GF4VFSGoFdqmL73w5vNTjCT1XzYjbyy1k8QaGtRG?=
 =?us-ascii?Q?fPamwgjrXEUmQeu3GC7cNdetFekv2Abk8hW2ByVLsOXW/vx0hfi2gn+4Yr4f?=
 =?us-ascii?Q?UbyPrNV3fJ9Kvtg5xmk6zyWGyqVLorM=3D?=
X-Exchange-RoutingPolicyChecked: Si4iabvsOrivVwlvtD1Yu03Q82EPAw/CbOL85JsSDpHRoq+2iRm6KXgZ2Wz6aau3AY9/Guu/LPYsfeTHrymtRxwyzkkuMQvP91OW87PMRyJPAwGAjxsY7O/AP4sNQkL8FFzRdk2JqbIZWE0oRma5adzVfK4yVXD3POkwfOWEEEkizkOAKSNL30gTzvTirrgP2CBk/MPDUr5st26groRgwmLpHvOwO11sBE2d4XbRBp+RHYrqEhdfC0rceW1wjnN1kUNhtFpXMukLONvbNzhZf3HlXBdEWIyaYmi9mPtR0dHdBKoA4CZj15BzCaRnLcbac9PolHgjUlR6v3RKnHrMOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a05ef29-ef00-49b9-d97c-08df49a642ac
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:10:54.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OGSpl4uz06/cEU89s8HubU6o7QMVoZ1vg20EoIDZyJca1d/t5AL7po2u3WDFPvntdTXi2FPJvUE9ZW4KinB4M6b+3s+nw8OZndS0Xh+bd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE90FA9325
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 12:56:00PM -0800, Jakub Kicinski wrote:
> RXH_XFRM_NO_CHANGE is 0xff, iavf looks at this field to check if
> RXH_XFRM_SYM_XOR bit is set, without first checking for the
> special NO_CHANGE value.
> 
> This causes any ethtool -X invocation without explicitly
> specifying input_xfrm to try to enable symmetric-hashing.
> On VFs without input_xfrm support, NO_CHANGE would have
> returned -EOPNOTSUPP.
> 
> NIPA HW tests would catch this but there's no runner testing iavf.
> iavf was pointed out by an LLM, fix was compile-tested only.
> 
> Fixes: 0dd415d15505 ("net: ethtool: add a NO_CHANGE uAPI for new RXFH's input_xfrm")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

> ---
>  drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> index e7cf12eaa268..d81b2d6a68ac 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> @@ -1824,7 +1824,8 @@ static int iavf_set_rxfh(struct net_device *netdev,
>  	    rxfh->hfunc != ETH_RSS_HASH_TOP)
>  		return -EOPNOTSUPP;
>  
> -	if ((rxfh->input_xfrm & RXH_XFRM_SYM_XOR) &&
> +	if (rxfh->input_xfrm != RXH_XFRM_NO_CHANGE &&
> +	    (rxfh->input_xfrm & RXH_XFRM_SYM_XOR) &&
>  	    adapter->hfunc != VIRTCHNL_RSS_ALG_TOEPLITZ_SYMMETRIC) {
>  		if (!ADV_RSS_SUPPORT(adapter))
>  			return -EOPNOTSUPP;
> -- 
> 2.56.1
> 
> 
