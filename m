Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468216;
	b=GIygG7PBni1/cHz17Wy23umVdvwiPG9kwYmuXf/qgD6yGaarFDwz8Q7fSUIv+ipI0MDf
	 ujGTwv16tMpLrCZnR+KKZwAUEfQ/2+2ECwJulbP1KbWR0I6msKGjn92tG0yKCt0k76Vu3
	 Unw9pIEPxdPGfijij0G2sxEOqu/LTgWER3O1elhJMogMPdjclGAxC/idni0H7wiEVnGsb
	 RFffIrgVGT1mJAKFw5GOhY1083o6TFOvzaqW5Mx/DuFoyV9rTSUqUH39yHZKLrC8auuN+
	 4HP4p85y7fY9ZA1Zl53XQSwDa2Yph7c1ShYwDvlt4Zt4X815GfO/iTW2yKJSkDvEKaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468216;
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
	bh=g0nZUoswR4PxVksK+0kGJPYyKyx/orlCcgdXZQrN9YA=;
	b=OQLvCneRqIxWyLLz5uspQL0B0h85+W5PkD8NPV8RA8hcka1X1HP9VOgc5Zi4WvjCM/KJ
	 cU39gmNYnxQeIAQZkdbPl5ZK0JX4GGJxt+1d3fJMerJRwEiUp7logR/4V4RYg6hUz4Oob
	 XqAT9lbMEdFJck2eguF6RyoF9xSAKrIEZ7T3eEbyQIdPF0VbsBVUu+O3kGJhoC5DKFptR
	 Bm6byrhdcAxWQWF6wXjKpiBP903MRVDwOzhyHZP+D+PcMwZYEstxHqyzBNGRi3F4zqHx1
	 /aQuYes+EbdN7KjrBZ7+MGT/hHINLJTPp1Ya8fjuyU0K3sFc/kShlDdgPekdOmJyk/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XZW475UW;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DdH8V9ON;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9305D606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9305D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XZW475UW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DdH8V9ON
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795468215; x=1827004215;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YTZQlTqdto9yIa3SOhk9vk08KiKYsLbzDqx+z6V3VY8=;
  b=XZW475UWnpxFnjdWp1f2ZC8YmOxxI/vzGET0YVhfleVkDwMlHp88hTHC
   2dcZY2JugqcyNhWDoIf4/V3rLP7XiMUTjgyHWgPpRU2EtY1flD2j7Oc5W
   jbl1glisVR+m8L+sDjSQSAeIE+h42XZZxxgLWatvSSNzsvnKgMODgL7u0
   SWBO3sB0jLCSyz0ICfNot6U04z/JIVKhwnQgZgH24XxNXJjp8p6eOZfZa
   m9mJMMUi5qmyHWaHM7GyEZrt/kR1DaDRTBWVVf2EsIH6KbGvClq8k5IVY
   S8Q68JTfNjR0kus0vPwY66a3HcR9m4vg8RknnX/C4YjsxCUpvzoUaABSU
   g==;
X-CSE-ConnectionGUID: 4q9U5WpHQsKRbHL6DiCA2g==
X-CSE-MsgGUID: qvDXozPITiWLk1l7Z1+Ygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4140883"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4140883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:10:14 -0800
X-CSE-ConnectionGUID: iq8Zqio9TYuuO78TNRKPTw==
X-CSE-MsgGUID: S/wRZOm6TGSD9bDZSzwXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11295459"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:10:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 13:10:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 13:10:13 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 13:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3aJgMVgnoZzSWifIFOuhWUj1FYfyC9KWlMvJjMEKrdlGiu4k/hIDzLPPOWP198CkpmsH3msBMep2xPkX7q6h7AyWGmAADrRODR/pFu9mRv1jcj99lgiNAS+YKWCHKndxpqDVNCBEqtSXIzXmwBHglLiMtSWC+wNq0Rq6xalFB7oFmpjmyzgB8vr9S6hoBOJ2ZSOu1NZ85ubRn4d56hyQzQiV3kVun5mJ9JlVC1wFbE/xdPXNKwjOEJ43nOW8354kQnhGmABqrJq0SmcaVEBI61pvUVteTRRirugXBtXnlVVn8JlcrmDQp5XkhiKUM/Z2SoZ0/7H0GkBavbzrV/+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0nZUoswR4PxVksK+0kGJPYyKyx/orlCcgdXZQrN9YA=;
 b=JnzgX3JMdfdX84MbOkLSZckQO87UAUSDTj7QmsZxU+HaNUkagBnPGmsl6b9XKFDFPzNT/PUvQa+G/oeXueTiXyotVGLoZ3I3S3GBd2es/xQaTvSaqlzYW0QyQP/61JmLYunQ8EmteI8W+sbbTQ4crMFDktwE0u2CBJS0ovLfPZMmlXUj3Xh1j7JG2K9IWhfwPV/6a1rPLQRB0Hgh3uRz2maEFGJPWNPAtER/5knTve2VszNvfTNK9CB9xmCGe9jDyAkELkbiyInm35KReTx+14Obr4iMnrrxLyr0v7TXl+Bo1CDETqyUhrhybW8TF1H2PB1mYFesQsIUHzPD7K9ytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0nZUoswR4PxVksK+0kGJPYyKyx/orlCcgdXZQrN9YA=;
 b=DdH8V9ONAoyjnesdbTjcGN/eA7M4MFKrVFU9MI9pHBuy+5veNEYXVVXildhf6FvWl/JEX/cUlJyrozUciJDRe63tctFVQEVeZrzh/BAN34bNL1RE/DiVUZk/IlsiVA6QDE6i59BQIPI6DC0T6TSYVgNlU6kG5Z48/b8zmBOFv0U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by FT1PR11MB683923.namprd11.prod.outlook.com
 (2603:10b6:170:24::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:10:11 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 21:10:11 +0000
Date: Mon, 23 Nov 2026 22:10:05 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
	<ahmed.zaki@intel.com>, <jacob.e.keller@intel.com>,
	<intel-wired-lan@lists.osuosl.org>, <anthony.l.nguyen@intel.com>,
	<przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH net 1/2] ice: don't unintentionally switch to symmetric
 RSS hash
Message-ID: <awSrrR6RfQYjhPU1@boxer>
References: <20261123205600.1794292-1-kuba@kernel.org>
 <20261123205600.1794292-2-kuba@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123205600.1794292-2-kuba@kernel.org>
X-ClientProxiedBy: DUZPR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::13) To LV2PR11MB868673.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|FT1PR11MB683923:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f33119-41ec-42bb-3b7c-08df49a628f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: bKnaFRvtXqSAVjdOLIOa2EdLGU1Le+e94JAzS65DszbYxBbcIr15AAss+asvCbKAsT9GHsmrKP66PEYPlbXZuMnIalQ+kEHCM9J7/hPfYl2zzG3QZ/U4A25UNLg55FUXRQNtSSTe1R8I4FzcogKxiTPAkCkKvtgWvs3sujmNNHKuuiyVktPn5vt24Y6DYzBhj28qp7M5xJWdOdYWXN4NVfnAWxrVUXsC4/icNYqTlkL3jIG9LSdqeYiQpkZ7L6iqexJZ9SmdriKb246pPNb649c66mzLihGotElMvk4kXdRjWmpkTpN6kFbz5u502pJQRzzknqqlZnShsh4pT+Bff3jZJTI4i0V1h+CyX3ria66Npw8B8nYDNPjgRHhygbGZ5D9HDWAGWdRyW9Mel7xjBwcbg7HK8ucNq5vpE+eoz+nuffibcCEVMPjTpWbxaBd8ySoAVpBBWIAzMpJx0rFJW6xbnFz7a60Zj+BzLXu2hsZ1qXLDce6PtLqQcwrKaar2VHuBAKoF62luM3tbrp3MUZ7Mawn7ao2Cj3y4piGn1OGnzHVYovTiBf/MeHdvr2SZanx2MbRmvyr2He5G7cvzoCqwIfvrphJoErJfLEPV+1UlSyVx2zBmEwSQFOLta6IvuDahm2xPQINDlEKI+gXZNcI4y3S8oEaHrEoC4ZIgIQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pN4focQie9ODriBdHDJ32SMbJYS7zBEzuJJPHZsOId+mUMwK0AAc+SexF37B?=
 =?us-ascii?Q?koHsyprEp+olSTlrB5Sgcvm0xZx7YRs1OhHJWBshTHOKwsWO31bX9xvOK6ZW?=
 =?us-ascii?Q?85LK0n2M0hA/y/9lXnJ62nEE8Suqy/hrVhONoJlRurZKArEEKrgirG6uyq1Q?=
 =?us-ascii?Q?CBOc/+3m7vMdw0Q+atkyFcl0tu0Wg1xXxF8248I7HuoDF0q8+Szd08f9sQs6?=
 =?us-ascii?Q?h/ZHPmR68M/JO1/89oGbL64k+Hs0TyACk5bVA2aQaVe+cYAtK29G8E//X2Zx?=
 =?us-ascii?Q?IlBw7PItHF0XIa2dmJjd/s2l5wDKy1ZWdmGUwbS8aFQ1+iUB0NE0l4VTgYI3?=
 =?us-ascii?Q?wkkp7eMyRMiJakCx/WJUhTjpyVK5tDFXKfgGjpmxDo1Dif5zvduH9NmCGvDm?=
 =?us-ascii?Q?yJqu3Ayo/lqWNPhw82uBJRWRDYS5hRXsYFHXoMmMELN1rVzrREzAwoy3Xpno?=
 =?us-ascii?Q?9C6N1cXtYRB0cs12cUOxbGRH8SHiywXBCqeYQwtHilZd9RKr8RVLPKTcwCeN?=
 =?us-ascii?Q?prNONPjMTIGSMVrf4ix2xZeffFNrIPvDgH5gzItcy7G3W2jp95C/egM+aFzn?=
 =?us-ascii?Q?1CBAR5S3QyFTvQxSIx10/DYgV3/5aU+zewJQUZ4w9Bk8ElugHbNyRqEduofQ?=
 =?us-ascii?Q?WQGuPP5p8p2fFW9vOLpxzX4IHencXBqjwyV4pyCFv2yi9MMhF16e/a+tKs+p?=
 =?us-ascii?Q?3P1h8O7wpInFE7FL817TZoXoJpM75yyYnqbtw/G6hghdnlKekRhfIvcgCy9x?=
 =?us-ascii?Q?IqoyCgyR4je2gkNtMI2+EPhMf2jcO7L1aPBg7VRKIkPT3sNtnkAxY7nuTkph?=
 =?us-ascii?Q?fJbI51Lc1T5xVMufKWCnD81FqhLD7za4h/5V5skQrTUhwt0xecwnboaodScN?=
 =?us-ascii?Q?sk3K0WPB3s7WDNS/DlIDVdwXmCyWrVk1y+lX6z6u+oBmmaJtkuHyH3n8pdUc?=
 =?us-ascii?Q?HMmMEjpgOaAVH01RO/dBkXv16N0OuaxJeA55Tqf7bgUUdxcCg24OcOCqWfi2?=
 =?us-ascii?Q?VTqjiwgf/HlLw3ygbC1/DE5ObjQsCUoNgCBmrwl/ah0aie4fmCIQXOCh8pVr?=
 =?us-ascii?Q?v3z7SWKR1tZClBSG/piHp5dIHswJN8wrpSKrf8tGnn8t0V54/guIHyNkaCjZ?=
 =?us-ascii?Q?d0FjssBTPg0Y0Oc7Fnt6//k/QAtpJaZP2pJCWhyCK6/bqO0BGzBL4OUvI2id?=
 =?us-ascii?Q?gil+N7JzzJy6xgd4phOm8XZymtTxrZboVH2qwhA3z2EJbrN5XGN5dnYB9fUp?=
 =?us-ascii?Q?hFVjkHtqL9Yml5pGHu/pm5ZzinaCIOtFR6MsyoiuRnyVgKjSnmVsafyp7fnR?=
 =?us-ascii?Q?9UZmZ90krYp/cFR4c5YEcU20P2teFloWXB+PB64lHcqMhpBUlKRuS4hys0iA?=
 =?us-ascii?Q?viZ3F/uyjiEGKCNbtgEs28+Wtm0rTKdExuIiOOuIrRAC3UFuB+6DDIfrpZjr?=
 =?us-ascii?Q?qqCJEe067Q5IQ81p3o+jUJFft7NMyF+Enq7S/Qm4lP4EbJ+mClYB005iiHU/?=
 =?us-ascii?Q?zbWLn2sUqZMVuAIXDyx+/t0ict62Pmlc4r43j1rXpYQDH9Zj0s0GhOaS96AG?=
 =?us-ascii?Q?MzlZRt6Yzmktrud3wbaFJRsZ74QNmosZVUOzU8O+ZEp11N/dCzfxtrffoPYE?=
 =?us-ascii?Q?ha0ySianFts5zwQ/RqWuBgg6Z7m6pid6KftKa4Gkc/NKP6KVnGdKlssnyvR9?=
 =?us-ascii?Q?3m8NQYUKLdTZ61yOQVQA2XZ+UMvigBKtwjrD4Nqy0aCJirC33jAe4uZ/qIS0?=
 =?us-ascii?Q?7PcOKfkUW1CJubEMiTNaJL0zUdy/xAg=3D?=
X-Exchange-RoutingPolicyChecked: I3waTacUkXKHvvTV59UgD3kR7aYHWCNj+KfN6ym33guJLPkKeBFmiskiyp0Y2BZsFOloxc5bnFBPLwfL4Dkr0YTA4/gwmCHbOt0zC6Q03tW+7ohjY/nEbUotWtbKROygvPrVxbFkPaqfYiA+rA2PeVe2Isml4vBDh+HYPvzVFFbdSgrNX6wUfBGXCBetSKBA40CABIMMrWxT6UglLvf6enPaGSelxoExUdV0Z7JNlMWQHnGELeTTDSeG423ltZauOOT9ND80WvyEmjKywacxZfRa53hpOp2GQVcX0dczSeTNPq5D86Bqv4SqezJdVUDI2dBlau5hJxyi/WAa87QabA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f33119-41ec-42bb-3b7c-08df49a628f5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:10:11.2428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQrTNyPYpdjrnGx0LpRd2+HfsofFLNw10QNvMkMySpm+PilVVsItBZUZHBL27xOdYcrSXDuAwLqZKRYQwne2xPAMshpUMOcwM1uhsZGPeKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB683923
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 12:55:59PM -0800, Jakub Kicinski wrote:
> RXH_XFRM_NO_CHANGE is 0xff, ice looks at this field to check if
> RXH_XFRM_SYM_XOR bit is set, without first checking for the
> special NO_CHANGE value.
> 
> This causes any ethtool -X invocation without explicitly
> specifying input_xfrm to enable symmetric-hashing.
> NIPA HW tests catch this, and we have been carrying
> this fix in NIPA test branches for months.
> 
> Fixes: 0dd415d15505 ("net: ethtool: add a NO_CHANGE uAPI for new RXFH's input_xfrm")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Let's just get this damn thing fixed ;)

> ---
>  drivers/net/ethernet/intel/ice/ice_ethtool.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> index dffa213734f1..8f13b7607c9f 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> @@ -3681,10 +3681,10 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
>  	     struct netlink_ext_ack *extack)
>  {
>  	struct ice_netdev_priv *np = netdev_priv(netdev);
> -	u8 hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
>  	struct ice_vsi *vsi = np->vsi;
>  	struct ice_pf *pf = vsi->back;
>  	struct device *dev;
> +	u8 hfunc;
>  	int err;
>  
>  	dev = ice_pf_to_dev(pf);
> @@ -3703,9 +3703,12 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	/* Update the VSI's hash function */
> -	if (rxfh->input_xfrm & RXH_XFRM_SYM_XOR)
> +	if (rxfh->input_xfrm == RXH_XFRM_NO_CHANGE)
> +		hfunc = vsi->rss_hfunc;
> +	else if (rxfh->input_xfrm & RXH_XFRM_SYM_XOR)
>  		hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_SYM_TPLZ;
> +	else /* input_xfrm == 0; core rejects any other value */
> +		hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
>  
>  	err = ice_set_rss_hfunc(vsi, hfunc);
>  	if (err)
> -- 
> 2.56.1
> 
> 
