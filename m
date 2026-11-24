Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795498801;
	b=AQWpm0UAWzr7cP3ykMN5f9B3QAwRJ6r1Dl8JAY1Yg+sO0LIxRnKg4A9yjH5qpq7P3XyU
	 ziHvq//zK0TtPyNxnkiOvrarbmJJUuQ0gL0l6Kg7gj/oJ4afZgUTpGuUJb6nxOenvMK3x
	 hvCrOVU20DUtMskAO0lGYHhrtflrKF9rZT+X+6OAxOwJshbrZ95R0WtXNnhnwpuvU4rU/
	 OHbZI/Iw7KvFsxLUAtjWVJq3VsTtVEZmXN3+cr9K+1cHT8Gn2IGhx3RkMZoL0RLv05gk3
	 FF52m/ELiKmPb7XcbAWMd7/HqOvKP0vvqJyZPIZGP5xxPZYj1uuGiCCHY7bvQQDFZpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498801;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=8ZHJPDD5fSoov7KTfW5acPegyRnWcivq8Jlf6BqsIh4=;
	b=MVVuhkdiol0gZ3bQ1T8vgh3J8MZaiOBPWG8j4/fxAmj4goeOAkaqaWwmAaqm+46OTBRw
	 VsryxD5sOuFTmMJWB753COv0IDw+ogT0xpIziSblPwTOUtXAQKeqyK5V99xabIq5jLVFo
	 LQnHDpqKAxIagZ5FesLEukh9yLMqJamzJd0FBtWbEXYO5mahZnwhfT8/M+IiDANqIX/6A
	 6OC+Buk3SIpbnMu/cAJwpf2Hu1JsoZhGuygAm+lKK0fEb4+1zFb3IoLy+mU1pe2BmF+pB
	 O10k0zvCB0U8PNHZxecEd1pX2bMkFg8xQVvBj7PmCk9U5SaZz9dF3wSIK9Qt3h3U8Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SSgTlVcN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.14
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E20606A31E;
	Tue, 24 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SSgTlVcN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAsbaVVwLsIm77m+qP5hkkgOFoTHyoAiBeAd1iXg8LeN8/2lEe7QH6w80hhe0yamYDZiBkcjsMx4b9+Ww8/+INoRTSrxIE6H1Y4aAKvA9TG2Hb4uNb+HYxykmagFyMJUiHi2M5JxT0x68gBkL4CQB3X6mADwuvDpVqe4sqQkZUxc/lWfQQZTVkSnn8gMtpJkxVc1KQxLyD3N20ixQs05AArBVeIwQ53OCNv1hefOORkCRKa3BV/qpXT0iqC+NDPmuWlmZF5eAKajIJA5LxqsSl1XucG/dEFN3iyZPOIYaJmeis0qWr4E5oXr7RCLlE7RVD2LS0Hv8AUp0isut2WSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZHJPDD5fSoov7KTfW5acPegyRnWcivq8Jlf6BqsIh4=;
 b=gLAVho8EiTyLGMYAZ0/mShtZvNA/geceay++cJSGp5w/+ZjW5RkXu1ycpMbk9+y9S1oR8Q5gZ9AtYv8rJY+pJ0k8cpF46L12zS/uxp+TPdbxtw1g2jzDc+/tjDhyOI1ScXl/2V75htnPlbdc1uAw3TnTBlpJttGPJaMUOiC04yHLJjTjv0woTU8ln1Mz5E5rnDUfUGf4OerqKrg32Kroc6tyf6cmZYw5v6YZ1bD65Dmz8Dx5IehdgQHSZ+3BaGvHQLTWuOQN7ase0pWRURhDHlCwNsJd7M3AHEWEoehnf9QOu/Q9HFUXtS90Xz5b76ACSl8vqZZc/RRVzc8nBouaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZHJPDD5fSoov7KTfW5acPegyRnWcivq8Jlf6BqsIh4=;
 b=SSgTlVcNk1qMP8holDbJLmC9xbtnPq9AWIUfidtFIS0cKTB8i/g25z9e4tLRuPWPsj01ld48gG6QANe7jm7We3/6xDLbK07wWJys3+tpPZortg/4UOUHki1m4RVBmwSl0koIT/MOE41LEHQMjLtyf32jXOUFZgPeRuQGAKHkqKk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by CH2PR12MB4088.namprd12.prod.outlook.com (2603:10b6:610:a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 05:39:54 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 05:39:54 +0000
Message-ID: <6415aff7-1c19-4e55-8aba-6df97d68dd48@amd.com>
Date: Tue, 24 Nov 2026 11:09:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: xilinx: axienet: Derive RX frame length
 from residue in dmaengine path
To: Srinivas Neeli <srinivas.neeli@amd.com>, radhey.shyam.pandey@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20261123164251.48234-1-srinivas.neeli@amd.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20261123164251.48234-1-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|CH2PR12MB4088:EE_
X-MS-Office365-Filtering-Correlation-Id: 906fe054-e903-4f73-0897-08df49ed5dc0
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|56012099006|261022075727099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lg0N9QQx+jirZNFa0nIMZTqOSCm39uaxLLz4ZkG1wLTDEjvORuG7oFefofO4BJ/6qObN6x4C6rLLm1OdBsEfYiE4RxN0iS7XrvCE/UEBH0G1vu6QdOL3vhmpBI8Czd8Z5Z8eAT0D6JlGzhBzUnn8cUHS0/fwLYidcKl5ouyBo02yD276n+Svd6cOfwONyG3GbmVGKcYAJ1qdDi7RJIl4mFV3HnDPdBWSIwViPyP5eDm5qQ8QhjT0sPL9GQ34gCp2cez/XU5kwQFRZHL0YPkNgnBzpxttSnxeiLRNLkTIFPO3Iv0YyOHz/WR70bStFzGiRWTBT1V1BeiyV5Bk4TpJ5f6LNIRGZ2BDuoRCKvsn2QA3XpXYn8sz0riJ4XW0i6CDWl9PuZT+OvzIg+sxmWTRJaz1cSQqqXD2dpwpic8vMgtte7pTM1P7DA0F5lAFBpEIUBEFjVLPBJHWzwXzk9RgAY/+5RPQ+WvtS10pNOUcaqwzOXIYQJwHstHVEtQ+r8Mrl6/8DcRq2xnpbzYTtPb243+j9wLL86G5jp9t0exeNRr///4dKRff8it0wdHi0SQvSPKlACvpUjAPh7sqEFBVPTo+ifssdmrP5uEVDM+45M5X1bJAF9+IVAWV9R9SehaG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(261022075727099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUJpS2RaYXQ5MTJONU4vZ0kwdVQ1RzhKbW1wUEdiZVJZS3lmc0ExQTVuMWlh?=
 =?utf-8?B?NWZxbzZENk9vMGFCUjVjS0thNFRPdHdiT1NDcVdCbC83TUVYSFNoU0VBU0ZR?=
 =?utf-8?B?K3VJTVgrSG5yaVdtTDdPWXFtcGxMZmZHellJRWFML1dQNENtTzFINVoyTWFB?=
 =?utf-8?B?OFdzb250aHYvaFVvZ2t3STg4UGRvNURoU0hhaFpCemNQcnZZREd4ZFlzcjVM?=
 =?utf-8?B?V3p6Sk5xeHg5SjBJaHNwL2lETGQwQTE5ZkpxcGR4Vm10QVk0Y0pERmQxSW9j?=
 =?utf-8?B?aXhtSXkwQmRrcVpBa0ZiLytUb3RwbXdQbHR0Y0NxZno5R1J5YWlGSzdEdEkz?=
 =?utf-8?B?RGtBUlRBeGxpUlB0WFRTUnhNTDVSbHlPRmVNSXZ4MTJGa1F4Q1d2TWIyQUJP?=
 =?utf-8?B?TWZzZGxWUWZUR1NCd2FXdEpmTHdRbll2QUNmVFdiNXVEbi8zUnpucjBWaitI?=
 =?utf-8?B?Q0FzbWhoZ2hCT1UzYVduMG1YQlh3aFh1YkJiQXBrQTl4NWNLVGszZURoQ2wv?=
 =?utf-8?B?cTlaam1Vd2swREJPWmhiWVcwT242WHZhVElLVGUxQmVoTkJjd0d4NUpzOWgr?=
 =?utf-8?B?WHJJeXYxSWxFcHB3YVVMUE9KaFFVUDc3QjRISlJIYWpDUUxrRk4xOFR5SGVp?=
 =?utf-8?B?UWxyWmFiOHBBMlVmVDFrK083YUdhdzF6b3dpR2ZDcWVBZHF6NmEwNVJvNnFz?=
 =?utf-8?B?ZzNJNy9sZG95c1IrTm03Rm9HZ1lGdnE3TTBxWjc5S3VscXMvcmwxdVpoaHlV?=
 =?utf-8?B?ZkdjcjVZZG5QbnZvbUNMQUpIVXNoWkJCZlVRWk5iV21zTFJkMi8zemVHdlp6?=
 =?utf-8?B?SW8ycHZlNjBhWXVYTXZDR2pyYjN5Z1JaUnczQ1l6QkgvMXk5Sy9aQ2dLaFZa?=
 =?utf-8?B?R1QzWmVHeWdlVHBZNEtLMWgxYm9rcWxDOFQ4a1NyaHprbitYb09FRzNDRm5h?=
 =?utf-8?B?a3FjdEVRSy8wTzVid0xpbHA5TlRFa2s0K2crR1BJdXo3TnM1dWFDMjRCd1Zv?=
 =?utf-8?B?NjBnWURtNHluL3E0UXZDZmt2cmY3d09veFF5TDd2NzRxS1R0WDVHOHZMZ2Fa?=
 =?utf-8?B?c3ZIZ2lLTGQ2alYzSzZSbWxvYkVpZWd6eVQwcHlXa3BqVmVOQm1ObGd5MWZ2?=
 =?utf-8?B?QWZNVEpjWFdONlV4TmFjQmkyQ05IOWRuS2NGZVlYRkxMVVp2cTJSSXU1a291?=
 =?utf-8?B?L1ZONHNyeTZQSHZmV1VhYVpsc1lqMGwzRzZiS3hJTjJwQ1huT0xGY1pJRGtk?=
 =?utf-8?B?V1lJb0NZL3VMckd1RGdyOEcrTmIreGtNWlBvcUlmM09OVjVLMkNWVEpVd251?=
 =?utf-8?B?bnRwQitlWTIreVZiOFZzRi9IK013OUpVeW9kKytXSTJzUEJSNmhhSC93OFRm?=
 =?utf-8?B?MUs0aW5XTnVTaGJ3QmZEakNVRzlDS05Pb0lRY3VaOVhucDgyanUvN3V0bWky?=
 =?utf-8?B?WitWR3Q3ZGJncmlHZnNhRGM3cUxSZi92VE9oSDU3SmZiaWs0SzZ4akhkTThI?=
 =?utf-8?B?cXhRTGNtcGxMaEdrL2dJamRidTc5TExjdHBVUHJTbjIzdWdNRS9TQ0M0dTFF?=
 =?utf-8?B?OXJCMjdzT2E4WVVOd3ZmVHJNY3hieWNVUEFYYW9uSVR5d09iZ1k4Y0RYcXlW?=
 =?utf-8?B?bThYQW9WalNxQUY4a0xSOExlOUJISW9FN2wrMEMzcnRra0p1UG5ZbnZydUtt?=
 =?utf-8?B?a0JtUnZBc0ZlOXhncktJNHREb3dwYzNPRlRXTG1kQXhRMTJYOEhVS3NwamFm?=
 =?utf-8?B?WmNvQ0cwL0REUW53T1JDcXcxZm5kbFc4MmdtZERGUDlKZFNFVFd3SmJWdm96?=
 =?utf-8?B?UE5nTVNxZlRIWVh6ajYvVkQ0M2cvVkg4VW1CejlWblpjUWRjTDhUdFJyY0Q5?=
 =?utf-8?B?bFJqaXowUWdKVDRScE0ra3h1M05iVm83VEpiZS9idXBmSkUxTUd3MWF6UzR0?=
 =?utf-8?B?V2hDN1RabnpvazNEVmlpNmdYeGlrOWJqdE45YmZjSytqcndseDhCV3Q5bUtw?=
 =?utf-8?B?d21wUjkrckw0TzZpeFNaNGlVUWtmYmgxYU4rS2hXblBQZXB4S3IzQWMvSkoy?=
 =?utf-8?B?K2VvRkZndnU0RHdqODlyZEtVTlJ6YlpLSzFFOGRubFo1M01aSEo4NEdHUG9N?=
 =?utf-8?B?TEE1a2tKMERIbVVFcUJmSFVxU2dJbW9SMi9ZZDI1YkNVbWJlZHdVa1JTUkhv?=
 =?utf-8?B?ZVQ0M3k0dnZKY0pOWmVoSFllSDRhNlNpb1hQTEZ4cHkxdzlpd0dFSndxR1Jl?=
 =?utf-8?B?ZnBXeDF6TWpVSGVrYWQ0NGdMSlVuYkI0K3pNYVFLL244dGxXMUtTOE0wc2N6?=
 =?utf-8?B?UE5mWWQ3M3YydlZWaEhodk1sM0RMRzFOTDd5TGhhSW0wSFhjS3lWQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906fe054-e903-4f73-0897-08df49ed5dc0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:39:54.0677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTAo7fN2kfAAMLYC5I0KntqeMH1Vz4KdC37Nqrjgt6Ewb5gfq1ze5XM0Kmw4pnYNaX4VU0ENjWqDbkGVzxheoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088



On 11/23/2026 10:12 PM, Srinivas Neeli wrote:
> The dmaengine RX path derived the received frame length from the descriptor
> APP metadata. That only works when the optional AXI4-Stream status/control
> interface is present, because the hardware populates the APP fields solely
> when that interface is enabled. On designs without it the length read back
> is invalid.
> 
> The AXI DMA engine already reports how many bytes it wrote into the buffer
> through the standard dmaengine residue mechanism. Compute the RX frame
> length as the posted buffer length minus result->residue, which is
> independent of the status/control interface and correct across all designs,
> including multi-descriptor frames where the residue is summed over the
> chain.
> 
> Drop the descriptor metadata lookup, which was only used for this purpose.
> Detect a failed transfer from dmaengine_result.result instead of the
> metadata pointer return value, and remove the now unused LEN_APP macro.
> 
> The transmit path is unaffected. It still passes APP metadata for checksum
> offload and derives its length from the skb.
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>


Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks!
Suraj
> ---
> Changes in v2:
> - Refresh the patch against next-20261120 to address the reported
>    git am failure. No intended change to the RX logic.
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> 
> Apply failure reported in:
> https://lore.kernel.org/lkml/20261123140311.GB31322@horms.kernel.org/
> 
> This patch was originally posted as part of the MCDMA series and can
> be applied independently of the other patches in that series.
> https://lore.kernel.org/lkml/20260818174151.1608971-4-srinivas.neeli@amd.com/
> ---
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f193..5b4998e2ca14 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -55,7 +55,6 @@
>   #define TX_BD_NUM_MAX			4096
>   #define RX_BD_NUM_MAX			4096
>   #define DMA_NUM_APP_WORDS		5
> -#define LEN_APP				4
>   #define RX_BUF_NUM_DEFAULT		128
>   
>   /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
> @@ -1219,30 +1218,27 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>   static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>   {
>   	struct skbuf_dma_descriptor *skbuf_dma;
> -	size_t meta_len, meta_max_len, rx_len;
>   	struct axienet_local *lp = data;
>   	struct sk_buff *skb;
> -	u32 *app_metadata;
> +	size_t rx_len;
>   	int i;
>   
>   	skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
>   	skb = skbuf_dma->skb;
> -	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
> -						       &meta_max_len);
>   	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
>   			 DMA_FROM_DEVICE);
>   	skbuf_dma->skb = NULL;
>   
> -	if (IS_ERR(app_metadata)) {
> +	if (result->result != DMA_TRANS_NOERROR) {
>   		if (net_ratelimit())
> -			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
> +			netdev_err(lp->ndev, "RX DMA transfer failed\n");
>   		dev_kfree_skb_any(skb);
>   		lp->ndev->stats.rx_dropped++;
>   		goto rx_submit;
>   	}
>   
> -	/* TODO: Derive app word index programmatically */
> -	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
> +	/* Actual length = posted buffer length - residue. */
> +	rx_len = lp->max_frm_size - result->residue;
>   	skb_put(skb, rx_len);
>   	skb->protocol = eth_type_trans(skb, lp->ndev);
>   	skb->ip_summed = CHECKSUM_NONE;

