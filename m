Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795517192;
	b=Prep3WZ/mw1T9nuFA5o3TcmUZBd8Wqa+AP0Tve8mSz5IxbKv9w4nk4dGeD4020SdU3uP
	 Uhn0JDKdX2ntKKUXGdfPSlKxCTrWCr36wQNakEieoqKszRhK/UybMLkWDXonghJlJPs8b
	 m2nkLOLcWZgZIhKa2nDBmzUPmlRJH7G/yS1YcYhAAV9y5pJ/SiFBTTuhK41d0QD1Q9F+j
	 KgIbzRf1LvkI2kbK6cpGPTTlL3LTOrHJKx4YcnkxIXGuCGOYPAKA0XrjU3EpB5fKfOAWC
	 o/wmRLAuSnW65dqmPx7wG/YPKv8cZA7DD1NHwnrkSlTcoJ3PMujlrjsMzxUAkGID1Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517192;
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
	bh=wSfNztIByvypQ5Mvd3GIkaz5yrAqS0pSK78Q8OnXweQ=;
	b=NQOkMwY/4OfAOvWrgAenPTVLLZSaa9zKU5Oq+m26YX9jkXY8CrRhxEN3TTqFdJIDxkXd
	 tR60tg0RRH4XmnyXAU/2GC3sbSCA6x4BMUfh3N7CLnDh45r68FNy6L8DsHX8trVK68pGw
	 aafh4x/v/wP3JzV0NDnr0hbbu+H3wDLnUsDWuJJ6PxeefCq6knld7ChgQ+VanVRuYWF7u
	 HOztVhD2mKmUy9rYqGrjTIgDaUmTbsGsxMzsOYUROmJeRokl8R/SlPSYlSkChLD9nTooy
	 tBTSuQLw5arupx39Kq7vKk0wlKhuY2C+Av8+tUbTbqFI3V3VEgE7kdqil0PIQRdDJKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rdmncuWx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE03606A327;
	Tue, 24 Nov 2026 10:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rdmncuWx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLC1CUMZrI7WjXKXOWoPO+8lU2Gqe4c9jX3iMKbLFZPpf0BqChF7ZMhWXCNXRAYFJJKQKGzHMCp+qeW+Dbip+I28ZjkQrwxiyPl/bRmKM1M0+/6upgyZBf6QEL2zUOC9ZZgETDevwpd56MZ2UkXLC8kTScSpcEY3ftg0XASvHWNCf4bsQEMs/xFjznSfmZqyLoiyl0hb/Ie3cYPazf+QWCmsfI8iwPrfiiv5wvMMkbyDqfHoJ4kBcXjkRYdCxmE6eprMWwMcrE0U4VEuub/bi4QHOsg3kPNHnblM+y/kILX3NtSsIhZJQ31g7Uy7IxkumdJQSppsQbN1Xd9YwSTTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSfNztIByvypQ5Mvd3GIkaz5yrAqS0pSK78Q8OnXweQ=;
 b=ZVuLj1YjFSzrRpxrwlpfYMU4pqojrlMRi50cCNKTEkn405SLAP2Jd2rD/sPO+kYKTvSmDZrs36pBGrgdPbWBR01iH7qQnmRvH9TbzYJunlrgbBSA1lsZNVvbrh5TDDF9gWjY/NxMca6JQgZczv6SbhH/fKkDoyQ6ZQTzjxhCasnq9ItlB8zcECwFZos0upXhktXHF1cbSTV3NT/zk29piNRtbdDTGEMGzDEahLCS6OUHTbhp+KhX63cETg+lDTGfuPt0WM53XM8agDjIUPnCleyhVQ/kRj3tUO1DpdvPpMM9G//gsf/lZaf7z0HDccsPt3K/D9Suu6FThoRs/FF64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSfNztIByvypQ5Mvd3GIkaz5yrAqS0pSK78Q8OnXweQ=;
 b=rdmncuWx0bxrp+iSEIjdoXfNB58eEzA/hW5UwnUUD/yf9zRR1sNzoEiXhMXNVTVzdUuelikmzBc7JD4KGjEu7W4yPr/aZ6QMc1s3d6bnE0rIJPuU5l8ndB9MCS5Lt7vDNUn/CzFabiP3eDB0rQ/sEeY5f1vEJYSO3HaZLgC6IJqGU0gnynljrjV9jmScCQSIQ7bCW0LQXfgtat8SUUChzGbkLtu8O791kS1VYyI2Hivvh5LUYKSGqFmUq4/Eg6Vnr2Hstb99kXVzNyf0amyySAsrNRv3/Xbtxywn9URGl2FEBpZ7x4e7j7yIepv9myWGe93LOvAJHwPUFvFXT6Q4qQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:46:27 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::2815:8a95:1a44:be1c]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::2815:8a95:1a44:be1c%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 10:46:26 +0000
Message-ID: <1705274e-5218-469d-a84a-870756b4533e@nvidia.com>
Date: Tue, 24 Nov 2026 12:46:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
To: Paolo Abeni <pabeni@redhat.com>, tariqt@nvidia.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
 daniel.machon@microchip.com, Jakub Kicinski <kuba@kernel.org>,
 Joe Damato <joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
 <95d49bf8-21b3-4ea4-961c-d5a229995829@redhat.com>
Content-Language: en-US
From: Mark Bloch <mbloch@nvidia.com>
In-Reply-To: <95d49bf8-21b3-4ea4-961c-d5a229995829@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
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
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fce3507-841a-49b5-52e1-08df4a183084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|10067099003|11063799006|56012099006|261026140227099003|4143699003|261026121527099003|261021121427099003|261022105027099003|261102123227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LMloZGd0sVAsbB7+VmIV7FJOlPL9RClr8aTTRGlYudrCAwuWOB6QiU9txdXJFPMWU63FCt49mKY1vE0jTRyBZLgD3rzxu/l1Wt/FZe3+gPqOE03AAxsiXCsNYenZgfSAjMdfRV1lGJkKj50WOSfR8sYvshhU1tXdKB2bdSjwxaCMwy1mc+KSn318IUfnOvr1+5/qfLOt5/Q+SXbVGkwsuG18MApsLu5SSSfsVkHOj4oZLJNPiIQrCXLo32HSfTSuB3tnPIU2ht61UHZQLMVA/MB1cWzUkhTUhcGOSlF4wd1seZkC0Gy4mCG02ZDI5Qxwf1JxwA4Qg6W00zV8aaZBiyCXNE3CtCWR8BTinZfMdTXaWeCtJ2ymqNUGswTfJsCMJq/JEodJqF2L/CvI8t0spaGD5+eWAe4dWmja0F1wR0J7SSYVkmucUjAfeed0Mc22kmMN5Vvj8KcpeGyUvPRyZsmcDtT1f5LkCAJzf9zakMYtyo7irIbYStNFE6vA0J+RNmzE4WEz1BKywAwfYrzoAvosOmuflI2U1yK7jFtxmTjLGfytmdyVxJzmpo3Vnb9tuvBtufQZaRLtiB6AjCzbESEJazxEfvGoKxnklsKlMmujfrBeMCdnoSJdwqC62/qCKrvLjfaJXuKMKI9TzpAWoBTWxS9lNObPN7+wiM+kRG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(261026140227099003)(4143699003)(261026121527099003)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlM3Z0VBSElaVUszYzhUdFNNVklQbW9kb0hNVi9oRUF2VmhhK0paQ2oxNnU0?=
 =?utf-8?B?SnowcWp4N1RTcHIwMC9WaDA5WXVPWlBFMzRBSnliWUN0YzNsb0o3ZDNZZWdq?=
 =?utf-8?B?VnI3cWRnNGhibkZyT0QwK3JTcUFYR3phM2JXcmdJdmd5djVpeFl3OFhaUW1y?=
 =?utf-8?B?T1lzWGhxSXQxQ1RsdzlhQmtHd3hLWU92dnZmSzhhYU80OFpSd1o3OTdMdEJB?=
 =?utf-8?B?ZlpQVHh3SFhlMTJMWitBbzJDK2ZGSXVZOVJ4cnhiTVJsUEFhNzJ2YnNFLzdO?=
 =?utf-8?B?ZXpFWHBjSFYzbUJqUlVIQmppYUQwRUJQd2lsenJ4Vys2MDNlQ0JsampiUHkz?=
 =?utf-8?B?KzFzMzNWRWJkRkU2NlFqaWcvQTgyZmZaK3ZCWElJZm9ucU9QZWhOR3lMekhh?=
 =?utf-8?B?ZHE2SGZMME1SVFVxRnh3NktTMCsvSUFzUVphRnJ6blNSRVpKckFYTmdKTGJz?=
 =?utf-8?B?VXZBSEVwZC9qd1IwRER3cWExZk1HSGhPR2UvOHRDMEFmWFhnZFhCbnpWM3la?=
 =?utf-8?B?ZkxHUUoyckFGakhFZ3ZNRGloams3ZUMrUDFGcFZtdjh6UnpOVWMyVk1ZZEZJ?=
 =?utf-8?B?eU5hR3lRR2t3U25NTTFzalRvOEx0ZlIvWUtUR3c0VDlRb1orMkx5THRNVlEv?=
 =?utf-8?B?WUVKamZCYjVWWlQ1bGZwMjZvdHVxaEhZVUNYQVoxVWdKVkt3aG9uYmxHOVo2?=
 =?utf-8?B?VFE5UWtsZjBKNFRiSW1yLzhZWFZua2dpYm8xOGRpL3dEMGpRQk1nWWVzRW4y?=
 =?utf-8?B?SGlNdjlNZHdaKzFMZUg2R0htcW4wajFWNDhmNzN6akdZeGhlL0lRODlkUVBy?=
 =?utf-8?B?VEVlQWw5RmtjVG1vU3pZazNNdFVvVGhkZitZa2dobXlXSHNqelVQSHlmRGdP?=
 =?utf-8?B?SjFBSVFleHY5R1Q4Qy9ybGxqRVJUbkZmM2dtSGNYYm1DbEtRZlhCS1hrR0Fq?=
 =?utf-8?B?WUdLcUVDVnpsSTBHejN4VVY0YVd4ZXl5QmZrM3ZBdkcvWFZrZjQzdUhORjFV?=
 =?utf-8?B?UGxwblM0YVdleGhxQWI0MUNNZXpTRVNzc0M2d1ZoWm55K1RVcDM2L3l2NmtQ?=
 =?utf-8?B?VDRJUzBxQlkyZTlmdllFbnBhTnZNVnpSay91dFJBemtyZXZHRVJ2RXI5T2hJ?=
 =?utf-8?B?TkdRYm15M1VCZ3lGQ1RXRm1pVCsxWFJmc0JqU1JncU1PaGNMWHI0Ni9JaGZa?=
 =?utf-8?B?b0wreFc1UTBqV0JnY2RZdm12enM5SEx1emZKelc5cFZQcjNmdDZ2cnU3Y2Ny?=
 =?utf-8?B?eUQxekhYcER6azRvTVNGNzNxcWtXZTI2cXZ3a0RpQkZiOGQrbUtTbENRZk1Q?=
 =?utf-8?B?TUN6Q0w2YzU4M2hkbm0rTDhSZ243RWswYXQ4Ulh6RS9MUlQ5NTFkRkVTckhr?=
 =?utf-8?B?TVpWaE1FSGF2eW5wSGR3VURrVCtDTXRiVjVxb2tXMldiY1FlazN3UkQ1Z013?=
 =?utf-8?B?NC9kN3VaQ0Nhc3ROdDBHRk41OFNaL29uRE1rNlZwZ2xsQXljNlVUYU9qOU1h?=
 =?utf-8?B?Z1VRYVh6bTFvQ2t2ZmtjdkZzTmxUNFNoMU02dXAwVllkVkthbVRKRlM5QlQy?=
 =?utf-8?B?UHQ3RWRBdGFkRURFaXJkRCtMMG9XeithblE2RmNXclNVUlZ0a2RNeWp1bFkr?=
 =?utf-8?B?UU5ORGhOVTJPZmxtZkRCZnJYQkljWXo0UGtLanpPRDBhNDRiNGhTeFVJb0R0?=
 =?utf-8?B?TkhtaTRVOTVLOGhEQ3ZOdVkwVmp3Vm5RUkpFb2U1WkpoeDFORHJTNzVQanJU?=
 =?utf-8?B?aW1WdXNsMmJTS1E4WU5TZklHMFNUOU4yWHU5dmNySytCTkFlOHVqSTdBcDBF?=
 =?utf-8?B?dEtzOFQ2TjVSR3pJM05EaWNIREhyRkVIajdNUHZNb3B6SE5JNS91K3AxZ3lz?=
 =?utf-8?B?SzEwT1FHUTRWZ29RRnZvVGs1ckIyM0RISkpVYTl5aElYb3l2Q2FGQ2Z4RXVY?=
 =?utf-8?B?N0hIUVBQa1JFbkFJSnBUYmF4STIzbFlFVlVjTGNCNTlkL05Ldy9Wc1ZCcXA0?=
 =?utf-8?B?R3R3ZTZBYVJ1STBJcTVJMHFnNytRZW1JdEJDa1J6QzlzL3RtRXIyY3ZYeWU3?=
 =?utf-8?B?ZHo0Y2kxUmp4aEZLb2lVcWZ0QUFVOXhNNjNpRy90RWptd01sWVJKRzJhWE8y?=
 =?utf-8?B?bWJYTUtSdzQ1Nm9WeWFlajZHY2tZL0UxMnVkWG41SHEyMUI3cFNvM3oxdnNP?=
 =?utf-8?B?cXl3enJzUVo0NDlzblhUTVJiTWQ2TnhaYnBMaU5XVzlHcUlLd1h6eTNmYno4?=
 =?utf-8?B?V2k3WG92dWo4dDhnMWtncVA1QzhUREFwNld3QUYybWdHeXV3b1o3MlVwN0M3?=
 =?utf-8?B?ZDlEWFErVkR4OXEzS1BRYXpJbTY5bTRScHo1U0drcVZrYXpwMFJOQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fce3507-841a-49b5-52e1-08df4a183084
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:46:26.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Pbulxths380nX8hDA00/WnlPbqj2UIhL28okUa4vnJaKfH+b1B7oas2ouhLrRSyy6FmCRFko1QNV3tAEv1l1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371



On 24/11/2026 11:30, Paolo Abeni wrote:
> On 11/19/26 23:38, Jakub Kicinski wrote:
>> On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
>>> The only fix in this series is the deferred doorbell flush (patch 5), but I
>>> need the other code (patches 1-4) for SW USO support I plan to submit next
>>> if this series is applied.
>>
>> Not sure if this is what you meant but this may read as if you were
>> sending a fix for net-next for convenience of sending more patches.
>> To be clear - that's not a valid excuse. That said, here, we're talking
>> about a 10 year old error path bug which nobody apparently have been
>> bothered by. We don't have space in net for such things at this point
>> of the cycle, anyway :S
>>
>> Tariq, could you ack?
> 
> This is small and clean. @Tariq, any special reason to skip this?

Tariq is OOO at the moment, he should be back in a few days.
I've looked at the series, I left a comment on patch 4.

Mark

> 
> I think we are better off with this merged; if nobody complain I'm
> going to merge it soon.
> 
> Thanks,
> 
> Paolo
> 
> 

