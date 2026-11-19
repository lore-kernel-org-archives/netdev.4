Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795091806;
	b=mFMDmBS9mYRKf1/110okjQKP/DIjNT01PPdaxXs3MscBXkWTQqc8L2p4AehI2t+T++uT
	 fnjhIf/Z2MPH5f84CKE1rMAWtY/7h7gUPu1E8iIg/KU/hT2xU8ThM/MKemqxnnWo3dEZr
	 KtD7DrG1H6xLoS7KJ3ci4c2c78fmapxuba18QRkfo71575dRZ6ZoMCllug3S2gmi6iriU
	 3JNk8mhSjx9UYn6SDuTLNUQh+zN7LZVhdPX8a1ehk8LpWsq1YAP0/WKTIvhHxYHYKWHS1
	 U7ZFlkj14GgIu3TEu5fpXhgXFfCS9eHGY08JPSlc42FgSwNpEppPgtw2CIbqn4Quifw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091806;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1yOSxVGfC8Heg75ZVKVkb2CwexZmzKdXtO6VEie/X94=;
	b=zn8AjMOSa/9xOVPRvBNyX64sJ1kvL7pNM8H86mXwJ+Tqgvg0PY1ExXpUgtKdi7i/rq/H
	 iQ/w+xJ8yoqJUghnwb+Ta/+YgcZcw+Qb86aTgkZ/BGHoTOCEc0ajq3eXYK7tfHfzm3PyR
	 +hKT0ubIWLtjLtkHgDvLfOi+m+35Go01r9GeqPAedYSodvBQM07bP0kzl3+YBl+z73ZT9
	 dHQHYym6WsGeJ8dgJAwWjC9ol8V2tePWyTv0/T1nzAiV4W4CCwXtfW5qPwsTRcK70pGzr
	 sfD4jjCOiEwlJvXyvzfQsFzK3hVndq74IL8ZDOwAyefISEZjr0LD41PWurAnhWgxmXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h6q+FbV2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.68
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656A606A325;
	Thu, 19 Nov 2026 12:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4656A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h6q+FbV2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Cu/SfzT2E9FE2qSWAj0q6ZBGXiD+cRmZoSQcOvWnct/ZPew0TDkiYzSxkIo1r7fPiYrkQlXAuebfFjudH+SqeYU3Koq2dPYTRSACL4LhlpJM4um2VGztEoSwHr+jn1MlChuz/0Y2cECbPIHprU9EQ+923I/SBKDMinI8un/g0H19I5tE4nT5F00ft3Dns0XMv1725yyfhE5nrwlAviphL50+i9k5VgU+Wd0xLBdqsrGagHe2vOHt7d5y3OMpTlomhBzfTkvotXZ1BvLxC9QTvzgHf4PVjSooOleLbgD11vVwzxr5phkuekG35l5Lv4VFshkDZXdKTnGYj94vLufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yOSxVGfC8Heg75ZVKVkb2CwexZmzKdXtO6VEie/X94=;
 b=C7M+wNZo+Q5PZc3pSheHAqTJUZdLGxsgsvDUjiOhVD2/bubyjbyA2W8QzTKl9BpkgaPHeGlk7MQLlzGZsRG3l+w/6AfhtugTUKzfjGvs8t4a89iKXzjwoLeivkqJJhjYCz+EJs6/zQ3CIEVkovq/do99AG6DseO+8GLzdd3/EJWAgTrvWgkb5qyHoo5YUr+jnwxa7Tl3WmaTts1PMAG5m7PQL4LRc9nbtms97Siq0pQ19T2/PGm3GbRvnYeJYHw4RVk+sj32VfalBdaHTYW1G+bNuWTSSzOe9l9fWbNRYKnypYi3HV58lfHbmMn7QFfOl32AAMDotRXHifAmN4oreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yOSxVGfC8Heg75ZVKVkb2CwexZmzKdXtO6VEie/X94=;
 b=h6q+FbV2uqJyLfjCHkyXuT8OWtgRO4cbsb7eXD3F0VEc3sNp1BJzIGWxE2XIjBv16AJR8Us2Z6JPrMZ+2Og+TVGUXJlaxhIMXQsw/AuUQScYxoYL4bds8jpalJsU67wP//uMOXxMLlgRIx8gjycHsCxjboQl8/74yVhcAqAeEKM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:36:41 +0000
Received: from SJ2PR12MB8953.namprd12.prod.outlook.com
 ([fe80::f3b5:fc98:8973:5c0b]) by SJ2PR12MB8953.namprd12.prod.outlook.com
 ([fe80::f3b5:fc98:8973:5c0b%7]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 12:36:41 +0000
Message-ID: <fe08db37-4415-4b4b-b226-cc1a0ec4f029@amd.com>
Date: Thu, 19 Nov 2026 18:06:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across link
 down/up
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
Content-Language: en-US
From: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
In-Reply-To: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To SJ2PR12MB8953.namprd12.prod.outlook.com
 (2603:10b6:a03:544::14)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8953:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dfc6410-5597-49e8-1923-08df4639c2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|261102123227099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|4143699003|56012099006|10067099003|260925021311599003|260925021911599003|260925022911599003|18002099003|22082099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	36VdvV9XBbh3GMnxFi2/+mZgcAkL8+ARvfamKjxeUwG0j+AjnMfYLkZSgrFLQ1Cx/dXj/lVRMnwTc186p4aY2J6Et9w9UmcdcDMEtCBbtXCUGtyAorJa5r0oSdqHnS82mfTeoP4WHxREN6QwZMUvDvGtcUAyVQssY94GqSPOYwDidjne07S5OZymvdS7FMwJKAq7b/s1Bx0bIqodPQOj9Oc/URtD6uSYKkbMyG/LllktR82C0oENrZ17l5dakg3n908w+yZbHKaOcNgpCErTtr3MCcv19QzCaaGJb5pwuly7Gvm1CnQdP6ncZzp9zDG9H8Aybt6Ek2B7hGw/AJcIVx0XyVR5yIQ1yFgObWs0BerJ0dsQrsJd2XOUGq0UpkuMqqbIMPPBMiAKZPJGw2p6/wK9dHk39RUde1vYgv4/sHHOiJZ0cno9YAbH7+vSNdI+NvCYWjJyaRGns/U8o+oOL0RGl4brPlLyIm0AUsoosfPVz2KKLRDQsNg7BY9teFHjYLMnwKXvMQTEo8++wP4pREuYUUD4xJWI6kAx3d5ApGjf48IsFEwEngLpMVhG6QjmMTNS268AZNiP259WzWV/ZeTqvjdHPbjPVt2KN1eAglsaFHZ/cvwW7m/J5JCYyMHo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(4143699003)(56012099006)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dStYR1ptbjdmYjdnMXBpOERDL2hGUVd0L3BnU0J1K0xwSS9LRmpEV2p3MVdZ?=
 =?utf-8?B?K1VrZ1dwaGRGVHQvMGdYZFR1bzl6NEVEYWRmczB6Q1FTa2R4NTA5eEZCdEJC?=
 =?utf-8?B?V1M1aFdYZUpvODNjcDFBNFlhZmpFT0FQSnNLTDR2dWxTWmtRN09pR09MUnFi?=
 =?utf-8?B?cDB6MW5UU1ZZZk1CRFRTN1VuR25WbVVMQVNlRlNKbTlVVm5oVDNGcXkzV1F6?=
 =?utf-8?B?a010MFBRSG41MXFIbndodU5YVlV0OHJ5eGVaL2E1dDJxZ2NSd2tVUXF6OWg5?=
 =?utf-8?B?ZmRTTytObldOMm9CTXZCVzA3ODFscVU5US9FbGp5eVZMMnRWZGlhM0lFVHdt?=
 =?utf-8?B?ZVRsdVJQWFNhSWMxb1J2OUE4WFo5TCt4SllGdTJkeDBmaXZuNEowR0VDMFZO?=
 =?utf-8?B?YUExSnhybVZ4cXNCNklMeDUydFVrbk1KazBhenBHaGJkWllkaXNZYTQ0bFFx?=
 =?utf-8?B?aTBocXN2OWhMYjM2di91Rm84TnE1Nm5XM29UL0Y3ek56UUkvdlhrZWMzcmU0?=
 =?utf-8?B?L0FvbHllUGVPajhvZEdhN09jeXNteXQ0ZTk2a1ZjMkRwVGVFeEs4UitBUjJu?=
 =?utf-8?B?NEdIa0JjWHJpRjBEUU1OSzBaS0xQdGl1dTRDYXNNdHlrb2lTckRWS1N4bHNY?=
 =?utf-8?B?L1prS1NDbUZqMzFQdjZ6Y0prTE5Oa1hNdXB0cFBoSHRwdWJZbC9RTklmN3dH?=
 =?utf-8?B?WlRWNnlJQXJkelpVTTZnczZsMzRxcjZrVWh2Y1F3cCtZdC9uVzNwN0hUbjhY?=
 =?utf-8?B?eTMwUnJOdTk4bzQ5MnhZcEZYZHFFak5pVXVKOUJPWVdPd2tsZE5IRS9Dd2Yr?=
 =?utf-8?B?aTZweUZlbFBjTjNWQWtSUkxaZ205djlFVmsvMjlNRnZmQ0R4NFJKeEZCaENv?=
 =?utf-8?B?YVU0Zk1mN0NFMHlJODNBcStBb3hHRDVaenNnM2dzMmJKYXpGdzNRbGtzUnRL?=
 =?utf-8?B?TytMbW9neElCQWxzaFZpKzJobEQ2SytEQXQvVG5hczlXbVBibjVING9XL3RB?=
 =?utf-8?B?dDRnMlp0dFNuWWFqU3ZubTBYbWhWZ3gwZHUzcmVDUWowRThQZFc4SzVjQUNV?=
 =?utf-8?B?QXUyeGg1SjkxZWF5dlRIc0VKNFk3ZCs4dzRHb05TSGh6OTI3N1F6dHp3bDBF?=
 =?utf-8?B?dGZkWmxRMGUrbDF2VTNlOE1HbmsxcGxpVEFHSURObGVOeDFjT3g4NlY5QmN2?=
 =?utf-8?B?Y2c4TXNuRWFIWlp0WWlkaHlZdVJ6cjQyRUtSNEs5MDl0Q1ZrWW9yQTVQUjQ0?=
 =?utf-8?B?bmtNL0xGaFF5RmF2TTFtMVM4c3g5Wnk1RU1RK2Y5VitKbGtmMGN5a2d4Znpk?=
 =?utf-8?B?Tkh0Z0huaVVXSW0zRmZ3UlpsV1cvRERnZXVhaW9RU2gxWGJ4UHlVeENIZVIy?=
 =?utf-8?B?azFDZlFlOFAzbkczUDFuZmQyMlRSaUNLVENXcXZSa2orWlhPa2hEMjg5QW1V?=
 =?utf-8?B?a1pENmdhczU2a2N0QXhtbmJsNG44bFNtS1B2M1lVUUR3N3NWU0s1dG0wRUND?=
 =?utf-8?B?VTBOZ25xYzQxb1lQTmkrc1BiSXIvSUVoQzFuOTFkWHJYejFldmM5dUZOUXBU?=
 =?utf-8?B?Q0FvY1FOWXdXKy8raGdGZXNEYnpZc1o0ZE4xYXpqUjAwNW4zcWJSN2RvU1Ez?=
 =?utf-8?B?eDZnRnhSVFdkV3AzMTN5cHJNK3kvY0VYVHhoQmdpV3Jta2JOZkZVMkFtbC9J?=
 =?utf-8?B?cVBESVREQlR4M3d1dVRnSytLT2hXNmV0NmlqWmVpRE0vUVV2WjAzNDltSXYr?=
 =?utf-8?B?NG9RMXpsdlhpMnRDMFM5SGpwbU9Ceko5QlBHUmJVNUZBY080bnU2K3doc2VP?=
 =?utf-8?B?M3lXKzRFcjVXZElsU01udUloeWRTNnZMalFGNUNnQnphelpWdEsvWlY1UTdO?=
 =?utf-8?B?eEthdUhVU1ZzRjZGbEpBUHBZSmlJVGFhRkx5bk1YRFZEM1FlaWpXNXNMcFNy?=
 =?utf-8?B?dGxCdEtJNW9Rc3BNNytVWlVMbzdUZENCRERkQTFmbWs3c2Frc1Vva2NUL1JT?=
 =?utf-8?B?ajBEcUhEempNS2xuTllReUg5cUI4UVlFbWFvOVhkbHpiQnNNQ29naEhwak5O?=
 =?utf-8?B?SGNGRFZUWTBRa1M2Mk9VMDJ6TGJZWkxxR203NUVZL0dvbjlKaXF0d3hmaTA3?=
 =?utf-8?B?aWFMVUIxa3MweUpvWkxtVG90S2dFeGFlYlVPd29BRTZ5d2FOQlJLUEZvQU1G?=
 =?utf-8?B?cXdkWnN3Vmw0aHZabjl4dTB1QUlJMER2NlQwbEptUzJUTFpJdmdsdFNzamNF?=
 =?utf-8?B?UFNTOGV6NTc5alRObU5oMDQrT0FWMzBBVnBURUUzdnpuUlVHMEc1MnJZVEVY?=
 =?utf-8?B?dGh1eHFzajdCampHYTdOQmo2ZXlOZUp5Y2ZUVXRsb3ZkaHVoelRVdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfc6410-5597-49e8-1923-08df4639c2ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:36:41.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXS0IQbz9iCUPeimPa6QIbvrqjbSSCFx12GilWMt1J+VxV6pQoW7wAx31vZ8trM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343

Hi Théo,

On 11/19/2026 2:23 AM, Théo Lebrun wrote:
> Currently, ENST is not explicitly restored across interface close/open.
> If HW keeps its register state then ENST is kept, otherwise it is lost;
> but we do not write the ENST schedule again on open.
> 
> This causes trouble if the config is not compatible with the new open
> and link-up. The two issues that can occur are a link speed change (as
> all timings are configured in a unit relative to the link speed) or a
> change in the # of queues.
> 

Thanks for the patch.

We are working on the same problem for CBS, covering the four scenarios
listed in:
https://lore.kernel.org/netdev/a04aa4d5-335b-47c1-b969-e89b18c9b142@amd.com/

Since this patch reworks how ENST state is kept and restored, it would
be good to introduce a generic top-level tc structure here, which ENST,
CBS and any later TSN offloads can share, instead of an ENST-specific one.

> The latter is the main reason we do this change before implementing
> ethtool -L support.
> 
> If on link-up, the cached ENST config is invalid (link speed changed),
> then we drop the cached config, log a warning and explicitly override
> all ENST timings previously configured in the registers. If it is
> valid, we explicitly re-apply it.
> 
> Take this opportunity to replace a kmalloc in
> macb_taprio_setup_replace() with a simple and tiny (104b) stack value.
> 
> Drop the old hack of checking for pm_runtime_suspended(), which has
> little value because we could race with the runtime_suspend() call.
> 
> Synchronise our config using the existing bp->mac_cfg_lock mutex, taken
> by macb_taprio_setup_replace() and macb_taprio_destroy(). To avoid an
> ABBA deadlock between bp->mac_cfg_lock and phydev->lock taken by
> phylink_ethtool_ksettings_get(), cache the link speed as bp->speed_mbps.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      |  47 +++++---
>  drivers/net/ethernet/cadence/macb_main.c | 187 +++++++++++++++----------------
>  2 files changed, 124 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index b7b4b6a38298..00258866623f 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -1327,6 +1327,35 @@ struct macb_context {
>  	struct macb_txq		txq[MACB_MAX_QUEUES];
>  };
>  
> +/**
> + * struct macb_queue_enst_config - Configuration for Enhanced Scheduled Traffic
> + * @start_time_mask:  Bitmask representing the start time for the queue
> + * @on_time_bytes:    "on" time nsec expressed in bytes
> + * @off_time_bytes:   "off" time nsec expressed in bytes
> + *
> + * This structure holds the configuration parameters for an ENST queue,
> + * used to control time-based transmission scheduling in the MACB driver.
> + */
> +struct macb_queue_enst_config {
> +	u32 start_time_mask;
> +	u32 on_time_bytes;
> +	u32 off_time_bytes;
> +};
> +
> +/**
> + * struct macb_enst - Cached Enhanced Scheduled Traffic configuration
> + * @queues:     per-queue timing (zeroed for queues without schedule)
> + * @speed_mbps: link speed the timings were computed for, 0 if no schedule
> + * @queue_mask: queues enabled by the current schedule, 0 if no schedule
> + *
> + * The timings are expressed in bytes, so they depend on the link speed.
> + */
> +struct macb_enst {
> +	struct macb_queue_enst_config	queues[MACB_MAX_QUEUES];
> +	u32				speed_mbps;
> +	u32				queue_mask;
> +};
> +

Could this be a per-queue structure shared by all tc offloads, so that
new features only add their own part?
For example:

struct macb_tc_queue {
        struct {
                u32 idleslope;          /* kbps */
        } cbs;
        struct {
                u32 start_time;         /* ENST_START_TIME register value */
                u32 on_time_ns;         /* gate open interval */
                u64 off_time_ns;        /* gate closed interval */
        } enst;
};

>  struct macb {
>  	void __iomem		*regs;
>  	bool			native_io;
> @@ -1427,11 +1456,14 @@ struct macb {
>  
>  	/* Redundant to netif_carrier_ok(), but set under bp->mac_cfg_lock. */
>  	bool			link_up;
> +	u32			speed_mbps;
>  
>  	u32	rx_intr_mask;
>  
>  	struct macb_pm_data pm_data;
>  	const struct macb_usrio_config *usrio;
> +
> +	struct macb_enst enst;
>  };
>  
>  #ifdef CONFIG_MACB_USE_HWSTAMP
> @@ -1532,19 +1564,4 @@ struct macb_platform_data {
>  	struct clk	*hclk;
>  };
>  
> -/**
> - * struct macb_queue_enst_config - Configuration for Enhanced Scheduled Traffic
> - * @start_time_mask:  Bitmask representing the start time for the queue
> - * @on_time_bytes:    "on" time nsec expressed in bytes
> - * @off_time_bytes:   "off" time nsec expressed in bytes
> - *
> - * This structure holds the configuration parameters for an ENST queue,
> - * used to control time-based transmission scheduling in the MACB driver.
> - */
> -struct macb_queue_enst_config {
> -	u32 start_time_mask;
> -	u32 on_time_bytes;
> -	u32 off_time_bytes;
> -};
> -
>  #endif /* _MACB_H */
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 9f6111661b40..1e0666692116 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -847,6 +847,7 @@ static void macb_mac_link_down(struct phylink_config *config, unsigned int mode,
>  	mutex_lock(&bp->mac_cfg_lock);
>  
>  	bp->link_up = false;
> +	bp->speed_mbps = 0;
>  
>  	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
>  		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
> @@ -955,6 +956,43 @@ static void gem_shuffle_tx_rings(struct macb *bp)
>  		gem_shuffle_tx_one_ring(queue);
>  }
>  
> +static void macb_apply_enst_config(struct macb *bp)
> +{
> +	struct macb_queue_enst_config *config;
> +	struct macb_queue *queue;
> +	u32 queue_mask;
> +	size_t q;
> +
> +	/* Short-circuit to avoid writing to invalid register offsets */
> +	if (!(bp->caps & MACB_CAPS_QBV))
> +		return;
> +
> +	guard(spinlock_irqsave)(&bp->lock);
> +
> +	/* Disable ENST for all queues.
> +	 * Reconfiguring timings must be done with ENST disabled.
> +	 */
> +	queue_mask = BIT_U32(bp->num_queues) - 1;
> +	gem_writel(bp, ENST_CONTROL,
> +		   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
> +
> +	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> +		/* Configure queue timing registers.
> +		 *
> +		 * Those fields must be zero if the queue has ENST disabled:
> +		 * notice we don't bother reading bp->enst.queue_mask & BIT(q).
> +		 */
> +		config = &bp->enst.queues[q];
> +		queue_writel(queue, ENST_START_TIME, config->start_time_mask);
> +		queue_writel(queue, ENST_ON_TIME, config->on_time_bytes);
> +		queue_writel(queue, ENST_OFF_TIME, config->off_time_bytes);
> +	}
> +
> +	/* Enable ENST for all configured queues in one write */
> +	if (bp->enst.queue_mask)
> +		gem_writel(bp, ENST_CONTROL, bp->enst.queue_mask);
> +}
> +
>  static void macb_mac_link_up(struct phylink_config *config,
>  			     struct phy_device *phydev,
>  			     unsigned int mode, phy_interface_t interface,
> @@ -972,6 +1010,7 @@ static void macb_mac_link_up(struct phylink_config *config,
>  	spin_lock_irqsave(&bp->lock, flags);
>  
>  	bp->link_up = true;
> +	bp->speed_mbps = speed > 0 ? speed : 0;
>  
>  	ctrl = macb_or_gem_readl(bp, NCFGR);
>  
> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_config *config,
>  
>  	spin_unlock_irqrestore(&bp->lock, flags);
>  
> +	if (bp->enst.speed_mbps && speed != bp->enst.speed_mbps) {

Why drop the schedule on a speed change? The taprio qdisc stays
installed, so the user's configuration is still valid;
Could we instead recompute the ON/OFF times for the new speed on
link-up, and only disable (with a warning) the queues whose intervals no
longer fit the hardware range at that speed?

> +		netdev_warn(bp->netdev,
> +			    "TAPRIO dropped because link speed changed\n");
> +
> +		memset(&bp->enst, 0, sizeof(bp->enst));
> +	}
> +
> +	macb_apply_enst_config(bp);
> +

Could this be a single macb_apply_tc_config() (or similar) that
reprograms every enabled tc offload? CBS needs exactly the same
handling, since idleslope is also relative to the link rate.

Thanks,

>  	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
>  		macb_set_tx_clk(bp, speed);
>  		gem_shuffle_tx_rings(bp);
> @@ -4754,19 +4802,23 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  				     struct tc_taprio_qopt_offload *conf)
>  {
>  	u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
> -	u32 configured_queues = 0, speed = 0, start_time_nsec;
> -	struct macb_queue_enst_config *enst_queue;
> -	struct ethtool_link_ksettings kset = {};
> +	u32 configured_queues = 0, start_time_nsec;
>  	struct macb *bp = netdev_priv(netdev);
>  	struct tc_taprio_sched_entry *entry;
> -	struct macb_queue *queue;
> -	u32 queue_mask;
> +	struct macb_enst config = {};
>  	u8 queue_id;
> -	size_t i, q;
> -	int err;
> +	u64 off;
> +	size_t i;
> +
> +	guard(mutex)(&bp->mac_cfg_lock);
> +
> +	if (unlikely(!bp->speed_mbps)) {
> +		netdev_err(netdev, "Invalid speed, link-down?\n");
> +		return -EINVAL;
> +	}
>  
>  	if (conf->num_entries > bp->num_queues) {
> -		netdev_err(netdev, "Too many TAPRIO entries: %zu > %d queues\n",
> +		netdev_err(netdev, "Too many TAPRIO entries: %zu > %u active queues\n",
>  			   conf->num_entries, bp->num_queues);
>  		return -EINVAL;
>  	}
> @@ -4777,23 +4829,6 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  		return -ERANGE;
>  	}
>  
> -	/* Get the current link speed */
> -	err = phylink_ethtool_ksettings_get(bp->phylink, &kset);
> -	if (unlikely(err)) {
> -		netdev_err(netdev, "Failed to get link settings: %d\n", err);
> -		return err;
> -	}
> -
> -	speed = kset.base.speed;
> -	if (unlikely(speed == SPEED_UNKNOWN || !speed)) {
> -		netdev_err(netdev, "Invalid speed %d, link-down?\n", speed);
> -		return -EINVAL;
> -	}
> -
> -	enst_queue = kzalloc_objs(*enst_queue, bp->num_queues);
> -	if (unlikely(!enst_queue))
> -		return -ENOMEM;
> -
>  	/* Pre-validate all entries before making any hardware changes */
>  	for (i = 0; i < conf->num_entries; i++) {
>  		entry = &conf->entries[i];
> @@ -4801,25 +4836,23 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  		if (entry->command != TC_TAPRIO_CMD_SET_GATES) {
>  			netdev_err(netdev, "Entry %zu: unsupported command %d\n",
>  				   i, entry->command);
> -			err = -EOPNOTSUPP;
> -			goto cleanup;
> +			return -EOPNOTSUPP;
>  		}
>  
>  		/* Validate gate_mask: must be nonzero, single queue, and within range */
>  		if (!is_power_of_2(entry->gate_mask)) {
>  			netdev_err(netdev, "Entry %zu: gate_mask 0x%x is not a power of 2 (only one queue per entry allowed)\n",
>  				   i, entry->gate_mask);
> -			err = -EINVAL;
> -			goto cleanup;
> +			return -EINVAL;
>  		}
>  
>  		/* gate_mask must not select queues outside the valid queues */
>  		queue_id = order_base_2(entry->gate_mask);
>  		if (queue_id >= bp->num_queues) {
> -			netdev_err(netdev, "Entry %zu: gate_mask 0x%x exceeds queue range (max_queues=%d)\n",
> -				   i, entry->gate_mask, bp->num_queues);
> -			err = -EINVAL;
> -			goto cleanup;
> +			netdev_err(netdev, "Entry %zu: gate_mask 0x%x exceeds active queue range (num_queues=%u)\n",
> +				   i, entry->gate_mask,
> +				   bp->num_queues);
> +			return -EINVAL;
>  		}
>  
>  		/* Check for start time limits */
> @@ -4828,34 +4861,33 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  		if (start_time_sec > GENMASK(GEM_START_TIME_SEC_SIZE - 1, 0)) {
>  			netdev_err(netdev, "Entry %zu: Start time %llu s exceeds hardware limit\n",
>  				   i, start_time_sec);
> -			err = -ERANGE;
> -			goto cleanup;
> +			return -ERANGE;
>  		}
>  
>  		/* Check for on time limit */
> -		if (entry->interval > enst_max_hw_interval(speed)) {
> +		if (entry->interval > enst_max_hw_interval(bp->speed_mbps)) {
>  			netdev_err(netdev, "Entry %zu: interval %u ns exceeds hardware limit %llu ns\n",
> -				   i, entry->interval, enst_max_hw_interval(speed));
> -			err = -ERANGE;
> -			goto cleanup;
> +				   i, entry->interval,
> +				   enst_max_hw_interval(bp->speed_mbps));
> +			return -ERANGE;
>  		}
>  
>  		/* Check for off time limit*/
> -		if ((conf->cycle_time - entry->interval) > enst_max_hw_interval(speed)) {
> +		off = conf->cycle_time - entry->interval;
> +		if (off > enst_max_hw_interval(bp->speed_mbps)) {
>  			netdev_err(netdev, "Entry %zu: off_time %llu ns exceeds hardware limit %llu ns\n",
> -				   i, conf->cycle_time - entry->interval,
> -				   enst_max_hw_interval(speed));
> -			err = -ERANGE;
> -			goto cleanup;
> +				   i, off,
> +				   enst_max_hw_interval(bp->speed_mbps));
> +			return -ERANGE;
>  		}
>  
> -		enst_queue[queue_id].start_time_mask =
> +		config.queues[queue_id].start_time_mask =
>  			(start_time_sec << GEM_START_TIME_SEC_OFFSET) |
>  			start_time_nsec;
> -		enst_queue[queue_id].on_time_bytes =
> -			enst_ns_to_hw_units(entry->interval, speed);
> -		enst_queue[queue_id].off_time_bytes =
> -			enst_ns_to_hw_units(conf->cycle_time - entry->interval, speed);
> +		config.queues[queue_id].on_time_bytes =
> +			enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
> +		config.queues[queue_id].off_time_bytes =
> +			enst_ns_to_hw_units(off, bp->speed_mbps);
>  
>  		configured_queues |= entry->gate_mask;
>  		total_on_time += entry->interval;
> @@ -4866,82 +4898,47 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  	if (total_on_time > conf->cycle_time) {
>  		netdev_err(netdev, "Total ON %llu ns exceeds cycle time %llu ns\n",
>  			   total_on_time, conf->cycle_time);
> -		err = -EINVAL;
> -		goto cleanup;
> +		return -EINVAL;
>  	}
>  
>  	netdev_dbg(netdev, "TAPRIO setup: %zu entries, base_time=%lld ns, cycle_time=%llu ns\n",
>  		   conf->num_entries, conf->base_time, conf->cycle_time);
>  
> -	/* All validations passed - proceed with hardware configuration */
> -	scoped_guard(spinlock_irqsave, &bp->lock) {
> -		/* Disable ENST queues if running before configuring */
> -		queue_mask = BIT_U32(bp->num_queues) - 1;
> -		gem_writel(bp, ENST_CONTROL,
> -			   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
> +	config.queue_mask = configured_queues;
> +	config.speed_mbps = bp->speed_mbps;
> +	bp->enst = config;
>  
> -		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> -			/* Configure queue timing registers */
> -			queue_writel(queue, ENST_START_TIME,
> -				     enst_queue[q].start_time_mask);
> -			queue_writel(queue, ENST_ON_TIME,
> -				     enst_queue[q].on_time_bytes);
> -			queue_writel(queue, ENST_OFF_TIME,
> -				     enst_queue[q].off_time_bytes);
> -		}
> -
> -		/* Enable ENST for all configured queues in one write */
> -		gem_writel(bp, ENST_CONTROL, configured_queues);
> -	}
> +	macb_apply_enst_config(bp);
>  
>  	netdev_info(netdev, "TAPRIO configuration completed successfully: %zu entries, %d queues configured\n",
>  		    conf->num_entries, hweight32(configured_queues));
>  
> -cleanup:
> -	kfree(enst_queue);
> -	return err;
> +	return 0;
>  }
>  
>  static void macb_taprio_destroy(struct net_device *netdev)
>  {
>  	struct macb *bp = netdev_priv(netdev);
> -	struct macb_queue *queue;
> -	u32 queue_mask;
> -	unsigned int q;
> +
> +	guard(mutex)(&bp->mac_cfg_lock);
>  
>  	netdev_reset_tc(netdev);
> -	queue_mask = BIT_U32(bp->num_queues) - 1;
> +	memset(&bp->enst, 0, sizeof(bp->enst));
>  
> -	scoped_guard(spinlock_irqsave, &bp->lock) {
> -		/* Single disable command for all queues */
> -		gem_writel(bp, ENST_CONTROL,
> -			   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
> +	if (bp->link_up)
> +		macb_apply_enst_config(bp);
>  
> -		/* Clear all queue ENST registers in batch */
> -		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> -			queue_writel(queue, ENST_START_TIME, 0);
> -			queue_writel(queue, ENST_ON_TIME, 0);
> -			queue_writel(queue, ENST_OFF_TIME, 0);
> -		}
> -	}
>  	netdev_info(netdev, "TAPRIO destroy: All gates disabled\n");
>  }
>  
>  static int macb_setup_taprio(struct net_device *netdev,
>  			     struct tc_taprio_qopt_offload *taprio)
>  {
> -	struct macb *bp = netdev_priv(netdev);
>  	int err = 0;
>  
>  	if (unlikely(!(netdev->hw_features & NETIF_F_HW_TC)))
>  		return -EOPNOTSUPP;
>  
> -	/* Check if Device is in runtime suspend */
> -	if (unlikely(pm_runtime_suspended(&bp->pdev->dev))) {
> -		netdev_err(netdev, "Device is in runtime suspend\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>  	switch (taprio->cmd) {
>  	case TAPRIO_CMD_REPLACE:
>  		err = macb_taprio_setup_replace(netdev, taprio);
> 

-- 
🙏 Vineeth

