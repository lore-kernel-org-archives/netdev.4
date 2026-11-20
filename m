Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134365;
	b=W8uaT7ZSjcpv5UeHiSVOPc5Ixxhu5qIiI1jHDmH+zGbgM78R4rOTYg6XCamNUJiIE1Mo
	 AeN1VTBEqKMrVK0hIqvscA3jtRtFgaIa3UGbvmksJbCSGU3EYOd8VgfZNgco5y8JpdMKf
	 k/Y+P0swGShOGNxsEB5KX1G7UahrXr1rKGx4XNuDGklINozytebZD1lHF+uj/2ESWybme
	 43SwXjasHBKSmlERBXyHaMKKmfqyeiO3DiwTHNPJ8Uq8B+1lYyA+3DqJgNyfseqxiO+AN
	 mfFioanxiTtKiED6yQ0CiQjfU7tKRIXd4/SGdHO3ZY5A1OEN4ffiaHoa6kb639pbgSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
	b=NmkcaQSqUNBlGi6iPo9yUh2TE7Ndq39oIurmhu+caF4PyuCaGZy+7qZa36NVgZLuYWdW
	 SKuMg6KtzrVLXAOpMnOnmEWXTCsvYkL4UeDnfWJ+foVWj7lGf4IucVAqO41z5J/U1ZJH0
	 LOLnxu+200pk+B5+XboV1K6LN/yrE4M88tIwZT1JyhXCZ5qkp7gdYWeoDIW61UJm78EZ/
	 dRDtl1XgzaYQkVAgwlak3LJ4nckzL810YJxIgOSm9uYwU5aXAjrKf1oJZELhQF15PBVuo
	 4p20e11ADKo0dYdDWCWZk1R+90iOmmZwWMP77/Y63M2PHG5Z7hyOg7k91qr3aTJbikA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18B60A3835
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C18B60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso3695415e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134364; x=1795739164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=kvRmUPCVFdVm9Tvu0USFo59ybVuNY+lv/i/sbUinEHjjSz1u1oTC6qMNXiMNCd9z3X
         RsOZkXuiy3FFIHSSKoBPOY8IZuMSl0+tBrtyTxfJxC59ZHgy7RtCosCY5mP21342VOfb
         oVdxG82rBoRF/tpBq+mqaaqYUXgvGs9ZvSC+u6M7IEVel7kf94mhPdu5TS8WyKTc28bq
         QvfPdfTJAyOBjQhlsoSztQ/HIp2YMUCtt32uIw4U6ZaL76wRNBPgtXohSwXj00E+w5ew
         Y1SaCK55hGUTNGaon0Da9mR0I/64EwzQf75PqOFz2xdv0/7DhusBGU9vfAoIARLFoHJf
         Wq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134364; x=1795739164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=PSNv9FNUU9RELB+7jjBF0cVErpaf7O/RelVtba07KZTalWmiRwEkIEvHIFJKoL5Y8l
         Lkh/a/SHfC1ij+OpIAhS+jOeedK87LzigBX75vCFltsB1IAIc5uJ+0HAiTgG6+EFePtF
         wzH8MRu1y0xJsQ/j88Rdcnw+//sUnA5WtQDttqfGHWT0IVtzavPhkxFjm5oz8n04dLwy
         lu4iQX9edk35NvIyMS0jA9yRleEd+j08Te01nb6EsyT5V2zEHSaw/ihFGqrqa57U7qRk
         WJATbl33eNLp+y9b57+zgKhPMHt20XboxfnzOWzr2iJkx20wJUwofo2L8KQo12qPGLj1
         vcgQ==
X-Forwarded-Encrypted: i=1; AL+hErECAiIfA6B7Q3p/BhuAGcDh75OLZdoe14agBa29DFIRZgN5URd3w2baq4Aby13KhOoUZ2AFuz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/awWnTb7D950o8+K7+FY0JJxEB2EgklVqg1lMDn6MMfeQ3J6JT
	b5nWx/jQIKNwNFrAbLz/n0WFZIPYVuYLsrVIDQTtbdURHNI+lRXBttTs
X-Gm-Gg: AZFdTZcDmc74dliXoAyheb7sYvoTFYpbzwLaN2Tq0xAr0tN836ve8zxKtBnarV8Ez0c
	nAq+FAIV9JZxMw32RX86mDO1Vw1fU7oG6fdXS/I/DFAJhY/bAvwg+HZeDLSZ/w2R7S9shlpESKP
	15fXRbx+fOJh3RPGyCBhS00LkspkQ7XT7eu2+44+OppqWYq1aLhghPpxhkZIPjyKCR4if+71/tz
	BbMZxplPKOxfNCt3Y6UA/FbRa8adUdb/yfdU0gaTkcrG5KL04oQfG4DZ9ETn+LjgAZA7O6+0ghH
	5/gZWabilaLEWjd/Q0hztvwfWc46FttC0RVyiBzdAXJ41k86I/d4yoFk+kSUTYhlqrutVnV4mwD
	R9Qmy48f16JzFz1vcOaWyOLcuzVmGXd2+NBv4pi6T6jVXEfqC971rhkk4F6TKbI5fb4f4tzbRv3
	LjnbCWj1Nlzp8p3gcHZD9lJbC8Tzmps4KXKa11Ijl/eJme5iBiJCToUNdVkUT3QA0ndvtMht8Lu
	rGNXa7NkSM4aG+pgyYL3/inW0V6R149vh0t5Z1v0ipB16O3OhN2Cy9u8lqpHuU0GgBFr2gCyp8t
	9diT4kuCAxu9Es4x6C+XRWn/CfwCesZ7+UmUTalX/f6okwPyHtjEfJ8395y/sqYKfl0k0igssCn
	b+zgCMBPNIcIU/euaakW5aa755zTcGzO+hnZh6ugaZY3hZ6XyjvEZ3wWM2p2UOTm9URc17mqm
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr1969744f8f.9.1795134363733;
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
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
Subject: [PATCH net-next v5 10/24] net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
Date: Fri, 20 Nov 2026 00:25:20 +0000
Message-ID: <20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The MDC frequency is hclk / (2 * CLKDIV + 1) on RZ/N1 as well as
RZ/T2H and RZ/N2H. The existing calculation uses the wrong divisor
formula and can set MDC above the requested clock-frequency.

Calculate the smallest CLKDIV that keeps MDC at or below the requested
frequency.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7fd2652813ac..df3b3f75b489 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -11,6 +11,7 @@
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -1104,7 +1105,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
 	u32 cfgstatus;
 
 	rate = clk_get_rate(a5psw->hclk);
-	div = ((rate / mdio_freq) / 2);
+	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
 	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
 	    div < A5PSW_MDIO_CLK_DIV_MIN) {
 		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);
-- 
2.56.1

