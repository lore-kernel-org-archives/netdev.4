Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605474;
	b=0ZRiSeWWslJwRIEOzNV9cm6VD/kt8r9hg2QuOuMyyDuNHbPzFuyE7mzxGfTBwNvvkGt5
	 4AxQUGWscYNnmv32iktkAvm6bwTuP/r4Yd5uGKdiRuC9T9IUW10OgBWL1DQSI543xOJbL
	 7ZyoLAeSUOyCk2EovhDcbBle6oAPOAIUuv9XqmFYI6kyluVyevbzhp8sjb5fpRlX/wyta
	 nJc/TlsE/GxaC2UoVWbq2M26Cb+c+MMvPLMM++wWbDaOe4722p+KqPg8gAQTOsyKPkmpH
	 T7lbVKJMPGvRCY2NhYc6O+hvkqEPbFBwNKw8x5uNgDpRFxNE4OitqJUZR8J/WlfmIEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605474;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=QPZBAoKjDu2oqx/125QtkyVAJKiJgTdu+aNw5sh0YLA=;
	b=p8FfWhXOx8J/jF/KVnB7SUSPr+lzi6T/eZ6pAqWv4Ep3EJCxFQeQidylKV6r8c1fGKg1
	 r3NOnGfrLd127JrHqTw/49R6SOPwA/BlqIjIjWGyXQ7aiI/sErOIss8Df/kIXqcvQ0Z72
	 2/ESCa29L7hXKLYD/BMA4d7xD+xka7zh5/y2xo55GaQ5hXhRIq5+dP56T3TEBTrlghuhz
	 93nRqZNRKD68jr/DbwegxzXSPz9VvzD4vUPGiEF0tgX8s0+BiTQmU/P9mvyZaNs/LdU6Y
	 kycVgstfze37wft1Wecb74Kz5BjUQjc7trzj+Ic01VqOnRib5Fp0zp9zO/ITC1/im4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Xnb/DxVF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C54606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C54606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xnb/DxVF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycv4cXLpOrqTOSq6/agWUzbKOTYPK0hqT0r0oBzxBNb3ghAc9uZE8HTpbnSVXCIBu7Cju4hskVCXs+/XAnnkZtLRWVgt7NKG2KHc10vPEVKpG93nGdywgWBl3OD7npnyfzuK7uuVKBdKkeGzvuUW6aUFzqUnXEJkUiRjjjUKR2XdH4G5mBerph28I+F6uLCENbvt/LtLIIm7Fi/jgkGf1yqFqOJDLv5fOg2FZ1gd6ZaZrLHHTx/u0u7/2KTBUO/OTfJomejvX9zOER0VSHhihDhnKxA5XihAu654TX/Wt1wfycAx6s3At7Hwb3wEUkzoL85teeeW15hQjdrVm/ONSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPZBAoKjDu2oqx/125QtkyVAJKiJgTdu+aNw5sh0YLA=;
 b=B2hffYL+sgpG0hbOLKXHgDHWThFQwf/fI/8+vr+VIcv+nBGthux9Fxa2KqFIXHnDVDj0l/2jZB+Q5Gj65I//y3O1CHsmJw0HjudWJ2JSixIKJA0RG5o0RRtR2+W76tKK/SMC4AgGtjhB1REwQG6i8aEYY32Pvev1zX8cdf2xPlbZ+WxpajPEqGENdFFNj6arLTvK/okZ9ygZeUr3jGJX2vPbNbUrU2QV15i7DD43SM3YjLW8hqmej13eOIDnb5dKU4Ldsb+Rnui6dL7mwVGdN4ak5hiijHJWZkQAFVQnWT1n55l48bZUb/fpJNt3w60iGhwMDMZgETN58CBudbQdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPZBAoKjDu2oqx/125QtkyVAJKiJgTdu+aNw5sh0YLA=;
 b=Xnb/DxVFXzRPYEqKiLMxJh44whJFoltryf30Mg0gTdeSXFfkaCowwQU+UAWRh/kaaN/ejRvG/5pfXmrY2iwl2wc4V4GKT3VsLdvXE1id3CpA6FnT2mnQX2ONV1IHgoccvGuwBb472vjx8o+iCoGvFOaJVInywor5+ZIYCUDi9w0wFn9214H1cfxFvetJEsyQyJGdYAx2IKfsEdKjNYWMkgwNyyNu3hL5iWViv66EW1jdbwpGd+gFXFTSqE6ZQ4GICGW2D2Cn0NYXMUvDlfksUHHlJeXiWk9Ym4zUt6PRYYEzL2JrKKY3By3GN6cByQpuznH6VYMvn7sdWr+dmZrHuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 11:17:50 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 11:17:50 +0000
From: Ido Schimmel <idosch@nvidia.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	dsahern@kernel.org,
	horms@kernel.org,
	Ido Schimmel <idosch@nvidia.com>
Subject: [PATCH net-next] ipv6: Do not keep loopback addresses when MTU is below minimum
Date: Wed, 25 Nov 2026 13:17:09 +0200
Message-ID: <20261125111709.126901-1-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbac7e6-3cbf-4a88-2488-08df4ae5bd8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|56012099006|11063799006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yOXE+/aTIVaHHYiHKcbBiR4hygGwD7P3lS3m533ocMudgOqyp/2o4PyM+7Y8sTi/+sX3MR+0QVkHcBK1nSKPYrXAtQ57JCiZoCh8qHgaS9dRmrJn7ZanQUEmwb8iovCC8fLChHirfu2ZDHaNGRLh1uRptO0mQQ4gYCPqYQd9ndMC34dXEPfCIbILwPH3iigX5d+bDr61n2jbovQtAMP4lGE53nzAAEnrDaKdRxo4o2gTQOGlTHRynnVJ+155KE/pxdhzyAX0lWaaaaJNafyH6pbO0ID6dFJRM2cv6RET5JaOKNLYzvMt2O4M4dkhlvF9x26xrjCf87ddLuK+Tb6WMWZo6w5xssGbS0AdCOVvorX2Ld7TR3QuIuBgj+vuThj3iSCqDQhKf8uUmaXSS1kSGpzZIcXmWY3VR960+h6Z3jwp+CRzrhkKAUx1cZFPJGHlKhT8XbuNH8BEDs9z8adouR3GIaOyyX1YwtOkzqvt3P7wKg7xHzgVWEkQjrqU8o2eXkZswfLhTHmRZ43cANPKjB7XK+X7Il1zJ8L8c01OiDgoSveezwxNhokLAZ9rPUvSZ+3RZeiNcglouM3RnGFLu5xU/08zV3SkLiGc8m24SjtyingasSqBzAWPtkmx3F+CybfZX7oU7sLF89teGggM0RSqDROo292lTXw40JpEWxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqV9uhV9m8319MvZ92nnwh5XkIzbZUKTxibRuy9m/LzMhcYW4KqQ0OTeMeCl?=
 =?us-ascii?Q?m+Z7hzwSOi83ARogpMMLR7nI9bmWP2Kx4mJpwMYkAlB9Ob8zk9yXInARjcsv?=
 =?us-ascii?Q?h6XzuQLLqSEFdhOoUw2wMKUYgWV5kSM/N5y6OCZwEpL2tLYdyEj/4xnpCh+V?=
 =?us-ascii?Q?/0q/7jBGZs8mG+l8yGZENr/mKzG3JnAq1qYpzDDlksvDpsSbRH+TR8+f/wNn?=
 =?us-ascii?Q?9QknBKPaNMNrHXkUqSad8n3GnWJoChKYwd30bDxgLO0uNwBoP614mV4NfpJS?=
 =?us-ascii?Q?iowcfBFM4/TxFTwRx6c1nQvpRWeXPJ1MA50lws7YjNNUotxPlPV4PyIF2RaT?=
 =?us-ascii?Q?GEm6RBbpQI8ihgi5LxJZU+4KjmB7s/w3diw8xoQZWxu5aE2NeQO6nDWuLvwP?=
 =?us-ascii?Q?8BsagoPb8kEmIQsIYl0vkYYMmn9dK4jHVMRWLvFYTKIKz8pvZkxRlxPSo4BC?=
 =?us-ascii?Q?CZVOH4OZ+mNDdSGQg7QktkfT5+h5U2ibJBY9JM0KMF+psBpcfk+vB4GarHJk?=
 =?us-ascii?Q?8HlpkVgdin+V1fwah2+Sh2ReMYfG6eL/VtxUXmMv0Zm/KYiRgcCShuG/P4mm?=
 =?us-ascii?Q?76g7hU8tUtlSuG0nCOEyKlIT42kWhPu6UuxifNGq2smyRg+Icn/MTlt8yKj3?=
 =?us-ascii?Q?MMCxiWMMV8pVbs7z7Jb5qv76o4ogmadibk0BfchMUwM4l8cSHWbvsUwiEEg0?=
 =?us-ascii?Q?/QOy8ylUE8b5NQSJuecEuKGw3fOhx7O1GtNymmR4Oxhpv3Y8Zx62X8kNcCa5?=
 =?us-ascii?Q?iuERct6vPv501jwY0IPvus4k5Q0hsZzfa4ZDz5mMk9aukw5JaobLKWADITPx?=
 =?us-ascii?Q?MkT/+hXSej4KKpg7BYufcQDuyre338t2aBaFLyVLSP1Fw/hIVklhSMBVUsCb?=
 =?us-ascii?Q?ASYzESi/e//R0NUDyIhcGGrkG7KjJARjv0kWq4H19FBYfPqAu/TJe5/23rWR?=
 =?us-ascii?Q?2zXYTTxJ2SoWBph+os3Ug7z4Lk4eEC+CHNDaIt1W0xDUBH3TH5odEu9HphsX?=
 =?us-ascii?Q?ygWSU+Fwl/znwZa+a3xZTm7LbCRzEZvecVWk8emIu8bF4JF1DKPLv6w+88PY?=
 =?us-ascii?Q?xo52CYvUSdLJYyCswL1IYJSMm2YXFzv2l+pMVO67n5ZZF5dypLWbwr0iAQP6?=
 =?us-ascii?Q?OcDlidJBKDaSrVVHXCcI0T647O/YXZsxc92sxIBesW/ogXY8WMzfs+BN43SL?=
 =?us-ascii?Q?UsZ6BrFSabYY4XN2NUbZenTmEtd++xQ4emzwRV77qHFinPhewLFQlx1Egbko?=
 =?us-ascii?Q?fjvyp55sbtP3Hl/8Vvb7vdCo16m94He8cRMUgKozufqprQQMm3muHJiFWpib?=
 =?us-ascii?Q?Aew3OW4mdm4YrMHoAQnSjtE9zCol1Tvym35L78jLaKOz7bUTx+bFi9GqUTzj?=
 =?us-ascii?Q?ebXGm3/YH0WNC9eEEQXkYpx/zplMyOPuCgwu1RsF7NEICV7Spf1BPmZHR+MV?=
 =?us-ascii?Q?hZQmdAXHuujiegG+gzHb2UQF7ujN+idaQn9PTEdG0rf06hwkON/6bpC35L4w?=
 =?us-ascii?Q?n32ZNOh6suegt0RapKaqJtjdxvD3ywAwJipRi6Q6JBkQxCIKK7mlOPZFSZj5?=
 =?us-ascii?Q?/Y1BVAwKjYqMkQ5VnZYHpj8UZ3isF+o1l9Y6N0Yh+ShYoK6F0oTTG7LgZnQJ?=
 =?us-ascii?Q?OV89nVuYG/vJtNFfgoqU2jSSMqK/CYzGE5a64fMCdd3Kr3ti6YsAvVBXpzMd?=
 =?us-ascii?Q?SeP1iO4NzfTsfm65v0JSGzj33x9ssSvAxefvxklKtKXub2EI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbac7e6-3cbf-4a88-2488-08df4ae5bd8e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:17:49.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOp/ewempuzpqXzmu+SpLJ0gSweY4Cwd6YDFLftpd0891HG3jNoN4GX3VrsWhgQStuH+ZBJCb8Cva8ErB4nsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881

When the MTU of a device drops below the minimum IPv6 MTU (1280),
addrconf_ifdown() is called to stop IPv6 on the device. For all devices
other than loopback, the IPv6 configuration is destroyed together with
all the addresses. For the loopback device, the configuration is
retained and so are permanent addresses if keep_addr_on_down is set, but
their host routes are deleted.

This results in an up device with addresses that do not have host
routes, a state that persists even after the MTU is raised and that the
kernel warns about when DAD completes for such an address:

 IPv6: BUG: Address 2001::fb on device lo is missing its host route.

IPv6 cannot operate below the minimum MTU, so there is no point in
keeping the addresses. Do not keep them, similar to when IPv6 is
disabled via disable_ipv6. This aligns the loopback device with other
devices and with IPv4, where all the addresses are flushed when the MTU
drops below the minimum IPv4 MTU (68).

Before:

 # sysctl -wq net.ipv6.conf.lo.keep_addr_on_down=1
 # ip -6 address add 2001:db8:1::1/64 dev lo
 # ip link set dev lo mtu 1000
 # ip -6 address show dev lo
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 1000 qdisc noqueue state UNKNOWN group default qlen 1000
     inet6 2001:db8:1::1/64 scope global tentative
        valid_lft forever preferred_lft forever
 # ip -6 route show table local dev lo
 #

After:

 # sysctl -wq net.ipv6.conf.lo.keep_addr_on_down=1
 # ip -6 address add 2001:db8:1::1/64 dev lo
 # ip link set dev lo mtu 1000
 # ip -6 address show dev lo
 #

Other devices (before and after):

 # ip link add name dummy1 up type dummy
 # sysctl -wq net.ipv6.conf.dummy1.keep_addr_on_down=1
 # ip -6 address add 2001:db8:2::1/64 dev dummy1
 # ip link set dev dummy1 mtu 1000
 # ip -6 address show dev dummy1
 #

IPv4 (before and after):

 # ip -4 address add 192.0.2.1/32 dev lo
 # ip link set dev lo mtu 67
 # ip -4 address show dev lo
 #

Reported-by: syzbot+ded267b328e950a7c0c4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ded267b328e950a7c0c4
Reported-by: syzbot+57f410c9a4f8d7a441d6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=57f410c9a4f8d7a441d6
Reported-by: syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---

Notes:
    Targeted at net-next without a Fixes tag as this is not a regression:
    the loopback device has been keeping its addresses without host routes
    when its MTU drops below IPV6_MIN_MTU ever since keep_addr_on_down was
    introduced in v4.6. The only symptom is a pr_warn() message (not a
    WARN() backtrace) that so far was only triggered by syzbot and the patch
    changes user visible behavior.

 net/ipv6/addrconf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index cdea18e5ba1a..285ad5c3bca1 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3948,9 +3948,12 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 	}
 
 	/* combine the user config with event to determine if permanent
-	 * addresses are to be removed from address hash table
+	 * addresses are to be removed from address hash table. IPv6 cannot
+	 * operate below IPV6_MIN_MTU, so treat that like disable_ipv6 and do
+	 * not keep addresses without their host routes.
 	 */
-	if (!unregister && !idev->cnf.disable_ipv6) {
+	if (!unregister && !idev->cnf.disable_ipv6 &&
+	    dev->mtu >= IPV6_MIN_MTU) {
 		/* aggregate the system setting and interface setting */
 		int _keep_addr = READ_ONCE(net->ipv6.devconf_all->keep_addr_on_down);
 
-- 
2.56.0

