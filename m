Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794971087;
	b=5RkQwDTheoXnZMy+C0hhbH6gZTSQL/Nhed+toxbuuYBYx/g64dk5pewPbxPtG9WIxVpv
	 b5nbN7AwLqzw9x4eiuKjK9P2bjzhaL6Odtvg27pwbjU5pzkijS/yqxWowdsmvQuBl5Kqc
	 r6WsqD/XRFPzSegmLAEZfRC5GiqJJ5nvkBc+j0gwskiGMxx8GuMtGwqbuC9b/IVkEYtYX
	 o8Ujbt1+4GSuDOyCXPl/glNl+9O9cT30f0YaMVY3SmLsLVaa6UyDHxqG3MQJZ5wQoLe+G
	 b8O802IIUBBdKmaFDpi2qrLeu9oE3M/Z+W4KQS4SwLs5PJRx8wqqpf5OrJZ9QyY90xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971087;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
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
	bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=;
	b=Z7W5yg5a6MC8YWdhJV57ePZCLcuR7nAuizh8ZFq+YtLrpxRORRL2WTichaRl0uOtXtNR
	 JjpU7OJxb46ZlV0iQBusdpJi3FnhzXAHq0GV60W3DZM0m2wXEoYaII/JsE0YD/8jW1FlC
	 adpfVTJ0XhxWtAV1qHBmhJV0aFU4friJNXF28IhfYZ7KV5tuKj05NQbPIiWsvXi5L6h1k
	 /gj6T817fkz1/W37dwDBJ8lfFrZqWoDPCBBGIsUP05y4T0t1tA4A9w8yPVVvCn67Hf/Jw
	 KfvjBKY4u40BAAGT6kc4N+wg4plT6h3/a0FsY7izARsl3cds0y/VSh250SoDHccop8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=hl8lOdqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.48
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013048.outbound.protection.outlook.com [40.107.201.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F81606A31C;
	Wed, 18 Nov 2026 03:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=hl8lOdqY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n++J75frY+ZrOO1zue+BMq3ZJlNWjXSlkoHFcSPFVjb2/ZDK4q9ArJhK7eqYTns1e2KCBWRQCJ4OADwPcH08muxSnlEBV0LN/24nx71NqWNzzuhblOgbyz+fc1PA8k57Oc1LNL2S1hg+0gE5bfvveCYoxfnGxxD1RG9W3sDmliY6PrE3wc8AvCEcAsfV95QfJvD8qSbcvNsSYEOuONtPDz/C9UFjbAzfiv/ZivBIH/K9z3gkMfLwIZ/2qbYAUTnCtJiRLYa6ZLEn/aNc55HlsKIcawLeyTl3OL6SXQZRFuvOZbk+IYWvlvkPIGQQBR7eSA6H2Py2cVxzf7qic1Ilsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=;
 b=e9qBxZr2kCapSLdoKhNSk4ct3BLH+zc5FA+5PU83k84+mfF4c6vEoyt+ZiWSf4VCWRiqy4JOksHkyf0NGw3Eorj+AXxqDkmXnq9cBu11IwK3goR6WvG0VVDJ5mpdcmXoidnAyUk+qJALonuLIGEV3MNe5v7BUlGfZZFLVULJP4eoMAwwUFKkHJ232OKv9nmeUiJTHQ/YVe8fTNrc5/lpV28rEyiaXKfGU9KZPzcm2pj0SjVl2/VOEr8wk9VGtJ/vd7eUI9ZOA118Rrm6QEftfHirouo8XNF4foHLLKQXMtv9WHY2/znL6pzDzeA8Gz1bBrM0s9e/3RZxGDhGAgBe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=;
 b=hl8lOdqYFisLLTqHuxMJlAHVb2dsyUbqNxTB00DdTydB8VzEAaTtl0x3Yb/DhKBzcppo5GCwliPj64HwSYM+IF3oWcr51aY4Vb+e+00u3FiZAsSVHD0Nq+7ig5HdFJoMYuNTxxrYznIRCPb83Zis21kgz1+USu1tsgBZM0EeIBmOylrFMq8TqkyY147bHT2qIPI/kGTGEa6B3uB45Jlp2SaHnnIpEkOnCvO6q7wePSCrh/NR4PrfA0WSvQifoxGg5Q6u2pZwb3qkY8ubCFHukfZKFhhK5PKy+GuRT2jRV1JzN/HupwpF8TB+Pp70NlE+BbJEztjmH+6p0lPUys755Q==
Received: from SA3PR03MB7187.namprd03.prod.outlook.com (2603:10b6:806:2f6::11)
 by PH0PR03MB989122.namprd03.prod.outlook.com (2603:10b6:510:3ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:04:44 +0000
Received: from SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53]) by SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:04:44 +0000
From: Boon Khai Ng <boon.khai.ng@altera.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Topic: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Index: AQHddqIIvUOcjPI2HEaczr5Ryubb5LczJUF8
Date: Wed, 18 Nov 2026 03:04:44 +0000
Message-ID:
 <SA3PR03MB718781F6FF6BDF9B74F5EE18B47A2@SA3PR03MB7187.namprd03.prod.outlook.com>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
 <20261117-571e631490-net-1@mail.sdu.edu.cn>
In-Reply-To: <20261117-571e631490-net-1@mail.sdu.edu.cn>
Accept-Language: en-MY, en-US
Content-Language: en-MY
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Enabled=True;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SiteId=fbd72e03-d4a5-4110-adce-614d51f2077a;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SetDate=2026-11-18T03:04:43.442Z;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Name=Confidential;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_ContentBits=1;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7187:EE_|PH0PR03MB989122:EE_
x-ms-office365-filtering-correlation-id: 2c67f020-0318-4068-aeb9-08df4520b243
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|55112099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 KzQulhJEvoO0MwG/CVM/ROt+QFWMBMkq6cEWQ9N/JbkoEI0t8PmrjyszU4MEWvE61oxbMhuYTV/km2V3TQw1Tz3DqQ/CkuaY2mkr3cpzJq+ZwzYgqZ/9oTMw/W2N9g3xI2HYK4JRJOzIl/SVQXx30eS61yloWgu3pviP/qUVypOn4TgHBqxrcT00J7cCDsPnMmDRTaIck+whgbtQv8UZc+tgtafDtiIjf+7zhOii4Qu95G83eBbMWCH9vz/iZo19Tkcq6K3zXxzclbwV13071lIXZrj1Ae/SHnm0Uu8XfHERqld22GCuS2YaFFHLouxD3VugMA9TxVVMeC3/CF/SipS76TQxwNc5H32pKLkr9xpUmKvsMoTV2OG1q6WcbBtCxarskL2x/KY9ilrjVH6yvGeMiY140qEAU1HfKQkaw3XDnS6d1J3GXQrGjo0H+KbgtLvmXzK6I+IMYeVKuLlSzTBjxvV/qyRwus52aaewy0LlYZRR2lR/yKDF60JaoSLbJ+aAIzgmeCHD//KEuXHMzVuxIPPX2A7p23/OoVcikyb2YkhEFhjEg6DbmVJmazImtwYpKlG5pIHVQyivvLQFkoUJMsmsnDR7j0fYp0KBnDx0gkKEad1Xywq15IWqC0Pr/qASrognvEJdd5b0azvA+cXIznq9Vt+3XNIPzwSR+V02mG9jlrdbCS5qu5GDhnnMX6XsxnGLeJNJU3lUkiGkahk33u+OsIgrpjdXOWpz4TM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7187.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M/8rxftIJ4boVomk+Taa8+Vu6fdrAih2Wfzap+kUNYm/W6wCVBWMQ/n3hE?=
 =?iso-8859-1?Q?81BA9MIXbQWcBs6mMfDPuOhLRPI1ntlyZabE739Dc0r7EhVaVp1SR/UCNo?=
 =?iso-8859-1?Q?4sQa5SEWewCQ/hbYxt4oZTPPpGvbs7Amn09BiIhBdp+MsSjToLc2aPnDec?=
 =?iso-8859-1?Q?3Vg6+vLscIwz4WTdu7W7sLFRxMghEskL2zRyNhMoNf0crb2NmrSl5Ut/gG?=
 =?iso-8859-1?Q?C/7KgbZ5czvLYXlo8xFPFabyDd9Bqfj/xUYk2MFo8/jvAUTtPc7MxeOXzj?=
 =?iso-8859-1?Q?2QuWsgFODGarR3FOQNInMCXEJHENu0rLznCnWHXPpFN8QnR82MoCUiYDY2?=
 =?iso-8859-1?Q?YeoEyVlfdIVmEVq/qbHnq+PzH5LITwOJjZVUwuSK03sU1d0+ZFNGA2ueiZ?=
 =?iso-8859-1?Q?8BLDP/SyNl4hOQmubQBbuDIVvRmvogLJsYG3VA50xPJBjz45XgzQdBZ9Ek?=
 =?iso-8859-1?Q?U8GDWcO8XkYIXiSueWh0OwEI0jWgeHTp7DNGTKzGQHsawlZKjAJLvueMvj?=
 =?iso-8859-1?Q?UrJ+mYvy7EYbQSS5iviVWFxeGD9RlZe3S53qx4OySLoFAPm5rF+XJfErJ5?=
 =?iso-8859-1?Q?2w8iduDpLYR2fQS1hc0DQXhSKRkO1+YhWvKtiSn8FcuA+wVnbsb0x8VC9Y?=
 =?iso-8859-1?Q?UBJ7JGADYj6s8SEkIzk0ja21g5AMIesSPDE8CXXh/8ByAwp4ftaKI/Ekp3?=
 =?iso-8859-1?Q?QwgaVmnpauULLJDx981CaHVw468i+tx18RzfcVIeU9W5pHhRvFVAjoUnE9?=
 =?iso-8859-1?Q?g8DaNSRDjET4/MZ3LDjRLQPt+nV9NRCXQVszgv0odraK/dOp2OfcUTGFUK?=
 =?iso-8859-1?Q?eDEDJUwvvHwawMcI0o1REjPxApehuY3eOWA/KZA79jfRTLmaGFT2IS2Tyt?=
 =?iso-8859-1?Q?vHfEl6pXe5lsbKsf0dJuNw+ZEDtyurVowv6llx/CpFDymb2b06TmlchJMM?=
 =?iso-8859-1?Q?ewSOu+I7RoIR6jh+3yZ/JIf9yLqmeuTORtVyhUoKzospdki8UDVoxDqmOE?=
 =?iso-8859-1?Q?fRJagENHdxzrE7qja7g+UzVk+LKRNJXuovwa+vYP2LpAjGPxty/JuTVnRp?=
 =?iso-8859-1?Q?c75MWS21MWmcA9rsUoVTlbPmWB7sk+uAMNDAz1r3kkRbz+sJCU3srDHCt8?=
 =?iso-8859-1?Q?XhHPYXHtK4tm2sO4EQP7cvYfUXF9fZaWMYO+HhXTjorTVcXqpMVUkwKB2b?=
 =?iso-8859-1?Q?so8g6/EykcWutZTW7xw3Pf/9B0nuZUF2qJLywJt7P+VkbBSF/U+1fcGY6w?=
 =?iso-8859-1?Q?Y1BR+LZmvPmENEQxBbvcb86GrJulRVyz7ZjRlqH2LU/029ClblmgjHrcZM?=
 =?iso-8859-1?Q?xiwRLr8qqonW0SGBZbdj1owgtN8nniJqhJOvliybFggWDjKgcgk9lGqoGW?=
 =?iso-8859-1?Q?SQ/pV7JvU0DDHVHkJIl5W5fsl75iUTemu1sWWdp26nNputG3+EX83Y54Qy?=
 =?iso-8859-1?Q?150XdlH7TFTzvw8ASBVy141Rf6wy480iihniQ4zmk2giwkG8hH4MxP8ABB?=
 =?iso-8859-1?Q?4+PY5gsRZb+yJuUP4i4RWURWJ/OtyPz2p62KfTzo/jLten9SvGV6c2o/Hu?=
 =?iso-8859-1?Q?JdR8KAT5uNCnJZzW+ef7k41XJt/+E0696ZYMo4g6n2XNBnxFrRYIYEBNO0?=
 =?iso-8859-1?Q?0XNKRjejNEfenGcuAUUpOIoGwbbjvu0yiAWx1rF6uEs/pveg8Rn2CpzIT9?=
 =?iso-8859-1?Q?aGvGqDprj1H7YaYgfyUrmIvOny6Za61PCIfmjnVulgHDK/9aXvdi6QT4zU?=
 =?iso-8859-1?Q?IXYDQSdyRS6x4ikSlP1qQUqPst3OhVqXjgTC2B44xoNHfEkVk2RTJv2pAG?=
 =?iso-8859-1?Q?gb1IwhsS3g=3D=3D?=
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
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7187.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c67f020-0318-4068-aeb9-08df4520b243
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:04:44.1643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqcznYhLbjKlZN8JuI3sqbr1CMEgc7ELGA/BHMeZ59Z7Lp9fKJRKWLLQcw7UqYPGiBwBPwCuH6XOkLvWm6kvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989122

Reviewed-by: Boon Khai Ng <boon.khai.ng@altera.com>=
