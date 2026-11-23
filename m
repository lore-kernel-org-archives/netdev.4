Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795401486;
	b=DfwlEp+dnPzafRiCCX46EnICub6rIGl0+jwwHhyd1abqn9z6nvQQwI1BY06rBOB0ArH7
	 97icCir5BkndylpJpPeaLfpS2jPBWAV4OzMfi/bUVNxAbL4UfhtF3P7WE9wI/0NRw2CJM
	 DelBN9XSZikDVFuxYjjolbLJYsLsbLVvrWvg8UvxVNBPsI1i7oZ7tcPfVQpMCxFJ8Pk3A
	 qFSSZOeXS0/HdTLebtfz6AiAe8uWZBpTBhpPP8KJNnIORJic+DXh/ljlzKJLZh0/6uXiR
	 2Jdu+a8dltixiNfLjkv4w7zuCYCZD33zyKzpFhhbdvbh7/0d4nUjcNaLkMusHifRm9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401486;
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
	bh=txVnAByyQVKjlThZ3PzZthm0N/TrgCmOwmUxRsQNhVE=;
	b=FL7j86DmNlbsQiqe84UJE+EkHCXkMzlc3cbCp5xNRMAQ1BzCcgRdTKL3m4tTyCz1VfJp
	 RqgQkivLG5BwBuIzMBOxbOLIpboeeWy41Sgy2hvpd9cIWLPFHPZ5ML0GWjgOt4AK1Kc9i
	 UAVNzEwXDdzXO4r8da3YueER2xvHsML6J5BPFMH2NN68K064uBZTQaIui1ZIWYmMeY43H
	 YVaxhj6q90rGDvw6QXJdWMlzl8Kjiy1CGB6CCZy4J+VcqgAQRSal7UIDrgQpV+XZ1e5/J
	 TpNufeIbn8nnGL9vlsP0FmVys/g887cFzbWSn+b+zo/wdwxscS28KS5tUkMktfxX+rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TA2sAEx5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.21
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB3B606A31A;
	Mon, 23 Nov 2026 02:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TA2sAEx5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v45RCJJDtTTOLrFKRKEez6Ov46947D9WNC3jytaZxqNILZjEUO7Ob4vSjKTNcw+h7IKCB/0MYSNaPJE6NXNe+ieaJ48KxZnGNAm+t00X7o6NNRGfYLj/ygrEznxQQs++w02cwYywyXhqRHYaIwSCf7cqPo8mWzPOf+BDsYovNb/x96sx3dEAADpVNgi39kYCnBMZmRpGDF2qi1dAm/c94tO6DBbrCn190js8dCyGn+Y7U49odIR8LsaCRXFxk1qzzGH3zJDHCEukayKctIp9HU7l6wYPAdqcagEAW6M5oAPRn3ThrLcb5jfXFwox1yOMghudtKaGEBXqL8dKK2xIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txVnAByyQVKjlThZ3PzZthm0N/TrgCmOwmUxRsQNhVE=;
 b=BWPR0mfw9HZlfQBSfbl+tyMNGo7B9foRsvmYjGdbbipM0nagGspSN0X6ERZefyhVEjSM3XRKWzIsyu7nHXuu8UdY1HndTkMUfo4MngspGDGvkmwSKvqKnJCJ6+4g/vw+Ayl0F0qX/VTigqjTtBuDoX3Tt3pfsXW6OAvJYaCi+Uxz3bNamKTUrTKDTbevb4pZ7t8f1dRF3d4fZN7tyfPcy4DY1kB1AFBsYaW+pLjzmbsXyTdCie0N0lo226cuux7QxMJppDRNT4njsKMhAF3C7YVAN9EigIYtburJ5SLvbwNibmW3zCXKflbXMH8TKcHn198i5O1NQeCb3W5IDZAKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txVnAByyQVKjlThZ3PzZthm0N/TrgCmOwmUxRsQNhVE=;
 b=TA2sAEx52xW+4EQ4sTT9EYJ02Pcmn3b4Sp9bcAhv/0p5dEa4ck9V0jUHKFaVpgAw4KOea+70w6mLe9Mny8/YGwxOLcIO0Ur/L5rcEnV6xJ8Z8NXNfacxc6E2++Hd5KCDV5WH8y2ztztIhfayyJnvvHwtBbYnnnSLnZNstyXoQGDPivRnihkLN32qya3ubYm9D6J9wG816c9jpGjK5Y792+TLFLrjMhKx1UPLfdyLcrR7ImMmVUBpme6ASmaGkMMho4klR7cuwAZHJ4HNRlFo901My9mK/s6SP6u3jcJjPqe8dnPbNocsyjfMlroz6UyEJrmvEQlf1TsH1WcWWvDwUw==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by GVXP189MB3386.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 02:37:59 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 23 Nov 2026
 02:37:59 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Andrew Stellman <astellman@stellman-greene.com>
CC: "David S. Miller" <davem@davemloft.net>, Jon Maloy <jmaloy@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net] tipc: zero the pad bytes between bundled messages
Thread-Topic: [PATCH net] tipc: zero the pad bytes between bundled messages
Thread-Index: AQHdeFWhT+A+mLk8JE+y4QvaRqRCCLc69jKg
Date: Mon, 23 Nov 2026 02:37:59 +0000
Message-ID:
 <AM7P189MB11376459A3A6F49643AC25AEC6452@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261119184127.24931-1-astellman@stellman-greene.com>
In-Reply-To: <20261119184127.24931-1-astellman@stellman-greene.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|GVXP189MB3386:EE_
x-ms-office365-filtering-correlation-id: 2102c75d-1433-491c-2a9f-08df490ac9df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|38070700021|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 J+/Psp+WNiArsqrPU/N+euICzdMaXd97YBedNcltjVfBnfUjc5zqe9ttUuaSu9jANCkwdhS/g1htghaEXrGLukTo4nbH7J1Olq+Z2giUCMwPZbjMXJwvx21nmC6OPuJXFT53MjWiZYLOx01kbKeIfetKPR4rzaCnESx+TOA32C7fH/U1VYIwtKUXS5zGyVOBsM/tSN0zPUoWchmZA+Zp93t7p2b3ArzQ2vqHY/0wAxfnbKtm1FnBT8+dTWgEShIXvRyJ0oivFCN+MqWSwDE7fE8DIxKtaDzWn4BSpBdO+kRCRBclCJ+05k/sAdGMqK6d4ThCejm94JNc19LxtW4qQbZrbOM9w2Kg23u/Kqj23IMhRjJfvY1jXXjW5YYUkmd/7uT/dPA8mFaVoqw0gOlO5zHqF9dfEVEZqbGEXaaYoaADgHUgvFjwTo619KeR5M5Hm/U0ECWpEZqIH2kriJADnqXbkhqs6m/yM1RH/PAtah93xmdFFGHc14F3FMkjMss56A6myZH5K6dhouDWE16GHpm2lBD3C6ICWVLhxM7a5LuEOwTCt/Ppvn0sMYAie3OHrMG797+XBgU/maVnq1kX4fvZhdOXZjLXSsNHsqv2atf+HPMUa/XLoD2IcHIJlZhY6fbvMz9wGJT1Nq4C8aI6xcUIejIY+yAHQkCieLWj+4dhMvVzV1fD9EjQ5YD2Xnd6jybteNppIjLjNqTJpaVuS3nV8CKz9ZRDtB/VeNR2/HM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(38070700021)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V5ZcpIO3k5cEurp9hd5hJSAmNqjgonr0iiUK+6pvbdOJ/Qza/WqSoNHB5Tze?=
 =?us-ascii?Q?+u5/DIu85F/D42c35iAkGhrpo6OflQc/ASbRnRsAJfVSCcLYfzTC+le2lxRc?=
 =?us-ascii?Q?dKdRsUeadizoBUGZQUf9W7KkkjpoJngO1yrOwt4OsyWvZ1CS3EfAETLUhlBz?=
 =?us-ascii?Q?iuHlA4ZL7nUI7e6+vQg2+q9x0lefwRaCi7ZEipUZryxhb4czeDCus3RBWgfG?=
 =?us-ascii?Q?3miHz7cpFBcd5VYXguRZEynqFC7WjVwNJwD39i6PVbr2t4IhKGbiYMt+kqKl?=
 =?us-ascii?Q?cpYD0+FCFX/dkR/DITu6ZZj1rDC4PTTIXncg3dRKKV8swyh31h2I2v4dd5DM?=
 =?us-ascii?Q?9TtzeiK829+vKmiVjyQOvYqD4KJ/O5HwwqY6o1poTksH64YZHB6gGqQVXhJu?=
 =?us-ascii?Q?3uaihhxI9UYGUxCHv8RHNOka0WvcJBZmlcQTI7/uyZK+sCeuFc8diN4RRXo6?=
 =?us-ascii?Q?WAfU0YCGFW5IW3eNEO1JZvxRCAQeZyyxR/00GZFwI/9eftSHhiJvH48zPlwL?=
 =?us-ascii?Q?WK5X0UP/xIlIZurjIr9jrREyjxkBi3L9V/yxUyodtqDlFvu9gy0bfFNJ39Og?=
 =?us-ascii?Q?L2xoR8H7D7PGc+rUPHzgPucJXfaHJE+Xxx63Q7JuJp21qNS3BmJHV29NMq0Z?=
 =?us-ascii?Q?+uE1SBrXTNRdztcIo3zhrzLQToG+Oo1hpOnDhF/L2jvnUt2w0wsZr4yZ9FB4?=
 =?us-ascii?Q?suyZ9OjzDgnO+LkCJzibRVnMaOyCekhUNH3ba3PE5uHIKcVcF5oAZRGAIycK?=
 =?us-ascii?Q?xb8/xVAm9SxDSwfOGeYurGF59gUpmZQbtrApHQE10K6c2GLxW+/Sk2ouS8R3?=
 =?us-ascii?Q?dD6Oq3LANh/FBAEwVKXGXFGoKrJ7fn3xmfeaduCfajNr+uXgNdTUMO0KL8LE?=
 =?us-ascii?Q?6xWVamOzZsk/Phj+NeXeYXUEZhivC5atm9ien4C8LhfkYXkxgTmPqf6KtxFQ?=
 =?us-ascii?Q?CIzefQNeONyfyEehEHQZrb4hddxPlfmrWRP+vaGtTElwlpYt4a0OpDtHeODp?=
 =?us-ascii?Q?4C0d9ywk4zSS7gXmvMe5jY0nW8dM7ri5V/C32GkReKR1iz+5Sujemq2n3o7n?=
 =?us-ascii?Q?5B98mgNEfVkZgJzQ4uiQ0NYmQFCac6GduliWLP/5GLMqqL3rhshTH8KJjDM2?=
 =?us-ascii?Q?jGVzPctTv2bOXkZsOYdNDWNT33c7mHMo/sODEGZQDXNsMUG68oocH5qN7HGP?=
 =?us-ascii?Q?eQZ28fVh/k01k0bmiFy2qWtwdUcgrOanlx/H0ooWu6KBz0J0q7gw+ldv1QDz?=
 =?us-ascii?Q?XNh9ZcNB8NUukru5tQXG7qqFaOi3J1JWMHn7k1Jw5pYNwxOOOamnoBEu7zLP?=
 =?us-ascii?Q?DdZFN1zNxhUQEnhZGyf6x+ARQuyEKHYxlwuRe/J896VwRlhE3bc82QAhrOd9?=
 =?us-ascii?Q?yczI13jG+tEQxxdqGpVCdsswataX4MCy5F7tlji/ph0Zho+eZZMZjKtloXOt?=
 =?us-ascii?Q?rp9wxBSyyUIIrZLjUBn+ONqwVyMCBonhMKV8CLGqRI69B/Hew1CfnH+cRURs?=
 =?us-ascii?Q?19WfKlK4MctU1vrt+FDdt3AgUwsT8fmfUQP/zLCc5J6TZALdPWQZvbMCaSMo?=
 =?us-ascii?Q?mrfahPHZ5bX9h8R7eSBMSfuCN0T71TWchP8BGcjI5IHrC2PnGWxddhNGeJaJ?=
 =?us-ascii?Q?BuYU68berliJd8gP4nNr5LiaAEygNPIv7Y7EjoDPUsmw86m1lQ6nYbN40tNe?=
 =?us-ascii?Q?6D835tAukaIClQGbwau+fsDw2Gkl1MvF6nQ/+HST8ohg7KBPdUz00kqaGLYP?=
 =?us-ascii?Q?GB/FfUEj0g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2102c75d-1433-491c-2a9f-08df490ac9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 02:37:59.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQ6MrMguRSLG+ZgqOwbKt8i/031qgI6iIE9nox7ZpYi8TI5/7pCMQcT4pxGKCyfwMRH8ozy3eeEscp2CqFUIZVLwuHPoyav1iWyRXyoSugM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3386

>Subject: [PATCH net] tipc: zero the pad bytes between bundled messages
>
>tipc_msg_bundle() places each message in a bundle at a 4-byte aligned offs=
et.
>It extends the bundle with skb_put() to cover both the padding and the
>message, but copies only the message, so the 0 to 3 pad bytes before it ke=
ep
>whatever was in the skb's tailroom, and they are sent to the peer node.
>
>Zero the pad bytes. Commit 81c600c26302 ("tipc: Dont send random pad bytes
>in RESET/ACTIVATE messages") fixed the same kind of leak in link protocol
>messages.
>
>Reproduced on v7.4-rc3 with two QEMU guests as TIPC nodes, booted with
>slub_debug=3DP, which fills free slab objects with 0x6b. One guest sends
>60,000 SOCK_RDM messages with 41, 45 and 37 bytes of data to the other.
>That fills the link window, so some are bundled, and a packet socket on th=
e
>sender captures the outgoing frames. Without this patch every captured pad
>byte was 0x6b; with it they are all zero and every message is still delive=
red. No
>other kernel changes, debug code or error injection were needed, and there=
 is
>no TIPC selftest to run.
>
>The issue was found by Claude Opus 5.5 running Quality Playbook, an LLM-
>driven code review tool:
>https://github.com/andrewstellman/quality-playbook
>The fix and this changelog were drafted with the same tool and reviewed by
>me.
>
>Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
>Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
>---
>A reproducer is available on request.
>
> net/tipc/msg.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/net/tipc/msg.c b/net/tipc/msg.c index 39dfd33c8eec..b0d52609b=
03d
>100644
>--- a/net/tipc/msg.c
>+++ b/net/tipc/msg.c
>@@ -509,7 +509,8 @@ static bool tipc_msg_bundle(struct sk_buff *bskb,
>struct tipc_msg *msg,
> 	if (unlikely(max < (offset + msz)))
> 		return false;
>
>-	skb_put(bskb, pad + msz);
>+	skb_put_zero(bskb, pad);
>+	skb_put(bskb, msz);
> 	skb_copy_to_linear_data_offset(bskb, offset, msg, msz);
> 	msg_set_size(bmsg, offset + msz);
> 	msg_set_msgcnt(bmsg, msg_msgcnt(bmsg) + 1);
>

Reviewed-by: Tung Nguyen <tung.quang.nguyen@est.tech>
