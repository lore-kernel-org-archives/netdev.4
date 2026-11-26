Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702457;
	b=YZb9eLRy/4XK04rxgEYmckcVphwEdjtILRxvEoUbVhNtZCV5cEjMUb74OQfYXCQHGtzW
	 EgRW5CeP4aDJGiAXLsBdLtP6FUJt5QFw/NtYiRncuKNKNJjRTRHVviB2Te/nkVknDymV7
	 0/nDKsNZ1gQud28AMCwlkPo4EvYrZaZxKG18ho+AAo+WEJdJ6+reONshekfnvF0SyYcb7
	 h9CQ40FleePbqEZZpJ3s8KDnI7LOPVoadpefCqB+mWW62JLVzWX25oFETe/zFh6YEMAH6
	 a0mkGqf34S/yzS9zcTNjEFqa+O6SCz2IfYeTiEehGvN1Nr3x6YAAuIWKWE4i9H+TuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702457;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=YFjixTmGKukMYVORbMPB7eYn8KiXuckaWz4L5tnyKOg=;
	b=4kvCkD9IgQ9GfcvF0toIVKkDFcmSS0eMMNBwVTeg2JXh32ztf3qRcfkVLen2nnjA9HCy
	 htzSxB2J4pVAwfC297V/rDiWL7OVb1pvi7SabOxizdR7Hrdzq88WnlE6/b8kjwqmPpgtW
	 KZzsPcldjnP5ykM/rp6H3GirLHj0mibRb712v6iswo6PbdILIoicseRQTrLQ0R2imRq4Q
	 YXgOm0+Ldq8wpESQtgXqTG2rszQ7WgvFbMNnwK6YhPYmqIb/NV1QIfQNFlTod/8wM0Ls2
	 3gADx8uB2kLLL7NQhoPVxDCI48TgFpGDcQZJQsxW5nkEjYCwvKupTNpeFY9gzRNWzzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="gQm/iaJ2";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA8606A685;
	Thu, 26 Nov 2026 14:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECA8606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gQm/iaJ2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D1DD4E417A9;
	Thu, 26 Nov 2026 14:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10FEE604ED;
	Thu, 26 Nov 2026 14:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1282711E683CA;
	Thu, 26 Nov 2026 15:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YFjixTmGKukMYVORbMPB7eYn8KiXuckaWz4L5tnyKOg=;
	b=gQm/iaJ2CIF+2ePEhukwR7A951vyCMTGL26w8I2NBzCplAgI8tf8Aku2+tYy5+pAerGRPq
	0HZ7wXB3cp8YxeSxzWo6IXOD3g4NmZGh0j3YkK27KgPxcjta6jdcZHUG7WxQXNMjwxfbz/
	po/FgIfZzyXAEbxxyncbIZg4m5kCu5YrDdleMTA6HfCZSERE2HtZUZSqOrnrkLxlkf5Nxy
	urtkRiaGOW4sKcYorRo1/xBbCo+lGpxN5V9AAsaDJpiXXa+6SYIQfFahonQLTpAcyy8/bW
	hbs2FyfvpoZuYiPYrAInKWaR8PNIbMFWJQgDTi5E/hS5OYZ6zIFWtNQ3u0qkZA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 26 Nov 2026 15:13:44 +0100
Subject: [PATCH net-next 2/3] dt-bindings: net: dsa: lan9303: add
 smsc,led-mode property
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
Message-Id: <20261126-lan9303-leds-v1-2-a96731317859@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702442; l=1839;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=QPyIf0Dap10F4bEWdSzxStxuktA9lKxa+ERD2XKmT4k=;
 b=pc58vbRNn7AJqLUEqx56Q4i2c+50O3DGNmhBfvdz/XSnsuzJx8WAojgM0QAZ0lFPtZZUE3RPp
 Lz8uB1As4ZcCzHam0L52DqhMgolerrxU2bFrFjr/o81T38tbDV19zku
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The LAN9303 and LAN9354 select the function of all six LED pins with a
single LED_FUN field. On some boards the LED straps double as
configuration straps for other functions, such as the PHY address or the
EEPROM size, so the desired LED mode cannot be strapped.

Document an optional "smsc,led-mode" property. The value 110b is
reserved on the LAN9354.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/net/dsa/smsc,lan9303.yaml  | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
index 95abf043a118..f044589b643d 100644
--- a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
@@ -40,6 +40,18 @@ properties:
     default: 200
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  smsc,led-mode:
+    description: |
+      LED function mode.
+
+      This value will apply a predefined configuration to all six LED pins of
+      both external ports. See the "LED Operation" section of the datasheet.
+
+      When the property is absent, the value sampled from the configuration
+      straps is kept.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+
 required:
   - compatible
   - reg
@@ -48,6 +60,19 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: dsa.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,lan9354-mdio
+    then:
+      properties:
+        smsc,led-mode:
+          enum: [0, 1, 2, 3, 4, 5, 7]
+    else:
+      properties:
+        smsc,led-mode:
+          maximum: 3
 
 examples:
   - |

-- 
2.56.1

