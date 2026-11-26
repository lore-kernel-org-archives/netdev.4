Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681864;
	b=nKkIIPVvP73rg6sqErhmN7sAailNEFobAmIOY0zoQauFaFupWBEB6wOFRxOVyCYb25Pg
	 CnrNoXYV5cwmAJdHkTlsm0i+cRjgC+o9JWvEKv8zDr8tgOkzeErb2f+eRytWtF3NcS6mT
	 1FgFFvWud5XWmedwXNn3wp47Evm16J43VmxtmscunTIeKtxi2Jr7WhIors2e1ur4Scc5/
	 9F4bMPwuXnT4QSsc4ONmYpKH7iXjJYOV6mrnb10hsvTsf51n+PqCD3e8TsiK5gBFFuY0k
	 C62soAmK2Gxe+SosgJXlsn3z0eGWPXki21y4+89Hy/mAjHxjqByKAxCcZhH2h8Ry1Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681864;
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
	bh=7/Lx0OhFS+3f+HKen43Q0YJGJ+bDLK+azHVADN3AUOw=;
	b=goS1sEQ7j32hKzJdPVgKtj0NESeaschG0nk0ObPqX09/W0ujMjKeqaoX53BngeOy/NKf
	 FLTebWJmgLrSHtiyJFWWZMbZDm3BEd+wTvNVChZWYeZSRCQLk8ptPYb3wtFEKDJbMo4Ac
	 IpVVOObUNu+vye+VYaIc2+4Ar79FdwE61OK8am9O5rtkkvuYoupd9mraLbOkA3BhkVpG5
	 T/2IFg9aDwCuGaf+bRHwdj4B2nof9LuKuSpwp4Sx0eMWhRKRXEbi2MjrTLhdrayhggNt/
	 v2vutEAxsSlgpiNOPPw6bDtozSKqzgGu+1iu02tonG/kLJxUcy57bt0k58ugrQOfpJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=HL5QqxIC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.62
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC0606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=HL5QqxIC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWNwZbXptnCd6al9H92GWv6xLxyZg369oMJkiGrhP9hG+tRpXA5hcyy4xmoKDzwItJl37RgPHiDMkXPakounIp2MLGOP0OTwr1gqO3vLUbY24ehlWQdq6NGmiuE6K2onPE2G2n1x664whuBRjGkOX730NhuiluvNpTAD+vF5+ZwYNYVZFpZFjpwmJVosg/hAF9i4tI1wC0aCGz4yRabu5RG+3Gevy/B1XiJ9DfQ/FRw9SoUjwfeiz/FnaoYaRtK6VqZvQLpjEeC//OFo/x7aV9UmbIdJq7Cv1mDPynbm0I5qvrfKor4p175i+KSNfUmlC9u9rIISDSy8Fai600p6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/Lx0OhFS+3f+HKen43Q0YJGJ+bDLK+azHVADN3AUOw=;
 b=xBAO9Wdh7Gfg8vSkersSF1nF4zuaL8t9VHACJlFSnj+T0kRh6fEpJtqRSRSOn+JjJ/OWKqZPwt6CKDb7kJ+H6l2v9CqPdFXYQzBnTekOSI8uWy6+VUe6kmTregplbkWrL5a8RZe7rl4lSukvKYWj2gPC6y6K48kE7KdQKO+oA7I0ZDzDCKrk9wGEYbmMqMQWInv8q1JLD3HNDCUZ2SaOLhLIx2hU5Qwpe0405f4l0cxxxNC05lGGrvz0AzpU7GMlRR/tsq3qjICJ0Ou6ElgJyc9DuhmbEEQXl7x4PJokSka+Pg6mNAv0MmbNyoqeYRtJtx0CNb1eHq7D5lQogjPm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/Lx0OhFS+3f+HKen43Q0YJGJ+bDLK+azHVADN3AUOw=;
 b=HL5QqxICRxn+lehL78Owp7sOjm9Re3Gx7RFAVGXZ1XBbYTsc+WlBYp0wY+pOlMZ2FGOP2RrhE49Nviwqs1M/KR31f9UhUkquBjmVc6K3hlOJjmDiZrL+iZCWrOgyk05RKkiYaEdwePt/K/fn8Xss8CAZKrDGOVMu2n1nd30QJy9D/9QoXc0b0nhDDlnRunguens0aW5VmMlkK/GE+d8XCERP22wh5OqYOnScJIHiyJnLdF+bHhtkLHBZnexl8Nv1/geAE3yFMkcCraalNvljihUXaNpDUZA/8/TcYC3hbew7rv/Fpc+xqYe4uQzefQXQgsF6smpBup5PurqKfv7l3A==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB9P189MB1881.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:31:00 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:31:00 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman
	<horms@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net] tipc: initialize the whole connect retry delay
Thread-Topic: [PATCH net] tipc: initialize the whole connect retry delay
Thread-Index: AQHdfIFn0K18MqnvaUW3mOoflxoFj7dAB5AA
Date: Thu, 26 Nov 2026 08:31:00 +0000
Message-ID:
 <AM7P189MB1137284B0ADC201BD75EC547C6422@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <179553307367.1670514.861086873017775410@gmail.com>
In-Reply-To: <179553307367.1670514.861086873017775410@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB9P189MB1881:EE_
x-ms-office365-filtering-correlation-id: 5cd9165e-86d7-4cf3-ec78-08df4b9799cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|22082099003|18002099003|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 jNpqia+p4baCCa0v5Qqo5Zo1535KZPcJTENnQnk8gT0q+bPsfRjmAuF6HENI7ArK59mAJ6VI7xoCo9NWYs1iGqC9TI7DznJSv7wIJzeEYzfr7T0KE4Pw2VsDlkxB3vzQruWhxnNy7uygT2N1ZhABJzXr/HMscBfwv8M9W7uEcvu1cBY05voFJb+dGYHqbZHDXZV2qo+skTm8lMkW/nVKhj71xnzbasMsou0I7p+6Xqj5yeg9hsry5hBYc+Szp4Hj8OGRR/WoxEaZKurHl41qd65KqWLU3RS5LYiFMVTgSbVPCbI2YlF5MHrkhA+HnrRmYT+d1lenGqZlq4Nj1ne7H1WWg8cG8+A8C+D3os6kL9YoXjSq/ootRgtdU03wvtl2GgEhP/teg7JaI7Hn2YneL5T/5zR2HRHICGMn28xE3/WQH6JHZjS3CF0y1CA1een+b1QVshMYxBZj9Cc/7I/AUSInerFOr+8QHtWEuhLHtUY+MvbXTvGN+YcZL/6K5KRKxJNnZkYzaH4zxIVyPnMriKlIJ2zn7y4IhTvfW97EeLK4/yLADcaWX5kjEBW2C8zGW4J4IXsefiAwoYt0kwCuuuIniTbwPMbuA7xWmgJi8BaAkismtdaD7wcz3cvcZpipKOjhPSYG6zoB+HkFn1UP1841mGKcyYV7wxwex6Enkzg1Tdfv8RwWNgBQja+wdNAf5M+jHUtITVsJkowoye57+w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h7nvRBKcrhap6EoKqgMoSHHS7druUvGiadm/W+jslkaeA9d9vJrNcneCBxLX?=
 =?us-ascii?Q?bPa+5GT9LjC/sgJ2kt5dLK86mJntAsbErdhpMg7xvgxCIFE2sp57/KxcIWni?=
 =?us-ascii?Q?EiKY7VqJXHWVuT7kCeVyCX/ifrdj3zzp6qewXKmlT6ga0Aw2mHl6y7nsCfd4?=
 =?us-ascii?Q?ui9KD69iQ3wYkZRn3Dx+3oOSrZHpahE6i1oUDqq1Gp/D8d2h2eADa2kYl+8T?=
 =?us-ascii?Q?Ye2ytdWoVFhHfDo/yUKlyZ4+pauGlTMLr3Xq136s4hxzlyop7eI6IsF0GnDM?=
 =?us-ascii?Q?n05t+Vmn+GkBxieIVirg9DrUDy5VfDFhj9d/3KL9Ed0ToV0KBBDQUAD9avfc?=
 =?us-ascii?Q?YqHRAdDXav8ieGXxC0L3QCI17bw2FuARpA7LBQp6TOEClru2rEkESFl7pKxg?=
 =?us-ascii?Q?QJi/i3Xk34eQA7rcI/0Wf6rcg4DXBmKubItLZ3MG79k/xw7VjUIktm8JuJ8T?=
 =?us-ascii?Q?b1F8y4zGs9eXvD02cRdvTj3Wj6L41tGJgjt+H6F1AQeubHHlja8UOM+GchiG?=
 =?us-ascii?Q?2Po+QZNqLXWW+8j44QiTWMn3BshsOaA6tH954jIDoGgoXKQWfz55M1HAA2d/?=
 =?us-ascii?Q?A5ZDDubwJCtw4NWKWN+hV5zTmEmcLHs+LRieQgpp4aSRZ2c/jW1YTWHh/vSE?=
 =?us-ascii?Q?+fE7tGGAmhYVgYbtCKKJDKu6jEPkOBkxOjk2cA3IWURgO9ERK/dxqpas5s8Q?=
 =?us-ascii?Q?pfn0VnoLXuZXWp+Nox0+Zcsv7UumhMVG3HMBWUjo+lmJhbpJ+QowBzG8xcgR?=
 =?us-ascii?Q?LBJmtdK8X3HgxQgBkV4ByNb3XiqwQ3IscpcG7lzXD/VZmax/DWglqJ55YSb+?=
 =?us-ascii?Q?ODidQW1bE6Hha7aFEP7+5+HDvxT/9PtB38KxOjQk/EGnJpqlbedsjD/n2x8g?=
 =?us-ascii?Q?tAcqNW949mwSXH59+BdTe7VEXmpvaf/g1Zu4pHzvKdU8WPOWLu1ZbSEmu1XB?=
 =?us-ascii?Q?58kDfnhWXGK2aZk16IaFxzBvtmBAYLxfntWX8QcJXTVXYU1HU62rbBAwvKEa?=
 =?us-ascii?Q?WtP652RQndfSEzS8IIrsJ6XXaOAnpAa+Ren0Ae4VHGZvgYTqReSGi/XGiXp1?=
 =?us-ascii?Q?C99eitgYws7uGxRfus7O0s7l+s+puwAPus3z/Pxg0xSFggAEKW0TLKwb6YSn?=
 =?us-ascii?Q?vGa9HFpBn+ulJsrrCOCfm4crMv1ZShNO7PUebg8NczHJm33k2jqP9ddvan9T?=
 =?us-ascii?Q?XRcLgozT/CVe+YIa0b4gs4NLDASv2DUQyUhxNeFnZrLP3qQPWhAuGPLVB9mE?=
 =?us-ascii?Q?/KiAbdIcFZnTAJhllZH6+15YY+SOOywYjT3O1cEROrzGs7GySIeRfg6W805M?=
 =?us-ascii?Q?ahAghVfet6Ouv9vMP7bd58AMx2uhWLsF2IptgjCVekSOGO9jBm22wMJCtiVo?=
 =?us-ascii?Q?xrP+qUM6AfRi/qQ7uXe6ljwLXUZxcGajogUaAQ4dSmK+cv5tMKd61hZK2ND6?=
 =?us-ascii?Q?6nD7CkakQwG16UXvH4fahKkPxD5Pda9pa9CaJzXqvZ2ayKLoRwbB3xq/1blj?=
 =?us-ascii?Q?emSKFdS/swOPPiT6AKi4m+6Gz3j5oM9FH8MzIFGz8Px1cCh9S1RL144N/aYa?=
 =?us-ascii?Q?RC0kL//zEqRwGH+E9h/Ug1ozh+49yhhi9wBVd8ceVUIo1rhpaCPxS2LNWbiY?=
 =?us-ascii?Q?IMWU+SXGSluXCFdUHxJan3N0Hb2M90Mcl2LGeligFq7vfY0r2pTmWr0di9Qf?=
 =?us-ascii?Q?k8iPm7V49g9RAn6OJEc8mhgQij0Xgi/Ja5PQ7HpzE+8A1OhjIpq0ciHwl5LX?=
 =?us-ascii?Q?JlirS02URQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd9165e-86d7-4cf3-ec78-08df4b9799cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:31:00.2338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1CksM7gXjDsjxXhuLFMvskWKPxx/7j4B9wUSTqV8QWaF+WkVvKKpRPmZmybKnrQ3htJu9kXOAC6u07bU9SityQigFpuifR/+2jo2v8B0ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1881

>Subject: [PATCH net] tipc: initialize the whole connect retry delay
>
>When a connecting socket gets TIPC_ERR_OVERLOAD and still has its SYN,
>tipc_sk_filter_connect() schedules a retry after a random delay:
>
>	get_random_bytes(&delay, 2);
>	...
>	delay %=3D (tsk->conn_timeout / 4);
>
>delay is an unsigned long, so only two of its bytes are random and the res=
t are
>whatever was on the stack:
>
>  BUG: KMSAN: uninit-value in tipc_sk_filter_rcv (net/tipc/socket.c:2244)
>   tipc_sk_filter_rcv (net/tipc/socket.c:2244 net/tipc/socket.c:2379)
>   tipc_sk_backlog_rcv (net/tipc/socket.c:2422)
>   __release_sock (net/core/sock.c:3344)
>   release_sock (net/core/sock.c:3941)
>   tipc_wait_for_connect (net/tipc/socket.c:2559)
>   tipc_connect (net/tipc/socket.c:2658)
>   __sys_connect (net/socket.c:2185)
>  Local variable delay.i created at:
>   tipc_sk_filter_rcv (net/tipc/socket.c:2207 net/tipc/socket.c:2379)
>
>Use get_random_u16(), which gives the same range.
>
>Fixes: 6787927475e5 ("tipc: buffer overflow handling in listener socket")
>Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Tung Nguyen <tung.quang.nguyen@est.tech>
