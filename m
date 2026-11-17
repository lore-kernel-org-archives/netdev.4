Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915884;
	b=xuJRHKIKh6neMIt7zLJ3p57Fc0eU0K0iGJa13xNRk2ToJmNaCa6RBJ7AnqVBk0mF/ykD
	 T/MdeUUcG9brrcQ1ZuGJ7EX/9KoYzLrX3/Ye4cS6HtsjB81lu8maCo8eT5CHDN0IUkATl
	 JN3Agjmv0HAGx07yTVQlQXYujJoUT/0uRbI4xBOVdXS9Imxd+HpegCgN6PW/Mx8BoT2om
	 B4j348II7Nc3DirJFPL+mfs9LmYJjB7roP3t8hOYhd7Cu9rsgwaUDeQOIYaMj0yGO0dvi
	 pC6xgGxsaXXPLm0uNL9iObAvTiBrk/DM2OEgvi7yntBIfzsHKzQzFp3Pc2Ppo+naPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=n2N2OdYao7f39e73AGEQ0/dpSCBJJCX8fwjZLaNzPSFbNtuZGzUv9T9qv8pGgcOuF1Ub
	 pdLwinB2lqkdefSzPgzsxPU91uLhiWCnZc+JFsTabeQrn9kQ3BjSNSbXsCEkoXnP3I3Vt
	 2Vbgw6Gy/fyz46gyd3FTAvWhQ6FwEQRwYAigvzAjhF5t00qGYA7rnR7vPIMsv6yYd8dZ/
	 C9uup44a7xvTFz2Hl5geLMkMirSHoHWpUCke8eiajAPNXUtnl89AImvzrH8CU3wt0OM88
	 Z5h/xGqnAzu3SHF+ik5TqvgriahOrLApScS2y9gv15xWbJdo7VkMozqzSp/qdpDng8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D6606A88B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8D6606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso855662e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915882; x=1795520682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=teAlEZjBHBOFG30c6jnESNVtx0dR+W7j/m6jBabIrj9T8QM78LmH+y7T2ZjbwACBR/
         WUxAffwVO+DBtGlcW9ZJ/66HIB5qLhaz/QUhllkd9YwUFFfbthoSp1PFjOph/4GyPzJ3
         GL+/yXmsuQ06TfLgAfx9pQDO4Z6bGTSmHIVWKpsLb9yj23esozVAB4Xul8AjWSkoAPJd
         HF7Pa8dlJrlKuzEdopGxYz5h+rd2MGyULvgM176kJ9fEHnPW2yVopR6q/472n72vsgYb
         UPkf+rH5dLC5jYST74IqM67p3DuZXARFVl0ztSL75fOOKOPSj+vNrBbo8pCOnxNpQP1S
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915882; x=1795520682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=tkNed1hS33dcw7KlUSd6c6cNz+/WUlSemHTT+2Lv+FwS7AzgH3G0ulYu9HhDsnYFQh
         MwnME7VKJyRsHxAAPdMVVESX78mn03lLwT7ZtwzwXEKVROQUwgIEhJQ9hPQYxaiemR5z
         Vo1w9rSy+LmB7nZxs1AzcMgEOKhFH6CDxvQcHr1rPS4k79cf2CByfpn7k1UUNirV8wHg
         lt9lMDCZndprndlolz+QJG9A5TBjUFQm4Qlzm36P6Rs2821y+mcI0FZjMqy+VPezIGbq
         eCMf2uL0b8pq5QqK90qU0PCIgI8s49MEXtFNAzlm+oXpu3ePAqJQgiksoYUc0/FEDpte
         J70w==
X-Forwarded-Encrypted: i=1; AL+hErEuISV9SDhpAXMBsCJfbUXHOIcoHVDymFzbCa3W5vHmPNCvWW3tYpcn4Irq8ew6hNXv32Ml6Q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ACMa2xDf88gXdLqbvjT2wtyIxagKjRsXGcd8qYyy5qWfccyBK
	dMHtr/oPkODRzsVhzZGh0LQ7jKyYrRGGllYkVZKjLXzvZ6MI9fuJ5aqj
X-Gm-Gg: AYBFou3wSvA+AuhVRlGdgBhwSVIXjFeizq3y9RXaED415LwK28melQfOfh12THowTuG
	htf6sbX8619kcPOw9HHzmc+WhUUtLzeJr5x3Yk7mP9nqhJ5YqUkQGFGPJy7hYfha9iNNHdvt7e/
	XZ14JeYgNg/4QqGNxK5JzLlv3SYT27yL1OQ8w/oRkWeDd+r7Rkl2p92ptkOS505zSS4XvLHZ7ci
	VeXXdo+U3/moCTYDaKmfMhHvcW/46tbjKSM4GKNmvRqOGDIB4fXttraVexGHewerLkla58NkN4k
	lyqSwcCqIiid3BRn7aq0UgejtDx568rbrdy9G8G61PIOkGgVQ4GhyYU0O/NvbCuBjiztjq0bLUJ
	DKBS2ELoGhZYWV9/UfXQFq8AzPpC/Uu5Dx18oNohcrBNMASvdHCML34qA4+JbsRaS5J18JmoCHo
	yU8rYFR33ArRt14CmF8oF6odhpCp5jakqfTxlUghXVYBdrEMnhx8cuPQiJeTcAZ6LXPUygZtCum
	4kJw24aWyrY7EBw8RzlRfu0G6zOqg8LqcmynrocLZgGqOC+o3P3anVbCrbwwjvYYqDmnqUqMuLC
	x2bkomNGRiv0rtWHIdkrZ5b3VMTQbxT4IFWaEUrqnzDfMgw=
X-Received: by 2002:a05:6512:1103:b0:5bf:f7e7:85eb with SMTP id 2adb3069b0e04-5c17077ff45mr4913190e87.21.1794915882295;
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
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
Subject: [PATCH net-next v2 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 17 Nov 2026 14:44:28 +0300
Message-ID: <20261117114432.2794961-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

