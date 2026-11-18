Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794971186;
	b=WiK/Jy8UavBqsjsQDWIi3tk+9chSZw6/72TxX6vwzXbEisBrWlPEpNbbhwKHIpFXTS5z
	 8ta99wMwlZSdVKYYb/26Ts/82qOMZHnVdgYU+d3C1u3B1ub3EmsXeS5/HUXRnaY/1AzPC
	 edFzLkpEwr2k766xzYPSJNG9Q4FjB2Zn4dolJxk3JU8xNsm8uU76Ehd0ZEFd4BIT3ApBL
	 AVkc9Om/TY3ErMNClXp+aQR5+WV2uB2f4YEmGAayRcECjj6wS8ovzSuaSbHl4W/cQY/1G
	 tcaIBEv2edF1FEtuxTDN6PtzoZRWDYY2Qlzy+L1PTnDBY+KYp7H742IQPkpPSFSaC6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971186;
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
	bh=QY9f8nki4QmjKW9tvm8drwJ1ufANPO77p58ZfHoUT7k=;
	b=Q+keRtUd7rpNa8EA5CbOEcuvodzaQlBOB3+DMMvd0/5vkCAx01xPyGAplYplwCKhHEM9
	 q/xQ4CnvnNugvri27Yi/zaLVy9Cnw/I4XfBmi9gpACfieEadQyN5PiHgNIgZ5Cio/5nQZ
	 /v4fyMRgZGiXIuzJD4S96mac22ANiqdgHBYJc6CsjGWnSmN64QhhHZiK0Ct+QqxaadbW2
	 iWWxyKI37aweNe71NT4oENJE8kAlCMicx+YfbHbT1JSHM8tXBABZennqcUl2QsWDLfhs0
	 Zr8dGbYfHl8+1n2d5Sg4KbfMcVvH4EBaaBMYS5LygQalVOU4kHOyVqS0Q9hxNOxOvPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=HEHx107Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.60
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D6606A325;
	Wed, 18 Nov 2026 03:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99D6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=HEHx107Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMPXPN8NsuqE0mh7H2ll1D7gKnkmEhoZDcilxBWnAMDQpChFTsA56ACZJlfBcIlYXq0HAmPZNLQl2iPsybITlcBhU+jGOB9LvTHyGnoZZFy2g/LgHiDbIeOCQv3M8L9mRuV5LZzgaBAL3RQtcLXEzn68da2a1+BaSsFJdWJEo0sRzUXet4j/5KIuir1wSnxD2QdZfYppo9rGhaGL+bIqfEAfVXZKflRVHZatkyr7OYkNMh4y893WxrlzosmygAPw45gRiOE6qbGxHPlXs30Xigr/9VCPMWCaGsZEeQq1yZDNTfLfIp4QgKIFG0zBZQLRvMGBSaZjKscqw0O6XpuZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY9f8nki4QmjKW9tvm8drwJ1ufANPO77p58ZfHoUT7k=;
 b=sfFeUIshMnww7JREqa/AWsQPFesdYTvz3gTv02gGyguGb4P4n3ErRWvTUmF/1vzcpBcRBW0higtS8hV/aMelVCkeTMqHRJuRpVZKYT/x5ncXbiY3mNst5GirihBUSLIqRSd3DCT4rAs6Wzmn1uIUpMu8nlhUKhbon3p8Fsr2FITtOzrceW5F+2VZJzMhXOYtjbL6MxqczFMHxesNJwzyWxQbPijadYqkwUL7mtC6i+DFy/O4AxDOFD3k3ToRgkBt0wECyUvjq6fe8ISlqAIH6o3u5blYLUCYM/jAhtQim5J/AI5gnw7Pu6p4ccvnanxcN+sNVNUJ9eFtn+XuZmwXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY9f8nki4QmjKW9tvm8drwJ1ufANPO77p58ZfHoUT7k=;
 b=HEHx107YlY6Yr8UcRxV/SGsplDs3HjnXNm//2ADDKpMA6csVc3rh5asFpbnllZqYjciR7c9G84Okdp6wC/+h9gb3S4FOLaCS+0i9rsr+cnR0//2gs4BEMZW9EKFhlZnnGzdrFVWvF/d5WJROAw0qwhQpN1WX6xar8vupU7xp4gEGL4cCByk+aAKMYqlspR4JZrcwl4auw5ChYVGvWaCpeff1ECRKb5t3TFDGrng+uuHyowjc3yzN0TaR1QsLrBlYnJdxEjgrQfQqRenEywnr1Fu0UsipW8ubEWuiauk2RqyXSlACrPOUNfpcQaJyLM8Frx3D8v/uEXz1RUxOdLWK4A==
Received: from SA3PR03MB7187.namprd03.prod.outlook.com (2603:10b6:806:2f6::11)
 by PH0PR03MB989122.namprd03.prod.outlook.com (2603:10b6:510:3ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:06:24 +0000
Received: from SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53]) by SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:06:24 +0000
From: Boon Khai Ng <boon.khai.ng@altera.com>
To: Andrew Lunn <andrew@lunn.ch>, Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michal Simek
	<michal.simek@amd.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Topic: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Index: AQHddqIIvUOcjPI2HEaczr5Ryubb5LcyjzIAgACWvlI=
Date: Wed, 18 Nov 2026 03:06:23 +0000
Message-ID:
 <SA3PR03MB718781F85046A84D79E27FE5B47A2@SA3PR03MB7187.namprd03.prod.outlook.com>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
 <20261117-571e631490-net-1@mail.sdu.edu.cn>
 <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
In-Reply-To: <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
Accept-Language: en-MY, en-US
Content-Language: en-MY
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Enabled=True;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SiteId=fbd72e03-d4a5-4110-adce-614d51f2077a;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SetDate=2026-11-18T03:06:22.913Z;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Name=Confidential;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_ContentBits=1;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7187:EE_|PH0PR03MB989122:EE_
x-ms-office365-filtering-correlation-id: 63ca9cd7-6f3c-4b38-6d26-08df4520edb5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|55112099003|4143699003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 ISBHZ6ZAw2uontA7ZuSHyooRFP2iUJmrCL5lbZ3xrwmTwz1cY5DjyDgHE0aIWGomUWuWUkdN9Xte/k3mhCv0k7Z1ofkezAqJmHaA015F4mfVXL7aQAymrmv6Xcer0/hQ4BcLtrpQ4Lh8peIWmVRu5/xObdj4ocROpIfUb3zNupFv1RQmPoMZAH3kM0q9pneRtM+dI9BhJxINo5d3EbJU4nEoABqyRSJHrxbKNY9tBe+5NjM5RENfAc6RQpO/BZY7i5vXYRGp0ryLgA0IsdrxIl3UJOtRX8UPgm9rPN/u7Sk2A37doVYmqxQEL7p+BE0JO/PMijyN3vp0x3RMhRVvuWV5/3PpQTmnV4YYCdM+oVgCAr1SdpzKEuftJD1L27Tzkckd5GLcXbK1D6ozbx1WfSpL92wMan2/PFel4AgiyZNzAfzx7WPnm7KHlaZwkwxooT/8+tVCea4U7uYcL43C1ZKJTPrFzf22LJoxQE8x+LOcvbqpDSkKWS9YOwC7Xv7ZZj3hFP+TMtkE3CD6B4o0etWsukiX5qagxAIfv/vVX0sWhsJgmgdxmYG8EJQ5IcA+nxB/4dz5rv08lDM4WzQQXGrAmQPgMSQUlx0EzjjxDrLvU3VLEGPY5QIvAJP1/PnPulMGwoNoHRv3jSJVYHLfl1PxhDIOyudCTBUDZU76CJAQ1b7uDrvN8JjuhQfTLkWX1fC6xhW3TfMfDe9KtWXzj588zMpBaqhMeKyhV/zigdw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7187.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FaHZNeAPk1B0+Sys0jLJZvqWdOz3QpohUAqYS79EdgTznlKfqk5bnunoMm?=
 =?iso-8859-1?Q?bZL8BRWYfUjdd8kw5IwEbrbQfXH+xHX9KcnPqkRC6JLmABlM1oJSoV1bLB?=
 =?iso-8859-1?Q?kdEFIuPLl/gJjzuTkmy86FX4H6tz46uHeG0MfJXAsC+yAX5+zZzd10obFt?=
 =?iso-8859-1?Q?fUNqmoJxUwtLh3MCDjANerDg/ig5SNn89RkChE+WEAYvJcyJ52nuvAvu0/?=
 =?iso-8859-1?Q?XRNGCFWDFyHRWrg6qdmzgu4g1Xd7orn6lvQ2UhAXZNmdc2DT7kt7ezCEvX?=
 =?iso-8859-1?Q?l7D5GW3pICv8CFALHj4vVhkQeWNC3e9U8Ka5ZkSG3InsbBOkDSGE0zFeNH?=
 =?iso-8859-1?Q?ZvW0hKo/z2zirWyPlgPhxs8113IHZpIlBhw+dx967P+tQpZ8AF6VPrtTZi?=
 =?iso-8859-1?Q?pX83uKyUhNIQ/e99FjPdc1VNmi5XbNiwNInyiStlLakKT8a2TVa6b89e6n?=
 =?iso-8859-1?Q?MNWM2Dilug4Mx211WBs2praCoRbaS8iyLZ3+kt42ZrKBb1DRQRGYOpKneH?=
 =?iso-8859-1?Q?vxYIia8ar4YqNNtRNk+HEjiCgy+wrHE1f4eKzRX1i/IrFDozLcVJyFweG3?=
 =?iso-8859-1?Q?bs1wD4gOa5R2Nlw0PBjbCi4URvnAuRmdBP6gR8w3xYXjatRgIKiAreV46Q?=
 =?iso-8859-1?Q?mJsuP8N8pCjGlNeZUDyrpKhR/FXjOTAt2gXDoHjD37XvrTO+ady+ulSfKa?=
 =?iso-8859-1?Q?8Zd50e7igTYBNdGPhgSCnsei2ttTBYQuI2bCNand9GKPHpzZB0SMVKk0VZ?=
 =?iso-8859-1?Q?nkYtZPJrJHstjMqD6OqvOWkza6/+hTWEzdgIWdbvaRr6G53WUoRZ0tGemd?=
 =?iso-8859-1?Q?OXcCMKCid6UOGuubLJAY1WJPVivKK1fLlAmabSzElyDwjcjW1QNDovRRfP?=
 =?iso-8859-1?Q?W4ZX2ef8qAyOsKsoMr56nqEneQ5Y0DFuWbJRC4mTcf6UkhyvitcHyapsMz?=
 =?iso-8859-1?Q?6HCPZC6de27vDylEmbTgzdSJ4kHrbGlr61sOtO9nWIY/RerqRU8B9HxGPR?=
 =?iso-8859-1?Q?3nGmVbKfjPKHv+NC34aRuBVlLBtfO4pQSdVutPjDcMoWQ/NFHLFMUM6pP8?=
 =?iso-8859-1?Q?9PzD+eyarSrd7S0faYodYlP2rD/AtypdJRODLKkxjdqgZTivz8AOHH5idt?=
 =?iso-8859-1?Q?sq3iLXAs0d19GOzdTx0W4DbTKRVzskQMQh4mAesg9ct65EgocWyhFs2AAB?=
 =?iso-8859-1?Q?cYUhOb9vXt4FctJlDHCBTS6K9+vC/4dfKjxa+oCbJ/x5wU5koM83JL2X+A?=
 =?iso-8859-1?Q?+I4L29htNCXkqHaGbkWYRxi12kFw7Iv7BeaZdhlQTVk0TqZRmhIRliiZOA?=
 =?iso-8859-1?Q?bdYZ8wSkyahr4QxoA1GY0IuLs/uHFNUTjgfi4AK7QXPlaAZyr/naj1XkwR?=
 =?iso-8859-1?Q?DoLjGYDx2xtub4PyvKmzWb/ScsCnOzNAiZTkiUdZlzqHwxLX2yjN9c/+Yr?=
 =?iso-8859-1?Q?OeS/BPKpjFV1VOrh3UvaPI5yg6MbvZm+w2wWvE0E9MG3A55FC4iGjnxQfj?=
 =?iso-8859-1?Q?ptq8dNVjCYc/f6yUNv4KgApRf1KVNFkywXGcTb94cxRUxuak88DKpdxCX9?=
 =?iso-8859-1?Q?TeJEK7rHHEk/jmkVwcYHUBRq5HC4r3ts0UopUbWPekHrlCo+RG6zxRn2hC?=
 =?iso-8859-1?Q?Eb8fxgX9tV3nWzcs6ZVCG73UCvdM0H7PlTgG/Kg5mVlsXwRqRcEqyGA5Fe?=
 =?iso-8859-1?Q?s6aEXZhoALa8PctNi5RKt6nlmjh2VC94MJLWGNKdcg1Nc4+wQA+a3QQMQ5?=
 =?iso-8859-1?Q?4X1jEdRcHZYJP+xv62mVk19YNuIaZpdXvwxX1hwS4zpOL9ORNuOPnSC6d7?=
 =?iso-8859-1?Q?nc3RZhLdTQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ca9cd7-6f3c-4b38-6d26-08df4520edb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:06:23.9053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xb0BCbiiZwfOEDvWg4oL3nPhXRV0uAgN3AdDm5CAKh1rvhVd3iybikArpj/B85MlCaap+3iL/FOJVPDPaH96Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989122

Hi,=0A=
=0A=
> The usual question: Does this bother anybody?=0A=
> If not, net-next, no Fixes:=0A=
>=A0=A0=A0 Andrew=0A=
> ---=0A=
=0A=
Sorry for the late reply. Reviewed, no concerns from my side. Thanks.=0A=
