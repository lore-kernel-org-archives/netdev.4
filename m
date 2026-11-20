Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162275;
	b=Cc/1omCM/B66UDLcb4Cq3tr/MhvgIoXmfmKQOMcNcXdWO9/P/zT6SIdU+dBtT7QuWxlp
	 Axqjm4QsdwEF6UM1qGbjegqwIjfrIpUS67qZPZA1UAu4mwmkrCkyQku8LJmjcNJK9c6CV
	 AxkAFolQwj5CXAF9y4uzvt91EHHkYYQ9b4BKIT+HbXrbY9O6tpQWSZ6VOmfFwkZzCvnmz
	 yqFFIUE3pt0dZ5qPZ6n4vbs5WVoXXAeHo++un6lxkEd5d7Q9dEwZn7/EfiJpr/LJpFTph
	 pc7gg2eiSlmTGYvCoaUFMuelkYXDXXv2ez6SWxRBJSUzdfBJX7FxJ05VPiNTHd5XUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=oGWI5tR0MByPQ2I5S00dKuJJ6wtsmAf1pk4tLQVtiROr9qvgjaDIpq+3PtBptTqhqEGO
	 sIOJ04rlkp1ySlqaT+cnGAbZVk26yMSDym4BHOJnvtomOZtnOS2neM0TI33qG94/giwft
	 jLHqssa6S55U6fKHRCJT2v/YceUIX6w/OtOcGcmmMKVM1PhlYUIPUkBPJHnbFZfwWrcj5
	 GuTppav2m+z1G0Bn5UzF65PxFser9mK1+ObTMSLSn3gOfL3flE2XbwgD3Bh+dBYKnhbND
	 KNzWFNRQ7m4T0oKlSDWryZbV0qhUO1R2Pv3u2qmBiWN35oUFj77lHWAj7fNlWvTb9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E960A2610
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1E960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839281e87.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162273; x=1795767073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=BARaHMNlq26sSqV12YSvYOroX4P503BDVW70Vmn3F1ccJ5GXLuDKEGGjw5AZKmf2RF
         XMYXZC9bBgtwJLSOznWjcwaon3KsmYVlfjePgY0jBYQd4WjLYV5eYO4fbDclRsuZP4cA
         BTXlPQ8Q5eIuu5asX9LoAHPTO0dbbnal47mMPjMe6NrOPek1lnUUTD8FUNo9FYy4/mlj
         w/iwd7SZRtYpW1P+TDobhJnkD3x9mvdjtk4e/ecZ1QyBz/xVvwBkDU6h3baFktKOAI2D
         0NVwM4+i66hYaas5BnQEl1l9AMr1Qa4PemDiEqJSzdfliWwgsljhmLBuhkFU5w7EokPp
         6nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162273; x=1795767073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=YEJx1D3yasKiZsBUHjXouulRe2rM6U5yS3v5QBGzYdBaf+HPOxd4Aj3feWZucbCSvy
         tZBOWKf4GHIjAmB6cYoXre9DpBvzMIYNAiXDGymED1e7NCDaJdxgqghlIsCUEBz4s5W0
         TxZVMh4L3qncZB/jd2nrXoWjsCHXGDGLqjzSL4JtPZrTLQ+q46wBBKdRdDivJFF29yxN
         y0o4K6NHtvqhMgE8+gZCvtOsKoc+dsq3JkQRZCuwyTL014waFVkn1Wc6ibSzbkvTUOo2
         yWMZXBYM2vjAWVLrfFb3pF3gKk+88rXt376yJS2TXRUqyKmU03E1Aq1IDWd1k3pYivUY
         5AIg==
X-Forwarded-Encrypted: i=1; AL+hErG1iOH/yks34gg9IioUQx+K0J4wcPtJrN8hdz55wPmtno2+s7lxk9CaerOFgnnOo965tBqwDFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g0CsG8ZAKSo74uGdflYzBTZM/ESQqxSZuJW9ybcqTWaMF8VOa
	N8by8O/ojIz/D/mXnRwkApihybnG1bJCRxftuY3yTaP9n6/7cI8MQBBs
X-Gm-Gg: AZFdTZdDq4IUK9vJcevnhS86H2pFWHz4Ki9Xu+IoTh5piToAq5UUnYl+hJMw6ijYAU2
	Ezz5K90IC2IvSOvSlQ5782b9M1eyYK91pYeoa2z47HEQgGwYwiHtV7kmuDR2tisxKe+nUcj5Laa
	Dix4Sffnyd8Z+XkSbVaP7Usv0upBN+E0DIROV9Q/Fxa1IQfiEPOF6h6JNKwud87FwTyqAB25QFT
	gIsGJuIdQYdc3R06L9HOcG8jdSJ2rEDKEP6kTUKX2kav6/mtCW2hWfgQxQzrRXYJ3NJ3T+xob/O
	X7kxYxvBbBvQwZBGJzUDkL+w3BS6ED+r0q55cFSJX5bS4+YZlGtIPqRzVPWz2zek+KNU+CcX7AJ
	6phcCuIl4T4la1BiV+jS0KBP2i7je/Julq1YNdGGrY1FIzXBuxrCVGx+6f+7N7oDHp4gbsxEcxB
	dLdrzZEzxmdpjecmhruTWqBD/A6KEpL/sG0jU0YEVGE+f12YUY+r2TBZS/oE99TMwsL5KJubapO
	CLR6Moz0W5xpqoXjnwA8/Sc95f6aeiwcRuq87ClKgQLpeqWZVweuvTTq++wW9k3Cy1p1kjkCswq
	G8HZ99x+++GbG/HybWBmw6iHxakeOMplQZ2hFPLfkglTyzI=
X-Received: by 2002:a05:6512:b9a:b0:5c1:acda:6dc3 with SMTP id 2adb3069b0e04-5c1bc6f6c92mr643326e87.3.1795162273362;
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 20 Nov 2026 11:11:00 +0300
Message-ID: <20261120081106.2919010-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +89,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0

