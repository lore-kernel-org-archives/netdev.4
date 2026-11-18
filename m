Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040110;
	b=G1WmFIFW8j7Pm+y2B1NoY89TcZSVYthggLKSGICiM4VHJ8EhxoWZajYXf6M2jbxZUDLB
	 XO2CcYCRHm5hirsvex3l2Y1MK5RCXSuNnygZ6YWUbtxv73jF0Kr6kefq3lUHvNpw6TpnC
	 48RcjeL+eoeoisiHYntIGh5iqjJ5zuiLjHiyzHKk+aRSMsVoSlyclxeND3MZQuPBcNLqJ
	 fOsZPwzuNSG3YkYWRUf5S3nyM3Bm7X33m5HRln/LQUH+CjUpM5HfF0diy2t1lXkxqBkLK
	 O5JZaGkmyC3x2G097MpZjNhgwlGImT6BBL1dGeciqzIjkat5XKCXo0+37E9ZU1hVQmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UYDwHSE5wwUU5wr/ldY53nDmpcZK978KS2tp9JlUb1c=;
	b=1Q5dNQGTv3YKzGkmg0VlzsjhwrItOrzO1OlNRTMCwwgBrsijb/Hrj/9gLfpMfPXCZG0C
	 6t2rJ75mBQ50YfjZ1RtgbQXh8Acbjjo85bGHdRHWLnWLEXjBP6rtpm1uNX/8qBNoS6dJR
	 fpwqYng8WSSOxdwQGelpO5PaEaV/kfmV9PJLy8X49sRg8m0iP5QjmRG96/hFDP80ibBjr
	 xN0YUocc51uTsh6/U5Clj+gmHgvZjxRfC3/ESrZyNAsrda1CbP+eyZvsx2epcJhUFGOm0
	 6ZCuvVRwfwl3GTwc9PJi8fxx18gDNjT8xT+kTnIN+E255NskB6+nzWtASsSCo6PbQ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5TIvLsE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF69606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF69606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5TIvLsE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb61185057so12813415e9.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795040108; x=1795644908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UYDwHSE5wwUU5wr/ldY53nDmpcZK978KS2tp9JlUb1c=;
        b=W5TIvLsE8miJjNtD8gg+/f7Z5gT2XmLyzQuanaR3zvu/LjOV5n6cLdQ2cC6RAKXk2z
         GkfeXlBELlM+hq1Bg0ePt7Tp5sOYZSyR9k/EhyvZrSzNiCKpen+vKI+maSPqNR4uMlBy
         8nAtBumIlKLSiN3EIvGNT6+g3OMMq9tfL8u+NXmQPvb6HP5Ht1YAEYaD42fK/EidYrs5
         OW9n2QX0GxM2fTq4bzONle0R+QKGYNfsJm3ZnsfqH5Ys5e6THrn0QGXwVUjPriyEFG3y
         6lGakkOWviU/DeOCnwsygmvB1RyVrfwkNgbv2JWLlZzfvH98jeO8JMnWZF6hnDSfBi2M
         u/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040108; x=1795644908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYDwHSE5wwUU5wr/ldY53nDmpcZK978KS2tp9JlUb1c=;
        b=A+361tvfmKy6ajXcwVsHj7vMEIz9vS+yUHCfjtX6HNCrXkFw/cjq3kU0ViiqZPIDDl
         fdP22R5JfolmO7V4kijs+7jSJR6mLEQvq/eERHFe2WUzYw3qT5K6w1tQI7EAhvETxQJs
         6+jkbnCS+TWXoFHLEoW2SxZgythFJOJCeI4ArHNLpitBMLkdlfxaIDu4XY7RjAFRNo+p
         LRdjYpukQHYX8BQuw28U5dMZeXHyh4y+PZTxkXZG2bJPR4Lt6kdST99YoULZdE+67IdX
         pYcOLakATYXWkKVAFHGxICc6Y7CbHLJzleOw96pPJkTGU4EiqGFX5r279cAgZ0iqTabx
         5TWw==
X-Gm-Message-State: APuU4Z/MFaPlfXoIQCC0CXKOlkjPS76FcBNR6oo1v/pyAr0ddTjXJ41z
	G3SN5CuXKRidLTD4LmCHpKh8tCdXy2s4lg0Kim8Y58d28W6i0p5n9D6i
X-Gm-Gg: AYBFou33gAJhI7A/wGkm94Z1KCBGdTrzOSOApldwsvJXaQoVtltEn/sVgtJ17SlKlnV
	eWWOqYoOPXPODhcEF4Wp6mMjAIRjo4wMG4uydfitCPwfrYPzhRiCEx0KohD0+N1O4yKifvfNf2h
	VWyEQBRiTs0eMRhtkK10b+xjg9Ay7bHP2JWUJNEC497SN4tk8o939zUMHiHUE4rnrRV5VweDEP+
	wbbmm2uY0SQSiGQcZ5YE2d+U8C2TKq1jv3dzMe1BOp5M8XnBv4CEfOKtxXoAMtue5pk0pom25EF
	k/ZrK1adzr6SBz4m5h7Yk83b8NBQ+gdnyfs4l8KNmKqz8qGj/uoCfXBEOFhe1bEI6UyGEGD1IYR
	rGVznpbDS86/GvrLk/2yO2ICGXPpC5Ggarkcw8OBrNNoarAoGmtUbH6XjqtQdRuriLta6AkcDLq
	3XFrGV18ER6qhIuEfW9RO/YnecrrUpsEVw2SqAoQLaDFkXyJ3Nn+h9f0ypWlnNrcWiP90mi1XOw
	nT7LvA7GTrDco9TFkhtmg1WfEihHfoo2HY0rG86WExgNfW1kZ7SqwcIW6wGocpLGdqkX91iBtsv
	3lueP9Y2mQnMq5esghUUqmk484RZmu2KxcNkmiYKxfEhuuJRiJZCTNxL1jZVmFaF7+3LcddZ0Hg
	ZQPavoDS+odeBB6hGc0/GsoKn5CrajBEuWCvg24MzIg==
X-Received: by 2002:a05:600c:1d9c:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4bb7da21ffcmr85380735e9.7.1795040107843;
        Wed, 18 Nov 2026 14:15:07 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb844e912asm3859115e9.12.2026.11.18.14.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:15:07 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net v2] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B
Date: Wed, 18 Nov 2026 23:14:50 +0100
Message-ID: <20261118221450.1764790-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
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

"OEM SFP-10G-T" modules with vendor revision "A" have no RollBall
I2C-to-MDIO bridge: page 3 of the 0x51 EEPROM passively echoes written
bytes, so every RollBall command times out. With instrumented mdio-i2c,
the CMD register reads back exactly the written command byte (0x02)
forever, with no DONE and no I2C errors. 0x56 reads back all 0xff, so the
PHY is not reachable at all. A genuine RollBall module with the same
vendor and part number (revision "02", AQR113C PHY) on the same board
answers DONE on the first poll and its PHY attaches within ~2 seconds.
A rev B module with an RTL8261BE PHY, reported on the OpenWrt tracker,
hits the same RollBall timeouts. The bridge probe added by
commit 8fe125892f40 ("net: phy: sfp: probe for RollBall I2C-to-MDIO
bridge in mdio-i2c"), since reverted, found no bridge on it, after
which the module worked.
That module reaches this quirk entry only because its part number is
"SFP-10G-T" at that point: it is a rate-adapting module which reports
"SFP-10G-T" with a 2.5G or faster peer and "SFP-10G-T-I" with a 1G
peer, and only the former matches this entry, which is the sole entry
forcing RollBall on it. The "SFP-10G-T-I" variant matches no quirk and
keeps the default behaviour either way.

Because the SFP-10G-T quirk forces RollBall, the kernel retries the PHY
probe 25 times at ~21 seconds per attempt, i.e. for over nine minutes,
before giving up and falling back to inband mode. Each attempt runs from
sfp_timeout() with rtnl_lock held, so for the whole window every rtnl
user on the system stalls in ~21 second chunks, including the state
machines of other SFP cages: insertion and removal of a module in another
cage is only processed after the current attempt ends. In one test, a
module pulled from the other cage kept being polled by phylib until the
attempt ended, triggering a WARN from phy_error_precise().

Give the SFP-10G-T entry its own fixup that skips the PHY probe for
revisions "A" and "B", while keeping the forced extended compliance code
so that the module still links up in 10GBASE-R inband mode as before.
Other revisions keep the RollBall fixup unchanged.

Tested on a Banana Pi BPI-R4 with rev A and rev 02 modules: the rev A
module links up at 10G ~16 s after insertion instead of over nine
minutes, and the rev 02 module is unaffected. No rev B module was
available for testing; its match is based on the report above.[1]

[1] https://github.com/openwrt/openwrt/pull/22910

Fixes: 324e88cbe3b7 ("net: sfp: add support for multigig RollBall transceivers")
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

---

This does not re-introduce the generic RollBall bridge probe reverted in
commit b521003c27eb ("Revert 'net: phy: sfp: probe for RollBall
I2C-to-MDIO bridge in mdio-i2c'"): the probe path, its timeouts and the
MDIO bus creation for genuine RollBall modules are untouched. It only
narrows the existing "OEM SFP-10G-T" quirk by vendor revision, so modules
that do have the bridge keep the current behaviour.

Further bridge-less revisions of this part number may exist; they can be
added to the fixup once their lack of a bridge is confirmed on hardware.

Changes in v2:
- Match the vendor revision with sfp_strlen(), so NUL-padded revisions
  are accepted the same way as the rest of the quirk matching
  (sfp_strlen() moved above the fixups, it was defined after the quirk
  table).
- Add the Fixes: tag for the commit that forced RollBall on this part
  number, and target net instead of net-next accordingly.
- Spell out in the commit message how the rev B module reaches this
  quirk entry (part number depends on the peer speed).

v1: https://lore.kernel.org/netdev/20261116093605.294365-1-pawlik.dan@gmail.com/
---
 drivers/net/phy/sfp.c | 54 +++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 85e57a16bb52..bfc049a3fcd1 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -482,6 +482,44 @@ static void sfp_fixup_rollball_cc(struct sfp *sfp)
 	sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
 }
 
+static size_t sfp_strlen(const char *str, size_t maxlen)
+{
+	size_t size, i;
+
+	/* Trailing characters should be filled with space chars, but
+	 * some manufacturers can't read SFF-8472 and use NUL.
+	 */
+	for (i = 0, size = 0; i < maxlen; i++)
+		if (str[i] != ' ' && str[i] != '\0')
+			size = i + 1;
+
+	return size;
+}
+
+static void sfp_fixup_oem_10gt(struct sfp *sfp)
+{
+	char rev = sfp->id.base.vendor_rev[0];
+
+	/* Revisions A and B of this module have no RollBall I2C-to-MDIO
+	 * bridge (on rev A, page 3 of the 0x51 EEPROM just echoes written
+	 * bytes), so every RollBall command times out and the PHY probe
+	 * keeps retrying for over nine minutes, holding rtnl_lock for ~20
+	 * seconds per attempt. The PHY is not accessible at all, so use the
+	 * module without one.
+	 */
+	if (sfp_strlen(sfp->id.base.vendor_rev, 4) == 1 &&
+	    (rev == 'A' || rev == 'B')) {
+		dev_info(sfp->dev,
+			 "rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
+			 rev);
+		sfp->mdio_protocol = MDIO_I2C_NONE;
+		sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
+		return;
+	}
+
+	sfp_fixup_rollball_cc(sfp);
+}
+
 static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
 				struct sfp_module_caps *caps)
 {
@@ -629,7 +667,7 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
 	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
-	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
+	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
@@ -656,20 +694,6 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK_S("ZOERAX", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 };
 
-static size_t sfp_strlen(const char *str, size_t maxlen)
-{
-	size_t size, i;
-
-	/* Trailing characters should be filled with space chars, but
-	 * some manufacturers can't read SFF-8472 and use NUL.
-	 */
-	for (i = 0, size = 0; i < maxlen; i++)
-		if (str[i] != ' ' && str[i] != '\0')
-			size = i + 1;
-
-	return size;
-}
-
 static bool sfp_match(const char *qs, const char *str, size_t len, bool prefix)
 {
 	size_t qs_len;
-- 
2.56.1

