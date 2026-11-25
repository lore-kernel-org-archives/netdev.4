Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599909;
	b=wbrcC+Tf38wHqiYBf3kf9b4pTkwZYVTpO/L+1W1RQXJAcEkj7wjVZGiGz2JJh3PR5DO0
	 2hhuX04tFNYLdm/DRiKKeNmMrdeVABND6LXN0Yjc2tIJfj4srTezj0nb9w2Sqv3Rc1uK4
	 XxiXNrL3S+epLeM/Bl75saBTeaTEenU/a2rpfAgvbK0XwvAZuHlfLHgPGh+An8tx/VGz0
	 vb02PUVuninsKCJdthhLPkyxjD4DkEivT7gbm7mtFcC1nQNfNq4Ni2eTB/D9fe3Mh0+9n
	 A53Gn7rbLcOepG0aSeV6MOgjWByz8oJcd6j0iZdkiFU21j9hMncZyqQVOXKx9WP7l/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599909;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=28lvrVAEM9l+05EQ91UDVJYf8HQzBb1U/byN9YcwYBQ=;
	b=sQhxEA5RvV1H6JJXIUQicmz7D63UL5CoQFietbpwJcSj5vBQaBBuqLsRGu8T5jocvo7l
	 n6tP0iGtw8dIT0NqKT9Iqkr1xGg5iPQpEmobgfvwurpXaKGz40cdMg9fN0Ujuz2FCvo3H
	 Eyq/KWPFE2OJrGisEct/3V7QanJ0XBIGdNB9Ca3KfYqMS4AT3Y71zE+tlBqvZHlShlxAC
	 cJRyGXwYpF99WgYgBwhmDUuAC0fgcTGZ4EqGcf7Vck6f6Xg37Wt2BI6SwU1B2pKS6gt+o
	 ZySUHkrV3viyZsWKDXZO1WUirPi7YuNVEtfjCX9gR0grdrBNa23we0sXa3EZDM22J7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=ffGYB67f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.26
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A1606A327;
	Wed, 25 Nov 2026 09:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=ffGYB67f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao81uBQ1Dcbk1IvqPcWxloDCfWTLuexEphPVTab8U3vSvJySBLNhxWxBjGguD+Tqf1Uz95jwWdJACJ1maKUfH4xTsQ2mZTut8pclUr/M5nHsPH1ydXHGNCOo6fnseBYUd66106To9fEhKAQ7fXm/06PkELBiBb/kAHyBZK0kfb32PRBHsrAejQLUNtXknz/YPKbvzLHzqee4X5B7lM/7qxhiEx4bOlRqq03LT7lTAnRyoozh0Joml9dkUlnfzqV0mCjS+tMkmhRqzFrc5Mu91hwb+0aWFPlC3JdkQWWTX+9uA5clIE53lywDBexrAI2Xx3gBHvyfs83OcNiXZmBDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28lvrVAEM9l+05EQ91UDVJYf8HQzBb1U/byN9YcwYBQ=;
 b=XPaD/7lPjRk+A6ts5JuXO6WR5OHpa8QPfvl4hZiNP06fN9Yo3jEGN2ytEXaW3MYcIvqITFaX+fNTkWA2BP0Wyi4NdX/lm2W1r4zkkn2eIZCoVldvAlcqALwNDzjICiazkn2LjUb5XN3Ifgpv/TvNvmoE4fdL2TxRt8LtCLYI1Lo5GEix+01gvv6uA6SXW+FHzz3ftUomjfBWBrJQIDW+UBpxYUklXFQf00Yi0/yu79XVufuI8mZuiU6zGUABjp2elnBD6XbptRcsMbqeL/v+5vjUt/Cep4oZC6WH+Diy9f1aQz319sgCFWWak5YikXZEkfH1YGOQ90jVSHBJ4avspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28lvrVAEM9l+05EQ91UDVJYf8HQzBb1U/byN9YcwYBQ=;
 b=ffGYB67fsY8pq926f8Ejd67qa3dPVbJd5W5YW3+87QvbtU2rvtfd913lu333Q+G7GPWj3hNTJaQbcpBMUiR0DCIEEC9d75pNpsO9UO0blsqFFvPfo/arSD5EauCubwnQ4XB0kcdDEYXZNapqDwGxtBU5aSCc93L5IT30q8C+J0f9Ut0BbC1rD4ccTTJa4dHVnjDjQsukLdS9sdp7RKzN92Lks2R4yDLWCqfqgMeFvrZ/Rpe1a/mMWogYwAKtkjoi7XKrOCUJQG+F5fWgeE9jI329Ln2+ajrgSoFGi7Z4CDu/iVw3Bdek4zpI9hYRZBDa9eWUOTi2wJLRRsqHVc6jpA==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB5P189MB2594.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:4a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 09:45:04 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:45:00 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net] tipc: drop discovery messages shorter than the fields
 they carry
Thread-Topic: [PATCH net] tipc: drop discovery messages shorter than the
 fields they carry
Thread-Index: AQHde+jRcJcRWvn2fEGSOxJt5nLTKrc+gtqw
Date: Wed, 25 Nov 2026 09:44:59 +0000
Message-ID:
 <AM7P189MB1137AEF136434E219D4075C3C6432@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <179550610427.774194.2378040347436778640@gmail.com>
In-Reply-To: <179550610427.774194.2378040347436778640@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB5P189MB2594:EE_
x-ms-office365-filtering-correlation-id: e6033fda-d4a9-447c-946a-08df4ad8c5b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|23010399003|18002099003|22082099003|3023799007|261009223027099003|56012099006|11063799006|261026140227099003|261022105027099003|10067099003|261102123227099003|261021121427099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info:
 HHrAy/LJZ+Jex/0oPu3dkxtR+gOz85ZqL4KxKfzEULg3Vw8XD8vhtqOjbrS1aGpnqtZ8vABYtZUX9MPQerRpeZwA1rt7GjCbHMqO8NKnKxQg+av7DnFzn7DMJhrXPZwOL+oZsByc4+CWW/H/74tEsU/XLNqfAhNP8qInJZRmGku1Y9CujgYOKJj5jblBqqpjqY924JHqlQvHATWwCD4RIviKMXK+AjeLxJVUIX3aB9QjhA7x9NAP8Wig7/lOak3xknt13uzjgeeoWP5/os26iL6Ez015aPzQHMe78ugXMyXIxXyTqnvaVXioLjTRRxA5foGruUEpBUABujE46peTy12dg+he8a5cCjhpTBiVG8ZoyqVVZFsX6PBkO3lrUSde7RGVpwG5Dth8I6RVulRElwoDRhO9fbBVsxQ6vmaoVDirN3+04Zd/pHHdCdFN4dJz5veV7mK9ueWgJ/0dEKNV6c/ev2aIRo1AnELokE9HnKCUIUtmgX5tDtavyEBREKA8uMRM1HuNRyXQ+FsaaYboWwlbiuZPKieyY4337OObBIkMt5bqvamS6pSO2TAZ2xOjeIm8AE1tJjOPqEBaclTqrrUZFuEUD/nCvc9B0/fKSqfCW/re068YFSt9oAlKoh0XEw2F8WHXxYSeUNOrYLD4XVKWZLvDchQ1gby+qfWMDf56PTdVUUhmekdWPMjDNwVCDQ6Sc2HDWYQ+fo1UGU2TpdhfplJhXoAW3UJjd5EWiJ4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(10067099003)(261102123227099003)(261021121427099003)(261028144727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Pt5AOG9p94eZxHf7BBi2uz5FXBHKcYg5wX+jZO056Gq3PSPiyoLl0oHVBB?=
 =?iso-8859-1?Q?nFwuvZNKoLBfVCzMtLDLrpmfySC6u2kY5STLmn25nS7Z67UvpacpQoVt15?=
 =?iso-8859-1?Q?dBe+jGLfX5k3oqq/BMVCP4iSMeAred8GmgX2zxbTDMrB8OnN01iGBngcEC?=
 =?iso-8859-1?Q?6dDxmO3X1Uqy9cQwV3XA8WKl+agyNz8328a5iVJ15/ne4T7voPh8IBnGWR?=
 =?iso-8859-1?Q?7XJFcqfWtpdiuIeMaG/N9OXtEPi6onKNdlf6elJLSpryy+Yc2Ej3TR4Hon?=
 =?iso-8859-1?Q?GJ6MNBw9otWsGYhdkX7rbfjHxvlv7w6k+jisosUfuWoc867ChLeSE0X5v+?=
 =?iso-8859-1?Q?ryrCRhKDOymVm1dc+gAcDl/cumNtMMMjCDvG50yVBGR/NzR3GZ8QRUO/Nr?=
 =?iso-8859-1?Q?N1XWjCpedbU2goY8+ecENmpdD+0JNUGIR/Pvu3n3Axx4OZZfFN7WaNJ+we?=
 =?iso-8859-1?Q?DbT4Vk3WZ0Y+uEYcAavQx/QBF5pial0XLWvUhGXaNcSf7bBZhcMCjs8oUD?=
 =?iso-8859-1?Q?daf09B/QyID4YWPUZ1qyX7hx00Rb+tenVQOKRNDs16Ldbbvd4DAPW9KgyJ?=
 =?iso-8859-1?Q?sgc2Z/rmqg95kibQirJv6iyYD1uEU5qiNeO0KxAbv1FLRy8LXwsAvrRi1k?=
 =?iso-8859-1?Q?8HLznnJaBkaPl51eRQ3NvzUjPKbenH7Zd4cI15sPSdHLrI2JHVFDktWX+z?=
 =?iso-8859-1?Q?dlT/Az7yl/EXu21F3Zkq1WiLeBFkTZL9EPVkSgYCoP2RMx9gcgtsLXSfXz?=
 =?iso-8859-1?Q?A/8OUuik2ZCJk4xYszlIULDg8hba1uTxlqtAY28KjiEpgS+vf1tmRIqNDR?=
 =?iso-8859-1?Q?Ri3XH61Spj8LGfXurrfK06ZwJy4+FapaeVu2MfINywGavWgi09Gq3fjv4u?=
 =?iso-8859-1?Q?eTPL4g14nSH1fLP0kVAS6XkggiaLygOsooXO7u++PDJL35qsKQ7FE1eA7H?=
 =?iso-8859-1?Q?VMh+1gUT9t3ZvuHAj4RWpu++8++qXbIwVeJ58q7G/naQVcvr0PlhTIFJ2w?=
 =?iso-8859-1?Q?9UDfM3vaIA71G/Ld/c5+MugT6CVU+5NCBB3AEkJWV1lcDWEQnGUGPttt1k?=
 =?iso-8859-1?Q?ZlRfn/oP+D153lYpiXG9oi4p08HqU7YEy8YW7vsZoMYV2YH554H1c3bMbe?=
 =?iso-8859-1?Q?oK0gVJtcbcHx3Yr9uav8V/C1vcJxGUvSonCU8xbP2WY32UVZ0yQuzV7DCs?=
 =?iso-8859-1?Q?cpmA1Qp8d8XjL3+qdKS84U7JZgdyqm5ETi8rnonM4pdyGNHSGRJ1BOPMdU?=
 =?iso-8859-1?Q?b2Qgmuy+CM1TNIHHbeNtdbZW7b60rA3a+hyAkW8bmkcR5neWVeSz7nQ+/n?=
 =?iso-8859-1?Q?T/tkuh6l/jeN+no5OfTHFLPvvIVfNXlfLcUrDlNaaiT/cm8HNY9oaDxqtF?=
 =?iso-8859-1?Q?dVokyq3dnUt1fT/32niKTLoFKKSaXPwSCofzoyl3MG/E2gRC7BLE7t/w3l?=
 =?iso-8859-1?Q?bdn7Gp5ir4qCPr/Jr+BZaKKQ4f9595JZ3rqzuMRNNlOuoHBnbm72XFxE8v?=
 =?iso-8859-1?Q?LQdan5eiV4MKtPKe3eeVTzJXxSaKnj3I15L25cGhJ8fnlAol/W8jM42aN6?=
 =?iso-8859-1?Q?5G3vrhsx0kZFNCISe/KhCc0O8R9205UqmKg4NDrIXiQYs5W3wD59pMsRqC?=
 =?iso-8859-1?Q?MBRdWuZpbZcJfFr+erQ7suSyQUXvOIbtczpUfWaY8v8HLD5L4tc/JKA91J?=
 =?iso-8859-1?Q?EM3XPGdx80FDcxxPmoTbyaencAc6jR99A6obG9iolyaWCbTOADdYLUA2EQ?=
 =?iso-8859-1?Q?HzB3RcbsS9HONMkGp/ukD8yacCcol5TgkaoDYSq0GCudbYGePiq4FcElBE?=
 =?iso-8859-1?Q?N6AKHli5CrrNkN2mdCdHAiV48ksB4qoSJD8S5UP+yqOT6tNtLdqQTKq9Wc?=
 =?iso-8859-1?Q?NV?=
x-ms-exchange-antispam-messagedata-1: dButU7W9/nzK3A==
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
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e6033fda-d4a9-447c-946a-08df4ad8c5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 09:45:00.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5NdAGc3/vDu7GM1EQmeSS+3mGnqCICB4Gsow594+rQ1T9HBDucQ99i2RFq/2nWCNBGKKYNKDOC0M+aKMTz8lmgEb/sY2yaHEjuf48F48X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2594

>Subject: [PATCH net] tipc: drop discovery messages shorter than the fields=
 they=0A=
>carry=0A=
>=0A=
>tipc_disc_rcv() reads the media address and words 13 and 14 of a full=0A=
>MAX_H_SIZE header, and the 128-bit node identity from the data after it, b=
ut=0A=
>tipc_msg_validate() only checks that the declared header is at least=0A=
>MIN_H_SIZE. A peer on the bearer can send a discovery message with a 24-=
=0A=
>byte header, and those fields are then read from past the end of the messa=
ge.=0A=
>For a UDP bearer, tipc_udp_msg2addr() takes the peer's address from there:=
=0A=
=0A=
Discovery message's  header size (MAX_H_SIZE =3D=3D 60) is stated in tipc_d=
isc_init_msg() and it is a protocol message. =0A=
How can the peer send a discovery message with a 24-byte header ?=0A=
=0A=
>=0A=
>  BUG: KMSAN: uninit-value in tipc_udp_msg2addr (net/tipc/udp_media.c:129)=
=0A=
>   tipc_udp_msg2addr (net/tipc/udp_media.c:129 net/tipc/udp_media.c:159)=
=0A=
>   tipc_disc_rcv (net/tipc/discover.c:227)=0A=
>   tipc_rcv (net/tipc/node.c:2136)=0A=
>   tipc_udp_recv (net/tipc/udp_media.c:389)=0A=
>   udp_queue_rcv_one_skb (net/ipv4/udp.c:2433)=0A=
>   udp_queue_rcv_skb (net/ipv4/udp.c:2473)=0A=
>  Uninit was created at:=0A=
>   kmem_cache_alloc_node_noprof (mm/slub.c:5105)=0A=
>   __alloc_skb (net/core/skbuff.c:616 net/core/skbuff.c:716)=0A=
>=0A=
>Discovery messages have been sent with a MAX_H_SIZE header since commit=0A=
>948fa2d115c5 ("tipc: increase size of tipc discovery messages"), and with =
the=0A=
>node identity after it when TIPC_NODE_ID128 is set. Drop the shorter ones.=
=0A=
>=0A=
>Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")=0A=
>Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>=0A=
>---=0A=
>The issue was found by an LLM-guided test generator that we are developing=
=0A=
>as a research prototype: as an unprivileged user in its own user and netwo=
rk=0A=
>namespace, it enables a UDP bearer and sends it a discovery message with a=
=0A=
>24-byte header. KASAN stays quiet, as the bytes read are in the skb's tail=
room;=0A=
>KMSAN reports them as above, and the kernel logs "Rcv corrupt discovery=0A=
>message" for the address built from them.=0A=
>=0A=
>The patch was written with LLM assistance; we reviewed and tested it.=0A=
>With it, the short message is dropped without KMSAN reports, and two=0A=
>namespaces joined by a veth pair with UDP bearers still discover each othe=
r=0A=
>and bring the link up.=0A=
>=0A=
> net/tipc/discover.c | 6 ++++++=0A=
> 1 file changed, 6 insertions(+)=0A=
>=0A=
>diff --git a/net/tipc/discover.c b/net/tipc/discover.c index=0A=
>b9d06595b067..0f99e4af1cfa 100644=0A=
>--- a/net/tipc/discover.c=0A=
>+++ b/net/tipc/discover.c=0A=
>@@ -219,6 +219,12 @@ void tipc_disc_rcv(struct net *net, struct sk_buff *s=
kb,=0A=
> 	}=0A=
> 	hdr =3D buf_msg(skb);=0A=
>=0A=
>+	if (msg_hdr_sz(hdr) < MAX_H_SIZE ||=0A=
=0A=
As sashiko pointed out, the lecacy node (before commit 948fa2d115c5 ("tipc:=
 increase size of tipc discovery=0A=
messages") sends 40-byte header. The above check will drop that discovery m=
essage. This breaks our compatibility rule.=0A=
=0A=
---=0A=
pw-bot: cr=0A=
=0A=
