Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508843;
	b=lWgwwjSdc0Is2G55lJV/MKU1cT9OvwkxfYTD98bMIsRR3Vdvc8p5S5FRo0dynKrmR6p+
	 so6iRKV4oYhpezH6mqcjxcFFUHwgobPfVAFCeuvG5wlQSvVXdX2e/+tWrB+YKbPahlsSN
	 Qu56l1/CdHih9WQOZQN7DmhGiJH/niuQuBTKvCOkywvg1Ch12xtHjrgjn14hcrbhapKa+
	 D0370A7tt+nZB7Cmz5Z71UUUquQuDKq4AmHNRzHF3jht/jLVWeAffKv+czyCpSuvvLAEi
	 m8wNzj2QfSUueBD0+muRRzfj5i9fSJ41rM6aoHxyhRU4yROecx1KsOKzaZOB2yZ3soQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508843;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=a6ICK4FXQIh2L5/mytbLTap2GRa0tIY/nWGOF7Su888=;
	b=eA6yxr0p1TsK1qYzg4pefAMP01xZ06pozPbUh4IIEmexZEBrsXrNbldoW5xhdE3XvD0q
	 bZRWJU5Xq15VLzX6pPfVRupHk8J9IjoRBoanbQt14gj8rSMc0Gc3653js7A6KRoW/OX60
	 ZIIkJycmF86Mg4tsaRaZeS37zoPuMngZ756VU7VnkB4HzRW8xT4RwiW7gdv7k2ZL7KbwV
	 JdrzbCLWXu4TfOtKJueF5MfkFVzZLY9UkSdKsxUDt6fScyPX7X0xfP1eqcD3/dGNzhLjq
	 1GkpHERvzpLnq8Tk12RucN4FIJZzvR1MkZqtkGfn3iGmxELSTuVlCpvlwy0pJovZtlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TugWUPBE;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8AF606A687;
	Tue, 24 Nov 2026 08:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8AF606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TugWUPBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=a6ICK4FXQIh2L5/mytbLTap2GRa0tIY/nW
	GOF7Su888=; b=TugWUPBEREMTnrAISy6UiAQ5q9rXJJtErjTEvXHuBaDZCjQI/w
	/UcXFI+2Fa8DlSNJ3j1XccffBtIGcCz+dScI7+DnjZ6E+T4uH9QtofI2NXj61kwi
	MrrrEmZsXyXeUkC/5MWxM2edN1jkBocVkYDkiye1nM0xO2eejcCvgCzy0=
Received: from mt7530_series_01.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQD3JWpJSgVrxLNjAQ--.26356S2;
	Tue, 24 Nov 2026 16:26:49 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/5] net: dsa: mt7530: disable regulators on switch teardown
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
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
X-CM-TRANSID:yQQGZQD3JWpJSgVrxLNjAQ--.26356S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15XF4kur47Wr4xGF18Grg_yoW5Jw1DpF
	y7ZF9ayrWUZa4UKa17Ca18ZFy5X3ykGa4Igan7W3yFqw1ayF17tr1kKFyUZFyrKrWrta1S
	yF98AFn7CFZ5XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5vPftUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQUBD2sFSI8DnQAAs9

mt7530_setup() enables the core and io regulators, so they should be
disabled by the matching teardown callback, not by the driver remove
callback. teardown is the counterpart of setup and runs for every switch
that was successfully set up, whereas remove() only runs when the whole
driver is unbound.

Move the regulator disable from mt7530_remove() to mt753x_teardown(),
after the stats polling work is cancelled so that no poll can run against
an unpowered switch. This is a plain code movement, with the error
reporting kept for now and cleaned up in a later patch.

A switch in a multi-switch tree whose sibling fails to set up is torn
down without its driver reaching remove(), so its regulators were left
enabled until now.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530-mdio.c | 14 +-------------
 drivers/net/dsa/mt7530.c      | 13 +++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index e85ef2aceee5..faefbcad293f 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -227,23 +227,11 @@ static void
 mt7530_remove(struct mdio_device *mdiodev)
 {
 	struct mt7530_priv *priv = dev_get_drvdata(&mdiodev->dev);
-	int ret = 0, i;
+	int i;
 
 	if (!priv)
 		return;
 
-	if (priv->id == ID_MT7530) {
-		ret = regulator_disable(priv->core_pwr);
-		if (ret < 0)
-			dev_err(priv->dev,
-				"Failed to disable core power: %d\n", ret);
-
-		ret = regulator_disable(priv->io_pwr);
-		if (ret < 0)
-			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
-				ret);
-	}
-
 	mt7530_remove_common(priv);
 
 	for (i = 0; i < 2; ++i)
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d5a199293f78..c2f12ae2c6d7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3237,9 +3237,22 @@ static void
 mt753x_teardown(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
 	if (priv->bus)
 		cancel_delayed_work_sync(&priv->stats_work);
+
+	if (priv->id == ID_MT7530) {
+		ret = regulator_disable(priv->core_pwr);
+		if (ret < 0)
+			dev_err(priv->dev,
+				"Failed to disable core power: %d\n", ret);
+
+		ret = regulator_disable(priv->io_pwr);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
+				ret);
+	}
 }
 
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,

