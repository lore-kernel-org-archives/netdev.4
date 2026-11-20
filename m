Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168816;
	b=ZrW+pMPNIJJoesBaaba5IDgzcYlAnkHxOtJLZmpmXKjtVB0j4+RjWvNBfSqX70eAqkOf
	 5LX4D8Fll/t1PONvcTVKSXsSUG9rOJwl4J8E2DVKSjuYYQri69t6w+3PDQmPjpZL4PKUj
	 1tcdLPvsGkhPUYcEVcqrBrcZi6RrEreqtS2+gMJznHiStsohzAVwDm02Y7VBACv0zJkUA
	 XKotua8ETaluSXnndIpqlMSmCo/fQc55Vv0Qz1J+e97MRDuSpfIbZR6dzcSqB16AT2Rra
	 797tDzs+06Xtbdh/DSb6IqpJD63W2nHVID7CrzuTsoH8uvYKbPw8yMkTHq65MIJ9FYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168816;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=FYpdjHOALjOzQmzXZoVzu5EXIA14dHzB/u1RmTE/CRo=;
	b=J2rbWTKtwdidElNNp2Yrdc3Z5KHC8qJDMml+ooRM6rhZVJqCADIuHIZdgO81WuH3IUMj
	 FnBBbm5d7u1j7S8l9rrOXaGVWDo9Vp2OiGn/Fa4cweJIlfYWETo++7uXVO9Mpu603yuCU
	 y7Alphap2PCE2PCGgJkhLUFzf21FoWOtcZ9BZIsWxw4OJIPWsBpOXBd9CqzcYl300R0kJ
	 fnHbypev3VsCy3hI7652CWkr6XstW8CsuMaOZEQiJ7YPoF3dxHULhntPFqksW1/vUHVAP
	 y4vhSjXyGHn6z6ta8Fat/euwYNmccoGk+PvFJ0YfFqpN6XVlqgvOUY4lOmfWLfv2b3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CD606A325;
	Fri, 20 Nov 2026 10:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.40])
	by smtp.qiye.163.com (Hmail) with ESMTP id 556ad0d34;
	Fri, 20 Nov 2026 18:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Frank <Frank.Sae@motor-comm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 2/2] net: phy: motorcomm: add missing trigger link for YT8521
Date: Fri, 20 Nov 2026 18:00:01 +0800
Message-Id: <20261120100001.1568757-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
References: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
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
X-HM-Tid: 0aa1f86637e103a2kunm70899e361e14a1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0xKVkNOHUMdSUhLQ0gaGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVU9LWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+

TRIGGER_NETDEV_LINK is available in led_hw_control_set,
but missing in led_hw_control_get. Add it.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2:
  Collect Reviewed-by
---
 drivers/net/phy/motorcomm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 5a0cd4d7d633..4552eee872a8 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -1918,6 +1918,11 @@ static int yt8521_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (val & YT8521_LED_10_ON_EN)
 		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
 
+	if ((val & YT8521_LED_10_ON_EN) &&
+	    (val & YT8521_LED_100_ON_EN) &&
+	    (val & YT8521_LED_1000_ON_EN))
+		__set_bit(TRIGGER_NETDEV_LINK, rules);
+
 	return 0;
 }
 
-- 
2.34.1

