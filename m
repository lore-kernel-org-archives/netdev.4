Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795419358;
	b=MT/dgXwcM67+zb+VF7Y20ngNC1+OnaBBp3y4NAUmtO4QjuaF7TKB8qGgy8rR53CbQYKj
	 ju9MCrwZn298aWKCpBr0wNFfCqt83NBhgCOlkwA67mZUKKlKFWzUlarJAckCQ46DHEdqa
	 Kg6V40aS9wIJl37yQWP4YRXPZg22ZuEzzk4dvAWLTEvZJ/7OZXL35md+e4ltueVVX9T4e
	 QOLCsKUARujTMb8NpXoTKnsArn/mBZHo7PHwyoSCwm18k3pAL/RZgZz3/jez5/Z4j2A3g
	 r2plZC2AZrg7HdJUZ9swuPVbZxUkaDwGFVH+rx3DRZeLFIMQU+MFLkVaNAo4NtoXt7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419358;
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
	bh=rVWi+Y4gP4ELXpBy8XcY9HvTkEVoMlpniaOp9knx1iA=;
	b=BtlV9lYbkleNb6VOMeLy98D2CYhs52Jmm1sTFVbYU4anvnRLu29QlKuCwQtxtGbbfQgE
	 bJ/4oC1j6+ZaQrAHJTmnfecHO6Cgv34GuJM0hBwgow/8mvFYCddR2vuV8FQ62eoL2iTIb
	 TFoMGRbnpTPreZs2h+A6ixe3wbId8V1v9Bj1sZTUx/5cLvrq8lCk42UfJx3EvLmQsIiJT
	 d2/rHCbO3JISYrZ+uK4zt34Y+7edogfDRJdHkQJxEOPm4d2jUDVzLNHn+bOGMEx5iZk8s
	 p+H01OXYGb6ICGtZ1bk2qaPzZ+9rnCaSrvD8epcuPpl4z9lYAqVRbgElZl6Fl59TF3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BtG5fswB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.21
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010021.outbound.protection.outlook.com [52.103.20.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D7F606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BtG5fswB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP2Y0INRa7Q/IRP7KS6z+/+sEIzzQ2z1W8Z8J3DFIKQHMK1FowGcZn/kJxIw2dJ3PaSCOuDEuu2fpaJgt+tSiJGeKR4UrVBy950MX36mEfVIZo7u07tqVJWzR2JmUAg2MlZYdBs7JxARSLsw9TVFE7G3z4a4JEwCYFPU4nft/qDKt8BS8I7udl+hmMP9ZmP++263G10D2T+FaFjJ9xJ01L0BmRQVNku7ebXsu0oBLEKaQZqINQ58pNWZ/E3/6wPUiUYsS0aVUvUa9AnchWzr1YBhV/Uw4RIl2PmoNMTXg7ilncikMH/XS4qdzWY495XiaqUdWXlRNyrmTJn5Rm3wAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVWi+Y4gP4ELXpBy8XcY9HvTkEVoMlpniaOp9knx1iA=;
 b=zK5YIQLnirPq1mRdFbFU5m/DG5LR9S6MAzIoI/a8uU7BJ1mo3EAg9m0DoQFLj9hUJiPCnO8k2eaoGIPuGe2AqpMpGSIYBMTX/GaqNmejYvvLHqS/ERaa1ZwdbQnZRq0naMUNu3zjfRqQ7qAr+ho7HoplTW42cATlFuWL2e31s2Wt/LtI/LZ+bkVvqKA8nM2LOOMmGNwQl3tRH7W3nU3tz/TDas7mRVzCY9nnKjV2hQiD2UASWsXSf724ZMJKRHZDqI3EPGuW3RlrwKM72dUe2dzwXFqRB++Ln7/FPWkTDe+Uv3p3WF6XVOy2bcWnrRcGA7cTKSH/w8/c5lN/fP6f/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVWi+Y4gP4ELXpBy8XcY9HvTkEVoMlpniaOp9knx1iA=;
 b=BtG5fswBa/40m0xg2/ke+xh9m6vtUnS89vrDVEkaaAGVtsMnpMN9VvNP9lPr2GmWupkavJOFyGiCgRzgFuCQ4zMrhecCbKA0vtxmsHM9i/jk7Cs0iRmPmzbA70ASBKfzARUto9WPQtBf27h/N64wyzwbUOtcDb4XQ9QC3WcaX+3x1f/NfTHmsxXqIX9cChiJwy0Rvw9hBEV0bmxjst0YobdavYfuR7tN43REAFSCL4xuldzWFp7Vfy4yYiKzwj/jD5kVSQaOt2D/EQCYqV2yFyd9yrE3omWNP3yUBi/2bwkMKRAbJCKqAjMsPXyfAPNEeUJR+EE42c/J23n93hAEow==
Received: from BN8PR06MB6177.namprd06.prod.outlook.com (2603:10b6:408:4d::27)
 by CH3PR06MB10288.namprd06.prod.outlook.com (2603:10b6:610:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 07:35:55 +0000
Received: from BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f]) by BN8PR06MB6177.namprd06.prod.outlook.com
 ([fe80::859d:df4a:66a3:142f%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 07:35:55 +0000
From: b.lane130@outlook.com
To: andreas@gaisler.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	kristoffer@gaisler.com
Cc: netdev@vger.kernel.org,
	Bruce Lane <b.lane130@outlook.com>
Subject: [PATCH net] net: ethernet: aeroflex: fix memory leak in greth probe and remove
Date: Mon, 23 Nov 2026 15:35:27 +0800
Message-ID:
 <BN8PR06MB6177818FBD04A32DAEDFC589A4452@BN8PR06MB6177.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::12) To BN8PR06MB6177.namprd06.prod.outlook.com
 (2603:10b6:408:4d::27)
X-Microsoft-Original-Message-ID:
 <20261123073527.2004512-1-b.lane130@outlook.com>
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
X-MS-TrafficTypeDiagnostic: BN8PR06MB6177:EE_|CH3PR06MB10288:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e0f08f-6f82-4b59-e4b5-08df493467f3
X-MS-Exchange-SLBlob-MailProps:
	J5N6liNEYVT3fgOOAZV4ijG+CIvKYlF7IeJHVis3Ltbw4+7H36JcZf7bJdqGwe3HmOc+w9tMkgSYxkQDOvCJ/yw+K13SLYOiZr8DumkmT7vsY3sBt8sOfhfNA+DStOJ3WtLO1ZBSnOhDnNc+LmhzEMlaILrdxvZHP1fBwqLB8SsVzlTv56tpA5dfmi3EDNaOebl4KkqX6zRubldKTGxnXhnqmimqmcX7uhYpts4FurPa9XMh+4ssTxnm/3PeyTLAx7hAA4fHmwtqfqC1TTdlpJx2nqUjNy5Ath8JrKt5YTemw+Lmf7bup7Igmozjf6ZPqz/ylDlh1XUaDH+nGY8GxfsgxjHMI8T6XuUKP9cgAEXJjH5Y0vo/oHRm214Or66T3Whuu6sMsDutf4l7G6o0udBqWyXET4sUmyPanlgjwtyfCE7YH7QHQNgkZiWPS2OxP5KwfjnXXgkwnkpO+o1/+urTwvCUAMsTMBPOUzBiR0o9GWK5FvyD5oxuqIPy2TDZSHxz+iN3XL3NrI7SJpTDXhFY/84Unc2hV/Uk+WrQrn/CEIwqmXJaF6i20vtJ4gT0eVgTiJxmY4lK8wLytkwq7bEEg0btJKfyjYKSDBifMEJGq9DRJlp3lVK2Bfsn/QeeJTZBA6L1nMzqf41z5Iso8TY+htxkcjg/nziYWgHFK+pBVZMX11iTGxUQ9amrxop/IJtktEPCEp2fh7/Hxr051H14MXyFktFI
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6050399003|51005399006|4140399003|260925184616899003|2604031031799003|10112599003|19110799012|8060799015|5062599005|23021999003|5072599009|15080799012|12091999003|40105399003|261005200801699003|3430499035|11120399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?trl3q9YTkDPlcsLDGLIvDVIR7sqtDhwY1tawMaXUMIDfUqUFTcolC7KtLhc9?=
 =?us-ascii?Q?261xcnPKXMtgDz+aLKJxMyStTuCn5M2NYFVvVMkaj8hoxAPLuTuF+8KOnkZN?=
 =?us-ascii?Q?ppeGGJkRY0CUjDAe0S7cuvw5rx6ko6W9mQGR8gAeCLAaycM3DFPqoIwQiAgk?=
 =?us-ascii?Q?v4vh7YVOXV4KMqEEgno5SD5XA1iPQj4eoZ5WNxIG0w5laN+rsKmBWER9iU7I?=
 =?us-ascii?Q?MkO9GKLtoVyaxuLAw5n6ce0Y2GiNCuTt9JwkAaUvhuWLjdr0nSqnsdE+p7LO?=
 =?us-ascii?Q?JkQBdpbVrNR6xygCLbTIHiJ0mSGzyy21TX/0EBMoPEAJntm7AL3W8VzfcIH3?=
 =?us-ascii?Q?BlwPd4cYcGOWjK4aRJ/Vv9au+yygfRfxHASQj64596NaV1bL4JxP1JmBZG12?=
 =?us-ascii?Q?ojNkfzvU+evprmaZBqqNnBWjWdJ45YGPsLpVEhZXH5SEN/s3eU5zl6Utc9l2?=
 =?us-ascii?Q?RZooElyFWKUSge6BudJxQPCjdTMydfN0GlztkgM2mrH9GOjrdR8DItPqaCgk?=
 =?us-ascii?Q?ZHD8+Y8BFxPqJN/Nl4YvOylRmCujjqdeyWUkpKYWmcMUXTjLJKckbT+O3Kca?=
 =?us-ascii?Q?4hZ+FglbnKu1+4IFU0wbemwNbfSFOhD6Aj3gWRnwl8gv2F5OcS9NJ6nioorQ?=
 =?us-ascii?Q?D4+5UzdH9eC1TH7arVpU8+4GgU5CXHZylbpNydRyuyhzDxkGCaqKYd2qg1lS?=
 =?us-ascii?Q?SrYnpKm6GBTa5ZUlmPo1cZAd9qtjqisGX8xrS3pVpIZMnFonE7s5xyJi5Gbr?=
 =?us-ascii?Q?rHOcqdQmEroZFkRQUwfEcDFeu6S3+scK74kG4Pb+Wwu1QghmwXTnyftHsHsG?=
 =?us-ascii?Q?jfZIahqZt+nEqMPSs6bbwytjrt/W1VWjhhoVCOe3We7mKttYuQ18dTekujyc?=
 =?us-ascii?Q?9TuoF1PfaeARlrBIlY4PO3HJNp472PDgv7dicccYo6V2fZRsUaOLw5j1i8p9?=
 =?us-ascii?Q?2u/HBLkQyNczu/DzKLCnBPu89XgF+DNEzOaoVCWI5S/wZfp33SL6h8Fed6ip?=
 =?us-ascii?Q?OSVWL4Cd9pqYNEB/Z11mmAe3crIsFZnl50LNoLiVeHfap49RBX6JIi/Nt/UE?=
 =?us-ascii?Q?8hmRc2UuC6qCzRn/jRz2ejrwiuQrB5CX15+hyTAj+5RX9+PnEBzH/zJC3TX3?=
 =?us-ascii?Q?AHgjrV25gY+c?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BRT44EAA7JqT4JxOFput8RLe/6dx0FKaJTDT7DBrU3zd3HD7p+sfs8Qf7LT1?=
 =?us-ascii?Q?v01fF6H1fj1CpvV9KwSTPuK77QWqcfaajCHGLtMAGdoplFlDMWo3CFROrS9N?=
 =?us-ascii?Q?fIP1Zvwp68KcLgEf7frMzYUuc80iIoOlbPI3JloEtE/lsNdQ/k1rJgYY/I18?=
 =?us-ascii?Q?sWJqSyyj/58RNqQMRBvv6sKmmMB0GcD+w1bgYaUMvd2j07AVpT50OG11ue+h?=
 =?us-ascii?Q?iXoNedw3b/IbUAyh2xY8yHgzNV1ZtQuN8X9fkp0760g7dH016Kf8ueTMZPgn?=
 =?us-ascii?Q?yUb9Opr8uIwLxtsjdF1IxhL5XlxOQR85k+xLOhQPD0h15r6SGYwhdrqYOTvx?=
 =?us-ascii?Q?Eyfkgsk/mMv8H3cHpE9gxRNZMOxcc4SoygQCFRaWRjJLLq1F1gUSAlsIlb/R?=
 =?us-ascii?Q?Ph2Hz3ubXSkGWI0H+JBWqPGdEkzautu+R/6FTHh2P9xyXWTYYLW4nXQn3b+G?=
 =?us-ascii?Q?RO8mAnMFURFlmMDSfkbbwmktZVhTgck7+Gwnx3IJKoknSR6EmeP1++gfCD6I?=
 =?us-ascii?Q?QTSIs2m7DOhH+L61PELGD8bK8DeQ6ZjSNAPLMsUEs/Xq7975eAGWicQEmYmO?=
 =?us-ascii?Q?Ubzj1PBhma4YFYwIqfV6p/xNwN05QTgbyoIHyKPYCSXJoxdLj/Z3HWhVRWXj?=
 =?us-ascii?Q?/qUntf7TXWSBQY5eZIR8mbdAsl9hSnzoPypOLHpTKxy+9WjAa6ekHvUzT5AL?=
 =?us-ascii?Q?S5u8uelM9dATPSsPagOE6YSxx3otCEhNpVoz4hJVY24cT1R0TxfmVeG9URij?=
 =?us-ascii?Q?ypR8JlbliQJqkEFmR1Ed3HJis3bC4l3KHzSih7RA33CZ3sXiSmA90GGYhLa4?=
 =?us-ascii?Q?Su0prfDfl7U3wiKgXeZKpRl/2kG2eSYlmiMyRawGekCpbhwCaKcEtRsHy3Zo?=
 =?us-ascii?Q?ff67Sgu1TReSpjrIRyN2IOgErv6vjcakPRyfJZlfdMKl4pQCMEqXFtgKPUJz?=
 =?us-ascii?Q?z5uBXZk4h1lqdH2kRqgINlpmcxgIepZQ7Ssxkxu8YxvswEXPaPGCKg2i3mwS?=
 =?us-ascii?Q?70QiltmhONpJ3Sy907ZFUrh3qeUvsuVOASTC26lBCxrY4Y1RkIbLHQ4gAjJp?=
 =?us-ascii?Q?4wLioSL0GQWoRuQeIZp/W0k77fzvEBOEWTxA7qf8VHfuWX3wmhwH9gWGdepu?=
 =?us-ascii?Q?Sk3RPFFeyUCCg91V33K8ZSmsApmAhNr2xAt3MS9rt0GHyqgibrthpYrs27ht?=
 =?us-ascii?Q?qBV5ptfBRci5btmqBGOcgj0IEaV37eXkTWpEfNa7WtrtWq3PGeQgFChXoNrx?=
 =?us-ascii?Q?2deOfDbUsOQXuM0AVefmzErlsaIob99QxD2vLk69A4xDqkcPQhY2ibqkv/Ll?=
 =?us-ascii?Q?4NsHqQGUBg0E7GHpTcJRB+jaatquhaICR/pY2GPLyrqFnlUAvqjKMAt9UV41?=
 =?us-ascii?Q?bmo580NTuhWPDHc6sqXsTEHs/c+U46foXIoWVr1BFFCk9GH7hJZKNkO75HgK?=
 =?us-ascii?Q?vA+EE9fXBTDm7kGnmy1Dp1U1l2Den60D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e0f08f-6f82-4b59-e4b5-08df493467f3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB6177.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:35:55.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR06MB10288

From: Bruce Lane <b.lane130@outlook.com>

greth_mdio_init() allocates a struct mii_bus and connects to
a phy_device in greth_mdio_probe(). But the path error3 in
the probe and the remove callback only unregisters mdiobus
device. Call phy_disconnect() and mdiobus_free() to free
these resources.

Fixes: d4c41139df6e ("net: Add Aeroflex Gaisler 10/100/1G Ethernet MAC driver")
Signed-off-by: Bruce Lane <b.lane130@outlook.com>
---
 drivers/net/ethernet/aeroflex/greth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index fccb67beebee..f649f76361ac 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -1519,7 +1519,9 @@ static int greth_of_probe(struct platform_device *ofdev)
 error4:
 	dma_free_coherent(greth->dev, 1024, greth->tx_bd_base, greth->tx_bd_base_phys);
 error3:
+	phy_disconnect(dev->phydev);
 	mdiobus_unregister(greth->mdio);
+	mdiobus_free(greth->mdio);
 error2:
 	of_iounmap(&ofdev->resource[0], greth->regs, resource_size(&ofdev->resource[0]));
 error1:
@@ -1538,8 +1540,9 @@ static void greth_of_remove(struct platform_device *of_dev)
 	dma_free_coherent(&of_dev->dev, 1024, greth->tx_bd_base, greth->tx_bd_base_phys);
 
 	if (ndev->phydev)
-		phy_stop(ndev->phydev);
+		phy_disconnect(ndev->phydev);
 	mdiobus_unregister(greth->mdio);
+	mdiobus_free(greth->mdio);
 
 	unregister_netdev(ndev);
 
-- 
2.25.1

