Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533154;
	b=eYiCMBYa3siCEqLUVzOJy2r5mSpvrO3kiKnFJahSRQ86mwSIyXf6HGL13q/T06gCtCzl
	 dt0BVZnrUL6jFxn9FRRyOXD8AN3TAcqLApJiWWBb6RoIIXqBuhoQYpDVoHkO6oUnIbBQB
	 YRHQubNY0oaCT/H1dgGT/Q57I+xte6TdYA6s+lXroaptDqck7gCONZjfTRa9nLzU/shyu
	 0FcTUeXM0gF8eZ26bKFqzvrafcLTs6R3JtUuMXgRhP+tyypuaO4itOu8CeO+gJ9nkb3O0
	 S+fhbH6+9UD/5QnbunmZ2WvNAdTOxopacYA74xK0lw9bjCRv4/wNl4lcynHNCl9i71A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533154;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=gYwC33EDnV3EFogplmUtw15MMjGCJ3dChmE/SkJ7pHo=;
	b=nZbXJJL3DPjYYdZqnSQRPYPHPfYAzaRvggaUOCiyZY4EcK64QXNTDhbR7l4WFyUtapXj
	 A54jfnaETU6DeczmLVIOH1YuAgmC9czg+LETnRExpukkbIh2pG6pKjXyj5SznJXliWJjC
	 7bb5xABmpKkUCU1WrcXdCQnnjCic5wfPe/YaQHllZQhbkEgYIxD73yZ/G/rNKn2XESMTn
	 +89QZ9S2TmPCmb06mbMpLEOUl+mUayOU4yYbLDojgmRiMopm22qTTdlZC8fUFeRa2FOAR
	 IlQSm9vEQ7FVa/e2tqPes7Fcd8VrEbFKWSW0cwEyuekgn93AQv1TgVTSN3Td7FjdZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Oh8NbHYY;
	arc=none smtp.remote-ip=185.136.65.227
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D3606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Oh8NbHYY
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026112415122372a3b2133800020718
        for <netdev@vger.kernel.org>;
        Tue, 24 Nov 2026 16:12:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gYwC33EDnV3EFogplmUtw15MMjGCJ3dChmE/SkJ7pHo=;
 b=Oh8NbHYYJHfWoUDk9lIvUsRK+0hKZ6ju/Jb3HwgxeoKBkGIqLx9g+Op5B9XMe656q8aOls
 S2Fwynrv71ik7MSQoKdVb3f/He65xqDqYgjhjveJ4p8W+7laXjPSRjyEAKH26SE3XOIUEr6k
 ciL+jrAb8F6fLaca8lyWA4VyOXjQuUvk/vrv+H0Vx9HQ580DPs+8058SLBgGyotSmeorrmV3
 ajh9Z7olJ90q+/oOBmbvo4AUxypW0BxUw8/BThd6/NIeQr6qgKjyUmO7ApivsD0yPdw8CbvJ
 ntLfwMpdtBsI0ZrPuFZHtNU+1bIvaPS9SgwLZC53f1Xxr1REecVOWIPw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: netdev@vger.kernel.org
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH net-next] net: dsa: lan9303: add LAX9303 dev id
Date: Tue, 24 Nov 2026 16:12:15 +0100
Message-ID: <20261124151221.2480934-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Lukas Stockmann <lukas.stockmann@siemens.com>

LAX9303, automotive version of LAN9303, does return 0x9E04
insted of 0x9303. Add this as a new LAX9303_CHIP_ID.

Signed-off-by: Lukas Stockmann <lukas.stockmann@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/net/dsa/lan9303-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/lan9303-core.c b/drivers/net/dsa/lan9303-core.c
index 8eeb8953ff24e..17189bda07c8b 100644
--- a/drivers/net/dsa/lan9303-core.c
+++ b/drivers/net/dsa/lan9303-core.c
@@ -27,6 +27,7 @@
  */
 #define LAN9303_CHIP_REV 0x14
 # define LAN9303_CHIP_ID 0x9303
+# define LAX9303_CHIP_ID 0x9E04
 # define LAN9352_CHIP_ID 0x9352
 # define LAN9353_CHIP_ID 0x9353
 # define LAN9354_CHIP_ID 0x9354
@@ -903,7 +904,8 @@ static int lan9303_check_device(struct lan9303 *chip)
 	}
 
 	if (((reg >> 16) != LAN9303_CHIP_ID) &&
-	    ((reg >> 16) != LAN9354_CHIP_ID)) {
+	    ((reg >> 16) != LAN9354_CHIP_ID) &&
+	    ((reg >> 16) != LAX9303_CHIP_ID)) {
 		dev_err(chip->dev, "unexpected device found: LAN%4.4X\n",
 			reg >> 16);
 		return -ENODEV;
-- 
2.56.1

