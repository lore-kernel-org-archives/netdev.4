Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353549;
	b=OIOs6bepgSp/Enhz9hA1BX7wXGCiKL5ou5hQPQgt+6RRGLQYEtBwt6hYjqVLsgK9yyHQ
	 cJV6iedk1f9cc+j4uBEdDs/3n30kkO/YT76Sni7tIwZ6HBHRthoWFZM/SY8lG9JPtRP7C
	 U74OaQGYliXNkEkJ86yxBsxZwINXJ1zC2VhP1vMPlwY+hkLIkG8Jx/2KSdxLWKiuoskS7
	 7G76mWXUXqshnn+X8G9+xTPNB/RqX/FQZNrYrMKDwtly/keeVL9xB+EIc+kap3OlQoXm+
	 EwbHA6NLjYrh6jxWGSzcEV5Dz+7n/vd6+dLjxzWq3M0cudT/neiCBWcTqiCNdlcsgBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=Azj1m55g0d8OoDWXP1W6kzgR6c0nn7xQMBcrwd3Z9O2ZiHmLFsTdMnVZtSzSHzpLHh4+
	 Kn7uKP3Z/QmgxKpMMN4GaKeKYMYja+Z8FWGn3xQen1xAZjZ2hVeSwzNnMIlsW6Jd2X7yE
	 l2Cz4HueO1s1YA5BqPnDBNI4vWCtApy31qPBqVmVvg8kseEdMokfnLO5qveeYKb2ytUC9
	 t+Wxadbk+lxmFDwy6G3u26qARk6qUeONkjlGlvyiL01yGG2G/9tgZ/UXTA0gzISEbRPwz
	 dO+eRr+RaECwkezgX/PQUSNpXuTDdFKezEBbwawpH4FbJ/n9jbndtKiX3hRXovFU3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DBB606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DBB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2927352e87.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353547; x=1795958347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=xHbcg6i5DphML4jkCzhbweDh0VvOde0E98etF4ObufaDQjVTr5VMlRA/A3p7fH1jbW
         gw8KgP+5ZIXvPqFxNivlV46WUQmVfM451XW+6KncGJzHE2bK2CleBZxAgKiTb14NKgnj
         tiHH/UdgXZ9vBwACxSLj+P/kbYlcpTdsyBj4l0Xbn7PxletaQUiHbemw/k5lxltJqwLw
         DMWYwr7FCNyjsUc4edtceV5XRjyGzswlwy/X8QK5sgotFJQlQI6zdJxMCJ/4oCNz/LJt
         pWsNo+UXcx1x9VOOvV3oGc5HdnrGTP2fXhn4dGDZcx/aPg6W9F8Bshp2Zlp5qNHael2W
         Rk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353547; x=1795958347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=FqX+0Gj1K+A2SiAwTYprzhogIPPnsNy1D5d4+1eYk+ZyM50EIc31WAlc44okB1eEU1
         Ru2lbWS72Yy2A0WC/dYur4J1lVE0kH9Hg8WGdssTY2fqvTOUMrYVFfvKa3RQhX1SCaTE
         VCLBqeSfdHrKEmy1Ad0t4cwQAOjusnjn4xlQoC1cLRfpjYg611TyZsw7yjvmvRq+WnEE
         yR6jG9bPOkQx/7LqvFyge6QGWs/P1hOJKQ6H5d80MEF8Ooy0ROFkH/nJs1SU01s7GLsk
         VdmR4YKU/Iqvo8lAil1kopYFkhCx6X2XOBOLhXVExXxhRoV+K5dn+FhagTDDG1iEiNdc
         ZsPQ==
X-Forwarded-Encrypted: i=1; AL+hErElMBNxcuugki0sbIb2NPGuLdOCaCzr4/PP/LHmE4bVh+x4mCBVREhEiJr4kN6aiwdwXH4gjW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z942VpfjCgikhFmGps3a8cYWTGc7xMe9mrUmJBuM83w5xU4fpct
	4DCJvoteiqSFZLzccAACQa2W5+urpMwrsJADdi7R2nQg+uUJWgj1fupX
X-Gm-Gg: AZFdTZcKmz5K0YELEqCCZt5Oi5p1u93a0+HzNwdpph+7MSiQ2CexhQUQd0mgYPKihAD
	+aYg92y+zzHS4K5Ag9UDu003iE2c9o6a2z+0q8z3OzLescJzrm/xu7erPlhJNri9TEPdohlCP0I
	ZL+m4pVz9RrVWd7HBs1fcA+r/E8ZVST8DacIuEk6hxdiEPKUIV6zBgrQrs/iMQpkBxdZSm8MZji
	oaRNAKTBgrQl1jEJ0/OpkaqhZgN3P69cc7H9q1Yz5ipwDOqT1EOlpaMOheu5gyi3byJU+4EZhjK
	OnJ97toug3lM8uxnLLssejHLyqvULOJZ9RYyEyIyC6+lie9+GAqmj7r+2XzjRdLfCRLMqeVUHl1
	8ig2kUTs8vQ/hghnbAp48tochZDTtRtMUYgXmmif8VE3Sl6HKtkUammHSNpe3iZSq1T3cxZjX/Q
	RlGkhYRcHEvodmm/Bn0/LDzC8UVmftQ3ZYtSNSpJU9fQoHhSm95YdPKKx4quZr6rQaR17AtYjqb
	JT/TZhDhBLYxUQZRr+tltHVJ3Xuvht1d0KpSKQ57+5F6cRq+X0zwQg1Qfk4dSGEHLOWsxj98u2C
	AmC+oZDnsOvUeanR8dxUjhKu9cFLiA==
X-Received: by 2002:a05:6512:1042:b0:5c1:606b:ae8f with SMTP id 2adb3069b0e04-5c1bc660882mr2748867e87.7.1795353547092;
        Sun, 22 Nov 2026 05:19:07 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:06 -0800 (PST)
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
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Sun, 22 Nov 2026 16:18:55 +0300
Message-ID: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

