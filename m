Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846887;
	b=NB/xfWB3JVHet1S82gzvDI+8U9UYFpw5Ym1zQz8ABvMBLUG9LRtmxLyGeyWvQr5iZHDy
	 sOS5xHkDTpHwMm1r+L7cfqkC1uL/mQjkfI8iFaTTW9b5eLfIgGv+up9GOyUcQokldWMLD
	 TgSO8xaAJjM8Y5MOMQhLdwxrG6fmSmnLxu7gAyrS7TNznis0IysvSYmYdCaIPRNu9fj8F
	 W8ipQCUQAu/Ih7DRkBTRtp3R4bgxy3sm00s+ejayxdQUyeU5YcQYpElAv41uxgJbEq0b0
	 02kfI0aKv+13yPEjfTVy1RVs5YZGqxhDCknGvdtl7j5YAgUAG8iCNAfiwy/JQi3+gTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=FzlaJklcV4rPueIQLj9qgLCWYKkKWJ/Es2kw/Jk/SpQpqFM/G3c2tJiDYiiszFOdu9RE
	 rbB7IR176hjWUTuQRE+r6cWTFhAOjaT1VnhzdmWQgt8wed9uTigAUVkDTsIw9084gApdg
	 Pi7KJuGGJ5tekavacdlVEu7aByeyXaKmxgeArrvhsK8cYBN/7l9uDMCmjz9vODEl2aBJe
	 1QcQI4kNRptxlNZ3Qukyovqi4pa+GOAgWkrrEDRKUXtikpvBs2xAGKoUD9B1k4ezzY7RT
	 BSJ+2JNARooByYGXpaMKS7M9kMJHZbe7+cKVNka5euJ2SeYsd5Z1+Ps5UrFy428LIQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874760A380E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9874760A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso219039f8f.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=SBGFb2rsyAC9jD3tKgIN4fbPBUpUflk3N+UsFIOl6hllQuxDBI974ZDeG4zfiA4m3D
         i+1u24Eixxy0zg4L3Ip6vxy3euaXCMj4p/hu0ibsgE7wNq4A9B2t38HnaCjuWBjublSo
         AgZZm7Ko3xEkofFiMYmKJ7W1wTaFPx3cJ3Hde6N8Q1lHwf0QF4YmjoTJx2qh7PcV3sFj
         j1iGRovqL9Q893jbcc2XadWmXvnWiaQbQfFljwjSBqieZ/Pm80eWAcoQIySi5pv+/g0Z
         PVJ6Kyq6k2aV5LLCGvYmP/czJeatXy13/S/cIQKYftUaX4GpEStdHCfNLIGYjObx6tOj
         +t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=hoqmGcI/UHvThtchM96Nn29awxmR4igdRDMc25K+9gxvSPmV6VNy+Hyw+Mju2u4ako
         i2cdgDauJTmn/Xe08zV3hkQi2u18YHIY63jVNnC0nGNJmMGNje1nh1a5+C8y3GQL35oS
         IDafSlHt4xXqu/ZSuNcHSz8WAQTGHllge5NNm7oRWquiSbJkJocZjWUcMIDknyXjwTJF
         4Ha4T/yla+BoisgoU1Yo5Frgr4N0+HcTFOARUZPIJ9DlxoLDVEPNYmS1mD+IbNVFMWD8
         IPSle+eM6o222GlsvKF0ELtIZYTAmRF/GntpkWiIgc/w1pC0a52RvCYdNWo6oWpTTXaW
         V8bQ==
X-Forwarded-Encrypted: i=1; AL+hErGx/T32tu4uj//c/l3HYEaXyMQNIEYdxIW2njTkseTPyC7xEckbPvJP4cEGiBLU4E+1JL9E/zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G+MI16uCVawAkhLqSdN5j907UaDYS/GGQvql3HqlDXBbaIzNa
	Pa8U9z6VmdpjXfMmvWWUJYthzZCpKQaMJKePERMG64Q88UIxwS4SM7ai
X-Gm-Gg: AZFdTZdFkq7CK0RuBtHweecaaKQn2YropkfDIWIneclyDnAuGxEOHShU8KEkNH9N6c4
	jUg+yRPVdLLhwYqlAWTnmzgNQv0+4dlYA7NKNGfp3/CFxQH8Eml28JK+FjzTHZ7JwRTsHzXRn4w
	xFgs9pnfD5GZ+17C7AcfByyGEnvcE2uj99qnEKv1Vxzdf0HSiYIkwkP/OLYrmvemcYtKGe9jExP
	S6yZf9XRDf4dp8Q0Z68YAhygCM2vvHHbiF8vgvcTYWAWGcSbSTbwT4pImFUvIjgJXapMLrML+44
	QTPW49uRgDKkARFUWoLAIOYB0IvYj1zbx4I48N9PCQzZHpwscIOkVIEFf3wjpXHI7/btHHOdwD+
	5UNWW/wNvDyJL7dk38iKjW/PYUXIJjDRrtokwzLO2pBrX1RvEmd2yzIzKvmcmPXFKJG1Z3IQFZo
	howCD3l0N2Vd5CxCvNtrMcFHHG1OW0pP13JEjA9+mnimPqVDgq20u7e1mBMKVfRUAKUUKpkAYnI
	tLMhZU5q02BySD4Vb2cQ1m0lzqRnq+ZwuVjeGu+08DEBvnoSke2AMxAx9ePv3JJ1eL2c7Lp2nG8
	oAKVA15lDTdADb2vch9khkvD1wMpNQEl/HPNWNU95niErtN1ovL2OFF3JJoyfdPu0WOID2nG1kY
	VS1Sn2y7YLha2Kl7Yjy3KE9/1bgwPaQcQIg==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

