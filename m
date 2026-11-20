Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795175440;
	b=5PmeZCL2VMvGfjs5J/NRZzwDRhS4T9OUV1qQR2qLhO2XtlI7a1ASAxib20ssOOjx8r11
	 RmvvXuT5hDrqS7kNV1nvy3FxZVBsLpEADJBR3hqarWfHxDRqNnUuLcNuBX6HQpBosI7gh
	 BwHnLHit7d/jjCXuXc6e2cJ0qPqXonHRjd1fhOp6koF4Bnb1bn1vwFqxHEgWZgWR11Pni
	 JAuaXImyESbmodsnjSnXS8BkMNiffnJhKQg3vYCZ/ExPrgMkzlziqzZUhFRdh7WtutwCj
	 tGe6VLxBdDr/UNBVWfiEEypRPdUIeo149le/BzBHY1Vov0Uk9MtXj/1owHI+7+xK4OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175440;
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
	bh=/kqSB7gYtIU39EqOKcoNyONxEkdZXtSzm+zChb+W0To=;
	b=eQgyVZ9KgjLHsKaQLbR9nXa3mBEjgwCMbyYVSMJ+znY4RBjQd6PwZCAcF5WGrL9tzmaF
	 2ibsX4P4xIZRBwj7lJy9OTauXzcsPukpOFI3U4ScKkAO/8PZ2y76J4pkocP4VGjrRoEvt
	 GdIBhU3Cg57RPPGIYz8cnkevPIDPAO8owBZJ9X1Agg0g81dpfToBbxbBoCrKEveqIwajV
	 w9KkV3oQTbFyebxpbZUev9PONfJXzo23Pk3X7qwrsZpXA5Kw76Di0TT9anUA2CxW3hU+c
	 aLa5Ir+vIpmDTKfU1ExNLEGpv9DNogqvPk7VxnGMPqYxI2p6vDxyzOWn8aXAg3okn3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4mMmrRA7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.31
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C9606A32A;
	Fri, 20 Nov 2026 11:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4mMmrRA7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJMNsTypYRn0KMUAq1G/H15u2jTOEt5jlJ+5JnsSCKva4SzhUbZaiPkvmfRcRpth+qJ8fdUVaboONiw+jEVgZiYiqS6VVajjrERiXtka+XLICIXz4FyfEvn/zG5rquabQ6xa5sfEaK01c9n17ifeQH0YdA2OQHU5bOZnvSbCmhU1R56Im68xjdn9WZ1eqVod8KVgSpHC0ISjGU5umJHWOuW4sRF0+JIk2uAhf0VL6gnkl9H4AB8qTSVPUzdpl3W6gXsZLA42SHeyZbxPuBLKQc2eYQa5bE9vOAb0gOwLHvkhS0/Xa2aZztYxLzeR9CIUBIQGCi3PLoZvUV+E/SNpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kqSB7gYtIU39EqOKcoNyONxEkdZXtSzm+zChb+W0To=;
 b=ELQRhNgi0pahnYpdZWe+p/U7E2hQyHixpbXqkJMuIgLF8cPhkkAWtZOMtGZdH+itdREcdNFJZF6Mg4zvFx/24ObM0GERvuslCO5tB4rwZzXr/ImkptKhxVO+FZ+PPIvejZfMKrIEUK4077X5BMQ1oDTow5VF4MlhOastCtJtzVhZB/CvEFzuagGI9UkNOGZ+wZmCTZjF2tFuh1UwaEh3zgmRIJNEGmAa3On8s0F5kpB0uA8U2WKnKFzGqXsKyY/xBDPQUG6w2W/KUIlJJu5nTM+LDbLNIxIjxAb8+nefnx3mHVshtbVi8Xjif7f8QRp2VAJMSJoVkZVKn60Zk++ckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kqSB7gYtIU39EqOKcoNyONxEkdZXtSzm+zChb+W0To=;
 b=4mMmrRA7/WC3bs7Z7KzWa8m37apuR+0XHyO6/jmndIgLhHqgnbFJ4w52PZW+gGQFh4lkVYlsMwj3rJ/cncm57OehTE9mZonbziBDV7eSME1/00dd9QJQwspA8yRwbDWNoy8gxR1Dn6/tOjey/rjHoLtFDylqXp4hSShVg/+eFjA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:50:33 +0000
Received: from SN7PR12MB8817.namprd12.prod.outlook.com
 ([fe80::2315:726d:7ec3:416e]) by SN7PR12MB8817.namprd12.prod.outlook.com
 ([fe80::2315:726d:7ec3:416e%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 11:50:33 +0000
Message-ID: <f17bcfed-9b35-4f87-bf3b-c99fb823c0b5@amd.com>
Date: Fri, 20 Nov 2026 11:50:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] sfc: create PPS workqueue before registering phc
To: Alex Austin <alex.austin@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org
References: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
Content-Language: en-US
From: Andy Moreton <andy.moreton@amd.com>
In-Reply-To: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0666.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::17) To SN7PR12MB8817.namprd12.prod.outlook.com
 (2603:10b6:806:347::8)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8817:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: b632ccd1-49bd-49ea-7069-08df46fc7bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261009221227099003|261009221727099003|261009223327099003|261009220027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1226t9FPhWvyhm7fvHtxdEKId6EZTraFD/xj0TqSIn/D6txwogPV7pQZmU4jZDJ9aar41UVjljv+mUgWQqM8Fr+F/5Kkfv+Z75Dg/SCxLvD4BzfSP62QFhylcrERy6c8Ev1eW2w5MwQNbOJePRWDgIiyaW1fWwg8eOokXGQtmeIF+74L9nrHJdovekP9XMkYjq24iNrUPLeGTOr+eRULYCXl5n+xDGjmT3kpNA9I449/mwF2n0waApfPXgsiPS+/OHlrvOnW/dRrgVBMyNf3ApDeCNMAjxV3txxOYMnc1FVw/A75XhnsCLEQoJ5/wH6xnxpt8TqjQ69wAfZcbxwU8DiRL9c57O15bCdbEPW8GOwcynuNUP914aMIDEQa4+vs3OPGmRxare6PjoccJAvaBecT0W3eKRU0+l3rMicyx7AyzZxhiut6+njUDiMVofKF7EWEgGilIRwg2oxJjmBO5Fr0s3tfCBUjULNL7z315faRJcgE6xpTe9g74ZKZhXM8i/B0Uru9wdo8NJD3YuVWljD4b25n4lUEdfTcY6c7nGkeFecWjhoQJjg0rUF2vK07iBBmzS9DhPn+7+BOKKfg1+x9o5qOaEaviaYAYzceJJQjisW3NemqWnPqPgRJhJIdR7yBpqgxE3ZhgWNs9KopWQWd5g5qwEJgjdPg0eMzaoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8817.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009220027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFsbTVEc3NxenAvdXUwSlVPOVZFWWc1M3VnYVZPQjBTVFlHaE1saks1czFy?=
 =?utf-8?B?Qm9yNHFsODYzNXFybVI0bkRDWE1leVhmalVZSW5VR2R3UURlRzlvazg1MGRV?=
 =?utf-8?B?SFJlSXpNY29WWXFGaHRSU1MyaUpDZlVRZDFyWW9FNFZBMGtQYndpVHBYeDBo?=
 =?utf-8?B?UTVXNTlSd2Y1YVJCOE5MVmZBR2o0Z1pZMmJ0WnJzU044ZXFMUGluVWpjcisz?=
 =?utf-8?B?eGNlKzRKSitIcFpzb0w4eVZrNnVaOXdIUldobjFPNyswc2UvQzQ4Nk5venV1?=
 =?utf-8?B?VXJ3NDRnREtNUmpLQkNBWmNYeFlSTThRa0xFbVd3VEZZSDJwRFBDTGVrZDFk?=
 =?utf-8?B?SUc0YSt1UmE5OHhabitmak5GOGhZZGRYa1VHMWd6MzRxbXhXak13RWFjY3Zj?=
 =?utf-8?B?RU8va1grZnBiQmxtNkJaSWkvMXA3dFVybWdDa3Fma0RLYjlESDUvMXA5Qkp5?=
 =?utf-8?B?V2tlK05McC9JM1ZjVlQyaW9qeTdnL0VuUGh6L3ZIaUlwNWdoWmlHSkVLWlJp?=
 =?utf-8?B?U09aWGZuams3R2VNSFhZQStIUzlYY0hVemhRTERVSC9QYjZhK0pQSnpqdWs5?=
 =?utf-8?B?b0JOZi9NTCtEb0ZPOW51a0dQcEdZN2YvZ0YvZ1lqR2dydXVsQkRlQWJZWVIy?=
 =?utf-8?B?aUUwWXpSVUY0WHExWENVeTA1eWxXdThBNDBEaTlLVHArWnN5UHZTVytQcXFB?=
 =?utf-8?B?RFlmeHQ3bUZRQlhDY283aWJWdU5sdytEZVk0YU1NTVp6UmIzVUFpY1hIdFlx?=
 =?utf-8?B?YlFpTU0vZTFWdmVOUmRrcVhLTFdJRHdvL0hWL0FhcThMTDZQWkpCSnY5Vk5V?=
 =?utf-8?B?VSs0Qm1TSkFMV0gzc3JQT3p4VEIraitxUEpVaUxZNm1WYzZVVERCby9TT0Jv?=
 =?utf-8?B?RzQwaisxQ2JXUWQwZmVVSmYvd3ROWXFUYU81UE4wczRNNzlnWWI3VDNPSUZx?=
 =?utf-8?B?QkkzTWVBbkRMWHFsbUhlcE5rWDAvcXlpbEh0V2J6dFVWVzA3Wm5USjdMaEI3?=
 =?utf-8?B?MU40T3BzNk56N3B6bVBSdjNVaEVNczlySUJaaEs3T3BnMXFreWV1LzhjNFlk?=
 =?utf-8?B?RVFjSjVYeVJyYXRrRlVzSldDTFk0NzZjRy9vY2g4Ym1BQnJZTzl2a1hKUWtB?=
 =?utf-8?B?TTVyK0pHWkp4ck1SZDlKZ2VHdXpFN3UyZHF5RW1YN1hTSmZGanRzeXFFVFBj?=
 =?utf-8?B?MEdwRUI4UVowcytjWlVMZkdMSlJxVVZqak51bWhtWUQ0bXl1SFN1dHYwTXRz?=
 =?utf-8?B?ckdRVTU0YXdWdFpGOTVVSjBwRWJNamcxMUpGeHdxS1l3aEtjSXJhTlRLNmdu?=
 =?utf-8?B?UVdMeE0rNzZWb3Y2UTlwTHhmd3FycWNpVlVVQ0RmSTZHNHVtV05pQWVCVTNC?=
 =?utf-8?B?cjRYZ0loaE4xWGtwLytaZmxmZjJBRHZ2dS92NXk1SXlyMEZXTXpYMVNjR01q?=
 =?utf-8?B?WHJtdkRYYWhIaWs0ZGZRRjJ0SklkS2V5dVVVcHZhM3Irczd3dHFkcE5Ea2ZT?=
 =?utf-8?B?MUxYeHpIdllQcXI5WlBNYkx0ZWF5bXl6S0FVdGRheXpGS1RKM29Pek1tUWNV?=
 =?utf-8?B?OExhc3g0TncvWEdIS3pRUVNPOWQ1RDdqK3JML2RrbExJSnVBM2U0engrOFZE?=
 =?utf-8?B?am5iVWkzdms5RG43M0RadGpUdlM2WVNWaVVacW52ejVMZk1kZzJwcitzNkJQ?=
 =?utf-8?B?V0MvMWNJOHBIMXVDaXpvMDc3QmxKNk14ZUIvUkFJQVRCYlNHUXE0Tyt1ckQy?=
 =?utf-8?B?QVpRZVVkOHBJODAveWpwc1IzQU4rN080eDhubU9oQmlsT0ZFbDJPYWxvZ1VO?=
 =?utf-8?B?aWJHU1d4Q1kvM1k2aVJ4bjhHdzdGKzJPcWJCUUVubUIyalh4Ungzb3phVmp4?=
 =?utf-8?B?UGcxci90VzRlUm5rbkZqaysvNkhidHNpd0E5VGU5WUtkdmpkc3BvWnlsdmxK?=
 =?utf-8?B?UVIxeG90TE1zZU1iUlFQZ3k5Wm1rQTU1VHdyemxkYnI2V1JHaHBlZFZ1YmlJ?=
 =?utf-8?B?bm5MTUl5UGhIQ1E1ckFsYktGNmVNQkFyMnhLNURUM2NhR1NBNlVZd3BQZWlH?=
 =?utf-8?B?K2tnNjRjNVhjalRvN3A0VHIwdWl2a3N0R0tYZnJhVGlMeWxKR1lhOFJ2TVc0?=
 =?utf-8?B?bHppVENOVkpHdk8xMkVBeHJBblZhVnhJVXBFL1pRVUpMR3hUT1N4ckxYbTRr?=
 =?utf-8?B?cW0vS2NsWG1KMnFZa0g4OEFCZEhPZEtER2NWOVAvQjhUekpZZmNJUzBpakZk?=
 =?utf-8?B?OHZ0eWl4MTY5U1h0R1h2TUVXT21qRXNlWlBqS2lkQW9EUFlUZFhFOTRaVXdR?=
 =?utf-8?B?cFQ2VFZRQTM2U0lyNEQySm0zdG1uMGttTjMrUmtFOEg4b0ljeFlYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b632ccd1-49bd-49ea-7069-08df46fc7bb3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8817.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:50:33.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3m5OtyEtPkL3LARF2xoNJh1cTUlXOqtPS5GgqY4VzOBSjGRvCUtlJQGBcDVdNtUYk1Rywj677YRK4Yqz9tURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715

On 11/20/26 08:44, Alex Austin wrote:
> Registering the PHC before creating the PPS workqueue leaves a small
> window for PTP_CLK_REQ_PPS to be requested and a NIC generated PPS event
> to arrive before the workqueue exists. Create the PPS workqueue before
> registering the PHC.
> 
> Fixes: 7c236c43b838 ("sfc: Add support for IEEE-1588 PTP")
> Signed-off-by: Alex Austin <alex.austin@amd.com>
> ---
>  drivers/net/ethernet/sfc/ptp.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
> index 37511f234d76..ad6a4e7d990f 100644
> --- a/drivers/net/ethernet/sfc/ptp.c
> +++ b/drivers/net/ethernet/sfc/ptp.c
> @@ -1633,26 +1633,26 @@ int efx_ptp_probe(struct efx_nic *efx, struct efx_channel *channel)
>  
>  	if (efx->mcdi->fn_flags &
>  	    (1 << MC_CMD_DRV_ATTACH_EXT_OUT_FLAG_PRIMARY)) {
> +		INIT_WORK(&ptp->pps_work, efx_ptp_pps_worker);
> +		ptp->pps_workwq = create_singlethread_workqueue("sfc_pps");
> +		if (!ptp->pps_workwq) {
> +			rc = -ENOMEM;
> +			goto fail3;
> +		}
> +
>  		ptp->phc_clock_info = efx_phc_clock_info;
>  		ptp->phc_clock = ptp_clock_register(&ptp->phc_clock_info,
>  						    &efx->pci_dev->dev);
>  		if (IS_ERR(ptp->phc_clock)) {
>  			rc = PTR_ERR(ptp->phc_clock);
> -			goto fail3;
> -		} else if (ptp->phc_clock) {
> -			INIT_WORK(&ptp->pps_work, efx_ptp_pps_worker);
> -			ptp->pps_workwq = create_singlethread_workqueue("sfc_pps");
> -			if (!ptp->pps_workwq) {
> -				rc = -ENOMEM;
> -				goto fail4;
> -			}
> +			goto fail4;
>  		}
>  	}
>  	ptp->nic_ts_enabled = false;
>  
>  	return 0;
>  fail4:
> -	ptp_clock_unregister(efx->ptp_data->phc_clock);
> +	destroy_workqueue(efx->ptp_data->pps_workwq);
>  
>  fail3:
>  	destroy_workqueue(efx->ptp_data->workwq);
> @@ -1702,16 +1702,16 @@ void efx_ptp_remove(struct efx_nic *efx)
>  
>  	cancel_work_sync(&efx->ptp_data->work);
>  	cancel_delayed_work_sync(&efx->ptp_data->cleanup_work);
> -	if (efx->ptp_data->pps_workwq)
> +	if (efx->ptp_data->pps_workwq) {
>  		cancel_work_sync(&efx->ptp_data->pps_work);
> +		destroy_workqueue(efx->ptp_data->pps_workwq);
> +	}
>  
>  	skb_queue_purge(&efx->ptp_data->rxq);
>  	skb_queue_purge(&efx->ptp_data->txq);
>  
> -	if (efx->ptp_data->phc_clock) {
> -		destroy_workqueue(efx->ptp_data->pps_workwq);
> +	if (efx->ptp_data->phc_clock)
>  		ptp_clock_unregister(efx->ptp_data->phc_clock);
> -	}
>  
>  	destroy_workqueue(efx->ptp_data->workwq);
>  
> 
> ---
> base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
> change-id: 20261120-sfc_pps_wq_fix-2ed4ecc4c345
> 
> Best regards,
> --  
> Alex Austin <alex.austin@amd.com>
> 
Reviewed-by: Andy Moreton <andy.moreton@amd.com>
