Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794968338;
	b=AONluyw+gofeOl6b53V5IQLJp42H2AvJvrUVdlLhd1uwFFo0Qz+R4lSSLt3zv84whg0g
	 mo2QNytujLreW/pcVW/y8hl3wozXHMCE2Tw6n2stkJTG4TGXFdlvY67gKoeFKq3Y3eO3q
	 lEGSk7vwCP/tsgVJwJmeKrl1E+QdDXrNBmSfOD2QTGTbuzIvROSo57QY4RaXGtws6OuFX
	 mw1rQ4yIZ/bPCr0ViP0f19cDAAeOuosiA/Jw6aGjEonVPE6lXS6aAnPbzJMnL2yIx8g03
	 LUTxwNUYKu8KANOywx4ttBYcOZ0el45Zr4JRAZPk1ePL14AkbHJCfJzSSfp23PyK99g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968338;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jap/WadPn4uomvRz4c9Mcz/EuKPOdTLTDDeF9MuSO2Y=;
	b=keZ5sNBUl0kIjNyL+d46fGuvIKtvJIU09ySSiPxX8KbWFAEOuVUd/1ahr2k3mh+VnbO5
	 UjW5xkXXHHNl+0kgQr7D1G4Li/UBNy7Is0jlrMsd9S+cn5CtXKKGsg/FNEvJ49rkGlgM2
	 GNkP/UHsyQ4EKRNLPZHDipoRYi5Slst7Ydwuu02QrdXiI42aTTZJmRKbScoOy7npW5QSo
	 gvdCoetGmYuV8aciPrp/SBJ2aIjsdoIx6Nq2mjEkHw4SXGuN/MufqraODyqXs+V01qonF
	 PcypUCCKyvpFRVys8aBwf1NZvdZM/3dCQFeSbds7MHzwCqFFWFis06Y2vzolJmynYLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=wbm7UWSx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230F606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3230F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=wbm7UWSx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOCzi6ZKPzLFdkv6eUNonBEufpKCJYq6aIWV46V4XExCCnr3ncdWFmdVYRsQ7XQkAfH31O2x2hdScKhZrPP4prO23mApSPRQRkkWSrJ3kJWEafGKu8Hr+7fIFgfSP+8XvicensYgtjvfyhWC1cWy46c3Bob/BzFkHegZPJa1GDRM6KNA2+QA6kKI+Y80iNRBJSjC3hy+KFf/TIq1i0++FWqSvv2Um8c45Sghi1Qvm6txAl9qd5HV2b/YVpXAzLkxCi3wm8dAsb8aQEJWN6tpVC4h0zG1YPo3NVbPlZMQca4pqrFfeowLkcEGgXMEUwn4FWJ4NyKekdjsWYtoLG9sNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jap/WadPn4uomvRz4c9Mcz/EuKPOdTLTDDeF9MuSO2Y=;
 b=xYEPQ7RypqeASjZUgZjtACz55GFXgFqPQFzSiKO0d0ofkkpWGINLsrUmDVcQSGLha2puOFmdJ/zlYyGaLewLWv+y8j0RNKj5t5IVzc5kxJWulQ7lujxtOUiDY+lx5UVxPCKKHI5WrUVVfhEMisNQiMokl/tYHxCiYO7cnUDwka/Wpc1ECIi0AD33nQ2qrFuNfAu6PfRkWZKX6mz0F5X7570JNONjXHsecmXqWbihD9RmLA4iKTz25RvNvmgYZlv9Q+R38eNvKRpqxnnDt/acaN44e8jwzJJYJHattmOdSO6/VcRC8M0EddmDLEu0R+9vCCEWMlUR4hAx/bmShvyO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jap/WadPn4uomvRz4c9Mcz/EuKPOdTLTDDeF9MuSO2Y=;
 b=wbm7UWSxYLwUPpnZBE4Ibe6yZf+8czrI24kMHojCcjFGM7HGmH4Kc3Kp50iKP0++ypvbcUCzsiMXo/GcLxR467CADLyKVbooH5Eoo614CtMKO5sc7Y61pzFySy6MaVfdXN6oYGZ2OtBfNt9+WgiNzPVt6Ko44Xik7Gao37gzNppl63eYNJIAAhxxpxFnE7hgWuSF2wqIOsA9vX/mGpB/OjUo4Ip/6BfqEdbdgXIt3/VPntNilcJ9YYuBTO9Z8MB3FCwMadoZKZZ3scfjoMP6v9iJj7JOZP4Qu0xp9jZeTwHnOsio2fPupdZxueneSj6FpPyy8I+abxc+1/2/TaZAsg==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB5P189MB2520.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:18:55 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:18:55 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>,
	"syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com"
	<syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com>, "lkp@intel.com"
	<lkp@intel.com>
Subject: RE: [PATCH net v3 4/7] tipc: fix missing link-up event on memory
 allocation failure
Thread-Topic: [PATCH net v3 4/7] tipc: fix missing link-up event on memory
 allocation failure
Thread-Index: AQHddZTM/BLYPoGek0+3v0XZqntiprcymloAgACAUpA=
Date: Wed, 18 Nov 2026 02:18:55 +0000
Message-ID:
 <AM7P189MB11378971C2C8DC6120BB110BC67A2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261116063529.6185-5-tung.quang.nguyen@est.tech>
 <179494067499.3136.17991206184972687844@kernel.org>
In-Reply-To: <179494067499.3136.17991206184972687844@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB5P189MB2520:EE_
x-ms-office365-filtering-correlation-id: 00e73fa9-e8a9-4d72-aec2-08df451a4c01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003|261026140227099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261028144727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 oEA9UndSy09MYfMB+TKEsVNnGM3hRmlsloYwQ9ugodaWGEzF53InQaqg/YpHV8aTqYbPJroKu2X90JFyWxVKLBo+QnhQ1mpu4lkqW3ojvK95IkGczT3vfGvlNHeRY/Gq+kuY+JytvWtwRT2y7XMMRLxK4uy7Fm3Ka1TkpTtDiNFYFjcUa28HpxoJEx2HOhWcrNIbLl+uumvgylJAFFUvvaXxv5ra0asA5orEV4rUHrB0F5nHrTja4rNlvUxbmfWjFe9AHY2JVdF+83IFmzx1QY2RTmlRHUEgLWnONp0WDZFvNHhhzXcFb1ZCh7eLlhohUSTk8Xj+G40erB/a33aDnHsGwMiih3Rt7MpH2RTIP4Y1FPIQ422Hp/7isXIdQ5aXe9dTPA53S2BeR611OCmaPB4WuEwXOEvKTqTxu0yhNJZF0oHb0tlirwAa0Cu7KeTMzyyAKrVrQf0dvQkE4oM7Spus65SxBWFV7BQ14nErRa6CwFywtVV6zhYbxJx33G5q4sL/SEhK1MAPZq59HQcNJ4tQxHgL7q13Ea+U2TjpkXbuTCvWX6FF05T/rfxJFAqbeOAARrdehz2Yia9JgEhfZUijMd2r+cFIiRxz1PuEosHeySPlVZsCkq0NJT0TRLy7t21xsaZRAtHGFKC/8iSSvx0UXg1ITSvhdX4eiX4wQmRcnyhkbxQmKamgrCD6z6CCRtitOHvBEddDViVkS7r3tTOwLV9jHpow2LNTIYhsGsc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261028144727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFdHV1lkZWgrMHJOZm5BNGFNSG82VnVkK0hMRU43SkdVYmw4c214OFJZaUZG?=
 =?utf-8?B?dllHVWl6Q1dDVnc2UllDUFBtb2xQZWxtb0VXb2lsazZPUndVWHAyUXUySytx?=
 =?utf-8?B?Yk5TQ1RxVDF1amF1UkFNdnVkVEQ1TVl5MlRaUFRJTUJ6N2d3dE1RMFh1Mml2?=
 =?utf-8?B?eFBIQmFDRzRHSDF6MjAwV1lFbWwzRmNKVGVpRm54YTlhN29OMml5UkdkSFFq?=
 =?utf-8?B?UGllUHMzeHA5T2gzLzdBQmw0VDFUcloybS9scklTMWJVZFUxb3l3a21QZmdo?=
 =?utf-8?B?dGxVQkxvU3BvTjBaWnc2Z0VCekFLUzdXRnpTejlPZHhoNHUvbTZuaUM5VU1p?=
 =?utf-8?B?MEpINmhrNzllajhCYXpSeEZSNnhMaEJwdDNkSCsrVFRPT291dnZHOGh6Z3ZT?=
 =?utf-8?B?SHMyTStDS0xwcjVuMFRjdjBkckNPaEVWaDg2L1pPekg4QmU5U0gwbnVnRi9Y?=
 =?utf-8?B?S0pQMFVTZFFISFJ6cnB0QUxwbURvSWFubUFEUUVkKzVRV1MvUjE2SmRBUHVD?=
 =?utf-8?B?WHlNSS96ZVZpSlVJVmxaL0xJY1ZjU0N3SHZGT1N4dG93ZG0wLzVEb3ZqVW9m?=
 =?utf-8?B?ZnkyUDhKcFYzY290K0d2eWpseVpVa0tDL2tnNXlDWFBJN0xVUXZBWGpkeDQ1?=
 =?utf-8?B?YlVFa0c3MVhrOXhLNGdObkJ2T2FoRnY4d3Y3RXN4RmJYeStXL0xpQVo2dWdC?=
 =?utf-8?B?N01YRStwNUFSOWxPaUNna0FhcUdqaTZDeXJJanpMYm1QZEoyamdzclZVNHZO?=
 =?utf-8?B?VUd0bFZEeEpjeDJjUW4xdTZOTWFXWnorSXQ2NVBTWGU1ZWNwV2d1a3U2QkZE?=
 =?utf-8?B?UHlNSVVnc1RCUzJoQ2xaWG80a1UyRlN2SEdocDhaaHRkYk5Jb0VTeTMzT1NQ?=
 =?utf-8?B?UEhoWGl3NHYrc2FMWkg5N0pleDBOWFEveFpmdjRPcndHNEU2V2grbTBUSWhl?=
 =?utf-8?B?a2NTWURycmVUei9PRW9ieEo3SEY5VllRYmY2ZXk1alRJaHkxQXpIOVlIcWtC?=
 =?utf-8?B?Y0xraWUvSW9FQm9UTTZLSVFKME1vR1hQYXdtdXlnN3I4OEg5TE56RUxzTGJT?=
 =?utf-8?B?eGd0Um9JR1k5cEZSaE9mK1pZaEF4cEs2Qm5oalBrbDNRSzY2bFVhSEx5S2NY?=
 =?utf-8?B?VHQzb2FCL1NRbVpRU01WQnZDK25NUmRaUXZlSWlSWnhPSDhPNktCVWtvZW5j?=
 =?utf-8?B?OFpVMEU3UWNiWGdXQlFYekVnRmZoL0VEaWhac0haMG5UNloyNTJRWHFxMVEy?=
 =?utf-8?B?UWdxRDMrRW5ZMDRtOUNISHM1SzZBNm5veTZuU25rUmV1VmR1d3ZHZTZMbFJw?=
 =?utf-8?B?cnl5d3JTS0c0Y1JxWWZoZEg5YVVrTFpFRStqazFvOFBSajFyZ0NwSStLUjAx?=
 =?utf-8?B?SWhSQXBpblNXTUNWbUlMbU11Z0E5c3NRTW5TNWxLaWwxbUNwMks4NjdROE9Z?=
 =?utf-8?B?NGlNK2dNSXg5THhLZnZJQVlrZXM2OGdlTzJibC9hVkNmQVlkdFRUTGsvNkIx?=
 =?utf-8?B?czdXR0FxQ01QVzJnWU15NytocDZ6amtXYktuUHBDclVPSDh4RVM3YmNMR2dV?=
 =?utf-8?B?YUI5Q05LdHZveEFzMWFqaEU2ZU5IMm55R1FEclBnU0hmRWZJQnk5WGVDUFN2?=
 =?utf-8?B?cjFxVjZXeXZWTXV5RmVCNXNYVW91NG9tU25wejYxVHZqQmU1S0JVVEk2cDE5?=
 =?utf-8?B?VHRiQlVGZEw5N25PQlVVS3dyU3R5R3RPOFQrZDQ4a0hpSzhXbkp0aVFBWlA0?=
 =?utf-8?B?c3NzejNtOXFpVmsxcWRJU1RjdUpvVFJncFNaSzU5a0dhaHhoREhtUXFhanZP?=
 =?utf-8?B?Mkl6Y2R5UFlTQVk1R0hhK29hWGZ0ekhnSlBnRnRWdlpoWlQrSk1ZRVJoQlhH?=
 =?utf-8?B?a3lCczNnZG43RUM3dU92SGhqbE5XNWRMZGNxVHFsYlBRcEhVbG5GV1A4WXdX?=
 =?utf-8?B?QXByOElWNzIxSXVGU1hjRzVOVERpWjJFNllZY2E3NE1ieTRwR2hzUHIzbkw5?=
 =?utf-8?B?b3V2cHlMbUVMSnBxSWptZmZQdGErSVBrSlJZemZsNzU3V2p6Q29XWDEzSDZP?=
 =?utf-8?B?SnJNanEyS20vSGVGbWJoWDBUUVBraHZUQ1ZYUVk0dkh3Vzl0dkFlWjh0SnBr?=
 =?utf-8?B?Zkh1MnQwTkg1d3F5b0VCRWZlb3lvMW1JN2wvNng1UEJEdmR2UmVFalkzNVJi?=
 =?utf-8?B?eDNOSWg1ZGNoQ0VObUdTTEdiaUQyVWtqeHJ3UmNRK2FjUldDVkJFNm5XVUlR?=
 =?utf-8?B?UHdWRWR0L21ESlRNdEx1dkJxcDM5V0JEemV5MVVJQTJvSi81NFA1Tk9QTFJZ?=
 =?utf-8?B?cmhPRDBpdkNuazdDbTRPRkt2SWxnemR5TlhjVFhyUUszbXJBc0pZUT09?=
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
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e73fa9-e8a9-4d72-aec2-08df451a4c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:18:55.6168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7z/2Sfmdx5rh4MyMSvlREqpvZjTa3G8d729ybYB3zHctHsIWFYgvp8waDphJlRl2PynGhq3QU3edFeVwgnaJ3RwTDHerObSAnl+mCPOcmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2520

PlN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IHYzIDQvN10gdGlwYzogZml4IG1pc3NpbmcgbGluay11
cCBldmVudCBvbiBtZW1vcnkNCj5hbGxvY2F0aW9uIGZhaWx1cmUNCj4NCj5UaGFuayB5b3UgZm9y
IHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCA1IHBvdGVudGlhbA0K
Pmlzc3VlKHMpIHRvIGNvbnNpZGVyLg0KPg0KPkNyaXRpY2FsOiAyIMK3IEhpZ2g6IDAgwrcgTWVk
aXVtOiAyIMK3IExvdzogMQ0KPg0KPklmIHlvdSBiZWxpZXZlIG5vbmUgb2YgdGhlIGlzc3VlcyBh
cmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHJlcGx5IHRvIGVhY2ggaXNzdWUgb2YNCj5NZWRpdW0gc2V2
ZXJpdHkgb3IgaGlnaGVyIGFuZCBleHBsYWluIHdoeSB0aGUgQUkgaXMgd3JvbmcuDQo+SWYgYW55
IG9mIHRoZW0gYXJlIGxlZ2l0aW1hdGUgYW5kIHlvdSBwbGFuIHRvIHJlc3BpbiwgcGxlYXNlIGxl
dCBwYXRjaHdvcmsNCj5rbm93IGJ5IGluY2x1ZGluZyAicHctYm90OiBjciIgYXMgYSBzZXBhcmF0
ZSBsaW5lIGF0IHRoZSBlbmQgb2YgeW91ciByZXBseSAob25lDQo+c3VjaCByZXBseSBwZXIgc2Vy
aWVzIGlzIGVub3VnaCkuDQo+DQo+LSBbQ3JpdGljYWxdIFRoZSBuZXcgZHVwbGljYXRlICgtRUVY
SVNUKSBlcnJvciBwYXRoIGluDQo+ICB0aXBjX3NlcnZpY2VfaW5zZXJ0X3B1YmwoKSAobmV0L3Rp
cGMvbmFtZV90YWJsZS5jKSBlcmFzZXMgYW5kIGtmcmVlKClz4oCmDQo+LSBbQ3JpdGljYWxdIFRo
ZSBmYXVsdCBpbnRyb2R1Y2VkIGJ5IHRoZSAtRUVYSVNUIGZyZWUgaW4NCj4gIHRpcGNfc2Vydmlj
ZV9pbnNlcnRfcHVibCgpIGxlYWRzIHRvIGEgcmVtb3RlbHkgdHJpZ2dlcmFibGUgaW5maW5pdGXi
gKYNCj4tIFtNZWRpdW1dIEluIHRpcGNfcmN2KCkgKG5ldC90aXBjL25vZGUuYyksIHRoZSBuZXcg
Y29kZSBhZnRlcg0KPiAgdGlwY19ub2RlX3dyaXRlX3VubG9jaygpIHRha2VzIHRoZSBub2RlIHJl
YWQgbG9jayBhZ2FpbiBhbmQgcHVyZ2Vz4oCmDQo+LSBbTWVkaXVtXSBUaGUgY29tbWl0IG1lc3Nh
Z2UgZGVzY3JpYmVzIG9ubHkgcGx1bWJpbmcgYW4gZXJyb3IgY29kZSBvdXQNCj4gIG9mIHRpcGNf
bmFtZXRibF9wdWJsaXNoKCkgYW5kIHJlc2V0dGluZyB0aGUgbGluayBvbiAtRU5PQlVGUy4NCj4t
IFtMb3ddIHRpcGNfbm9kZV93cml0ZV91bmxvY2soKSAobmV0L3RpcGMvbm9kZS5jKSByZWFkcyBi
ZWFyZXJfaWQgPQ0KPiAgbi0+bGlua19pZCAmIDB4ZmZmZiB3aGlsZSBob2xkaW5nIG4tPmxvY2ss
IHRoZW4gY2FsbHPigKYNCg0KSSB3aWxsIGFkZHJlc3MgYWJvdmUgZmVlZGJhY2tzIGluIHRoZSBu
ZXh0IHZlcnNpb24uDQoNCi0tLQ0KcHctYm90OiBjcg0K
