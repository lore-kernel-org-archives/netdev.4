Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625666;
	b=SPU2qBss8R/HBPLT9Z3mzEFJr1tGLxqxRFaT4GU2MxeMUrz3zEoIGFoz/C/W78dQidFu
	 R1BqbZleg91FqmSjnrbgBFMHd0bFH4g9HkImgbm5PMjPfC4shCKG8/ChcUfatq5v6ZA54
	 8DvrwMM/p6cOqVUjpJbKPnZcpnMQz/zGxaljLnJoPf3XWakzWrHNuBYQAQ68Jm/UYtJCt
	 m5MwjJpnVn0otqU0hTfzTdLmizCg/23KWXDRJsEH95SE13kSTCz85MOStmJElK2zHFnXF
	 wQtDSjzhjqsD2odv30OwKbSa7zRq2R417+sQvI6heXhSn04oGCg06QU5x2i/+xnC0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fo6/oOgxrVw29szkvhAl5MCxGZVgItwmDUGsOVShRws=;
	b=WN2ch+OrtXiEL15fVyRmNzQrJ+FOweSzJyJMWf5fyLAAjRH30ixTR31KqNvCZz8OxZNe
	 wSzR361uRX2T99TerB5UZKs/DyyLwaBGyyyVtzKkxRUIxKpEj9IEGxD/KKQwr9K9INneR
	 sv6mMTNjdjcWSEqs61KXLwp38etZnNhuq0hf3gZG9yf/AHO1L7nC93KYO1Q4R5kaxPNKj
	 bqTxi0Nkz0JzOQ3yS3KPlZ9tId8s6lKYPFxuA+7HUg9+QQo57EXJYkzIxDBwf3/aw8mCF
	 cSRaJ0LodB71/722UyO3n+tJUPLo+mYeJv3RqYqjOLappP+dsko7XqDkm8NL2jcn55g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qdx2sBbe;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A277606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A277606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qdx2sBbe
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so8205745a12.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625664; x=1796230464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fo6/oOgxrVw29szkvhAl5MCxGZVgItwmDUGsOVShRws=;
        b=Qdx2sBbew9a5SGThoL8M7GCHUQ5eAAcYObHisTldqDZvqwbCEkMBAt8aRcqA2GFRIM
         75arVMndEDCcwXKgXCmLHPLI+rKMQ49zrhTOzhGtkPBaUaYK2Y4ketgrPn+nyKjPLNMa
         u9Ig+IJROtJlMyTvs9V3oXRMZzf6G5tknpJBJbonj9hnGfIWkMmfZC2kepFII5h+tYtu
         3JmFqHgDTicWbm3THonhM9RQmzMdOCbO/r0YaPsmAZfShs8IjXSUDS/J/sizraHQqIG8
         NRKiSovvI3n5QJOGrR8k3J3DouEkuB5XDGKPXBm4+vTJKaeA8ITuvkkyjTykqTlXLuUF
         Pf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625664; x=1796230464;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fo6/oOgxrVw29szkvhAl5MCxGZVgItwmDUGsOVShRws=;
        b=aWH1CBH++fACutMHSDyY/ync/996LmSSifepKFN3Ce39vDOEVptuFNbyF1KkCzYF+S
         68JBsWOqvKFzg8tW17cIZrww/0/P+VROE914o5oGOaUBlFCSfPn+PmGw7yEKGZLs73Bz
         fVT9a/Sfp2snbHz5VyqvVJCdAQlOfilr5WKXDYWv/YmP7VEL6AKHN+hZh3ikFvzEFGbl
         xRQjKUz5Hidjv8QwyWm+Vg9IHbd1DzlX3qnPX6ePG1/cxObi6SkF3Ve8OkdT75ExYKDi
         FiqwxgPIlf90Mi9gjIoLs38X7Ze8ZvoBq6adIWbg38Zh3upIU+l40SwcucXOnvwpC8bz
         heoA==
X-Gm-Message-State: APuU4Z/0VzbCiqw9eCAZdo8E6nUSV/Y3n7PEDHdXAND+lozGH4nsM9UF
	nXpEzibAG7grPN46E9j1D/T/wVr4DhSSSUJC2cK2BLT9ND+CaK+AHXm8
X-Gm-Gg: AZFdTZegs/A4y902cBjfc0jF4r9SDbg2LRW2heNV87jvhHHHVnjElm4LOsy9fkkrBJS
	VmjF3pNuRJ6aAB/kajKTOJGEEzFlTguHUq1G/iuNnwwOjOA4Ue15ZyUVaKzI43xD6OzKZf0/w1L
	UGPCdLesrgy0bEIEUnCQ4eM/9w196SPIuEK645IFX1AZV6snEVjMASCAvdoTxk6Or1ulz8Z4I5Q
	J4jXHfBhpe9Kf1oFEZu1KWCpaL4EZRzooRS83Q8V43avKhWW9bQeB/nnGagXz/lJ0/RhUFunVVI
	GeMk4HJn+tHvuRlDOy4PO5XdZ9G5wxgsyuQdTruZzjdeosi8UpNk1XUDt5mjS66mFhcNoJdTRpB
	tpzPkScjxAJDLqlLDSAqANnkgBcqxhWcaUCBV0b5adyJTR870zV5sXjNGnUWabRaENLDhkA1e4T
	VxbERAj7fOMvH73W27YWLV+4FbVlCsazKWZrG5u9xMRShpGidlztaL+iw3QnIB3Zxmc/Llyb38D
	nZTkWstfbg8m3R6O8CuaZm+AhYKvGVDbKr701K/hoxhycq3O/9z9t6aWck+1C41lKdw9OQJWvFK
	DMKNT3pUWJmCDxcpidgV90Wsg9eHIpL80tHZiAMP9AFiZ8OftmaiLg05/jhhygEXu1cnDX/+JIO
	1FUtLgANKbwu6eCIQrj7ZXQJU5yuHxYMDj2ZJ9t+kP/KDyzBaiC9inFifFxLnIuybOE56Kuacrg
	==
X-Received: by 2002:a05:6402:1e90:b0:6b6:8ed8:765a with SMTP id 4fb4d7f45d1cf-6ba37eb79cdmr13480189a12.38.1795625664349;
        Wed, 25 Nov 2026 08:54:24 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.219.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm2188746a12.6.2026.11.25.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:54:23 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: kabel@kernel.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next v5] net: sfp: probe RollBall bridge with one MDIO read before the PHY probe
Date: Wed, 25 Nov 2026 17:54:17 +0100
Message-ID: <20261125165417.3422927-1-pawlik.dan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modules without a RollBall I2C-to-MDIO bridge time out on every RollBall
command, but the quirks for such modules force MDIO_I2C_ROLLBALL. The
PHY probe then retries 25 times at ~21 seconds per attempt, i.e. for
over nine minutes, before the module links up without a PHY. Each
attempt runs from sfp_timeout() with rtnl_lock held, so for the whole
window every rtnl user on the system stalls in ~21 second chunks,
including the state machines of other SFP cages: in one test, pulling a
module from another cage was only processed after the current attempt
ended, triggering a WARN from phy_error_precise().

mdio-i2c reports a RollBall command timeout as 0xffff, both for a
bridge that is still booting and for a module without a bridge. Do one
cheap MDIO read of the PHY ID before the full PHY probe and return
-ENODEV on 0xffff: the existing 25 x 1 s retry loop still protects
slow-booting genuine bridges, but a failed attempt costs one read
instead of a full probe timing out on every register.

The ID register is used because phylib ignores a C45 MMD whose ID reads
all-ones when matching drivers, so a PHY failing this check could not
bind a driver through that MMD anyway.

The trade-off is a shorter window for a bridge that stays completely
silent: the retry loop now gives up after about 45 seconds instead of
the ~9 minutes the slow probe accidentally provided. The RollBall
fixup allows modules to block PHY access for up to 25 seconds after
insertion, so this should be sufficient.

Tested on a Banana Pi BPI-R4 with a bridge-less "OEM SFP-10G-T" rev A
module and a genuine rev 02 module with an AQR113C: the rev A module
links up at 10G 57 s after boot instead of over nine minutes, and the
rev 02 module attaches its PHY as before.

Suggested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

---

Replaces the revision-quirk approach of v4 with the generic check
suggested by Marek Behún, using the PHY ID register per his and Andrew
Lunn's review. This also drops the sfp_strlen() move from v4, making
this a single patch.

v4: https://lore.kernel.org/netdev/20261121091235.1447291-1-pawlik.dan@gmail.com/
v3: https://lore.kernel.org/netdev/20261120063756.3677554-1-pawlik.dan@gmail.com/
v2: https://lore.kernel.org/netdev/20261118221450.1764790-1-pawlik.dan@gmail.com/
v1: https://lore.kernel.org/netdev/20261116093605.294365-1-pawlik.dan@gmail.com/
---
 drivers/net/phy/sfp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743701..9582dd21aee8 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -2249,6 +2249,7 @@ static int sfp_sm_add_mdio_bus(struct sfp *sfp)
 static int sfp_sm_probe_for_phy(struct sfp *sfp)
 {
 	int err = 0;
+	int ret;
 
 	switch (sfp->mdio_protocol) {
 	case MDIO_I2C_NONE:
@@ -2263,6 +2264,16 @@ static int sfp_sm_probe_for_phy(struct sfp *sfp)
 		break;
 
 	case MDIO_I2C_ROLLBALL:
+		/* mdio-i2c reports a RollBall command timeout as 0xffff, both
+		 * for a bridge that is still booting and for a module without
+		 * a bridge. Retry after one cheap read instead of a full PHY
+		 * probe, which times out on every register under rtnl_lock.
+		 */
+		ret = mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL,
+				       MDIO_MMD_PMAPMD, MII_PHYSID1);
+		if (ret == 0xffff)
+			return -ENODEV;
+
 		err = sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true);
 		break;
 	}
-- 
2.56.1

