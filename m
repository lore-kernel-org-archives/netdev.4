Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=rFJlNmsjDcBuCTYfPV3S6wQ0e/WflHidmcXfkIdzU1KUJfjR/zk3WAQ87D90AILqQyFu
	 i5JtLCcGfvJMZ7nuRjLcBZz1hda4E/L+xQ6Cqc6C2I+Rrz3f/otH+oP8zfZRvpGqYaWqe
	 JX0jRWmfXv9Mi8GIAI9HW0180MLdk0PhecQYO1m3sCgToY7pmZv9mgJM9XgiK8UorMywK
	 UHA4MvcHY0dWrSh6fWsAsVjoT6kzrlO/KJFaU5VzJ+5amNIcI171I3nKKb2x5Dhx3OaIZ
	 utGolbvU+Lsgj3DGNuJL3kCPiGNZC4WJnQ/bV1Nza4Y2yRCWE/UDMNIDT0OQp0Nr2ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
	b=V4IQgT/DmxNm3BtHAvS5Q4HA3dBMP1BEdSpcwHCor40FKtPLxjr4Nxh0OmtGCAP1C4Vm
	 YDYSCo3wCXUlxpxj4xZ/K38EQMml6XCIp/7nJs0oO+/MgdkfAbUBTMh20FyrNJdJQAViC
	 HeoF5fd/aFRL5nwPc0pbARJu83UTxt8bQOtAT9C+Own8izQnyCTX6CbKBw4VcvWR+pfBa
	 lmsHeae+6XM1g9P/pmTSHF1B+g9EqLT0gINGAAVR8Z/+77PXIsskI37yneGeia8QAvlA6
	 zbW6WYXCJlmWuBOWye1Tvs2J0UOlTNCjtF8dMFBH+VCcMJIzgvMiP8ZoAq579QKld6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7F160A380B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7F160A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so213821f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134361; x=1795739161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=HhLIC0KsGgt0LEWcR5XuMA9Tl1gPM+5HBXY3dGeCM8bivITyBijOVBo+zzhoCqkh7C
         7mPs2j9sxSFYS3qszG5vD5fz69PpDpe/aF528zANi4bbQTgSwnxd0aTrgDiAbzoYXp62
         tRw5u5Vg2RqU4m4o+46zGhJGkXX/zDUXB1j1Is5nN/KfLas0kIs3FJF0PKJpPVx7TY9Y
         2IuPwOquedzU4+M3FrHASrGReZ51mRmJoblmuFRv5RtxQYdrJ1ZlayyhggJvQUkVhAkW
         dXl672Jk+kquah+rxm/7odgAvXqJtkHBmFiUynlYXirgwp7jDkpLCf+IwgA01z3zLnXl
         9/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134361; x=1795739161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=RwwQL1QPQ6Kt3p9Ud4du5zSDC8T+hh0B/CMgtERlT4pU8vAyGdrHUdN1JahUjFCfyh
         1gaXpvKkAQc4jIf7nQJbn+ztom+bNRl5M1orfcHqBmn4nzx7sSvcXWAcj5uXK+3CqwO7
         NKa9pNKJry0uWlT4vUYsW0MfTaYHAFNtaKgzyWB7wxzcV6neHejpJj4X1VyZXr5PeJHQ
         To/8P2wOJQYn3529hKKGFuA9u+1O7aGwFWeDWBJlJjmIy04JVRjeF+hVypvmaNBrRwW9
         RrWFNiBamQalyjkpgfpy2mNEH9yDlD8T4RAuayTRKpxeJ4C2psqGjMFo1QmnlHDrO0YZ
         3fRw==
X-Forwarded-Encrypted: i=1; AL+hErFaSScNWnffZIIyXO0f8sWNJYiVJomrM9RkzqK8Lpbc0cVDXh6hwgVAvcI3hNz+xlFd5Y8QrIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cZ4eGkALw4D3pMXA0LNuNzrxNb58oSZdAPCko1RQ5t6rt7Tj3
	zxMG/gtIA+bmhKNQm0dtomTvAxRejQWidWCz1hkru3DKnIgoVqFIcslT
X-Gm-Gg: AZFdTZdciPZA72jv6CEmK9tLoW/QiVH+4Vf+Qr6aWMnb64oHezTkThstZS1EjVH0/BF
	Xd9wm7ujNR11UA1tiM2499NnmG9rPLXilHShVDFzR9FkVsFFZN5kHgsVRbTYoZjEvN1kV7Mq2Xe
	Pes1GvFe2EZw7WVuCwj9JNewGUAWJGrM6TiVdQXhTJRfbkMNXWmhxjjNJS1LjpcCXXKlCdlv2nS
	+6Tc4Mw+DWPoZM9/K9kwzkMv0TnDXYX4dA0WnVEMFPq8nihwtV6PFCOdfdzRJhPJvMEo8vsjc7j
	E8HXung7JhMCAC0MIxV/4KMTod2YZoksZay8ScKrwUQZ9oiK+EMmju8d2oO8DPT+/dDRIr1x20p
	U2qq6kIELpV2z+wTuZ3VuC4dpg4SG2aOMnLLVFZRF+s9C5LGpPBteYntuOztzulLcerR+0yJOp4
	XmuV+1Zd1pd14g2mQG579lAlMWZPfPw9KXxxI378q4xIqQJgsynEg6U03OqToEGJOjc8H6ps1u1
	kwMIV1JUY9NwNRoTSCjuIB9gmo+fZ+lWaqETGP6y4s3THW8dOJmae/Asbg1LjC/dVrR/edH60WH
	woXIQsdM+enn18ssEE0eDj8zxgJfv3foMtQIgoKZ2SLwNSHlCrDVp960NNWXR5TRBsa7PNRsJUD
	EZOSxBqyKwceRpp6CDVmnyh5wgA0ZtUTdWkAkfwai+UHgGpYiZosW5ghP+8eU4vMARMBYylde
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr6828586f8f.11.1795134360987;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 07/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Date: Fri, 20 Nov 2026 00:25:17 +0000
Message-ID: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
found on RZ/N1 but differs in register layout, clocking and interrupt
topology, and exposes four ports in total (including the CPU/management
port) instead of five.

Update the schema to describe these differences by adding dedicated
compatible strings for RZ/T2H and RZ/N2H.

Use the RZ/T2H compatible string as the fallback for RZ/N2H, reflecting
that both SoCs integrate the same ETHSW IP.

Add myself as a co-maintainer of the binding to support ongoing work on
the ETHSW family across RZ/T2H and RZ/N2H devices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Rebased the patch due to previous changes in the binding
- Replaced the patternProperties expression for ethernet-ports
- Set the maximum constraint for reg values on ethernet-ports
- Restored the RB tag from Rob

v3->v4:
- Restricted the reg property for ethernet-ports to maximum 3 for RZ/T2H
- Added RB tag from Rob

v2->v3:
- Added a restriction to disallow port@4
- Updated commit message

v1->v2:
- Added full names for SoCs
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 156 +++++++++++++++---
 1 file changed, 134 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 30f25b06d62c..c08729136176 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -4,43 +4,108 @@
 $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 Advanced 5 ports ethernet switch
+title: Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW Ethernet Switch
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-description: |
-  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family and
-  handles 4 ports + 1 CPU management port.
+description: >
+  This binding describes the Ethernet switch IPs used on Renesas SoCs:
 
-allOf:
-  - $ref: dsa.yaml#/$defs/ethernet-ports
+  - The A5PSW (Advanced 5-Port Switch) found on the RZ/N1 family, which
+    provides 4 external ports and 1 CPU/management port.
+  - The ETHSW (Ethernet Switch) found on the RZ/T2H and RZ/N2H families,
+    which is derived from the A5PSW IP with some register layout
+    differences, additional timestamping support, and a total of 4 ports
+    including the CPU/management port.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-a5psw
-      - const: renesas,rzn1-a5psw
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-a5psw
+          - const: renesas,rzn1-a5psw
+
+      - const: renesas,r9a09g077-ethsw
+
+      - items:
+          - const: renesas,r9a09g087-ethsw
+          - const: renesas,r9a09g077-ethsw
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Device Level Ring (DLR) interrupt
-      - description: Switch interrupt
-      - description: Parallel Redundancy Protocol (PRP) interrupt
-      - description: Integrated HUB module interrupt
-      - description: Receive Pattern Match interrupt
+    oneOf:
+      - items:
+          - description: Device Level Ring (DLR) interrupt
+          - description: Switch interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt
+
+      - items:
+          - description: Switch interrupt
+          - description: Device Level Ring (DLR) interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt 0
+          - description: Receive Pattern Match interrupt 1
+          - description: Receive Pattern Match interrupt 2
+          - description: Receive Pattern Match interrupt 3
+          - description: Receive Pattern Match interrupt 4
+          - description: Receive Pattern Match interrupt 5
+          - description: Receive Pattern Match interrupt 6
+          - description: Receive Pattern Match interrupt 7
+          - description: Receive Pattern Match interrupt 8
+          - description: Receive Pattern Match interrupt 9
+          - description: Receive Pattern Match interrupt 10
+          - description: Receive Pattern Match interrupt 11
+          - description: Switch timer pulse output interrupt 0
+          - description: Switch timer pulse output interrupt 1
+          - description: Switch timer pulse output interrupt 2
+          - description: Switch timer pulse output interrupt 3
+          - description: Switch TDMA timer output interrupt 0
+          - description: Switch TDMA timer output interrupt 1
+          - description: Switch TDMA timer output interrupt 2
+          - description: Switch TDMA timer output interrupt 3
 
   interrupt-names:
-    items:
-      - const: dlr
-      - const: switch
-      - const: prp
-      - const: hub
-      - const: ptrn
+    oneOf:
+      - items:
+          - const: dlr
+          - const: switch
+          - const: prp
+          - const: hub
+          - const: ptrn
+
+      - items:
+          - const: switch
+          - const: dlr
+          - const: prp
+          - const: hub
+          - const: ptrn0
+          - const: ptrn1
+          - const: ptrn2
+          - const: ptrn3
+          - const: ptrn4
+          - const: ptrn5
+          - const: ptrn6
+          - const: ptrn7
+          - const: ptrn8
+          - const: ptrn9
+          - const: ptrn10
+          - const: ptrn11
+          - const: tp0
+          - const: tp1
+          - const: tp2
+          - const: tp3
+          - const: tdma0
+          - const: tdma1
+          - const: tdma2
+          - const: tdma3
 
   power-domains:
     maxItems: 1
@@ -52,14 +117,21 @@ properties:
     unevaluatedProperties: false
 
   clocks:
+    minItems: 2
     items:
       - description: AHB clock used for the switch register interface
       - description: Switch system clock
+      - description: Timestamp clock
 
   clock-names:
+    minItems: 2
     items:
       - const: hclk
       - const: clk
+      - const: ts
+
+  resets:
+    maxItems: 1
 
   ethernet-ports:
     type: object
@@ -86,6 +158,46 @@ required:
   - clock-names
   - power-domains
   - ethernet-ports
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: dsa.yaml#/$defs/ethernet-ports
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-ethsw
+    then:
+      properties:
+        interrupts:
+          minItems: 24
+        interrupt-names:
+          minItems: 24
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        ethernet-ports:
+          patternProperties:
+            "^(ethernet-)?port@":
+              properties:
+                reg:
+                  maximum: 3
+      required:
+        - resets
+    else:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets: false
 
 examples:
   - |
-- 
2.56.1

