Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795178763;
	b=WMXn8bIsxixE5FvBh1SINuvRK24zzCWX56Kmr1/WyC9WQNhEz5Qt4jouuxpmK/QZC5A3
	 a8WkCG41FyvQviJTbJdC6Jr+XU3UvCtJcvRon6BJ+hs5pQ15tBiKvHXhzitD5c1ZAXlUm
	 7c3C2W6dm8CSUtyj5jo9N9MXHIsKMqF6BYI/e9wWCxAwk8ScBdgAVVG6C1BqWuPTAECBI
	 /F7N6K2DZgIeIchWi6LT/jdYc0Oj8gQJuhrYH0KhXwNGdiIYe6dS85nZTloGXRSQNLi1s
	 jNff0DSY5ObRmui1A/btYCTs18T+7oejTWRTAm2q/2SyN7ZBEZIzbEexmfQSaLJIhXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
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
	bh=OLwpRvGtsxOpwq6UfzCmMGJhDuopJH0sFn333A0kusw=;
	b=DTPslmfoLo3PP+KdiPfKcgeca2t4+lnXWxnykenm7Oh0nd05XK/u+eZbocVTSYRd7B5V
	 UPp4UqeN6OBQ2L55AYGuDtZzsuZI4rZkjz55GLPQkffcEaCe57tHi4nXzYqh4vmKW2ENf
	 GNuReTwOeaTOr/H+T5so5QEAMHKLnUhh9aCHg9DSjLBgZdzZ/Ewnm1TCPj2acrvwqtPnE
	 vMHvThWiuLmrIxq6dp6q7Dbe1jvtxPIaUyZ39Ncl43YUFSmMdrpK7VaVh2qB96XVQZ3Kw
	 DP4WEdds4BHv2Cs9DLTC0XAHJoULtonUSQlbwEdkKpLXt1ICZMGHtez7fo7QIzUvODA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIqrfSyB;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JEyEwCD+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0860A2604
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E0860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIqrfSyB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JEyEwCD+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795178763; x=1826714763;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OLwpRvGtsxOpwq6UfzCmMGJhDuopJH0sFn333A0kusw=;
  b=OIqrfSyB+bjKQwWDeWxz96zKt/7vYQV3PDt2VNlfrFSXQmg8fHQvqbsa
   Cq9DzmapJ+iAVj/Ovz8d/+U+tnTJyisWQvZ66aSyxuGeCLHQR9O8dmnwO
   9DH2NQHrqVUhwDRL/x6VrhLJY0yDHhDMWGyz9yU8fjg9UfLGk2DpQwuek
   pulWye20yW+BX52LBSjAZiNvx9tDQEb9XEZz6UkyYdfpp/XLYOcn7jdFw
   c8zPzwRViMtyJ8Rszoy+VMy3/mQOQH8lfaGJbSFAYNLmqLCb4GBXSNjA+
   wOfFIsW3eqCPQWBMoYUZvomja64eRBmLr3cn2L2REg1LErVY1+qSfT34L
   A==;
X-CSE-ConnectionGUID: AZPDhCNBQLqKrc8wBwrX5Q==
X-CSE-MsgGUID: Pl8uOSgaQ0WX4tuIU5sSRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3946531"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3946531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:46:02 -0800
X-CSE-ConnectionGUID: iwuTMRUnR7ygF5nfKt019Q==
X-CSE-MsgGUID: 7FGrwo/zQLWTf7+6MasjVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10765076"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:46:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:46:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 04:46:01 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:46:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9d/5LSJkl/Lvh6NGGP/LSyyz7H9GPJMb9qoJLa/EuGR/u4oFLqf+aNbkJPokLct3jZjfupzy8m879muDSv34nq5/cU3emR+C+HDGQ7/CBeBXn6LjHBDicsv3AHS69/G0chZjE5Li5O/rhv5MubD/+sBHne2PidshivWzp+peF2Mo1/aQIGPcCTvuzagaXnzKlnZRU0F9y8+V6rFJrZUnXBna8d8YLB5SPSXt/Yw3xT+iW3nmQsNpBjfZksUTWenw1F9ovEDn4vLXvUKe7r/oT0zqefkGoMYeCCRvaqki6YCshPcHxJ5jSchFl3jDHdTgWwYwRVAAo1gtfKEGw7ppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLwpRvGtsxOpwq6UfzCmMGJhDuopJH0sFn333A0kusw=;
 b=L9RSTtbOaPFN+G1wzjokmKo+jula/ITvooO6gZKpSyx7Zlvh197SNVXYHaKJNU3M4cOMXrgp+LCQYD5XhR4j79vH/WwKpHxD/tjgnd/uES2SCq73RSMBrpWUwBKexvjZZW6BR+dihY28BxsTbX1JKol+LPcClOnoiHM5Un1V6szvOmPbhxDbf9lJ357k4XlNqaqbM/rJNw2HK2Y/MfW6pdTbNvE1uUr8ot0vA8o8+kykJMJVld9WSZRKnYgL5pjZBNBCdjU+blyA9yWc3MM7TesVYKgBvsEgFg0ZZqeVDq6PUlo4REu+ZuT6Qx28YhFJ2GrEqkxu2hsLmtoj/WQ2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLwpRvGtsxOpwq6UfzCmMGJhDuopJH0sFn333A0kusw=;
 b=JEyEwCD+3ruD8b3ZytwgSXn87jgrSHB4hsJ3Wmvk7THguSX5B34L2pUtIZK62g4EJg1+v5eL9QAwUFYxB6Ae6YQHMeu7c4fuXrumgztSGcS26rvpKGDCNasSj9Jup4NkqkKWmxtCPAXmZD4OO0/1KFJYLNXCn2mrGu0k+CHsUJ0=
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:45:56 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::3c1c:16b1:6e83:e3e2]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::3c1c:16b1:6e83:e3e2%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:45:56 +0000
From: "Doddagoudar, Susheela M" <susheela.m.doddagoudar@intel.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "maxime.chevallier@bootlin.com"
	<maxime.chevallier@bootlin.com>
CC: "Lindberg, Magnus" <magnus.k.lindberg@ericsson.com>, "Chintalapalle,
 Balaji" <balaji.chintalapalle@intel.com>, "D H, Siddaraju"
	<siddaraju.dh@intel.com>
Subject: Proposal:  per-lane PHY polarity get/set via ethtool PHY tunables
Thread-Topic: Proposal:  per-lane PHY polarity get/set via ethtool PHY
 tunables
Thread-Index: Ad147PR9yEONXo85QT+jsiKO5lgvBw==
Date: Fri, 20 Nov 2026 12:45:56 +0000
Message-ID: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2710:EE_|DS7PR11MB6102:EE_
x-ms-office365-filtering-correlation-id: cf75c625-e3ba-4c90-6c0d-08df470438a3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|18002099003|261009223027099003|3023799007|3613699012|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info: IrRazdcWpYHuhTnEoH3gozvxrtLaJdN3lOuzOn/0AKViPvuPpzb8FtSIe9jLiH31DNyyTBNsN5bO1B1gA4oke4fYyrDQBudzJDQ0zSC2VN8kHpVO3gzQXwYLZ416hF0J/PfKtxQMfdxDGs6ASmfS/Ah/4CVsm1BMAQ3jgWBnnZqtj43nfxW2V6IQVdbHuBOhbsKCRrZdLU4FqcE77lqwPHefrfbghEsdppUd3z3L1QF9bk22Ap0CAg2ZaKWETbfMAzlXC4w3IoDP2/RzzfMT3BP4LVRhVTeJeQsq3jaWjpeO75eBAZ5Oar7VfjwagXSlx6W1c/t/F+xhobC9sZzE8Vz0jhfs1Kvq0MxfzCrokqtQEH4hl0oSU1iFdbYq4ntcFBcfeH0UjkTFvVuUdNBjlJATBqTTKbtDLWJ0PyR9zQ/mG+kw2cNl61JAFwEyzNFWlMhGzwtOYyR2G0ow+juY1sZ3rTUnubneRzx3behJTg8JGbIrWZn1W4WcXCPbBcitet2v5oiSu5T6B90CggCezD5bjfVKhHad39ESzoXl8J/O4grmT3PxI15UKX58q1bN8ORGjwQ+3Qq2JwhxislTtVhIfAxx+UT9QkwxYQMxuRlUZtn+ha1ynYXh8Ld4PVV8u7r34JN8azlWMp9MvpfJ76ru9gCBw/VbJIrJirwxA6QWIvTy9kZWrO3GxmYdrEGYqjF+2IPiM94cTGwxzeF1sA/DcSYuK3zTZle4gHlAdBEgPe4zy1xJb+4MZW61ragL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(18002099003)(261009223027099003)(3023799007)(3613699012)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IWfFeY+GLiS2SzhBVTj0R0qLnQM/g0xzc2/FuqjqvGNyrbbB2PQx7Id06j?=
 =?iso-8859-1?Q?a2q90554RLR5DViQ5DmYU6ZJs4CyBu4NmaBCRAGi1zRengIZ4j2JADteuS?=
 =?iso-8859-1?Q?Fj4vKD1Wa8MxCLHlIe4w9Jsd+l9foiSHaRRuKNcddYOTMnG52np25J9GU0?=
 =?iso-8859-1?Q?2fEQhk7XWm7nEURy33NtDbk5tAfX4zmkOQm6Nwhtv+XNX4QdFGz4ybm0k5?=
 =?iso-8859-1?Q?hJlJ/iJLwwrcUkhNC5CCKvVuWuW+MFJx6m4Jc/Uq+V0ckSnD5B19SibXM8?=
 =?iso-8859-1?Q?zSHjHtMg8ycZFlh6XPpAbEKDl1xiaF4NxyJ24vOW/NCaf890Pn4eRwGAYy?=
 =?iso-8859-1?Q?icgxzreDOhC5wbsypvJPoX6fHj5LvUHWle5XODEhUnZOgGGK2KWxwapZIP?=
 =?iso-8859-1?Q?07CtxdeLCt7rYdWMgnTHs8NQ5BQESlsqfxaR7YTge7h/Cl/kgaOzZjCdQQ?=
 =?iso-8859-1?Q?D7WB+CRUwgFzUvvVxjBcx7gm5VZYf/eACE2RY99mESC33WnPE79TKUH7Ai?=
 =?iso-8859-1?Q?VIMHXZkpllfBNp5HuvlKzmtQ2qfe9O2Czq7SrB5vwsJ/kDL/BtGkpKeeNq?=
 =?iso-8859-1?Q?rXncD39xKmqOdJ7rk95Dm53XciOf1PloZGPW7UwIp6vO1WDi5W8hQq8xjl?=
 =?iso-8859-1?Q?RHNfUTsfnYMkyLBF6SB+ePAyieC8kATSd5eKHJSHKvQ2LtDNaUcrt2aAKQ?=
 =?iso-8859-1?Q?lnFxOC5m5e2jWZpMzeiQeYRvHAY5wU8KrNFC9zsUSwWL+CNXtA1JIaa9qk?=
 =?iso-8859-1?Q?AyY77FzR490zg3oMoqkHCgKtvcg1nCtPN8nxdc/0Q4alJyY9TWODRZQWSR?=
 =?iso-8859-1?Q?A+yT2VD3MvgMNl20BjXqYj4u3E24pKZfwpJZTPRAPkI8zcWHFwlAwkAhPB?=
 =?iso-8859-1?Q?5oldFz6CoQDl7ne0KJGGTZ0c/XEHIVUonpK8JMKVvBKVmYcoJHeQ2Miu0+?=
 =?iso-8859-1?Q?yNbBhltStSRSh2o5zwSbZ4V5mftaNUeqky0r3jEZGy+0uqXae+SY/oOlyj?=
 =?iso-8859-1?Q?XdZtkOJOjLWLZOny0hFrSmTH9IAHGAfxthpKnFzv7SJS7T+TBI6XAbo4cW?=
 =?iso-8859-1?Q?HJ/a5xC1oTgQUAxDXJyUP+xBCvjFYNvjqxvzy4CcVj6Lhy7ObkBnQkduEx?=
 =?iso-8859-1?Q?xd0rtJ0flq4EySnFW7CLO/2KkbpwB781+Ty03B8L6VIR6qZBQgQLzZ5G83?=
 =?iso-8859-1?Q?Cu+/BKQKi7HXvzZarxtjAesIbiLNRjhFf5vSWUNLx2hq5x3Q1MX4QgIvKN?=
 =?iso-8859-1?Q?w0RZE5MEgAEbRDKXZc4bqnY9CmiGZGo+K7memaU3xbN9DQY+aJrJ+TFbHP?=
 =?iso-8859-1?Q?RIRJoWu3Vp/JPed2bQId7vDgaxvkMrDW4/mVsoUNHS3MReH5Sa6eq5HKxh?=
 =?iso-8859-1?Q?7jRZCuusUtBueBdAI69ldPA7/Yr0tLKxc8SbbQw6jKJrxyR9I8tHcOo7Nc?=
 =?iso-8859-1?Q?vpPN3r5IwrPP0WG0t/Bvi9ZbzdfEZixswNoOByeR0oOc7EPo5ibM9AtwNJ?=
 =?iso-8859-1?Q?Iqfy4KYUk2b6kR4ZVkoEsv6pd+KDPtfIBLgXrU3mwusYkvpaSQml1ngnuq?=
 =?iso-8859-1?Q?vhRP42iRaJFH/5JG4O0nMHQcPEah9JdHibwe66Z3EbLmO4DtYfJPczoW9t?=
 =?iso-8859-1?Q?etIBmhuMGprzxmPl6CsJIahSda3AkMIUFMoGfhhQNI6YkKMo+WZnGgzKbp?=
 =?iso-8859-1?Q?may3EVzhN8gvPyQNJb6tg6BIy6ia84LzEvj0wg6Z383C0IApnHEvAfN14H?=
 =?iso-8859-1?Q?NGpOhYeaTxOp+OvKhQCJ/nKtjKLnP4dBUXczH25q/LONRs54ewv3EOTtsW?=
 =?iso-8859-1?Q?SMonPrzn4yoONJgJ+XwPrExWJ9stOWARVbP4erN0idDz8x+VWZYUVK0AI9?=
 =?iso-8859-1?Q?eX?=
x-ms-exchange-antispam-messagedata-1: DqPXl61F6tlNlg0bGm2Z4PQpFHJg2JWrhcs=
Content-Type: text/plain; charset="iso-8859-1"
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
X-Exchange-RoutingPolicyChecked: laqR89XGspZQRaZMSxmcbvOwfXGxy16bUruZOpb5/peZTxXvXATh/sggql6z8ancJHc7iRr0LWHV9+caJHmJUYaTrZzqgNeoHySphA5QUbSv6EYz8K9kkukyv6n3A6IInuiV3sxn7+p5Qq2stNCQVvLIGQAOPyj+jV48MDfxOhHsxT16V8oPFIB7CKIVZRpPltjcBg80jJ1Xs9ZGe84ybkquTufdAq5NNf0gDpm1rnqjrte/tpi7hMSF7VoA2rTEcTZko7REWYs0dJzVdF/b8XZRfZ48dZIagz/7NqLj4ZlNPDpv46SFhg8g3rSb56EFpGGgv0ERFjYdpoy6QZSqzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf75c625-e3ba-4c90-6c0d-08df470438a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 12:45:56.4973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keuYB2ISHlctMb3BadXI4AtGwb2sM4z33Hl8G4nqQ+wDS7Cx/7hMpBNVGzUC1D1KgfjjQts0+ZRSYREUT/lUolzSkYntIP8hBI1O2sVPrYueiq0/ZgmUPww+AHCQ4L/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
X-OriginatorOrg: intel.com

Hi All,

I would like feedback on a proposed ethtool netlink interface for getting a=
nd setting=20
the polarity of individual PHY lanes.

USE CASE
This helps debug link-up failures caused by swapped lane polarity. A user c=
an read and flip
the polarity of a lane at runtime to see if the link comes up.

PROPOSED INTERFACE
ethtool --set-phy-tunable <if-name> rx-pol <invert/normal/auto> <lane>
ethtool --get-phy-tunable <if-name> rx-pol <lane>
ethtool --set-phy-tunable <if-name> tx-pol <invert/normal> <lane>
ethtool --get-phy-tunable <if-name> tx-pol <lane>

Two new PHY tunables, handled through the existing ETHTOOL_MSG_PHY_TUNABLE_=
GET and=20
ETHTOOL_MSG_PHY_TUNABLE_SET commands:

=A0 ETHTOOL_A_PHY_TUNABLE_RX_POL
=A0 ETHTOOL_A_PHY_TUNABLE_TX_POL

Each one is a nest with two attributes:

=A0 lane=A0=A0 (u16)=A0 lane number within the PHY
=A0 value=A0 (u16)=A0 polarity, enum phy-pol

The polarity values match PHY_POL_* in include/dt-bindings/phy/phy.h:

enum ethtool_phy_pol {
=A0=A0=A0=A0=A0 =A0ETHTOOL_PHY_POL_NORMAL,
=A0=A0=A0=A0=A0=A0 ETHTOOL_PHY_POL_INVERT,
=A0=A0=A0=A0=A0=A0 ETHTOOL_PHY_POL_AUTO, =A0// Rx only
};

On GET the request carries the lane, and the reply returns lane and value.
On SET both lane and value are required.

Is the PHY tunable framework the right place for lane polarity, or would yo=
u prefer a different location?

The netlink spec (Documentation/netlink/specs/ethtool.yaml) change, abbrevi=
ated:
=A0 -
=A0=A0=A0 name: phy-pol
=A0=A0=A0 type: enum
=A0=A0=A0 name-prefix: ethtool-phy-pol-
=A0=A0=A0 doc: Lane polarity. Values must match PHY_POL_* in include/dt-bin=
dings/phy/phy.h.
=A0=A0=A0 entries: [ normal, invert, auto ]

=A0 # in the phy-tunable attribute set
=A0=A0=A0=A0=A0 -
=A0=A0=A0=A0=A0=A0=A0 name: tx-pol
=A0=A0=A0=A0=A0=A0=A0 type: nest
=A0=A0=A0=A0=A0=A0=A0 value: 9
=A0=A0=A0=A0=A0=A0=A0 nested-attributes: phy-tunable-tx-pol
=A0=A0=A0=A0=A0 -
=A0=A0=A0=A0=A0=A0=A0 name: rx-pol
=A0=A0=A0=A0=A0=A0=A0 type: nest
=A0=A0=A0=A0=A0=A0=A0 value: 10
=A0=A0=A0=A0=A0=A0=A0 nested-attributes: phy-tunable-rx-pol

=A0 -
=A0=A0=A0 name: phy-tunable-rx-pol=A0=A0=A0=A0=A0=A0=A0 # phy-tunable-tx-po=
l is identical
=A0=A0=A0 attributes:
=A0=A0=A0=A0=A0 -
=A0=A0=A0=A0=A0=A0=A0 name: lane
=A0=A0=A0=A0=A0=A0=A0 type: u16
=A0=A0=A0=A0=A0 -
=A0=A0=A0=A0=A0=A0=A0 name: value
=A0=A0=A0=A0=A0=A0=A0 type: u16
=A0=A0=A0=A0=A0=A0=A0 enum: phy-pol

In the ethtool core (net/ethtool/phytunable.c) the nested attribute is pars=
ed with a=20
small policy and handed to the driver as a u16 pair through the existing=20
PHY tunable get/set path.

=A0 static const struct nla_policy
=A0 ethnl_rx_pol_policy[ETHTOOL_A_PHY_TUNABLE_RX_POL_MAX + 1] =3D {
=A0=A0=A0=A0=A0=A0=A0=A0=A0 [ETHTOOL_A_PHY_TUNABLE_RX_POL_LANE]=A0 =3D { .t=
ype =3D NLA_U16 },
=A0=A0=A0=A0=A0=A0=A0=A0=A0 [ETHTOOL_A_PHY_TUNABLE_RX_POL_VALUE] =3D { .typ=
e =3D NLA_U16 },
=A0 };

=A0 /* set path */
=A0 pol_arg[0] =3D nla_get_u16(pol_tb[lane_attr]);
=A0 pol_arg[1] =3D nla_get_u16(pol_tb[value_attr]);
=A0 phy_tunable.id=A0=A0=A0=A0=A0 =3D tx_pol ? ETHTOOL_PHY_TX_POL : ETHTOOL=
_PHY_RX_POL;
=A0 phy_tunable.type_id =3D ETHTOOL_TUNABLE_U16;
=A0 phy_tunable.len=A0=A0=A0=A0 =3D sizeof(pol_arg);
=A0 phy_tunable_data=A0=A0=A0 =3D pol_arg;

Thanks,
Susheela


