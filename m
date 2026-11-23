Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446095;
	b=FmnTg9CAU/m6Buuwe65g29GFOBYBFHgIYAUMYjySYn4tGXKZLxGa7AAvnTCcPqDFvv8c
	 3lZpsKYI2IMnonox2iG6FgMX9UAc66lXiqIFjxr71cklcJemgYCyMUdTDVGCFQaRwWp2D
	 Sxve31xqymw5CF+QnfZ9rybTfm2TngOEy+Xo3CI8UKYKa1hk+1GHNdvZv+C3NPoSE8nY5
	 mToTW4Ru33VFgiPGlKYtlVT0CUtsWWQ18utDqJG72HZH6XQmB5ZAfyiBNvRU6SKws3Ag5
	 24UwR7eezoAv+sM5ON5Bc4APCrgA8eSRNswxgzn/cRBNzf4NssYJ5JWFFivWWOsKrpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446095;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=aYbexxs3L7cUJmLfV3CCtINJnN3iJLBB80YI1WvfYg4=;
	b=0zIWTsza8G4Xn1wz83nWwwynMY3xWp6pdpJGnoNt5rET6oMjXLdjFtRczshE9VsWIOET
	 eZYAUGyLWP2y8EIO+1eAIvj9dYFUC5ijPlQinECeSxxm5mzwCqPBmltytuAK8QtIl9CL1
	 r2u81xM1DeEZ0u7O4Gs/4LmUjTFRNcnSgkNOseDGoiQb6mh37BTejIUyZV4n0gow6PyCI
	 BIO9eZQY3blStM8kRV4PC2e0OGmdEqLQMh0DI4F89CgahhHVud+PcH4X2izzl0L8coI6b
	 eO842VAqcE6vqBfZdpjS3Nb53KyJF3qOft3UMcScCiGEsbCbCRJUHzQP50Ix8HdYYLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0kOQA7z3;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67536606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67536606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0kOQA7z3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795446096; x=1826982096;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=arYl9MgHPoCQR/AbKhJMReORxqTJLDU/0yr2IC72pok=;
  b=0kOQA7z3emUduCyiCNAK7NUQywZ80MofIFjEXeyFXC4zmB2+tlz/zr8d
   o9sHfCU/t57mCJUILUtdfXHnTte+VCEE4EtCOe/NnQjNcey4WVe09PbhE
   hb1vfRcYhyAZDpjpPWm0OPA57HnBDLUd7pcTPBAemtkxFVfb0C4vWt6lN
   Z/S2ONm3dOLMYg/WG+1OISgoSs8HWkFHAuHV3JJRkvVpjhIhePVzlmvef
   LD46gAPCmEp2cmtcKXO8FCPxVynrs+qZLiuTtJGx3fFWvrlHypoO0saHM
   xRX1vhsjMGZ9CETG9pmmd9bCAVFFnu4wHjuecRFOd9iMSOq3K8GKZ+HhV
   Q==;
X-CSE-ConnectionGUID: tLYK4mYxSBiBCV0B6s4eoA==
X-CSE-MsgGUID: b6YLMV6jQwq/CZswqS5U9g==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="298335726"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 08:01:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 08:01:34 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 08:01:32 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 16:01:29 +0100
Subject: [PATCH net] net: sparx5/lan969x: only check the DSM calendar on
 sparx5
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
Message-ID: <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
X-B4-Tracking: v=1; b=H4sIAElVBGsC/x3MQQqDQAwAwK9Izg24K2jtV0oPMYk1qGnZFRHEv
 3fpcS5zQtZkmuFRnZB0t2wfLwi3CngifyuaFEOsYxtCbHAh79v+QMkrMi3qQgl5Up5xuFNsOpG
 aaYASfJOOdvzzJ7hu8LquH+B4eGxxAAAA
X-Change-ID: 20261123-lan969x-dsm-calendar-check-b8a237dd0cab
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3

sparx5_config_dsm_calendar() calculates the DSM calendar of each taxi
and checks it with sparx5_dsm_calendar_check(), which compares the slot
distances of each device against data->avg_dist[]. Only
sparx5_dsm_calendar_calc() fills in avg_dist[].

Before this patch, the check also runs on lan969x, where avg_dist[]
stays 0. Any device with two or more slots, e.g. a 10G port sharing a
taxi with four 1G ports, fails the check, and the switch fails to probe.

Run the check only on sparx5, as the lan969x calculation computes no
distance limits to check against.

Reported by a customer, and reproduced by running the lan969x calendar
calculation and the check in a userspace harness.

Fixes: 5d2ba3941016 ("net: lan969x: add function for calculating the DSM calendar")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index 35815fb58080f..b0ac91bffa874 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -595,10 +595,13 @@ static int sparx5_config_dsm_calendar(struct sparx5 *sparx5)
 			dev_err(sparx5->dev, "DSM calendar calculation failed\n");
 			goto cal_out;
 		}
-		err = sparx5_dsm_calendar_check(sparx5, data);
-		if (err) {
-			dev_err(sparx5->dev, "DSM calendar check failed\n");
-			goto cal_out;
+		if (is_sparx5(sparx5)) {
+			err = sparx5_dsm_calendar_check(sparx5, data);
+			if (err) {
+				dev_err(sparx5->dev,
+					"DSM calendar check failed\n");
+				goto cal_out;
+			}
 		}
 		err = sparx5_dsm_calendar_update(sparx5, taxi, data);
 		if (err) {

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-lan969x-dsm-calendar-check-b8a237dd0cab

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

