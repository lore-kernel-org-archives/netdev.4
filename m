Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111313;
	b=ZGOd2ejcu0jTEm2L+dy31F1muvMvJjxbqUS2ELfXrEvNmpjvA6LMADTct93vW8CY4jdZ
	 vouWYy/RbHpMHr+1udSgoTw429gVhbKdiV9YCXyD/+BmpeTVEQ2q0nMi5k0yQs6OSfCJM
	 GiJGUcad63Rhh91ifsVD3vD8m6pjwj1L+0dG7JFLcLgb1xGioBpsebRq+Xec/osgbHgAq
	 ZLyYIfRqHrHus5tZUgkpUuJCDAyjXiJGTlZH4jf8OX+JPiE0J4TH6bXIMphPengTgSA1g
	 crCJN8ghXAu03DzhuwSugTY1zWVYfvcG685kJO0kjLYncetlkXDYCWYq27/HEG4XE0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MY3t0R6mIVjjv24PuTxPtDVQNU7YCOE1n9o4Z72rbC4=;
	b=nFQEN7lB0xAqVcStep25bf6HWUJ/XjFvhd7HINUHQHkWv4W0jUEZj6yzTNSK2XawyEnC
	 qQb98xBkRejMxGiKlxh53fKBWNwsHH+81FyC33QTLaXaP6SnlAAmpMlIogZIpz33eK5LD
	 i4rnA9tGQ6/fkK8tgmnonFx/SZuY5QaveThZjCKJQOMjt3FTTxucCf3fdYUXeVEdbeGL2
	 5h5FtQZcgn5iV/F9Qjj7N6M//dP/8yA4mBO1fO/W8w8dMR8yYyA+Oa31V1IlTK9jIShFU
	 LSbkDoeZIOWWkuQK8mudGYUC1KJ1nw7hSSXovxXb+aJAaHdJIy6FWSed8bUf6ms/L2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=LTEQuWnP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.19
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143E606A320;
	Thu, 19 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A143E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=LTEQuWnP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0QmcsC/kpMvov6VbnJrU1rOgKqsfk4nKE/KpIz5SU1D7FM0CGjDkoA4op//ClmTFbM+rySBJLv92GbFQRoFy3lc10sKjlFsEQ5SmUh7Yet9IXz6eEn563rxkA4GVMB82kxcdVpvaMA4TnXLcmfXdQ3nn78WkU2bSqrKz0aKhwSqmucj9muGtqrUhvc0cNDjuSc2vU6or2hwnaHEFXexTAZyExXwNZR9LTRUB1kK3dTdXdMXF2OlInn9oZAdJPa6IifiSRKthQD+CyC+cNim+dHCGOc8QXIVzJvXZ1hhX9hdhVGLW7cVhJqJk78C7CnKxMj0AW2eC2K82K6qPOUCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY3t0R6mIVjjv24PuTxPtDVQNU7YCOE1n9o4Z72rbC4=;
 b=cwPNeqL8a1d4C8gdALYy5VRRvrVO/i9wi1B2O/L0hU4WrEv47S8UmQbd1iWHnRBzQUlQnvPHCVN/wmi2Ghe4YwweP7YjeuUsw31Lb0Uok3z60K6/cQ+B5+Hbv7nAftUwpjIC6Yn+4wBSJpOsgzeKUhXWfZH1WUamrYA26XipeYxQq8yFB8KLZFZoTsWF/29hRY7BGBU6sdh/xLdsN2ga+FoO1QXkAAqspgfp3HY92HUZYsPYjhhPp5rFCPI68nul04m3lnzInr0sB+5KXjI3RPmxtnOc0GAT6jzLcycc3eXqg+T1qSETU0jh/pTH1X1StrsvybfZ+nr7jYhXm7X8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY3t0R6mIVjjv24PuTxPtDVQNU7YCOE1n9o4Z72rbC4=;
 b=LTEQuWnPgJQYzUDIBqSBXmFOinTy9wQtu4fqm3veWGmFoGtIZmb9ZwemM78dUzdLPG6etQ7joK9LHywqXR0rmU3KGdKfi8apb58Uo09TQSaSYtcfSAchZz4b506rw7Qg824QeNvD9xIGD9TgDT5Rb7HR7M0VI13umo6Oi5Ysz3bQN4FwfljSC4IWTlN72wX3RFVE92qUBJWTaBVcLkKH24lM8LtTzoibfvhc4G9g3uxL529wjNV481OWlsW3l9AMyEcsSkWT8S1RD7OVvi5Y/KfrPssBx4z5/j8SqaiX4S1pmwELeS53R9FXt2nzmwSJWbbCtiUydq9WU+Z/SqExXQ==
Received: from WA1PEPF00005B73.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::60d)
 by DBAPR07MB6488.eurprd07.prod.outlook.com (2603:10a6:10:186::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 18:01:49 +0000
Received: from WA1PEPF000099CD.eurprd04.prod.outlook.com (2603:10a6:1d8::165)
 by WA1PEPF00005B73.outlook.office365.com (2603:10a6:1d8::60d) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12
 via Frontend Transport; Thu, 19 Nov 2026 18:01:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 WA1PEPF000099CD.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 18:01:48 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 90BCF20D39;
	Thu, 19 Nov 2026 20:01:46 +0200 (EET)
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
Cc: Olivier Tilmans <olivier.tilmans@nokia.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH net-next v4 1/4] tcp: export CE count in rate_sample
Date: Thu, 19 Nov 2026 19:01:40 +0100
Message-Id: <20261119180143.2912138-2-chia-yu.chang@nokia-bell-labs.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CD:EE_|DBAPR07MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cd9196-525e-44be-86a4-08df46672e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|1800799024|18002099003|22082099003|921020|56012099006|11063799006|261026121527099003|10067099003|261022075727099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	pCxW267JZ5mZMbkLp3eP+oSl+fiqjHI+xmYdxc07DLhd51/04juWxLj4sI5lnNi0YfQgX5AAHOK3Kao0YuG+bI7g5PCafnwC6TQaUZI4X9+kp0nEYH/+HKKwwd4PL8mllWQB2GDqVWBu+NapcKH4ztVyHMlfaCuutKtOOtnZB8JjrnAxHxFyKbUkUt8A8QLArxmaEDp0oawE8VQ5lrBnFvCm7uf7fLV1DBwOlJGhCId3qeWpVH65bMxPRqfGaTIAn4HNJvKOZvmvxFWb7Mkww8TTSNgn4+G0+Zm6Ns1J4GFww7+eaXXEGsXExmQ1Eim2U41IdHoaYiAMzbqfVUb/SMJPUmyB26m6qZSbr1kTY29aoAQtT2MgwLIdQXg4MoTC/xEj+OZsBgkYzBtoq9ZG2wV9K2eribHipFKHBk4TlBKglBA8pD8uaSMu55cZhiNOajZwWgchQnJN0WkssmZ+oszLs4reOB0WcVuyERHv7v8Wtq/sxVnja0Yr+YDiKs2Xu/UOakTj6odwVEIyivWT+eTQDI4bCPmJ5zse1rn2tZu1ZONLykY9AeJCbncmgmZsvF4aphsa+DMlLNkopUv/RvFxL0JQj3rAQaHAe44tOYrrt7UbLJ37HIZxksnJrtooOnec4V0DbqutmRP7959tXsZmjGX3dee2U9kS9uN06DzdBqWxj2l1lq/UKa4KnY9uiHt4FPaXx1unbYSX43L+LSVMMjTODAhrZB79OSGG+s+19zBezFCa78WgM65jnoBc
X-Forefront-Antispam-Report:
	CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(1800799024)(18002099003)(22082099003)(921020)(56012099006)(11063799006)(261026121527099003)(10067099003)(261022075727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6/Q+4YAeLdbJk9lWN517Z7qNyYcFAivYUS50mR18PdB43lg3B+rgHjirbvTLsTN7j5uPew6srfUm6yuY9VQzE0WiXqOuaegP10oczK8ofGcv6H+FqyakqDws4wGwV87g+FDuZ6NIGbY7Jzx8DS+SqoFa7cJyQ0ehRgpVyE/u5CbrbtEK65osinZMuY49VD6VQNXjJYPLpm3ipxTfKCj7OOwnCPdFiKGnZXJpzMQInuNYox/KCyZkGgtNMKrYFyqZrKek+m6W7Km94UutBATh7iiogMlthmDuwoMwvP2Akp7wi67N+HbdWnaQRg/GpKZ52vmDsPD9vi5QDsxIH7xNTfAtb6twVnWIG9mRaEPkRiowgQR+FJ/ZLjf0Dt0UmNDY6JCPH5PQNHHY+fxaFfc30j0GFHJ2ZSOTzGVXMeaP5qcpNnIgaIfWjP4ZurDV0hT2
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:01:48.1146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cd9196-525e-44be-86a4-08df46672e4c
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-WA1PEPF000099CD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6488

From: Ilpo Järvinen <ij@kernel.org>

Store the number of newly ACKed/SACKed CE-marked packets in rate_sample.
This will be used by upcoming congestion control algorithms, e.g.,
TCP Prague, that need access to AccECN-derived congestion info.

For RFC3168 ECN mode, acked_sacked_ce equals delivered when FLAG_ECE
is present. For AccECN mode, it carries the derived CE-marked packets
from AccECN options or ACE field based on RFC9768.

Signed-off-by: Ilpo Järvinen <ij@kernel.org>
Co-developed-by: Olivier Tilmans <olivier.tilmans@nokia.com>
Signed-off-by: Olivier Tilmans <olivier.tilmans@nokia.com>
Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

--
v3:
- Improve commit message
- Rename ece_delta to acked_sacked_ce
- Remove redundant rate_sample initializer
---
 include/net/tcp.h    |  1 +
 net/ipv4/tcp_input.c | 40 +++++++++++++++++++---------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 25d11fab1b03..4b1159e6c125 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1353,6 +1353,7 @@ struct rate_sample {
 	long rtt_us;		/* RTT of last (S)ACKed packet (or -1) */
 	int  losses;		/* number of packets marked lost upon ACK */
 	u32  acked_sacked;	/* number of packets newly (S)ACKed upon ACK */
+	u32  acked_sacked_ce;	/* number of packets ECE-marked upon ACK */
 	u32  prior_in_flight;	/* in flight before this ACK */
 	u32  last_end_seq;	/* end_seq of most recently ACKed packet */
 	bool is_app_limited;	/* is sample from packet with bubble in pipe? */
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 67e4aa73bd6a..72826cafa246 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -616,9 +616,10 @@ static u32 __tcp_accecn_process(struct sock *sk, const struct sk_buff *skb,
 	return safe_delta;
 }
 
-static u32 tcp_accecn_process(struct sock *sk, const struct sk_buff *skb,
-			      u32 delivered_pkts, u32 delivered_bytes,
-			      u64 prior_bytes_acked, int *flag)
+static void tcp_accecn_process(struct sock *sk, struct rate_sample *rs,
+			       const struct sk_buff *skb, u32 delivered_pkts,
+			       u32 delivered_bytes, u64 prior_bytes_acked,
+			       int *flag)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 	u32 delta;
@@ -628,11 +629,11 @@ static u32 tcp_accecn_process(struct sock *sk, const struct sk_buff *skb,
 	if (delta > 0) {
 		tcp_count_delivered_ce(tp, delta);
 		*flag |= FLAG_ECE;
+		rs->acked_sacked_ce = delta;
 		/* Recalculate header predictor */
 		if (tp->pred_flags)
 			tcp_fast_path_on(tp);
 	}
-	return delta;
 }
 
 /* Buffer size and advertised window tuning.
@@ -4248,8 +4249,8 @@ static void tcp_xmit_recovery(struct sock *sk, int rexmit)
 }
 
 /* Returns the number of packets newly acked or sacked by the current ACK */
-static u32 tcp_newly_delivered(struct sock *sk, u32 prior_delivered,
-			       u32 ecn_count, int flag)
+static u32 tcp_newly_delivered(struct sock *sk, struct rate_sample *rs,
+			       u32 prior_delivered, int flag)
 {
 	const struct net *net = sock_net(sk);
 	struct tcp_sock *tp = tcp_sk(sk);
@@ -4260,8 +4261,9 @@ static u32 tcp_newly_delivered(struct sock *sk, u32 prior_delivered,
 
 	if (flag & FLAG_ECE) {
 		if (tcp_ecn_mode_rfc3168(tp))
-			ecn_count = delivered;
-		NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE, ecn_count);
+			rs->acked_sacked_ce = delivered;
+		NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE,
+			      rs->acked_sacked_ce);
 	}
 
 	return delivered;
@@ -4327,7 +4329,6 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 	u32 delivered = tp->delivered;
 	u32 lost = tp->lost;
 	int rexmit = REXMIT_NONE; /* Flag to (re)transmit to recover losses */
-	u32 ecn_count = 0;	  /* Did we receive ECE/an AccECN ACE update? */
 	u32 prior_fack;
 
 	sack_state.first_sackt = 0;
@@ -4441,10 +4442,9 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 	tcp_rack_update_reo_wnd(sk, &rs);
 
 	if (tcp_ecn_mode_accecn(tp))
-		ecn_count = tcp_accecn_process(sk, skb,
-					       tp->delivered - delivered,
-					       sack_state.delivered_bytes,
-					       prior_bytes_acked, &flag);
+		tcp_accecn_process(sk, &rs, skb, tp->delivered - delivered,
+				   sack_state.delivered_bytes,
+				   prior_bytes_acked, &flag);
 
 	tcp_in_ack_event(sk, flag);
 
@@ -4470,7 +4470,7 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 	if ((flag & FLAG_FORWARD_PROGRESS) || !(flag & FLAG_NOT_DUP))
 		sk_dst_confirm(sk);
 
-	delivered = tcp_newly_delivered(sk, delivered, ecn_count, flag);
+	delivered = tcp_newly_delivered(sk, &rs, delivered, flag);
 
 	lost = tp->lost - lost;			/* freshly marked lost */
 	rs.is_ack_delayed = !!(flag & FLAG_ACK_MAYBE_DELAYED);
@@ -4481,17 +4481,15 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 
 no_queue:
 	if (tcp_ecn_mode_accecn(tp))
-		ecn_count = tcp_accecn_process(sk, skb,
-					       tp->delivered - delivered,
-					       sack_state.delivered_bytes,
-					       prior_bytes_acked, &flag);
-
+		tcp_accecn_process(sk, &rs, skb, tp->delivered - delivered,
+				   sack_state.delivered_bytes,
+				   prior_bytes_acked, &flag);
 	tcp_in_ack_event(sk, flag);
 	/* If data was DSACKed, see if we can undo a cwnd reduction. */
 	if (flag & FLAG_DSACKING_ACK) {
 		tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &flag,
 				      &rexmit);
-		tcp_newly_delivered(sk, delivered, ecn_count, flag);
+		tcp_newly_delivered(sk, &rs, delivered, flag);
 	}
 	/* If this ack opens up a zero window, clear backoff.  It was
 	 * being used to time the probes, and is probably far higher than
@@ -4518,7 +4516,7 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 						&sack_state);
 		tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &flag,
 				      &rexmit);
-		tcp_newly_delivered(sk, delivered, ecn_count, flag);
+		tcp_newly_delivered(sk, &rs, delivered, flag);
 		tcp_xmit_recovery(sk, rexmit);
 	}
 
-- 
2.34.1

