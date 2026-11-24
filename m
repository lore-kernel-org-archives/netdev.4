Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479923;
	b=1JDKymCez0+iWSA3/JwuoeJXkTCrURf2zA05+qZ6a8d3GsclmhD7I9lGY71akPb3vsUu
	 QN8WGBxam1aBxxak+WP2KOi5coCqu2FVwOTRvBwSyjLTKsI9BR2/PPwdlIHQwKcpAMu0d
	 uXy+UqTMirvexEzhpdUIv/S0ok8iqsP9qX4jEHQ8xk/qbXB83gVQT2aC86SgVfDNwJLY3
	 Srm12Jx8CxgyIeprZXYlYPK6QGkyBm5wtFD0DnJEeHAsi/jhbNuu6ImX32sd53XJBvTT0
	 EIcmgMo3Li0mw5DusU+03GYXnY2NVgyfk6Sds0w7dG9IXytbmVXGfMVTlsfnBAMQ0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
	b=JY5KBTOtKDTTFIX8A7Wp90z2Fc635emQAfbKeyxtLpsm/VGXtQDln0VaNjNMHb1GS4xf
	 7v0JPGzgEnbPB3gQwj/NwCAGLh2z7gry14MWDzUh+O/PAbuHqoEQ8SWiXM4uD6yrzqBua
	 RkvRDyx+/RX9TuzMPRHgbgOlCS5JveicCEge+gxarj5tmdFUAY2+JOmRFNlnCfmTgQsDr
	 OVBI8LS1IzBtkZc6mopFQsbR/hOS2S5qwSR1ClvJeEUpf+khROmhA6jeHMSLhvEzMdrd0
	 Bjl9PN35UBNNMZ2MFAMUhx0GxlSQhrdhnW6HpaPOziVKBF1yKraUraOozG2r6UppuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OALplhhG;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8F606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F8F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OALplhhG
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1617803a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479922; x=1796084722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
        b=OALplhhG/xDso0JO0f8MAMqx0CTpmUMkDF1pnd4Hx3sVIAeieDtsDFoa7EgEuWXLGY
         3+/psVPtRA6DfueT+fsG9eTHHMh4bczcHkjf79xhiE6TtdOnYbwZ+/AJP1U2NQ/UNL2K
         2OmWR/8/OkEDeOyn7r6LOPqijwp+rqfC75eY8ZDI4plUwxiNDZqgEw09n4ZiISzgJ8p9
         bIFj0dn9IwK5GY5XovCaTIB1Kcu4TsJsdtkUEewC594cGJvRpVKk0ZZyluwCzJlN26z0
         Oh0iEe8Ih3O7vaL6DRHFYWjSx5y+HS0z7ggjokcRfEqLZB2ozD3loU3JYJsEgebGUG9W
         kZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479922; x=1796084722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
        b=UoS4u/dIfKj9emqGQO0j0Q/vERd1TdT9iq6aQwja+iOTqmv+vtGOx1bPM6MLpYfT05
         XbIlJoD04ZODX/AmPcFxXK6tAVps6YXijznx6dJ49TNE7k/BkJsMOv19MUzDbUIi0wnq
         NKqbmLNEvhXmm87orw4Gp8g0KVENdJ3GG0DXxDvmoJJ5LJ1DdrvE4GiRxZ1DiACClhlb
         Q6SaVVL7jJDGLPSHECLG3/msQtWKWGoRnBg0la9xc793PoCfbkLWy2TsnAK9ceM9XGrY
         QTGWexax6SpSI/oII57QJS+5R3jZhIQ6Zlab1K+1ik+SBCG1ZXdVsFJzaRdbFCEgM/QV
         cL7A==
X-Gm-Message-State: APuU4Z+NbwT2BdNLNITj6Dxui61Im5EamPJIGlW8t0+koM2+EBjj7f9V
	Bt3E2edE+/DfqkoZ38Jl6WgSXg9fXckXiO6KBOxxvvL55kwPj90Pxclza+4/nGFRRBY=
X-Gm-Gg: AZFdTZd+S8JMbTe+38bHsZWl/KSFvYEJC+eWbV5T2TtLv6iCUSX5kiRUIqWDZoON6G9
	qLttSwEG4XtEhcTMdII0q4NYTX1OEScAthYf9/4ijIexD7jZBSBUHc3AhU8PDQGa2Xzcw+shSiq
	WC6yrm+KBpGibLf4LgAwza1Oh9ohpvUfYQ0iTJm5twXSctNuxTocwpAmh1qH3oBigHxcUf8DG2y
	FRsPl93ONRLn3GQ7Naed3doVgF/KxknMxDq8sPTUNLvCJdV39CIENkTJ0MmG86LaldUo5arAB/E
	rUnMSlu2bXg2i06//buFPgirYkbX3NFGaDxApC+YkrFpzMYqb+Lk1J24crym2BUPjlmxFopda3X
	n+PiSvdqYy5YPdBOGGBJF5DrPIIrD3fOpylCxOz/u3S7BtbeW2sppRIqsoP5FtMxwE/XTDj54gI
	Xgbl0blGSiVkSpAaHGFOxTxpB09hs4ACpUuMQdfbdOfOLaUCRLNXFHOc8Av+fUc6ZDYjbplKUgL
	gOSAj1PgQsPj768cku0dztv/2YzlKCeC56rjzxfvse1prwPyxOyWLPDqqwE0J5w/2m/ZRnQ5ec3
	aanvayFvW8JMzBp3uxcmJ5JSnhxngFkNTqGTmTF6c0adtcNNHJVQ2bQxGAgHwS4tMecjWMJG2LB
	YHW0clE7UivYm
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr9742816a91.58.1795479921884;
        Mon, 23 Nov 2026 16:25:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:21 -0800 (PST)
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
Subject: [PATCH net-next v3 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Tue, 24 Nov 2026 08:24:37 +0800
Message-ID: <20261124002442.19414-4-mmyangfl@gmail.com>
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

This allows explicitly specifying which children are present on the mdio
bus, like commit 4d98bb0d7ec2 ("net: macb: Use mdio child node for MDIO
bus if it exists").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index d129aeceb641..a176870079e9 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1101,6 +1101,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct device_node *mdio_np;
 	struct net_device *ndev;
 	struct hix5hd2_priv *priv;
 	struct mii_bus *bus;
@@ -1189,7 +1190,9 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
 	priv->bus = bus;
 
-	ret = devm_of_mdiobus_register(dev, bus, node);
+	mdio_np = of_get_child_by_name(node, "mdio");
+	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+	of_node_put(mdio_np);
 	if (ret)
 		goto out_disable_clk;
 
-- 
2.53.0

