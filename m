Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919214;
	b=OVeQfuJgPoD8eOiKjF4btnlYy3897xLN1NJMh6N2GGpFYOL5pu/CzPCKvIK+ZTaeoA4q
	 +j2qHSltmGaCMIgetHSfsRe12V2SH0PRE6MLZpDggnY3qfTdNG77DwWjn2Ux4Rix7fX5i
	 xzXOumR/VGwvL9/K1bq85+8Jb/m5QBYDaRMahfduqo8I+HmMZXS9yJ67K9AOJRSlWDJM9
	 yQDm0/mtt2ztQeMvBp2tYcfet4tZ/ShowtT+8CzF+zCHd0C+NFUL+kB+sjmPchktKYDNB
	 o3JDSwh4dLJSSH1oXBKvBpjRuhEz1lUnEb1GqmQ3Ys1VcaOOGy59imVCxIGjDqTllqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=buUHABqTekTPAmLaTDMWEulMYWtfyGLSqvlAhx4j6s+sqIyMPWPQ+cHBebnpPsEPlOk9
	 WtcKJrWvUAfgY+aKC+cKbx71VLGaKMgO8o1i9TPKlDm8vgcwoRruUbBbBJIu83VwLr7Cq
	 rrz5gJ/OO8m+iEkzXnR6/grD0gjrNMMlAvZhRrWe7rXVn+Xq54buvgIcUzfElsNjj44uh
	 fCb37V2XhkR0YkAClFBvskJ8dsi1gfdXQiur0c0t6ncW6MTE7cVJ+4TF/aiJhKeaOkmIm
	 8XehBjfOYCvBqkhrhoWnG6m+QosDh86rH4BuuSl1Lo0esvR0Jn1ndfJRm6N1o83ogZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D4606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8D4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47827345e9.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919212; x=1795524012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=Fh2bEDIR/d4uWsXPkBfajsg5Nj7BImqYBDcRS4r+K6kCFwgeO+dcKNai4X+1/lmKmc
         1gISntCorZBotrgw7gWmMS29Ac1jNLiXIbTNJJci4zTdvWCsrgMm7m0aKIk9NHFx1UJP
         QHP770xVZniMTDC45tVGF2RNJERWAAfLIMPoV9QmQvL0citbFzUX90QPouysWgIJ/f1n
         AXgfs7Aj60F2QXBV2EB1MZy6FXJkE72sj2yoZFtNwX2brRbnryjsuoMBIHhotID6UXRj
         nxUHsoTME3V609QEQcv8buE5iT8roh1KFQUJ/X0GjBiThB/lsqoBJcrO9xvw26IercKs
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919212; x=1795524012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=vuOjMmkVYMdWlu/pzsFpM4cylZWRUmDj19DuKdAalFahgINLOBTBAu9nw8gegfHAlQ
         eAuLPR0r8Phm9BPF/KovKdPyewbFtlN5ZyJxPvIWpyF9gt9pcve1gDDN28lZCx9nfvh5
         oGBrbgTIAmAj4YpKUmpqxmg83E3Bfx1znuvLyjqDiWQlldkmeL+9X/DatoKUk5rBJAsq
         sF1v+l0+cb+4rlkQ23nvc7G7tbfHNDkynq0QlfAy+bsq9yezzrbEoooLx3ugjjWDG7S2
         tIoK3PvLk5VJQJHZzbZDoBPPrBDf4Mdit3/PoPLyE+gn0+z9ephX/gLOjTinX7YO/n16
         cs/Q==
X-Forwarded-Encrypted: i=1; AL+hErFbkradJxyP7IagfnXBtfhuinesO7rhZTz3zFmu3RbexKoxf4iwSf88k7VtrAKqQScMqW9MxjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kAOjhGL82gkI3tQL109RLZzKXP9IUFcuaAmOCRKnj2o3Qv2Dv
	Hp6bAn81AzJjWBmPvvxWCLY2TvmQ3O0Q84MSVq/CvjsTTkT3I/CC87Wj
X-Gm-Gg: AYBFou2jdpnYq5NkiasfU2mn2i8E+y7n8poYY9CwkpBVVutbiXI27945vCParJGmcKa
	z4fylYoEw1LJVDri+oSjB1y7X0djtxZFmsSQk5r0D3+2mQnhZOsJLs7d593GdSG3ijcUxDsYfrC
	ZHZ8Y2jK/xbuBewC52IB0zRP4f6nsG6K0nMjI79P8F6IXchhlgDyGEUEScY/lEzmaDT8BdHyKGP
	vPV39HGB30fJyI4TNdzRDYZ/83q4gW6NA6ejGVELVH5NQ+usnekN41PfyGpia+Ls6Ona5+Yfyp5
	/Tb6Mm/sfOhNJimRqJiVZ/DjO+hvl4a0PDj7xc50l9dpmrz6wUk1tYJs7h4JPNLKLVVrSP43VO/
	XW8aQL79LeZfrZqFzLnFIfItFDAaUuvO+IzOBs7QDgdXyTQZGBsFw4wkHO0Ji4K27dXDF//Xin9
	UCx0Uyifhh+WQb5ewX+oKziPwSdxuBrLg6VJyJsRYGLqmKbVeK5N9iFsx9dNCPrBLiuiH3vryS5
	ED4FI72feQSJ6amkJFmz/pnb7+PNYtOeuErSE7drcP7p2jBngAKi1OpJKU+I07FvOCS4jxiduP/
	TieNz/YMsFuhEARmdqCbiooGFXaLh/+nTe5s7/6GhOxsnjz0xtWkABP2X1daKEi8+2Qf+vgmlVo
	cHHd+Q3m57410iYSY1pxnsf1YpruKBB9WSUr0PFc12l/R1ANkFIDRi3w=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr183926425e9.20.1794919212027;
        Tue, 17 Nov 2026 04:40:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 17 Nov 2026 13:39:42 +0100
Message-ID: <20261117123956.11981-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

