Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134370;
	b=mDMAMvVd3EPCNIY3XCG6cIsKb/6W+cPKe50WE8Go8dtLf+XO0YxudlZSJxXJ1CjYuMel
	 j4KfkK6CTZh6p2exqF7MMog0459ZYhDS23LRgOOssU+wF1+XIW3R7HXHbrGEcqqUQGctL
	 ejz43qeC/50D9MNnqfzSAwOI1RFMUw0mBI4sdFKyad4Zx+I+AwHhU+xoDxAqA5VL4ZgiP
	 M1RhkD2Pa4zeDFDJZUYJu1q5bwRV2WM3oF/Hw+EuKBsoaK22gq+vf1KIDNxyHbpRNxp1Y
	 IpRduBg6HM+vkBM7gZM6nOn6ck83CquPzYeWJUOyyJRoJjMg1glbJ11p/QZ0hml238w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
	b=MWrk9Xl/V9yECMtgjpdd6BPrDkkT6uktGw3KcQuFiRg5gPGfImAKB8ed3i0xfPYWintq
	 shYDUgVOTbd4NoAJtkys2gwjCKIQ5EnI2CeoZGfAz1DjCSfwe05AhGh4eMyg7FtW2m9CG
	 6JCtt95gfxUHNNfbmCRYemyjdD74nTjcsFyYpPhS3Cnp3+FXKzOmABB9aM/kmBXYju3y6
	 wyrpn8TJ75HMRuRuMa+J/M43F7Y8hkJFCt/aMqqvVcI2V/PIhx4DlgGuSnOYogWBjt8K2
	 TWRu6dQOtINdQJXTMA0RfZwbU9CTxqmW9ztlok133k6K1aAjnNVGl6fM2StqTG9/GrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F860A5BD7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2F860A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49a92144733so135621f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134369; x=1795739169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=Z0JoIYtVPDmE0A2ZiREqXrdoxZvq/jv8BTPl8NaAicVXaC4oaWIIfcq/LTKyqhMwqs
         VYEwwvJM0A75vnFvaE776F1TqEBZM0peUil4646fN8B/4HBg1MjcaXZHB7fxrLQQfv8Z
         heBTmSWHKACeKB7bQqs0m9DXupWRiMTfbmQj2qgzic0n9NOWDmPWl3I0GbvHTx4CcgLB
         /W3QJbTE264YEqBJl98oFIhuwCAAYcwRWXiXaohPJQJO+G5w+eT7j3AZKLcYSONytTK7
         VJxISqkTTt2ZF8h9xyVaLYOeWjJRb4NDjJJPbYPBoAzyuXeSZcA1mZsu4JSmI81T4Qiw
         Mwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134369; x=1795739169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=CqPiK04QEOLmsdaWltICKTpm2I5n9gMXIF0pBBcEaTJolSB18KcLym0YQ3qDFoRsMh
         7XkAcWzccesuB9SYkY5jkVjuKpCRYlsMYr4yWBfO+hQCQ6aPCubwFVRKxIqpvY7y6n61
         UUmjpTYGThz3TohqkTPyZN5n2PP/gmIiq8GzqqISlgOQMOwRwf/Ub0mx24OMH2CstK0v
         XhKOr248M4BcH3JJkB2NSEqLcWxrMQ9Um9wMlPgsUOzjCHETQtqpbYi0bnyLc35oAiCk
         jsAM9IdePLksBMJHxj1BTyeZCqQeYrd9+eIB+Fd8bCayAGIavu4ApSIsLEFg621pAcB3
         Z5QQ==
X-Forwarded-Encrypted: i=1; AL+hErE0rWTPmi8fKyUbgz7KLMz+Hf4vhzERaLcLvRXlA+3KlcjwoRqOgdWjdoNiSaMqTVy1ExLWHMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WkRHzMl2KX9EACQgVY+HAM3/CAM5GYhfBelhlZfJYvlVbMrQb
	JGx3D7+3P+bv4wunXtoJiiUZrnFlEQ1LmcQN7ODkwswxOoYOkDhu1mnn
X-Gm-Gg: AZFdTZc3CEeQ/jTtnSNFVYyfM2cfVNjVTCe7TDlTQwNY50dw14ZpVU1wWnFGeyIII4L
	6mUu3QNsPnqbSEAzNTDYrrsJdy6YXuaBpZ+/43LyvT7HfAOMiuesbhIJ74E/DtwV70KQDTYJVf4
	/b//jRqb1INZet24qc7pQOwT+W/8tH5DWFudfkzH34eCQPtDSKe5MNP8hzHxIzmsKW+1SMIoekL
	3IoklkzdL7ZP8tBd9CLi8NuewCWNLYYE5gglgTT5jNHszmF0CjmkPaV2Pv2YwACv8h2OPF6KENG
	O1UHzdOnX9TDE8fgxDrqVBbr6eMvinnsehDlYmIwpymmcXX1t6oyXtrGpWAD5f99gHJdL8A9BSL
	w4Dm/tGeRnyKKobFqJ3FzvOJkMIdNWI3GI6StaAjVazxwVfYFrTIp2VtscI6pbXJ9zDov5jiWoT
	nU/6qVp9+ilj+Lxmjaurm7rnnjtBQYGh3Uo4WUNWvgGSof/lP/hPXkFRDtZW5FRftqgi1WIxjlD
	hyufWAduojbsv7zcp7ZLLWnSQbiFpTe5HZkznDW7ffjeD8m2EXyj00CEUVpgc4WvEcl+4cDn4h5
	/eOkHdMVgS3CYB+3oMDHvEX31QJhyWSRx9iStYQ5SaPBx1xSysL1lkgVF5gGzQqNOAK9acsMPnt
	NnutE/2AFjZn7xwgmKrK5ceK8jFLs0Eo5svZSUVAgYFFixgXT4veplswBBPq/PAKebpJHD5Q5
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr2298190f8f.27.1795134368583;
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
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
Subject: [PATCH net-next v5 16/24] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Fri, 20 Nov 2026 00:25:26 +0000
Message-ID: <20261120002549.1908299-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
ControlData field differently, so the tag protocol cannot remain fixed.

The common tagged frame structure is:

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

The ControlData semantics diverge between the two switch families:

  +---------+----------------------------------------------+
  | SoC     | ControlData bits                             |
  +---------+----------------------------------------------+
  | RZ/N1   | [0-3]: ingress port                          |
  |         | [4-15]: reserved                             |
  +---------+----------------------------------------------+
  | RZ/T2H  | [0-3]: ingress port                          |
  |         | [4]: timestamp timer select                  |
  |         | [5]: reserved                                |
  |         | [6]: RED period indicator                    |
  |         | [7-15]: reserved                             |
  +---------+----------------------------------------------+

Because these differences affect protocol semantics, select the tag
format through compatible specific data. This allows the driver to
choose the appropriate tagging protocol for each SoC while preserving
the existing RZ/N1 behaviour.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 8d7cad90d613..c59d881ce10f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -99,7 +99,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1330,6 +1332,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 26d201931453..58690f5f3887 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,11 +236,13 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
+ * @tag_proto: DSA tag protocol used by the switch
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
+	enum dsa_tag_protocol tag_proto;
 };
 
 /**
-- 
2.56.1

