Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867996;
	b=1D8M0NG1hjFzzzQaGsV8yCuLI2SmWPehL+doq/5GCQ2F9u2wrDmhVjeGoGlRkP7Lt/0g
	 yjcbavSfQJFWbNQ0m+U+bCNmELDn7O/At+JUvySy+mjvxBPSGTxcLfkUDreBw52GI8YPK
	 z4CKhyXAa1stYk6vXUmnJ7PUUoaWFodMqtZtNlmBG2WsEC2vXXzsAxl0lMe5A3AHWhy2J
	 jGp68z/KnCDWlVUZrqBTIx/8B0m3ErIt9llY4O4iUhUqtiub8wW+G4a1EVb5C4lx1W4P0
	 PjFrzT6Bni0Hsv3xJHrpE4mdtUYrJ7Tlas2N91kvYT0qyckXwyOA8mOBAkg4lHWEzxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867996;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
	b=iv4vimnX82O4fc3WSchPuLbuhPvkKGwiNNn3vQnTN3ryOl4KRH4ckEutIYG+8uQlFZys
	 em0aN5zw7/UryKo5G6ltCpZquTNbJ3fWkoTtgyymv5TMEr1hWUXCKzsxBHjo/bAo4lnBY
	 ZxCShOPkRA0/Z7XNd0PuE511Fokkvrh4wR1kmRQkVJ4nb6qy4hy6W5qYgYCse48B254Js
	 HqBpdrRhLxPE/kTGPpU/Xd3EyZLqd5Hx7AtmHnyJIxH8uvkrUm/rq8qZW2wBZchvsYxu3
	 uY6HVRI9ajdVQ8h5M1KhXP4t9Dd7p6dWZWZWnMcYUm8YEfYEqAqkgLItdYZGY6cPJwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7B606A33D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E7B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2efd824d492so2245755ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867995; x=1795472795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=nVItbvcg75CEOTvLD0w23wQjxDSfF3mCF5/BJcEMqzmcwmukeyWZEPBkWJpBQVST/h
         JyY0dIW6eje9IK3/n4F5M1hfoiAdciXnLUHr/qnDeNbDRu3q4uWy4qznAXtApFQLIbi7
         oV9SEwxxZRc0+DArhaNnh2/EjPkg6d0oxOWkCK9ig+gOXBBUg1wXL+K9QV04GEEJNoX9
         gs89KlOSgpeJsWMcuLKcV4FPFDgGJgeCvIglcKWiGtmbYgS/WV6cbPo/hYACeCK8ZZ3I
         mHdfE7pu2EuDYgW6p9uwzBehOAbGvGNqIYYNtrXHdTfuNBqBDqscn9bzUjHu2Eahi2ea
         nIyw==
X-Gm-Message-State: APuU4Z98/cIGkUbsaZPMzR9uhP/9FfAbGJ+pE2L31/kdTHDVINUJI6pi
	sScpHGgx362oNQciWNTvU8+JDZ2GdpQIeA40ebqqD4qyM95XR8P9I4HsWEqazTlGRd5jvNAl3Y5
	g4Oio7GO9knKZesewig/Z30BHNp2HIkg6p1aO/Kxn3jZG4LHV8N9eH+gRVe1GfLvP/ODvpNzII3
	YAhum6wfImzgLazpS4Cttj159JEboRjOg3ynY//3N52bQS5nC5W9dlss9ticQCHauwF95MTRvOL
	trSeRMWmvuMo3ec
X-Gm-Gg: AZFdTZdQxRWUMblYI8ux1xulF5Pxm0BXZMKvYBQQ41lztKjXZCPx1fTrFoDdDl6V+py
	Dsx91TyMMzbVA/CiWkShVQ0os+JzNQxhRnee5UgVcow/JQmAgJXmoX9EobickLJpsIdAdyvfUbi
	bNx9hIV2+OaMK54UjMIBkVjJrBEgiuGHssgDSEQT6wzIgm7yB/KWtQOgKwaK3Ho6KwzRFdbXlV4
	WIp8jD7j6Mbt34jlh2CS8B6w3sHY3DDOvM64BEkdR5S8a4ifewbx+kr3b0CSjv7/bkXZNjIkQdN
	SNpbIlidN6ijw154E4j38wPqkxIxNLGtXmdIR0jsIPY99KDCdtKBX2E6dGeweYeQsKWMpeGnqG3
	m0TNTfp6wxPg8TDw1uYisF/OA178GmufrjkalYdRmiCnoNLTREaRPdFb1Pj90G6TyTnSKflNtzQ
	LTJzaeJFBr35s0La94axE3p1J/QFZaYqDt9PJ35MEL1Ng=
X-Received: by 2002:a17:903:1b70:b0:2ef:d07a:37e6 with SMTP id d9443c01a7336-2efd07a3a33mr15848715ad.47.1794867994842;
        Mon, 16 Nov 2026 14:26:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7c3872esm339795ad.54.2026.11.16.14.26.34
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so2242661eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867993; x=1795472793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=Zc89SeilmA8pkJTOitA3tWQx2H35lHyqkp7mwjmsa+LSMkFk9eXsnruIPJqWvTd5qY
         HHlAIzlV33N9McClLBxdYzPJMqI584oQ5YCAyymIYRrIOPP2ZkPbut0lFgM+wgknNiYn
         ootihCUiItqsD6KhtRguTInxgVRlV6FdR7njs=
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195233eec.22.1794867992746;
        Mon, 16 Nov 2026 14:26:32 -0800 (PST)
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195151eec.22.1794867991619;
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 4/9] dt-bindings: net: describe the Northstar flow accelerator
Date: Mon, 16 Nov 2026 14:25:14 -0800
Message-ID: <20261116222519.1416501-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the BCM4708/BCM53011/BCM53012 accelerator register resource and
the GMAC2 consumer phandle. The accelerator is inline on switch CPU port
8; GMAC0 and GMAC1 bypass it. Document the additional port-5/GMAC0 CPU
connection for exceptions that cannot safely traverse the inline lookup.
Keep existing boards unchanged unless their topology explicitly opts in.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/net/brcm,bcm4708-fa.yaml         | 45 +++++++++++++++++++
 .../bindings/net/brcm,bcm5301x-gmac.yaml      | 27 +++++++++++
 MAINTAINERS                                   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
new file mode 100644
index 000000000000..f744b23433c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm4708-fa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCM4708 and BCM5301X flow accelerator
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  The flow accelerator is inline between GMAC2 and switch port 8 (IMP0).
+  GMAC0 and GMAC1 bypass it. The GMAC2 BCMA Ethernet node references this
+  register block through a brcm,flow-accelerator phandle. Miss packets carry
+  a prepended accelerator descriptor in place of the embedded switch tag.
+
+  Switch port 5 (IMP5), connected to GMAC0, provides a second CPU path for
+  exceptions that must bypass the accelerator, including TCP control,
+  low-TTL and oversized packets. Describe that CPU port with an ethernet
+  phandle to GMAC0 and an internal, 1 Gbps full-duplex fixed link in the
+  switch's ports node. Port 8 remains the data connection to GMAC2.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm4708-fa
+      - brcm,bcm53011-fa
+      - brcm,bcm53012-fa
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    flow-accelerator@18027c00 {
+        compatible = "brcm,bcm53011-fa";
+        reg = <0x18027c00 0xc0>;
+    };
diff --git a/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
new file mode 100644
index 000000000000..76fbe2abf515
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm5301x-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCMA GMAC flow accelerator connection
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  BCMA enumerates the Northstar GMACs. This binding describes the optional
+  inline flow accelerator connection on GMAC2, connected to switch IMP0.
+
+select:
+  required:
+    - brcm,flow-accelerator
+
+properties:
+  brcm,flow-accelerator:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the BCM4708, BCM53011 or BCM53012 inline flow accelerator.
+      Only GMAC2 (BCMA Ethernet core unit 2) has this connection.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 56212dbc9a0d..dce9a88f4aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5669,6 +5669,8 @@ R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/brcm,amac.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
-- 
2.53.0

