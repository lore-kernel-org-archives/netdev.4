Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=13.216.54.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794736091;
	b=wpZI8aLSZ1Syc53yxYWLKT7migVErDKW4QDy/ygVRGb/UvbslYUg2kPv3Z+4Y2DSVVcM
	 p+IKUgGnV/0Jpy7GX4dgZnitNxATSLtI/hPNe6E7u6A3hLeDnYmn/bVvbHqZsHQ+xe/qQ
	 Q+Kusg7oC4C+edVV/i/IgLNGzImvtcAapr6sq4BYbZtscV0QXf87Ff8J+iDMS9TP9U79s
	 DbMBjigb3cvE/RRfH3E9L/WkCrlQsrma41uS5KoDkSo+1iyCyjzK4x1fXyg9vbeTblJ9z
	 PRJQudLXY0Y4PPBUjttmkJWBzn/IDzUs0LMWloWcE4got85EHlpcMU32iT188b/pgNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736091;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Subject:Thread-Topic:Received:Received:
	 X-Farcaster-Flow-ID:Received:Received:Received:Received:Received:From:
	 To:CC:Thread-Index:Date:Deferred-Delivery:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=B0GviV6Itqjhb/JXz7mUn/GBl2X2JI3n4hR1xkqKu5U=;
	b=nVPoBIqFG80BJE6nkVY0rp7zw3xa7gkSlWjx1/EQJoQGykddMsqZW1eHNuuoDgr63eNL
	 oVnJfptMwKqhwOyqZ2Tv99jJAxXB/W+Tn/z4B46DR0z6HoZ0WyGnN+Wqk27idYIqbQLas
	 SjnIZv97enb4OeB+AnAZYEJrrG8BrODMdGhrCnHboAowCgm31UHAD3ObZmWcUwf803C82
	 iZpE4VzdoSiE6sBUAP6fbrSKusO0Jnk5HoIAXH4Mll1YZHG07pWrPmYE7NsvBTUastAWN
	 rC7fljaGQGaHdmUO9gVIfkv7tVCZvd5ohkRGSa7c0NzXy//tz6GhBoZ7797cpW8Bfkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Zy8yaD+B;
	arc=fail smtp.remote-ip=13.216.54.180
Received: from iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com [13.216.54.180])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF8606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32AF8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Zy8yaD+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794736091; x=1826272091;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=B0GviV6Itqjhb/JXz7mUn/GBl2X2JI3n4hR1xkqKu5U=;
  b=Zy8yaD+BjRxNVJh4uQvtdCZdL6hYr/JhzQjwKsmoGZxfiMER0xJoCE7Q
   um69J3Ec6m2EeZhL9TXe2PPHZ4Fp9ThDJ/xE0YYbaQJFaxkDyIgSItSWY
   wAY4zW93Xt2gQEY+cR3KUScSfRB7R9XTJeQ1MYpgYoC0baQ9qQY0BWYn3
   Pmp72mj4nZ1qYsqEFjhN1fY6ahO8YHcMfXVygrafsCWZtnnkB7P7rcE7L
   V1L1EA5DADnRt49Be9Z0FeIJXvjbNjViDz1TUMfPM6aEh6Dq/p5Ek9WNz
   vzXBV238J2IfBYMiyq3zvkEMr1Bu/8Ui/wLZu+njtigTq4guyMZtIfS1z
   w==;
X-CSE-ConnectionGUID: cFGwCutrS3WPzPk10DF8ig==
X-CSE-MsgGUID: 4o0QrNh1SBuaY7uJpS6SgQ==
X-IronPort-AV: E=Sophos;i="6.27,214,1787011200"; 
   d="scan'208";a="31982887"
Subject: RE: [PATCH net v2] net: ena: avoid double-counting TX DMA mappings on failure
Thread-Topic: [PATCH net v2] net: ena: avoid double-counting TX DMA mappings on failure
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-002.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:48:06 +0000
Received: from EX19MTAUEA001.ant.amazon.com [72.21.196.67:19034]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.51.112:2525] with esmtp (Farcaster)
 id daa39a9a-3dfb-4690-9b68-d28e3e25bdc6; Sun, 15 Nov 2026 09:48:06 +0000 (UTC)
X-Farcaster-Flow-ID: daa39a9a-3dfb-4690-9b68-d28e3e25bdc6
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Sun, 15 Nov 2026 09:48:06 +0000
Received: from EX19EXOUEC001.ant.amazon.com (10.252.135.173) by
 EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Sun, 15 Nov 2026 09:48:06 +0000
Received: from DM2PR04CU003.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEC001.ant.amazon.com (10.252.135.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Sun, 15 Nov 2026 09:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqMEIvA8z34RCEHM1hgOiXBgfBeqfICBKE90IJnDvilYPqKl8e5Jg792w7KgD/sYmIMEVuD/26vccMMtcpetdn+EikVdTR/9KVTAMJ1GTPwKY3dl7xthDr670x89A8+AhtigziaWQW+zmwsiLo4Z7C0IFI+zWRHJrSKqGfKsmF675+mw/q4KSO4YAkIC3tMMwZ7jOrgKfEMiBx9bSGmDAb3dWziNGvNTwIQuAdsONPy+5pZZqJ2t3cV5qtLXcwxnpvVuIiNOODmL7KGTmGcfDPf1ihsUHtvWhMLn7ennOQ8gItq0Jkt+zEfpnvR6Wq8wyqSSye4YFXHpYexKKSaNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0GviV6Itqjhb/JXz7mUn/GBl2X2JI3n4hR1xkqKu5U=;
 b=xrXUqs1qaUzTcjBOizxwAkJUI/KN1zfAExJOfd7rJGfCe7ahTc7jCnmSG1RcLPqaN/SF6MAFKaD21UwZEHKeEf90D+bGKVx1Lf1QnNxKlOrIbqCuSttiondX2J1bfTaIaIlnlH+8GJCZ3T7clHouovs0E+KI4m+xiCT9uHAzT7faDWhVeDVNCOlfQfSUPWJ4+MzJZbtX6idYLy7WdfnGeru+sHVBUW8sJrplCmaPIKeBcl7Eqa5djxTc8LKiwB873HgFWruFjmpBSNp1KG/ttFPZTsqU8NaInkUgeOBaYzvCJ4c3gvRDkEB5aW5lMTSmO4ZhV96AxGXevVkwQKWG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BYAPR18MB2600.namprd18.prod.outlook.com (2603:10b6:a03:13a::13)
 by DS6PR18MB554262.namprd18.prod.outlook.com (2603:10b6:8:416::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 09:47:04 +0000
Received: from BYAPR18MB2600.namprd18.prod.outlook.com
 ([fe80::bb21:2c9e:69f:5ebb]) by BYAPR18MB2600.namprd18.prod.outlook.com
 ([fe80::bb21:2c9e:69f:5ebb%5]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 09:47:04 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Avi Weiss <thnkslprpt@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "Arinzon, David" <darinzon@amazon.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "Ostrovsky,
 Evgeny" <evostrov@amazon.com>, "Brandes, Shai" <shaibran@amazon.com>
Thread-Index: AQHddAVZfxALgayUIEuwyOj8qmPEebcu49DQ
Date: Sun, 15 Nov 2026 09:46:44 +0000
Deferred-Delivery: Sun, 15 Nov 2026 09:45:51 +0000
Message-ID: <BYAPR18MB2600CF080577180F6B9DE03FD97D2@BYAPR18MB2600.namprd18.prod.outlook.com>
References: <20261114065634.488832-2-thnkslprpt@gmail.com>
In-Reply-To: <20261114065634.488832-2-thnkslprpt@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR18MB2600:EE_|DS6PR18MB554262:EE_
x-ms-office365-filtering-correlation-id: e72d0c55-b32d-4c5f-5a1d-08df42fd6775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022113327099003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003|6133799003;
x-microsoft-antispam-message-info: 4pawS+FCd5mp6u3ka8UymzIep4VyO6G01Z3w1EwUWSn2kMbcOAXeT6mtlklZ2laI6sYyPhHE7zxrsBoynHfFyMXZ+dSkCWKsobg+Er8uODyYwaTTyUcFb5Q2XdWDDcByy1den3jVvFGLdf+kQ+nOLnMmjGLg19+JXBqlB7m1LqoUOigpMjMA+w9krdwOQH10Ooave9XTpLwQYoprd1iWCP7Ghh74unn5zBv06beKaSa5Gtj7G36fXCB4XT0HYke2/mkSVA871O835mPBrzT+AN84nyXCQ3Oe3ikJRjGfVdwgQpvEnIDe8zoaUip/r8j34ehFF4cZbni7N9/RT7Z/Q59fAM38bUdWyQUunL8Ws1FFg3KJlmWyPEz6HDqNgbX+3cZsjZW7oTj2yNVz+XSN5uyE13XsiVCNVUaINbYDE+TRUcvqhe3Z6skf9gGuOogpk+0CKkvdUdQxKX64zRmPue69pWeG0N2/TM8fU2za9GGKjmXhN3kPd4ZTmty3uss2pDig1WgawkaKi7mqCOlyU/tDgs6M76ACK9sG0FN7XmBnG/9MyI02LUAdF22REgJSN2I61oPxFRewCM2opFfdaGQjnF0UEzODLkiOYZ26/fKXrkt8YFQ0zX1vFgVqPlER8aM75JPRkf8+yaOY5eKdwc8Sh3UzSQamh2ZX65S2VoH0YiH1MloODyGbW7hFI0RBGl1KDDUC7lIuxMQE8YMS/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2600.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1eDCiZBGVd0ArPuTJaNVH1uPasIEOVnH9komlX+B+XZiZJY+3+PRxr5kLlcD?=
 =?us-ascii?Q?mFUt4fB0vgZh7Dw99xiSqTGIiXdEWiD1u7OVAeWoN7gGThhARVwPb/9I719K?=
 =?us-ascii?Q?pAr6ftyOODr5GcdFmL/8EUaxajDpJQuOGzLNK6W86iFCCuzoT0vMsz5uS1At?=
 =?us-ascii?Q?nTbKJiz2lD1DTa9TBHO15kEt/zVE7x30U7B4JugBc6REg98PW0NFdgVM4GrZ?=
 =?us-ascii?Q?HUbv4sfPJso+xgSfBwBAtOaUf4AzmMx/+1NeO4S3M6VLxwuDzUmemVtEFIf2?=
 =?us-ascii?Q?SV3H3ZFX0+mbLUHb2/29xn9gmRUi0v4NBTq94FhFbrpwcy4c1dBpbJBarbTo?=
 =?us-ascii?Q?cIWWZmkXPgQRcoUkPOFst9pvD0/PRApC43N1GTXIkRqx3P49mOU6SD3vEwDz?=
 =?us-ascii?Q?UsiY+I1Dvd9q8Evz7R3+2WvZywwYPK9kagufeeIP9tY/Ue411LPUU/xi2uey?=
 =?us-ascii?Q?WD0Byx242eIGzuX2nRDzO2e8oCw0j53UhEE9edbSk7Csk7wBdmOrzrJ523ym?=
 =?us-ascii?Q?GGASnGGIlVzymhouDYH6hbpQknyRMXvCC8lCdLOudg1RQj26y+7q18I2ohrd?=
 =?us-ascii?Q?yxuSc8AwxAZvxKAO0QJoVWOCs5ChlRNLZGjcfYSpVMFoqn27h36PSsepP32/?=
 =?us-ascii?Q?J0uoVsxIzXpKoeLC5zN6zLCcfOl/NZdvEv+hvadQjR0OXZAoTjkEopN4oHtG?=
 =?us-ascii?Q?rNAnK1E4+6ZiZQShrp7VrFU7XFm4Yglq9WKbtORZOkSd6r26ICGpZgkV8udz?=
 =?us-ascii?Q?PajOvaSeWc3+LdmZOFcPl5tB/mA6N+ixS0IqHx5YMJIx4SJdFmRmLqePMcaM?=
 =?us-ascii?Q?xlQamPjQxKvM0W54YQAvsja7/Ryoq/UCUXnmZFA8MLSKVpTjsz4fNs2UjT/F?=
 =?us-ascii?Q?x07zComqFnB2a1jretDu+wOavj/jvzqcmsqri6zV/NiR/BnQ7Ac6K+bypuS0?=
 =?us-ascii?Q?NLjAUDsgOdMv2dN9UM0uEESFThcg+kzPakTvrS78lgCLSUH5yMUY7bp1Q3dM?=
 =?us-ascii?Q?d1Hzon7TXSEDszn5gM4BGm4v26RwKyJ/UagGx/msNovGUu5KA67YKEinqQch?=
 =?us-ascii?Q?j49KCpX35vkSNblfyuGvl4sMB6PWE4VtdrKvKlVyabnuvssm96XPaBBNYC5c?=
 =?us-ascii?Q?EiwkdlWnGxPorLY/t2fzAd37vbH72aeKz+SkYY3qZLulTB9GOEWel6d7XM+c?=
 =?us-ascii?Q?+ryMdnCC5TdWBR4F9/JLJTi7bR5eMqE8Sa2aP0WYHhhlTeb72WiIx6+3NOoc?=
 =?us-ascii?Q?x1p6u181msoJ7rYTi4HrIsF+we10t8qX2ghlV4n61NL9NWW7P1CcykSJyTPB?=
 =?us-ascii?Q?1QHt1Ha81VeDO82zBrfwvNyDLc/+uiRgXKxnwI+CelXzOb3LFtEjElx2jNO9?=
 =?us-ascii?Q?5ixr8w7jhLR5XQVCzZ7K4cBSXVUAkrhlBPLJMjQznnLfntl94Iyu3x7e6QC3?=
 =?us-ascii?Q?TR0rJf/Je/yLbfzzGVTBwD26Q447Q7+F5G183F85CUROvHu/Njz9oFnWjRvR?=
 =?us-ascii?Q?cap3s6pL8bDpH0fznJwWKdsRfRf+KOW4vga+uCpTcHYSMe/PNaKtyZpGRitB?=
 =?us-ascii?Q?bm/5CCQgU/ueSsy0X/Ov9kopFYuC6pGh4WD1P0kLjtMS3H7WnRjdms64o1Y3?=
 =?us-ascii?Q?OirLoYfe13IISnHZgydAqWwUIRW2qStwfoKvbMkDjd8+TajDpJXJ77H6b6sV?=
 =?us-ascii?Q?fNvVquESdLowda+aQyolp3UHv0SAez8Ih9ecrNIAegSywDw/u+0lC7750p+S?=
 =?us-ascii?Q?cFIaPG4y7tOqqCkPPM0sPRYpP6caqFD9SvLYCmxVYifmkIifxJ97kk4HM7D6?=
x-ms-exchange-antispam-messagedata-1: 5DDgbddUYAh1eg==
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
X-Exchange-RoutingPolicyChecked: Z+0E/pVkblSmCqEvDKflEtXBM4XDvPGbTLOEX5eQR+ROhKyjpnZX9Y+ak5MFYtqZnqclsdMbdQYzGYflXvSAGCaoymKLs/FaQmu0iSKCbfTJDiNZ8Db60+j+YZNURD4r9kgUbAtB/41ELlEE40GTsnwiUmlP7Nv73JeXvGqFKh749M2k88OJkXrrZ80BKLXvsh5tZkUdbLBhz5pqzvgnJ6Rfn5C5giNhbMf+1FHJR+XwMxTfHnEBs3JNP4KntSDIjYnybEvJGel7llAved8L1MFG8Lh+elTN0IetBsiixIQbOmG89csaI5yZ1vAcXQvgbpXPBXSscTzywN4fT5Y6tA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2600.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72d0c55-b32d-4c5f-5a1d-08df42fd6775
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 09:47:03.9491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9mE1sFBkg1gE1VCww7vNCLX2bjR9DZ0X1XYVYJHpe2TR6ra7jKfpS5U3ndk7vcmWnpSMU6vF7jLytNJoNMk/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR18MB554262
X-OriginatorOrg: amazon.com



> -----Original Message-----
> From: Avi Weiss <thnkslprpt@gmail.com>
> Sent: Friday, November 13, 2026 10:57 PM
> To: netdev@vger.kernel.org
> Cc: Kiyanovski, Arthur <akiyano@amazon.com>; Arinzon, David
> <darinzon@amazon.com>; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@kernel.org; kuba@kernel.org; pabeni@redhat.com; Ostrovsky,
> Evgeny <evostrov@amazon.com>; Avi Weiss <thnkslprpt@gmail.com>
> Subject: [EXTERNAL] [PATCH net v2] net: ena: avoid double-counting TX DMA
> mappings on failure
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick
> links or open attachments unless you can confirm the sender and know the
> content is safe.
>=20
>=20
>=20
> ena_tx_map_skb() increments tx_info->num_of_bufs after each successful
> DMA mapping. If a later fragment mapping fails, the error path adds the
> fragment index to this count before calling ena_unmap_tx_buff(). This can
> cause DMA unmapping of buffers that were never mapped and out-of-
> bounds access to the buffer array.
>=20
> Remove the extra increment so that cleanup uses only the number of
> successfully mapped buffers.
>=20
> Discovered by comparing the in-tree ENA driver with Amazon's standalone
> ENA driver.
>=20
> Compiled with W=3D1 under x86_64 defconfig and allmodconfig configuration=
s.
> Fixes: 38005ca816a7 ("net: ena: add functions for handling Low Latency
> Queues in ena_netdev")
> Signed-off-by: Evgeny Ostrovsky <evostrov@amazon.com>
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> v2:
>   - add Evgeny Ostrovsky's Signed-off-by
>=20
>  drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c
> b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> index 7eb6456ed0d5..e0df628e1df6 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> @@ -2608,7 +2608,6 @@ static int ena_tx_map_skb(struct ena_ring *tx_ring,
>=20
>         tx_info->skb =3D NULL;
>=20
> -       tx_info->num_of_bufs +=3D i;
>         ena_unmap_tx_buff(tx_ring, tx_info);
>=20
>         return -EINVAL;
>=20
> base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
> --
> 2.43.0


Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>
