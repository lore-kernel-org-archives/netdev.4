Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111317;
	b=bdm5qqhZsS4c6E/6gAOLbWI4mbWk+pHgLPrQ5zku80PcO2KrLyf+P7psg+VulxSpmYTQ
	 chTV8JLl8+XtP/3E4vjx2cZEi/2C1uHeDlVgt5au9vOHhewUlcLj/7mIWjcqcuX6NAdHB
	 tzUs2V0hfwg9AS2YYnio600SghbSo1x6E6oH1QVieQuYht65nMmTV9yx8SW4GY0DQqmbe
	 hkDTlZDQhzZ49ZhGRgYqns/3pU4Yd2Vid3409W8dqORLvw8Nigk0Z4GEbl3YwStlVrqdf
	 OtTKVqVs30rSGEn++ULPbKPBCKO4J8DpN16jMM03vSCDCEEQL3qiUvgLNKnsqlVUyeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111317;
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
	bh=wwk5eF2+mMKXqIe+VtISN1H4/bzuwk2VGacuFAA5OwE=;
	b=pvEiDNM1S+1OFlLbQRsIDSCxSgtajcyVcFonaSQDH5Lw9xUVTSJvWn6RY1iEkOvr05jE
	 MeSP4be1PxXWJ35sjbzyHpq4o6afOizR9Mtw/zYmrfV9cTqvabdg5FZUWfvY8TJ110Cys
	 Kg/X8FCixjsLPY484mLmuyEeis4cvktTd9fu5X8edYGAbUOfilS6lctHlgpyc52llHHWb
	 WhI9FWrgTPU0KHzK0R27Vy3c10Y7kqKhebvQG7DkGQgvIo96JJMeMuvtBosRMeJbgmMc2
	 hZPKFYa143tBVjB0RFuMlCgsoteI43m+L6QdyPM3UAMF/gRJwhIhoRl1HoNS1LFmurg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=TX5b5ICR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.32
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64780606A338;
	Thu, 19 Nov 2026 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64780606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=TX5b5ICR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlLA8ae6ckgCq3BV4IH1cmm07dxRG0Gazki6tixY8yPXXRZuWGyiLxsSHRrCNMF/OLLY1HO/kydSPyvDJv7tymRnnRsKVyDdExKUCpiws5y+E/8QSipOzC940wX1WebJEKwuACVKYxvuzhpoRe8fZ3GzhtkNNF3U8BRoiDrQW8nCYhFLznXx6YOdfhcx98MqRkV2CiFoQJhNovZLJCQXJ4BXJ/PM49ao/Ku7qkigeuYv/oSQ+bKHxw+Avhnw5leK8fdX1cNbSQm3WWf2KOJ17tieIa/YMBuVHaw3zbWTeNBeDuzac+yuyM4bGDP+onBnMMYHvG+jmzqYKmQoal6Wng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwk5eF2+mMKXqIe+VtISN1H4/bzuwk2VGacuFAA5OwE=;
 b=JxZk8gUHLhox+xWGbA8bDjjoF+URYwJEiXQLAiZ5u3C4DkAdDVHcQTbu3pfi+Np/KGgM4SYIlEyZkWn9bdU5iem21Wz52Rx1w4lvPA2SitB8dt7w72p9VTA5eCbjQkXxJqBwEWbP6mduzonZmjWQevu5OLmEPKG9D/+/fHV0b/gl9+VFa4KXXhsGlfiRVmKnJptPDufF2tPg9Hjdrn45Xb49HtgPSBztdKIDsQFLCsxR+FypEDZHSn50wZ9O4Ka0Gduv3HjaP/JU/kDkgHW0jBisBwg/+jBqV1WnvvR4/wTeStSyTkNtYC6MjHC+3+d96DeNy1w2eQWBJPvXl524Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwk5eF2+mMKXqIe+VtISN1H4/bzuwk2VGacuFAA5OwE=;
 b=TX5b5ICRK8mwrndbAfeYHaOxUNFtt99PNx1tePIab6AFPSqZG/AIT3Qtn8N/d3iUzUKhriZWaMyj0ch0OAyGsSN3sP8NT8BJZRssQ0G3AqhsgXa0ItF082U2G0Y/H80CqA+QhCD8F05mCYcXOcXS/CTTDeaPD9SLItn+srUcdgXJLkHznRhnyVABQRJ2EpDO1lKDv73l8uqPl9r4WrXaxWagk3vlk/+mDRBkBsG8UtyxRrGcN0WWqf5PPvtL5MJqgKE+mj3olgdDjHm2eGw1T0TRByvYewBr1N71kKer+VfWc97EdPkXPpoXYOSasuiFoQozqcOzc92nv4eUfptLXA==
Received: from PAZP264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::34)
 by DB9PR07MB7067.eurprd07.prod.outlook.com (2603:10a6:10:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 18:01:51 +0000
Received: from ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
 (2603:10a6:102:236:cafe::64) by PAZP264CA0175.outlook.office365.com
 (2603:10a6:102:236::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.18 via Frontend Transport; Thu,
 19 Nov 2026 18:01:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 ZR1PEPF0000E6AF.mail.protection.outlook.com (10.167.241.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 18:01:50 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 4B40A20D39;
	Thu, 19 Nov 2026 20:01:49 +0200 (EET)
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
Subject: [PATCH net-next v4 4/4] tcp: add MSS ceiling callback for congestion control
Date: Thu, 19 Nov 2026 19:01:43 +0100
Message-Id: <20261119180143.2912138-5-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AF:EE_|DB9PR07MB7067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d7deea9-17cf-4a66-6696-08df46672fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|1800799024|18002099003|22082099003|3023799007|921020|56012099006|11063799006|261026140227099003|261026121527099003|261022105027099003|10067099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261102130727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	IkjvzQpgbaBiFebXGzKvKdbp/BThomTcM9bd0zKfKos+huLpkYqi5aNBvz/2Aw3fQJ2uq9Fc7YIXyQXfQoAAHxgRRCjBszgIbXpK4EA1Z5L3NhdJNe41tAfQf0f0mLya5A/59038NHT8Kovr4NNT9lAcECpQPJm62fyS7bQZYKJ1SoKX5qWKI7LP4RAJ287zs1kxcn+s+Iy8z9fpBs15FD+/9Cs2V8vIsy9ykpgvEt8vYEPEagyBIasPD9d6hN8A3Gq2L4x/HDBaWccd/lSKFXEpRgXDFBGLqknlGaRAmCC5I5BvNNLd5sc8tFgNpdm+2oukrvnj2Ht+JX7dvhiFMpGC2FwYoMSdN1oMvSnoOUZqlrMMnmAeVpaq1quzz2bdFhZCIBq96BQyF/YHZSKehwjT4831w2J1OBff5JpCO9WLd5UjxWCTEb7ITOAqRjF9XKrY0lxW40jWykTJ3gryLQqkWQxdIIwW8yDUaLMm0CxD6EVJ93QSta9pkYkV0XL27VzTapSfDGqhCUtvuvnUvQL53UPOvC0hjXusWaaVJM15GkIenLUcGKRMhqLDNzjPy8guadIs9QEFjuC85LdnHlxNl9S3Z7T5xcgMJ6rPNWVxakqFa/uixhtoDrUgi12OzeLn7OJpz9iVYAA316dzXpDQr2qA0f1Af/BJ57XQwHqRxyNDCsBytevYpWI+BmoKyOZFAipd5XQ6NQRZlwST+/0hJtQr69qiUrwNTiUFiRattR2mmTPRZn7G0H2NH99R
X-Forefront-Antispam-Report:
	CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(1800799024)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261102130727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WOOnduSr41ceQUVj2m4X7RqsrCRq5asWej9szcdJG88SNuETnimM4KpDAS74Cl2TEAUTMwnlAjo4qtMGLhftejkw4dxpW1YEeDj21lnM1YoOKPb3wKWP7QDWkpt0aFcn4Y7qH988dDEXarF4YyJVasjtm8P99H1ThRjdEbYgUvDbAxWtxH0GZI00rGQkaOiu/kYP1j4/mxhl4nriEMp8+t50v5P8YMn+LfeUYOiiGBgN0HBY/Esrq5ShRnuoltopcNaNT1h+qYS5HWLgn8ElD3/VsXVOWbPtoV68UJwlUcF4FO6HGdAgrAyf3uM0M9uQxcU6Xv7T80dfbDE3dhbDN0REZM0qfFLXbYrZZdtMQ5h4Odd5QllAa//4fA7UFxLfIG399SHmnfhJSeUMdLfK31rP7FcWRO4onNE+ITsmo04/8GurNshk9PWWiIXyoilh
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:01:50.5979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7deea9-17cf-4a66-6696-08df46672fc6
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7067

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Allow congestion control modules to provide an optional MSS ceiling
through the new mss_ceiling() callback. The TCP stack derives MSS
from PMTU discovery and existing MSS constraints, while the congestion
control may further reduce the effective MSS when needed. The ceiling
is applied during MSS calculation and remains subject to existing PMTU
updates.

Also, tcp_update_mss() is added to allow congestion control modules to
request immediate MSS recomputation after changing their MSS ceiling.
This will be used by upcoming congestion controls, e.g., TCP Prague, that
perform fine-grained rate control at very low rates, e.g., below 1Mbps,
and benefit from reducing the effective MSS while still preserving normal
PMTU handling.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

--
v3:
- Replace mss_cache_set_by_cca with mss_ceiling() callback
- Add tcp_update_mss() helper for immediate MSS recomputation
---
 include/net/tcp.h     |  4 ++++
 net/ipv4/tcp_output.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 0242fd6bbb07..9d398ae09015 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -858,6 +858,7 @@ static inline void tcp_clear_xmit_timers(struct sock *sk)
 
 unsigned int tcp_sync_mss(struct sock *sk, u32 pmtu);
 unsigned int tcp_current_mss(struct sock *sk);
+unsigned int tcp_update_mss(struct sock *sk);
 u32 tcp_clamp_probe0_to_user_timeout(const struct sock *sk, u32 when);
 
 u32 tcp_tso_autosize(const struct sock *sk, unsigned int mss_now,
@@ -1417,6 +1418,9 @@ struct tcp_congestion_ops {
 	/* returns the multiplier used in tcp_sndbuf_expand (optional) */
 	u32 (*sndbuf_expand)(struct sock *sk);
 
+	/* returns the MSS upper bound (optional) */
+	u32 (*mss_ceiling)(struct sock *sk);
+
 /* control/slow paths put last */
 	/* get info for inet_diag (optional) */
 	size_t (*get_info)(struct sock *sk, u32 ext, int *attr,
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 7b694479095e..f70dddd7283b 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2062,6 +2062,10 @@ static inline int __tcp_mtu_to_mss(struct sock *sk, int pmtu)
 
 	mss_now -= psp_sk_overhead(sk);
 
+	/* Apply MSS ceiling from congestion control module, if any */
+	if (icsk->icsk_ca_ops->mss_ceiling)
+		mss_now = min_t(u32, mss_now, icsk->icsk_ca_ops->mss_ceiling(sk));
+
 	/* Clamp it (mss_clamp does not include tcp options) */
 	if (mss_now > tp->rx_opt.mss_clamp)
 		mss_now = tp->rx_opt.mss_clamp;
@@ -2082,6 +2086,7 @@ int tcp_mtu_to_mss(struct sock *sk, int pmtu)
 	return __tcp_mtu_to_mss(sk, pmtu) -
 	       (tcp_sk(sk)->tcp_header_len - sizeof(struct tcphdr));
 }
+EXPORT_SYMBOL(tcp_mtu_to_mss);
 
 /* Inverse of above */
 int tcp_mss_to_mtu(struct sock *sk, int mss)
@@ -2190,6 +2195,17 @@ unsigned int tcp_current_mss(struct sock *sk)
 	return mss_now;
 }
 
+unsigned int tcp_update_mss(struct sock *sk)
+{
+	struct dst_entry *dst = __sk_dst_get(sk);
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	if (!dst)
+		return tp->mss_cache;
+	return tcp_sync_mss(sk, dst_mtu(dst));
+}
+EXPORT_SYMBOL_GPL(tcp_update_mss);
+
 /* RFC2861, slow part. Adjust cwnd, after it was not full during one rto.
  * As additional protections, we do not touch cwnd in retransmission phases,
  * and if application hit its sndbuf limit recently.
-- 
2.34.1

