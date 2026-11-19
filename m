Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111313;
	b=SyUZMfhIvwYp73w6/F58QaQw0kIzfxGAyBkE1eyzU/4I5WUySuRlGDM3zTyGx6KWyBzn
	 +7ALFdL5E8SWFuRQc9Vce1myiMLDdG87KKRFY+erTZxcik1Sp9EId9zZe7mscoJDhzoHy
	 0gYsgWodL5Lpk5wTDMr6DucPPile7CQdbPsB9DSyqMymNT2RucINxPyCjXjYn+cdk/PQw
	 q7jV5WyiMQ1KUU7Jxcv3UFeGwv+n2aQ7q9AoSr4ESnUp63fRBXQrsD/1Q/aJ1lRodcqCk
	 epUlWyxPOTM1xVisGXh/CgXVDgMZaPR4Po1Nt+ST074eU3b3ZM3FVJC6Aciq3S3BjCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Emax/NcE05afarsrgOa4WJsnCfOvWJQ2DKXwhR+o0c0=;
	b=S/z9SV3blUhmQ30ACrUU+WcAhCh06E67mGoMb1ZFtmzdQXiyI/tW2WhycoXQF/Ao9kIs
	 pwm7hBBaqF3vtq7wUgjckODO2X58f7pw3kIbckOtqXGirO5nEinsbvSij1MOEh2CHt4Qf
	 L9hm9iuz4604Mdp3ci3BphVb0K2tJ2d+fotT9YJoK4cqd4VO0oZ+ZH+OI2bVpQW5SinAy
	 94z+yUDE2NE1PhaIzT2iU/apQyybGw1KQKo+Z8EnD9Ff9pEj7nsMhY3gHG49k38sMRMcd
	 BsMJJBChQbCH4Ma93CdNaDA5vUDYcMbYS7glDmjJ0+VFir6cyXiZ2DiHhtqrA7YmxzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=B6A+8qgO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D781606A333;
	Thu, 19 Nov 2026 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D781606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=B6A+8qgO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+dzrMPuN17Ms1jMaKKHi9FNIpkV7V1cdECBKrBTo99key2kwFTn04FxMVDkEX8okdBOAFNsdADuRrxOuE3geJv8U5qgjMgJwJgcJRccw8aThCUsvhsfarDoHocC/onwi7A1V6MbYuD/Jri3wf3YQir78dwSDS2/AvtdjhEMyTbjcsJ0eQxNyGnMMl8ASAFnEuY62iiiaVcQwCV6t/TsHS1Rdp7KTJMBcFgHFv6PtUrT+qv2I6uBQkmdA8VIQoNLvJSYeDh20Ouf1WwccIREQLRwWTRh/FBQsKMf4v9a4aaDytG6DJfrOOZs5k9UYuXtR8KWkYOrhy4WO4JihWLlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emax/NcE05afarsrgOa4WJsnCfOvWJQ2DKXwhR+o0c0=;
 b=ai7c5NZU526QvrnNpBpVmSKKEMsAud1rPI6gDrVf1Lio7PFA3K3kQH0fv7blx34/GSXP+0mHpUekESw/dJRSUe/CIqpJjxoXQDmvmlLviBCp9kV40a41axO1kXQfka3tpznI1rujg4deD2wTYWid0WY6hu1QtVFRC0X/lqJnqhMhfiQ4etCB1wrMZfh9ouk7cExWi7bYseOdcFr9fi7PDjJjZkTsovWCM7nhQYk3g6us/dzcesYCSfnZcqDnv48qVqSvwSSNqslSLsIuSaSm6GwbOl8JfGcr6D+IXBkAAzX0gPpyRGtDZJ9+j9coeXefnYxcDnIPEY756Qr/FJI5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emax/NcE05afarsrgOa4WJsnCfOvWJQ2DKXwhR+o0c0=;
 b=B6A+8qgOpVq/S3wq3Pmc0GQQdZGeCHw50quehCGdxKGMfh5s6IOWojsJ2v8cIsfGbUso72w5KNk1QWERBJ/N6jQePxyDdv6ykr35hlFLFDcB1mD4RuwiQTUZWCa/Mxd9BBUA5tmenFAyKpk3gF1D/Kds0csQAj1P+gIJBL4x7mMHTAMRKHnNsRG+4owoBENVmgmq/fJnOygCJTfVeh8lmkS5jb0UdAds5uo9g75pv0/kxqnFXMBfmnRdwjPxe3bHFHW5OdF4bBclvYAaOh3o2C4yyIHDrC4VQa/yK4BRrlfu+IMX5N5RXJSwwNzIfpc3e/sHdKBjKam5MXKfnE8maA==
Received: from AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::17)
 by BR2PPFBB98BB595.eurprd07.prod.outlook.com (2603:10a6:2d0::18f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:01:49 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:20b:150:cafe::3e) by AM0PR10CA0037.outlook.office365.com
 (2603:10a6:20b:150::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 18:01:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Thu, 19 Nov 2026 18:01:49 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 5DA9E20731;
	Thu, 19 Nov 2026 20:01:48 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuniyu@google.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen0607@gmail.com,
	g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com,
	cheshire@apple.com,
	rs.ietf@gmx.at,
	Jason_Livingood@comcast.com,
	vidhi_goel@apple.com,
	Mike_Rudolph@comcast.com,
	Jeff_Howe@comcast.com,
	srichard@netapp.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH net-next v4 3/4] tcp: add TCP_ECN_SEND_ECT_1 flag for congestion control
Date: Thu, 19 Nov 2026 19:01:42 +0100
Message-Id: <20261119180143.2912138-4-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000056:EE_|BR2PPFBB98BB595:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5456beb-0e8a-41d0-6371-08df46672f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|7416014|23010399003|22082099003|18002099003|261009223027099003|3023799007|921020|261026121527099003|11063799006|261026140227099003|56012099006|261021123027099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	I7aaSkxY8VtRYyEWOUJKgldRXuwofE+Sc4Qqu3pxXW5PBH832f+PZ92gXvawVNdMb6IMClgGZddlsrgjr99b0JUkU5v2zu8Zz8wOtVNFosBgRtnlfu3sTSvFan9mlsYGUj7PEUvZMEdBYr8s/8dnrWog/2MEkgsTrKYG2EoXQ80yuvl7aYgBhdRDzfmtbxypbLRjzmCladnIKwwDEFUIH/GcM4nON1pq/thrNJOOfbPykl+abWBeZQveXScb8RheaZ+wxz15EHs08pa2zWorlgv2pt2HukSglngJOWEa4kTuFTBko/HyhfknH5L0kE909zAA7JrjfEz2HHM8a4cs/CMa9gcYw08z50EfCW15v55PMGeq0svl23RfXQiIcUmQ1c7FuKDxDAX4AK4TD1bBof8aUuiClw95CqCXKA4K7ErpBjfLFQjj2qWCgva79zmiQMALRqla9J9kGh9bVNeh+lPvgQ2V9LxkCms1NB7bOUqf/bf+12t3sxBQX6YUOini5/hZS3JU/+eMsw8eTVcCD3RBVfPO6NjILHHhG1NppHWtAbSIibFw1NcBw6BD7O+x9t2wQrXQGkEIjhKiVxcQBoDx+AayYyIoNreCFwpM036LjqoFOCuX87RmfKRpZw8EedAHmuTu88pLN9Mmvx4vcMrV2mUC+LPTRT2YNCmBDerd2gxJA8GXO51gzttjpsTeOOIGxnIBVgcoQeUFko3TjS+Hoj/J/+R312Nlx1s3eXLJ9H0Ejyf4UF3+JfTrjy6d
X-Forefront-Antispam-Report:
	CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(7416014)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(921020)(261026121527099003)(11063799006)(261026140227099003)(56012099006)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EM5/7CxGchXVZvB+Ua0T19SM1m2rCsB1Tvi8B7XQpZBeN5q4rTa4H1SdTH1FHGIhi+5iHz8aq/CXbWxgUth+rphoEX3XPAXBNxw4kpFOzKE3+5emhrV/WuEKwpYUSwt2G41H0OoljkFfRvaFWhjvi4w6WWiQZBp7js5eZJqFNlVrpq+fzHBI667fT+0SmyG9cQywGvjPUTyCQwHWW8LGm1n7456ZN+J0dA0AKgezKpMN1gv7JkQuJKWBolOH3VqGkSatxsp3myLzbc3i83IdfG8re2kYL5X+8dyY9CFCBSuZDEcZhQCkJEoBiiZlNJMN0heRwC5uGhMEK+PjKRvq6jWUjFApnxzuRzTPF7QSAAQMMfNX0GuNQgsKvKzYki9td+vUJqYTXebWXranDLi8hO/jWmYDAZIOCTLGFh+f3B76t8K1CCQagb8Pb7LFBbzm
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:01:49.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5456beb-0e8a-41d0-6371-08df46672f25
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PPFBB98BB595

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This patch introduces the new TCP_ECN_SEND_ECT_1 bit, which enables
a congestion control module to control whether the connection
transmits using ECT(1) (if the bit is set) or ECT(0) (otherwise),
when congestion control is initialized after ECN negotiation.

A congestion control module, such as the upcoming TCP Prague
using L4S ECN, can set this new TCP_ECN_SEND_ECT_1 bit if it
wants to send the ECT(1) code point in outgoing IP headers.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

--
v3:
- Update commit message
- Update flag name and helper function name to eliminate confusion
---
 include/net/tcp.h     | 1 +
 include/net/tcp_ecn.h | 6 ++++++
 net/ipv4/tcp_cong.c   | 4 +++-
 net/ipv4/tcp_output.c | 2 +-
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 4b1159e6c125..0242fd6bbb07 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -428,6 +428,7 @@ static inline void tcp_dec_quickack_mode(struct sock *sk)
 #define	TCP_ECN_DEMAND_CWR	BIT(2)
 #define	TCP_ECN_SEEN		BIT(3)
 #define	TCP_ECN_MODE_ACCECN	BIT(4)
+#define	TCP_ECN_SEND_ECT_1	BIT(5)
 
 #define	TCP_ECN_DISABLED	0
 #define	TCP_ECN_MODE_PENDING	(TCP_ECN_MODE_RFC3168 | TCP_ECN_MODE_ACCECN)
diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
index 9ca016d98972..ff402cdb988d 100644
--- a/include/net/tcp_ecn.h
+++ b/include/net/tcp_ecn.h
@@ -38,6 +38,12 @@ static inline void INET_ECN_xmit_negotiation_ect(struct sock *sk)
 	__INET_ECN_xmit(sk, tcp_ca_ect_1_negotiation(sk));
 }
 
+/* Apply either ECT(0) or ECT(1) based on TCP_ECN_SEND_ECT_1 flag */
+static inline void INET_ECN_xmit_established_ect(struct sock *sk)
+{
+	__INET_ECN_xmit(sk, tcp_sk(sk)->ecn_flags & TCP_ECN_SEND_ECT_1);
+}
+
 static inline void tcp_ecn_queue_cwr(struct tcp_sock *tp)
 {
 	/* Do not set CWR if in AccECN mode! */
diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index 3331679c81d7..43b0634f7673 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -240,7 +240,9 @@ void tcp_init_congestion_control(struct sock *sk)
 	tcp_sk(sk)->prior_ssthresh = 0;
 	if (icsk->icsk_ca_ops->init)
 		icsk->icsk_ca_ops->init(sk);
-	if (tcp_ca_needs_ecn(sk))
+	if (tcp_ca_needs_accecn(sk))
+		INET_ECN_xmit_established_ect(sk);
+	else if (tcp_ca_needs_ecn(sk))
 		INET_ECN_xmit(sk);
 	else
 		INET_ECN_dontxmit(sk);
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 08d0d4a639fe..7b694479095e 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -350,7 +350,7 @@ static void tcp_ecn_send(struct sock *sk, struct sk_buff *skb,
 	if (tcp_ecn_mode_accecn(tp)) {
 		if (!tcp_accecn_ace_fail_recv(tp) &&
 		    !tcp_accecn_ace_fail_send(tp))
-			INET_ECN_xmit(sk);
+			INET_ECN_xmit_established_ect(sk);
 		else
 			INET_ECN_dontxmit(sk);
 		tcp_accecn_set_ace(tp, skb, th);
-- 
2.34.1

