Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097758;
	b=BSRmlLvQmuPQSDPQErVFta3QpPgjaj2B6o5n5r3Bhq4Ikos9sETchLLkkWF8/fW1FurO
	 J+HyLR/chDzPdEGFY0RO3uHEBuy2uSaGKadOC+9HHRgN5w1k/w2SlOm4qH/f03h4KDZbi
	 KtpJCBWfjxc1tMI/P1i42+bieOrFj6jTXnNKtqPeCfDDQpLiOpUYfypmYYk4FAKHttStX
	 J0LSJRUscHlAjANNp6H8c0Z8RrvM1PkrU3TCfbDgueHIGrc+y7XCm1cqUCtI+lTR2syfS
	 C2kjxH6ods2RSa+xhSaGo8kxdevCT9QyLcvlEBpYn7AS8oBbNYX3CaO2mOzrabR0LhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097758;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=oYC68Rdd0fur9G5ySkK1WeMJwndY+E04Hln5Q3i6leI=;
	b=S9ZXcjkanP4GjRLVtksHpbKXgf5xVbpG7et1ckn2ozv3n0L4F3ENaqnv2AacNwKJH896
	 gBClITygwnHTGKDroqq6mzNdU2+r1P7roi4yh3l3r+of5occvL/r4xsCghgf9Q2eiDxlT
	 o4XTqrnK9FhS5unRQ30H6u56WLaggM0QA93FL3prHi0eaZx96TI278hpPBTha7c45Fhs8
	 YP+S6YjEXLSHlS14r5HnDWavEFGJgM8mMQzB43IWl7gWLyJ8K4P9rQLg+wELW+kfwVZGW
	 ac6j1s115yqt7V/01Qd9I/asdFV4XshKgV7J7UyCWBpVqXWKOByT21Q2bGw4oS/vRBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WC0uSbdx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1D606A320;
	Thu, 19 Nov 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WC0uSbdx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FakFHF7YORILb1VALrHfy8on3P0EFWD4QRDF9emrKCCspjlT79doZRAkrx/1S2OZlrpQPJXQ6PVglIU7+11XRh5bH9ta4mAT4SJUFUF+uy6/6iXXrEhPEQ96Qct9OJpWzGI4AyURrh42X+emqGKFi5b1I6ELvPXqy4+EtyVcCK9imUE9uD5fZ4ozxpx12ZnTY84gs18IIhXZA965Ux6S3ihsvITVUchNZ6Q3+AJ4OTovu111c1eozsGCLBABwG1QitRgmMEZMEfVQ/eK1m1rGTAwo7gK79a8a3hsifrEQ25sW3f1uEivbAByYeQK2JJv52Nahum9kpjJz0mfYwPGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYC68Rdd0fur9G5ySkK1WeMJwndY+E04Hln5Q3i6leI=;
 b=VJmnE+g3Tfnml4TSGO8Ds4NFt+7u3/fjRI73mho94qNyCa6mUZvqy/zkScpI1DcDx6EL8KTRmAP+1Z5YFj0RqZwJY7ZrEc81rHiLOl1xkSZXX/nm+3L5+mmNZY6wMvvy7wRREOQ8TdHJwU28aHI4K2q5v8HZxMqqLRJ8XQ6TpM36bHC42SUtDxHtQJI8AZojzfmIoOAGpGTX60/Dbq55t6KLS0NVKFtpIJ1b27bKHzjSaHmqy1XKxJh0yl8eyjJ2ksyDfHPKIjPr8gNG5QOqgBTEwLBBKibLh4d1SPMgcR8PseVhdKdG01Zgo5E8nG2tr0l9ckjroaRfjZzkfZuEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYC68Rdd0fur9G5ySkK1WeMJwndY+E04Hln5Q3i6leI=;
 b=WC0uSbdxc9x+Mhr1MwPriXZTah+CLOEwhRLujnDEUBNAGjFM92G8APf7qgkihlc4uAc3fOihVVa5RPP2LwbJPUhWBZqhhjICfeEWZ/I4U5VYfspZ2plRvr8+Zx3VsjgK0/xMonGA3tCD91qyx/5GUHesGhPFR408lxS7dlELBnsdOBH6NFOa18ofGOuNhHtvFxG8XYaR6UEabN4iUNntlKLCbKOPVRbyb5tYk2S+QKwG074btkMCAGmi3WiJ1qx5PLmkIhpzZRCKjnC0h/rjWviS9wpVz0QOYEbpML/tS7TViZy6LfD3lLv3NDYKFZxDc6BL2RS8K9YalFESKckzSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by LV2PR12MB707735.namprd12.prod.outlook.com (2603:10b6:408:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:15:54 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:15:54 +0000
Date: Thu, 19 Nov 2026 16:15:44 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Chris Arges <carges@cloudflare.com>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	dsahern@kernel.org, june@cloudflare.com, danjones@cloudflare.com,
	jbrandeburg@cloudflare.com, josef@toxicpanda.com, mason@kernel.org,
	kernel-team@cloudflare.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] net: prevent receive header offset overflow during
 decapsulation
Message-ID: <20261119141544.GA1940793@shredder>
References: <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
 <179502356763.3136.15330216541876894208@kernel.org>
 <av5RgJZR2HKzAN2D@20HS2G4>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <av5RgJZR2HKzAN2D@20HS2G4>
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|LV2PR12MB707735:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ced452b-23d7-4f6b-0806-08df46479f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|261009223027099003|3023799007|11063799006|261026140227099003|10067099003|4143699003|56012099006|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261028144727099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	6AvdH1O1K9linhYqK6Drkko+YKigUyxFR/csu8NY8G5gFkPIkKSkBkKHDmarzJEdRWpWtVaZNWY6AfICtiY3c0pD4D9on5CmjozlgjMLwugI3FDzErvB1LGnm55xppSLLq7/Tt6luMfdcn5+4XlBCF6UtZ0fGJIHzlvxCaN3ElopxZXv7gR3l2AE/zWBTXP/3Hlw2vM3IgaSGu5LlcJ8KgnUkZGNnaVzYQmzRp/CWyHDZxDGqE2E1HCAWNdRSAPS0QFDwkNCnV7pzZ145v6vZu1DQtRGFFTSbRo9rtz9YR+lao++WjI2kSKz3rekl2vlx0hvSjHdc8RNM4inMeKt6QDkanVzk9smCirAlrOF4U9bZAA2wsxo33IcXmRehtZ4cAn51j9+3DlObfl3ldwl0eCsJoZ3aBVSu/BVHfI2eNK81Sc7l+3BKcySchpy/1gNcQOO/maWP7w7uxsaVf1kXRdho2WUFrdcYYRtZej39ik+RN0cbXrzukO2kSt/MZjVJYXsJUv49wxenEXjTp9jqo89f5NaPxwQ/FVA1wSrGvqoHHUANjar6a5po/KDzfn3sAdvbm9NPsWM/BRS6XfDoTwDiRAW4rmqNxNC/i8yEMRPcDUYPdSaYJN+YPtHmyZP4WUvd7pQS5pCGwvXHnP5a8n2E0VzL7rbodlF1zpHciU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(261026140227099003)(10067099003)(4143699003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261028144727099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGswazMzR3EzRm9nak9kbkdlUEpNMDlURlIzZWw5Z2s4TDU2WG1RbUxKdVh3?=
 =?utf-8?B?RTN6Ly9lcmtUU2xiQ2JLdkNNQmpkL05jNE43clJtUlJPWGhZRURMZmprM0dr?=
 =?utf-8?B?L01SbmhCczlBbEJRTUxLU1doUXh6a3V0b1JaUXdXcDgvTDU3UVB5WVZYdXNL?=
 =?utf-8?B?OU9SRGQ2REhtU2ZVdVAxV3RHcjF6T2RRZUQyN3kxcVFxQmZvUXpHaVR2OFk1?=
 =?utf-8?B?Z3NqWUZnWVBrL1VGbit1TSt0UXQzTDFUSTJyNjE0ZFZhSm9NL2ZZNUpXeVFI?=
 =?utf-8?B?NllOa3cxODFZVWxEWUlkb3NXNmhtTzdYTG9UQ3FNQ2MwcEdGOUlUUXdyaE1z?=
 =?utf-8?B?dkhqMks1M0QvUUpoTExtdHpXa2pwaUQvTkQ5c3ZvbDhUaDFPbXkvMU5vQjFU?=
 =?utf-8?B?MGUraWhtZjUxUjZkenY1MGsxdW9XUXR1cnNNZVJucWx0elBVQzhjT1FsYUxP?=
 =?utf-8?B?akJWMC9BZjJkYnlWVTUxbTVkNGZ1MmQ5QitIWmR0RnJjQjVLMDk0MVRTQ2tO?=
 =?utf-8?B?dlM3bmJZQjFVTm80UnBXN3ZkQXU0QTFTUWpUQldqeDRNMWU5VGl3eEpZNFlm?=
 =?utf-8?B?cy9lMFgvdXR5M3dhSmtZL3c2YzNmVXY3VTR5NmJPcWhKNXJNZDNROWMzSCt5?=
 =?utf-8?B?dkh6eEFPcGtUNE5MT2FobUh0eTNHY2t1a3pieTduNFQrNjM3T1VFcVZTM3o5?=
 =?utf-8?B?WVlraWxoUTUzOUNXWkxzakFzTEUwY3d4KzVPK29SVVZRNjZhSnRRWGRsZnlY?=
 =?utf-8?B?Sk1PRnNyTEpQMlJ5SUxZdXk5Q2lVTEcrdklGYnlwbDVuSGZLSGNUOHZoTlIr?=
 =?utf-8?B?N0dpVVVpTDQvTktsOENHQ2NydE42ZGEzZENpS0dUSk4raFBHWkcybTlSU1lz?=
 =?utf-8?B?S1JWcEZ3QkZMTTIrQ0h2QWtNbTlHRmYrWkh4amxTVlZRcUk1a3pqOGZaUTVo?=
 =?utf-8?B?cmk5eTRjTGJSN0lmN3NDaC9qU0E4WHVESjN3WnJTWE54ZDAzQWJVeURyclpZ?=
 =?utf-8?B?NFp3QTZxNFZWZDhDSGw1VGtDUUp1SUQ3OVRJN2VTZUJBa3E5Yzg4Sjl3VXVv?=
 =?utf-8?B?bXRFaUM4VVpwVFFMV3lkVmo0YmNsV2RjOEc0WnNXRm5rNklBY28rTkhMdGxU?=
 =?utf-8?B?Z0NiQVpCK2ZXKzcvZXpUM3RxLzVDZDNGWmlRSTRDTGV6Yi93YzBGZldzaERr?=
 =?utf-8?B?dmsweWtDc2ticXpTMDlHY3lQbXpWS3djaCtUWjNIV29CS21lRWFsTWZVcmRO?=
 =?utf-8?B?VGJTMS9TUFNOaWFVV2oxYlV6R0ZTMHdzUEViYUxjM1UrUHNoczBvNG9zWGFR?=
 =?utf-8?B?R3p3WW84SmtqMnZGSllCRm5kWmZBaWJzQ0F0clRxM1BNTkNFL1IyTUFoNVBP?=
 =?utf-8?B?VWlnMG1kTjg1enpReEhJMDJxcHZ2TGNWUS9qQzhRZTdJY3EyZzZ6NUpCcWZY?=
 =?utf-8?B?dUJmYTNKdUNOaHFCM3NaQ1RWZ1orRk9XYzlURlUwUHNReG1Ha1diUndZR1J2?=
 =?utf-8?B?UXZSdUttMzFLUlJyRHExN3MydU51YmpoTW1WMko0WC9WL0ltVWZIV0x0Tlkz?=
 =?utf-8?B?TThLdUMyVjhtdDBYeHFFeG1RRkhmd1VvQ04yUUMvOGFaZHRhcVd3KzJFQTdj?=
 =?utf-8?B?RzJMdjBNTExib09EcyszUnZocEFkQkw5eDdpeGxCck4wTWhMSmNhSlF0Zkw2?=
 =?utf-8?B?WmxkS0FudThjR1NjZnpmQi8xS3NWb0ZQMW1vWUE3Zm9STXdqMmpvRzllaTRB?=
 =?utf-8?B?bjJEa0hVVHQwS0dEcXhhQzFNaXpvekVFZS8vYzh6NU9qd0RYUE5lTVlPd2Ji?=
 =?utf-8?B?L1laUDh2eXQrNklXTG5OK1NYUmsxTTV6bVNnSmpsMzh5MWFCWi95RU9jSUlt?=
 =?utf-8?B?VkN2QkdtSUM2ZU15d1h1SzhJcUlyZk1hb2wwdmIwbjV5YjBscGxuak5LMS92?=
 =?utf-8?B?QSttOEw0QnZFMU1NdEhpTGlWSm5kSzF3b0dWQzY4M3p3WFR3VVprLzdhcEhs?=
 =?utf-8?B?d01iYk1GSGc0am1Ua0NSVVFyQXdyd2pwV0hJTWhpMWoxeVR1cmdNRlFVWFFX?=
 =?utf-8?B?dTBtaDRZOE9CSWJCZjdkOUJjNnVibHFIOHE3YkY3bzMyeGpTTUVzc2JBYmNZ?=
 =?utf-8?B?c3hRemNhWWF1cmhyd2RTRW1KRlJ3dUF5dnZEY1RBYWtWNG14UytSWWFTUVJO?=
 =?utf-8?B?MFVyWkNLMlJyc1dJVHFUWGd1YUFZenNORURaZUtzdDhONzZod2dQZEp5OHBL?=
 =?utf-8?B?bEFSMVdYOXZwM0hqTHZBRGpraGlEZDZuVmdSTU1lWFV6YkVsN1RnSzExNTBo?=
 =?utf-8?Q?M3//kgGjBBd+FQ+Fi5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ced452b-23d7-4f6b-0806-08df46479f55
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:15:54.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihi33D4u08NmWtxH3xtXAZkt9GDU7gCJSPWpM5glpf39ogUMgGcQ4RcbvSqFvPNdN71jkgrv9N1tegVYfX4V7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB707735

On Wed, Nov 18, 2026 at 07:40:01PM -0600, Chris Arges wrote:
> On 2026-11-18 17:39:27, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> > 
> > Critical: 0 · High: 1 · Medium: 0 · Low: 0
> > 
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchwork
> > know by including "pw-bot: cr" as a separate line at the end of your reply
> > (one such reply per series is enough).
> > 
> > - [High] The new SKB_MAX_RX_HEADROOM (32 KiB) checks run in only three
> >   places: when __netif_receive_skb_core() is entered…
> > 
> > --
> > 
> > net: prevent receive header offset overflow during decapsulation
> > 
> > This patch limits receive headroom to 32 KiB (SKB_MAX_RX_HEADROOM). The
> > goal is to keep the 16-bit skb header offsets from being truncated after
> > repeated decapsulation. The check runs on entry to
> > __netif_receive_skb_core() and at the resubmit points of
> > ip_protocol_deliver_rcu() and ip6_protocol_deliver_rcu(), and drops
> > packets with the new SKB_RX_HEADROOM drop reason.
> > 
> > [ ... ]
> > 
> > > diff --git a/net/core/dev.c b/net/core/dev.c
> > > index 3c58db732761a..6140fd9d11cd0 100644
> > > --- a/net/core/dev.c
> > > +++ b/net/core/dev.c
> > > @@ -6223,6 +6223,10 @@ static int __netif_receive_skb_core(struct sk_buff **pskb, bool pfmemalloc,
> > >  	trace_netif_receive_skb(skb);
> > >  
> > >  	orig_dev = skb->dev;
> > > +	if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
> > > +		drop_reason = SKB_DROP_REASON_SKB_RX_HEADROOM;
> > > +		goto drop;
> > > +	}
> > 
> > [Severity: High]
> > 
> > This check runs once, when __netif_receive_skb_core() is entered. That is
> > before the another_round label, sch_handle_ingress(), vlan_do_receive()
> > and the rx_handler call.
> > 
> > Can headers stripped later in the same receive pass still push the 16-bit
> > header offsets past U16_MAX?
> > 
> > For example, tc act_mpls with TCA_MPLS_ACT_POP calls skb_mpls_pop() once
> > per action. Each call stores the current headroom into the u16 header
> > fields:
> > 
> > net/core/skbuff.c:skb_mpls_pop() {
> >     ...
> > 	__skb_pull(skb, MPLS_HLEN);
> > 	skb_reset_mac_header(skb);
> > 	skb_set_network_header(skb, mac_len);
> >     ...
> > }
> > 
> > Outside CONFIG_DEBUG_NET, the only guard in those helpers is
> > DEBUG_NET_WARN_ON_ONCE(), so the value gets truncated silently.
> > 
> > The number of pops per pass doesn't look bounded:
> > 
> >   - a filter can hold up to 32 actions
> >   - a filter whose action control is continue returns a negative result,
> >     and __tcf_classify() moves on to the next tcf_proto without counting
> >     it toward max_reclassify_loop (that limit only covers the
> >     TC_ACT_RECLASSIFY / TC_ACT_GOTO_CHAIN reset path)
> >   - about 512 matchall or flower filters with 32 pops each comes to
> >     roughly 16K pops in one pass
> > 
> > veth_setup() sets dev->max_mtu = ETH_MAX_MTU. A frame of about 65.5 KB
> > carrying about 16K MPLS labels, sent with AF_PACKET on one veth end, would
> > reach __netif_receive_skb_core() on the peer with about 30 bytes of
> > headroom and pass this check.
> > 
> > tc ingress could then pop the labels while skb_ensure_writable() keeps
> > pulling data from the frags into the linear head. At some point
> > mac_header and network_header would wrap past U16_MAX.
> > 
> > After the wrap, the remaining skb_mpls_pop() calls would run memmove(),
> > skb_postpull_rcsum() and skb_mod_eth_type() at the truncated offsets.
> > ip_rcv_core() would then read ip_hdr() from stale bytes and set
> > transport_header from that position. L4 code could then misparse the
> > packet, for example in tcp_data_queue():
> > 
> > 	__skb_pull(skb, tcp_hdr(skb)->doff * 4);
> > 
> > Here doff comes from the wrong bytes, so could this wrap skb->len or hit
> > the BUG() in __skb_pull()?
> > 
> > This setup needs only CAP_NET_ADMIN and CAP_NET_RAW in a netns owned by a
> > user namespace.
> > 
> > Similar in-pass header strips look possible elsewhere:
> > 
> >   - openvswitch pop_mpls with recirculation, where
> >     ovs_dp_process_packet() runs again without re-entering
> >     __netif_receive_skb_core()
> >   - bpf_skb_adjust_room() shrinking, which adds len directly to
> >     mac_header and network_header
> >
> 
> These additional paths can be addressed in a follow-up patchset. I'd
> prefer to fix the currently known cases first.

I'm pretty sure that only skb_mpls_pop() requires a fix and the bug
being fixed here is more severe.

> 
> > The commit message says:
> > 
> >     Together, these checks
> >     prevent 16-bit header-offset truncation in cases of repeated
> >     decapsulation.
> > 
> > Is that still accurate given these paths?
> > 
> > Would it be more robust to bound the offset where it is stored, either in
> > the skb_set_*_header() / skb_reset_*_header() helpers or in the pop/shrink
> > helpers, instead of only at the chosen re-entry points?
> > 
> > [ ... ]
> > 
> > -- 
> > Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994%40cloudflare.com
> 
> If the checks were moved to where the offset is stored (using something like
> skb_set_transport_header_careful()), then we could introduce potential
> performance issues.

Agreed.
