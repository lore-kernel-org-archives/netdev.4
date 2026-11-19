Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087527;
	b=IBFSdL3qRIkhxgW62DMphxsMrdIhEAMRIUfVnUaW9jZRmXrhi42W5vNwlAhv7BprVF7h
	 N49iHfQFCgsNTGynl0WsYaCfr34q95PcPZQiqI5oCcK+OLNv1eveX5u6+Ls4Mbc7q5ayR
	 LRvhJC0dk/SvO/l6dQvfYuxBa8d+uWJJ2baXgQZcGiodrT8NWyr+QwQbQctJCwYENaZl0
	 UkJ+hxZtPJze8fvndHx9VK+nEIvK7j9B3PKa2C+SH/3Anf8SmcNzj8v9xSJz9+7LRMut5
	 olBXYv9wwy6FJOZcnW/UqdUexTJ0+Iewx91Zgz91yUYPlF9E4XT4l+cfkAIL4OtcoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087527;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qZBF9jximpjJL75Z6oAstg8U4CWukb4j0yMLWFJCNhs=;
	b=mzwMjeYZsK6Tdgc6M1DKQlolDXr6mwb87q/pVCfqVTPZtjOjPa/BkCxpsPCzETfAyHs1
	 tw+h00B1xNaznellCv/6RRKrqs4IaCBSvZkxoPY1PW2hTvRAAp6ZOJk1qXDDFU64eNvMa
	 fLHjUgqU0w/wAX1CzjCaICh38A57qnkOVqRX++KIVkwg5cVl7tgPLbwc9v4xVbTIV9rcF
	 mJHn4aTChQiLgAdrwKz5ajq55ofiohON+Rd97vJuT+zcMzEGiJ3fGFH4A8NbNAWoPufTy
	 udF7ISDlFzIWOn4Wb4YkqlC/4T4+RMth7nytgdXKDUYOy70Vh4tPqidsd/R8fbPaz+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=12Cqi765;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C68606A32F;
	Thu, 19 Nov 2026 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C68606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=12Cqi765
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A59384E41665;
	Thu, 19 Nov 2026 11:25:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AA9B60237;
	Thu, 19 Nov 2026 11:25:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 283A511BC1049;
	Thu, 19 Nov 2026 12:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795087523; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qZBF9jximpjJL75Z6oAstg8U4CWukb4j0yMLWFJCNhs=;
	b=12Cqi765624eFrrQ6n8kFlj+entCvEb0osYz+MhI4NpTtouwr0lzLHSdy0TkNUD+8rs8tU
	xsAEihh3kDqUoqHFEXSo21wofVY8kynm0fqrg/L8cHk1nsVdMHTCpCrdt1siB7XUnodE+c
	qA2QRvCIK2v0Q0luhVV06u3PFVJr4e2psfhX+qeNgw50A6ANd44tD+06472WcRYI7Yz3i4
	hvfkwjnB9/0nM8mG3dOFjiE+kUAKGM05M5ZWaGUFHXBqF2EYH+WlBVZ99iYZ4JwbvTq9Ll
	mhL0tJOqpzAI6OHSvxlafNUTsTZVMcei1f7rx/UQ/uoBcTgRyinW19S4fRb/8g==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net] net: pse-pd: tps23881: Fix reported power class
Date: Thu, 19 Nov 2026 12:25:07 +0100
Message-ID: <20261119112511.239208-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
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
X-Last-TLS-Session-Version: TLSv1.3

The power class read from the classification register is not 1:1
aligned with the IEEE 802.3 class value. Add a lookup table to report
the correct class.

Fixes: 7f076ce3f1733 ("net: pse-pd: tps23881: Add support for power limit and measurement features")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/pse-pd/tps23881.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
index 244ce596d845c..58ea7e0ffa996 100644
--- a/drivers/net/pse-pd/tps23881.c
+++ b/drivers/net/pse-pd/tps23881.c
@@ -402,6 +402,25 @@ tps23881_pi_get_chan_current(struct tps23881_priv *priv, u8 chan)
 	return (int)tmp_64;
 }
 
+static int tps23881_class_table[] = {
+	-ERANGE,
+	1,
+	2,
+	3,
+	4,
+	0,
+	0,
+	-ERANGE,
+	5,
+	6,
+	7,
+	8,
+	4,
+	5,
+	-ERANGE,
+	-ERANGE,
+};
+
 static int tps23881_pi_get_pw_class(struct pse_controller_dev *pcdev,
 				    int id)
 {
@@ -416,7 +435,8 @@ static int tps23881_pi_get_pw_class(struct pse_controller_dev *pcdev,
 	if (ret < 0)
 		return ret;
 
-	return tps23881_calc_val(ret, chan, 4, 0x0f);
+	ret = tps23881_calc_val(ret, chan, 4, 0x0f);
+	return tps23881_class_table[ret];
 }
 
 static int
-- 
2.43.0

