Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089597;
	b=RwMjhyVjVw1UjT17HC9FagZzUHzlTSp/Ymcc6EP2IVOt4hLHwupw/YLJ6MawQa6HE/d/
	 0alS9Kx15c6O1iTVKzHxz8MjHWlsTsbn5zGVlIOyOuUqoU3xDlh5Kjnu+RJAM/dX6u6e0
	 hfmf3yn5TIeWKRegWf5BAl9ZAIsf4UEUFPOtExkCTB6BJezCyu7mzDsnR5yj0MTRKGpAp
	 9rtAdgC7Q2MwfXju/Ql72P4qCi9bT4aG7raHLj7NuWmopNqt2Hw8pV7HZOZNCiMBQSU85
	 SDLmtGT2RN8gp6XKegvhImkJvxAqxPR6z/Jn6eifQDbvvJqy1OyO11qnMD5Z/FW+eOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089597;
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
	bh=02J4AYqILME5KKm+G69G08uYjytet4y8FUXK1t7VN9o=;
	b=A1gYWIpXLk8GnvlBQIEdJvzB+Fu2v2zbUwep1xYSCfnxTILQRw2EAyQYQNEk9y/wJedH
	 gHrTqEXJmNN1OXTDwVLQL+Qqq0FToWWAYhUygIRVs/di3gYNwdVhb1UYede0z1u5ByUpa
	 AJbaaQIbLGeOpGa/hJh4OknmgIRl6t9v1g3aXU1j/bmjw4SSFbF/6q6PvjvJTaXk15ApN
	 ktK/yqEyMy+CpYcUOSP3psq+teWzDPb8oGSf1hoPAlveiU4OVl6JbBBJJe0t/ahJcp0sq
	 wV16S1FlVzkrDCuC+YV1XTaVwnqlqEgUAgFlvroHO29ncR1zXtCfZoDd+vsMwGUasSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QK8Ma2Wq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DA606A320;
	Thu, 19 Nov 2026 11:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QK8Ma2Wq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvHau9JKct1AQK8xMsiFsAl+c5w6pZjrLpAjwEw063WbWr1MKsVO6MGE61dB7lNlZBUJK0ZUXJjEdIwUs1xUgUrb9Y8+XlQmvkYqu/7qyW6UMhJyUChMrpvynTigSRU1zhvrsbnRI45ylShv1CUdZiOS6bZ068OydHAVg3/WZFZr+4wvA48dPcdPG1VzpYtrbuap0nYFpTivUy7GiflTSsCEgLM/d3OImj4Z45yfZPXboSifT45xihhGnNw/ccbcORJj3iZSHmpJbCh+HnnQMb7NqOpc0kiIFX/idBzBNK51idXMIBYrjRAVqg0CHuN9cj9zjAutLLp3e0dhCVNpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02J4AYqILME5KKm+G69G08uYjytet4y8FUXK1t7VN9o=;
 b=sP7/F4niKH5p79+lbej4rTBauW+3fbFF4bp5LJYvzW8m/4MaRxQhPqf5fQPz8ZpRs/BBsh9Lvhw6uWWTwmJna5yQ+4ft30E2RZUroprLwREYdUV51QQ4ZmCOw0WDgg96JXYiG6AM32jjbFzhrZMDyusMxmLbbh6fom/0Y4jVxgyTOrIqhNDNbB9IiT7DqKHhnLm0zX5HYIxRvS4+LZ5wPfdeV0zbzxsjy48fus78M6h1smzGXndRviKsk57jMs82I41S99p4iz2wM+mxWZCB7CV7+RGMxz234+i1lB3ZNippiRbiiatn22thw1X5k/HvTX8QsXi0P2E2/e+b8FdxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02J4AYqILME5KKm+G69G08uYjytet4y8FUXK1t7VN9o=;
 b=QK8Ma2WqLBAcdooLnQuK/TG/d4MvZupH2xI/b6l7kyHW2HZOthVK7gnr99xASRfVqBPDnQ9C3KvizMD5ffMzZFu63/XSsMWHy+tEqLXoq1c7+1Fb8ddyw9hvpYfnlSP24UR7geY1AiNHnGh0R6z5NXnfm2NKrnd4ckTmD0L1tVe3KNfWzRD9t4+4lh+oIub5+h9AgKBsCo8aHSBae4slxAGNr/ichOFxOEpa0vTGPsYpjVMpYNzBNqfN1EfKegmgPM3pKN/cQnCqhrq/+Or2hsj78hBCRzmFrp9K9uyA6IpSIeahyyNqabqKUEnkIEJRb/rw0cMZkqWNuODfar6EXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:59:53 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 11:59:53 +0000
Date: Thu, 19 Nov 2026 13:59:50 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: felix: fix NULL pointer dereference in
 felix_port_enable()
Message-ID: <av7fR4V6ZRUeVECC@lxl00025.wbi.nxp.com>
References: <20261119100710.129379-1-aristo.chen@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119100710.129379-1-aristo.chen@canonical.com>
X-ClientProxiedBy: AS4P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::17) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PAXPR04MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 895d4810-9f2d-43d3-2c36-08df46349f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XKJIrpJ9qPw3ZWHIScet3Ac6DCP/L2TdXNdNTXm5cCr4VCm5+e9yT492X9FXkx2epLRsOfRyZcgCKeU4sHdC05okfFmGR0Bm0hk5ujqIr5Rofcc3uoN7NB8zbgGwIQpzHTVy21jZJNkcTwy0+HQ0Al8xJbKuNBcSNjSsSCq70+tlnt4xLx73kkyFTRQS/WEthjThjipyujUlBbgc3ZvOnS716On3G9YY7CV4NTp+shNXdwbf7RlblUy5SLYPkeZWeteVTBojKutw5ph24udm3WwdOV33sj62RfdulVxrDVowCwjyPPXokl1vAqadSQ22BLUNQBzZhjsQRcryJx3WGLw/+CATfFvvo6J3p7Bx33bM9giqEnSEh/7zc8BojBwIv7oDN6LehLXLPpnd9cMwx5iMbtwgM60ggl3KRM0x3kI8Oi1PceQSjvM28vr2sEIWrJpoLSoPHJsaqZfCbWhum2czeH9PaFqKI/GTh9ojj9VTDtJv/KmAN16jhE5J4Oa9ng304zyz2bmn1z4OUCdH1/wvIhBvA9p6ta3Iuq09aBgJWVU1R+9EnkUiyfAeQOR2SxQCg84eTUmSwik8TG/A5iUvS2/x+MW3GujD6EHQE5DYqZYMsJW8rB0NKaID/xh2eTOduLoG+O+jLJgD3acoBAmFElttsi/skc6Mn9b98HI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gQz1aUpxnVmBpG2a1aCXxGwmbyKl6PQg6J/7yQlHQuY7cf8DwDYUFUkfJq/y?=
 =?us-ascii?Q?OzrAUdZluruAsMTwUWjSnZycNcKujksbbHPNmAazDf7mF+j1LLedCXZj3Fk1?=
 =?us-ascii?Q?1FLq4bcYFBOWaZUXUt7oNYMmIfqozjqpvUU3oIDCA+Vg3XADizwBd4ly8pNj?=
 =?us-ascii?Q?O3OXbBFuetsv9hG5O/PRN1PJI+ZB1b1LXLQOS8OE/ffQ3xH/lshs+ZmDFOTt?=
 =?us-ascii?Q?QLC4p9fNxb2y8DoUCugUffT9ooMoEqYkG2u725tYvOJCe/vah0AfOhSsU+QD?=
 =?us-ascii?Q?xdXAYdIeWraBDjEZpAIuM4Yp+JTBahQNPJfPDGkMmCD9yd10xustrsxbUkK0?=
 =?us-ascii?Q?LTL/fTD507bKSy2Y4dZyIUXDzgUw0o/6GJOPhhzklLCnw8oGxK9jTvycgel2?=
 =?us-ascii?Q?rZ+xFPbnV3JqO8sK46afjZ+l3ECDY5GACIwG99tXuWkBQID5pMAsxNGv9/vI?=
 =?us-ascii?Q?hItZjBOpEhW1eq5HXDL5RAJOBVjlXef2tCo8s+K3y/zAnsqMPpjnfLqxragY?=
 =?us-ascii?Q?jedOJFpREil402pYnm95hxbAEdvNGaTxs1P6aAjXFDa5o6J5h1WntbJcW0sd?=
 =?us-ascii?Q?QWWRQvJ6HtHnhjgZZe09OfyAdHQ3LZREgJy5G2oxVHQXOYGHG9zvrB/n+8RS?=
 =?us-ascii?Q?1h5FV7jEJdqI1AuyXAnaWnizClgaoncR/g3J5m06mt2NqO3xhR2U7TeKbmZO?=
 =?us-ascii?Q?2l7YQvp3TB3qiUlv+fUClCwmrCqYCCpHQSdPOXW5A9VsHDgBzmvjZbZdHa1J?=
 =?us-ascii?Q?5j8REPhvWjXzWeCmqusMauzU+dQUGUAGbeiNJmdmy1huRa9nJOVmFalziVvk?=
 =?us-ascii?Q?TdQmKiabeLXyYw7YTsaLgfD/3nQXn2LOeo5cyqE3YvxKV3h6G8iFI/R59UIv?=
 =?us-ascii?Q?KMpU6wtGGFzJFUet7xSJGlAKB9AKA1CcUVgmx1PVjKpwZZ4JxaHoxr7bIqbJ?=
 =?us-ascii?Q?G5ZA3gEJtUOcAakz7NG1QL/3OxWWf6mWsBaX7Eyet8kDZ5nUymU2NKZpTB/S?=
 =?us-ascii?Q?4Jx708TfmXiYFvHooxJSzlRSopEdwhl9FO21NWEnmvrKIvNGS1sKApdSzSP6?=
 =?us-ascii?Q?b5MhqmvaviGms/r2DCmeDQaoS5WDEePP2Z8czcjYeveBCa61uPJHoFM4jE/J?=
 =?us-ascii?Q?m4cYFPed+S23NJOzjBFiUcrEE5ImXo3Un6YDefrrnIE951T6ey6erIpQP6EO?=
 =?us-ascii?Q?uaoUyKcYbnGGaSMoxJHZofmipSbHOsxREh7ArAVB0telwja9qIg8fmF5Pqvj?=
 =?us-ascii?Q?oFar57sHvBako0a8tAmzPwuLWEF0A08eygpwMnmdy0nhtIJ6obVxKp49u9FJ?=
 =?us-ascii?Q?lW/cnuaRfzXmYvSYUvxgOrJGZ72hUvcNxeHr6jj2PoyUR6E6VIBvRSwfd/9z?=
 =?us-ascii?Q?j7ldq+oR2zuiPPSSsiAq7oH0IdMjICuAdTLKEEwWHqIPrw6F3DHzKI/Eejrn?=
 =?us-ascii?Q?LTlMB3u8gEvFewnLx2843BVfVJyg1mzzFsUoYM53wp0aqf9TEEGRy/lAXe6J?=
 =?us-ascii?Q?qjRRzBMNhPRz8OYHlMNibMWm/f7R3Jx3yQmx0UoYxVlgbXSXEMik9WTMCiJy?=
 =?us-ascii?Q?j1WTzpgy1MzKZySlP9leNOit+5eFuXbSoaBpIhjff+YAY+YEwgCGe0PIt8CA?=
 =?us-ascii?Q?do+Qma7G6Gvh/b4bMUYntOGdlmi7SEVqO6GtItCDgeLtSbUtNJoGbUVf6Emy?=
 =?us-ascii?Q?vVj1kCs0GoUdmnJq4TVbgg8F0zVlGYuNrJr0vJ2mQQ7EDcPdigoe8c37vhlr?=
 =?us-ascii?Q?DpwYQj7aqFixOWNF9lpivup2m1TZwYfJit7lwb87RsuftAE0y4gd/haOkZJl?=
X-MS-Exchange-AntiSpam-MessageData-1: 73eulNvp6CskLQHT/UPXC2g8ohhWJoEaopY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895d4810-9f2d-43d3-2c36-08df46349f3f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:59:53.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHVrsNWumAF08ziP7ynY5GJsJ1bRkvGicMVFrI486YjnvqhtJj61Uah8+EgHplc0jxloi1CxGrRyF+FC1k7Fnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8304

Hi Aristo,

On Thu, Nov 19, 2026 at 10:07:10AM +0000, Aristo Chen wrote:
> DSA registers the user ports in dsa_tree_setup_ports() before it sets
> conduit->dsa_ptr in dsa_tree_setup_conduit().

I wish I had seen this when writing commit 11fd667dac31 ("net: dsa:
setup master before ports"), because I later had to revert it in commit
762c2998c9625f642f0d23da7d3f7e4f90665fdf due to some unforeseen MTU
handling complications. Had I realized the conduit->dsa_ptr
implications, I would have tried harder to solve the MTU stuff.

> On teardown, it clears
> conduit->dsa_ptr in dsa_tree_teardown_conduit() before
> dsa_tree_teardown_ports() removes the user ports. RTNL is not held
> across either pair of steps, so user space can open a user port while
> conduit->dsa_ptr is NULL.

Correct, even though conduit->dsa_ptr itself *is* assigned under
rtnl_lock() since commit c146f9bc195a ("net: dsa: hold rtnl_mutex when
calling dsa_master_{setup,teardown}").

> 
> In NPI mode, felix_port_enable() calls felix_cpu_port_for_conduit().
> For a physical conduit, that function reads the CPU port index through
> conduit->dsa_ptr without checking for NULL. This caused an oops on an
> LS1028A RDB when systemd-networkd tried to open a user port while the
> switch was being probed again at runtime:

Yeah, I think this isn't the only problem. conduit->dsa_ptr is accessed
from the data path as well, so IMO patching place after place is just
playing the whack-a-mole game.

I realize reapplying commit 11fd667dac31 ("net: dsa: setup master before
ports") for stable kernels introduces a high regression risk, but what
about this change instead (not even compile-tested)?

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..c68ed0389404 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -403,6 +403,9 @@ static int dsa_user_open(struct net_device *dev)
 	struct dsa_port *dp = dsa_user_to_port(dev);
 	int err;
 
+	if (!conduit->dsa_ptr)
+		return -ENETDOWN;
+
 	err = dev_open(conduit, NULL);
 	if (err < 0) {
 		netdev_err(dev, "failed to open conduit %s\n", conduit->name);

I know what you're thinking - if we refuse bringing the interface up
altogether, won't that regress user space and be even worse than risking
race conditions with dsa_conduit_setup() assigning dev->dsa_ptr fast enough?

And the reason why I think this alternative change has a chance is
because of DSA history, where bringing a user port up had as prerequisite
to bring the conduit up first. I removed that dependency in commit
9d5ef190e561 ("net: dsa: automatically bring up DSA master when opening
user port"), but user space still has code to deal with this for older
kernels. See:
https://github.com/systemd/systemd/blob/v262.2/src/network/networkd-setlink.c#L1081-L1082
and I'm hoping other network managers than systemd-networkd have similar
code as well.

So I'm just proposing to play dumb for a while in stable kernels, return
the -ENETDOWN that used to be established practice, and buy some time to
do a more proper reordering of the setup/teardown in net-next, which
gives us the guarantee that we need that conduit->dsa_ptr is a valid
pointer for the entire registered lifetime of the user ports.
