Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134367;
	b=jz81wNtVkExS9I6mC1bM9Uywd/+vmiwtC6dAbyDZppeioK3UXCboOU4n5sFVOjOFWp7J
	 kD6+iO7EsS97bz06Ze8Mg6HgIlWG9Admk+CimBD3JrxcTqOLe+zj+8y/fXnrCf1nrw7A3
	 3oiLWegp0cE9RYliOgVGf3lw/22h8lYA701Dw1TdzrpHEHX2onz6Xr2HW25Ab8Cv/r8k+
	 wZI8Z9M5+1aJ56L2EaxQ9sS9W1QLi70+wWvsF+8cs8O2XPmhXkqgJuhfzTeg8df6COn8X
	 goZSRsAY3hsdimDoktRAdOx5WIGS7QbLwxZPof/lYvgg8akHq4peNe/eBfmgcT68Xlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
	b=A3iA1zVBJeueYl6NT8mPC+xTydRPP5TjHTdb5EnSvat2nXH8SHobObCGVQDt1YnxXrg0
	 xqdGLBjulkBHsPh7JrZoCjYWlWGEsq6rUilSfyrMdB99x0rQELzbq/wPQh0Jn4rta0VCB
	 Qy7/PUYofVZrDz5UiZJBZT84sVWkWc00ohiMkoJeo3TG6oMo1sEjz4TVh5Ko4Q8TfrK61
	 67c2o905AZo21ssmCAYXwLbLHLKSttQk3axkhgDyLFp45Aweocjf8owNXI84PgbCb09Os
	 AI/IsZoOTkbAvb6B7rcJEvu/WrhLLggtlljA59UcQvmtpx87YjCDMCqOwACIMDVBQYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ynGr2/jj";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FF606A334
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9FF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynGr2/jj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so157350f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134366; x=1795739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=ynGr2/jjGvoygXvXFNlSTPy6/BfBHtbxkLB8nGPePDpf8NGTR4/XrExa5L6riIzk6N
         Ck9tqLfWuq6fPCdnq0FRtE9vtjkW03EnukN8Ksa4WUiElgekYni5oOvMC5AH55Sk9aiH
         BvHoLlQ/BMg7VI2oOWFrfSs1C+itSKHzhzY4S6D5KeBcs5lc/Ik3+hz3ILzx2DfaA7Wu
         31PGmj2zIqs5q01lCdKvzTA6qTN9ctAwim1TncMIsQ0QkiwoexTBAsVyQRITZwDGF2Tc
         uwvqYYrhi1NpvpxQxCSnk+hKEbZi0GoZUE/V4ReWeyjGsdjyA8OZIBVW2m8IAxyhnPJb
         uBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134366; x=1795739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=r+xPaLALlZl7o5IzbnHVu6jpvllvLKqkzJgWnLtaRuu0IPauEK7gRsHBr5LV1bTkll
         totCDbpNQPqE5g3EStz9jH7zhVAOtok41INHXcrkMCByuWBvcGoWuA3gzm4cI7gaHHvz
         OfERCja7JAV8LxSiGzZCzvkszYt7A37PhSGXQj4Bv6qjRxYLH1OmyoEcF4MVRKHEmJfb
         4J0fNqgqONwxU/HD9tC6+zHntfDSIp3QqemMvXdXe2EZcFNTTdlr6Ayjy8CwA/hC6EOH
         3JPats3tPmrQZfI7mMh7MazCZnL/DczLRhnF7QbmHe1OlaiTwobzu6NpqHZ3HH8Vvs68
         zFOw==
X-Forwarded-Encrypted: i=1; AL+hErGT1J5qK0fTPn4XSi0UQG8zrEULKrIMv4n/qYpCqZzOuxUzNSUMUYf+Jvvnh4jgIM8gb256T28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8phkx7cxLaspSOn5pwunYkIqvNN5EVYv+4D/2XrOPTc6CyOj04
	pb4yeBmae2nfAV6Ru6Ub9dHzNjNggq0VAKqDvpFKvr8nJLGvXEJi5zCa
X-Gm-Gg: AZFdTZcZ4Ju0TuiMANoO6kGrvRnfpBL4OSQ95uY2h9q4AjH6s/Y+H3yKsqlMz5vuhe9
	gFbvowYkzz8iJxWrnclsLLUOPJZpxZtMFZVhwlWQjFsgE93aCJVL2//UWZQ7HMhbY+WR0wVEsrh
	Kerz2fo36aIDrHZLpsaeKq33UnVjUinLQRbvbhQmZxu4KmvfOjUhKeNznVg839riXTqgnvZ1IJ9
	djkjtBpUMlbWKFPmrUXmr3C/RXe4DJqTD0/2EEL6ce7hRRx7AhEsgeK6wErZcsH+oWfUVVrtYC+
	S9q8dPKlHWdWANkVFp6o4jac58dlt8hAH6s+QRChadfdnsWmWIYnlotvYS5IqkLglGKtf0ubnPl
	BsQCaufxLc7iiW/geTVVs0Yn4spUaZKMrmI8RWw0dRDshlGAjhQZsLWl5ubsPHp42otjoMe9lLx
	CowHkxqmJKbQMxs0yIOLtf4OykHzKfcFi4RVnHC8tz7doObXE9aC/9PS2uNwWvG34JtAFNoTkwo
	zbXnyA++Ny9Izq2x4AZdBFm3mTt2sw7moCAAJ+T1lWYhMzTewBK+aY9633xicP137EZh+B0vZJv
	FyaIp1sJhPsjnmQm3088sJefMEv8/O5O+unZ7xYJ0Kh/zihpyyJeTzeLSXBgWU/+zWh9Obf1SOJ
	VcdITVeZCUCly1EH0K90SU7qFouodmCc/eCHkvAjd3+m+pz3mtSCxsd93kWYm+VzGG+Ynn8d1
X-Received: by 2002:a05:6000:310a:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4abb5eabd3dmr2184216f8f.53.1795134365379;
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Fri, 20 Nov 2026 00:25:22 +0000
Message-ID: <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional reset control to the RZN1 A5PSW driver.
Obtain the reset line using
devm_reset_control_get_optional_exclusive_deasserted() during probe
to ensure that the Ethernet switch (ETHSW) block is properly released
from reset before initialization.

This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
SoCs, where the ETHSW IP block is connected to a dedicated reset line
that must be controlled by software.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tags
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 0e4bbf34ec27..669dc584e6f7 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1212,6 +1213,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1249,6 +1251,12 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
-- 
2.56.1

