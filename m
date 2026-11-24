Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795554086;
	b=RAxdKmm9qq6w6I3cqVTDBNj8y/Y1Y/gpXzy5Sp2L7Vw6WEJfM+Mf5gaeOosJpR3uBqV8
	 0U7TjadKQvrPtCu43HYsHnhmF7fD2tamXaBERA9qhoJ8hR8pfxVec0It40esclOhuE1lV
	 9frFeTgm3mqRirqTskkzX0823rjMxdkiAw3IdCPJeGRo24pFWlrs8cQDVNI1zVxoN1L9q
	 tdbq0d15pb+IhgxwDk3hkavuPBSFN7+90IhKoqCiB/n7w14cCLiy0lnaW/wqjP3J56tl6
	 DVjw4Y1MUM7oDqnS+VZ+kAp6YeuZ9uVI/OGI4UBTQMVuzRo3uhDzIDxG4FOmnl5xsXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554086;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0RbYdch9gBRa1uoTnIk+dbtIs1dKzV+lfX9vLoKVxto=;
	b=G6atAdqZs65GgUhp0VYRSNDiHIxzvGpJ/Jb7Ve1NfuDQjhcDm/7Kgyp6KjB0OfJssv/H
	 KkWoG3aXelsjb12KvvtzrsJ96T7c6aq25mMwFLvWabO8Iv+WlvKyJr+NTkI5VVg6GcpWN
	 06b66owolNhiSLXSx2xVzmmJLmgQEsCPpVwydGp8vBWjl87lsIq6RZU58L3P9Jh/M0ite
	 khwDLu1MIIXSu+Vkyb/OSPwhqZcXoqdeSzzvphlG7v9Xnm8RsFfioe53/vHlQtLusaneU
	 X3E/q0zyFA+WVMqX8PhgAl572CQEUlZqj2lbQ+taIIFSgULdFhvm7/Vlp5TeBv2M5ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aPqb9gBW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.57
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71E606A323;
	Tue, 24 Nov 2026 21:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE71E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aPqb9gBW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgs/RdPhx48BN+RuA0fQecT626vJDJlDXxeTkMDk9pp6EYbEdElENSBfDLr+ei0liOjjWFAtWDVSX+9er91SylOcVGaYTDt+Vi8B4GXMAwW6cjxClmraRpJT+HsnT57DIdLEUJ5A/OAB4nbHwgyHYj870gHhE1IMHvKSGoR9IHNeOrAyihBmMRCpJ4gJhC2rYxgSp/ZxyH4uPO95qXEEVR7ta1hHXhwHTT+ED0YvCUy+lxrJYcume502qcljJ+DZRpTKUctKDvaaVt+f+2U6uEbqDhd8gtLjMycXddjIw1pvsNJvik0gm0hhNzi3AHA+mhof9GWzvxq4N/ZKDZCSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RbYdch9gBRa1uoTnIk+dbtIs1dKzV+lfX9vLoKVxto=;
 b=tYMGLRan71ebMWRHXSUK/xE2LIQ1got2/7kgKVl9hb1/ZoSQjQZdCAD97vG7aMmSIrJZt2/ywZvITyQL99GwrOlt6bk5SX5T7KfDQlTYUYl0KW8apVvLMxGcXhYDX7G/lXXxjWaM2LNQzsctziqKsiefCv3Sd92PMEJOsC/mjUcYzkgorlQLlfWfAPGD10Jp+vSXAAuQhcJh9j6bv/qe5x2sw+11Mk8oP3C2I7zgH/M5ZkYlnJ4qBaTb357c7a6Wn3e3L1MRpDqKS/pYjadu4Q0MWZbnVECyN1JtM+kMXmgPwRWU4+0E/E0XWPH5Qn1lgYxIRcre8drUkEPqB9uUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RbYdch9gBRa1uoTnIk+dbtIs1dKzV+lfX9vLoKVxto=;
 b=aPqb9gBWuK3XT4U6z8z8wEezoKGXBXmBgmchK6DPhI3Dpf7VAs2+ox9HFxIiLLWRh7EyaFYGe4rubjNInHUOTpIO/iBywR2eETClEol16Hhkzk4zdvdc3iu3GSpuFdw84qDZcEb70FEDuP7fip9nQ4/5KnPK4pr1UCcw08qkH29XXjR9ePXB/IuNSq99RuUqYIVMnUdIcrNIKY3HtGg7xzElpkfxzVvYCypGI7S+TsVLpcbDT6DycX0N9vF9jrudWY7/VlcRiuOqR63aOwxWYG1zFxHPvF4QQ4hYIIdB4EH7ijRfOtgrm0URNrPXcIQ5wou0meXtviFtyW09vKPS2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9153.eurprd04.prod.outlook.com (2603:10a6:102:22b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Tue, 24 Nov
 2026 21:01:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 21:01:22 +0000
Date: Tue, 24 Nov 2026 16:01:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, meaganlloyd@linux.microsoft.com,
	git@amd.com
Subject: Re: [PATCH v3 3/3] net: mctp i3c: clamp transfer lengths to the
 controller limits
Message-ID: <awX7Gp5y7Jdzvkid@lizhi-Precision-Tower-5810>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
 <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PH7P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0e5914-dd8d-4cab-ca2c-08df4a6e183e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|18002099003|22082099003|56012099006|11063799006|5023799004|4143699003|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261022113327099003|261026140227099003|261026121527099003|10067099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	7DCDoaPvOVkl9IZUdcqDKX2kdHYB40ZAFPx3nZ9WFJDMe/wzVkZNZN6aLWt+wPb+cLLzSz++PHLdW9NPcZQqL6dCWApoVe135yUQTinY386IXhIUrT5SbfRn6yW252bhEzplZXK+obbjY14U9FOx0sznJmHII534gNA7CfkgfB1+7u4JQ25R0jZfVH5ipEfGS78LHykxH2y3S6ubGNcfuZK8EGINR3LYDGy6ZvUHgacifQdG3Ik/J+Rb1/n6okDP5ZnbDG0Z+HkbfUfznK9dx3+0ZvNQcyQtprQgBJAkUJVpY/IuanHxDhYcDIe32Wy+V3bIXZfsHhu8UeKq7Z6v4dnUEdQPwiwffL4PWaX1ytMR/68gv9b6W0dnDW8UpLF6VuHqSDQ6kJnGd+ursdulWEWVyrZD69SlIFMM3aZbtfzrlqRQWjVmvDqtR4PXHobtyFqFiSaSCTIouB4w5v6N26/hkN7omKFAl5TOHfivnb8qQSE3WJQtKdRJukEqdcAMQREhdWC4X4aTtVyfnTa5/dgkm6iKqxvsjf6qftJUrRmnHgAH16xzbEkMS+fHGlndzQ19Dqhxngnuqh2wClhRhFbUH1j8n9eDyW0wvueitnkUA8BYVTD8OIcm3FnAqly4rkkl3A4ce1rL+Qtbl3Ve3LaWhufmMnReoeJ/u0H1Cjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022113327099003)(261026140227099003)(261026121527099003)(10067099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ab4td0B1TPSwrj2Iz4PUv3WrN1hP88J9xFTQQdIOOwixn8QhsnG1UT7NlfF2?=
 =?us-ascii?Q?dftcWTdRF/29P1VTRVBbPsTJDmLOhy1Zr7+DryYVJ64JyHssAffxMOsrN8Cs?=
 =?us-ascii?Q?jKUd9y1I47DQq7Xap4RzEoS3WzyhOy/wUazFhWwfhbMw9HTQfYQRLBaQbEYr?=
 =?us-ascii?Q?WJcOY3FdXNl5jlnLK7fhcRPFGqsmuQV/GF2ZnMvMEb8UYZwBScWTLHgZawyM?=
 =?us-ascii?Q?s1swzMlo64/L3I3L+HsEp7gqGlIsRGkUDXgV9lPFajUuVqdZX4G4pTYCcXVw?=
 =?us-ascii?Q?7vLp17NMb2jCEPbA3sFMoaCPxxdTF7Qy0S3W9MuVlfNkxaxkNUvNOQfPKnj+?=
 =?us-ascii?Q?Qk+F7i3jlg0NR/fsYv2n8kYms8++eY6+Uz4kksZ+6JCOx9Ok74W/C1HVMCX4?=
 =?us-ascii?Q?3cmSVOX8K5jMQc+G93Wt23TH++2TqLP38Hw4NgDO7/YoAy1dYhlExEw7NNKN?=
 =?us-ascii?Q?F3NDa9RmtCcSNLc5koawER/sc8oQkaP0Y6FRU7nIFNJ8dC3WDXVFHwhz3I1O?=
 =?us-ascii?Q?d/RKnUfN5x0SF3WG0qvGrBUbMSTTX8YOGEPxZfndJma2P3mYIfBOKWsbIaeJ?=
 =?us-ascii?Q?sRuqzsWj4305bo9GCd1CFGjP0O1ZOIgv+fTJHCLPxZKez2zmPI1vlGE5LIgt?=
 =?us-ascii?Q?TjIbS9NnIvsJ6xvkC5g5xFDR5BDAekiyOXR04UbYmx/si416QvOPGwwaesX/?=
 =?us-ascii?Q?6oYVW26nVv7dsjWYsSSK2NhndTcXlnOpCcGQZKrxem3CiSIOooFRPDwBVhXo?=
 =?us-ascii?Q?DkHGM8nC9mE+JBcFdy6QT03R7NoCcvR6i91zpSR/YerRtIktgxnKcApMDext?=
 =?us-ascii?Q?bgqDShZu+XZcvzprK6Zz+/S4P9h+qH0P0z6lsTRqw6WmPSkGG1BXZzW8uKLe?=
 =?us-ascii?Q?s3R5ZHquwmghxKkKnX/HZgg3iTBqS0802YfIhrHy2zuyOlETkmMAwyccUtey?=
 =?us-ascii?Q?e+SBXt1prjh4izelts3xWZ0oJzcLGck1MInHppNlgHBceWbfXq2+L+9Q+w5E?=
 =?us-ascii?Q?bx71gyZioquGVJb4zPAFg0qZ3F8OaAtXACJHwcBE8ceKohuGQamNLFayqpsD?=
 =?us-ascii?Q?I7SK+kbc7QKqPAoN12MYarsAAQO7Ao5AUNFx1EBttppbMUCqoBYtnpA83G/S?=
 =?us-ascii?Q?jIsQelxpCvQ1SpafJtN5VgL+JVzJdHrvZ0ie1TIbKJuasF9pqxhBIIhJn05w?=
 =?us-ascii?Q?dty8ihN81KGVB+havXKYgR33DXO+V2IFaS/9BG/8uHYxyhWm0Q7Ft2Z3oDUH?=
 =?us-ascii?Q?IHWK1NB/VkWVZ+gV//aTOat2PhsQeZnJo9DcJcmbBsCjvESkyIRAwYGqssLY?=
 =?us-ascii?Q?jbDdKX7zXUcYSa/mS19UrgWhthHj1lD+LOOrHinRfAsWt/QdfPgzRMSWdQnr?=
 =?us-ascii?Q?dZdk4jHlOko0qRquvAPhy4nDkWRcQ8zssBGXYuIBKSQd2VgYpw4sCol8lkdL?=
 =?us-ascii?Q?kpzunrnn3Fj29p874kuNnbe9TM8oB4p+//kZMO2L0U+2PFHBnkwCbw0RTdmA?=
 =?us-ascii?Q?+dRBjdg2bsEqTJKbyrP4QE75qb/2pY4ip9uFtg60/gewTQ/wg7c3AM1Ixgsg?=
 =?us-ascii?Q?4/iv56z4PQtvwWdJC3iyDzqv2agvhgzggqRvyqenPLC+sjWCzMdmNcxM5RVz?=
 =?us-ascii?Q?0dJviWlbB/zcxg9Zx/zzGevRdN9ifHKiSC0JXPYw8chjHHCKU3A5Xj3cmpCk?=
 =?us-ascii?Q?YyHcd1lHs0PlZN6gl8UxkNvxPXNAzF8Kj1Bl3gsXqcBAbsyFuIxvC5xxJXX6?=
 =?us-ascii?Q?vc8NiHr7NR8I3g+j3+sf6qcs8hs998ABq8twBHZWJrqXvzokLrQW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0e5914-dd8d-4cab-ca2c-08df4a6e183e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:01:22.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv2wasLoLK36zTHf8nzkRhke1km6JonxAT0o8ZPa0igNlY3a3Fv03HTZXsbrywfkjy0GJBDdP9xibOGrftx4XfT7SvEyFdOq+m3iIE4kZsXQVu7eC0CrWPzyfFeAkiyU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9153

On Tue, Nov 24, 2026 at 11:36:51AM +0530, Shubham Patil wrote:
> mctp_i3c_setup() takes the maximum read and write lengths straight from
> GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
> with a smaller limit every read can be built too large and rejected.
> Transmit packets can similarly reach the controller even when they are
> larger than its transmit buffer. The receive path also allocates an skb
> for data the hardware can never deliver.
>
> Use i3c_device_get_max_read_xfer_bytes() and
> i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
> of the endpoint and controller limits.
>
> Behaviour is unchanged when neither reports a limit, as the helpers
> return 0 exactly as the GETMRL and GETMWL fields do today.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - Change the subject prefix to "net: mctp i3c:".
> - No code changes.
>
>  drivers/net/mctp/mctp-i3c.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
> index 88d9e36cd4a2..6d08898e1d21 100644
> --- a/drivers/net/mctp/mctp-i3c.c
> +++ b/drivers/net/mctp/mctp-i3c.c
> @@ -81,9 +81,9 @@ struct mctp_i3c_device {
>  	bool have_mdb;
>  	/* I3C dynamic address */
>  	u8 addr;
> -	/* Maximum read length */
> +	/* Maximum read length, limited by the device MRL and the controller */
>  	u16 mrl;
> -	/* Maximum write length */
> +	/* Maximum write length, limited by the device MWL and the controller */
>  	u16 mwl;
>  	/* Provisioned ID */
>  	u64 pid;
> @@ -214,8 +214,8 @@ static int mctp_i3c_setup(struct mctp_i3c_device *mi)
>  	i3c_device_get_info(mi->i3c, &info);
>  	mi->have_mdb = info.bcr & BIT(2);
>  	mi->addr = info.dyn_addr;
> -	mi->mwl = info.max_write_len;
> -	mi->mrl = info.max_read_len;
> +	mi->mwl = i3c_device_get_max_write_xfer_bytes(mi->i3c);
> +	mi->mrl = i3c_device_get_max_read_xfer_bytes(mi->i3c);
>  	mi->pid = info.pid;
>
>  	rc = i3c_device_request_ibi(mi->i3c, &ibi);
> --
> 2.34.1
>
