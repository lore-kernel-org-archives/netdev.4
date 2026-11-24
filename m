Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508847;
	b=vmJanm4aDY3kAmOvE0KF2wkx56ctSCiDizVDQrRNLdEwyFJmA/A0y6L+MqyZeQTTYGGQ
	 tygiD3z23XVCGUcWwZlnZZrmwdBYuPMd+kNJA0XSo8tPZaAukskPfaGEQFpYvUGjaRdWj
	 LGDE1Zt0HMkfjqNOAiJJbMEoK45Ah962bweSsMUqp6wpFNRB85Rrqk5b6id396yVYQ2Py
	 R/vHI3hNcUhQC5n9RgolXM8zF8YR0ymeOUtgOEYXk7zK6QDf18eLVq75nu2kZPcQojCwb
	 R9pztSJpfh4GD2sI/I2xz3WuGnkk0eM5pEEVpkkEjXVN10QXXxBqL9/O+O6Yg96ix2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508847;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EsJlUIyxNOoYrvSt4pJqkEm96RE4fXWlXWExVpmzSVo=;
	b=lp4tK3LFb/LtlBOXo22hZDn8NtTV7dhohh9kxH0KrtgLiBR02PkhpFHxEqo5YY3NOlPr
	 NJOXS2W4I6L1LizSLblSHviZb9VRmGK0WU/PzCmGU+ZgohIzYjPg5rU1vElgL9UPqL6eO
	 /6OSlST3SXBfjeOEKCQRhrPj/HgpIG5jUvZ2XuuAQ9IvIP1ts2FXahLvX/Nj7tfCZqu3k
	 YAZ/piH56VpW6JkWz2Kuj4hPSrgP1LMgfKG6cvKuecklUT0ksEQSo5hwiQxy4knNaHhJZ
	 du0CKZIaRxHOPlGTH6LfNPiC/sVth1kq+s9SJXc3G53HJrJFr/JM/xu5J5jVMQ5GjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DZWYM8Fn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A54606A6A0;
	Tue, 24 Nov 2026 08:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A54606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=DZWYM8Fn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=EsJlUIyxNOoYrvSt4pJqkEm96RE4fXWlXW
	ExVpmzSVo=; b=DZWYM8Fnj2K96pDdYvQcXbqjD2+e2NEMG86w5Wo2xl7LRYsvj1
	0pEy6OeE7aLTAb9g+Bflx9TBLZNHQ4JdgJNgt2UFZT+ZwkNTMhM+Yf+bxJ6ByXMr
	CRHZ95sBzXufz25QlsAi/SlmHy8GcFTfmsVtpnCBfp+RNZWau8Lc90AEk=
Received: from mt7530_series_02.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQCHRwVUSgVrbmxJAg--.14015S2;
	Tue, 24 Nov 2026 16:27:00 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/5] net: dsa: mt7530: factor out mt7530_disable_pwrs()
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.10911645527208536694@mail.zgclab.edu.cn>
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
X-CM-TRANSID:ywQGZQCHRwVUSgVrbmxJAg--.14015S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryDur1fWF1UtFW8CrWkXrb_yoW8WFW7pw
	17Z3s7KrWqqa4jganrCF42qa45ZrWrGa4Iva48K395twnIyFnrtr18ta4IvF1rKrW8Jw4S
	ya95AFn7uFs7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXV
	WUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bo5lnUUUUU=
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQUBD2sFSI8DnQABs8

Pull the regulator disable out of mt753x_teardown() into a helper so it
can also be used on the setup error paths added in later patches.

The helper stops reporting regulator_disable() failures. A failed
disable on a teardown or error path is not actionable, and on the error
paths the failure being handled is already reported, so the extra
messages would only add noise.

Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c2f12ae2c6d7..eb55cc969f43 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2376,6 +2376,16 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	return ret;
 }
 
+static void
+mt7530_disable_pwrs(struct mt7530_priv *priv)
+{
+	if (priv->id != ID_MT7530)
+		return;
+
+	regulator_disable(priv->core_pwr);
+	regulator_disable(priv->io_pwr);
+}
+
 static int
 mt7530_setup(struct dsa_switch *ds)
 {
@@ -3237,22 +3247,11 @@ static void
 mt753x_teardown(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int ret;
 
 	if (priv->bus)
 		cancel_delayed_work_sync(&priv->stats_work);
 
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
+	mt7530_disable_pwrs(priv);
 }
 
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,

