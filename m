Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939978;
	b=OqLfDMK0RMpemIuw+PwwHek9ixGZpb0RQRw30qGwVUUCpUoWnBcntDNZxywof0U0moZE
	 tscCpFdCrlIX/iFLubob1e/bO53Wgf+kX6ouJ+n04MKpqfYE9nj6SSKd17tCJZwWmddkn
	 R3ccTk1hbOqhX5fs7LdsgRlHoYPRCBt+BooCwj3KT1QFCPyVCU9mAONeHe0HIvFw41PAC
	 Aid1WFFZuPpfkQXBQIfcZYhV2u+7uSM6R4R+cEI8nhc05E+UBj4GRUoUo+RbtbutPThSA
	 U6oYIlnpgL/6MTXs9fgDVM51KDxTB/qEnJwAWFpQ5FVjKzU00DBHplZIQvFRtIiPiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
	b=n1uWtJr9cw/ox5yNCeN7VyDpFt5RyAP7dimNqMd6Mamckc4AmPnLMORrJMhKtev1Excg
	 g/LsbmIka6ptFF4dI8ZIelfk8pP/O7h0EGAFcbCq1/FoJNQteKyJ1tcjDWdZ4oZ9qT+0L
	 sEazbjwk97Lm2vguvjTAKcv2NC5/c5M0cZvz5Q0ewekTH+pwC4qTPjQqzlq+41e6jKBmH
	 qGUP/s+Pd+NZ+YfEMApDGGVdOwWk/NkYfK6Lrb1TXlZM+fBVFDwbuFLbnB9EHJWMVMYJ0
	 SxMXHqZSFc+32UzpCKaFoIL7t0GJ2pRZxGlcWvkH26zWIyg6jQQ3z4eIF7NzYpV65mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdFNjqyC;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44631606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44631606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdFNjqyC
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso51207eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939976; x=1795544776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=AdFNjqyCThVdzees9+8ELX2UN7gZFx/WwLfYt0iXhQe+cXq8QeN/mULX8SM6CLzfZ1
         6I8DyV5goFqZiPhc0VYqP2OA8td6xK4R+3a/U4n+M3HAF4FhOeR881smLcNQbUOYp4ep
         n2YLiSVoJcap5RVfcz9KI1JoDCsrBxwe/H7rhXcVvPLLEj5lRyyWuxkD9L8JFtFyvjFJ
         1XfHd2uwnX28Y+TA5PqEURm42ayTMnI6sFFG6MRqrr4t3FYj+a0B2/wPNsz1/NMBBSwt
         eSl65BfDw76YK0mQF9z7eku29ZWdyD/6Hdy6KuiRBjFQrHnGpoXtEO51HthOgGtY2Umx
         C0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939976; x=1795544776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=EXbZH9JpF3ytHW2cgPvIQVJh6ZyrL0t5r9urwtUkGznz4wZLtA9LV/hKOB57JKAaMG
         5Wac57GDMT4vllE0K/gAj6GQX4zhAXpm/CnyTBFErEoYY/B9Avyt1MpByB8xO6vCiNV1
         08i+Xh3ynEo7+AtT70HMD+B4QCV/1Ln8o6WT1Pv0RwXUH4T145uMcHmKk+KUMfNOpsS0
         2hvpY+Qrst7TriSe1lv6CmvB/upKFfaaxa/Ev9g70bxI1nh9gkFVeuIpn65VLkJv72R3
         3JurF5Kippw9ugPs3Cn/xDL6kAPohqBS2eM+fXTZKbuk9MlY2IWjMmCa1Xa4hrGYyExo
         HVQw==
X-Forwarded-Encrypted: i=1; AL+hErHxWdROUBt8TH+z8EOZICGL7Sj1/2ElTH0nn06B1t/kYn+EZiDd7MpmRNHEmB5jET3TnJHs9Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z982Gyw1w5FwntRcdmVvkaOAZ/61kWG3KgvGtmWaa9YFzT0v++n
	qAl/7jPW+jlUYlAs8E2IyNnqYKUEK0qPB2IxYDTcfaxsD6G384NSXA9d
X-Gm-Gg: AZFdTZfS3xiXRku26TOa3lQwhl9n78i59jj79x8sWsCbyEn3bByTen4uaDR22kgxSl/
	GxwJOlsVDxHJC0o33J4wQQaXf1Eg12zm0Olu3BgwGcGAB59Ab7N6zcEkz5+HbgFssvaJU0AL6OG
	obG2/vsIn4MVtT5AEz+2wez4PSfebz87nvmg/VVA61MUHWxv/l5JxfqUSoEr/st1hvCH4C8ijza
	hmTNv4BZnj3FDsRjGGM/Vx8+etbeOUIHy5NGriGE+F1VTe7Lb/K1+fD2zegyy1neiH04ZJvKwIr
	XVE42e8PlgMIBf0ygd7rmeo6ATARN/v605tn7dtQDhucBlFzca8g3s5mdVBau0X5fZYQ9s/br2U
	5nTTYbV/eNRzrGAVvv6vYbp72+PqVWNu+q2IoynTwx8LQHBlNlyfkvXIq/VSYH5qM9xHKgJW37z
	vswLjZ6Noa4HBUcSdwWyNbC4yqZrsibuxuA09P/XrsAMSyAuCR4crlZf33szfulleqR4Gbrxk3c
	jSKmYfbD9W0pD99TB/8ahpB3E4H6r+jyD8chX7apJ2qxD77ojzUmP3GITFlJyxG81/JIQ8+1yLz
	7L85eVmZX2HlS2jKuVPoIgyE3g6/eKFngfledzrV9NHpBhr/KlEG9p6szrA=
X-Received: by 2002:a05:7300:4307:b0:376:c352:2fcb with SMTP id 5a478bee46e88-38281020584mr279305eec.9.1794939976302;
        Tue, 17 Nov 2026 10:26:16 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm45641488eec.2.2026.11.17.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:26:15 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into enable/disable
Date: Wed, 18 Nov 2026 02:25:03 +0800
Message-ID: <20261117182502.3045841-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

As the great Linus Torvalds once said in
Documentation/process/coding-style.rst:

  "If you need more than 3 levels of indentation, you're screwed anyway,
   and should fix your program."

The gmac_clk_enable() function previously used a 'bool enable' parameter
to handle both clock enabling and disabling. This resulted in deeply
nested if/else blocks, which made the error handling and rollback paths
cumbersome and prone to bugs.

This complexity has led to bugs, such as the bulk clock leak fixed by
commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails").

Split the function into two distinct helpers: gmac_clk_enable() and
gmac_clk_disable(). This flattens the code, removes the boolean flag,
makes the caller's intent much clearer, and simplifies the error
unwinding logic.

Additionally, this refactoring aids compiler inlining and CPU branch
prediction (trust me). The reason is simple: no branch, no prediction.
While the compiler might optimize it, there's no guarantee it will :P

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 67 ++++++++++---------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..78bc8c71ad10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1178,43 +1178,48 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
+static int gmac_clk_enable(struct rk_priv_data *bsp_priv)
 {
 	int ret;
 
-	if (enable) {
-		if (!bsp_priv->clk_enabled) {
-			ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
-						      bsp_priv->clks);
-			if (ret)
-				return ret;
-
-			ret = clk_prepare_enable(bsp_priv->clk_phy);
-			if (ret) {
-				clk_bulk_disable_unprepare(bsp_priv->num_clks,
-							   bsp_priv->clks);
-				return ret;
-			}
+	if (bsp_priv->clk_enabled)
+		return 0;
 
-			rk_configure_io_clksel(bsp_priv);
-			rk_ungate_rmii_clock(bsp_priv);
+	ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
+				      bsp_priv->clks);
+	if (ret)
+		return ret;
 
-			mdelay(5);
-			bsp_priv->clk_enabled = true;
-		}
-	} else {
-		if (bsp_priv->clk_enabled) {
-			rk_gate_rmii_clock(bsp_priv);
+	ret = clk_prepare_enable(bsp_priv->clk_phy);
+	if (ret)
+		goto err_clk_phy;
 
-			clk_bulk_disable_unprepare(bsp_priv->num_clks,
-						   bsp_priv->clks);
-			clk_disable_unprepare(bsp_priv->clk_phy);
+	rk_configure_io_clksel(bsp_priv);
+	rk_ungate_rmii_clock(bsp_priv);
 
-			bsp_priv->clk_enabled = false;
-		}
-	}
+	mdelay(5);
+	bsp_priv->clk_enabled = true;
 
 	return 0;
+
+err_clk_phy:
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	return ret;
+}
+
+static void gmac_clk_disable(struct rk_priv_data *bsp_priv)
+{
+	if (!bsp_priv->clk_enabled)
+		return;
+
+	rk_gate_rmii_clock(bsp_priv);
+
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	clk_disable_unprepare(bsp_priv->clk_phy);
+
+	bsp_priv->clk_enabled = false;
 }
 
 static int rk_phy_powerup(struct rk_priv_data *bsp_priv)
@@ -1453,7 +1458,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	if (ret)
 		return ret;
 
-	ret = gmac_clk_enable(bsp_priv, true);
+	ret = gmac_clk_enable(bsp_priv);
 	if (ret)
 		return ret;
 
@@ -1544,7 +1549,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	return 0;
 
 clk_disable:
-	gmac_clk_enable(bsp_priv, false);
+	gmac_clk_disable(bsp_priv);
 	return ret;
 }
 
@@ -1556,7 +1561,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	pm_runtime_put_sync(gmac->dev);
 
 	rk_phy_powerdown(gmac);
-	gmac_clk_enable(gmac, false);
+	gmac_clk_disable(gmac);
 }
 
 static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
-- 
2.47.3

