Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479927;
	b=RoCI7uGu2DX5OPcLciEo6yuC/Lj8uA+RDnyHxU+LF/COIJ47R8wB9Da4AanEtFn0MDLy
	 8jHezQVuzddbHpk6fA/b96k3w5vSpAPTL9F8/A9LNtceO1Z8ERB1bhrcHwGqNjsPUEaKQ
	 /wX8oAF0djy82D4HzUFfyjfAauSC8bqfxq12luHNJhCpo5izjqEvAq3UP4+aO1FHzKRcU
	 KXh6xJ4jd/DcEjbuD+SvYfg9Gns1TOrxsCPQQ56ov4HNwBnw9NqfS77tz3fDg1yq+qSqJ
	 igHodh1Auq1laKDlECRHrAjEJfdpcwSaXI5QAkvrWjrPebBXw4gjTCn3q74J2XtOv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
	b=tLLcDyQACpG4o2Bp2fcP2xOv6U18w82+KOHqVJjcRLUcZY4bliCABVkb4vLH6MpJlZp8
	 U1Vxkj9nS/cBo0HY/7ww/1JqW+L198yNMKFnjmpSKR1FHCsPH6aGo7XfG7t1kx/yNcijB
	 LHKcvOMvdOnq0kHfTUkCCIcJhazgrGCV3DcNWFlKVYhT/vlrjRpZUDg6jR5fvTYhIcKEV
	 K/zsjQ9OwRdLgNtWXmMRVjTM83obfmUuZXHQgbDQQx1f9ZclAsH0x6VGFJ56ZPeUMtvJQ
	 ukgREom/LtpzzTIrjVb+MfCOoDuWad+PlbZVvHo7GXrn0vjiv56ZlH4uICwrDmq1vXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQ3V+p7X;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99D606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD99D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQ3V+p7X
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso2273367a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479926; x=1796084726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
        b=pQ3V+p7XpFz3L0RiRxfOe37LEftFwnjJUfheHE2GQc9FloqVmSLlnjNFBuSQnRkt55
         d4OVcCXroIDwhyQ/QfsLtL4VNLknHrKwvxExMnKmz6oFePLyWTlcBef3jR5RGl94puzP
         OWSEtIlNmluO4A9Z3GSrJiWRlh3NBqG2ApxvdnsU0TunOR9qbmgitaOxT6n/Qm4TQn0T
         Nx7rILM6sRVAr5tbrgQLSSQe5UgpNaUpEws6P0xOUleaS8sSn9VPvFEblyValYI72JuY
         cRH8+rJh/TH4CoROwSNtgTpoVQJq88RwWAU2ZfNqoWa736OvWSRFcZmhoKuxWPS376rj
         JTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479926; x=1796084726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/olSOUiAdwLPWk2t+WKBg+xKoNXxwfZMz12DJzrXtc=;
        b=aRiQ+hZUG75cUJz3euxHXvsy3vn35CX0upMwlxaTQXH3BTGDjWxhxKCmeJgFLkB4BM
         /lSsHKczKRIuuc7iQHKiDjHsS0+W693GjoQEH269U/0+fY6C094iHv7pZ8RFuoUOjw6W
         q/PK59g8bp0nmV6/w5xJx4befFIe4bTPl24dJHAecoZf57OGpExg+P7GIWSmm5LxIkU3
         1+y7NFLMcf3AJK2j56Iiww9q2esUwEbkq7naziC50WJDuFOaL1exIJcITUT+7rUBpaRg
         rODV0wnbwHyVor765wiiCmBgEvCtCNPRb9iamusUIjnIaswuxAmPWK1x3UFcfUE5D0dK
         8UDg==
X-Gm-Message-State: APuU4Z/UaYQSKn5eoXzwxLAPV+PjqFcNssvGO9r0aW2JKeoVvBUJOhoV
	hnICE5VytC4uCy14tj2CduAjRiDy76Apc/TvaT2BsldZSdhaURJK7sGuzX/D6XJ0Cu4=
X-Gm-Gg: AZFdTZeukEmZJoJAEcodzRWJo9ogJHCR22RdO1ittM68RefVzvrIBSbRhn7LHiqMpNn
	O6jIrYlWudcw7bYrGqsZVmczNI+lAaenfbJAYzb744d4vPOKXetOOO6n3ErztPL7bBcXSjI51pI
	8GFsCpqNE+zk0VzNmtdEoOx5qiQZRZYtqVxwRkv+iVZ7znmHueb0GeIvlgJTAqwsA3fFxjd8lCr
	fzCNoCuQhlyqqqYg61aRf+QPhiHeu5t9ViftyRx3EdKN9Zp1k5d5i9IwJm/Yss1QaTBYeKEZHti
	3WVPZg72RxjIqHWQhWYjOXkRH76DOTEHVeARkoIRA9Mutov3Yyk3XQdNn48lU12volrs2oMVjtm
	oVn2KZVYSkmz6sRp6S2J82WD9Ci0vOVCgDfcPrkbdVuMRccqmVoNbwRMH7QSLO2fmoqLpFywVzO
	isFJK92syg2mIOc+HCd1QeEITWHiS0ULjLhMIsYuvB2F0MNi82MQy+F97ZSE1ZDx7yX4X1jbZSx
	o0TmLHq6ufjduI4c6JK+JqhXqk08XViYW3orB05qlcc8j6ZwSV+95f72ECi0hkh1jyhWY5lepwL
	yOjrklHL4JzKCSdCu2nZh5ytL93FeeVNv4zqKwxeZWX5oaKNwj0WkurZUFa7SaNHrM0=
X-Received: by 2002:a17:90b:5847:b0:3b4:6094:2fad with SMTP id 98e67ed59e1d1-3b4609432acmr6528704a91.48.1795479925874;
        Mon, 23 Nov 2026 16:25:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:25 -0800 (PST)
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
Subject: [PATCH net-next v3 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
Date: Tue, 24 Nov 2026 08:24:38 +0800
Message-ID: <20261124002442.19414-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124002442.19414-1-mmyangfl@gmail.com>
References: <20261124002442.19414-1-mmyangfl@gmail.com>
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

With a fixed link there is no phy-handle, make phy-handle required only
when no fixed-link is declared.

A fixed link without an "mdio" child node gets no MDIO bus, so devices
attached to the controller's MDIO lines must be described under the
"mdio" child node.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/hisilicon,hisi-gmac-v1.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
index a71529825955..c283c1b6ac72 100644
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
@@ -58,7 +65,8 @@ properties:
     unevaluatedProperties: false
     description:
       Node containing PHY children. If this node is not present, then PHYs will
-      be direct children.
+      be direct children. With a fixed link, the MDIO bus is not registered
+      unless this node is present.
 
   hisilicon,phy-reset-delays-us:
     description: Triplet of PHY reset delays in microseconds.
@@ -74,7 +82,6 @@ required:
   - clocks
   - clock-names
   - phy-mode
-  - phy-handle
 
 unevaluatedProperties: false
 
-- 
2.53.0

