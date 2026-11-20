Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134365;
	b=LTQQ78UYSYkeJfA6kUQCHfG//TLtpxDV6KPaprAbSUBNlce2vXDxh6lymkDO/QmfS9tX
	 vYSB+NxiOWpecdPh1CkCWOKr6znN8iTkIlmS6SyNnFg+nWbnpkFWS+nmTobZCcFJVdO7Y
	 eYoOdmSLzGD5ioqefM6EubBLucXVZFiA/kSeWmUiIF7KXNdHNEZPux16ynzJfxrX0xHhi
	 1gdRUVXU1tjCGqR4hepPuubnsonBAGdBeeCLIH/ehS3k/GSc8F+kYSFXg99reKn4j3VLA
	 xVKdV0dbwl9kzUrPJJKszofJaEL/tuiwVkqNx+qDSQQUw4ZF63bKa3Hg1SXM2EedW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
	b=MZfSp9TaJZVUm1vAvF+SUZBDD+R/3BMdzIpfJfVYfFUtBdnW3LeKMtA8/fxN/CQh+R2E
	 ktfbsWEKXaNmJ7759AboudTHwqVX42azhIuOBJxSPj5Z44xl8EPMWAWZoYcvrs2xVgPOQ
	 RjxBwMcPWzwiGVYiMYaVM1unVEm9IglleKFs88xUzHPX482ofmWkxWL3/Yoqn95stNSaA
	 oQ5y8Bc46FAAESMAQJdzmwDmIFoTmqTtMBbua+vx/W6EqHxixWUORGPQpq/4k5nwJ+qLv
	 KjHd0gcwhHVvmTG1QBIHS4KB3B8Ayvj1RFOs7WSyhjCklvX4DtzgUTaFLzFxMvFDoeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483460A3826
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9483460A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49d64a88222so984160f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134363; x=1795739163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=AsAePrb9EkRIpPCiAm33DMP9zvl2+uxn7OVNkOjp4Iq4VaZwO6/f/7msTwkTJSWEFP
         jeB7J3sDfEwjHTM65gRoKJfvpeeAhcYEo/cuHL9VISBt0l3x2iihGo2LUvZc+sx95DKz
         rgUwBCNMjgG2RdjozNyFtJM/lFmFdRcRB3iSztcmPc6TlU5Zh/UifZKwylp1GurBcKxH
         EP5GELp6s5ndln7VkX+QjY+6P0X8fdpBVnb3cwg31u1ssc3lzsCuCArEoUCrVHfEl30z
         aD1uYqoj6Lt7qqEyaH/OB55xh410uGlwDpbly1PSQV7P/fMtJ7ucu05u6/k83ltenaNp
         a83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134363; x=1795739163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=GtWp0jDVPL7PTx+0NUytIlqWeyvizbv9VdQzUYKGm5MCzVepI4onQTcmkvfrSBEbht
         EmB/vIZyiqM1Kd7/HxhVdNlXFdaNCAuZhYtA0SzJMhjmdsVE3S2GZk8x4l7FRhgCwTh4
         kz8J6uDQRZf2oT0l0kPu6kOJip62sBLjstZE1DtliS3ECzUezqkqAiffM9wiFW8vlXYc
         JPdIk+QpaZiLaeUaAd4/XyPM4qFR8zHX1gwvuA8a//HYGkXEW7PgSZIUa67e40bSsg4d
         sMSJ9IX9rLbe0fea5pWbvf2YfOyKnF/khHFXKRnPuhWrOYM5YeqF5BpzToDcmJoGoqL3
         0Ing==
X-Forwarded-Encrypted: i=1; AL+hErGYTWzMhd1Git6RaoFlBg8mlxp2lY1w6JnzBwldxD6gn6HPLlj5A1S0J+KLU9AnLwlFA2meiew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k1rM6aw/PlEykIwi4Sr7+mOAsB0RnMbEeBCyUR5nECwJ3fRqY
	uuXMSr5+3zNodPsN7F5gQ53bKjq961MkGwf56LHLnsKfvpIMEMo05ktV
X-Gm-Gg: AZFdTZdNEGEGZS4JrqoAL95wcQZS5NfwylLuLuvnSlueZrYTqGsTZCzMoCcnk+fJ0wP
	cuToDQigzVIGxZoh4DC3brCOjOd3baK6AkUEmB8ZuhFZiDF0KuoitbyXNB+87Dj9J85jYcpIX7A
	rR/nnWTnzMbo7mMcTOEzyp+fi+fgA0RGYWO9WscTKOXDuKmBVBKhyu+3HiVjOF/PIy63pv6moDi
	gEnxV2vHFgPqhSiyUMXHJ+agfU5wGa6EZP+4/Snih2AB/vXBFa60NUDdXYNYITzSmPkjJNlcQZg
	mZ4Lb6AZ9qEAv7/v89fKpT8RnjnjATVVvuF23PwmPbOWx7YC6ANMXCjVo+QzZuZfFA2MOMXOP+T
	mLTMaoWPRzvCpgpnfsyi7WTfzjrubbIkkpQjLsSaYbDA7pphG06eIaaf3mATkbxgU8C5K6P33QB
	swghC8TMTV9hrZdNN2BovfTYncdB94/Z6medQuC2qApI08i7/I1SLooxXZljMm2iU0rZrBSoz/6
	Nd1eKrreGTKUfcl7P7HJl0BZG8InOgW0dslyGna/lDFPPaQzj45zYpzbRJKgOMT0Zg521D5HZjk
	qIWz+vYflsu+QhN7X+GiTGHc16fSZks+dwJKtdIfOuRfoKUXog6SA3p78EFSbRzAoVTbfqpcCDn
	0mm7RWPInZ5iykSJBHPAnhUbhSYwQFZ16o6Ez6DLhx9LC27je/gQ01//DbMVVceknbE/D0C/L
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr2216640f8f.21.1795134362863;
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
Date: Fri, 20 Nov 2026 00:25:19 +0000
Message-ID: <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 hardware manual places the VLANTransmittedOK counter at
offset 0x8f4, not 0x8ec. Correct the register offset so the driver
reads the counter from the right location.

Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..9693f8503b0b 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -185,7 +185,7 @@
 #define A5PSW_etherStatsFragments		0x8E0
 
 #define A5PSW_VLANReceived			0x8E8
-#define A5PSW_VLANTransmitted			0x8EC
+#define A5PSW_VLANTransmitted			0x8F4
 
 #define A5PSW_aDeferred				0x910
 #define A5PSW_aMultipleCollisions		0x914
-- 
2.56.1

