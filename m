Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532719;
	b=Or4rj8+UsuZnBgf3/Hu0zfYwhtqx5kWSQU/Acc72paF2MR2mcEOiP0+hG+DSzi2oW5lg
	 vpJxvsqQ8TtHH2kCShp4k8WklCg8j1YV0Jpk/TDsTBVjZZEQ322AW/95GlGE4gxv7xr20
	 YSwqmj0hRA52i8mGxLyb9NF66B74VMMU3inPIGNgbQNKAn7+lKWSptbTQZBZq6Nsq0gnH
	 eSjIIy92GBc31L5jkoJjwuSxRgwm6r/KOGbplBuYBLMKEaiSTM+SJvVPQXCBcmqf9kNt/
	 AgaaPjDNOoShZ8r/c7guV2448AUjvgM3APtFgWGsZFnRv2t3D0OqmqujbpMlD7zX36Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532719;
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
	bh=LhNLzBxmb/lCCdc4FgrO3VavKNxRL6mUR5ViFp1WZxQ=;
	b=oPDhkb+FPLIMALMPJAvhQYT1kR3kr5pN4a38ATrgn9rvnq6n5/l1lDqChLBWOXoQ2Qh4
	 9SDgqoUXNX8IMM3pM1w2BRf73UBHuftxM3EUA01bGXCb3+0ypfR8wQj+MJ3eN+2/Wl7/R
	 6vGMpDL7UsmStq5x2oI7CFKVybxaDQjK0zB4OR38Oznxv0AmZU7OESVAFWYLfOF2PNx3z
	 2ALVrGefnDSiuy6Ef2yfiHmtB7KSPCzq+wX45epjjv1ylSDAfUp43ul/pPc60PT+BPw7O
	 2VXT0GBhPyGEozmBn0rry2Ms1mXaHfzApbO659IgN888d5F5Mq0s1Uo+i5AyyAjmA2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FstM8BfT;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nXsYzewP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF7606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FstM8BfT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nXsYzewP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795532718; x=1827068718;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=by/bTpE/ccM+9Tis2qNU/+Y23QB/c3ePx6N45F7QPKo=;
  b=FstM8BfTpCyM85A5QDnBmj/KIVv7JKwCgJix2tq+Sp57oicnfeW3RLBE
   TqStaqLOLPH7jdWH3z0jfMGGty3K3cy7mWvBYfafdU89ELUml4O9bgLj6
   EJmw3aSKbKKCDxz9LbDNIXn5XQMpEnBcVbhgWo/fhjsjPCNxrmhFB8fbc
   TkjFU1CuEXDFb65pspMRmxhQqze63tmIDZ+rDwuGTdze3iJjnA9f8dPmB
   HzPqOkqf7OUK/3uuul/AJgiroyzhezmV+c2c29kAOOaMhbfyV8adTUWrB
   tujtfDv/OZW+M1meaSbqlihw/udkUr0LtxgRtSllbb0b8CzV9FTfzgjWw
   w==;
X-CSE-ConnectionGUID: lVjoCJz3QFy4gqIaG7xZjw==
X-CSE-MsgGUID: QWLSWj+RTDmaC5q5Kcovwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4269770"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4269770"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:03:56 -0800
X-CSE-ConnectionGUID: irT/SKBWRLOIeiMcTldQiA==
X-CSE-MsgGUID: zbyPZwB5RBOT0dhOdP4ZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="13605568"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:03:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:03:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 07:03:54 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyw5Jc/maUIFxh8xRPA3y4SBkh8AQcVWQ1xMLurZFL1T1pCHAgKi/BS6g3TfjWnAnAKq5VirFcJh1HnRWF83ByfSRMS8ktxuftTSSkn6EdRcrqqHvEGYBWTGUtq6kMSetHCqCWFy01N1mfwIY4V63t/DeDl+mkjdHiqxOOkIExjdxUx4pkD6TV68Ff2gnIbEZMPYGAQCRsJ4Gw9MRmO+JTg9CEMaW7+6DLJQEnVm/s/5mjikQNQx0xBVeBryg9eVQ8TomnEJc3zCw8gt5fOgMkc5cS2D9igbjajb0aTA3+6kKCWcORCODfVIuCskzo1Ny9UkH5JsSk/YIqMroDhxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhNLzBxmb/lCCdc4FgrO3VavKNxRL6mUR5ViFp1WZxQ=;
 b=qe3WL6f7r+WsGtghV+9J4EdFD4SdmRGzK3wQPLXqJvcrauIHN/SAHt3DDfPKgAHIibzSV3BmTKk/OrN98m7vz+Y6GrYzWS6HfZlSH1nAREWTFYCV/CRuWqL0/ZDq500cOvpVOL84QcAzgOD5P/vfMelLS8tvLxzm5NctVUoE3Sf6jUraSbcgNTkzNxIu+KdV8XWDMBxvDW79V7L6uh52z4Bt7BT4iflVBCL/SpTrsNe+mbmXrzA6DiovocdekXmznYH5rDgJ3A3KrBXsFXcLji/xbBDdEFSISWx30hZhK1D+3/si2H5WmYCFydAmLIynYwNgBoiAmKLKhHAfRb/P7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhNLzBxmb/lCCdc4FgrO3VavKNxRL6mUR5ViFp1WZxQ=;
 b=nXsYzewPe8VA9n6d0QKonXCe5tLagnrWFW0pVW+S3a8tYjLRaQxHCmX+tw0Jc1HYAaNqGJix4UNfs3D+Na2zIXsKINLDjsWZHNjtN7q02wwcUFi+s91lUWhHOglLXJQ/wSIqLC6pzyLXaVvDCAGUKiTOfryIpLIX1Bpt614jKec=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by SA0PR11MB4558.namprd11.prod.outlook.com
 (2603:10b6:806:9e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 15:03:50 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 15:03:50 +0000
Date: Tue, 24 Nov 2026 16:03:39 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>
CC: <netdev@vger.kernel.org>, <magnus.karlsson@gmail.com>, <sdf@fomichev.me>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <bjorn@kernel.org>,
	<kerneljasonxing@gmail.com>
Subject: Re: [PATCH net] xsk: parse Tx batches in packet units for all
 shared-UMEM pools
Message-ID: <awWnS2rr3OT9OZ1L@boxer>
References: <20261124134808.1103307-1-magnus.karlsson@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124134808.1103307-1-magnus.karlsson@intel.com>
X-ClientProxiedBy: DUZPR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::16) To LV2PR11MB868673.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 6037b9b8-2bdc-46b9-897e-08df4a3c25b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261102123227099003|10067099003|11063799006|56012099006|260925021911599003|260925022911599003|260925021311599003|261026121527099003|261026140227099003|261021121427099003|261022115727099003|261022105027099003|261009223027099003|261021123027099003|261021135927099003|261102130727099003|261028144727099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: KqM01mUjS26p5oKEJmuqnzl8BU3d1tz/ajA4owkl4D3KVESeexw5aNz7qrpk6V9y1m0NygtRMcLpj5GLovkdPkGDaUNttcTLAg9ZwTtkKzrcHhpf8BBl+Ku4uEVl82JPNO/93YOPNVe5Zh+UUjyVzS+TLWS7+PjCtc8oB/0IV54tJiU7FgyaErglCwg7XG4Jt8eZXbhnLTwKxIixYLNpfjRz6EYio0eNk4TCi1bRDFrtXIbHJdKyPARvSfUaH06WJEs+A/t3/yLyM1LICX//r+dCwVSn9EZgTJ7QS+u4a17LjHm13Gd7JdKJHgWxdWHOoYF9vjS9lSsHrcW1srLnLaJp1IxR57wDxoZdnRDMvg6CrNC7eIg49x49m6tBfroy9JMXlT2EcqIVftMMkRUD7FmXQ2H+lqKAV5pFkhgUieZ79ov2TAVQUOE4SoGtAXJ/Oxzc8xzvRkiTidb0wjbOn5RhgWtTZGBgbtUOUd9FEFeXSGVVnCR796H457ItR8VGivPd9fUcfB8fHX4oiLEAUzormgXRNoVFnECq0wSSGgJBQLQ0cx0MlTDtKE4cTMDyxeCALce30YLByp61LoBhZx7FNnWbYH2dLGG706sRVEXPrl42IU4A2cBsrZytrgyv8IQgqRCovj2InmX/PkY4+HPxurfeA/39M/SweGibRPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261102123227099003)(10067099003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261021121427099003)(261022115727099003)(261022105027099003)(261009223027099003)(261021123027099003)(261021135927099003)(261102130727099003)(261028144727099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PYxrhD3FY+1CeQJZV/u8tLAdvkU2MA1edmf9Z0pswzoIV9KdjJUrv5c7fXfo?=
 =?us-ascii?Q?qNvGwCPyzx4yhn2WnvEuC9PTd/GL6NF6dDEH+GMKgioqt0JvVD2ES7vcQih7?=
 =?us-ascii?Q?AyNHC16HWpOSNckTE4pW2jKvP+V1w8PMGn38bvl06f/uqMLJ8QWHZS9LIXka?=
 =?us-ascii?Q?edHpjeWaQgJaWIri9mcWA3dlbE3dWeUGkwLNsWe+RNdvhwFc+IzuXoN01YNZ?=
 =?us-ascii?Q?9abtdM4vpksDwCri+VlotVJo2cI6bEE2viMuTGeWzlHkr169Hl7QPfhqxkKS?=
 =?us-ascii?Q?l68EgfURld/wXQLdCdhxZq/JmkZ7UsTm7hJMpL0hwW6K+DLM1vRKnY4rnd5H?=
 =?us-ascii?Q?dhvDCpilvtpcr8lRHGXFSpwHdxpABvhv6STyQaCArOj0J4BkRwsiHC1pq4kK?=
 =?us-ascii?Q?hR4BtOWd+9Hziajjw64X7lH4xYf4Y1qNQ9Fv2ZNWc44QCNaPHbhaxlsG98Ye?=
 =?us-ascii?Q?ma2oZqW6kwSEcbJzlHjDvzGDfpuk+yjlBjIV8DyAP//A38o7sTjjNQssTI+Y?=
 =?us-ascii?Q?2q2tKPd9qx019xnDbvowC/2L3q5h320WoPgnR2f45mFdOrz6+1c6jge6cGd8?=
 =?us-ascii?Q?N2togviLmCD/SLhLV2f3ignli84TzyrWX18+reGwbBhtAwnWWUcNmTaofk39?=
 =?us-ascii?Q?ZVRFvOyUCoUmw3ppI9fIC7PN9QBiCkfnl6YC4xE/UiZTllAlzi5GX77h3C8h?=
 =?us-ascii?Q?4KBnL1V9wvNt0xFBdfzlPfUGAPgmy03gEBBGtZhr6rNdG+TxBEJrR7uMiS/V?=
 =?us-ascii?Q?5XZ9EUWa2W186zKEnJrXaC7TzbaB4WV9VQPqP/WdSbzGNZ+GdAYSWhcymrA3?=
 =?us-ascii?Q?0G9q2LPhJPnvNAfiAsS37UMlRrI+RgEXPAjLwDX+sZjpH1Nag4douKh10Z4b?=
 =?us-ascii?Q?DUsliM7EdFrhqSuJqzCBrIpQsqT4GnBLAD5mZASMlxbzFp7Wb/rUw2WQE4pT?=
 =?us-ascii?Q?+IWzobJ4W5fiw2zyfbRDEKSZBZ0jzgCUrMwzgn5++0Cu5McKY9bWBqfgt30D?=
 =?us-ascii?Q?G2k40M3LqcyDSvMIdiWsNE4sHIo9rlRE6pp6f83LYDLBK5tjgGYnaSO07o6j?=
 =?us-ascii?Q?5485XSn7c5VhVRSESkXAgDkSeTEdqpFh67Zb2Y0salZusUlfwClzKWIRbPR2?=
 =?us-ascii?Q?AD5VGpSIr61mg4vKD5Nun1HiZLAnXt2qtFPMhJjlrc14PbahPIJ1gqixwwru?=
 =?us-ascii?Q?97O9jLBYrjXiFG4YutfUy/3zHZrEmM5Wl1SapdoHxSBQZlUvKQwg4Lc+yWaA?=
 =?us-ascii?Q?MEGBdeEMX2c0Dt3IHbMc7phuyUswMRgk5/1oplQ+LsKhO1WlggUU4IIU0qMy?=
 =?us-ascii?Q?WgqIlW9NUoMBhLvhOXCytdV2AZlbBbpgSScndDoFvn0yYGMQcq/bPalyt2iQ?=
 =?us-ascii?Q?BlQ5SdnqbPPhz7JQPh5sYz+jcwR23e7W0ge9GtyzhfRACfgodvX0y8mrmGiU?=
 =?us-ascii?Q?48cuNLqrBpn1KDJbnFowSom+JI6HkhZrcM8Zg1J5iGnNaDdwAcHgRmJ1iX3b?=
 =?us-ascii?Q?Bl6rOwKk+M1pza7yvLlkjupK0k+gh4U+geIAS24hOjQCOWLq5znza0s5x6fe?=
 =?us-ascii?Q?8EQWktVjkOIFDODsptxRoMw/Xr2WJC7fvfGRvSwmEJzE0KmXKT0UDV0J1XBp?=
 =?us-ascii?Q?xV/iSUVOWK1JUBip3rtR1PbYj4LUqDOIpUbvy6tgRVJ6mBXX5W4LDVifxxyH?=
 =?us-ascii?Q?uln9Wl4rca+rRrVJoJa1S5OPktwY/xmEidFexjqsy+3ogaJqw8xGUShyxaY7?=
 =?us-ascii?Q?q9O6JX85C6QyKtH1+11Jc4mVZZU56m8=3D?=
X-Exchange-RoutingPolicyChecked: PkT49GxPrmmqm7qQeGPbg8/7uw3z+LKK0Qx5/v86GQO4bi35EnoQQJqcXOo8qEFTpQz4CTkEve9glK1if+mjEiVuu9w2Ogulo/Fj9DQUWmu4je3MAClZQeIqtRvrIA2mwf2zecYJgdQr5aOhVqqq4rGhIAItxUj7hWKMP5H0GPXc5L2D6U7rqT9YlCsLBHPOpfOH6F3B0CT6xGIrlfML1FPWD5TbgMz/1DVk1t7zTZAb8+AiR+aIm4B7/4CvfYGNpOhJKLrj1/1xKdFHcSnZfjn5RJsbvJDEUN2icq+NQnEvO656K1YP+xwXFHVvoBGseRvL+zCP1PeojDKcbNu6qA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6037b9b8-2bdc-46b9-897e-08df4a3c25b2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:03:50.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F40xUO7UTLbGJayJkCva24hIz+hmc4NY4sqvMnICTfz2hmhYbH2kw8WLy4YczEseUtuCz8kysdMxRkx1G9csG25DmOt18JsBkYCFY6wWSBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
X-OriginatorOrg: intel.com

On Tue, Nov 24, 2026 at 02:48:08PM +0100, Magnus Karlsson wrote:
> Zero-copy drivers that use xsk_tx_peek_release_desc_batch() are meant to
> receive only complete packets of at most xdp_zc_max_segs descriptors.
> Single-socket pools and shared-UMEM pools with XDP_UMEM_SG_FLAG get this
> from xskq_cons_read_desc_batch(), which also drains invalid and
> oversized packets. Shared-UMEM pools without XDP_UMEM_SG_FLAG still use
> xsk_tx_peek_release_fallback(), which peeks one descriptor at a time,
> on the assumption that such pools never carry multi-buffer packets.
> 
> That assumption does not hold. Descriptor validation accepts
> XDP_PKT_CONTD whether or not the UMEM has XDP_UMEM_SG_FLAG, so
> descriptors from such a pool can form multi-buffer packets, as they
> already do on a single-socket pool. The fallback then hands the driver
> a batch that can end in the middle of a packet, packets longer than
> xdp_zc_max_segs, and, as xsk_tx_peek_desc() moves on to another socket
> when the per-socket budget runs out, descriptors of another socket in
> the middle of a packet. On ice, a packet with more than eight data
> descriptors triggers a malicious driver detection event.
> 
> Use xsk_tx_peek_release_shared_desc_batch() for all shared-UMEM pools,
> so that they are parsed like a single non-SG socket, and remove the now
> unused fallback.

Should have done it from day 1 - thanks!

> 
> Implemented a test for this in xskxceiver that opens two sockets in
> shared_umem mode and from one socket sends a packet with too many
> fragments in between two single-fragment packets. Without this patch,
> the NIC resets, but with it the two single-fragment packets are
> received and the test passes.

I don't see it anywhere so this reads a bit weird. I would appreciate the
follow-up with this new test case.

Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

> 
> Fixes: d5581966040f ("xsk: support ZC Tx multi-buffer in batch API")
> Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> ---
>  net/xdp/xsk.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index ab2e4fa87a4f..7d0701e0e025 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -604,18 +604,6 @@ bool xsk_tx_peek_desc(struct xsk_buff_pool *pool, struct xdp_desc *desc)
>  }
>  EXPORT_SYMBOL(xsk_tx_peek_desc);
>  
> -static u32 xsk_tx_peek_release_fallback(struct xsk_buff_pool *pool, u32 max_entries)
> -{
> -	struct xdp_desc *descs = pool->tx_descs;
> -	u32 nb_pkts = 0;
> -
> -	while (nb_pkts < max_entries && xsk_tx_peek_desc(pool, &descs[nb_pkts]))
> -		nb_pkts++;
> -
> -	xsk_tx_release(pool);
> -	return nb_pkts;
> -}
> -
>  static void xsk_tx_commit_batch(struct xsk_buff_pool *pool,
>  				struct xsk_tx_batch *batch)
>  {
> @@ -763,11 +751,6 @@ u32 xsk_tx_peek_release_desc_batch(struct xsk_buff_pool *pool, u32 nb_pkts)
>  
>  	umem_shared = !list_is_singular(&pool->xsk_tx_list);
>  
> -	if (umem_shared && !(pool->umem->flags & XDP_UMEM_SG_FLAG)) {
> -		rcu_read_unlock();
> -		return xsk_tx_peek_release_fallback(pool, nb_pkts);
> -	}
> -
>  	/* This is the backpressure mechanism for the Tx path. Try to
>  	 * reserve space in the completion queue for all packets, but
>  	 * if there are fewer slots available, just process that many
> -- 
> 2.38.1
> 
