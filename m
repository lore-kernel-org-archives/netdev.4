Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631875;
	b=uF7ih4S4gVb+6AYcgt0ZVPSHQnHX4kXJVoIfI9Tpb5WiRDaFa57fKm1yDKSbBPG0hg0B
	 +EgTSSNtsshJRLufuWFnPN+1VXHc4JB5RRVqjJxHTT01HQYAWHAfGbD57gkzlGAyxooDl
	 9moY1aBBTu9bXX8gUn4uqE9TV9GE7xhIovF9SIO2elFeXcJIVu/0Q/v2qHfPO0LkCmE2/
	 JNXefMcjtlj60f0UKnGLFO/gE6GKu7k+N/FSXA/gTXIDQJLHsFgkDcfrKTL5GNaLyCWqG
	 jL6UuvWkPMaD3apyFGR8K8wpMWeS8BhJUtPGpaZ/NEnePJ3aRiPWBVYTA7kkZfCJDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+kE/glxiZL+FWcRcULvyZPX6ySSXwBXh2dvsVZycgM=;
	b=4htUHV2MbRRbosVh8XJVwigYlGIq9OUv7IKlNr/gnqghgtZ8cfgI0hJZLnXKn2a7Wmnt
	 4ShdY9Kh7a6O0k4dEotgepsTeg/4AbYtUqgkERpb4i5T3skeOwfseIAIc2j5djAj7ghGv
	 4Iu9eLVA8sa3RzYXHCy4WY1z4glUCUpoK03g4ppYAKBF3sb3nRJkSUMWwffpB35IIVwIo
	 rdm0tviyQrjM7Pa3eeu8KFcETS6RQUdXBlBy5vnXZNl2LfVqkxHnPiyzAoR7EdebHMPNF
	 9mIemGWUyfLCKaXLznzcqbIUJFm00TNMmTQ0iQFw14gqvCLw8qn/o6QkRgp2Z9fOcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVMgo1wv;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82C606A6A4
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B82C606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVMgo1wv
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso535694e87.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631873; x=1796236673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+kE/glxiZL+FWcRcULvyZPX6ySSXwBXh2dvsVZycgM=;
        b=tVMgo1wvOydSdU6EuLzJk26IqUHQ2YuGbWyv5g4rGxWZuQf72rG4EIOBxt0/NVni+9
         AVONjoxdxV9M0W6Mfy31JyDzgTA9AFSl3FYi1UPm1JTrRaii88BbVuForeNIjkamXwdr
         B5UEWnhMEMNj7x4QZZ9Zze0FZShrN4VLjHlI1cRq2yVQ7VzAT3ayB1i6JUbBc3Y53Pui
         mMBLqpWHKMRCK0d3ej2O9hpeWL5NeB3Ezfd16Icrc/1e/qMv3AirnqOYJoB6Hx7sxhKS
         NnblJWdfPMMI44PIty77wp7YNJG8qGV3geL1jffpnqlHF+Wp5JLQUWYofYUVRj3WiEHO
         dmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631873; x=1796236673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+kE/glxiZL+FWcRcULvyZPX6ySSXwBXh2dvsVZycgM=;
        b=KtkFpQwliIQx6OsknshvkdgdI3o80dnOCysXOQJwL41tnuI/1DgbP7kWEPENDbQC/j
         psbTXn0pWQr1HLTpkMrzbyQN6m9qzeFGMEnjebovyw6q8EaLn7mQ4ADnaUtw6A2waP/I
         zfTOQ5maOPls64PKNZh4Rjqn4Rl97GgZ5NZp3BcEAUc536bZ0GIyuBtVy6WXNo6WiO9F
         8SnrTIAHLpdA+74q27Czd9kCYKEGe+V2L4BvxqvMeNrAcK7wyWua5Iz+zYBMr9VvVXDn
         x1d7I+/ExW+PimBKDSIzhw7vhGKCrBzdPGNlUMWUb9Xva+gd4vJ+Uyq8AvhQIdCWgCor
         CsmA==
X-Forwarded-Encrypted: i=1; AL+hErFh/8cm+UwZ4mcpphYTP8mhxn2fJSIK7PpJmJQUJUP2ZILKbqiZDCmH5dfdoaV2rdF6Je/+2UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NL1D3a7BNoTx5+zD54c/EBKVwF0QLUQaCxF9u7G+O09k2Acs1
	0ol7nBgJHmHtRGf49YobKiS4hImIACce4FoqQKqQlUI88Sg4API3m2gA
X-Gm-Gg: AZFdTZew2psgJMjfq9kWvsUa2HQLN7nC+3HHvTL1x5oK9/SC985NHj0Cbd4sEX/4gl6
	N7otVTeu77b1gBkszaEdi0/6jupQR1m8/YGrKVVOdDa1CV1jaP0Luc9tO/B2q/oxu+kRPIxZ1FZ
	iJZM2eIa1spgzqmxLKKDbqWXvrzsomEhZDG1majNgHHcLoC7LCWsJsMVkYGMLW56wBo20aS0d4O
	XeikQOw6DWbDsmF0blmK8CJ8vlfPk/1s3bIuIYYQhr2vFKL8JBhhSW4V/cmnbuBFndtMwrx4oMh
	m/LJqTjzs6WJR7mb1kXyIdMtluXOUwls0c6dlEa+cpVjal5MLB5Lh8FSfd8XSd9x+9Fe5ODS2OW
	XehTvxHYEoXFl15tt7XYZBiztUkj1/VyCj6slIbhll2wrVmTnrlUySG8nJFxrJ2A2JGqf24Yv3i
	deg5sqg19N1I2r9hi5jRR9lUYD3nQMm6nBWef82f91tG++ncBJL3GAi97cOvHlivlw8QTSxwj3k
	zgPxeoUG999F8UgsVWmFAz14ajkvjrEtFRU/yt/df1LslRy43kN1Pck1T0ElsFc6lZZKAK1hJPd
	7+kZKLyIFk34meVm6w1Qmzb0C+I9RoVPTDtSza3wO1y0eHU=
X-Received: by 2002:a05:6512:1585:b0:5c0:4e3:a416 with SMTP id 2adb3069b0e04-5c1bc68009emr5204787e87.1.1795631873243;
        Wed, 25 Nov 2026 10:37:53 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:52 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 3/3] net: phy: dap8211r: add PHY LED control support
Date: Wed, 25 Nov 2026 21:37:38 +0300
Message-ID: <20261125183742.3039752-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

Add support for hardware-controlled LEDs and brightness on the DAP8211R
PHY. The chip exposes three LEDs that can be programmed to react to link,
speed, duplex, and TX/RX activity or be driven via the force mode.

Add the dap8211r_write_ext() helper to access extended registers via the
PHY indirect access registers, and implement callbacks for:
led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 263 +++++++++++++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..b029b53dc7ba 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,56 @@
  */
 #define DAP8211R_DEFAULT_DEL_SEL	0xD
 
+#define DAP8211R_LED_ID_0		0
+#define DAP8211R_LED_ID_1		1
+#define DAP8211R_LED_ID_2		2
+
+/*
+ * LED_COMCON force mode bits, per LED:
+ * bit 2 - FORCE_EN (enable force mode for this LED)
+ * bit 1:0 - FORCE_MODE: 00 = OFF, 01 = ON, 10 = blink mode1, 11 = blink mode2
+ *
+ * Only ON/OFF is supported.
+ */
+#define DAP8211R_LED_COMCON		0xA00B
+#define DAP8211R_LED_FORCE_MODE_EN	BIT(2)
+#define DAP8211R_LED_FORCE_MODE_MASK	GENMASK(1, 0)
+#define DAP8211R_LED_FORCE_MODE_ON	FIELD_PREP(DAP8211R_LED_FORCE_MODE_MASK, 1)
+
+#define DAP8211R_LED_FORCE_EN(idx)	(DAP8211R_LED_FORCE_MODE_EN << 3 * (idx))
+#define DAP8211R_LED_FORCE_ON(idx)	(DAP8211R_LED_FORCE_MODE_ON << 3 * (idx))
+#define DAP8211R_LED_FORCE_MASK(idx)	(DAP8211R_LED_FORCE_MODE_MASK << 3 * (idx))
+
+#define DAP8211R_LED_0_CON		0xA00C
+#define DAP8211R_LED_ACT_BLINK		BIT(13)
+#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
+#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
+#define DAP8211R_LED_TX			BIT(10)
+#define DAP8211R_LED_RX			BIT(9)
+#define DAP8211R_LED_LINK_1000		BIT(6)
+#define DAP8211R_LED_LINK_100		BIT(5)
+#define DAP8211R_LED_LINK_10		BIT(4)
+
+#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
+					DAP8211R_LED_LINK_100	| \
+					DAP8211R_LED_LINK_1000)
+
+#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK)	| \
+					BIT(TRIGGER_NETDEV_LINK_10)	| \
+					BIT(TRIGGER_NETDEV_LINK_100)	| \
+					BIT(TRIGGER_NETDEV_LINK_1000)	| \
+					BIT(TRIGGER_NETDEV_TX)		| \
+					BIT(TRIGGER_NETDEV_RX)		| \
+					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
+					BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+
+#define DAP8211R_LED_SUPPORTED_MASK	(DAP8211R_LED_ACT_BLINK		| \
+					DAP8211R_LED_FULL_DUPLEX	| \
+					DAP8211R_LED_HALF_DUPLEX	| \
+					DAP8211R_LED_TX			| \
+					DAP8211R_LED_RX			| \
+					DAP8211R_LED_LINK)
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -87,6 +138,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
@@ -114,6 +190,189 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_brightness_set() - Modify the LEDs common control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @value: ON/OFF value for force mode of the LED
+ *
+ * Enables force mode and sets the LED to ON/OFF state.
+ * It will be disabled when hardware LED control is requested.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_brightness_set(struct phy_device *phydev, u8 index,
+				       enum led_brightness value)
+{
+	u16 set, mask;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		mask = DAP8211R_LED_FORCE_MASK(index);
+		set = DAP8211R_LED_FORCE_EN(index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (value != LED_OFF)
+		set |= DAP8211R_LED_FORCE_ON(index);
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, mask, set);
+}
+
+/**
+ * dap8211r_led_hw_is_supported() - Check if the requested LED rules are supported
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Validates the requested combination of rules which can be represented in the
+ * hardware register.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index,
+ *         or -EOPNOTSUPP if any requested rule is not supported by the PHY
+ */
+static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return (rules & ~DAP8211R_LED_SUPPORTED_TRG) ? -EOPNOTSUPP : 0;
+}
+
+/**
+ * dap8211r_led_hw_control_set() - Write the LED control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Disables force mode and translates the requested trigger rules into
+ * the corresponding bit positions of the LED control register and writes
+ * the resulting value to the PHY.
+ *
+ * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
+ * otherwise the LED will not blink on traffic if no other rule (such as
+ * link or duplex) is active.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	u16 led_mode = 0, led_reg;
+	int ret;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
+		led_mode |= DAP8211R_LED_LINK;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		led_mode |= DAP8211R_LED_LINK_10;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		led_mode |= DAP8211R_LED_LINK_100;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		led_mode |= DAP8211R_LED_LINK_1000;
+
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_HALF_DUPLEX;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_FULL_DUPLEX;
+
+	ret = dap8211r_write_ext(phydev, led_reg, led_mode);
+	if (ret)
+		return ret;
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON,
+				   DAP8211R_LED_FORCE_EN(index), 0);
+}
+
+/**
+ * dap8211r_led_hw_control_get() - Read the current LED configuration
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Pointer to a bitmask where the current rules will be stored
+ *
+ * Reads the LED control register and translates the hardware bit
+ * positions back into the corresponding netdev trigger rules bitmask.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, -EOPNOTSUPP if the
+ *         current hardware configuration cannot be represented in rules, or a
+ *         negative error code
+ */
+static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
+{
+	u16 led_reg;
+	int led_mode = 0;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_mode = dap8211r_read_ext(phydev, led_reg);
+	if (led_mode < 0)
+		return led_mode;
+
+	if (led_mode & ~DAP8211R_LED_SUPPORTED_MASK)
+		return -EOPNOTSUPP;
+
+	if (!!(led_mode & DAP8211R_LED_ACT_BLINK) !=
+	    !!(led_mode & (DAP8211R_LED_RX | DAP8211R_LED_TX)))
+		return -EOPNOTSUPP;
+
+	if ((led_mode & DAP8211R_LED_LINK) == DAP8211R_LED_LINK) {
+		__set_bit(TRIGGER_NETDEV_LINK, rules);
+	} else {
+		if (led_mode & DAP8211R_LED_LINK_10)
+			__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+		if (led_mode & DAP8211R_LED_LINK_100)
+			__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+		if (led_mode & DAP8211R_LED_LINK_1000)
+			__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+	}
+
+	if ((led_mode & DAP8211R_LED_RX) &&
+	    (led_mode & DAP8211R_LED_ACT_BLINK))
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if ((led_mode & DAP8211R_LED_TX) &&
+	    (led_mode & DAP8211R_LED_ACT_BLINK))
+		__set_bit(TRIGGER_NETDEV_TX, rules);
+
+	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+
+	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
 /**
  * dap8211r_config_init() - Initialize PHY
  * @phydev: PHY device structure
@@ -202,6 +461,10 @@ static struct phy_driver dap8211r_driver[] = {
 		.config_aneg	= genphy_config_aneg,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
+		.led_brightness_set	= dap8211r_led_brightness_set,
+		.led_hw_is_supported	= dap8211r_led_hw_is_supported,
+		.led_hw_control_set	= dap8211r_led_hw_control_set,
+		.led_hw_control_get	= dap8211r_led_hw_control_get,
 	},
 };
 module_phy_driver(dap8211r_driver);
-- 
2.43.0

