Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653086;
	b=bg8Tey/DDetmY97HD8CU/8c0xN1SJ06tJ4bsylbkyp0MkzwjOdq92gL5inD/SZo4fYgY
	 jVLoOlgS2E6PzeIBl0Xza/dkiYyuu99bC4ZMKc/JIraC8cdzhFLK78s+7PLq5g0FcWE70
	 GM2BeZHGI1QXxginQ70HKmld4Jn1tnFbWWVsYDex0fDa/Iy/pICcZHvlvYhj3DH1IEbyZ
	 XQEM7EAD+e5ZSIBw5hRllwv3CMgt+4t1cN2uWv7Tbwmynu1Qwizg6Lip9scmmKcPRixdo
	 yGBEVPBrfQtCkEHzBVcGN46LpRUUQYl2DB6J3dtzgTRbGSTVGYMt808/yIpDcDx6H6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
	b=HmpzHrNBCv1T/KfZN1HN3NqxG83RvXYpvRIkcN7g/3Tx8gllBW+NVqoc2ibN+c32c2KV
	 UWGFRibzJQDudPdD1OjngavYBGb+9TbTXj9NTurSQVbiwJ/BFZB0xIPyDTxTmqCbeGyW5
	 sdrHiSwbSzXPDq5IYpnbviKn8wIC5wxTFTDWcIQEMmsBJ5cYvTXMfwf2PqEjy07ztEFPQ
	 8qkIv5hDLaaL33FMsnJOnEOq88ZixAQPudwNk4gWVFXdFJClbkLLTxZsU/4UBNs2KjpHT
	 iNzdnn4C0dmgn4y0UqQvWIoK/VJ6mvW9Ej6Q8uVPZJPepSiquoFx+p9QaiVV+MbgTew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJi0bTX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00260A3818
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F00260A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJi0bTX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14781605e9.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653085; x=1795257885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=kmJi0bTXpxNex4wVtb9RqMfCtLeBZOi9VvC2XV80cTX0PsmxsT2YBo/c4CMaL8K6dF
         YdBUIycTBCbL6y1WWjzLCl0IAKQTVqGZjZKKkshwQznWls3xbDyw/gpcfzGWcoa+M1Ih
         W0E0Xi0w5rnQLjN4paVogn8ZvKmmdRy7WSvLYaiVc7UqJ4p7ZCbDR727tWONuxe81B/i
         RaMDGW3lu0be9TQMuVNgJmcwX5DxCJv16+67dxTa2zC8R1Y3ETQngec7qK0nmwXqncSb
         GbIyal/oCS7xRIhZqyAXOjwgXkHvFMHzarQReJl7TUtB3tuj6tRX6QIMH7ZdIlESMcDF
         GRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653085; x=1795257885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=tL+Ugo1nswiw+zwXipkI/8vP3JEJJJZmc6eIb4JrzjmUZZD0BWYPMSep6DBto9k7Xa
         jedvXoZxVYZdOSujQ984C3Bp3SyF1vr3dqL1ocFPx9gXqmvzIupaIfDs/s3/C49j6RJj
         a44WXG7C6w9NX4jqrIh9a6eOKkbXnRLssBwFPr5a3tjoB4qMH7eV8MCIQ+odV1gOl2E+
         Ts7V09ANTnIMFZ5WqJ8auJKsEsKp5bSvNk3eNj1NtubNa/3WUO2RGa9znOWcBhMPlfbX
         G8ovZ8wm0YcPMxV8Q4rknhep6Vd660n/GPmbcx9RQhD2tQVM2Y8fO7weUM53F02nwJrq
         hLNQ==
X-Forwarded-Encrypted: i=1; AL+hErEwthsPzZKemF5m8joZOaVPKh4iDtpXqww/8uFivJwqqEBVbbC6+P27L143vmVjFxknKIcqekk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9enQ6/D4sK+ZrLzo8daJrqGxx5244nGiWjZOSH65DdqZlY2aPQ
	ME5pO/pse/+iG3gwp97tAv3JoKrSBioxUNNfynb81nnwfptijX2PGCaS
X-Gm-Gg: AYBFou1+xJaFbgFIDcOVQ91HQPz7lJFz5UHnBpnRmuQ0rDCIPACVA4qCEXDYTPQQff3
	/7j+/1a3Sv+vDj+4mXFIVBlXJlaFdrHc0jWaTWonibfgYG/ftqS4rI0yk6kRKq9OlU6oXDeYDri
	2uufq+UW1Y/5RdX4cxXSrmchgB86H+DQ7hE5+iBdA7H7iONS+GBLeCe5qlOFEj8JChvVDoRPpUs
	31FfOPtZLDuG3paC3gN64+CLHc1s037PkYjnpmxV3gQEGXpVmlDUq9CxvSoVYAJka+/Xv2jacOS
	Id3zdmcY2dsXTPVZEkcvRe2QJOA4b2OAVYbBUsZFu6JPcy8Nk4neiK0kbXfieofDKe2vQM9nLeP
	qFTGZjEvY7IkQ2dZRGTUVxmX+E0i6cVwHG7WBAPy80RRWAsW65bAugkNXfvvQveODzxZ+Wd+2Y9
	K5eqqiyOiXLLNJF9b2P73jOkoo+yC2tI9NVglfxuymoEtluKYHV4Qfo7IIjUA5ub+orsOnneyq9
	myeZ1eYsL4UECufSYNdZqFlmKSCP8yqlnvinnr5dyRGTFy6KB7kBdZ3Oj+28m/okOavegWP7XVx
	Wbe84SQ7D6g9/3uQlcevKM5wdHgGonlwyIkYIFVodOuSJ59oE3eC0xuVOQ19OorRt60E29lBr2j
	40ukHBpgI1i1pTqmNYgZ5a4WkOI4GwfrIHQ==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr75106665e9.10.1794653084661;
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 06/15] net: phylink: make phylink_validate state locked
Date: Sat, 14 Nov 2026 11:43:45 +0100
Message-ID: <20261114104426.235620-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 ++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..a7ec4feb950a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +705,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2152,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0

