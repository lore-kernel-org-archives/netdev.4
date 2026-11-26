Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702455;
	b=4MLA4Jrgr+vOPckvAf1jNTvPru2QHlu4xDmbOH4ZJnEiqtFsp6mt61IRxTlaKpWVIW1J
	 5IQQ/oCQkYDAyxi9ozvtWvWWSfsjkMMsTfJpGGNSbcefflcyKHbMbVHP/iDZCVPC+wTPO
	 ELHhnJrvL2uGkmPGrmGLZGUBDTSSTK3Zbyy9puRS3bL7aAIJK+4NmYeDAXnKugm452R/r
	 d0X/XJ0md+qFaneBbfPQulhEySV3sJOnVZZUdHhImfSCLCiO/HmQiNzhXSJB8eVz3Z8p4
	 R97a2rRuQ1kj41b/3vlwU84xNnfxWn5rOACvKp8wWIFWqxAyUX1woSRW0h9qW26H6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702455;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=2af9+w00uzOD6FRM91HNOb040wzCwbe4fv9IMgKEHAQ=;
	b=CIeK1uP/ab4ow3/0l+8P4HV0k+mRP+3L6Kaogv8v19eM3nM9s3KKMzidZG1bPeW5T/cl
	 3jgt0Z7CpW5pGkgTpb61ESnRxhK2MDrKvh0hAlPdZr2WCVXYUzUkrkHKMui24gILx3T2U
	 3aPblV8CEqG73ZuvSnxtLpwRXSHVRHhIVMef+HWkos1JQMEGjcyb4ob350sHKw1Rk4p+j
	 pPWVPMEnTPTTHKQQjP1vkUJNwpGdFnad0jH/IGWlZej41UjMNClzpyIPlg7ogtTzKZFc5
	 txuyXpCOJBBGlc2qejO2zQjIGFYKU27GjUZe/92ujft/njvxfF037YTTuI4XLn3OOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i73bhyEy;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772EB606A334;
	Thu, 26 Nov 2026 14:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772EB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i73bhyEy
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 271B51A17F9;
	Thu, 26 Nov 2026 14:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF830604ED;
	Thu, 26 Nov 2026 14:14:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49CCD11E683C9;
	Thu, 26 Nov 2026 15:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2af9+w00uzOD6FRM91HNOb040wzCwbe4fv9IMgKEHAQ=;
	b=i73bhyEysgiDbwbL4Upc+N2TxHgqSZ3wKu04/T9EAo6xU5p3/QQ7X4jo4u0f7kP9N0lu24
	el+AQ92tEE5YF0qdtcvpQtP6Lg9Ee7xz+4Idkd4ezKzizOXJiqJoB/6i793+OS3fymenfs
	GA1sVPmKkbnFVYr4iJjf4cuBH9OHFZyJQ1KmQzSYY7fJxKF1a+gg5TyQPP/LlX1pbGLtRs
	xxpuDf36RRQwWk67IEn4nsGLT7MexTTDo9GXi3BrvJFtNp6o+xGvjdojBo32YKOSIfK19o
	Ks1bvYvo7YS4xF2UWtW7hJfrraPIEFn+6mSAA41stAI+u1p9BRv0ue82pVyWCA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 26 Nov 2026 15:13:43 +0100
Subject: [PATCH net-next 1/3] dt-bindings: net: dsa: lan9303: add Microchip
 LAN9354 compatible
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-lan9303-leds-v1-1-a96731317859@bootlin.com>
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
In-Reply-To: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Jerry Ray <jerry.ray@microchip.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bo Mellberg <bo.mellberg@se.com>, 
 Pascal Eberhard <pascal.eberhard@se.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702442; l=2028;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Bre0xRv5cdfdmi0n2iDaeMyZE3i4rxiXnVfwYy2Mo04=;
 b=+y7euHTOrSppXg9QtAhXYrvWZiw4RNV7tEXS/9ekoO8VHDwkW7nVohtEbqILICQ2ZeTO3S67x
 0vV8gSN6NVvD2kD/l6Vb/OZ6HGee/uLGqmW+6+RkRBXA4gQoh+NAzKm
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The driver has matched "microchip,lan9354-mdio" since commit 13248b975038
("net: dsa: LAN9303: Add basic support for LAN9354"), but the binding only
documents the two SMSC compatibles. A board using the LAN9354 therefore
fails dtbs_check even though the driver binds.

Add the compatible to the enum and mention the LAN9354 in the title and
description.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
index 42f8473538a0..95abf043a118 100644
--- a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
@@ -4,15 +4,16 @@
 $id: http://devicetree.org/schemas/net/dsa/smsc,lan9303.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SMSC/MicroChip LAN9303 three port ethernet switch
+title: SMSC/MicroChip LAN9303/LAN9354 three port ethernet switch
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
 description:
-  The LAN9303 is a three port ethernet switch with integrated PHYs for the
-  two external ports. The third port is an RMII/MII interface to a host
-  processor. The device can be managed via I2C or MDIO.
+  The LAN9303 and LAN9354 are three port ethernet switches with integrated
+  PHYs for the two external ports. The third port is an RMII/MII interface
+  to a host processor. The LAN9303 can be managed via I2C or MDIO. The
+  LAN9354 is supported in MDIO mode.
 
   Note - always use 'reg = <0/1/2>;' for the three DSA ports, even if the
   device is configured to use 1/2/3 instead. This hardware configuration
@@ -23,6 +24,7 @@ properties:
     enum:
       - smsc,lan9303-i2c
       - smsc,lan9303-mdio
+      - microchip,lan9354-mdio
 
   reg:
     maxItems: 1

-- 
2.56.1

