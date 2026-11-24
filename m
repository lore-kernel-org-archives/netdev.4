Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553713;
	b=2+7yrytk3bxYgGnihqGXqT+t6815NWZMwRR7eLWqN/ZHM4VkQQidyzBiKUZNDPm/RMBz
	 Zv06YL0I4t+46rUHX+9UNISEaGIlkgb0SAptlif/FTAAJlnvZxZUQ4GpgyZXrjolE7Tdc
	 po4t0NY6BZTYwQxnXBJq1CtK2/73VAIU3FTFTf3UqsABZ6Gm1DSr04cs9FlxOdczogZDq
	 1dLfGGj3PIwdwjvxto8HDMOy+XJl1Bz00SGafGdg8IRcH9BkA+O1QacR7okHKT+1aC8h7
	 N5VFgnK+IS6d6pAvP3KVW029IqhiDazTMgjOx7XJRB4/3EbtPG0CHsf71LIcT/CcQkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553713;
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
	bh=u5Ixt1T/+zW5jYJQWriPVKz2JFmhcVydoR+I71/bkt0=;
	b=WH9gk8p9vBpVfWMuWft2MgNyX8ywaJqrfT1GENQXxNc/RpvXa0VF2Dg14ZqK/voecVF3
	 jYyc6dfiJEZ8pXHPCzZ9fNM1qDSuWBYLYuwNY1n6ulIMBYjuAdQ01Ql/nA4IilHUIbAOT
	 oMTUvENc4s0IYeUj1Cm+bBpydn2LOMSVzYmnU/EVrZLA3lW4FnHXiP3U3lkAoJls9UDOr
	 ThKlpGshTmWbyLVmeCIJVkji6X3KMU1J1iujf/ACm6QpXGDLHXKPHZ7TDgsadFAkE8JL7
	 MG8d+gLXWUlXIMPvc5tRlcyBp3nI+vSv3tjywdiTNi9OLWPJk84rM8B2UYxXNTo0dxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F3g4aB6M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C0606A339;
	Tue, 24 Nov 2026 20:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9C0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F3g4aB6M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYVA1c9NsjzpkOugbk2NlMuCNc6KGtZ0fhhayEcLlEXmfE+nijhOBNMGqRbPtPKRvt70tFOj4Hz2qwhYHseWBPBSGpaj8FoC4st1AKZDdoo13mYyRuFD5eb2w5+Ppy0oovKODDToT0JT3jev4xnMsW6C7PtGbfUaEBOkoSk7ZN1XC5AxuZz05k7ozYVwYxLjr7rfnARCa/QASsBnHyFS251EyQCW6zRLDU+FV8kKAiOrbSUxAnuJoYlJVVUz9tieYzmVNSkpAiVaKoY1nd0QQmDe3V9t3zMO208PrtwtL/tG059EfM2F8iOeJ1xAPsh5y1gyT9l4n7Ss+6HxkUCMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5Ixt1T/+zW5jYJQWriPVKz2JFmhcVydoR+I71/bkt0=;
 b=E8YdSO/82S4CMQiZytApWCSdynYEV4w0vmwJ108/RPPAE2RsFEVqoAdPT3yXZFCrP6rvP8DKacmosroRuHTNwg6balEvG1+DtNvhD6RCyLk2nZkn2rcgSP8p0yarVpheBWsiTdVUhZjubpu9jLEaojcT1U8TV4WsS+R+4Ned+jrgJnnHke/txNnHdhugXuUjfHcvQrElBwiM8fqw0ZnUcCq8cPZQ7XumrlczamGF+5SKt4bG5baOcBf9/22RSG780tBT8Kn8ZTB0Wv/AeZ6FfLydkfRiFhapDmMp6MKbkFl/MDPos/x5PdfQLZdasD1VTVN7SI7y3V/VnWDUHMEw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5Ixt1T/+zW5jYJQWriPVKz2JFmhcVydoR+I71/bkt0=;
 b=F3g4aB6MsR6FCMejSBhyZ4guytn9XRcoUN7VG/j5EeIxsAvCsro5tC/TYKup4cGRItBNK+5SK+qaZ+diJQIGo0vcEvut2fCyIR7v70C9zuoq4JtngRFvmK/nVnqF2dRIsF9dPZaB6+2vMHoht6IFciq/kNR/6iH1ba2wpXTHmuhUcltjAJDYHCZZzkciCMmmRoneO+Vpy9mnFgn3j4VCIOla03sTv7HohzlT2GYXh4Osv2LEULMYDlQskwZlMvlCCFwm6aZZnqxjjyVtGI+Q0Efk3VkX30q8FktXF6zaB8YACWLIN+fS3qy4IjdOdY93JS6p89xkszD/etYTUF6Whg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 20:55:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:55:09 +0000
Date: Tue, 24 Nov 2026 15:55:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, meaganlloyd@linux.microsoft.com,
	git@amd.com
Subject: Re: [PATCH v3 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
Message-ID: <awX5plL9Ui08Ef91@lizhi-Precision-Tower-5810>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
 <20261124060651.1987454-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124060651.1987454-3-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PH1PEPF00013305.namprd07.prod.outlook.com
 (2603:10b6:518:1::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f97760-178c-47e9-0275-08df4a6d3a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|261009223327099003|261009220027099003|261009221227099003|261009221727099003|261009223027099003|22082099003|18002099003|3023799007|261021121427099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|56012099006|261021123027099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4SU1mnkuxWWDwc5M4Rlr6rlu5ynDIZMo+Y2hXVl/T5kUzzdH/fugNs92kUJ81bR4CByXNQJX0vMfEZ9vHujY4NEIXM1nKQd6xwL0PNi4+6HW7aUph/iqaPg31NeTk0DpaPmD1zyjQbanW681jkIE0agsiWzVN+UcPLMEE2bG0/4GUltnhWWprpyHR8iAQ9xma5vr7MvcElKZgTikM2hWr8Rna0CoOPKzOtHD2mQA0BYKveiwp08IxowLYKDScwOsDIxmZJZAJVxhnKZNAreW17BArBVUFy+i6sBzVFZlfn7Dsaz8ayhyTeXKFkhwKOl3rHwLeQPdTj5YYwpG/Wod+FpKniAS/YWzAMFzLFyxwH/E9Ew42NULAh/2UtboHVBeoRB11rrBeKxZDuJfDmLlFe4McwcEwP6gHz8Cg317xC1VTz/BAkNHf7f1BQ8bVNkDO7yLJDcNrENXrRvXo6lVV29BDjZhLYKnXCY/FlpveknsZUfN66Oi46S0yJXj921+0ehSk++zy64MMlOTdQFJtkUdPPc0H1fNPAwCQQUkxmISIKNZsf/+FY9UvjOMUJDheeGxkm/Ws05s5gqIoUl+FmqHcwRM/PRL7BqdP+qqEK3Lm0nwJ/qhlNuXjf6HAEQ2H0vM5JRVldl0m6HJmF0B0kVxP2jZjnJFeqrxbr2vOnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(261009223327099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223027099003)(22082099003)(18002099003)(3023799007)(261021121427099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(56012099006)(261021123027099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7nFnnoDgKRSJBdTWhin18TuHus6gnJ3O3EsATSkU6s2aqkaPF333X3r9DrGW?=
 =?us-ascii?Q?aGQrP/8YIuQhlyHL7T6JKaR4IMcq5xpyf+24sY+U2ik+clRVBbsvvHDmCDaN?=
 =?us-ascii?Q?gmOSt7WZuV2fDOQKg35A0CGTM545+HpoeMfcuIGk8hs2FUSZymQ4k0HTdIrp?=
 =?us-ascii?Q?oimIDeT+A/z494y4rDYSDlTVGY25i1iTCwfItXox1QK+CxIFXWselGzbTJ+7?=
 =?us-ascii?Q?f1V/fi+s5UwGoMNrE69leTJ6GBopzAcDMiOsnOxbsRaoMyVsDjANUJ3JD76U?=
 =?us-ascii?Q?CRCX9BbS8vCcSEtP3+LF+zziNkhPu8FxNBHmY5OC1qpFw+/O62gXnNGiCL47?=
 =?us-ascii?Q?mhotKLjzmIp+E/BqKAuw/jLMSORFcO+34PGEbMg0x2gPBfLJWiH8JxXcR9Vj?=
 =?us-ascii?Q?q4stcmsWHze2Nx2eHXttTRvENQoV22iPHoSw+EPLHYzSyH+x5FyTKTWqN6AV?=
 =?us-ascii?Q?u35fhiJkNC3kehBSbfXyJrW1zY6r00lEIEQJIno6vemgWfrO8N9jekErJMSY?=
 =?us-ascii?Q?DYz8le2AR1Q6JZj5ndAAiqx3Ezeulaq7QzbRly7B6wwXpZ/fDX9XRU++rA5b?=
 =?us-ascii?Q?CYfx0rMv5t0/bu+3kJMuM+5v7vrxNCytT6lsAFdPwYSmvG20KFhF0uuQsHkd?=
 =?us-ascii?Q?4bin0mtzZm4Q4fh6iJN8nqKREM0nTZUiohS2CPor9W8GtId+rNMJskPtx/yl?=
 =?us-ascii?Q?lX/SrOm7hcWGB74g+XcGTkezo7VZvEn9Wqot6q9tQnkv8/c+O1inmMf3ptPK?=
 =?us-ascii?Q?ZNxRJVeR1SkWRjbdhZkGnYl8a1k+Ipq5cE9XgxgsTaCajuD2AOv/pO6ywRax?=
 =?us-ascii?Q?nfy7DpaHSW7yKMll0qpBNBgwK2+h2WNqn+ZJR9Ff+zWMkLKUFHOVABh7OSh1?=
 =?us-ascii?Q?+CIrWE4Aasz/TlAAu+HKl9J9vr0IDy1HiUl12KJJjBJygsZt3d2RiqUII1Fp?=
 =?us-ascii?Q?rX9ddUVnz8JwZwUnwOJ8rQ4UV8DT2nGDCciAxl1GzoEh7d5m4zm2fgo2ASFb?=
 =?us-ascii?Q?cmnhE2eHJCtG1hbGvAa00C5SN3IDsNZIxKG5LrTY+7ZdFmc+LPUu+zxMhLYA?=
 =?us-ascii?Q?XUuG10YDe4Pbh4uFW5S/ydrhdfcOYWAQu3Ug2U/SoVvLu4hms5ixJ0kJZs27?=
 =?us-ascii?Q?FNGo+5oVRjsnwxlsZo40Pu3uljvCkOq5fXiu2wlAYJLleomQH5BRKiJNzUZo?=
 =?us-ascii?Q?RMXMhkqw/a/C3KSyVuCEFxv63QBZA9XwrTik8d6F3Gf6j308rYpx1CnY5YVV?=
 =?us-ascii?Q?dM+vjRpmAFIDFMjn7D+/XcLY+3pdbu94QntD8F7ud/zaQYV377Egjm3NEaz8?=
 =?us-ascii?Q?NMO8bMuV3edV9fVcFDya6JHX0gZMI8svLm7NH/W7gvdzpzDPMbGBKaVxN+z8?=
 =?us-ascii?Q?xxqyfRXae8fkUqE87SjbuOl+L+RJdlXVttNq2qx0KnNd8pMKTeXZWXMspK0Y?=
 =?us-ascii?Q?GydfNovZDlB5pgYpaqA/ynNkiQQJJ4Ow7J//V9DQge0jZ7YAGcKuKQrsIaLv?=
 =?us-ascii?Q?K0Jdjnnwy0ITZqjfdjD/1gp8usPssOav6ITKAU2U5eYZUMYe1PwcqaBjTjh3?=
 =?us-ascii?Q?Nr1MSPVaVdKwoY/ncO+xIRq4B2aSaOomn+h38bdKDPNcetwG27BCwjbLseEn?=
 =?us-ascii?Q?hMKaxCPaoazqlYkIl5bwEQRqOLbJzC8XTG3zubSs4aRQDpPtwQVmL5F/uJSy?=
 =?us-ascii?Q?/SU/tCuBN39+GmVHYa6opByXUuAns3L6HtbOEcZFaQtJ1uoRbECPbciJH0ye?=
 =?us-ascii?Q?FKJzYuM97zpKfsYNhe8koGQj9guZTdT7O85hgse3YeyqV7vEHCyH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f97760-178c-47e9-0275-08df4a6d3a33
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:55:09.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/5QRaSsV69xdmY5enU3D7aYQZLfvXQBYwCDZPXZLZ8biwZaDP/3xkx4y46mf5bvkxY33aqWlBHiiujvz4P5Sqe0IZmhLqld+MfXXpoPV2KxnlG5JSTQxB6XqNduX5Bc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870

On Tue, Nov 24, 2026 at 11:36:50AM +0530, Shubham Patil wrote:
> The driver currently uses the transmit buffer depth to validate both
> transmit and receive transfers. Since the transmit and receive buffers
> can have different capacities, receive transfers must instead be
> validated against the receive buffer depth.
>
> QUEUE_SIZE_CAPABILITY reports the configured size of each buffer. Take
> the receive depth from there, leave the transmit and command depths on
> the status level registers they already use, and split
> caps.datafifodepth into caps.txfifodepth and caps.rxfifodepth so that
> each direction is checked against its own buffer.
>
> That register was already defined at the right offset, but under a name
> that does not appear in the databook and with no user at all. Rename
> EXTENDED_CAPABILITY to QUEUE_SIZE_CAPABILITY and add the field
> accessor.
>
> The DesignWare I2C/I3C databook, section 11.1.58 ("QUEUE_SIZE_CAPABILITY"),
> defines RX_BUF_SIZE in bits [7:4]. The documented encodings 0 through 5
> represent 2 through 64 DWORDs, respectively, corresponding to
> 2U << RX_BUF_SIZE.
>
> Publish both depths in bytes through base.max_tx_bytes and
> base.max_rx_bytes, so that device drivers can size a transfer this
> controller will accept.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - Use FIELD_GET() and a u32 variable for RX_BUF_SIZE extraction.
> - Use sizeof(u32) for byte conversion and the renamed controller fields.
> - Add the RX_BUF_SIZE encoding and databook reference.
>
>  drivers/i3c/master/dw-i3c-master.c | 24 +++++++++++++++++-------
>  drivers/i3c/master/dw-i3c-master.h |  3 ++-
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d1119f203d1b..21bd94e5a6be 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -203,7 +203,10 @@
>  #define BUS_IDLE_TIMING			0xd8
>  #define I3C_VER_ID			0xe0
>  #define I3C_VER_TYPE			0xe4
> -#define EXTENDED_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	FIELD_GET(GENMASK(7, 4), (x))
> +/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
> +#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
>  #define SLAVE_CONFIG			0xec
>
>  #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> @@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
>  	}
>
> -	if (ntxwords > master->caps.datafifodepth ||
> -	    nrxwords > master->caps.datafifodepth)
> +	if (ntxwords > master->caps.txfifodepth ||
> +	    nrxwords > master->caps.rxfifodepth)
>  		return -EOPNOTSUPP;
>
>  	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
> @@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  			ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
>  	}
>
> -	if (ntxwords > master->caps.datafifodepth ||
> -	    nrxwords > master->caps.datafifodepth)
> +	if (ntxwords > master->caps.txfifodepth ||
> +	    nrxwords > master->caps.rxfifodepth)
>  		return -EOPNOTSUPP;
>
>  	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
> @@ -1666,7 +1669,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  			struct platform_device *pdev)
>  {
>  	int ret, irq;
> -	u32 thld_ctrl;
> +	u32 thld_ctrl, val;
>  	const struct dw_i3c_drvdata *drvdata;
>  	unsigned long quirks = 0;
>
> @@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
>
>  	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> -	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
> +	master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
> +
> +	val = readl(master->regs + QUEUE_SIZE_CAPABILITY);
> +	master->caps.rxfifodepth =
> +		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(val));
> +
> +	master->base.max_tx_bytes = master->caps.txfifodepth * sizeof(u32);
> +	master->base.max_rx_bytes = master->caps.rxfifodepth * sizeof(u32);
>
>  	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>  	master->datstartaddr = ret;
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index f5b4491b247a..e23554bfc5e4 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -14,7 +14,8 @@
>
>  struct dw_i3c_master_caps {
>  	u8 cmdfifodepth;
> -	u8 datafifodepth;
> +	u8 txfifodepth;
> +	u8 rxfifodepth;
>  };
>
>  struct dw_i3c_dat_entry {
> --
> 2.34.1
>
