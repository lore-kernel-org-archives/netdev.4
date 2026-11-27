Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798394;
	b=eGFbcA8Ie9BZj7cNniwXeRED5URpXEhayxGs11LogsRKtnSoGVg/LRFRZTp4YFQ+dgXq
	 zDembIccFJbh/4RwDFhES9pgHklk3UzYAjGPzZ1Zd6+I3cd/Xwj12rTl4CAyLyHpJX7xe
	 fok7CGrVe26CVzX6sQaTLzPhqw2m0dr+sqb5uzBGpHboHPH8LNeD1B7FNlx+prjv8jBPe
	 ocbuWpHIR6wfPQ3idI5aurcLcSZRILSbi6PxORp0aXObsNB1LGEnw4jCY44qVKCpC6IMN
	 /lxz8l6lXwmEDvJV1qFQX+PN4YT3jcmxXD2XDCuDuN2KFGn/cCxmvxcgzoQLtQFnJgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798394;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=OI4Ka+KWRwu3cJArKUFcni317DLSJqgPofwx8G59wt0=;
	b=AOQNwKsEdf2avmmFqa9qRxauoWVFQVhQ+ZUU5qKVHPPzRGrsX54ErDmu0Q4HMHpv0N1y
	 r/6YO2sCsq1YJdyZ4W6kilCV+Q8V7pM8TWG0IcSfLN4HPzr77RqfvFNceBWUzGe7eyf+O
	 wtrJojeM8Bx/9JkhsJqpMxLL8taVD5G07VcM7FiqbR7gGZLN4xC1kKRKSuLq5LS9IVo0O
	 RX2JBeUClX8Nee2Fvi1mWbTHUAMa5i9v9ItGrrEc/1SMG4ks5LRAmbaFcBCPwBPMiawxM
	 3DkX0k8QMdFZkTwQdclWmqv5z571KQJJYzoGtGrXuty9v9raiV01sYdzKrd6Af+xhtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VcZmSqtq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C0606A31C;
	Fri, 27 Nov 2026 16:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VcZmSqtq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795798394; x=1827334394;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=umNT73BRFLqrCmTaI9XCksufYUcDCRAD7WS4d/ee1ZM=;
  b=VcZmSqtquZ7Pcs7ge2Q5yCZrgZL+ZVMa1GGUD0/Rg7abc5zoll6gxZXn
   7iljMUkDoJDPXd8PazFwcCV0U+oCBAcXKQigVi5IXFPxA7jSX18lf0uKC
   J29YNA3VF/Rx3qSOl+lmK5mKO7p1Eo+zaNzBd4QO9VudVDJkebb6oU5V3
   3XYJL7OrQE1OefDi39m3GNA0uL1Xpwke580rpL4fpsVdJaj8OYz/VRd8F
   kmvKpLOthiMhckuFtjRQdaLDvz02iuRAcJLSIjpKKtG7F++LjGkZlKa3L
   siNxCmb658e18Hj5zrgL/mPEgRW9OQkK7oAktOcBF05+UGQnv7kGMKdOI
   A==;
X-CSE-ConnectionGUID: sYql0C1QTniWV2eg5AS+UQ==
X-CSE-MsgGUID: ZBLObHF9T7aOvoO/55jYLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4712833"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4712833"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:53:13 -0800
X-CSE-ConnectionGUID: 8WuLs4D8SlGaLnQhL8ARdQ==
X-CSE-MsgGUID: 6/eQIQfEQPOBqHdPZvVlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14104335"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:53:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 08:53:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 08:53:12 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 08:53:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yra2jp0R2XP9DMh+NKorzTkev6r0bLsfrFHIvIdXyVsje2eZdAEgH5aAvMsAM4r+rSlOO+cWxwyNQtc3dTy6lkLQJZkGb8M+iwMzr08Vxb1RIkPiZ7ePGKiXH6Dqi8QeT3KFHQ5JKh4dFyEN8wVLC95Y83KZmfDaM0BlBbXWtGdN8KsLIhCzWez4kBKU9lymZ2fve1yTafGlr6hNup+7wiWVqudtby+tefrX6ISQaYLqM1lDxyrj6okwYMFdqorj7Rif4y1oB2TaIarQ1OVU0cYRDx2g2BOdV6lZKA/qdwVHI6VwSKch+h5B3zCQEuNC9/BfMJ4tvif2d19lRw0b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI4Ka+KWRwu3cJArKUFcni317DLSJqgPofwx8G59wt0=;
 b=UeP5sgBQH+NOikNjSZ/QqjcnMEOZclh4WjpYzByCUR1um5LLjiG5ATTE8UN8i1hMxN9xyO2xap4TK/GkbSMqcwr+nbojsX01r3nWvQ/qnwHrvf0vpfu1j6T7PIshRKzfk4PBGDRanicUC1CEmBDSlJG4MHiVkhDsvyWPN3RQsFUlh9JsyaKwl10yq06irggErjJDJXyJLFmsfgpYwDzacY2m0xVlblBMeC93QVeZ9Yd++lsoaS08pVgSpOZz3ddRWVDVQS5wtDeRaNOUsd5QiQDzXJJjDIBjTmKtBt+t32Ko7/BLUhtnfKkVan/2uZHZVvbFWSnAu/0IcjGAD6Gy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0SPRMB0197.namprd11.prod.outlook.com (2603:10b6:510:43a::22)
 by PH0PR11MB9750.namprd11.prod.outlook.com (2603:10b6:510:397::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 16:53:04 +0000
Received: from PH0SPRMB0197.namprd11.prod.outlook.com
 ([fe80::167:c419:e42e:59e0]) by PH0SPRMB0197.namprd11.prod.outlook.com
 ([fe80::167:c419:e42e:59e0%5]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 16:53:04 +0000
From: "Olech, Milena" <milena.olech@intel.com>
To: Ahmad Byagowi <ahmadexp@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "vladimir.oltean@nxp.com"
	<vladimir.oltean@nxp.com>, "vadim.fedorenko@linux.dev"
	<vadim.fedorenko@linux.dev>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kubalewski,
 Arkadiusz" <arkadiusz.kubalewski@intel.com>, "jiri@resnulli.us"
	<jiri@resnulli.us>, "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>
Subject: RE: [PATCH net v6 3/8] ptp: ocp: preserve timestamp routes on DPLL
 frequency changes
Thread-Topic: [PATCH net v6 3/8] ptp: ocp: preserve timestamp routes on DPLL
 frequency changes
Thread-Index: AQHdfcUp9JCl2xOXZUqg7PrXibIBXrdCIn3Q
Date: Fri, 27 Nov 2026 16:53:04 +0000
Message-ID: <PH0SPRMB01975FBC031CB35AF5077EB08E412@PH0SPRMB0197.namprd11.prod.outlook.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
 <20261126-timecard-driver-v6-3-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-3-ahmadexp@gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0SPRMB0197:EE_|PH0PR11MB9750:EE_
x-ms-office365-filtering-correlation-id: 0e1c7cfe-6ac1-44a5-445a-08df4ca6e7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|3023799007|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261021123027099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|38070700021;
x-microsoft-antispam-message-info: mNRSGskup2FD9ciIyWAd6MlQ6W5R9kt7DmXPMe+0iXyx8+i7VVhkURZZVvC0bNqb34AJF7LMfz/NvnFqGuXu44nGm9kaXpLO45i7BW1inN+oBKJsdsC9QWdS5+zfDIypharfoeAHNZ1JALrl93yMse/2g7XyFrZ/eWLY0AUuEIvVzMZAIWdq5jZq2oD2HrUk7nkDzkRCLmnVXYwyWpB7E2SvahXedtSfCP9JcWam0YcPGnLwQrBQIXF1vMhw1hUHnzFc9loJZdbn/IUBm8hyLzwR9k6asfsFpMe2x//nHRA18X2BDOhxxA312MuWqteKSrSRMXyTxY34elcVnVUvoxiy9UIAjZ5hgP8bF8encXl4aHBsGQvhvse+VfHi++OwdZi36Mb0dPLQLrsSJkFGcnLIP862sCcX9Eec5ggYGC1mkdn7FsKg8Hfn8ZUJRquK4W1bvfMpWB/DlqKtkay6oubree8k0n9OatWptQY+nevVMSXzGoGtsE2F5ezg6WNK4NC1Nn26/AdTFfSGFRNxfv6ihC8Ur4qSs43BkYySB3rzXQGERQyMKk+txRSeLTS3JQxzIouw8fhsC5oU8izkED+YXDtP1FlAm1y3HeYGdGgkOkz6QA3Itv92OKJmF3icp0FiT1cgCtzsiJfnEZ5e9CsLq2iZhlrtTjxtlo2dz7YkpcT9166DI7fjLuaeUOsKuc46TInMvWjG+55CyKXR/r+oXKs52zMP//IC+gUiDCM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0SPRMB0197.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/mh0rbLZ3RWQDFdj7aKsnSVMManjfAsa9EyV2E6l1cA6IjESfTCeRDQAava+?=
 =?us-ascii?Q?U5+R4nmjwxJtxHVQlDz1yK4BCUd1PMDswZhBy6wS+3aRU/IF7mKQLd5Ghjg2?=
 =?us-ascii?Q?hDKxvAx4i8bkk20yMX5GF7wF2jyeE5+5hJDL0M/7yBfDou9s2+3HsEiEg2Gc?=
 =?us-ascii?Q?rqYoqYJXrCJ+i4tnlecZK3Ico//xIdGhy+CRe46atTB2R4a0FdsCucFzg/QU?=
 =?us-ascii?Q?fRimDSeElRMvPQRfFNu/SpOkamVpGn1JiTJCgvtMjFb1FGPwBU7zl69Cijxo?=
 =?us-ascii?Q?5mY0AO+s/zRJrrEx7+7p0/3wpoXyfVVgUIjrKQ9UVNdxrpc0Bjte+p+diClS?=
 =?us-ascii?Q?AHNgtLfZWXTY8u4i1aJNSVt2DzJY6S7DD7LjU0o+X6rfYO8jHHiliE+qkLdF?=
 =?us-ascii?Q?OIE6qF6dbP4S2VXfyQtW6S+tA9XTm7LzpASV7oevb7HhxAQNHjAXDEfs512L?=
 =?us-ascii?Q?OXn8kjEEaB/s1O1pNMgbQDrpYGlcEI7Yy5eSoNvxp/w36IfzD+1THVx0hLWE?=
 =?us-ascii?Q?DyE68dTGkRXgYLdSLaeCdIzWCMm4+IfQp7Uvhjbsr+QYsPEyhBhrw8dwrybW?=
 =?us-ascii?Q?Q1fOWxLdoDdc4u1J44A+xfWNiRvxqDt3b9++Jwkmts8S10pIjKHTDanWTSiA?=
 =?us-ascii?Q?wP89JT/hA74DQ4ei9s42L+2qGT11KrP4hmwpcvm0WHDFxBptRaRRp5os2CqK?=
 =?us-ascii?Q?6kYfGMTxv/n9gdeIaWItiYg4GCG7iuiX88TejwnnvrsJlQs96ozIjHlX5JGk?=
 =?us-ascii?Q?faEgZCihrdiBcaHj14hVx4TiNV9jgqM8r7XWqCING63e4jnM67hmJJ4tk4g9?=
 =?us-ascii?Q?9KGfr9LqRLWF0xhv1oUN7T6loUTgLQI1+cth85XoMSSg0LqgGZz0QAkVhgmw?=
 =?us-ascii?Q?HT8whzqCLI4yd7Vk6CCo7Om10XLIImM3YC20Ip93RAWDhcD+V9i2dqTO31b7?=
 =?us-ascii?Q?8cnor0MY5jKFbbpMUnoiH6+msM3bDRg9DtTVKG2YFbAV7YsH2N29uXK1BNv/?=
 =?us-ascii?Q?mdEAoHKzhdGtIxPKGv/g0jpi60KGfknzRQKjPwSQ8qI2KpjI5pPPxPjfnBTH?=
 =?us-ascii?Q?aeQHYJO//D2HXC6cpYDmnFjLWmW0BR5ExZO0vsYcgdyjmkwGUHzqsrMk8TWO?=
 =?us-ascii?Q?gTrAkMoKwE7djLYoLQvJYUAQhQ3DuKPN/wWdYx5C4EY5pA20i91G7YybCLFG?=
 =?us-ascii?Q?b+cW2t5JspyjA8goVuZWeu8Hf2bYGX55bb63cg7r/UKPVpX35MP+KydBq4eQ?=
 =?us-ascii?Q?z8hLM9Dyg/R6ftjj+0phsc1gCCPLtCDZCcNTMhbc7uaGPpVjOvY1xDin43cj?=
 =?us-ascii?Q?yQxYTuH7QOa4FAR2wOhb6iHcbcimb0TQDzti8sRG2v2C7aOIppHsI9W+BXDc?=
 =?us-ascii?Q?vD4CBd+4Buzai+YIuebuhm5Ez7AlOUNiD+XHqIuy54OJpGivhPKLHN7141Wr?=
 =?us-ascii?Q?UpJDI9Ud7D9Mr5Cv47izNunFRVr8O6SDYnmiF84ZxvY7M8PUEN5HySfzl7Q6?=
 =?us-ascii?Q?HVEdZKPI2a7zGTKf2JER+burJp5xF51fR/WfSNW5r13yAaTUpshGjtSBZLiv?=
 =?us-ascii?Q?sqLahEmZc9nhPLjUE0zR4ZacRX7FLCEeZk1T0ejdAvA+mzkvP91AU8v1cb11?=
 =?us-ascii?Q?vO4JFLFYWjavNn1yN6eq7iIxEAbAs1aWYktBacuqCePwbFUVBBDi5rBYuP3w?=
 =?us-ascii?Q?OwDeR5sjoWgZ6OW886C3jbuPOSN+fq+J+45WhfL/LdCCbkmxFld3nYmzt/La?=
 =?us-ascii?Q?TNNtiAsC/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E6wN4J1SxpnWkTP1eN0HEsc6MlU6drg5ZvE8tu4MJPVTeF/Z17am9l1s0KVYOanBxflEOQ0uc6y4QEjjYfNWyJajO2Q6vbb+q7vgaFsdCvQbWwJ7ItNOm9MizDrVp3ipG+xRfjQH4I3p9UErUXmVTthTWmDEI0RJ6A/paCgphLWTgC65aIYEWlPDC0iEb4t9FOq8fwCzDThdT1khnQLo8ceUiynBUx1xjjTL1QIkxr7c8xSqlnyTkyESCira23VMALuG5eh3Fgw97A0hVmmRIJMgAs6ES+8gzmZR7R4yfwJ5CLXJms+kk3jUzL25GVFJ1qzjNpq5j1+8nSHlQ2C3iw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0SPRMB0197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1c7cfe-6ac1-44a5-445a-08df4ca6e7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 16:53:04.8128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XAMtQYhkc7xt7otFU9vG/SMYbuzg2TJDsOYZvyDcde/gjNJ9s3eK/IMkYVdU+jHd2L4B4a7Mc76JFwdHKXj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9750
X-OriginatorOrg: intel.com

On 11/26/26 5:43 PM, Ahmad Byagowi wrote:

>
>DPLL frequency changes on a combined SMA input currently replace its compl=
ete selector value. This silently removes timestamp or counter destinations=
 configured through the SMA sysfs interface.
>
>When changing an input frequency, retain selector bits for destinations th=
at do not define a frequency. Preserve the existing output path and continu=
e to clear disabled inputs. This keeps the timestamp route while changing t=
he frequency-bearing source.
>
>A coding assistant helped identify the route-loss issue, develop the fix a=
nd regression test, and prepare this changelog. The test uses the actual se=
lector and DPLL functions with instrumented register access.
>
>Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
>Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
>---
> drivers/ptp/ptp_ocp.c | 47 ++++++++++++++++++++++++++++++++++++++-----
> 1 file changed, 42 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
>index 625a85b2dc7e..284908c6abc2 100644
>--- a/drivers/ptp/ptp_ocp.c
>+++ b/drivers/ptp/ptp_ocp.c
>@@ -5873,16 +5873,31 @@ static int ptp_ocp_dpll_frequency_set(const struct=
 dpll_pin *pin,
> 	struct ptp_ocp_sma_connector *sma =3D pin_priv;
> 	struct ptp_ocp *bp =3D dpll_priv;
> 	const struct ocp_selector *tbl;
>+	u32 val, aux =3D 0;
> 	int sma_nr =3D (sma - bp->sma);
>-	int i;
>+	int i, j;
>=20
> 	if (sma->fixed_fcn)
> 		return -EOPNOTSUPP;
>=20
> 	tbl =3D bp->sma_op->tbl[sma->mode];
>-	for (i =3D 0; tbl[i].name; i++)
>-		if (tbl[i].frequency =3D=3D frequency)
>-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
>+	for (i =3D 0; tbl[i].name; i++) {
>+		if (tbl[i].frequency !=3D frequency)
>+			continue;
>+
>+		if (sma->mode =3D=3D SMA_MODE_IN) {
>+			val =3D bp->sma_op->get(bp, sma_nr + 1) & SMA_SELECT_MASK;
>+			if (sma->disabled)
>+				val =3D 0;
>+
>+			for (j =3D 0; tbl[j].name; j++) {
>+				if (!tbl[j].frequency && (val & tbl[j].value))
>+					aux |=3D tbl[j].value;
>+			}
>+		}
>+		return ptp_ocp_sma_store_val(bp, tbl[i].value | aux,
>+					     sma->mode, sma_nr + 1);

One observation on the tables that these functions rely on:

ptp_ocp_art_sma_in has the entry "10Mhz" with .frequency =3D 1000000, while
ptp_ocp_sma_freq has 10 MHz. So with these tables frequency_set(10 MHz)
finds no entry and returns -EINVAL, and 1 MHz cannot be requested
through the DPLL. Is 1000000 a typo...?

The old code stored the table index , so this patch also changes the
behavior of the devices that use ocp_art_sma_op. Maybe it's worth
mentioning it in the commit message?

BR,
Milena

>+	}
> 	return -EINVAL;
> }
>=20
>@@ -5900,6 +5915,7 @@ static int ptp_ocp_dpll_frequency_get(const struct d=
pll_pin *pin,
> 	int i;
>=20
> 	val =3D bp->sma_op->get(bp, sma_nr + 1);
>+	val &=3D SMA_SELECT_MASK;
> 	tbl =3D bp->sma_op->tbl[sma->mode];
> 	for (i =3D 0; tbl[i].name; i++)
> 		if (val =3D=3D tbl[i].value) {
>@@ -5907,7 +5923,28 @@ static int ptp_ocp_dpll_frequency_get(const struct =
dpll_pin *pin,
> 			return 0;
> 		}
>=20
>-	return -EINVAL;
>+	if (sma->mode =3D=3D SMA_MODE_OUT)
>+		return -EINVAL;
>+
>+	/* Inputs can feed several destinations, including timestampers. */
>+	*frequency =3D 0;
>+	for (i =3D 0; tbl[i].name; i++) {
>+		if (!(val & tbl[i].value))
>+			continue;
>+		val &=3D ~tbl[i].value;
>+		if (!tbl[i].frequency)
>+			continue;
>+		if (*frequency && *frequency !=3D tbl[i].frequency) {
>+			*frequency =3D 0;
>+			return 0;
>+		}
>+		*frequency =3D tbl[i].frequency;
>+	}
>+	/* Unknown destinations do not establish a frequency either. */
>+	if (val)
>+		*frequency =3D 0;
>+
>+	return 0;
> }
>=20
> static const struct dpll_device_ops dpll_ops =3D {
>--=20
>2.54.0 (Apple Git-157)
