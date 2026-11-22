Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795365950;
	b=muQEjadc4z4Ro1MUGiFA9GivnC9+gwKPrQeosiNcLzLM84Rb6E2N7e2t1m8wyPbdGo1e
	 qCalj3Lll7bwl65FFKhr8aYuh5PMBuizAp6XOxY0oy1l5mSyJUt9gOmEGtWqqpP1vvWjF
	 pvxGbFBQ0H0uVEempshFNLwL1J9etthigiv59tHzRjOHQtNVnW3Rh/7v+B/oP40slprvz
	 mcxa59qb7oii9g1ZmpDkJyiTY7S+vvT5XIRb04DlZdHeuVrvblKB/qY/9xUgzHYtF2jDk
	 uD/R7cfr5uHtQGQuyc0/9k42/ixo4l/k5BmF31xozxjQzvLgVQ9GQMRY5ebVR4E/vdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365950;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lF5CeEItLt42/sGbDl8xkJ1TFb35Qztm89KYQm4SqIY=;
	b=pvndwwQFm1oyzmL8KqK9hQZ6VDzFwunGYCm7rFddEz+AZd+EPSIAPXesihY5RC3LSxwT
	 L8uPoBEdbIQ7XNfQVXeYA28CIGeTwvsTEqcDjgaVa/e3bHwmEIdZ2PDQBrLtgaXtOteNf
	 y69hdxjyze2ZhakiodQxSeUd0w7MIU7SZ+N3ki9XSZPVevKgqJOiv7W4Yoe+4AQ3MtNyR
	 gYkpbnqJVab1zzwTZO5k72GQKVIdFuGwe0ioCtCb3xAbReUhGIhR484jmyU9knhphS4+N
	 SsMxjbvvh4WBdruDjFkQrFYkyDXjz/V0oEOleb0fsDJHzInf9Yt4P/00ysn70EpggnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CXZwtwmG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.61
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012061.outbound.protection.outlook.com [52.103.2.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84329606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84329606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CXZwtwmG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKfAsjrSy0a2J0RjQSK0gIQs6e5hlTcGNh5Ev+mMEcDzXc9cPzK22XGw7xybovhlwNHvej0Nwol/NChra96O2mcfJH+oN8Fn7J40TT4+5xndgOT6bzIzMmkiM+xnIsUX8o/B3v60xQhpR03mHVY71+SwaZid+29tVUKk0ibdvgvrrADG3yYV3UPdRJI/SSZP5rfUcj4oF2N9qE3v87gppjD7XGPRO7sfsLSXbNF5Ru426UaU/bbl1bAurLu312mH3qUilAh685FP0/+oAnmyx3E9vKdTCWbs5+B/V7YqfZF6xzS/E+RLRZfjLITvYeO7OYup3tt0KUEmxuGeFRdrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF5CeEItLt42/sGbDl8xkJ1TFb35Qztm89KYQm4SqIY=;
 b=tufb5KhtJ/leZmJAppuur+6nZ/bMuciaibbirEDFbpZJrrl91kNkUfx7IoCU6mqh6gONgCqlLoDs57CnSJTcUWpmRldzQoJvgI+G//ciF1oDtJnRIZNZ6l8l7t0kJMbxoriH8OvdWW5o1k+isuKNDGm41YvKU4msGS5isoBXsQBvGaGzkedbdyfsjij4bIFENCrqBUCubaYebqIwmdy1+fwf/e3YH2tdU5P7eRvgr0dzH2AHsFbzlpLZyzYBIrBEYt2GSzXTAxA8GtewvagcQU89ZSXG4l1ZWODGXDLO7gn7ng87CD9QPsuiTcMmnGsCH4FOY0NRowFpD7i+6UsLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lF5CeEItLt42/sGbDl8xkJ1TFb35Qztm89KYQm4SqIY=;
 b=CXZwtwmGl2ynMBr1QblATXIZc/hNY8svrY3nQmBFjqznh8a6eAVfTNgEQCa9gTqDONWUlX/vHh/ySCNlAUqE4qpSiVxeVdRLbBXOiatzlImQ8uvzRS6PQZe7zaUBBSXd6NEz+K9Wdu4rZfaPdhIOvKsm0WvSDEIrqxnGGFK2/hWY6vlMXW/aHjR1zX8AM/ZlGm+TCNZFO4zxMdARTEVeLk3QjVZbnttxHdw1TZBUo0kYw1RF3VMAJbj0q/6XEQLDtSGse2UPI2Hm4QwLFF5XSl7U7mYlfSg7yg0tNQoiv2aMJZhJBhHB/r3ndntx9gZdH00lOIcUOG1RcSBVv3P5Jw==
Received: from BN8PR06MB6177.namprd06.prod.outlook.com (2603:10b6:408:4d::27)
 by DS0PR06MB10391.namprd06.prod.outlook.com (2603:10b6:8:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sun, 22 Nov
 2026 16:45:48 +0000
Received: from BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f]) by BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f%3]) with mapi id 15.21.0639.011; Sun, 22 Nov 2026
 16:45:47 +0000
From: b.lane130@outlook.com
To: bharat@chelsio.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	Bruce Lane <b.lane130@outlook.com>
Subject: [PATCH] net: cxgb3: complete the cleanup operations on error paths
Date: Mon, 23 Nov 2026 00:44:27 +0800
Message-ID:
 <BN8PR06MB6177F1B73B4D37AC2315B428A4462@BN8PR06MB6177.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0117.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::6) To BN8PR06MB6177.namprd06.prod.outlook.com
 (2603:10b6:408:4d::27)
X-Microsoft-Original-Message-ID:
 <20261122164427.1517323-1-b.lane130@outlook.com>
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
X-MS-TrafficTypeDiagnostic: BN8PR06MB6177:EE_|DS0PR06MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8d23e2-8d54-43fe-28ca-08df48b80e88
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|41001999006|5062599005|23021999003|15080799012|19110799012|260925184616899003|24021099003|25010399006|8022599003|3412199025|440099028|12091999003|3071699003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UAqOwjpVpEuGTegNNs/zm6nZ2QJnpfiy14inRQYqsFkLHSXLLk06i8bTZtJq?=
 =?us-ascii?Q?6Bxc7ddXuSHZ30s5VdyrCrgdW2duoFDv4FDiJUeKzcUMEn9WoCghVcnf6V+X?=
 =?us-ascii?Q?FbwKGM/U/afah9puCcoe8WPHmkYPVrvPK1krJEze13PiijIT7hoscdNn+l8q?=
 =?us-ascii?Q?wBupXvYAYGXXQu1u11Mp1A6tbDORoUSdq4coXvtyiE6D/CAF/Az3cvyI5evg?=
 =?us-ascii?Q?yIeS/8wqpIS0JxgMe9BmJbgUiUBPCenTF2bs68+xf4CjsNCeAPPrrN6FkPNT?=
 =?us-ascii?Q?Hvw96yav+jZ3ix1lAUOUB8R9sTrJfUFoemOgPH5rl5zNRVGm3UVqbQQYrEp8?=
 =?us-ascii?Q?RTkDsXzenjLsBChAy2k3s545CCFx/g6nKq/r7ZPw3cCL+W4TA6d/sCCpQNmZ?=
 =?us-ascii?Q?/Sqktlm36wZu9hGNxqh2DS9axA/i/lqhySKTmri+5cEZ8OQgwsG9mFMBpT6s?=
 =?us-ascii?Q?1rZpDT193t7CJsiAQNhK7b8Cr8zNQjpTWkr6sKCsacMwANWtUMRDyoBOypue?=
 =?us-ascii?Q?ijRfu3eat+C/gbHv04kPxTlHeFw5Wf8wB/8E7RzM1sfZZq+SPIof7gfdda6N?=
 =?us-ascii?Q?ehCWjkvbqHqRa/eg0EtLi7fdKYQDWvr5aqeAHVe0MuaRaryWA28LZ4Agip0u?=
 =?us-ascii?Q?uZ2VN1WzqeMV7fFMhXCquNwBfgOl1LpQPvQKJN59OtD47kwtWEXOLpsqV9ub?=
 =?us-ascii?Q?4I5QS5AykmNzCcaUm3p5ByjTzefDqqN/c4WvpKZ7JGSbRBcmvGp+vaKvOgvU?=
 =?us-ascii?Q?3kBHgGGienXi5RMXytpvF+/A6aaGxy7k2TaP86cZwXKtBPmCnqGTj9rGYxJg?=
 =?us-ascii?Q?Zuea4hyJfLznxlp0w1McbAX4nHKXXx2bIlZd9hVB0UI+8sPKGgs50cL5vj6P?=
 =?us-ascii?Q?m40rvkOkakpDQPKJdQtuY8B5rze+t9guWfDs85Slazsg/V831sWpgtfTCoCJ?=
 =?us-ascii?Q?oMjsmqtvOCSWOC7fv4z2bFXxPU4zn9CexGlm398bth34tsF1PdC9W+gM+JXT?=
 =?us-ascii?Q?Sg/4A7MglUEQji6uN4EeCAUH/w4D3GRcuCCDyrXOSG248BKQF5Rf3SO6qbR7?=
 =?us-ascii?Q?GX1jFyXc?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Z1M2RbQNwwqOZlxq+yxS5cIyXO/UfaX1L2Thfhn6WeONMXKyWlIXNo2XwQN?=
 =?us-ascii?Q?MuUeVfDXczZEYHDV8hVqwX6uC52rXvus6lpO7H68yhvoAQv7lDHEaIfh4skW?=
 =?us-ascii?Q?lmcWTl2EmjNwrReotSovgM+3CzaBj9RENJDNb8Hdw5MvTsowE7ikdiriKCO3?=
 =?us-ascii?Q?SFZBCuFyZUmTQoFJOwIDRlJQMGtXszqlzAWAQ0BNFzM70E5QzhL4COZYAbho?=
 =?us-ascii?Q?UvNiG6FN2KoaUWUaLPmYL8xsV/VVO3MVpI6Oa5n8qhXD/nlMF/s9qXbJJiJn?=
 =?us-ascii?Q?wZfod2LPItckWIkr45KQaVlnPIWU5pk10CLwZioKvyrzTo+4QJE0YIMTM0jA?=
 =?us-ascii?Q?l9LIe/qmYJ2KNsCV9Qfr3q2o4VfD6iQ6Hc6negBTz5ltcAuazHsvqr2kPd0D?=
 =?us-ascii?Q?YJWL2RD2ng2TLRJozT7dSGrGgR0dHQqnmTjymvtw3qu7uerhOsIik87qzg1F?=
 =?us-ascii?Q?QerGL67XNf8LQmhpisFdyFoz0+bpne36JBBLKQ9Tw/CbEet2yGSUDjYdcQPt?=
 =?us-ascii?Q?rQfEhaU2R3jZ2cjfOQL8vb769wkrASi8ZFTriVAFtCKdLSq4S/8tLdnl0S8W?=
 =?us-ascii?Q?5DbxftRhAPiFLL2Xn8u/3/hxQ/SCxYnzIWWyzGgZ/sOl3g/UYqeT2ZQ8I3r5?=
 =?us-ascii?Q?YQYc8qXxgHt0BLVZ60Lf0+42MUsYD2twGLh2Qtp7fdR75R5luiocD/7zzEK2?=
 =?us-ascii?Q?+J+KIeoVAMcCYgBRcdUScL5Bb5Tcwdh4lhr/swOibkzGAwRr3+qLTqfoQasP?=
 =?us-ascii?Q?0eAnjl8WBuMPZAlr7O34K5qEljzLH6CEDdm8T8N6T7iIsX9mUt/6gn4kagSG?=
 =?us-ascii?Q?23a6Z+svWoiabRfNYTc1DFkJGlUANOL0AInNQHDbj0/mZc2vb3NLMnc1BaKL?=
 =?us-ascii?Q?fMBoc8ygJNIS3my0EYosCGXm1075tf1f03WEDITzr+5oOvk+modBiHMsDGKx?=
 =?us-ascii?Q?YeGu9m5wIA8En3N7m/JVs3bsW0/BSlcFPOUo+TzRMPckKarHQQeS9SzSRzpt?=
 =?us-ascii?Q?hpYSWPNvdtTPygqz+GX+AxYojaqCzvS22egwmK98EHOotwoF4RtJ0uwkhjbf?=
 =?us-ascii?Q?GlzZCNhRzAZrkuos9W3V2YVg7mcE0tpLoBgCSEoe3Nf1NXuSV0r9d0ggdxmT?=
 =?us-ascii?Q?XnWKVqCzBU14njremonFTlhq1L+LhJszUxjfxNWi8Pk7XOCDkDNpxad7g7NG?=
 =?us-ascii?Q?AkFHIyD2GjUBVKQb0jjFDpaRidkNFd5tgsxLRDNkB/Ab9wLS2dkJqAecWzLM?=
 =?us-ascii?Q?WC+PNov7GHETFVpY5DG5P5TueFr+uPSnApKfCvfuyEKVHm3O1vThoGwsJGOn?=
 =?us-ascii?Q?RWdR2pFN2AkIWRKlR3QP/QMRruxvjkQFAbFpz2MipdCJtDcrA3f1FebRFmyt?=
 =?us-ascii?Q?oQn+2drTYPtUBeGAY9qnetdrCfeVQlm2h8P6k+P5KjI0ar25Pib2e95wum8V?=
 =?us-ascii?Q?1iXLhiPXNcMj6UiJjTb+EetZbt8YGdwr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8d23e2-8d54-43fe-28ca-08df48b80e88
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB6177.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 16:45:47.6670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR06MB10391

From: Bruce Lane <b.lane130@outlook.com>

If sysfs_create_group() fails, the error path lacks some
cleanup operations to release sources. Add corresponding
cleanup functions under out_close_led label.

Signed-off-by: Bruce Lane <b.lane130@outlook.com>
---
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
index 3bee82bc0680..a6693f332d25 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
@@ -3381,6 +3381,15 @@ static int init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;
 
 out_close_led:
+	if (is_offload(adapter))
+		cxgb3_adapter_unofld(adapter);
+
+	for_each_port(adapter, i)
+		if (test_bit(i, &adapter->registered_device_map))
+			unregister_netdev(adapter->port[i]);
+
+	cxgb_disable_msi(adapter);
+
 	t3_set_reg_field(adapter, A_T3DBG_GPIO_EN, F_GPIO0_OUT_VAL, 0);
 
 out_free_dev:
-- 
2.25.1

