Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708031;
	b=MqM4WjGNuX0/i1ySYwn4U4ZvNzebR9/kqhPt/urHWmXa3qCV56OpJwOoM7+H6DjwD1eX
	 0H9F6FGu9B0d1+tyZMHZWb/8z9xBPxAiZ4u0rkfDw4odTrfp22YLEav29eC4TpiBiiB27
	 E+quaON2wex6dwoUCW3NtFScNhv7wddCL/1QGA1zgu++DSyUb9NGwK9A9GpU3S6prMr3r
	 K+6IZjC1ADGEhcuKWiNNzHv8oPBMe3LfBtvAhXu+bWDAVvEN3P658pWaB8s7LLMF474zj
	 YMpTksn1vvG24XMfnkI7ZjQa/FH7RJLR5ogZrU+A1A/oCJFgUN8K0k0+RtAkz4SwCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708031;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=TM3ygG9aliwGs8WRPwTn48p9paOwTPNUHEiMUUw1SO4=;
	b=QspIojcNUHVbYEW0nlYj6JxFygZMzf1/9gXWm8Rq5b1qFL1R9UE1N/gfkQJGY2jd0a2R
	 57JiPmPrSqLte9JIvHuzDBNV3WJB/HoVtCTuQ8YIOMEh8Eq6P98DfN8AheOt0RMDcds3B
	 oNwMBFMWcLiD5L717scOb/ZgNwumjRcfeusNkR315nlmYuMYL2uunwDvhQ/QaLtO9zfx+
	 G45G9EFENvUa/pj2jBiRolbeN6XEuJHOW8p+bqSm6uW9xlfM4acv5OiRiuwxOnXdSKKkn
	 6UNYbydMI+baqK0jNWeoOOK6ehrGnt0kxiLgVh4glQoFOCbzrxcfsH7e9rSLBTJFx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZCs74DeL;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F2606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZCs74DeL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TM
	3ygG9aliwGs8WRPwTn48p9paOwTPNUHEiMUUw1SO4=; b=ZCs74DeLngbwWfpDV7
	Lui0vppeR1dLyqAnqeI//4hRNY/fVfve0I96yVpn5rc/xP60t8GgwTHACNSR4wXy
	SGBKQwh4Zs7BtRl3P8YRNV5iZ3IVJvE5EkB1J/F/H8qKh93/A/mJ9o7QKHqvcMVp
	yIfwSYfFLxpMK04hRMws7wo6A=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXH7tQVAhrVWIhIQ--.40309S2;
	Thu, 26 Nov 2026 23:46:25 +0800 (CST)
From: Wanhui Fu <fuwh1120@163.com>
To: timur@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	Wanhui Fu <fuwh1120@163.com>
Subject: [PATCH] net: emac: Unmap emac phy base address and digital block
Date: Thu, 26 Nov 2026 23:46:07 +0800
Message-Id: <20261126154607.4112077-1-fuwh1120@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:QCgvCgDXH7tQVAhrVWIhIQ--.40309S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJryrCrWUWw1DAr17tFW7XFb_yoW8WrWxpa
	yDWF93ur1kta13Jan8Cr4vqa4DWw1jyFy29r45u39xX3Z8AFWxur95Kry5uFy5ArW5GF12
	yr4xAas5CF4DAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZtxgUUUUU=
X-CM-SenderInfo: xixzxiqrsqqiywtou0bp/xtbC7RIGpWsIVFJmPwAA3g

Commit 54e19bc74f33 ("net: qcom/emac: do not use devm on internal
phy pdev") used ioremap instead of devm_* in emac_sgmii_config().
https://lore.kernel.org/all/1474640854-1698-1-git-send-email-timur@codeaurora.org/

The error handling is also added inside emac_sgmii_config() and
emac_remove(), but missed in emac_probe(). Add corresponding
iounmap() in the error handling path. 

Found it by a self-developed static analysis tool and compile-
test passed.

Fixes: 54e19bc74f33 ("net: qcom/emac: do not use devm on internal phy pdev")
Signed-off-by: Wanhui Fu <fuwh1120@163.com>
---
 drivers/net/ethernet/qualcomm/emac/emac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/emac/emac.c b/drivers/net/ethernet/qualcomm/emac/emac.c
index 699a8afc214a..aabc19a2a986 100644
--- a/drivers/net/ethernet/qualcomm/emac/emac.c
+++ b/drivers/net/ethernet/qualcomm/emac/emac.c
@@ -660,7 +660,7 @@ static int emac_probe(struct platform_device *pdev)
 	ret = emac_clks_phase2_init(pdev, adpt);
 	if (ret) {
 		dev_err(&pdev->dev, "could not initialize clocks\n");
-		goto err_undo_mdiobus;
+		goto err_undo_sgmii;
 	}
 
 	/* set hw features */
@@ -707,6 +707,10 @@ static int emac_probe(struct platform_device *pdev)
 
 err_undo_napi:
 	netif_napi_del(&adpt->rx_q.napi);
+err_undo_sgmii:
+	if (adpt->phy.digital)
+		iounmap(adpt->phy.digital);
+	iounmap(adpt->phy.base);
 err_undo_mdiobus:
 	put_device(&adpt->phydev->mdio.dev);
 	mdiobus_unregister(adpt->mii_bus);
-- 
2.25.1

