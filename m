Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111313;
	b=vixRbHM6uApnnbRM/QKdLKbLV05ZPZcETyMjGOBynAfccG93k0oogUXbc1mPrWxKkU2G
	 lKe6sy1CUXJTGrOZO2hZ2R+5aTJM3nf5qXej37QiBVT6VjkLS+NIrWe5cVBOmX0bKPBF/
	 8gKyHGWcwn+CN+YYz7vmbI3x7dcooB3uIWb9qYjQ1jDRC/mKO939AybPdYYpa1UFIyPLA
	 TS8uT07qdwvJShKd0WhExcIi8KzBNaNAEdig+KndQcTUzLlupgGZs45g4ziZ8vap6ak6c
	 Q1vIHGDB0emK8kAjd0qcO7xwiqfMYP4/IAIaqyLnpn12seqfvvGuoRs0VAmuoxnok9Q==
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
	bh=elh99CQp9IfkfP6c6rVHcWjZMVI/UtW+jJfkl3iJqq8=;
	b=3VuQJm5XeJFgxCR5p7nmmSJnEFv6uh4s8AxnVy9DlBjPfyu3l52MNzHf1uuF/YUJfsxc
	 eaSUjK+wnD8oMpDqy5L9q9gTHAgnrxsXgNZ7zg1XQqXAt8daVXZ03l7CAiVDAv5XpnPCP
	 WK23fYt3kESmSZ/pwvvL/zjtXnCwnpOkudl+1uRGLzYAbpJiggG+A4RSvt7dXkFlLLvJx
	 9qSQO7rfxhO4Tk/uhZCgNDPGHKEEav+uQypcv4pjpXMVv9Ce4SDZUlJ6KnYmGOb5/bVOd
	 Uxrc4KPFOJx8bX7gyxpPN2UrS3iAqWUFuxRssgYpjfuRmATAHXS4+bPkfneuJNxkTtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=TKaf4m2v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD18606A32C;
	Thu, 19 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD18606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=TKaf4m2v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMPdHV3XdikUDmvHzhczSk+iqkEP8jp5PjyVf92J6738Agvx52P5hyoJ0B5Hfqr/BLAhDVUP7UQxCZTDXvsbel2k2ZqvOV5CurDKupbP2dSvYYHs6WvjbpZPirCLeLr+4fcoZBn8fg0xubDiw6q/saQle0NAYpEum6r8MP1D+jw9IJ3McqZ+CAFozYCGHGmTK4XIEagSa/LGwDPZqfQSqN2V9S0pTenAAMnvlKbtMGT1lmGmLCGfYz9vHh6+7gJszyqxcV4POGLPvkjKjKsiGId8u2+QL+cEWTqE+2CKGZy7Z0BnQwXlYKkxlfj2uRPcUCEOfJvLMdlZnJi0IWfMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elh99CQp9IfkfP6c6rVHcWjZMVI/UtW+jJfkl3iJqq8=;
 b=fKCxsKRz0UIjAggX4pQ9E8FfmeCzJ7eizKPyM/iyFnNDEy0AEnE2r9R4GDBuaEuSMSy7U7unt7AZFbMFmqmLwGufQSYuVYfKpnyhf5ZKOE4R52r5LSAiYMIE+73cL+10xrYEanwZ8mPKsmvZ1nozyxdCD2f0/ZlKJOG8hWd8GS0+V32ISkPPge3jQVLx6Pm+TSchWkdpQVfqYAyuqC82KoTBb93GKVzaLqD1q4M3vdofw+DIrwI0tYsVH1bpLri1guMS7Uh62Xx7Z5YcOdUYziPY2PiZFKAGLvQ3hkhY0wjYQdNyR9ENR8nI8ztJ3Y/jCuldFY15Tf6J9RqsgOalQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elh99CQp9IfkfP6c6rVHcWjZMVI/UtW+jJfkl3iJqq8=;
 b=TKaf4m2vn34hy76KBs71yoB0p5eAG0mX0KPSusa7dg+LIn8x2lVTFs2V3OYtJyD/NNAF6E7GosoGRKENxqjRdNYzCaFSsEEiwBtCF6CkvurZce90bVo4/7sT06mZJwquJJganl5eLVHMRIx3yIa1K6gw/UCleZR+h7JmyOBbL9KVqg1uiorbvBOjw0BOq2ExL4UpzD90rSglG/cmMCoaeeSnaLoRxuyVZoIH7jM0FKd056NJY574X/oCV5+3pzvXwUcMEdoIj4PR5grW6iS90981m+eAxoLyFQGKyvWsdz5m/y6KoWBe+5JAD6JkAQzDqjP+N2tNBXAolbshMmEMQw==
Received: from AS4P195CA0031.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::10)
 by AM6PPFA2F9C4341.eurprd07.prod.outlook.com (2603:10a6:20f:fff1::a60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:01:48 +0000
Received: from AM1PEPF000C1AD5.eurprd02.prod.outlook.com
 (2603:10a6:20b:65a:cafe::9f) by AS4P195CA0031.outlook.office365.com
 (2603:10a6:20b:65a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.11 via Frontend Transport; Thu,
 19 Nov 2026 18:01:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 AM1PEPF000C1AD5.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 18:01:48 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 7CE2220B9F;
	Thu, 19 Nov 2026 20:01:47 +0200 (EET)
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
Subject: [PATCH net-next v4 2/4] tcp: rename ECN transmit helper function
Date: Thu, 19 Nov 2026 19:01:41 +0100
Message-Id: <20261119180143.2912138-3-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD5:EE_|AM6PPFA2F9C4341:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f380e7a-824d-4893-3fc4-08df46672e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|23010399003|921020|10067099003|56012099006|11063799006|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6v8MiB54exW0dKHbxQLQ6GQFo5VtQoMOgaIAaB47F8d57cyRdE7aluQxBlHNllBFQXILjWJo/XQL0CGckZk/EiztEPXNjsT7xLAPZwcY9/iakjUvwP9d5nVmnO39QYUwWIHoipo+HI+Ax9OmlKTHf+mwxfSEpGVr0i/zx+bIv5hftSax3NdsRsd0Bwf+yZMpGIeXOJdOnNekpA0ygUaYtRmQf/bkSTC8MtWvHSpLX4ZNyLGaBRCrDYE9PNurJlwsQlMIw0cebyhYR/X+SpJIcqF6NmI4NthYuYR/rkAa705MvOwb4bY7ucondVyQ/LDdNCuaKpafATMBNiGdXq8JKDHVVCY1ZshFrQ2ASzwxh8sYxooQpP61jvnn20SWjocJTSXAE3/0YeWg0Fo+PwnI5S1jvRmhDoqYb9ruDbRLdzT8P7YKxP6pweA6NiO7JoKUA8bo86+GXI1WtrgaJF61TQD3QeJhrFK6aoq4NimQnNof4kBY6UGDOIfwlywdGJ9rf7SgKfLeSpNV3b6WpHGFfnOOS5D13J3JvqljyKeypZDNEeTVAqVhbOv/DsaY4t6zagBtrp7O0hAs1GrrPlIsKbYDMjKMEUgtl6VGDWXOIdLyFHXnFNsb0j/UiqrKFG3M8JyWftkVXJTt7OwCehcHALJN2pjgUDnIcIkawbUqRGzuUAurdEOIHKfJtFMhqag1v7ps6IE5xaTzyISEIWdoSqE3C4O4lkFYSXO93lk2bc8PZni30525dLPLz2+sbSsQ
X-Forefront-Antispam-Report:
	CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(23010399003)(921020)(10067099003)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1U+QczpXaprSZvOvPZLgpBOCFqsomYGmd9+ld8Fc3l3pFUSpa9QrjpXQLNXl9dWPwzWPsk2amuxT5sVY7OZj6FR1loPdgoEcbPjmXJTYFH47P+ySHO94P/6mJLDWMNGAXfVTjm/5QORfBktJKigPUIBDyBKyZ9CQehuG+SaUzBsht4xeYi7WedlvIxDEh5bUwhw5dsOqC3DAJMXBRKsObiZrl9qmjc5Qm6RU36tsVzDUZHI6eCRKchPXwiG1iezV9nF7Yw+G3dYr+elqvpaw4DyrdTi1Mo83jikbdhrEvpxerpCmn0XpW+raAzYZjRxufjXW6lEUcBbVEF/x9Q4FnKnn7ozM53pRmk9NHZiavQLctzX0DFzWZb+bJOyG49ovnXv6B/4nWjOM85cUVX4UGsuE/f+gNDA52iMdsQGSafKuU6GeVZCe/FHTwGw61eZl
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:01:48.6573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f380e7a-824d-4893-3fc4-08df46672e9d
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AM1PEPF000C1AD5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPFA2F9C4341

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Rename INET_ECN_xmit_ect_1_negotiation() to
INET_ECN_xmit_negotiation_ect(). The previous name suggests that the
helper always uses ECT(1), while it actually chooses the ECT codepoint
to be used during the ECN negotiation.

This renaming also prepares for the introduction of a similarly named
helper function for established connections in the followup patch.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

--
v3:
- Rename helper to better reflect its behavior
---
 include/net/tcp_ecn.h | 6 +++---
 net/ipv4/tcp_cong.c   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
index 865d5c5a7718..9ca016d98972 100644
--- a/include/net/tcp_ecn.h
+++ b/include/net/tcp_ecn.h
@@ -33,7 +33,7 @@ enum tcp_accecn_option {
 };
 
 /* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_NEGOTIATION flag */
-static inline void INET_ECN_xmit_ect_1_negotiation(struct sock *sk)
+static inline void INET_ECN_xmit_negotiation_ect(struct sock *sk)
 {
 	__INET_ECN_xmit(sk, tcp_ca_ect_1_negotiation(sk));
 }
@@ -583,7 +583,7 @@ static inline void tcp_ecn_send_synack(struct sock *sk, struct sk_buff *skb)
 		TCP_SKB_CB(skb)->tcp_flags &= ~TCPHDR_ECE;
 	else if (tcp_ca_needs_ecn(sk) ||
 		 tcp_bpf_ca_needs_ecn(sk))
-		INET_ECN_xmit_ect_1_negotiation(sk);
+		INET_ECN_xmit_negotiation_ect(sk);
 
 	if (tp->ecn_flags & TCP_ECN_MODE_ACCECN) {
 		TCP_SKB_CB(skb)->tcp_flags &= ~TCPHDR_ACE;
@@ -618,7 +618,7 @@ static inline void tcp_ecn_send_syn(struct sock *sk, struct sk_buff *skb)
 
 	if (use_ecn) {
 		if (tcp_ca_needs_ecn(sk) || bpf_needs_ecn)
-			INET_ECN_xmit_ect_1_negotiation(sk);
+			INET_ECN_xmit_negotiation_ect(sk);
 
 		TCP_SKB_CB(skb)->tcp_flags |= TCPHDR_ECE | TCPHDR_CWR;
 		if (use_accecn) {
diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index e3f462f161dd..3331679c81d7 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -228,7 +228,7 @@ void tcp_assign_congestion_control(struct sock *sk)
 
 	memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
 	if (ca->flags & TCP_CONG_NEEDS_ECN)
-		INET_ECN_xmit_ect_1_negotiation(sk);
+		INET_ECN_xmit_negotiation_ect(sk);
 	else
 		INET_ECN_dontxmit(sk);
 }
@@ -258,7 +258,7 @@ static void tcp_reinit_congestion_control(struct sock *sk,
 	memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
 
 	if (ca->flags & TCP_CONG_NEEDS_ECN)
-		INET_ECN_xmit_ect_1_negotiation(sk);
+		INET_ECN_xmit_negotiation_ect(sk);
 	else
 		INET_ECN_dontxmit(sk);
 
-- 
2.34.1

