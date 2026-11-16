Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821792;
	b=JXd1LqJ1RkkiyNE4PAZq3co4oLvmdigvJnOr/wToFqjlD8YaiP8DZo5BGQUr/cdy1HoA
	 BGkhI75vV8L8SsZ50IvIs8LOcesiqk4qWJddc9AH4HYPFg6j/PfcdNzX3bAhy2fzEnjro
	 xi1sNtXRXfio+BCgmM/9bH8n1ae3QTdUI4CuqqE/g5uwlCpyaKf2J3/lt5lW4c6bW5BXm
	 lj/Gbjsw8rp9Lb/QTFpBSmWxxqnqFQurA21d6Qk1Gqv6Xo3XmYrSG7RKX4wtfPOMCO4pq
	 i3QvJWbGY6YjsGy5nAp8gz8lqmEoJhXPw0GZiJ383tTzAgPUMyDgO3nWUlyPivukKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Qnjm0QmVEGDoHG7vkYin+7me9Qvgw/ivwaro7yLWUzY=;
	b=i/x5wLq7fJa2Gm84pMlv8pm/I9RnNLs+UFCjDWRP5QnvsGBHl9ENMICfZMwKUhziD8Ll
	 J3gxwD84vPidy5cl4T1HbgwYYXkSpUEEyo/AzEITbJtMfJU3qCfUTMuHRWyLBwmkhlv4u
	 yhrIOWmUDNlg2Qlo+6pQ/PYO+DpyvZkS8FNhhfH8DuKT/1llC5lMN80UtejMRNSfxhhd+
	 Ja0l17ivxLYvFogtn7z2um2T6cFEOECQSkqnsOvEUIt6hYuCsiG5GJom9gXgryHbevXJ4
	 /sq5zaw5243oblaw/kEgPNzMpIYmglDNSjSjrFpjVScP0ug6ttmhmuxgsT9SKOWNzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYqtMYax;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F608606A336
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F608606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYqtMYax
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so8657685e9.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821791; x=1795426591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qnjm0QmVEGDoHG7vkYin+7me9Qvgw/ivwaro7yLWUzY=;
        b=JYqtMYaxl/60dPKvkzJYFLifMgI95yMUdMGOm2ch1dl2rFOJ15AkICuNUG4SuGLTmH
         s17VYluIPTQf8FldYwN2DByWfozw4gN1kvLpo1KJ6/W+q808LLSkjCGk5eF1izQNqwiX
         Rq3Xpa0g1DTVs+vqG6WEHqVil+/PuwJAxcW/Z9VZ/9IIalcHmBZzfs2Sydlzg31eA4WJ
         IZ6a8MSG2m0EOzgEbHrVp3rCCR6ZCq/vnSRqwW3Oiqw2PTbOoAN1xM7v99t8tMUiwjJ/
         QtVIr6hDwh47wunXXV+Yqu/0AhxPNV5tgrjdms0FK2L+3EsrTphAWhfJOnWMikc1JDPe
         ojGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821791; x=1795426591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qnjm0QmVEGDoHG7vkYin+7me9Qvgw/ivwaro7yLWUzY=;
        b=PIAukqAE713NzR92jhVsK6eTf1ipfRJbOlJUR1aiky9kKHCcY3Jr2ugOYgGcXecrxg
         DuS+GfWqjmDk5eSgeO7tAPa4Mpx/AwxdNEywkOxsOQWYrQ2beMvyfKja7edNkKMvJav6
         zW+zXGiCS5C8F6BzS5LefQngQFelqta2Q+Rs0SrhOEsfIZ7vnjWTNB0QSk98+1oqxHpS
         7HQv3Tk2Cpf/TqTc27YXn1qojlBV7KB5ywJEqnuApDX6KqmfPcRb6TQJ0yOz/g1Pex04
         yeTcrVAymtzH8tOc27vn8uSKJiMkSn7z4/T9/oCdakj+bJj52UPj5QKl9obw7C41v4LG
         SGLw==
X-Gm-Message-State: APuU4Z+phIb6QNeflqeekSTaU5bNi6Flk9p0NS+uogjIJIldihA5EuwP
	CoboGQ1H0X2RNontt/4bBdtpgM/9YIr6PEDPb4H9IiO1XDv2QYjWWxzv
X-Gm-Gg: AYBFou28T5xD6d0ZQ6pK6kiZ/ngjIuCIL5xOu8ftm1yCpdftuXqMEI4qKO7vY5+5qcz
	sMgcOBuAwEFAAjWOB7Vr4DzYkzEoxj0Cob7wu4C7gNL3MMKhQJ6/rj9FB5NTPrbSxplPT+dPQgQ
	rwN4t2IkVTSkW1/EwCmQN6XOs1svvDm0f6a6lGHqw9Ay/v8KQNUF47mICgBRfVpJ69rJ7sbw8nc
	n50y6FVgFzX+p8iJbNOEpOrWee0YFJGlYGdCXBuiGzuT0nNgX8Wv0/H/mX4kPtJ0ZyYid6SRQhQ
	UedVILgI89+DKiqTJVEMloSk9jo4hAzEuW9xRd8tFdAiDyrA/uckPTogS/r2U5jCidg4y5A09Kg
	KoxsE1XhEbcBthnlSE2+2/gMpDdrAiEg/k1gUQuDAAqMv3xyejZt/DByyXK2bW62MLz3MvS70XG
	XMB6i3zInPEmed80haQO4YSI5qAMzvw+Axcmy6q+TN3FZzLWW2zb6i/W2dciiBvYBekUUJaO60O
	V0iPAdpPe8Kjh7SQKRQm/6N3jpPDrSmk7HjXx4RLXvsm5+qwMQb/fiGWRCoFRdI7jomifnz8WSy
	KZsu8EFkBlVZH5GNLvH6zBzOv7HbT2wvWi9wfBCn4OE9I/Lrgs6jlp6FBl3a1XVtB1poAv66M1j
	U2+mikPHXsDCTOrThR3U8MlFMa3woSkiV0nJTw7NV27SCC1tHG3EciDcW9uHf6Esseg==
X-Received: by 2002:a05:600c:1d10:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb55a65ea5mr194117845e9.5.1794821790551;
        Mon, 16 Nov 2026 01:36:30 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm246979815e9.4.2026.11.16.01.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:36:29 -0800 (PST)
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
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B
Date: Mon, 16 Nov 2026 10:36:05 +0100
Message-ID: <20261116093605.294365-1-pawlik.dan@gmail.com>
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

This does not re-introduce the generic RollBall bridge probe reverted in
commit b521003c27eb ("Revert 'net: phy: sfp: probe for RollBall
I2C-to-MDIO bridge in mdio-i2c'"): the probe path, its timeouts and the
MDIO bus creation for genuine RollBall modules are untouched. It only
narrows the existing "OEM SFP-10G-T" quirk by vendor revision, so modules
that do have the bridge keep the current behaviour.

Further bridge-less revisions of this part number may exist; they can be
added to the fixup once their lack of a bridge is confirmed on hardware.
---
 drivers/net/phy/sfp.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743701..066f11241afc 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -482,6 +482,28 @@ static void sfp_fixup_rollball_cc(struct sfp *sfp)
 	sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
 }
 
+static void sfp_fixup_oem_10gt(struct sfp *sfp)
+{
+	/* Revisions A and B of this module have no RollBall I2C-to-MDIO
+	 * bridge (on rev A, page 3 of the 0x51 EEPROM just echoes written
+	 * bytes), so every RollBall command times out and the PHY probe
+	 * keeps retrying for over nine minutes, holding rtnl_lock for ~20
+	 * seconds per attempt. The PHY is not accessible at all, so use the
+	 * module without one.
+	 */
+	if (!memcmp(sfp->id.base.vendor_rev, "A   ", 4) ||
+	    !memcmp(sfp->id.base.vendor_rev, "B   ", 4)) {
+		dev_info(sfp->dev,
+			 "rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
+			 sfp->id.base.vendor_rev[0]);
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
@@ -629,7 +651,7 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
 	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
-	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
+	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
-- 
2.56.1

