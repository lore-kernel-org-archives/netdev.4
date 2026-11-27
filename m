Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761445;
	b=gNik/W05bhRnCC6R24gDHf/0knagQ1AxSNrE9gQMOfy/6YHwjGreYuZGdGX6+R9Ov2Kz
	 vNIzS9PIYGuDmPdbCkeCGIShnDkqkCHSWCpyxHBhXcXj9YrZpywZOFyxEPh3atwJo92aO
	 WDE+QJZlZvOzw4wz/Pk/GQ0rTjFsQlBiPG5k9WHYyHwrfExJmBIRNLkvI55n709Amm3mK
	 NmGlb1ZR74Dij0pudzAmREc21JK2BoWi6y13EporAs4ZJ4FCT2zw5ocGAAR7e9OvyjGl/
	 ti++W+ZcgzUxgZ4AwMtgMESHW/Dl5VNPyqHe5j/nlPYWqQ7BfRz2Xj6lwha76bPm1+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=AZMO3xTIaKOwkDR+dEKS1ql0JXmV5sGuOfyZ+PfuJ+NvxIjXMhVm28o+LuEVei+Dtf9F
	 qey0Pr/RLswYv2KqY2VFv7DZFY2z3pBp2g4zuuGD0/Ldntxzpu7M+W+5eZjOE2QXEFa+/
	 ra2EfhRtIFp66UU4TkJJNjXI2FInqL2sJ8p/AsPz4A9EdzhPBBx2TLoV2RH+vIAc1XPrQ
	 PVUwKfiyU/2VpmDjm3g8mW5SQhbWSFPksLSto2YMQn2hJ2xB72A9TPJ+phXyA6KzuxYP6
	 9PCUSO2b7Lks6mzjSk6CoIz2iM8md45rj9O5ByUbgCRxkX0aCL6bvtyu9knNQhSyr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A18606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A18606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c10dc41270so8131986e87.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761443; x=1796366243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=JbstO9eA44E3bBWgMfke9c3iAS4NCqV8AdRs6I+r8195W90yk4G+cM0lHvrsM2RGLY
         fVLIjmdyKg8cJPUyg9F6r7Z2zSOE0Pcg4/4D4OyOl/TAGDAYBU0nptGlvgko9e9PUYdD
         PDG6qsaQul3sXhXdMxWkkIYNv+QqEU/32ylJ0uhoioJEWq03jUJqFbmG5weCg3toEe74
         JuaslaHwfnCi3IMEUh9Sh87FOEyiwSsLXJxj5svnEy/nXwzP20/k3NmD+C4JzTZbESwg
         BOf6+yVq7my7WLW8h3q519c0PbtFIramMTL7gF52B3R47qcoVGe32TI1fiO8fMONgSqf
         cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761443; x=1796366243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=uiUdmQaloAyrjjh1D5zUiRF/zb7T3LAOPJqWScsadd3L7JT3cxZSs1Zn6hkqPu58tq
         pEsBW2jWy4svQ0jOII2qnBk/T+9dNEMB0eaWRbJL4gU1ohbPzpMz3TCAX8A+VZHIVdsK
         e7DZCszk4Hf1izLNfq0m1CHzT83nz2kiDVHxTXyWNJ1wG+l0J80ahleMmQcWOGUljvQd
         f1oIsEpSTYrzLg7k9FAPc8zrwztRxqkOFuz8Jw1vEBcKxkut+uzPtKUi84nxBNs/NMJt
         0YA4JPG/tmeCbLj9FtHsGROKpmspmuE9scGnQJVS7XlvKCGDZX0In2Rp1/ohr1PloF4b
         ZeVQ==
X-Forwarded-Encrypted: i=1; AL+hErGax+Zw+qJ7wOkGVyyaxF8j3Rw+gw5Wdh0xlK+LOoMiCnt9NqsvfCphVBz20aVuj4Mmb5hgd+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ROZNYasA7cMsdb/aRsr6yp09vaQkDx2z/xEp7X4Prvq46S1Fa
	PA3u0mmGDDEAS0b6Qh+4XdYt7LElUunPBr39FB1cTOnAiKrNvshhR5Sg
X-Gm-Gg: AZFdTZfm+A14VlVGsVoUwKOh++ixdJwbQBdm3+Hvvm6DpOUYBtV9u6cBkK/cfeJ0dJU
	p/8XEobkXkbyMsI05IyqcCzOgvO0/3ptYmy4DhQFxHTIa+vmNsc8IoJlov3oFblWAdtGsuXTlUO
	XNC24KzPuSD1Mw+gM3LFt7yzelPvoXI6v9mbNBvzyClawERk887yh15HdAXGRU/lPBJ9UVoQbA2
	FYYBsZw/XxaKOmGvrPmOiqNFruywmkx5UkKHTiPd3a1cn60fP0ynRQ4NfBKDfG+jJiGK1uHoEwx
	+y7mNWDYGz+xurimq+DtrGNDV4qMTj3PWt/IlpNXeIav2SlC8gBFmcdwy7MvlrUXHWuXE5bSE9Z
	09JuG7PxNJxDZYJLAFAHOgdFK6tPijR508kgXMkHFRztLkHyUSoix4ckCrEzRk5td16fjFlc5J2
	k/JlBsasJ0HbRhwab2w+uXEEIBZaYtTFRIvpsZNY2+aUapcB3JCmvf0qVw37dgKN+P0aMVUk2o3
	S6gey2MexNR8feoLmM2BXOLkfhVbBHwLP6kjeERzJL3El1Nr1QWGOAySUtDlFRiASx6kesoGQgf
	Za7gY5bXNrSdua1LFvpFCwNcv9hezA==
X-Received: by 2002:a05:6512:3c8e:b0:5c0:ea4c:faf1 with SMTP id 2adb3069b0e04-5c1bc6907e7mr6613134e87.7.1795761443064;
        Thu, 26 Nov 2026 22:37:23 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:22 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 27 Nov 2026 09:37:04 +0300
Message-ID: <20261127063708.3074433-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dptel,dap8211r.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..84efee27400e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,31 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
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
@@ -58,5 +80,24 @@ examples:
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

