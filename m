Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850177;
	b=oQInZjYld2mcwXJU6O99TBO0u25STMIzJOHQ1LYMfQrS8BhNKO7SdPDtQy119EY9aEoA
	 trNZ6rLeCt2zBhdRP91c19aLvOH+pCioElccu/rkpwboebFHO4MyH128roK3XjCHzeHrA
	 C5R9gw4q3rTioV03vj0qcp1NwV+k0gEA/CU+fRGhukAoJ7OVIEJRsy3dsjBvL3LkWWI6r
	 CHYKu8rJMfwldg+5VfFODl1cFNAh6vt4olClHzSFnGHpMZQnkl6B7osJJVQ/Z58LqG08V
	 Df9GHG6wIKuA3/I7WVpq/TwxQFufcQRROWPZX0LzVlemR28TK/SwzqfR6iZr7OStKpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=KlXikbxte3w8waKA+qhxwVh7XNyBj3Ayc4Rb/G6urKh6Pq0R7ycnkX3zy5cZdc2j2nqf
	 i2+meMD9FpfUBD+DUOGUXdBXuJV7YXIeRTW6CQ9sjyVZh6IQXreNK/a4G0ZhgXat9MqG+
	 Q673n7mNx0wp1733j+ZX782deCuaRIPjos5IzC4BXI+LKfPAE2aHODd+QKbjRRHkGrJbI
	 YI/JEMP/soRYxgxHjQ3drD0Ej9a3ScY8V1RvF/BnXLTvLj0ema9qRLi2u7O3Q8VxJcqVs
	 r9iOYKP/R/4twJSvkxFAZZo4HoY5e4GHsFqOlcBGYlseo57wSNTcCk0BYSB05ep0gBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDC606A69F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 07:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CDC606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so85026965e9.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850175; x=1796454975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=E/3N0TzzyME5AKgt3OWv6/JXlbzhYmitCuCjsby2d2Pt29FDYXzweFdZjBYODb5Wtr
         trPDGdziaXFPlhvSZam86yAMRm0g2VKc8ReK5LIBOYzG5BDnxQGB1A0swM+6s6qvub8v
         ESLoD8KLWLLWOxfkLz57VSppv8Sd7WVomUcmKUL/pdHCVAzH3UlRUxdwmyTcYmI5nHfL
         fIPqv3Af9X2g+7XJLNRi2sOTkftbnMxhzmU9EfdW57tWNbuC/+V19J7BgFyRhr5V1Mud
         uH+xBwwzkV+B/D1JIh+KL+ym6AzrzFNYwGLXowtEm2PGjxXkj5hpE3pm2Lrm8e67KpGu
         uwKA==
X-Forwarded-Encrypted: i=1; AL+hErH69d8V6jK9BPc+quLJctkUJOIq3CPlYhJ3wapTPybnvk18bDnXEZyi2PD2IBMAJZvkTrg+V6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tS+fs1tvgezTdd8NCgRhVaGIiz2dqfbuoeZP9W46262kd6/Ql
	cBzmVpl/tTo9B93KI/E+F/dP91ndPCwTmpCiO0NJ5TwmUWeRK6DN8AUe
X-Gm-Gg: AZFdTZeWemlf02Nnq3z3K7o4xWruSW20aHBmv/1mK+mlGtBtVnicUMZ9CD62p56NoHA
	RRSDesO9OuNcbbtQZCe377BiHrh4/ElUWQuNbfQgSRsWHhjNpRjt2OGPrtQtkANzo4IYeJwSf7P
	2d/kJQtwSBWl0bShZv75lZ9ruBFfxLb8DIJ4ZSVU56pq+U0NDnyYOYB6xh5CO4i/ivnCNl5HQn5
	gJcQ1KkEOXCTJLD30ZiXaVOirE28nAPd/GmGQE52Dyw/ABuOKG4jqTFHSd6KDyARqqgy0RwLuEk
	DNGp6sCVFH8n/vZBxkuDfZMzBOreydBQ2/K3rHu+9yKn9h4XiyP1bH+FmqWONvBdi/Rmin2qkSW
	/AlHddttpIL4A3NSCUGXM1WAv3jSEBeDcYXZmeBsXHV5sjOWhzj9eEjT72U9TmnIox2matzqMDw
	WH7lqxHj1thbZEflNuPm1exINDMaZDUgmhYB+9mCs2/K7GF8RGpQ9OhDff9+WuyDl3/YYriwFLU
	PnTxi7DslJw3x7BYtXEqPDkFdhxcKAybf1hFuQVjs2iE244SEZBY7oY8NrDPSS+k9ytrk7bWcIV
	X1R3ZRy5o246nQ4m3aiMu8RmvWgz9kcr/DwEkP3Kr/jObPmxcxUd4tmYKX0CY6A52MK80BTBRK4
	+DNx/67G+RI+Ots2RyKzSNTdi
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr278936495e9.9.1795850175157;
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 28 Nov 2026 07:16:09 +0000
Message-ID: <20261128071610.27855-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

