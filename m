Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654549;
	b=30jTVO3shPoTKPIoDQuHrRkYOCBnyoAEaEXnsK2ROL0UsoX7dMCO4PiiLl+Wt1UUWDHz
	 zuWVEPoN4hgNadDU4KUskb/f/uffr1CNffdDNAxP8pQ3t+BtdqGJRaU+BeGLBYq5rfmD5
	 OFnh8uaAjjDQvR0FbA0O1X9bdgtXr+P445kX7VghtXMFoAB3Y2oYNoP6LyyLpe09VxS4y
	 r0CgGkBhc5XveUy+tktSyImKNeUn4QBTPo0VPBttTftnta8n+c375ccGF0qTymjY9Or/Q
	 3ArJ5RxCWbUwdNs0Zq6JcNzwdKwUQQ6dYQmR+dlQ4p1RUF5DhVn3uBHq++0euBCgVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=EvHDFl6t4xTGcLkCWygVUtqBpi9xHtJJhJN+xrAmZyf0fcwvdpcid8xkc46HpTL+7/sm
	 UhH3UI+Mf0gc4OuaWONJWc7EB8Kkl1NgPDlWcf1jVAS+ThTAZQy2w6s4cx53UoHuZzUQ/
	 oj50IbugM5Qa73BfJ8PdRAMg0kU7zbInZpDP26abOuW9/GhcIN6zKtDaiaTJH8PeMeZib
	 2JfFPHyhqtAU2xl6TQSoegDnK3Q+ydudfdPAr8GrdI47lLslt7bw0eKy0YcxZtMjf1ed8
	 aqB7tpk0BlJhnu7ravXETaMYC3TgjLv9pzaa3UHw4ZKuGMWWimfHHl8F1pxkfMKWCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBilkkii;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547A606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5547A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBilkkii
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3485661a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654549; x=1796259349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=zBilkkiifgqg94O2Qze40zl5R4V3j5169oIzwYtebeg8d44E+//yUU5NJCCOh0C+Am
         sQ9PS83u+QAqgs1j0VleQp+u+qvuAccr4A9dWEnUK6M1lg1TRDbnowa6LeaJcj8YHaEB
         xZeILAvDmJ17GPLcZ8SKMVov6xHjpm0KFG0ADjEilte++ywQHEV4mQ4LHHkng/Kx55s1
         FXNLEIYymw15eFs3ahQlkVAeA6fpXYWmGzsbC1HOtchj+ZHBftAwnVciXyQrOnJkgtpp
         RLJzy2R/TNw3YTXl67uZI4OBO3txKNZ6RSxjbyszN+mOI9kZEi8Ozf3VWx6ucdWsvnrX
         kplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654549; x=1796259349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=f8C2zZVFFs5gfHZEV3Ma4ZZhlqGKWz70gyjFVn4ezF8G5K75L1CasXVHeqODriS7LA
         S78uePDW83OZoHCVsHifd1DVmM4vU1kOTgOCiwPo6o/ZpFIQgbz2RGsuAwTKa3G1g7MZ
         a/4FX/bQ21PXNC6zoMGdUvGNeMyHZSvEUxwQFNoi9bSgvN2IsxMMkpeARJ2dUTQJmVat
         6nWfYQUTdz8fPWWfHBj9BkHuBj+thUe5iQ8gqywk1MKV+yDUkreN/PXUG+UhZ/2roCOa
         30RkEm/dYc5mJu9W8Knvl7nVm0S0ZYD8hBfm3fZGEbAzxeLC+X2NvFpmVrj7x/n5arjY
         Qjkg==
X-Gm-Message-State: APuU4Z9irxPAn5F5cHb/up6UYXsV5DvvmNL+RU8KkGvMuQFw2RdIeq+M
	W+5pP8KOVmJ974AkYtfkxHHkriSen+1XT6pACXRSWSi0OMIODcIuSvg824rWJLKy
X-Gm-Gg: AZFdTZdPFIADspe+1gnz0wLeGE9VF2Uf9N6yceoPs14GZPj2xL8FTjNX+2hD2xSm6QL
	oRGA1tyJQVq3Bh8tVHW3DT1bCJznamvymWi6eCGIT51Pb2xYSxZU/Zzg+rIy6aRxoNNAOW0CzdP
	BBHzRkKpYuGfKr/HXCXYcMDHKx9/EfyoDcCQ3Yp9wS8T5nomBczevPWcMK+ZFLLgF6Tq6aZYbj7
	gZHHeTkVIPi7DNjYWU0eFAmZ5jMN9qa2g5fEjVN9O2wVq6WGe9V48AgTyi11/QyhIKicUxrevUg
	5hISA39BCPBpsXuhIP5dzMxx4XuMv28Eda63cJrt+828OdBQhRJT5x033eCLOXl2QH9UI+xzXRm
	DNNQD80PdyqAlayvMsDwW3uneVS9RcqQejfUYTealLb6xiY2yAVbfaY5RwQ+8kiG2UvdCQoTxfH
	F2Mc6ZsNUoF1ZCQwCLDL+wKi+UemY/maZdfGBR/oKW+WuAN4PgUb9I3vpcGI83ZDTHKCYSZ6nXp
	oarjQ++/FBN/E4fqcleVUq0PLFDLYzVUzqWGllNbH1PTP5V+1RmSfW0tjmhYkB9HCCb95aFRlU7
	Ck4HlkjWGSsD2g9Gse4bRAPlKfSwifVKSYnuZWmMLcPV0RT0QZjYfAWz
X-Received: by 2002:a17:90b:5907:b0:3b5:29e:11b4 with SMTP id 98e67ed59e1d1-3b5029e1464mr2151811a91.44.1795654548474;
        Wed, 25 Nov 2026 16:55:48 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:48 -0800 (PST)
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
Subject: [PATCH net-next v4 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Thu, 26 Nov 2026 08:55:14 +0800
Message-ID: <20261126005524.4156940-3-mmyangfl@gmail.com>
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

This adds an optional mdio bus child node. If present, the mac will
look for PHYs there instead of directly under the top-level node. This
eliminates any ambiguity about whether child nodes are PHYs, and allows
the MDIO bus to contain non-PHY devices.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index 89ed6ab1905e..a71529825955 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -53,6 +53,13 @@ properties:
       - const: mac_ifc
       - const: phy
 
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node containing PHY children. If this node is not present, then PHYs will
+      be direct children.
+
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
     items:
-- 
2.53.0

