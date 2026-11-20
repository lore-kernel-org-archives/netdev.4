Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134376;
	b=GapDX9apwXbZPJCjpkmlZckROkrRDJuUgZmGpDWtIt6QLr8jR82SiQPTUrbUaDgwXo4O
	 VaefoiOorf98l4vL5l2bUntxKH1smNlLv7OgtORoRpxPySaFxs9DYrMD15ZSdh4ZMla7q
	 SyCN6AfGsbabItVtuKVwzNcC9s+Kv26pY0H2qRzReGRlYDzTcZAN47H5D/2jw/s2z2LIb
	 E8tydZQQrMRJLawXzXaCZmqLz1AnApfu4yklu1blcZGBf8sbCO5ncaCPofADWmcq13eYT
	 yDTmu6vWfKIeNxSIm4eTUwjnFqBUqSUcIMOtPyZZcWpJE6G80tEx9QcuXr3enW2XvSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
	b=sUsV1RBHyaM17/RhzUrH/slQuThkb5WMFP10C018INhWcCe6LqvzzudQLvOME5cgIzia
	 RObpBIObiCbXmuHFuW8d0/yZkhz3FrxENq84syqJD0FnkeNLmtclwI/OdEFrmmEy2M425
	 FnMWD4rlSuRk8P7k6WOV5plweWOGfvAK9n3GvviV5+QExZdtrsNUUewm9lrlnPFTBGP6b
	 vsTAlE2J2U+kB00cwGRvd7Z5HWI09c9DD9mlvpLpUAnkOhCT6LJ85dL5IQN6loKa9tgbG
	 X9cKBIRZhlqA8izGa0FonUIjqJBLUW/ar8elVlUNVTPmd2B/3KlXe371fFz/LkCkucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22815606A94E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22815606A94E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so2469235e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134374; x=1795739174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=dtac5sXgErpAGOsIJ3nV+/Ki18CF/Vn6k6uPUkbnq68JDFdPaf2JC+StEQuEtoNmTU
         qXBzphnLagdky6qDTom6O2KOga51GIVfYwWmci7qRuGsX+pMfUYzKppaGl4ZWQvGOSb3
         s7yY+19y/FEp/fwfeVAP95YTucen64JK+wZE5b39avE17HFcQCE00BmO4i9kxT7ysE5D
         6fEL/w6PaHugkxugh1Aj92rGDYgSAclfIxQt9umuBdf57RQuW7mgG8QlvCVZsOKrR4+E
         AYa5dYFrNt8q+9QrRU7TRbDAqPn5lGrmuHL33XcOEX7rPR93p2Fnj326DiB0VeSEyg+P
         05Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134374; x=1795739174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=OIjoGaVJh05si3lr9YONOu8F+Nr56Wxy2SVySjY7qqCZKfcv2gVnaHteOug6Gdz4UU
         LpHhPFPDlNFOW0pe/8Jp+eFgR/twesRW9iBBMkCAtpLpwmZKTTZNV4wwykVhKi1sYkhY
         cae8mTAFjapylRrI1J7kd/t6L7OYwiwnW/dYEnA6OIJ3RgfZeVfn8eO8G0uvt4XTBZYw
         Dm0Ffc3sCZ+Zt5KrjukgPMI3mRbM4QW8pEz9/59VLF/z/XVhjO5YxktQ5dDoIocuCbLY
         9dXmetBcLd8gLqXO/dDIFPgwn+hyRwrYg0EPbY87g7yxXxVIOW3S8Q3/QhqRbmpqKLSt
         LFsw==
X-Forwarded-Encrypted: i=1; AL+hErHiVhWgJE86UlyP0yfeHcvha3XkCemMfgd32kwegNqXCA87MrdKtaFSh6WoFFQ/pbsY9Sgieos=@vger.kernel.org
X-Gm-Message-State: APuU4Z86FUqw8yOQ8BwfANP2jrs6u2ku+IYIjGYYy9Y+fVPFG6KxfMJC
	NCwTR1QjaOFMqHzcoNaDry0TxZWaBar9K0AHS3rA6eMUBAHCPneywQA/
X-Gm-Gg: AYBFou1EtQq2f+1bmnobzsyY37Ra/OLBX1QjQpluJU5fU7kBXEFSMtGnYtCbUOibi19
	YQSsLTIiCBbArFXKzbC+OXAZfIVEVTI+Tv1yrmPXJ+6fj4jeWuHvQGixOl4CORsRI3q6M6+owAh
	SFP1e3pqWDUcmhF4hvi0IsEzo3dsHrIWFGLSRK1y6qzbc9sEu5D1Gpy+7U8cZ3sZ+58GnzgkV07
	kBGUWl2aaIfpuDLxIUREppMqlCZEV7YYBaC+lts/IA7uyEc1PbpEhj2VQQNJ2RSiNcIt4UiZyVa
	6evojeQHkHMg6q+4lFMm8xokdyNaqP2nBYGHbrfTZZnX2j1jnRAgdJ7NjgCTi8AZ/x9bvlegGKY
	lFyD+II5ozJmVmW4J2HkNyI9V7Rz3jOeRElovA4ZZK+gJlgVy9yRN9u0YT0oDgMMTAvpR0CR776
	yGZjDDMCFwqZXdsZvRRS1VDxm4pRHhiNUxYOlSbGRKEzWZc8lgUYARNp/wvnp1d2v/gPIybi1IP
	0TI6J2y9B5lhihrIfjUOXkwAts1rh1VJA6O/we+zX3SEqlXxLBy+9taVfW3DgkkQfEq5rt1A4ma
	5oFEMXM6YbvrNZNbcacP6MW/lBYcu+cyCqdkGrxIABb2MvzWl9BQ/ALulL0Fj+So+4YxUHiI/EY
	yYbqJscSJgmHUl8xi2Ib6U56jH8UWwzZPcrhVsKX7TycRA2Nr5/O09X+nSoso44NJL86+HzwwcW
	+rgR2aZx+XSXE0i9wWjQ==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr25360005e9.19.1795134374446;
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
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
Subject: [PATCH net-next v5 23/24] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Fri, 20 Nov 2026 00:25:33 +0000
Message-ID: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add OF match data for the Ethernet switch (ETHSW) found on the Renesas
RZ/T2H SoC. The ETHSW is based on the same A5PSW IP as the RZ/N1, but
has a different port configuration and register layout.

Configure the driver for the RZ/T2H variant with:
- 4 ports (3 external and 1 management), with the management port
  at port 3.
- DSA_TAG_PROTO_RZT2H_ETHSW tagging protocol.
- A fixed management port frame length of 0x3fff.
- Pattern matcher register offsets of 0x3f00 and 0x3f40.
- VLAN_RES fields using VLANID[15:4] and PORTMASK[3:0].
- 4096 lookup table entries.
- The odd MDIO clock divider formula.

Add the renesas,r9a09g077-ethsw compatible string to the OF match
table. The RZ/N2H SoC uses this compatible as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Updated rzt2h_of_data to match the RZ/T2H hardware configuration

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 86d5b9d52f8d..2b69e92e1853 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1411,6 +1411,20 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+	.rxmatch_config_base = 0x3f00,
+	.pattern_ctrl_base = 0x3f40,
+	.vlan_res_vlanid = GENMASK(15, 4),
+	.vlan_res_portmask = GENMASK(3, 0),
+	.lk_table_entries = 4096,
+	.keep_mac_tx_enabled = true,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1424,6 +1438,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.1

