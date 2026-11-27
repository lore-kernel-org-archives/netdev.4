Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795757033;
	b=MM7gRhmVykIPbxHMHZj/u/sxJENgZchm2wEVXlmZxMkRqz7wtSSJYSnamTxFsvbeVTOw
	 fhj5RWNk9Fi4LcCWqnzb/ohXyw3zHGLen87NjjXy+KY6TtQwNEd8nGLQiESvNo/2o1AvL
	 U/RCPsyk4E1lHktjpatXE+sXzFvR0/dHlkOdXdGpYv5EOQ29oAGQ6OgfxVOtiIF9nlMbk
	 Jzrvx+XD1Hsi6UB7cnVoLLKdg4YbKnew4siXM26ynAloiWNLvYW8IQaSjnVC+55vwEgT6
	 b/Rjce5DBOqYwqZFYgOGC20KHX4ApNQ6c42TaJRga+WHsGVoMSkv7ULxRae6xmDYedw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757033;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/zqAtfkU/n51gvBXvEZZc8pLCo2U9xBmnyhU2rPbMZ0=;
	b=VmHwoZwnJOMQrbkqmDMLRKano8gIjM9W4EDxUjtSVzI8mzHYjNpKQOVj9sH14gjlj3ni
	 R3C1l9P91JtDUkou+TmJLpiXhNfbcnLv4Hzm4QbxzXulZIzzVr18vheyuhxBlLGtyjN85
	 y2GTa4qLqb1cwuwiIx3J2tLCKfOixof2EbxfeJCssZa1B43JymsXAwbsKVZ8u/fV++1E1
	 00TuuxT6l9Cu5cQVU7FJ/5M0zuMIh/yUNL5JgemHM+cnBJwTz7tkY9Xss9gb7xpIxz8jZ
	 EaSqbgiqsRxAi/QTBEvnb4faUWhsSjB+zwJPKu3fsI0XBlDEbx6B9daKxIWsc7W8K6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=U2OWVv0c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.9
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0916606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0916606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=U2OWVv0c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1Voh7ldVXeeVs6Dke0hZQDATVSnJMUunXKtDaEtI+AHdBUavjQ9lJKaH5Vk6Xp1YFsA9N4l+lYIb++9/1Gjc9+Q7CQW6T066uLjk16CGdKXadvfbuDumxojUkYkOb+tmcIg6Z8snv+QHED4ramGqwYLwG9gJxNuSopBcLNR1oDiUMj3x3mrJIyTwLdsLCH6TOZCOqxqZHZQcAIwB3zS3KK5pR1n6l07TTbB4asOlwlmzkjTtgoXIUunP4lGrIG1ncE0uyqf9LkO08wNNa2eLir/69+Re5H0dBU9cjrcIlsyZowv741F/3ToHRkFj8lxqAL8rHBMTz2hf1MOXdzVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zqAtfkU/n51gvBXvEZZc8pLCo2U9xBmnyhU2rPbMZ0=;
 b=tdyQDSgqssF9LUPoOqO6zrTR8bRhq7SmB3TmdxKFLWy8JFPdH3j6h5SCY4avK2iUPjkCk2N2r4OVFQ28vcDeR5Y9xEAh/n4hxG4MdpzR6WPsPTwPmvidW+DH1UB9szRmk+IHKatMzarvUZ+0Lcq7pQDw3H0QazEDAcps2yMPZenwcsaXwAszWKEuIw1yVxM9LeEmxwp/FHpQNv0H1Ho3iHKOSr7f8z1YX941bM2CWc0Zx5lRBGxx6nPllLmXhcJ99WiaThNXc6h0LnJuFDBzM4d2NyStRKYw21nbOS2ZkF+vL4evOaeVm3IhOVoSxm+b3lyK5s/ddf1eYcnonkEo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zqAtfkU/n51gvBXvEZZc8pLCo2U9xBmnyhU2rPbMZ0=;
 b=U2OWVv0ctG0WjS2YCYnQNs1GEPfVDfeNlbkmGOe93zZbQPBO70ThBgtRRqeKY/L/uu8MyxvFXOMKs4R5h/1yzEwOsCalp55io4Rk2tmGegWxUz0NJZY4AmexqDUYjDr/u6MsjXXoy8l7rV/wFtFFd2o39Eu6T9O3mBQ8CTsgkcE9DZlT+CdOsPxuvDzEXY1/SdMUpI85yWWroXaKGInyUDgQIZPCUKTc5b6/BxTLaPlJczX4mzBgqOFFsm7E+b+wNGZBkhMTjpcZ3/L8094s7lIc+rhnbtwcIeUS3cp2YXqKI6krvciUn5kxoCa7ePUUe1HPmKkYOOZ07bwuthwZHw==
Received: from PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 05:23:47 +0000
Received: from PH7PR11MB8012.namprd11.prod.outlook.com
 ([fe80::71b7:7099:a6b4:4bbf]) by PH7PR11MB8012.namprd11.prod.outlook.com
 ([fe80::71b7:7099:a6b4:4bbf%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:23:47 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>
Subject: Re: [PATCH net-next RESEND v4 1/4] net: phy: microchip_t1s: fix
 collision detection on PLCA status change
Thread-Topic: [PATCH net-next RESEND v4 1/4] net: phy: microchip_t1s: fix
 collision detection on PLCA status change
Thread-Index: AQHdfBJLeS4RQTRLUkqgGtNTuXLgWrc+wyCAgAKjrgA=
Date: Fri, 27 Nov 2026 05:23:47 +0000
Message-ID: <c40abb19-1d4a-4e46-bb96-8d4cdfef2333@microchip.com>
References: <20261124124930.485323-2-parthiban.veerasooran@microchip.com>
 <179561192599.3135.16135249584970983112@kernel.org>
In-Reply-To: <179561192599.3135.16135249584970983112@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8012:EE_|DM4PR11MB8180:EE_
x-ms-office365-filtering-correlation-id: fbddb1c0-03d4-4ca4-4a30-08df4c469cd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 i302eCxRSYQ+80k7VMyb/jFe8UXd/c279bFA5GTQy0QxO4oi+o1xTWAhk11LfciRFepa1Iivg5RQvQ80qBknXNoi2+btlrXyOmZaJcSCzjhM4MsP6Sqp7k+03/fqr3wDDwHm7yJW9d3sX8foGIY1mF2nV8Yuj8En7mtFYcLKGx+uBwQM/SlncdS7XJKsqSualqDrkzNA5ScS66Gs/fBh9AQXIkm+vuaVbO/qDgrp7tW59hX0/QSL4NlZiRsQDTudSoRbcnRRLmWDX9X/Jl08D1KYupFiaknOLHClQpXLQDbWtg1r9/rTP9PZOIxy0QfY1zqU32LmfK4d46oAajneQ+gSTs1bRflX7g3tZ7nrSgF4Kmxyf3C3k+8AvU73Nah1h0WBJRdapY3AYgIeZBnIgzoBtRChh2ZpXLbEpHpZ+rxos/vEucnuc2ZV0MFiTaABNWMEnWVOeyTUz0lnobUJvULWH6tb34Ftyq1gjPqvDIQDoZ1A4CGJ/ygxuuwZf3W2XTsjJ70c5LSr81CORsk7VqQklU2xsk4j2ahSM9ST98y1UmuJrKJQp0JWIFzkOJCQ+N1TheBFG2c3a2av5xzFWdCqRUqpw39WywVniLDQgJWodw6oGybrVytQfSoP757uL25cn9hiyQx8kHGKGX8/NEkA9XCDGIBO+nehwYB2mCE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDlaVS8wMEI1THFhY2Y1RW5Ca3hhbTJoK2kvOWNiSUhTblplQ045UUtXTWlO?=
 =?utf-8?B?d1laT05wWm90ZmZrTWozUjhld1g0UE1zcXdNRnRCRnVjSHFGWVg1QVdqeXFN?=
 =?utf-8?B?citEWWc3WllvL05zTHhleE1VRlRlWldvRnNpUThGVDVYb24wZFhxdzR1V3hH?=
 =?utf-8?B?UGhiT3kzM0V6S0RLV21qcjJ6ZG9Ya0gvVGkzUHpZemNGSS9Mejc1VXg2UlVl?=
 =?utf-8?B?TzlJaUg2TzJ4Q1I5RStpaTVFTWdKdlVwbjZsS0VxQThLM3RkMmpHZ0FKR2tK?=
 =?utf-8?B?UUtSSjFpUGZaNkVUdElFaGdaVTJWT3E2WmN3bHFCK2diVXVSNnpGYllzd1Fq?=
 =?utf-8?B?ZC82NlorcFRFTUVLSkJET01yem9vdVVaOEhmekJLK0N4RThwREFFVmpLd0x3?=
 =?utf-8?B?VThGNmlEY2VZUEZDR2liSTlRNWM1bitBTllDOXNpRkRIRHpGdkdhK2VrTllS?=
 =?utf-8?B?U1pKOEZVL1dyRmpYS28yOThhSDEyU1hqNXVDaHpBOU82eGxyemxOcjJhWDRi?=
 =?utf-8?B?ZVBEanVhRm9KdGczaE1ESWVQZlhoMHhmZ09lZTVEOHdKMXp4dWszZllmZ3NW?=
 =?utf-8?B?anlkclIyK3ozUWRVVXJ0UDRsRm90czZGRTZJayt3Wm9uYXlsRFhFc2pwSGN5?=
 =?utf-8?B?ODdoNFhRanlQVmIrdElLWDRiRENPclFKdGl4RlRkaEx5M0g3SzgxNlM2cmhQ?=
 =?utf-8?B?NVBKYTBoVzFvdVVQM1plQlBDamk1V2RuZmxueXdiUzZmN2JhQmU0Q09KeCt2?=
 =?utf-8?B?NXNIQWF2RlpIbVFKOXhWTVcxbG9hcW8xVGVoZTBrNktxRUFNT2tIMHh5SzlD?=
 =?utf-8?B?RE5hcVZnSEFIMEtVUzE5L1VJa2pRNkxjd05wSENKOFY2VWtmZUVhZ210Uzhk?=
 =?utf-8?B?U3c3K0dRN2Y5S2dLMmNtQUhkWnhoVWZmM1p0SG9iMXFvQkwrZWlYWWZ2YStx?=
 =?utf-8?B?VCtTRnE2cVRJLzI5aGFJTEpuWUhCTHNWbCsrUks0RFZjbll1cGZoV1pOTWZt?=
 =?utf-8?B?VXlVSU43azdyS3IwQmxONGlYTkdwNnk3MTZjMkdLeksrZ2NzckVUYVdtaTUx?=
 =?utf-8?B?cFZpTlE0VXE5TEhHRXpZcTdiTlNHQ3cxT0U2Tjd1eWZHU00zNERtYStLWFlV?=
 =?utf-8?B?Q3I5R1UvM2JjU0dwZUVEeDV5ZndGR1c3UmdpK0tOTDVBbG9sRmdHcGMxM3R4?=
 =?utf-8?B?ZEc0dnluTktTYnBpSUdXenlrS05Ua2RhZ0IwSkdwQTM5cXBHTUJQcjB3VVVV?=
 =?utf-8?B?Q2tlRnhSSzFOb0FpZENsdmdJTEtsUWRDZmVBemhxb3FVeDJzdktDbW16d0tp?=
 =?utf-8?B?ZjNSalVWbnd0ZWlwVVR1SFNIWjVIMmF2bllJeTkzZFhrbzVDWG5XZGZaYWJl?=
 =?utf-8?B?UURkQlA1QTZSbjV2dWV5WGdXT0laOTh0Wjgyd1ozS1RNNW81cFNPMGVpUkMx?=
 =?utf-8?B?U2R5Sm1MbTgvWmZuSUxlUUlVeDBkb25SWkxWb21zckJvS2Vka3U3UVlGaDNl?=
 =?utf-8?B?cy8vUUpHbndqTVBCakR0b1QxbFh2VVhtaENjMThlakVzbW1NNitrM2pwUG5M?=
 =?utf-8?B?MGJjSTZkTGxoOGR3RGlJUTNVWk5sUjBSTlJBYnR5c0hEbndmL0pWNThQbDJ6?=
 =?utf-8?B?UjA1YmpHemI3d2ErQVU1UlNuTHZ4L2dXUDRsYzNJdEV4WVF5OVRqTTBJMGVy?=
 =?utf-8?B?ZFAvU0lRaVNPckF3ek8zVmRCYU1KYUxjUXkvZHRFOHBwSFB6N0VoSkVHVFRp?=
 =?utf-8?B?SFdwdURMRHowRnhaV0hwUjdTa0dtL2c4VEhrU1hFcjIwRmVKODJGZnhHWnhy?=
 =?utf-8?B?NTBvVDdscWpDQ1lSd0ZhSTY2STNTSkJITW4wbVV1YzJ2UFE5bDcrN1RFVWFF?=
 =?utf-8?B?Q0RKMk9GRG9Od0l1VzFGS0hISnd1cHlSZ0NmVXNWMkhsSndwaDRYMTVTMGdq?=
 =?utf-8?B?dUJmNmFtcCtBMDRaUnoydFpBZHdNcHlZYWRZaG5lc1hJbnNEUjJvc0FTc1la?=
 =?utf-8?B?R0ttaVBzSktTcTFQQS9IbGZjclcrUmNMalZ2QXV2SFk1SXd6SXdjUVloUlp1?=
 =?utf-8?B?THR5eUU2M1dKSWZ1U1lKSnVsOWRwYVlHLzIrZERRRjc5NjN0SWdGOS9ZdC9T?=
 =?utf-8?B?eW9kMFFBZUFEZU82aXhabUJRcjFGK3NObnhQNFI2eVJxVk5pUkZHWjU4WWFW?=
 =?utf-8?B?bDhEUm0zcHNCZWNNeUxzVUdWWGw0djhxQmxEVUNzRGFVTmM4bVRRUTZHUkNR?=
 =?utf-8?B?YnMzaEp1c2pJekRKTzBtVCtTTEVEbUNkeHRNUGhzY1JOdE53bDRZNjlxZ3pR?=
 =?utf-8?B?NnkvQXJ3c0l4SzhWcENZY3ZrU1ZuelZhZDFEZ0U2Y2h4cVZ4NGZNV3NUWnNJ?=
 =?utf-8?Q?4XWi/lbkG3529MIA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E7DE9D11BCEA24CA0C2853712F4E8AB@namprd11.prod.outlook.com>
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
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbddb1c0-03d4-4ca4-4a30-08df4c469cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 05:23:47.2087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXuI2HMi4VvtpZy6q6zIgkTPZhSj6gwzC8Lhczt8CD2oFLqM53rYP0sTEd79I+srSa+GOz43rITqHXBLW+v7YJzqXgiv/eMuF2VyylVGjHzGkuNPDqrgZAeeBkptbPo8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180

SGksDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KSeKAmWxsIGxvb2sgaW50byB0aGUgcmVw
b3J0ZWQgY29tbWVudHMgaW4gYWxsIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIA0KYW5kIGdl
dCBiYWNrIHdpdGggdGhlIG5lY2Vzc2FyeSB1cGRhdGVzIGFzIHNvb24gYXMgcG9zc2libGUuDQoN
ClRoYW5rcywNClBhcnRoaWJhbiBWDQoNCk9uIDI1LzExLzI2IDY6MzUgcG0sIG5ldGRldi1ib3Qr
c2FzaGlrb0BrZXJuZWwub3JnIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsDQo+IGlzc3VlKHMpIHRvIGNvbnNpZGVyLg0KPiANCj4g
Q3JpdGljYWw6IDAgwrcgSGlnaDogMCDCtyBNZWRpdW06IDEgwrcgTG93OiAxDQo+IA0KPiBJZiB5
b3UgYmVsaWV2ZSBub25lIG9mIHRoZSBpc3N1ZXMgYXJlIGxlZ2l0aW1hdGUsIHBsZWFzZSByZXBs
eSB0byBlYWNoDQo+IGlzc3VlIG9mIE1lZGl1bSBzZXZlcml0eSBvciBoaWdoZXIgYW5kIGV4cGxh
aW4gd2h5IHRoZSBBSSBpcyB3cm9uZy4NCj4gSWYgYW55IG9mIHRoZW0gYXJlIGxlZ2l0aW1hdGUg
YW5kIHlvdSBwbGFuIHRvIHJlc3BpbiwgcGxlYXNlIGxldCBwYXRjaHdvcmsNCj4ga25vdyBieSBp
bmNsdWRpbmcgInB3LWJvdDogY3IiIGFzIGEgc2VwYXJhdGUgbGluZSBhdCB0aGUgZW5kIG9mIHlv
dXIgcmVwbHkNCj4gKG9uZSBzdWNoIHJlcGx5IHBlciBzZXJpZXMgaXMgZW5vdWdoKS4NCj4gDQo+
IC0gW01lZGl1bV0gbGFuODZ4eF91cGRhdGVfY2RlbigpIGluIGRyaXZlcnMvbmV0L3BoeS9taWNy
b2NoaXBfdDFzLmMNCj4gICAgZGVjaWRlcyBDREVOIGZyb20gdGhlIHNvZnR3YXJlIGNvcHkgcHJp
di0+cGxjYV9lbmFibGVkLCBub3QgZnJvbSB0aGXigKYNCj4gLSBbTG93XSBsYW44Nnh4X2NvbmZp
Z19pbnRyKCkgY2hhbmdlcyBvbmx5IHRoZSBQTENBX1NUU19DSEFOR0VEIChQU1RDKQ0KPiAgICBi
aXQgb2YgSU1TSzEsIHZpYSBwaHlfY2xlYXJfYml0c19tbWQoKS9waHlfc2V0X2JpdHNfbW1kKCkg
aW7igKYNCj4gDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL25ldGRl
di1haS5ib3RzLmxpbnV4LmRldi9zYXNoaWtvLyMvcGF0Y2hzZXQvMjAyNjExMjQxMjQ5MzAuNDg1
MzIzLTEtcGFydGhpYmFuLnZlZXJhc29vcmFuJTQwbWljcm9jaGlwLmNvbQ0KDQo=
