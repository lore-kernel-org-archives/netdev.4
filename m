Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919212;
	b=2VYElR/4UgYIzs8BpOye0gqaLIKWXFXtG3CYZAQ57bUfv0YzBzXWVHPp3AZgAw4zy4pa
	 irgicwiZpDb6gYfCy/kzrsqn6Cs6cIdtHUUoDD3THIP3Px2KfnTK0U/bzGxZHE6wUGVat
	 Jr8byJ6+s9XsHqq0LYNyI/eQ9zGw65yru5nZMAo4jrUbWL6/wWB5rANqwdqLGfK4PPlix
	 B8z5nyK8ysfVOj1KCNRqg7Tq/BQQwLykVS8lT3TxJ0ggAgz/PSaEG9o7BEZPQ6uPsHAJp
	 EeEsvrRVR2jVeQzbkqha7Rau4ScGmGpqMHsuw7IyxcH+yz8cG5APO11ZOkr/kk9ydcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=1672Wd1Bg640FP4d61/uX9z85PL7b0thHzOReb9Xz3KP3bv3b1HubBsE9XDh1qGNDMtn
	 yurCc0Ruzr+hSRx60rgvUomK0biZP0fiaw+DZZR4RhWBz/H4myzTmrxnqO9bixYb/q3vw
	 tCzOpy9a5tK5mFdNOIl0T0Xfx00yzgPcly2oLG6xGUIatyja6MvyjK9NMfKz7on9mY1ae
	 x4RJSaQLHDf1PqqJ/SHKtfiyz7QiBsIXuaPs+hmKcMyt0+EVSrIU63BkpISvtyeQ3taYK
	 P6EDCTohRPgvj9uCm+pDkqUz8OqOO4HnNRrB9NZt9Tg49ENExQ5y6TjKQmoSAY9VSpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMyWs6M3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1C606A33F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF1C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMyWs6M3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33277785e9.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919210; x=1795524010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=jMyWs6M3HAp/JBLBUeMtu/fMax2mlkF8tJ3C2dxahv//OkxZ0P5ZXLTorHIDJJ9qr4
         WNL7e0OzWViTCRcsA4kwyeIYPlju+NX6Iq3odWCMbZHojlmTPWt128tI7XpDIL8npQnj
         okcXI7b/NWyZJRRjjsOgVdutTOuQWWDov1HPgBwdn+TLqg5bIDBwScw2/QGSj3G3UijY
         T5E+DzRaIqSvuM02/yXX/JaVA49YDHQbjTWUoj2Ek0fuVLq3kL0XuczRElby+xiTEI7W
         dREsx78dGWW5v0uJ0nsAZ77r5VYFhX3ngpDsmL2iinXbOdlMSCRKUeA0j4Dc/1uSSjbj
         aYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919210; x=1795524010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=hpc8gZRIXUwedzOr2pMCEdfU8WIYh90CcAYumRSGHfD3IpPl808ao1+pu4FP7n+o30
         OyThDNpU+NmgX1TA6CuPUZRd24E6piMA4lysO4w+HXrXmc4tvZ1XLa89HJnGhL0WLA8Z
         PFr82v5VVrDVoDw/kKi88GOCQ/EBCkaqOETk0h9ooQ4P1eLd6PKtzBg5/BR3vmG958Yh
         R/cyjLpgMEA3tZh2Ygs0zKswLLXunLApnOEZawOCKQkaHkTJrS+WNAWqTEG+3BuA5W7h
         s/samqZ9BvZwPwRzzrLRBpQAQHCsaP2aTBbHRkRV50ChM7ub1Ur3exDvOeHQJW/3IOgd
         SVpw==
X-Forwarded-Encrypted: i=1; AL+hErHJmr8xLwmXxOs8bsYZ+V0n8v1MmxZxgt8vM4NY05btxHUscW38RL1CXRrprOEgtrbt7H/YZRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x+xJ7NMU8tqNd+p4w62IwBIIxtpmg11t0mAwlvKxQ6JSDLqcz
	N1Z8KFKxl5RN2Ff96nWHHKp3eT0M5JMfDtH2jCz40hYM8/b2CRF7BM7b
X-Gm-Gg: AYBFou1VeCojdDLEpPprJ5BEIJQwsb0TRlrqH27kFKUV5NT2mzYQepwO2Dlpr0g4Ydy
	MvH7DU0Huiz+AQMfVEzjnqPzCodk1eHoul71MlRNDwvgmSG616AGzdAwSAb4rwz6PId1WnqOMdS
	bYuw2+TGqt70THRvOk2gnsxuHLHJbAFIQD8g69WUBL+Tja1oFmH871/53hGTZ+BzTAjTP34S+HV
	/Sx32ifNo8YI3FKxSXZ3AXLnE4gAO0ZQIiv2WFZjq7g4mk3/m6kAud2EcnH47kpPMm9tvEWb46+
	Dk7nv/ROU3PlUHGML71YAB/e5fXeUMWGE0Okv7GLuqKWRxiZHeo+N/Zr0+eBrBWuIdzBB33PbmG
	+lAB+M8UcnFdDT4MRgATtU7g+FwxI+adPwKxgLVjp0/ydJVsZxHG6DVSYcuHXs3rg7m5hC843YT
	43rFX868TYawoInHqSPL8Tt0UH0xV2ydh3oHq85rBspKiv+KHI46uiYJflBdajpu+3Fda0lYFJU
	Ij8xbTrm2aC/Oe/l0/56TvEzYdP1BU00qZQUTAoHMWPge7nH9fcBY+r6FTfiFIetRi0GPZwCFkY
	y4PAmUUNZH1VuieUzJYhEkAdHSiaJ81u0uWc/Jy0j3ODYwRXFidZauCUKVtbrzmyue2+Bkycoet
	SsX+rd92+qQNJBHD9nMax9VzuloYJL+C1qA==
X-Received: by 2002:a05:600c:474f:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb76d61fb0mr87328795e9.2.1794919209827;
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-ID: <20261117123956.11981-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

