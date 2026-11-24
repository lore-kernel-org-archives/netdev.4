Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508860;
	b=tQzHtp1GtjnddkZs8PqHZojJpGrsT+YUHLheCqHt3SqbFBlmj3sPHaupJnhgnLpikM8h
	 WT5V/xqiVoMx+1EctsEEANi6tSgHtOlLcpdBvQzR9mH4rfSbi7X2kqVlET/KALadx7lWl
	 zfHg5j0uvW+x2ShQL2Dyvo7jqhnPSw09Ic2udKOfS34TD48+UBdpIlSlvKmK2rf6U3mDF
	 f1GrQVM8HxCdaCFwTU+3HQO8XLTTeBnkyfgfUqWIziwta74h7P5+mKQPZGrvkqle89Fra
	 DD8fT55f6tpfhh2TuSo05u45qR+GMmp2jRPRhyKWMZ1D9XOAT3RbvqzISnj2VFEqEcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508860;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=SHQD7/yk1kc5LIzMqPgYiZblY3LzJCrNlaOhDTO3yRk=;
	b=T5FZTy+U8CA9/MjICMkPIuKDPq9pjpoLcEQsvUPi4g9vFPa7YGUbXH+1WX6WbtNlbcrO
	 Fu3SCZgHnSdlBNMw6z5dJhVKTDVgvBE8GINYIQ2QMaSRHmtBqUL2gGgXaAeDFjDSSp4Vr
	 w2xrOAxQXlYi9aydDb8fzy4M/Wzd9rZiUSg7+fLXIiblYnSjF0p23drSkucynkpB4bv6c
	 aQmQZA7JQBG7EfnEyAVjGW6pzKT1lwO8MPGrs1gsTSjt3FE9Z1wT2bOpHNnQAq7P4EDu3
	 DD+HN+5Db+couS1U7uZbX4o5LeAgCUr26pUy48i1I/0s5N4nBnEuHhYFpMyWEqkydhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=MrPP42qm;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0619606A6A8;
	Tue, 24 Nov 2026 08:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0619606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=MrPP42qm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=SHQD7/yk1kc5LIzMqPgYiZblY3LzJCrNla
	OhDTO3yRk=; b=MrPP42qmI+mfYCKON9L0qHcSluwY1bsa5f3uZIHqAE/fZ1Mcq4
	0BHJEjGbtqN9rKdmGVjn4nFOd5IXFuPKbz0O/EmwkTj1pA/POSDC+a4enDoWBG8w
	a/JYD7GSm3Xhl1EjfhIZQOsnuxwtUDb26Hp2SoD31C9CD2N8RnTjFhHgE=
Received: from mt7530_series_05.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQD3sgBkSgVrlGxJAg--.14120S2;
	Tue, 24 Nov 2026 16:27:16 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 5/5] net: dsa: mt7530: disable regulators on mt753x_setup() failure
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
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
X-CM-TRANSID:ywQGZQD3sgBkSgVrlGxJAg--.14120S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1furW8ur1DAw48WFyrtFb_yoW8AFykp3
	yUZa40krWvgF1UWa97Cw4UZas8ArZ3Ga4UGFZ7KwsIkw4ayrn09F18ta4q9rnxtr4rtw4S
	y395AFWruFsrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAV
	WUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcR6wDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgQBD2sFSC8E2AAAsd

mt753x_setup() calls the per-variant sw_setup() (mt7530_setup() for the
MT7530), which enables the regulators, but the steps that follow returned
on error without disabling them. The common case is mt7530_setup_irq()
returning -EPROBE_DEFER, which leaves the rails on and re-enables them on
every re-probe.

Route all failure paths after sw_setup() to a shared error label that
disables the regulators, and move the mdio irq teardown there instead of
handling it inline.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1ac4ac1a0566..963d14534175 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3223,11 +3223,11 @@ mt753x_setup(struct dsa_switch *ds)
 
 	ret = mt7530_setup_irq(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	ret = mt7530_setup_mdio(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {
@@ -3239,15 +3239,23 @@ mt753x_setup(struct dsa_switch *ds)
 	if (priv->create_sgmii)
 		ret = priv->create_sgmii(priv);
 
-	if (ret && priv->irq_domain)
-		mt7530_free_mdio_irq(priv);
+	if (ret)
+		goto err_free_irq;
 
-	if (!ret && priv->bus) {
+	if (priv->bus) {
 		mt7530_stats_refresh(priv);
 		schedule_delayed_work(&priv->stats_work,
 				      MT7530_STATS_POLL_INTERVAL);
 	}
 
+	return 0;
+
+err_free_irq:
+	if (priv->irq_domain)
+		mt7530_free_mdio_irq(priv);
+err_disable_pwrs:
+	mt7530_disable_pwrs(priv);
+
 	return ret;
 }
 

