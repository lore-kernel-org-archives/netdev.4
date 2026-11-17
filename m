Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933716;
	b=F2b2L6S+/O7l3zyMpzbwkeXnmon2EJO7x5IXKd6avjnSAndAylkhMcjOKxDoVywKGz11
	 EgdB4vmY/PwOxgMFxdLN2ESus7zy3svlpl7e6bNIcPY8MPKJ+okdj45MUEa8fQEvxgP1w
	 0mogopbCBcP6oKLOPLJRMQmnEEiXUq4LkBwpM2K0Vq9vU8JU2SiR2w1lM0KMCxpVel3n2
	 5CW2d3mqaIASEroXd1kddZ10CxraFcImdsCMbIBT9+mxxePcO+w3CGSPqZ8bLI+p3Bis0
	 QC2H6m3YP578zhZNPa9FlJOE4LeCWXspLo2AxgmO3VtSd82g3cR56hAIN1WXmsQYQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=xw+VQvJrUS5tkFFRBjgubpLLx3w1n1ePMSgxpxYvK3UfXfXau3GCiUJjvDHDP3GceNLw
	 FA6Oo6LM+eBLinStFkSjhhEZeRlwo2bhV//EdYHJWja4IPp8d2y0aLBn81ulDp6CKsGqR
	 pXSzW9pRmMWODxtYeQVHK2u4NulDb1IXejp0ZjPu7vArD42h3mnjW/DyByatpI07ECiz0
	 /Led18YBPaUDEUUSFk1C7cx1HjIjj7Wbwq2c4fv88AfS4Tzvu2rc3wUnbbvVuyyQtqkSC
	 oP5nftCLXdeOljCYbEFYobR04RUpiFAexaVudHPMkCQ0CX0UzvLpjUP2CnnsFcG99Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C7606A89F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6C7606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so949865e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933714; x=1795538514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=sEcYeJNpeRv+Lts5wXZy6F0llPLMKNXQQzf3kNPXLIcl7F9lC98wbGCW+aTRts2Lpc
         Gu6Ud0A59ond0ewTVe1gxYQekw72vv2WdeMenM1Mev3n0wX8qmEjXlAP+bwNKXaMj84g
         SIym9BXPsxXCLDQpD3LiSGJ9Kj5GSptF8eR8zoY8WJcX8g5SRmu0PltUDLu53lQfLPSF
         j7JUlz8jIWGpihAyWWS8zhnftQhLxI3isRoAQ13WjWxEv5YJDX0AjygasZp1jNYsVKjF
         cxrRuabweevUR9VcFbUgDLIka1w1dX248YaWugml0Qm+6TMl0ntWmlM9hDD4c7Rkn2sd
         0fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933714; x=1795538514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=E3KNbIi09WSbSjia+cV0OxNcSYE+TS54n+ZPycb1YDX11mnJrbgNX+8nL3mK/P1K5+
         x+WleY0thKMlZSFYPIbvDSkAfz34Hdq48k0+Pa66KqMpt15P5Zz7muANDVdWmuOJFuFe
         v4t++L6bGvBZAKyRr6VMS8/xPIxg01Q6DCsypMy1f2ZuQeavB4+/bipv6KG0LdCCNqft
         ZGlnBkv+z7+6rcrd7VyDOCrTcZfq+x2mzkx4wXFV5OyQ3EZosSDHLWQ7m2w6HyV4u9VX
         3YFFa810IdfpLpklyt0Tu0qO5BZBWsMB7lDHKxg3hUmMi38MA3zgaYFsaz3tZDJqeIdv
         Cbjg==
X-Forwarded-Encrypted: i=1; AL+hErHx9Sw2Dz+3mbXJXmNeLYlWyLS1WDevGF3JYWSg5RwmZDSDceLOAwlWZg4J7Yxww/OzMZ6iV24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mCVbomMyZ73anGkNj1FKtRf76ccWFXo23SBo/xiY21Tvz7zUY
	IJSMl5F+WoSAM1WFfkKcc5AbqA+Jb1YSx4Gqy43+VpKk/tpwyLlLTtOy
X-Gm-Gg: AYBFou3PTN55Q7lb7KO1dDrBISWVUqpTWG0r3p8WyxBedB/pwAmFhY2o2Eg4AFb/blU
	Ox9qKZVm6mUzCz49drQpG5CKrNQ1xcese4Xd7yxmXRUAAbQQaAqDaffmLjKSEKsq6l02xwfcSC8
	MRZ7mRMhGvuEJESyfdQElaOe7MYdLloDs+8eS5+BCBR6B69NxRuq9MvhLIRvnAOPxDJWf1OBVte
	OBdkHvebOEA8nyBlSGjMg6sPwUYAahSSFOPwwd9bITXDCMeFU6eCPKtiZn85B0eEmDqQjoFOSRO
	Hd9WloJcXMo+TEcAzOPonl0alA1BP5hv0wiV0lWkTcb9mz8B11zUsdD/D8eGxFLSR7mVMhtoQzV
	6FQMYmbW7GnHCgFM0CHXfJU+KA6SmF1Kl+onbhKLyAy4xOS2pIpR9S6hHXSdZORqQwRApdSupDp
	33ZP7rjXsUBlHkcraz+5fK/KBMeVtEGg3Bh8UJXUxWBv3/j7/SnaO0fHYK6hHVYxjObgSV5/qqH
	+4uIkAp+urxjXwGf5l97ROe4AMtlfvKE0JBa1HTQUPY9/f1IFT1n2fxbNu4DV82OvnA0T/ZSAUY
	bfVWM9BsTviSlYz+sfhA5VCfFLD6NibzAG4EBpWFp2fvlDaUQbEN8rDaCm0IbNKnXM8Xzib00TB
	nqfYU2Hi60CLQ0AUTAayreu5Ofd7DB+F7msg=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr237923745e9.16.1794933714168;
        Tue, 17 Nov 2026 08:41:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 17 Nov 2026 17:41:30 +0100
Message-ID: <20261117164132.47167-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

