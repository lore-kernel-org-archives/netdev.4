Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388556;
	b=K2D4ZyM7JKv7sxk8B2Qq5RbN2+nCI5FnbMJsaMEZcu7i7n1DZyllcc7Hz1VsjYOB7O1B
	 aqNjf4Jx1pn4dTLu09E1EZf+IlbCaqmKcmFD3kZtf9h1C1aSQKTE6609Ulf3elE715iCR
	 e9FIgCYcxz3nVAmJYPbZnCbRFUb3gKAEo50NX6fWAWHWMY6SAi41xBotrw6047QUgIsdR
	 XBtte/WZcsMSf6ry4i94yVlZfEjYxKiIKcVau6HcMUC9E/n3yvK/D8E80NnnPM/6c4T/F
	 qduH+pqXm9QVxTZZOXJZc9LYYYM4QdR+aTByT58QcanCee+BvOk2M7ZSjrG7K5UrmOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
	b=tSur4jXAe1ZVsdLRa/fS06LPt7c9/A1b3WA4dIbMd2u6QcGPMIQHlcsIr0F8EKPcye+p
	 NbyvEUKx9uZTNmGOGv9yOZ/ZXLxPtzAhOEHah/F97JsfbvWovM8gIFTEc/KsaFnwKC/fI
	 I83GQ8lzNt0ownJaXkVDhR7ABrqvcMXbQztfiHiqAzz73KBgOotbG6pgoyEwhH7EHnQcS
	 v+pl2dRitDg7tO+12LJa4KvDVYG1AdCX7kPOuK5LLOELlgubb7qGtPPIxFNXzSJkHH+qP
	 G25pCqxqjt7Jn1AjA1VPMWUzuNPC0gSSQEYZ1TWtmtyzdx2uER1CE1Ae+XzL3snd60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JcG6HLi;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87700606A31E
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87700606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JcG6HLi
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so1740179a91.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388556; x=1795993356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
        b=0JcG6HLiJt3Hx11OVCrBA5MV0nzLO7ZRnKh/SFLqjf8r3+gmYCeJEr9XzIcgTgBnnM
         IMFfwHqnqtt81DA7SA/zasSU12HnWcA8KO8NoHjafCZiXG2/l62IPJl4BlhfEUMYyd3t
         I6ISXaSDWCqyl/1HxhFlEAxkc3H+41bezTBCAyC4nIP3Ikng59HDquNotJoCmWWtmJis
         Qm8F3/4NTmZqr8ORagEtJrmy6kpgFXOqlZ8A5nEeLHXzEoPPrKkBaKqfPIRvYmtUnjH0
         fy4Js49q9dMrsUK5fFb2AAS1I89Uf3fAbTlQ0LaEKPhQpB8LaKjhOAGa/Y1dUpFoDsqw
         /ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388556; x=1795993356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvuQbTGocUKQ4aF1zR8+15VyxR+xxWsbGVLohKjl5TI=;
        b=DNYWZ9s6pjHyfyLj06tJhev6N6MpA61SfZ2MqocgHqSJuG2uQ9py3KJ133323xyeSF
         I84zaH8aBLhu1qE/yI01VvSocmPcO6nkojcs7TABDqhUAahPRtTE8LAXGHYeQMFc2bO2
         bxNFKXY/1kcV/afR56mmrgJM5LswSHNfJV+kAoOUMFEWCZnag3shaOVUih8cPFvLGdeG
         oQNsdwt1oXUUaHt3Q1mKon8gcjMutWszwmGDcEE+iGlbFHt3eBFY6QScip/K8ORf0AqG
         S8doBwxMSUeUfLQOw4GnaklbqT0tzHLTdQyQyfL9wQgwtKaCXXn1XRCuRz8MrXgjyEjx
         TBgA==
X-Gm-Message-State: APuU4Z/epSV2jKrZOPi4J0UP4Hj+EFfRAjY1mZZUTePu7PI6vzz+WAo1
	Dnqm5hgy2dzLHDWtTDpNGupHuJuloj/3oz0QQBNJkYBseW//5bmR8OVp9lBQOA==
X-Gm-Gg: AZFdTZdSfZ29rjPLp5mybetM6hGO9CEsNtLRWvCtdbsJeYlWs6XZvXpregi/xhy/1Kj
	nXsn0vFIAXXQLj9pMOHaAUAhoR+Dk7qDZgv7lNrw9jgKmJ/iLT0FA9Kq0f4rxWAU+8SrzT/yJUf
	WIR1PMWAJ1XQsVWVqkqoW79tL/eEBibPXrl/49steWNb8VzE/5Qhb8iuUbGKZslWkY3caeuNAQh
	HEmVjs97QaCiO6py25KNxc1UAtRefaI5AJv+ZfEhUYOqhn9Y1r5gEYpCQq9QKwnieo0XPCcy25K
	NPoXhsCBwZq/pBjKQ9tXhKVv86dGnZtLkBbM0UtK7cHVN0gf78XL7WSxUFv27AJk1MZAK7Pi/ix
	4e4qTaG6KKsplDN5ZNmEI1PDMZvpQfx67mRWfD68QM5YDn1Aqv4bnG2nbfxWtXGnP1hpt+pB5yd
	orK6TJaggm61A5FOZFfrriV2Y8xFtU+aQhCFrgerUEuYYljS2u7IahT5ccQy4OjhrCaEHXZ7hO0
	s2DXzTj+bmHpXTvlI3re7L2TXsoIzuSHsFRLrgLis+stPb1dWcLV7mAg5kqY+MtgHwYiAg2zX5r
	8GY6G7nJgP6ZkuUaNiFJQjXl3sL30f7w0E2NXyXPSW5s/M/wpC19K/RCoTl2QefofZo=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr9910490a91.58.1795388555726;
        Sun, 22 Nov 2026 15:02:35 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:35 -0800 (PST)
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
Subject: [PATCH net-next v2 1/2] dt-bindings: net: hisilicon,hisi-gmac-v1: allow fixed-link and mdio child
Date: Mon, 23 Nov 2026 07:01:30 +0800
Message-ID: <20261122230134.3366017-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122230134.3366017-1-mmyangfl@gmail.com>
References: <20261122230134.3366017-1-mmyangfl@gmail.com>
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

Describe the "mdio" child node the controller registers its MDIO bus
against when devices are attached to the bus.

With a fixed link there is no phy-handle: make it required only when
no fixed-link is declared.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index 89ed6ab1905e..ae2b1505a52c 100644
--- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
+++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
@@ -13,6 +13,13 @@ maintainers:
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
 
 properties:
   compatible:
@@ -53,6 +60,13 @@ properties:
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
@@ -67,7 +81,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

