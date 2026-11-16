Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810960;
	b=hxH1cD6I1M5eWv3mV/G6jyQTUMOFX2aCFMK/nj2wVqSx3W0xOdqbpEsUG9lOjHNNI3/z
	 ZSMG0lQDcWdlbf22eVRSmgv5dvzaKm/afgzoQFpa0CrnBrJEidlWIDdUx2k/qgTiMYekA
	 J5b0pDEt97B+qqBZvufZCuC72oTvKgwPcJxAwbG/nkkwE3dzX9JGq8BR5K5tLWlriJ5SS
	 RaNyxeK8lBijPuoB1r+8YQurBNZoi8jPcUBIkI6QCOrdwvxlIT6BuovaEZ2cGCpywzJSS
	 CBdTSi1J94e907HwV5koKovIQmekaGqib0OeDUglF/I/9ko5QeymrObhAMZvdKFhqYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810960;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=DlRQd1zsIFJLsd297zh0jPbyakgV1NyLHDLyltja3IQ=;
	b=VwGfipuWgfXIxwNim7Tz6qh93/LXEBW4xjwYEpkbg3ondO0fp8b3fUvnuoweH6lkKMFc
	 Y/Dpf5wmk9OpdFgH1w1O6WHWjrGuyvMyTsNRcfjaWxAMOGbjoat+a44yXG8N6Y0/88HXl
	 rClYg5snB/druUtR3rg3RaD9TwpBuvX8hur6Rq77POtD9LIIFylbK7DHQBh/4HyD73o5/
	 K0UeTVgXA909lZDFQiyfXxHcyjjIFgAo5fuplrukj81qobQLnNmOwvLbVmg5ywR8jK0+B
	 Cb8ZfCmg5qQljvuI+AFnqqsySRj6ESz93Ghzdv6rtbq/vynNvXQUBCnbipQeghS90HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=ZifXJgt5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.13
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A06606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=ZifXJgt5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PefUisWi7H6T2Kmxhuo6kfoZIMvFBuW8Oig33C2kjyL/ojF6cbPcX2ZKKVHSgXQTIadSO4wxDhFH7TwvR90KAsupmvAQZ4DTrnoeJqJru1AMOZTeCHaAMiiGAgkIfswC1b7Krxfxv5v7rmg4tnvB7kjsOUEpW3a9K7CkOIwBOE1W5xTItF+lRdhJh3+I7iguIiOjyaPhEl1tRE+01K85el0llGmEZAhhVC3Doa90LXzV2eq+nb91DQ/LUuZgkMoRXCWQKbF3B1bt+sXoA/VpA+lUjA4dCWqEsdBmDpPC8W+te3oB8p5wVCWJ8AB7KOP8v+ASl7CWpfAqnDxSY2msdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlRQd1zsIFJLsd297zh0jPbyakgV1NyLHDLyltja3IQ=;
 b=p2cvkC3Fr0ZGZKBcNeMx3vQovpgW1+gtQCRIQJAkaepj0yQIdAI7v1bOCtn9l/z3N61BZV5BnAf0ekLLpmg5Z3EUHlcga9zHdY9CdDxLx2fWIx9qEfy/qIEbOpPunFCLzyYMNfCGJP4fRIKMh06TYSvVqi/GaWCh0YYaKXZI0NxpzpqOLZnjTrz00RB5jVjK7YsjzZYvTfl3YGhUbp2utDdS2T0UBpBP/XkyWzjXHkzCxbMLDdC+8eGWdf25h/v9cv5nZoiq5mc9NForh2YwD/XuTUH5PlD0MqFzTz83hQQp863Hj8pPdDM5DoK7zdoZYHYZEVsRscNh4UbIo3Rx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlRQd1zsIFJLsd297zh0jPbyakgV1NyLHDLyltja3IQ=;
 b=ZifXJgt5qva51kiAq9WQ61Us7OQqSTs3INYhtpdJRhioGkOgq661OIcE8KJDJ9yaOdNam8LLLwic09p+tKMOSvIM1qYJ5AQaWHkoH2EKJ24qL7xBtsjb0arDNSUXQfuQhnXfd57pxLYBCh+a3ayrWEEhyifUDDidDiQ/MJoT9fiiBzWW2ZYTHOTxMtnfUdBccAlZr8vOQcGz7C1YPxWfTaAz9OIaGTt+53caY5W8w4u46BM8oDUZRN4x1LCb/xbRQ6RrkyzB+OE5UyVEm9UnHNggiFDhsoAt8/j+trywRvhAKw+UMuXfxnLzufNTIRF5xHTcXWy1PAPzZhVaR4PIQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by VI0P189MB3463.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:35:56 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:35:56 +0000
From: Tung Nguyen <tung.quang.nguyen@est.tech>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	jmaloy@redhat.com,
	horms@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Tung Nguyen <tung.quang.nguyen@est.tech>
Subject: [PATCH net v3 1/7] tipc: fix memory leak in tipc_node_xmit()
Date: Mon, 16 Nov 2026 13:34:50 +0700
Message-ID: <20261116063529.6185-2-tung.quang.nguyen@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-1-tung.quang.nguyen@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:990:76::11) To AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:17e::23)
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
X-MS-TrafficTypeDiagnostic: AM7P189MB1137:EE_|VI0P189MB3463:EE_
X-MS-Office365-Filtering-Correlation-Id: c37dc07d-5feb-483d-9dbb-08df43abded1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|10067099003|11063799006|56012099006|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DLeXkvmawGuafCcBdvrGMLFM24giwKw70/2Q9ThfKxKfF7aVNg54+HjUX4WXZuFBSQsrjE0btiw/0iUjGIxqfnl0qXcDpAEx3f+Mp/3kEnU+ZpL8LCNAt18On4xDhcMBZZncq9D0T3VLc1oxWMr2RoL89C+aRn4N2jDy611RCv3lZwRohosOLiCXYK3+WYFw5xsulmHije34tRvJZ1/uhMAL3SZxAZAk8+TP0KnjDA8aYLnZIGELUFuYhkKG3XG9XdDbTJbafkat8JtgFgKDk9i0BU+p/C06N6nTBJdZ9tWZtuQbzHWsZ+LDJAkUDSss4O9Ln1X+eLe9SH7SRq77eVIhsu0gc79uytudtvEe/c7KHM02hJlKlwMuTlhZzvkh1tYPPoleriDOgUvy7B5r0IbbndfsjQ5G5rZuIkVUKrz571z8urYo3AGodrP9o+xCwS0MDC04U+i7VpG0OMdPdP/6Y0F2nlwVVPpoUbWCbQPRs7LKxmoNuYKw8FU3i7JNn+YlhNMFfLMITZU1Kzmm+rqEdERpxrMJXygr7cAZYotvx2zS02bXyZZzSzwmeFjNynRC6XbLgvusd1cFr1oQ0nDbrcSeFBDCMMhjIdOCx7ElnmP4eqmHJh7IhLRRy9hdLZPBKwuh69NN379+t0V2xJv+7WlMPKN5Gxw3My+x1no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(10067099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZ0Tj86So5DvR8biwGfVj3/5LmrTA+QfX8XeXDX23S+mYc3kOdscHsV9jn/5?=
 =?us-ascii?Q?h3/qI26J4hjcQnnscNDW0ucWPfOVP9s/Y4u0KTz+8pMIULkqrBTj+AACNwZx?=
 =?us-ascii?Q?oBXRf/IhFZdfX2/ncrS5s6R2tQnCGIGuJZT5j44gudJEJv/16b8mSqeo6nn3?=
 =?us-ascii?Q?dHUjcf0hq1f9sTLEmCxNzCTQWzZUgMXEDvc4XGo2J5X+PvusteoXL45SoyEl?=
 =?us-ascii?Q?2et547Fvmpm8OkS7AU4uzOtZ+XMjMkZoyTPeXzMrJp0tnsZsxCFbmQQ+YK9Y?=
 =?us-ascii?Q?1+TYSkb9JsHmqvk9PYMAXHsIByl/DCd8G8yS3Y/iFt7vKvaoLZvQD8w/VgEA?=
 =?us-ascii?Q?wRWNwdJxi/SIFa0QlIH3uk9PLfT6ifIcCOcYsxDEfWH53iosNBW5eGE373hO?=
 =?us-ascii?Q?NJbQoQSqCfhfqiXdo8HsnXSi0BET1BA2UdWOr4bgVE4i1vnA/ffZHnfwvikK?=
 =?us-ascii?Q?PyNSklmN02A9h7EFx4KSr6mZIwUp8bCzXj8tIwzl3x+eJUDvqphCJGssQeT5?=
 =?us-ascii?Q?krb7AYaw6TmAN+vugp/0DvDd0LLBRsC7prEAstYaMsDIEN8syBVjY+ALg3GX?=
 =?us-ascii?Q?zm+1ismxywmBkUm9OTpHFLdWFDnv7frIHr7P9uDqhA008Q8x+afeGtYwbw4C?=
 =?us-ascii?Q?KYtMHT8wU+GmDTUJ7Z+FatyOkUUvVTk9StQJ6GZd76+1ehVN06RUzq9QB6Ya?=
 =?us-ascii?Q?03lhv0lMHn6KJSSQ1ArqtJRAnBqdQPRSOy/GozhdvJx2Q23Xdd3F9YTzLJ0T?=
 =?us-ascii?Q?3Eto8/YheK2B7BFvbbe8e1tzOtkHLy6fQEFLjFASF/3YHyYTvvx4O6dYqOXM?=
 =?us-ascii?Q?eGs4KdDg2ztP64h0qBrMIhmFeIwZZsgDf1USlJrZ3qdOH3eM+5fjsFVWKg5u?=
 =?us-ascii?Q?y3JzqgkYenmjoB1ib9a5IiqUg08Uk1YFlrVOzQxzAuZkGFXqmp6oiH4CfGNl?=
 =?us-ascii?Q?HwraIT6jdSqKcr0SxosQ1/a+wxgth/DoqnE21Aswi4WvahfX01miQeQKaCEX?=
 =?us-ascii?Q?C0yN/KpPIuBeBSGcJVp2jYOJmmNkekX4BjWV+F4PYSmE+omzZRNhpSqqgIpN?=
 =?us-ascii?Q?Mx88TETSyFcQKOE0VuWuKNx0e8adK3iZW5YHcB0jfrWcJaPueSL9Z+8Rsn4h?=
 =?us-ascii?Q?nBmL7mbteT8GhIu7cEO9m0a2VGuEA3YRBHK0787oh/XO/k9oDUpg+HtZOnD0?=
 =?us-ascii?Q?4v3fePYCfOQpkGuGxKtGZn08OLQB8fk5gcDaiu3imbSmbtbLUxauyhCcyROh?=
 =?us-ascii?Q?q1DkXNTUJnRaN1dO4wdaE9F4+GU+w/SLUOqloe66wNPNWRI9MEx1lDr2xiWO?=
 =?us-ascii?Q?bWPl0jkgktRPZYO0JJcr/ymN9c+8H8JI7WTM8dQRAVf1HeuM6ilXt+o1T+Pn?=
 =?us-ascii?Q?TTENg4ct5mCzWhYno2UfEvjAflPAreSwuvMyaVYwm5NnvOM0BsaOW2hqStQZ?=
 =?us-ascii?Q?xCl0SMLEcKdms+gWy+fIIWMJae7TRW86FOGrfoxCu1wYoOB3D6zAZIYl9UeV?=
 =?us-ascii?Q?dYXsN+wVV10Cs3hlZ80947OSQI+eZbhm+sprFHKNWsdxOcy7TE8GauNdygkT?=
 =?us-ascii?Q?XmhEBwMk8c6fiKRSMjXUQ5o38OLKtOejL4u4joz4TYRfolJdtaMOs7SfSLCB?=
 =?us-ascii?Q?Lw8KJR27Li1fHAG5kuxcFVmLtbs/HI/KZ6A/scbpHEjBQqlyoCTZB1vxSEuE?=
 =?us-ascii?Q?4SrIRs/X/5eDl5rj6m7GE19zuXbyMHIV6VEQOAZTO/VkYFx31q8ZUQtWFozI?=
 =?us-ascii?Q?7oGL/H+T3JHNcJOlRN9G7TEuW9MvfK7vG4YrkTW328oBKvWhCdpkavm5ggoj?=
X-MS-Exchange-AntiSpam-MessageData-1: ELp+W+0nBCem6f8rp7elsYUBpi0E1F8MdsI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c37dc07d-5feb-483d-9dbb-08df43abded1
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:35:56.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNJzDsGDjLCKsOXTOdXlRvj2pxmcoGuFM/YoGD//0/cIRWmZSWPiy/cK4olx2wfHpa5CCSncCLGl+RAPYY6Ws2EprzxWfcfMU74jE3EoB9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3463

The following memory leak can occur, as identified during code inspection:

tipc_node_xmit()
 tipc_link_xmit(le->link, list, &xmitq)
  ...
  __skb_queue_purge(list);
  return -ENOBUFS;

tipc_link_xmit() purges list but does not purge xmitq. tipc_node_xmit() does not
purge xmitq either, resulting in a memory leak.

Fix this issue by purging xmitq in tipc_node_xmit() when tipc_link_xmit()
returns -ENOBUFS.

Fixes: 4952cd3e7b47 ("tipc: refactor node xmit and fix memory leaks")
Signed-off-by: Tung Nguyen <tung.quang.nguyen@est.tech>
---
v3: no change

 net/tipc/node.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/tipc/node.c b/net/tipc/node.c
index 53b0993c2c23..d84b0274fefc 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -1747,10 +1747,13 @@ int tipc_node_xmit(struct net *net, struct sk_buff_head *list,
 	spin_unlock_bh(&le->lock);
 	tipc_node_read_unlock(n);
 
-	if (unlikely(rc == -ENOBUFS))
+	if (unlikely(rc == -ENOBUFS)) {
+		if (!skb_queue_empty(&xmitq))
+			__skb_queue_purge(&xmitq);
 		tipc_node_link_down(n, bearer_id, false);
-	else
+	} else {
 		tipc_bearer_xmit(net, bearer_id, &xmitq, &le->maddr, n);
+	}
 
 	tipc_node_put(n);
 
-- 
2.53.0

