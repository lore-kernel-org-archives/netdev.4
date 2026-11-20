Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192564;
	b=D3eFBTB6ETuUK8yaW+qbv4eJICa4x4GElxRiy+fk1R+5jUF6L4dbyeffWZCoEGb9hvDW
	 e9IoxKr+FIQ4NW4hxOdgFBUI//VMiROhFY3tnfu00Cdj80XnKAfJ0JBuCSaRaSuujsUwz
	 cuvz0XW4Y7fBNJhUeskgKoq63WZa3m9OMDTCs13u26Ykps+AcP0JsJf3sCVkPcXIt6ySY
	 glyaSNh+0LoBVFRZcOtG6RmqVaXquoe7QJbW667L/rb06WEQENczJYntkEzYgW0hGe9ed
	 l4FmzCgqFM0FH3PYLa3TuoOPV4VdssCI+8VGe6JTbu6JBzTHT7rgPF8zKdtVHBbQhRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192564;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=HYrYr0HVt9B7064J+GAaLs1aeEYmAnHkfde8HPP4vhQ=;
	b=jmW4HDHmqx7hzqUrjY2pyTvIbhn2J9aEpSsMAV+2lBXcGmiDYuw3pQp8E/+tiv4vpEnT
	 eVYMzSnWttHmbrF2s0lpI75o/+OXh3CPh465Zm04H9RTy256yL6UdxiI+TmcgYWmM2gwH
	 G9t1YsXa3cQznkElgCybkew15kxUvco3okP5ovdlfcm5jzlgPZzqdsN2Ajx8En7Tr/uDh
	 +izLjOIl+DJGaman6d9fQOjZCagPuEWcEjX9K8EXswez8kRaV5+fqjAYn8OicYg/k+s92
	 XmtY3fuJ8VKPCdF98YuJJb6NPAcTc3ixJL5rd0H42WsJqGLZr/qh90hNdYY79IkdDfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e05CyB87;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UvP6W4vE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43A606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA43A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e05CyB87;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UvP6W4vE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795192563; x=1826728563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ymdub/SxHLNCo27za9KPtf1xs5KzgxeF02G2YANTmYo=;
  b=e05CyB87tEs+yPm9ytUrhxmUQ1Cy3gaPf/cNR3TxfNeWp1rduuOkIqZ8
   ur/b6jGMlKaEaIkEfyi50hduAvaM8Q9qvGaLqSxWJtnNbSCWR9azB4gcA
   bmoT7LUdeCVoiEzoBUrVIvL9qKPs+etYUeLaS2ku1L1W+Y9Mc6l4PZ66U
   McBrB72B+uPx9IWIES16Vd/O9d/Wm12ZXwodKIIcH6cHefcfWUB3q2NwX
   NMS8rO8hg8LE7+hnhCJqsG06RCBnqpMjlMDCcdjlYc6q+oxpxzzB/XQGr
   Q0oX6NtHYMQNtiLPO4J7TZd68brN2JsrrlEUz6FOAcdcGvVQkW3Rznqo9
   Q==;
X-CSE-ConnectionGUID: EaA0hCQwQlqf/KWV06LkfQ==
X-CSE-MsgGUID: MNPk+kj9QQu2wF7IKbMKKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4117155"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4117155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:36:03 -0800
X-CSE-ConnectionGUID: Gcy22PTKSi+ajEr/1+19mA==
X-CSE-MsgGUID: SiweM+JkR6CFyNCi7F3KgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11314833"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:36:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:36:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 08:36:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:35:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVejNb6uhUUMnAPGCUTBMjnZUBO4JEHcAcH0XoeKEggJQ/y7GbE/TIuASBNMrMORu3uFpUuxuhEMRTyf6P2wTZzdj4ahRchNBIy8vz7KzvhIbPqbTSHh6XgZklN/aVexUoRoCTRS1M8MVTlxV9S0Amxm9JHTbXOnBre3VsPYt4KzaUXM3AE+o5hQAl4xkpNGKDL0IJ4v/vgPbCLc5gu3I8M+7HEdkuBZ19d2/owjD2lzjnBlKAC5NRCH0jDBJobGpvx58lJ3sq8or6kAAjqQUeGY2zWImGh29arlcRhmOu8kwuuTB5vpjaU1/mBeoTcBTUSdfqky/WnSPoaNo++1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYrYr0HVt9B7064J+GAaLs1aeEYmAnHkfde8HPP4vhQ=;
 b=kIiSXCEqQxD7awHKg3aCoFMMzhJb13vc4jpKjuI2rPLtVirdBXRLRGm+HPIpYLoDvxy+XQuJS656rDPEPSn3EvBbQpFYi8acJ9UtC2Rh7izJLefHeDWXtHJfwDHkJ3pYJdhKT5G/PsOMkimTG70tyTeyaq6vt4D2IxQN3f0E2x8oojgf1ppE6jszrTGA5GCkkeh4J1J7dzaxA1EvRKutl66t8T/mdBbkxoJN3NlRuDKpb3VXbsl1TPgsrfXoaioj99LZbecX8quX4DSCVZMs6cLq2zLiSDkWmkZxT2vTP05nvQRHwCVWGm0u3+qZkg8E/p3RdRBAD6fGT72gpptAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYrYr0HVt9B7064J+GAaLs1aeEYmAnHkfde8HPP4vhQ=;
 b=UvP6W4vEBJxryOzhGNt1Nw9kHWqNeSMIH19X6NVMBSOmnJib/90Aj9n48XfZIi41Hm/gLDiTkfOHAf0HqKQtmPUkuU9s7pf9ib4jXScGxEvl7RS+h9yAyl9nn6QApUcAxqJSLGktyWZinxb1c70+cMJD9gCIz4qvXbmxkQA18/w=
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by CY8PR11MB6963.namprd11.prod.outlook.com (2603:10b6:930:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 16:35:55 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::3c1c:16b1:6e83:e3e2]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::3c1c:16b1:6e83:e3e2%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:35:55 +0000
From: "Doddagoudar, Susheela M" <susheela.m.doddagoudar@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>, "Lindberg,
 Magnus" <magnus.k.lindberg@ericsson.com>, "Chintalapalle, Balaji"
	<balaji.chintalapalle@intel.com>, "D H, Siddaraju" <siddaraju.dh@intel.com>,
	"Srinivasan, Vijay" <vijay.srinivasan@intel.com>
Subject: RE: Proposal: per-lane PHY polarity get/set via ethtool PHY tunables
Thread-Topic: Proposal: per-lane PHY polarity get/set via ethtool PHY tunables
Thread-Index: AQHdePsv75/o6kmKb0KYb6sEq490B7c3HoXw
Date: Fri, 20 Nov 2026 16:35:54 +0000
Message-ID: <BYAPR11MB271098184A7A1689F5647937D2782@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>
 <112154f6-53f9-4cb7-9124-aba263b097b5@lunn.ch>
 <CA+h21hq0EqJZFh_Kv64TR-oL4j=n61XK1xzzL_GMXLZr-=4PHQ@mail.gmail.com>
In-Reply-To: <CA+h21hq0EqJZFh_Kv64TR-oL4j=n61XK1xzzL_GMXLZr-=4PHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2710:EE_|CY8PR11MB6963:EE_
x-ms-office365-filtering-correlation-id: 85351eb0-604d-481b-d386-08df47245923
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009223027099003|3023799007|3613699012|56012099006|4143699003|261022115727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: YXGKhkHzUcsdN0FyKuePpUucGlmCbYviV9r1k5zo12M48DR3QvvHe2rYv0z4clfriPXX8kaWqet3ofqXC9/I36Fg5gkAIjBAyqOGmPgTAsk/xO3zv3Ywv9bncnDYZnOxXOXxyf/Cpbwg61M1YRVZmG1g9WBRR0MJPG6cqNAhdg764D8gpTs4uCDdgWVA++1IEedtK38Aiu4OQVo0PbKNTJa5zZsqC460HpoUdf3gHUiYN//BIYRXWD9ueYGKwvc9k7QHVo3f9VUGkZ7fD1BxwPKyhWuqJe4n7NDK0MEzBVxyllzFEpA1yUqbzDvqLreb9nqbS3yEkG4M9jEaaD7aHGzHcNtRPKf3tkziT1mSrrmD9j96zzEQTXbLJOZ/3Jy2AkeHAML8f9vzD9J4OxMfqsRgdFaVeAcp0VvmUjWE18S8ua+gs9oueSDleFPUKvfve88CAxgpWsY0/4ff7aj/TXMrLv8pzBMkoxFt5sM1FxwiVSb2hrWpyHbcUdQ5MuhY6l01eZIz9Gey/TJ6AcPf8xTtPvbQAt7Da+e9QcOYweE0TJJfkL4A7WMLjtGAiDLJXFKIqMx/469/rgPxLmZ/RwzzYywOh5rvZXoMuh7jIEPow81aw+riGRP52oDvEByPQUMzQnwYTOLpZ07mawy8lzT4Aau8KskI2phLRleIqWEVj/KLvPiK4KXLUFqP7GZhWEHEkR4uVPJIkajKzfrfzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(3023799007)(3613699012)(56012099006)(4143699003)(261022115727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(11063799006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L19epukaoXl0sa48ICjxcVS2diKEWzp6bEJ8vhUp/NXv2ZvXLjYqzzvM8ptq?=
 =?us-ascii?Q?E6KO0cAph9LQldMX5ckTT16lB1GlLa6/XBaWDgxiqw5xaUk1j23HVHAbkN9T?=
 =?us-ascii?Q?kxFFn+2FUXcjNu2ZrErHKekR875A9nSklGx5Zs81NmClkJKdJjlzrKCydr5M?=
 =?us-ascii?Q?jFl8+ekLzvMaRYhOlnu+cveK0DQsld5Pq1d4avXN/RGd20rb4MZs3Jj0jwXT?=
 =?us-ascii?Q?foy1Ze8gJ3J6BxFuVHbwLiqzEJmK+PR6pAOnwsjOBVQNqMK8xDN0ulHLDWRx?=
 =?us-ascii?Q?JPjpjQtkxJQ/uUNjvYpngmWSzLtJ8I9b9oRmD0WevAxEX3ZAvZiTNHzWpxM+?=
 =?us-ascii?Q?kingxPL0ihyzr6DvN/8BZOiG4B6S8GxgHk9w5Gv2cnPgHrdSUievAgH894k2?=
 =?us-ascii?Q?waqcum+gh8C8pGc3EunSkDhMHfbElg3xHgDw8B/NeD5n7ay4KR+hP3x+ReeG?=
 =?us-ascii?Q?c5n5FvZYQw6Gwc7YTomhRp7exv542P4OiAakFLob7qym6ijKbj78WUj+kzUh?=
 =?us-ascii?Q?8Mhs2d4xe0xwIiuAJd+3zA/mfu47oqfngt25ZBmCYm+Mom/+hnlLJF/FGb1a?=
 =?us-ascii?Q?j4vgpdQlCfwuXvNTB0XLx5ETa5E6p5AivXBiSyWUdXNmznjoz4pklkw/ZsdJ?=
 =?us-ascii?Q?ni9ZNh41gHJiqtapEfAItrx+NfwMIqbR4JDP4fTJAKqoIPn0tGzMCR0L2qwl?=
 =?us-ascii?Q?3w/cC2t0BJcf+cemb6LgyGhDgORJv2s83KHvtWXB+nsBsgMvkZEK1qm68qa6?=
 =?us-ascii?Q?pkj+M0LsVIfFWDJvDh/+WvU9vz4HhIQ+ZRRXMqi5UBsDvcblzSkACvC2Gq0d?=
 =?us-ascii?Q?fI4yKvt5XQN8beUj286RXXYV/Od1aykpaTdPuxEYruB060qhx9VmK8vjh3Va?=
 =?us-ascii?Q?osqRg58nItvU7B2KCPZknfBCp4KA5K5J3PRqWIshEUmdK4jkmuhkIp7M3VF0?=
 =?us-ascii?Q?+8KJs2CLB9P6YphYJLAMMBnfFOVlSNs0TrXFbRyrQlHk//QZNiFeoInOgaw7?=
 =?us-ascii?Q?Vgx73dQfY70UbwsHLaKovXgUX6rLO+uQwZX28iCV6Brzetho/yToZqaUqF5X?=
 =?us-ascii?Q?ZLGa+ZHQLSWNVAFpasC9v9CJElsBCJqoHctqJxJU86iwKnOHlI4Svf6sc+a4?=
 =?us-ascii?Q?bQi2YEX8mqo5KUwo1uG97whLelCB6FX1L0h3QnzgMHpT3TuOOZQr/hsYVZ3z?=
 =?us-ascii?Q?f1bYPzNzc+JD6GWB+rtlrBqZ9veakXoSj1NI+RVK6cOTENeOIMqQQXtA5KKf?=
 =?us-ascii?Q?wgPlpbjkhHZavzhGz+ZARKdN62EhlGtxT+digJyeJ7fMorVRcxJPajoiyXiX?=
 =?us-ascii?Q?8+2BUMAHM4EwAJ8ye3yOc0dGw2DmL/DwH6p/POBbluasGXaqdneHezZTnpk5?=
 =?us-ascii?Q?jgHzycjDsY3fbeOxsYz53bLUhEN+U1JstqlsFbRUXF5GsyV1SSn9KIiKdbuG?=
 =?us-ascii?Q?PYxI1dIUeWYqDVaQLNMYSnW7aJMUQYYPDbljPtZ1fTrRBlHFrPwqxqQcjsn3?=
 =?us-ascii?Q?b8r8ZINAvIOmmXoe2ZxzGviJ8Hg/lAOLXTK5DJnXtnDQVmtSEskrGk8Q5Kxp?=
 =?us-ascii?Q?ctoIuGpJhAWeuT4awuCkMZ3KZ1FjLtGb/fHyjHcy9+0ZPqsVnO0ZJOFyWsrr?=
 =?us-ascii?Q?z9xzorI9FNMIBW4IUTOo+Of06QR+3oLJwTiDOLEk77gP8KhWBS2Uq/fdaCYp?=
 =?us-ascii?Q?5QtezxQFAYLAZbmlszgaLqRpGriWhFrDndxqma/qOgm8O9PZWBMRnlj235Y7?=
 =?us-ascii?Q?KedR02X5xZOtrWaSCGk69Sxg3doWkmM=3D?=
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
X-Exchange-RoutingPolicyChecked: WX3uhsGizV7+SrdGwmc3acae4/TSYQACUuY4CPxWc/j0mWjZSznwPA4pBUg/AYlNXSNJLoInrjVuUc6I0/NrT2bcG2RdhWYh38onai6CmUmwSl/KwJ3X33qFbcoTnzpiYBTTKFbUd8oIOGUcTF+twmJYY8BsGjtDxClKltT350Zvg4Zu3OLc9Z4R/bjEdF2ySHuK9qzGKb/2OYM0DdYwptLmy7cF0QP0JfNIdB+HuBz/Ot1DFzgEHulgwjIkrznKWM896LEgwcCwYTWWsRO7tfbQiN4KDzs9ucE7XGEZSQd7RvwANo0NSiHIF7vMnKjB+FHCqKj5cZ/cujxKP8FxZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85351eb0-604d-481b-d386-08df47245923
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 16:35:54.9784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfkWMU/oNvTNLre5+GPfj9teSJYPemmWreszVe+b/HMEJB2xIaqWOcBJlk5VPLAjYNIjetXacJuH3nr+ZVRLP5Z+Tp2v4EDgcO/UAQs2eNeiIOwr4CWe9Gsw7xJekQDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
X-OriginatorOrg: intel.com

Hi All,

On Device Tree platforms, inverted PHY lane polarity is described staticall=
y via the PHY_POL_* properties.=20
Non-DT systems, such as x86 platforms where polarity comes from firmware or=
 NVM, have no equivalent,=20
and still need a way to set it at runtime for bring-up and validation.=20

Two reasons a static description is not sufficient there:
1.ACPI overlay-based workarounds require PCI re-enumeration, which tears do=
wn the netdev.
  =20
2.Dynamic devlink port splitting changes the single- vs multi-lane topology=
 and, with it, the=20
   per-lane polarity requirements. A runtime ethtool interface is needed to=
 override the probe-time
   firmware or DT defaults after a split.

Thanks,
Susheela

-----Original Message-----
From: Vladimir Oltean <olteanv@gmail.com>=20
Sent: 20 November 2026 19:56
To: Andrew Lunn <andrew@lunn.ch>
Cc: Doddagoudar, Susheela M <susheela.m.doddagoudar@intel.com>; netdev@vger=
.kernel.org; maxime.chevallier@bootlin.com; Lindberg, Magnus <magnus.k.lind=
berg@ericsson.com>; Chintalapalle, Balaji <balaji.chintalapalle@intel.com>;=
 D H, Siddaraju <siddaraju.dh@intel.com>
Subject: Re: Proposal: per-lane PHY polarity get/set via ethtool PHY tunabl=
es

On Fri, 20 Nov 2026 at 15:29, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 20, 2026 at 12:45:56PM +0000, Doddagoudar, Susheela M wrote:
> > Hi All,
> >
> > I would like feedback on a proposed ethtool netlink interface for=20
> > getting and setting the polarity of individual PHY lanes.
> >
> > USE CASE
> > This helps debug link-up failures caused by swapped lane polarity. A=20
> > user can read and flip the polarity of a lane at runtime to see if the =
link comes up.
>
> Isn't swapped lanes a hardware problem? The PCB layout is wrong. The=20
> poor person who first brings up the board needs to figure out what the=20
> PCB designed did, but after that it is just Device Tree properties.
>
> I don't see a need for ethtool.
>
>   Andrew
>

It's not a hardware problem, it's a solution to complex routing.
More details in commit fceb17ac05e772ffc82f1f008e876bf7752f0576.

Anyway, I also don't see a need for ethtool.

To the OP: have you seen
https://elixir.bootlin.com/linux/v7.3.1/source/drivers/phy/phy-common-props=
.c#L128
https://elixir.bootlin.com/linux/v7.3.1/source/Documentation/devicetree/bin=
dings/phy/phy-common-props.yaml
?

They are already used from some Ethernet PHY drivers.
