Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162278;
	b=xdGWG2W5lsA4ngupsGAbOhGlYwn01Hs7RA8nGzJCOFrOJMs/1lRASN7KG/+5dp49Y2Mz
	 9BqS8/DsesZ95cr8c5sgMfiPcEE9pzfjh5PwaEcmDtkhFbbzciZzvWIMT7a/xsn+DNvOs
	 tIzf2RKQnJfdoXFbh7tK9nxaHz+xjm9p+zrwmRqyTMT1M7BD3H8hiKSeS07xyh0xSYM5W
	 aI8UjVosVj04dZbOL6uouYsj29vAv03CyL0J8bO3PAEzuMixOmRHhFD8TcwvZBGxxNp1P
	 5LWglQ8x1QGMG6w2XrZ4X+88rUyQLSWR7oopgVs535ZrKPKKMuF23aYKxiz1FbWHXiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
	b=EaV1IxCzD38skyTn4VLQ9uNYb0K29eb8R9QL9SqnaH2Dg7OvnvLQs5KRpB6L3ucEMJ9d
	 p8TKr8bOeGvNyXdg8a9N+yktZj3b1u9XnQ1DSLPnjEhhgEl2gujEvLzHMO95k9IGo9n2t
	 kphmhzNXjLIZRnP9weM3zfbDy8xE8a/Sb5aPdJZj9gbYSrKpjSSrxl3XPl25+FO1s8+iU
	 gC/H6dwDuBNAh1CZ2wA/aXbR7A0LJEbZbY+B20JTMMAydgVJkdthQ7GieE9YxfpvGtApI
	 esyo1UOuandPHLWBwzSE5FmV1J3I2i4KoAA/ppGYb3phQDXMcYH3DRws2iwcH3tAasg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DC60A2626
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351DC60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so728770e87.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162275; x=1795767075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=QlGQhOdbE9NngEZTKzmX/WF1nHcSSb4OcwlQqHAtJIG9zxODsZO2QxDPtdr7iNgg/5
         +8ia7e6qh2p/ytD6nJf8fLUo+VM8LrevnzLN9NtX5Q+wn0tJhdzlozNcicBA6rNM5L9t
         16L1WWAN1Ot62Yc/7Yq1OzRx1Z47FOBaJEtf4we/quHuXyE4zOO1hX2qio8xM9WiuQUG
         oWwgJ/dUxqtloojIbri7GhnUkn1DkImLQ31ed4oep8DhBMY3kznEYn7T3l4bbunkOPET
         b0Yd7bXN2lVP1/9eE4iYNReoLbiy82IZJzIswPPJHQ+4M5tq0RSQlrBCjAgAWAziCJpI
         x6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162275; x=1795767075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=VLQHHQmJ5Olk7vZInkdedrilhmpWqDlrg/vQxvUo5LbFG0PyERLBf2kgbiOR8CPDjX
         ESPrUlrmI+KMeihMrMpegSMij+sCOzKmz2ZMbxKTO0uJ13LnaraUigoYqOmLM9FRE+Pc
         W+LtEcviohd6lyKpyw0ruyTlngoRPtSmIH3tMSwKJ9vbOGLznla2bTGI6SqXBCvj+9Gj
         28wzcchmBFG+8ShvixQLLwJuvkg9bi8r7wsu+eO8QNLSeL1oAbtMKAUApSxdw3X2tg+E
         eD5VpCMgIDF879EfeWTQgi0r9VlBriBZgIZnAEGMx6LyaUKNMCnwuRuDTY/cPuegIPSE
         VM4A==
X-Forwarded-Encrypted: i=1; AL+hErHqySP15MxjhDKP5D+5ycrUIcCb3kvud1Tl9toG65YPpiIql85MowIuWZdH8vHPfgR3jg4ZCNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NFuORx+HpVFPpprRNlo8/iav5XYsh6jFMmEB87cpcoN9KleDW
	hYFlYXaBmO7eql6ZY0eCjMItGJ3aq0nJXEOGPQLbqCdXuEdr3+gIetLJ
X-Gm-Gg: AZFdTZd3kBap6kC5wc6Pg9qaku07HMGZEHq00wrF7JVWkcoeZSl5h3b1MwwbY+83xLH
	EEX4rLVGQbY+gF0gQsM/RmO/AUVrGQMJSaCDXQmr4qNQ/2ASJXzB5rZlx2t01nF3dSZYuOkvbEQ
	Ct+tJMaCGuVZE+G4MYMaGMwgcvEWDBl8cCmOQiyPnCoeM0W0+fVDRzkcx1LNrJCYLiOmOGmJmlZ
	U3WE/EzX0EsqvkKlKk6MKaZ06NktjgPgtxDvhvh7JLLvbRAuM0LSauaTSeeYvxthLKnKS2/M6ej
	Fz4PDRePmbkTTN5g/itThTGfsLxBID2ZU0foSz429OjnLTGHCntIfQyxi9yCO4+pMY3YNv4bbaW
	3bRTDuJ8tVQ5LZ+dcgow7l8upxGNqM5BBcmmROqxe9QQ61H+F+xsBy0I8/OkAfUMXuHwGRGxPKQ
	Vhk5ShptBv2mKZDvgwsV9b7gdabYoDOPu5qKfI4JtzcGTX20kJdPF8BIoUEvqbLKc2jMX//2VeA
	zyxSTQBKl2CX7pHJVpCrjP/qcE/oAlVJlGZSuUrYC/rWbNZtRW5/Ox16/iCF9T/yk4NYi8nkXo4
	gcBsmVEv/EqL9RNLwI2sHbCHx2SISFSDe7tGmmUGjrBcfOk=
X-Received: by 2002:a05:6512:3503:b0:5c1:4a42:fb07 with SMTP id 2adb3069b0e04-5c1bc84b95fmr690376e87.64.1795162275265;
        Fri, 20 Nov 2026 00:11:15 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:14 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: phy: dap8211r: add extended register write helper
Date: Fri, 20 Nov 2026 11:11:01 +0300
Message-ID: <20261120081106.2919010-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

