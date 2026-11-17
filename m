Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933714;
	b=5sTjy0zLEPgZDXjeov/LHdC+gsWxDtml2BOp6RmgpFmtp+E/qcD0URWaFTUy6Ru5NB9i
	 GPx92fjEXY90UjhLLVtjduwq6boGaYzcBc1R95/U5x2M1lPAX1Fq8isB1o/xW8596Nf+S
	 yd17MiDujMcqjq/w26hQDV50WjsQHBNPjNeZzM5dfzA9GipsabwppsA152h8f8/eVTs2Z
	 3s6niwJ8QQUzL71I0bPZs/ShuUPJ+6lZcLJYbiQw3w7FlFVqLsYtIFg1td+LsUqUha689
	 e2uYsn+KEi233t3DQFk/quNde7UeGrsxj+4uEDvjhIuLQoqtnDR+jiKvfu/pfKh3GqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
	b=th3SbCrDZuFByDFvq41okI0p2x58G0T1dx8KT9LzejJf733Stb26temcUVFvaMzjRMsp
	 hzaQoV/8Gj+hXfgsCjw9+0yZ4RYrlMZ2ocXuRErH8Djzp1ZcllVzLrnzU8ekRGHOeV5hi
	 9/8bgF3vducSJcVUN//01nCHOJ0f5bLuanGLjUVq9IsWUhCnS1XKru8fgah9qH1QqhWa8
	 kKkGvMdEH665MfCQdZlj2JQ4AXCyWvetk77rBBNTX6egh2OUPIyv+4+Agf1y3G+6MKZXX
	 MZvqu1k68L51gXwm4iQy3ajS9JLHojgCpmz7dAdbi43JECcFCrltPfOu0YX8RgIPcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83576606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83576606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so598005e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933713; x=1795538513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=diTmpu6iPHPqo9m+2tYHVlfuMOMp60XxZZh5NHM71BDcSd3RXbX2ViehEIizRNnlbr
         oFuzXfimjV0/7cr+Bbp4qEMTOuDfRWI+8MTvs4vFCs0dhqbxbIPktwdpuNBiP+SjerHA
         n99AByFdou1LEKDBlApVm8ocFugtqCNfAViA7evtO7/RFmupI2z2M12XV5e0xI0OkvaO
         TCYlFtVIX3xoHheHy/R6gv4DafEM4vdfEse/C8D/2dFIj28TUh7G7N/9XLw7gngX4pcZ
         R2x1tTveajrkHIPiCQg3otNZ+uSCOUTO1ZOd9j8twMnpth38yComQ3bY0m0aLTn+P0gk
         cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933713; x=1795538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=VM3uASTjTlXkDUu20T8Rp3n1Xjquz06lXu4yjqFUpqRLoMAfOutxo8AQwYg/zvyHkv
         QGQE2rMXFVKPh8pZQYD7j9EVgXfK1hANX+zBO0fpNylj1pT1O1cvxBvuZhtFJM+x0Pxx
         dm+tCI2fExFxu0GQL4TuVOEMERH1IXOIeJlFlo3Sttxv2Upopadktg6YOKv8QT5NZDgN
         mQ+SxJwux4aXWjR5X2dpPfRnLNOsvIW+kSemKWlbudHmy/MTnE41Jw1PIFu4YjYkBK9k
         nMfc75M2HHuV7THGFnHUq4eWqoZ3fRJtCAifpIfLM4yc+lDsc2M6HVGwl8w1oSYxfKGZ
         pZJA==
X-Forwarded-Encrypted: i=1; AL+hErEOXk62XPGykOqqalfY17RtvjNGrqK/uJnh7GE1Hxjx2Uv6vkBYVAPEGHEMuU2aqx9eUI9lhDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HLKnRfoW9TZAj2QQ2c5zhHNc32qcJAoYx0o2tgkmpZbIshS0R
	WZDY7ROc4ebM3LpdvrDce0PTloZHScAh3GT2d88h9WZx9CPAyRbiRkqJ
X-Gm-Gg: AYBFou0i+kp3HEenvpjodf9Tl3jqaXDIimugneR9gb+bByj5VNPQIHNmoRr3/l32wcb
	AtfpX6vdNv8KXQgPJVPldqAS4iS2TYi2rOwnoHWlgK5F7yHOskqXFbH7PZckToEwk50IADFBPxV
	hZ7eQP1Ywi/ayoy+i5gvWsawYKwtSLlOAT31v3nUBUNp2mv5T+cGCTmRudTyJ9zXgf/WWPt1xXK
	7HcafLBHWkDOcivtDBoj60ZJAOa55J/GE/zl3PbtGE8nqE1SI4x3dwydxHx+olatuJMcvIj7fbS
	Q1aVqo4/CHOKGCt06uHCGeeX5NEiP8wT+ufcWlUME4URplTLFNOhPkhzqpS0ZO6Yad6Axs0dk1c
	uLvWICvJNFQXiE/JPM3RY1qQHyt4LM5lEODdVxZC4Cci5vhC4ZhRitW9Qa736JH7L6Lm8cPPbJX
	Xr+z1qmPC+1F2wL4hePOKYb4B7piiYw4zYrLXwIBg5iAiAez6B86l+ZhsgQfi6Z6hcx+zSgaKl5
	v0eiu1IJPPTG6tiKGtTxi8CCtl6rtwnR9jUPOjtElR0xtogRqGdMx1OdeJs/rakwVDt7SlkHrSV
	lY63wO/XLk2y9bpGG4IiAQmqOj8AesZuj/1HV6vPnC91Bw8TX5qaX4M1PfJ4eNTLHDVPYoES9cv
	IjZA1M/LKQIyBLnG6dhIpW7MAH++mR7UnIQ==
X-Received: by 2002:a05:600c:1988:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb5e2693b0mr281411975e9.0.1794933712865;
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
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
Subject: [PATCH v3 2/4] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 17 Nov 2026 17:41:29 +0100
Message-ID: <20261117164132.47167-3-ansuelsmth@gmail.com>
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0

