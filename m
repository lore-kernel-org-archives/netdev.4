Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794968804;
	b=Bd4EDnY+yCkRsIj8H1cDtOgKiNW/IkzMew51iR7mn3r1Fs/+ZeaQjSAHX/niYzanWNvO
	 cIJOmEGKcNpzF5MkFvtSEbc+yxqUBj3BoHGo2/Qyr6Y/lznVl+W/HVUSfO8Wq/Xcyab98
	 FGNLbys/sFBY9I1oZQuAA1SUSK+MrQN4qOmDX5689L4rC7gU7dLE9XEiPuRk4LGOSArTG
	 Sr/rzRP3QLprRkJNuJCCNxyI6Hh8v8vpanT+3wTHTUpU3i3ntxjCf8NcUvLYEu3YSJT4B
	 pxfo4HHXhfDvCj7Arm5/caeRIFgW4S/+OAO9wNgiu9+BUKrmNphqojYV7UrcHbgmTvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968804;
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
	bh=sMgM/2ymy6/9zPxBTvVp121hmA5Vmxhro4TTlX/8H7Q=;
	b=HwjMo9C30mA8/uDN3zTEgaqc2WR9zCnUwiqasZuaQT3TfX5SRxbTZMYo6R+Id7MPTj2x
	 XKaBdSvJYqZbbSVM+YksWZpRs0ZPn9Qlv/YnifUnwUSno63cTWZ+v7jKu0pUWPgEpBTaF
	 ZmkxVaG6owfMjSM5QPJUYurq+UOvZzVMz/duZg2lbpwb1xgtfKvD+1yfNNMU+CQl3t75X
	 z/5KfhZVzSnA1+Tnyd68xwtebF+SBAEmTcFgCxIrF9tcG7EXDVeh3qg7MTInszyh1+ocX
	 COv5+8cVda+R61/JdXWytunfij2ebxIFDGwemsLiWPsRWvakHdmCKDn5x5b5d9VP9gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=MgkqeM8h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.6
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948DB606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=MgkqeM8h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4ygFzRq26dFLYDpoQPTKBz0dYZOpWbWLJpx14bgJ1ZjIrRsS/oa0ZUb9PuA5CQZPKc9GvYoafrgq0mTRVF9c0qevurmc0MBPaPcvkx4gRgeLDv8oSyw68omMRC1YCG+H60J5LtRbb/DlPOYEin4sXcx3+skBBDoqIuMD7zvEXEx69l1aYsLjNChXZQ8EUTDP51AF57SAKJ5PXOh0YgcSEUZ8uqqWL8g3GMWIbbHQrwKHUqdvBkp0rW4p4f075yG59HgsW7HAOVDK0pDWvICWiQ7OTg3094IpfkOowPVo8YgexbatgOVibceFzuiXrxPNR9ZwQo2fGyrt+ZZ5BY3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMgM/2ymy6/9zPxBTvVp121hmA5Vmxhro4TTlX/8H7Q=;
 b=d2UuSI009N1NMo1/QSGTRUrWAGLKOTMdNqaYd1nryEzy4DsUASDg6GvCEVk3nU3CBYj5fHwgVnTShgGSvLwgF4DZhzqjYBJ8NYczLrJGyxxIoGy9nLSYUWJpoAIxgKuBMlSKEooftwDhMTPZDRu+kvuLcQwBtvHufxl7twAoxY8Mp+mEV8on7gLLEb1/NAZXFYZD/oQZo1FAN+AFoVPcEnXRo4+rpKlh0V/toXHhtbnO6+OiNZB43fmt1jsBm5afcMeLmeyl1Cyem4TtvcY+jwgqPow5mT2C4lQfZRNyT4xYHIfnu+1e0QLud42Lgryl/VeXYzDeD6Q2CrrMfHpOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMgM/2ymy6/9zPxBTvVp121hmA5Vmxhro4TTlX/8H7Q=;
 b=MgkqeM8hysM3ETVPxjr137lxIAm5hnb3wZsHGDk+4zTa5Z4q5/XN+lUfZDWjwFMnfitZEp229ajqhhEx8nGsJfkDzRLgQplmsEcFXgULevNChANcxctrGo//li8meJuGaIZIutSZu7FTRAJ4xg+NJ48NMRHuY0UQ5Op9+KuoBtdWRGSvr/Ajonm9dh4OXXem5rYcol4uvIRT668a6LYmgFkMOcYwWsOYfVTmBsaXb3XomX2qoaCcUCAb10fRqWZLqpSMM330ykx7n5fIV7dIxc1JjtMg14Frj6huk/lo5fhHcL98UepxKEiPI6v9paFxc6bnF4ixUv5GJGXotkZ6fw==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by AM7PPFD652E8E05.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:26:41 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:26:41 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>,
	"syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com"
	<syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com>, "lkp@intel.com"
	<lkp@intel.com>
Subject: RE: [PATCH net v3 7/7] tipc: fix NULL pointer dereference in
 named_distribute()
Thread-Topic: [PATCH net v3 7/7] tipc: fix NULL pointer dereference in
 named_distribute()
Thread-Index: AQHddZTZu6BzLgrum0W5vP1Wr+wjt7cyml4AgACCfOA=
Date: Wed, 18 Nov 2026 02:26:41 +0000
Message-ID:
 <AM7P189MB113769D00945716D7A472FDFC67A2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261116063529.6185-8-tung.quang.nguyen@est.tech>
 <179494067854.3136.6305701493862898370@kernel.org>
In-Reply-To: <179494067854.3136.6305701493862898370@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|AM7PPFD652E8E05:EE_
x-ms-office365-filtering-correlation-id: 9e432d2c-c3f3-4f59-2733-08df451b6173
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|261028144727099003|10067099003|261021121427099003|261009223027099003|261102123227099003|38070700021|261026140227099003|261022105027099003|261026121527099003;
x-microsoft-antispam-message-info:
 eM1gD/f7sfClgXjKw1NbIviOTYT2yDbGAGMrj5+cWyJiXcJ9bKI6JHdFwydGcgppQgvzS84+5htqzo+wecpE1hTOXEL0my3CBgmz1XJumJ5zIJa++8QHz+9TTO8eWQag5VtZE3PUwC+MSBo6zagPJULH7x2Bs9zuzZnxH+gYs+mHle3stOSRCeNFRqSUuF2xQK8WkcFD6ylRa+aKQ/fPOOURoHVoIyyg8XMoeD6hy3x24bZJZ6OGIdRz7ZkfZNMJ9qIuBJ6cX0DKpE+a0t6NQSBEb+YLByxKlaHonS9D+TiEeu3bmi63fSDWL/UUzBO8OAti5kQW7UrxkzK06OevDyqI26d81fELZ2ggCY6HEZDtBbpPPwZvutYr77m7rBf8zhDhyZz5JAyEpvXI44xFF7eJMmbrkto90KfvATRfOXLkuHEKYKS4CgWt04yj4qRCqbo+XOBaDff2zYk9mGuM81hT7E2XNXi09I3vwKJle4YPVupETjPBBuNzztZ3wgUTDCoe4VQdCbi3Uo27YP2vlR2C/nvp/JiuQCG6rH3AkNOk5YenvlSNANwYPPvRhOJXTLtvDsVlPrd9yeCkB0q6Ozpip8eG9pQbks/8CsaAkZ2b9psvn3sxrHwtKZ7yaM1OPLiP5mO8YZNg1e39jZT9JRApiPZC5mMKntOc51CFNRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(10067099003)(261021121427099003)(261009223027099003)(261102123227099003)(38070700021)(261026140227099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVh5SG95bFMvck8xUW1tSldWZ01NRm9Sbnk4V01BcHFZNUNYN3U3SWtzZDdm?=
 =?utf-8?B?OW9naWwvZ00yNXNqTmk1NiswaWZQbHFsRWJKYU5aUFN3NWtUZlM2YkVOejhE?=
 =?utf-8?B?alFzU0t2QldRLzczM0hZaVhkWGsxa1QrMitFWFNXaHZvc2x6Q0Nhbnl0K3hK?=
 =?utf-8?B?TVVsekJyZkxmbjlFa2k4ODMvQXhFWDkzdUtmMmlhRjZQNlVVbE1zSFBzSGJr?=
 =?utf-8?B?SEs0djBYL2ZnMFV6eHJDbUxqSHc2YWt4aVZjVG8rQzBpaTZta1dQNTNURVcw?=
 =?utf-8?B?ZGZFcklTWVl3bFd1V3JBcEJwbnJMbHJwMnFQa1UvUFk1K1paWVEwMVVqTWZO?=
 =?utf-8?B?UnJabVJDZnZKS01SVmpWOGU1ell0STh3YUEraGpPMitmTkEwSWphYW5CQ3lK?=
 =?utf-8?B?ZmlndExJV2txeG9LZHljN2ttSFlIMm5KN3hxZXpKUjQ1cklWdjdOaEFxcy9P?=
 =?utf-8?B?dGkxK3FjM3VyeGhGUlYrbzM1YjJnLzFWZHZpZ0lpcDNTcFRwVHhkYVZjMFgv?=
 =?utf-8?B?bnlNMTVEcEVZTS95bHBadnJOMUNnVFVHdXNtT2tad04yMnhwZjlRM3FiRTVp?=
 =?utf-8?B?cjJBSGtCYWMzNy9QQmtwM2s3dCtBajh3aEdxSnZLMUpQTmlPN2xFamZBdlhk?=
 =?utf-8?B?NEN4NURNS2hnMWY2MDZvSTNSOU1aUU1xMTBJRGhSWmhZN2IxQjNobGorb3la?=
 =?utf-8?B?SlJ5OFJrN3Y0OFZwNWJJUTFtK1l3YzB4Tm1DSkM3ZytMaUI3QWFLSWYyV2dU?=
 =?utf-8?B?NGlsMTNRNUtSRnV0YkJtWUxyMmZiRGhva2c0ejdLc3F2STkyRkRRSUlxbGRI?=
 =?utf-8?B?aGJ5c1hJTnNKQUdSbTd3Uk9NOEFJR3ZLcUN2WnlQVXRLTVJGR1dTNXFJQ3FU?=
 =?utf-8?B?YmtOT0cvNWhJTHk2OUxMbTZ0TGl5eTRwMEVqa0puK0hPN3VkcDd6enkvZ29L?=
 =?utf-8?B?MDJpUDR4a2Q5aVVIMThVc2libGc2Mm0xdWhaQ2VXYnhvN3FJZG1OQldFWjBi?=
 =?utf-8?B?RlVIWGNpWTkvVTN1eFdXaXp6ZWFBMXpiTnR0ZklpeU1uOVVQMmhrUmd2YnNO?=
 =?utf-8?B?ZVBoWkx4SlduMnVUOTlYR3BXeUZ1S3hIanczR0FEYVFTczdIM0dtYTJxczA4?=
 =?utf-8?B?Zy9zQ3JSTE5VcURPMnQ3STRaSUNOdDRaOTlCV25PcTIwZCtYY3l3SG81cFMx?=
 =?utf-8?B?elpPRnVaSTBRSTBCS0V1UnBoaWJ4eGhpR3cyOWZueEVpTjdCaGJNUlN6K0xP?=
 =?utf-8?B?bXlJVjZuRkw0WE5lNGdVWjROQkIwUktBU0xydU1KVkEwd2JLQXhEYS9Mcy94?=
 =?utf-8?B?SUNqNWx3dmlwOU1WdEhreUtNaStxdVp5cEZONkpWM0FBQU9NaFhReTNWdEht?=
 =?utf-8?B?UmNDNTNPUSszZmQ5dFppTzBzUFgzYUFxenNGMmRQWTNpbVNOYWc2REVNQUdi?=
 =?utf-8?B?TklDTlZtOTRsOVZ2ZE9tblZmdExBOGZSVkorSmh0UDVNcjRZZzhwRlJZMkc1?=
 =?utf-8?B?dUJkRThPTzhhQ1ZwVU1BMFlON3A3MjRQQjhFeXp6YnRjVFY5UUV1SUFzZzVs?=
 =?utf-8?B?TERXcklKZXI3Y2tmdkgwZlBTVFBWSFBxKzJoYk9OK3R4Ym1tbmFpMlYzb0NT?=
 =?utf-8?B?NzBtMGo1Mkxlb3E4QndOb0NvaUgxVlFnSUwrV3BCUjVGb2x2aFRvUzc5NGNr?=
 =?utf-8?B?U1VDaGRESjRCQVdGMk5xVlNQWWFFTkNicXl2dHpWV0JqT2VsTjRKUFhmWTFX?=
 =?utf-8?B?SHlhYThaTFg2Z2tHRTN3UTUwd2lNUkFlODlGaEdDOFg3L3o0S3FqS05BWkpM?=
 =?utf-8?B?S0V5YTdWWjRIZmZYTTYrVStJZkFjOTJaci8yMy9EVnFNTXAxN21BcXdmaStU?=
 =?utf-8?B?T0djMSsySDdxTnhKSEIwMkJSTGJwVkZmcEhJaXdKTnQwWkhSMDlMdzBkS2N5?=
 =?utf-8?B?MWZnUjdsMERXNytQYVROVzZ6T3pJNnZ5NndvV1dXWER1c3ducnNKVmxERnAw?=
 =?utf-8?B?M3FZQ0lKRHA0djE2Z0pZSDJkV3R1b01sWVVubVRuNWl4S2d5NWlPS2FXRnNj?=
 =?utf-8?B?bHhJeERteVhGQjIvejA1Lys2Q20veGNCU3Bxa1JQd0diRlY4bXNNbU5ieWcy?=
 =?utf-8?B?V0tpWXIyaUV1NGlQbjFGSlg0U2VkMlhMWm5wRnZ3SzhkdkhySG9yZDFTY3Zy?=
 =?utf-8?B?L1pEV1JUQVZ0Tno1aksvWE40YzNNTDlJWFFtM2FUaXFOaFhxWWoyZlJuRDRY?=
 =?utf-8?B?TzVIdGdDbmcwcFl2enJzQU4zZVd6WUZtTVMzWXIzaWlUMTNHSUZJbEllS2lQ?=
 =?utf-8?B?NW1kTHNscEVCY2h5dWhSeXJFdXhlYlBnNUpRM2lTN2pPTVNLTDRBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e432d2c-c3f3-4f59-2733-08df451b6173
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:26:41.0385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hO6oRI0Qacfq7TQaipj83sf1Hjnfp1GjRM2JK41ZXUHFWeETE8QA+cyyjKQcOhyE60+/KQibnScPqEYBQf8HfIeVBPOQi78Az7riicXmjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFD652E8E05

PlN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IHYzIDcvN10gdGlwYzogZml4IE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBpbg0KPm5hbWVkX2Rpc3RyaWJ1dGUoKQ0KPg0KPlRoYW5rIHlvdSBmb3IgeW91
ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDkgcG90ZW50aWFsDQo+aXNz
dWUocykgdG8gY29uc2lkZXIuDQo+DQo+Q3JpdGljYWw6IDAgwrcgSGlnaDogMyDCtyBNZWRpdW06
IDIgwrcgTG93OiA0DQo+DQo+SWYgeW91IGJlbGlldmUgbm9uZSBvZiB0aGUgaXNzdWVzIGFyZSBs
ZWdpdGltYXRlLCBwbGVhc2UgcmVwbHkgdG8gZWFjaCBpc3N1ZSBvZg0KPk1lZGl1bSBzZXZlcml0
eSBvciBoaWdoZXIgYW5kIGV4cGxhaW4gd2h5IHRoZSBBSSBpcyB3cm9uZy4NCj5JZiBhbnkgb2Yg
dGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGluLCBwbGVhc2UgbGV0IHBh
dGNod29yaw0KPmtub3cgYnkgaW5jbHVkaW5nICJwdy1ib3Q6IGNyIiBhcyBhIHNlcGFyYXRlIGxp
bmUgYXQgdGhlIGVuZCBvZiB5b3VyIHJlcGx5IChvbmUNCj5zdWNoIHJlcGx5IHBlciBzZXJpZXMg
aXMgZW5vdWdoKS4NCj4NCj4tIFtIaWdoXSB0aXBjX25hbWV0Yl9pbnNlcnRfc2VsZl9ub2RlX3B1
YigpIChuZXQvdGlwYy9uYW1lX3RhYmxlLmMpDQo+ICBjb3JydXB0cyBudC0+Y2x1c3Rlcl9zY29w
ZSBpbiBpdHMgLUVFWElTVCBicmFuY2guDQo+LSBbSGlnaF0gdGlwY19zZXJ2aWNlX2luc2VydF9w
dWJsKCkgKG5ldC90aXBjL25hbWVfdGFibGUuYykgZXJhc2VzIGFuZA0KPiAga2ZyZWUoKXMgYSBz
ZXJ2aWNlX3JhbmdlIHRoYXQgc3RpbGwgaG9sZHMgbGl2ZSBwdWJsaWNhdGlvbnMgd2hlbmV2ZXLi
gKYNCj4tIFtIaWdoXSB0aXBjOiB1c2UtYWZ0ZXItZnJlZSBvZiBzZXJ2aWNlX3JhbmdlIG9uIC1F
RVhJU1QgaW4NCj4gIHRpcGNfc2VydmljZV9pbnNlcnRfcHVibCgpDQo+LSBbTWVkaXVtXSB0aXBj
X25vZGVfd3JpdGVfdW5sb2NrKCkgKG5ldC90aXBjL25vZGUuYykgbm8gbG9uZ2VyIHJlc2V0cw0K
PiAgdGhlIGxpbmsgd2hlbiB0aGUgVElQQ19MSU5LX1NUQVRFIHB1YmxpY2F0aW9uIGZhaWxzIHdp
dGggLUVOT0JVRlMuDQo+LSBbTWVkaXVtXSBPbiB0aGUgZGVmZXJyZWQgbm9kZS10aW1lciBwYXRo
LCBhIGZhaWxlZCBidWxrIGlzIG5ldmVyDQo+ICByZXRyaWVkIHdoZW4gdGhlIHBlZXIgaGFzIG1v
cmUgdGhhbiBvbmUgbGluay4NCj4tIFtMb3ddIFRoZSAtRUVYSVNUIGNoZWNrIGluIHRpcGNfbmV0
X2ZpbmFsaXplKCkgKG5ldC90aXBjL25ldC5jKSBpcyBkZWFkDQo+ICBjb2RlLCBiZWNhdXNlIHRo
ZSBjYWxsZXIgYW5kIGNhbGxlZSBkaXNhZ3JlZSBvbiB0aGUgY29udHJhY3QuDQo+LSBbTG93XSBU
aGUgY29tbWl0IG1lc3NhZ2UgbGVhdmVzIG91dCBzZXZlcmFsIGJlaGF2aW91ciBjaGFuZ2VzIGFu
ZA0KPiAgc2xpZ2h0bHkgbWlzZGVzY3JpYmVzIGhvdyB0aGUgcHVibGljYXRpb24gcmVhY2hlcyBv
dGhlciBub2Rlcy4NCj4tIFtMb3ddIFRoZSBjb21taXQgY2FycmllcyBgUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90DQo+ICA8bGtwQGludGVsLmNvbT5gIGFuZCBgQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQt4oCmDQo+LSBbTG93XSBUaGUga2VybmVsLWRvYyBm
b3IgdGlwY19uYW1ldGJsX2luc2VydCgpIChuZXQvdGlwYy9uYW1lX3RhYmxlLmMpDQo+ICBzYXlz
IGl0IHJldHVybnMgIkluc2VydGVkIHB1YmxpY2F0aW9uIC0gU3VjY2VzcyIgYW5kICItRU5PQlVG
UyAtIE5v4oCmDQo+DQoNCkkgd2lsbCBhZGRyZXNzIGFib3ZlIGZlZWRiYWNrcyBpbiB0aGUgbmV4
dCB2ZXJzaW9uLg0KDQotLS0NCnB3LWJvdDogY3INCg==
