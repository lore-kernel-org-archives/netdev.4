Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134373;
	b=CAO+cJYOqXA2oXMe9E3XxM3D3kXhDWpJmO5+2qBUWHncTOhPgI6QttNS2d+fZYi8a2N2
	 AlBDhQ6XjgyUhlUOjZ86L84U4QBk+vovF7LqGaCK9qW9en9FQ6Ev6bYtJewY1aQb9X3G5
	 g/Uno9oJ3hNKOk2JLYCxCRdD+ufW4xj/JTTMWnh/HJwj/x7L8q8gpxmWvDc0XqSS/kNCG
	 nig6MfSEv1gZi01lo0EK5oIlq8NSPbzeXbYX9puLovrAerjv+PDJ4mrnOjIPKT9+eJ/i9
	 bi8P5+8Zzi3jq2tQhxKsKTArqBhRYMHsjCGulzg6HPXj0UwTAO3Wz0BjeghUp59CmCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
	b=EEgTHhkVaG8jkuci+mCC9XX/feN0YTFXD2f7Wr7fk2ZhKTJPCpwFMJ8/D2WbYj2L2rNL
	 xvl0JrZkq9BNHCQVM8YOp+g3uggUxALhjPNnswS84a1e+r7qP/IntY/CNxOvWQYLbpz7O
	 CX8ll08NSQjO7bXWnX5wi8H86VabzXhmSK6sj3QIJ7qYJbchbERn7RiepWUmQclg0I4YD
	 E13YZlqoY4Bq0d6+i/JpEXtlT3sVxGReLy5NCzcBAsK9/udAPZvee8/Ok/VJz1CwtQ3aU
	 QvGuU0PM8vZnH8WJJxT/q5Bl8bJHwTlwzu9V4WRCmGqbG/952ze8ETIQmblfXD+lYcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7660A2605
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD7660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a357b1c649so124868f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134371; x=1795739171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=cMLRrTNsnReXz0DEhroH2bdIjvqagWBw0Ch+yalf3RR0zlVdoti6aXH2VG3S9xxPXB
         fCyd1oGWWWfH6aBxYQAD857pBxWufXZ1W+fzwg1ECsaL/DcxSUq06ugBXdqvuLiP/gU2
         LvBrgkKKIuZBYodcDNzgJSZwVjoVgo21HZCQwlMZgjmyKiwgEQ1cTT1lv8pU3Qeka20M
         avoJQB4VqyBDajRoZVJVcOlgrlqxGo9DafhuRJCGoyN9ftvlNasGf6JgjqDNMM61J8PQ
         jeRHQBlAarqPzbJtEqnH3t0wAMfDF3hVEkaFkyE2mFHvEvuZ5qdzDmRwVYPt4o9oafo1
         enkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134371; x=1795739171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=IF+q63TkOA1ywVH/vEMOK+BB7s8epG9MACQaQt0wTrrgSLTUWknDZs6s4ieuOVlBSP
         tLMULSIJJC5zjfxq/WrjNpthJo1Jlev+nIHj5bXhZHTqAF8/E7npAGG6F7j4MmClNGTG
         g4cY8q8vJvqbsxMcWWhW61Y01LNOSe0k2NOEiUA+4FRkSv8knSFBY8yFsnp/du+ozKZU
         hnNYHMhueNj64N93FJcTCY0QJMnRyp4mTaPxwlkWKwMDws5dvk5MzZqCJyIT2L+ubDSI
         tRxqODK/wH21KVrayPfNh3tIpOgUfd1RJy6aRgxqn8ZZsv2trarfWBuKDfbQAMchrx3Y
         GY4g==
X-Forwarded-Encrypted: i=1; AL+hErH0ynxTH0ZRKf+U+HxTAdtrcTamYv9LBJca9rXgsRSFMDY8JV8sz/xgx7YQkCwkJocNDY4gYTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88t8qez1lf33D5jYzttEVX2vHobUx7yiO/0hYT6R+TEQEa+W6Z
	vIUNxWPAeO1pewMc9wqySeBXBleaF1ce0JgCc7l4hRaHHqH6NZsRoW/E
X-Gm-Gg: AZFdTZewq0EWAKOFq/SQelPKW+QtH9QD44qYj1dYosRvaVCAWaCEf0HK+PryhkJn9Fs
	qxnusI9bYleGXmKYMTPy9oCnB6C9Cjdf3M0Bh8h4l0YwHV8P/JNXpfUya5IjeKmYF/v4dwG/acu
	RdcrXDxg1a+b3gy2KnvvbmmjMI5CLTjeAknLZhOxxOqe7u9PQ20VSLuj0ATy6kenR3+A+nxhfY6
	reP+L0GQA+ft10T4wy8zG6w+ojXjwU2TEnBtqB2DtH0H6UmbCYG4V+UM5oltRtL2gBqfm7hVuDY
	7eEB9Vh0Cg2aTvJQ2vnQCCqUOx0c9Dg4sI+IFIGE7xysbHKe18NrANkLOUST2v0BTkktkIebEIf
	hRQeZHVC9l2+ty5qHBnOCQyMRFkMgyjNHbhqQJrIzf3G9OFKFpiyddR3nJZvXwXPzJ9lVeVbV5b
	2sgDR5tshHwVM6wkFj4NBFjC7alJyDNuxu3WVg3iEva6jkaaP4BdiH14/V3oM6W1q99g/voS3Eb
	juJSrsyktQ4It5FepHxon3PVkoKIeHmbSv3DsohH61AINicBo9Jz4BCc2ryLCSek6TAXY+bQNg4
	6SOSJENeyCR4G0YbCX/pl+llSylatOlKeA7D4hRm5fFWAyhDKx8KsE4KlwLEpdFDeFrF8hbPdnJ
	yzcQqUIZXlwcmdFehvQ28q/pAsFgJIHP8hUBmrjrruR58xRPv7kn+1DXminv7xYR4CMW8IIfN
X-Received: by 2002:a05:6000:981:b0:490:369b:f50e with SMTP id ffacd0b85a97d-4abaf7402b4mr1962291f8f.19.1795134370985;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
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
Subject: [PATCH net-next v5 19/24] net: dsa: rzn1-a5psw: Get VLAN_RES field layout from OF data
Date: Fri, 20 Nov 2026 00:25:29 +0000
Message-ID: <20261120002549.1908299-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VLAN_RES field layout differs between RZ/N1 and RZ/T2H/RZ/N2H.
RZ/N1 uses PORTMASK[4:0] and VLANID[16:5], whereas RZ/T2H and
RZ/N2H use PORTMASK[3:0] and VLANID[15:4] to accommodate their
four-port configuration.

Move the VLANID and PORTMASK field masks into struct a5psw_of_data
and use field_get() and field_prep() to access the respective fields.

Populate the OF data with the existing RZ/N1 field layout, allowing
SoC-specific layouts to be provided when adding support for RZ/T2H
and RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 9 ++++++---
 drivers/net/dsa/rzn1_a5psw.h | 6 ++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 6f3f902f9f4c..7e9bc252d92a 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -691,7 +691,7 @@ static int a5psw_find_vlan_entry(struct a5psw *a5psw, u16 vid)
 	/* Find vlan for this port */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (FIELD_GET(A5PSW_VLAN_RES_VLANID, vlan_res) == vid)
+		if (field_get(a5psw->of_data->vlan_res_vlanid, vlan_res) == vid)
 			return i;
 	}
 
@@ -706,8 +706,9 @@ static int a5psw_new_vlan_res_entry(struct a5psw *a5psw, u16 newvid)
 	/* Find a free VLAN entry */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (!(FIELD_GET(A5PSW_VLAN_RES_PORTMASK, vlan_res))) {
-			vlan_res = FIELD_PREP(A5PSW_VLAN_RES_VLANID, newvid);
+		if (!field_get(a5psw->of_data->vlan_res_portmask, vlan_res)) {
+			vlan_res = field_prep(a5psw->of_data->vlan_res_vlanid,
+					      newvid);
 			a5psw_reg_writel(a5psw, A5PSW_VLAN_RES(i), vlan_res);
 			return i;
 		}
@@ -1354,6 +1355,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 	.rxmatch_config_base = 0x3e80,
 	.pattern_ctrl_base = 0x3eb0,
+	.vlan_res_vlanid = GENMASK(16, 5),
+	.vlan_res_portmask = GENMASK(4, 0),
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 5c5f5ec25774..29d205e2331d 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -71,8 +71,6 @@
 #define A5PSW_VLAN_RES_WR_PORTMASK	BIT(30)
 #define A5PSW_VLAN_RES_WR_TAGMASK	BIT(29)
 #define A5PSW_VLAN_RES_RD_TAGMASK	BIT(28)
-#define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
-#define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
 #define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
@@ -241,6 +239,8 @@ union lk_data {
  *   port to account for the HW issue.
  * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
  * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
+ * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
+ * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -250,6 +250,8 @@ struct a5psw_of_data {
 	unsigned int management_port_fixed_frame_len;
 	u16 rxmatch_config_base;
 	u16 pattern_ctrl_base;
+	u32 vlan_res_vlanid;
+	u32 vlan_res_portmask;
 };
 
 /**
-- 
2.56.1

