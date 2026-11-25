Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631873;
	b=Edf1/KyX2B9XHZi3yObaPcsoGc69YAuRjyVsaFxfQFy+SGD3MqVS//EQ1yhoAhjPGo/A
	 XYaUo08p+Ajb4Iltd+UUGlHRyuNSCysY8Er+YJOu9g6M1TXTjswYphX5oSxUf9mjZe6vK
	 yoV3MUcp8FIBHN9kldqAWVrsZhbikm++ZtyRyu00JtT77CB3ugZ3Dt6i9Z8rkZ6fGqDBg
	 ku/ahUrQYZr6vv2ghO+e/RCUgMvw0UYeg/zckMxqb51XkmOvpT4V6YQVrCF5ZjetuSUQX
	 4glKYG4qZncr39NwZv7VKtDINUyI3f3RpgPvmLqUJtOFKBdiKKQmmee5Najlzuviwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=g74RCD7T5F7jPRY5dBGDny+r6vfogDn1oW73oSUmIFb56hrAG/JDOEQ73WEHfgSdM8DT
	 eUV23mujpsQ3aHH2W/GAcjaZRSeTGcJ80Is6fk79EA5O9W6R7kHBH3RLIFTwIiP5x/5wM
	 Gk92IkXsFg8PdqCanGHi3ictydHJpXpYvb3nnT+aS46uWm9GFMNmcNDuoaFkX2MDaEyyz
	 fp4L02CrM62KcpGRygACIiHLg8CRIh2fPYfCOOeLOhaksLQtLb0WpQhU+jOlq10cqpRzR
	 jI/2eBnH8i9ZbduE9NAsMsIKgNZfsKlFDEL5bNZvPR5o4HNB0pn8Jhk/GZp8laEvJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4F606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD4F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso43551611fa.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631871; x=1796236671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=B4wfCvfSF4jdXEA6kj/yuB2UxAv4pDDqE3JiwSoT/R0UrRzx8nIBRNFumcOkLeNfcc
         7ODJ9+MXj6Zn3KDW8YTaFITvTt0REXoNcKYEOpXZR+jGv+yLHsF8rdlJ4uqLr3zMBdXi
         qNZBQNGJ1LRQ0Gx/Nltz+w0nBvGTnNHCfLKlda723KPJvwW9uJe4O5yjUZ8OdxjIAB+0
         +FFL7sk3+IuXJBagc0IBqo+q1tT/ZJjv5+Yt09fxgl0fH0ov/wY9EoFzldAkqypbq5ms
         ONLrZwLX142EZcRWCcwY+B8KX7AZeRiBzWRQ1+ShyU4jotJhoU6x4ZKYYwJXxGbv7kAW
         ZYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631871; x=1796236671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=NrtCA2VG2sGC4mbW2rS+JffU7OUAtNNi2OgXWmbHld+y3KfnlNKDjId1PAoNtcWndw
         daw6IYTzCn3ReoAAMJRAepdaBFkqzgCOXcRlZgHDxzELhmM8AxYSaDrv9jykWpzEmofz
         3SWgF3pqPyOiTLEbvxt01ICS7fUyFLz/X3odCqtXX0lRxmjvkWWnxdEzTuF1N3YpxX/o
         jwh00h2PlOV48ctRTUfz5mnuOylM4slMBVzpXLb3qpJn7jQDMgMAAcc/DNqIuhVn7yfG
         acImP0XQKLkD6K/ub8oW7sdCLSe81f1m8p/A9rqLdQssZiWwMWJKogo6v+luM2kPlvwg
         p0Aw==
X-Forwarded-Encrypted: i=1; AL+hErGzbRu/QzQ8PHErMjw1nFn1yr+OwYICY50xWjRMIxXu2bxc6Sd510fe5Rp2pnowBjYGHgAq1go=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QABAu+y5aOCMWZX4pQGFugphMzTBAEU0jCepOtJUgmqF7si4L
	/5EllXNVx+c9yg+MVlDRZlO2g8IHHriYyJ3vT+U3hJuFHC/68U/OmJzw
X-Gm-Gg: AZFdTZfTvlOWz15RCAMvFqlLI2e+EpT40xaK5KkFiiaHBSd7fRlkVZts17lATj3NoHy
	41zIBg5d/ZJM0qALSxW6WkoDGYm5LHIjHsAGFM9dcLU6BYMr3CRaHAJ5nIb1RCmg/o5U+/f89ra
	vtZDGFtVK14uuLupRxxndke0VVKK7MkpkWaRU7HBY1cYKezl95MG3WTyc+51vJ08YpFsNtUZ5dn
	Jgs82mrXckolRJmsFtgBSpI2Jla003xokZMqEKgoXDLaN8ZJqtVH+6LY3lMD+CxuGVMcmrABgDD
	J1hkL6OG25PAbUsO9ne9PDLnh/2g6xzS2aAvRCdnPy0ntYIt7x+liPOuy/wYmLuGgezTsdAgEqS
	RoydayBpivbei+c00cV4bk6XHdx3Px6SlC5bLsHeG6svDb+ZGVySXDQ/XUSRtU7GootTudnKrR/
	cAnqMguPqB0OEyXzqJKhzPXPW5T8J4mlbyQHREIApYn7xmF4DD3a2Sv38Mq2hPtldc3IP0pGEIn
	dpqSwP77ryuu3XHEavyfiP4W3815Pr1Spcfy1u73S+gTz3IrU41z+uCeLWs3u5cQ0j2G9LZ60ru
	ZRNLRr8x98Bc6kQG2fJLSkOnekKhAuXVFe7zqtcAZdMXUSvAOs6Gs9Bb4SO22/SaVf7N
X-Received: by 2002:a05:6512:3a92:b0:5c1:4c4a:f018 with SMTP id 2adb3069b0e04-5c1bc6d25dfmr5683691e87.4.1795631871079;
        Wed, 25 Nov 2026 10:37:51 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:50 -0800 (PST)
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
Subject: [PATCH net-next v6 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Wed, 25 Nov 2026 21:37:37 +0300
Message-ID: <20261125183742.3039752-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

