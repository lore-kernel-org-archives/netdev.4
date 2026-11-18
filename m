Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995405;
	b=dDo9V8zr/4UlDWd7Qd8ACZA+GnihbOpZecBQlUE+ElfQWvfbXdOz0twpG5DVZJBW+tff
	 6nGDz5asSpCI9OuV2sNFwcJkVrJS1QC9Y9obBEtDQDAAUzc/WiIMP+nI28HLmvN1WHWoZ
	 oTKlt/MVdXbdtqi0Nwe5pkHZUpsjZUxFcmAidsWxmQBHb2sDJUnMZJYR/74nRV3En/26u
	 J/DOYnnR9A1Qpfxw/pHDH8EMd0qcRkNqfGhZGfTL/kifmv3fiq3g1TaH4p36y4WiHdEmm
	 ZTDn2YDUcd2A6FMeQDq5cigKy2y3LEIbRRlLxScBYZsvjLfS8sZrtStShtiiODk6e2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995405;
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
	bh=oM0sjNyLZABFnF30WpHTA5bq8zKoQELGZLum8k5Qmwg=;
	b=D5mG95HmwPNK8qbM+bBWDN+isGwKqbeRhfikCo87mETQHCWYvQYvCoRykL/bu4oJKkp/
	 enrOY/hOFD97Msqy4LvqUAg+7dTIIKpu7nI5KrctnqFFkq0qZoxhP6jMZw0VOwrTDpRcP
	 iP5dSwSnNG9CKZA9gGC1+WBCSFDMaBQoUITH0rkrKQ8oqmba+hgdadmZGg6pR/I2fh6Tv
	 SReThON39oMI/E+CtokYoR9CwD2Usp/GSdBl8uaBtra0mjUE9wABZiamnGTGV+nmdqtWb
	 1OdptYlYcD9U6nIxI6w+A1WBPWcV6A8tTWZ2CulxKkXadYFDdQASyPDUKdSuIBxLgow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FAxRwm5z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.57
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3C606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FAxRwm5z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSbxlF7JPW5fq7EmzjsU2+VijcBKKbD57iizd1otkNwXgMIlRngWDGMA2YdXQxbWVDa/Wsh9NOqzDlcZyHYzmDWdI7r26I15FKRZpgZZMhyt/rwGISjxj9i9q+fP+w35tcWMtCIbOMrw7i7xfmXGs+7mdiM3fJxrG9CHddwLTI/BGOpJVLl+EyE/iD4V5Pnd+JvYRooPktqEsvU4oXaFBVD+5O/Y7HHrd1gUuq54afvMC0Yq4YSv2qS35Mz68HHtSFnklVLuvTtejBYQW0ggtQX8kVIGpfzYK5lZ/9W0aBtB5E2felS0KomNzPsvB4iPjW6X4eQAdoO8QA1i5yT+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM0sjNyLZABFnF30WpHTA5bq8zKoQELGZLum8k5Qmwg=;
 b=Cg6lyXbXobblyn9i/yq2wavMitbyHeD2+3D7bTChpr0mZw1PGeEj9/PFutvVjk+315KhVEIn7R9ThTluvzl+IJXHcZb1J2WrDotmcz6e1OXZ7bWneHjHoS5bc4rda3aOAfam+pjqSWeBh7ClrDyvSJ1eZyOot4jvonsOTYdpw4K+sIHufBLdCvbY3ZwcEAWQts3M6xBRrqR/3vCULaX2c7jc6Ylwc5tW1JqrxEY6UCQIBYxLmWmnyW2qcXb1YQ4S57jbjCzOvzfb5MwjJTAkTClisb9qRDLp/UNrT8oolutHQHXbHO1Vzg87mSW2RR5jIYemRscwPkiy53flZ5mp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM0sjNyLZABFnF30WpHTA5bq8zKoQELGZLum8k5Qmwg=;
 b=FAxRwm5z+Wa71hvxAQRpBhOMUbHl5pSuD/E+5116Xs6jQ1zSocyGzr7fM7hzRPUZU2sT8612B3Ux8DKkKUenAXfrF/HolHWvRAp8/jrI78lCKi+GGIempuHo8ZsMKEUJRyvAa2zInVb6+xoRyqm8Zxly25QLwO+dV8o0I7ZCx5qVDWENZvrSRMEmi0szhVMhTUphun0GQshufDaIWv+2iFDMr/C2R4g1dcxH9CWVHw39+ZZqxRCXcgbbXJnOmaHBLjxJ0VmnP3T7nLCnhhDHsBnDnnVf+rqWb9vbbYwRlf87VDxl7qQrYwlRfoseiJJJZa32tdnz+omoZSc11FBlRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:49:58 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 09:49:58 +0000
Date: Wed, 18 Nov 2026 11:49:48 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Shuai Liu <847807867@qq.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, edumazet@kernel.org,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org,
	syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] ipv6: addrconf: regenerate missing host route on
 RTM_NEWADDR
Message-ID: <20261118094948.GA1097953@shredder>
References: <20261118062828.840641-1-847807867@qq.com>
 <tencent_98F714E924966679E826125C2CB18B092A07@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_98F714E924966679E826125C2CB18B092A07@qq.com>
X-ClientProxiedBy: TL0P290CA0010.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::14) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a46587-82a6-43a2-b26d-08df45594e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|4143699003|56012099006|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mki16DkNXzDKKkBGoLXf3T1tgXs0Xl9YZQK/MQuU/6p0vDu/hU0s5/WFkTJj8hDo5TxBjDd+075nOwKtdGXPzUy9/atQF4mDXcxaRFt0D4qUTBZgZmBATk8iRMKQDIcxYrBKxS0QlSLVZdnHI3UuBL/M3Zjifo4Y99LlsnkuQTbPO/263xjBDBb6zsp8oL30fyKitMlsdkFx8+uZg6zxjfstZq5VLN4Bu5kFMd1Ef6oA6fZACtLt+tA5Mg+Si/lOKE9oyoYUlskY1Hff+x8PObrDjiwWZ0SRLRgNpyxfkQxbpH+/nc1J2q+bIQIsq8U4U0cM4jU7Dl0X6l2mt1SIjvJ7y2n/FMpO4XC+RtJTlrSR5FRD1L4WBuxrpI2TSd0z6Ykf0Q0N/ciVlz9icGNtk5OAXqZqqRVXy/tET+ZuJ879HIG/Dzv+t1gIFAm+6aH3KaqdBsA3BZdQc8Is52y9W5MxTZetW2ujvVDV95WJL06Gc22JAPCzDT+zazRoPmeWVrGpaUnix+AJ/SyqeAO/jWWqAHkiHsWqfBb3wUN88iz2SiQ2hFscRvhmSRKbbzj73sxPMY9Pd1McNxxlUqY/KTshhwUpHoVcC5eJ1yvhtz6qe0Okcczq42owGrylQ/NA0ow2+kLA/tldS10I/Y+2h37VUj5t6B5RoKSuz5DV/Rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURMYlB4d2pFTC8zeTU0SWxGaWtmcFVPeU1aNnhsNUQxRDFoUnRHaytqMTd5?=
 =?utf-8?B?SU1ZTWMyWWNzZ1M3UEFZTW9ZWXBzbzM4SUJEbVowS3ByNFB0dGJoUWtaandn?=
 =?utf-8?B?VCt1NVNhaGptTEo3Rk56TjNsQVVuOEdZMjV1TnJSaGg5OTE1YUFWWkhqUERh?=
 =?utf-8?B?SWptWkgwS1VvdmEwVDl1d3lFZjcrSmY2OG5QM1E2blFQME8rQUU2S2NmbVE2?=
 =?utf-8?B?Y1BPTTFUS0lZN0lEZnVJcGdNN1dZa3FyVGVzTFIrVW5rUzc2S09UUWhaK0J0?=
 =?utf-8?B?MS9nS0s5bGp3dE9mbEo4aGV3NWJ1TTVSRVpGM1N1MVlvcVNacEVUTTgyT2JM?=
 =?utf-8?B?aWo1dXNZeTVjQnN6Y2FWRkZIV1o1TC9ZMFYzZzhXNEJwZi84OHJDZU5nRFUv?=
 =?utf-8?B?L2dDeUNDUmRKMktNU1h1RFdDMDlLSVl5MlVibGZrNFRtcHJnbnRuWGxVbWd3?=
 =?utf-8?B?SGxWU1cxUHZBQjUyVEZiQ1ZORDVnWjVucERrSzBobFNqclNyYmRQV2FuYVcr?=
 =?utf-8?B?OHNycTBvMXF3Z2pVYU5EQVFuK1BjcTFWKzE1bUhxdDdVMXFUZWRINUFJQWVH?=
 =?utf-8?B?L0NaeFAvMzNJc1BLZ1hJaGVUY2wyd21lelM0K0RVV2xrZ0l3RVZNdlc3QVBk?=
 =?utf-8?B?OTF0a1NsVkIzSHh3UVNYbjdPZGxUMEYwN2lIUys4ZDh0NDA0cU9QTmdCMzRu?=
 =?utf-8?B?RnFPRk01dTN1Z2I5TWROZ21STE5Zb1ZMQ1VzQVljSnhQcDdSVVhkNEswREMr?=
 =?utf-8?B?bzdMbHVaYmdoOEhZRDZYTjVwZ1BiRjYrdlptbDFaRnFib042T2pEYjJld3BS?=
 =?utf-8?B?NG9mY3k0VmczRjBXVnNqR3lWdUN1ZUpmaGppVVdxTEFjK3c4Y1NhMHNla3g2?=
 =?utf-8?B?eVpKK2wrTGErN1ZsVXFySC9icVA0cVFrYWxLcmU4eWtMdkFNYVE2YmtQTTQr?=
 =?utf-8?B?eVFqTmd0ajBvTDhsV0w2KzM1UkxuckxNdFl5T2EzOVpHMVZMeDI5R2RTb0NT?=
 =?utf-8?B?U253MElSOUE3Nmo4RDVqZ0lldEdVc2VqRmVSdStISzJYcWVMcXA4OGc4WEFD?=
 =?utf-8?B?WXFsYjBiUytOOFBud1UyNjQ1ZHdlYUl5aEs0Yys3WFVwaHkrN0RxNms1L25p?=
 =?utf-8?B?VnkxdE5sWTJTUUg4ZmVJQ0JxTEVoZUhyWXV6MG1TQ3hGYjhJb1lpZDNTTkJt?=
 =?utf-8?B?Vi9FTjU4MmRXKzV1a2ZtRUlPOGM0aGpDVzhReGZ5RWdKUXpQTVhNNURwdjBC?=
 =?utf-8?B?RHc3ZXBEc2RWWmdnenJFak0xSFpZWm1JSTRIcTEydmNqRDJFSDFsRHRCeTha?=
 =?utf-8?B?MDgzaDB0enlJOTlZMHFEcGpOSkRFMFEwaElwb3l1N1pMcXptN3VNMGd4bEZx?=
 =?utf-8?B?UG9HU2VNUnN0OW9RQzVWYW82U2RyRTRSa3ZBVDV5UUlTd3J1eTlEN1hDKzE1?=
 =?utf-8?B?Y0t4MFJCSkNPZ3kvQ0psclFBU3g0NTlCTmJDN3FVUHFmekVFSElXeFZqS21h?=
 =?utf-8?B?VUdxM0dReHR6UXVtRFZyUWhJcG1GazFPK3VVWWF1U2VQVTJiWE95d0V6dXRK?=
 =?utf-8?B?OXI4QnNEY1B5Q00ya2FJZU1UakpPTmt5M2UrVG5VNXlkY052WTdFaVBvNjJY?=
 =?utf-8?B?ZDRwb1kwcXNNUG5jKzc3YUVYZVh1Q1czTDMvMFc4UDBoZ2FnVVY2UnpCSVlU?=
 =?utf-8?B?QWwrYTJLRnRRd3lPSHZVMVk3YnFqaWh1QXVoK21hQVk5akc3anNBaXZjanYz?=
 =?utf-8?B?cXB0SUtkMGxnOVpBa1NTTGJRbFJNbC9OeWVJcC9uSDl6a2hvalA3c0lndlcz?=
 =?utf-8?B?M2FobUZEd2NxQituZEdaR2dHOHFhb01NUnI3UHl6ZnBGWkR4M3ZXQUJrRjJB?=
 =?utf-8?B?WnZLamd0cFFUdnltU3doZzNRdVFXazVIMDFZR3lmUFhzT25HWFFZWmxIK2Vy?=
 =?utf-8?B?TzhTNFhieEN2citQMFB2bU0zemRpYmRxMEFjN2llcDFCZGxWQWtmMHBJOUtQ?=
 =?utf-8?B?VWxHczM3UUgxZ1lCWGZ5YVF2WnZLRDR5bEEveGFNZ3dlMENnaFhoVTlYeW90?=
 =?utf-8?B?Zm9JRmVhelY4Szc4by9MU0lEcmxqU05MeXdUNnhLZy9pNkNlMFFlQjFjUWRC?=
 =?utf-8?B?OGFxTDlSNGJYV3FEdWc3OW5IaXZFRG9DK0Fyclc5UkdUMjVuRFkwRDFIbjYr?=
 =?utf-8?B?OUpyWEVpcGxRR2cyaFY5cll0WEFzSzZhMHBuUXUrY2NyNHpadGdoVU9xKzZX?=
 =?utf-8?B?WEx4ZklPRkM3dWZONk9mQnczbHFCeDlPaW9nZ0VDZy9ZcUE2RGFObjJuMVJs?=
 =?utf-8?Q?BDYwNtMv89ZDJTEBrZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a46587-82a6-43a2-b26d-08df45594e88
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:49:58.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkM4NEhoSQ+WtcwWVi2kxfU8clw8s8HkKvuvSA+ReVOaj941BDGwhu5JegaUiyf8wkGb7P7h941VNx4/Pg2wMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8

On Wed, Nov 18, 2026 at 02:30:00PM +0800, Shuai Liu wrote:
> When an interface MTU drops below IPV6_MIN_MTU, addrconf_notify()
> stops IPv6 on the interface via addrconf_ifdown(). With
> keep_addr_on_down enabled, permanent addresses are kept but their
> host routes are deleted and ifp->rt is cleared; recovery is expected
> to happen when the device is brought up, where the NETDEV_UP path
> runs addrconf_permanent_addr().

This is only true for the loopback device. Other devices lose their
addresses regardless of keep_addr_on_down.

> 
> That recovery never happens when IPv6 is stopped through the
> NETDEV_CHANGEMTU path: the device itself never goes down, so no
> NETDEV_UP event follows when the MTU is restored. The address is
> left with ifp->rt == NULL while the device is up, and every later
> RTM_NEWADDR notification only warns:
> 
>   BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.
> 
> syzbot hit this by flapping lo's MTU across IPV6_MIN_MTU with
> keep_addr_on_down set and toggling IFF_NOARP, which restarts DAD;
> DAD is skipped on the loopback device, so DAD completion and the
> warning repeat on every toggle and the address stays permanently
> without its host route.
> 
> Instead of only warning, regenerate the host route with
> fixup_permanent_addr() when RTM_NEWADDR arrives for an address
> without ifp->rt on an up device, keeping the warning only for the
> allocation failure case.

The better solution is to avoid getting into this state in the first
place by aligning the loopback device with other devices and flushing
its addresses when the MTU goes below the minimum.

Already discussed here:

https://lore.kernel.org/netdev/20260909115655.GA1344764@shredder/

I will post my patch next week.

And please read:

https://docs.kernel.org/next/process/maintainer-netdev.html

"don’t repost your patches within one 24h period".
