Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794968697;
	b=4wvdlCntiFwMRx+twUuIb251/HuSS3MzQOWuiyJzZZ7jcXkY2Y3oSyh3094mWl8zjwEM
	 nshHAm3fwOjWd4ieG8+su4l4O6kNiagATqssq99tXFgOAOMbhsz77RwEUUXuUKvzuEKRi
	 gRN3rmUOXw77oXf3w7oTf43gsBq/IV4WUld3K99t4ksVIrcHswxCYblE8ryJ8kr9OWxnL
	 hiIOupetOdnwKo+wVJwcZavnvT15UOyRnEiJe3o2y3TfGKnmFIcPhEwXe1dvpgnR6co0p
	 wETqV2lr0p+giep5dwCBnCRLT2cyb15iBE2aQ40XfRnOxHJUxUVYmHOwnazAm01PAOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968697;
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
	bh=1+Mq+qgjtztR13jCGgq6eVA9ANAVsg0arNikqSyGIv8=;
	b=cZZNqDfZYeyeHuVsDIH3hrSMrn6ieLzVIUMeJXzVNywKTmWKkruTNx1bVTwTEnGEd6uV
	 ODWNEF3K8QaOA16PtEfJyktCctubSATE/v72ISUHQJqDm3VHuT5txssE7b9mXFX1v1LXp
	 TXW5EEfcqr6WwBrp7LzWhpQvHFt/u7iuiMsw5v2wrCkCkXu+BOgk2bP+wxnoUd5QRfbwc
	 0WzMTds/9l7flBK7s3dhZ0mga8xKv5vlE2pZRVdMdICfJZUCXJR2TXeg/zHg/uoGKi5BS
	 QQSFe2RzgLqMUb/lX7A3VpZQVhPpss2a1TCURQ9mFuvV/vfSk+OpmMRxTCqtNNKzZog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=Zrvrl7tM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.52
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860B606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E860B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=Zrvrl7tM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JB45giZksNZ+JyO1C6DLgh9BzB2Zok1iDqU9p03Abz4Rq0uc5wzYiqLHF1CYAdLmcxnBrivIJjlTLxOdUFQb1ZiERNYBAfqIBnZRo+3ToBcQdvgKKi12AroM8Il85UZWcpRP+tuscaIphO2tGlQ69aaSW3ozS3CJL1RAZ6IwGSUJ3kLVC5JnDBqUo8NBaMlXrDHMRoMc2LlqFq6u75CN4gT28d9y5Li82zAf/tADVzw7tWmmyZARuCns/Ci/VhRNMkECFU7EU2kpZmb+yHrGBKkhJD3A3FjWkR6RW1kxDOAsqPAK/kcBrNsLW5zp3xaEk9Rz2aOsGotY7A1VTSH37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+Mq+qgjtztR13jCGgq6eVA9ANAVsg0arNikqSyGIv8=;
 b=l83ee6WGeCNkDTPfzBlnH7DgF2XDjvcWhUY6dQNYZyG2EUQBqflC6InLChbLJ6E4LmgURvCy533QrxeNFmz1gjWJTHYvNeqOrCi8mq58h9hSGXRK08hPDNjL88FEtyKSlcDAEEiMztqJhDw0iL42Bhg8DAMGEpLF9CyvajiZq2RvyCAxt8tEuie9aqWBwzMEMSonfBDpFC6tCmfBdTcAW5tak1ck5/a25sqCg8cJnOsC3j2gcSPloN56J7f48pCajGh3PAbXpGEFQbOXUsmNxMdYesPWTtzPcXy1+p+kPpyIhR9GuH8dta9WmaLlQp35HR2Cyyf1+sv3/mQ8Hd8hzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+Mq+qgjtztR13jCGgq6eVA9ANAVsg0arNikqSyGIv8=;
 b=Zrvrl7tM4v4RQkybBfhj6Dw22RlVzJivgZS0VM/4or2730QXPgdc9QVkfP/gTZJul5VODBC3x9NBAdInLJwbb7Iwldfl9+eF2O1xTRWaCQdmosLzL+UFFhDhWBYE5caRyESd0gpkCx5hR0IzBqHYe1nfQz6c+lMk04G0X9krbBAHbr6g+taYPGOpIvUUsbVNPHoJBykl/Z8AMN7d88m6wB5UBVNsYkFR1ZgtTve1djzgK6uK0QfmmvwkM0UbGMsf0PpsYc3Cj6Ju+m3+IIIYsipC5wxWIstv+fs8IY2YiZGJWKyJuJItk0z2RGQ1Fgl/ZjfyO1yrONKuovGJqOeYOA==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by AM7PPFD652E8E05.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:24:53 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:24:53 +0000
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
Subject: RE: [PATCH net v3 6/7] tipc: fix self-deadlock in tipc_named_node_up
Thread-Topic: [PATCH net v3 6/7] tipc: fix self-deadlock in tipc_named_node_up
Thread-Index: AQHddZTVJthCGL9G0kaggjUZPKwOq7cyml2AgACCI0A=
Date: Wed, 18 Nov 2026 02:24:53 +0000
Message-ID:
 <AM7P189MB11374129B3A6A4AE40552111C67A2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261116063529.6185-7-tung.quang.nguyen@est.tech>
 <179494067734.3136.14054050575784099743@kernel.org>
In-Reply-To: <179494067734.3136.14054050575784099743@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|AM7PPFD652E8E05:EE_
x-ms-office365-filtering-correlation-id: c3ea46e2-10b4-446a-606e-08df451b211a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|261028144727099003|10067099003|38070700021|261026140227099003|261022105027099003|261026121527099003;
x-microsoft-antispam-message-info:
 +cNp/ay87Pi+x6lDIl3juNhAtwMRht2/MWOIDpexImcZAGZNkSNulE0tAo/zCI6xlCq+4XcEkMwfZARlPWCN5b0c4fOLdnoAsmb6QWojfThstWdsn2LcpEx/d3tNH24uN5EuEK33B9PUBbGV3oaQqpVhV7v0N7U9p7hPf/wpMiVND8WuutGY3TVdgChlRgh5PH9DXvp5INf9Lhuwu2z4d2EFDfKJVBiVp5I2VaslAr2k2WsU4qgbt7tKAHh3d9BISaz1VDK6jnF+VcBAZ9Ei8jABBLNIIiyAjsZZUPTuEx/LAj8wpyPtcfhbt14ETvmdcJKtHGjilh1+kOXwiW+u6Rzl5lnWQLR1cDOtfuq0t48rfPIgRN/HvSQ3lCCRXioDFCYnD8Lcx8niloUg9SO0TErV2/t+25e7jCF3PA1GzFyr8rpfBG30hJ4kzCWY49RewL7HB2sdCJoSUakN62J0zjxJPcJD4W6dA3Rix0N03O8zeyKzkHWO5yjxaQrnGN5fBmMcVaKDtC7dAnI81+vxzK2ZVQsmZnz1FIiYUoVvk6nebzkLlKDNB8Hq63RR4UxhQ3eYX7rpAS7c+7zp9MQQN7F1jPJmcMdLFWwZjYT5ZzoWohLO1ynzjovciyHRG+90sYe6bLamBdZfz9A5pA774YLvPRfjtngDCbBC4cDai3ja8d9eT/qTcBzC/pnTgmtlazeRp2a1biWQpe5lSsPepKGL8EL8HPHLCkWBqwG7vRA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(10067099003)(38070700021)(261026140227099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkdSRXo3NnIybSs0QzU1U1Mxazg3eFR2RDJTWFBnY2tjc0hGdmVaMFBlRVJs?=
 =?utf-8?B?M1IyMUYxbWtiWkxQdzJldHVxU0pzR0IzVmk1QlhCWXRybVBUVDVEODhJQXhN?=
 =?utf-8?B?Y2Uzc3JJOEdRdHpKUEsydE5XM21sRXU4YWM5aDl5bHIxcTFrTkhEejhSd291?=
 =?utf-8?B?YitsemdNT1l3dU4waTVsQWV4QUc1TDhNMHgwQlJaSXdsd3ZHSTNwK3ZxaGFW?=
 =?utf-8?B?MndFNDI5VjZ4R0dMRUkvbXhXaG96UW9vQjk2bEhTWUtiRms0b2trallwV1dV?=
 =?utf-8?B?a2dpY0lIaFdsQ09hQ2FGZUtYZWhmNXk5a3BvOEh2NWJ5TndrMThmN2x2Z2Zz?=
 =?utf-8?B?VWsvVXJvR3F3eHJkMzgrNWs4OUJudWxJQkNsY3pXZGppMzF5bjNrNFNXRnlk?=
 =?utf-8?B?TEQ0ZzdrWElZSVJPOEFEbWVEaTd5SGVzdDJlSkhWdzhLRmRuOTcrUHhhbTdM?=
 =?utf-8?B?Q1UvOVZRa1pmZGNuNU01VnZCeVBJWlJEQnkvQVJ1SzJaUGowOHJyeCs3TUkv?=
 =?utf-8?B?NXFIcGtEY0tMNDZiL1lsekV3cEV0L1NuYWVyM0dHVGRvN241U0lUMVdVWjV3?=
 =?utf-8?B?Y0RYNmdzRS9IVy96Uk9uM1h2OThHVFdJU2ZuejZVZ0V1R0lhMEkzTWduNzJa?=
 =?utf-8?B?Tm0veEcvNCt5Q2F1Mk5aZnI1dWFQN0lFMXVoVTRZZUNjZWZ3MUZsRGRneFN6?=
 =?utf-8?B?Q0Nqa2tIUFpJakJOeDNvbjhEaWw3L3lPMm5qNHg2NlRrMGdNYlVaREZha2Nw?=
 =?utf-8?B?WTd5NDZ1cEF2dW0yUUFOa3dia0orRTV3S29wME82WXIxS1d3a1BLZTRIMHBi?=
 =?utf-8?B?RDNzOVJJRXdGUXlqRjkrVFNJWHFucDMvYWR6QWhsU3pKZlJoTGpobStpQ2Ur?=
 =?utf-8?B?QS9DU3I3Mld3UHVManNoNStvUnRrN2l6dGNoV1FoL2h4N05IWE9NcDk0TWo3?=
 =?utf-8?B?UHYvcENGRkJBM25wakV3MDdoemhCdXlheEdYQStiSlJiQzAwdzZGbnVrTHlK?=
 =?utf-8?B?cWZkOFJ1eUZkN1pLaE5IQXpxNWxzVjgzRVZqY0FDNnI3TEpsb3pHQmhhcHlv?=
 =?utf-8?B?cVRWMlhHanJCa21SN3JBRG0ycUxIUndUaGRKTGZyaXF4bHNHTkFPaG1rWGQr?=
 =?utf-8?B?Y002cXVqOFlEN04zbmVkb2kva25IYk5ROXNaMkdmL2VNZ2FaeUR3Q2kwMjdR?=
 =?utf-8?B?ckpkc1R6bVp3SnR0SUdrd05GOHVhR0c3VE8rbmdicWM4Z0RSUmorMmxJUXVX?=
 =?utf-8?B?SCtOcUdiVFMvVjUrclZ2OVBZdU5iRzdUOFhGajZDWXkzeXh3c3IySjg1dGRM?=
 =?utf-8?B?WS8waWpuOWZRMkZSTm9KdlJ1aThxQVNtc05CaGYvNk1Pa1lPejhTU0t2dUZ0?=
 =?utf-8?B?ZWVVWXRENHF3VmRMQkkwM3lGa2dDSkJ3a0pyT3VtQkZVL2dSNGtaVHRJRk4y?=
 =?utf-8?B?Q1VnVGJuZzF0K1FOQTRIUU5wMTBmNFRrMDUvTFM5eWpYOExFclBJNDRRb01v?=
 =?utf-8?B?Vzl4dnBPUTYvMm9uSWNaTVZleUdSeFlQTVhDaXNJUEtOdUxqdmR2WUwxTitt?=
 =?utf-8?B?dU40U1dQUXhTYU5iOFRIWGc2enBOc0ptOE81SUlwRWhmNDJYT3E1alQrRVdh?=
 =?utf-8?B?SkxKTTR5eGpNbDVKSytURTg4UTg2V1dvVnJ4WjhOa0Izd0llUTRldUxkcGU2?=
 =?utf-8?B?UC9wZGs3RXQvb0ZrQUFnQ1pMR2ViTGt4ZzJZMHdTejlmd1lPSnNFK0cvTWlh?=
 =?utf-8?B?QzBwMHJWK0UxK09xblRxYmppWHlMNy8zYk1lRHFuSVBhT2pzK2N0bkl5THJz?=
 =?utf-8?B?d1N1cUJZWllDUVN6RkpyTVJ6OUxVVnR6WlFIZkIrdC9rTlBlMHZPd2JvOEEz?=
 =?utf-8?B?YWRrTnMxUzRzN3U1MkNJVnBqS1g1d2VBaGNSZEV4Ui92QWxKelRIanYxU1RQ?=
 =?utf-8?B?dHE1QzJyYkF4cjIzcTkvVnJZVTE2UW0yMk51cjFQeWRSQWFielRsR3NXdGlB?=
 =?utf-8?B?OXNkM3ROMmUrTXFLQzdjdXJyUTdXbHQvaUEyRnZhRUxVU09VMlcvVFpNRE5n?=
 =?utf-8?B?WVVmWmpReUFNcG9zcHg3V1VCbjBEVzR0TDNpWW5mbmw2YmJlYkJxeUNwRTFp?=
 =?utf-8?B?MnAwTHBhQTdONVNxWlBQcHNrMWszMVVHZllpdElkUTkwSkUyVVEzN1V3eEpV?=
 =?utf-8?B?SlZ3OEJ6UTl4SENnb3QwV3pyRC9xMDhub29sUGc1bjFJSXIyM0gzL3VJNVZ5?=
 =?utf-8?B?cURISG1FTjgvaU55ZklGTmh6Y3RxYk55Ty9OdU52ekdZV1NZZllMSEV2QXda?=
 =?utf-8?B?RXI4UWdVTEZLTjNmRG9TcThFYTYvRTJNczlqek5nUEVVNENCcWZnZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ea46e2-10b4-446a-606e-08df451b211a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:24:53.1237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acQdabtelHIZIGCbJq4Oe8ki7aFco28K9dYtovIPfrxjswzJspn9uV3ckQwPuoo0wVn5BQ8QsJCFbDLrdELMjtEYMk4EF6O05dwdqoWNVBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFD652E8E05

PlN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IHYzIDYvN10gdGlwYzogZml4IHNlbGYtZGVhZGxvY2sg
aW4gdGlwY19uYW1lZF9ub2RlX3VwDQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlv
biEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgbW9yZSBzZXZlcmUNCj5pc3N1ZShzKSBpbiBvdGhl
ciBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzLiBUaGlzIG1haWwgaXMgb25seSBhbiBGWUksIGluIGNh
c2UgeW91DQo+d2FudCB0byBhZGRyZXNzIHRoZSBuaXQgcGlja3MgYmVsb3cgd2hlbiB5b3UgcmVz
cGluLg0KPg0KPkxvdyBwcmlvcml0eSAvIG5pdCBwaWNrcyBmb3IgeW91ciBjb25zaWRlcmF0aW9u
Og0KPg0KPi0gW0xvd10gSW4gbmV0L3RpcGMvbm9kZS5jLCB0aGUgY2FsbCB0byB0aXBjX25vZGVf
bHhjX3htaXQoKSBpbnNpZGUgdGhlDQo+ICBuZXcgdGlwY19ub2RlX2Rpc3RyaWJ1dGUoKSAobGlu
ZSAxODQ3KSBjYW4gbmV2ZXIgZG8gYW55dGhpbmcsIHNvIGl0IGlz4oCmDQo+LSBbTG93XSB0aXBj
X25hbWVkX25vZGVfdXAoKSAobmV0L3RpcGMvbmFtZV9kaXN0ci5jLCBhcm91bmQgbGluZXMNCj4g
IDIyNy0yMzEpIG1hcHMgLUVMSU5LQ09ORyB0byAwLCB3aXRoIHRoZSBjb21tZW50ICJUaGUgbGlu
ayBpcyBjb25nZXN0ZWTigKYNCj4NCg0KSSB3aWxsIGFkZHJlc3MgYWJvdmUgZmVlZGJhY2sgaW4g
dGhlIG5leHQgdmVyc2lvbi4NCg0KLS0tDQpwdy1ib3Q6IGNyDQo=
