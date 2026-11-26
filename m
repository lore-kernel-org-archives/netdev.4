Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795694425;
	b=dfQ+KxEYKgg/BEGFOSiwn2McTJA7EueVsn05BXQvP+k5N2ZkolC1/PhjWFBl8fN6n6E+
	 NHNV3nPGocHYPUvr9lVcypllHNFG29LPB6Be72AfjLRLZATdmfjL1PpQWjGTIbBlEg5FH
	 5XKpjJFVJ/utQS1R5vFeEP7lmc4TLjGQopsNa5V/lGLqqJYWIDdUgrAmbjGVMJ6ovBOQZ
	 1PTs9kM0Sj+twAPmD+7j1x6GBsuIKR7xRzSBLkSpEJO4WK9cq/W8cdjqJnIqvK52BKB3g
	 ZUS/ZSBoovPXpRq1khmovVeZrJms7MF8zGVOz5R69ixxWhH5TmqqcRl/HVKiAiAdmLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694425;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=IeTjKtID379+u2KZ9CrjhP3UgCZSleQ6rvWSXJbBHuA=;
	b=b5P6NjxZ9QHVV79ppARy26r2gbyEYBl0RoDqcFBUe62HSPtTZVwUgPpZtyns+DwrTdlG
	 7/1Y4kqLh9ORlEE4u5TV02a49Nv9bN4OHDq55AZLsSCBpoOuU0Y+dFX40lnHSisacasAE
	 dHhRcGORaI0pJM//5vtZOWOokU3r6au1j2f1Cd/5A+3YbkvafxRcK32iB4ZoVtvYW4rdW
	 otrTFCZCGktwIjLxnd2qyGVa31g22l+7HCvsiQvxLyFn+t1vIvE87ZpZ++jU1auwlIpod
	 sGSVux+sFVYH8sxFVqaBXuU2WjBvYftYgDH03qzn62zEpi+Tv3JAxLLMc/1MRoFPHKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=DaHHtgYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789A606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C789A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=DaHHtgYC
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBXOnt1173158;
	Thu, 26 Nov 2026 04:00:00 -0800
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023127.outbound.protection.outlook.com [40.107.201.127])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4j5nhg7bwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 03:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udAYby/QyyKZ+vapvCoguIZc45hQ6s1eMYhnSnSNWa80dDQtShO6zgOs5JztfhvQeVpgx63ThsNBvzMyCExbD1F53mty9vcVolYKZ1wRaOKzr9WU/p2UFN1AOoNnA7s13Rm3Aufnp5Sve+2ozLebEPosNFGZb5nftkx+p7jjoJmS2+K7OWzMi0kXedCbUmpV7uKEdDyWBuYDeTIAvNdLdXY5GQghDui5XczB2SuHFyoc83HWzOTSgeKc40ZFtQv8Aw9FAY7UZBOTrkyQvjMvhvBe7vyz8w7h7YaFxTyb0+1MRe7HUOWKYqCj+XkdHCxvqCj8prHELNw/XhaBOi7EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeTjKtID379+u2KZ9CrjhP3UgCZSleQ6rvWSXJbBHuA=;
 b=AoovXF+UPWIC+MbKxDQCC0+aIu3bbMxu5moQtTnMUPSSrgzVmuMM56wQ3dFUB4PDXAQdVP+83uAhpKiSnjTfVHxidBFRqfgaF++bYNVoSKZvV8ZoYEt2y5wE/XsYqw8AlUmOFtFzVcL9d0nZuGx1dZ4Q926YKjBc3s9Nu0QTz4McD70e/lIt5/ogBbponTeXxKgo5mFSnzSwE4gU7KJpJLd21AQ146pQCUMrXWyECnHmby8aGor0T3rLqZkSe4tvdGbmQfR1EGNu6wPbFO21zFmo9ZEjBYNZeQNP53S4gshoOdPiKCuF9cVqdls52wd7HlkVfMqimwOyoqPT6MAhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeTjKtID379+u2KZ9CrjhP3UgCZSleQ6rvWSXJbBHuA=;
 b=DaHHtgYCncIoBkSHd1ntY/XZDGC1oTIDT4n11b4yEpJsXDHuaqWiVv2ioxhibfkyAX+WCGWV/O6Po+qlQhRYMs4ngWb8VEdzIJ9UyY18tEVSlx50cB4E3pSONLsRlDw9sxQt7RTIm4w8wk+n4F1LA6sfr/KA7MgmTlDV4LeOwIA=
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::dbb) by SA1PR18MB6033.namprd18.prod.outlook.com
 (2603:10b6:806:3e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 11:59:56 +0000
Received: from BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3]) by BL1PPFB0715B38B.namprd18.prod.outlook.com
 ([fe80::4ebf:8c2a:aee9:bcf3%4]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 11:59:56 +0000
From: Elad Nachman <enachman@marvell.com>
To: Wanhui Fu <fuwh1120@163.com>, "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@kernel.org" <edumazet@kernel.org>,
        "kuba@kernel.org"
	<kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        Serhiy Pshyk
	<serhiy.pshyk@plvision.eu>,
        Taras Chornyi <taras.chornyi@plvision.eu>,
        "serhiy.boiko@plvision.eu" <serhiy.boiko@plvision.eu>,
        Vadym Kochan
	<vadym.kochan@plvision.eu>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [EXTERNAL] [PATCH] net: marvell: prestera: Add fini function
 under label err_fdb_init
Thread-Topic: [EXTERNAL] [PATCH] net: marvell: prestera: Add fini function
 under label err_fdb_init
Thread-Index: AQHdfZlfpUPq0xdhK0mKXF0Un9dOB7dAPzwQ
Date: Thu, 26 Nov 2026 11:59:56 +0000
Message-ID:
 <BL1PPFB0715B38B169222951553E5F09175DB422@BL1PPFB0715B38B.namprd18.prod.outlook.com>
References: <20261126112825.3957800-1-fuwh1120@163.com>
In-Reply-To: <20261126112825.3957800-1-fuwh1120@163.com>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=marvell.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PPFB0715B38B:EE_|SA1PR18MB6033:EE_
x-ms-office365-filtering-correlation-id: 855e4afe-2382-4e88-2f52-08df4bb4ca28
x-ld-processed: 70e1fb47-1155-421d-87fc-2e58f638b6e0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|7416014|376014|261021121427099003|10067099003|261102123227099003|261009223027099003|6133799003|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 zWl5fPEUzSsu1xS4+U2KrRNp2DxSsKB2iuU63C3uzRVCDOHche9rTR4NhWB4wpFEqoBi/evVlI5CmzDj+Xkc1nDd+SKl2R0iy6FSxfaPP7gsDPOeo8nWLpM9lQ/nYGkVSvDIPX7WPZZHBt9wETSsYhwK3pQ3bG+T6nr7TJEqXN/wJFHx9lebV9yubAodUY9os+VWAGFp8QoLSRywnTfeK64lhwUymegBNUMdyCmFmEuS6LieiYb/AmxNk4992SiGMSm8deWQf0hLf+xVgzJBc8LeQ5tLurpR3BOCyyttdbDc9oTf95H1KORidbfdTnkuo0siomn2RWx/nGEAYxZZ4/LgYSyucG9zVX22Jsw9byvyRNDvwOsKdnIOn4LVew79BHEhqH/nvse0qbnneZVmyMPg8DjCP8J3mgERw4L7LSbCNKZR1lq0vVKnIFlCT8sOFRmC1Hw4QCOTK7vmW9iLibxKs1qofLdxidxAeCEOlISnQop5D+Vf3RljmRsTvqeris10Yf4vq7UnGEkSfxauyuluLs1TkYgSM1JMTyv3hzIpIXscF8rbo8/m5VDAHhetStYJ5wtLcTuRtfAu6eskaD0ZLHRSJIH15qInGs1T3vibFqrqJpJlCbAbzodG8wlLnmFIrlFzCp9NrXy/YwFwDaoREB0pMclKqMQ58pWlgIl2+7yq9icuBLt3zyPCDwOhuYsAoWONynanbbL9seaEVozVxH3w4TApNUOPF/8Bd88=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPFB0715B38B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(7416014)(376014)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVFvQzBwZ1hWMUhPZkh0RGpSY214RGwwc1VCa0c4Sm5nNzh3SGtWaXkvUzB4?=
 =?utf-8?B?UldMZlpvSE15a2JkTUdsbC9sZkRrOUY2azY1UXhtaEtEYWlQdCtOZTFrZ0h1?=
 =?utf-8?B?Uk9xM1ljV2Vtbm11NW5LUjBKVkxEY09MVTVpZ29PWWxoNDhVaVpmTFRMN21o?=
 =?utf-8?B?ZGpla0N3REV5VnAxcDUwZXNrMVFhOHBYTS9sU29rQWhJUzJJSjNHd2FFckxz?=
 =?utf-8?B?NG9kUzNyZitOZ0t0RlNVRHJYVnppeVBEOFdIMjhTQzdZazhhZ0RXby91d1l2?=
 =?utf-8?B?bkdaa0tvSDhCblczK2VmY1Z5bEZLWDN4ZXQxVml2Q3A0TTBFN3JrNDJ6N1li?=
 =?utf-8?B?cmR0R1A2dDhNWDRWaG5KeUg1TXZTUXM5L1JkamxQbVFGOHBrU00yVzJPU2F0?=
 =?utf-8?B?amtFTmRUS3hRaGp1S2NhTjR2ZmhISDhoVDJHSzNDeVJPOUR5WUhnbDZEWGtq?=
 =?utf-8?B?M1VqV0crYWQvSjFZTkFYNUN2UlViOEtjQ0k5d1AyTmp3V2czTmFKVmJxNlQ0?=
 =?utf-8?B?eEdDOTdGaUhlaWtTV3FoTkk1dzNPM0xldmUzYlNOR3k2bHdXUXN0a0s3d1Ew?=
 =?utf-8?B?WENGeTNoL3BoamhhSXNNWCtMTDFnNDVOZmJCbmM3ekVGd1crdXNHR0hSUUMy?=
 =?utf-8?B?VytyN3ZmU3dVL01DUWpvbUtRTXNlZ0tpUFZXNnRsTU40cFNYVFhRRWlRdEpJ?=
 =?utf-8?B?aFNuK0kzNXBiWE43UnE5eVdSbWttNmFXZW1tVnBOSFMxazRabkxVYkg4NklM?=
 =?utf-8?B?cm5xSk1BaEJxVklubnE0YlgzN1RFS0ZIM1M4QWhwbmdHbHRFUVg5eXhmMmZ6?=
 =?utf-8?B?MEtXWlRBa29maWt4cmo2cEJUdGFRUEd3U2F6djBNQ1VTMkJ0QzJYN08xSDBx?=
 =?utf-8?B?VUNXVFNUZXgxZXJRc0FmaUwvY3hmQTJpSkRzc2YzT2xVVVdsSWltWjg1WHNh?=
 =?utf-8?B?NGt5b2UrRm5UaTlvTHpRcTA2SHNZK3dVUk8xejNHWlB2VU5TTHI5TU9nYzVy?=
 =?utf-8?B?VDlQRER1TXhXSkZmVjFPMVZaUGlUS2pndWR6L1pvVnRxdEJFc0ZBZURibTgy?=
 =?utf-8?B?T1NoOGJjMWhDRnplMHlqYitKRW1kQjE1dzUxTUdqQTlJWGZIOGdvYXZibHBr?=
 =?utf-8?B?SG1abXN2Ykh2SnUxTTQxeS9ETUFXdjhyWnlmN2hBRjNma05hT0tXMnhoUFFt?=
 =?utf-8?B?U1pqdUsyVWdCelppVGdPMEY2NWdBL0JzUTZGa1lZb2N1QTJKT3BQbmY3NmJN?=
 =?utf-8?B?Wi9CdUkwakQrZ0E3K1oxUWtUakkxTGlPS1Y2bDRROUY2ZWJ5TG53TFdFS09r?=
 =?utf-8?B?b3pQR3FzRkErOUIrWEM5b1VLVlFnakswTi9kN0M4Wm9ISW1BU0x6M0ttYW1B?=
 =?utf-8?B?d3hEdC82aEw5b2RKWWdJODF6a1FwcXM4d2ljUVEzcFBQM3BRSzBNMEVpSURW?=
 =?utf-8?B?c0xrMksxTzJPWGg0cFMzNUMwMWdqREJTRS9lNk9KUFJENlRvTm1Sdkp1Z1Jo?=
 =?utf-8?B?OTFSakc2OVlCNUgzSDArNXlVZ2QvcHlrTlc4OHJSVURQcEI0WGxSVmN5WGNa?=
 =?utf-8?B?dU44T0FEajc1VmNtMlhmVnM5VWttQ0syQnU4bGQ3cWVWNVQrT2EyQkhUQ0l1?=
 =?utf-8?B?UFBYb25WeG9pZ2ZRQkprUnU3VnkvK3V2WEU3aTR1d3drSkVZU2NnT3JnTGx1?=
 =?utf-8?B?K0ltcWkvWHJRWjNMdGVMTlhmdW8xOFU5TmJia211Mk9tcUFBZXlNTUVhQUwx?=
 =?utf-8?B?VjRKQ2JoK0QyNkg3VHFoUE5TYUlZMjl4TW03bklDdCs1WHBPV0lPQkZpbUtZ?=
 =?utf-8?B?aWxJUHNUYS85TEdmNERXZU04Ky8zZFI1VzBxeHRvanV2Ym9UTmVZRzU2Tm9k?=
 =?utf-8?B?VnBERlNNaE1SMm1xcHBjSUR1aUhwRU5TOGx4dFNiZlhjTEptckE1TW1ZRFd4?=
 =?utf-8?B?RlV2MjBaMW1HZGwvK3FreTlEZzlMcGdib3pOZkhueFJqb0paRVdwSit1L2tI?=
 =?utf-8?B?NW94T3pjWUtYdkZqOUE0MDVyendvUHRLQy9nenpVUXRrY2t5WHJxTE5FRkMy?=
 =?utf-8?B?Rmp5OUg3ZElSTjRpaTFuUHhwL2NidlRDSE1tZ004Slp2eERhZUsvRVR5S1d6?=
 =?utf-8?B?WkFFSWg5N0JWUThYbGNVa1NPa0p5SXM3Q1BGL1NLVlNqOGlPcjVqTnJRK2tT?=
 =?utf-8?B?a3lyMUJYbEJ1UWtCMWFMaHdMRGxqaWo2VUVKdXVMMkNrVmdNMjVyblZtc1dw?=
 =?utf-8?B?bFovamJpNTcraFI0b0Y0eUJiQUZML2ZGM0drK1VCNE0zbXlhQ2hyelVQcjBB?=
 =?utf-8?B?TTVBVXZtdTB2RmtYUjAxMDZQNG8wcWVHQVlPdFczbG9tYlN5MStxOHUrUk9K?=
 =?utf-8?Q?J6Q95nqkY28KvouPxaCPI4tQloD9ZTO6/jPayc6D5Ie5U?=
x-ms-exchange-antispam-messagedata-1: tWHkFXPyakfN+g==
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
X-Exchange-RoutingPolicyChecked:
	ApQ8qMFFP/WF8M/exH8ZcqaiJchfJhC5dRxfYLWQG5kC25NOzf58+prK4qzgVmZRJmTiXeHZuaPWKcJMfxGIi5rAcbsXMX5Mf6OXQkVmb3+P1yy9Eg+MNIbq0mkBJhHFQIH7G/rvgzAdYUz1ktbLSB5a8qnGU3rPt45mJKLxSJjsp8WsDWUdzTky9ZdTBI3VYtse9minRQmyuaqZnL3rMMBDHcwXLAzRqd4VS7equOdPR2FhndhvvnApbqOZKkmWGpNiwTYsxbsg+WTWbbAWRwXwT+hxr3cpDZc8MpuAMD2umOa6NdNCr5CLC6/ag+8MfeEGQBT+SBFugeZQ3fLJLw==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PPFB0715B38B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855e4afe-2382-4e88-2f52-08df4bb4ca28
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 11:59:56.6690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +g9XpXaYtQZT5ZS3SOi1P0mp4CgLc7rtwbh2kNYCQtX0SfesSqhsH6nA+3Lpal29NsUhicTb7nknYHaz2TRY2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB6033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX/v8vcUNdH+pM
 bc+FiJu98jBMmyEDCa1OjJqJFD4FRSjAdRiwwDEN8DazGbIKeKr0fV7Kszk9Zwol5POOSpS/MDf
 TcEnDdKEduEJ83hPqB5TiZQYTRytZPfWCI05yC9rhc/mqTrrhbIeVWb8Xi0acAaOEHrFAuXyusj
 f7TI3l+fOq4VXwSiG7O+T4TwkXehA4q22mxvMru3KCBGUC1QvMzA6RxUi6FxNcB41pG9Jy3GxEL
 /1HpobgUVd5Aaa/pmxijK2x8vcZRNROnoiGrVcPkkv2YktZ4EcXWN3guSrSbDmCBTB5X+Dx9Wa8
 U8kxC+qLGVgvmUPinbMqsDz1H+11uMIukEa3tRdev6rWOCLYjn+lpCSD1fZMl6o8ZpblFUecAwS
 zAUR0e1S+eLsnwa1gwte8wiX8wyC7FgqqwXzIdooRMJlNI1LTLBJnVG286DFNo1qutcf1d7mH2J
 4yXrCuZD0yjTexrLKJg==
X-Proofpoint-GUID: jsbddJK1GOfCTQfCts377ybLq8aUp_G_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX3X/LogJcydco
 pVsV8vbKo3XX5QShRpHH8tj70zKv42TZo/kidj/O45keerFDBn0oxRJpSe4Xj43GiQgF14RakE7
 Bgj1qvKwqzIX2ZCo5aL+SCSplgrsRhM=
X-Authority-Analysis: v=2.4 cv=WtC+otfv c=1 sm=1 tr=0 ts=6b081f40 cx=c_pps
 a=MP9y2KnavyzKo3MGO/hTew==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=-AAbraWEqlQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22 a=Byx-y9mGAAAA:8
 a=M5GUcnROAAAA:8 a=cq99icdh5L2d5ME-6XIA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: jsbddJK1GOfCTQfCts377ybLq8aUp_G_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01

PiBwcmVzdGVyYV9zd2l0Y2hkZXZfaGFuZGxlcl9maW5pKCkgaXMgbWlzc2VkIHVuZGVyIGxhYmVs
DQo+IGVycl9mZGJfaW5pdC4gQWRkIGl0IHRvIGNvbXBsZXRlIHRoZSBlcnJvciBoYW5kbGluZy4N
Cj4NCj4gRml4ZXM6IGUxMTg5ZDlhNWZiZSAoIm5ldDogbWFydmVsbDogcHJlc3RlcmE6IEFkZCBT
d2l0Y2hkZXYgZHJpdmVyIGltcGxlbWVudGF0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTogV2FuaHVp
IEZ1IDxtYWlsdG86ZnV3aDExMjBAMTYzLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3N3aXRjaGRldi5jIHwgMSArDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L21hcnZlbGwvcHJlc3RlcmEvcHJlc3RlcmFfc3dpdGNoZGV2LmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3N3aXRjaGRldi5jDQo+IGlu
ZGV4IDIwMTJkMDBmYWJlYy4uNTVhOTllYWZhYzJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9tYXJ2ZWxsL3ByZXN0ZXJhL3ByZXN0ZXJhX3N3aXRjaGRldi5jDQo+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvcHJlc3RlcmEvcHJlc3RlcmFfc3dpdGNoZGV2
LmMNCj4gQEAgLTE4OTksNiArMTg5OSw3IEBAIGludCBwcmVzdGVyYV9zd2l0Y2hkZXZfaW5pdChz
dHJ1Y3QgcHJlc3RlcmFfc3dpdGNoICpzdykNCj4gICAgICAgcmV0dXJuIDA7DQo+DQo+ICBlcnJf
ZmRiX2luaXQ6DQo+ICsgICAgIHByZXN0ZXJhX3N3aXRjaGRldl9oYW5kbGVyX2Zpbmkoc3dkZXYp
Ow0KPiAgZXJyX3N3ZGV2X2luaXQ6DQo+ICAgICAgIGRlc3Ryb3lfd29ya3F1ZXVlKHN3ZGV2X3dx
KTsNCj4gIGVycl9hbGxvY193cToNCj4gLS0NCj4gMi4yNS4xDQo+DQoNClJldmlld2VkLWJ5OiBF
bGFkIE5hY2htYW4gPGVuYWNobWFuQG1hcnZlbGwuY29tPg0KDQo=
