Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513766;
	b=xCmSPaTcwa/0KKSwxZKSRuSSP6S4k9veJkO86sVuu8F6pZwULrm6tapH9GsRd/7arSkF
	 Im6fxLrF7T056m7C4PNjMvf3ht6XVgmAsGdbKscU2bhaijSXu/liXsBoSvaCRb9+BTBky
	 vdrp+3B1l8Eabwxd/UNgORARAFTc88YAk4t5Fa5kABQA8VB0Xsdhlz/VtzFh7w7NQnCg+
	 7qSWfzBj5sFFBEMqQ6sI1rN777Aldnf/Jn2PDN1mAQ4Bb6RrXVOBZZSJoWItdEynnDM1P
	 k7UmE3Cff1sgS1ywKUzuKEzGH5ZWhOt2Y3LErBq2bAC/s0Gn/ngUy3T7X6XvgUl44tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=Z5W8RAnBx6s2WLTx3XwcnWuJX+IFsalgMwseIcZeDRzl4U8Db401l+/rw4Ln1XFDDegy
	 BZ89m0m1SJ/i7/+JGneHuIgwiIXwjBoOAtHuV8h9/XbgR+YpHhWDV8eq0zgMevQV4pkC0
	 nxaKTJYS2zfpMF7cjTy2u4alwNCeT3ZKVhC3aaM9ljl5bvDN52mIJ8avm4Wb7mdQ1fcAU
	 1v/LHlmZDK4dAakkrR32oPwiOYZktvku88W0pzWnGfw09yH9TnZcPWBI0cL9l85mm0os4
	 Jw2MhKaZY0mie7M9U/SQWLi2d/xinvbn09xHjwD2mUyQVHz2Zi6H9o2EuQS08VtQc3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tARb6/Kb";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3B606B733
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC3B606B733
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tARb6/Kb
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so31541181fa.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513762; x=1796118562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=tARb6/KbEc1oHqh665ucYNIdzhbedQsMYGAiZ2+yhTVzC1oarcfoj9mv17AoGmvK19
         gGHAXYikpEgSpq9sfxjOFLqgj0HbYSoYC+rc1+idN/tj7kj335oTRcuV1y6dngZ+xPia
         drT2iFui9YbiJNuZnJh/DFzi6OiLh6saRKBaqQlL5djLRgZuLI+vEziKXebZZkfVk4hz
         g/5w+iMiJt9aDWN5usdy5sGd2/iBXLMk7YswiorB1L05epFtEYq7YT0NwungI7tepLaV
         1cThsk230jxtEt0a6ikCSiDuasLrUN2tFRQiz4K8F+sjVG0MUoaeaobDv/D1UEOtUn4y
         8KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513762; x=1796118562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=jkOQyJfHRsYYF6qNAs4mWGM18qwyvx1uuOxFrt5IcNYWOnY8AWImnmWCI0s8d7C0LS
         0wkIyWILgIE/kGJiITBexyS88bdp9QQeF/H6zcNrXmYazzlQnhEKnPimu0jEFOO3bjCY
         yh8Wg+mHFdw7hlfM1+cZ7nfq3a8XErZe3ot8NZJ4327gHrzVu3L2y8MKuu6lqjfuV08c
         OO83YH5xQ7ILADnCXswV+/jGREtoJ9VeOIupnYg9jtJkvnYF1Cn9CjJ1L3CjcqtjRx2b
         Wxp0pVvcO1aDj4s8Fv+PoPZM4bG7kJLa356mMWVgRpxG/Jl98ZIe6qUVVwm1SZeTF5xJ
         aPAw==
X-Forwarded-Encrypted: i=1; AL+hErEH+i+olobqFRkrVM95Bc3gkjnrk9bLTEkvqEjGSdUN8KfyikcEUnidUqLYLU/aWQlJkG5H3PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sDCJ7ik79F8g8lc9B75oiMnBFqyg3yYrtctqb84NvUPt+T2tL
	ISwZ9fATVYNu4tgBk4qnpxSrg6GzovaryR0BMsPqqc6QXdajCOeqMCLI
X-Gm-Gg: AZFdTZfWXd7a9Ax05NjerrCwFSfhwLhYn1IlA9W2IGw1MyC94MBEYwldoFps41K4+w/
	65F4q6WtHPJX052TnBKoGYfHkgYyT+R4F/vQeRDKhCr5oML5OPMMwsNBOmfLQYJVc9JrRDetQWR
	b4a1i8Kcu7VTlSiznM+IkIVYs04A7NrzR5nDykXxHjHutSRxdmm3c40wio25NMnaIR0Ey7NbsGA
	CCguGsQZag6GMJYXfyCZDkclu7VxSBkKpqAuR02IaOi6o7Oc3tZHEMSpjiWaCa38e+WWXX2B7gN
	DlKqCddUPEUkEERVSM1jU+4T+cMRYyPDw1zL2yF787bgejiIeYAAewt/qRgOYY8WQkTUJri3jR8
	phBnp6xDvz2Ts+vip1Q+PYrNBnwq7wuh52e6oVXPk5l8B7claPCLvKT25qR7Pyq1arJbeMeeGAQ
	+vvRVqrF47a7R51y9W4rjnXipjdBZMKQ5DijjS4eB6Pu/50CATP7ftqg2KZ42NBTXdlk1Ies2/E
	kUKz8hMRsDmYaPdiJczRysRSw3gDp76HQCK/YakaKeHKWkVcYHiIILBnf0GnSrKwkyovwFa00dV
	ab/4WDWaBKVfgm2R08A3aLgfV79uHmTsRMtTecHdmZBGpB4=
X-Received: by 2002:a2e:be26:0:b0:3ae:25c9:f5d1 with SMTP id 38308e7fff4ca-3ae7f9d255cmr38992341fa.11.1795513761797;
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
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
Subject: [PATCH net-next v5 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 24 Nov 2026 12:49:11 +0300
Message-ID: <20261124094914.2993988-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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

