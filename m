Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795429847;
	b=FH8VnaQzTAlPiET3MZHTv4Vvm7JyzYQz2+jSLF4kLezIOwE/aV6tQB0PGX/VxIeX6jMv
	 rFgGvsnQoWRsaLqWvpRKW/aAh++FXsz0Dib0xgBUcfSHWUj8HVw0jz/wK76aSlKrrana5
	 kkV6yctf5tC+b9sv5/uI3dNepYCBE1m8mn3mRE89VTs5+qOzUdWE8R0CDosw+AGq9xyBi
	 J37MQI0J+hYRahN13RReceX0X+cXEPd1MVk/LlEeswlV2A6i5LYUZpvbQNnpilt61yuyW
	 jVYU6H9l8dnqZngHcxSkyDT+GOYzqf7Vb6dURZ5cmLYtmigqi5gE8Oe2HnOHgwgyXzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429847;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EtGz+I/vjBC4UaYCOwaxeAL0NH/yiFe+cA6YXqfg5eg=;
	b=LPIL/rqsnbi04xwjnHelcxnLGYUsXac2B5X5j68UqjCDFWB1mZ3h1FOL7XOFgxOZa0HL
	 Xq/PNQfhwaKkmX4HwGC2JwHjA4+fUxigOTqZjy0nCV0RCop6/rWe7oa2d1+mU2Ch/2nrw
	 EPFWswPeyuYF1NBPWMZEwaTMhdQz5Ul1sMPhcPMKOZ3j6S7dT/LsliEXCrH/ss8cx5fsO
	 7RQ1Nzbimu4r6SMnEsDeC9bK0ztaO/yDE5n2zxy5KHQ28Gin+bzTTjOw2Wxrvmt73+B2G
	 LuuEZbbQAdTc0Zb5MkthXakOhNICc4feYNb5v3JFp2dIvYUA8bSk63w4b2j1FOLkf4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Fm9Y0TFz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.14
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011014.outbound.protection.outlook.com [52.103.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E4606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Fm9Y0TFz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ612W6JTY7u37odMAUEAwG5AU+glD+IHWo5ZhesRkI5+vt6Yn36ItZUcA8Ru32y8gnA4bwGz0acZyKMLes/F56JWu0IGcljOLyWhw4xgOdMKMT9u65yOH95c1jCRUeJ6pI3Yr544NQuQ+urjrS/KXmtTgtGNNIFtc7J6F4b9TUibu0ExNYhnr3y0W1zaIJMwzAlj1cfKZfhz0zuBcis4UbVQlTnmstDy5/cWCmxyMBESE0q/iBwRIsO/i3WIZvEcoA1vtvx4hdgsLQxvgDxo6T499Q8scT3e/xodVo64gEnLvBOx/4msNZQZqEgUmnepyqh1z9rDVf9s9V0k/HaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtGz+I/vjBC4UaYCOwaxeAL0NH/yiFe+cA6YXqfg5eg=;
 b=jxU6Ho31L63Ev6A3VKplp9FK0wd8hhCMbRtbAvUG3inJKEoNAm1AT0UepayEQBIfv2LOZ3SrLEqKOsyc4zXBr18MwpMBiDG9A4TUPl6+KFyur2D2LmND5N9nIS3h4h9LXVdIidVCpR3KBt1TuK66pjekj1cjSeRTArzqVNyvE137EUsO323ogERlfu7l5bdaFZ9b0fYguxM5XzV4AzZIXXlr5DDvayiTiP1ORRL/YGGnRwStTgpNoTeyYhWird0qidVZroj0BHslipbrXBL/sKj/wwEG8rzhjYEpg2i+pBL+W9xxViQuyvaTvbz2XhrP26DJnU4X8e0jY50ktTnARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtGz+I/vjBC4UaYCOwaxeAL0NH/yiFe+cA6YXqfg5eg=;
 b=Fm9Y0TFzR2wocoPz5+2ARk4AH5f5zSV9zA9QPL4lHTTIwaCnAXx9Gb6vd13SlUHTJq9xvTHo5G8tVMKMnudfIDcEveJLElpHQr3wHd5DHICC2g2ItVdJtzKHjD8wHtRoJ3LAOphaslbg0DmJZZ30+iISffiwYm8R/DVfPl+SfUCHxdbAB6KC1mTYgEncMnzJf+voBfs8inSSXDoe8XIyc7dQt7VsvC17m3FtdA96PFqJEA73qX5WhkBUbG8VlWta5J/41IUEOHiDhr7sXlVcilQN4yLcUdBCnxPUdU/tqRYB2LZeEt1xGbkHZJbaZeR2gyhhg8ZjwyUerq5a7NjWVg==
Received: from BN8PR06MB6177.namprd06.prod.outlook.com (2603:10b6:408:4d::27)
 by DS4PR06MB829010.namprd06.prod.outlook.com (2603:10b6:8:4f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:30:45 +0000
Received: from BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f]) by BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 10:30:45 +0000
From: b.lane130@outlook.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	Bruce Lane <b.lane130@outlook.com>
Subject: [PATCH net] net: octeon_mgmt: Add cleanup operations for octeon_mgmt_init_phy()
Date: Mon, 23 Nov 2026 18:30:22 +0800
Message-ID:
 <BN8PR06MB61774294C2C7961C2D8A4923A4452@BN8PR06MB6177.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To BN8PR06MB6177.namprd06.prod.outlook.com
 (2603:10b6:408:4d::27)
X-Microsoft-Original-Message-ID:
 <20261123103022.2103937-1-b.lane130@outlook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR06MB6177:EE_|DS4PR06MB829010:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d22239d-9c9e-41c7-735d-08df494cd4df
X-MS-Exchange-SLBlob-MailProps:
	5fu/r660v9Mj6U6kz+12O9pZy2TuKGHDbc3BEOA3Poj4bHs/O2yRgq+pOgi1EjLUS9UIsL3V1dBODLDOaQFYaDHhUvf0iYK15d12PmoQ74EfolYK1Hd7jpH6AgBxtlUxVavok8FaGJTnpo79xUjc/X7ztN+e+gR6sLm9xx5nrGBULjyrdMshv9g0b6x+UUDd2MBVg5akSON9ASLlKh/D2UGzaAZfbPBBBz5bcH5ZfWHRk5dnI87r9CoElIQ4shJ/Ey6+1d+xwaXdr9xFF0iNCmJz4WjhfLli7Cp4/ryMShVCQ+fqbj2rAJhm7Mly9FOl+ZjVPmXF7gjdw+u/OWZJIIDlZxJI8tuM3Sk9U2a/PHAp8SX/ma728brDztnEnYLUHU9515CMDmYTEKi2LSK7eXgN+B7I8Pk3lcSHK35OHmn+wXXHF61x2a4N+HxI+5G2/VTQFpjaUEqYDW0i74TUOSZpQs/+P1SZDEo0LjOq11Z8+esPUSYg0SqT5gHFc1yDQSZgAKKit5zzgYHOnytuE4/9d+ufD3TeUtxzg+3UuDiL2LbGFc04spwI8UmOIoF9sl2C7CMPbHchO21Ldt29bixKgQX6wmGh4+tjG3TlLKQzAZJo1L1Tv+IqfdmfODCZ7vIomNp3DWtLqBg2yBOTUpKfUzT7lU/HzZqCpq7te9IrCmcYQZP4MYKtgkE/ad0rg/AeXcCPSrFAGyq25sevSHS0xt6bjRvRbPycWEN2Rew=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|19110799012|8060799015|10112599003|5072599009|23021999003|260925184616899003|5062599005|24121999003|22141099003|22091999003|2604031031799003|6050399003|39105399006|4140399003|440099028|3412199025|3430499035|40105399003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ukb8zg4Q6nkF6Tu6hpKD+06nevHYNGWV/Qzu4gcfjw0BWwLIzOE1YYKBiv7p?=
 =?us-ascii?Q?58lqdizX2fIbzg3nSaAzw6jBTk9efJ24OAyNX78ZJH9xfPWmvpzaucqj5ZCa?=
 =?us-ascii?Q?E00LIS7x5//hX4KOqf5Ggsd9uOX6u9DdUDCSz3T0us4HkTj7DpFy2XnqLG6Q?=
 =?us-ascii?Q?90KpCYpClXziPtnWkL0LoGkI/FUoXjiiwXLaNDSSwidarT5FndoSWFRnaN+B?=
 =?us-ascii?Q?MCALTPwYkfMruRl3J4UFiZHIb4iq4v22BCihjRxGzQMQOYzRn+Qd/77XWqMm?=
 =?us-ascii?Q?THEqxSTD0VAYWI93XnjnKa40hkKVTLxKXGdManA4ConSsuVULRaUSBAXeXm2?=
 =?us-ascii?Q?3DrsegiSglblaQP3CQQg/AyvoPCPRxlAVCY0vuQKUrK/jxIQX2HZ8OVJOFcH?=
 =?us-ascii?Q?uOxzSrmehcp46TbVMTtDsTq2y90TA5fkuXw0stqLA06rpUl8ZBwcSleC/Cqc?=
 =?us-ascii?Q?z2kZ3SEQ6tJxFwP+TPlQ1WrNFRQ+4sIHeZafJP2dFcDjLA285b3EjZ+dhj88?=
 =?us-ascii?Q?MQqw0WYs715TmiK9pcJaA+a6Jk/UJREItIkL7TW9f4LZJu1RRrQXk9SwW8YI?=
 =?us-ascii?Q?ky7a0HPlbYxeFEsx8mANk+WFvsCl+iHw9QJBXuuaKuiZwrIWMyNlQJt+OJQK?=
 =?us-ascii?Q?lvtIMmpeaFLRUMl2wvRgJiWYkAeNoF7uv/PiEou/SJcKfof72xnWMqGtsNtF?=
 =?us-ascii?Q?mulnVMN9O1h4rHg9nY7regQJm6SLVkOa2LGPm6XHDGKJT5PBALOiCJVJ5pJQ?=
 =?us-ascii?Q?2c4B1B0zJeNamKiIkZJS+sTQMvZUzE/C1LPe3fUIvVFBD+SYG6M+WSzldlXv?=
 =?us-ascii?Q?YPmBoCW/ea8mc0km9O6BhPXdSKygI+MNezsOmD+NEpplWEh7/Qdrn3gkMq20?=
 =?us-ascii?Q?OCoM4vplqQeg5dweBxhCW87QRGtOjLN6nw1EksIw8pc+poT6/rwAADIcHYGP?=
 =?us-ascii?Q?mYeKDro7ntKdmBzlvWdp/5qs6yCREngIYLD5tx9iDn70g4HK5OKrWH32moWy?=
 =?us-ascii?Q?Du39vVlXh6SHfm4M7JNuXmFd6MNgzMnTQDKsymqku8TRZWKQ6WObdWAuQvUZ?=
 =?us-ascii?Q?DomkE5NRqm7Jc5SUn8ZQXHFxQ3k5rOCU2OaQbz62Bdw6K8/mKmvK7DlVcvxk?=
 =?us-ascii?Q?GzeAbyIu9Fi2m2rTr8bZ27x6DmvUaJt7baUrurhLBh1U85NSDLMwGOC61E4S?=
 =?us-ascii?Q?WohCOQpKpfaKXfvyenz4PUFoN0s3S4Bc7PPXxg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e89OUM1kU/VPP/FtKvcOtWbieDUfdnTiCfxeJvWVV0Jd/hl+1fxY9TlPseN0?=
 =?us-ascii?Q?hLOl+Lkg/GVzyUWTk2qJgPr+6IjXqYI4vH6o5XA67pEZ4EGDRJSpFr1Gf3ce?=
 =?us-ascii?Q?QC6DfqLVLy+hI0iL2c7yqYEYssSW+DiMAQkL4rgQQjgpRJByT8wQ2rTRLTU9?=
 =?us-ascii?Q?EafbItHmL3p6M5twGWP5Hslgyx5F7O0lw7tV1qBnZkEA9Pl/jwkJMiwjjF7z?=
 =?us-ascii?Q?++cVa360Gq+hYx7dmz/qlO04guCvhS3AY6RS+spZYIilFxQkqR8MzMNc1fSs?=
 =?us-ascii?Q?i9KhIqydGTLOWYgtHq2gmbNbamujWdhj7kRSefXLmot3lKr7gIjzutjQyZ9o?=
 =?us-ascii?Q?XvAv3hTAcHuGfktmcr2E2+fqpQbu6l0d5zCjbXp+dDq5YtQSoGhSM9OcmBDO?=
 =?us-ascii?Q?vU2C7+jCBFFGBM5Aflj6WON5DaqvdkCVHFh+/LdAByjKVDV5dabthUfobDEJ?=
 =?us-ascii?Q?eHC5UlStPKiGjsTvxsH4wIFnqO1Amsr+rMXGB4COpsdIghr7GqV9ozi7cj3b?=
 =?us-ascii?Q?IxxP9H2FzCq4OANwfIH2bnvLuOgLIlnHKqzYDvcsTyEcUss3SQIEVT8ZwX1e?=
 =?us-ascii?Q?IFpZNrx5KuFvrlR4G7VYid8fn74x2AxQMneP9y0i6AX1fVCvd/4z0/5+vXoQ?=
 =?us-ascii?Q?38VaJR0HYnQkAZAghIneolGjamWQiUTQtm/CQ1iQBc7j4x6UwISgJOlyao/k?=
 =?us-ascii?Q?IvNbZps+NCo/nTuBWrls6UsCzEAT+TU/b4jDsZnsmBYnItx83s3wseTRFICo?=
 =?us-ascii?Q?PIJzjz1zqIKJVeGsLevQZzFalFV93aDtkx5JYsDRy61YEBxyEHm6WWuSYsqr?=
 =?us-ascii?Q?scsiDcO4bs4ktaYVytue+kei5VAFXl+Un4Hst10RWBt7e8jJ5U486EdiICcO?=
 =?us-ascii?Q?oqZZn2UAWSVvwKlt4NcUmgWQxXqhtzP29QudyT1mRvat7cW/ODRxGNRtLtyj?=
 =?us-ascii?Q?luqft6hM1cD6y7C2Bn/8G52b9wGHT5FkCPpX7H66iFTM1j1W9FUfQq9/MKi+?=
 =?us-ascii?Q?LPHBcpo7pHc9OQoe4CG/pXbDyFfBCbosZ2ha2K+fXP8j43REYR58t0IatNe5?=
 =?us-ascii?Q?78zXRnKW0Vqw7LSfiZpadmEuF0pVgDHiVTGjBYvt7Q1SWy0DEgRqMTszTh/r?=
 =?us-ascii?Q?b4LgfQPCuidUvfN+ubXpAcC9wZa0M3JH/Zc0h6ZPDBH+2IuximAH7ITFcdWq?=
 =?us-ascii?Q?E9q2+GWTlf6QOkndVxbcQ71UpLm3va4pWkXY/H/7+SnP5eOvtp1TngNORGAU?=
 =?us-ascii?Q?xi9d4KH6C55qpBn4zDCnj1QY6SU48dQJi1WBnSmSZ5sb37UeENEjw9K7mkFD?=
 =?us-ascii?Q?+QZ0nrX+FFGIuwWgO2ycaA/yfDjnscT2Q/xhTxEdXMtKxTqy4jQqPDu6AEU7?=
 =?us-ascii?Q?/JFf1UlZPOBhocfAFVvkBkANunHGniP48sqVBgt0kRl8uTQr/J2WL+jG20Cl?=
 =?us-ascii?Q?WN8CJDlSS/iyleyuuOS4WMYd4vXlvxJK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d22239d-9c9e-41c7-735d-08df494cd4df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB6177.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:30:45.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR06MB829010

From: Bruce Lane <b.lane130@outlook.com>

The error path in octeon_mgmt_open() misses the cleanup
operations for octeon_mgmt_init_phy() if request_irq()
fails. Add an error label and the corresponding cleanup
functions.

Fixes: eeae05aa2169 ("netdev: octeon_mgmt: Add support for 1Gig ports.")
Signed-off-by: Bruce Lane <b.lane130@outlook.com>
---
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
index bb72c0833721..514ee9a180f2 100644
--- a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
@@ -1073,7 +1073,7 @@ static int octeon_mgmt_open(struct net_device *netdev)
 	/* Read the PHY to find the mode of the interface. */
 	if (octeon_mgmt_init_phy(netdev)) {
 		dev_err(p->dev, "Cannot initialize PHY on MIX%d.\n", p->port);
-		goto err_noirq;
+		goto err_nophy;
 	}
 
 	/* Set the mode of the interface, RGMII/MII. */
@@ -1223,7 +1223,12 @@ static int octeon_mgmt_open(struct net_device *netdev)
 	napi_enable(&p->napi);
 
 	return 0;
+
 err_noirq:
+	if (netdev->phydev)
+		phy_disconnect(netdev->phydev);
+	netif_carrier_off(netdev);
+err_nophy:
 	octeon_mgmt_reset_hw(p);
 	dma_unmap_single(p->dev, p->rx_ring_handle,
 			 ring_size_to_bytes(OCTEON_MGMT_RX_RING_SIZE),
-- 
2.25.1

