Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784886;
	b=wfzH/xNSblA0GOdFgnFymSkccp8Io8eNZf8Tq96FrRnRXzxjY1xeJbnK1PDcjzDK2ioB
	 WVW/CorOHNXfv4rqeVusYuyCNTIWf3AgVFPh/wJxEbLOoWosCA81/HiNv5I9rHc07c1HL
	 LK+iqcrd2g1D5IML4UF7B1IxqbyvgkFl6EYN17Nm2okSTw/B4fz96JZPxxM5jZ1DfrF6f
	 reBcwK+UNHpAVJHbru9fq5+C5LP/d4CNQKDaHfK3DAAIDOVJZ8k+AwlZw8HSZkVV1r7GJ
	 AkwFiNxrwv+YTRlWvXZGXxP3aBwc+PTdcgGp4DzWf9YzEa58g7Dz4pNEdh7PD4hP09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=nm5nUqsiaic4ZmkVy2L1vl8/K3U+gySqhP7DVgjeaYqfy++0J/NL54vgMbHX50i80GtC
	 TE1AFGdnCSIpAZcctgrpLxoVllMCXdqOrteuSQMn/doWu/TrRylU7bxzbjqBuw3ebpsE9
	 J4dv//hr3YqO+o8N759El434nMThiOVPaBUWzgIaPn/sz7whIfQVF+7VQfBDr71Ly6yfM
	 mMahhlLvSQgEaxJcFgRm0i0GqNxOn6Jv1OA+aMXPKquMwRAZUiPHH4JCEwkT5FpMpwhuD
	 7/qVgChZXywuvsqh5RUww/JGDnWt+pGSOIb/1UH86aBNvy2OOfUa6aZgjRdtxkyJJ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElXf2h8h;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCF606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DCF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElXf2h8h
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so5030153b3a.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784886; x=1796389686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=ElXf2h8h9nfTtFmf2DWYPK8CucPykSR6O0pmk1h6wilQ5yCxJoP6ogMBMhPJbmgkpH
         Vnps8qhtZPL7UAeNzYJ/Ec6EkQabz4Q6vhiht9X57T8k657dkrGSvh2iMQZXRbiz/3tf
         Lo3SOyD9XMBW0tO8e8J+EpRji/GAreh/xZa5McKnJVrG6QcwZgbDHFtpF2emy9reWNM8
         jGiJ8x5SGceNEBcmE5waQksUo8rZBHkPN+sTyOgODlrFqa+biXsv2LarREkIsi2XFFiq
         jHslO5dEm+UbpUHarQkm1wIAXrLolPQftFBIbTV37snqdA8X1sFhTmOhGy09ZEA4z6XA
         lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784886; x=1796389686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=Xw2gBNaLyqpAFb/ZPtxO7zqtqBPS1BipuCw2Yo56uh7rWan/DHgT9Iy0d+S5e8ZTqy
         zH/+Tvj5bNJpTBbHaH/Xs3m895dzBJV0nEgCDJWLboNq54GOI4qaCy5hQpwrHVTV8k0O
         JSTIIUq9a3ivmqrxOYH1DWNj6YIjzP57CQUkoVXASCVNQvqZIppCNmGddDvaShoHo0CK
         rH88GrZi9woNpXOvRObSZuFgDpFDbLKr14hVCGEvO8zmPyA5dc6ndhqMKBBPPkZt96jR
         Nii2kgthVb8h+uPW14eIl6JwvFVlzV+alisQs6nVqcVbAarJMgdcIgYirJ8kn7j1nfzX
         SR+w==
X-Gm-Message-State: APuU4Z/L7UkMzaaUcblIfcGRMVULLE/Al5ifEeSIqi5+/1m6FPqnW095
	wrjdgEmHIrWNC7nriOCWANUZKL95SfODKFaDxK7epu5mjmpw1CoYd9ErPYOzXQ==
X-Gm-Gg: AZFdTZflZtLBiexu8dxjCrrsFcSru3tmPjEvGeBG8/Z368QgMEq3btfg72b0VjB39a8
	rJuU2OmDRhoqLMM03ECPAC1qa4d1aTvwjJYK4jircLHZngC1qbrvfCceZCp6qe7uI+NbUpXYwoO
	fMyFKYh9NOrbC0Dy6MT3YzbLE4saOa9qXieoq8vs3DJqDM6niiA9l5J6yDsRxtAqc5eh31ewTi5
	Y8uECOjgGCIFw5BbQFZ+uwoT9seR+01cwCr/kw15yYD5qCNUquJuad631VldLBWS6J4piPNWm5M
	kmoaYuqhnUiQx2/LzN2sr65Ihkxh/oAT3H3OYNii87btBfTolNs9MfojF7XRvj56n7YMyW69uXP
	X4pfD4AwYjncZMVMwebm8PIawM7Fw80oWjBU8gpcyCX20EF241J6x/iOOjwnlUJHe1UAw6tl9j2
	U6qZqxKjwqBFqo4dQzgWWURhHpPeWZADDqFLVDJbQMI71Gv4Q7eQNkInA7vsuSywzanHN+s9djb
	N9IAg4HIISNxTjZjXvuG7OujxTvpz9/gR5VWsCgbCmvy7lAwKPVU+nK4R1CiwLZ159Xj8xGrXhu
	sQN7YfvmXMfBiKS2aZUPowUQ+B+jq0pJiGwDZ5Vc/+j/K+f9EgxSgsw=
X-Received: by 2002:a05:6a20:4303:b0:3e1:379d:f953 with SMTP id adf61e73a8af0-4014ca45151mr26753532637.57.1795784885543;
        Fri, 27 Nov 2026 05:08:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:05 -0800 (PST)
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
Subject: [PATCH net-next v5 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Fri, 27 Nov 2026 21:07:25 +0800
Message-ID: <20261127130729.1263920-3-mmyangfl@gmail.com>
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

