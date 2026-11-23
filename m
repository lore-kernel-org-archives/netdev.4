Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439453;
	b=rVdunrHmGApcaO7xFcEj/NedfTi0tuEGZOicKMO5ef9ToYNJXAvLH+aK3rbIK45ZsXb3
	 +uWvUqvJmAyhUCzCwfdgbDU2UWx3Aea6FVNM89nAIsyIn3eOwc0xYbyKPbQLCoJPi8rID
	 RQBbCAgA9ytJoYwgzf4J1x83LiYzw+7xWfepodGmEO6Vyhkq8xdZsdIWY2tTUzcosXo5C
	 rdK0iO5d4E7vX436fDryZKmroGC8XP4dn52f7RcEEoaG/YuRnM90GSWF/zEWwBfPsEtj3
	 5cEwDPtSuKspMU6wxNvwVYJ950DrSkTgIuR5RvZqoPsJDh72ijHEdNMuG5nJ+PP9CCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
	b=MczeJKQ+H6NG4dKk9dmUZkZY7hO/Ve6qKsC7GakSxyM3bT6277qADJR4FYHEm89hoAmQ
	 sbd/wUwY/lANwS0AJIiGzunS+NwWvCfgc2vQg3JdZzQlP++RSce0Ukv1P4uApPmU/a7OO
	 0NbdB1P11AywNV3x2V0sdUJAkxtUitabZnS7tqRgL3W1puNzEjabl3bdeguHLendVaMvZ
	 iajejrUhCPF0XXb5HBCpiQcI1G6UYYRrCc91FBlv6r/juBij5xQ1GfuZSQEf8lEsctbsk
	 Xv2sWlWdNeeF+w+f7f6C9e91eyT/eja2ZqRjsNTsnvebaM0Yi7ekCNvft+O7tnpO2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKQ3jHRE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0585606A69B
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0585606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKQ3jHRE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25037835e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439451; x=1796044251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
        b=RKQ3jHREKKn3ZJjIHrgF7TjaMwmiNKzcTWiVLRPjq3pLIGwkGf6KtWB6by698I94jQ
         XCsMnQjUe1LaaTUfbs8ozGg5OaoeG9ugFN6f5/8AvWqixSem3Fa1Q6ocP2FMUO4o2/sI
         Okju4V8yF2HkARROWjNxTgZmDoe4lBm5qU9rSRX1XHxJsbQZPJ/aNPfADmUDJ+ICo5QK
         Zs249JKgCGlN2r3ka1THqd0kZykkJdfOktSblnB2dSskiIH0kBVRVEzIwL8N7CyBFVYz
         BPP76bo9aKT4Y0fmz3dWvxiNaG+a/J8+oplyiCljZIbzurVOlGTTsGbG09b2ZY213O8c
         J69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439451; x=1796044251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
        b=WdJGNGtwvAKPWyZrbeu/LdEysEz08DHVG4G/IV5AqIk3XIZuGyLzaUSGtqeuXjc2Ag
         U1CNDeqksBHkziOa8XGzFKsPhOgNsU1nBP7LgTQ7r3hsLpahKmg6Wmm8xXSHuTYFj85y
         ROp85noobjxQ4e+b3OtyIaPglVZTsyapur0uXoOm6CaqENQoNolmY7Xg50LvTSMmYb1X
         LE2xnvf0A4PI33jqN2RaT9bt5AeYrEv1+hiSacmrvWUfwy6FFfpNCGZin0KFd2t/ernH
         4J6glKGFQbGJy/pqxC35T/5Q90s2JgDQ2cppJy3fDJx8QevscagbbOahWM24rclJIIGT
         2q9Q==
X-Forwarded-Encrypted: i=1; AL+hErGZ22eBdF5/5R/vmlWYorsUBDMuIIRdkxYx2Bh2V18j9Tpq/YwgFDJAdw3oenbi9Akvvnkvqzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XhLA/k+hMabtni0ZnSIMxgXwpqPOeWxAZ71NvXMhwfa4zaZRx
	XXr2FQ7IrViNFti9bA1QrNqMe1BfOy6FNgerVa0oeJKLEd1ll0uTpJsR
X-Gm-Gg: AZFdTZfJOy3obkJIhm1fX86k+/7ZkTtE7Rdk4LZNzXUvcaAITFKjqFenDctuNWIMaXX
	VHmEzU90J9NsGDOgYhnM92NiPfU2j60hVTUh+MciD7NV5GqjhcFHTM2e8nQA+AinoJnhrJW3dsM
	zR79jtuK2KkOUDf1cgzeAdzitUDIKm9fMf+0Zq3x5JMlHrdjkJZk7byXUHbVlJFLvFDhQS7GdE3
	Rv7CyEnuG96y6BTN60ofm3M0U96XZkOpSHlL2rbPq9hy1Hr7xC/3CRTJooHamnhVRIvsqab1WYw
	AVPyZZH0fcxC4DyWBWVNsm65q2pR3WfTCV6PiXMTW3xT5o8TCbo7z84QEoSZbdZoaJMj/H9963T
	pEwEVzg4Jb5s1DjiSL/PPX6kvQrSSBBUbgC8yUf2ih2cC4oqIgyVJmUrUUxTi9vO3vUmkdP7Gdl
	C0utkCd+gfoiQrQUiLzDiyJvFMqMe47Xo94VLpSTF7TIIh0MYEVHESlqaHn0+/92zmpHjW8nhB4
	Ku/flFIgEs3+ufOSWO1zdMec0EmZ5g5IR3q7SxgAp4nWc6kdsSNvFaTTpRe1UmKuKgFZ9uUlPUz
	MI1xt1S0QFUKia2/i93A4BBHh4GbwUFi/VL6FQqeXAxdG1C760LK/ZxwRMPBOm0hPD/Vfxr7fmv
	dKOocypOonZOqp/hJ6rkFL/fx4qDKfdK9k2rJk4Ep9VyrQ3Uym/DwpgBuQ9v6ZhyIxVgaD+obj9
	rbGiHTa3lnvx0P8IgpZbY=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr139194055e9.10.1795439451189;
        Mon, 23 Nov 2026 05:10:51 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6 3/4] net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
Date: Mon, 23 Nov 2026 13:08:51 +0000
Message-ID: <20261123130852.3420491-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MDC frequency is hclk / (2 * CLKDIV + 1) on RZ/N1 as well as
RZ/T2H and RZ/N2H. The existing calculation uses the wrong divisor
formula and can set MDC above the requested clock-frequency.

Calculate the smallest CLKDIV that keeps MDC at or below the requested
frequency.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Clément Léger <clement.leger@linux.dev>
---
v6:
  - Added reviewed-by tag
v5: https://lore.kernel.org/all/20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 4c32e06a3cd2..7fc62956c5d0 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -11,6 +11,7 @@
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -1102,7 +1103,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
 	u32 cfgstatus;
 
 	rate = clk_get_rate(a5psw->hclk);
-	div = ((rate / mdio_freq) / 2);
+	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
 	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
 	    div < A5PSW_MDIO_CLK_DIV_MIN) {
 		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);
-- 
2.56.1

