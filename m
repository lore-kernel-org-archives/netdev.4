Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681713;
	b=xRz1xcBnn0exNHm8M1TxUyqhtj1Uel62uEDFXg02Gm18i+4a0JQUN+bJjNpBlRJAiNEV
	 Sl7bdg70utoqrBvKATtQOFZvxLcf1OG8g9OPSfHZbREHuXf+UaaGnOYksXkhmGc8gyC/N
	 AXbArPDz12GvW+Dvdr9OcYeMq5zLKYvnCvg/vO9LGqbhMHNne8/1D2SzrneVdv2f5YgzS
	 gZ7cghO9HihOGvdoq4aIOuUqVT4UQdMAaRermkcrj2sWH8d1EXuzNIRJ3HB7FnzSlnUxI
	 Evrlawfp6oi3O0ymnY0XSAzPccgG/c8fkPSubpeVgB2CvTDZh2YFD7NNN/K9/LZgeqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681713;
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
	bh=jS/JuADLOcNhHmMnhCGD7OC7WQM06VwCkHT9DqROUs4=;
	b=gfF1a3+SNs2zd9UVmCewH/CgZVaptRGOA8n2NPCpJLOwnWPmd5Sii1CEW2cI+Y6fIU5W
	 OD7xB5n5RdbBAMW/iMD7jneEwXhHg6PlylrLNoMXUuxzgEpDMB6AODYSRSUnBEJaBGEew
	 LH3jxd2uUk2H45In001hwi3ZOki/QRM7vz+5AWGJQCPzMOU2d7IM7qEJrfk3wEIVWYczg
	 9xRdAjllU6dRUTekSlHJZHVacfbVsEI5rztfSA7Grk8muNlPDsN+J41dz3GMrvCHEvqCZ
	 vPOCG+YL1UtYYpQSDRc8j9IWfhUC8SFD62YtdtnzxjeVIfxSbG4YPonTo4srZGwmQ2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=gYG9KtpL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.2
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B46606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B46606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=gYG9KtpL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsTAn+po221hQQKmb+gRh2kDw+f1AsR6iExhnuDVY5r+rHI+YcKREy9usefCOwnxaDTFcDpoum1x6ZFncQ/mKgR/IIl970kW/aCWKnU5H4oBWES+uKHNAnm+72jBCzzKsxE2jUB3MV7VQXJxar/6ayd7I3TFTX9/fBsbBHYk6Y1N42Ok+1t2xnlc0I0oYrOUmh7lhmLlBEkIQ5InH0M/J5NpqhgANwcyCA5EACXPEL5dflCj1p0JAAP5vaTYtMXiXD+KsUZHm0evcPi6EA8LrkG6O5bXumwDs3Z1vsOLWWF7uOhveLH7Q3+aNe/T+VccrZe9eDe4l7a8XXIpkk5Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS/JuADLOcNhHmMnhCGD7OC7WQM06VwCkHT9DqROUs4=;
 b=snhLp5Tbh+2gk0T+qAbzR4TDgH7IsorT4+QC7Kt2gGD4JmCgt4TkMRj3heDhGs/lb/5Dy8W1znfPYtedkJHnAKq5WhAlB+G2B5tISTILfX4Tqr6qkcOTO0FdKr5E166F0ZZhfhKhyaa7FpgLMHW7+kSivxFFQ8vFQNC+WWm5mXuWff5ZlKOJ70QeS4pD5ijNfgY0uFQqjTrsxS4hSRzE1YvYOSuUxdwqArSptNdhLidUP9QRv+RDE+U6UwIiKNmBRsDuMrax4ibMDLNXDqKrk0EPJKfDb4miC6tKqZsKMw3vGFjTbKjyNqxSV4Pr1eFaLN0f7oiJeIT/ryQJafD3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS/JuADLOcNhHmMnhCGD7OC7WQM06VwCkHT9DqROUs4=;
 b=gYG9KtpLFBCMgv1OJ93iUjhh4xOgIhMlJgFER/MCRmavIwbcMhF8efHyCZ1qVASYzbh2QCJLu616WU+FeUxlptwwk0xKChlRfIRHYOCdTyb0sSEtviQafTcNksk948CzqVi6r74kopPU7n/hG+Q08wsweeNFCXdYcYdYDm1E1Lw6oMUKhigpSMsHJStabqSFojZGWodVaFhI5LgFUNIGdMI3j81fXw7UgagwYD9m7LHr8CiUEylPuwxxtRA3nFj0FIOnIOvkh4ZPZrkzCVRcbgIYNAj9O/566/WkHdxwqzewqrF66V25W0brHmheybVnYS5/RgVRytJFvD4YG9UmHw==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by DB9P189MB1881.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:28:24 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:28:23 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman
	<horms@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, Jon Maloy <jmaloy@redhat.com>
Subject: RE: [PATCH net] tipc: check the monitor record length before reading
 it
Thread-Topic: [PATCH net] tipc: check the monitor record length before reading
 it
Thread-Index: AQHdfIFgs4c/vHtY4E6lGysE0KxoabdABZsw
Date: Thu, 26 Nov 2026 08:28:23 +0000
Message-ID:
 <AM7P189MB1137978E8755F74436DEDD01C6422@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <179553307368.1670514.4694378910047786259@gmail.com>
In-Reply-To: <179553307368.1670514.4694378910047786259@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|DB9P189MB1881:EE_
x-ms-office365-filtering-correlation-id: 64e7fdd1-e19a-45c1-652d-08df4b973c25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|261102123227099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 hC27+xMHHDCxSsyXB+5rR2adXUW/sptPBmZLp429wJdrzZi4xo0U3R8uFUxyUEPA/whz761MCzwXweuAx1lPX+XV7DaCLfQkC/i1XpwGd3qJk7pTXGT9Dg7gu4RnmuK75lUv2WIJdZrr+iXApuo76sPsKPycpouAIyKclfBg7KXGT2oK+R4zCAN1bq/2tRIYR2mh0zX8HvgW0t8Mv0eXQ6kIzhYZzXwhP7rEbe9sgAuAYOBDcufc0QBef8GNn89DL/b3XKBBNGuWw3M+zdu0udonh9jbv1Wuzaerxh9Tz9IYe8Jl0n5Fg7sAKqVFFCLTIwH8oNLWEwIG4IR9CKe5JTJO8fmyCOSgROJ2bLcer18SSX6pZ+pbC4c36h0p+H3Njtqi/zxP98/pVdISjJjSZNhnkP0Bpz2Q4RNuU3d8aDvpIT3UvW6wfffCZENidTvs1FOx7CeHQUdRUVTs8ZDBWpJ9yn9n//T2nkD3Ne3z9P0G5Pq/chuljfWZhsp30BkXtca298ZIRODwnow97w9Sk080QZ9w3X/FHzKlxQ6pncN1RcEKw/WNekB5blq+uhMzoKHv4V/pXp5LmzvvstVMe0IdF/7qpIm2e1MkHsYpMsKH/YK/Ensdbqp87KaJPOTLxxHSu2GFadtJATnw4EnzIDozlxamEAi4nceHDHiHn1gYQKSFXLBUSXRLMdfaWwnUJFfVB/z4fF9IHXFbPB+sVqaqjxkIjVPS8G38xszSIvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(261102123227099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fEJiZ1uPZiykmst01AiqShPqw9gA5DjS6C6fDYBrk1PG+VI5gNOKI1abYp0B?=
 =?us-ascii?Q?U/2ZYMnFak7OCfP4IkNrEdt4qz9uogZPCqx+lk49fBa7lURbxzwj62gJ6U7+?=
 =?us-ascii?Q?EcpvE1vcuNoGnOUGGOWnQZaGcC0TrXqpbnnM1PEYAFwza53MY/FQXi7jetrR?=
 =?us-ascii?Q?OFbmUWujpyA3B3tmmv/kJX8iJaq/35RjIwh/8JhM9N3Juq8KDfrfrD4ywQp7?=
 =?us-ascii?Q?UEvrS2L+Skh8syhOq84Gedah6zBQ3KUa7Mkb6Fs0RC5uaxxc3EOf21WZP8cn?=
 =?us-ascii?Q?eKBq0VQe9RR5u8cfqMjYlk1WomFnp9yo38q4eXag9LXG2act3MKa+f9cbMOV?=
 =?us-ascii?Q?yoK9USGdrRlwLCsf0ZXMaYwx7UXuvJhydSVIYc+TA/TJJ4LjV4DdRlzJTtiP?=
 =?us-ascii?Q?pMgWWA+3G+44Z12TI2BQ7kX8aAh+CLqBU5Vg9/MCipdXxIE/yn1LIVsvEUp4?=
 =?us-ascii?Q?jhdqpMZRZGP6DDdEDsM1sIcT6ZUPNbKZqw+6BYR7nheQVDTGDJfTfvduLTDN?=
 =?us-ascii?Q?Lxik6yl1wMRuXb0mBUDpQsbZeXx/cI7lihrzk0Rodvjf/U+gwfgw7v/4Hxar?=
 =?us-ascii?Q?D3a7B7t1/5ZDwQjf+UY6VKxTIoFfiR26SmDfK4QgD18NFpuAKZ8x5LVZhVLm?=
 =?us-ascii?Q?8pkTbU6gZ0hzb+mpoFAj12hTeN9puuIL4JVrLkRkt1YJHfH3xPY+VjkLHNPo?=
 =?us-ascii?Q?ngt2XGkHW2daphXm/LLiGGDZdd66TBbjFfB3qzEhZ7GT4d69RSdRLVs2gG+v?=
 =?us-ascii?Q?25V4+UMy4kCpK1Q9k0MLC2bEea/Av53PYXYKY85r9+YKRVeKcrbWT3k0u4Ec?=
 =?us-ascii?Q?+jfOlYkfEhXLqJocvtW0bbFEc3pcyhBLUaAWE6a4mHfKk9oz8B0E1azTbu9/?=
 =?us-ascii?Q?yzdu1wQC4a6nmaawkQexzSoKKQNfgpu0NIIoS+7vyXEHDfHTm5r+PZKvxuh3?=
 =?us-ascii?Q?kYsv+oBgUbNkHKkLXk7SgTjjjR83GwOT0KS7QjyBQl0DJ3didvgNSBpWtPDG?=
 =?us-ascii?Q?UBS/s9t5LlSdfIcoXwZ0Ao6XEdA5twkPs66+Y+ZvIR1dD7D/lIZXWp1fbKvL?=
 =?us-ascii?Q?eRkeNHApfHIc6d88LmBteH4rc7D75fIQlXBTDvMZew6mzCz8LSYFsfMU06e3?=
 =?us-ascii?Q?8YFVH6khFYN935P2EMmB2hV4l0YMz6V+q5pLtDtAUksnBBk3mKapTsl1VOmn?=
 =?us-ascii?Q?VqWv5Y3nlj0YbiVgT1QJFXuBJrg5+/MaVJludlfpMpD0zqvxwrPLZfUodthL?=
 =?us-ascii?Q?KODQFX+vNGjbvlqpkh0O2kn9ULlmibcsS2v7N9rucO56A/E74t54UudkWKHM?=
 =?us-ascii?Q?Bkp8oL1Nl8SnjMz09pB+TKc/jN7PbhLmnIPE0k8Y21QKbU39SONonRiv4Xd6?=
 =?us-ascii?Q?6mB7yM3F4KiAje2O1ccVIFe/iJKJnTBLl2v6kk+N8daDT7oV0uLtzU76CYzO?=
 =?us-ascii?Q?uTr9nRLiCndGkpWS3KgJcPa6qk9td3TcGBB7dSuYe4sO9K8Fgx+AQmdRh+ig?=
 =?us-ascii?Q?W1rl4k2colx5rwDmpyWWyu+91402FsS4316ausjuuh0T4o7AQzlWLKFUrWZ+?=
 =?us-ascii?Q?lrd19bfr3c/HZKk8Z6jwOnmZKB9UrU7Y70vWMCCtJhnK3sY+JWATg+oMV0dl?=
 =?us-ascii?Q?hlG24yPhJNMkpyvjbmwn3cZrS3gOwn6Phm32JBPAY8/KXZzZXTK52n6qVkB6?=
 =?us-ascii?Q?JV1IEN2uO+PJYnCDT+2S8X76olqc2XIx9FqW0skt+O8LedpV/+YB9Z1SdfeH?=
 =?us-ascii?Q?N8WqnvZ8ZQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e7fdd1-e19a-45c1-652d-08df4b973c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:28:23.0991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxUf2LdwxBpFs89wGvx36bkWw7Wt7aR+Bdq+F40TOb/2myoD9U/eeh9aQCN90PFj0o7LPZAk2ULhkWUQ2j/cDlxmLeXeFsU6WTGu/T3zKOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1881

>Subject: [PATCH net] tipc: check the monitor record length before reading =
it
>
>tipc_mon_rcv() reads member_cnt, gen, ack_gen and len from the domain
>record before it checks that dlen covers the record header. A node whose
>monitor is not active sends its STATE messages without a record
>(tipc_mon_prep() leaves dlen at 0), which is the normal case in a cluster =
below
>the monitoring threshold, so the receiver reads these fields past the end =
of
>every such message:
>
>  BUG: KMSAN: uninit-value in tipc_mon_rcv (net/tipc/monitor.c:499)
>   tipc_mon_rcv (net/tipc/monitor.c:499)
>   tipc_link_proto_rcv (net/tipc/link.c:2301)
>   tipc_link_rcv (net/tipc/link.c:1773)
>   tipc_rcv (net/tipc/node.c:2174)
>   tipc_udp_recv (net/tipc/udp_media.c:389)
>   udp_queue_rcv_one_skb (net/ipv4/udp.c:2433)
>  Uninit was created at:
>   __alloc_skb (net/core/skbuff.c:716)
>   tipc_msg_create (net/tipc/msg.c:104)
>   tipc_link_build_proto_msg (net/tipc/link.c:1857)
>   tipc_link_proto_rcv (net/tipc/link.c:2311)
>
>Read the fields only after the dlen check.
>
>Fixes: 35c55c9877f8 ("tipc: add neighbor monitoring framework")
>Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
>---
>The issue was found by an LLM-guided test generator that we are developing
>as a research prototype. Any link between two nodes below the monitoring
>threshold shows it, for example, as any user:
>
>unshare -Urn sh -e <<'END'
>unshare -n sleep 30 &
>sleep 1
>ip link add v0 type veth peer name v1 netns $!
>ip addr add 10.0.0.1/24 dev v0
>ip link set v0 up
>nsenter -t $! -n ip addr add 10.0.0.2/24 dev v1 nsenter -t $! -n ip link s=
et v1 up
>tipc bearer enable media udp name b localip 10.0.0.1 remoteip 10.0.0.2
>nsenter -t $! -n tipc bearer enable media udp name b localip 10.0.0.2 remo=
teip
>10.0.0.1 sleep 5 tipc link list END
>
>Without the patch, KMSAN reports the uninit-value above as soon as the lin=
k
>exchanges STATE messages; with it, it does not, and the link comes up as
>before.
>
>The patch was written with LLM assistance; we reviewed and tested it.
>
> net/tipc/monitor.c | 17 +++++++++--------
> 1 file changed, 9 insertions(+), 8 deletions(-)
>
>diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c index
>0164a034b57e..9a8b3e5010c1 100644
>--- a/net/tipc/monitor.c
>+++ b/net/tipc/monitor.c
>@@ -485,21 +485,22 @@ void tipc_mon_rcv(struct net *net, void *data, u16
>dlen, u32 addr,
> 	struct tipc_mon_domain dom_bef;
> 	struct tipc_mon_domain *dom;
> 	struct tipc_peer *peer;
>-	u16 new_member_cnt =3D mon_le16_to_cpu(arrv_dom->member_cnt);
>-	int new_dlen =3D dom_rec_len(arrv_dom, new_member_cnt);
>-	u16 new_gen =3D mon_le16_to_cpu(arrv_dom->gen);
>-	u16 acked_gen =3D mon_le16_to_cpu(arrv_dom->ack_gen);
>-	u16 arrv_dlen =3D mon_le16_to_cpu(arrv_dom->len);
>+	u16 new_member_cnt, new_gen, acked_gen, arrv_dlen;
> 	bool probing =3D state->probing;
>-	int i, applied_bef;
>+	int i, applied_bef, new_dlen;

Please restructure above variable declarations that follows "reverse xmas t=
ree" style.

---
pw-bot: cr
