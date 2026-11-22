Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795350969;
	b=p5ZQEvjNe+Q5L8wNyNt1CnRAKPkTbjOt1Ydc7vxXFWKMTUoigg6GfD3VTDzowSx9+fEq
	 s1Z7JkUosWMC1k35YPP4D97DFiZwlGWfzAIPpFrsqnzAxEIXNSfpl1uNYUDjRYOy0UgZS
	 hX7ZQnSBIEUNUujxYnnbyJD76WX9yd1uuXTbU891JlscxESbhxhdHsPBYAOSFqBA7TPJF
	 j9VZUXyjAb3BpJNt1mGDJvmlP1e1HA+99IDTzqXrpaqy0sZxFZ+miriDqU39RfxaivdMs
	 YWpFkb/Bwe+CTG51D4PQ9xRzbvLd7boPDrqhR00HmNwuCpabsQwxqexRqJzBw+VCc9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350969;
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
	bh=VGxTJjImatZMEcZHjmBkX8waknbP4UAVgqhG0FbSA8M=;
	b=WiFgm4/kyyDPW6Bd3Z1WoMzGhZvirxt5FDxL7YVyX8sVRqHEgYwSQT5IDCwuojm07Pcn
	 MPQJtLDWc8N1TAXUPL2YhFOxg9ODwow+CYtIloh3NKIMi7mAVkHCa7lsxgp1rN/Yzddpw
	 HgZ9sSB14Gw3WWuD+G0rki0NwouVihRdy9RUW7X0mJuo1qM6in74hEbrCifnRUM+K7Nba
	 aaveTunBKDgy5KpkECj2pbXXeyPNc2ajzI4kYZVEkoe7aFj1RN76WXyx0sMzpFmfaS8da
	 +/0rfkWPIRABOR0S28uTkFtRZNsGHffXHUpPfrLM23hUf0/98GomK/JgkP1yL2BwZTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TQVwudm6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.40
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E5606A320;
	Sun, 22 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TQVwudm6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoZg8w/bcdg0zLddki1cxCSbnAfD1ddWJYuZtAYLVSwkUHuAfUyb2XdWtx9Zpl1kAF3DoCCfDEEga7KgUWzOEnFEwogdk3x3aqp4PNT1D8/bxd4hZsk6rreb/n3WrAa46Gf3Kg2P/hU2BevlyJ/dm3ps5VC2r8fR5yjZgcr+unMdetQag2M8F5Yk+0W+W9vKKw8wM93UmtX9tGUkrQDHmGXa2zK9RGxhCUxTPENVpNlcU/2X6LekN0wBFD3swJXBoQ9uhoSgyGfBy6dlYNXSDbhIZFtMDbS3iAc5WWLiRC2hXcjoklcdJFJJWii4HCQAd6Msp+ApOW6UYV9o8UXe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGxTJjImatZMEcZHjmBkX8waknbP4UAVgqhG0FbSA8M=;
 b=TvPjDXktYR7TvfjcaR9E67KQF0qdeWaNkH3quartFO1GaN3DqdJO9YIkfcnFxu/3a/cJBQlqrFBUZ4wNCcSaCzsJiJ5FNQJf5xhQW/XUue1QmA+TPSto7sOr6Zog4lqtzNTM7K5xkgDK3eaCgUsRP5mGSLoFFw8NfnEMLGdThQz2msgteKeKtpqGCwAwDwTS2qNG/cCNLPM4gXxmA7d2GuN/5uYyvrRFXGM1x3tbISxaDsROWaLsnNYtM0xARe8RqNuVn8g5B/bMl9uElKy4k3fHH2H3jowIh/5DIUp5TQUhgRdIbcuPwZR2JkrQ2KJCO+S9ihpwji5B+I7SCW1EvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGxTJjImatZMEcZHjmBkX8waknbP4UAVgqhG0FbSA8M=;
 b=TQVwudm6gkYLHomBWuuqA1LxNgrh3VVGpPUmhbxaAC7y5iWe17+qumj22jk00XyPGn9lYLXE2r4VhvpDIvxnNKqlae6dWW7zs2szAV2KH2PUpfM9RwXYfCxmhrsaa/FZPZR6zwixZpTMV7SdyUcIKlB6jMW3K+Jmm6nm+Ztyt/5qu8nbLKU3a35WTrPD/Ox672x3UlIcf/K7mstELzAnxJCQhhY6PEN7Y4fpqzlFFTBboKedVI6Mk1Uj0RNnWZtzwk2ZLfvFPov1nH9fwvZ35+BX4KBSZ+4yVo7s2AF2cYZrFkIlNvMY9e3SjKaEGxH6kfwyyCHmMQmdwhSgOAs/Kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sun, 22 Nov
 2026 12:36:04 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 12:36:03 +0000
Date: Sun, 22 Nov 2026 14:35:55 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
	xeb@mail.ru, yana06070@163.com, netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net-next v4] ip6_gre: fix changelink conflict checks for
 L2 tunnels
Message-ID: <20261122123555.GA2812544@shredder>
References: <179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e6791d-f269-475d-2f0d-08df48952c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261021123027099003|261102123227099003|261022075727099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uQ+JXjd0sQIHZ32o/p2E82l/jQarE0gW/c9CC2eeZEjb2O6+pXeRzitHlHOENCEg2hbBPnEClOvJkV3ENDpn+3seR8AAIU0GvRYlBVkYuczzzhPyMFDnhU3mXFe4mdzrXvVrnjH4aMqEkvqIBx7mpfTkaNeX1WvoAxnD/FFe5Tg/HWPmrgrRtVR97td41Xk2ZoZ1oRxNMtlzdvb76CdEb8MiNkDxV7h6xzN7fSjjLvbX3GiNYfFgR6XkhN2afAiCRhhMj6ppI7b/Yujey90PXXukHTUL8avo4qI8UmIjWCzML6dgTlLaTRsa9Pi4dWA4oOelODw+64qh6zXCRaufDWNhAuzlQRw+LLBrDWnjVvFauMFTU5SZNPaWMq8aR4FpJvfmt3kKy3EHKeYqqBQoUY3PM43s0k/oT+8AVo4YEjPyTjbfzPMaLo9vqqh2uPkjbBHfQtUOIkRoCH/ElsANGoDreVL1DteHkUQjRWFA2Q+7vvOeKL8k4tZoifOpvU9oMbKr1IL1iuZWkqSOWkImiOARaAfZwBV1gyn6ZVdf7XiFl2amNu9KzxQRmAZWckpZZNOnodZO1v0G6e2dV7InWZdhmzL6gsJYCuGX59zL/m/zpk5Q2O7ChKIuTjTxQC7bkP4xFAPL64Y0VSh3Y/Jtt1kBwL2wXTi5io9LSojT9lY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261021123027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0EAqeDUsLy7ySz3tVOe41axFZ/NWlFNFgIBglnwHWXOmxPjnizfYmp0CvOXR?=
 =?us-ascii?Q?++itBU6ijZsjEWv+o/3Vf0gKq0ZkpaBgan0QPnrT3qVyhpq+zjcNaOiqIEiV?=
 =?us-ascii?Q?9/Sp6Lh2FzdnUFLmrA1qoIxU1jJjYakW/H23Vyo+qTmma2yH3GnNVAy/AOaN?=
 =?us-ascii?Q?gr37wye7qHHNM6LJ9pccaY07kpwInHUF2L9wb8mF+lbkUfw7UAdi8+yrIXFs?=
 =?us-ascii?Q?Zh7dn8zOzZZVQrHGUAU2kDIjZL3KaPSnDYcxSpoUH4cJFFBdNbtWH/ov7E24?=
 =?us-ascii?Q?N6YNjpMxptgGXR5+lIm4bfVk9ywGNwAFWcqwfODjhq2KEcSeoeIGSrdOx1yJ?=
 =?us-ascii?Q?czQAjpbj82akYSpSGuyRvytQU+pqL/16z4X9qjZcjdbyVBMx7sRA+3FDWmpe?=
 =?us-ascii?Q?R7Fwf/bX9zVNFgo4AovYU30a8PvHyl8rkxnW0uyDaiK1rvZ3gr5eHL64V5eD?=
 =?us-ascii?Q?xjPkAtTbqI05X8JFHcmbdOqzpDI/i2mK7Bry4KQW6Phrorjl/zs5VGxUKNCO?=
 =?us-ascii?Q?9b4E0I/a/WHVRt+r+xRQ/RX3IXmVkAHl5xr88C9IhXOaCWnJjHN8GOiUmtCz?=
 =?us-ascii?Q?sDoDZ3nq12omKfthOrdpTKg76jjSrlEk69SrHXjBrS/80KHCckf9q3Lkrxbr?=
 =?us-ascii?Q?cUPk7qgrSGFWcYtRpU+26CRVa4dLmfIcQpWi5XG2lx20NYYlSZSe/RDAl2M7?=
 =?us-ascii?Q?xo5UIG9bDbm/Joa7Fk5tkflSUUaY+RnIS7HukdaDhR+le7eS5BJsEs3spauZ?=
 =?us-ascii?Q?JBFqCbzfB6r9XmQO6OtOpXmjFK+BOLMQVfaw0GOmgFqomi7Xp8s/AV2lPGAW?=
 =?us-ascii?Q?C+W4aGQFGspWhMRbh62WE7efr85nUJ3DawnpjAqlkEvc7+kMDWMYAm7RYHbM?=
 =?us-ascii?Q?kTeHJIf1La5USlXINEO7SqUhPnZcp/vS6GLW4JMt62XlucoezZ9gEh7kbfll?=
 =?us-ascii?Q?Cbjh4qG6m6UENUxiHcM/+4DVPm0SMIqQRtPJiyq/3G6yaOKTrA1L8kfRyqtc?=
 =?us-ascii?Q?AUMfl6SqPJVjPj4ZpxJyBjmmlEloERlkEd2Z0iDLNcFQRwYp781HNiZXzNt0?=
 =?us-ascii?Q?/gNgIomTg5m06FhfaEzSLTfnCbSVJaVT3MPIOji01P7mXb4xEzBN3DrRd1Om?=
 =?us-ascii?Q?2h3KC58UZhex6ugZBdEr0ok0ngcnT3mTYPqSP7APIj0MbQPK2ackQtPJUr+q?=
 =?us-ascii?Q?WZhv7lD0vVpKHnyCviwqgTZL/2eOgzygnNSvGeIesk4KGWB3EehgdDdE2qgi?=
 =?us-ascii?Q?E4RYYZv+eS6nr9qpglkQ9gjGBqQ7KSXAjLTJ4qKZzr17Ylb5WRh4NfNZP7AX?=
 =?us-ascii?Q?eF/RvcgvRv1IFQsQ/n4XzuJDcCM7/shDxvPedpaIZxraFKxW4ARND3kSEoYP?=
 =?us-ascii?Q?LknKanCLNH34G9Z6MEKp0rDCrlyvVQd7f91vx1KmJ1yusrYsw6AhTTshbkbp?=
 =?us-ascii?Q?y5kERQK5px7V6K7fVNUUyMPr/+aoF6uZCusG9+z+LhsHRIuGOj9k8FnaH7UO?=
 =?us-ascii?Q?bRuYMSSGyWTAxzix+L31P0Hn22A6VkBBYM6hmYSv0UqBVmzuhZ5QMBftYCYe?=
 =?us-ascii?Q?W9K4yZP0swScxJfYvdOS5i1AVUtTkBBWaihiStb4GWS5WO9a60jYifufYdmF?=
 =?us-ascii?Q?3vp7rcjrtCdPOR45lDLML4EYZh9LU3U6yNQsXw+1O5A3z4oagoeLoQalH1ec?=
 =?us-ascii?Q?n+AAdElgrRiisb5aYzQ94gXwDY3ndwHhoGxA2mUDxZRtrKFc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e6791d-f269-475d-2f0d-08df48952c14
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 12:36:03.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1DtuSTHmsxlAgwx/tQAivqS8VBktGCxwMTChLt4ERYv8g/t3oWpTHXRTHy3fJ5UkKQ8jK/giM97KfD3GjNW1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049

On Tue, Nov 17, 2026 at 06:16:09PM +0800, Xia Yan wrote:
> ip6gre_changelink_common() calls ip6gre_tunnel_locate(), which only looks
> for ARPHRD_IP6GRE devices. This lets an ip6gretap or ip6erspan update
> create a duplicate L2 tunnel, or rejects a valid update because an
> unrelated L3 tunnel has the requested parameters. A duplicate can receive
> traffic intended for the original tunnel.
> 
> When the addresses, input key or link change, check for a conflict using
> dev->type, including updates to metadata devices.
> 
> A metadata device can be created with the same receive parameters as an
> existing ordinary device. Allow updates that leave those parameters
> unchanged, and keep the hash entry in place. Otherwise a TTL update can
> either fail because another entry matches first, or move the updated
> device to the head and change which device receives packets. Do this for
> both GRE and ERSPAN changelink.
> 
> Check conflicts and unregistering before applying encapsulation
> parameters. Leave the shared find helper, newlink, legacy ioctls and
> receive lookup unchanged.
> 
> Found during code review of the newlink and changelink duplicate checks.
> Reproduced under UML with an IPv6 underlay named under:
> 
>   ip link add tap1 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 100 dev under
>   ip link add tap2 type ip6gretap local fd26:106::1 \
>       remote fd26:106::2 key 200 dev under
>   ip link set tap1 up
>   ip link set tap2 up
>   ip link set tap2 type ip6gretap key 100
> 
> Before the fix, the last command succeeds and received frames move from
> tap1 to tap2. With the fix, it fails with EEXIST and tap2 is unchanged.
> Custom UML tests covered conflicting and valid updates, metadata
> overlaps, and receive interfaces for GRE, GRE TAP and ERSPAN. TTL,
> fwmark and output-key updates kept the same receive interface. Kernel
> selftests were not run.
> 
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
> ---
> 
> Notes (ip6gre-v4-mail):
>     Changes in v4:
>     - Check changed receive parameters for metadata devices too.
>     - Skip the duplicate lookup when receive parameters are unchanged.
>     - Keep unchanged receive parameters in place in the hash table for both
>       GRE and ERSPAN, so an update does not change receive priority.
>     - Rebase onto current net-next; keep the shared find helper unchanged.
>     
>     v3: https://lore.kernel.org/netdev/179455350258.84965.17518172977020586093.ip6gre-v3@cmss.chinamobile.com/
>     Review: https://lore.kernel.org/netdev/179489968486.3136.18372818760197436344@kernel.org/
>     
>     Tested on net-next 6ff4c5942a301675eb12e5b49d53a81e604624a1 with
>     W=1 UML builds. The main checks passed 194/194 assertions; eight
>     additional cases passed 92/92. Packet checks verified the receive
>     interface and payload before and after updates.
> 
>  net/ipv6/ip6_gre.c | 64 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 40 insertions(+), 24 deletions(-)

No.

The patch is trying to "fix" an extremely uninteresting "problem" that
was most likely flagged by LLM. No report from a single user in over 14
years. I was OK with v1 because it made IPv6 consistent with IPv4 and
was small:

 1 file changed, 1 insertion(+), 1 deletion(-)

Then, it grew and grew for the sole reason of pleasing some LLM that
flagged even less interesting "problems" that IPv4 already "suffers"
from.

Two options:

1. Go back to v1.
2. Don't apply anything.
