Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076118;
	b=cpUeZpSUSCc6mqR80+zc/bwCVjHdaL2mayUTZxKDuASXBNKrydspTPrI5F0FJNNeTQl4
	 5xRsrUwTD7lAH41py7jx83jX06KjtShgf9N7qslDj5YUBcmMs9TQQGHsQ0ZogJPRZdjzz
	 7cut2G+Cv0/7ltNYF2xpUVFaoKBy+Pwyuz/mh5SM7nrj440XgF9maAmSeKVBxp3aLbA2I
	 0x5rgYqLbKVvE3pW8EnJ8sXS54WBw1SzW/7LywkReTdxwkMeWvVmh+XwUl7+RgJVWeexx
	 cmKwqPLl4HH8DVdt2liYTUhpiczFEhjUtmh2R9DDFqIhc3XA6wFDRIBWcR5RJLbiuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076118;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=afOKT7iLNdIGr/OYItr19oAdE8gSKLl6Gb6SM3xUZt0=;
	b=qvEdm9QcwsFMaax+22RpxbY0qPMzdyvNEeIiqKoGbBWxyBqcScr/xBf1i0WrNHfMBf3H
	 GAeTqQ6gkkaX7+X4HG48zoGW7vda+Hug1sCW4eTzwvyetFqvd7HmmFe+tH/WSWQLzCryx
	 deQ4Z5TH6PqkSf1+AjwfGN0sH+M34tsrWyxnZiVckX1H4vnNpMvoLtSv4sjiXkRha3pBK
	 0nEMMjTsWoaIggUCZ3nBI75YdwASMtbljqkcw3gbm6+GXzacC66FnuenFv5oZAvCcNaIs
	 Xoz+ReijbvJT/j9kGneZSCwCwnH/xhnpHd1HOGgntSwTdaPMgPFbegwQNsV0Z7+oBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DqAdNGWc;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E3160A2624;
	Thu, 19 Nov 2026 08:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E3160A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DqAdNGWc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=afOKT7iLNdIGr/OYItr19oAdE8gSKLl6Gb6SM3xUZt0=; b=DqAdNGWc9IVw0
	+pg2zTzwHZIv4fiswsDgKSL8QstQr2Yc+3Eek7VjS4FggsUCWrgBoF1BArxKI1c9
	W/5/YH4wPuXHP1p+tegeF7971NhfCjyUhkkCSqxETAga+GWT0fde/KE3PWGQaJJm
	lnyuydxpqtpzTllIS1OfV9O4TikTpo=
Received: from 10.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQAnU2cGsP5qZCJLAQ--.42739S2;
	Thu, 19 Nov 2026 16:15:02 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] net: dsa: mt7530: disable the power rails on setup failure
Date: Thu, 19 Nov 2026 16:15:03 +0800
Message-ID: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yQQGZQAnU2cGsP5qZCJLAQ--.42739S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWxArWfJw1xCFyfKF1rZwb_yoW5AFW8pa
	yUuFyktryvqFyFgasrAr48Xas0y397Gay7KayDC390yw4ayr4vvry8tFWSvF1fKrs8Ja13
	C398AF97uFWkZaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRAl1kDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgMQD2r+rloDcAAAsN

mt7530_setup() enables the core and io regulators and then has several
failure returns (io rail enable failure, reset timeout, unsupported chip id
or 20 MHz XTAL, vlan0 setup, phy muxing, gpio setup, fdb flush) that all
return without disabling the already enabled rails. A failed probe never
reaches mt7530_remove(), which is the only place the regulators are
disabled, so after a setup failure the switch rails stay enabled until the
next attempt re-enables them and the enable counts keep growing.

Unwind the enables on the error paths, guarding each disable by
priv->id == ID_MT7530 since the rails are only enabled for that variant.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
---

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d5a199293f78..769f733f80d2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2425,7 +2425,7 @@ mt7530_setup(struct dsa_switch *ds)
 		if (ret < 0) {
 			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
 				ret);
-			return ret;
+			goto err_disable_core_pwr;
 		}
 	}
 
@@ -2447,20 +2447,22 @@ mt7530_setup(struct dsa_switch *ds)
 				       val != 0, 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
-		return ret;
+		goto err_disable_pwrs;
 	}
 
 	regmap_read(priv->regmap, MT7530_CREV, &id);
 	id = FIELD_GET(CHIP_NAME_MASK, id);
 	if (id != MT7530_ID) {
 		dev_err(priv->dev, "chip %x can't be supported\n", id);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_pwrs;
 	}
 
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_20MHZ) {
 		dev_err(priv->dev,
 			"MT7530 with a 20MHz XTAL is not supported!\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_disable_pwrs;
 	}
 
 	/* Reset the switch through internal reset */
@@ -2527,7 +2529,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Setup VLAN ID 0 for VLAN-unaware bridges */
 	ret = mt7530_setup_vlan0(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Check for PHY muxing on port 5 */
 	if (dsa_is_unused_port(ds, 5)) {
@@ -2554,7 +2556,7 @@ mt7530_setup(struct dsa_switch *ds)
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);
 					of_node_put(phy_node);
-					return ret;
+					goto err_disable_pwrs;
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
@@ -2579,16 +2581,25 @@ mt7530_setup(struct dsa_switch *ds)
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
 		if (ret)
-			return ret;
+			goto err_disable_pwrs;
 	}
 #endif /* CONFIG_GPIOLIB */
 
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-		return ret;
+		goto err_disable_pwrs;
 
 	return 0;
+
+err_disable_pwrs:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->io_pwr);
+err_disable_core_pwr:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->core_pwr);
+
+	return ret;
 }
 
 static int

---

The vulnerability was found by static analysis.

