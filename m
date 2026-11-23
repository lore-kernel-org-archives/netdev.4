Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440872;
	b=Z4HA8rjCHGtCLy7wLd3UXX8ltVnN4V0DUxac/klQRIsa9IPT6MXQfEckZwxAXQwQKMeh
	 ztg5jcpuDw/JpD0pDOPKNoxQCAxnDPrW8bc3GCA7n5C83ZoC08HYQ9We630Iwjk+ciRhL
	 dwFwv+JNN8LoWcf3DdixqDL1Zw9HO51yfsSuGlZtJfHAYTe+Cv3HakJ22AoQgFQWqW0Tk
	 DKw4ZcpW1NAY3EAlxuNRxbhJNGh7gWaOYThfNKWB2zIcEkrohSu2tVicyZAzIdD78UufV
	 o9ZRPOUKghnXa/ibk1gi85BCnv/8rGHWOqz1v9nthz224e7YRg/XTrp0P3xN+HalGqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440872;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=AINcIDDwj4eQX8NOiiAhTmz44nWBTca0iWfUd3yHmEI=;
	b=KikulAqkE55izm7YC5fghILsc6UXOTN9cNPS7bK52xiM76SdE9fPRl1PXu0Tr+gMwBeC
	 Ov6nfk9RGXx7A4MP7bQSgTqSqEGZfra3Hn7vlC2oJ33MUvftHjuCgxv7qhS/CUXPk1oLz
	 G+yhr0Mph3tdsWuynIeIgHzH1YorMAvt7CYds+KKJQ4FMNfe64yAVkOvLo1wv25iym+m/
	 kaI3hh10aolgj3+nPnVdy8AWEzOyJqACV+n+w72RNaylphXllKo2DCVGKLi6TyaX47AZm
	 mUMFXdyn+SeIJte/JB6dmryEIA4LzcrHtb/0r73DYrZnoATrMPKAZsRRMAafXZ0f/TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Fwiba/du";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB755606A31A;
	Mon, 23 Nov 2026 13:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB755606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Fwiba/du
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8C55C69149;
	Mon, 23 Nov 2026 13:34:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D17FA601E1;
	Mon, 23 Nov 2026 13:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6043111E6A27F;
	Mon, 23 Nov 2026 14:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795440865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AINcIDDwj4eQX8NOiiAhTmz44nWBTca0iWfUd3yHmEI=;
	b=Fwiba/dunBHflforMDp8fL1Yo35vKdIm+vVcoGrzE9uv/8MoBw2qRMNK/XuOKtMDWX9DHP
	BxUtAkth0mNRZtFol/B4TLQiJUqBr8FrVNZjaw+h+ExzXJ8XYKZnUgSEcm5tpTZyefTX5G
	/HnmHEkYtVz5KgoeOOnX+cL4atqHlhph9Z96ajdEx2MdP2nTTzpI52h7MOcGj8w4G3lTUa
	SHu5PrdhprwA2wW4YXj4UdRgC002z+87P2nO7Y67fX2IzfAXFWs6DtPl1ePyXhHyVjfqIe
	UWs6Rr4w/bQsRlbFjpnltkX1dYhLSY6Qpb9b7MORiSiuu/El61ZsaTEy+w2iSg==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net v2] net: pse-pd: tps23881: Fix reported power class
Date: Mon, 23 Nov 2026 14:34:16 +0100
Message-ID: <20261123133420.708557-1-kory.maincent@bootlin.com>
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

The driver reports an incorrect class for values above 4.

The power class read from the classification register is not 1:1
aligned with the IEEE 802.3 class value. Add a lookup table to report
the correct class.

Fixes: 7f076ce3f1733 ("net: pse-pd: tps23881: Add support for power limit and measurement features")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Report 0 for unknown classes instead of -ERANGE.
---
 drivers/net/pse-pd/tps23881.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
index 244ce596d845c..a2218a872e83b 100644
--- a/drivers/net/pse-pd/tps23881.c
+++ b/drivers/net/pse-pd/tps23881.c
@@ -402,6 +402,25 @@ tps23881_pi_get_chan_current(struct tps23881_priv *priv, u8 chan)
 	return (int)tmp_64;
 }
 
+static int tps23881_class_table[] = {
+	0,
+	1,
+	2,
+	3,
+	4,
+	0,
+	0,
+	0,
+	5,
+	6,
+	7,
+	8,
+	4,
+	5,
+	0,
+	0,
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

