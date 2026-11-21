Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296671;
	b=z8A+O7Zj1v6iMSAUx/oZkn4alGddpCZhKt+OQIiwyEhF50eL8HRBdGEWfX8DyFJ893Ns
	 gSeeS5Dc2xtIgE4b5z+J9TdghK6Lz+pBdf/CxOHYIED21bxeuZCkzSSzQtn3FFmpO+y90
	 v/DqvMzJJRIRPCngMFNeD1Q5n8KTYv5QHnMPt5/TjhZD91aLhoX5MlGSzkUihR6c3D7Ee
	 Nzjb4sF/NLC48fGKlA6TYuYynCFHknXbRdPSEn299CXRZKuPlBpQ6cuXVbrDoBHsPQBBM
	 t2ajeosNcTlwshyArrZhNZIaPIG0WseX2GnxRzlpntrrHGjLKZs7Ob/LfB1/o1w+SEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296671;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=WPdsGEfWTPP/smt0hReFpYwrm+WXzuTA23+ZnQnvKb5UK4+B3KesbX1CE/rw0W7laA3I
	 +MeEAdnyo1DhNipkfNP+QRaZ4hE0bC2I9Gz+lLVcJYgXdEXingg9gxLAlJqnzaT0+tkPY
	 7H3ajSR5tZgKlqQpuSlE64OvlLf6ZeQirWEYjRtlLMVIdPhYSh6RfhcCTUvkexcHfgtEV
	 SjHuXOc/0IQGYuKigo6qnEekTDM3CNjDoyuC6dzJelWM7Vm/etI69eyx0/3hEg2Q/Mb5f
	 Lc7OCBIguxNFm0uKah7K8pnLcvE1TzMByNufU29oSwej5RhgvNqwpt5iwiuhSvgoXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47546606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47546606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso1509585f8f.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296670; x=1795901470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=OBIhHjpYPGcOzAKFQI9/4hp1C/im7w5RW3z2pqHFMbm4Yf1rxMYn5wg22IJxNDuPM6
         ktn+J6IYhXs2AA4FWiYQSg6ss7Ggp4eyJpjHmKz+ewGgTLddx60LD6ks//HAq8lxOJ+b
         iNL84XaiK2dr1UJY5KhvNA0DiUNFX3OLp58S6gZ38xBZx6QmmRlvCHrTN/ARtiNe+vGl
         JEXy/sT6rN/NwoiHnRKWj6VnSuOXhX064QxR0+vjZVN/MHTUizC0BWVnTvhWv8npKZ5a
         eG51lmlPnn/V+xY2/U1fVe8XtqKbnx+trEqkwDJs+ABGkYKVwaFHx+xzTHi9ENnEnNUs
         ZCog==
X-Gm-Message-State: APuU4Z8jCss1opMKpuSNknmrWgcUI/yAQuP2fPSUpzCQP0ooRFhPBpE0
	Icm6ZdDHMiOFYfiEblPeUdFIBT5FBKL4zEQOmxW+n35VfunD2aKhWX88
X-Gm-Gg: AZFdTZePrp6MrMNFOgr1rNNhJVmsDePfLOWjmTVRgPpGozZFHg3PdFg8bnAeb5JDuxv
	nyPuz0JDRRRMIMD9NYgShKtKMXz9UZc462dXULUS4GHzKHYjgKplrNrKFpItWFZPNta+PFmCc7a
	P0fDrRPNuCs05XnR9Rzzrw3Kovei/zMT31coRsQGa8xhGq/wf2Ck9JCUYZCsmgcFfdo31GhQivY
	7VjNkwg8lPdxp+1D1z8Fq+gLvy0gV1YX3bpPoRkQ4SVDsfWnDeVWhCbJ5/y16uSR/9xqrc+gANi
	HA/oDRKDh5UswttYHWqUtVEUmF1bTvY+RFYItnTPSWP2qBC5NPnbjAf98t4v9wwmcdsIPG8N7hS
	5om7n7IQb60B7T/uTg6wUEKSk3De6l7YquFS/XnOUSxlR36iz6UqoC97hLf6+ZTKYctp0eLo+RF
	ljg3upLZQvGUBXSRE3I4zNXBS7hr93RM9JnPGUE+HCXFvbCuua8TcJxNQQCHRAKGTh/3hX6MPYG
	qRT/vfR93EnXAYvNGblIoKwNFi7Mr6S3qrQj9TuEEajwsWarPpfMrB0AV2+X5ucfpwodqQOl5gQ
	VvBNT+JCyA1Qq/MMQB0M/xnrJKEqMfyqAx1xZ/48TlOoEHuf1HZo2lTGWP/spQSg5WUcRNpRsOA
	i3D0Ew6bYyMrYDgNKCb35hPA=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr13243799f8f.9.1795296669533;
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 21 Nov 2026 21:31:01 +0000
Message-ID: <20261121213102.143130-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..eb7f46c98b0b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,39 @@
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.1

