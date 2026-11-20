Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176021;
	b=U9jeWDL053xHfjaUD9QvetA6AfuHXIy6kDMov4zHQtWZAxBQukiyVgw18j+L9jWANPg3
	 8GIiIasi5PlvmCs8xJCffWwZ2cLgspgpBJC/RRLjJSTp1jKA3orshuqH1R12ygS94dnEx
	 swETEKXQK/oYCsyteY0MEemcW6MPRTXv62KQRzZ7rp8izr41eNxvSP7KiALIdh87M7jVK
	 zQQeFJnjHAEzLwJMIUoZzEI/0Rtut6/xyvnLVEBVyR7hSY/oeHJQAiJA1kLmy8A5jk8t2
	 hFr+KVv+aEVhU9Cl1lwm/CZxkNlkFI66iuxHlYVIErLVT+DwOclQEdhmHSLTlQ45PBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176021;
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
	bh=W+Tcs4p32MimWLsPr4OwINRR0jBvzTSdbypNpnigGQQ=;
	b=zzEDTArLdykxkY3VRFuhiz7Xq4QxFW0VDkt9ijCxiRKx7NgyZX/NHaTXyKEwr3NWL/yp
	 u7mb+nU1wgdmKXMiZYqKqgV1vYnkR/Ok7BpiRk4eAGvz2qKHrOmKxDQ5ZcYzOkLFlTFhw
	 JuveSoThgbNRZVOi4IfPKxD24en6TPkcJyzyy6fPyUDdR0bi4TeLFfgRfOkkuzE6zZIBq
	 Vsyjce8j/CsZSzt7myNvvZ2oE2rG0P23GhIru1w78NNMY9MgeG6FaQH19ukzqOG3D4Coo
	 EEtQoP8+iemTF6XmFl+1YQbPkHOnJqdtuVMFIc+v6beqlIgcvsGBgSVFHoF1vePI2Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P3Ng8mYr;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=U+NGRzLI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67445606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67445606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P3Ng8mYr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=U+NGRzLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795176021; x=1826712021;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TYt32pZbmqc8WYhpd0UP75k0CEPw0IYCjUIu7Rus5JI=;
  b=P3Ng8mYrUt4YdcSTZvdRvrBMbmOrAypfxobvIDAKjGlDComEZIsSCqbF
   kaxu24Xv8d1pVloXv5f+5AcneRwMaJvcn6mUTLUsukU0ls31lZQ03gryL
   YZ28Uv/Kero3NgUVtzjx5vA4j423CCZ+myLUXIzWRWsKg4bin1GzfnsFW
   yEadINluzqEsgiA4aFhzrCx6Y1iWZ2dpWJ7VnKOsmF01Ps/B12xR3kDi+
   ocau8Q7h+YrgNw+h4Z0jCPmXH4KN1843jw3CAaZe/Sa98YMGkb+LWf330
   omcP9et06TzmD5JBNyn2oaqtEnamAzupzH7jDhTagD+mhoM+k12TulPVe
   w==;
X-CSE-ConnectionGUID: EOpNHvGtTF2tFE6xSkBD1w==
X-CSE-MsgGUID: wWad6kckT/++wjvSMFW9cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3943107"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3943107"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:59:48 -0800
X-CSE-ConnectionGUID: BJX15HbhQwmtHAF6OzX6bw==
X-CSE-MsgGUID: guw6wdWxQTyfJWosAuRfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12676066"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:59:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:59:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:59:43 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:59:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hptAwo6rXj92184ZTvc6hqn1c3CUu0heLOvhVFIAFItFk2KJg+uQX4RCT8nkfxF+0R9SI+drR8/uPlVMKHJMIPt5wDX764Y9H7PG94GNirB8K249rzDMNo6y45j6q6pXjXS6/durfI5yVSXyzZEhU5xeMvdD5NOx0/GhJBWX8Ij1xEk2xKEAOKmLX3lVLa6Dc7YI3uORBJp64GhI2HM9gkUIIPfEz8bqwpzYrghm+1YizwiU9I1L7GFaKviLUVE/Y5KRct7Aglqvp1tYpDHvev7vyRf6amfj9Gfebqey+U2Ny5/3MJ7dTpaC1RMkqcklkVg0op3VSMVfa9X4iAPD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+Tcs4p32MimWLsPr4OwINRR0jBvzTSdbypNpnigGQQ=;
 b=FoWIaG7vOdHVtFwDNS3dqeH41CaCUsppqruBGI3T7grXJbTfDl/EvDjBSX0yVYcbTwppjRQm+7y16KAzdlylmaQbzfD7QzLUN1H6JKQ+MEqv4mhxZAKeqX+pZd4ZV0rMi22V85ijINqHeBLkZwkiHJ3cXez1bpdrlKoZ4cW65tAyUhM2UXa8u0wWqn0rJI+ogs/ApRQe+YPJ3eNh4A5Kta4EIfMqWxJqdqkC+9hWRP0iJgYJeXVDKbrcHrsjpRO2lOp3OY7tNgf4ZtIpGFoQYH316fPh/WL68rdJCPdkKsFl7GV8jbhRH/q68Uo54RDtT4gyDRGvPJoxt/gVJlZJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+Tcs4p32MimWLsPr4OwINRR0jBvzTSdbypNpnigGQQ=;
 b=U+NGRzLIDjZJ4UHd1M9lYLrTsP9/OEFPeYQYQ2nxFSN5I3dTk1vFTbmqnkQ8jdYreAOk/HS0CD/W7U0dfO+qrt9sxa4Ozk8tt8CGa12Y2DT0EeUbOn/OcGu65pNupmWBU1dhNpOVyyk6E3gyUqEw2PdZoSfkoaEDwbPEyXcQrLg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 (2603:10b6:408:422::13) by IA4PR11MB663788.namprd11.prod.outlook.com
 (2603:10b6:207:13e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:59:40 +0000
Received: from LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de]) by LV2PR11MB868673.namprd11.prod.outlook.com
 ([fe80::5bfd:6afe:a9db:b7de%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:59:40 +0000
Date: Fri, 20 Nov 2026 12:59:18 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>
CC: <netdev@vger.kernel.org>, <magnus.karlsson@gmail.com>, <sdf@fomichev.me>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <bjorn@kernel.org>,
	<kerneljasonxing@gmail.com>, <intel-wired-lan@lists.osuosl.org>,
	<anthony.l.nguyen@intel.com>, <przemyslaw.kitszel@intel.com>,
	<jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next 2/5] ice: add Tx descriptor builders and header
 length check
Message-ID: <awA2FrMwDMaZ7Yzw@boxer>
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-3-magnus.karlsson@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119165340.1071525-3-magnus.karlsson@intel.com>
X-ClientProxiedBy: DUZPR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::18) To LV2PR11MB868673.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB868673:EE_|IA4PR11MB663788:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0df521-78f8-4981-f42a-08df46fdc227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|4143699003|11063799006|261009223027099003|261021121427099003|261102123227099003|56012099006|261026140227099003|261022075727099003|261022115727099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: qRcBif9FJi0EG+AnyJ+ZUB6vmGPUo+91S8LqaD9rYQpSyMaUUShwoH2o/l5HWi5TSrLS0Aw1SSbr1Uls/K20ZVQftzTmdmuXBt2pxpCNDLc/MvDNtihj+Ouoxk7jPMY2eiPIz6Ysf6miR53p9W03Zb0ZAP5yWisXvxT67R7dCzEstshmDAdO7/nr1izYEb65j59DZO/dulnEz6GlyOz4eLBW+0m7foNurvZFWnfYAXXnfT64xrPShwGeXykBnMmr7Uie/k01D0Wy/xOONHorlopdOBt5CvMD6ggr5qjBCQN8kHSCt3wELfBDc8N8astI/EDIHGoxN+t54+tR4rofGXhJiWE5tsu8tXpn9e6jJt9FUSASehkwjVxy8RRE3fTxINZEz6hLnVnFAvYOh0wi95C+V7u3be9/1X/sY6opp3vjBcxQ6IJezK+Yj5OtkRFs082izHoO98c9KergD5ejU27KrYAJFKsnziTudxdD7TjPS19QMftluzt8AjF3+MLbeBYXb3QsX+fXGGZTu+abYfEPM+XtX8JIirVZyppNBwtDm8lk+2KE6nf11AM3J/joZIkhV/jVlbDmR+CtgRTXjlnmERUzr709MAXd5LM9eioEucqvwyPL1MCUuTbI4s+zk2NMMKXHrAIj3qZB13H1uoBz1z5N/JjrW3zv76KDSOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB868673.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(261102123227099003)(56012099006)(261026140227099003)(261022075727099003)(261022115727099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97LzHVAtV3df1e3OOCXVw4n5GNehLaJEUh7N/Wz3htgNaU8E09OYDVnXHF37?=
 =?us-ascii?Q?iEZaIjADRSNr/D8fcDQfvBN5ztP3lgmzVr5sq9caBmmWsFBvc8xHdwAL/vF0?=
 =?us-ascii?Q?Hh748Co76xY9SlreOqyaJdTXTzZMjaoKftW7eUpuerad1O9X0gYfLZXMRhQV?=
 =?us-ascii?Q?hKsJ9/mJiU5EDlyLeS80vZQ7jvPQvcIBl4I8lt03/6A1bj5JdUKAA+gsICKj?=
 =?us-ascii?Q?ao7Qx1j60gHp5Ma1DhvweGyKU+Zt6lw2TRJTKts/En2R/dbafAlJu/OYfi74?=
 =?us-ascii?Q?HW7cU5e1pwdQGLB93uDfRL3apT7GK8RuOsR5hSNYQ26DdGsVdIyLhVjEmaNA?=
 =?us-ascii?Q?ZVzobWsh37AK8jFTJDshkYDg32gljN31naXXrZouPbg1c7QJ5XH1POBV+Rza?=
 =?us-ascii?Q?q8+CkNqoMvybAjLIfTeyi6zI8Xe19x/weJJ4fMtKXBSbZCo+xxVLmNHqXNyD?=
 =?us-ascii?Q?7KSuk/APOjsi6IsVVnuyDOSQzvmsil8Ro/48lH9iWQYdfq9k9AdAEhLjyONh?=
 =?us-ascii?Q?Sxu4Y5wgoC1MzsXPIIKwbZ9IQtBcugKXNBB7IQVWDVCRmoToE0DaQOwGWGGv?=
 =?us-ascii?Q?yginw2612MXlQJ/vsHjrFFpf+u1e70M26EA011oclm/r2KtqbWqPtZb6sxIz?=
 =?us-ascii?Q?vqX5H6QU70Z7FDGuhbY3Y3L2H8g7mT3u5btpO9QmKWGFply+VSMTL3KbYl0m?=
 =?us-ascii?Q?2WiKiu6MfVwEkkXI8vHCBNrpgDeZsokcXUx78WblCP1oHa0tolxfKJWixhmU?=
 =?us-ascii?Q?n2lodtK5lHaLqjNhqWrOWs3HJ99TYfrBc1hu8Dg8t02MbPsgWQu0hskTGqNv?=
 =?us-ascii?Q?bheV0uRT7+wGah0LnBTWSZfTjzwCerv4+5ZX7kPCFHRXBzpDdPuC3Ugs2lcz?=
 =?us-ascii?Q?kx3d+44R06xNzjfiU7bWCNDzJ44JudXofSGSzrIJprq/nULXgXi0zuNImR8J?=
 =?us-ascii?Q?DVEoaxGm6yfRjg0azYCpSkZMx7PJ0/V65eLeRDAvCcmO1i/6It9ENsusbAuR?=
 =?us-ascii?Q?Fbw++wfuAlAY8dfqMLoVfwMu0R/WxElf5JfOby6PCyO7Omd+L+1o/T7r4slA?=
 =?us-ascii?Q?Mlg5KLgckDrvMUK4f2qewlkMDjaDykTtRHbj6jicUe/WEC/RRpgEJMLmQtYg?=
 =?us-ascii?Q?fGfHzNBX37yFP30il/NHwVAVik5uux0yNy+n2PyYZ5ukeGP3ehJlKSpwn+D4?=
 =?us-ascii?Q?q1Pp2PVoBXBy+qpgc5gKTeL9Ij+5EjGpqPdhE/+LApcCpfvPipAbPxZn3o5O?=
 =?us-ascii?Q?fAWH/tuJqHEj3qP/FTyiurvoB2hqUVOUAHp2qQ3nvrjXqMGR/tZreJ++fPwi?=
 =?us-ascii?Q?iFxcpfFRullxsmF+ewpALEpqBEtrR+j9IEGTbVi8SxNl040yK4b0idJlWwYn?=
 =?us-ascii?Q?++djtJzMWw8NKsx1yxkmWT629yraMVuEQR98lID15cq7EMakpsOkYAqSeghF?=
 =?us-ascii?Q?vrIiUJspC6w35dKzAop4hxsEUJ97iNmFJPgMI4hA61//4u83uovXpx8RaEx3?=
 =?us-ascii?Q?M4q39QmpKeSJrqm4KGLgtcCDRneCdY80KshzPC+Je2NFHzjTOn4xrrv9FDsw?=
 =?us-ascii?Q?X47G7ZpOaT0Bj+xgF1plIOTpMfXwwXqT12Atyu1Y25wzluNrufg7B/er87VB?=
 =?us-ascii?Q?GRnC1Oh7pfwYENX39QpdG4uFMC0ZrLUs6hG8nxpWdLnl4xqUU53P0JnfnpXa?=
 =?us-ascii?Q?w3QiJjgYGfXyLJPPgLolb8PBbAnzprrVjFBd6/qatosf3bbngeSzQtvZmm6F?=
 =?us-ascii?Q?e+MVY9gSC5u9sy72n3e8VRoQ7I5Ir4c=3D?=
X-Exchange-RoutingPolicyChecked: YfYT+ruTRuThMJQZCbdAllxcsq4CoAcBXq58jd94Ea95YJHDBFnmxInTfAmDTjVXFkLr9+2dbIN/Hxz6GOH4cQBXEaZZ1el7dKbZeDBKKogGioxGew+qr7p5pzxhTRA/rJnMfmz/aN5MrBmhIy5MW3nQBSqlA/aCjoncIZeqUpoveSc9qPf+NcYufhY4IdAm78sCGSMA5wrvbqSeZlJBda/bD5qLS291c+SYiBHs9OQQy9ydOYMN5HiGmvBd7WbzXKIyCGrR+CDFyzw6MefNqtzeSfbpt++BMVwmtoZCIFx2cNNlqcltXCwFdVsT6RHZD6hOqrRwSERy4tuKXG2v2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0df521-78f8-4981-f42a-08df46fdc227
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB868673.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:59:40.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xauQD+XkaIXo4sQblw5tDqDhB2CMaksdpiufhgfFW4BJC+D/Qm3B19yQ/G3zfwKACsLyhbsFRjRSLDIQ/Ikql84PMWT3AkF0W1V88ZzoC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB663788
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 05:53:37PM +0100, Magnus Karlsson wrote:
> Add ice_build_tx_desc_offset() and ice_build_tso_ctx_qw1() to
> ice_txrx_lib.h for the length fields of the Tx data descriptor and the
> TSO context descriptor, and use them in ice_tso() and ice_tx_csum().
> Add ice_tx_hdr_lens_ok() for the header length limits of the data
> descriptor, and use it in ice_features_check().
> 
> This prepares for AF_XDP USO in zero-copy mode, which builds the same
> descriptors from a copied packet header instead of an skb. The new
> check also requires IPLEN to be a multiple of 4 bytes, as the field is
> encoded in dwords, and so does the inner IPLEN check for encapsulated
> packets. The IPv4 and IPv6 header lengths that reach them always are.
> No functional change intended.
> 
> Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>

Reviewed-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

> ---
>  drivers/net/ethernet/intel/ice/ice_main.c     | 12 ++---
>  drivers/net/ethernet/intel/ice/ice_txrx.c     | 20 +++-----
>  drivers/net/ethernet/intel/ice/ice_txrx_lib.h | 48 +++++++++++++++++++
>  3 files changed, 60 insertions(+), 20 deletions(-)
> 
> + */
> +static inline bool ice_tx_hdr_lens_ok(u32 mac_len, u32 ip_len)
> +{
> +	return mac_len <= ICE_TXD_MACLEN_MAX && !(mac_len & 1) &&
> +	       ip_len <= ICE_TXD_IPLEN_MAX && !(ip_len & 3);

alternative would be to use mac_len % ICE_BYTES_PER_WORD, but modulo has
a bad reputation when it comes to performance.
