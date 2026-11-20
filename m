Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134377;
	b=p8J4HqOqgfMlHqfTPaoim3YghsUQdFVeBX+v+lR15Y7ePYbKqRtOuM0EMldD1sjsD/Du
	 WvQCtyNQhZce1xGV6tht5XfoVqNZO0utV/diTcQAzo/r5qtbnm0DQwb255q8mA+PPoNEW
	 /oaZj2wyj5xJM1IOxLQg0Ararsrx2pniw8C57G2PaMDFcBKN+LHgkAK4DQz/Br+HtJBl5
	 LHe3r0e58r3T2tKN71Rw7XQfnoZhIQICo/nsLxoXVLmpLZKg5i8oH8zLcpeOsp+RW+ZGv
	 hKAlvHc4+2vFDh65lGVinC6xKc7fAUphRtqFT/lSFnhQs+cJZlPAnZHAaM8kBuwbZww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
	b=o8DwvcebjkaCshLqF/6ru/SNhcenTYaMTdpzKc82YEyye2kfuynVYchIH+7PRCnNUgtM
	 pwZWFF/5R+iKeGDijOA9Ql/1vhISQexsAuxfPbIMUiYrS6NyihkwK+JKbJgK9sF8EPLrK
	 gq1Z7g+Ppq6C7SJylRa8tstZHx0sUa69z+pNEPJnWPh7ry+TwimS/JDjBpxg7iTvhUFbW
	 uqKANpngsos6v/O0STkxhPjqDJIZZhmvXcKZw9tb4KAGreQz9DS+Z6VMWKRgwhG++gc0R
	 sdctuLUVbxbYbd0acnWgQqvJ+Fc2DKyBiUarYMh/W45kDEsrmc+A7QA7LdCeuusrUpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AD606A961
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0AD606A961
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so1824505e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134375; x=1795739175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=JzGwlSSRnJ/pM1jzIynWx0Mj9l+P2kGmykNiNarXiqYNS+A110hdsPW7czY7Akpbm0
         Xz/CamNAUbrx1m1XphPuLG49RNDJAaHotX0PR6jv9lEPsm2ftb7wm+FyOMxJJOi6s5zG
         67bxUbbB3M70YuPHUMb7H8f5/a9lFgXF1zXVFrNwqifN8DwkoHmTvJNqqucB8SsJZl2n
         2pMh8AF/BURqD6PAjDG7Dxe6A/dMBjS3CGsqunyde88cETbwjlsqBwveXf9NccFk+YXg
         onPxtbW8vQOLE2M2cGEE0HsaSOVVu9XYvc1TEgeaFIFcvMW1fXez2DogcZlGApDJfJP5
         zT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134375; x=1795739175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=hpXwEoAHAxRujiaA8Km1U4VUaC3mlPpRlm+3qY6jwIYaTs1wI7b2aUQmn9wada8L7/
         66CLoIkWojkhrk0siJbF03fp+Yv9XpnZbUsGX+bDC1MFboXExjKJyoEPs8YlsF7T8pJc
         kJ4pOkZvaIioPXJtI8m0Ro7yktfv2e6GCFMWCRPxjUSuC+JcZ/zBaRgUSC4L2SapPGIC
         qBGKyIL3iJAmKaF+Z5kmh7X8TFvjqhD8jGp5cAKmnAJUv9siS343zHS/1h9wucdHxJ+M
         KGBnb1RRK32ttx62c+z82IFLTHcK2Qi2mnBBK7RdbRF3bW2ItFyuLQL4QI4uUuYIyN7x
         t9iQ==
X-Forwarded-Encrypted: i=1; AL+hErGmaM3x9tUohjUM2xTNl1JByLx0jI6VFC9mJYZBudbxtQ+jTxmUhEX0V4HkzZo3+ha3YzwFG7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q/yOuuzNUa8MOitu84zqn4SePcvhDEIYXj4qNFBglH5QPBh+d
	pDZaJFtPctn7c0XTd+ByjyVUOz1ybrcI1/4waiSSGuifgWMo+wH4ElRY
X-Gm-Gg: AYBFou2dZgFErGEH6WisifCsRSrcTNSP5gWmOOq/8zXka2tj9sAGjASIAmfS9+yZdLB
	m4jGuVJnfxSZFyQM9Kb8oBouIgJOw63RyIUE5dbA0h4ITGSInRancUvN78L8P6d43t1Jwg78h00
	CGoxxUbOQqvnDkP7JTPBsBDnEyVnVsMVsCsTy1ZAQSMWDIzM4dAIHuHeI5c9/JEr59NwRI6Ygh5
	tqfvjFXZQUL0Uu3mK5CJv1/mWp/8W8ViSg6YjMs105CGjA/hDOL3P6S7if9hGhrNcyFwSXFXmcb
	ZdvwrAuKbwo5qKq65AZJpD6oiX5ncp42SOj5bh9B96PZCx7890BNv1lDfozOdHw4efdL61T79FM
	r6wYc9OIUujUGS+vwdkoBBy+EQ7fw3SJ0iohTugLhL/xtpfoJwsYG3H0S8yEwBfEMdgzuVX8kSV
	eUxwKIPLNYTMFQokj1FQ52bEz8hMuYhAy7lFNvwMz4JpBavnznc8O80W84pAWtbMoFCB0xPkGiC
	Bq9vsicafs0MPTPUAb7EJgFd85nTcyLO+cv9EXr+TNDzk54bQ/hxlTmZJ/1XJDn/tlqwX8pbwIj
	RiSr7AoAfzwWlJoK0XaU9Hrm6HJC2Z9i7T0miEdrBjkgEGtOpiiebfOjtOXIHvgIm5Juslho1u0
	J3s9TerYa0z7wzbinuhitg1zMKLzuNFwsqFfR+EgE7wrqg5FTqJs3BML/tYaMWQvfcIKel7hjZa
	20L4DRBVk5d+AD3L2RPQ==
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr28871365e9.22.1795134375399;
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 24/24] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 20 Nov 2026 00:25:34 +0000
Message-ID: <20261120002549.1908299-25-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index d62f0cccf13d..5af8bc1a4dce 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -103,13 +103,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.56.1

