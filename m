Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794968220;
	b=4YT1TQiwur12ZEMaHEyg+NgCjyOyWwuQrl032bOCeyNiEVRGSfH6PF251yfPoffnL/cR
	 ZiJnbgsUywy/eZ4Pv+5NAJI08z3MsPuo9VuNQhqMAvNuhp9xEVf6CpRtimNi78S8qf0yN
	 /7y0pP+bambIzu7sBHDJXnq7qxQ62k2odYPOSWmN5iDqIOhDho0kgfx+OXYFpJ8RHeE8E
	 zZMCCNQZbscAIqR2oTwETlGJ3HYHGoz8WHwSz9gun4mqQoAeZLdHtpR2lzOp7qchslYqO
	 T9XUv4iiliXZ/o4KpK9DCvHyLZnRCJynlAVvB7Rr5JDogoOG7eJk2COxIZSwCWvomwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968220;
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
	bh=nd041T3k6pk7SPzqzhTTSGUg5GaOE030JE+Yw8DDxvE=;
	b=BSWtSmwO0u/Yc3h/wOw8OBFtQPHAv2pstZbNhFDNLMzsxffNbx5vXHSc0geUfxCGAljz
	 VLkD8mgjb8QwHjuiLZgL99JT2CzV8w3cLzc1VNPaAeUvb+VXtSHaDLapd61Z7RceWqySU
	 opogkkUGECcI4BHHZSh3UnZSeDJJLXS8P3uP5pzptzBV+smVJnL31MI8hfFbvLCvpqVyx
	 M4Bzbc6DQOY1FGOSMk42BzBrU85gjMpv4qsMC+4LLUQQWtRfi4X8HLWYiuIRR29YgJypj
	 jAOWJQBT+k9Fmn5Yh150LVSUP7hrWPrwPIagrVwV8vfijP/23uE6yyya2ag+LCBOrIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TBHXLGV8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.29
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF1606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBF1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TBHXLGV8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbgZciSqsEL7mLCWn45ppOSsPZWsJ9oJmrh9qnN+Qn4I79dmVQSh6jNoMsBmsh2g6SuBG2tfpVW9NCgZXJlybp2KNH5mMsosJkwDQPzQbzh2tQMzNuZiSB168nFltFuRvW0fZUieSpwTed6m7HXLA/qoxHFnzqOhCbuAEKPNVw7IVcpVdSanlP83GLaGQ3r6Rej2TZSyYnNILZlpLN7BaAcRUHk/IiEXh0lD1yIZgYC7tyn8MhIUX60JZLjEwvEn/EcrwxUslx6A/JB+ijYFS+22ZjugKQrjd7cc+9DWb64cJ+iDXPrd/svV71lTnBYAsHv3iKrkmOdSLoV+nVdnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd041T3k6pk7SPzqzhTTSGUg5GaOE030JE+Yw8DDxvE=;
 b=CEkJTnMc0ZGrm5HWpjDVJEeKabi/IGbcdnMBs+KKgd3koIILZ8AbvUghxGv8CeIbO1ITeQmpBNJ0oAKXj90gzER4u1c1I+PTgvBRNEPTX06LeUSv2bBQprq+pmHBJggeOG4mPawBnU2/b3HPwMaHPYIJGfok5Tca9lBb290MCOESiWZF12bQ0kDHuBIx2SaJpnpmyNh6nNgJSQeiZTWDmJQarltQLqY/qgiffFub2kzaxwBfpcqixQbSwe2kLVO9PS1YzIDVYvCG9ca0RD3dM2Ev/wU87bx0L9LFHgkTy+9NmiWTryuJDn6iXtzemYzjrAX1CeMkYDlRXU2ijixNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd041T3k6pk7SPzqzhTTSGUg5GaOE030JE+Yw8DDxvE=;
 b=TBHXLGV8Gun85s2aqPIsVZDVBGRBhMsnx0UvTewtU1Ar3SymzA2iaQSeuYpsnA9W87l0S3++majaXD32CCESstxT0NH1fNG7stI9ykaJesUzOJiy0AiM26TbloUnhNX16Yfhtlj4MqSfkClyxvSYpKtwfxF1gx0505HSxioMdNMA4N9HqLafZFq6TFyHgmlYJh9TFB/1v/NMuejgxQCycLvcu6l5CepAf5FRp6Kwdwf/jL+HhMhzDgL6Wf2ZPp1hPTLWpn0UeuyPMH+/P50hBIPeFC/sdyaWWsqmRyuRZ0J+3/EWNUYJAdf7L8NCawgy8NW3Fi8GqIoNcH+Z13hOtw==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB5P189MB2520.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:16:54 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:16:54 +0000
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
Subject: RE: [PATCH net v3 2/7] tipc: fix dangling link in cluster_scope list
 in tipc_service_delete()
Thread-Topic: [PATCH net v3 2/7] tipc: fix dangling link in cluster_scope list
 in tipc_service_delete()
Thread-Index: AQHddZTCWC72YW/a1kKze7zfNkCNlLcymlmAgAB+LVA=
Date: Wed, 18 Nov 2026 02:16:53 +0000
Message-ID:
 <AM7P189MB11370C17DA018DCE455FEE07C67A2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261116063529.6185-3-tung.quang.nguyen@est.tech>
 <179494067383.3136.15883783633463671421@kernel.org>
In-Reply-To: <179494067383.3136.15883783633463671421@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB5P189MB2520:EE_
x-ms-office365-filtering-correlation-id: 79d58d79-253e-488d-a78c-08df451a038f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261028144727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 sOKOrUpMHmk8dW9Tz8IUjoTiYXwXk8VB2YdZP5105uniqcAnySLyoTqdN+ULNw7kR/1+L58YOwf+YJJPkq3JcFpS8cHH9onP+puKSzPSCXIPqK4YiSTj9foRSIGYOKdmgDTPOQ4bhr0jc1U5BQAJsl99IsP0ytLnPfT2Z81/x1dteB+1QdUGMx/hwmDx3mjjohBJV3lZLAxU4Q2ww4TjJ943gqFcNHTUoo1qmk6moqRDFFAcaHZsZ9aJJwTPCIFzlHjwLohyvVgGVpwukbslz9r2osXgC3OVF/jwfNl7MENoSTHJSnVxMa3WqiPVEuggdScwKWQjfFVEqAfnCvQQmLFLcTCRNNU4YvVDWG6v/ppTG+CvFlVIyqjcrIBZCZnIGUTfJkiubIILz6AeO+19R2jg2wmX4rWmiY+55X9rm0NIFCm5RsI88l2XmVl4Vhvt7bkxEMJ0S1F50rQx7+a1MuDGOdJM/SqL9y8wrNJx7X5DeNKNYO94RLiWdbVPjF/oXklUTbWVQ4SCyzxg4bdc1T1sphk6NN4Sh/BUKLdFB+xw3byT/gAJBc+wKf3u3o4GYrpZaeHHEf73VvTEqglDdaMmCmbUvlX3d49OGDu0pOKEwLEP+Lyqw5FwTZmA8a1jY9ctjLQZYq8MGKqXr5OzVnu6UGfJPsl6slGvO4QVaAyh+S2v6C4Zn0YXKe4CUMMHn18XisSEQm38xazxffTwe6DCSYxJ9iE1qFuBbF/6HSQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261028144727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjdpV0YzM29LUjJhSThxRGZiZnpGMXptc2htcjBxMkFibFVQMnUvWE15cnJG?=
 =?utf-8?B?a20vdVY4cThHd0MzQU5wNHJma1NITUVoSkJIaEplbGxSWWd6cEh6dWxvMDhN?=
 =?utf-8?B?emwzdE9INmJSSGhWbyt1NThMUHBxbnhZNXQ3T3Z3RFAraEtmMG5wZ1hUeDlR?=
 =?utf-8?B?T1BHSXhaVmp5QSt4TjZXU1djR3NIWjFhWkdEajJTd0IxZ25saUp4aUxYVDE4?=
 =?utf-8?B?K3RQSGRmUUFLSVdJbkFmei8yeDJPL0t1Wnk4ajNvSFM3MEYyNkhkMTc1b3lJ?=
 =?utf-8?B?bFhsZ2tUVGZGNnprbmpRTWVFdDAwM21OYmgxV05nODlMQkJjNUFyQzNtT25U?=
 =?utf-8?B?L0UydWNpQ2lwVGxqUVVuRllZSTNqajRoS2hTakJ3ZjJ4QjZHNG5PbUtlcWha?=
 =?utf-8?B?WHhpTjU2ZEYyRnVYZCt2YVZUcHd5SHRnVGRiRFNmR3ZKYU9IeFFibUFoTnpt?=
 =?utf-8?B?RWNPWnkrWjkzNUMwSEQ4cTZHNGNla1R3Tjh0NUs1RXFtZkdTcWJ2Slo4c2Zm?=
 =?utf-8?B?dnNhbVJCUGtoWVliZXNReUxWeE1EUDROUEtLUEZNaVdUc0tMWm5nKzJqZG5V?=
 =?utf-8?B?cE8yRjJqZTdYY1JOVittU2lRWDAwVDhoY1dpdVVSdUMyYXpoMDg2bHZoV2R2?=
 =?utf-8?B?dDJVWDZaVk5vclJ2aTd4UGpLd0hQdTJLS0pqYkd2Q3ZMck0vYzVjYU8rMHQr?=
 =?utf-8?B?a2swR1pFamNTcC80bG95ZEVtbW4vK1orb09vUGZNSkxMRVoyL0NkdHg3bWVp?=
 =?utf-8?B?d2NFUVRDeTVqVm5CbXZ1RmZBNGZCQllQVUtVZEE5dGpDekNBRktMYTVtcGZP?=
 =?utf-8?B?L1pKbGtHd2VxOHFjT09XaHdvaFBMU0VKLzRxeEJXQWVzWnZsYUllYlpvYlN3?=
 =?utf-8?B?c25XMG9sNndvUk1LTStOUEN0Wk93NUtZU3VMcGdYaCtHNERpcVlEemtPbU1v?=
 =?utf-8?B?c05UVEwxWnZJdTJzaGRKNTBTN2d1UENGYWFUVDN6SndpQWtkNW1pbnljMVFn?=
 =?utf-8?B?Q0FRaHhyOCtoRU5Ta1JodlFFT1lJaXQ2UmJXMGlCVDhpRTdBMW5IcFc0bFBj?=
 =?utf-8?B?OVBqOHdmMzExV2NJSmlZZmE0TmlWYTFKWmRCK0Z4ZHZNeVZHU0w4QTFWby9x?=
 =?utf-8?B?STNwaU1HUXhydnlIeDEzYUNBTENmbldMV2RTYkY1QW81OUw1RHBVOG10d3dR?=
 =?utf-8?B?cW54V3ZCbzc3NlNsbnFGMHcvK1Z1dHQvNjlpek5YWE5UNjkzZGJoa21kbHRk?=
 =?utf-8?B?MTRJRFYrekhLZGh6cG1EdWxxd0pJaW14RFVQTEwrZFgwenkzWW9DdWFja2Jt?=
 =?utf-8?B?U0VWcmZXVVJuRDJzQmFrTzEycDBxdDFIdEJtbUtEalo0U3Y5Wm1qNkY3a3Zt?=
 =?utf-8?B?WWdzRlVlckF4akFMcnFyQUZPcjhmV2ZXamhlUU4ySkRpNEhZTVNZTzY0OGVh?=
 =?utf-8?B?K2RZNkhkYzd1TXM1ZnFGT3BhVG8xeCtIQWFINUc1U0YvNVQ0VW8yQzdPMG51?=
 =?utf-8?B?a3lOd2xvV0htSVRTY1JzSmxoYkE2eXByLzRHLzZlaG5PbUZiYmlWUnBnblVM?=
 =?utf-8?B?NVhVVkNlckFnaTBGTXpWVG1XdkVRWW9Hck9pTFhOUHp0L2xpK1M5K2o3ajR5?=
 =?utf-8?B?dnBPNkxoaUVDcWRCS1lIR2VWeFo3Y3BmMml3bE4reEx0S3NrSG9mZjZZbm1Y?=
 =?utf-8?B?ZVM4L1h2RGdSSjNyZm9yaDVWakFPL1k1SVhKNnJDRDRXMC96U01FMVpqZjJs?=
 =?utf-8?B?WG5PTC9JNEc4QlRYeUp4Y0djYWJSelFGamxTNHAvVTJDNk5Kbml5TEpvUThV?=
 =?utf-8?B?VzE0QUlYWTlDM04ydEM2Z2xidWVQN2tWRUNVWHVZZHBtRENpeld4SlFwOHg1?=
 =?utf-8?B?cmtCcjFraHpNUnRXWEJzeHpBUnhhMkVVWldISUlVb1dYRU1KN0FsWk1kZHVi?=
 =?utf-8?B?c0NZZzh1UUV1RWx1ZzU5NGt6R3J3aHdKVjNsU2VWUVhSTUlvQzFlSXg0dlU1?=
 =?utf-8?B?bkRsMHBzWis3WElHVGdpUGRXeTU5QnBIb05QSHhlVENUSXc5R014Rko0cG5Q?=
 =?utf-8?B?Smd4RFNIOS9meDZwK3pBRDlOeG5tZXFnaU5rcnRzTjQ4MTdjRTZKeFd0cHRt?=
 =?utf-8?B?cjRQUUZIS3pscEFFWVBQUUdPMHNkSUFNdmU2UkUwRzNpY1Vtb1VNNk85bE1v?=
 =?utf-8?B?UkFuM0RWUExOVXNZNnJpSjFUUWU2RUFCMWpROVI3bFRXS1Y2SkRyU3lmeHR5?=
 =?utf-8?B?TER2czJ1Q3BvT1FvcWZrT0tNZU41c29rV2htOGxQZTFUMS9zYzNpSU5pdDQ0?=
 =?utf-8?B?eFQyK1Y1Q0hEZkw0NlAvK091cVJ5SFJvaVBtR1l5SnV3alBJOWlCUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d58d79-253e-488d-a78c-08df451a038f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:16:54.0107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RTscdmxTTelob7Ot8MZxyvZLpU70jRmC5wyMVwnbnMZwy9bBIlTVzQ+oCj2JSK4VdjqX/Tir0xR4XPQ+StVw4p/pv0gJm88A4kERUPtgC2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2520

PlN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IHYzIDIvN10gdGlwYzogZml4IGRhbmdsaW5nIGxpbmsg
aW4gY2x1c3Rlcl9zY29wZSBsaXN0IGluDQo+dGlwY19zZXJ2aWNlX2RlbGV0ZSgpDQo+DQo+VGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgbW9y
ZSBzZXZlcmUNCj5pc3N1ZShzKSBpbiBvdGhlciBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzLiBUaGlz
IG1haWwgaXMgb25seSBhbiBGWUksIGluIGNhc2UgeW91DQo+d2FudCB0byBhZGRyZXNzIHRoZSBu
aXQgcGlja3MgYmVsb3cgd2hlbiB5b3UgcmVzcGluLg0KPg0KPkxvdyBwcmlvcml0eSAvIG5pdCBw
aWNrcyBmb3IgeW91ciBjb25zaWRlcmF0aW9uOg0KPg0KPi0gW0xvd10gVGhlIGNvbW1pdCBtZXNz
YWdlIHByZXNlbnRzIHRoaXMgY2hhbmdlIGFzIGEgYnVnIGZpeCBhbmQgY2Fycmllcw0KPiAgYSBG
aXhlczogdGFnICgxYmI4ZGNlNTdmNGQpLCBidXQgaXQgbmFtZXMgbm8gY29uc2VxdWVuY2UgYW55
b25lIGNvdWxk4oCmDQo+DQo+LS0NCj4NCj50aXBjOiBmaXggZGFuZ2xpbmcgbGluayBpbiBjbHVz
dGVyX3Njb3BlIGxpc3QgaW4gdGlwY19zZXJ2aWNlX2RlbGV0ZSgpDQo+DQo+VGhpcyBwYXRjaCBt
YWtlcyB0aXBjX3NlcnZpY2VfZGVsZXRlKCkgcmVtb3ZlIHRoZSBsb2NhbCBub2RlJ3Mgb3duDQo+
VElQQ19OT0RFX1NUQVRFIHB1YmxpY2F0aW9uIGZyb20gbnQtPmNsdXN0ZXJfc2NvcGUgYmVmb3Jl
IGl0IGlzIGZyZWVkIHdpdGgNCj5rZnJlZV9yY3UoKS4gVGhlIGNvbW1pdCBtZXNzYWdlIGNhbGxz
IHRoZSBsZWZ0b3ZlciBlbnRyeSBhIGRhbmdsaW5nIGxpc3QgZW50cnkNCj5hbmQgYWRkcyBhIEZp
eGVzOiB0YWcgZm9yIDFiYjhkY2U1N2Y0ZC4NCj4NCj4+IGRpZmYgLS1naXQgYS9uZXQvdGlwYy9u
YW1lX3RhYmxlLmMgYi9uZXQvdGlwYy9uYW1lX3RhYmxlLmMgaW5kZXgNCj4+IDZmZGEzNmFiMTc2
NjkuLjczYjAzMmJhMmY4ZDAgMTAwNjQ0DQo+PiAtLS0gYS9uZXQvdGlwYy9uYW1lX3RhYmxlLmMN
Cj4+ICsrKyBiL25ldC90aXBjL25hbWVfdGFibGUuYw0KPg0KPlsgLi4uIF0NCj4NCj4+IEBAIC05
NDEsNiArOTQyLDEzIEBAIHN0YXRpYyB2b2lkIHRpcGNfc2VydmljZV9kZWxldGUoc3RydWN0IG5l
dCAqbmV0LCBzdHJ1Y3QNCj50aXBjX3NlcnZpY2UgKnNjKQ0KPj4gIAlyYnRyZWVfcG9zdG9yZGVy
X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc3IsIHRtcHIsICZzYy0+cmFuZ2VzLA0KPnRyZWVfbm9kZSkg
ew0KPj4gIAkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHAsIHRtcCwgJnNyLT5hbGxfcHVibCwg
YWxsX3B1YmwpIHsNCj4+ICAJCQl0aXBjX3NlcnZpY2VfcmVtb3ZlX3B1Ymwoc3IsICZwLT5zaywg
cC0+a2V5KTsNCj4+ICsJCQlpZiAocC0+c3IudHlwZSA9PSBUSVBDX05PREVfU1RBVEUgJiYNCj4+
ICsJCQkgICAgcC0+c3IubG93ZXIgPT0gdG4tPm5vZGVfYWRkciAmJg0KPj4gKwkJCSAgICBwLT5z
ci51cHBlciA9PSB0bi0+bm9kZV9hZGRyICYmDQo+PiArCQkJICAgIHAtPmtleSA9PSB0bi0+bm9k
ZV9hZGRyICYmDQo+PiArCQkJICAgIHAtPnNrLnJlZiA9PSAwICYmIHAtPnNrLm5vZGUgPT0gdG4t
Pm5vZGVfYWRkcikNCj4+ICsJCQkJbGlzdF9kZWwoJnAtPmJpbmRpbmdfbm9kZSk7DQo+PiArDQo+
PiAgCQkJa2ZyZWVfcmN1KHAsIHJjdSk7DQo+PiAgCQl9DQo+PiAgCQlyYl9lcmFzZV9hdWdtZW50
ZWQoJnNyLT50cmVlX25vZGUsICZzYy0+cmFuZ2VzLA0KPiZzcl9jYWxsYmFja3MpOw0KPg0KPltT
ZXZlcml0eTogTG93XQ0KPg0KPkNhbiBhbnl0aGluZyBhY3R1YWxseSByZWFjaCB0aGUgbGVmdG92
ZXIgY2x1c3Rlcl9zY29wZSBlbnRyeT8NCj4NCj50aXBjX3NlcnZpY2VfZGVsZXRlKCkgaXMgb25s
eSBjYWxsZWQgZnJvbSB0aXBjX25hbWV0Ymxfc3RvcCgpLiBUaGF0IGZ1bmN0aW9uDQo+ZnJlZXMg
dGhlIG5hbWUgdGFibGUsIGluY2x1ZGluZyB0aGUgY2x1c3Rlcl9zY29wZSBsaXN0IGhlYWQsIHJp
Z2h0IGFmdGVyIHRoZSBwdXJnZQ0KPmxvb3A6DQo+DQo+bmV0L3RpcGMvbmFtZV90YWJsZS5jOnRp
cGNfbmFtZXRibF9zdG9wKCkgew0KPiAgICAuLi4NCj4Jc3Bpbl91bmxvY2tfYmgoJnRuLT5uYW1l
dGJsX2xvY2spOw0KPg0KPgkvKiBUT0RPOiBjbGVhciB0bi0+bmFtZXRibCwgaW1wbGVtZW50IHBy
b3BlciBSQ1UgcnVsZXMgPyAqLw0KPglrZnJlZV9yY3UobnQsIHJjdSk7DQo+fQ0KPg0KPnRpcGNf
bmFtZXRibF9zdG9wKCkgaXMgY2FsbGVkIGZyb20gdGhlIHRpcGNfaW5pdF9uZXQoKSBlcnJvciBw
YXRoIGFuZCBmcm9tDQo+dGlwY19leGl0X25ldCgpOg0KPg0KPm5ldC90aXBjL2NvcmUuYzp0aXBj
X2V4aXRfbmV0KCkgew0KPiAgICAuLi4NCj4JdGlwY19uZXRfc3RvcChuZXQpOw0KPgkvKiBNYWtl
IHN1cmUgdGhlIHRpcGNfbmV0X2ZpbmFsaXplX3dvcmsoKSBmaW5pc2hlZCAqLw0KPgljYW5jZWxf
d29ya19zeW5jKCZ0bi0+d29yayk7DQo+CXRpcGNfYmNhc3Rfc3RvcChuZXQpOw0KPgl0aXBjX25h
bWV0Ymxfc3RvcChuZXQpOw0KPiAgICAuLi4NCj59DQo+DQo+QnkgdGhhdCBwb2ludCB0aXBjX25l
dF9zdG9wKCkgaGFzIGFscmVhZHkgcmVtb3ZlZCB0aGUgYmVhcmVycyBhbmQgbm9kZXMsIHNvDQo+
dGlwY19uYW1lZF9ub2RlX3VwKCkgY2FuJ3QgcnVuLiBjYW5jZWxfd29ya19zeW5jKCkgaGFzIHN0
b3BwZWQgdG4tPndvcmssDQo+c28gdGlwY19uYW1lZF9yZWluaXQoKSBjYW4ndCBydW4gZWl0aGVy
Lg0KPnRpcGNfbmFtZWRfcHVibGlzaCgpIGFuZCB0aXBjX25hbWVkX3dpdGhkcmF3KCkgb25seSBy
dW4gZnJvbSBzb2NrZXQNCj5vcGVyYXRpb25zLg0KPg0KPklzIHRoZXJlIGEgcGF0aCB0aGF0IHdh
bGtzIG50LT5jbHVzdGVyX3Njb3BlIGJldHdlZW4gdGhlIHB1cmdlIGFuZA0KPmtmcmVlX3JjdShu
dCwgcmN1KSwgb3IgYWZ0ZXIgaXQ/DQo+DQo+SWYgdGhlcmUgaXNuJ3QsIHRoaXMgbG9va3MgbGlr
ZSBjbGVhbnVwIGF0IHRlYXJkb3duIHJhdGhlciB0aGFuIGEgZml4IGZvciBhIGJ1ZyB0aGF0DQo+
Y2FuIGJlIGhpdC4gU2hvdWxkIHRoZSBjb21taXQgbWVzc2FnZSBkZXNjcmliZSBhIGZhaWx1cmUg
dGhhdCBjYW4gYmUNCj5vYnNlcnZlZD8gSWYgbm90LCBjb3VsZCBpdCBwcmVzZW50IHRoaXMgYXMg
Y2xlYW51cCBhbmQgZHJvcCB0aGUgRml4ZXM6IHRhZywgc28NCj5zdGFibGUgdHJlZXMgZG9uJ3Qg
cGljayBpdCB1cD8NCg0KQWx0aG91Z2ggaXQgY2Fubm90IGhpdCBhIHNwZWNpZmljIGJ1ZyBub3cs
IHdlIHNob3VsZCBub3QgbGVhdmUgaHVuZHJlZHMgb2YgZGFuZ2xpbmcgbGlua3MNCmxpa2UgdGhh
dCBpbiBjYXNlIGh1bmRyZWRzIG9mIG5ldCBuYW1lc3BhY2VzIGFyZSBjcmVhdGVkIGFuZCBkZXN0
cm95ZWQgcmVwZWF0ZWRseS4gVGhpcyANCm1heSBjYXVzZSB1bmV4cGVjdGVkIGJlaGF2aW9ycy4N
ClNvLCBGaXhlcyB0YWcgaXMgbmVlZGVkLg0KDQo+DQo+U2VwYXJhdGVseSwgdGhlIGNvbW1pdCBt
ZXNzYWdlIHNheXM6DQo+DQo+ICBGaXggdGhpcyBieSBjYWxsaW5nIGxpc3RfZGVsKCkgYmVmb3Jl
IGZyZWVpbmcgVElQQ19OT0RFX1NUQVRFDQo+ICBwdWJsaWNhdGlvbnMgaW4gdGlwY19zZXJ2aWNl
X2RlbGV0ZSgpLg0KPg0KPlRoZSBjb2RlIG9ubHkgcmVtb3ZlcyB0aGUgbG9jYWwgbm9kZSdzIG93
biBwdWJsaWNhdGlvbjogdHlwZQ0KPlRJUENfTk9ERV9TVEFURSwgbG93ZXIgPT0gdXBwZXIgPT0g
a2V5ID09IHNrLm5vZGUgPT0gdG4tPm5vZGVfYWRkciwgYW5kDQo+c2sucmVmID09IDAuIFJlbW90
ZSBUSVBDX05PREVfU1RBVEUgcHVibGljYXRpb25zIGFyZSBsZWZ0IGFsb25lLiBUaGF0IGxvb2tz
DQo+Y29ycmVjdCwgYmVjYXVzZSB0aGVpciBiaW5kaW5nX25vZGUgc2l0cyBvbiB0aGUgcGVlciBu
b2RlJ3MgcHVibF9saXN0Lg0KPg0KPkNvdWxkIHRoYXQgc2VudGVuY2UgbmFtZSB0aGUgc2VsZi1u
b2RlIHB1YmxpY2F0aW9uIHNwZWNpZmljYWxseT8NCg0KWWVzLCBJIGNhbiBtZW50aW9uIHRoYXQg
aW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KLS0tDQpwdy1ib3Q6IGNyDQo=
