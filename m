Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=50.16.246.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794735948;
	b=5FN8TnyrDG8b8TMWZK4GHBWFDsgpD8sW/dOO1xbTnxfBH53nen0pUP1IQvF7q04HuTHK
	 YV7YucVP56/J5m7znkC9hvf5IvraCExepxGfE6oTousC5rWxBYnv+naxO1cqlb7RLow+3
	 B7CoyW41v9G+O6dYIZE7FbRueRFKbyxWbecXxKGFiMPCYo5nndBsa9oGxdAuYkw2X5Vdv
	 LnB2v/9W/CwRCjx0hG9ZD6h2ZTGZRV6gSlAAJ/nkyapxWqkkhs6gE+FQh/cQ9tbeETAlP
	 pvsjH+G4/9vtKoJPPU0JMFRDOrbGx8cpOaMzobusFhyK4F2RZGHNfx2H8zzw7nAiFzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735948;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Subject:Thread-Topic:Received:Received:
	 X-Farcaster-Flow-ID:Received:Received:Received:Received:From:To:CC:
	 Thread-Index:Date:Deferred-Delivery:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=ZuheCz02aKL/7mbMf07GcqPL0kipOYxR1eLr5THYMqQ=;
	b=wla7hL7kv8aZgcQCYZsedaC6BxDdayB6an105dd83GOw9Xwu34ThMxl2QOygv4sIV4F0
	 wlnWr3dONzhcVaXvDyYrqaMMCWcoOcyZQ1U5HMqyWoOi8fbjULbcFu5AbjIut5E5zSU7D
	 WazC+hGCQjjXF7nzkVz4pjZIW3Q8zIa9RhuMyhhpqiMPYQ03oK08PNvEjXAnRZaBHuI2/
	 RWIqukPb9cQYX7iiSfPs7MXcWzppdRcTn5lw6/nD2AqhD+knBqeLMIfNmAG3HkffANpYd
	 apgSDyz+w532FqmR1ASF/NTPSmay+xRd8nxlGjY1bogMzmTr2CF/D+ZkRR6kUQHj8yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=osyA7OEC;
	arc=fail smtp.remote-ip=50.16.246.183
Received: from iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com [50.16.246.183])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64577606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64577606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=osyA7OEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794735947; x=1826271947;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=ZuheCz02aKL/7mbMf07GcqPL0kipOYxR1eLr5THYMqQ=;
  b=osyA7OECd0NG8XFbwenGu3MYGAhm1BSpkTJ3k2mFdU3Ghs7q14MThmbF
   sMfRXstQ9oCSO+3GZMeMdE+3geIcnHqcn8qj6ed2mkRhNT7Z2lTMWPgCF
   KflIU0YhLTjzQ7nWGjHw/97+j5xpEauoTbRj+cSITHBQXZXoeYfUXFphJ
   j6kNTmcBb9FZqBvK0zP/A7/CiFQi3McOywXCwxgJ0QBYt8syCHHWNgiX+
   UYB3nygxtN+l0p1FdVXsRSXBNA2aLO77RRjJLnE7zazvKHKya2uyRu1Ln
   2fhkQkP+rAftg9ebf+rIFjQ6an6tbZEOZBZoQZtTmazwAzGCwLwmZSWOx
   Q==;
X-CSE-ConnectionGUID: PuuHHHuGSfay/Kr6Wrwuzg==
X-CSE-MsgGUID: 17R9njO0Suee1/R3+c1A0g==
X-IronPort-AV: E=Sophos;i="6.27,214,1787011200"; 
   d="scan'208";a="31410830"
Subject: RE: [PATCH net v2] net: ena: set admin device pointer before queue
 allocations
Thread-Topic: [PATCH net v2] net: ena: set admin device pointer before queue allocations
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-014.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:45:43 +0000
Received: from EX19MTAUEC001.ant.amazon.com [52.94.133.134:30771]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.18.132:2525] with esmtp (Farcaster)
 id d50c9c6a-57eb-408e-81c2-9624738bf0e4; Sun, 15 Nov 2026 09:45:43 +0000 (UTC)
X-Farcaster-Flow-ID: d50c9c6a-57eb-408e-81c2-9624738bf0e4
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Sun, 15 Nov 2026 09:45:43 +0000
Received: from DS2PR08CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Sun, 15 Nov 2026 09:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boAvX+UHBZOTgEtwmQVa1GvwqgaSpQjq00NCXJuzF1AN7TEeyBzp7c5yCaBV6MsAvQ7QpQh3k6IZYQh2zIf7M+HAU6f7NO3l8P3sL8gvmARhtoRmS8zn6idW9xfkwgOX9X7v+yPR65MK4bZ5hONoUi4YTABai5blRoP8AANSo50iioZTpuRT1K0PD4kO512G+A2ltBzQfwugSCTEIhTfP3tZ0j8b15yxbDRxQqYnai4hbRhFhNR44THto3IYh/7g/0sPZDukICpfyyV/+miKaEDMhGAhCOJPBf6JV6YnGGJZmyfHAA4UnnPTnOZKyz1//IJuvbi1r/e4ayxBnXPfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuheCz02aKL/7mbMf07GcqPL0kipOYxR1eLr5THYMqQ=;
 b=OdTb0IqXZfvjmdiGKbdgJYjqYgald1SnPOylwdYWyWg4710SQTf4Zq+CuKB7IhC8aY3F/HaUOb+aB3nSKfObY/wJOmUPebbTcliswiCQMmlWOLFFtOT/n8O3dYDONn0jeUyrjNutIqXNltFz65NgyII8cZ4dAfcIZOURoWzpkV6yKWP4n+6MIg/vfmWF6GMAxK3nxNa5baZvlEo/zpVHthLMJ37h5X69ieR0FZWAP/KuC59ihGBJjG2bauvbZB/bTIzgQ/YUcdfPqtUh4SJ4CqHCaAyJ9g4BrSkctvuVGfuFvT8kQ4MYX5sYWNTf/WW1p2wjTASDNhNzsAwEKVM7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BYAPR18MB2600.namprd18.prod.outlook.com (2603:10b6:a03:13a::13)
 by DS6PR18MB554262.namprd18.prod.outlook.com (2603:10b6:8:416::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 09:45:34 +0000
Received: from BYAPR18MB2600.namprd18.prod.outlook.com
 ([fe80::bb21:2c9e:69f:5ebb]) by BYAPR18MB2600.namprd18.prod.outlook.com
 ([fe80::bb21:2c9e:69f:5ebb%5]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 09:45:34 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Avi Weiss <thnkslprpt@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "Arinzon, David" <darinzon@amazon.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "Atrash, Wajeeh"
	<atrwajee@amazon.com>, "Brandes, Shai" <shaibran@amazon.com>
Thread-Index: AQHddAVZhq7YQ6P3aUKFH0Fn2k/Hk7cu450Q
Date: Sun, 15 Nov 2026 09:45:29 +0000
Deferred-Delivery: Sun, 15 Nov 2026 09:45:12 +0000
Message-ID: <BYAPR18MB2600A2AB66E4BF84E545E1BED97D2@BYAPR18MB2600.namprd18.prod.outlook.com>
References: <20261114065618.488248-2-thnkslprpt@gmail.com>
In-Reply-To: <20261114065618.488248-2-thnkslprpt@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR18MB2600:EE_|DS6PR18MB554262:EE_
x-ms-office365-filtering-correlation-id: d9e1f879-41b7-418d-933a-08df42fd31cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022113327099003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: 6C9cggp+GTQMOXjk8smCYGG2xGah4yNLVD3oCwcKbnphcj4WYrA3I82+GCNSYIQcm8L2aNiu8l6q0E7mi/bvf56u/75QajbWGUK5O8e9oYEaOrKG/hz6Nn9jiG+/3FdqGlLBM+PnNpY/AgfK2P+gnVCLzzNrD0zTnFP5jhDgWuV9xX9O2w+UM+byGUO/SAGL3cpiTOkhCQau1Hw5kOGFRggdSd5jdizGdN5Y/FlE3DsXzWxX8boTVyYafkCYDKR04OTOFyf9z0cc/V3fKlvd4aMUGnLeR8j+ysT3ifqEOuxJC8Zbx4E68SR2YpJ+pcN1Cyju/pLare3IE4EWV/Yk4j22vnA4xymoIl9veqADPQlZSfY9SLR9L5bTRBBXBXCjfknO2nOsDm//lEN+adJ1Rh1VMRIC9pSwFhPF05Q/Ax4+12Ri4Tu5DNn+YdyiU1C8aEWB5rVFrwvsLDC+UrASHoeSsH6976bXW3st4U0bDjts9ypO1NP+/Ty+cNWRfh0PJSBAqz7P/ktLCngIc2w9PjhcNnJwhK88GVJckYTWNbCkc1fASk7GP4EIr44FJ505WAFzjeCe1ROto0LL5C7xm6WqOkCCFLryUc/0hp5BNu6cT0CMjbcNNUCceeHCgnWeO7wCLa7QU/BPQ/BHaM6RoAKkHaMCbXR/MHsbASKSl1b+tcNHoh6/SuSEBmCuwPvJTlmWDkRjGLXxqZ61jn4zt//ge7V6covzISlIDA1g91o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2600.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PGEjBfIU7ZibBeT4dpBpaTX+wIx3cNvtZciCddpiYMjrIJzrhtSZWMn6Drup?=
 =?us-ascii?Q?yIAdlTncO+PeLXdnOg6lpru7sbxlER9doc2D70K+ffBi1VmWCOaO6qL0td/4?=
 =?us-ascii?Q?fiZVyjOdGDpWKV/Z9i7vOJsZvEw3DHZVPGWwnoDqTfoFj9J8lyPpgRouMUid?=
 =?us-ascii?Q?EBZxTjQAGkW4FI9kUJ+m4qnVOgrldL1ajR54tt53cAi6tpvV/Qa+3HLDGYD/?=
 =?us-ascii?Q?TZjREikyUjr60QNEvs/Oj2odJlc5H1vxgXt034T+0BuDWdFGuM/fUKkM7fvc?=
 =?us-ascii?Q?6jfU5M5R+lKWf3QGHd6g05uY7qzdVaYmXYBgN61AQQnXKOWcsTw1qE2STAs9?=
 =?us-ascii?Q?EpITbe7GHNh+sC2jHuADy2bc5p5EtWSR/0VliC2LALjmVmMdxBhReUwnnzlF?=
 =?us-ascii?Q?zVNJfw7HlJEAhvgRVeXYGGMpeDQVJ/ELhg3hZK4Llh2v2r/jhevr9CAIjDck?=
 =?us-ascii?Q?d6q+elrIrF3YLgLDzvZ+n5UVRhhVM4bK5EX0WaxxlXjt5yx5Msa3lKAGpWV8?=
 =?us-ascii?Q?dPhNl5ExizDB67YzAPxtBRz0HCYTp5LWezisERu52CL5rA28OhHI6MXTCxy6?=
 =?us-ascii?Q?jXOwB/6+LjOAdnXlbgWQVz3Dr6ut0GZAUWMEkbW4jSwJQfpS5AY4bhxVhLqN?=
 =?us-ascii?Q?4Vwu8+7DgSDAzzHa0iVtVizGegPI+8i5SVIHwu2w7Rv9KMTdzqd2PDaHvvSn?=
 =?us-ascii?Q?hCh0+t0oU3ZKKRM9pLGCbpOPrMlqIHAeHbY9rQpYIM9/ErljQqIMn9Ti9mFr?=
 =?us-ascii?Q?gJqtDgaoUGEPT9oXKrGZJe2CFfYugTuU5xAEiuOtuyG9GQGqi5wWgiVc/OHz?=
 =?us-ascii?Q?cZEN5KeKujH5VMHTfz5z1/Mw8kRv2tgSYgYrGI9V+UogKuizxIFbMZwGys9l?=
 =?us-ascii?Q?wxX+dqqOeqf+ghR2fLqS/2lADqVnunh3rueWhmuDMDwiiTwM4JckkzIPOqWl?=
 =?us-ascii?Q?XdSZSMMmYzZZnhlCXZWhMmdu7WgIJPPns2PtX1mcuJ2V6DpWcgLTrO2B5rMa?=
 =?us-ascii?Q?vta25e8UqIPQXhXQunsEqJ0gltF9aH75DpyqVsill+IW/CmCOjf4cuS9krRH?=
 =?us-ascii?Q?QmBkIZbU9fuzirySLIb1lbcG5HyCSLhq27/Cd4NsAZdURRZKFaAMmrt6d1a6?=
 =?us-ascii?Q?3ChhICFdByurGbDpMekLbWaeBXgxtnIzXb9XZCzAfDQoDqUVMiffeRIbq3rY?=
 =?us-ascii?Q?SrTy3cEbVfHc6mfIo2mjZDrFYTp0GWUXtXVN9Hm41Zjfz3yuBhb6eUdXJg0y?=
 =?us-ascii?Q?y6jo+OiqYSlPIymiXQvb168Zr2X6KnlWHPwvpcqwUCDRlHblHPlmaLbw1OgL?=
 =?us-ascii?Q?a7GpdlLB6v69iftpuIW37P4IJcy/yUedC/RTTdgBBnd7NhOqFDSm9b11U7ND?=
 =?us-ascii?Q?Cu+EjuzMrB/5d5JuFcyBhUca/wmAE8iHneFl7A9oBFaFGckHZvtm10JinRsZ?=
 =?us-ascii?Q?/Ey2EqbXI8sZPxrOuGvKUUncg5LMicJB7e2GHvqjTsTiRlCh/cH19PjAISoP?=
 =?us-ascii?Q?rLB7hPd4CQaZg8x7J8hKf0cGBONXW+MLeI6nBh+V/7RkyoIYspiIsPmsANib?=
 =?us-ascii?Q?X7jDbkFpP/zuJ3ckISC0YUl48LQmxks8UMVyEo53VqzD9AnVDELoR2FGAHfw?=
 =?us-ascii?Q?7Qv9Sot7IZPWWGmcRw/IDn4Gt3LC9vgHITpIFOMW4nH7IIDhUyE2nf7Qrvrw?=
 =?us-ascii?Q?lahiqAJPwQ/mQV4Rfr6c//zIxViTcQRAyI9jdDehONZ8dhJ7tw+m5hNcj3OV?=
 =?us-ascii?Q?X0JsO8p4Hh0jfBULfgTR1FYD0pOraoGio9b024CZy/b8cZuhx1iBQA8Iv6Fz?=
x-ms-exchange-antispam-messagedata-1: SMe9QoKf49cD5w==
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
X-Exchange-RoutingPolicyChecked: mFLBbkCzxlHBF3tF3IAg5Cxb8IkHC4q6mYKPD5n0flk+4nydn04GNikHu9lkWxEN50hHjv/mq0QjZ9wmvMKF963vq5MR2EQ19BwIjcVtcG0OhnCIryqj4xj/fgmd8TiDKA5iE0xEHFqJUovM8zQgDcUhtQ7+NpNKR6a8D5zxZpzZoJTvg7riZqAGVoQO1Q50GWCYTvMKCAocapUFi/92ylMGntKBZtyFZ92fREI9pnQ70jy3uKEmFi+2R6wZlqYTzb0rA5uMQb0FMinjqZDxoPxJQCKrNEnfl6afqX5TH8QsjhGqaQJ5+Gew0hsg4L6rCFZfMwnkmZ5b5zZlUmwwpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2600.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e1f879-41b7-418d-933a-08df42fd31cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 09:45:33.9434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: enzakVkwGwU42iTkbSK6Lu1b0tw0hCZxqT8oNSAa48WrjGmPjRBkmqwENwnpdoezrZ/wzaiolzDuC7QlsX6KcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR18MB554262
X-OriginatorOrg: amazon.com



> -----Original Message-----
> From: Avi Weiss <thnkslprpt@gmail.com>
> Sent: Friday, November 13, 2026 10:56 PM
> To: netdev@vger.kernel.org
> Cc: Kiyanovski, Arthur <akiyano@amazon.com>; Arinzon, David
> <darinzon@amazon.com>; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@kernel.org; kuba@kernel.org; pabeni@redhat.com; Atrash,
> Wajeeh <atrwajee@amazon.com>; Avi Weiss <thnkslprpt@gmail.com>
> Subject: [EXTERNAL] [PATCH net v2] net: ena: set admin device pointer bef=
ore
> queue allocations
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick
> links or open attachments unless you can confirm the sender and know the
> content is safe.
>=20
>=20
>=20
> From: Wajeeh Atrash <atrwajee@amazon.com>
>=20
> On the first probe, ena_com_admin_init() allocates the completion
> contexts and admin SQ/CQ buffers before setting admin_queue->ena_dev.
> Their allocation failure paths log through this pointer, which is
> still NULL. A failed allocation therefore dereferences NULL instead
> of returning -ENOMEM.
>=20
> Set admin_queue->ena_dev before the first allocation so the helpers
> can log errors and return -ENOMEM normally.
>=20
> This issue has already been fixed in Amazon's standalone ENA driver
> (commit 7d1dc4341d4f).
>=20
> Fixes: da580ca8de2c ("net: ena: add device distinct log prefix to files")
> Signed-off-by: Wajeeh Atrash <atrwajee@amazon.com>
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> v2:
>   - target net instead of net-next
>   - credit Wajeeh Atrash as the author and add his Signed-off-by
>   - place the ena_dev assignment directly above q_dmadev
>=20
>  drivers/net/ethernet/amazon/ena/ena_com.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c
> b/drivers/net/ethernet/amazon/ena/ena_com.c
> index 297fb36ab8c16..9b14cddf4432e 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_com.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_com.c
> @@ -1992,6 +1992,7 @@ int ena_com_admin_init(struct ena_com_dev
> *ena_dev,
>=20
>         admin_queue->q_depth =3D ENA_ADMIN_QUEUE_DEPTH;
>=20
> +       admin_queue->ena_dev =3D ena_dev;
>         admin_queue->q_dmadev =3D ena_dev->dmadev;
>         admin_queue->polling =3D false;
>         admin_queue->curr_cmd_id =3D 0;
> @@ -2045,7 +2046,6 @@ int ena_com_admin_init(struct ena_com_dev
> *ena_dev,
>         if (ret)
>                 goto error;
>=20
> -       admin_queue->ena_dev =3D ena_dev;
>         admin_queue->running_state =3D true;
>=20
>         return 0;
>=20
> base-commit: 070411c1590c8172eb4d86f045d99c372f22fe23
> --
> 2.43.0

Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>

