Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296673;
	b=WIsp1rHxkruhn12zprTff6WGZ7aEA4oMyvjtC1jPTMMyT+gqgutsLtXJ9HM7FDYz7DGO
	 Ey+PXEVgewp1DVNl9Eb9NdlAgtYbOUGVlYViwwgVtoCawqs+x0DF5ZKpgT0Wb1Q5sOqtG
	 IOSbH3CxRx/0w9S591YR3S3SZFh+a6Eq9Qbawtb/XtmyFdg2tArf+zsK/ffNj8B6pfnvh
	 H69m2p9Kgktzt9I3uCvFuxCZ+NKWdBos+b1u4fCp0OuE7hG6Lm7enTIg21lyO6ojL0JWQ
	 xBCCl6qonvIMpczB5hSTQa43bu39TkCqRXL6PaLYBud0WGlWUPLkfOcidihcH/P4VXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296673;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=IcfyG+hQv23d2lzDEK3XaCCP64VBum974EL2bpGF9qzQDxI65/QJ2kzSIWHgCQJWMASg
	 6DWNGx8RXQT077Uel5CDpZojNd272oe1ywE3rAedqXzHDHKdKvQJlI3W7/t3fBqPlMapA
	 f9D9AE+gd9cAY/nluWeFUg9F5r6GqvGupv1sL1SHi0j+dZ+qplJQ+/lVjUFz+UeycruLY
	 numq0zDzkqxsTAALhS76RMQd9f8UH5tfTBzhkX8TSTGGL/aC1B/MXFXeCQ+lSqLj7h55F
	 RmQmHYyjvwhn61MxkcViBJO9dAabKz9mhOq28wDeT9ZvYn49Ve4DfsqSKXoNJDnz6pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1105606A698
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1105606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so1767638f8f.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296671; x=1795901471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=ZHd6ud6L9iyevlTcG50GtiUeydZ28uGdQxe7jliR8ClbiLxyW8oih5PdkX+2FkQOC3
         1f58xSOywBEZ5Tr7wxK9gJpvxIBRGHbRkK5TFD6lcl77b+J0fSAsmlAVvtqjV9EQee3W
         s1Zgy4xf/20dtIDDpwdfUNPFKHmkHvKUUpq2fz/AUpCqiYlJJQcNJGLXQ+oVrSAIOXYO
         j73tozYYl/mED746kfBfsafJ+Gzf1ChzOyRW8PwWhcPR7jz40HULOaNW2BLQ6uDrP7Gp
         1wwQHrmcjFrB1VxgG6F1DMgxiVlmwVGmAm4UItibyKJSLa2TLUUF6X19gtdKKMa+mJna
         PvEA==
X-Gm-Message-State: APuU4Z8QwnhQQeXLcP/ifecdgSk5RYdJT5Mh8UlO4hJ+4y3raRymmKxn
	D7uaRyTX4EuTVZHLrPMfUZpkU9gK/pEGOa9Ra7w/TYS1x3ftSi8UbeuM
X-Gm-Gg: AZFdTZcJ+QolcZBRSh8hGAahOoDvwz20rKKkh5AYtc2VUK1tbi4vD+CW8BZReJG0+BY
	ntBI43lVokuFHdqUkPkLiNVSv5wzDDzaB+XbXulGD/knv+IVU56tJXIAI2VtgOeN0rCLGS83xrG
	zwmNvlXHYORZJmrxo1kCvJ6y/Gl591WysMsqRjvWtaGN1PUl/Zbn43F4Re1pUYvczxj63VqhLcZ
	ixhqMDcXPQQ7Q0VpN9RD9A8CJbSnOKD81L26znKfdVhZcnycqR34vpCYEQ0OUPWJDKGN0jjXQQc
	ppAd9WVkkHz7f00pGxB8mo9g9M8zM33AoU+fUKRqW3kpOucn/ZXNQPMv0YAnU219Y7WWpLteMu1
	CkN+EQjyfr/zasmNIIclNhWkdG54GmV1Z3J6gB76XRG0duElwk3Ckd/QcT/mEQA3a7eTn2fVXk/
	XRcaHj0ecwWC2SmctxOTE2mE+ZsOYXjBE6d/RDZ9mKiUtrz7+/mg1/yBrVifDqvMkku9Yn3jynn
	2qko/Mw2pMnw18mWVwYgFWZ2+u1qX67WnOJW2fMtNpgdMYR6ZeZ8kZ0TAQIlmchWnoPIDs+ABGM
	6KM79EtocikbR0D6TkHvuz8jxci7Bc8AiHOkM7G8dvnjGBRkF2+ok5Fxgmwi1yrkj8aZ9xE4VdQ
	xdlwTzIJXn4Suv6oHgUyvNz0=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr14146074f8f.53.1795296671234;
        Sat, 21 Nov 2026 13:31:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:10 -0800 (PST)
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
Subject: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 21 Nov 2026 21:31:02 +0000
Message-ID: <20261121213102.143130-5-tanure@linux.com>
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

