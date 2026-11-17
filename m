Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919233;
	b=N2DwGS8LhH2cPY35oqgdLOYsuOVHACMNeE5p5WdBruFy7PLVu/i9xHq5BHaQsOuMfg8B
	 D86Cl/sHplRWuNh7sWihBEFkJAHvb5xLoM0mVv6NqWbEATFRvq3BLnUHaqIQD1ERq9YkI
	 1rDnivKe8zOWUQw4ufPx6FiuM9vdI3rUmGyhYxWB8x49N80YltNASrAtEh6KwUY8mtl48
	 Ztff03xce+shuqJPnvxRJVe0lq0SaeOXAij6aCbMeVYDujWG7QK2bHz3pDFH1xpyiAVvR
	 CFXzNbgtbcWeHVfVvWjPYnrroH9YyAuXGLX+kYQBkHDYwIF20Y0Er1cGnHmWoLD9LbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
	b=UOsHy48NjYA5/B4FUgxrzdC20H5Mq1rvz75B2IZwDELb7QOJFtq3aluhVYHUwDxwAWgF
	 kFY2Z9BG/70BhCtxCyXPIyE2iH235/Gw0xkQGRoNhM6eCAQS24Y1KMDZsvU9WOB2C4TVX
	 iqv9VC/7E+v9gwzr45lTLpPLKwSEIS8dNFo6f7F8FqdfNm9KdSodtIrDvW7oFaaUPa2C9
	 3BOuOpoDMfgBpT803Q05s/lXpHEFSP1HtoG4XWuZZ5VZJnRxbnDE66SwfjhvbSOod36Ck
	 B7JUDh0YiuvvUPxqQ/ld3A3Dw3jJ+iC7AuNS2qm6wJ+MuH3yqz3tW7l13qM1/9gL8kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6160A2628
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B6160A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so45580715e9.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=Mcxx8hubRiGTRxjKYFnIkSuk8Qjz/YepIITSFGaoBDnrueKoUwvb8bdQqSsWdDqO3h
         BYpDduC83/yUmYurELWKjjcNFuGygXph2KnOvlDVfsBYn1M3MY9XvMwrK9t0VODnpKFD
         XDW8keofNMMQTFt7ouJLEpcVUo/Dekwl1zqziqcTClZx7PQfmee5tqf6qT/FYkes8AkR
         l9U4HJTr1EhobnWrmYO3tR3sX1/DUDOn4GQFU0iywt+BSGJHutOaPMFVu4lwRCJeSSnE
         OkurMitNrpvSdhNi0YbJzKCgPeRB7OcsWb2WHPrQxoZdJc2NM6T8aLWi879t8sFhFl/M
         Sx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=Vy11fVTlC6QG7s+GIDH2Lj1VjVH++z8n64+tJjGYTmeVNr9FJDnuaIKzLWB9tBpXj6
         J59VJodxnIHVEAAlygoNCP4dIhSbXzwdXcnqNILvcye/iX9vg1EaH43v/NXgo6MngyyK
         q5o0o9oCzqrYw75pfR/0k3mYra07Mi+TRGhw4bcHaDMZVd8OdUTelMUoOvn/zHRT0YwP
         elXkHHLNWxJoSrQDuQJ1XgQxAPuf9YbRZMz9peQjhNsS9ITFcr3OBBlZ5KZ4UDdawsrR
         yjgU47rD3Hv58QRtsF53p7ftloKsgh3AuUlLr3/+TdxcJRo/vWr5RWl8eqMBv52gyGWl
         dMMg==
X-Forwarded-Encrypted: i=1; AL+hErF1fkGgtYZwsWgfYVf8+ft1+Wj/ru6TeK1w3yNf3g93c61yhQb/F1ZDto8HAnp8QLHeg+O/rjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+zzTjveNPavsLIbhFGxqWlPFZ2iUMaypfeHrum/bo1/+4WEg5
	/Q/hcIkq1+LrhbMxXrsgGaEQWV/72NCnq4GGNFGm8jnKzQPmrUdA7/fU
X-Gm-Gg: AYBFou14GIXuMiIDGu2UeeiYsLk4jyPSe2yiizFR8h7cLjaTyRXnvC8n+aA+aZRTCWy
	fnr/RuqAxayRJFsFghBa58fE0aLBPf6BLiO1V064WtzAMnN9RJifanLRiEvXxmFb9XLMEyYDeeL
	4ciyyLxWDpQOizDdyWUI6kFRLdB3ouKz82FpopyF/d2B/XYBic3N4zqj9+yKvi3WA1AJp9uQSmf
	9rgI+a7IWc4vzRnBxZ/FMg6Ht9pvFUZY3TU077CjegJVFHQwykj1ffsqR2K+msU9Wc0DoqB0BMl
	JpngFs4iMLBL6dsLE76W6xgUDFeO6f1Yq4oncfyMqVyYH2YIaSC9wLYhzc1Cp4d4wps2DJxR++g
	h50N8VBpWn+bga2BInSp+55iBThdNhiDzHLHDfUmRAyzHiH+vbhVOR8WK615yCqMUkuKFBc66tT
	oaEBpaXBaDf5bl0/RJMq62rsYLTDnOi606ig/d4tzPRbyFRn4D+lV8ppaihK4skXg8EBBFvbz0o
	ct/gzxYELFMLgsG2lPlVpycPkVaIQKrx/Q/soWPvrvZR6utiBeJbUYCVImMR/MLRCUmvkpcwaUK
	gwmvU8ZuCqdnrg4WOzAZfsbj0gIKHfYU4Ev06VnbWF6943JEfaTjxPnmwz9OU674ohfVC2J5VKI
	zV//84MZMU2T//YIB/c6RjAPi3S2dF/AsPw==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
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
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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

