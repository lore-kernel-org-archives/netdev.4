Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296668;
	b=zSwPP67UOZ9QM/xRr9ZvuBiorRdSLU+9+hiZbjtcBJ+WiSMlFINVZMGU9QO4zm85pCrK
	 gWMkoPezdZyjks/vS+ASVqK9Spv9JkdPO/9TFFSISgWwQ0KGed+ScBlmGUaclszceyr4W
	 hs4/wfG1220UZi4HcAXxTby2AM6qFMWTWixqhoWoRLbJNuJ8CAI+Ww/EHQWhFpvE8R5Br
	 sp24pB6yWPyu1b3ugCyWn4zE0E8gJBoM3jNwrItRpgwsIyjpFl7pGsXHeGMTyOV8pO5k/
	 JCjwtVgBNCqVIiBhAkvphhw/goH97aLJqoAbYrHZcZ33DCrm8b0xlOgOLBgo67JGqLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296668;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
	b=fMNCPglrK01Re1ig32Bf9nRmQ9Q27mZk0umJt0fh/bEw617N0mV9gc71KkjYj9lahon5
	 1OBNATqHkxCVkQI09GYZ8l4OOgByZ5TfSQvR9hvQVopVQa/5k8bH5EHqFj2NT+KW9Abr3
	 h+tytKLfpJjnoAhWFOOpgItcqpOIH/A6tDnLskQgbqD2Whw6cNcNxBclnzYdUekwajDKV
	 zhu7YooWMZdU37I1LxOvgaNg9+a4ECj86vpz7LhwTv1SjFxgAqp3NHnbERDUDK9pg7aFT
	 Iw+Q/zW/2VeFpGR6OAdiK9u5fuoWm3ViLUiEiCJOIaWEPjTOlGV/OIPUijIENzYiOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A3606A68B
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763A3606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso1475575f8f.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296667; x=1795901467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
        b=WOZbnPMMTSQkng4tOd/N/QkgxryU3JerKckrZZ6CT2ktt73Q8qct9ZtI97EqjFJ8YZ
         HWBakmJ6zuVF7VN3AuJn6EocNZWOd6b12qZ0HsSbmeR3lphS70Y2aPos6NKDwqb2bNxi
         hjn8upQyIrWIY4VYAj1CAamUi4tsLIOPy6dzV6S/WdrPuOwhKWXGb0kjKRhNsxmxA0nc
         MjpEhNuQoQ6Bpa+HVP9LYE8hCrVgw0mkOSTbiAOOLt/5h7+dri5fvjvPkW6VGaO48Qgf
         4+31LwgImFyrl8Fxn9hMDoIJWsNEYAvlSAKi1+96WRM+5UzUlXCDRCAEE9oSaXdJJNIq
         +oKQ==
X-Gm-Message-State: APuU4Z/0fzPz0Dvz7xxVEgFAxY/g3OqfleSfSsIRDlUwYFyBqVQIFAQs
	0R+n2EwPkeQuranIo550OJRP1IySuMpjB3CMfFoMgMZg/1jJvRDHkIDI
X-Gm-Gg: AZFdTZfOLeIuwNJLmtCcFN75+7idegz/3KDoDJrqw4Ip6LHWRhL7U/6Ng4q+CEuNnMT
	aK5TpzX/jK1wyqVCDSq9TpRDE7FlEyCEfIcUwR9drFEMz7mR4Bh2fwtyhz8+K4y9dBuzJvgGVre
	KXDRCKP64aK/ss7f35jmZtnY3P8E2S2CvWSZJbwpdTJnx022emmDm8KrHtBSagsFPWKbPJYqzUD
	o2mB5HxirQtuU8KWRy2hJ5IRJ7kHkXN9ZGsaHElaFHo8FZ6TyldlFutKuAU51qdBnM2irU/kXSK
	guUPh4CpJXdmQZ+4TtmlylJdWB9a7wR+NLfgGNxQyvDZMaOqhlDpdj3uVU7ank4VSg+v10O6NtO
	tfhT+YNVGGH1uVy7BCPuiZ7BG0jSvvLjOARe+m4hbdnXlA2hPU2TS6D0suhFBXEBVzRqNj+gvRr
	/5indKMFiJfoazleNbsalgApptP2wnC97F4eTuhbvCa6WguXZeLPTsECfypdtlJft/i7tDdwN18
	432A2IlxRW45ZO0gxwdOqBupzaMBYwnIhGTNB/68TAoeyL8Ib2an1NQTtiDC/Cq9+Jnm0mINgSw
	8NJJV4HXjowRKu6o20HqTAiAvdnx6iRZr9XY8ldrbE7AWPAQX00ODXFyhqQ2iILqLgH/g+zz+IF
	a01CFWdvTDKVJPiwKy4lGMCY=
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr11591573f8f.51.1795296666841;
        Sat, 21 Nov 2026 13:31:06 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:05 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 21 Nov 2026 21:30:59 +0000
Message-ID: <20261121213102.143130-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The T7 has the same management bus multiplexer as the G12A, in front
of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
But a device tree that names only the G12A string leaves no way to
tell the two apart later: if a difference between the two blocks
turns up, every T7 board would have to change its compatible to get
the fix.

Give the T7 a compatible of its own with the G12A one as fallback, so
the existing driver keeps binding and a T7-specific match can be added
without touching the boards.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1

