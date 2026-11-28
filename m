Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850178;
	b=HBLonUjogRlV2inHqrLJdTO3LumCBY8qOqDY2zH2lGo9+t/waNWWB37NpX7GYH10KCzR
	 sp+cDhjyMSxOUWzIZ071zWgB9HYuXf70N65rPiXj3SlOkVylmcRv/K6ORpJMg50VHpcWg
	 aA9LlIBAUI9kfdrhENx3G2udTIj2TFQc4e31BQEqoRDLljULOOJc/baM6Saz1QGNboBhA
	 buGrpDzJywJqt2n7KvpK4v2Fonva5WvgTIsuyxXwbSY/+Tkhtnutitwe54nZdl5dzV+MK
	 ys9z1ADLBxuYeNsRgzINyy65ICx2/0H3OSK6fSMe4TBaLSIgY6sW2Y6zN0A7LK2zKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850178;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=p1g7a6FB7K8txOugL2KUYeFCE5QrRZIxU7jn5l5jhkOv4H8c32TeNuu0e5msZmHK/s0k
	 C6dRXafAggyx1ZckL55OTzsN0yC9c0s/h+RbLgvI59h1RiQCVa0ACw25W5zCBGalI4t+t
	 h5mY6i5ghGqnWuT8oSL6GAypKS2xRmrlhJm8jua7NHhXYOiSgcHzk/qfEvzT71ikVsWD0
	 i5Gx1ctflvrBEwinaCQF1OumYF/LOIEwwYeFVm3MegpiUVWZFiL4or6aEUgE9l346Wy99
	 oCn9SyEK/V6XZK86VrD9pOJVUKNRKlycFvH7EMKlXHBl5Eq5qAA9LkFRWeSPWQYuwUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2F606A681
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 07:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA2F606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso62902785e9.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850177; x=1796454977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=fJi+C0o2DrOWYSOJC8F4DxYrHFkbDuiwYTm3+KdR2sZRYXfxrCGhEendxSdsMJJ3yu
         DAnwaV0MvIEPX6POJWHcW0p8LRlHdm10LdFvyGEyFSy5fL9VY/5A4+wBux2pEULOCoPE
         ejYQNI5DBH6i4rSPm9wjDgGJ7UviV5ebKiO7+RYoVfFF1C4TwyA9C55o2AAGCzJKCbQC
         OKfOTWoyOoNmRndO1yxmkbBHbNkQh4NncCrPKplvIezX/o9L3fIML/vJ8wjlZCYV9+TK
         inXkqVFAYmqbjEKxsr5yNBpjm5QUYhzto4SbP+yxw/8OBaR2KEPFHnrJQ+XBrPm/nLfT
         p7eA==
X-Forwarded-Encrypted: i=1; AL+hErHbLL67uYpI4tsHsCu1wRnVnKr6qT+iT6rTCrI7P5E63oMxdDRfp+8iu89JUEuT5q1QJlcg5L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ky5KGN7JDBam+TiiBDOBCaI4Ahlgd6hGYsTNlXWp9xdN+/1g+
	HxRN8pXkfYbJPAoFXIbwuYPu3Y1/Seaf4hNq4clmcd25x60TJ2SzldFJ
X-Gm-Gg: AZFdTZfeT3zUhsVFh+e95tBweMbe4sWD4ASf1uit3yfOax7BNdwi0dbyeRNu2f8pchJ
	UxE92ltafyVZobjfx5qY8BkKyNyhuIfDv6VazKyQMgf2CIfuqMy3psTx/DvJfJCdaWS767s3sok
	pT5fGGKL95hzOHWSISr4MPuSrNDI8g4Guufqn3OZe896LPb2ICzCPNt4QviFYtHhJwrZlswRCUg
	i8W/5nYpwJrnh0XeycLA1UwzVTaCyWvcW/MZViiuskx0Jpum/nuZg1BEYnEvRzaZpqXrLcbnKTX
	cIGbl6+2fa47B52FL80m0GHh3yyM0Wt4Kq+I5pneo3pjS7TJibFVQs/Y0QKKzFbVuwxnKNo44Xl
	HddYqfVhhy3/uNGAyficvHjbgMraKYFSJsWxDfGWFfQCtzm022YAlMpoax6g3VDRSVBM3AwF5+5
	JkSK9Y9LzytM8Vv9DIpxASGlhEoWN+cmU/DrC4wSGxtcKEDo8HzssH24SSc8Cxe18XAOI7KG0Bt
	a5gfDcOyUpVvgz7CzSGWh78BM37OfEywO/7jNt3fGHJpDQh+RTgQZ17iIsSRUeBAVf3bLPv4IBY
	4cS1AT+vveyZM8aCBlpxPCs0eXKNVigtLR7g4e2tUGoZ+bFDOSFru2eRC/oyIBMcnON2+X1VBJ4
	fhg2GbJ3J3WLeUzb/TBOr5Pw=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr615051875e9.29.1795850176695;
        Fri, 27 Nov 2026 23:16:16 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
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
Subject: [PATCH v9 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 28 Nov 2026 07:16:10 +0000
Message-ID: <20261128071610.27855-5-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1

