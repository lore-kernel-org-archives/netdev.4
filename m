Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795406578;
	b=BsgCJjiqjnpbyveKp+w6cx30MZHrfqOItBQui0fldDWyXvBl54rE0oyDf7kgRDVXC4zw
	 Q2swrlanvKgBXAwZhgcu/YdVL0RnKGjOjUJH/oOqAqRIrfJfYGeZG5tpTl3WOzKxBREFs
	 dLOZvo4RUZQjxxBkbdVS/d/pG+H/wDjXc7JpBjEyLrKW0Ao2yvAW4wGAKDg3oaDOWxq2o
	 E6NWAGf0w0/2HEIsRhD4bB2gF8BOIPJXla2FDzVx1bbo2T01wfFgO3MdGl9lXBXXnG1qf
	 1oNcfIbPQkm0/GMTukyotg938wkOIkEXWC2t2oS4mtBdgMyQJq/gEzAcVaAwXyLu82g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406578;
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
	bh=o5AGvtlkU8QL1KoxlRUWakhDEge4fGn7MaO+qEvCeMM=;
	b=s9E62KJO69WLJa5wt54xM0LKiJmOxo67d7RTb+e44fyUSYxYY1TDBrKp2lsVpbOxT1Uf
	 2V4p2aqYhh7c8BQlM1P3oSBfLrfKZqdtr6bziDvoA+sIhx9dLNw0cAu3dAWkqZ26r/oWV
	 kSd8fTbh2Oyc2pttEv7K+ZGKjorFcPNitpT0NPQJ+eklXmIdtn+IrFwoLG6RXhK+AnocD
	 p5Ze8LrnOA5ZpGsEObytUztfo6Im/c4nfsKVFm/PwFWcQhcmsODM7otn9aZqSefmXlc0Z
	 aM2CfhsgDq9rBusXaegQLkA3GDmEIGclJ//wKrOLM4hXJ+wTu51+ceLxjWb52vewKEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TIibDTrs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B243606A31A;
	Mon, 23 Nov 2026 04:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B243606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=TIibDTrs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLRhQu792q36VGEfBLRjnkLHHOJpWHZ0OzuvzCSyrWBAzJjxQAUPaJqk4GJqj/CdzBQtn6llY6qCz0YctQqcsCo3BhyfT7ZPv0y/HDXnK4D0H+LE5vKMbP6KUzzNhHp+5LtaURuQCLraFN2ZzaLOSUAnreLq+AXo2YTktoTCQc24GPxgxuuaJ+sa/sW2RjAzhCkkt0mBrs89UG2+rSOXdiToDh32fiu7uHFam3Rm535zyaX1Su86p+BtpCdeOeAxSaZHNoX6VTQKhL3yV0fMP9tscbw0JWAlS+W/Wxt4Oh8LYMLmiMnADAs5IvJyGka+iV2F5acxGD1hT+6cQbKoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5AGvtlkU8QL1KoxlRUWakhDEge4fGn7MaO+qEvCeMM=;
 b=H/x6nkD1ySyzTVYDIqe+q3z6I9p82OdGIc8YCuQWUkYVvyGS5jxfsXpKVRxK6BOaZh6K8yseCI+A0JGMc4uZCM7hWSCljjFkM/JKI0tea/tYOqVQI9hsjz5UX3BTe6bUTRd7V//kq6rnrytPfElYWcKH5SexS69B+1GpO4jxfdUpP/YC5z+zRaQUixELmlAqb4bthQF3rG2dfnIj+6Qf69jijAdcZY2i7yuNnOezM2ArtYH+1NTjseF9BOFH9inNjiuiOxv06LXupbQnErkg8Vo0xm57/9g5QdBOo3mCngd/fMhNoEOXUsNFzq2KGZpHCg3z9Tya34uE4ek9Qm8ybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5AGvtlkU8QL1KoxlRUWakhDEge4fGn7MaO+qEvCeMM=;
 b=TIibDTrsWnjkfk01f1j0eBJPpNXvKeDJ3SnFPu5OToLYDlZewDwI7PRWh306PsYTnyBVYRzOK/SssXaZk/ohU/7SIfd3fv3Wzmgp8ftQRER36NU4bcbRTtXdiU91zMChLW3FKpfWfkHIlXYtjwJ6DbZunKmXR6tUjzfLWyC8DyUqKCkUyiCG9UyEmrZx1OH9m08ruUmv+qIjOzoU+7KEIsGCzfdfNAKNNPrl0xtlZgAAAOo0sdk5A0iPYIGTYeqyxZtF8Wh3g9CZKPmnXuEYvctqAiGohxmsjBBbXMx0DXYb7ndICwO8ujwjURn3OljRtgXksK4WFw7R/MnuMNt7mQ==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by AM7P189MB0849.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:179::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 04:02:52 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 23 Nov 2026
 04:02:52 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: "shyckless@gmail.com" <shyckless@gmail.com>
CC: "horms@kernel.org" <horms@kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: RE: [PATCH net] tipc: restore write readiness when a socket's group
 goes away
Thread-Topic: [PATCH net] tipc: restore write readiness when a socket's group
 goes away
Thread-Index: AQHdeG5okDVcJoIAd06ZNucuWr8J1bc7DXkQ
Date: Mon, 23 Nov 2026 04:02:52 +0000
Message-ID:
 <AM7P189MB1137026AA0F76C9BA3ADD687C6452@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261119-tipc-group-open-v1-1-cb725145da51@gmail.com>
In-Reply-To: <20261119-tipc-group-open-v1-1-cb725145da51@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|AM7P189MB0849:EE_
x-ms-office365-filtering-correlation-id: bef09f3c-d7ca-4ebe-db6d-08df4916a57b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 T6hRGi1O22ZyXrIaf2AY/EOsw4pjd2eT4l44gWdR8aWj2D14NxR33nMhKkI3PnCr+eLTYrdzVt5P9da69QM9TFZLP6Xzil7m2GfDgBtW3oTEIMfMLxnl95BBeIMGvOWdvq97ZtlcK2UuUxir1ISU1HAmJPnY1XerN/PGMQdTXay4Zf+M0smrlFPz3iBK2R8Jtf3MyBqIacb75BzmTdV4zVOB13skTidCtJ41ntQRNd3Wzh8rqxRfXcBwmRZfw3TNYIMLnREQlZAWKNYFvr3nPdag9/yaQRVpJPzqGJ/jBATePsx1nGD4p1E8e2m6nKUn5IYDApxKafnopp6pu4MwXElZa2uus2pNibpF6x69YdUy6Br+ZFxrEkHnXguFGEXTQ9CW/7njcU8lt2d2Z47UOglx6qIXZ6xlMIt+RpwpcuXn+LkxgoHZ97EKENP4uqBGWkOJh5dQnDU3cyBvwFCwKEPWMan5BcPjG7SRYHM5ArSkKQAMBxQL5nMbO4gkXFs4S14LZjjrdNXuuNr6He3tO1VwMOQm8kXfi0Ixb1BXFHssS4fsWSqOCTfeH9HwovYkaBNdck5JZrh7Ju2M/pq4l4o91U7eneHgvnoaAk1Evr2LYs6/8D88dNhIbSBz3HKtfIpntSxBM3BLPqe+3kb4q47JcGprjtG+7pLCETexHksqtOBpHUA5ssi52amsrft04Cb6ud9B7gUCQmFO6mDZZHxjQbkxbLMFAE5KZxt459E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFJyUFBUOVVQVGpmTHBaUTdiWEc4dzZJbVpJQTY3eWw0eUZXZVJteVl2NmFt?=
 =?utf-8?B?bGZURXU2eVcwQlBGcHduM043cDRrOWtSK3d1MFBvcllnZ0ZlUDMxWFRIRG1H?=
 =?utf-8?B?MFRLNU1FY3gvQkgxODk2amlkSUxvTVJZL042Qjd0bVpKTUlMcjBUL1JjZXJj?=
 =?utf-8?B?dWl0WU9hRFBYQnJRa24zOWFzMTBIVHpOMVQ4MmtPWEdzMUNXeW5YNUVrR0ZV?=
 =?utf-8?B?WjdRK3ZscTZuRFJ1cnl6YW9WRzdEanJHY1Zjd0NLclNySk1wY0hIM1pyZVRo?=
 =?utf-8?B?QVRsbmc4QUYvd1JvN0RwdUZYbEZ4YzU2VHEwRksyU0cvYklSV2FYOUZDV2tC?=
 =?utf-8?B?bktnSHUvUnl2QVFzUFFENGZFN2JGaVZKbW45MDUrVDJFVE14aVVpVTNOT1VH?=
 =?utf-8?B?NVNHeE9CdzZ6Ky94aUxtTVpkUnU4aExMMjlkOGdZSVRGZ0taQWhzbFhsbnZT?=
 =?utf-8?B?cVpYSndBWHpOUjZ2b2o5NGwvMHJGVTUwQzJBRnVqY2ZmOE1yTHdPMEdzK2Ey?=
 =?utf-8?B?SmNWeUIwUzVXK2kzSnAvSjBuY21JeVd1ZEhZbk9qbjZzV2VWUWhxdVZ1T2ZH?=
 =?utf-8?B?Q1RwYjJIM21zWjVYa1Z4c3BiOWdHRXZoVTQ3aElpaWdxMkcxRE9HRVBMWkhO?=
 =?utf-8?B?eHVQRlJQZ3RGRWFhQlM4dllDcVRZR3pSNEZiY0lib0p0RG1DcHlFWFRuNW0v?=
 =?utf-8?B?US9GajM0cDdoUjVlaktIenBxQlRoSTZHSFYvKzdNWHB1NkZtU3NqRjBXM2Fn?=
 =?utf-8?B?dzFQVkpQZTZ5cThJZ29IRnpDaXBjVGYreUIzZFJGemFCaWE2VUpqeFVHYjk3?=
 =?utf-8?B?NU11RXpHeXdQOXJQSEp3Y0s5MU9QRkNXdm5IUXh5MDlhV1dFb2gvSExncUhZ?=
 =?utf-8?B?aFNEaTdLb2xsUFFxdEtvYnNYeXFnWXJlT3dnbktsVUJXNXlUYlZpSUlueXhJ?=
 =?utf-8?B?RDZndS9yQUk1L0lzSFd1MTZ6SmlZQjdsVG5md3BOK3MzWlZ2aEo1M20rcjhM?=
 =?utf-8?B?c2RPQ2ZIZzcvTjd4Y0ZVZG56amdERFJQdHpDSFd6c1Y5RzVNVTV2WUJScm9l?=
 =?utf-8?B?cnRUUDBxVi9paG1vZS9wd0oyY2xMZ1E5ZTdHT2FuMitLTE8xanU0TVMxOFZr?=
 =?utf-8?B?QnN0SHFuSmlBanI2M1E4YjFBMzN6ZmFpVjVLd3NMOFcyY1owYXRUdTdsOTZY?=
 =?utf-8?B?R3NIV2ZNcmJFcTNMbkE2QWJSMVRoczJCUlZKd0Z4cGRhSjdYQ0lWZHlneWhl?=
 =?utf-8?B?VFJFSWlOdGZZY1pLM09yL2E2VzIweE4wZEtxRnNnM1IxK3N2OGFLVHhkaXdF?=
 =?utf-8?B?MWo5c0MzN1RpbkNleTNqVCtjU2xoMFVndllYKzFQMUpHUlJPeGRvOWRtdjYy?=
 =?utf-8?B?ZWw1REMzdlBqZHpFUFgzR3NNM0JmOHBiWFg4dFVtcHcyWWRtSGtJRDEzdDBn?=
 =?utf-8?B?V3JnUmM0UTl6WVNtU2Jld1Z0RHNCVkFMN0JkaDJoOFpSU29pUisycldhdUQz?=
 =?utf-8?B?eTRmd3VoS0NkS2FVTWMwRlNlekNHVTRzTDlrZlgwcE9QZ0RQcytLbUM0TkZx?=
 =?utf-8?B?eFY3aHVHeW9pTXhocVNMdVdWeENZZXhRNVhrTFhLSm9MZVh6QlI1dHlDbXdh?=
 =?utf-8?B?MmFJdklWaFUzOWhwbFU1YnFZRlcyVkJxWmtUQ0JYYWNKQmFSRE4xdkg0cjVJ?=
 =?utf-8?B?YUYyRjdVTmZ5YVMwL3BiVlNFVlVlVnQwRTl5Q2FRMmVjTG4waG5LUWNtWGYz?=
 =?utf-8?B?N3hUdzNmMm5tU1RIeUtOTHo3YmFrRFFDN1c5UWdlZzcwY3hmNkxiaUF3RGpz?=
 =?utf-8?B?MEExMzZzR3NtZW5CYVhLc25QOGtDRFBiSCtqdHkrMWk2c3dsWUVEZ21rRU1G?=
 =?utf-8?B?TC8ydXZCVHlWMG1WazFya0QyUUZ0UG1Ndm1vM3VmemJDM3ZsZ0hLL2YvT2du?=
 =?utf-8?B?RjQxdlVNRkxDT3M0R2t1SEt3VEZRbW5JMFRPTjJhK1k0Ym1rYXNiK3VrRTIv?=
 =?utf-8?B?QXRaOUQwUG4yS0wwSUxhL3dydzF4VkU3L3psN3hDZFRabDR6a1ZkNExQOUYy?=
 =?utf-8?B?alQrejVkT1lRa3ZHa2VZTWV3NzZMOXl1dDErVTJHSWJlSWdZQUg5RmMwR05F?=
 =?utf-8?B?ajBtSkl0ZldCSVFnT1pscCtNWUdCVjZqU3hEaldTV2tRc2ltNXdDUWpNcGtv?=
 =?utf-8?B?WENPUjNBd0VmNmQxNjd2dXNaYWRsZkVHbnZjQ2NYTTR2YStZLzdjU3FkajM0?=
 =?utf-8?B?Qk5TeFk4Skp6clczemt1RVluRzloMFcvVHY0Wk1mR2p4ckxvU2hrZ2JUR2l4?=
 =?utf-8?B?ZjRzZlBRSUVLVTQ0Y2tad0dTNTZ3b1EwVEg3YkduYkFHeXd0N3hUQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bef09f3c-d7ca-4ebe-db6d-08df4916a57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 04:02:52.3910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rupu+P80SPNi/eiPJzl7RK+G+A3w7LaTv9LXUUefob2NMKb5YY64ltHhSBPUqwf2DfzSnnvD75jrXBnk/987EmnBDhbmsuVl8+KzbmqIWFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0849

PlN1YmplY3Q6IFtQQVRDSCBuZXRdIHRpcGM6IHJlc3RvcmUgd3JpdGUgcmVhZGluZXNzIHdoZW4g
YSBzb2NrZXQncyBncm91cCBnb2VzDQo+YXdheQ0KPg0KPkZyb206IFN1eXVhbiBXYW5nIDxzdGV2
ZXdvbmdAaHVzdC5lZHUuY24+DQo+DQo+dGlwY19ncm91cF9jcmVhdGUoKSBzZXRzIHRzay0+Z3Jv
dXBfaXNfb3BlbiB0byBmYWxzZSwgYW5kIHRpcGNfcG9sbCgpIG9ubHkNCj5yZXBvcnRzIEVQT0xM
T1VUIGZvciBhIHNvY2tldCBpbiBUSVBDX09QRU4gc3RhdGUgd2hlbiB0aGF0IGZsYWcgaXMgdHJ1
ZS4NCj5Db21taXQgMWIyMmJjYWQ3ZTM5ICgidGlwYzogY29ycmVjdCBpbml0aWFsIHZhbHVlIGZv
ciBncm91cCBjb25nZXN0aW9uIGZsYWciKQ0KPm1hZGUgc3VyZSB0aGUgZmxhZyBpcyB0cnVlIGZv
ciBzb2NrZXRzIHRoYXQgbmV2ZXIgam9pbiBhIGdyb3VwLCBzaW5jZSBvdGhlcndpc2UNCj4iU09D
S19SRE0vREdSQU0gc29ja2V0cyBzZW5kaW5nIGRhdGFncmFtcyBuZXZlciByZWNlaXZlIFBPTExP
VVQiLg0KPg0KPlRoZSBmbGFnIGlzIG5vdCBzZXQgYmFjayB3aGVuIHRoZSBncm91cCBnb2VzIGF3
YXkgYWdhaW4sIHRob3VnaDoNCj4NCj4tIHRpcGNfZ3JvdXBfY3JlYXRlKCkgY2xlYXJzIHRoZSBm
bGFnIGFuZCB0aGVuIGZhaWxzIHdoZW4gdGhlIHRvcG9sb2d5DQo+ICBzdWJzY3JpcHRpb24gY2Fu
bm90IGJlIGNyZWF0ZWQsIGZvciBleGFtcGxlIHdoZW4gVElQQ19NQVhfU1VCU0NSDQo+ICBzdWJz
Y3JpcHRpb25zIGV4aXN0IGFscmVhZHk7DQo+LSB0aXBjX3NrX2pvaW4oKSBkZWxldGVzIHRoZSBu
ZXcgZ3JvdXAgd2hlbiB0aXBjX3NrX3B1Ymxpc2goKSBmYWlscywNCj4gIGZvciBleGFtcGxlIHdo
ZW4gdGhlIG5vZGUncyBwdWJsaWNhdGlvbiBsaW1pdCBpcyByZWFjaGVkOw0KPi0gdGlwY19za19s
ZWF2ZSgpIGRlbGV0ZXMgdGhlIGdyb3VwIHdoaWxlIHRoZSBmbGFnIG1heSBzdGlsbCBiZSBmYWxz
ZSwNCj4gIGUuZy4gYmVjYXVzZSBvZiBncm91cCBjb25nZXN0aW9uLCBvciBiZWNhdXNlIHRoZSBn
cm91cCBoYXMgbm8gb3RoZXINCj4gIG1lbWJlcnMgeWV0Lg0KPg0KPkluIGFsbCB0aHJlZSBjYXNl
cyB0aGUgc29ja2V0IGlzIGJhY2sgdG8gYW4gb3JkaW5hcnkgUkRNL0RHUkFNIHNvY2tldCwgYnV0
DQo+cG9sbCgpIG5ldmVyIHJlcG9ydHMgRVBPTExPVVQgZm9yIGl0IGFnYWluLiBCZWZvcmUgY29t
bWl0DQo+NjBjMjUzMDY5NjMyICgidGlwYzogZml4IHJhY2UgYmV0d2VlbiBwb2xsKCkgYW5kIHNl
dHNvY2tvcHQoKSIpLA0KPnRpcGNfcG9sbCgpIGFsc28gcmVwb3J0ZWQgRVBPTExPVVQgd2hlbiB0
c2stPmdyb3VwIHdhcyBOVUxMLCBzbyBkZWxldGluZyB0aGUNCj5ncm91cCB3YXMgZW5vdWdoOyBz
aW5jZSB0aGVuIHRoZSBmbGFnIGhhcyB0byBiZSByZXNldC4NCj4NCj5TZXQgdHNrLT5ncm91cF9p
c19vcGVuIHRvIHRydWUgaW4gdGhlc2UgdGhyZWUgcGxhY2VzLCBhcyBpdCBpcyBmb3IgYSBzb2Nr
ZXQgdGhhdA0KPm5ldmVyIGhhZCBhIGdyb3VwLCBhbmQgY2FsbCBza193cml0ZV9zcGFjZSgpIHNv
IHRoYXQgYSB0YXNrIGFscmVhZHkgd2FpdGluZyBmb3INCj5FUE9MTE9VVCBpcyB3b2tlbiB1cCwg
YXMgdGlwY19za19maWx0ZXJfcmN2KCkgZG9lcyB3aGVuIGEgZ3JvdXAgYmVjb21lcw0KPm9wZW4g
YWdhaW4uDQo+DQoNClJldmlld2VkLWJ5OiBUdW5nIE5ndXllbiA8dHVuZy5xdWFuZy5uZ3V5ZW5A
ZXN0LnRlY2g+DQo=
