Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577287;
	b=mRHSRdvp6b33Rj8xQHgf22LqSqGV2NG+WnNac+jvOe3/nIdckWnn2cyK29wbkhA+ctFG
	 lPa/bSTSv+gsTHeFVwgIUpRX2x7fO6sEguoNzIeuojLIK7U3vpmUHlJMwZ3+yIg1W+18n
	 8jihhuY8Bci8RP8rovTfKfWtwz+aTJto6xBbJjmLufr1Kcvl9/esb+K75i2abI13TRs/K
	 LYoYnIZtDkgOxBefvTQj4Mf1Y/dQA7Ut2I/CW1v1MBRnmHcm15uoO63JyUt6jQ4WMVzxj
	 3oY+5Y5U8yokFJG1SHh9CsrDRWcPEsCHVHB1QV8AYcSMheCqbHpdRvMMmg1iTomyf/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577287;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+y4C7AfZQPZ+RZjsLj/C31e07l9Qc02UYNqRibun+hs=;
	b=ZAb91hGeUDYOPdTHoL09RiicSSzApky10xyG6gETfw0n969v8pLQTqaaOsl+SRHFyttN
	 5PvFjZc5R+PrZN6YTReQ9vq6VSEhVrlNT6rSuvM5zURIorAlDLEtE1ctOux1AI3b1m1s7
	 Cgg+FV+JP9BKQIsBN2URVjqrDLCaALgXW0LA1F30Vo77utWrSR1F4PoG/mKaN0OwE3FqU
	 BRYb1AkmqeFszzv2l+PIKBPNOG+VbpWoTUPIAL/0GSuXI4I0z/eugcGSzrzXmV3ziJYWp
	 OhLYIQypoHnIqOAzYkoHESr2dVI77ilynoq0+9+bh1pHcicPzNsikPaVHutb96Bzy1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b="Y1/V3YUm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC3606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=Y1/V3YUm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuZ6maeZ21535YUEC5d6/jOK1BCA3d62oKmhqXeEubhQXWfu0zP7AbqDco4KXZO0dnfFGhx/lWsvnRJG7xbX8ZOCF+5D+K5UDhjLuiVaTL0fPpfYL8qfVd5vRhbGod2D3xNQKFG8sbHXfcZZYza8Wy/vPcISvekBXwGjWu7DcmKtncWKWceBlzxfSZVu8XqAxpa2tmcJsVyJfHsX39F2FpgWbX7H2tqJJxX60eowAwGNvVCx32T2d0ym8BkFrRRlSdz2RtG7Z3Kwqdb8C41/bxgAXWNDJ9zjtW+TgkeJnOC++NFqugBW4v428zYYv+bzjxpgLDU0k0pl/d7A+MHFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y4C7AfZQPZ+RZjsLj/C31e07l9Qc02UYNqRibun+hs=;
 b=OFC32d/Gfe3kE05lTRa3DS/b/3etmkeYnrbOImjVJijfl9DtminZTzBvkvEK24JYJ1Tt33KVQg21HgaJ0tQmRJWwBxyyMd0I51QKlMz7qXqaai4g0GEfj35TpkJaGxs8CzIF97337Os+XrDiVidCAnlIXim4oqO5XNe1yaHcomrw8fAzKQ5kE7YpMLnaQ+qfIPl9LDZs1fRdezEk7earaFfqzNkbKQHzPL8BGJ78+fUFAXufUlOk7BoCmtHakcVp99xeyHOZQW9hZGycpcfQmufafO3UkAL+p8UVMC2KxOhoQWaSv4i5AKIyBRo3WW6/jBgwoUzsr/fjWpiFj0+oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y4C7AfZQPZ+RZjsLj/C31e07l9Qc02UYNqRibun+hs=;
 b=Y1/V3YUmalVXTQn1ozoqARjKQbQmEAVWmGXxAbYNQfCYx5FMHXYHsE1KQJ/RM98QLRHOzfJKwiJvf8+eR1F5mazJgmz0zIr+FPGmnEjQ4fMXCPUm2f9JtDO/wMuGfEh4o9Ac6kGmBHFMN4TKXAncOZLaxXtFy65601p3T1lKwOtAR0iFe0Bahcg/lzHK/fLOjph3HiciOlwKDYsAvvo+CYv7W9Zl/lQYWAGISd6vYNL4KueU/kqTi/1vhShb9mVMDhzpHGQNF/5qs1qjUqG5g/k9XhMrstFfzmObuwv06JG2A8u9XIR+AIsKoTTUICxvMGRA06HyMCk2DJdHjVR9PA==
Received: from PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 03:28:01 +0000
Received: from PH7PR11MB8012.namprd11.prod.outlook.com
 ([fe80::71b7:7099:a6b4:4bbf]) by PH7PR11MB8012.namprd11.prod.outlook.com
 ([fe80::71b7:7099:a6b4:4bbf%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 03:28:01 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <netdev-bot+sinfo@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>
Subject: Re: [PATCH net-next RESEND v4 0/4] net: microchip_t1s: fix collision
 detection on PLCA status change
Thread-Topic: [PATCH net-next RESEND v4 0/4] net: microchip_t1s: fix collision
 detection on PLCA status change
Thread-Index: AQHdfBJJKy+VuvXtdkS0Fy4HqhhgjLc9LRUAgAD0uIA=
Date: Wed, 25 Nov 2026 03:28:01 +0000
Message-ID: <592d7be8-49f5-437d-b8b4-d63d9b54c0f5@microchip.com>
References: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
 <179552472884.3294.954572451733299111@kernel.org>
In-Reply-To: <179552472884.3294.954572451733299111@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8012:EE_|PH7PR11MB6882:EE_
x-ms-office365-filtering-correlation-id: f3a6640a-30e4-463c-c168-08df4aa41c04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|261026140227099003|4143699003|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|261022105027099003|261102123227099003|261021135927099003|261022075727099003|38070700021|261028144727099003;
x-microsoft-antispam-message-info:
 CBLzt1KV2FheKnENCPr3lX11iyb9Kinhico854iB2GWO1oPr8BShmRCbfxW3e4+KL/WjQnUKMo9mJJBfv648HuAYo3GnMusDdVV0Y4u7oNfvqph5l+A9bCrr87UTpi5H2d15uL3S0wtxdehUtxlQ4C5zBSCb7HLtPCdzx2G6EqqNa3AA58Tek8cD+A7e0IdydaoZ5fHXLb3ZoA2kVR2zds0P2ZMeG1fs4D57MuASm9REVdZ4GqKS6FIEyuGsS7/9ecFLkkUTXU1LvBp3bAH4SJPtWslPHehRuKZ2MJWV0V99QdXy6cAdkpaZZBSFgpNsXBCXSbJQhrbEOIJWGw4Mzx3xBWTo9+NQ7SJ5ySDjXLXOlFDwuLMXSbqkLgqkQmlJKVSlC+iHjynl4zP9kZU1ba+H1iU6pXRb+qkWXjQ0iJzcjydZq8TnWnMShmWrkZw74eZ4UShqS3YGpTDTngcMSsLWUMOCIcVHShbmGp9Uou0KBn+5SDjf43zWT7oqxt3e5KRUNeFNX9kpZAra+0wjIUvvUehcQ3TwF4OUexwQ9NO0ltsXcytQ6dTZgHAettOAEbO5JzYadd7EdgaS1ABlxxkoblDCfKAmHPWZCTUk+XDbxSFUS/25oa24+5V2BAx95LYWdSXTraWftFwtQ22jo1mwP6/GBbF7W9xRilohOcw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(261026140227099003)(4143699003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(261102123227099003)(261021135927099003)(261022075727099003)(38070700021)(261028144727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2p4Wm5pYjRlbE1kcTJxVHB4RVprbmNnYlMyZVMxMDZCdmpQdW5GT3llbHdi?=
 =?utf-8?B?dmk5U24vV2ppWGxJcTFRbkNvd3F4QmZZMmx2WHNTbEFZSUZyc3hrUXQrcDN3?=
 =?utf-8?B?OXlKdlRJSy82aC91bzdXakFrclFIVVFENWRGWmY5NFZhOG9GTTBaYnJGZjhM?=
 =?utf-8?B?SzlsZnY5amZadnNlWTVKSDRUZk1ldGtadGMrTk9PTGE3a1JsMHJ6MG5JWjVu?=
 =?utf-8?B?NnR1blIwcDk0U2NWTGxKaE1WcjcyTDlsb0hZeW1lV2VTSjEwSDY4YXdzcXVv?=
 =?utf-8?B?MGJhS3dVYVk3bnVjZXpWdnU5RitMdllhM0hUR1hNN3NDbEJ1cXB6MzN4UUJR?=
 =?utf-8?B?UjlMMGNab1A2SEhEODg1Ums2eUZUUmZIZXpQK3ppL3VBdVpOdFlYZDlyMVlF?=
 =?utf-8?B?OUkzbFhGM2xveGdhOUJHNjQxWDRNdHhyUUV0THV5b0hpUHFzMU04Zy9ZNDFp?=
 =?utf-8?B?OWtYTjc3eFRRMEhYVjBJSHV1NklFckhZRnU1MWF5Y1orUC92SVh3Zlp2V1FD?=
 =?utf-8?B?Rm1acm5DbmdIbUlKbjY4aVhXNmZHS2NXTHhxUkdzUG1qVno0SVhMNW1INkpX?=
 =?utf-8?B?THhZMGVFaUZxQ0V3dk9WNGtobUFkVHZrS2ZROFZBRVRNMWdVaVVFNTZHRWJi?=
 =?utf-8?B?YTNLMDdlL1k3NCtZazBvaE1ySDJPY1ZMVXo2WnZya05rN1ptelRabWhGeXA2?=
 =?utf-8?B?T3hlcXVOY09yTXk4TVJyczdsQzFwYVVlSVR4M2dIYlhNOXQ2NUpQN0hvNXdO?=
 =?utf-8?B?bkZBZkxiL0tEdEd2VFQxUVAwdXIxNlBXWXR6Q0RhSjcrLzdqSk9jNklIVS95?=
 =?utf-8?B?SnR0bW5mcjZMMmlYamdlYm82bm90N1FDMC9DRjlFY0VKNjd2YWVVVlltMlZM?=
 =?utf-8?B?STlLNjIvdXdqNVROaTdmVHZ3azFaTFJ1cVkyaXc1RTAvbUswazROY0pEQlJL?=
 =?utf-8?B?ZmtLL3ZYT3dhWjhMR0l2MTNFODRhREdFWGd1MTFlWHlmbzZGV0RaZDV4c2pN?=
 =?utf-8?B?M3IrYzNIYklzazkzSkJsQ2JYYXlrajNrb0hsQ2p6L0k4dDMwVEtOekRZNmVk?=
 =?utf-8?B?cUVnU0VzRmhsSlFCWFV2RG1KMGVnVXJGOFlNREhJZGZKK0dIaUg1K1JhYWVn?=
 =?utf-8?B?ZHg0bUN4dytybml2ODR1WlVXRk9oa3NQcVU2T1FzeDlQWVNYczNMdEdzWDB2?=
 =?utf-8?B?ZVVyNDUzOXR0MVExbUh2UlVmaXNERGhDeWxjN3F4QkxvVW12UEhkTTI2eklv?=
 =?utf-8?B?a1AyL283bzdMbFIxb2lGa0QyaVVHVzF4clJpMU9VYjRyeHRDYUJPcUNRMXBQ?=
 =?utf-8?B?NHpFY01id3FxSGIzc2g4d0R2eVllaS82eThYNWNsUzAzeTljMnBBSjFJNTNh?=
 =?utf-8?B?VXlHbkc0ZDIyWWMvNzFaNDhaejZ0ei9JaEppaEJNWVVuNENocjVRb3orS211?=
 =?utf-8?B?RTl1TmJCMG14YnE3NEJONjB3amcrUFRWYzR5aHBrYllVMiswMHo5V0lmRzdS?=
 =?utf-8?B?ZmE5aDZkanhZUitNZkQrR1FOb25pWFNSMnUxU0VhQmx0TVNMcUJDK0p5YWx5?=
 =?utf-8?B?VUt3Z2VwM2VacTNkL0UwbnBvcTREbnp4MjdqcFlRZ3V0a0xyNlpuUjVod1BU?=
 =?utf-8?B?RDNSOWk4TWNrc0N6a1dhaTF6TlhQbEhQdXk4Y1N5ME1uUUNST3UvSk4yWklX?=
 =?utf-8?B?RFRqQ2NORy9GRUhmeFRSME4rV2g5YnlYUTFYL0ZkV1hjakZIazRELzVyWFJK?=
 =?utf-8?B?NVZxcHJ2VDZoYm1VRzJ6TSs4OWJob1FiRVRUZzNVUGI0dThhdGQ3T0p4bTJF?=
 =?utf-8?B?VHdoaUdZYVNoSTNRUVFKUWxSUVNmUVpGS2lTWnN4dlBuZGVSTVJwMENZemZp?=
 =?utf-8?B?akY3bWF4dWJwcGNSdGl3Qmx2U1RLNXVHMno0UjQwZkEvNGRXNDE0Q2VMdy9H?=
 =?utf-8?B?dW1STUZkNDd0dU1Ra0RZakVjcGVueE1vbXlWV0ZMd1JnamdGZUEzZkNLMG5I?=
 =?utf-8?B?RWFLQytWMVV3T0cwcEx4TkNOTzdnVUF2ZC9xeTdZanZ2QjFKN0tHeXRnUEhq?=
 =?utf-8?B?bDZ2R3BoU3NKajFYSWg4VzZkRUcvUk9BYnVCMWtMZzk2UE5nWEgvTWdnM3Mv?=
 =?utf-8?B?WThybi9Za04vMnRMM0h6MTBLWTRGRytFejV2Um5ydzkwUi9JYkczbklKNVBR?=
 =?utf-8?B?emk3MmhyMWVyNklDMXlrRFZqUmtjZDVTZFRsT3Y4bnVOTHNyN1JvR2gvbXJ2?=
 =?utf-8?B?QnlQczNsdlV1R2ZOS3BVQWxCU1MwaXRqMmY2NkgyVUFJdUN1bnMvMmQzZEhB?=
 =?utf-8?B?eXpud1Vsa1QxY1pLam9PcUt5aStBdEFOaU5BK0V5dTU4a1A5YnArVkd4RE13?=
 =?utf-8?Q?dVe9IZaSscjizXjA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <503E7DF8F74BA046B3EC0200396E1B68@namprd11.prod.outlook.com>
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
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a6640a-30e4-463c-c168-08df4aa41c04
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 03:28:01.4672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRJMXLzpKLg5bGO0BI92YGF/YIgfcYNuUuHT0u1+z1oswBt+1hy8GFLXCKSj0GaXujCuYCkV8xoBRvtXVSdNpQYduPEmJwGVQHdAkvUq93REahcHzokJjaM1oB/gFml7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882

SGksDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpUaGlzIHJlYXNvbiBoYXMgYWxyZWFk
eSBiZWVuIG1lbnRpb25lZCBpbiB0aGUgY292ZXIgbGV0dGVyLg0KDQpUaGlzIHNlcmllcyB3YXMg
cHJldmlvdXNseSBwb3N0ZWQgYXMgdjQuIFRoZSBTYXNoaWtvIHJldmlldyBjb21tZW50cw0KcmVj
ZWl2ZWQgb24gdGhlIHByZXZpb3VzIHN1Ym1pc3Npb24gd2VyZSBhZGRyZXNzZWQgdGhyb3VnaCBm
b2xsb3ctdXANCmRpc2N1c3Npb25zIGFuZCB0ZWNobmljYWwgY2xhcmlmaWNhdGlvbnMuDQoNClJl
cG9zdGluZyB0aGUgc2VyaWVzIGZvciByZXZpZXcuDQoNClRoZXJlIGFyZSBubyBjb2RlIGNoYW5n
ZXMgZnJvbSB0aGUgcHJldmlvdXNseSBzdWJtaXR0ZWQgdjQgc2VyaWVzLg0KDQpQcmV2aW91cyBz
dWJtaXNzaW9uOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjYwOTI5MTI1OTI4
LjYxMTc4NC0xLXBhcnRoaWJhbi52ZWVyYXNvb3JhbkBtaWNyb2NoaXAuY29tLw0KDQpUaGUgaXNz
dWUgd2FzIGlkZW50aWZpZWQgZHVyaW5nIHByb2R1Y3Rpb24gbGV2ZWwgdGVzdGluZyBvZiB0aGUN
CkxBTjg2NVgvTEFOODY3WC1iYXNlZCBzeXN0ZW0uIFRoZSBpc3N1ZSB3YXMgb2JzZXJ2ZWQgd2hl
biB0aGUgZGV2aWNlDQp0cmFuc2l0aW9uZWQgYmV0d2VlbiBQTENBIG1vZGUgYW5kIENTTUEvQ0Qg
bW9kZSBiYXNlZCBvbiBCRUFDT04NCmF2YWlsYWJpbGl0eS4gVGhlIGV4aXN0aW5nIGNvbGxpc2lv
bi1kZXRlY3Rpb24gaGFuZGxpbmcgZGlkIG5vdA0KY29ycmVjdGx5IHRyYWNrIHRoZXNlIGF1dG9u
b21vdXMgUExDQSBzdGF0ZSB0cmFuc2l0aW9ucy4NCg0KVGhlIGNoYW5nZXMgd2VyZSB0ZXN0ZWQg
b24gYSBSYXNwYmVycnkgUGkgNCB3aXRoIHRoZSBMQU44NjVYL0xBTjg2N1gNCmRldmljZXMuDQoN
CkJlc3QgcmVnYXJkcywNClBhcnRoaWJhbiBWDQoNCk9uIDI0LzExLzI2IDY6MjIgcG0sIG5ldGRl
di1ib3Qrc2luZm9Aa2VybmVsLm9yZyB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+IA0KPiBIaSENCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2Uu
IFRoaXMgc2VyaWVzIGxvb2tzIGxpa2UgYSBmaXgsIGJ1dCBpdHMNCj4gY29tbWl0IG1lc3NhZ2Vz
IHNlZW0gdG8gYmUgbWlzc2luZyBzb21lIGluZm9ybWF0aW9uOg0KPiANCj4gICAtIEhvdyB0aGUg
aXNzdWUgd2FzIGRpc2NvdmVyZWQsIGUuZy4gaGl0IGluIHByb2R1Y3Rpb24sIGhpdCBkdXJpbmcN
Cj4gICAgIGRldmVsb3BtZW50LCBzeXpib3QgcmVwb3J0LCBtYW51YWwgY29kZSBpbnNwZWN0aW9u
LCBMTE0gb3Igc3RhdGljDQo+ICAgICBhbmFseXNpcyB0b29sIHNjYW4uDQo+IA0KPiAgIC0gV2hl
dGhlciB0aGUgaXNzdWUgd2FzIGFjdHVhbGx5IHRyaWdnZXJlZCwgb3IgaXMgb25seSB0aGVvcmV0
aWNhbA0KPiAgICAgKGUuZy4gZm91bmQgYnkgTExNIGFuZCBub3QgcHJvdmVuIGF0IHJ1bnRpbWUp
LiBJZiBpdCB3YXMgdHJpZ2dlcmVkDQo+ICAgICBwbGVhc2UgaW5jbHVkZSB0aGUgc3ltcHRvbXMs
IGxpa2UgdGhlIHN0YWNrIHRyYWNlIG9yIGtlcm5lbCBtZXNzYWdlcy4NCj4gDQo+ICAgLSBXaGF0
IGhhcmR3YXJlIHRoZSBjaGFuZ2Ugd2FzIHRlc3RlZCBvbi4gRm9yIGRyaXZlciBmaXhlcyBwbGVh
c2UNCj4gICAgIG1lbnRpb24gdGhlIGRldmljZSAoYW5kIGlmIHJlbGV2YW50IGZpcm13YXJlIHZl
cnNpb24pIHVzZWQgZm9yDQo+ICAgICB0ZXN0aW5nLCBvciBzYXkgdGhhdCB0aGUgY2hhbmdlIHdh
cyBub3QgdGVzdGVkIG9uIHJlYWwgaGFyZHdhcmUuDQo+IA0KPiBQbGVhc2UgZG8gbm90IHJlcG9z
dCB0aGUgc2VyaWVzIGp1c3QgdG8gYWRkcmVzcyB0aGUgYWJvdmUuIEluc3RlYWQsDQo+IHJlcGx5
IHRvIHRoaXMgZW1haWwgd2l0aCB0aGUgbWlzc2luZyBpbmZvcm1hdGlvbiwgc28gdGhhdCByZXZp
ZXdlcnMNCj4gY2FuIHRha2UgaXQgaW50byBhY2NvdW50Lg0KPiANCj4gKklNUE9SVEFOVCo6IElm
IHlvdSBkbyByZXBvc3QgKGZvciBvdGhlciByZWFzb25zKSAtIHBsZWFzZSBpbmNsdWRlDQo+IHRo
ZSByZWxldmFudCBpbmZvIGluIHRoZSBjb3ZlciBsZXR0ZXIgb3IgY29tbWl0IG1lc3NhZ2VzLg0K
PiAtLQ0KPiBUaGUgZXZhbHVhdGlvbiBpcyBkb25lIGJ5IGFuIExMTSBzbyBpdCBtYXkgYmUgd3Jv
bmcsIGlmIHlvdSB0aGluaw0KPiB0aGF0IGlzIHRoZSBjYXNlIHBsZWFzZSByZXBseSBhbmQgZXhw
bGFpbi4NCg0K
