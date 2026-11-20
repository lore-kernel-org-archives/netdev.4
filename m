Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134374;
	b=U3ZVk8ez8vQj5VWcItTO9V4yLfE59beWVbslEVUkB+s9J3DA8d0/6t5r1ThaNoBTUbtY
	 PtDwgfMpBB1XT2mCDPZSbmF+qDfFe4PSkfQ8WkqDv0TZFE+MQO3WSvJBkkooVrHy7lB3S
	 fRoGiL/YB/LjdPYq+s8xA93wXS3Nsi/zBtxJB3qz2G6teC8zN+hCzEqFE11rCfXSwySRD
	 F7DMfzJoebolRgmT/PkC7tH06b0Uel52/u+Pt/y8FtBYt5MVM5MYY995oNcfgDt8HoaQT
	 vZfnz8Gl17hZwbhyUPukQzKrEkliOCrVJZbay9dW+EFS8C0BbvBUySfKglXkRBRhFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
	b=YTody669pBJx0/SUUDDSkSbVVLKoNb7QNm3XfIxMVGCGXC2zYSBPds7OJxHprqDX2z+y
	 fNZCL2VcZ1ZxNL61NFZkSzrFXJjIJFRJIdQtqGdcs8oj7Eh6bNfEn+Xd5z6KhKas0X8ru
	 nPB3FL3jil6JbRTK29lPGytZ9qciupwTU/u1wymzIzopw7jIOjqwadc6CPFHcoyzOuQbV
	 SZviSO6N8bVzwqwlq0J+AylP2Sr3GaClz/9GBXoAyO7WxpXqzbMder1zemf/N8v4vrfQc
	 kfcr4f5Lxz6PbiJEX1XHeZt6/XwfUFkQbsEEX/1kT5itDey5X90Toysv3VQy2WE54Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8779A60A260C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8779A60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2081955e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134373; x=1795739173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=TbnpkyVH+yhTrKOHjWx/7zpM/66j2jIRzeSvBMJR+qCh6qNpfVPHDkV3ya7jF78JaM
         YPZZVeawh3qS2OBUVieNI3wwKxN5RGICbyG++1DUKKhsLzrs1YkHhqnNnqfJaoMdjpFx
         IClVzRMM8NUUg0HKQh0vXIF7rkWwSOVonKyLsr219Q7IYmV5/ONWmyhcdW8tFUlzG5kr
         E7jPN7CQXMLSQbuiw+ifctWcvpa7bQ9mSycRILdAZg3g5xG6EduSDZtfHIiA2KYxpr/E
         DKx2Er5qb5jYmfCpOY1Reou/72dMQFpmG41Cg76BEZPkSvCHJQMDimpVsbAdSWn2Hk6R
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134373; x=1795739173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=WaOdsx6D1ylvsuKp9NaBKc0pxTg40ky0y01zkvaRD2fNn2a5nqC6p+vKa2FmwZ9sid
         O9aMGQSxgRUFw1YEsH8a6iTsGrs2l3iG3s80Ia3cs2IB33AtppnUhbT+vQqVao/8g4oK
         dMRej1tJLXu2og17RbNokS6qb3QFkhAIo00THPaQXXb+pAdWoXuWGNAhzbH2K85tyQ/a
         jUyQdmGXsXUzZoLRf05NBrCWCbvM1TEc+vmXf0YCbqYlw8bnL409baTgfXSgMnXv6b/Z
         Po6tdah9QF3uJvx9UlII7hewTJkZQiY+/Ay7QoG5iXT9d/dlsH0LvpfZwcFMyL7584PY
         f7gA==
X-Forwarded-Encrypted: i=1; AL+hErF7X4f9WbAXYNt6nvaOmP05jfR7b/HA3xE4Y/AqNOtW3fY3pAZcm4LifHDteM1d8iefyhbYqdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9458TL7opTFgKnMLwQVhm+OVhJG5g9z/U1gR2gxroPWNPlJ9C2
	Xi0DEl16q65io2tOEHr+Iuw2Bd/JjOoV3/M4HjTpykGOQBrLEssjIosC
X-Gm-Gg: AYBFou1UErVOnKgwAsnoyXC2GLV4GCFfAmDCLaM2BbQqSlaSNmcqr95EddmAUuJYX3s
	ewqzn+b3FImBAjsbkucVNzpBwY+SLu6uEaT3wfy05lh8caS4KSRH5tB9t5YpzJGPtQuD+XBGrYf
	jIxkGxUm7Syxsr65ytJMmpQzhpTYHaDd0MT6saNiBZVi4Cg2ovcI6P2oMh1jC9m6o2IdvcYO3OU
	CY0yTx6TuI8hvo4RzIUQlX318VTv3K13uUTTjBQQiF0eXibn+27ebuhJ7iWTRKMDsAxlRiLDmQA
	aNlBZ6BKU/ieyv42bqduWiRJsFJMJbsJEG3w1rU5P8h98cPyATHtz1dzstECwvQKOF48qUPo/UT
	EN52qY7J3kpdMjQEqvw4dVj9eqczyi6eO9HUUhDAujat4d4DysGHwq9/oov1K+3Qz/gLarVmiFk
	MY8x+40lSTO3VpiJueGvARfURg1mA9eoTiwzfuUYY5H5Qa0RiXKHjY4ZMcvByNVhLbGDa6q7Mte
	3aZIKlThnUDYA1grkam7Mb3J7j+RDjFNhpymYyAy/kTa5+OXYcfQdERW9tijg2rR4fgBA9W2QuQ
	SHJEuH7vFraeQ5JD+K6kGNpB8RD6ziYV9OJJ4AewTk5KPyJPBZx+vEeyQgZatvGCajCzbiIEUT1
	3p6hsMgzEkNVz2dh/w4VGCU/jTzPkI7ysG/8DdVBRSUzWcMjbCnEFypfs/yewLRwHamKoNSfO
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr26725725e9.33.1795134372763;
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
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
Subject: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port comment for RZ/T2H
Date: Fri, 20 Nov 2026 00:25:31 +0000
Message-ID: <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
to the switch management port. This is only true on RZ/N1. On RZ/T2H
and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c0c1f45852da..751d03b0bde4 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_1000FD;
 
 	if (dsa_is_cpu_port(ds, port)) {
-		/* GMII is used internally and GMAC2 is connected to the switch
-		 * using 1000Mbps Full-Duplex mode only (cf ethernet manual)
+		/* GMII is used internally and the conduit GMAC (GMAC2 on RZ/N1,
+		 * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch using
+		 * 1000Mbps Full-Duplex mode only (cf ethernet manual)
 		 */
 		__set_bit(PHY_INTERFACE_MODE_GMII, intf);
 	} else {
-- 
2.56.1

