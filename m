Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653098;
	b=hbtegl6w+tzC7MAZspoPkerez7JYFor19yYgJSUpZn4/S9THAZpeOMfrLv1LbvLDrN7E
	 WEMVedI3Rke1567OoVFLfsQ0QSLauYBEE4U2a0JT0p8Q1jZEr1F/Yr9YqS9bHtSmKXJSK
	 XSL9jmKIslHTaTWBbS2n3vtU+cA4pmo0LXfim+RgpsrGuKYa+HD/D5kR9K2ApJrUrcpxH
	 lMlul67yKn5QdfjwC5hZ7MPFLILDI8P83EXiFAqFiwK49zRyEqm1sw4qeTNCHunGKC71z
	 wGEJUi2pe1jK/7hTxPGXf8icc7lNz+SwGrrHOE+/nC+xC7W2SNmLvTY8JPiyh6nKHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=k05Mg0Zwwgcb6xSjbYjZ/Wub9fEM7rElOjs3OTKAX8yaMxV/dBgft+K8J3bm4Ck6AgOc
	 ofj18C5Sxl5qZisfcoBiRK88xKmQ25fcBBGSqDpRJeEjlUihdAFjZ2jxvAHLw7NMDMkOn
	 fgLfU0yHMjGLSNtMWGSiTntgzoS5zJaNS3an7fvnnZZonQq9+WBSBeNEKKapxEGYWLDBo
	 eJnecswyYLHGumu1BC6pOthUB5MGQvz5WYJekfC8kPe19fG9bpIRtcRdseR//w9sF7o88
	 YbJE8fR4/N/+gZK8ceZ8MI/KzappjaLk+58247W9+jdwY6LzcLpjMEwLZqN+fHnJrFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6B606CE27
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD6B606CE27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11622185e9.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=Pntf8LZbqHpOVNNd/h1jSZzUejSxbTz5brbrkG3Tq+qe6YNq1BxEBY9d8GUioE+sSg
         Xw3DmSOCiVbkQPhvxxQ0o9r03NqpkIcU6OIFqUSdd0Mv1xrCQCygv9CfMdX/LI8iwqao
         sYht5dHs8vHj72C87rB6RlPbiYRxfZhlOYxN5P7EZzppWGI4wI69FXXpKTdJOS2pS+Sj
         7M3mSjyPHH48IdKyUCU6l879Fv43QlS23+qH2nLdwyLRuOD2hxZQsBX7lM2mpONYB3en
         m0AiIXxCvT5mi5zLPcCy03cIxq77yaHPFmnS3PBu+plfy7NXAyyC00Y9Nwb3r9NOQUSA
         VqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=QKKGOA05Ht5DXXpgI1ZT01yxycaezpoOkGZ+xA982axaj47sqQlJWglD+JUVHFiMiY
         Ub6ULiGLYhxpIcTXFdkGrnGfREsHXwu6ZxMR957MHuTiFz2KWmuZJXBbF9VasG4b7Nmv
         z2Rtcxf4s3Yu+voikVqFUyg2ek29Hce6n7/DWgUdB1I6/8GobDMl9kytp2Ih/MDp4TTL
         Pd1MBLbim5aGqLTyegZULOuOf1H37DmVSBN1H0nzehLjQPI4LhcTFUhqfpyETeLHfFDO
         SEP1eHuS3cbkD1xvkXJxwPKPyB071AlXWO/n+fv53n/Mu0MAl/cRfeLPia6qxsDhV9qs
         PFuQ==
X-Forwarded-Encrypted: i=1; AL+hErE+B4eY7YM46D4GrpMFQZ3XB4BSx+81zXlevfcXP/Nwgbls3oPe+bS8jj2ks5hHNppDbkvM54Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IzuME8OLTHrpKD0Y54GnGsw6Wdq//Q+9xh7aX/pXemncx7mxV
	hl6xETZ03L80qrH9hBdTrZY0IDHgDwqBPPtsCWMHqIx80SGtxM2qr3Nf
X-Gm-Gg: AYBFou2bUYkXlZaPj6kPqSXetuxhx/czZGy0Jyl4lk3GT1XeYVg0mM2vszkzQCvPYCd
	viUeQbWx9TEoXq980tsEQKgyKISdEKZPNdNT0RDkr1wnL0nGol+FRBHvBHEB00UT9i4i2eKUnE8
	Elnv+ErS9LdEfrQ6Ozxzq6Er8DuRu1ZPu6jRWZ6touq4dnNQRlvke4fgcEZWaBLTHPKgCz7iE11
	GfTlmZfKe1aXgebX18MXS+THjvWzliKO67yo76ccpTQIlPsTCo1BmV/BgdsFqIaqp5In+j4NMHL
	TEvdnMbgD/ZST9CJ/cCQXMtnrN1QrfCnbJq0mopPTMkzBmgjqMAuu+nx6RL0al40FaF7JXQPNVk
	aaCH7LM1nCTEKAD6rgCqar5HldrRCnZ8oWdBpShq0IhVGr54FOrel62rIZAySpdudeC6tudJuOC
	8Oe6QqNjOdXLp8yiCZctxuN3PR8ByEiOz9TfmPqK5alTUuGXVbDy1nyWLK7Wdu1vBqzVwRp2obu
	tvl3okNBl/bDyQ+hbAhMXv+/1a/qPiGsTj1dh/+ri0/X0Qllp/nFefKSXEMCLYLdVTxRYUqub3Y
	jlcR1F8EvYZZg6Jeh0Net2qZwBgPDo6FCWhj5TfvVdOrGKdV9hp1c/o/T35flGtkO637LgtrClC
	0TJPtZaz+sDr58nKA8iUiHdLzwT2hPzg9HQ==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
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
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
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

