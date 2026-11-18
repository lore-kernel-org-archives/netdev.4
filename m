Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794968613;
	b=yBJWGGlkA7diufwoGOJV4zC1+J02ZH75ig66xgT4hBCrVBrQ6GfeDk1PQpE9ThzKU0sr
	 lSRaMvlawoBMrGHLo81be6GxjahhVKAvEr6VsamecMiBIHnVsL0Nv8rLzDBBY4RGzQSR+
	 AAkK3Bxps41I18H24J9oe/pudy+ZZrymWiomx4vvb99NQwoWBfEceWeIGG5Is+fvpGc1J
	 wuhsCT8tztjx75oCXvqIdiMPFx+Iey+qph5T3/YNvw7RDxzziH4xJE/Apv482/YYLLgfq
	 29SmmQzORJ2oPJX/JrbEt/1U1tdAE3iTg8gZUkf6j1HXq9MukT8oTfxuX0CegtjuTuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968613;
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
	bh=e2CwYBJB4VIL+bt+ul8Y8oItq6n5cU71ENpyb/h/CWI=;
	b=W5TFtJuKGtVGACt1qWYhzjfP7p0JYgKAqg+OQ8K2jVLD5dgQFmA1nr8Lb6QatbLnVsfj
	 3Nq+TzhehR8wE8ZwQXsqvPuFHIluDPWFDZ9HduC6SKnKHl/WjSaKKz4awqnsuwdEkWJ1k
	 QM7vMWoC/Ym9KNpMF7d1+mejot3BM1A7fzNCltAsv4oIxRrCQPSPpXWRcz4yu2FprjqaT
	 zHZVM1axVxHw7gC+Z71r2nyxbyKSz4CYuPDACw0pYitDeqfxHRCUmcPqBCL1Is3IuhQuI
	 vGOQxGZWuuUFi3OUbu5zT1lM/qwpK+2CeZFYOd9hnK+Fqh+zXmlrXbAegSdOWsAFAIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=LPyuOxfz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9A606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED9A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=LPyuOxfz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de9M9akJgVfxpQBKcIDNvqJz1Bj2CK9FPiwKBqklNCE5/ZMKtVMhcvLhjKy7RTarJpp5oeuoIPsbg8sco/HiwZnsKECellJGfSlWXEO07B25XlF3cOwGau4G6W1QpvkzbqNT5GwUEO0pCb4b6dtV94lJqmYuPMiBo4PSXBuAopybpEKQiHO93hmL2OdXsnfJYSY0UyrNEq9m6UrEoYyJkGvKwKHNZhdLF9XjXOSP8tQ+hKKjRsmymUXhBtl6hDJIa5nXnv3QqGzl5b2KYb4NssGph9bV4VZIPWBOWX4wu8t5JSXEQzOJ/U1Iz3MWa9Tek5obKpuXP/uqJOS6Z9Z0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2CwYBJB4VIL+bt+ul8Y8oItq6n5cU71ENpyb/h/CWI=;
 b=D8xuSnXqpMLS6Ob/mvswi4fLK0f0oQdTnesL5OIDS5BxKw+BYJ762Yl/D6shQTMDGrV+GqER50xNxrWt1PRZnLb7FD/1YWYokDHwbqSDYUc+/ZwTUd/8ERvK4Ha+R9L/CSmTMe+/+xgwc0s9GwY5XboKvR7i3C/8kKjNpsecxf+gcL/C9m0Sy7epeZGDWqKAtjMHsDfk6W4t4Jvg3Ye7eO1Szc1tfvlvYgW3mKwRGbb5bNLdYISEk1FvMuiVNZzVBBtxKvR3NivuzNW6mrdgCHXQRCkvlSkUT0grDVdwQbMa/pP5bO2jS4HJ/w+VAZhWZhn8IoBKni3i/ONNmbkOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2CwYBJB4VIL+bt+ul8Y8oItq6n5cU71ENpyb/h/CWI=;
 b=LPyuOxfzl++8EKdwQwl2pAgdCazPmdAVMg028+9DD0wWUFU4i1G4JWHMctYcm+n5plCD3Vzo5ntkn1clhozYfE7xFas1y/F/oV1I/utsAOHcdr8UfYWX+t17D8azLmLpxFsMofp9eFpcxQi8RAtUa1i5vQ5enq030e7PX94c3SIP56MXHIezwWRompCcgf6OhX8J+sbyQISeAWG3lJbEW+Yv/TDZQaBqiMXO/azy5rfA42kUoWC0T6bP2YHCS3+XZ5VFioPeM6B2xBaEJVvCgbjYc+3aI6n8yRhBpNnr4lk3PS/9P4+uBHgXI/gSA67wkWcsHqdJ/uflXQGZgA/OHg==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by AM7PPFD652E8E05.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:23:29 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:23:27 +0000
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
Subject: RE: [PATCH net v3 5/7] tipc: validate original address of received
 skb in tipc_named_rcv()
Thread-Topic: [PATCH net v3 5/7] tipc: validate original address of received
 skb in tipc_named_rcv()
Thread-Index: AQHddZTQog4jaMFL0E+qkPzsIDu2fbcymlwAgACBE7A=
Date: Wed, 18 Nov 2026 02:23:27 +0000
Message-ID:
 <AM7P189MB1137B096ADC51773D291B17FC67A2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261116063529.6185-6-tung.quang.nguyen@est.tech>
 <179494067612.3136.6822690964741396713@kernel.org>
In-Reply-To: <179494067612.3136.6822690964741396713@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|AM7PPFD652E8E05:EE_
x-ms-office365-filtering-correlation-id: 9505d974-35fa-49ee-8ee3-08df451aee2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|261022075727099003|261028144727099003|10067099003|261102130727099003|261009223027099003|38070700021|261026140227099003|261022105027099003|261026121527099003;
x-microsoft-antispam-message-info:
 /z5YmM/2z1bkQUw6ySdUrPVPBMdHBDBiWoyUz6GVY/2EUoQ4OaalDYkYEhr1vgE8hFczmYvc62rsCymxIEIy9NwlUygX1QMPQYXSOAFe53qIkOlAlm1msbWUiop4tvqCcCXswp8T11+bi9JrHgysy59vBMYEb0Spe7XwC0wgVcniOFpV3CxM+/7tjrh60J22oWxSwyaKny018DyzZIg8+95KaiSS44lD0yAlNsohoXqS5eWpnbFYuyA1ylQpjE5G9COj/CGLpGChLT3Q9o+XsQ+fFyjv5QcxO9y6RdkfAyMj7fEzGJ7NVqtOYZVlvCSUOdmXXnZ0WVkTG3ujkYePhA9oWJjJwwKbW4WFadR8k5rc19AIjSg6EFlgsFp6IDbHqtK811NoFmJFH5rpRH6hW4WX/qhpRyUoRM1YmIJCfTUNVRuH7ltSCjJG2JISen/iiaFS68PWSvIuV0AzqhI5BJeaGZD8cEn3YN8iS48VcEvLPSnKWO4J//Bu0JbDG4uoiWaxMCz6F6Vj+keTj/HUcVeObgcpzfckBf6juqMH1nWH2DT6Z76XjX1Om/XznclVfS/N53hLhdrb1bKIUbq8yL3HA943Qs+A2uooGblH3nPcurt6aslQNtlBAU3bxQY4cI29UtinPHgevveE/27TmzOZLu9LlpjcaLmJWh1Qdx5ROQpzpPgy0jS012hQW+gpJkfWVPqM1lsO7AuE1OLysg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261028144727099003)(10067099003)(261102130727099003)(261009223027099003)(38070700021)(261026140227099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzNLZ01lYnBSakpFbVlZWXRNcmNxZStPQXErZGovZndUbkhaay90amNTNjcv?=
 =?utf-8?B?Sm12RTF0Nmw1UUxjS1FCUHJPSFUxWk84NXkxd0pQUjhRaEZjbVIralJjbWox?=
 =?utf-8?B?dTQwYXoxWUFjS3RXSndqbDRydXBMYTYwVjh4UUZCNUVBT1g1cTFiT3BUR3Vm?=
 =?utf-8?B?NUxQbk5DOGVnb2J5RStNWmdza2RsMUVBS25ianZOU0VXdWprcm5zV3FwcWVo?=
 =?utf-8?B?c1p5NHo4dTU5NWxQcmRqSkJna3hqdTFSMDFpNC9wbjZkZ3R0ZWprNDN0U21Q?=
 =?utf-8?B?SEd4eGlwUkhwQjYya3NnQzlpeWxWczA2Y1dydnV0RG1RbDlSa1pLYXhFdDhI?=
 =?utf-8?B?SWx0TTQ5blAvcS8wZ29tQ0VENmdXZHUxb1pqYUxYNDZ0bHZRUWhXUGdtUnZ4?=
 =?utf-8?B?WnhJNi90MWsvWk83L1hjcWFEUG51WVRyVkhNYWN4bFBPYXlWbXNwYzRFalBJ?=
 =?utf-8?B?V0g5Q29kK2ZkNXNVNnpNWjhjRXErdkh5d2t4M0l5QUhjR3JjMXpGZVZaYzN5?=
 =?utf-8?B?aHBtVkxxbDNqSHA4MmZSRGNQdng4ZGpkRkV2TTRldnM1eXVkTjc5K0FKSGJB?=
 =?utf-8?B?MEI3WTdQMWo2Y1owNGlKQ25BaktkRlJQV3VxM0FZU25aNFZQOXdzRDdIZmV2?=
 =?utf-8?B?WGZtU2h3WnBXamNKbFk3UzlXWU9DdHpmWFhrWnkxUXphVkhZcjhOQVZEK2k5?=
 =?utf-8?B?dVduM3dpcDVrOWZ4cW02bFNsQ1BwVU1oRTQ4bWVCclU2N25OWVpvcllDUkw2?=
 =?utf-8?B?SzREVFZEdG9ueW5kT3hUMVF0M2JicDNDT0l1eGZ2Rjk3c3RHSUs4UmQ2cUwy?=
 =?utf-8?B?V1FKeWU0YmVxM2RvZ1puenVPN2lNTE1vTzkwMFBtNUJkRGRFSzJodldrcmpY?=
 =?utf-8?B?ekpERzNUek1XOVkvU1pWSFZXbVhPcG9mWjk1NWVPc0wzd0UrTWQxQ1gwdVc0?=
 =?utf-8?B?YndQRFovUUNhRURMWk5SSnZrbEJNMDRtUng4SE1sd3htRmZWanljS05KV3l0?=
 =?utf-8?B?ejcyVk1yOUc3VXVvNVJpUllVMUlUZ29vOTUzUEsyMy85V2JCU29tMEtYMW9R?=
 =?utf-8?B?MnptY3VlVGhGRkRUZEpERnBGZitNV2ZVVTBLUVR1OG9vdlFDN2RpMVBwTWtY?=
 =?utf-8?B?RzMra2NVODh1VENRb2VsR1BWTGs5SGtvbkdjWXh4dU5tVlJhYTBUZU1IdTY4?=
 =?utf-8?B?d0c0VGp4SURxZ0FUYXJnZGttZVZxTEZMZGk4RTc1Q0J4QTgvYjNyOThZSHpB?=
 =?utf-8?B?T1V0alZ1VUlCZFJsMDNiTGRhcUQ1L1ZQaG1UWWEvV3lTLzg0cS9JTVB4Qm5S?=
 =?utf-8?B?aVlTWThhMzY4cXY1UzVhOFRoenR0Qkk2VU5QWjBDQVFkbzBjUUNuZmI4SGhE?=
 =?utf-8?B?ODVhRjZsd2s5SG9jUTBlY3RwdGRLaFhoTUtZR0VXaDZVVUgzZFcyYVJmSlU4?=
 =?utf-8?B?RFpDVFd2UmxHV3NRUmhpL3lNOFZpQTJEODlWQUlIeGtBZUhEVzlWWjhKYnRW?=
 =?utf-8?B?UDFkNTVMb204dVpPeElRdENBb3dXQm55ejRvM3l3MVVWbGZHYXVqK3Q3M25p?=
 =?utf-8?B?TjZHK0ZOZGw3YWh3bmNlZ1k5WG54Q1BqNkcySU9yTXFCRzJTSXJ4ZUpEQ1pp?=
 =?utf-8?B?a2w3NytwSDVOOGcwV0Rra1YxWS9NTWRQWkg2VW5tZnduK0s0dFQ5eGI1RU01?=
 =?utf-8?B?c09xS2x0VGc4NjNHMWI1YXF4UUZYM0lVWVJ2cFk4Y28vZ2xmdlBiTVZzZmZw?=
 =?utf-8?B?dUxHQmNzVXRKNDlQR084TmJyclIyM2c4Q1c0QVhoczlDVVZrN3owOFcvSTJL?=
 =?utf-8?B?TUFGME9BR0tGbDJOUmtueHkycWpsUGJJYUszZU5ucGNZRjRLS2xWTk5weHV6?=
 =?utf-8?B?TU9mTkhKNWhCUmVqT1FsTVNUR2twN3RRODNlblZnbU1PK3JEaHZuZW0zUjAy?=
 =?utf-8?B?YUkyaU42VDhPYVQvL2tqdERFWC85Y2V0TGk4TGVGckttTnBqOG9WTkl3Vk1C?=
 =?utf-8?B?TDh6bXJjZ3hkWFlWNkw2ZXFmSXJSZjZMMUw1RkNDVG8yUkhXemRLRWd4ajVU?=
 =?utf-8?B?bmtvSkp0Z3drRWRBWjFNMC84VWVOMWNYUFpMQU1qRkY0ZittLytrYXJmR3Rk?=
 =?utf-8?B?azhYakdObWdwZXFWd2hSRmpkR0RkblJrbldCaFFubGY3dlFQenpNLzNSb0VL?=
 =?utf-8?B?ZDkxbmZiSE1vTkhhQ3V1Q1RHVldybHpHbityakg0Z3FZcDAxMkdBSVZSSjRB?=
 =?utf-8?B?T1JGbzM3K0NtcXZUdFlXYUpvVHU2M3JaS0FjWklaZzdGM0pvT3NhZ0Q1cmpo?=
 =?utf-8?B?QzZlMDlRcTVSVWpGOENOL0lwZk9pV0k3TmxXYlNqUTBHSzJQQytJdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9505d974-35fa-49ee-8ee3-08df451aee2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:23:27.6379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dM4MfI7qXKuIV/Hr1xrdb6DJZL6sDsOCxE3WxFypSbmYInNM4BNhB7AIrtyl9JK19Ym1X+Zks1rzHfGq380Z14cvfWlUd5/6B7czJB+sDpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFD652E8E05

PlN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IHYzIDUvN10gdGlwYzogdmFsaWRhdGUgb3JpZ2luYWwg
YWRkcmVzcyBvZiByZWNlaXZlZCBza2IgaW4NCj50aXBjX25hbWVkX3JjdigpDQo+DQo+VGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgNSBwb3Rl
bnRpYWwNCj5pc3N1ZShzKSB0byBjb25zaWRlci4NCj4NCj5Dcml0aWNhbDogMSDCtyBIaWdoOiAx
ICgxKSDCtyBNZWRpdW06IDIgwrcgTG93OiAxDQo+DQo+SWYgeW91IGJlbGlldmUgbm9uZSBvZiB0
aGUgaXNzdWVzIGFyZSBsZWdpdGltYXRlLCBwbGVhc2UgcmVwbHkgdG8gZWFjaCBpc3N1ZSBvZg0K
Pk1lZGl1bSBzZXZlcml0eSBvciBoaWdoZXIgYW5kIGV4cGxhaW4gd2h5IHRoZSBBSSBpcyB3cm9u
Zy4NCj5JZiBhbnkgb2YgdGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGlu
LCBwbGVhc2UgbGV0IHBhdGNod29yaw0KPmtub3cgYnkgaW5jbHVkaW5nICJwdy1ib3Q6IGNyIiBh
cyBhIHNlcGFyYXRlIGxpbmUgYXQgdGhlIGVuZCBvZiB5b3VyIHJlcGx5IChvbmUNCj5zdWNoIHJl
cGx5IHBlciBzZXJpZXMgaXMgZW5vdWdoKS4NCj4NCj4tIFtDcml0aWNhbF0gQm90aCBidWcgY2xh
c3NlcyB0aGUgY29tbWl0IHNheXMgaXQgZml4ZXMgYXJlIHN0aWxsDQo+ICByZWFjaGFibGUgZnJv
bSBhIHJlbW90ZSBwZWVyOiBwdWJsaWNhdGlvbnMgdGhhdCBhcmUgbmV2ZXIgcmVtb3ZlZCwgYW5k
4oCmDQo+LSBbSGlnaF0gQ2hlY2stdGhlbi1hY3QgcmFjZSBpbiB0aGUgbmV3IHZhbGlkYXRpb24u
DQo+LSBbTWVkaXVtXSBUaGUgZml4IGZvciB0aGlzIGNhc2UgaXMgcmlnaHQsIGJ1dCB0aGUgY29t
bWl0IG1lc3NhZ2UNCj4gIGRlc2NyaWJlcyB0aGUgd3JvbmcgbWVjaGFuaXNtIGFuZCB1bmRlcnN0
YXRlcyB0aGUgaW1wYWN0Lg0KPi0gW01lZGl1bV0gVGhlIG5ldyBjaGVjayBpbiB0aXBjX25hbWVk
X3JjdigpIG9ubHkgdmVyaWZpZXMgdGhhdA0KPiAgbXNnX29yaWdub2RlKGhkcikgaXMgc29tZSBu
b24tcHJlbGltaW5hcnkgcmVtb3RlIG5vZGUgaW4gbm9kZV9odGFibGUuDQo+LSBbTG93XSBUaGUg
a2VybmVsLWRvYyBmb3IgdGhlIG5ld2x5IGV4cG9ydGVkIHRpcGNfbm9kZV9maW5kX3JlbW90ZSgp
DQo+ICAobm9kZS5jOjY2MC02NjksIHByb3RvdHlwZSBhdCBub2RlLmg6MTA2KSBkb2VzIG5vdCBk
ZXNjcmliZSB0aGUgcmVhbOKApg0KPg0KDQpJIHdpbGwgYWRkcmVzcyBhYm92ZSBmZWVkYmFjayBp
biB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+UHJlLWV4aXN0aW5nIGlzc3VlczoNCj4tIFtIaWdoXSBU
aGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0DQo+ICB0aXBj
X3B1Ymxfbm90aWZ5KCkgd2Fsa3Mgbi0+cHVibF9saXN0IHdpdGggbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKCnigKYNCj4NCg0KVGhpcyBuZWVkcyBzZXBhcmF0ZSBzZXJpZXMgYW5kIHNob3VsZCBi
ZSBhZGRyZXNzZWQgYXMgZm9sbG93LXVwLg0KDQotLS0NCnB3LWJvdDogY3INCg==
