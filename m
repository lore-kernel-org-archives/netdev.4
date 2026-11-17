Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943961;
	b=MMSd3rPyxGk7VsneEDGQYVkyWsNAObGcIhpyg3CfVYrdTLET8mcmG/cX/s1JDfTrA+2S
	 Or5GIgDzwEt/xWxR97buRf0l/zE7Rb9x5nd/R3XK2txKRDVu0kOrBLPz143OdnTyfjf3T
	 sjOJ3PhW8cBG9cWCqIlV7bYU4ItyEugAAdJ26uLelJbC/kW6NBRX/aPXH2AZXw+2Ne2FL
	 XsKLOo8BbjvS3Ke5qlbXudSGjKufAodyI56BigNF/CAgp5Ic6Arvlr7TSWQtm8sbUdNeh
	 BeUuwcZ3MhG/6BT2Vj2qmadR/QgZggs5Nmq0wScHbuOB1ciYqPU56WOpOWcEkrVR7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
	b=rc8G3aNitoAg5tYCzoRw60AUqLtvkyO8lC6/j7TomcDbSHQcFEjjV3mCcc7CwiyU6/Bf
	 lUjSfXG8Zra0NGE2BaNmdMBQk5HhFrRXWNgqDIWoANWCC2w8pDoZWqiQhBrIg8iuCHBeV
	 ddUzZYaurThgJfuUcVt+TkzMlysH6PvnwsnsfDlwPePF7ZW7gs+ZDNmMXm+2un/TdFKlB
	 Ck3s+Uhi/4ex46O8Iro4yWVzEJmPrOlcFcqYKjA/54HDLBOLLHydYy5UtqkLwwfPyZTmM
	 qXuwhYs1bsl4ZN7yXFve1Yptd5nYiYRePfv8z/WRe7JSAPa3RTZdbi42gjXrcMDD3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhrdHD8K;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83960A3836
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F83960A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhrdHD8K
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso451597eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943960; x=1795548760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
        b=dhrdHD8KgfGYXwGTjMMA3hDKvYf7bB6mbtx4simgXUENyABEWjcX2ZjButVRclPrKA
         B7/vPj2A1bYzE2YahTWURWywtoLnrw7xnz9bCa23639VCmgQtCnYh7wMeWcD2k/VlPii
         Ai0Iabbw0iJuZ5Ngdh4EgEqFl/WYvdewQ6EFq5+KIdugKq2PKOVqBuH3QtXlQQpNXcvb
         1dEkY07UyzISyA8OCSj2wKqrMFqVPdUs6oeCPgBhD38U26KLdLKnlvolvB+YhfwxEvwc
         YeRGx0IsPbbDwDGZquItEM5EgnWY3sdtInCJFMuBSpaI7d6pi50PLpS2TZOSKMTRLO7N
         x5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943960; x=1795548760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
        b=m11o6jB2rFwwxPH4kMqzsz2YntxhfXBjUNOURGqFMgm3SKhr2CyrkmjMJdtdZOHE1I
         CwatdcN9sUz+Bztz6lim3SIRYudJcQ4Lkriwz3veVSiwsqB5ubVZhLVlJCmA4T5lV8x9
         G23DRuvUdq6+5b4SS7l/fzsGGQsLPxmnnsMegZMzfFgHAE/R2ZMDMDUbyXaJpLXveTGM
         Rh07q+n/80XmqVZY8pzNKau+gGPff97mypOWa/UZLh/qwOP3gDUe51iR1dZb4jTXdh3G
         hFwc9Z7SmB3o2gDK/J2NctGwQkozEiO7yss6T47eX0gwCGK+ulVPywioRU8ys/2dFXlC
         4zqw==
X-Gm-Message-State: APuU4Z/S3aED5naJBD4OXvvVBThTg7W9cqfObns9pIwgxF/9D5bg6AT0
	+kqtkKCw8WK5NeqEFCsRxo02PnibIopZVBt/BuAq0bcATTHeKxxMhmZLkRpNEA==
X-Gm-Gg: AZFdTZeX5QThIhWDfFocWnbsE2t0hsTFOYkX/HcgjQXbiQT63C8Xn5Zu7GXdYTgmmnn
	obMv+bZyOi55gNWGMG6GX3hvndaxAeUu83hT1Mi1Gmq2e4Td8P6MfEYb4Su5Evch83ZU/rpr+58
	X+zVsR6+Zg7AZFX9nyWiOB9q2Ef5Uc6vGRO2uCmL/8TT8lAjNnlf9DG0jr28KNOzCBBBt3QXVNO
	eFplgAw+lnHSlxP0oRJytmyBzC1QcIZN5XKK2cuXbkwmiWxvmZTQC0DQQP8NAKYDNyqFZuYyacV
	Z2oNIuCN1cNgW22KWP+uuWRJYPwvLELQalDoBkVx91vzPd4jaXv1KsdAQF101nuvOAqgZm0n8OF
	ii0VB046TAhFbSj3p4lQ+SVc6uB4OumYSDrRHmgohc+Kr6H34aKuCpN2qSLeqtaNgfGraD93lau
	blFRHhubFRSjDWunX33VkF0yL5HbHnpmtMqccznd4gY5CVVc6tddU0/ECTNW6z5iVVPmQ9n7dPT
	Ib/A/kgx02CQQRkHcfKnEfXpfwGJJTDNtzQjRDaDvNlj11UbSPZI+LxbCcFsslLQjlrdRBVE3Hw
	7dUXh2te39HNsjuO7FmAkqPsInPw1g==
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr421180eec.15.1794943959764;
        Tue, 17 Nov 2026 11:32:39 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:38 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 07/10] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Tue, 17 Nov 2026 11:32:20 -0800
Message-ID: <20261117193223.2795612-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

The MAC DMA engine updates each receive descriptor's address as it
transfers data. Clearing the descriptor control bits during reset does
not restore the buffer's starting address.

au1000_init() only set RX_DMA_ENABLE on the address left in the
descriptor. After closing and reopening the interface, a receive could
therefore start partway through its buffer and overwrite memory beyond
the allocation.

Reload each RX descriptor from rx_db_inuse before enabling it, as the
receive completion path already does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 0e9226ea05e1..cb2f3333ba9f 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
 
 
 	for (i = 0; i < NUM_RX_DMA; i++)
-		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
+		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
+		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
 
 	wmb(); /* drain writebuffer */
 
-- 
2.53.0

