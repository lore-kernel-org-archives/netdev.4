Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654558;
	b=ixnHv/B53lGEvLC0LHySSlgf89lkXH/HBGVl3IDfR1RVVsPOsz/5fSwQ3hhQ72IfJKe1
	 47vLsTX4LkHg/hknWPHivNxRGeKBuDpnTkXTfXXcVNNAArw/N7yWwGXZ6Ipsj45lDyBpC
	 9YsQYa22cj3Z10JrNpVvh5shKZBVrWCPmQsYyoBI2+NKNOKUi5p5oe/D7g8AhK4firN4N
	 Q36p1GORgmdKZYW0BFPAWwV9gZrfRStqBJSitP6pToSiI8hdzVVF28RTYWa7LWpjRm3YL
	 BzB0pAvQ6W7HbR1BD5t6uubbzi9FQC20c01TgdnvJESr6uQmHV7QvQh9wOidWZBgBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
	b=CZr0N4thuL6W7K9E5j6xfSoxdFMpE4Fqj8kzUB8FTCK+DxAPF2QeV3ax6j4he+d3MZZI
	 uOvXe91cqA1Udw4YpTGEj162G0B3tbB/cUAKWlxAakL1thukLC4AZbglKpSn2LWbZS+6U
	 x8GJxGWJAF4ZKVdFZQyjEKkBnyTUys8BUpnpTo0RoYunwCWax1dXdKDM9XC+wJJodqTyu
	 PLuohTD5iDmbtOBdYuvgDk/UPquK1VIC0toEOUHMTV9vOtkdiuiB98mi4mypraToKP2ZU
	 t79xxqNy4T3CRyJ1cORiJ96x6QdpRAJ2MzFkIub6Y8Ci8116A84g8dyA+nnavx2GkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS0v6dM3;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206E606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B206E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mS0v6dM3
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2650663a12.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654557; x=1796259357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=mS0v6dM34dmq24ORBQlAGxRzLZpimVTFq/HyDPsV+wRXhGFN0g2uWelBgOlngP4w3V
         8qXpNWCoUz3D97WHoF2VqYcaVyf70slzLC2Cz8Jo5GFxDPblwcq5IlCa3FlLH4qTFSAv
         UCpE9jTcN5wHWs8NX2ht4heEQUOu4QQOyEek+08FNmChWdEZ9cGhio1qpUjxuQGTsflP
         GyW2GSCpmU3OY8Q5B0DDd5N8mgg5fxk4rZcOYFcvKMISd2+NccOVOKB1osG9yZ8ErASg
         UBbtYU5wtygfOHhHLPvHRlW46mILgnotxvW6qv9C0kssijOpOb2pXCRMVAVtKUARwBHW
         YihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654557; x=1796259357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ResrWIg8WlUPSbGRXxe027e+Ozq4UlXVXw9DpaZlzM=;
        b=qLU5jxOkBy4AoTFP66flDVwhvoaY4hoIbgzyuapY5EOSShDhLriQqqcwj26M8Q5q29
         +Tqsh/HhZw9v25Fk+Ov9oehJczJlanYWFqS8966Ch9YHTIssS4t89RPh/SRorV0tZiKh
         1lNytBGN/lWDU1LAV4qmDuiofhKd37dviu3wNzaYYzVCFLeCsob+Nn1L1zjbubXxIiM3
         CTeWS0O+mUeUFLz60Rtnwrzec+yRlNztzo0Whp0sgeF81OC83FHJLXbFQOptyF4Clg6N
         3kJLSBt8xopakCwRmq2rFTv1Dg3a1kA47+7egMJvmn8q4uEmGcNlJh1mB8xqhd1KGCPz
         VLsQ==
X-Gm-Message-State: APuU4Z8iqo//lByNg4kyrt1xJvuIIEBdfVJB/tphgxwRh+z/DZ4HODTI
	RI7Z1Fxv0lv7qdJpJ9Zwogx0HD7ccHmAfkLVCpt26k84xERU6ll7ra2iyYkV4ZnE
X-Gm-Gg: AZFdTZezSNFOTBqBHhtXYyzyIPkakVR7vkRVHIU4LPJ7W5ATR+XrSHPSYqCIygkNc6e
	HPmD0oVUYWxwp/YJBpcnNgD46CpN10GVmd7DaXipiN6rgsM6ZuS33XLdY0O8GIEiZyEnsF80pFq
	oKYWG9g7Rl7Q4k4uz6o40IXksGLkNfhIXapghRZd9zJUwt8PJE1SvUxs92t/mFOcR6b+geJ3xQT
	PW8nHuFGJRFNGZbHoNV5bhQ4vcgWtWNFVTUnbEGdYnOjK2b0a93v7FQkNaAYwzDVbxjAd3ZYCNu
	FOTDDWRrQt166LTHhKjeNl4ODMzKzPJhuptwp2c0yWFf5g/1pzs+S8/kpJUGaouZpYDlQLVWlN7
	EDljKpmTBAJUEHi491XRPalqz5bn+xfV0zNzilhwvZh5vzAFihRYPakXgBfjrLBbZLfMaMJQICZ
	T7tiyJPe2QyPUuDXfqp45MpJpObdk19YsdOGUCkdzD2kXHYbPirUa3g86eW4KKSXcxKoJgYZjfJ
	ZbmXIOyaPEblM1xHn6OiP9yjyoUGOsZoY9O0QY5gr5WDJm46lyWiqRxQwTGw+1Sc4r5uoHJ5lr+
	UpBP+nzYNY8qLz0goHc41RfCqHIqnNu7xUYKo48jgZSK16ifnDLjplg=
X-Received: by 2002:a05:6a21:3b92:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-4014a2766cbmr21986444637.2.1795654556886;
        Wed, 25 Nov 2026 16:55:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:56 -0800 (PST)
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
Subject: [PATCH net-next v4 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Thu, 26 Nov 2026 08:55:16 +0800
Message-ID: <20261126005524.4156940-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

