Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795175135;
	b=WNostlabIBTysOGq31jfLYMFEVvKzdV+EvN93DeXeNxsOaF1iL/at138pYvUZDnxiOt/
	 34bGw2Y84dAMIZOPnQ+BqlW5Qe/qdwScWtDGtwWEBTjlghKmXmBWiQ9KTIHnmo5v86eDl
	 Eq2iPv9QYNG/pX7aU6B3qHHE76dBl9e9GqSnz4uNWN84TSNMJdVHcmM50D+uCTpDvOtGU
	 xd0hY5UXXg0Yjh2Xf6yWZqSimB9JF8pZXsfbGzq4PJHeOART9iwcas+y3HbcjPa0xzudk
	 UxQvSamkBVKQKn1P/bvGL7CQuAPkaT9cvEnWy4Ed6hVw3ItecKPj+wweZIGUHyfDb2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175135;
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
	bh=Aw/5H61FPGz8me1QIWbZ4+EDVO09NvdqvwYBnrCcUU8=;
	b=s4p70d/eebB5WiHSptdz7Bh5EBnyzg3wBrJdBbcmQ3oGqVGqCm28sWXyzvXDH76alVsN
	 ty/K+52HeAJa3oYAHNxZ0cyF4vUCvpkDHkbByAJLGB27C1NI2ARtp0Uoc5LlKjvJe11XM
	 fDpmEVYomF12FXlqjFp1J5IDleYqESOcnr5+d+PuhjUO8rSUgF+l1eIkTRBFcWTpic2zE
	 Jb+9uTF1b83BMLELVHCcxyC7xTxjQnTFmLWclB3cczTUyLRix1rrax/jy1Oxrny6cQZqd
	 ksfln9+CGJdhOrPYM0O7ABz8Pv/A23//lTlHpl+kd6qat6aSbaKB2PTORt/TA6afUTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XK8f5qnE;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MyrVK8pR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1AA606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XK8f5qnE;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MyrVK8pR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795175135; x=1826711135;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Aw/5H61FPGz8me1QIWbZ4+EDVO09NvdqvwYBnrCcUU8=;
  b=XK8f5qnElRhukhoBkMR3TBrVNwd5YmOc+M3fOaFXl5owZLZFnQiJAy7b
   rx+aCXJjnPpDfxRpQiG4mLCxLH9qifT+3ip4jubeTBGjyEAzjKQzDI0m+
   EbnP7XyxhLmWI9eO2mu7KR0RCHI3NmWz+Z64gt3YDA/bHTAaoqTSjtn9S
   76wCjdzYUIYl/xtC7GxZ02w7XYNtYJQT7sELG54eQEgpKAnvscg41ig0k
   igar8JoO7TXw4ulpLfjiIi6z6Dae/JyPFyNcXpvoUkmSA/NOD2jqHK/bP
   Ru6Q9z8jA+aTG26urneZpFNJO8e5htX84GEEGCfZOupKW3Q3Vc6jywmiF
   g==;
X-CSE-ConnectionGUID: nhFkd26iTSGGW525dYUmDw==
X-CSE-MsgGUID: q0yKyotqTJOpEWJGVoelFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4038988"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4038988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:45:34 -0800
X-CSE-ConnectionGUID: V2+z4sTeT86h7g7logS/cw==
X-CSE-MsgGUID: Z8T8pAMXRBuyVoHNxM64tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11022509"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:45:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:45:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:45:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:45:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/7hufcTF79p5KTgQXqNefJ4fUFnF/+kupAfFaCs7r6tCaWfiUCgN6b2xDltYrR5ofC0kFd5nIIJAWv69H95qb6/wxqe7O6kI9ngX0DHNhKx8oDKdYavSMKcM+hNndx91o9YC5JhT5Er/c85VWcxzbUNTplLrEN4WlIgz9xOtcwOL0eTj7L2T5IKk+MD7kZPqAFwtLKT159PQbXKjCV9jjPOw8h3Bz/I/sDAp4jtg4SiJ0kvT62GzScRNPtytuodQJxxmCXtx431yweIX3GD7ooi+gDL6WYD7cb9qeUlBM1lVPPOganFVM2JRLW6Qi/MBaRbX2ifIVwK1feRxxZOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw/5H61FPGz8me1QIWbZ4+EDVO09NvdqvwYBnrCcUU8=;
 b=yvgNwWzYhAooNtdXXcf4ER8fo4EgL/OMycD0e9yRaEwOt1Bj4CEPLr7b9//DJqmhTQmxTBQIjZbmRLwmXDeAbbl4rgvNCUc9jqbDcfpdN0ykLAKGsy5QzdjxbgFgukDEzKmP4ja0mFMYpzE6pVv7WuFk2tuQMoHJYGF4w2+wZJB3dCjnXK/az8d9F52Hqx7BQ3S8lwc9LiXTOILZW+5rdUAE6LH2P1xnMoCmJX/v//UNuAafnv+AavfynRG8VfPSogs+TBbQOKcjMAdS8aXcjDyEt+c5wv7u9rFy/hOWd+C+hSAkB9vEMhPeZWJJOv53281Q6+BNyfzU3DUaTKOswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw/5H61FPGz8me1QIWbZ4+EDVO09NvdqvwYBnrCcUU8=;
 b=MyrVK8pR5at1/wjWOLYgFM8Gx4iTUZTT0Tf0svLkLtnUzAfrABq5qa1L20+DJoz3ftxoIjgUsxM/sEv9T2kELsCVwEVmdOmqqyRjH0ntH7LVcSqGOIBxob49TvhL56tAe/eNNMW8eAiQraZWvbba1I1I3ErKI7XQptWVQJGag2Q=
Received: from BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:45:31 +0000
Received: from BY5PR11MB3976.namprd11.prod.outlook.com
 ([fe80::c23a:c952:eb75:d4d4]) by BY5PR11MB3976.namprd11.prod.outlook.com
 ([fe80::c23a:c952:eb75:d4d4%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 11:45:24 +0000
From: "Singh, Ayush1X" <ayush1x.singh@intel.com>
To: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Karlsson, Magnus"
	<magnus.karlsson@intel.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org"
	<horms@kernel.org>, "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"Keller, Jacob E" <jacob.e.keller@intel.com>, "Fijalkowski, Maciej"
	<maciej.fijalkowski@intel.com>
Subject: RE: [PATCH iwl-net] ice: keep the RSS hash function on
 indirection-only updates
Thread-Topic: [PATCH iwl-net] ice: keep the RSS hash function on
 indirection-only updates
Thread-Index: AQHdVqF4h9I9hO0v+0iPhvcHOoAH6bc3Gpkw
Date: Fri, 20 Nov 2026 11:45:24 +0000
Message-ID: <BY5PR11MB397669DC561693CE136CF195A5782@BY5PR11MB3976.namprd11.prod.outlook.com>
References: <20261007200311.730443-1-maciej.fijalkowski@intel.com>
In-Reply-To: <20261007200311.730443-1-maciej.fijalkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3976:EE_|SA3PR11MB7977:EE_
x-ms-office365-filtering-correlation-id: 4f46204f-dc0e-4aa9-5d2c-08df46fbc3b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261022115727099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003|38070700021;
x-microsoft-antispam-message-info: o8BwetvKMqO9xiPd3YSGJF6/DfFKcdvrFPLEqDtoCOLPDSp1FzHpdTI6DCzEb5pRXvGy5fwTeIzbBYT9kJKRnJVj+xqLKUYuaGLSBZ2FyrvIU5SCDf+UExwAS3hvtaL1t0469aWmD66BaunhHYG2PW/3dkXa4gdqbro0fcFfde4PBaWKkcjb2ebJWBy5GWrCrDgC77H7wkfVDsCRe0tQbb6nf/Js3iBSvgqaslBBM5AoMXdU+H8GiEkzEbwoBS/Xj40Lq3PHrsibNSPi7FtWCgYeXoeUMJlA7/wcls2WhctdJ1BumVwm0UFxEGNKHRIpRJr0Tob/9uUKsvxrZoZqHnA2J039quOoPnZFcSD+wey/LnXTQo5T/BWWuJjwOBrNIdn5eYuJkQXNuSbv7+W406feHIfFmkAqQDSgkoY9u7G5Ikd5jSf3hRG53+fJwCYsL2MrY7Qm0iE4KxmAXqWv1n+VwyzCTNFYji6h39a70Qlprx7z/YG0tFWFSDbAji/2Wnhw5SyIf3FqThefqOcEsvnNqjIDOJptqDA3/sdAhS7oUYosyactbywN+dDE2JF45OtqDSYqlGyHdriAn4LWkGmAZnCqZexop5G2eZUbMV4eWJqiyzsVt6TwLvOb9V15diqEKIcm9noaHU/ywhrEt7Ti8lpH/iPuvdaBJOxlEqFuKs4oO0FPDPmupNqnEvNPu6kAfAs7Yr86d1gWLdXFNFytu4uQcBkfnzWHQKEq3X8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3976.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261022115727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2D6giPhUutdXJX6Mu3HwpyGW1kLGlSQCcCxTk8aTY4yq20MAFugoG5Obh/9?=
 =?us-ascii?Q?4RQ/3Fw8Y2n/HkjECzVVeoB5189Viw4JqAuaYvjCyxFlrINX/mIdw8H0ljbD?=
 =?us-ascii?Q?lQkMTxBodXxqur0tnaiSgUC8zDsHuMgVRBwlhasTWe4EuustM6kjw8vp0Bml?=
 =?us-ascii?Q?UMbXStDQHxtPpA6DtOIQ4w3ikEvA4pvU3XguCbpBGl+MqDXc5hGmRcx0LBaG?=
 =?us-ascii?Q?OLoJmh5PfNDoGwUneOfzpypqZZwnhV36VhpTXL57IAUaxPzZjI/aZUxupMVN?=
 =?us-ascii?Q?ppMTN2aH0IUrby3mTiOh79aViLHrDIgMHXPUosZ6scO+oebMHo/LsbzqePJK?=
 =?us-ascii?Q?hGOzVp1pzILAHM2WDSWUgs9yh4vZ4IF7jLIqGxYD2MVPpI4G3YW7K6hIlpNe?=
 =?us-ascii?Q?ifxo13RAd/zQhVVPr5ND1LPszqRCkm5ixYw8M0HT2rIJEWs8rfyF37jAZFq+?=
 =?us-ascii?Q?RI878FsO5guuXPmTp5mERA5wkVhgSFNtwYn+0votigqQtHQBTn2k22VxXHLR?=
 =?us-ascii?Q?P3yJ0Lg9+nGuz1P25M9W7s222YPgkQdtH8u6Z+jIqhIV6cL0g0VAZwGmU8U3?=
 =?us-ascii?Q?6zfftQtLS2nB757h0irPTsKcyjP3emSfpbGD8WBwBX0nrvhmJJcJHj6AOLii?=
 =?us-ascii?Q?5UlsGisuVE+al8V/hi8Gsca9JFW2BhBcjJT+YPA0FkmXRpZnk22P/WpA8NRe?=
 =?us-ascii?Q?FLsBSmibPEjGuhV3P34hyDNEn6QopwjweVEvO8oyZ6gcgJYgw6tSKX8uIYHh?=
 =?us-ascii?Q?3w9o/yI2hqcIUT5dUZJPnmfbchQIoBJDJ56VXVrI1tloyXbzx1gBd3Ai+tpe?=
 =?us-ascii?Q?yYodYrgpWbWQrDQSP6RXialzytW9Js06iK1/4y7nalkftpUnThZvMBUvv4HN?=
 =?us-ascii?Q?FAYYhEr/76aCSdshoWP7OwibKSFXDmVYD+dH32+iXuciuBlDS8tG1jRaXplo?=
 =?us-ascii?Q?ufPtP+3qubWMjsl1odJI/Cz4z+XV1h/+Ue2vc+B46hodexlLG8wRx2VJtEhG?=
 =?us-ascii?Q?SaTqDGTfm2uvivH+vc0J0cBPmOZvi5cpG2cqKNG9vOVWMl92uVFe6gvOTsam?=
 =?us-ascii?Q?Udvoa2nObQcW0nqfoweCPdn/wVkFGhpJiMaB9L1oqu9FF7O/FnXpTL5XK2SM?=
 =?us-ascii?Q?7rCj3x+AIuVuZc6XvroGt8Zom8qY7Ig4oud7TBnnuewAYdLU8i3XRuZp+W6S?=
 =?us-ascii?Q?F+hcyctr+3+T70WX5uQNrIsz/OXIM4V1w12Fe4vD5juJ6FlECueELmnBLWk1?=
 =?us-ascii?Q?y1nOzBbUbM93g8uPQBZOckGd9KllFqcdXO7AV64c9tXaL3wTUPEcr047dyPT?=
 =?us-ascii?Q?tr1pdL9YlcIM4fNegoOKQRXXMySTfM3cwm82zgN3LDrZ4o1VHa9PIegLii56?=
 =?us-ascii?Q?23neE+etOKz8dz4qkdwoXq1cdNyFOeTrjWXnwM+oGog4lloF/JCa6n2F0JUO?=
 =?us-ascii?Q?+1dtt2Rllb4WVGZ7F2ZzbhvQa7eic2Y5OkrdJ6CgoSMPjxsfYnSo2zRoQWIj?=
 =?us-ascii?Q?alR/uSfcuGcjK9aQhp9rdEBWDmRrLm8fX8FyQrY9bksXOlHPXwDUG0aR6bNK?=
 =?us-ascii?Q?hr3qCwRdukTwRTz5zh27VT9zEbuQ40AdFpvuggiWcqxi+GJ7isDfP7VEw9lo?=
 =?us-ascii?Q?wGz5RIDUMpSkK73FbL3jSyY4IxP/CazosRTHhN3LPzRKDBE99U9KXhnseH5E?=
 =?us-ascii?Q?sZ+c6qt0xpk9WYo1WMWvD59lOiTW9uLctN2jgblhwTViJBOqxhAjrZ6R5bra?=
 =?us-ascii?Q?emSpGPGc5A=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: w55rsLJYPVJW8wpJZ3dvBHEUUnHY5i8wmwcqUu2Da5CZN//ER+zDbJBXxnpIPSQ9DxUcEncnCl3PFzwsWgcOpUl0ab0u0PXS1EwAjOVuB5s6sOH7Ie0Kl292UdczO0YkPnmhC86RisuxoyZIAgnQw1AejOWxBEOm5s35Yj+NMG9mBQL/mNAX8ufdiwBBVLYCQP3RaKRN1485vHNK3IWxFOXkUZKqVEvcg3f7leuU26EA/T7Eyl/biSkNx+lHx6TWm352lwGaw0AOKRLigs7EbPV6S5NufOFxyGoDK/yZ5TkY10w8Th3sK26SknNLTOPRpvOxWprfJBPxQu8RxZxcPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f46204f-dc0e-4aa9-5d2c-08df46fbc3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 11:45:24.4041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+Xz6b6+W5WYvwmUcTBm7rENvq+CbzuIo5zqJV7o/kMoNm3AbByEO8lo+XYNuQXb2Igb2zXQJTsvBgpo/qaGwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>=20
> Sent: 08 October 2026 01:33
> To: intel-wired-lan@lists.osuosl.org
> Cc: netdev@vger.kernel.org; Karlsson, Magnus <magnus.karlsson@intel.com>;=
 kuba@kernel.org; pabeni@redhat.com; horms@kernel.org; Kitszel, Przemyslaw =
<przemyslaw.kitszel@intel.com>; Keller, Jacob E <jacob.e.keller@intel.com>;=
 Fijalkowski, Maciej <maciej.fijalkowski@intel.com>
> Subject: [PATCH iwl-net] ice: keep the RSS hash function on indirection-o=
nly updates
>
>The ethtool core passes RXH_XFRM_NO_CHANGE (0xff) in input_xfrm when a req=
uest does not touch the input transformation, e.g. when it only rewrites th=
e RSS indirection table. ice_set_rxfh() tests input_xfrm only for RXH_XFRM_=
SYM_XOR, which 0xff has set, so such an update switches the VSI to symmetri=
c Toeplitz hashing behind the user's back.
>
> Once symmetric-xor is reported, the core requires all hashed flow types t=
o be symmetric for any following RSS set. The GTP flow types hash on the TE=
ID, so every later netlink RSS update fails with "hash field config is not =
symmetric", including the one that would put the indirection table back.
>
> Keep the current hash function when input_xfrm is RXH_XFRM_NO_CHANGE.
> ice_set_rss_hfunc() then returns early and leaves the VSI as it is.
>
> This has been encountered while trying to run xskxceiver within drv-net t=
ests where one of the setup steps was queue pull out of RSS indirection tab=
le.
>
> Fixes: 352e9bf23813 ("ice: enable symmetric-xor RSS for Toeplitz hash fun=
ction")
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> ---
> drivers/net/ethernet/intel/ice/ice_ethtool.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Singh, Ayush1X < ayush1x.singh@intel.com > (A Contingent worker =
at Intel)
