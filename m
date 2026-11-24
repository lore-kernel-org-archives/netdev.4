Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530745;
	b=NxJkcj0MX/A5gdF5bbel1jPxnHyYM8OBaafLaEWm0XBOkClQ+IUFWL8sYEYKVbtclwIn
	 /vwK2lM2SSkMrhJcNjdfPDjJAg28hQ1eB98gxVJGg1aRqrUt+mXIRFbX3PzlieVvXczf0
	 9GbU7C5zkU7XlJUTfiOGRCHYKpXeFLueTMbeJnS9Z4BkzXMs1l894m55TN+oiJZk9e2KJ
	 1xGuPH8druUynWlGU1TxUWdXyfQFcOnbeoHMWNa3TQ2AvE37ntDzGo0A8GwTuO1WLtL6+
	 pBIOje8FpwaKDXy3rw5ntLDwMmTE9lazwu+u5deqx8X7uemG/g85++43VH+hyytLxFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5ZysXHyFDnGSEkjz+gr8GDZZqaKo8wbee+0BQlp1iIE=;
	b=0tC2Tw34OKBjmGfw0OMw/V3T01K1vyVjCttgvWRY7E+x6Y0NXbj+Qk7DuVSqMO7+jySa
	 Hgy9+pi6KXGPRXlh3zofLQQVEFy5PxZPOvwDRMX00r+pSHYGj9Z8rf9c2JPanoLYr7RsZ
	 B5UrLRBpEhlFm2HbN3IdB2M3VH9kLVosfus8AgiIEWi+SIvCONsstuXZE6Sa3Omjv+Y91
	 gW8Z91KxkhK25SxVC72IYLcrE/r9s83n8z+z+67ffYLLVlH+L0KaLgU+JG5rR7B7UVYkn
	 5OFUKP0mrm9FP+RWzXdoz3yO2EN6gMbC/Hx53pyiuaoxaTNPNRohFDBuLJXo2rlM/FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WZ4G8P2z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC8606A31E;
	Tue, 24 Nov 2026 14:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WZ4G8P2z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkYP+fe+Gj4LjQUROyFB7zg3/VB3igYt8Zlp/UIxSsFwxvZBjFDl9CkC5wcSdI9nwHxEI7kcnqS5JKm8FVGBKRrwGkt0/tV8oLGALUBm5+HIKdTsa32sppgRy0YjBuSQC4WT20t9r2x4l8z+JKHV43CQO4xMYkNrLsaozxXrgiMOEOuSQ27oJg6rolhLcSG7rCynUdh7CYoKYHCYrscoQkcPkGtjPJ1TSW7mOmIlJI3p/sx4MG4Qb5b6k+Z0BdswS281kQkRebFPfMsAzppkT55bp9d2w572zxTd4M7XTKUYFGoqCtrna32fd+XNZdXwjBZHPb/+Yc9rqpsDQDCvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZysXHyFDnGSEkjz+gr8GDZZqaKo8wbee+0BQlp1iIE=;
 b=pVHce85+2egVCqyId5IfU7OFDnemE6OP6zqL9Wi08VJXjlvMCgVSkc23a8bgYVjVflFJPjA8hA/OZ7xIgHTPzNvUUB3vWDxxHrZi//JK0VV63enMR2TaeXlk0zpqOzUOnYetBZLV1rz/xfvbAxsQkqDdTjGQsU++uqwX5LISjk/7wqOa4dSXxi6h3a86J+/N5vEVWYBtDD+OWX0lVTGtEPpUXn2CWdjEbLK5YF47Ul9iGU7qRAO1Qzmx+x7aUN3eLmH5H/XItCc3WzKIIftmuuhSHxljKxnPGvh/19ntRGwlMOpCuSV6SMkgoDFedAKY7DJK1ksqNqraIRu0ACikKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZysXHyFDnGSEkjz+gr8GDZZqaKo8wbee+0BQlp1iIE=;
 b=WZ4G8P2zo5RDcw5a2NOudDS+xbdbGenpme7zKFNNH/RSvagmsUw+epo5jdRmW+mMF3/P2mCC/Zf6prAcDE0uCA9PCJi7ASkbzPvRZqs8JSOO8DhGtZk8BjGbMgkRwgB9DOopy3YsM3C4k28ERCI/ZPa+1FKTmDUhcUH3AhujojupntWAkgXbfYFfEPgySeLsnH82wOp4EkVHahQRxw9BP6OqT2hTUDxJnbOqAQBSd8asugH9hVSEHD+DS5AhxqJww7cDTZBZfPrfS0DUmyY8STBnwDRHgGrF5GZWmYLzAofLV/uIZ0OmlveMmUNrYp0I8zhEEUJFCtMhrnytYVoCQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI2PR04MB10835.eurprd04.prod.outlook.com (2603:10a6:800:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 14:32:20 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:32:20 +0000
Date: Tue, 24 Nov 2026 16:32:17 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: felix: fix NULL pointer dereference in
 felix_port_enable()
Message-ID: <awWbEDDjz6XhCEJt@skbuf>
References: <20261119100710.129379-1-aristo.chen@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119100710.129379-1-aristo.chen@canonical.com>
X-ClientProxiedBy: VE1PR03CA0051.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::35) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI2PR04MB10835:EE_
X-MS-Office365-Filtering-Correlation-Id: ec920cfd-7b3a-4539-2266-08df4a37bf63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|19092799006|1800799024|261022105027099003|11063799006|261021121427099003|10067099003|261102123227099003|56012099006|261026140227099003|261026121527099003|261021135927099003|261022075727099003|261028144727099003|18002099003|261009223027099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gyNCdk7MFGMh1K64QqjCZo8Xv/g48vM8IGT5tYZhEgg2vpuZs0Eng+1RfoUMYW7lKORBEC3XA/qHt2mrtXgsYfpjoEh04k09ru2YuVoYzGrQv2IjCdMhJnMxCgKf1XsY6Vu82MvCen20iUYXVb/vkIytwQNG9ZmH4gkPKykAA9QTJErrEbna/r19XWUKA6oVwqUP8ptszmt/4JQueUsGLvt3+QkrjgUk808opjWQ7l6niZ0uCW03MV/bSHxDM6jmGgRTwwtxnDGxXKndJwdsg+yP1ecK0ijYov3j5hFhKBpgTrWPBrYn7/Lyvg1sORNTrzSy7Ch2IrMlJ+rXi910+aq/hsTp5OmL4lpWWaRWfTYBOPvBQSogIuu9DBuSO2la6p1kd6rNc8wpuX+u4Cmfu37LCOGbc+ZU+kAhRfL72aDj/rWdHMdUADtm+pqMBOY+gvbAQDmh/Fiz/LUDl6UY10CfBSymlSygQt/SyBd3M73bTsuuLtc0M+4gTC9CmlsfVrMLSKd7qPtnkL8V0s1aP+fDsh6jZ4eIMGL2cDGg7u/a5oRezOtfH+UWW6HiuGKCsWLsrW07p4EftnhgK2fAld30XneisyhMtpaD3OA93MB1qPEshoQTE6CxA4NySMuzaQvCYCWQjbzPrCDh56ww/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(19092799006)(1800799024)(261022105027099003)(11063799006)(261021121427099003)(10067099003)(261102123227099003)(56012099006)(261026140227099003)(261026121527099003)(261021135927099003)(261022075727099003)(261028144727099003)(18002099003)(261009223027099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3HwtGnmL8txK5TDQRvWArzRrYIM3x1z2SNobzyP8U4+dP8vspG12Jxdj8YUf?=
 =?us-ascii?Q?KNY81FhMkQheTUnAbcCeYOoNC57xPsVmqxKwSVOfYJzIo8JQzthEk1FqusBE?=
 =?us-ascii?Q?WcyXKWkSdjNV2C2EMMn9h0wctuNRPv/Z1vtQg//LeHWxXUoTe50YOyZgM2hC?=
 =?us-ascii?Q?ZIJ1Rjt4h2y+muAFFcZCfWEb89/7H7ELE9XAerWDS21CFMfyTRIXF3/BJ13z?=
 =?us-ascii?Q?m6Aes1q0EppL68oZWDmBCkFhGi3+cYOEmZMaWlDtdTsVNcmaeL3g8U2++oe+?=
 =?us-ascii?Q?cRabgU1TRRn+cWZb1+9rROH3CLgms0Q1UKxXnqpTe76vWvA6YGDLNB3waKgY?=
 =?us-ascii?Q?XfPHUrmR1qn9mvCeL3pLNsSD2kJpsnbEA5D0tB6UxwaFT1QatFBtiTbb9Uck?=
 =?us-ascii?Q?vPjR0OrsgS0EwgK2nRPv/Xb1xzQ8mUJky5CRrdlNWqvQdSrwIN+455ybtf1V?=
 =?us-ascii?Q?bqvb3bRPaEnqzLUH3EYnnFgpTT0B+564jRx+b8SkxS/4EbXHgK/iBuNu6s8U?=
 =?us-ascii?Q?9HOEdKjipLkG0qb7ro17V0UCtceJLoooZ+SO/MTEH6UYZI7yVb94QLB1KndX?=
 =?us-ascii?Q?bthSDikaHpTrNejBuERFwhivP1EQZwJI89n54k9ET19q87MLgup3H9tfIzLW?=
 =?us-ascii?Q?PpQMF/yak+7F42HKyDo8cre8LGOxYKAz+IwM2nQ+Jyy3jYaRGx0n5EwR3Hxv?=
 =?us-ascii?Q?b3pT6LJ2CMJCZ9S0CG1zoLaGqixTJsWRCUlGUUC/Fx7mWgXn4/90bkcD6GRU?=
 =?us-ascii?Q?nhzjHW2auzPLHIKCHeH1uVtglXerf5ppSLIYUIQ7/wEdXbHdx0L1jiVaOdCT?=
 =?us-ascii?Q?pDw6Wczvd51mRgQn+AruX6QrWWWSvJHaSvQQe9JgCXOgiMgUQ4j6Iw9ghSVF?=
 =?us-ascii?Q?4VmObYgsC2UIBeyiypoC4Wq56hO33AcR0uYyhS0NL+sJCS238fFXZHYpfvVp?=
 =?us-ascii?Q?FPYN6bqMRebZPhe9NUK1ZgH8rUWz4HLefjIGN4rGQefs7gsXO58MWW8Fd5JD?=
 =?us-ascii?Q?bohCNXcrLgx2bBMji6uEShpGJgP5Fg1Pa3e1Lo6QD8102FrvNKlR5tqt3DvV?=
 =?us-ascii?Q?hu5HF4pShudndHP1jUInxWRARpPhLe/5p+35iFOlFM4qvaUUXa578kqiRav4?=
 =?us-ascii?Q?rRMGGVFGK3gdfrHq6vqlTo8y5dLnVxGi2yHE6n0g6/ZiKN20O2Y6xA1mKV65?=
 =?us-ascii?Q?WLUdpOp1vHbhxAy7uqbJ0pEp5F2ozLYwVOnBNEQq/3S42tdWiwE8+V2V4ONR?=
 =?us-ascii?Q?wVe2cdZW+96hYk+mdHygi8BjLxKFLvrjVz6O8+JIuqKe5nhoDmBpAg0sPGcz?=
 =?us-ascii?Q?a7Ya1VtkSihxo3K+Cn6AS76p0cRskFLXfUCkrcPuflyxj67INrnPrj7r95W8?=
 =?us-ascii?Q?Ueu+MWBt37cXaqI8p8WjxdNxfSRkBKlFqqqv/zBHmoOFXdfOsXlTCYiSL6y6?=
 =?us-ascii?Q?omVFLlCQLG+F1FwRAAf1pFcEPcrc4UpICFwul5eH2uTgbZYEQHcf861YAWMr?=
 =?us-ascii?Q?nlEZ28J1H2BXYSNdl5Mhj6jU65FvccEbIRbxEiV3+Xp/O0qg+szRU4tN/+qI?=
 =?us-ascii?Q?eJkZ9JqFEzzQWVwT0qFqruZ2vUe+26BciT+qI5NwGUnn4FX3p6sOhCXHNW5A?=
 =?us-ascii?Q?dXEcsLrt6tsX6ztqGy0V/DE4HQbMbpPr2py788ZoHKFDMmti1RCnIULIhELB?=
 =?us-ascii?Q?VhhH4KjB0514Oqpa6PoaomS+46zfxQ9ACxPg3PSRy5cjeh11ZiT+7scvrIww?=
 =?us-ascii?Q?z9onj2F6WVWPAnw2M7uKEegCmZ8/SX3UVHVyZ1u4SX6nyeWvhqlyAnd104Ok?=
X-MS-Exchange-AntiSpam-MessageData-1: 5VmSDdq3M4n+nQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec920cfd-7b3a-4539-2266-08df4a37bf63
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:32:20.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0jzdyz4jtuWvHitwCb2+gbJl0HHMaJAQBF2YEn1vb2yBiCDLBv+sIaRVso74umes1kxeR4DHc4yolmVke4Z9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10835

On Thu, Nov 19, 2026 at 10:07:10AM +0000, Aristo Chen wrote:
> DSA registers the user ports in dsa_tree_setup_ports() before it sets
> conduit->dsa_ptr in dsa_tree_setup_conduit(). On teardown, it clears
> conduit->dsa_ptr in dsa_tree_teardown_conduit() before
> dsa_tree_teardown_ports() removes the user ports. RTNL is not held
> across either pair of steps, so user space can open a user port while
> conduit->dsa_ptr is NULL.
> 
> In NPI mode, felix_port_enable() calls felix_cpu_port_for_conduit().
> For a physical conduit, that function reads the CPU port index through
> conduit->dsa_ptr without checking for NULL. This caused an oops on an
> LS1028A RDB when systemd-networkd tried to open a user port while the
> switch was being probed again at runtime:
> 
>   [  166.722423] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000028
>   [  166.816908] Internal error: Oops: 0000000096000004 [#1]  SMP
>   [  166.961766] pc : felix_cpu_port_for_conduit.isra.0+0x90/0xb8 [mscc_felix_dsa_lib]
>   [  166.969289] lr : felix_port_enable+0x120/0x1a0 [mscc_felix_dsa_lib]
> 
> The oops left RTNL locked. Later operations that waited for RTNL hung,
> and the board had to be power cycled.
> 
> NPI mode uses one CPU port for the whole switch. Changing the conduit
> of a user port can move the NPI port to another CPU port, and the check
> in felix_port_enable() keeps user ports that still use the old CPU port
> down.
> 
> For a physical conduit, compare dp->cpu_dp->index with the NPI port
> instead. DSA sets dp->cpu_dp before it registers the user port and
> clears it only after it removes the user port, so the check keeps
> working while conduit->dsa_ptr is NULL. As long as the physical
> conduit is set up, conduit->dsa_ptr and dp->cpu_dp point to the same
> CPU port, so the check gives the same result as before. LAG conduits
> keep using felix_cpu_port_for_conduit(), which does not read dsa_ptr
> for them.
> 
> Fixes: eca70102cfb1 ("net: dsa: felix: add support for changing DSA master")
> Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

As discussed, this is a patch that treats the symptom and not the cause.
It should only be a stopgap for net. The larger problem of
conduit->dsa_ptr being NULL while the user ports are open still remains
unaddressed.
