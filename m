Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679051;
	b=GRdeUUfux1kv6ht6KmwCXR9+/KGyhRrBh9VB+wdzvyEyDWfM+L1aV1vF6xWnnS//qFkY
	 NuQP5T3rCC0xgaVdFtK3wOiDBwzUZw6YgnGHUewZl4FoaZPUNMxuPSa24gu+eKgrF7Wh5
	 Rhn+ELBOkmXeNW8TLgSTRAlRwN3p4mAUYgQtQRy08IaOd13hw5IT+vYI9AICP+WSxvjtW
	 ar3AjwDyIJV6RrKwpVH8Ztxj7qxrgtnFiAtQpEBaVIozy9Q2/fH4RRhXLaNksSLwIflUL
	 7TdbgDYCzU0oLW4FlasP5MsndVSLkBh1cihZoAJnOaKdfqGzY/bKQVggwKqsxAJWUfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679051;
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
	bh=9oewqHmfaiSeO1Jv7vUInYlZYX8/GDnCetyPQKuVHYU=;
	b=U9SE3HPlj8dIgTHMEPwzfV5CymwP7FxfY+kN/BmzXtDtYCkT3nPLNj45ErHHurNwUhLJ
	 kxkLCC4eCGAMjYdYodDNdsSBxHGSp4SZROs9cXPx13f1J5/u5AhkzvLSOgP99SOhR4MIk
	 oFqYKurK7LrWbSJLx8Jw1ixzk4L70Q4fvq9yFCREN+Ls+RH3LxFIt/gqFFJ3GBVy5BVsy
	 LCPyRdVg7FDe1UUhoZZY03ssMf5ieQXv+WC9knzvI5MjnpJ7QqVuEgQbA2a2doPQpnpAa
	 kIc1Wyhz3IHFOznf9Ws+wVuvA7OroxSiZ4jsZ1Tmas97jdLHjw8LyiEGILAi0lLQq1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=oNySyemV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.42
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76E606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E76E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=oNySyemV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjQUb2ZP3OkMtUTfH6mnP3YSwB7GfjFsJpTIE46SLHi0MpHrgs+30pt+OFrQ0pTZzcwNbDA/4rhK3Yb7y6itJHB4aWQXc3MK8QbwzZHPKC51gz2UVqidGIq6H79lxTBX0luEK3PNoNUbRhLBLjI+5f9aKBEwSqAmCvmNRCOK5rL6u7VSBl6GwoKyxSA2x7t2eLCwXk+3cqu13JqjyiCurh7hHTqnVBw5SECUfUJL0FTQfZiwTZ/nJSTprfjs4GT5TZ++gZpzo2lmcu+UL7wpBdn9qC4hiHQiL9C3mP4od5fBgYFsVDY42z82kd1KcFlBpQV2666Qsz1x/TxELIEUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oewqHmfaiSeO1Jv7vUInYlZYX8/GDnCetyPQKuVHYU=;
 b=rcHfRdMUVu5GmCn1dPyYT25KBkMd+ni/LcZtq7eE6iIHEXRVe9jl8VIqzQ5eGgtSAp0E90Ujme5FEAtf584q+ob7SoANvk7mHI6ivqyBflNQ6LL+HBMMAv/Fs0vs1TJ70eLrk8zwFDSUhfeK9HRJ8Hr1NhwT6EoaWpb6yvy4nzQpG2gUzMPBsR81QpOyKq+DJ94CSvKhFx6j8sRjksmbYkKVlZh+ZMIZdFZedA6CAMVIZdSJxr6/8VY7RV5QgteOwucy6pDOrMSOSZI4EhbO1TPxseuZIhn5a1hpcZoVDDKLd9HeDGbkKxlfhwCLCSqRZfPMabyDn3xAol6RaSF3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oewqHmfaiSeO1Jv7vUInYlZYX8/GDnCetyPQKuVHYU=;
 b=oNySyemV6K/snqApuvUcdcMqVaM1tS3HZvk44THu2qnGcV+xMXHTajCyyMCliE5ri8L9A3afoGtlMB6t5uLELH/zQYQpZttwJm32QKjeJKKa8cQYxuPQ64+GONYaIpRicrU8uOj2o7ZSibVzoAP7TIVK/B2T/9FyNgVYmj7GPqx5mb7TRSDjyaIEnRZIESJvm9Qwc2nmkTKnaBNDVS/5tZFhtnnLGWRKL58Qi8U7dnSXDUD6odlnISOMsJBD/PyHkZYFQDFwxey/+6ocnRz7wg9T0OvXQkcVZtxAz8PO2q35ec0NJIQ5L5ASxnn4nrEPXs+2J2VkEdKCBIkSXxValA==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by MMZP189MB381878.EURP189.PROD.OUTLOOK.COM (2603:10a6:190:3c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:44:06 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:44:06 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman
	<horms@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net] tipc: compute the rekeying delay without wrapping
Thread-Topic: [PATCH net] tipc: compute the rekeying delay without wrapping
Thread-Index: AQHdfBg/ROpi8iD1EU2JH05J7ZWApbc/+0NQ
Date: Thu, 26 Nov 2026 07:44:06 +0000
Message-ID:
 <AM7P189MB11379EA56DDFEFA5BC7B6424C6422@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <179552107131.1345245.11261172891282782083@gmail.com>
In-Reply-To: <179552107131.1345245.11261172891282782083@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|MMZP189MB381878:EE_
x-ms-office365-filtering-correlation-id: 1c659357-9eba-4ba1-6e75-08df4b910cc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|261009223027099003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261026140227099003|261021123027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info:
 ypCTQxGP5pTWUxP4zG+No3byRCwgRex40Pn7gZNI5wmMRkpmUpBv0bZJDwu+Y5r/f6SVAWhryp4Ux5Z9AWd+sRInUgN0dJ0/SkVGyINbK5qST/qWjj/6dZIZups8NMXnPpEvlf/xAbDZa7Fp/4SWrFsr5gDUY8pvh8B2MXXWPQydN893NxH67/95H/O/P4EahVvoRx3nX9t6g4pJCvef4XGlGVc60xxXXsJuzi1/XtYxk1okRM+VEBV1dEP3JD403tP9qRqUhs8aG00tzfkWjrhnhxKdnpG4y0tgq7Yha/1rWQawtqmD01EVNh434p9xdp21DG1pdE8Hmcz6M0A5R9U1sCd8YegnRNYIl2ZHc/zERA7YlQ/Ri1jtaOt1reaJ6bEc5uHCUA2GxzD/FXD/0RQictNlTbT9cK9deqFqJPjj1d0aUspce+0i7fylk04nGKZNKSSJzwWcqT65DH50CkcyZs87NyYdBdL84TKvQKTQeC8J/8Bh33u2CqXj/rh4HbNWRo9167H/vGmHdjlnSlkTB5Esboz0bCZW1dxnWOxQ7YDfIsB1bmfHrgd243Ke/xKOPf8uykiOU3I66PzY7pmB6E1I07c6MnCfI884wRMBHNtcr5WmvogljXaUH8/QzWnfdrX7UQtsTJtXwqzThMhkR7BRQlVERRBf6z1enmho1GHA5IskxpilRy9cpPL22n0rv0m5MNp5ayya62OkI64jl5mFS6fuv0g8afPSLnk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261026140227099003)(261021123027099003)(261021121427099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5qEvr6fzrG3I+2lNsDU13mFkzV4cNgeAlExKv18nNwLMU/E0HnhT5fy/OegN?=
 =?us-ascii?Q?pzbKAUKVuMM7XqKSd2k77lQwqPxsOoxH169ZUzjIT0wu2u/p9OMFs+2U+LHh?=
 =?us-ascii?Q?tuh8O1ojxdl1R3Umv0FALhhaVDQS3FfXTFQoXxTTB0Qn8nK8bFBLwYlYqbWY?=
 =?us-ascii?Q?hn0xhsPknmHRSM9zGCW5CbhiXxobLSc3jGPn8+3kUZd2lIbFk9WWgSKA+hZX?=
 =?us-ascii?Q?zE1P5H3eprcIAAuKqi4dpEDMFSxRv3SckH+njwtNJ5qgMG7BuSqqvKKnaych?=
 =?us-ascii?Q?Y9NYNr3ah+JUflpf6UHHbvipBkb6z0kt+Ghkd7u1yj7G0RQv76KpXaos8WW0?=
 =?us-ascii?Q?c98JUSgFU5DKKpISvkgR86fLQcGTChUfFhWkXrIj3X7HikBImcOdQDhtdZyg?=
 =?us-ascii?Q?+U2LUPOUTFu1KbfraK11XlVzDryJt4Z0QWbB7FzRw4J5mcEZrAIIrYn1d1Bs?=
 =?us-ascii?Q?qjAWy4Alivn72Pj2kEJs9ZPyLPUXHufqb2p0AMGW/caZ7mo+g5WgfFH70VGa?=
 =?us-ascii?Q?JA7hXZRG/5+BEr9CFfIR2cR4YHdZ4Hjq5dq6Di/oucfZZvTraGdKg4fy+03y?=
 =?us-ascii?Q?7bBsMnxYNdgTXLdJksvkYt9YvrhkSxSiYJ9gnA4AWVPNOq5HtTQqUpWofbt3?=
 =?us-ascii?Q?MRgM9eQ8anVpG6djJAjnUMkjIP5Doxwpk0tH+rz7WPL9T6r4s9lNzUy8fwh2?=
 =?us-ascii?Q?axM0kWkeNgA7OIyQuIM/VfynEd0DpCacUMYvBs7HAxM1gQ1TmrSvvcxV1Zfz?=
 =?us-ascii?Q?pu0VtXPx3AURfVM5pbufFndobRmqH36HTWWDG1EQS2L78T435ugtu0BUW6ui?=
 =?us-ascii?Q?Iw70PU/w8Hx70jg692hFZ4shXGTYYYNEktO66xDqWvL02HJ6e+Bcci25jOnD?=
 =?us-ascii?Q?13Lywye5H+cK6YZ+1Oy/s3N1khmHMo9FoRFLuSr6d9oKucxPO/fY8vArUId2?=
 =?us-ascii?Q?yvpe0vn+9ZndkqtytaHr0/iL5+i6r+Nfy3u1KbcsVAT9O7+u6TmBqfcXrVRC?=
 =?us-ascii?Q?yh0/00VLGUHJY6X7bwcPeMgKaGK19OPVhziVbKSbBm9UwBH4eGYuN1NcNBoq?=
 =?us-ascii?Q?/uqezwez1xPWhFVhHTXb35g9nb4tU0WYlP6u62xV7FNH3U3hgN873u0unHWv?=
 =?us-ascii?Q?FUZWXEEjhfhW77QVgPekhqqj/7EY70GE5oJDb3PmjrwfvU1fdJUyZ5Dyv24A?=
 =?us-ascii?Q?OCr0jhgqdwu/f4UWFF2uadzZ/sJW8pHDZrzdxTOEWy0GENZxTJUbannZwp81?=
 =?us-ascii?Q?znAybl8lId1qPk1BJt7/oeZKkVKpi0WuBYTeokXcAY/J7mAtCI/sQSWddOvF?=
 =?us-ascii?Q?HwvKejs8DidaFYreuhwFvID7ydrHmApaU3upQjCsu2ixWO51itlcZYss++hd?=
 =?us-ascii?Q?N77NKoaUdkv6qsDLAys6IdpFBn04caWVy9fOt7HxqH9LoUF7vBIzqDKyKQlu?=
 =?us-ascii?Q?jsOFYdduUB4VbYa+WAP6rLEpQ8IyHXREeE7PK3i6TVH8GsaheztW1C+IiBAJ?=
 =?us-ascii?Q?FV1UaNh56TtH/fNjgfh8BBhsaQuU7Rn2briTlP6yLbqmEQv03MHR0m+5XiQR?=
 =?us-ascii?Q?CxVh/zfOuzBw+crq8VZMlZR9Xmghx5VWuHi65YmJi/mU2gcafwuts+jIludc?=
 =?us-ascii?Q?Svr/kmn0EXIKyNuVvxIgbkVd+aF1qEctGA4AC901pzXqaP78xg+K5uhxZgvI?=
 =?us-ascii?Q?mcUl18hbTWx7BrlWKr1yy53N0tnqDSSVSVTxQozjrHqx+XI6bPQe1MOwVhqA?=
 =?us-ascii?Q?7O3v7PMUcw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c659357-9eba-4ba1-6e75-08df4b910cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 07:44:06.5994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvBMF2QQR/VXYKENPG344IEC3qyDZlR29DJNh39VmqlIRWq2Jwph5+Q4iUnResp8HM51BOPNVdpLIz5/aklCK8VNHLFfHwPWw9KnUnPSDmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZP189MB381878

>Subject: [PATCH net] tipc: compute the rekeying delay without wrapping
>
>tipc_crypto_rekeying_sched() converts the rekeying interval, given in minu=
tes,
>to milliseconds in 32 bits:
>
>	delay =3D (now) ? 0 : tx->rekeying_intv * 60 * 1000;
>
>TIPC_NLA_NODE_REKEYING accepts any u32, so intervals of 71583 minutes
>and more wrap. An interval of 134217728 minutes gives a delay of 0. The TX
>rekeying work then requeues itself without delay, and while its new key wa=
its
>for a peer to take it, each run goes straight back to the
>requeue: a kworker spins until the key is flushed or the interval is chang=
ed.
>
>Compute the delay in jiffies in 64 bits and cap it at MAX_JIFFY_OFFSET, th=
e
>largest delay msecs_to_jiffies() returns.
>
>Fixes: 23700da29b83 ("tipc: add automatic rekeying for encryption key")
>Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
>---
>The issue was found by an LLM-guided test generator that we are developing
>as a research prototype. A reproducer, which runs as any user with iproute=
2's
>tipc tool:
>
>$ unshare -Urn sh -e <<'END'
>tipc node set identity 1111111111111111
>tipc node set key this_is_a_master_key master tipc node set key rekeying
>134217728 sleep 3 END
>
>Without the patch, a kworker keeps one CPU busy until the namespace goes
>away (about 300 ticks of system time in three seconds on a 2-CPU VM, again=
st
>2 before the last command); with it, the system time stays at the idle lev=
el.
>
>The patch was written with LLM assistance; we reviewed and tested it.
>
> net/tipc/crypto.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c index
>4409bdb70fe9..ef08524ce2ca 100644
>--- a/net/tipc/crypto.c
>+++ b/net/tipc/crypto.c
>@@ -2417,8 +2417,9 @@ void tipc_crypto_rekeying_sched(struct tipc_crypto
>*tx, bool changed,
> 	}
>
> 	if (tx->rekeying_intv || now) {
>-		delay =3D (now) ? 0 : tx->rekeying_intv * 60 * 1000;
>-		queue_delayed_work(tx->wq, &tx->work,
>msecs_to_jiffies(delay));
>+		delay =3D now ? 0 : min_t(u64, (u64)tx->rekeying_intv * 60 * HZ,
>+					MAX_JIFFY_OFFSET);
>+		queue_delayed_work(tx->wq, &tx->work, delay);
> 	}
> }
>
>--
>2.43.0

Reviewed-by: Tung Nguyen <tung.quang.nguyen@est.tech>
