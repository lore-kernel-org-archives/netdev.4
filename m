Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933713;
	b=K2gyyybPRASyrg0r+AlTuYK13TqUVDXCBXd8jkpjBF0Lt2rh2u1RF6tCjo1K5jUopqmu
	 EpHmmqI0yGPbyKzCPOrcWE8QN3dTd3JaerKKRKtnjeWdjM2y9hpvvfTk6xkylXpMvMTIX
	 uWFNwpUE+VkEb8nGFRNblh4rcsD2kKkZPsgrOEN4gJZ22NGZkOBkixushKlNlMNoUawc7
	 8ldmZWgwDuYeeCTSB/+/8+gVJYmsnwmQPKvu62ya7pQx5lDaO+9vxvEpTKx52zYYQvmo5
	 ATWRtJA9EtvwV5zcjMfsZ/fi6SlrfuV4gYKoDdZCpp+X/19GHwlui/SBuDst92KyVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
	b=ZtP6XJLhUNeMyKjNWocG+WsiiU5bRLCrba1z8SkqohH5nu0idvUwdS39KHkNhdPeEWEj
	 JmxQZqLKVz7cgqhesXPOK12B1YgCpXFz8u14bgeWMGQVLzj/f8g5qN82zEKqg3nDZeQ1v
	 f1Zi+TykgfIsV8V9UAopWfd1fhmyZqLKlXv8uDCNjHDqgGnO40bDn6w7bUFqCrIMOrtbw
	 s7tITx/iuMRNCZYpcT5tmnGR7WXLeT/Hj5AXBASHLNL9lgrY2Dobve3aZ3hg/y+ZaCon9
	 FzJCTs0D0wxXgBnYZXajs5hfadfkmIrbvZ3Tr8KBBJTU7dnkt3VdgHMd++dDbVVZJtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516E606A337
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5516E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so616425e9.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933712; x=1795538512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=Wr3dxYS8E/sYgWPey/0VSPT1Gfc1PRONLdWZ+g/P/yGPigjE7HGMAvvplayOPv7WOH
         Gkjdjwv34Iy8UuYflzXUCqU6kmi4fVnB6Fk+N0fNQHjRxHeLEeiZb/j1g8tjKCLgMsN5
         YyMD0yfaBYIfuj10gUKwwwSjhZkU5+AzRjdih3sqiAMZFNymcpnH07O8k3igCNI3keRy
         Ssq0vtdPV9i1Grj6jwmLAGksAK4fJroUzS+xxTpKP8NhI+1ujjKQ9rrUmPvF8Cm4qlRv
         wdUbn6l59WkhiYKC51m+4PFDz6fMOGZt5CUvl/qj/AhDgoUHfdnEawKj/lqEUikAvMoV
         0YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933712; x=1795538512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=XSOKlEDPnsLJD0PJi3i73bxf0KakZgr1DrCgXC+sfrVgqBBz3v4/cMpgk22YP5jmk9
         Kyh0hUUWyOpO+vAcC0OYiXngFN6Rtws6mEaNFnVmtX7N2NL3sBq91HQMlEOWHwfioj/a
         EdlarzidIqr2EWO2ljH6lxGIiUwMUeM0mbhlQXBZCvq5omNc92lgj4mrEgibo5zHP7xV
         cGmrm8SyANWyLlXH0K7BcsjIZqMLv4r7Kah8kYeyATFYoqLyswGh8y5EQDTWsXPAnmpO
         Odjv6nRQJApKSp8jFaqL06qWdthE5fAnz9o1gJQCyYDWwEeOJ4ePK/a57+WqmTV0qUCl
         Scmw==
X-Forwarded-Encrypted: i=1; AL+hErHl6UXI4x9mvz8nsE/VO9EAw7/6RlZ4M5pL3CLTQFb162qqrF1Hd9LQRzEHTGJV/pu8vKQlzls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E2hDy/xOZdtQ0kd48PTepHzBjn7QsAD9VZeE3CVPFQlP4Rp9D
	TdNN2uWCokCjqtkAGNw88w4e8KlrMvdLzbHRpNyajD++gmqdcsoX1v4E
X-Gm-Gg: AYBFou02ygkwaTB3cjRyJi6oeVeR+PUGJc8UO5xtyG3GbN8rgcb6HVbEsCTfljv5nas
	NMACCokdK+dRYymKczR9lQ+SfXotud+XFX+1GieDoZXUMSngI4ecGe1nxcmmNYUFc8KLxL1VmGM
	Q4hEC0IifQFDnlRILlQdIFwk6GiRdM9EZISIe1yWl+usnbNgxBqjeJbg6N2XXRCAHd6kxBm/3Nu
	aoii3S59M+p8eIoj/lEdAhOlP783cl5WbNXazq8IGHKzJsrFqjUnZurGkKfNU2m61zjNL7BcNVS
	ovuOMO1E5n758x6IcV82Naug1blD7oEm4tNzM51R53mIz/hCYBq6OS7FyARH0AHT/8QVOq8AsOb
	1Xhv5FRkZWAnnVb3Yiin9ME2qFgDXD0qyMOtsyfEg13ThUuVgUmcmR+5v2MWB31IgKx5yzSd9y7
	u5PFkN4ENgl4DUHo8NrH1gEKFYedirWM6Qgj5ZP2+y8BUlnKnrxwIufMlkmzQtRULG6IssHWQ+z
	mPOVM6FwXsq0pwQejDmRVjHk/dwMvtWM9cXb3KRe3P+/AvaVLr2o7ZYQu+PFj5wtjlQTB+c1x9K
	l/50Yf2SYAIzg6xJ1WYtGH1BHCo9Q0xhHu0Ea9Na2q3yG1qIwlY+8qyzoMYeJWx6wDxuwSKCVBE
	2Dw0VEf15XdCQx+9agGHd3TDefBG/81/fZDM//xhWnpaQ8G6Bobf4PXE=
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr313862835e9.2.1794933711523;
        Tue, 17 Nov 2026 08:41:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:50 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 17 Nov 2026 17:41:28 +0100
Message-ID: <20261117164132.47167-2-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0

