Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165481;
	b=sG0BTPOZGVAuj9p+hpFDogK9c3Pdu80y95n4oE1QBsnVUMSvvmp3wVrpWMxNv1Nfte+u
	 00UrE8XVlSN/pXoj095ZPtKKQ1rW7+wCpiT2IVzDSHs+BvrDgHzeCAxIPMzKTU+J5VN2a
	 l9aC+ODkOwpdtHBhrSqQXRopQDVvdLBt6O/DMCMzwf+NHBoZsOJIucfHmldjrmgJepwBg
	 QT8B7Rj+kijNMvIpCH1S2lB6q3VbqCl8BClRn/kyHofmsiY+MS721/5P65cNr9+/8y6hG
	 c5cd65+A+6RSIfrN6ZrFJXUhkUxDPhRaX9tfPbn9kWttzhi9l/sMuMe3oa8avn5Jtxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165481;
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
	bh=x8zVT35a08/C9y4zL1aJ+lTJy3QQ5Ys+xLu69H1jz3k=;
	b=armY5yW0qxQj8neu0Sok+TYBS1s4yi/uBknZ3pZ0pxfH6ULbjuvjtUt118jhTssoWG1y
	 F1Yo6GGfmClqYkfMl2vzW0Jxlz8iSECsgUqFXLEk1QEwLoJaGwwhbmJC1ZDZg0hN/Jzvj
	 lVUjrWvGfYo0qFy47+dXSqcFtjbEPvikQCVM5P/jxLy3oNDrMouyQ9HhSwug7OpQrOdbg
	 VROYlalJ/bYChxISkLz2Iz5yya2s0esizuGkyy0VzWhCegNtRGp3fMsJiYA0x+hFS+KL1
	 h3HiM8kBO7OM0iVi8s6QQpSg35ZeXTztVF87sBCiwjKqzdftJ6VbXW/DTZc+/M/AD+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UWAqC01m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.71
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBFD606A320;
	Fri, 20 Nov 2026 09:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UWAqC01m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRmOGIkMlUYWeYMfqPMnm+ARJAfk6bo1wQeUzmtYrq8Me4moyXLNU9ZHJpVSbeaKk8C39kAMof/L+gWgqW72SACCNgIynyvCXeXmb2/UhsdPu+cxywvqVDWNIFjVjqeBRZ9ZNvHIr4oocpMcv7RMe+f7Z+x0516vv5VlgH0bb/q9A4i6FDA17qiHCkzFBU7m4CWUCTHS5Xm2Tb3bj30pJPTrBvmYBQbyhTdYUoJwy/agQZ29JpgVtS0kOjBZHWzDnJ3DMNCF9rNX7EU9suCqOiQ4Ja4bJCq6ee4SciK9LcEUUmfUl2HHvNHGnM9xb4ecV3Kr9aj5nCzn3Q1wOeJaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8zVT35a08/C9y4zL1aJ+lTJy3QQ5Ys+xLu69H1jz3k=;
 b=hBA31it6v9W/7ZAGEwUUHsE2PHc4efuNGPdZ/oOrhib2LVCJrYOiVkjjSOQNHhn8ZnmYw8Hk5gyC/IL6potpBPsCGWoNnuRBZiQRsCpUq1tqZ+qTQWbDmGXrNDY0JLPqpGEYbhtdCFeYCuU3LRSCps/DMkfWQm4dKZ3uuZy5RyR0M26azF+2N0I6Xlvr+IuNKv8lmRoLIrF/pn0PR9vepOhBCDTlSVXIaUzjHYWp+tGJ0CbImuu1NMG5N9v/gTBE/VNb/iPOiqhR2Y25Pka6Yj33vGeFAW0bfHQclQKyU6mgnvtafKZdr3DjcNzx2NJ1O2DB5ErGkOVWKaRLqWbEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8zVT35a08/C9y4zL1aJ+lTJy3QQ5Ys+xLu69H1jz3k=;
 b=UWAqC01mXefCxzRxywAd5grJZCWqzEzd/cb6TIjXx7NQETRF4/TRU9crFa4UYUNXJOAdda/6FpOAy8jejkjhUq0l7bFOIHUmypXzD9lsIVbXGlgaciiu/2UDOXq9wZ++IwQ7CqcuDL0PP1QzajoVN34AE2rSg6sxM4t+cCdop9A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:04:36 +0000
Received: from DM6PR12MB4283.namprd12.prod.outlook.com
 ([fe80::9eab:812b:ad20:6087]) by DM6PR12MB4283.namprd12.prod.outlook.com
 ([fe80::9eab:812b:ad20:6087%6]) with mapi id 15.21.0546.016; Fri, 20 Nov 2026
 09:04:36 +0000
Message-ID: <d0fbfb5d-a2d8-47ff-aab3-1e6e7e090cf5@amd.com>
Date: Fri, 20 Nov 2026 09:04:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] sfc: create PPS workqueue before registering phc
To: netdev-bot+sinfo@kernel.org
Cc: Andy Moreton <andy.moreton@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org
References: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
 <179516443701.3291.7213639772239952917@kernel.org>
Content-Language: en-GB
From: "Austin, Alex (DCCG)" <alex.austin@amd.com>
In-Reply-To: <179516443701.3291.7213639772239952917@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To DM6PR12MB4283.namprd12.prod.outlook.com
 (2603:10b6:5:211::21)
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
X-MS-TrafficTypeDiagnostic: DM6PR12MB4283:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 20feacc3-c96c-469a-1fce-08df46e54c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IyIGUgM0wIGfIBO670sqyRuUGbIOKNmJQBSxRUBUp8wvgLIt+Q71Fmw5wRrJf9Bsx+jflVCkzaRmbPWL6GUU7DXvLkYQ+xyfN/L4yxyk1b3LCJyGmYohoBxKtwPAmV/OD/Q0vEHpAohu7JWmeTND3u4YBmIdSX9RZaLZ6xCMs+OnAecAYNUmcJbNe9PsTRqIWIPKzzx0bXdjoP5ijaFqN6Mqkm7NZxanSXYZkB9SfWud/Efh0auR6lKEpKa/xPjwllRowYfx2g3GEmileew0qyw7oBRXgp/bhU2+DrgkDK5LrOKaO73l2KEY94Rg1KTKaJ7e3Kymk5ErvHyfmU9N02tHkDNiAhqBt4Lt6Z2kBBqweqRW5cR0qVE/7AXfaZ/wVrbXiRdctPhlECiswnSCP+vJoLik93bZ4dULlRZUGRY/HDE/ezpdRNfqtbxSpzvt/iFHcXB3Cj7xPWVVLnpJKJHCD5sn6JitDPJAcFfMLLbAk0lt7JndkweqLJAaO2rNNTCFKhmLMturjbECtWaiCRBh+r0h4x5osCYp9dmuILpxtk372AK4bWixqp232k6crsKkkBRpcbN/OzGFFhNFL40JYkemiN2+81JzfpFHMO4h1E7CiEa4h/+JlLL5TuNaAU2oofp3uq2W2+vHNBXSaftm/eeGiarHkPp2zYzZt7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4283.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXA0dXRpM2l0WUlKVmUxTktlRXYrUTlHOWZRVzdhdTc3UWRKN05VQktIZXoz?=
 =?utf-8?B?cW8wNEkwZ293cGh5ZWR3eTBmWHRRKzl4Q2haeWlsby9hMEVVRmVIL1R1cEY1?=
 =?utf-8?B?SUZRYmxENS82eFk1Nk1DcTJFUGhvWUpYUVZ2UVBZUVJzU2s5cndmVXI1WFRl?=
 =?utf-8?B?QWYvNW1EWW5veGZsb3RlNkpKVms4ZlZoTTgzL245a21wTjBVSVlDdkdybVpZ?=
 =?utf-8?B?UnZtUnJTNDMycjN4Smp4Tng4ZHdMZjRya3YwV3EvVy9sMmhmVG9RR1EvbDZB?=
 =?utf-8?B?NjVOcmJkVUQwbCtpSkxXUE50ZldTY1lOYllnOWFudWwyRzA2Z0xSWXFJU1RV?=
 =?utf-8?B?b3ZxMUQvMi9hdE1rTFRHek9peXNxODRTY3ozeEg3VTJ1RzFZZXJuUER2NE5B?=
 =?utf-8?B?Q0dEVjR4WFBld3cwUjFPSWdNUVBoSFRsdzJsR2V2MHpKUmNwRTFuamZsbHVj?=
 =?utf-8?B?K29CRkdmaUVCQnc1bGp5TEdnOXFXVmh1elJLeTNsTmlvQTRIMVJjQ3VFRTJm?=
 =?utf-8?B?S1ZTbHNtVDFQVGpjdmgvczhmZkxZMnF2VG9Hb1FuZGJvazV1OEEzNnVtSCtB?=
 =?utf-8?B?YlRURGNxYWUxWmJQZ3ZDcytEUHc2S01TN2plY3YyR0lZWWU5c2RQc0tZQmFu?=
 =?utf-8?B?dGN2MnowV3dFUndNSDFXRjBnRGZZR1pCRkI3SlVXR1luc1N4bG5kaENhbVhi?=
 =?utf-8?B?OHZPTDUzV2JpOHhNd2QwbXhpM1BqTlh0VGtBQ3pYckRIbDFqZ0xtSlFsTHFJ?=
 =?utf-8?B?cXVTM3lIOTRTTTliK0pRSmFwR29tb0hpOXArbXIxOTR1SGlQWTQ1cWd2c0tJ?=
 =?utf-8?B?Zkh5TWMxQ0J4LytDT2hwY2tUNjJEREllMTA0cWlZS1pKeUNKbHpFN24xNVU3?=
 =?utf-8?B?bzZzUzZnS1JOZ05ZWW5XUmdkeUZBbHdvaFdJZjFpUmlNL1ZWS0hpNUJESDJN?=
 =?utf-8?B?TTMxRytYQXN1MEgrTy9GMnRwdk5sWE9ua29Fd1RIM0lFSmVZRUJQZEQ3UUQ1?=
 =?utf-8?B?U3F0UE5SV1FzbFBvUXdTUVM1WXlOQ0NuMGY2RTIwdFdySGMwZEVMdDVoRlBL?=
 =?utf-8?B?STMva0F6VldjLzVVMnhNVmtTbmpwemxPaHk5M1hIc3Qyelptcno1dEFGaUdr?=
 =?utf-8?B?RHBVeGNQeXlGMFFmQld6UHJxYU9KaEVPa2NqRDAxNFNUNkVaWHI5OEt1TFV1?=
 =?utf-8?B?eXV2RUNlUVpYVlZ3ZHVNdzFkN3p2UmdwMi9LLy9qM0wxRVNYRW9WaDBhSXJJ?=
 =?utf-8?B?a3B1MGJiMXVCYUcyVVFjeTd4K0NORW1tZmh4WEVKV05BZDA4WjZiS2lQK2Nt?=
 =?utf-8?B?ejIxQjVEMk9YYVRyaUFMT1VZTXVvaFJqOHAzdTJOd0F1OURBR3YrMklhUjJj?=
 =?utf-8?B?bEFlNDNPSHV3U01DTUNsaHNYQXp6WjRjdk5KTUpEZzRqQzdBQUpwQnN3M1VS?=
 =?utf-8?B?S1loaHd0VDNPbEdhWTI0YWx4cTltT1RtLzB6WTVSYnBiajJ1S2lOOCt4TGhx?=
 =?utf-8?B?M011Zi9QSlNBVVM1STAyaDhveEUwSDEwUU84bTRBejVDTnp1ekgwOHcrdDR1?=
 =?utf-8?B?YmJhdHFPUURiYlAzZzQxQzMwWGNsemlUMEM1d21DTStFWkJEbHExd0JhN2Rq?=
 =?utf-8?B?TWdNSGhxaEsvL0o2U1lwTGNoa1diNXpvOFN4cDhWM0hNemh1U0t4VWJqd2pT?=
 =?utf-8?B?b0NpbjQ2Z0Q4T21JUUVob3pzVERDM3p6eFoxZElqZHFkajRrZkF0dWFYVFNi?=
 =?utf-8?B?aUd4V3hNQjJjZjNWTHgzSVVRMXFOV2VQeXp6VTlqK21RSnpyZFRUTVVlM0Rp?=
 =?utf-8?B?UDd0cGNjSDduRkE5SzRZeE1mN0M3emd4N1R6Q2lnWXRYVEUyNk1nUlVhQjZo?=
 =?utf-8?B?S043UFVQK3p5eWxCU0h2WWJ3ZmdhclROM0JLVE5UY1lZVGl0MHd3ZU1YYW9v?=
 =?utf-8?B?YVRrRFBienFVbEdRU09lVGtGVFpCdXozcEpRU1JIS2ZLdG8rZzdXNmJSUEYr?=
 =?utf-8?B?UFErMlRrRGU5NmlDb2c1NjNXcWVseDFhV0xMK21wOE5RdkFXQTJ0T2RDZ01I?=
 =?utf-8?B?bld2SUFBdnJLeWNkdlRJSm4ydDJhY1hUeURTRStZQW1GNjdvcDZ1M0doTFc0?=
 =?utf-8?B?b3lNNGx6cExNeHV6RVg2Nm1uVUVhVEFIbTV6NUhLUlBwSW1wMHkrdGFlMmRD?=
 =?utf-8?B?YVljYmN4Q2N6QzZwQnBmcURHMkIvYzRzcElaWTZucHAzQXVWdnJzRC9kQzZj?=
 =?utf-8?B?MGlxekMzSVpKeXdSRkFuUkZSZDZacFBxY2diTE1mWm94dDdBR0hQZDlsQ3Jz?=
 =?utf-8?Q?UI6+TPzcrHT8lbwo80?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20feacc3-c96c-469a-1fce-08df46e54c9e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4283.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:04:36.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw3V9tJmFbpJnEpIdqMr7iIpgrHf8Z1IsmVIIakgCM1ZNtQmC/UeHbPKNjXztSsCEm4ZGJn3EF5ctfF7posPWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442



On 20/11/2026 08:47, netdev-bot+sinfo@kernel.org wrote:
> 
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This issue is theoretical and was found by manual code inspection.
Tested on AMD Solarflare X2522-25G.
