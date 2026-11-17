Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794911844;
	b=4WUzSsnxKLe4Pc2xtQ4f+9aUFt75ncqedkW6RTDAtTg1axDqxyX7LB3AwBOLyPL35muL
	 6j/Dp7UVPj9SKdhZLv931Hs+B7C9MsV9yzZRrAcGeYS32XDALs4pfd1vLOetDRewRru7H
	 Z+oaNmFkqMs8Rm+fmhBqDJoQZQ1kBTEBnCt8i2hmNtRVZRYqPcve0hcn3ZVMG55Bjtp75
	 hk7eHLYtnbjkluuAezqtadRLpfSCaTSQUFfp1FA9YdscJF6d4KgrOH++BtDStRjIu1ugr
	 pUNisO+KLH2f/3UAdahGLwa0t72+O8qSpKa329PyMuG76mB0MrSwwFHw1QS9R/pFp6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911844;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=QnblLikYb3rp71DrDZ7abO6eHjEfuj1kwyrL84Y4OzY=;
	b=E2444QT5n3oKP9fSLoYv/7VRi38nWXiSaB62egzxgK//fXISmyFtO8YLtxgmULqreet8
	 c86+HClxrZFsBNPwX5A5xP0YLqGhNF9BxnwrNyqkwHKSjFzLjzEdegyKGKgLgnDdxO0jo
	 LrdF9vbCKkXKi9ibaKJEYxs6lsdd1rUFljTP5ekQUf6yF5IXV/ks2HWxPgMkWlu0CPZfw
	 A09wZIV9LIyRU0jkc/r/qZPN2qfZpgu8PRbWGGLkMuMCe+2L5j8Rx1ncitDQmc1uH/Z/B
	 AJqwVJr5jRyi+CIHLT6bxFKzNRp7y0c1EAGeNNa7/0gKaSgXbWgd2PnwHnmx+7Xgt5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oG2D+suI;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="b9LN/5tb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036FA606A33F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036FA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oG2D+suI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=b9LN/5tb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794911842; x=1826447842;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QnblLikYb3rp71DrDZ7abO6eHjEfuj1kwyrL84Y4OzY=;
  b=oG2D+suI2ng6kaOztgsV/y3Z99b0CcIZO4dUc9dJrrzqDjXbj9KL81co
   dzaynRDXzp/e8ZnNexe8a/eOwwnVLp7m8DsMMEpZuA9NB22Ctqp2NL2aD
   4cGGrhn0x2ctZbLtZnBksaEYS2PWN8JGiyn/XCYZNwNZAM5DUrDO8n2jw
   IPajcAiW2cAEkgkkE7GWJSs7QfG5HwbRlqY2nw5UVic9ID2Sr7iDrwCyE
   HOMNilFsorBmpaZnaAD2B2PnSjhgMRBUH5qJSMb/h5yD9DfnGZYXaCz8b
   Xt2A1FM9L4BwkgILHHJJzr84MH7JTzBwPpNx5TYz/I5KZOlGsigaHnY1e
   A==;
X-CSE-ConnectionGUID: vAPfeVhSR/qxBeGn+dx9EA==
X-CSE-MsgGUID: vTf3FRuiQUSARFyShtPkWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3669994"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3669994"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:37:21 -0800
X-CSE-ConnectionGUID: Oh38f5t/T+uUnFr/OsKVig==
X-CSE-MsgGUID: RjY6lzMrQ5KKcVcdcOyzAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11543917"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:37:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 02:37:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 02:37:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 02:37:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRml11wxgOYUiiezqXuHDexUrJYNaB20Ays06etf9WXAVxe3o6ju/TOA75ICCIC9HL7udweZihrlN6olEEmg1q194GIQfmsHHJ3Sz3nSe7E1DMHdr9cKm33l6YBs3oTRxPA9V1SG4OU7Sd4G7a0bHifnLcIADPKqjFnvCvNvq6G+wmjkveK/fmnsaDBqGL+z+TCG19oRV/tuX/28YqZHcIvuWA2PJ6acx/cilpLhlN6MbUUzKGTmT40XA1Dvv5v2qjXn54bVUmVUZ/Kt2X8kxBT+txRVi8Ro3/lGBssnd6HwGAbDvzbHr/ak0ul7tKg05Jo3jv0HuYwJkKhP7K1tXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnblLikYb3rp71DrDZ7abO6eHjEfuj1kwyrL84Y4OzY=;
 b=NrQkosXn7dEA5JlMHacIDLnwfylXp3xJpSr5Eq2Di+QC55LN2vBHXTx5toy+nlqn51GGm54sWFbZ9hTBasra3HLCUVXZ6XQ6+dcMuGxcKZRIHU0krgDOKukorIOQ1SZan66kwq01RTuCG6YyP+l2wDtnbu0HC5Fzbm/VIlrhVUOvZsHAz8QuGJdxDVrajesifHXCAzfY+z4qFqtSqqGoTlYY2f3RXhF2PHV3VXMjKksH1QKVsQ4y79FMXV/ByN93v1zJelEvM/kbajBzukpcJOGKceaCvLvc/3V7rQ5MzCOu+ZO3UarN2354yHO87GWQzcS/o5gxJwTBv/UlrrxlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnblLikYb3rp71DrDZ7abO6eHjEfuj1kwyrL84Y4OzY=;
 b=b9LN/5tbj3Ou6JzjyX0cSIK27P1BKTAX8iBjoN0AyFmk9DIlHUSHyHcg/XxsAiawC1VaPnqJFGu15Peov6padz/PXBIEcWgnmwa0DTvRdjvX7LcqOD2zZ7iTITPfF6Ks3v1AlRC5tZI2o2e8iyxX7TT29+yvIA+mGxPK3z/1ZOo=
Received: from IA3PR11MB8985.namprd11.prod.outlook.com (2603:10b6:208:575::17)
 by DM3PR11MB8715.namprd11.prod.outlook.com (2603:10b6:0:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Tue, 17 Nov 2026 10:37:11 +0000
Received: from IA3PR11MB8985.namprd11.prod.outlook.com
 ([fe80::355c:96ca:a45:dd5d]) by IA3PR11MB8985.namprd11.prod.outlook.com
 ([fe80::355c:96ca:a45:dd5d%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:37:11 +0000
From: "Romanowski, Rafal" <rafal.romanowski@intel.com>
To: "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>, Tomasz Lichwala
	<tomasz.lichwala@linux.intel.com>, "intel-wired-lan@lists.osuosl.org"
	<intel-wired-lan@lists.osuosl.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Marcin Szycik
	<marcin.szycik@linux.intel.com>
Subject: RE: [PATCH iwl-net v5] ixgbevf: fix link speed reporting for Hyper-V
 E610 VFs
Thread-Topic: [PATCH iwl-net v5] ixgbevf: fix link speed reporting for Hyper-V
 E610 VFs
Thread-Index: AQHdNWjROpyfFZ7SVk2MKvySe3DFD7a5oNEAgHjzhhA=
Date: Tue, 17 Nov 2026 10:37:11 +0000
Message-ID: <IA3PR11MB8985B4AAA9F1C2829C9C4EC58F7B2@IA3PR11MB8985.namprd11.prod.outlook.com>
References: <20260826143950.2385891-1-tomasz.lichwala@linux.intel.com>
 <d423e711-a38d-4d68-9395-60c371e8e8ff@intel.com>
In-Reply-To: <d423e711-a38d-4d68-9395-60c371e8e8ff@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8985:EE_|DM3PR11MB8715:EE_
x-ms-office365-filtering-correlation-id: d3ccfb75-43df-43bc-a994-08df4496bd24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261022105027099003|38070700021|4143699003|11063799006|56012099006|261021121427099003|10067099003|261021135927099003|261102123227099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: KdIC3tyJYA80myu0SYzld3l9P47V8WQIDmsfeZu5Ou/LW55Qsh5pBP2Pmf57eF3e+fIWDhlvpm5cQGbVXFS4oVE+yFSA9Hub+wkpywW7k1FpFsvaQcFk3wJvn0qliQUzS+9sapK6ss0MpNcOs86qaqjQAAFwwB4HH++9iZxSYeuFOAQTQ2cxqyOU4NYKK1LQrOU7+lbyP1FOEBChaHXxAluctDseLAGc7u8nWnisig1adApbIQo25NxjzpTBXTg8/R84Eb/EcSC61O89659+IxEpmwt4QsXUZTQKJH/9oOwBs8fY8rD/ztR74m/+MV+abbLBbKV/g3P/+LBlRzylaJDNKpcPkyG9jpIcEth08KN1n30wNs9gVTpI6MzHxubEDGFYoepL8EQ7htEuZjp77RzgtDh7Rx0QRsXu8Arauetip1cDXyfSMVJ+Pkc7lxVGY3j7H+kUaoc+MSsuYY/AbcrBNBgN8dxHt0mxfzHg0mhMMagxqpjimBsutxwdzIlhTZTk3wnfn7bJ2lWXy8kfqYdTnFdJwkI0UBaIOOXG1ssMLjLr4Vh2iPHvvutkyageVGNQQbw0R4hLtoWX7dmMBYbna0eQQQxju2C+ldsC1pG5FTUELxcHJAfKOBTp9g0bMu4YedkE8juc63xkohLvqOsmzGxK4KDZlH5yIZjlFaZi8QIISeQgc8wrJ2XzU0VtjbQHDOWQUOZ1WywGCwJdUvwtIu9ELvFiQWS55yfFiho=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8985.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261022105027099003)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261021135927099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDRzbDgrS2kxa3kzOXZvWGk5RWZrcGViYThNVDl3TXgwanVVTHBWTGVXbFFH?=
 =?utf-8?B?K0EwMDhkZUwvWjIwdytUNGp0UjdkbUFPZWlmS3R0d3JkNTJ1QzRpcHdpVVNR?=
 =?utf-8?B?Y2NOZW8vQXlWREtQcXpva2ltSjlGNjV6Vkd4YmRmanFWYlZSa0pNQTFHdmdn?=
 =?utf-8?B?Y05ZTFNBYndPcUxqUkpQVHRORWl6bW4vOGRBNHFNWWxrTnZ2UmtYZ3FON0RO?=
 =?utf-8?B?dDNzbUZwcnB2cjhnaCs1KzJtaWU3dEdILzVHNXRBa0k4R3ZkUyt4U29Zcncx?=
 =?utf-8?B?TG5aRzBZaDM2cXFhL3QvUHpOaHJ5L0lLRWhaSUNBRTg3SGdEeU1RR1dvb0cx?=
 =?utf-8?B?TVh2Ykhad3B3ZDhDeXp0UTJBOFVheUkvUnhhKzJ3K1g5djBhUHY2YXhsd1F6?=
 =?utf-8?B?Y0t4RVRYTkJzd3V5aTArSzBRcmQxS3dFUUxkNDhwRlpMTjJMUkRVMnhCYmRD?=
 =?utf-8?B?UWp6NENxNVdocWtuWlIzbndabDFJZE03dm0yY3g5U0NJa0QwRkVieStDR1pI?=
 =?utf-8?B?RmljbkJYUGZvZExnQXRyY0YySEVUNmFaYko5WElvcUwvSFNJUlh6VXpDV3E5?=
 =?utf-8?B?d1ZQaVJ3WGw0WHhQQ3NFUkRtQlVwTXpNMFc2OUYyS2ZxYXBTRWNvWlpkdm5n?=
 =?utf-8?B?T0JHdkpuZWhEUUd4QUthZ3pCNWIzMlZoTjdjR21pWG1kR2hTUGJjK3loMzhB?=
 =?utf-8?B?eHpaa1EvdTVoUGRRNEYzK3Y5M21XM05jWHpnbEpjNEdPMnp0SFJ2Q21ZSEh0?=
 =?utf-8?B?dUpuTUg4RFdLUXlidXNVWUVpdHJQamdOdUpYSjE4Slc0UWxKY3hITC9PeWxP?=
 =?utf-8?B?bFAvVjIrTVd5bXhxZVBwNlUwUHkzT1FqME5Yc0xBNlJjNERlSks1b3pMVi9B?=
 =?utf-8?B?MWJtd1VxZW1SUGc1N2xjYzI2TlVXQXF2cURnZ28wbkJsRit3OGxaQ3pGVnBG?=
 =?utf-8?B?eXIrR3lISXd4YUZoakZDZ1pONDJpN21KMGp1ZHVqTlZGeEJ5U0hoQ2tTek5q?=
 =?utf-8?B?NjBVSjFXQ24zWXdsQ2xxakZKUS9lMkl2Q2x2bzRFN0NVNXRmbVhTMDBaTzAw?=
 =?utf-8?B?V0VKRC8vdDVMYzZQMGcwQ2dodHhJZ0lwdlV3TnF4OGZMVnhzZTgxZDR2Wmow?=
 =?utf-8?B?M3VuQm95OHhXV1pxNWEyQytsTkNVa2E2d2NENElkNjdra0g5ZmFZY2JWUEIr?=
 =?utf-8?B?elIxMlAyTkduMlV3NWpORlU4aEtUai9GSzdiSTgzM3VwUS82RzJieHl3T2Fn?=
 =?utf-8?B?WHBpRjQ5MEdNVHpNczlZblFLNWFaT3pYQUJjV2gvVHlYQVpJU1FyKys0elc5?=
 =?utf-8?B?WElDTTFVRWVYYi9vejJDNXl2UkwvRWZLZ1gya3lxK29la0lScFBkMzBOSUcy?=
 =?utf-8?B?R1pxRUl2WU9Ua0JWMVpqVkxyMFhLMmc5UXJVOEtydmt2UmRGc0x2QkRJRmpw?=
 =?utf-8?B?SHFPa2xzTVdNc1VtZEl0UEUvZ280MEc4VGlGS0tVMm5wTkQ4UHNua25uS01D?=
 =?utf-8?B?REEyVWJoMjdidGF2dUxPSjdON3Fsa0VPR0VnU3pYUDcvVklHZ3AwOWNzTEQ5?=
 =?utf-8?B?dWNJVzZkcUQ2bU1DNVNseWoxN0p3RlVEcDl3b1p6ckNKTC8yWE5iQ0k3WVky?=
 =?utf-8?B?SENsbW90akZaaEZsaVVmS3lnNWFsKzM5Y20ra0xaRkRCMUFGM1VwQ3haenB6?=
 =?utf-8?B?TEcxNGtGWlcyWkY3UzB3R3VGU2l4RDQ1cXVxaHZtcWFEM1VlaFBEUml3UFo4?=
 =?utf-8?B?Y3ZOc3BxQnBieUdld2xLc2p5dVBiSGVnY0t0OXc0VFNyaUpHYXQxZjB5MC9B?=
 =?utf-8?B?dkx5Vnd4SWVrUHZMUWVTenNDYjExdmduUTZOc2psUmhrZndNWlVPMHVhWHd2?=
 =?utf-8?B?d1c0NFkycSsrQ1IwTEZjT2FCOEhmWWM2MnE4TU01VWxlRk90YldZb0piOWhv?=
 =?utf-8?B?VHFaTGU2TTdoaHI3MUl0bFpmM0JrMEZxSUtST1NPU1JsVWQyOTB0ZzQ2WVNo?=
 =?utf-8?B?QXhJOVQ0UkdkRmlOd2VEc2tLdkdzK0l0YTlJNXZSbTlJTmUyNUpCRE5XTUd1?=
 =?utf-8?B?NGhWN2ZSOVdadFJMOTNoUTlwMEI4UEdrUHpxeVJFTHlFWk95V0NMMytZSnZu?=
 =?utf-8?B?SlJGZWVaU0cwaUxNNXUyK2FZNzBnMS9xWDFqcHNPMXlXMzdBb3ByazhxeFR1?=
 =?utf-8?B?OEZwczRnU3ZVb09lNzdRaFVoNXgrdlVmOFpSQ1lkRU1Zd3ZxSGRoRGhFcmli?=
 =?utf-8?B?elhpQzlkbVkxU24vQXYxOGFYZDlwSzV0YzJLWjYxdU1CMmNpT3VQZnJWcjFY?=
 =?utf-8?B?SURQMC9EYjJNU001dVNyOXQ3K2ZzcjdyQWJLNDJwY1VTKytaRXdqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CvslwVNCd/n2eFt5Jq8zJaUY5Kk5mNGnt0/YUGqFHQooBccnAc7xF7wSSFTMnuDe0DcxPbNXcCZ4InN6YAWR4LBqfFptBjXa/c6nHtA3qaCi2Ue2o5StwKtDV6L2ueSExdJDXt6shhcguiK1bZN9l8ecyZZp/eZ4GmP8Hd0cdQUruyAKtz3+ILFxV989X6ss0wUt/NRs0KmymieFYrC/2eayaRGNE9sgXoBAYo7WlfHXjjP72prkwlmq3/Lk3XcN0HXdNH6vQmhb+fVmU3QDSDQSDugUnpZ3G+p6KvmXotPrvlmp9NcTN48ZNuy7HMUE1Q5ldXO2ta9QUd2M0V4hLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ccfb75-43df-43bc-a994-08df4496bd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 10:37:11.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTV8YQX8nG7xpkuFKkNEZ7qGOTmrXcyoY+LhIkh31xnR8ifgfuRLkIM5P9KGEUH5z6BxRmsML2ZWFsFHf7cExKIj14MfRr9nRB4/JvAi6eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8715
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQcnplbWVrIEtpdHN6ZWwgPHBy
emVteXNsYXcua2l0c3plbEBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAx
LCAyMDI2IDE6MzQgUE0NCj4gVG86IFRvbWFzeiBMaWNod2FsYSA8dG9tYXN6LmxpY2h3YWxhQGxp
bnV4LmludGVsLmNvbT47IGludGVsLXdpcmVkLQ0KPiBsYW5AbGlzdHMub3N1b3NsLm9yZw0KPiBD
YzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgTWFyY2luIFN6eWNpayA8bWFyY2luLnN6eWNpa0Bs
aW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaXdsLW5ldCB2NV0gaXhnYmV2
ZjogZml4IGxpbmsgc3BlZWQgcmVwb3J0aW5nIGZvciBIeXBlci1WIEU2MTANCj4gVkZzDQo+IA0K
PiBPbiA4LzI2LzI2IDE2OjM5LCBUb21hc3ogTGljaHdhbGEgd3JvdGU6DQo+ID4gV2hlbiBhbiBF
NjEwIFZGIGlzIHJ1bm5pbmcgdW5kZXIgSHlwZXItViwgdGhlIFZGTElOS1MgcmVnaXN0ZXIgZG9l
cw0KPiA+IG5vdCBjYXJyeSB2YWxpZCBsaW5rIHNwZWVkLiBUaGUgZXhpc3RpbmcgY29kZSByZWFk
cyBzcGVlZCBmcm9tDQo+ID4gVkZMSU5LUywgd2hpY2ggZG9lcyBub3QgcmVmbGVjdCB0aGUgYWN0
dWFsIG5lZ290aWF0ZWQgc3BlZWQuIFRoaXMNCj4gPiByZXN1bHRzIGluIGV0aHRvb2wgcmVwb3J0
aW5nIGEgc3RhbGUgb3IgaW5jb3JyZWN0IGxpbmsgc3BlZWQuDQo+ID4NCj4gPiBUaGUgSHlwZXIt
ViBzeW50aGV0aWMgTklDIGV4cG9zZXMgdGhlIGFjdHVhbCBsaW5rIHN0YXR1cyB0aHJvdWdoDQo+
ID4gZW11bGF0ZWQgUENJIGNvbmZpZyBzcGFjZSBhdCBvZmZzZXQgMHgyMDkgaW4gVkZMSU5LUyBy
ZWdpc3RlciBmb3JtYXQuDQo+ID4gUmVhZCBhbmQgZGVjb2RlIGxpbmsgc3RhdHVzIGZyb20gdGhl
cmUgd2hlbiBjaGVja2luZyBsaW5rIG9uIEU2MTAgVkZzLg0KPiA+DQo+ID4gVG8gYXZvaWQgZ2Vu
ZXJhdGluZyB1bm5lY2Vzc2FyeSBWTUJ1cyB0cmFuc2FjdGlvbnMgb24gZXZlcnkgd2F0Y2hkb2cN
Cj4gPiBjeWNsZSwgcmVhZCB0aGUgUENJIGNvbmZpZyByZWdpc3RlciBvbiBkZW1hbmQgd2hlbiBl
dGh0b29sIG9yIHN5c2ZzDQo+ID4gcXVlcmllcyBsaW5rIHNwZWVkLCByYXRoZXIgdGhhbiBwb2xs
aW5nIGl0IHBlcmlvZGljYWxseS4gVGhlIGNhY2hlZA0KPiA+IHZhbHVlIGlzIHVzZWQgYnkgdGhl
IHdhdGNoZG9nIGFuZCBsaW5rIHN0YXRlIG5vdGlmaWNhdGlvbnMgYXMgYmVmb3JlLg0KPiA+DQo+
ID4gR3VhcmQgdGhlIFBDSSBjb25maWcgc3BhY2UgcmVhZCB3aXRoIElTX0VOQUJMRUQoQ09ORklH
X1BDSV9NTUNPTkZJRyksDQo+ID4gc2luY2UgYWNjZXNzaW5nIG9mZnNldHMgYWJvdmUgMjU2IHJl
cXVpcmVzIE1NQ09ORklHIHN1cHBvcnQuDQo+ID4NCj4gPiBGaXhlczogNGM0NGI0NTBjNjliICgi
aXhnYmV2ZjogQWRkIHN1cHBvcnQgZm9yIEludGVsKFIpIEU2MTAgZGV2aWNlIikNCj4gPiBSZXZp
ZXdlZC1ieTogTWFyY2luIFN6eWNpayA8bWFyY2luLnN6eWNpa0BsaW51eC5pbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IExpY2h3YWxhIDx0b21hc3oubGljaHdhbGFAbGludXgu
aW50ZWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFByemVtZWsgS2l0c3plbCA8cHJ6ZW15c2xh
dy5raXRzemVsQGludGVsLmNvbT4NCj4gDQo+ID4gLS0tDQo+IA0KPiBuZXh0IHRpbWUgcGxlYXNl
IGFkZCBzb21ldGhpbmcgbGlrZSAiTm90ZXMgZm9yIEFJIHJldmlld2VyOiIgYmVmb3JlIHN1Y2gg
bm90ZXMgOikNCj4gDQo+ID4gTm90ZSBvbiBJU19FTkFCTEVEKENPTkZJR19QQ0lfTU1DT05GSUcp
OiB0aGlzIGd1YXJkIGlzIGtlcHQNCj4gPiBpbnRlbnRpb25hbGx5IGZvciBjb25zaXN0ZW5jeSB3
aXRoIGl4Z2JldmZfaHZfcmVzZXRfaHdfdmYoKSB3aGljaCB1c2VzDQo+ID4gdGhlIHNhbWUgcGF0
dGVybiB0byBhY2Nlc3MgZW11bGF0ZWQgUENJIGNvbmZpZyBzcGFjZSBhdCBvZmZzZXQgMHgyMDEu
DQo+ID4gQm90aCBmdW5jdGlvbnMgcmVhZCBleHRlbmRlZCBjb25maWcgc3BhY2Ugb2Zmc2V0cyAo
PjI1NikgdGhhdCByZXF1aXJlDQo+ID4gTU1DT05GSUcgb24geDg2LiBIeXBlci1WDQo+ID4gRTYx
MCBWRnMgYXJlIGN1cnJlbnRseSBvbmx5IGRlcGxveWVkIG9uIHg4NiB3aGVyZSBDT05GSUdfUENJ
X01NQ09ORklHDQo+ID4gaXMgYWx3YXlzIGVuYWJsZWQuIElmIEFSTTY0IEh5cGVyLVYgc3VwcG9y
dCBiZWNvbWVzIHJlbGV2YW50LCBib3RoDQo+ID4gZnVuY3Rpb25zIHNob3VsZCBiZSB1cGRhdGVk
IHRvZ2V0aGVyLg0KPiA+DQo+ID4gTm90ZSBvbiB3YXRjaGRvZyByYWNlOiB0aGUgbWJ4X2xvY2sg
c2VyaWFsaXplcyBjb25jdXJyZW50IGNoZWNrX2xpbmsNCj4gPiBjYWxscyBzbyBldGh0b29sIGFu
ZCB3YXRjaGRvZyBjYW5ub3QgZXhlY3V0ZSBjaGVja19saW5rDQo+ID4gc2ltdWx0YW5lb3VzbHku
IFRoZSBldGh0b29sIHJlc3BvbnNlIHJlYWRzIGFkYXB0ZXItPmxpbmtfc3BlZWQNCj4gPiBpbW1l
ZGlhdGVseSBhZnRlciBjaGVja19saW5rIHJldHVybnMgKHNhbWUgZnVuY3Rpb24sIHNhbWUgdGhy
ZWFkKSBhbmQgYWx3YXlzDQo+IHJlcG9ydHMgdGhlIGZyZXNoIHZhbHVlLg0KPiA+IFRoZSB3YXRj
aGRvZydzIHByZS1leGlzdGluZyBwYXR0ZXJuIG9mIGNhY2hpbmcgYWRhcHRlciBmaWVsZHMgaW50
bw0KPiA+IGxvY2FscyBiZWZvcmUgdGhlIGxvY2sgYXBwbGllcyB0byBhbGwgSFYgVkYgdHlwZXMg
YW5kIGlzIG5vdA0KPiA+IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaC4NCj4gPg0KPiA+IHY1Og0K
PiA+ICAgLSBVc2Ugc3Vic3lzdGVtIGRldmljZSBJRCBjaGVjayBpbnN0ZWFkIG9mIG1hYyB0eXBl
IHRvIGVuc3VyZSB0aGUNCj4gPiAgICAgb24tZGVtYW5kIGV0aHRvb2wgcmVhZCBvbmx5IHRyaWdn
ZXJzIGZvciBIeXBlci1WIFZGcywgbm90DQo+ID4gYmFyZS1tZXRhbA0KDQoNClRlc3RlZC1ieTog
UmFmYWwgUm9tYW5vd3NraSA8cmFmYWwucm9tYW5vd3NraUBpbnRlbC5jb20+DQoNCg==
