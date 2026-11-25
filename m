Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570501;
	b=fM6H6fSNov5ZtjpuRKXEYo6pnhDkTGMVgMb1xksrfTFYORPYwzo8TF7YC78DasJXUzcB
	 Wwn4cz9pCRPmTgUReqe2TMciCsRSchR+724nQ+dTgq+Tbd/7gw1gWngi9/UvNlLeKBiuY
	 xGq4KFzxO3DSa3AfNivQFhkOuchLOwBJjUj27yJ4R72SjW90ppHvA4vZQiJ5j+GbYOGqk
	 T30f0C12QDBiuYpdUZpEqRhu4MB6RbF5QBwtyIREcrVlkX3mazAnBG0ACKZC4ZCSvjLDc
	 15sPzy92GI9RC4tJJQzoRT+WYP/SxNtuAK5V3XQbbi4Ftdt9U7vsVSlVSQ0XsLWkCUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570501;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qgJxXWaSpJ1ciyJbOdp1ovGrNTn2LqDwwFWHu22EPK0=;
	b=vCp7u8kWzJjPgFwvuyuxZv8HTBeekW3Url41BUhDkpbMBBaJ2IfsnfwDBEBPbZVjazWi
	 xEdnUYV2PIVuDNIKZKueXkqkDLjdDWTK7K2zs6Ywu4x2jLeflNuYJRMsHkOjmDmFf2268
	 VdkRwzyf7h/Nks86OzZtzKER0ZEmwlmUK67fn9q1zpKw6OycjIs5Rhm9aM5zfvRH9tQi9
	 b941r7Zz0Rf9dhPdWhfCkswfl4pxgHvAqwZ+uu4l0134uIzsbo42XCowoV4EvjGBfXHw5
	 92igJpWDuzTi022uQLkYvSbN6MQq9U1H0x9GVo8dOSaHtxlVdIryAbNuGviL/1t7Zxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YYLvPPdd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.69
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E2606A6B0;
	Wed, 25 Nov 2026 01:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21E2606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YYLvPPdd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFjB2C1DInUKC8gVzyFOfLQU/aUcleBSjV26oX+WyiodDQoOxr+uEvjoExmQ31fGU50aMXuRdzVfsRnRwLWluHc3hSuuqslalr/tR25Zyf/toeAQSbRnM9UWEwaNcWAD1coZbRie46zURNfidRK0XR6W5XIUAdAMGLZ0hKOvYV3IwGtk0wMazX0xgiPI3k4VnJIKAHbFLfxCpQ5eANe6fJX8Gwjd7SjSjw4Hn8g/EgMJgjWJzLgb0FaCfJ9VtdWfptWe3DaH5mpnuRYi0E05AI+6hiXdKUBv1eRkpaWTTCP6xPfsWRwHvwsu+tLZArNzmkoeXY62+eNlz0k2CEZA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgJxXWaSpJ1ciyJbOdp1ovGrNTn2LqDwwFWHu22EPK0=;
 b=Z41mrUiO2uALfdV1cdqMZX7TDdv6uQ3hnTeDTdIpjzfbMWbIbu6Njr7TFGPI7UTIMsZ68COLH9v5Izw37/fdV6oh7dmqBaHXxNDV5L6bLHeQsxT/SPbRIADpn9wx6xz5EYb7N1PXveO5xgvdcIvk+e7vWndHAMxYgRQFiBY624tVLYf/VvgofXK1BzcfACKx5mulTtEdeIjiMERPaB3G2uAqIsJWrDF7BS8lZExzoZiAV7VhCPpsKtPgh53p4XgM+3+61+jXa5asGH5rO3wlbXEUeHBrdeNEdBm6QCUdftt+Sq2I7WvvktbmjpUv8PxwjDfXCn7waBAXUKpLCLPKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgJxXWaSpJ1ciyJbOdp1ovGrNTn2LqDwwFWHu22EPK0=;
 b=YYLvPPddMCZeMz56GIa/HYEYWXv5Wod1X1KlwFlMTVmfjVguPclws6u5cLsOz9R5NFRmlrYJanK7lCTO1GTciZ1W/4A6GGCDHjU9UJeEDdBAXFe4ngwNT2BarQ6nFIZ13wbO3KB3iqKv4L9uu6Xuw4cwsodn9uyT69GUtBbWPg0CssALid5GQxCaOCvznFB8NRmimLzdQNPsYytQmFunVxFo/THwF4LU8jot57V8jbLa/PVdYqz+cW8LeqAwnrOwiYjLqci/fITDvRSomXXGE0NxwZ36FRWGrpYv3q8HMee/UsM20cZth3hsjVpcLyLEqHaVJl/37skGD3tAaG3CiQ==
Received: from CH0PR03CA0436.namprd03.prod.outlook.com (2603:10b6:610:10e::33)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:34:55 +0000
Received: from BL2PEPF000352D8.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::1f) by CH0PR03CA0436.outlook.office365.com
 (2603:10b6:610:10e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 01:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352D8.mail.protection.outlook.com (10.167.254.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 01:34:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:36 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:36 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 17:34:32 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, <linux-kernel@vger.kernel.org>, Jianbo Liu
	<jianbol@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>
Subject: [PATCH ipsec 4/4] Revert "xfrm: serialize state GC with device state flush"
Date: Wed, 25 Nov 2026 03:34:12 +0200
Message-ID: <20261125013412.1123866-5-jianbol@nvidia.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261125013412.1123866-1-jianbol@nvidia.com>
References: <20261125013412.1123866-1-jianbol@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D8:EE_|CH2PR12MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bda6ec2-5a96-4143-f055-08df4a944f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|5023799004|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jb/u1Ub/Kk2uHhHxfy3FclbLm1HaqQQeOwEzjETczsSHF+aGhm6gN582wXbVJs+EJHHr9QremgEosI1VFkqFZTUL/GSyIC+EANigwZyHTpYf+dt3naeQYICB777WtBRvqdT5IlUpckG3pnEUE4OLIVqvKEaKGp5lG3nXbcfkmZGa9jUYV/WtN1xz22ckP/1JxvnpucaQDQzFrIDLYcwLyB9bQrZeMfC8Qn8LZjn4CXF3m/tCLvRZW7gID7203GCcKndQwtImgI7Pbnu3180EiliqtzplDFEURKkuvMSeugq7xZ2dRTCXatTln9+xlwftc5y6uOrp0Tf9aZ5RG93vygpEjwuGu/yNIwVFa2W/gjCa/MqX3LuSTWswMdNuIk6Ft8a2l0tHLnvC/sxrtD1tWSUphM6Xx8l28Jq9t+AIzoj9Dm8NOvXhwf85oGe/dDhMoc8lRNR9PcaF2Zcu+G6fgaUpqQ/hNq6rggeXpd5RllJ2MDYGL+YhO5gQwddLQh+FqakocXJGxDC4d2aENv+2Wuq7N7pUMss3PgBuxy1ZJl079ozvN98FNi+DmnolfrfjWFpL5Wqz7dscEOa1eu5RsuSf9LhtbGDMSRy1sQnnSa/kZ++gd/3+EAEhoQB/ZFG5r0nZiE60mADwcStc0u5XRgEdgr5DwNP10I+B35boZke0XyRSwrWve4gIyti+AD73BTc9l8IQlKFw4qn6MzK6sg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+YFziHug2pdkEGOpGRWIDUxENkPlKAgC+BQmUb9ixMD9ESDBCBbbtpxAZ9v0v9iVJ7Zqp4TnPjwgz2JunLrV74NXMjCw7U3ow44PwUExfG8eGXJLSl22rL9sgIRm8BfiillduTLIFI4LnJSKSpFmzFq65HtJ+Y2Oo4GLm4G6V+WhxrPZQ7ORIxGpZWJqN2yBHnIEyZ1TUCNeXl1/5jNGy38O4Y2CEPCnmR77YYkTHfxhI4lYTqO3uBWR1n63OXeV3edL9Liv+pz9k2OKwVD5UZY4qtgxv5cJDSVEFoMGOYJacMW4ry3l/1LHqUrUpFFPrdwefMDVNdKTSFudFxszsPSWMfQYP/dmlwVBv9P7dKZEvVMMG9b5EGR4Zuy9MnmBQjYqbiTBIEASbz/UIXT4V+Fawb7vMx6O8ND+xx93i1SsHNh+x+zh2lEVGSSIVtF2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:34:55.1082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bda6ec2-5a96-4143-f055-08df4a944f1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494

This reverts commit 89fefad9f971bc637fb22373078144f2563c4be9.

The mutex kept the state GC from destroying a state while
xfrm_dev_state_flush() was freeing its device state. It can't cover
xfrm_state_find(), which frees device state under RCU.

The flush now holds a reference on each state it frees, and
xfrm_dev_state_free() lets only one caller free the device state.
Nothing is left for the mutex to protect, so remove it.

This needs "xfrm: Serialize device state teardown". Without that patch
the flush frees the device state of a state it holds no reference on.

Link: https://lore.kernel.org/netdev/aqfZNeR58HLm2x1o@secunet.com/
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
---
 net/xfrm/xfrm_state.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 9883fb3545f8..717c0bdb9559 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -226,7 +226,6 @@ static struct xfrm_state_afinfo __rcu *xfrm_state_afinfo[NPROTO];
 
 static DEFINE_SPINLOCK(xfrm_state_gc_lock);
 static DEFINE_SPINLOCK(xfrm_state_dev_gc_lock);
-static DEFINE_MUTEX(xfrm_state_gc_mutex);
 
 int __xfrm_state_delete(struct xfrm_state *x);
 
@@ -639,10 +638,8 @@ static void xfrm_state_gc_task(struct work_struct *work)
 
 	synchronize_rcu();
 
-	mutex_lock(&xfrm_state_gc_mutex);
 	hlist_for_each_entry_safe(x, tmp, &gc_list, gclist)
 		xfrm_state_gc_destroy(x);
-	mutex_unlock(&xfrm_state_gc_mutex);
 }
 
 static enum hrtimer_restart xfrm_timer_handler(struct hrtimer *me)
@@ -1018,7 +1015,6 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 out:
 	spin_unlock_bh(&net->xfrm.xfrm_state_lock);
 
-	mutex_lock(&xfrm_state_gc_mutex);
 	spin_lock_bh(&xfrm_state_dev_gc_lock);
 	hlist_for_each_entry_safe(x, tmp, &xfrm_state_dev_gc_list, dev_gclist) {
 		xso = &x->xso;
@@ -1035,7 +1031,6 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 		}
 	}
 	spin_unlock_bh(&xfrm_state_dev_gc_lock);
-	mutex_unlock(&xfrm_state_gc_mutex);
 
 	if (!hlist_empty(&flush_list))
 		synchronize_rcu();
-- 
2.39.3

