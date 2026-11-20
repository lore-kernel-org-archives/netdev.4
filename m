Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134361;
	b=VQUC+woPhKjfZJtehzH0QYfOQYUv8Rl8KPAHdzKv7R5oC4ED1GJccmDU6YQMRv+KP5xU
	 OQPYxPfFQVJNCsbPVIUk2YlQk/4ulqdMLiYBQpjkoIDbsT6BiFyLnpwyx0aEbSD12Hwxo
	 WGt+5zZAqOJwPXGarWzJErR7rmQK65PsZptFYPJh2b8hIdCRA+Sg1h2LkqnEiF7YgS8Oz
	 RpXw62fLqcNW1TJfvPmjRTMwDkiAS0P1G2cnc346QHtgCY3hkf09M1yU8YUH5gKXgeIKJ
	 6p4iDjlr0Z/chdCpmwSOtZwK3INOZ2b71ts2DV9X96FaVoDfd+U6PNrONpW4hbxHR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
	b=lY217Gecz8lF8RjBHJZXxOwIQ0FSbtClkemvTIB0XpGKnRosQMtyQZyIys2Pp2B+Soay
	 niTGxIpY8Roe+LmoGzcfyxyz+Bs6qudTIowAb022bw7CGfsKs5zSv7amYDWZ7qmuvZMW0
	 +D7nL4r8DwomHp0/9hZ51cuNmym8Jmvs4nKhHY/xUkZiOYpUu/Ebh8h4dSUWjXLJkygz3
	 4EI4/nAkOHlyaPj57pLOAckOuUmyKfUjd1wiZ+AVNFTFqB/MR4ZD2SqQQL7QmgXL+HIRL
	 P2yqRNESm7gJDy8UBwmCaCo7C406cQHILEGAl3zIsjEg+wB/F37W4FLn5LwOFbggSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yes96F/A";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89160A263A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D89160A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yes96F/A
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so2083555e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134359; x=1795739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=yes96F/AWcke++2IhWE9S1GYVPvIXwQVG6b/67QK1Dtq+GI0p979xDnhwZF7MYRYUV
         F7q/FAavAX5OEsE3akSi6OSoO4SdmRPvImkns6ZK7JPzMNEB1dQlC5DpaxOJRpwvD1sS
         w0dE6AGEYfAtR38BmhAXGRLUrDNHUMYlP2vvUGXTTbybQr0+OFkG9w0Ym6aMxdLsrcpn
         2u5vPd98/Vv4RylkQ5SrtWhMLkeWxSPadMS/W6Y10MMCkDCACELP6h78N0gRvO7v8J61
         PfLMW3z/fv5y+pH/0AG36zPyG/bQXD854lXzXEksKn0NEg8DcbVEyBtjec+MKW4KYR4V
         67xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134359; x=1795739159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=sZ4l4uNkeSbc2uWmvcBcAqeRb04S4WEhvnXzRUmjEDs0fQAxbl2AXDmKFJ+V8Ie3nf
         bXD0agYPcSOLaUQDfvEVOTlLo70JWtPKVnXWi8vYQhhESWr+24c9B2daiG9m10zuRBAl
         wpd7bpO0B64tamaiVpRjuXnQQ7awwffP+pZf0NY0DsTP0gwpagKFDHoiP4N4Wn3fKN/S
         uKczIrRmxmWBJ5NVrHbEVglYWWXX/Ow71t9yDKWa/QjwsSWuvc+kPzGPoJdSdPgyTgYy
         Xcp3btg5C4GUx+TUtYJYZY3P/azTJ4R4q3WjgPBKDbVVgEAnszW1nTes1fAyDZHc0Wxs
         rQKA==
X-Forwarded-Encrypted: i=1; AL+hErEXYMedu9mF0TseguBwAil/TmIif9Ri086kmLp4HQBShoinPddeYyEKlOBSSHMlbDbIbnSog1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oQ3MjFz3pgLjCHgQ/y2D63qqds60W/vtEWp/lwhbUOf/sbsr6
	2NpqcbKJ4Cmsn3lIFy8MvTsrqmcc3KyC0DrEwZKTfJNY0Kdzq6M0q5NP
X-Gm-Gg: AYBFou1xk1hAe3aksr+6n+yRNbVqga5oLawEq0AA8jgjY1bMcEGmBBsel6Yi4hORk5R
	nYiGKiJ8RmFB9i/oK3yUbHTWdT4xcVCmcjGZ5I9W1w+IoI4fzDHReYcvotP6jHDl5MO/k5BeIxI
	0DDBFMpMid4wJ+Zlb8r6/yQzzpc2SLetFWN7F9XMaz5aB3J4TIU9VQcm2YwsZIe9nBfHESPkkP4
	kFn+dLSiwcaCwL2e8xz7F1WgQDuzpWBH31ag5BGv/rUhA+4xIhmIecF7OQ5z58ZTAzOIo1+SYyJ
	8UMP/agyLlXUUeqmz+v5jmhydnRcGBmFCQiNj7RPPlHSBVlw+556LXk/YAP9f0yVM1mBZVY5wlP
	6l6KdApHbPBZdqvh7jPFgCsnFnOza9PIxKzB4y0SOgq7k6GFylq1hkMB+bf9LUsGSmZKQR0Ns4q
	PHlNjScHapDNw6Y1C0JdtKa12YzBHu/6RDmRgZMY96Ct9PkD12Uk4/CMFKHZlcwTJte3EH+E/9V
	LuvuRrSBgpBYDMPJYVDa0Ej8za8okA/gdWfVUcY9bhhAVdTH/miwi/PGnWgLSivIqMSXH5VVMhG
	k2mcAZSP0Jte+U3MC50i7LXvwiy7dHVJWeZX+XgorN0c7tXfJ8Oai9X8ub4xItffCNagxyDQmoX
	5mAnRJbX/adM1UyiSEcuYgSG0wFw0kEmHzayHFXOGLpJzckkPKKadni1Dd5fW0wozKi1wJ/gR
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr31085375e9.13.1795134359239;
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:58 -0800 (PST)
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
Subject: [PATCH net-next v5 05/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Fri, 20 Nov 2026 00:25:15 +0000
Message-ID: <20261120002549.1908299-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Added RB tag

v3->v4:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index fab6aa6237e9..9c477ceb170b 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -45,6 +45,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  dsa,member: true
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
@@ -73,7 +75,7 @@ properties:
               phandle pointing to a PCS sub-node compatible with
               renesas,rzn1-miic.yaml#
 
-unevaluatedProperties: false
+additionalProperties: false
 
 required:
   - compatible
@@ -81,6 +83,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - ethernet-ports
 
 examples:
   - |
-- 
2.56.1

