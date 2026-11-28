Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850174;
	b=l5KLyMcWPrzhY8BDMUIB2K0Vj6EwhrenxSGHb0mayeatb9IfGilCXg0+a3ju71H7SU9T
	 BLG26e9RKaltaaEFxg+vf5usbN5tJbQy5fbWvUnaMIG5COw0TXxOV5dFoBxOrbpRraF28
	 +G886ZbH+LYKqqJRYJomW/F+8DwWn8K5Oa3Wi3UZBoFyYOYTd4fabIqlGk2bZJqHiAQYt
	 y6N2Y64mipTP2rYCmslrGAr7fEXE+XsWU5GpdVoUTx025QE2UZ2MXa40T7QlOKKdOQhdm
	 Azjoc6DK1D73h9Zvep3CfKbp9ZI/6O6OOaTruCXrNLmDU9470A3DnrL+uDx1unQcU7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
	b=MTyH+ZVLOFvmz+1KdsTuUnUDKoYXl7VqVIHR+tlrRzFPgU42iUXHXRjCcx9F1j3y8lY8
	 254prCKSTDK3ojLGeYL6v0t6S3SPjCcqAltTnNrePzP+XAYQhbJQaQeKEdR3bZsEADnnY
	 wa9ciF5zkehuTQsKIyOjjKdxQc5xmarcDLmpSMHm2SQjl2XnmCKIBHaUaXRjydVnaZpbB
	 51fHRRIv2OGXH5n/IeIBsvWyVfyGHlzX5o4LyqcosI0O6mXReRvBYymfBE8+8BvRyn/EB
	 qe9u14wXc8VTAqhFXgrekCQ7SeZINN5jcSt/8Xx1/CN8CsgMP194R62pzNtuAAwhECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B437606A32A
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 07:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B437606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7983664f8f.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850173; x=1796454973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
        b=q7f1zs7mtLAWfHJGbqcqgtUlE/jtTCSMu55KRxuiU92nqIcuishlkLT8sBZp57eT9Y
         4wgqN54O5XPuv9gxR6fWXZHEdLm9L19NVSVnuTuvob6CEljvnegzx0hcI3mzZuSQhrwQ
         cvb1Qu0ZuAANmWuB4Te2IrZh8geQYAHTTrEvxa60Z3Jt5f6iMIv2LrzuJXydFsW0BBa7
         WDbreUc5aMyAaHmOFL3JFLYDGoMIalafPKDt2gm1Dof/j2pE3pD8o+PyV6oIOlXSFop9
         C+DXbzaQYYE4zWw7GrtT0+iK2uJ+Q/htnrWt0WI0+Mth/7Ea+xMep8VE6LL5xtUJxTmn
         V/CQ==
X-Forwarded-Encrypted: i=1; AL+hErHeSqS94lQr83DsQyyw8tuabMYOd67+3sgwA8UO2u8kgcOjI8nnrNnwwi4SpbM3AsuwYz8kVbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K+Lfh/xt0KC8FDDCWsKaZTPO0/8fuxgmI3MTtZchCclKRdQQo
	FlzgcDVQhyX4QdGVm6J+IgWsBOGbKSXFs4E3uQF588X/qukD7Y2CGqCW
X-Gm-Gg: AZFdTZdxo/hvtY8AX5sXRCsJGI6I/O+m4UZQymrkrhZMl+nOz2x1gaQpkxjClVOAShg
	bovrryvVqWu/E6TNmbFwZ2xSBhd0zxapLXRnOjqCD+F/CS2N3oUEn8tGRd9NczsdDRjNNpMqL0a
	XRDEAOuFnKFI9QWmEcQxq+a5ts6KEDOqatx83+Cfc0XE8tW9yuM6lLT1GuBauCFgajkT0A6Fnl3
	cLDWGOHKIDZfq1DnWNR4jClyjgWCqLnJcL6Pg3aRkgR5aGMar2w6ipVe5E8jEa1GkogS50iM4qK
	uLks4pUNZlAwyNN00A3wOuwT0loEXQ8U9SRUIfosmmFTYouUUGDG1271rwejveNRV6JHnjfDSQM
	fU96zu0kpHdXj/4nZCw6Krec8xs2JTfHu2D7hpjUMhm0L37wN+IlHqeJpByQXkylGwPX6zw1B+/
	HL6teP/fqOBVrBL26FjmfQxjgUOun04YMVq8jjLdWBFO1HifzXpJ5W0QlLErf64H7GcVso9wD+D
	BmnCg9zzzWpincFz16zsABOzxmvGjaa/8rmp+DsWqKSmpMxd/RXJKbpHXcDE0CAylZBzQ2j03l6
	t/G1FJ5XJeDSi1ccx8c4Um5cUUxGRZqNy0CTlJwSDyc5olKYUHuNDObjGSav1gl8yPwkgro2r3M
	+rLGyOLEpyh1Iss+P899ryPQ=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr687806825e9.5.1795850172794;
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 28 Nov 2026 07:16:07 +0000
Message-ID: <20261128071610.27855-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

The Amlogic T7 has the same MDIO multiplexer as the G12A. Document it
with a compatible of its own and the G12A one as fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

