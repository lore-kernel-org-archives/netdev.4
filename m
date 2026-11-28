Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860434;
	b=BnGqQwWBHG2A+Jbag70DIzeDkRy5RlYKN/2PbAV0lbzBllgnY0eDC17LAtVQ0GllInrU
	 hPCqvZ9f64gXS8lZKJiGOpg+Vnh8wRXDXqYiMmYvIIWCvci7nuM8xyhkWKxElE97ln4ti
	 3Kk9HqXHMZ/yrVSxch02RPti9jONVtxErPLA02INDs4XlBMP9z8nOKbCwXMRtzIAWKiCF
	 F8k9MXaA/SnuApwXO32/TsvnwuVwGH2SbFyz0I7QP7AphCW6FUtFYf//eVMf61A7enszl
	 SYpmhZaFY1vk35Ft6LjeKO0rzaRmlmwwAThjPEX1CS4r6CusWMHNgkEWETfcY/O9BVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zLPPgiwEsIlLsOTtM5j4vwexlqD+0SOZwxTu3TLFAL0=;
	b=RlYjhj96ob/a/oPd55g5EbzTqzQSVuduz0YQOXhMjWw6eFPnr46KcOhJ5fjWsZGHEF5T
	 swSh4dW2ncze19JAcmySMGcM7XogN1locWPG1ItyMuLKbjOz47y9zHi2+Q/xTcEVc8hct
	 vJ80JUkG4WcVJepaWiVNLsIuWAByG/EbRbxZ20NHdu5Bab6ZnmSv05TAnQKHxDgZI9ZRy
	 YJmQkcXWxAflUOy0ynj0WJ4fatf6Pf3ghNIXG+ZcgS5blj4k5TobaDxKKXPu5AmI49e7D
	 4ffuU+5ES/nT+s8Czh+N4Qtz6A+S3l2XOSXP8f1tsFiDkFrA8/q7DLY+iRlEniFdGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=IezeXXlA;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C816606A31C;
	Sat, 28 Nov 2026 10:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C816606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=IezeXXlA
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id A7232E838C3;
	Sat, 28 Nov 2026 11:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795860424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zLPPgiwEsIlLsOTtM5j4vwexlqD+0SOZwxTu3TLFAL0=;
	b=IezeXXlAPtsClH6a2r8RWSfry/KGHyXE4Iqo4kV4q4TJdCNjw59IYpufkL39qaG5QVq24L
	+TLFG5cofGh1so6LRHrCsq7b0W1/PU81LIeqKkaBO6awRx7VCWR1mCUIArAs36JpKoukvI
	mJz7ewuG6lM6utzal+prT41pOCgYK99xZwyCvSndXyKXjLY5JVIWWJkG+6JEQkZr3DGcUl
	Ilt+AGHGH6A1CsXtMkcg8fuGCF4XPmOp8ILSNuXfaY+kJZWq7vxgiJdnHn0DVsZY5ECUYy
	bs06TmhsmE6WusJ4BKJldDZi6dbdNbNI/LPDKwsrEavIVPOZpsrGBFZrdq8FNQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id A9cCmwICFOUO; Sat, 28 Nov 2026 11:07:04 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 11:07:04 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: pse-pd: tps23881: fix the disconnect event decode
Date: Sat, 28 Nov 2026 11:06:48 +0100
Message-ID: <20261128100648.3237097-1-github@szelinsky.de>
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

tps23881_irq_event_handler() reads the fault register into ret, and
then overwrites ret with the return value of
tps23881_irq_event_over_current(). That value is 0 when
tps23881_irq_event_disconnection() runs, so the disconnect bits of the
fault register are never decoded, and no disconnect event is reported
from them. The read clears the register, so these bits are lost.

Keep the register value in val, as the detection block below already
does.

Fixes: 56cfc97635e9 ("net: pse-pd: tps23881: Add support for static port priority feature")
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
Build-tested only, I have no tps23881 board. Kory, could you check it on
yours?

 drivers/net/pse-pd/tps23881.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
index 244ce596d845..feda71117fbc 100644
--- a/drivers/net/pse-pd/tps23881.c
+++ b/drivers/net/pse-pd/tps23881.c
@@ -1316,12 +1316,15 @@ static int tps23881_irq_event_handler(struct tps23881_priv *priv, u16 reg,
 		ret = i2c_smbus_read_word_data(client, TPS23881_REG_FAULT);
 		if (ret < 0)
 			return ret;
-		ret = tps23881_irq_event_over_current(priv, ret, notifs,
+
+		val = ret;
+		ret = tps23881_irq_event_over_current(priv, val, notifs,
 						      notifs_mask);
 		if (ret)
 			return ret;
 
-		tps23881_irq_event_disconnection(priv, ret, notifs, notifs_mask);
+		tps23881_irq_event_disconnection(priv, val, notifs,
+						 notifs_mask);
 	}
 
 	if (reg & (TPS23881_REG_IT_DETC | TPS23881_REG_IT_DETC << 8 |

base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
-- 
2.43.0

