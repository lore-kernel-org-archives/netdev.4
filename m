Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134372;
	b=dcfms5j/eYjO7wjKhJA1/21m/o9FakNDYW2uoUxfkbIeBkpNLrhkCBEAsYjJ59M9qfZA
	 QhXD/eaBT+jWmKKMcx+bFPWbujHyQT7H1hR2EPxR8oBpvzjmawXKSS3cWkosZjkwQuHTU
	 gkj/9DQZtGXrTDjzrq66IlZBYZw3jbPlgoWqSzyS5AvJdf/vyYbE0SqGBtAZi1eM/xQep
	 /5L+QYcZnVuwEoSoobmJXYV8uu+jhVxj3Kv8uoevS2yz5IRI4W6c56Uwr/yEHkSQpv3i1
	 Bv0pHM+1GDrkX9igtb5Hs9ZOCfxI89TCTktFqyXP9NBTnlTb9kEFual/U2xLatzU49w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
	b=hwPeRt2DQI22gCfLucQO8UqSSW0xhRJQYtf0Hcx5SxRmLpgxr6PU30OvtOLXa2uoq37q
	 /uJ7SGy9vBLPsO1omAm4zkDFyLTZCsSJjAfAPWpqHRZGU+lH9DCy3JWVsyBLmEtj0fBxU
	 h0Yrma7cN3sbbeBvKCcG2HzvklcnSURgOO1gFap1kaR4Z7BPuHi8Vl4Jw5vFjQpFEnK7z
	 9AxA/u1j0E69Auq2T2WAslB9RDRL4QX3dnKp6nOlA5t9985GdPehx6k6RbYIsun2zyHtu
	 TYE94OopmNARzn1wVW5BM5q5vkYewoGqac3KMhv+ue/dYWWB9jDhsAsLComhI2SFQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GiZW4/dA";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3A60A261E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F3A60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GiZW4/dA
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso1756885e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134370; x=1795739170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=GiZW4/dAH9BIl7CvYo9gwvJdIS5Wdn//a2nc1Gq5CnnI35dO7CSUUEVDmikHc4mio4
         9uyKwKkDpA8KHzowUCfRFBGuJbfkbqXNZ7V1KF8aqy7CyjmTGahrsxWhIO1fD3XCPiTu
         wjlDAanNYCT3voftYyUuJfNXhhZOvEGVa3uCQ3tWD1ZvF1tU/FPuUuhVB2G2/ShAm27I
         wRJOe7hGgvauz08SfLaSIvtTRJLDSVw9pH5CL0bG41vVPWVVw5ugGOi8HGUzoDXKUg/f
         AY5YfIRkanNgSemfmg1XjmR2F76cR6dBrOaT7ksAqgSoQVN5ciaZgBkAW+9ij3Q4IkzN
         87TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134370; x=1795739170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=I6x01AlRAwRbsx5ZC6ovXZ/wpQ90qpSFD3Sr+lGsK2rzR+kSThvo1O2nMCs9uGkWud
         q5LR8rxBxCyYzFU11tioG9IyBl2SG8Bu3A79woFiW0f2tyNWBMIj0xitTFLvChBFfepj
         YiwfDNIdIKjckBQ9rfTRUNA/mDYUE9nslYYZYVfeTIW09eYHbtDH8XHwLmVXYl2plWDh
         JkbFLoM6Qcgyk+jyQxU2IPz2yyYdZSFQfs2nSDiyaifXTI0D/XdpBsMY6Ot/IF7D4ZQQ
         nqWZd01bJxCFo//bGQF8JXL/bTxAqHbU7RfaXupluqMBoMCJ9XbGZZtX2GoCNkN0EOBT
         gLfA==
X-Forwarded-Encrypted: i=1; AL+hErGW5ruAZoQSj/G94EoIwesZqsvPJwCCDWcqtOjl7iSIQ6iOVvavphnL1g93Mk8uz+JKdEMFEdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WjxE+DEO8EXEYq3/jDsMqZkZduAR9LsPMzbxjQNCW/RQB4g6t
	sKy0TnkfNtTUtkctFgQSvsFDYs1DCb0zNnCRQZZNqjh+8ILxexQCsbTG
X-Gm-Gg: AYBFou11Iqk13ZeSxuBzqvQMMbIbnyxCy5JmxT69Rg44hwQUJY73pD0MUDp+mDcM9yJ
	FKninMSpzMkUaVHKLapLZVwlIZWom3ASsXzwLFQfobyET/+wWoxnx+EXNblWj4ALUx6pqmH4by3
	0rmbamU6Lqc6kMFoBhSSEo+SpexOX3qlj9fVYUiWGFV5Tl/7cK28C2FCqql+MT2kEqYZKoo0AMV
	ilcWdZ+J7sw4TAclQQVS1prefWpkc3ASFXHlj1iynnDu63yIRmYTL3R+6tpD2hzclrUMFj1jedP
	D1Djl3eVqj2rFPxMpwSQi+nsHcbFrbp5ArDEpKQE+KCiMTDjRdgR+6/o7gUbco5dkf9C4VjtGqF
	GSneJHHsirbCq0q0xT1CdTwMXHatMxqwzh43CEdFssjz9+iajAsgdQXm5603ZcEL/aijdmDcvEy
	Z7KDm8avJ+YFjzSczP5YMX/DH9kggp2v+2qYQzhJ1+n6ib2/pRg6GX170oCHnBVpIEhT3OZt1qX
	gE8qQtNqMlT7XTQ4Zdor2XZctMgUzgQQrr7geUXM3ULyn7Q0JZOYbiJnHQmr9JcmBdlp/DIBl0F
	+aTCaf81QEYEmXTnMc5q2dr9Lr4QV9Hs2I8rtmibGTPzt9H7/16Fd5ZQBKCW9ulNiSXjEdv/nBK
	s8OTzPbNIowtz3Z1umhjFA7lNmGQ/xt6iDdYWaU4T35ttLvoV2WkKiJGdJEmT2i4t4t86+QmB
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr23286075e9.5.1795134370234;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
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
Subject: [PATCH net-next v5 18/24] net: dsa: rzn1-a5psw: Get pattern matcher register offsets from OF data
Date: Fri, 20 Nov 2026 00:25:28 +0000
Message-ID: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RX pattern matcher registers are located at different offsets on
RZ/N1 and RZ/T2H/RZ/N2H. While RZ/N1 uses 0x3e80 for RXMATCH_CONFIG
and 0x3eb0 for PATTERN_CTRL, RZ/T2H and RZ/N2H use 0x3f00 and 0x3f40,
respectively.

Move the base offsets of both register arrays into struct a5psw_of_data
and use the correct values for each SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 ++++++++--
 drivers/net/dsa/rzn1_a5psw.h |  8 ++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9475e53752ce..6f3f902f9f4c 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -112,7 +112,9 @@ static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
 	if (enable)
 		rx_match |= A5PSW_RXMATCH_CONFIG_PATTERN(pattern);
 
-	a5psw_reg_rmw(a5psw, A5PSW_RXMATCH_CONFIG(port),
+	a5psw_reg_rmw(a5psw,
+		      A5PSW_RXMATCH_CONFIG(a5psw->of_data->rxmatch_config_base,
+					   port),
 		      A5PSW_RXMATCH_CONFIG_PATTERN(pattern), rx_match);
 }
 
@@ -953,7 +955,9 @@ static int a5psw_setup(struct dsa_switch *ds)
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
-	a5psw_reg_writel(a5psw, A5PSW_PATTERN_CTRL(A5PSW_PATTERN_MGMTFWD),
+	a5psw_reg_writel(a5psw,
+			 A5PSW_PATTERN_CTRL(a5psw->of_data->pattern_ctrl_base,
+					    A5PSW_PATTERN_MGMTFWD),
 			 A5PSW_PATTERN_CTRL_MGMTFWD);
 
 	/* Enable port tagging */
@@ -1348,6 +1352,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.npcs = 4,
 	.cpu_port = 4,
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
+	.rxmatch_config_base = 0x3e80,
+	.pattern_ctrl_base = 0x3eb0,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 942931cbc402..5c5f5ec25774 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -74,10 +74,10 @@
 #define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
 #define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
-#define A5PSW_RXMATCH_CONFIG(port)	(0x3e80 + 4 * (port))
+#define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
 
-#define A5PSW_PATTERN_CTRL(p)		(0x3eb0 + 4  * (p))
+#define A5PSW_PATTERN_CTRL(base, p)	((base) + 4 * (p))
 #define A5PSW_PATTERN_CTRL_MGMTFWD	BIT(1)
 
 #define A5PSW_LK_CTRL		0x400
@@ -239,6 +239,8 @@ union lk_data {
  * @tag_proto: DSA tag protocol used by the switch
  * @management_port_fixed_frame_len: Fixed frame length for the management
  *   port to account for the HW issue.
+ * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
+ * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -246,6 +248,8 @@ struct a5psw_of_data {
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
 	unsigned int management_port_fixed_frame_len;
+	u16 rxmatch_config_base;
+	u16 pattern_ctrl_base;
 };
 
 /**
-- 
2.56.1

