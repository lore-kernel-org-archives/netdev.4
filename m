Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134359;
	b=DPEJyezMM+b4eNagqMStXGWKgwhHMEzmCft1FFucNn41agExzV61yqAEeqfIciXrtbiR
	 +XaFXERS6O/8PDzC6D4rdXLxdI19wgJEtDwqp4B1RiwYER5/Ur9p6PzqWLux8GUOIPC+i
	 fFyt2fiBoom/mBz4aEnKeLMWd8t4EZlcQtgMBRr2/MygW28ZT+iLGUDaDxH8/klB8zlQN
	 MqF0Is8aKtf6qPNSW92ETFpFlnO7WyuKDn9T6dqhT6YssPsJmAG8BVjfFMW/TZ/cZ0pMI
	 lxlvk8ZLOUiK8dpNIiqdOwUbC6pzZSwP8c0bKxrSoQYlFlb1Cux12X7qNf0bOV+IwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
	b=r5cCiAIhtbunarLWsX82FXXOo55UUPZBa7przebqVoeXVK+sOFrmLweNnl4iNcOBBpQ3
	 BC/LG+/gRvC4CjcET1hDs7wBdAL3+8YEM36AGCWufKrtdUQabuSN+RgMbXrazQuZG9zAG
	 N+xpA1scPDrZ+YQDJ7mPwub6kucx4YoueD4zlusPNOyN1F/3lFT3erS6SPZOM8YsWnGOG
	 Np5yWyRddFpS9McAJlQk0Rxsr3C++7maYeL8q8876vjQ9A1yvj+VWYbE2HWAluy9d3DSV
	 DIcVtPVBokDWQRdYsH0aHdfF4lUzyH+xQxciqG44RzMB6PnlVXE2ok4e+r6JjyfFehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1F60A2610
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE1F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a358881793so138880f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=NKkJgngYss6DYT4q4I6bM1MtlHUzzx9l6XZ3zQDqP0oho2qx0uW5dK3GaT54tOfsPh
         v1fo+sho9zx0KUYC4dnTgUSp0gSaUpI6HV0oTJTcR76Mg7FK9htJ47bXigpqFzoIyMnm
         W3ot7fO3A5hENnQSE9PNGvM4/7J9MLCD5dC9GfdJYx+mtRExOIyAvS1lXb6ivBmalBUD
         npecZ7yn8Q1DUDdZph0tz3giECEaxC5WKsrC3UTXl//ikG0epOYHS1dQYVDxaYGnSeGX
         XQiuYOBB5ChFnt2FOjEnFYzNZUBP+ZUU4n+zAgfe72f1Lsbg0tutadfQ9V7PzlIadwN8
         ze0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=C5Q4RJYlmr0CLjzyFdI9hRiQvHBsfclSLVy4MLo5MXb+hKlEzGHCm35jnsu9SspFYm
         PLc8fTqwQ+Q1YewA3g3Xz2S1HK7BIvK7y5ber4lKkRV8Gm6ol+u0+gEeIiGDnxZp7e5a
         1meO9827jSLUJhwkAR0bMsL7LlvXMyupT53CrsMMqPqTxak/SHOXMlKfDgkJqPVNYAoM
         YnOI6eKCkULW1SZyD/Fgm/Ux6AdUuwqAF1SHVlQrfdRsPIwhxdcqXPzfJnLY/wo5R+pW
         v4A2kjpPcMLEZFfXYeFnzONJ1dOQuDCDazm2Sx/kE0Uq9EabEU/869EmE2wrPDjWKa20
         UoyQ==
X-Forwarded-Encrypted: i=1; AL+hErGMWP037vphhaimmuppLf5SWfBSh+jGUjpWkituM28kLe7xr24+JOUiKkFFQGnrA+EjqhGnn+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z83c1Cvxbfd6vVUxj8xMeBjNd79vi4ubdKufLQZiu2GLYYSZkhk
	gm9HuRjpcpBDyPuRjBxKSKTH3OovB7bUU5yhqXqDdt/unuHVgHm9lhS4
X-Gm-Gg: AZFdTZexAPOKJxE2R/UI5pWQNBA51HanmXgFzF1evq7nWRcUqJOeeuKCc62ZBoBmohX
	c4YDtkRBj+HM66AFulFnpf/wdGL+1zJC8CgLhwRbbpsNtJBc7QOlLwOmI5MhF9dQ9EPr11jGe5F
	ZkELNyBoxrrQOIsfYywFH+Qse4HozmjO5zYTTln014kJXifz6Jjinftok4Ae/GeEMZijoiphTTs
	MBoQCA9OW2iZh4MlPD06CD3AyuqK4/cERd+cNm6pzoRg5M7XncNo/EFKQ3pz2FtZtdLVcxTIxwO
	58cDxGXzqx+EVhs83RJFm03Tz9wm3piuVwhO85x5+WhPniTz8WsoFh8Bs6E48z8CU0DAH4/JtBa
	qIdbEhUEVAOHuK1YKsPgx61gJiaB8P8lO/meQ1gJ/Ef8MD86u1KXrQ66kAG5q7peNCOh33jDThD
	Nb6qOxO/opk/0tupzAek8sCrXKCSv8+RcFsMGzloCCugSMSGhwGtONNv9gQccoInNZCBkOubjxk
	TkhwBQ4Jj5X4uP5I8cUkW4/+8gwFYN+iHaHNY6YDJuXqBZREgN3ftS7ChVCrI9ofJOAZzcugM+e
	B9ovdrqKzeqqXNDOMaUqvrzoJCj0h5RzB9KvLm6XWV6xo8X9YACO6+78duV8Dv8RLX+uOXsPlZr
	nn/hq9EELTL7O8vUZWHHNxwzne7h8N2ZhbFJ/AFz4uDsqQBj2sBLqKTR9hkkb0I5JeOFxJJ6u
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr2489161f8f.8.1795134356478;
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
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
Subject: [PATCH net-next v5 02/24] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
Date: Fri, 20 Nov 2026 00:25:12 +0000
Message-ID: <20261120002549.1908299-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a distinct DSA tag protocol for the RZ/T2H ETHSW to separate its
semantics from the RZ/N1 A5PSW, even though both use the same tagged
frame structure. The on wire layout is identical, but the ControlData
bit assignments differ between the two switch families.

The common tagged frame format is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The differences arise in the ControlData interpretation:

  ControlData field (bits):
    +---------+-----------------------------+
    | SoC     | Meaning                     |
    +---------+-----------------------------+
    | RZ/N1   | [0-3]: ingress port         |
    |         | [4-15]: reserved            |
    +---------+-----------------------------+
    | RZ/T2H  | [0-3]: ingress port         |
    |         | [4]: timestamp timer select |
    |         | [5]: reserved               |
    |         | [6]: RED period indicator   |
    |         | [7-15]: reserved            |
    +---------+-----------------------------+

Because these semantics diverge, register a new
DSA_TAG_PROTO_RZT2H_ETHSW protocol and corresponding tag driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Rebased on next so DSA_TAG_PROTO_RZT2H_ETHSW_VALUE is updated

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 include/net/dsa.h             |  2 ++
 include/uapi/linux/if_ether.h |  2 +-
 net/dsa/tag_rzn1_a5psw.c      | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 09f3043d57f0..a81fe7ae4d18 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -63,6 +63,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
 #define DSA_TAG_PROTO_LAN9645X_VALUE		37
+#define DSA_TAG_PROTO_RZT2H_ETHSW_VALUE		38
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -103,6 +104,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
 	DSA_TAG_PROTO_LAN9645X		= DSA_TAG_PROTO_LAN9645X_VALUE,
+	DSA_TAG_PROTO_RZT2H_ETHSW	= DSA_TAG_PROTO_RZT2H_ETHSW_VALUE,
 };
 
 struct dsa_switch;
diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index 1ffac52c39df..9fd25c5d96c9 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -121,7 +121,7 @@
 #define ETH_P_YT921X	0x9988		/* Motorcomm YT921x DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
-#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
+#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW/ETHSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index aab0ec143c77..3dff661fa58c 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -23,6 +23,7 @@
  */
 
 #define A5PSW_NAME			"a5psw"
+#define ETHSW_NAME			"ethsw"
 
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
@@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.rcv	= a5psw_tag_rcv,
 	.needed_headroom = A5PSW_TAG_LEN,
 };
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
+DSA_TAG_DRIVER(a5psw_netdev_ops);
+
+static const struct dsa_device_ops ethsw_netdev_ops = {
+	.name	= ETHSW_NAME,
+	.proto	= DSA_TAG_PROTO_RZT2H_ETHSW,
+	.xmit	= a5psw_tag_xmit,
+	.rcv	= a5psw_tag_rcv,
+	.needed_headroom = A5PSW_TAG_LEN,
+};
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZT2H_ETHSW, ETHSW_NAME);
+DSA_TAG_DRIVER(ethsw_netdev_ops);
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] = {
+	&DSA_TAG_DRIVER_NAME(a5psw_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(ethsw_netdev_ops),
+};
+module_dsa_tag_drivers(dsa_tag_driver_array);
 
 MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
-module_dsa_tag_driver(a5psw_netdev_ops);
-- 
2.56.1

