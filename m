Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850176;
	b=zLU+jhGN7GQG4KEN+mHvQ9YyZeTY3IwtsV9yb0bDvrD9aporNwdftXl1vqAt8p+mxzcB
	 G6m2BzRWQgbwzQXwqL01u0bWndJgdG2uOcKGev9X/5dUNblWbRgb8iZXVh6SR7AS912Gw
	 RlkbQN8zDp7ds4IJVjWjXtgwaY6qPpzJv9CN8irgz9RbGDkssjyazQgMkgyjZR8mMe2n1
	 qazhRyksfl0nnkwSSeOSOBonE5gbDfFmOp+zIRektvZmW1j6LKtmNSuaaPfLwVSem3IbI
	 YDBtX8I07zamlhPZFCJxzPxs96t+ZweO/3J36aIav2dtwZ6ldwbBx6d4TpevKprukrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850176;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=dM26q0uL5NDEvDxd+88ykfu37Gk4Cm5UFaWENeXkxObx2RhjSSQETpROjrxHlkaie1M7
	 3Q2eA4jM6DnFANVRE0chm7OWJplLaYxl7PXGdXirufYretNenE/j3dwAw21091lgTW8e9
	 lu0V8TLx2W8NBJyPsv9rn+Zk6HeNo/TcYjPUNnhLkoqyqzbiGeFiU0yECwoGHlMnwLi8G
	 qTQJUeS6LRCNKjAqN2FEy7hSrCqNk9EnEONFXHCa9DMI0/YVNZPCG18WhT60sB6se8AXv
	 gibizJzW83Y5vHRRDxQnj86hIR3h+ftpgYNPdFtf7JeUS2+WzKcdKJysgU/MyEJZNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260C606A690
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 07:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1260C606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso67640675e9.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850174; x=1796454974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=by2pJGZJVzPT32UO6/QMdnpb51vyP0GQ7V4HVm0lbBNSxk4VNQSGBFac6dYKdB9Yic
         5k4apZgHJzSnxZ4TWINDOhUQU6bJAklzqY+UPs6ccLihEgRSNT/oLQ/IW8GbAKox9rRs
         91gu8Ucn641A7bs3aApZsrQtFvBV2I3SaYcpF9pgRmXhugx2vcZXAYg0VkZRcZtGa4Ae
         KTJqf0bO6lefipTGxevKUSkJy8EmzC1AiduTxH/psnqDG9JuPvu4JDM5W99/tCs1KqLj
         uKHbzSPTOa2zDpQ5aOmdE4d/FxC/rW9BjBNw18HFwGL3H+Sn/Q3BoGyeRxzP/wgBbDH2
         jGsQ==
X-Forwarded-Encrypted: i=1; AL+hErFprv24zICKeqP27iRrGRwKp8t+eiMQUfgLk8V39YbaI5PffeEnjZ4c6MW1ft+2ol12GHOn6tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3LL6n8Py9w9ai2C7zbrUbwM7xP2142jolNwG8qNsLSofpgGES
	ZacT+Q8mZNlAcLhd63AHk6TWKZU86f7jkSmf6dShYfBSgg0XAYndg6s+
X-Gm-Gg: AZFdTZfimwC4lEtp/jJ5XyBolnEBipooEQJkBZ3gzMiCA/6Yr3EuHCfATueDSqFfoFa
	arD43XTlgGTV7gTMop/xPJVCvfYLhFD90dyXab2a29+ZNxUn+S/AiBfV1ltNJCSrRkn0lBk1xy1
	7tOeVUCwUM6kASAAgfb3lmmeR2Zd0HSum2oMTifeu+Lt350H4IHkmMpXYsMMOrWbvuLd78PEMdO
	cfEjesvQ/bE0xC9F2GS6DfV2UNJ2n9fmxsOazOX60ECET5r4ZyJwLOaYcQ5vRvPIkS3VhEU8tbj
	SKTOCwjlA4sLAG8eiENelbG/oU+LhUM2hZjyBcXl6asLqIvd5W1MOXSlu+9on0SfgeFYz+kvslJ
	WKZJ14NEQ/cEs6uc1i0yKoHlcTMMjZEK8gmFYsYrf3Jas1blxFHbeUufCUK6hE0nfmtBpw8WQwf
	N+pe+gLBu2nMinGWIe3y8OcktzEiIcilbM7/oQAVRpsdcu3lwHAeHfd6V6FFdswFc+Y3xOl6rgd
	2WDuyxfJ7dZrBVWmrxpG4eP25j/Zj03e+sAlWXPjY/4+gbkEwRqfvU5lwdxR0bgWl7bLWVWHrGs
	AAgmudYkmFnmhZ/ak/Gt1Uv3YUSyHWtsehBf0/K9MXBoGPfj8z+4Ex45Ju+uQNGSuo+7cXHwkRE
	VbkfsNt4h4VZ9TjWz5xZu7/rU3/VandZkdlZmUrYAgz9+
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr570429285e9.4.1795850174257;
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:13 -0800 (PST)
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
Subject: [PATCH v9 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 28 Nov 2026 07:16:08 +0000
Message-ID: <20261128071610.27855-3-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1

