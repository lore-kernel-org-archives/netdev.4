Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461273;
	b=uE10bW+S4tT+oX3PEr7V3dwVsocdhfTltEkBqQ1nZQAqPbl0UJbk6TqShkhgExuitjrj
	 7nX5bU+5dOOSTgmvHXLzidHlnFvh7d6yfvzO6MwjXPJ778WZ5/OMBsrh070iZnbf3hMgl
	 G0ySOAvltH3T8Gui1as2uv4bOCAtcHEgeXgi+W4/YqTVJriOdJstrk1WO5U4cJF4ZMHmT
	 UA2KeCQtK2QiMLYU3LDwCeFDhowy+Ypo9LPj6YSv+iN3YsIS4Pt2qf0amDYBMbgaJ4Rbv
	 rJknW2Z+VR64CjHUWd/RbhLg45c9a/81FQ/rWh3xde6bdqGZKw7RVCDoyO9vcdMsgSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461273;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
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
	bh=kxcLL6eWT+iUOeW4/jFXwg5CdCIFLGdICmNXEfGI+2E=;
	b=ATvUxwWia8KhQSZdeIsdAgv3Ix88BPBn8b0lC9g5HnEZLAymTrJ0or0RRBDujN+pDOx/
	 rkCfFFVMbI/DmptsJRjCBBo8/Wvi4PIJAXIdlc7MQS4UA8A2ieCaxt1JdBIgiD7eX2HEH
	 q7725qyLGgNicqt2SDsFDzsAnyz4p9ZSthh/5cjmSYzjcY1pXG9TlbpwkGMjAOt2apffn
	 6BwymG0TmpgntnORj51WaAiGB1k7+10BISza8dSBssk48KPgRQxE8hM8J0F0MhWyuTe5X
	 Uv++e1JBa9Tita39Y+owtVvrv7LpL8fxLje5nYFy7h57aHVUjTzMFCpjq6GqKknEvvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3UOrPwu;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="Jnmc4Tq/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D6606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3UOrPwu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Jnmc4Tq/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795461272; x=1826997272;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R3WREPDWeapbSnPLfjb1tKUjLtxXgCSMrMJaYG7PW4g=;
  b=R3UOrPwuv56qH77mee6MJcx7Epa883d+cBDBsu+H4vAF+hExR18aXriN
   jWCKuzqUyUU2nTDrNuPbXlB5plxAE39uKksgKa/nyaJ5NBCEPJPPixMQY
   Y3TDAr4zTWdzwU48Ttfxrq2X00Rj5zrdABFF7gzAtxc7EuluzQ2H890OC
   smv8DrNpwZtU4G68ZiAC247Cl/GtMPbR5Gv++pKmTQJtOv3tKTMAHnfwL
   Ce5/g+fetGPlFZWhiCiIKrCCvLbfyQhxztT8LxybVqIGLvL6R5JCFBD/d
   eG2U8dbH7ovJ3S353LjEn5VGWqE3F/HYNncPFeLqNK7jkVjGQx3+gbIWK
   Q==;
X-CSE-ConnectionGUID: Sqg8f03bTH2axwGOmaQ1YA==
X-CSE-MsgGUID: sDHe+qiUQqKvRTovP0mz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4308958"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4308958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:14:32 -0800
X-CSE-ConnectionGUID: IB/Z9TesTYO3uuqlKlxNHg==
X-CSE-MsgGUID: MdCcDxhbSDS3pDNkw+qUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11453428"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:14:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 11:14:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 11:14:31 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 11:14:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXqwlr58Bcq4kveq1oRIIbM2GtapCNw84v652uJ30YPHoEtVAx9Ce1GUgoRxDFl00Huh8tmDONO+TmbX54ISZ2dkY19v6ystp/MOCfCLo4i8XtUY+q4+I4GhhUiwqL6ARFd95VFnsPnpgygfuvkZPdp0TQavMPLAZpy3dtMYv+60wzPGaJOn063qfwjC5zBfudR4vPAA1wheSW0UYQ3j4CUPEFdCzjTaQAm1R6qcZudtMS3nIc7iCMy2JKRzQPsm0R+xHquHH3anmBR7vQOhxYslqU6qc5eWFbsoxn8pWe2/zdyALbxTgkYjT1/wBhGdnfpAlBk1aLx2ENu/allehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxcLL6eWT+iUOeW4/jFXwg5CdCIFLGdICmNXEfGI+2E=;
 b=n1lv8b02Tsqzxsfl1ms/scQuLwad8Ij1/Ji+vKPS9qBN51/rPYDe7pYulxdKZgUrasM0nPEYgyoKnvLovWwnYCRxRSUwDnKHFyip2gySDockLxFhf4usuOj2RfJ/6ZmdRKNdZtu/zMASCaNRebmv+3zyhTIhYkOsDR8MEi7Xlos0247REKARKqYGW8sDNbGW2jp12SRcoseVfz9lwAEP28EL6azURj676qM+2AjNDPZhBbNYL79zK6mkEyzuTVfEZ1+vtpelz+Kz1BGZEAuMSRR//hCEzxo8c+Kj4rtI0k0c1W+yVAqHCPVoWM3bXmaNsuFcWGPFhgFr5yiYp1GFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxcLL6eWT+iUOeW4/jFXwg5CdCIFLGdICmNXEfGI+2E=;
 b=Jnmc4Tq/RIPv68ZS6GZzWDQixadkyOg+XJa+wWXajXWRXZAiHtl0iiwy8k/Rf9+TbbEWYfcH2Dvoc9GJSN0Sd6zoiU1PF6lCnYZczgeBOA9K+4Gv0vp2WmwOmZZK/lMDP5q7IvyUxHhrgPKEUV5t6ICBbYJ+JfysU1W84WOA6SU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by CH3PR11MB291940.namprd11.prod.outlook.com (2603:10b6:610:366::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 19:14:28 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 19:14:28 +0000
Message-ID: <455bd1da-b844-44d9-8cdd-ff979043dd51@intel.com>
Date: Mon, 23 Nov 2026 11:14:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>, Jakub Kicinski
	<kuba@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Petr Oros <poros@redhat.com>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@gmail.com>,
	<netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<edumazet@kernel.org>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<horms@kernel.org>, Marcin Szycik <marcin.szycik@linux.intel.com>, "Aleksandr
 Loktionov" <aleksandr.loktionov@intel.com>,
	<intel-wired-lan@lists.osuosl.org>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
 <av2syi6lE/Vp86QW@boxer> <f7f1ae2d-a623-4eb7-a178-c618316beaf5@redhat.com>
 <0bb65ff3-2e27-4f2e-aaa3-2b8eb7cda356@intel.com>
 <fe1ce4cf-3400-4a87-8e46-072563f8fe9d@intel.com>
 <20261121162859.3522ab89@kernel.org>
 <ab89dce9-c124-49e6-b6bb-036b69beef6f@intel.com>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <ab89dce9-c124-49e6-b6bb-036b69beef6f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:303:b8::29) To SJ2PR11MB8451.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|CH3PR11MB291940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a36543a-d82f-472f-60b9-08df4995fe7e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|261026140227099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: 0DpKP4u+7Ev5GhU3PLy1098pZvuOimN5HRayU4RbC2JV42j464U9E7C8rppdpz9Q2UJkRDxNUr0p0NQ6X+Q/BB4ZQYm3QrbonUUktfajlnedceUnEhZfGmLMuxxtRzj47ZtlzZDwXx1ngZ2mXOByXxS2wQdDrNYAA3lNTJ7JTF+UOPvEGDtCmROBMbzkUnuEX71v7kpFHW7tYFK+/rtRpEpKoR52bQ9F6Y6kmBjGdup7rJijPsRTr5jPlY5gkxcHmdaFGes4jHqJJP9xQxRT6xhpb9Uk88QLCkd70+R51065I5vyHZ9MtUWczEgB3szuBPuWXSXzLdjD8FETNOL/QQorKjMHju9YoiuQchXqA249qoeIm8wIx9xsZsTXJDAggIT5+rb8ycNCpPlF2/iOZG92Jsx6vkIwreTTy1+4nyBGWdFr+/qljDYv5iFiKW9UIZV+JIabe5n1Bfwh1cN8Ln2qwalhxhhPc3iaXOosMgpW4/C9JxjHqsmbrObNZEmwirHadneuo26cuZydffIQQWFRwwvd99sfWQQslOhp9+s7jew4Aqe+3V334dc08BtvxuUC2Jx3AMaAhP64gndXlCSthXcBPHMIoOFnzR1gkcKbllfJOlgchpZjIMd/efFXr8LsGclrVF6/IXOLSyrRDH95wovWtGgniDEmPQQw4p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkJnUU1PYXRlem1BNFRTblhOeHFrajdBbmUrblhvRG0xaExLSEl3dXZNUDNw?=
 =?utf-8?B?YUFrVzUyNUQrdVBCSm9pSHFTQzFrcEMrZjR5Yzd0eDR4MDR5WEZhdFBXRmdx?=
 =?utf-8?B?UjZxdU0vR1NxRjYxZ3BwTnpBMU9KMHhCWXpqZzd4cURBNEdMUnEzcElHNjJG?=
 =?utf-8?B?KzMxeUh5djFjNmNmNGt3VlVHaDQvZW5DNnFDWGtzMFBFZGpTajNseXZqQWhK?=
 =?utf-8?B?S2RWWm9EMWRlbktkOXFRRE04TzQ3b1dsQnAxZS94K1FXOEEzUlRwL2FzQ3cz?=
 =?utf-8?B?cXQyYkg0OHU5QVhBSHF0SnRwUjJGZHpFNHVsL2dtbFJzU0JOa0psajJNcXc0?=
 =?utf-8?B?WTFOR1lsK0kzZnFoTzI4MHFJTDRzZEt0Yjh1RXlqdDlXS2YvNy9SWTgvZHFL?=
 =?utf-8?B?bFJkNTBuNU9Ndis0R2lXaStCMVpOMlRBVmhBdzYrTkwyK3lBK3ovazFvaFpN?=
 =?utf-8?B?UWt2R0hIN0FqUXV2cEVCdWphK2pzcGxvdjhmTGhXa1l4ZlFTWWtiKy9ialhm?=
 =?utf-8?B?Ny9PaEJRekhPOFR0dDYwZE1tNDN1SDNaSHJJZXJSR2JKckVqL0Q5QWtiOStk?=
 =?utf-8?B?cjdxWGxaeTg3TUw0UW5kbVltYXJoMTBMdmpONUp6ODVYZFNlVGdicXZCTi9B?=
 =?utf-8?B?dnVLOUJtUEZ0RjhFbEVtVjA3K082YTJDTWFmY2J6ajhSSjk5QTArNkN0QnZX?=
 =?utf-8?B?dFc1b01uWTRCcDRlV3VNb2FnakVsS01rR3JhRDVLaVYrU0V6MjRXamFmZUNy?=
 =?utf-8?B?THFZaXlXbHhVcXUweVF5ZU9OSzdxWE4zeUNZaGZjdDVQaVhETXNqQTZuZkxY?=
 =?utf-8?B?VlJPNnZOMHpsYnp5UW5wRDd3WW1idUFCY00yV3Z0QjN6SUZzajQvOW1WaXN3?=
 =?utf-8?B?Q2NtSHVObmIxaEkzWjFYUG81Mzhrb1JxZGZGSnZRdDVBTXd2SXVDMjVtNTl2?=
 =?utf-8?B?eTRDbEZxb1B4aUFYdkxSUWVHRjRkZDNLMGJGSmF2MWpxV3NKTCs2MHVaRGl3?=
 =?utf-8?B?TDZMV1d6eTBEWWtoWkhwM2tGLzNsaklaMW5zNWY0NTlmREFhUjYvbldHM3k0?=
 =?utf-8?B?SEE1Nks0U08ycTJaemdzQ0VNZDRNSXhOKytmN1ZwVzlCb3VIYTI2M3dJWGV5?=
 =?utf-8?B?bnBPREZueEx1QU04dStLb2h1Q1M0Nmw2dlQzdVJCdU4vb0dHaEo1L2o2OXRm?=
 =?utf-8?B?SnpyaytMYldwY1E2TWdvN1hDUDVUM3Q4ZXphcklVR0FtQmhMNzgwSFlzMVpu?=
 =?utf-8?B?clpseGlzejMrQmR4SmJybEVTNXFhVk9yT3RaR1d3MU1GSThkV0VTRC9VZkxY?=
 =?utf-8?B?L2NhdTJBVzMrbzNzRkFHNEdxR2p6MXRLaU01bkliVWRHSEdPY0ltZExieGtM?=
 =?utf-8?B?UzFqMzZhbERCRkREUzd2akRWY3JmR1lTbkd3eE41TG16OXk5QmovQlBLQkhN?=
 =?utf-8?B?aXIrWFgvQ2tQcXVLYnNGV0Nna0dyalNEMTQvZU1IRENhQ1ZhREFkU3Q2dXJ1?=
 =?utf-8?B?YkNUakFFKzZxNU9Ba255bndZYW5QRVFURzlnTkNGWjB1ZEJhZWFuQzNmR3da?=
 =?utf-8?B?akpCc2VSbk5lZGhjR0U4dFZXSjI5ZHpYSXlKeVA1aHhUNkNkdXkzcGNzWWlt?=
 =?utf-8?B?UU9JNk5QWEdyR01jRXQvNW9LdWpXc1lZQytGaFlFa2VnMXM0N1pTa0MvQng1?=
 =?utf-8?B?RUNTR2RvaG03UHNSQ0ROVW5PY2dCVzRBT3JjVmZOazUrdGJRK3R0QS9xb3lO?=
 =?utf-8?B?N254MytZdkV1alBMMTVyQUlpRVJoeWkraHJ0UDdqanVxMlY1UGQ4R2dOSkFs?=
 =?utf-8?B?TmlxOUxROE53V1VMVzJkQUJHejhBVzJJVmR2N2tqUCtBVHhzTWNER1RYclpM?=
 =?utf-8?B?YmdLNlVQbmEzRjZOdC92Z0dkWlpzYXpiRHBoMmRFbXdUMkV5NEI5bklOUnNP?=
 =?utf-8?B?OStpVkJ4dVBqRkU1OUJsMFNaN3A4d0M2d3VJY2lHUTRKM2JVeFE1NzhXVlZa?=
 =?utf-8?B?THpuZ1VEV0dwOWlUa3lGY3NPeEJkaExKTmRuYW1wUS84UFFPTnMvNDlxWGRT?=
 =?utf-8?B?dnY0Z1JEaER5WERua2wrMEFMeWMvK3JseEhsQWdvWFM3ZUtYYWg1aXBtcEcy?=
 =?utf-8?B?SXRuT3dhb0JCd090RGg5UWZteUtRbDN6anQybHhoNFUzVklNTG80Yi9XQml5?=
 =?utf-8?B?akJQcERPbFpRYkRCMUhZOFlrejlNVmdDeWI1UGVRZUhjRnFnUUVCMEMzT1ZL?=
 =?utf-8?B?QkV2Zm1QMkJIZzZINjhTL0FpTVlXMjRCVEhHN1FNeEpQNVZWQ2pBR0F1RDg3?=
 =?utf-8?B?MWN2LzhIcEdkY1RaZ3FpMm4yMnBvMDdGMDd2Visra2liY1dhMlBEdzQ1RE9N?=
 =?utf-8?Q?3/nFRhD3wqN67I/o=3D?=
X-Exchange-RoutingPolicyChecked: XKf0vs3mQLi5XeTpJQbJahZ5vD9YCw2EdEcdC4FrU2NHN3wSSw9OIohtcXtiaBQm864k3DQU7TEHXSMuzCmZ/v2ue8CWDKfkH/LbrbunQl0/nyUrOVf2gyn93R4cPayWKnrgB01lcrVH/1tMYiqFFX/2E4WGMMox3LKBDb/QkMRjjmtSRimcfNsEnDxEjZ5mnEz16ZgZZQM3DEXtr4WiyOsYgXEYUB1Vd+eEuGcMbguWAUaegOblMn4fBuvEXy5T038Nku4r5vkPMZ/CY7I/5LYNBcD7C1e6pjKzvGeci7VG038JNPU9Ag1Ccb4rzODbzVfJsPmN4B5YaxY+2g/vyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a36543a-d82f-472f-60b9-08df4995fe7e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:14:28.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ypjli9kkrEp1StdgKPPUj77lHmMN/bXUi/c7RtF6KXftpLrWTNFDs+ijjCIVGjA29FnpIVUXp2i9dUbfaY1xPIWOrL6iXGewN1Vcslq2aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB291940
X-OriginatorOrg: intel.com

On 11/23/2026 6:55 AM, Przemek Kitszel wrote:
> On 11/22/26 1:28 AM, Jakub Kicinski wrote:
>> On Thu, 19 Nov 2026 10:07:10 -0800 Tony Nguyen wrote:
>>> An idea, but this would still increase the queue for netdev, would be a
>>> separate budget for non-Intel authored patches. This would allow
>>> community patches to continue flowing without being blocked by Intel
>>> work.
>>
>> No extra patch budget will be provided.
> 
> for our purposes merging a patch from outside of intel, is the same of
> +1 to the budget for given day ;)
> 

My read is that such a merge will impact the "budget" of what the netdev
maintainers merge, regardless of how much we send.

Thanks,
Jake
