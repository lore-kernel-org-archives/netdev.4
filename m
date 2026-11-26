Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682171;
	b=mTZYyh3TndySMGf0H5tWoVi1DwrbYX7bWddm2xrAYb3t1owJ6u5ssAknuk/xcVMK1eQr
	 hzr/l8UwESuawwiJ1BrKaEEyBG1TxNMGDWB/fa/C3u6/tOcg3qw9oAPfX2kv2k/PyXnQz
	 ruuLRgHG5DN5vab1GoLzRD1LL4F+GRKQCn8CDNBmrUDkcQ5kRlG9vbeTjN78FEUy5y1g3
	 vt3ALRqLn7IxT5f1m5cmaMtP7YMXuUZLkSNQj1ojy+XyNz1U6Ck/YDlpkO/iq4XjH/hbm
	 h68PsHs16OqdthLmNmJmQhOU7iRdMu908Qr8I90u5VTlpK9U6osKxghhYjGX4prw4HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682171;
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
	bh=iWQN75A8sKZL2hOSa5XeQ/fqcERSYhCJR37a3F5a1fk=;
	b=5mkMCKW6+VChn4ABJ4h54OWvT83AHmWNjLjYHS7YFs/t94B8iw+3LsFzEo977CM93SqR
	 f30Ax9qZY+uR2DnJilnSl5PU5Sho1urJ0r7Wq/NlZHqVW+tp7mjWKqElGPce7V67S2QpP
	 ubqUXz80rPwzNdBwj0AnIusrV6wmG8+1eXx4r3OJHiH78RIhAm4v4KvwXcXRCmI47Ei+/
	 B8+xOxDquPtfR2TeaJAjaPqx174tGO4U+n6Nqh5aTAA0MU1V89x6is56gJojIqO1DpwAt
	 ukHHoM9Z2X+IvjwfJctDUlNH5nMboQ8X+WoUeXBHnJFvEzDuwty5s0CR1sB2aIyTUvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=zJrzelS0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2479606A31E;
	Thu, 26 Nov 2026 08:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2479606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=zJrzelS0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcqEqetCE6Ua38JyQtUD+eU7BvHx9XvoLQ5WOZdI/rdsciw8mqPlzIMDzKRsD3rfKol1WYfKLujkULJ2AMWsecGjFx8OsyDqVIig1cmtgGzPdl15Hflq0+iyXiEqWcX/F9za07BJvTkjK47gQ531n5p3l+IMd0Mek/H53S6FETudJ3SCIf5fxiP13uX4xh9uWRKKzzlQtBE4ahugIz/jXeG/vIOdkec204QjdGmpwIcodZlsdDvVrIp1AqCkXBBu2HLbfPMt+JL9pa98VF8A1tpiMud6ht04jbhuvj9/5LOvervpwcDTjlUKAGZ0cKHTgIqveI9zL9w9x/0wd94LVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWQN75A8sKZL2hOSa5XeQ/fqcERSYhCJR37a3F5a1fk=;
 b=Zw4oyV7YTKYJHmBcuF48VgirSeZOtlbEwE5rPR/Gv/7l92Q0tVu/nBi2PEBx4edjB7vscjC51rFoeWVx02Ry0BO3RWLfXKBkL03YnQbVFXxAEojWbQbnPqsgi58wRSzH4pWhCMPo9CQfPKOKXsfIYsy/Hizw8jBsnVxF8RsEWisE3i3+c+99TbCE6Gs9J0YCyRAe4BwsIaQpuM8nHDHrvLuoN5GvRgf7r3CV57ycZLlPTTn1OcJ+iALtuk3dSank0WsR/397593mLxWSjpZzdJ2Es5yB6xdZajSSTe8qacmk29lzFOIh51f/jRtmCTVWO/nD7zYodeE+OV3MzV55rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWQN75A8sKZL2hOSa5XeQ/fqcERSYhCJR37a3F5a1fk=;
 b=zJrzelS05YfSjc/INvJSjpcIVUMygK7W/KAPVXaefrdaJSFFndqK6/sQ92zQE/oXI7SemN5t1d2c4+rU10HJBo0Mw6HSAvElCV+putwpX3QFq1Jp6TbaSOj4RH2NbYWOwNU/CrQWfLmgapb1TPJBxOL4Sm29F2rxHeZgNeXldJmTGSsHroP8uh+YP1AZWx+Kb5PWAi4T7WbfQIiZqjNkciNU8y4JCs9jTxaKxnskCzljGAIeGd+65LYe5eg9ywaYCJ6sXta1HtXzZL/j3CD8Q33qzRTlice2gB1AkfXduk5WN1EBjHvEP+SnDrwO3pi6xO3+jYs5sVC3Ih9xOq5/wQ==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB4P189MB2413.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 08:36:06 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:36:05 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Andrew Stellman <astellman@stellman-greene.com>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net v3] tipc: free the tunnel packets when failover
 tunnelling stops early
Thread-Topic: [PATCH net v3] tipc: free the tunnel packets when failover
 tunnelling stops early
Thread-Index: AQHdfPU9XHQqk6jCVU++6AcD42rLELdACAqw
Date: Thu, 26 Nov 2026 08:36:05 +0000
Message-ID:
 <AM7P189MB1137C196F7F626007C9C71D5C6422@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261125155411.66090-1-astellman@stellman-greene.com>
In-Reply-To: <20261125155411.66090-1-astellman@stellman-greene.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB4P189MB2413:EE_
x-ms-office365-filtering-correlation-id: f9e0a48b-1bf5-40ce-a09f-08df4b984fb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|10067099003|56012099006|11063799006|5023799004|260925021311599003|260925022911599003|260925021911599003|261022075727099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 5ZL6Q6ERr5Rpn5tI3yEtbPmGd/ycDkxHIwTc2V9zoZrzExfzWwlUWd4PIF/dujDlUYhYF72kc6yKMQZ2Pry/de6ef391moI900co2fB+leVTmN4Z9C8pF3i04ysyQNKeMN5ILSEiPj4dRM30W8toJQO3axqqa4ufi30ahIH9kKo2f/K3bY4LdTE7OOYBUWmd1FvFbnk8/2CuSnKhxWP8Z/XjpzOksnLyaUNHHT2Tq7vuXee50tyfk3og91N8+hkTSntmvzyYe5AWuC1C3BxDValYu8FVu61ldLKjDt5V9dTbsNa/024S1e/+mENSPOA3KxNYHIntTowkXHXPD511aeXtu8zSloqSzDDylS5xwu2NdihVaeY34EX78+AMtI4f48vfh9lSPTfGSV0pc+s039iZH/4RHiVkU+qWF7XNj2KJP9m9Jc95Xvk46VKnFjYr+SJwRNqgT9s8JDcYsnEQOwfnbi36FtRl1zVyGjm+zCeoCrV9W4lYUGpkHmjFb7DNwAf8KaXFRPouX0yPfqYF16MutknoS7rt94B5ImsodALppUkfOStyyrilbbBv3JGFUgqfssTNu7Hxv7g8JLpbO45J+MkA5hT2o3DfNLBW25Z+0qUzdyVdWsvFeQUgknk9UKvh7gwQuvy95lzmUUMRz2d2MR+GHjUQFjWP7ktebZCpdE1tkNhwxlzE1Tm261NqiURpEEh4Auu3Uq0uRo49HYCjXSRnih501GrNmkm9UJ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(5023799004)(260925021311599003)(260925022911599003)(260925021911599003)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fbdQlK/KMPCucOO416WmZuxBZf716ODfclV1PT2B5MzqhnO189ZftwbPtBGm?=
 =?us-ascii?Q?2S9CcoTgPoG5kzuC0HuiZXsnhsXPEDDQr2B8d6T8L05qlj/tUplgpT0Xi0Jb?=
 =?us-ascii?Q?xhVv8NzWbsIPeoTfBdpKQgjql+Mf6HxxgdUVzrk6jMFFWb5r9rgRbCbhHLGS?=
 =?us-ascii?Q?iX53dGe5UGbXkElJbjy0eMw3PCNQE2Hhmd2NqJriNITtky2K6X3lhV53WYrX?=
 =?us-ascii?Q?JoPo9j3Fs9qoWVj3IAyH9kDtCJI+q9vQ3iWt8mv/rHbXZQHyap6jobEAgT5M?=
 =?us-ascii?Q?t+iyLFE7DX0wjcqP+lVOJiDN/U1/xJzuHkFEVxqi/oKo627Klj1T5dZy9B1O?=
 =?us-ascii?Q?1uIUC7rlCQhCA/L9QI7sOMX4thd83woU4vLAemQwGYwfW1ECryruXjo0Lnb6?=
 =?us-ascii?Q?i6WNhQzyzj2Z7Mrb+UuoiSo+Dt8n9ycA4TY9T6HAeTGvoCe33hQF5IA760ch?=
 =?us-ascii?Q?0hCI63zZCRfuse4ESzleUevyMlLHtgU6Qs9ORWP0ZM0TG2O82bV/8iMV+6Oh?=
 =?us-ascii?Q?BuWQaIs5lg4qDGL5wi/h8WQ6lZcfmVG4CTvMKISVeaUnBmWwefORVpSTJWg2?=
 =?us-ascii?Q?XPAVq6PoTWoY/PRM1pKVF0sWmalAkL6hz51bwrzqlpOabXOU3/9ewBCLSbDP?=
 =?us-ascii?Q?owzOGsDm9Gh1c5vrvvxChjjc4B6CuUgTtKMQaYF0/hTP3+ec1pnkVnSGXlUD?=
 =?us-ascii?Q?sVdXJIo9Vfcn8G+geDsvfNKErlmcptgtJ+KqSU8U79ZA7c+Gz95saaw8XDe1?=
 =?us-ascii?Q?psMXAN/pAHkRDCfSeRFohB+MSJ6BHLlaeyDazX6X7B6OXC80kbqQ7kDtxGbN?=
 =?us-ascii?Q?LFs7Dq4xNhQrgZKKL+B0XTwaM0riP42EkplsxxAokgK9ppujXqyUhENOK973?=
 =?us-ascii?Q?0q2Qq1UMWAtNxatGwn73/37gY8CEuLOsBAKyHsTw3++FBEDtk5kr3J+d27SK?=
 =?us-ascii?Q?JJwn9riTXJSPDcXFuX7EbDHVlUp1/F21fSFsicEI1KMu+x4EVCefS95ybwLL?=
 =?us-ascii?Q?/dV7GsI/UwFqEfNp8jYoqlizFP9UAy7NmIMLd0MjqVhotnoccRlZ5Uxkprsm?=
 =?us-ascii?Q?fp5Ov5kpOunlLzCAqiDb8a4c/lQ/NttQTK1gHY5zhXcJkxVzNDAQGaaTSlWx?=
 =?us-ascii?Q?2IVUs0nDLhO3wzzy3l4WTO4hN/6xnFMvj3Nn6QDtINS5+7jjbM94RvZ2KNAI?=
 =?us-ascii?Q?q+IFAYucsIv6U4Q8IqgHiium4kU1bCd88k0wYHhG1WHFF5qQ8UAlraApNbbw?=
 =?us-ascii?Q?38vZhJoLHDMmeKjXT1Bm9OzZl+wUp5ZqxQ50cKFGKK3tME76a3qmcHiC0Qmo?=
 =?us-ascii?Q?8NOG8mAOb/+/R42EhAbjLVXnOx2MWgwOXzwwB8fvX9I8HyPy95DDMVYDoWCK?=
 =?us-ascii?Q?Vh4gRL5yKspYodKYBCzoQ+6vublBs9h5rl5nKUJjW56WQ1LDXmWBuNvDtZEp?=
 =?us-ascii?Q?BjtQFsp+A4wModHA0R8CIqToPD4qsZOF5SfoYgOSBN2HRosD61q8o77jSMbI?=
 =?us-ascii?Q?Cm2hTUNvIbg4+alAWrkedD9PcjoEIPB1FtBxGgLIQhlW6PxoolkMnx/FJP3M?=
 =?us-ascii?Q?3qQKDmB3Ov9KKM7dleJSkTZ3ftf/4VBntR6JDzndsKCLTp6HKk66ejW8mrQA?=
 =?us-ascii?Q?ym6hnD74DH3gT0XdbWgFG+lC0+u4TI/YKZXPmD4a5/t42CjizdaARmU1IvkJ?=
 =?us-ascii?Q?M6OknKiJj5AiqYRE1PQuWJDx0Dd9d9EQ8o7SwfGAloXQRzb0c5G+3+xLcBag?=
 =?us-ascii?Q?8M/I1X3cQQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e0a48b-1bf5-40ce-a09f-08df4b984fb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:36:05.3832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkCFjAIzaz6GokhIZ/nBhSGy5BBXlU6ek6ojPAc01PFF/pKpTwlhQTwZSwEALJAoL+I6aLFJU8lqBvOoJFcJY7i24eM2V8Ix9EDOqG2GNZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2413

>Subject: [PATCH net v3] tipc: free the tunnel packets when failover tunnel=
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
>In four runs without this patch, kmemleak reported three skbs (six
>objects) allocated by tipc_link_tnl_prepare() in two, five leaks whose det=
ails
>were not captured in one, and nothing in one. From one of the two, run on =
a
>rebuild of the same commit with debug info enabled, decoded and trimmed:
>
>  unreferenced object 0xff11000005117b80 (size 472):
>    backtrace (crc 539599dc):
>      __alloc_skb (net/core/skbuff.c:705 (discriminator 2))
>      tipc_buf_acquire (include/linux/skbuff.h:1441 net/tipc/msg.c:72)
>      tipc_link_tnl_prepare (net/tipc/link.c:2055)
>      __tipc_node_link_down (net/tipc/node.c:1053)
>      tipc_rcv (net/tipc/node.c:2008 net/tipc/node.c:2186)
>      tipc_l2_rcv_msg (net/tipc/bearer.c:721 (discriminator 1))
>
>In one run with this patch the same test logs the warning and kmemleak
>reports nothing. With a 1000 byte message instead of the 4000 byte one, al=
l
>four messages reach the receiver over the tunnel with and without this pat=
ch.
>The allocation failure paths and the skipped hand-over were found by readi=
ng
>the code and were not exercised. Apart from the receiver's capability chan=
ge,
>no kernel changes, fault injection, debug code or delays were used. There =
are
>no TIPC selftests to run.
>
>Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
>Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>

Reviewed-by: Tung Nguyen <tung.quang.nguyen@est.tech>
