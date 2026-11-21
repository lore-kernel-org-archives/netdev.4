Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296670;
	b=S8jwdTM/4/AUueRSaX2ExxqRy7C1I3J8hkowkJccprXWoRR5Maaqwc55p2HW9+tx2tqx
	 GyMjnpFKxRmUR7796PiAQ9YmOJCLPcbwReEWTrYU0cg0XQc2wf8K2fZ8DJUCQDGmNPXYr
	 EPSYysLvG6JpTA4M8KPV0eTz+THnC5tLtuSbMFeJPjjx/uxowHcJIy2+tYMRnm17JYnYI
	 yv3Cnc5uZOUtKDV3pqOBYtpFDMOMHVNu9KRHycZj1+Qcws+TOBhPlaeofgnQHvvhRWE9o
	 O1/ARQh+AE4NYJQC0VV76OYu5u2NRSB1r4WiqEtw7H35swd9jjJs4o9aRZ+nW03GxTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296670;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=h5J7ss8TBLZdOsMIY45C6Wt/+hZBvhxiDhFJRT8hmkFIrP/B0dQNvZH8lDFDT4PtlB1n
	 Lzxi1qblolm51BKapFBlC3T6gMS/cgCd2NsBK2sv7IfEwqptFg9lvzd3t0PE8qWqRhx4c
	 OXcQ7HWsd5Agwvt33OjA+hdjjRCSEySyF0uug3vrRLLcQ+VQLGEaDhxZc7cVsXZtBXsVz
	 PiwI6dHt2+4o9K6svBpC0dDpyfXvIp/HcH/K0u7Mq1hquNsHCH2IsCSgdVV1F6lnv/2v5
	 GxVgVnjuiQZ9nDVt29OS4OpqTYg35F9Kn7Eo+bsZjRC1wgUpcxyLTl0YKFy9PRooWww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49939606A68F
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49939606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so1461453f8f.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296668; x=1795901468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=j1DBCQcTbvsyl0vrQ+arh3WeRVNPhZYFuIQWSrkY3GQAXb1f/bW0iv58XGcRP/+sf1
         khOrTZjWHAgJv9wa8SCIyDEe1UZQscAT1aCcKXq3Qmyof6pbeNQcU4pW5XPgmSxwKBxu
         HNZADCOiJOdBFINCb0OCCU1NLkZU6pBgRnWWFCTR36/MBEIZkiokMgeI2BJDu+2KEifn
         pCzJx/VyEw0gVYIQliIHOgu+2dL/iaS9B0zHuO2MwbSduCA+3Gw2d5ps2gx7dKQdEiKA
         LyhaGW5Ii1MBBkNwR07YWkznTbp/6taoiWq6VunqJ0oUGiE7B+l4oHpHe+Thy0fXBnfZ
         fLiA==
X-Gm-Message-State: APuU4Z/d15EkGTfj+3uufyxMDWUkqhpxldP4rGsgU52ICNjS2XWnbAQy
	I1HA3n5J3EIzstzWdFwSfWnStCFPd7xuecoc0+weuTJyiEBK5FFbnx0n
X-Gm-Gg: AZFdTZet49mNWIWpDkS+dKshEiar6PFNd8AwTjyV8sq1dzY7D1BWPvCrERv53ECnr5W
	Qch+SXHjdeGtLc55qJsR7WkK/snl7Gp+Reab8DGa+/Ua7tfLkQgYZD3+sceZMOCLhLGsQpLCzJr
	Lzk2JIIIMjP0s7mQplt4TKfhy6L4z1rM+gSNBxIVB+r7+C8orwP11s/WtbRathcxHO+Fl7QSiNH
	IbenNd/BOfA4q/iAhUEdHP3yxeFaoqNGbXyZ7lTWVTau2r3qmluzGf2WTvTnRuAp7R7TT+HEGMi
	abP2csvAcpI1vPE+FjUzM8fcek/y6FQb8g3/YWqwo4LZpgAX2+GibKxtif4u4nUTWti/AIbSna9
	4bH/n8ON2d5jz/aTX0oyl2Fbqyl9OB6VGahWLFPJwh3lDoWszyC2VFsBgutnQZgs+VFjlW+17t6
	ZWH62cSujlX9pYuozZFgbW9QTyCeRAFEiMyYO0VL3neu4vs8iUMvebfKBIW6YCFtNWLMDRQ5MYQ
	OdMGIckNQCpNgMv76xK/a6UjcsC6wDAVswKg8CWJAKMqg/NhpEeHAdGYJH5PbuYu1cCrK8o4MTw
	0GyA7NMEQUMMIGp7aKVrKAjuteOJ+U6FfgOE6qDtI5FrQwnWxGMDRA5xyKjFFJfNjVtORSXo06P
	CEE4w/T4lOfnDxkOMsiJHFhw=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr22665106f8f.26.1795296668557;
        Sat, 21 Nov 2026 13:31:08 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:07 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 21 Nov 2026 21:31:00 +0000
Message-ID: <20261121213102.143130-3-tanure@linux.com>
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

