Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654553;
	b=0m9yF6xaUCMpg9PIbMasTyYQAw4VGwMHtQCqeOKlHiRzSM0dbJK4pcphsrQ8354xklgL
	 QByA2bk+9O2CBXS7i8tnOm+JmAFOiXNrhtL8Z7LkOaizsjok9PgjG8/7t0L+h/HG/j4PW
	 wGfBciv3XhEZsUzf3U+RlU5/xQy0uP7U6azZjrwLESarnFXz1jBwu6Ynnxwvi6o5+ygeN
	 dJRp6vJujOAMNNTZAOIqIWjpyfsgmss3XOAsoesNN7SUfvAsO1jibPMSU/fexPzgL4eq5
	 vvP27B5hVD6Ue90qcrzufugEHqIXCuXYJ4TIDbedRXtwFhIUNstMgSACWUfdjVcyhRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
	b=IBGC4ElUlOU5JvaNGMFsk6zlJaj8ydmxTdQ1732W6S9l517OpigvKrezfQ4syutnwjxO
	 7wCm2EA1U2gWtyqwR7Y3mDiT4aU9mAnEem1p2sSnUUrzdWUr5xDMjs+YsLstFrQbm5zuF
	 QJK4PqEfQK4+ootE8dE9DjYWmjzDTa3vr9RcAXW1bmvCGKEI8nK+R8SN6wmq31jFc1ckY
	 Feblrk588Q4IHY7b+WKDRWsPiGS3Emv+Br3zl+BRvlki+kZpPCXoiOmx/LZ4PuY2fbF7d
	 OowPrZPzKQMmqZJoWoc2bBUOZ3TJHaKVvO9kSwb6BMC9H4S7dxMSbMKA3E7GoWg9IUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raa7NQJe;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB9606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raa7NQJe
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so4817173a12.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654552; x=1796259352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=raa7NQJeOEy+wc0CJ7VFo5lE7I1zAEUo1T/vZQedRxqtjrQoNaLrmTQIuwEN3AwtFj
         lBw0MAsY4VwXYQQb0RuZyJFVLsFTpJE/FQ4579DYKK81ePStObtkpc3+uBgtAFtPWM6w
         nigVeqsFz7CXb0Wy30RuBoF0a3rZemXtduvrgXDYQVa9Wc1ypfPd0D+40e52l2KubBke
         ZNx1ONdThKexYo6ShKk+JCdP2EXCZ53n/edIvJVfiCaep0RLA+gIkQMUx+sFzURqiJKQ
         voDhHJ+4YRyaK4JiKVmSnVD4d1+MDxA8OBD8Ueh7jUaT21G8zcVsgrNy2fpSoLeLx9v0
         0dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654552; x=1796259352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=rsDLqmZFUuUTNfcI6JYAwowj1a26pBc1jhTDt2lmqNpon91bWw7Xm9T7xHAEZsnR+5
         dtBAj3cVLB6P2078bTy8BHSeRcnkNLL6RpPGILcibOz3D28zdCAsB+JfhrTeoTfRM/2R
         JJ7Z4DBBsVq0fu5KupfnoYillKQHPcSYvqkFcBODxWKM+6UPdcRIEYHtQHrcY9hO5fzR
         eYwb+jHbN9/emqILtxndt0VSlTmmzi399P3rPCrVJBfqYqH+nHQ9Me7WFHUPcthJiZSY
         d7mM01wlEn2c6l3BjV+T5Fng39bCZ2U2FgYqTx1UGJ7YIlqgTrlCJ7pL+udXVmAgCJ1T
         Ds3g==
X-Gm-Message-State: APuU4Z+CWly/gASH3gKLnstCpZ76PiRBH+LbsafkrE43ACWg49QvSHb5
	MkyrjqovWTBUT/vps0VHq+omgWF/JpaxDIlDlPrRzspbWrK4nntbwHi+LuVeUPhh
X-Gm-Gg: AZFdTZextGi5sski8Hhh63HrTNwRnZVFLJKneVweLwlqK/ADJtZfmqiCfUcsfD6o4tw
	6U1U9GZfqWXBBKavqmpuK2CG/aXVgMBFs9aKVFLmo+mXXQJTFUJfdS0bUTjEmT7vsV5lB4Nu7VO
	ryIUuHnd8JxtgzXV1TVTliYgPPAt0u4UlRo3NLgaV+bvq8ABWkJZeIiQjThuPdfcENHSDvYkoGB
	+KJdThzDZT/hq+6dkAou1byAqIqgrcMosq4ZgKk5/T0vNbbWK/mXcrRf0VGzZlgogDhSP0ERoNM
	KsH0Fpjf+e/d2ddGK7eCAQsxZxvxOyR+/8WSxkxwUSfVnjPRaTIUcvVCI8Uvv/KH2Nar3BjFcgl
	xjkCajg4zUcXshBygV7GNRIIWg4sRBZB/80tVghxqHDbQtxaIX2/3i39C4cALoMYWgR9nx1Agel
	vaLTwuJJswhkS2pzazY11bOW6w9UDLZNgwjZeD7nIQPd7KCN4z1hknvSTQRidKL9gPPW9BIRcAd
	JGHnr0VtNfYwMGtFDusZdQ7GKYMbjhA/QjreIT/g/qQkfHlh442wO3C/dN5xvTZmxrYTIhk5uxJ
	sGDrSfnaPeuRlDFb6PUKcxH2CwqN5H2e1YRE/mtsS96f+DgP6YgAFCYXAHgrdBap9R9Y1Hnxi38
	S
X-Received: by 2002:a17:90a:e7d0:b0:3b4:a90:7f3b with SMTP id 98e67ed59e1d1-3b41c97c98amr18942187a91.56.1795654552437;
        Wed, 25 Nov 2026 16:55:52 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:52 -0800 (PST)
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
Subject: [PATCH net-next v4 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Thu, 26 Nov 2026 08:55:15 +0800
Message-ID: <20261126005524.4156940-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

