Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784896;
	b=FPs/rXxVfR8JBhiGDx37WuVhYHucMU50mNlaKBfe/ukdnIQSwURs1WUR4oZ5OjkwlwHZ
	 rq5TQmgAkpf5Cy+KbqhbTbqJOq2kQ0+YD33WcaxR61cUjSBKOAeQl+YqMXLuDZHj/dA61
	 ak69VPnk00017pSo0qQnfNGCL1H6/d6MIONtlM+W6N9d89QtlURaLj1FkuhAf/DoqTu7h
	 YhzvdjejxXGjEeCGaKY4ksCXt2X+83dtOJf4FkZXk6pbQh6jPmUNcFPaX+ZX87bZTqeHp
	 hQoCPHg8IgxTFFdTmOFhrT+QBHdVbpnklNhVoZcPTCBQiRKnMWxwQ33LPT/vznB6ouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
	b=mDGR/vR9DVW95eNbLx54sjTcUqQRfAmdHFXOHQMi8tQDzPUtuH6Ahv16FLtFqkQyKxc8
	 txlnyUuAJ/n0VWBI9vGCe5bWOkZvpKsPXA/eojF0vFJdprSafGc69syX1oDLLO3NRItm8
	 G6AnZjq7pvS2XX9Ai9Z7XMNwF8eTyAkkxwqpIDk1GkPI1J2YFNrFiDKHivElQaSIX0QwW
	 Xb23tYXjfuA28XqE9Z6zxrSIW0q1kV4xVqayDeVYvFi/MbcEWaCbokX98ofhLF0YTZLyN
	 HUWVohlG7beBN2YLLxqPaDx7hcTIXmRFhUVMG4JCBppqA+heNp0pSn4HuI0X//kFHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qrJaqgs;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38792606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38792606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qrJaqgs
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3749703a91.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784895; x=1796389695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=0qrJaqgs8WLgjFuu6uc2Zobv2HU4okUVm+pA7G7tief8EQaTZuk8iUqoCUR9Y2YG2s
         D/+d7LSEIkwcQN4uzvNIAbWNbnBZLF+y+ZpV7kIOHSZd6eO354PLPP3Ilw/QR5v+mvse
         xUh8Z9eOb0g8ncebpdWWIiZ6wjbompya7Ty+qal01HuoJJo4M4J/G5Klb3uxa2gP2WZ/
         0VGqZmmv1gYLb7q7v3DvC/ons6fGj2cnS+GZLAILvhma140nFAFqZlwjvRtzn+ziINSz
         PO0xqmyDacy2+W/ixIKeuKV1hZyNGGiB5OVu7zFohJ29esdZ8NPMMFktLXEM4BnwsOt5
         ifDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784895; x=1796389695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=UQpehnoBCW4TZJJGT7sGYWJdR6nDznEL+nKz4/aDVIWG8QyUuDHAKgCP9shE4FROnc
         k7mHtMMTcc45yi5Ag+o6K4VlLUDWJvQ55Gvzx0Ij3WGdXxS8VdjLnkR18zg4nvEK8MIL
         uy/yX1GsZKG8X/HIg+Y6f6cXNr8Bz7Xf+mS5aq/P/fSJ7XYPClKn4I5RF/MmhEHRQfGD
         JRV4f9smCybG6RcJTqi25o16hTKshqyNewHR5sqQJVHr21zdvOQYRGXlw4+L73wXgvdw
         FJy9Um5aK+V+NNQ0LYX/hJqS43zoTpXTjmAR/Pz7avwNkoG2RLmTXiDZ0sReUDOjV7oK
         sO3A==
X-Gm-Message-State: APuU4Z8yeyS23UDM/h/+FaiBSqVKaKk21HC9DZ8qGsvZFvFIoVZ+8jYi
	PVDr+kCthEQOzb1nSHb/JrDjzEcUGoQSZGVDI/ZIc+2i0bH21XM1PJyRSEHhig==
X-Gm-Gg: AZFdTZfMFng0ct1B+YUcxef7EfLWy9sMdG6IIQFp8Pv0Mck8dw5726XrpNd6E6G/XGK
	9+l7Auj2dH6W7enUl0N7atUJgFzewbF2qYPfT1Baxslr6gsmIpkGITY/bPI2Nuicnd28abmNS5y
	yGu/95lUMXGB5z0+eVhaQ0oT+V+6ZDs8ZJ6dZrc+zMrJ0UgXk0D3+1C0hmH1kGTK70T2CZCcE7z
	tjQgaChwr/vf3wob8gMX2NDcjvtslqZ+5I74vxgkGxdDQ/6oUYzYB82r0z0yxnHZPJ/H15HPxHF
	a+VSEhKBB9mjiAsjGdlhLgLNwxwZeK43J9KKwyyCB3C7nthvL5UkZn0UfxoxJNwh871KonbikmJ
	7YW2EWhOEo+de5ag2affF76p2cH9pvM6SmG6vgI61LvT1qvIar6GO6U9nfFAQ6lZTN1FLUuvLbC
	O+KsA9MltC/pxgNryrxeV23GCEszjL9UlBOE9sx7LwaYC/JCqRf2mlkU+uuNORbCWBA0UMZboMT
	m98dIzIeDjKezlJQ7Cp+n0UfNFFuK263Qm0q6UQukxL7Y+0caEtnebhtknPkdY66oPNUMsG7egc
	XM5hr2IkMH+IraeiPNHGMYIsRwvxhK79N8Or5tS5lPPkWzFCRwlxBvIezgATdK4CJFpe1ZB/KHy
	5
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b704:119c with SMTP id 98e67ed59e1d1-3b41c938935mr22519935a91.37.1795784895284;
        Fri, 27 Nov 2026 05:08:15 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:15 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v5 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Fri, 27 Nov 2026 21:07:27 +0800
Message-ID: <20261127130729.1263920-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127130729.1263920-1-mmyangfl@gmail.com>
References: <20261127130729.1263920-1-mmyangfl@gmail.com>
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

With fixed-link there is no phy-handle, make phy-handle required only
when no fixed-link is declared.

A fixed link gets no MDIO bus by default. In such case, MDIO devices
must be placed under the mdio node, and PHY nodes directly under the
ethernet node are rejected.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index a71529825955..2f1c0e0afb88 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -13,6 +13,22 @@ maintainers:
 allOf:
   - $ref: /schemas/net/ethernet-controller.yaml#
   - $ref: /schemas/net/mdio.yaml#
+  - if:
+      not:
+        required:
+          - fixed-link
+    then:
+      required:
+        - phy-handle
+  - if:
+      required:
+        - fixed-link
+    then:
+      not:
+        required:
+          - phy-handle
+      patternProperties:
+        '@[0-9a-f]+$': false
 
 properties:
   compatible:
@@ -58,7 +74,8 @@ properties:
     unevaluatedProperties: false
     description:
       Node containing PHY children. If this node is not present, then PHYs will
-      be direct children.
+      be direct children. With fixed-link, MDIO devices must be placed under the
+      mdio node.
 
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
@@ -74,7 +91,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

