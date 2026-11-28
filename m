Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795853954;
	b=JEGTEMNULfZmkq3gza86EJxTDoUPY5pEWW82mKTA9MUz5tTh7ncbep5b6/EyNukDqlPg
	 LmLv3uIiS2v/v166RnUmu7ZfXOKiUDi69L51uqIfcJU3B3qHN0rNZ4iwe4voSwPVXCma9
	 w+4fEh3ySvzqYsK+MGBFiPcyGPLKJArsBSAg8klTYnx98Xg7Ncyxszveb7ncfnOT3LSLN
	 HDm7AffJpVTGVO8bcOldGkGEbA5IGhDrB9UjrD9e4mdOvM8WDazwAx+nPPUFI5PXqg3fK
	 ndZP3+I8N8SMMHYAbQwmHd72gqRn49U9A4rvaajNXjSvZ8LM8paIihdIc3bewVKkVqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853954;
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
	bh=jTFYXZmb47o2RCe8HWeLbcMGbbLkN0DCYjIz79VfDio=;
	b=amIcFSZ+RBHVjmyxhgzTcOiLO0fNFxrRUSmZPnRmGQ4yb8VkNukCDp9CTKXaYbJV7U6s
	 OidgvRFbpaVso9GU76OwJwX+ijHems2DSrlFax1qmFg8xHvfrTewRKKEfBHj76Irr8rKE
	 4VF96addMPP76WQCKKjKI2quA0Qchh1BM8JMNjMqm6RSqxSBp0CuiEmWlS8zX8bQOQZDm
	 UtiyGSNE7kcATNuNwq/pUu0dIxun0Na5z0Z0HrIvQjD7Sgrrgy5GZ41VhRM6Qxz2Ds82t
	 o+tSEnFofLkfSowi0vFb1Q3ERzUUMpP8uMYxjig2BOxWCWz2VuZI8KnAcgNWjpAqoWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=littleit.sk;
	spf=pass smtp.mailfrom=littleit.sk;
	dkim=pass header.d=littleit.sk header.i=@littleit.sk header.a=rsa-sha256 header.s=selector1 header.b=ivSNOnGC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.89
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021089.outbound.protection.outlook.com [40.107.130.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67218606A321
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67218606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=littleit.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=littleit.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=littleit.sk header.i=@littleit.sk header.a=rsa-sha256 header.s=selector1 header.b=ivSNOnGC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plSaI7Z1Tn8CL018DXLWMiRsau8fZG5sxGH5uKbqcv2RlFLG1nYp8xBlZH6dz0zd2Nv93fg9YS3Zi/68WhfoG03NHbNFH1PSecpqrMojENlZdF0G5r7HyFiOr6PWdky1DxZ2UJkHmclmsYJm9Ktz1cuL3FCYr3gvVF9xp41JRHe8qD93yqOngwHK27EDQRPsii555IpzaDbvj24U3UZ84b7OsMCt0VXOAoLpfeyZZi2s6StpCYOwYI4Mdtnu2dcc4YD0MJFwOoldiGw6qDzRdA1BRi3cGKMrEk/8dcIKt73/nfWhg6UX7u+9Tp6nFaIdS/UmSdx91OuTcMQBWfqEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTFYXZmb47o2RCe8HWeLbcMGbbLkN0DCYjIz79VfDio=;
 b=UClxnHx/zLgOpgsPPFDAn2vOGDxKWf/ltVLjGpMPCriCWY09l132u97JCkC+9V8fnc5WdRH5asGlck7I2QJJuYcnw1xiSj0m7pPZeSZGrNtQgFnAoGxyqUfl9MfYjnwRpXWkizJ4TqQViBhT8Evvh7JjpnMa7y3bSI9EZvQHPIiTmjH1aa1bGodX0myU4iKDm+x/E4LdQBpeFGBI/meeuYkhRhcR2VvsJef7f+GxjAhMoOfMl/3rqmaIekS8FWkDz1/1Hp1svbQx9LZoeLAx4LuKAX1+Hj6wgyDk55gws0asJDcf6B3KZxASdxb28LOmf2zGvrlLnxsdqaKTZg+0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=littleit.sk; dmarc=pass action=none header.from=littleit.sk;
 dkim=pass header.d=littleit.sk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=littleit.sk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTFYXZmb47o2RCe8HWeLbcMGbbLkN0DCYjIz79VfDio=;
 b=ivSNOnGCWE2ik2cFvcmf+7L604t8eOa09GgNCgxwCi4uYT4Zq14JcdiwBNQHnXfAkA4y8LLJA5o3jm6+hGXsUWCYkVvAI0RpHVrSpdp15aJh23bbj9yV6w/r7wUMn4fmoLS9w5HrwsQ+nT2L64Gw5l0zWe4LN4p0kCOOfFWhJFcz2ilXv2dVa2P8nIbbfmBS/7+PIJQlUrggWlQiiqNlBa4e0O6C8apFtn74JgfhW4ucoCWyUnEsx32oMGobcOFmtan5/BBm+jY1HpBCur1nVPnAFr59Wb7uxZK3XHSeo0Xa4oFKU0UvlkG/7xwSThfHbBpNnjNf4yESYMhYEbCu+Q==
Received: from AS8P193MB1782.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3ff::8)
 by AM9P193MB1332.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 08:19:09 +0000
Received: from AS8P193MB1782.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3c:7f00:2f39:6289]) by AS8P193MB1782.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3c:7f00:2f39:6289%6]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 08:19:09 +0000
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
Thread-Index: AQHdfnF352tOY8t3k0uN2LCNUDAc37dCi90AgACYMlQ=
Date: Sat, 28 Nov 2026 08:19:09 +0000
Message-ID:
 <AS8P193MB1782B891C4E946067E79990F81402@AS8P193MB1782.EURP193.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: AS8P193MB1782:EE_|AM9P193MB1332:EE_
x-ms-office365-filtering-correlation-id: b1906407-3f2d-44d8-3d44-08df4d2846dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|38070700021|10067099003|56012099006|261026121527099003|261021121427099003|261022075727099003|261102123227099003|18002099003|22082099003|5023799004|4143699003;
x-microsoft-antispam-message-info:
 hPTCL/xYBlDDI0Y/mcEUmYuakFL6PHmYucA+VyHrNu5j4PHzlYeCnVYWhOaN/CdiN1pk2Olbp2rgfKakEw2KTWPfLSaVqjCRp4t6ZjIbwBTIx0hSa1uU5LMbB5/AvyBvyDJsQEdNgCHiYzJrSiemcAw4tPqpmrTZ6HSlMdYNAGhx6r2Qar3UX2GgIVaAiN0jDcLmeg3An//YO/rd9g6I/ADleeJLH9LIoGM1Pixnd+NeSRTjMaPLsHJEjsDpYN0jXsf7+QGUfULfxtEvp7ld4c6TjHj7E6/+LVEe6/VjqF6iqEOp/vvx96a7RRkgHYC+ToRlkQHivtFTD7co92jyALVQ4i66xYl2rrY/8EWn7GLZgQHFuXP0TEwK6mceTXhiOuCjGkgVYCr2aPWgtl8At/LSCn0GLusqvopZy1IXtfE5o0p2GapLuQG9PusG1XoZlCxz7DMayZ9qL4Jj0ihi0ASzSEmzuDXixVZRoqNWOSYIMc0/cFcMugDwxA24xAEYBehexQlG27/G9YI+DPtkyqUwDdhD3a4QCHMyFanFkVwApPsFcVM6+Ea6JuXQC4NQRF2Z3Na1szPOdCW+B6vb7TRzy4uQ5Z2FxSI7mUkwmtR5LoXnWMVgzV3GD/fpYk4vKw1PKrjDn8J3zm0c56yQfgxFlnz2uFq8YA05UV88/XDybBWZYtT3zaSGFI7Jzj5GrTqngcdxvy09hciDjQjq3t3sYv+ZIZ5rmdPGbkW0FyY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P193MB1782.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(38070700021)(10067099003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?U8HdLe7ogd9zy6OUucB39WRFrYLRJ2ISX0dHMNMYKZuj12kNWZ6GtiNI?=
 =?Windows-1252?Q?51n31bKRQ9A4wPO4yerE8bWCgGMAEqjjXlhPYHk8gEGNSiGP6uNl4hYT?=
 =?Windows-1252?Q?GzMcNc6lQxFa+1HJ76nz0nQkkK6P/xL+TQc2jHrl36GzThUHURrRgF7o?=
 =?Windows-1252?Q?kZ+ika5OFBAZ9KPPCIXKY+1rGDiEqeAuTjNcTmuIX20QGm2MnLYwKZm4?=
 =?Windows-1252?Q?8YUDPKupe8y8GXdDbU0O4ip+hvEUiiamfvJUiEDhRkLxL9VtHnS3XGcG?=
 =?Windows-1252?Q?FZ3p8IlfgmKhT/ElK+v8kdNHO+tqHrgR17aFvp81b/ygFXY5LnkSLgNP?=
 =?Windows-1252?Q?jEK2vDaurQCTeMzqWK5Ja6aNk7zMPFxL7E13gVpYQXh0K/2oDt8RM58O?=
 =?Windows-1252?Q?/Z3WP4RCs22gvxZucT+QBKWZuePdTLp6qQtWyEA2WB97eBeo3iCkbNRW?=
 =?Windows-1252?Q?37HfAWU08g7txeAZgvZR0baw3iEfv1hSrVmnu94DUHf9fsoeye0pXEEq?=
 =?Windows-1252?Q?m91wmGgTBHVbZ29D2G1eYP2ChwHftQPUOpELZY8+WkSQIjUsd7J1B9tz?=
 =?Windows-1252?Q?FSx9adH5zIwZr5nlz6USvkMP1sJxXVyFPGDUPDlomPXyASi8Osw6tPxd?=
 =?Windows-1252?Q?5MjpPqwPh9dDZ9pGfevQ1DwV/3s3agEW8NG8kTZONfL9MtCwZ1NBfwdA?=
 =?Windows-1252?Q?YbP0oJYXnI5UfUfi3fHpx2iz1z7Jb3gyaKWbFnPYZeZPzdqb9J7LZEJs?=
 =?Windows-1252?Q?W5kVq8Ytgcd+0SUUn043k+VYnCildRxry2grc+hPVGXu+uO7mTX9cVB2?=
 =?Windows-1252?Q?lXmqYom56lvlNlFUlou/FsGeAsB4guIwwIyiEcYgr24QGvlqU1W69ggf?=
 =?Windows-1252?Q?C18761nA0trpU0fuU85OuShv39worUqaXaHGfxlC6Ksj3+ijiWlbMF17?=
 =?Windows-1252?Q?wqB5fxys2o15E1lmt/A7UgZpjG1LYv6dGUA6HMn2efrVu1cAQ2RrXUNd?=
 =?Windows-1252?Q?v299S6IJtKZ8ZdHHD/kaPk1Dhg/svmuXw7MQNR8GH7y9kKHk4oXS8Xsz?=
 =?Windows-1252?Q?Io0/4XyqjFGlt5lhs6yxR1LsT65bdcH5S82WKvu6ero5hzYlQI1sZ09/?=
 =?Windows-1252?Q?nGWnjnwfY+sxr08H4o9mo19ssyzJ3NZbGYTrU9xrdmPz6tliysjpmDei?=
 =?Windows-1252?Q?0NAGMic+Bta+wIIKqC/iuF5PmVBezcyuhEbt1laLS1ce6TXO/xyINP5P?=
 =?Windows-1252?Q?NVCHQ+QjTRVvPJzvQdLhWepnfI60hYIMXmeXaQ6Jb+qBYMMjOStT6UsG?=
 =?Windows-1252?Q?Rtnyp9h1WuV623Lr+ny37nMroftaXrOErUP5AKSYV2IjD3LOvt/qSYiv?=
 =?Windows-1252?Q?Qg6voARXDT2oOYca3W4wTAnjDFPlcvZOZSuIJ0EVZ11c5Iz9w+1LSMN2?=
 =?Windows-1252?Q?aCMLvLFmQw27XsqJkW5eBeU3MvZYv2JmWksPPci1ULnMNLQN3WvcZoI/?=
 =?Windows-1252?Q?VN2kmbi9XO2oGcgVWHgl4sVzKdTVpshF7oLoVIhcocWcHBQD9A/YQIX2?=
 =?Windows-1252?Q?QZ/k3czfSy9M8aohy/ZBxYFFVlMrrppb8IYFsjJrFRaXYvHX/2r1BnWD?=
 =?Windows-1252?Q?56zS9VY7SPuLT4cH4Y/GfhlpOgpfdkr528efrp5BvpfvceNaL7c5r+LM?=
 =?Windows-1252?Q?xrvfYatnHdU2xqRPSDZVcKk+u0DNe+doEcLNjsi10i0IKjrP1mctheFH?=
 =?Windows-1252?Q?IXs/AeHHTe6VKG0uWdPe5tGZx+gy/aCUr3T3hJ1Vvwnu/KT663y/IJL9?=
 =?Windows-1252?Q?3kual4ZWTHPemxCA56uXyuwD/BbvQL3QOkDfYSEhI2Y1097s5n/DFoFt?=
 =?Windows-1252?Q?em+g8rTdPr4QOA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1906407-3f2d-44d8-3d44-08df4d2846dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 08:19:09.2198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1cd60003-6c4a-4fb4-8b26-bb476dab9c06
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFHCZtgjEXpP0SnZk3KLBXJm3WdZ8Md8WRCxOQLUs5bg88eckfzY1r7NUTGRc+bW2kv3Z8ID6b3VRB5oDzLw/F+9i1q/JG+O9L7M0rnI+t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1332

Hi,=0A=
=0A=
Following up with the test results for OpenWrt PR #26597 on the TP-Link=0A=
Archer AX55 v1 (IPQ5018 + RTL8367S, 2500base-x CPU port).=0A=
=0A=
Setup: OpenWrt snapshot r38565 (kernel 6.18.64), kernel rebuilt with the=0A=
PR applied and nothing else changed. The rtl8365mb driver is stock, without=
=0A=
my two patches. Each test boot is a reboot with the switch held in hardware=
=0A=
reset (rtl8365mb unbind before reboot), which reproduces the problem withou=
t=0A=
power cycling. A boot counts as broken if the router doesn't answer ping on=
=0A=
lan1 at ~50 s.=0A=
=0A=
  without any fix (earlier series):  14 of 70 boots broken=0A=
  with PR #26597:                     0 of 40 boots broken=0A=
=0A=
Fisher's exact test, one-sided: p =3D 0.001.=0A=
=0A=
The PR fixes the problem on this board, so please drop this series:=0A=
=0A=
  [PATCH net 0/2] net: dsa: realtek: rtl8365mb: fix CPU port on HSGMII afte=
r boot=0A=
=0A=
I'll add the AX55 results to the OpenWrt PR as well.=0A=
=0A=
Tested-by: Juraj Sladek <juraj.sladek@littleit.sk>   (for OpenWrt PR #26597=
)=0A=
=0A=
Best regards,=0A=
Juraj=
