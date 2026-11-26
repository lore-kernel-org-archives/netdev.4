Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687064;
	b=oo3OWDFIKD5X0YJWI5KOuWWIS2q+P6hCte30hlz2XT3XdhVGDYdHATCQuPgaUSzjfVXt
	 uWIrOxCF/4Yph5LNuI/qF6CEpGP4m1L8Lg0ah1SwnbacUC5Ggo5+R1IpRtqSfSbtvRLEh
	 so964YBzXuFfqlWnOYS0VNNADdqodzr5QbmCET3uoU9kFujYN4YE3TVFoXfwitQmThAAH
	 aBoM/ZLlzRy5IjaoWzq+RfqmK8QuVstEr7hbYMZ1yhfY+0RHOvjCoBPz8WLKCWg6LJJjV
	 A7dA2GO3znuFWSdQK4MX0ca//JPl2mEDjE7W8DihfvTuDFb/NksEKbaIUjVqZ1oSPMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687064;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QIeu9kyoMCvW0iZcfSRwwFC9BfDuZzX9n+bNIMDOE18=;
	b=Qb3CXeAjsCMcnsfoO0TUnbja5MHpr12UtnwqxprReUMkYmgRZTJdHgFVcbD9FFR6bAnF
	 DOhNfBjuugO6JmbgVWxzoktNra2ReoK5g1PwbEfkfWyKPUuHVRWoPOsrK7Afsf0OqPQFC
	 KBPzvmScsy7+pFVz5sZeNwqjHOMdtFU31//kO2N2yP8HM0b+ebHUr0xXZGh1cqTsrC1LX
	 U6q7VHY/VQNd36vzLhog0VSwQxoWeF0m3WOrnPzFE8KclwFESZMv7ZSejplUmmkob5Nqk
	 WiMF0qQpGvPdt1Xjb6/XMfLhKOd5nTa8OPPR8mBVc6anUDWp1rIDbG+t1SQPKeVneJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=airoha.com header.i=@airoha.com header.a=rsa-sha256 header.s=dk header.b="LgXEC/34";
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=qCHteaIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974F606A31C;
	Thu, 26 Nov 2026 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B974F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airoha.com header.i=@airoha.com header.a=rsa-sha256 header.s=dk header.b=LgXEC/34;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=qCHteaIu
X-UUID: cefb18d4e97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=airoha.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=QIeu9kyoMCvW0iZcfSRwwFC9BfDuZzX9n+bNIMDOE18=;
	b=LgXEC/34pPZzF8B2fv/dWZwJO9pos3dd4OuOawCI+qljNqKC+K/FCzFyeAWG0KMgTlly7X+PmktImQczT6hoy50ceCIlz+IZSui1dtC5Of9paxvVr34AX2fN7NPp7sZUYcMAZ0sooAJXELhPvtl8iHYvpjdZODakO9t8gAueQTM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ecd577cf-9af9-4d85-a767-62288c6d39a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:feda5f31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cefb18d4e97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <albert-al.lee@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 687913951; Thu, 26 Nov 2026 17:57:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:57:36 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 17:57:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0lFAPaFpszPkmhXcxHrXUVmgoV5JJlJCbnHT36bAkpsuqxfm0GkrQuabvdodRynLtE3oD9ZHPg+8fvfGHs52fW7fepWlCIdL2zPrdZC5S0stYOabwUNTfcdULADkLuHw28wEj5DTHKmDA7ROJfcZ5e4sOorD/drajDJNfz5s47DjRxZun4ycWZMt6BB2LIWw0RTKoxluyXFp1dctJ1PhThQKzvogIHJ/Btb9eS8gEOs5HgpRP1hqgZcQfhyXkxoKiK5DqJGj0+kCPdhykYtcvb2acQDZDdgqbyWl8mLr2n6bsW52+w2YBXhVEDYHDv8MRT/BkIXL4SAE4pc/qaiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIeu9kyoMCvW0iZcfSRwwFC9BfDuZzX9n+bNIMDOE18=;
 b=oxf7Qgqkn8SfqlYuqd4QoME7+UbbjuCsMz192yjUqzRHgu98M3DhlWmjV2iSiS10D1Yoc2COCcnqZgroJj+aFSW7oLvG/gotchmiMBzsRR7i+MSy64z27EAzCQMcltdT8RUy5hJP95xHIW3r26lQyhChYqh5kAleWO0/qdTjUEBMGWdbaHJjMAT13tLZNj9s5idxb4/sMMJw1nlWx5TypR09QPzhsKPFQ/sLrxHXxxjfeRcgG51H2k5G7u5OC7ssHnwsNNlxoXFz3Q9UvaUCuW9J3d/3crjC3ly+WKB61G7XV6B3B+7hLQDrvZvZJ2rAhJGlaGaQhKkko8xUrYZC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=airoha.com; dmarc=pass action=none header.from=airoha.com;
 dkim=pass header.d=airoha.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIeu9kyoMCvW0iZcfSRwwFC9BfDuZzX9n+bNIMDOE18=;
 b=qCHteaIuSVacUPHE6qsWMmKYT3eh1DZu5mVflLEW298AX1x+SE4vwZLSSsKVRJxBTcDCKyV/nq/vUetrGJdDeLH3+VCzk9LlX4+1S7J8KTO+TkYsuuLb0CW4KqvEAIdbliQEXqcuQj2loA1eEnPG42+JxghkfKTzITRlucrvFWU=
Received: from TYZPR03MB5213.apcprd03.prod.outlook.com (2603:1096:405:6::5) by
 SEZPR03MB7539.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov 2026
 09:57:20 +0000
Received: from TYZPR03MB5213.apcprd03.prod.outlook.com
 ([fe80::55e3:f988:e5b1:ab19]) by TYZPR03MB5213.apcprd03.prod.outlook.com
 ([fe80::55e3:f988:e5b1:ab19%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:57:20 +0000
From: =?big5?B?QWxiZXJ0LUFMIExlZSAop/WuYae7KQ==?= <albert-al.lee@airoha.com>
To: Aleksei Sviridkin <f@lex.la>
CC: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Eric Woudstra <ericwouds@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King
	<linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, =?big5?B?THVjaWVuIEpoZW5nICi+R7K7tnYp?=
	<lucien.jheng@airoha.com>, =?big5?B?V2FkZSBDaG91ICipUKTlv0Ep?=
	<wade.chou@airoha.com>, =?big5?B?V2lsbCBMdSAov2O1vt5tKQ==?=
	<will.lu@airoha.com>, =?big5?B?V2VpVGluZyBMZWUgKKf1q8K+Xik=?=
	<weiting.lee@airoha.com>
Subject: Re: [PATCH net-next] net: phy: air_en8811h: use firmware loaded by
 the bootloader
Thread-Topic: [PATCH net-next] net: phy: air_en8811h: use firmware loaded by
 the bootloader
Thread-Index: AQHdfYWZYVOdZ4RkLE++7CGIgFnq0g==
Date: Thu, 26 Nov 2026 09:57:20 +0000
Message-ID: <TYZPR03MB521343DB5E35A9FDCD2FC184C7422@TYZPR03MB5213.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-traffictypediagnostic: TYZPR03MB5213:EE_|SEZPR03MB7539:EE_
x-ms-publictraffictype: Email
client-request-id: 8e22a099-4b2b-4b58-895a-19ca86d95d79
request-id: a3fea6c9-f4cc-4ab1-3ed4-08df4ba3a93a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|261026121527099003|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|18002099003;
x-microsoft-antispam-message-info: CUx+aC7UbZpX2h+TcLwU0rUePYZlBDTmDiddzfUsAUj7IygfdQNZacY9cjWG1WzHB1DC3Ntm9xPh7QqGt98K+CL6wiw8Q6csH4JlCJmvZ0MhzqJCUj0IGM+R750BmmGVDRZg80mZU/MyIyjbt8O01p+scItPz2fcYEaR5iqs8o8HdjB4L36nkPjVf8ztVmxCbhKGu+zD4XOhcozZpULKFzrrv1zwGUpXOvkr7vfx4wfRfJ2DzDSwkLxy9trnAtwHiLWRBvQwOvBw5yldIwpgHpSHpHAoWcLi4xzta33nbIhRcspNP2w9UByIzeYhcwYzdZ5atN6EjRm6A1xu7LYjT2EUMA6IjT/6ZqY392cNfM0KQ3pfym0of2Z2/C8OnTh473v6vXBvt1+DnQOhyOFfCsVULWdavPiNxw+TtlXr7dao8NdEUiIJQkkLqUnasufiCDZPQyLYJgnZMiDkWf31QS1e0Hv0S34l0EG5TRr5cfTfKqbjpJ46idhhBOJ8sNEBW5B6IusQQWMYWcfzWR7tE5m0fhq6Ng+WyzuRCNc0mJnLS2P+IyvtwKU60BhYn4mRSC60sjoZaoN7AWIWiXCHoSrGLmeKKeNDz/wt8D6uBmI3kvZCJZzYzyoBzMZ7mBhqb6RX2FeSNjXfmQOe7FoJL8glV+BL7otGtLAow5oJebY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(261026121527099003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?cjRaZURDdHNuZnFtazZKTGJlWVQrMHdaTlV0VEh0RkhUWXoyZHpkQW5BY2J5bGt5?=
 =?big5?B?eU8xV1k5dTFKOFp6N2Y4cnhmNVVJc2NxTHV6NW9nSmtWTXdnMU84N0NCVHFVclM4?=
 =?big5?B?K2lyNTZKYkROa0lqQU1YWW9Yb0d6blJ2TDYrRVJ4ZHV5N0dKQUwzd0t3SUtZbzFH?=
 =?big5?B?cEVoT084VklVcWVJK3Z1ZXhqcnFjU0lGWktPMmJFUWZDZ2swV0FPRmxJL3I2UDFq?=
 =?big5?B?Y1pkd2dWOXh1elRrOVRoUmQ3YWlOUFgvZU5rR3FtSmxOaU5aVExOSzZ0N01HZUly?=
 =?big5?B?SFdQTHkwMFAvYkNsQTRPQXhVVVNPQ2JRd3FWc1M4R2lXQkRTY2ducXBLRG9VQmVO?=
 =?big5?B?VDBFNXJJQjZQNTlzL0ZHZGYrcE5YRFNxZXVQTWtFNGxKbVI5OEJrTUlYblB5SnJF?=
 =?big5?B?VzV2eENHeStXYmV6YlhiT21mbVdDZ1doUnAzMmM4NnN6TTZ5Q0hXL1ZBU3g0SUVF?=
 =?big5?B?UjNTbEVoS2xiNTVIcmdXQmFkeEVVYkZwdUpMMFZVWDhKVnE0MXlPUXBnNnI0N1Uy?=
 =?big5?B?T1VveGRkUDYwT1A3REo2RDlOTkNrc3VKdUQ0NlhuRm1iUXczTmFFeXJUdytVVFB0?=
 =?big5?B?WU9wZThjRmJpb2R1bWR2QVdRcXRwdUpEaFM0OWZEQVBFNzlZZFN5ZjR4QTZiWEpJ?=
 =?big5?B?RExFM0piVFplRHMxMHFLQ3FBLzVmWjdMUXAvaUJ1blRWNUVqTW5Sb3hQRVNQa1Jw?=
 =?big5?B?Qm9VVzErWXd5aFV6OFF6QUFXSXN0aE85TVpMb0g3cHlSUnpvb3NBMWkreDFqTGxy?=
 =?big5?B?Y0J1L3FOcExxOUVqUjRKSjlHZHFLdExJdUowUDRIWFB0U1oxdkdteURQTUV5VXpu?=
 =?big5?B?ZTJGVC9mMUZTYW8xUGZ3ZHdwOTJRV3c3LzlIMm1zTGlaRTQzaTRJelVVSFUzTEdR?=
 =?big5?B?WEFwdUhFSWJocVYxOForTGVoWXRGVmNoejV0UHA5Q2lkVjZBNm1qK1MxQk5ZSVBW?=
 =?big5?B?S1JCbHAyWldnQnBSeXRjbWVZRTBMMjZudU03bjVsNFM0NWg1dDdvNFBmMW9EcGVG?=
 =?big5?B?WmlmZTZZb1lGSng4NGlvbUVlZWZDR1JWTk9MTXJ3WWc2amIxRjFGVHdmM3hINnpI?=
 =?big5?B?QkhMejNPdUxDV2tqdWUxTXZvRTdheUgydjJUektCMmRWNGgvVTgzaWN5dTFOaUJj?=
 =?big5?B?RzUzNmt0NzJUdVlmZVVlcXBDZlN0WVBkcVgyZDNZTUNxOE9zSlp4K3FQTmszc2RC?=
 =?big5?B?ZEg5aTVqb0N6ZFpUWVpXVWR3anV2UVozRC9PYXZxNktVL1BCVGpuUzlhKzN5cnBl?=
 =?big5?B?SkVoVUpQRzNBRHdHUjNXZHdEY2xHbkNOQ0lndFZ4ZkZGT0tIcHc4MWNOUVNVellq?=
 =?big5?B?bng4WmlEY1JkRHUzbEZvMDBiRGJzWGg4Q2ZvOGxIeWZWN3V5dHFIaE1wamY1aEhj?=
 =?big5?B?bVdiVzRCeXpNQVVsL281R2xvRzVHcy8wcGN2VTVoVm1PbTQ2RGhYZHorSVg0YXVH?=
 =?big5?B?SWpyU0NUSnhVUU94NXN3bkZBVHBUU1oyd01QWWE4RFlvc3lBWDB3QjRYdE9xN3NN?=
 =?big5?B?NEdLUGNvZFdXSndLRG8xaTFRUWJuQ0kvaGcrR0lVQy9YbTRMcGpoUXRuNE1wdm1I?=
 =?big5?B?N1hucXF1VlVUcG5KNmRwZlNOa2J3cGI0d3dvTlVncGpjTjRtc0VOUXFUbU90bFVi?=
 =?big5?B?ZllPTWVRc0d4bHJYT0dKZng0bHVzQWVpNlQzRmdEa040NkcramdBUHZaYVVEbjYx?=
 =?big5?B?bDRoSUdXUXIzc040TDY2eHBvOUUySmd6U2g5MzM4Q0dRaU1LNDFXOXVlamY5cXcy?=
 =?big5?B?eHFQWmUyT2hGbUtwL0NhVHJNVWJPQTRJNGZBSFlXU1N6Y21KOHNGRFdVQnBsekMw?=
 =?big5?B?eUdMRlZWRVpBZlg2WlQ1dEVZbVZURzNhaWtiOExYcDVYQys3V0xiTjJkcGZ5MGJV?=
 =?big5?B?WWk3QTQzK2tZUTRCcFd6ZEhkVlB1LzlLZGlEQzdJSnNJeU8vcENYUGN3bkx1bVVD?=
 =?big5?B?ZTVBV3JBU3ZkNlgvWmpaUU54ajB6RnU2ZnBSbHViL1NJYk4wczdLSitoT3FXOFZz?=
 =?big5?B?U1NrQlUzTXdGTWplbFhiTjUxNVJScEhKditxd2N3ZDFoYVBzSnFmdUdlVXg1aXEw?=
 =?big5?B?NWhGWm9ZYjVCSWh5cnQ2Z0U3THpIcEx5Uk42VjFEUUJ3Z3BSS1VDaklNZk9MMjcx?=
 =?big5?B?QTQzeFdTZVVoelY2OUpWb3dnY09YMHMxTjNwUGZZc1I3VHlVTmRDWWxwQ2RoTWFY?=
 =?big5?Q?1/hpf8S+2ObmoADQWnHm5j7AQaG/f8HGRlISY5gOn2k=3D?=
Content-Type: text/plain; charset="big5"
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
X-Exchange-RoutingPolicyChecked: KqxS8BYaK3Kwi8/y/XL8xtPReis/odSSH0W/mmaFU5xLDo0SGQJ/uLu+nrLlQD+IAWYNqabPeGRm/0bNCsu5d+MpYuguVVT0d2IzwUCmOxPEn7FBV2e/NGzLOihBsJNXarZtRl93Xyhr3WDvB3h+L5MV9vF85oalZ2BLjfJky03vrI298m56lGSsGdoFEsqwyXHfpyTsNNFo6lCyjbSHcYRTWOy5i9liDUmAQOBD+LcnZ6KCmqV8dkQ+U95x9qRqn1CW1eC+rIvR9NdrYHyc4zsQIxALoXsQIs4Y7iDiMXnYjFfx5ks6ORsNcv3JXpI7DnnQX4QZ45ia7tiFHIz++w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5213.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fea6c9-f4cc-4ab1-3ed4-08df4ba3a93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:57:20.0553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVchBC4D4Yx1lQfcVE2Yt8YDxJHDOnBBVQ+tR8F0bwWdJLuLNbmnOhCgVRtUCS9ehTKmEENmf2wvaa38jGQvbNT49OoB0TgX68v5tc4mHk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7539

SGkgQWxla3NlaSwKCk9uIE1vbiwgT2N0IDE5LCAyMDI2IGF0IDA0OjMzOjA0QU0gKzAzMDAsIEFs
ZWtzZWkgU3Zpcmlka2luIHdyb3RlOgo+IEx1Y2llbiwgQWxiZXJ0LCBkb2VzIEFpcm9oYSBndWFy
YW50ZWUgYW55IGZpZWxkIGluIEV0aE1EMzIuZG0uYmluIG9yCj4gRXRoTUQzMi5EU1AuYmluIGFz
IHRoZSBmaXJtd2FyZSB2ZXJzaW9uLCBhdCBhIGZpeGVkIHBsYWNlIHRoYXQgd2lsbCBub3QKPiBt
b3ZlIGluIGxhdGVyIHJlbGVhc2VzPyBXaXRob3V0IHN1Y2ggYSBndWFyYW50ZWUgSSB3b3VsZCBy
YXRoZXIgbm90Cj4gY29tcGFyZSB2ZXJzaW9ucyBpbiB0aGUgZHJpdmVyLgoKTm8sIEFpcm9oYSBj
YW5ub3QgZ3VhcmFudGVlIGFueSBmaWVsZCBpbiBFdGhNRDMyLmRtLmJpbiBvciBFdGhNRDMyLkRT
UC5iaW4KYXMgdGhlIGZpcm13YXJlIHZlcnNpb24gYXQgYSBmaXhlZCBvZmZzZXQgb3IgbG9jYXRp
b24gdGhhdCB3aWxsIHJlbWFpbgp1bmNoYW5nZWQgYWNyb3NzIGZ1dHVyZSByZWxlYXNlcy4KCldo
aWxlIHJlYWRpbmcgMHgzYjNjIGN1cnJlbnRseSByZXR1cm5zIHRoZSBmaXJtd2FyZSB2ZXJzaW9u
LCB0aGVyZSBpcyBubwpmaXhlZCBvZmZzZXQgd2l0aGluIHRoZSBmaXJtd2FyZSBiaW5hcnkgaXRz
ZWxmIHRoYXQgY2FuIGJlIHVzZWQgdG8gcmVsaWFibHkKbG9jYXRlIHRoaXMgaW5mby4gVGhlcmVm
b3JlLCB3ZSByZWNvbW1lbmQgbm90IHJlbHlpbmcgb24gdGhpcyByZWdpc3RlciAKdmFsdWUgZm9y
IHZlcnNpb24gZGV0ZWN0aW9uIGluIHRoZSB1cHN0cmVhbSBkcml2ZXIuCgpCZXN0IHJlZ2FyZHMs
CkFsYmVydC1BbCBMZWU=
