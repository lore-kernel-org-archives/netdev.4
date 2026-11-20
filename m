Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156696;
	b=RqCS9Ove8EruMwJYdNyGu4b7iTHpq+kbKiWDRUOHca7Zji+G8UqA7wwTfpVZ51d1IU6n
	 59y7WWZFb+fj5qvLjjs1+aL0IlRJEPKokMVAJcj9cHiXLufduHVaHjgUtDR27FjpEPb6l
	 liJBmBoVwTH6oCKre+G+Kg194eSy3uGzDC22jODo3pDt7y4EIAKqPOAJK2W66wUVyMXhI
	 Qp2b/JPx+K3tXavNCFvHjQOcXB16k5YM/KztFNGnQfdPl763k4rt6SBA7sqXbRvjKkqcU
	 bI4zA6YIJYQyDrKIPXU1lfDoRvBV1RLsQu4jL20GKLBNQXdZNYPhPOkaM/fiAO9Ykqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0L65Z0WSTeOd+xby5EcVaXJY0gvQ3mzLgWdfZRejqAg=;
	b=zeolNjrFFJPDj5Z5sKMyjosVuVipcPwwjkQvWqsXNsLyRRTXbrDGJKF6t4mq/JiEc601
	 Q6kzx+ldfHDEIbFcpI8/2G7VBOm6IN3fQIwDngopGzSVRqPQVKDy23zlJvLmb4SsjrIfp
	 SO6pkc138pw93yMNGV/gX9z+GPRd7H9abzZCRs1Ro69enR/kNEM4e7YhiHAcnguibtjjn
	 ZgySlksAclx1UxIUJ1g5meFN2D3yCOtc9Jq1YzIhbkqu1Eer22Ik8msfNb1xmRqcBLg6+
	 tytF3XfWSYsRlFK+oOku9+0pETpSZYfMQh3eaPE5ZEubpZzoZ44XgTTxGfbUzDBJSEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMe002Sw;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44B606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F44B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMe002Sw
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c511cdd5a82so68876666b.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156695; x=1795761495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0L65Z0WSTeOd+xby5EcVaXJY0gvQ3mzLgWdfZRejqAg=;
        b=UMe002SwitBG/rfcnmuW0FAnQ9MK8uY5mM+pW936m3VIbISOOZcfy4cojtbzPV9wTs
         Zs1SMkId54N/ATXQZbESUzWkwxWDbhbGYrrGNu+fae5QAl8GEs3q5rv11WdKktYoYYck
         dNZnurZPlTylLN5pVcxSd51jkwAVqkEIOpMtEKLnQWtxnbkMykQWg84/ZEpyZaG6egrv
         PlDiom7x5Atr2TxDXxrN9xQzWP7iWp8BvY+LQqXwI9U+hFuSLC0M+DqYHLsiwiqFB4Qc
         eysBlzu1BOSeaZyKEWkqxspG6sDMxbV4CuNcSrhbIxCGcFvIZvF0ok1qKmoc4OHqlMEl
         gMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156695; x=1795761495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0L65Z0WSTeOd+xby5EcVaXJY0gvQ3mzLgWdfZRejqAg=;
        b=1vy0wtemjz6Z7wtSpOhbxO3ygcC7W4CyhIb8fixiBrTiAMtmSVWZYYb3B8sxjVokmv
         bRCLzLOmVjmmfpW2l9h2GMT7FZ0Dk+lpguG0VJb9DQei9aqOUmbUL6skQ5VuCmxt20Zu
         02cn2/ZIIFNfllb5yOSl32FTourpV8gTNy7hjOUR2Lyhv1W7Q//s4ALEqFUql1AyTPRq
         ykex1Koyh/pgIo0/oafpFvssbwJILxVaD4dn/aNu6R8OFmczxc7J5D5Kby+JscO5IG0A
         gu2YclonU7bZWuJGARpFcXbgKHZB6uWKc7CGZ9HxxGcVkVmWWr/rvNoZbTdNoUv2KI5V
         kZKQ==
X-Gm-Message-State: APuU4Z+jLbwDGob4ItHhGaRbszMfbTdmuEyESognvOHOwzObVmTaAvR4
	jD5i0y8mIzx3XrKS2y2dAFT3OjXS7LEu0W0uTtsLkn6g3JhimqbXvqxL
X-Gm-Gg: AYBFou3EZjx80Ise07WvomgkDjTaT93CIpdVLs20Ns5eEtmbSzvhV/38s2InYJDkAzz
	tX27ETaSJk4ceP+49rDOo6kSbHAeXIpIb6/OvC1jjbB+AdgQvrMVygTxswG3HlLHfa+HD0uLMiH
	cUkLLZq9M6rcG0nfxpDSgy0bIeJjSlKkn65W2+D80f9rD8/i/taHaq3+OxDeHCZSNCNtM6AJpoQ
	cvnKCjaVRiSKgO1xp+YEtoubOgSMZ9Je4/Al0tdqo6zfoDKaVrqHKYS7FRoYI5CgevWb+d3ky2M
	RdF3UOWrvfLGnfgXkJ122w/67pVimgbVhStsve6oCa6m/wJc/V2DRFRc55Mf7+KSbVRxhW1Mq5e
	QVk4+xefEBmZJi6HwGwBH3mzgQyilzknssYDfGzhZ2MFc5ngpRRJJvp0ugob3zjJcrf3Emd2Q1E
	o4zAE/u78QzJIib1QmoiM8nHrVSA9KMmgtfy45/CVZRKoEd5d7Aq94bTKlBn6A87KVRToXGSRzC
	s9ndbmd2nWbIboF+vf8dEIdI/tj3nOcsjy6m0lbyjUufojbTlY2SGPld9j2tIzuyeBq9myUV65e
	2E+ObCY5zYNsheBngK1yG7pbrHbPeWE8LAZ3hzTtuPAWs8brDOb7M541Dm8Q+2gQq6wzY3LFnMz
	RiTK7eZUYbgm/pvkXog0QGSOkGtOAwRPRTbzBZPetVLLlK/Rho1g=
X-Received: by 2002:a17:907:9306:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c513a52ab6cmr181256866b.2.1795156694404;
        Thu, 19 Nov 2026 22:38:14 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm66530966b.57.2026.11.19.22.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:38:14 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kabel@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next v3 2/2] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B
Date: Fri, 20 Nov 2026 07:37:56 +0100
Message-ID: <20261120063756.3677554-3-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120063756.3677554-1-pawlik.dan@gmail.com>
References: <20261120063756.3677554-1-pawlik.dan@gmail.com>
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

Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/
---
 drivers/net/phy/sfp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 8406ad8ee786..431c0f773d35 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -496,6 +496,30 @@ static size_t sfp_strlen(const char *str, size_t maxlen)
 	return size;
 }
 
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
@@ -643,7 +667,7 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
 	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
-	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
+	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
-- 
2.56.1

