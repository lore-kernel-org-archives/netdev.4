Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691053;
	b=jSw/t68AZ4IEw4jsAXx12MtWYOXjVfjNxtzfigfRjCwSMCh48EJ9Ev4Cwcm4WVc24Dw/
	 bR0U0ZrR2J9Lcq0jhEGJkF+I33vBKg5BHa5PdofbGbjCrLxJiZ6n7hWwb2rjLaOiPa4iT
	 pNUPMCdohFdkamhGB0YL57+aOhnB0t+4lXdRr1vrXg7hXMs3zvyvYSzjtorNx0QxWmBSG
	 l+i3X8Ese/+XRDON97eKyn9h/pVEC4v9OnEFPEyHJrDbwE2InylvdRY6OrLuXhtJt8wMJ
	 UadLEZD+IIq9lYwVj2f9Z2Es+IUA4dES06fEqrgSm1vye9yDkkvu++ntxA24P4U/gCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/nwjqUcaW5Zp78qHpopVSyGYKIJhI+Si9U1eIi6rdLk=;
	b=HWdklxva7EmZmIQPdOd790G2v8vMG9alu1GbttbePzsC/0SXWtOaupSxlMKGm+gpJaWx
	 JSB260YlOH+6u1Dx32eeZESt7E4DfNrqjVfOPTjblpzuqh+/zBO+mFvi+jYxmjhgrtSDk
	 O7JFJIWXGzQisWuiWyq6X/b/L/k+ChPR7XkQgJ81TwYv5gcsAI4Cl62OsqLVw1+my5re0
	 l4PFh4fZUXrUD+B390orkeyOVFveZ4DM9R3UVnFI513IJay+e3cZ4q0UK2vG8qxIbqrRc
	 PurKDHkFg3GTyuknl1Vyb/TBhrTnTErNRlZZ8O3vcaWPixFBeAkV4uydz8+ebxKVvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiUsCJTG;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420C606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F420C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiUsCJTG
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f046b0adc0so39887655ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691052; x=1796295852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nwjqUcaW5Zp78qHpopVSyGYKIJhI+Si9U1eIi6rdLk=;
        b=QiUsCJTGvcU14aKahjy326GS/K3Pkvg+8XrMFamAOaEz67LBhDfugGp6lARsuUHP1M
         uSnU07j2h7LFNVby/kPtFlY5+brWO4+lDpDBPOzTHu3pqbTc4NFqdsP6CF38aQQ6dhMt
         EpLlXOVe/kyM+SSfEoXiF/8ZOyUMS10uWly1nzpoJ/fwEcjIr89zvDzdGWsvy7MulN9l
         CPUeWfwDuFd2rOnxEjJFEAQ4D6jXliBtDKDMpOLQXTcEl14dESF63Lzi7Iq23WXdkg0z
         fDEz9qHcyURSy1Xta6byy8NPVguHCCWAW0KYy8JSyReYnNJKt/Y+/1+c0oFfjrqHz+qb
         y5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691052; x=1796295852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nwjqUcaW5Zp78qHpopVSyGYKIJhI+Si9U1eIi6rdLk=;
        b=imuf6x8wtOW4kanuf9zX3M52KdH5Ei6jz07g3XbhtC9sFAfrWaijH2fi6CdQqnh5iL
         h/dTZBliyWoZkE1+Vki/471gGRT2Ys2C99WxgFSF9aC9tML7t5P6Sxb1w4PmndJVr3I2
         eo5yYSW+iL0HxPq0vyHCt+QIkisSIWS6u7pPvCda3AyMmvRktYCPVLNP7xyJIKtocg4Q
         qe2WM2H7z6w7G1NwnuqHzKHkrsPhzLYVSZDBHIZGuiSuPoD4cfwQnSJ6qgixWdIWRmSe
         f9Lsp2QrC+/NPK8TDPCte/myrkqg5ita1h7D/3sZF7zqptGDHw0lL5nTk8BOws/OoIuz
         W+eA==
X-Gm-Message-State: APuU4Z/mEOX2MVgcH/TLdBLKcygjh9HLSCuZ9f/IohWwPvUUkjiPL7Yv
	qSQcbSLFE/I14OF79UfWxKOrwuoXf+rcykrsS6a0UH8vBh7yR6gr7tSASsKiMNJ1
X-Gm-Gg: AZFdTZdcHYgk12Xg0of+CcC16sQU8ZJtl4ZKDQZ9GRMwa6RMDZdpmhwl/2ySGfW86q4
	NqX/xX/uxqL3lVUr7d9+3sezL8R55bY9uYADLl76mF2RfNc6/AjNDzaKO6laxBwr8pR2Z9KDO86
	S7axza+NeTaYXMphdfTL9SI3E38xLr0MuuVXxpT++4qscSDXf1ZsJuWmEj9fzDuJg2VQB/Yh8k5
	aVSIziwW5OgsgTri5IjCmvscQNfT8Sq4n36yfjj9/lnCgM00zg688vZyTtmNz0NOE5u8sWJS/kz
	l9492N4OHwqJEV41TOaC7QYKCAdRBfJ2YD76KdCg7udPfZxevX/PFwyG4XRK7ITJvR2iswv5AkI
	Aja7q9ap5TV8VtWcSGcZuSyF6hvu8JhRpG1+sCqbyAG3PZ2JWVYq7YP3/wdwEFjW4bDYIA4ML2w
	iaJPmyEGOF1GE473uJmAK5ZU9SexcSz2EeI7JeTtgbzbHLi3kb3KcQKkc1gV1VXarYsfjlSGhL3
	NJFOZwik7YWIaIQYIxlStc5FzHIiBiF7CMdgXK8WKwhMv2QBJYwX7DqcO5N0xmLHPCF8EatxS9N
	BFjMcTQGwfQwZ0+PZ6KxfRNQo7PcjNGSnZ7Zdt5MUgPYXXNfOz47Zs5n
X-Received: by 2002:a17:903:b0e:b0:2ef:f9a6:1e5f with SMTP id d9443c01a7336-2f03f144747mr184284375ad.27.1795691051981;
        Thu, 26 Nov 2026 03:04:11 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm104525725ad.12.2026.11.26.03.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:04:11 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Dongpo Li <lidongpo@hisilicon.com>
Subject: [PATCH net 1/3] net: hix5hd2_gmac: unmap input TX buffers, not returned ones
Date: Thu, 26 Nov 2026 19:03:03 +0800
Message-ID: <20261126110310.344521-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126110310.344521-1-mmyangfl@gmail.com>
References: <20261126110310.344521-1-mmyangfl@gmail.com>
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

hix5hd2_free_dma_desc_rings() released DMA addresses from tx_rq, the
"return queue", which could reference memory already consumed and freed
in an earlier round, or not yet reference buffers unconsumed from the
input queue, resulting in memory corruption or a mapping leak.

Read the addresses from the input queue, tx_bq, instead.

Fixes: 57c5bc9ad7d7 ("net: hisilicon: add hix5hd2 mac driver")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..46386a0954a2 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -816,7 +816,7 @@ static void hix5hd2_free_dma_desc_rings(struct hix5hd2_priv *priv)
 		if (skb == NULL)
 			continue;
 
-		desc = priv->tx_rq.desc + i;
+		desc = priv->tx_bq.desc + i;
 		addr = le32_to_cpu(desc->buff_addr);
 		dma_unmap_single(priv->dev, addr, skb->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(skb);
-- 
2.53.0

