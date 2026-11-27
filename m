Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782890;
	b=YEHtjNZ8aQ+XTKeoKEC/9aTjMWGUPYqOTDOJKE6SNTdziQM4xp6CJnJ8knuxBLStq/En
	 h7O/Qt6v1IzrzJQ2A0DE2bTJYkroRTR28/ZcIOF6+0MrUzDfcySHqzOBrPjm/ADR2jB7k
	 HoGfTXBhc++a8an8Xd8dVJ7uvyzhxcSU8sn5RhldKAQLWtNxpnV4yUJmubt643istmeY7
	 IrIFtxDpqB4sjVG7JSOHxA3SIY4kzc8O9TULANQ6SLZMBQKt9UnDpk+9zoQ9HqPbLljii
	 5kme2jptkQFkoyRsuNcD86s3f9NK6nED1SRh1AAyBL1sZDaZYLiamZQ6cpka1y6vXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
	b=Qz3+bNhrh7OjL929wu2Nr+HOg77AIoD2tb316KfyQWUapCHqHlJDeYLqGtwVcLdHFiPE
	 04RpVaZWzNnKXhgM/KcwKrB226AimHCdys9mfiLV+56uHnEX34CZ2oUY9DTyPbUD211F8
	 nUCALKa6kQxvdCftD0kE1wl5EyxNxff58bhhcL2fUuPOgr2B6DtLJUlURcT8xdgZ2IrDi
	 sKI7j10dWrsi9+Wl8ax5IWZd2v6tErFrP+EpiQsNzLQJ01zw8xvLn6knLRTKaw15/49Np
	 kbVXsIzFUklCOLBRBuXTe8cQC3csuh7+OonRHNCaAq1gtyJvjYaqrXynAl2ITZw5dYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=let742wp;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B18606A334
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 12:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B18606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=let742wp
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4804364b3a.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782889; x=1796387689; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=let742wpcDgfOnXcOMM6MOkFvcK4OUFW9yT6bndSU8zBSrh9m7EhLYaiwV39Lo5cLW
         s0cw/VzzmIMaLlDx40tuBl+yyLn3kksCD+3R/i84dQB6zGPrJZGJvmaqDbTquNx6iASa
         g+8We2W/+CLce6bmDrD6Egn+6wQm06HlxD918jHwzmzOBDhH5b2rPvJu39YEMFy3DcE5
         lB4828IVsz48grxLR+D15tK6FFVnITUmA2TGbcxx0/DOVwp9dSdcLmWtkNuGP+jsxwVz
         kSVry0FvW9uiSl+VJmjiF39Er2oZHhS+yJced9qCyyovZNL6ZPHfGLCfm1oIO5sm3HEj
         KBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782889; x=1796387689;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=A9hiOFfkfLiTDd+kpRlGDviYUym+mGBBe+KabUVh2/myLtmYaltGZ9TgzTNlEcmzNB
         M8TMBt49yb2ri2Od0Mw1Mc5V9Pz08XOZ3yLBINWRjvN2cZdC7KviQtYkkyDP080hi8h4
         ppCeW4OoeUl/RLKbrgayhdCBhs/wxRE21+V5U/gAvZpntmYSEpEmuqPeWJusUrIfwS28
         a5wAnZoZADgeIeucdcwhg8RZgcGP+mUDCn5WrF+ZHTCGgFVkDfyAa4X1SBoQO/RqnizL
         TAiPMp9aFJtY6FrCPzm4yJa7/ANFcdB+0trRT8/xW/iYx9npd/kLE1sS9BXcHvX5tWU+
         abjg==
X-Gm-Message-State: APuU4Z+bKVn9TsAW9RDDLtG7jidvE4MlI+8Kz7Ov0UhaepDjITIxnCnI
	nVL2kd+kpQWwe8xDkSTIrzYbEqbnYyW1f8h+p4eYkjVcDMNVq4FAn+H9
X-Gm-Gg: AZFdTZeU9RhPMDsg/qJQUVN5pZZj6R9ANlWnfl9Lin7Imz8rIZjg61zmyjW4JHc5hoC
	omAfaB0Xsynne8XibAN4mdUYmAlLYV1hGfciZqs7HAJz1p6C42BZPAkW9lDQ3+JT6wzL3GkZJ9e
	9uz+NScr9CHsI8FFSKPTzbiZs4FH1Xf3icXmYEGZ6+mKyDM83KdLD3sVyhJQgtQJjZF+MQUA2Di
	1ZbHHtYd4XocFENf3oS6pT+EcnLbyif2DGmTpFYrs6wPqx7mg8LEA7XlAnhJyDnYb8GR3G0J+cw
	Xwmq34zbf+1xZTOXU6oZh8HBHxAuMqr/a14uGw3T2y9ZWEnZD887yCQUgihmRyQYQAND12M/FZi
	kW1+tz9ypHJs9oGTz1HyNj01EwV8ttrp4B3BADhAQd5JaRVwquDpwlsNS3WImbVdAA+k7RA7UJw
	bKnXgNoDG9ETVslFhB6IW22jlCmy/DWLuILpp45nABeHSBDR7G0p4nXrch3H5YYqiNh8TzWJE8g
	I8DFb1FPxpRaCfTi2HyG1ho49jDJBV4TJ25z3uyaavGr+9Wgd6oevIzNL/fPosnlon6UtTdmyKP
	h1a3S+JbeRzEg72fjC5hzeKK6qK21pPa11QnGAMdv5Wm6P0D8dAAV3LYlq5GzVX1
X-Received: by 2002:a05:6a00:4a89:b0:8bd:5539:5984 with SMTP id d2e1a72fcca58-8c7dd9d6834mr12527922b3a.25.1795782889218;
        Fri, 27 Nov 2026 04:34:49 -0800 (PST)
Received: from [192.168.1.102] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm12282669b3a.14.2026.11.27.04.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:34:48 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 27 Nov 2026 20:34:35 +0800
Subject: [PATCH net v2] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-doublefree-v2-1-c0c6d3da3b52@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTQ6CMBAF4KuQWVvTKT9GV97DsChlCjVATVuIh
 nB3aXXh1uWbzPtmVvDkDHm4ZCs4Wow3dtqDOGSgejl1xEy7ZxBcVIhYstbOzUDaETFV5LIirjg
 WZ9gLD0faPBN2g4kC1J+hn5s7qRCZuKadHVnoHckfmRdfmSV6QYaMtCxFLqoTF/rajdIMR2XHS
 PTGB+te6esF072/mXrbtjesSyyO/wAAAA==
X-Change-ID: 20261115-doublefree-c43a6e0c0149
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795782889; l=2322;
 i=hujy652@gmail.com; s=20261123; h=from:subject:message-id;
 bh=RN2yLGJnyx5H7no7hudUjpQ4FMkUtmVh8Gq3EY48fGk=;
 b=9t/lmpz6QbAGKctOeVKWPpQPH1bvAJ5wQ4FMZxDbEoDdPv7wfjAmeh/TzUHRRG4+C+FIxuuW/
 AXqZ1kH9OjwDPoXIVJy8IAzDz/DB3X1yxqZZj1aEH1raasz9PmVXmWm
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=MXiVj6rTyQLjK+RN0A0WiriSkqHj/WJPKnbDVaSWdgU=

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by setting dev->rx_buf_ring.desc, dev->hw_rro.page and
dev->hw_rro.desc to NULL after freeing so the NULL check can work.

Also remove the duplicated mtk_wed_hwrro_free_buffer call.

hwrro path is compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2:
- set dev->rx_buf_ring.desc, dev->hw_rro.page and dev->hw_rro.desc
  to NULL after freeing
- update commit message
- link to v1: https://patch.msgid.link/20261104-double-free-v1-1-efa52326702f@gmail.com
---
Hi Lorenzo, sorry I decided to update this patch instead of adding
another patch.
Hope this is okay.
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 0bae25247798..0f215dd3d2d4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -880,9 +880,11 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
 
 	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
 			  desc, dev->hw_rro.desc_phys);
+	dev->hw_rro.desc = NULL;
 
 free_pagelist:
 	kfree(page_list);
+	dev->hw_rro.pages = NULL;
 }
 
 static void
@@ -896,6 +898,7 @@ mtk_wed_free_rx_buffer(struct mtk_wed_device *dev)
 	dev->wlan.release_rx_buf(dev);
 	dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*desc),
 			  desc, dev->rx_buf_ring.desc_phys);
+	dev->rx_buf_ring.desc = NULL;
 
 	mtk_wed_hwrro_free_buffer(dev);
 }
@@ -1722,7 +1725,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
change-id: 20261115-doublefree-c43a6e0c0149

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>

