Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252373;
	b=rhQai5QwE/WfP0Z+YnvSobyI8No6K4QnGVRwVv93DoJnwjY9J/y6QVeXCfERhKEv/HoT
	 zhlwKKj81mwFJiwjVdNCgqOKQhp59B4L0nKuuZ+++ZmVYQi4Je77k682DwAL0uSADrI6P
	 CO/Vu6CfByB0aZporxoQLXif6w669WD00vastraz1Sy2sL1Mae+DVBM1tTQBM7r5VaExJ
	 FTiDHe87gqiNavDLA+Itwz+mZKRig2imrfNJ1eh2wTjHmUFRKXVnnfp1+MblMKAVMuYmf
	 3ciJITIgm0ofgI12qSo7kShVquufl+O8mgmdRopc54rTAX88WhL9073QKc5mGW6l57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0R0Rajg93cZuvvKuXLXRuyuMJQqRNxzjFEovTnfxn5g=;
	b=oLyvk+ed+em8a/Cy3j9y/9iSTfMht4bWx1hla2bRm04GjUh09GvgSi2sDjd57PBaiRZm
	 mr1EjBIeg6hKpS/oB6Kf5UMfgzjedEHv61Bk9cUSPutenB9YSSaC8xCoBrRf2JbgB/rjX
	 NYxIllm8eeeGxGC7UxzN5MP9juOfKkwPBy8XPY4tm4DlV5djXbCZjt6yGb+pmBxniVaF2
	 Z59lRPwbRjDu+Uo8t8bpw/e9ZcoGl/27nQvn0hB03s2D+T1eOlrN79hywUgkRfK2b/SjG
	 EeuBJHm423LG8dgyNxNTktlYl+/2iSqbDKDsNIro9wj68d9MyWiV0u2lbo8844QIv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sQpFgsm;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D82606A325
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D82606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sQpFgsm
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51239b0e3bso274737566b.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795252372; x=1795857172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R0Rajg93cZuvvKuXLXRuyuMJQqRNxzjFEovTnfxn5g=;
        b=0sQpFgsmsVUeU27WwH46mpksd3qM6/S7mEhtbNne6/Mor2+xuGy6cPHy4/Ktq8yM5b
         i/V4A2Uai7HQZBmohcTKlzdEO0puLj0J7dpIZv1K5Y32R+iDsOaCUI9XgscX8N9MxYTG
         GUvDGZQKezYtolH0ybOft1UAN8P++5g1Bv6NzPnY6C8zKGbiH1cVqxRq8aHsTA+CL7vQ
         001YgSxBiS8XnW5vAcsdXrxHwptCE/zGEdcH91mLjJYCEcLK/zyr6+uMMHvSJu8nQReF
         PAXXEXRTxt1rK+z+IOpLRURrNFnka4IhZEn9CHou+KIluxo0zkt4totsRKuJ+bfmJq/I
         Y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252372; x=1795857172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0R0Rajg93cZuvvKuXLXRuyuMJQqRNxzjFEovTnfxn5g=;
        b=uCGR0L4YEAmsfaXTXGDS1UHPvUzvT1DvOachHArQMmxusM3dpMNF/7MWqrEDtC/Pwm
         e85g4a2293LWq13OBjiZA5PLC837Qemcm4JS1kgIJpvdXtCCNhqiwU3vtnK/mz8aL+80
         kPGzyvaArmuXsKJrhmTuW74NcegEV019gJavG9xJQtjujzbuWHnxu+IxzX0nBs10Wzle
         L01ahvloJVe3QErECa3nAfy82ksQrzxz5iBb/oONz4Sx0v9aL4+fqv5GJRJgw7xWp8kw
         enjZogjaHJgGLIdFIC6OB7cLGBVRFhmdw+IRzUp8Dl25TSWSYystuzyftvbQ/pR08mVU
         4hbg==
X-Gm-Message-State: APuU4Z/r3rz+Az9Bs+6Q8gE7NsUvGm09Xs359wnbgmoDVMIf4jqa4aBW
	8uFjPtzx+Z50TVZ7iCtewY2iL5QWcrStIO5PjtZCfBsxp0YNGt8c2Y2J
X-Gm-Gg: AZFdTZcOdCESU4lBNBcGJFFefE3DpN2R/2ZbYyNVUyJtpiJfMc/ckmGkFzsfKm60Kr0
	kaGJUrbt/KJv7DjvWKb8u8/wJPpNdbkmEEfb+o1tbnzah181sT3uuc3OZ+QPYlXOm1cv0LyuTne
	kmibrCd/lGtA4jZKIjmPByz+/qz4jauiQ0uBe986s9q7Xtsxrz9UkkHoBJ9bgWJqanuvqvE+oHb
	wL4+csO8nEfOjIhYPqL1fLStwvv2/snVsb59k7PcxNXgm7K8anrFdZxvcfnA6E154hlfNrHXA23
	WTJfXuPDXou9KpgzLiqL27NyZ7Tgt5dQWuDwBpj7xtByprVFf3n8zD5iQX+w61XXBzp0Kl29rbe
	qaWK7Q3Ys+dAtLYeOhw7YXo7oq//5QU+G7sC3B1dRLMRE+9OXTPY4yV2deF7Fm/N3wtJ/7ugEkr
	WaB/5NlBqIXdrYhiln9oHXh/eaSH0cuud/LH1q/hcH5ADnl/Hy0gDKcbcF3sR8Xw/iGfty/Vq6k
	4xwerfBhpbBBhyreZYSRfhV81xpZP75QKy7wiR77+KVaYtso0us+wLqPoeXPmOFVtBvCwwBGICg
	tNwORNYyMYsuynBwUy8NcGplKHGVJ8lDzJBY4qsgg2xx/kCnqiGX/qavviQPRHXZduPZ1GAEmXW
	FE4gpUbSAqpm5CwhVkXrNQ2aGkup1Q7eiik5KiN3ZthyuIqdQjAwojYH2AjKFK/9FgvBXY4SI/w
	==
X-Received: by 2002:a17:906:fc0c:b0:c51:341c:5111 with SMTP id a640c23a62f3a-c513ab1cffbmr399293866b.33.1795252371774;
        Sat, 21 Nov 2026 01:12:51 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm178197666b.19.2026.11.21.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:12:51 -0800 (PST)
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
Subject: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B
Date: Sat, 21 Nov 2026 10:12:35 +0100
Message-ID: <20261121091235.1447291-3-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121091235.1447291-1-pawlik.dan@gmail.com>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
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
index 8406ad8ee786..d2c1bbe6686a 100644
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
+		dev_dbg(sfp->dev,
+			"rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
+			rev);
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

