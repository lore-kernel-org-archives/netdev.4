Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795847675;
	b=30RvW5Hclyj/cJdR1+YISTUMoUoru0Sc129zbusbtB76V+bgR/oXkverwnFtWdieV4r6
	 kxtmlMcQe1imLuPaVrpcSOhZuvNTVOsbhmg/6U45cdkoecysBcqjpVU2lG89TcJCIInbP
	 hEv9in5Rh7Yj80UhG+iUCN7KzwFX/HDF+tZdvfaJztTIUKKEOKqyTyaSvmopkjYuynrJ/
	 Gas2H3V7O54jb+G+ln4ji6nRbAMiREDcXGkhx4+wg0sR5NDcot25CNQ7eNKZhiEWwA8w3
	 ShMcWF/z7Hapvt1LoJZP/QQBKfrLtguV20uBiExFm58kSAUUcD62960pHaDdosopFVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847675;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=etZmIf7u0heKFffXDMEfrEcrIugPezhrOZB72CEkJG4=;
	b=kB7bWXBuyX9uvz1VSDudaOCtlPsJTuL0+3FEOL/VbfjurxZQKSt1T6usxPYd6ca3Rwsi
	 KJnj/Cuns4kvzyYatID+FC7UjIMfOI0UAhcxC6sPH5fuFgplcJNoQy2dwoZHCl+knE1Zz
	 QyAfL3jR4+tdfnLQ7bNIhOjbKV0qQSo9RTakKBlOR8iNjseqgKDlOS9oIu++yMpxSUdSw
	 nVmzpMpjBPUgfpMRR3A4vc8e+zPgbar/gA6ujXWPSF26XQVqenba7Pg9G0bc2aE6u2wRL
	 wzeq24hHzrWlHnoIDQVOgHze/7+o8Ie9ybMXrsrQdXQmziltsq4bRrqwPnFfZVBjQHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=littleit.sk;
	spf=pass smtp.mailfrom=littleit.sk;
	dkim=pass header.d=littleit.sk header.i=@littleit.sk header.a=rsa-sha256 header.s=selector1 header.b=lEBsN3MH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.132
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023132.outbound.protection.outlook.com [52.101.72.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E6606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=littleit.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=littleit.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=littleit.sk header.i=@littleit.sk header.a=rsa-sha256 header.s=selector1 header.b=lEBsN3MH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8KW4O1h8gw5m8HmWVfR9KFKczJWHxmfzr2sok0zah/+mIKgeRrdR7G01oB7rmQx5AuS9WrUWNPaybnhKVQ87nNj9fRsFqf9afkz1HpmgKku+G6TFXx87+9l7k4pxO/u95cdy74ET6l+Bd8LB49/iXmbqaAPXcq5J8PFVJxghF3vAwu1Bs0xakLLqmmUQXWeBR2RBPJYZ1MUerHwqYDLA74rVEUFfWVLPkzK9Qhek4YshwB1eNldPtNzd634I/PXMsJzDvNP5srqt4nLI5xGp6E7BCDwo0vFc2IV+ybGtlUs/FBI5sjypQaud7GVLeGb5zxSE5wGK2jHVIR7rZ7p0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etZmIf7u0heKFffXDMEfrEcrIugPezhrOZB72CEkJG4=;
 b=w0VzbLQ3M18tN7oJ2HNcRpDzRVzWM7BrlCBTWV0Z3n2cUkEE/ElcqY5KwykahCJ/h0FyxzmhWCNHSTUWFc9d41zgQ7iE58GknfpJ42ti3iJEBBO3sRUriVWgkky/nN4GZJvoVmwHergySvQPBPTLN0gBfmK+D2JSH5+haNz1EyXjTUqFo1eHhjQWNxdgP7Cp2EMauerO1gm17RHzY3xYjxpQAr9r/M/fKet/jNYLtvG3UnbXpLahcwbQsu7N0WgJNjq4nuf2CjaPwoWwz52d2IR0Qv61pwzCP8D1qXKIRZ+QdIgHgXkTDWYqWyX7LBZsZYAoL1Yxv0CmogJaSSVIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=littleit.sk; dmarc=pass action=none header.from=littleit.sk;
 dkim=pass header.d=littleit.sk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=littleit.sk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etZmIf7u0heKFffXDMEfrEcrIugPezhrOZB72CEkJG4=;
 b=lEBsN3MHk2XM5TNMmT5xlpLgj7EO7K/7Mr6pHMA4q/EZa4hKiyo3MgP0JmgglV16M5oEwNJg/nsFfnPKd29btfONCLSStWnx5UuTpaFkMqYxG0hUMp7b4WDCkR1gLkZZNOyNcyAP3LmGD7B7AOQt4Z+JOZEzQB3ujD+pLLT3+4EsQMjLr+vhy17i1oQESJny+UmKsWZy88ujiIHyW1sCLnnFC8RtkOC14K1/25RU5DE8lw8Sm7MdVB8qEwW3iJpW7UHBecSKUKN9TES0Wb4ovbQJ1fWxybJZf6zN+xqfEYvt4YStUh+dGYvAEXRE775d2et862u0wDIj2lXTcvII4A==
Received: from AS8P193MB1782.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3ff::8)
 by DB9P193MB1243.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:259::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 06:34:29 +0000
Received: from AS8P193MB1782.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3c:7f00:2f39:6289]) by AS8P193MB1782.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3c:7f00:2f39:6289%6]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 06:34:29 +0000
From: =?Windows-1252?Q?Juraj_Sl=E1dek?= <juraj.sladek@littleit.sk>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>, Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?Windows-1252?Q?Alvin_=8Aipraga?= <alvin.sipraga@analog.com>, Andrew Lunn
	<andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
	<linux@armlinux.org.uk>
CC: Johan Alvarado <contact@c127.dev>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: reset SerDes data
 path when conduit comes up
Thread-Topic: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: reset SerDes data
 path when conduit comes up
Thread-Index: AQHdfnF352tOY8t3k0uN2LCNUDAc37dCi90AgAB7LdI=
Date: Sat, 28 Nov 2026 06:34:29 +0000
Message-ID:
 <AS8P193MB1782224A65033DA7CCDD895D81402@AS8P193MB1782.EURP193.PROD.OUTLOOK.COM>
References: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
 <20261127-rtl8365mb-hsgmii-fix-v1-1-f2827126aa6a@littleit.sk>
 <447ca9fd-5f70-4e70-b080-d0d2b74478b9@yahoo.com>
In-Reply-To: <447ca9fd-5f70-4e70-b080-d0d2b74478b9@yahoo.com>
Accept-Language: en-150, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=littleit.sk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P193MB1782:EE_|DB9P193MB1243:EE_
x-ms-office365-filtering-correlation-id: 5b9e464b-4549-4e7d-2516-08df4d19a79f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|921020|38070700021|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003|5023799004|6133799003;
x-microsoft-antispam-message-info:
 tSDI66xKLLOqqx4qjCSTtr+wvcA0qsiV2kou7cPF5BOAhfMFP+4oZ9r239D79MUCQWrAs7rl0EZRiF02PfUxwEQYTOkUhS2089wGb7aXK2MqS2/3EVzsg+VrxUTVB1cN8c4QuFtouQXkDcK7b/V4rhBZnHcOu3GxeNfOeZ7+ISMNXQ2kVMe4GEa3w8/kxNPYbVvSA09FJYbM/zsoooTkVTRrDVMbbk91z55T/8H/Zq7oiYIMsM7Qx/tR4Jnw122zMIy2oN91pJZl1q3itzQfcXt1wtsufKgYQpBIfCZ6Gp+ylkukiQUV1+ayaVLiR44dDTVGrCom/feb/OM0fr2DzJ/9NMYc4PjFVOiJOyg5ULNLs1Ekhv/V9PwOw34r7aC42ilQ875VvMQbiI49z4l1/NFjWpviZaOdEzrC57qZq3uyMvnQoxOUSEQB65Id/FP6yn/5KlyLxSqyaqdgLZp9wy+/bCjgOTKWfM8TUxmWsFzObnOXlZyYTE9dt8wJxV3HxPj0Zz3dt4GHkt/WuCNgb1NZXjAmSLCnukqtEK8RKkI29fY1AgSH1+Z2Rr7FXxlXKAiYZSwJUIxQlkweow/g8uk+M0RAItUN7zJ5S8eyMwOYe7RN+ysjNLvOEUcaQXmek+djstqEIMqTua0BPlRUjnQ0ijKeO9rxk83occ2ipEKZcayg1XZAa9WQzk7Qslzh9ywTtUhj1poTve0X7dNpLDVa1XR+dmGZmDTbzJrDUzqF2FiX7bDeQILYNgrhBsVa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P193MB1782.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(921020)(38070700021)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(5023799004)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?IPfDl+7SAU1KnY5DzEpDmhDCOJZABhLb1Aq1et8YQdpZHwBGjDd0fw2F?=
 =?Windows-1252?Q?wbQ8st1Y2D6lAss4iRJeIYOcE8fLp6ClpaJUyLteTibnhgWFymf9IBBq?=
 =?Windows-1252?Q?UYV1EjVI/VrS8FOhmGe56BMO9A+yxyUlyD62QUr1//6h8ZnrRU53/MLW?=
 =?Windows-1252?Q?0MRm6qaKr1MVPIxrO19E8Oc9GWyv4TI7dmEa//szqB7xEJabteGQi+ZB?=
 =?Windows-1252?Q?s86CbRZhXe9lGpfxT2fc7tO9NTi5HBZLvk4lfMkAfBpKtP7r+KCJYaNT?=
 =?Windows-1252?Q?5VpT99PzPiuPUSr+sfC4YiIiYY14QCiQVvI/6ev+ZfTKL486hhXFJt9U?=
 =?Windows-1252?Q?zBerJ7umLst+J/a/v0ceCDeC9Aqb24siFH6NSJAa15LUirbjO/f6dKb9?=
 =?Windows-1252?Q?KnTPYrif+xcRsM8Qjrh2q61JLnSiXeAbzA5uZexGo6uHBoHWbJGRA77z?=
 =?Windows-1252?Q?ZzvjHdCZmtOFg+MmR1AoCXcV9ds9tCtRgbgN4tQQBoFJIwwseJrN9KH4?=
 =?Windows-1252?Q?s0YHpvjlOO0uI8ZNlohR3neTIG7fwWhLqk/WuZZhHr1YO74NXm0rUjhN?=
 =?Windows-1252?Q?0A9V6g0YlYFGDET2QenFHp5kI7rxr+Ujjg9O2MSSYKESbSEe7y5/ax+L?=
 =?Windows-1252?Q?0quwCf+67BPAwd0P6E3qQugdIMGmbAPMdj6NLYfFLJTLPdDWJVuVQPHo?=
 =?Windows-1252?Q?dA5U5+A10MQvb+QU+ahimmTz7hR1Esu1SRuLlVUVpBhDMITeGe6isfJe?=
 =?Windows-1252?Q?KdKZx0y/3qUMJ5tRt6/7PWEwNNrM8xWXt1ia3gUv8oQc3r4J55cz8IC7?=
 =?Windows-1252?Q?RtL9Xye0Ic/cTQc+G0uTxIWdoV7Wxmd/hAsstc/BL1rk+fDD30m7P8MT?=
 =?Windows-1252?Q?BxcbpRMouPTY6M+ssD7F/tMcZkxDxNp7AUUupLyzM9XQ2EXt1/sAotOQ?=
 =?Windows-1252?Q?o64Wb4ue9cIfOMwDrbf5mgx3tuG5cmP05x0n3lFM/RMENrpq7hkbBFLS?=
 =?Windows-1252?Q?cZdTPwRT1NlQwMVpWkYmrevb226Fqta1DlZkx+blrbTGaLN6/BaIHD/V?=
 =?Windows-1252?Q?n9Ibtp0B1PQJb2QmGGUu3/1JmzE/2rR7sOZP903Z9YFb1Y4OirLs7Bh7?=
 =?Windows-1252?Q?3XQSoGDhiMBVCVnt150Z8k00fYchnsornOvxmjLd9TM271R63nR2hbt+?=
 =?Windows-1252?Q?ruqElpi61R0VB2T9ejx0qWZnbWHH0oDdzDrGyGpBMJ5rMT7OIMKaeN8F?=
 =?Windows-1252?Q?HtI5ppejJJAqi20F6CEgwyrf6hIWbKam8bypyj8Jd5RTTgK8lhpeezlo?=
 =?Windows-1252?Q?NU5vojx7wNl48z6MoCV5PX5hkDBcvyWbOY7rny4D+BaCJXaPnhs/jY/b?=
 =?Windows-1252?Q?qjOTiDJanyvZVUBbM6WUYWZiNnWd4lEq8Rb72TTh8McxGCh0JeHJSkgh?=
 =?Windows-1252?Q?1l3vjP13U1O+8mHSKlhJFJAH0vT+kdXIrJhFH4LW/oo6hP7lMga1bkaw?=
 =?Windows-1252?Q?MygsI8OOIZ/ls4UhtmKMmKYVX75pHY804yhNzlWJVDxiqL7dKYdNCak8?=
 =?Windows-1252?Q?kVSaPDQv2dUKhGUmfCuSi7+JBb3YMe2fA4yat1VWDNRStobyFAfdZk7A?=
 =?Windows-1252?Q?iwHIvWOqEs1E+62iqKyl8pAZIij+Sa0YxWqdNSjIiKpuwSXFmLHEgJ1j?=
 =?Windows-1252?Q?m0JnILm9rjcMKYppbgYJKsxgvvOvqjlsBihFrB5m8+7juYTJd3EpxmeN?=
 =?Windows-1252?Q?kMJGfuIdYanc2UjtHe22EII38iEFw8WCZ85/2XLyHgj/WxzaBCGTy/mv?=
 =?Windows-1252?Q?YrOm//NMY9ODN6nnK1qvxs+Po9VYl6PKtsj0Nn/KQpMdefQyXFQhkNBO?=
 =?Windows-1252?Q?0jYLR+JYiZa75Q=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-OriginatorOrg: littleit.sk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P193MB1782.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9e464b-4549-4e7d-2516-08df4d19a79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 06:34:29.1540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1cd60003-6c4a-4fb4-8b26-bb476dab9c06
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JFXOQycpflVU5qgDoOJOQ/u/A7sNoRtNUPvsC8+aTAkwHMJjDAmLoPeI6I7Xtm3CQnTU40xXQpKK+LQRp+UhpyHuy1Oz0noeR3fzmPKEK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P193MB1243

Hi Mieczyslaw,=0A=
=0A=
Mieczyslaw Nalewaj wrote:=0A=
> Just wanted to give you a heads-up that there is an alternative approach =
to=0A=
> this exact issue currently being worked on from the SoC/UNIPHY side in=0A=
> OpenWrt (PR #26597: "qualcommax: ipq50xx: program the UNIPHY at gmac prob=
e"=0A=
> by Johan Alvarado, who is already CC'd here):=0A=
> https://github.com/openwrt/openwrt/pull/26597=0A=
=0A=
Thanks a lot, I had missed both the PR and the earlier netdev thread.=0A=
=0A=
> The root cause identified there is that phylink only programs the=0A=
> qca-uniphy PCS on the first ndo_open of the conduit, leaving it in the=0A=
> bootloader's SGMII (1.25G) mode while the RTL8367S brings up its SerDes a=
t=0A=
> DSA setup and trains against the wrong line rate.=0A=
=0A=
That fits what I measured on the AX55 v1: the switch configures its SerDes=
=0A=
at ~4.6 s, but the IPQ side only starts transmitting at ~7 s, and every=0A=
failure I saw was in the CPU -> switch direction (either FCS errors on=0A=
port 6, or intact frames on port 6 that were never forwarded). Resetting=0A=
the switch side after the conduit is up was a workaround for the same=0A=
ordering problem, not a fix for its cause.=0A=
=0A=
I'll test PR #26597 on the AX55 v1 on its own (without my two patches),=0A=
using the same reboot loop as for the series (switch held in hardware=0A=
reset across reboots; 14 of 70 boots were broken without any fix), and=0A=
report the numbers on the PR and here.=0A=
=0A=
If it holds up, I agree the UNIPHY fix is the right one and I'll drop this=
=0A=
series rather than add a workaround to the switch driver. Until then,=0A=
please consider the series on hold.=0A=
=0A=
> That said, resetting the SerDes data path on the switch side when the=0A=
> conduit becomes operational might still be a solid defensive measure or=
=0A=
> useful when the conduit side isn't preconfigured early.=0A=
=0A=
I don't have a board where the conduit side can't be fixed, so I can't=0A=
show a real case for it. I'd rather not push it as a defensive measure=0A=
unless the DSA maintainers think it's worth having.=0A=
=0A=
Best regards,=0A=
Juraj=0A=
