Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479919;
	b=T40M7K29wyhtyzLde80U9dQyIabcJqeE3u1169+vdpamKpVx1EeBaivGEroL+mZMitFG
	 Y4hWCCv0124dHtxqtAdzHei4HjKI0bdoKRWX1wbZK7DACYW1EMHJxQsDk+8NopmDHlVGY
	 8a7IXsdKRWHJXoDv17ujIup3t7yLYkV8cyy/wiqCbDkSRKWtuYwHBFJFxvungQRdkLrZS
	 vdsatfFhS2ejCFAORZqJu8/tvoJi99TANF9z0Fm9hTtQw+/ylBTCOic4OLbJKXuXwZ4Ui
	 MYqxbjborSZWZua2/ITBZt4o5UKyfuuD1P7C7duIJZH314W0XulrrGT7TMw2j5Oaetw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
	b=O2NDAOqcetuQldduaXdFD7ocqZLuiVB7Jyobj1tUn+MuJQnp/oumEjYCStRQsFnMlxzd
	 L36DXPWxToES9jWfbqn9ZBti3lqT5Z/jh4TeGWCfYeYxxpXOOaG0O9lWRZF4RgVK/oecP
	 i9Tuinct7Ger7HisX7YKSZW8qesw+x+yDW6Fpvf3gNc6V5rLKqe/5u04Z03E5KXvXX9Xu
	 sYVuMsZzOSW3cE/vSBrvrFb/iOXFFpyLj9/DZ9MK+pqZcm/TsOFSVSTf0bRVuiwTbnqk/
	 /FyHgsO2QYrQGPwbidHWhf4KBeX7aA1NlUTVq1QIrQGy892tss5klIGtUqBd8SuaBOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rECP3UTe;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40D606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A40D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rECP3UTe
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2066032a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479918; x=1796084718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=rECP3UTef4PvXoUQb83BYp8pKtAC156zgZJ3/BphXbAbnpzL0nuUZNFmr5F740vieL
         2WHDyllGPPtQfz+I5qAqgWymbjXdkoz4p1MbnjoKV5+WeRZjf/dLwdrVCB2dEb/owk9f
         qF8VyCOUv6xouZkSg2PR68akrT5Y0H9ghrpwO0d7RmXSPvJMZM6Bru7iMxsOLfCZuuIv
         aCi03Wvu/rPSE1Khh7couJd2BX3cqhaYkspnnk5fz+cDB68vvLssulxPnbC+qwrrGlYW
         QYGzHL9YHLagrjSEtqCcjxgcLOIEyicBlm6wGyLvERrlADMPdBpVDotdCIfOBf+oM8gn
         RDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479918; x=1796084718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQJVoXQ5eMS+GhTtT2Nj+RU53pH9NYtB5vD012gHjf4=;
        b=CoRdCQvMydwYHWBxYpYJkLmXmoilTY7ji9dPEDHQ3dje2ky4BaKrZ8JXERI1FfBm7e
         tfjMmfOBBb/6TZvdiK70eHIO4DC+dAt9BIQmjeRIpKvcZW6ZkdsMyzIwU64jVXAwa7Es
         o61UdUfODNt58OoJTEU4xZA6NlWzwkV82xFwppx9b0ZfpMAo5SATu4v3OP480WBXmcIg
         tXWDcEuDcQvIpaAArKFPvLC1ZdtioViS2WOk12Jo6TBeGC53A1pDlGxHnf2Vr0FkQ3bN
         Vrru6Mo09FBYkOoJjXy7AXkrb4RnUxeBZthrMsXx9nH+pQrq4gfOkYacODd3CCQB+Xql
         +iZg==
X-Gm-Message-State: APuU4Z/DpexNZtrT0/sP1PuVA6GTHBJlOJ3reOIEPkK1VYA31Vo7M/nz
	Nxk9aIiom6NoHbriOTxy5QO8LMzFoyEJgBQCdTh9PnQ5xiyaZ4ODrTpf5uY3eA==
X-Gm-Gg: AZFdTZdfizd2e7DxP8XWvyOxtnsf6Uey3FnrQf/IIvqJa4Nvz4YZ3Q9pk/KSVOYwkKx
	+AbofqVAj/9VIKlSeYVhgfqDR+LHodtIYBbgCbyJ7O6qal6Ij++n34Fsb9y3m3rGHf/Iwt2/jBG
	9oFKdyI6FqE+e8I1ff5BRPlSkcCp62lIZtjjgrsM1tgHI3yyz2Y8Pe8HTQZImk82ys5M+UKaolq
	/AWHaPtD8wZoM3viys/Pc77Ka7Ftr5AZR573IXswvrUeiImMA+Vc8+eSgfE3aiIYMZbE4I+HVrq
	MmYakFC/1knhbGPdVtOKqGJUpYzSZcaxZ6+bG6E38xDOmNGBc6bw6zPeeZhRi1iMBpQvxfPqQU8
	A0yr8+EKvpwaRTaoJ7zm9k2bSnq9gBWwKlr5VFmTMm8CJC0Qb14U+A9yyllP3UoOc0jr4oqKCaf
	sBNoTdu5FSEDy0We5qJ7WwZC02D+0YJ16LDZ4U3TEp2HnvBKaPMnAhNBZJcwZYZh0oHbrdYjARY
	+EYUD+1/iXMBDWDKc7H0eM7GYNbKNBXbQvz2qE/YOx3hb5Y0ANMO7CqCKbCrMvSHXEevg42ITbO
	VDsvZQYEe4T+/0xFByCSig1LgNJhiocTlvrGopFuI98mcsr0v0xPB/YZqKNUE6jg/I4=
X-Received: by 2002:a17:90b:35c2:b0:3b3:cf61:dc65 with SMTP id 98e67ed59e1d1-3b41c8debf5mr11489016a91.23.1795479917975;
        Mon, 23 Nov 2026 16:25:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:17 -0800 (PST)
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
Subject: [PATCH net-next v3 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
Date: Tue, 24 Nov 2026 08:24:36 +0800
Message-ID: <20261124002442.19414-3-mmyangfl@gmail.com>
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

