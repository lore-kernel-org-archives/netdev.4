Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604136;
	b=d0/p/HfblfRycIzJKwkwVYK1lDDguQe4li0w4eZMf0KFAulGrtzf2oh2/cYlbvra3TdW
	 aL4GRZ3vz5T/7KrYDKhGtpPqHJczCS4vK8/bc4wz1Acn7Uc4Hr2z26q9hMBHlBlRnG5jH
	 4x3bG9pcHvfTUgYBcJR7NqxVNA+zEvtCnm7r78q55vPqk54t3Bh5aCmPkTQUXb1KFntwt
	 qD7FgPVcaKzslA8z/LPLUYaJXAUa0POVW6Mc3R0X9ghIh9kL/R4n6bVzRwMb8+A+uuHMQ
	 chh8WsE1CG5ojqbKB9FnizGhRbrulj69fY1nGE3dSifRkq/+NJHKU3SJe9bmkMX4R0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604136;
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
	bh=8AcIicxcH1Z8pzQn+brgoOty0KSrgcarxfJsGiPDBlg=;
	b=OKUTp5HEi71iqfBR/7HMzTTGf0qftl8OVbBjzS6R0v7tiR9uY7wp+iDjBEabblQeDy1z
	 vO+Ofx9ec0bSml2sVRTRPTST2JoG9UIPN6Q9yqaymwr1B64lcsMJOZGQZR4EB1DdLiM/G
	 G5kgSmamfoThatia3Sgrv0xDjVnciUmKHDwug220CXjyieonGLNGaxidm9nL7a8wTid29
	 B6Qw6S75JH135+xz4qXMeEkPwP5hH/Bnd3rpxMGiS9qiq4Xo59HMI0VYfCnx6tonW/q6p
	 RcP3xpLluKoxQjBo0udNTZCDQWH+ZGzDNlW9GUiOxzwc2bAkKHNifh+VD9JoE9Ns/Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=eckNx8Fb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.43
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0328606A31E;
	Wed, 25 Nov 2026 10:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0328606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=eckNx8Fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob4k5/q0hNkLiX7+OBO9BjeSF9GskMZc9sRwW3eXcCoikrz0KOBkyU2DCc+yqoiGegyZWuJEv5lJMVPK7e2Ss0G86YitVCYYHK/Gm82vS55r9XSzRpvHaviainqXRAeuOqPiX8swbZxyOJl7FHJCxJhoEjp29GW85ho3A73NMPByw/TanoZT+7XoNXZEZvkqmus7Ysze/tFyx15o9JsJ3B3wKhJ0Zpd/7QKD/e89XD/lfOn0WQkzm84AFxIU6X7tRpAfX906h3LJKUCG/OYyMupBDgjj84MfvH3SaXnPjdKPX5+zbn5aTA7t6Vkau8xruao1xtdLnPM/mdvbOGwPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AcIicxcH1Z8pzQn+brgoOty0KSrgcarxfJsGiPDBlg=;
 b=wCUJRRFZl0kSQMC0QYsFhucM037gy9t12aEPWarLfodgr2WFLaU01mz9q7jY4enTb/PvpUGIxuo03qHbLwUHVXZaf/XGSjUOmlivLm1Tvpj/9U4rdzIs7sFZb34mQU5EfbEPu9ODMZFf7OTPcuQxuk80OtZ96sniZ8lCLP/qZo53whkuqD+FQO3VU507M36/f3E4jyAGQeAmLpMHNfLGG6fEQv8/WpNWuUCwtOpY9IqqDdqzeRqDPJr2Nvqytp2xLLcLVMQue/DFxWgf07bk/eG64KsL4n6MRujC9FsS2rSDa4tAof0SeYrGOwj2F4th31XRZ5HjSP7sse+Gw91ozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AcIicxcH1Z8pzQn+brgoOty0KSrgcarxfJsGiPDBlg=;
 b=eckNx8FbbQEsjdkzTE3OKVJ6ACJ7jRQpTpASEGltStWfBCZ4TPQLLQeZwT2LAec0GC2dxASTg6T8jjrS3e8rnPYIkAM1XRnfRXCgeOlFnb0m0ef69z2DvtSjv3gmfxt5PM14jlPRuxS/cuEfhYHqcBkRbO2GYAHI2MKLlkPmAhLo/8SCcuD7yxib30mD3w9gxXKG3LiCWVOUvAPhjT5WZXu67sc3w0YElx86iV83rbWU2aKM6GpuHDEzOhd+oOB9LBT0IXya5cO1qyqvr/TxxCAgefYS/qZ6UvpPsxHjor42b/myCPBeo0AYGyEtIBgi72VekWK8uXLZW5ipmAIw1w==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DBBP189MB1195.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:55:32 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:55:32 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Andrew Stellman <astellman@stellman-greene.com>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net v2] tipc: free the tunnel packets when failover
 tunnelling stops early
Thread-Topic: [PATCH net v2] tipc: free the tunnel packets when failover
 tunnelling stops early
Thread-Index: AQHde6k/Ykr8EqXAW0CYeXdMhy9Ktbc+njnQ
Date: Wed, 25 Nov 2026 10:55:32 +0000
Message-ID:
 <AM7P189MB11376D620F12B951259B0801C6432@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261124001740.83267-1-astellman@stellman-greene.com>
In-Reply-To: <20261124001740.83267-1-astellman@stellman-greene.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DBBP189MB1195:EE_
x-ms-office365-filtering-correlation-id: 909f6786-5a42-4c7b-a256-08df4ae2a046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|38070700021|5023799004|56012099006|10067099003|11063799006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261009223027099003|18002099003|6133799003|22082099003;
x-microsoft-antispam-message-info:
 0rrHn5qZBPeqUkfYO52rOz+9b9N1V4Wq52VrAkxUbWLdycQk1EzYEzrrxKmFXfpvJCkAQPniMJ9DS/3HphV+pdzZHutyvCEfkOUQBTf66vOxfFVfEAtGiNjGeThArgUJdeljxUjhJTfjfXUlG+kNW3i0sgNtqTk+/cP3ocdoQKOQTSz3jUltUTztn76iRkI+QPk7vkr4gLoVfovIblfjHAfhGK/ZRazXNc2NeZ9zsQDp9faT8RY4KxIeN+EyeKT9vrdM9weLpvrFUc7yAiv5RpRpSpY3m8imtRWqB9ujx/yx570KNUQCb6sPyE4jlXDIB0CyUjNOuEOOdT1NGsc5VSZBmZBBHXkCSMP7vVOM1ZAO2aLSVRGs4uCcIohPlmZIIHWkIJDVCVoqVwDbCfKXaW5McCpBQldtXhEFuzs5qRrrRsLoVFBsL0RVK3Z6hXoAlBGNUsBY7fJp4+fMQtwgeBht8zL+FeDekzMMulwmfcCw0pf6Tjj3p7dY8mdgcAJQENv1omHpk4BKk4T+kukMczm6xZoCRgTuywh1sywIMNHW9CRYBJ3wBx+kTeZQZpnrE8vStp2wi7UT8epYVN7Gg7bCMsm1V5inX9utyvXpgqntSJBnnDaY3IuqS23D0zjX3ixqb3Rhvz8Zvnn/71N27ro87/ndruHNSF0QjiAQQYOJmw2NPX2AEd0HVgPxftuCJeZnAUWaC7xo2ct08HYO0smfhyNJMRnDeM2E5x9BDDs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(38070700021)(5023799004)(56012099006)(10067099003)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jvVNg7jp+0DPgo+PWB3gt6PQpZLepBdspNSeTdeio7TVql5u6Tz7o1RwkSiu?=
 =?us-ascii?Q?pugpLDYZH+4gbfKokxKbTeX+okwXTyHmK4mZi/wD5BWvEm/hD9RnVSWe8BUh?=
 =?us-ascii?Q?Ta8QlM2WQw+wnu/KTlGQw5yIE/nS7Sqz03oSLidppiNDDuTIlVsNch5dW3gn?=
 =?us-ascii?Q?tcYagqaxJu1vpshlhDDrDuiguYrJynzRkrYdrvW231vDk74kd7Gi4rTwh9ZN?=
 =?us-ascii?Q?yXe/uyV5WeF0Isdl7NqMZdgUkfXkrsK/GJV0wJF2IMhmwTuyWngCmCBEh4Fa?=
 =?us-ascii?Q?ovRP5GpH/kZv2OCrcenC5sUt/qdcdl7BbB3plJhJdf1n8mOdt5vF/lzJ0vgA?=
 =?us-ascii?Q?bOhBn6rvXI4ni1KTryPP+KPVqm+lAi22iOiCzcsrUR1rGALGwFtZwFJ1nYK6?=
 =?us-ascii?Q?6w1oRlZDez9DwEZeDZu76z8MLXZObsbiK6S8eimRh/jXaeO2HpGvRLDd7raP?=
 =?us-ascii?Q?1EGU+tlN6tf6HI/OMo+vbYUUPXaFTyJ9KHQ/4HovQDcb7vm8r1X1PTl/t7vC?=
 =?us-ascii?Q?Iglo36jlH/lCTHKPhhjUMWBl9nCfjruQD2u2cDzJoHBRZ8QBueEb/BKB9B0s?=
 =?us-ascii?Q?yQy8QywJ9TiReeHSFBGyxgA191CMHfsJ8Bpgge3ilMn6be3AQqB8r5+gSK/s?=
 =?us-ascii?Q?5zTm9wuuIQOwHbPS8UKy+yPNRmN/fQLOTKqMMAzSrgheIJpu1gIR8PLvQi7c?=
 =?us-ascii?Q?yyCDtaYZcMh1ILqqRreZy/hgCpE+Af/snbsTlvs7CiTLtFf1jqg4Ab8fRcNI?=
 =?us-ascii?Q?21majw3TkG21XVUZLF2mb1jvrBeCI/eppDhGWUzqDNazo80/ILVXEoHA/4eB?=
 =?us-ascii?Q?inNeKIP3abhDnSGp66tN2wypq4eB9HWyYYcFXMcCwNVg1OoregttxXla9Ka2?=
 =?us-ascii?Q?/t2CdTvuFmV4wmA/QgrrwEgAb/GiCCI36Qni4xe/cnYZ12AgyVeacFvRzUGU?=
 =?us-ascii?Q?SZIDqjX+ouGeEWH0Jtk9WRNNTDHpBgNkiALTNQikKw4085UQjovTpnO6s46s?=
 =?us-ascii?Q?pXPDHYasR8QCAAgtD3GIXRpPsewXnbz/Cu9FF91KrTedbUtbm/WI0SHdg6C7?=
 =?us-ascii?Q?ngNbh4QOedDjH2oE14Kbu/NjAi1e++vxdGQw7IY3w/G5TSdwkJqkLKmwleVl?=
 =?us-ascii?Q?WYmnPGL9rRzQSD67Ts8QtaCCzCph+bXFRN7AmKnmGY3N+wWF70ao2gcy4Qvb?=
 =?us-ascii?Q?46AqJFf2oVeUXeX+LwBKseYz94q5Vh5yvjK4gfS5JIiKeFpDhJUYDYJXVGZN?=
 =?us-ascii?Q?EwpyLNUuKts08mr2C1NKd89ksWSTc54tydCuUxZmK86D1IJ6slmNVq8bVSe2?=
 =?us-ascii?Q?pi9kO/GI6OIiA9JaY5SUKYKCtg72ZxUKDtCieKv6B7ppplmNlCAbY6JHWUTc?=
 =?us-ascii?Q?y05LfTME+4ePaZhBP0Z5INlAdawztJk4XVVbPNfl0Hb/lNggIF8QlsvSHWUL?=
 =?us-ascii?Q?rkdUA8btRC9/2jo22sMmZ8ViUWMwgFeFg5qtZl069+CLT6HwNLlhdHHHYxOs?=
 =?us-ascii?Q?sui2pdgahWRGJl6LkhGJvjrHDEjh8VuTifehXBljZPJ6zWwyFvzl/OYgLvzb?=
 =?us-ascii?Q?FkONBbGRrFY5KXkfUFLsW29qwhbsrZj5qYZ+omm9sHmu+iJyiWdmAe3BBh2m?=
 =?us-ascii?Q?ls/DrhT39PcAed8gi/ZaQpcrPOlbj4sX4KYY/tyf6NoKBjWdjHKxMRW/xYFb?=
 =?us-ascii?Q?D9KP13nOpxZHZOS7QT25gooT9jR5l5ix/TWgDU+cJmRdy6OzgBy1YiX54XMN?=
 =?us-ascii?Q?kCtjxaprFQ=3D=3D?=
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
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 909f6786-5a42-4c7b-a256-08df4ae2a046
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 10:55:32.0992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlyqQ2COuVeswHdarwfFpsx9GQrhYaSK4ZEO/7IwK8ymp0u/1+PEYrrquN5oWshjLB9E01YdyipcxcrhS/xfMFiaV7Pw5VV5NgElSwCJCC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1195

>Subject: [PATCH net v2] tipc: free the tunnel packets when failover tunnel=
ling
>stops early
>
>tipc_link_tnl_prepare() returns from the middle of its tunnelling loop whe=
n a
>packet does not fit the tunnel link MTU and the peer lacks
>TIPC_TUNNEL_ENHANCED, when fragmenting such a packet fails, and when a
>tunnel packet cannot be allocated. The tunnel packets already built on the
>local tnlq are leaked, and for FAILOVER_MSG the receive side hand-over at =
the
>end of the function (drop_point, failover_reasm_skb,
>deferdq) is skipped.
>
>Purge tnlq on these paths and go on with the hand-over. The earlier return
>taken when the dummy tunnel packet can't be allocated leaks nothing but
>skips the same hand-over, so take the same exit there.
>
>Reproduced on net (af6737b90668) under QEMU with kmemleak, with two
>guests joined by two TIPC eth links: MTU 9000 (active) and MTU 1500
>(standby). The receiving guest runs the same kernel with
>TIPC_TUNNEL_ENHANCED removed from TIPC_NODE_CAPABILITIES, to stand
>in for a peer whose kernel predates that capability; the sending guest's k=
ernel
>is unmodified. The sender blocks the MTU 9000 link in both directions with=
 tc,
>sends three 100 byte messages and one 4000 byte message, and waits for the
>link to fail. Without this patch that logs
>
>  tipc: Link tunneling error, too large msg <0, 2>: 4040!
>
>and kmemleak reports three skbs (six objects) allocated by
>tipc_link_tnl_prepare():
>
>  unreferenced object 0xff11000004d34780 (size 472):
>    backtrace (crc dd2ea0a1):
>      kmem_cache_alloc_node_noprof+0x296/0x3a0
>      __alloc_skb+0xde/0x890
>      tipc_buf_acquire+0x1d/0xe0
>      tipc_link_tnl_prepare+0x94b/0x1960
>      __tipc_node_link_down+0x4ae/0x13e0
>      tipc_rcv+0x2187/0x2e20
>      tipc_l2_rcv_msg+0x1d8/0x2e0
>

Can you update your change log with decoded stack trace ?
(using linux/scripts/decode_stacktrace.sh)

>With this patch the same test logs the warning and kmemleak reports nothin=
g.
>With a 1000 byte message instead of the 4000 byte one, all four messages
>reach the receiver over the tunnel with and without this patch. The alloca=
tion
>failure paths and the skipped hand-over were found by reading the code and
>were not exercised. Apart from the receiver's capability change, no kernel
>changes, fault injection, debug code or delays were used. There are no TIP=
C
>selftests to run.
>
>The issue was found by Claude Opus 5.5 running Quality Playbook, an LLM-
>driven code review tool:
>https://github.com/andrewstellman/quality-playbook
>The fix and this changelog were drafted with Claude Opus 5.5 and reviewed =
by
>me.

Please move above LLM stuff below "---". It should not be included in the c=
hangelog.

---
pw-bot: cr
