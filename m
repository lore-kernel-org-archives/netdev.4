Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795417922;
	b=CEE4LewkmrIQRtV6+RlD8sqva1Da/AV56XullasNhXDwCaCV23yF/KVSABF7oV5kl1Lg
	 q5JImrOOn7bvoBA+5aMy8gByzJTBmuYDMdfyEKykgZDAKDeVqK3za1N1Piplr7vM7NCXI
	 SzaRSXV4XaoT42Q445ajfhxXnSuydxZYs75R01F/rxDW3XDZKuy5S3vepKHHv/JswGCau
	 Ys8aSZk7xFZq+5S6zwfMajDkvr56v68s7Aiim/i5NeTRoF10QpCFjUFOgvnOxE4igCVDd
	 qiQ8YNo4E+Te99AHJtRTqkAt2CIjIzzwtHDKM8i1nd1JB2h/drAqJra62Dr+Tco2HbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417922;
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
	bh=OT1Ik+ZD/j2MCEZSb/TvREm92uIi9TcB86ipXhIHjkE=;
	b=Sirnrqip5ZpWXUi9jZgJEjljVcd1aqG+D+J0TVfP56qn+5g4fclL81PrrMgKedVgNekW
	 X1PrIlYrE1mVNNLsDe/tB/NVURb9EbiI68E6LM3E1bV/4dmc7LWbVyDJXE0y+G6fOwq00
	 pCfZctizeCXhE0+eEgJ3UxC/VRLs1vwb0CBXat3sdkwcA9kZ2lEKCnJwTu02o5Y7W0Snr
	 qyzSAranRbJXLL3m0zV3PFvMDA+5emidqwWIH1yE7sXjywg4CzpE7KGZLNNNe5mv5DDYX
	 nLvvTaWlZ6imh5fYkfkOwowfPIIDYmousKmf3KK7qBid5ZwMhZzha523KPZSxl60wEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JLDaF9pL;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OKL80odG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DB606A31A;
	Mon, 23 Nov 2026 07:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JLDaF9pL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OKL80odG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795417921; x=1826953921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OT1Ik+ZD/j2MCEZSb/TvREm92uIi9TcB86ipXhIHjkE=;
  b=JLDaF9pLnHDS+bvrNB9kSFu6JV3Q2e4FGurAot3JaLILDvL7Kh4IMspb
   cncn3uc0qYMYkDBbFOm5VPTpsSZAG8mdfSZxxm5Vb83Uk0TP0sSx+kknW
   WJicWp9i+zdrQjexjnSZ3tX2puWyNZbfjHm+I7rbXQVRsOFQbw5jVth/S
   cSFtGuycAVKcFy4kcRl50g7BwwAKYjsgVA2euG4yvkdsUpLon/GrNrQ4S
   L2x4jTZA8o1ptxFNR39MYruEHlfqBphUMgr64cRHt7CdgdLhtnpPHcy9B
   HnSRbeE0TYKvIV6kuzLZM2BlQ4B372KkrINMCI6EaA5y6xliHy1pF3P2F
   Q==;
X-CSE-ConnectionGUID: 2plJFXTYS/G1GmMaN/2/yg==
X-CSE-MsgGUID: NnAgF8MiSQCkNxco9UjbFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4112676"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4112676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:12:01 -0800
X-CSE-ConnectionGUID: 98hImrhmROSCgZK+FPxxSg==
X-CSE-MsgGUID: Mt7cs7hbTUC4+f4xfwTPKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11209666"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:12:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 23:12:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 23:12:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 23:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5l7gFcfi0iwZQWpq4M2k6tvVprWCjkxHo8uCNq2/OA7LaYnDJV1aQ9bnQYk/hlWq1enDAWEA+uaVTjIJXwUWbwVLnhC7ie1DAhVomNtMjMgzEUMSaUHP656CF4MTC4zaA9uLv5tw3f4n8994EJ5JP10439tR/0p7pCUvWIc6CjU5Z8Zyn1YLSMPwLt33vy7kR1bJ286u/TISi4xiAJgSca6e1tEdB9T01VSsu8vXwRImfl/ECOEZyfiSpHoD3bnDUWklvJK7pIG57o5GoB3Yh8Vm2J78aaFJeD1BRXZjkpMazhIYwocJMs/vTNtbWQRbrYScGJ+rbrMoTv1G/6mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT1Ik+ZD/j2MCEZSb/TvREm92uIi9TcB86ipXhIHjkE=;
 b=vhcFjEZnW2dqb3BHSb7F/XCsQmJbCjUYw99mm9PqZKx+c612xl0bvxKb9Lf/0KY5LXtc0EjJrARFFrA+3Y0qqtSuoKfrX20VqWSpSMwZOLorSr9c2PWw8KdCIH1K4p/f76fAwITjEUF2g8gPkkHZnVKqpurX5fHCgChVPRltM4qJk/JqP+c1ryVxFTY3DXaMMokd+8vSJUIAU7xx8F+0UdSpIzf0o4R00cubnbgO+2AY8bm4IlgDCmPkaeilMlrQjbouqfDXSKg8Jd/FWvI5ZaQ0l38cVGZEkFFzoeb86eQovhsD1ldBd19FE4tvmV1ETUGv1R8avZXa2ykit5/CYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT1Ik+ZD/j2MCEZSb/TvREm92uIi9TcB86ipXhIHjkE=;
 b=OKL80odGV5vgMNjOZE+Bdnu7gRo45jOAHabVaQnO4reirKjZZ2hcSsfx09vtciNHJJJExJR9bDt/7Rd3WgpM4FXF1N/7tEmX/34nFkF5FuESQXp9cFGuDIPaHLxMSrYwYRsusr/E+LVAzwnNao0q4JJJ2Ws6kWfXonzOL69wGPE=
Received: from BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 07:11:52 +0000
Received: from BY5PR11MB3976.namprd11.prod.outlook.com
 ([fe80::c23a:c952:eb75:d4d4]) by BY5PR11MB3976.namprd11.prod.outlook.com
 ([fe80::c23a:c952:eb75:d4d4%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:11:52 +0000
From: "Singh, Ayush1X" <ayush1x.singh@intel.com>
To: "Nitka, Grzegorz" <grzegorz.nitka@intel.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, "Nguyen, Anthony L"
	<anthony.l.nguyen@intel.com>, "Kubalewski, Arkadiusz"
	<arkadiusz.kubalewski@intel.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"Machnikowski, Maciej" <maciej.machnikowski@intel.com>, "Neustadter, Marc"
	<marc.neustadter@intel.com>, "Temerkhanov, Sergey"
	<sergey.temerkhanov@intel.com>, "Olech, Milena" <milena.olech@intel.com>
Subject: RE: [PATCH iwl-net 1/2] ice: ptp: serialize E825 PHY timer start with
 PTP lock and incval
Thread-Topic: [PATCH iwl-net 1/2] ice: ptp: serialize E825 PHY timer start
 with PTP lock and incval
Thread-Index: AQHdTT4EYxYJVO3Bn0mqNTv532uANbc7mVTQ
Date: Mon, 23 Nov 2026 07:11:51 +0000
Message-ID: <BY5PR11MB3976A5840078F09C4E8CD038A5452@BY5PR11MB3976.namprd11.prod.outlook.com>
References: <20260925222824.270640-1-grzegorz.nitka@intel.com>
 <20260925222824.270640-2-grzegorz.nitka@intel.com>
In-Reply-To: <20260925222824.270640-2-grzegorz.nitka@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3976:EE_|PH8PR11MB6975:EE_
x-ms-office365-filtering-correlation-id: 20065f51-8953-42bf-748b-08df49310c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|56012099006|11063799006|261022105027099003|10067099003|4143699003|261021123027099003|261102123227099003|261022075727099003|261026140227099003|261028144727099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: U6hXZRkSX2JHXtx5MO9bcqGGDvZPEkJfpyp5aF9UvPUaGtSPZ0+WUIIpX5mURkPitkqMVv25rkuI0rLt7jUsAXXYo0XlzRNtim6Eb+1f7u3YKDF+Uw3mmsufpnjm1584vS6JVdqo9VZaqI2Xouue0CFah1c5QmVQC8MWeAO1k0SkdeBCDtr57YrDI9OlFoNWUj0tJZHGdgvpnmiVwYJIRFsTi1HvVDI6Co5YmEWRCyz6mXWbbpjp1m/jGapGxHsh+q6SZm6xyxIK+CUI6a+G+WPCf6ga+tDQRE75VW8mI8deTVoQPsLZUwJ29QfQqBW0b3zrrECFrpe4Be03E8mdTPg6r6i9Nd951o1HqoN18mG8QbQzRgo8rq58wngYlioMvm1yEc6kVOSNo7BGaRUDFYXckEoaibrzLfdpRvsO2GKWhbHJ3JllkgGqsZW4BAR+lfSPaZsbCEeRiCLDg91wC6oTAT3EP8kSGOGnMSVENf0rzaboGOzI27qJYibiqyZSwzWVXofyPxCJFnHYlnKljVXR03Mb4KzKR4kM+upO+EKQeXACtJTl84gpemZZl5BIew9MZm7FJG6d33B7iAF43M2zOfZR3PRjmhKDQhTFEaC5zq02iXWfDLYrE98GfuGR2lixrUPxPbKQ45aRe+1NGURGN3EISssEyutHl+Sliwl94mPvC258BZzClzl7+3vU17oPEo/GDRNe7227SZXOIa+gdHF35XpCR62JanqfXTg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3976.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261022105027099003)(10067099003)(4143699003)(261021123027099003)(261102123227099003)(261022075727099003)(261026140227099003)(261028144727099003)(261021121427099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zFUGcPdh/v+ZhrinaIbiGTsygimdc552iJMNK/B5QCd3dQUPWNmy4XJIkDd+?=
 =?us-ascii?Q?rshmoQ8ULXvvqSxO5fSLrTdWrXM8iQmvE/08Zpx2W5Gspexx3ZdjEg01lCDv?=
 =?us-ascii?Q?712MTpA8B7nWCNVikgPCMm8VDnc+snvEIIhHwYnNLvKo98OTEqgbeZuLTI1F?=
 =?us-ascii?Q?L9Yk5n+DI6/broSV2vDGFKeGzBqAJgawgRIC79ta41o+bTuMDCpq19Oppw2h?=
 =?us-ascii?Q?b57wDgPCaDGQophUN17vrirxcUNI5FOt6SIuHtoO2CFLZQoMKWlP3dN94prB?=
 =?us-ascii?Q?K4I+c3scupjK6hu+/+y8jDyECz6dpTQT5eglVuuxboYmnTbpeNV8NktKgN9K?=
 =?us-ascii?Q?blpp8qXCIkWFncqmEVgbtx/CG9XsLK4JF2jc3iaW4QsMuR2HyMkKdy1gwG6p?=
 =?us-ascii?Q?leqA6Lx4FIclilKVb6mcqB/OpsVIUz9vdiW35aKECjyfLhpnmufVNV6+AFWu?=
 =?us-ascii?Q?zLe8h5bfZBPAMgDAjF1iBvfm7isRJXbPf5txlPCQPDy1WruHrgpzNvMVhLN2?=
 =?us-ascii?Q?07jqRjgy2DL3Q4G4LVuLbg/UM47bjUhjKDllGuB2Lg/ig9GSinIHtslS75YL?=
 =?us-ascii?Q?RMUWUZcdAJQKm/NRVlcFQjQcGL2lDbuLIpcoe7um11pO7yVxog6Y94xn1ngY?=
 =?us-ascii?Q?hdfJ4tj8/T3vH+sdj5z3JEGAtUE2wHHm/kuLqpB8imNMeFE4pBXwZMCr4q9H?=
 =?us-ascii?Q?Q8p69eVOdzy5cP33GJeiQU5KMsmHrOCrzJGiVofX1d/Fl6ds+UBZqlHxm3SD?=
 =?us-ascii?Q?oyR2USqCs6qWkaHvWbGhwvAmHFjUXgA9XyaNfJBDHfAf/rUrgOSa9i8uT+mH?=
 =?us-ascii?Q?dQaDQF8x2/dlHH5eFSeUcQ2oloNbKHBKLBD99RGSKekJFIhOWMzyMcmm0u/p?=
 =?us-ascii?Q?hG2uQtaainPiRPZKPYuGu/NcnbTPJYpi51Um57+6dN/pLuLJiQJC5NWvp0hx?=
 =?us-ascii?Q?y/bScGtMvarRijneUBZ7pxBqFGxvCk7AVaCxqA6l+I6dYEv3Pr/gPb18YVhE?=
 =?us-ascii?Q?rRxH/io8ILOg5TWnzovZTDzndr2Nc48S1wp8eM+K6mBXVql6jBJ/HajPa9ZB?=
 =?us-ascii?Q?RAMaJ/rAlsyLs/p9OVpBR5RZN/lrUR1x0IVwWSNOZvHE5bnBlpPrIEUXX/B9?=
 =?us-ascii?Q?RhtIbQi7bgGnHH6GvYHmUsvX4ioiBp7GgkA440Z9/p6V6rfVBdFbZbPaYK5o?=
 =?us-ascii?Q?+B4u4lNNEF7HegfzUqp4Tqx5OEz4pjgr6Q/x3KMtS4krMOpEkNz+Sr+wof+d?=
 =?us-ascii?Q?8OQkTxYyJKn9yjwzBxqbuTO2yXoqigM2tLY0pAiSmEQtnMaMhu1bd1NDeUMq?=
 =?us-ascii?Q?7r02f3AoNj2BLPzkENmP39wyVrcP7/o6c7F8uBL6KwBeHthtbP7EkNYN6AlO?=
 =?us-ascii?Q?y0DET0B8LNKVNRJCv4AnyPnkD+HTHcXTq3DeZIiff4O+g0OPKxiXGbX+M2VT?=
 =?us-ascii?Q?eDl4gAIwVPg4Odk0eiz+fuyVf/nLKIB2uN2JDloaKbl8NhaOfaZI/yILTtUL?=
 =?us-ascii?Q?N7ImrPdRVX1Ag8tPo3+dWfx6twfbaAY8X6BD3nH3/ZUMtZF+YSMKBg+kbGJ1?=
 =?us-ascii?Q?kv5AckF7EJi9R0+l4vuhlfTyQtpOMZS4QZl8SUb/VcaYGLXFne0sQhDDX47i?=
 =?us-ascii?Q?/QiTr1RMYsBicWf8G8XiWfnVLD+Zf+TMwz7VsZd2OlePtsdlNJ03ntjvAMOY?=
 =?us-ascii?Q?r1hPZQkdRUdGeRdD7iP6p1S3Vd2DySOxkHJqGzEuqMicQwBH9wacw9h3gAgD?=
 =?us-ascii?Q?oRDC61dDoA=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: WL1oI1wAd1Slpp4gk/58/Oq0HajgR9/n7w5qeae13mYMUDOFh2ZhYMlEDFifrh72jDSHdBaLMN9T5VoTfIGYlnGzIRaWWtfHEY/PHWa8dY6sVmOUmPsrsA2Zt5fW9kPhpIi4wTPXpE3S/kYZ34b7rMzVhJs/FGtkHgAGNzsJvmhQHSmjiNDGWV6UHr95zfv0Gmx1pVSKr1bYKFATNOq0bGQQGusFA9QKVFfyUcGSrDvUIA9t1frUYPzpW3DvYGwMtWG9C4XSbRKECxDl/JZ78kwgvLx6qnpHhw5a1WhM3Bs76vuxHKBivDXQgPXUH1Cqypr0fm09Ixj/DruVZ0jFKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20065f51-8953-42bf-748b-08df49310c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 07:11:51.9148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fK8G8dx8jqujICciXhl0F1EzS2Zx/sQdgd8D6e6hrhVpu6pBKQPNMmXVB4p4OdsIh36JDEOFiX/uKAxMqUiKxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Nitka, Grzegorz <grzegorz.nitka@intel.com>=20
> Sent: 26 September 2026 03:58
> To: intel-wired-lan@lists.osuosl.org
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; richardcochran@=
gmail.com; andrew+netdev@lunn.ch; Kitszel, Przemyslaw <przemyslaw.kitszel@i=
ntel.com>; Nguyen, Anthony L <anthony.l.nguyen@intel.com>; Kubalewski, Arka=
diusz <arkadiusz.kubalewski@intel.com>; davem@davemloft.net; edumazet@googl=
e.com; Machnikowski, Maciej <maciej.machnikowski@intel.com>; Nitka, Grzegor=
z <grzegorz.nitka@intel.com>; Neustadter, Marc <marc.neustadter@intel.com>;=
 Temerkhanov, Sergey <sergey.temerkhanov@intel.com>; Olech, Milena <milena.=
olech@intel.com>
> Subject: [PATCH iwl-net 1/2] ice: ptp: serialize E825 PHY timer start wit=
h PTP lock and incval
>
> From: Maciek Machnikowski <maciej.machnikowski@intel.com>
>
> ice_start_phy_timer_eth56g() programmed the PHY increment value and perfo=
rmed the PHY-to-PHC phase synchronization in two separate PTP semaphore cri=
tical sections, and touched the shared source command register (GLTSYN_CMD =
via ice_ptp_src_cmd()) and read the source incval before acquiring the sema=
phore at all.
>
> Because GLTSYN_CMD is a single global register latched for the source tim=
er and all PHY ports by GLTSYN_CMD_SYNC, a concurrent adjtime (small offset=
, <=3D S32_MAX) or adjfine could clobber the source command between the inc=
val-init and the phase-sync steps. In the worst case the source timer comma=
nd written by ice_ptp_adj_clock() (ICE_PTP_ADJ_TIME) was overwritten by the=
 unlocked ICE_PTP_NOP from ice_start_phy_timer_eth56g(), so the adjustment =
was applied to the PHY ports but not to the PHC. This left the E825 PHY clo=
ck permanently offset from the PHC, showing up as an intermittent clock dri=
ft.
>
> Hold the PTP semaphore across the entire start sequence: acquire it befor=
e the first shared-register access (ice_ptp_src_cmd()), keep it held throug=
h the incval read, PHY incval init, and the phase synchronization, then rel=
ease it once. Since the hardware semaphore is not recursive, split the phas=
e-sync helper into ice_sync_phy_timer_eth56g_unlocked(), which assumes the =
caller already holds the lock, and call it directly from ice_start_phy_time=
r_eth56g(). The locking wrapper is removed as it no longer has any callers.
>
> Fixes: 781ff8f2d575 ("ice: ptp: serialize E825 PHY timer start with PTP l=
ock")
> Signed-off-by: Maciek Machnikowski <maciej.machnikowski@intel.com>
> Co-developed-by: Grzegorz Nitka <grzegorz.nitka@intel.com>
> Signed-off-by: Grzegorz Nitka <grzegorz.nitka@intel.com>
> Suggested-by: Marc Neustadter <marc.neustadter@intel.com>
> Reviewed-by: Sergey Temerkhanov <sergey.temerkhanov@intel.com>
> Reviewed-by: Milena Olech <milena.olech@intel.com>
> ---
> drivers/net/ethernet/intel/ice/ice_ptp_hw.c | 48 +++++++++------------
> 1 file changed, 21 insertions(+), 27 deletions(-)

Tested-by: Singh, Ayush1X < ayush1x.singh@intel.com > (A Contingent worker =
at Intel)
