Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653089;
	b=fhMGHXlziaSx1iReZ0wC4iDsU6mlpTFy5nNmxKn/zkgcnvALbCatR/mJ9gemGGJX9nvO
	 DuJLCbYWkduWNgf+grKIlvF3zLdgmIRibDegCq8EZsm4EzrHYVejtCqIvVgx5NNy3AvQr
	 aJ2tftv6OfSvWnry4gul2vCTweNdNluvoDFje260uaFF8X9G53iopZsZJHQhTtHXI+HJM
	 pVhgk0CLtwQ6+HUFGgO8TUR8c1sGxwXKxSZPs0xCbG4WqPr11HPXaapsyKm2lIhQzSS+n
	 N0SM/tho/EPGmt9ObOsw+xttUll+l7VwRcByYd2jroUs8TKvqkf7aWOQo/SQ+es+QFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
	b=UWcK89KQe0XTMsjRlWDezhfuJw/g+NtQahhbA4qCd73eS7w9E27ivEPN6lqllbU/ybAn
	 9GZTU54iDnXDXZks5cfmWPsJ7SKiAf2jrz1ZfRuzd5/JrMq4gX7hhU4C5o8jJRStKAD/b
	 lRRtFU9J+bms/gBqW1DYls+ZmKuxTs+0q/E3h7g3UUfdxM/+0GEBwt1lUwwOr2Tsekn9Z
	 IVQh67AXRejz7FlRNDGf3HATIYdHVJHwgAcXTZuqkDY+FZhV2UfQGxiXEt+SfI9o+srZN
	 Af+B3z5yELTKr3O3U4psc0i5OroNn9gVr6rtRRE9JdrFJsGaiDhAf0jRpSScubj6LnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4grN1dd;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8460A5BD4
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF8460A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4grN1dd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so12060855e9.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653087; x=1795257887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=B4grN1ddAxi7Ixp4eWbZq+F6Q01xJI+b/QqS1WMe54DzHVFq2qwOjEOOzzbpyZWPbg
         93q08kDZO1/zrYpCtnPeykw/27SQHpWcHGbN4etXdjPUG/IAFF3xYPvi+RdecRsX6QYe
         MHB0luDU5jjMIjnPZJLhvnW5JKkN2GUYD5c++a4tbnjz05M/UDynAheFbbDm4dbgFHFr
         GbbDaps9530Fgb4dFtvatg3dkBR4vvTKzmJ2lwvpXcGMjTbaLtUI/AsCtHjKDGwbyXFj
         63RnW0RtXNqo+HEOHTh1JaefThtPSQ+qdUqcA4wQfT/VDpDasHNu5zFNw7Kg3yTUJAaZ
         zq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653087; x=1795257887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLi51p4iauXBUhQPNTBnAIiXCKT/18A4o5qsFZszAHk=;
        b=BgruQ5JnfOXhqFf9MlHqn4hZhrEa9QktYzusPJ9qfuBe07aHeGkm50y20uo/uPr+Vj
         v+x2q25MfAee10/dboW2wt9FPjxpkGkX9wqLsjKiU6cKhS0gGrvB0vShyeHRKVWe3bb0
         ywvj+f1ksGJmPFEVOIDHhhkmhzESNfRekwuajaw7jIj3ISZX3ZvbOJgkvGg/m8WJtv/U
         cZ2TV8fIxfgGsflqqn/vZb2xcjg8Zby/N4SrIl9/SALs22ANVZH3jVU5ZO7YUg0ayznC
         c4EGWOpuXExhPtrBQk4L2i34l2ClfgT3dMsuaXqB9uG79YFu7K2MkM4XLHqBp6SlS+05
         U4xg==
X-Forwarded-Encrypted: i=1; AL+hErF5+eRTZhx1yLDr2FtSOE1y3R+JYwt6f4mwJFcMG95BsVF6EjFb3gm3RB8NYeYpG2pZN6k/Ol8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6bFl3RhEJ/37DRiXMI4ajqO1TPRrEqvtHA7vwj1TxRTjsQjL9
	4To8XTdkyrd/71TdvbbdX5/K0CSowEdaL1S/hgDgDCkPwKQGS18DSZ9t
X-Gm-Gg: AYBFou1Wauhswz7nyyfdWYOZloQhaKx0nUXS1tPEr0YKMpwnOdUv0LgrlPCKrDgXPiH
	nQRdfc/3BndnmehMqhapfyioTs5eErYKy2dVrpM0e3jUkFV6Fan7rvxAKJie18jzYrYHo/XV0IL
	gkGjR4KIbbc9DtbcIisXpa2S8LJHNcRw+c3ALaKn5Zqw42EaHoToyj/2zZjKc1An273cWV1gyVb
	OIVZkWAKBRNrXfBEBXsSWgG1Digr41TS7QaNcHDDtSDjH7DYPrBa6zvdpkIYtoyBCp4gQQ2PWCe
	vPV8b80wTlzO+rugMHv1+7BbeOH+uZwVCWYw7nD7SskZgQAUqbeQTK+0FS1tsXjB6+ENNQf+IIO
	eIBuimbVFnMyGbruOFthfPqMLLTsIoJ5R1AC0P3rpnxj9MBva4T8ogEoOY2n4vgKjRMpJj5zHQ7
	iw1Ejv8ik9dcsLtyqk6KMG9VMjACJLYPs1w97oIBIf+OxnlA+xBI2iaRI2OCFyHGJiP7seu4TqQ
	dS1Y64W5YpB9vG2502T0yNPT/a6Wl0ZD45p7UJMNdakoa3hB9DZXwBD06RiXZA6yatXHuWpCZuf
	QLyxNaSnDES9GEL00IxARJwUMSs1J49ermO0THGqKQjI6bBtLIUc0TrpUrK4q2RImUmVy2wJNwh
	i5kRxDcesTRwimnCdZprlUbWBPK3RNsMvBw==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr110359075e9.11.1794653087248;
        Sat, 14 Nov 2026 02:44:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:46 -0800 (PST)
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
Subject: [PATCH net-next v20 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Sat, 14 Nov 2026 11:43:46 +0100
Message-ID: <20261114104426.235620-8-ansuelsmth@gmail.com>
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7ec4feb950a..957241652525 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +718,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2252,6 +2274,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2299,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0

