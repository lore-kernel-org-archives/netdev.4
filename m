Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784891;
	b=0DlRalCLyg3CzWUp5ArU+7ncrSLuAh+/9yev9fvUnkYL+N0T6dkvc7uc4w+YbrS1Y7wB
	 kW+BsrXJnMAeFsGT3jJp8ynUwB3wOHL0gTib/93IszROOUBekqu3QuObiUNTdJcM7UsiQ
	 BWFtq1MH5DarpOi+R4ziiaJZBrGt6gMYN+x7Bsrz89GDPL1QsxbSQJolBfOVc+yBYu2hd
	 wgOS+3NFW7kDy8KPIHqGbpXfx8Rz+tlqILaFVcHN4R5cDw3DItxCRp471c/xbwWI77Yer
	 Tx0z4kSpbQeUomsAAr81KpjKlR4wjK14xnCUAqOPoq1wQe3ePGFo6RN9y7yVon5GF+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
	b=aPfvZfMZkoNR+yvPIoK63FbysW2z1VLwaYRMg8lHSXJ0kcw1iI+CwiCWmrmaBysk5dxR
	 cjh9Uc83EyaZJLuxScZ3BfnnVspur4HHy6wJpJ7mxF/sdXYCbiOyaPuZLpXH2LJEo3h9a
	 RM8WpiN+vQwwSv204qB2u2rkqNeN3JCH9JBTK2fEmwi3CyDnjmpr0efyz5m7V8j++fCs3
	 5s92+mRC8FbVgZVYQZJu7td0+kj8LfJik5WX197Tmnp3yvwUHHocmfigdDQua1ZJOG2wo
	 J9v7xhwFjnQno/cKAalnHACD3Hy9XMVL1OWT/SiOQxd/XSRbT9EveoWZqF7znD7kCcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpMj4PMJ;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A61606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpMj4PMJ
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3760652a12.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784890; x=1796389690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=rpMj4PMJ9cSYUw+lSVf0BIvzWYC0SJvTLMJMVOf5cLzKKPpWrSjPQ15LH5iBmH05tW
         SgGQ2i+XmDEpsjeYXx6Ko4HTIGq2MECfFlR9etF5tHd/aNdaGbu9LrJ9zxwKCb2qybYg
         7WX8CuP5cZ/Po7A/bKOZwAhTvRlyHLoTeUnlC8QKGFOAyXNtgOhD/MMI8hdzrg5ysVL5
         gcf3uvzYce+zoICfxQg/44hY81D+r4VDA5UbN17GOJ6u2+ewcsSgV00MXhM5lfzmtWde
         s6GscGSfUM6d5eWk7lfK4MAbpTbsu6elK9yWVIjYYMd548ew1KkUVewkMM4JgBTULBsK
         UraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784890; x=1796389690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=Ejbp5Wp9caAR0oCcIjwkDK0ek9Y7DyhsnwqPNVU9du469HcGou+QAfZQ1OuynfQ85l
         o1qRAYrIASA0X2dYUyT93/BdacsqbQRbvfuDo+HDz+MjdWiQXgSASQcaUyndvFCWJsJL
         eQOpgV75YFOLA6A0KVcr6OS0xuWUgWYlJcRQwJ/yrfZp6Zcc4Bw5MWxrJUkdwI8vawXv
         pegRM5pmUC1VAgwtJF2gB/rKFnBOhp8AMK1Hr/htCJo1emC5qcuiB8XyrZEHtt4NGpTg
         yj9DVHipmLOdU/8jGvDOg+nnw+lHJq5H6GWHXpgDBYBabeOrub+XKa2lLizLvNv+YNKT
         5QHg==
X-Gm-Message-State: APuU4Z/QIfOeri6zdB26+LdJYJ+8ZTqUJVLPpVPjDDigQc/WGyIWBo7V
	OHVMI9Zf7Tq7Hyl/y07apvdvJQQlNrPjonII/ato6o/B+ckBasbq5WA3kwNcGQ==
X-Gm-Gg: AZFdTZcvSeF3Lxa/PtSmcgv/OjMeQ63WDOUeijFhKrgChmgUp0DFzF1bau5Ve5x06ZO
	Bk2SUfw9Cox6D278Zx0W2wD+eWrgZW6JHnPyfa/nxHVzIvlWuMDaaypfMB4zOQJ37Flp2g2C2T5
	d63vT98y41KhuWf2ZgOBDb5zdHpd3XgIYqOSzniShNj9zYPt/uP7BLyozZYaG82DnSaq7IwHk26
	Figxlankzkyx54QyrLQfP/hTxwOMSvg8Q870wSwSEuaF8124lDSYiCHT5WyefHbCltQWTPap6dj
	gyKcDgfeV7YcuJyfxQzThPCJPDEnHSIe28C4Abjj+qUPYk97p0/TqtUhOl1Jq25DIvlIPqhoqIQ
	oSV2f7Yham2U+iT1+ESrl9TE9fTZHMV3h6U1ouNi16onvn0Gx3N7ds0+6t9FEs7Dc8iw+z+Yv12
	7X4Wuq62ErD++hmRKGitmHljIHCUJxUI8C9AOYuCE4gyuADLxJAjyoRG7LmkNpnfMDxOZN2uLdV
	VwW9Sp+1jEoiXP6PZm7S7ng0GSdoyMuE1Ic5pHR+Q5mgf9UDy03c6BrtJT+rUd+X0wQ8vw1pciC
	NKp4qWmq8rfi0d1GS34Lahg3pOtN7x8kkADbG0dedrEejYlcIrWN4NE=
X-Received: by 2002:a05:6300:8941:b0:3e1:e757:205e with SMTP id adf61e73a8af0-4014da5ea9dmr25631676637.42.1795784889837;
        Fri, 27 Nov 2026 05:08:09 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:09 -0800 (PST)
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
Subject: [PATCH net-next v5 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Fri, 27 Nov 2026 21:07:26 +0800
Message-ID: <20261127130729.1263920-4-mmyangfl@gmail.com>
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

This allows explicitly specifying which children are present on the mdio
bus, like commit 4d98bb0d7ec2 ("net: macb: Use mdio child node for MDIO
bus if it exists").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 44b05d41cb95..b3b2aa1b7698 100644
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
 
-	ret = of_mdiobus_register(bus, node);
+	mdio_np = of_get_available_child_by_name(node, "mdio");
+	ret = of_mdiobus_register(bus, mdio_np ?: node);
+	of_node_put(mdio_np);
 	if (ret)
 		goto out_disable_clk;
 
-- 
2.53.0

