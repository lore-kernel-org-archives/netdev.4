Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164269;
	b=h3Mu+Y0tu8xaZ+sKuYp9kfOokKPm+iknX/x0cz4AHak520fcEdp0eRkQK2jEFH9gJWwZ
	 n4C77FPUOwiBm8zpetdwaAkpzZp6LB9rGo0KWbklQB+HdVm5jNfOvbplJ8xGDHE6EYV04
	 Z7CACez4sXQ7kAxMrGbP6fKrnr31BS48rF44pvKCosyZTUUkw7TiRBdfxjamHQFkqyJKt
	 N4NyJWgvRn/fIK6f7H/3NduRbUcUolZgyOw0i8Gu3Y9BSPgoI2ag79mkp1FyhuSKvvjK2
	 3hO1OL7VSQccj5gGmj9JxOeZcleZgwu74UeTvYFJTJiWIvxLxg4glB1EqWBlw+O4bLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164269;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=oOzxgcxraIXd3FZnNGqXvCXY6Ep4qrJuDvKtBDXn9ZI=;
	b=SUt1b7uW5EmFXDUn6PBpg28uo0d7UOQbpTfOtyvbI4QxdJRUclxQemcDSTVmMRaDZ84P
	 JPpkCBrFgw/kqeQ4KyHw8hpFkqGt+kFoCX+9KyOO1sLhyeajzx1+n4TJnmpF4abi78r/7
	 xfuCbsNYfFFVSjVIsJfCW7ioOSFuA9UiJtnZWQXwgxUjAMXqMf/+ylU8icq3RtezjAI1Q
	 4nfO4YtOhye6oKsMiLuE3cxpMlMtduJs9YV3YaCBald8S4l39tt/sNJi8i6ipKPWTgVRq
	 Zag3j2D14cDv2Y2CKWE+9wHUEoJqpREe58vSp9b+EsQyncyyqhwv05aZEt1kxrcObCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r2VGvuuC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.29
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFA60A5BCB;
	Fri, 20 Nov 2026 08:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFFA60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r2VGvuuC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhZJxyVX8ijao1uKcD/kl1Lfc9jrsYE7cYQZcP2+Yv91HLjVGxEXzWrnGccUOAm5rA2QTJQwmYT7D93XeFMz2MD2vY6miCRGy0Ti4/jTXjzcpminxg/iAgFsehNYMZZc0pHIUm6FSwxsIw0gTD9gH7OL1XeFyUpivtCM5A96VokqmaxApcwDcVe0iVvFjjVfcEkqANY4sOcCTHfsMtakECGy4klwQZsLp4XujaR8ZobI1pLKuFVBR2aVL2pcGiZCwcK/7rZ/aoUJqUjqMm3N+f/+SmJzWBm570JJOsgc0bDPEcEaIwlbm/Vgb9iikwZeu+URPtgp0cvsH9ZbiOHurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOzxgcxraIXd3FZnNGqXvCXY6Ep4qrJuDvKtBDXn9ZI=;
 b=o8oTPNS9yUl+/NAT3vFq7ebCJ2FwFI7D6aUAxiHh8drO7kwXhrBENctwsfjKXLRukdjlnOEo/+A9B788UxnPOvYBJpU2QDY8I+rTJrpjh61YQMP//kWkzWxteuF/Nl4GLFUEpxKI7ydhnNbtLnAc4Uh2ZTzRjgma4Ou1GVvZCoT3PWy3BHvAm0ox/ThgsyEYy9fmUTZaQIRydjV/6oCHokHB1mNa1etaf8QKX6xN/XMdd+Aa8XXnFsQeyYVD1eftG/WwIBCikY6enA2ZLQnBclCS3QeLqvt/xXwedb9COuNmoCCsuY9gc5x/j8E8ol+hxfdR0LQEUxWkKTRQ/kVPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOzxgcxraIXd3FZnNGqXvCXY6Ep4qrJuDvKtBDXn9ZI=;
 b=r2VGvuuCBZ+0Hp0M3M3p1zNY4azhM8b9ZCMatthQ4FnVbTPfISGbsAAhkbjfrw0XmDHR2qNYdfiKhwiEwM58FAe4e9d5oWM1KZ2MHT9ny7YW2NEVn4c3tHoeuYerZyoFmCYmA2hNHM+kmmw9qPFMCgWb0rfnXZAix667QIug7dE=
Received: from PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::10)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 08:44:24 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::3b) by PH5P220CA0013.outlook.office365.com
 (2603:10b6:510:34a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 08:44:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 08:44:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 02:44:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 02:44:21 -0600
Received: from xcbalexaust42x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 02:44:20 -0600
From: Alex Austin <alex.austin@amd.com>
Date: Fri, 20 Nov 2026 08:44:04 +0000
Subject: [PATCH net] sfc: create PPS workqueue before registering phc
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
X-B4-Tracking: v=1; b=H4sIAFQIAGsC/yWMywrCMBQFf6WctYEmRhf+ikjQ21O9LmLMrQ8o/
 XejLmdgZoaxKg27bkblU01vuYFfdZDLMZ/pdGiM0Iet96F3NkoqxdLrnkZ9u8AhUiTKOm7QolL
 Z9G+4R+aEw1/a43SlTN8VluUDtEcVgncAAAA=
X-Change-ID: 20261120-sfc_pps_wq_fix-2ed4ecc4c345
To: Andy Moreton <andy.moreton@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-net-drivers@amd.com>,
	<linux-kernel@vger.kernel.org>, Alex Austin <alex.austin@amd.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 87752a44-3e44-4583-4a57-08df46e27a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|261009220027099003|261009221227099003|261009223327099003|261021135927099003|261009221727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+hWBd6gk8BFuZjni6g+q3vv04xC34RiPlOZgAP4+CINjontVDjsIxerTIrCKX/Gzi6ILtqlljNwrHGmo9KZVLS75s52ePD4wuZO3zbEdLtDfC/xRoQVPmLKLST1TH9iLYbkzJgPwDqB2U2RffpGiN0u8rRS7nUU9TwSvdPXVf4mQ1GgjvtxYbjTX3FY5wpe6iPzKmYkuqGzOrIqnrbxJmLeV5xEQellFhRBCwu+/ToXdGBZ2uOC4YIrrO6I+3GuJ4CikYvDNRYyc2axmpiNyH3eKESJwNY4oPVHw8yJrnYcX+ma1gjFXdcTiY1V+8i40j9ii9JT+357c7Mzv+bkDcf7L0cFXtlltD9YuezEbmz7Z3yht46pXKGJ/CuwiII/1fs8bWPKIOOASBv07DASYVLY1W0TcnT+5QOg+GA6eWIz1I/mEZhL64Y4B/T2NoBDNmcY3pkuPBvjf3csFlX9T/EdKk4KRZITP687G1jEtLgrnP5yr6KZ4/DBOjeOfmcMd+/FnyexD0T0TQEkwkKa0RWxqhN6LNPgu/1FFaSBTv0opgIJh4QrhqmiSOV5QdsEAIhUtcnRZcgXQAVBtTfjTnTi+T98s4U6846+rIKbnq4pXNN8UqV7KoEYZFrQewHviZRHAMdz158MljEMQ2TZRa8zWhDDawh7Wh0uRek561Zqs3PzsPqA3nLMrRmlEWwC/1U1dUiHzK5MCDpXY0oRfMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261009220027099003)(261009221227099003)(261009223327099003)(261021135927099003)(261009221727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OQCzSCEOZl7xMeQmOeYJY/uS3/uWJWOjJTPZbk+egnUX04WpRA8EXHZ0nle76KGFqa+GTpSC3AjI2AoBw5wWRCi41rVETcL6a2FWuspYeew2sHgsHFLOdJ4jeuhXGuFfJG0GXsCbCmmcY9Fj3dR5nf/by0odFXDgLc34mJYtALl6ebAVmUjpkV6/5kAdx1ZzxEPbdltFDuWIjm5k37dkb/936H2I4bEID7SwAujmb7DF8BRfro7gW7Fc9w5wLqUp3g1xSG/V52K5rCp3WyS/zfxV55FrhcvqSZDlbP9y8OvFKOA3tgDraZ/tGRBfEsL6ylhiyhzCKLcu6DbWnemapqU8rPDqfW9gWMbFdGq/MG0SdVV0LYscmUfs4XJv0YL1VIr0lggUPvJjwTaENbxp7H9+OwIfKE+Rvuzoxm8G+rJQCjEMdZr/84++bpv2nnmi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:44:23.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87752a44-3e44-4583-4a57-08df46e27a26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

Registering the PHC before creating the PPS workqueue leaves a small
window for PTP_CLK_REQ_PPS to be requested and a NIC generated PPS event
to arrive before the workqueue exists. Create the PPS workqueue before
registering the PHC.

Fixes: 7c236c43b838 ("sfc: Add support for IEEE-1588 PTP")
Signed-off-by: Alex Austin <alex.austin@amd.com>
---
 drivers/net/ethernet/sfc/ptp.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
index 37511f234d76..ad6a4e7d990f 100644
--- a/drivers/net/ethernet/sfc/ptp.c
+++ b/drivers/net/ethernet/sfc/ptp.c
@@ -1633,26 +1633,26 @@ int efx_ptp_probe(struct efx_nic *efx, struct efx_channel *channel)
 
 	if (efx->mcdi->fn_flags &
 	    (1 << MC_CMD_DRV_ATTACH_EXT_OUT_FLAG_PRIMARY)) {
+		INIT_WORK(&ptp->pps_work, efx_ptp_pps_worker);
+		ptp->pps_workwq = create_singlethread_workqueue("sfc_pps");
+		if (!ptp->pps_workwq) {
+			rc = -ENOMEM;
+			goto fail3;
+		}
+
 		ptp->phc_clock_info = efx_phc_clock_info;
 		ptp->phc_clock = ptp_clock_register(&ptp->phc_clock_info,
 						    &efx->pci_dev->dev);
 		if (IS_ERR(ptp->phc_clock)) {
 			rc = PTR_ERR(ptp->phc_clock);
-			goto fail3;
-		} else if (ptp->phc_clock) {
-			INIT_WORK(&ptp->pps_work, efx_ptp_pps_worker);
-			ptp->pps_workwq = create_singlethread_workqueue("sfc_pps");
-			if (!ptp->pps_workwq) {
-				rc = -ENOMEM;
-				goto fail4;
-			}
+			goto fail4;
 		}
 	}
 	ptp->nic_ts_enabled = false;
 
 	return 0;
 fail4:
-	ptp_clock_unregister(efx->ptp_data->phc_clock);
+	destroy_workqueue(efx->ptp_data->pps_workwq);
 
 fail3:
 	destroy_workqueue(efx->ptp_data->workwq);
@@ -1702,16 +1702,16 @@ void efx_ptp_remove(struct efx_nic *efx)
 
 	cancel_work_sync(&efx->ptp_data->work);
 	cancel_delayed_work_sync(&efx->ptp_data->cleanup_work);
-	if (efx->ptp_data->pps_workwq)
+	if (efx->ptp_data->pps_workwq) {
 		cancel_work_sync(&efx->ptp_data->pps_work);
+		destroy_workqueue(efx->ptp_data->pps_workwq);
+	}
 
 	skb_queue_purge(&efx->ptp_data->rxq);
 	skb_queue_purge(&efx->ptp_data->txq);
 
-	if (efx->ptp_data->phc_clock) {
-		destroy_workqueue(efx->ptp_data->pps_workwq);
+	if (efx->ptp_data->phc_clock)
 		ptp_clock_unregister(efx->ptp_data->phc_clock);
-	}
 
 	destroy_workqueue(efx->ptp_data->workwq);
 

---
base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
change-id: 20261120-sfc_pps_wq_fix-2ed4ecc4c345

Best regards,
--  
Alex Austin <alex.austin@amd.com>

