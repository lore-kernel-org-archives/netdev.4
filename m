Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113349;
	b=5NU63NGnxX3k1hZl0UO7mRjpnp18AU68/rXhgsh9CCduwhuRJ2qMrWL7Q3I1bYFVvxZR
	 ZEnkg3CV4onjQ4MU9H54TWKCsa2GCdu5pfgL60xZ6qmQv4f43D6KSrH33oJo+XQ/88eVZ
	 x0e7F4TlIO+GnHvGiyRrPHvdBrQJtLc5WRwozBmdNj+v2sdxbQIEpZK93p0wi8pTwThfX
	 I++xIsZ5x0T5eQ/sqvYGUS1c+//u5Mem8qw9U+VuOI/b93CdlJlt3ELqcVjo5NIqYXMEC
	 EgeDIEKf89JObWZs2dlX9XfeFRePCTntzv0cXH8MiLwQkvv5c9INLJR4JaCVesk3J6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
	b=sI6biiyY6hWbgjaOr561HaS7UEC3foU4BNXsN4aTa/5PjVVQuc2+g45aC9LsdGq70qSE
	 XzHwzVd2hy2uuiAZyl3OpflhaLTsA1+sfjbfGVbJp5ms3cHzg0HBoftBCkPzXBiNJ8VgC
	 aIzQpMG3ahqlmCkLi2o3wc2h5kLo27WosxPWZYXdy3FFr4fdUkF+MDBfdEPIvFEFLZCSr
	 lvoiIPXlScIMTHJxM5VCfcIpWvexjczUY3E/7LrLnJx6C8q8t+YdGfcvvt5eehqpZQf60
	 aeiWoX5ModWSwOZ4X0CziZFJuUqJULv4662UcPulpmK5QdeOWtqZKMdznDKcAaPH1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufA8C1E;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E42606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E42606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufA8C1E
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f03eeda984so191965ad.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113348; x=1795718148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
        b=GufA8C1E0JRgyB3MTk+oz4VjJR0jyumN/4zL/sbaysHpBxIEBG8tqGty5Tb6EWijpe
         7QxmUA+2eDW0bTr6SCk0jiW8uJQSP+x5T28HhJpknwQBeuYhszILI+YsWlnnd5SwLvMj
         UCB1Ok4mq2bQkzkVUDkWxhgVYMoyDB8yJmWO1a26oPi9Kl1TN/MZeKNUX8WtcC7s5tQq
         GDWxk2StFJuPqaupRHWR/zx+GaFXqlKdUEMIMxTwyAq9hk95/SNCOf6KAHaz6DAqe69U
         XSlSSyc7wcSMBngieDzMBV86A+gV3KarGU7sVlfOBPpJcEE+CEHZnQCli9srtubz4FHk
         9dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113348; x=1795718148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
        b=G9ce9CUq+H3/FmzHQqhYiiOlzIja07TlnITBJmgb9HWwKWsdWkVq65h0sUoF74NtR2
         9xbZuhIAHk9Pk920UMQNQ6tK0wAhMdmlLlSIY/rQwfcgtl1pU7QUUflzY1cxNKGjWPCr
         qaRTX8mLVua/kk6Wvfn96BP07zLasnvUg5tmoxz1C1BU7/l/gop/baaM7jM6fd2GhpfG
         geigHlXztgBupmSlgq7xDTyGq1NnMmcEpkh+edoHaISkrM1usfr9YFiMvA2kbnNXAptc
         pMontVDPPcwkv/sQEhg1x5mjhvWyBqn993ij1eCeoshSw/Sbh9DfmdLOqWhUeSkFnUfS
         89FQ==
X-Gm-Message-State: APuU4Z9ST4yywhE+KV8sruuQFSwukZ5v1uTR8j6b30CMNqsA1GDFNQt6
	IVLsw08fQyoFe6gxO1fLq9w4ATr6gtpVAYazNpDJubNzXJ6mxNvlHZJCMiyAxvhB
X-Gm-Gg: AZFdTZdRxi2tFEg6zVkGSWObctQpw1YzBV9ynaqDDX5spJPRPiIUKbdl09uk3/592zG
	1gG0lE+YSDOXOEc/YJ/uGV9uQVG6S46bEj+5UfB/LpEzqZLfcH4Z0rEFLu+LLVLUv+j2fs8ASyS
	VxIsB9vNWFuyKl6IFja0fNEK5I7cvSE1+PZp0+Wlqu8u0ilmJXIbuUdO9Emx6MIlw4qYP9EU8tx
	Z/nwJBc1mwH6Txqg3P9WaPR5Br9CiNyCB1IJ6lX/retgOgpugUG0TxI4M6HpgbCWBbaQfUIIlVG
	qMnHkPDcIcd6NjfJY+K4UJBzUDvl6WPn4fUbTd1Ie4X42PeObQvloLzT1zWBsL9L22J37zyza35
	MvD4az11n374DppY8Dp2GRZ9OhJlzl8e29jea9p6Ob/dj1DrW738VJA6SQPSTi8+BshUjsq4No3
	cTm7UZSvflUUz8e/lAzDYxoLVcnY+AP3WiQP3aqIgyzftlXU28EWvBqWb15lLLdVkV738BmdAJx
	WeAdXsT77jjEkoENX6Ed8/LCu3aokxVTfANt6mKMbJQQ6jhitOsWj34IdUPy8X8spuj2iS15nlX
	Z+izkghqCrbXJQWuuGKVVlKQubLV17yL3eeWIhwA+aaWPDyfk/Yx
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr8013355ad.37.1795113347742;
        Thu, 19 Nov 2026 10:35:47 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm3490105ad.54.2026.11.19.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:35:47 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: dsa: motorcomm: Resync SMI slave before register access
Date: Fri, 20 Nov 2026 02:35:35 +0800
Message-ID: <20261119183539.1028929-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A register access over MDIO is 4 frames: 2 address writes followed by
2 data reads or writes. The SMI slave tracks the phase in a state
machine, so an access interrupted between frames, e.g. on an MDIO bus
error, leaves the machine in an unknown state, and every following
access fails or acts on a stale address until the machine is realigned.

The driver has so far assumed every access succeeds, and relied on
manual resetting when the state machine wedged. However, without a
dedicated reset line, the reset itself goes through the same SMI
interface, causing a chicken-and-egg problem.

Realign the machine once at reset, before the first register access.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3:
 - fix transition table
 - add dev_err
v2: https://lore.kernel.org/r/20261116162303.1368472-1-mmyangfl@gmail.com
 - only reset once at setup
v1: https://lore.kernel.org/r/20261111163954.1132921-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 102 +++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 35e70b322608..86e14ec24abc 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -98,6 +98,101 @@ struct yt921x_reg_mdio {
 
 /* TODO: SPI/I2C */
 
+/* Realign the SMI state machine as described below.
+ *
+ * An SMI register access is 4 MDIO frames. An interrupted access leaves the
+ * machine in an unknown state, and every following access fails or acts on a
+ * stale address.
+ *
+ * The driver used to assume every access succeeds, and relied on manual
+ * resetting when the state machine wedged. However, without a dedicated reset
+ * line, the reset itself goes through the same SMI interface, causing a
+ * chicken-and-egg problem. Furthermore, the driver verifies the chip id before
+ * firing the reset, so the reset can never be triggered reliably.
+ *
+ * (A/D: address/data, H/L: hi/lo byte, r/w: read/write, ?: the same flag within
+ * a rule)
+ *
+ * State Input Next Comment
+ * ----- ----- ---- -------
+ * AH    aw?   AL?  step #1
+ * AL?   aw?   DH?  step #2
+ * DH?   d?    DL?  step #3
+ * DL?   d?    AH   step #4
+ * A?    dr    A?   `0xdead` sentinel
+ * ALw   awr   AH   FSM reset
+ * D?r   awr   AH   abort, frame discarded
+ * DHw   awr   AH   abort, frame discarded
+ * DHw   dr    DHw  `0xdead` sentinel
+ * DLr   dw    ?    `0xdead` on following drs; next state undetermined
+ * DLw   awr   ALr  abort, frame consumed as next access's addr-hi
+ * DLw   dr    ?    `0xdead` sentinel; next state undetermined
+ *
+ * Any other REGAD/op combination is not characterized and never sent.
+ *
+ * The reset sequence is awr, dr, dr, awr, awr, dr, dr, plus one more dr
+ * as a heuristic sanity check. The sentinel cannot tell AH from AL, which is
+ * why the check is heuristic.
+ *
+ * This is bus-related, but I'm not sure whether it should go to
+ * yt921x_reg_ops - decide it later when we do have a second bus type.
+ */
+static int yt921x_reg_mdio_reset(void *context)
+{
+	struct yt921x_reg_mdio *mdio = context;
+	struct mii_bus *bus = mdio->bus;
+	int addr = mdio->addr;
+	u32 reg_addr;
+	u32 reg_data;
+	int res;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
+		   YT921X_SMI_READ;
+	reg_data = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_DATA |
+		   YT921X_SMI_READ;
+
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* Heuristic sanity check: expect the `0xdead` sentinel. */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	res = res != 0xdead ? -EIO : 0;
+
+end:
+	mutex_unlock(&bus->mdio_lock);
+
+	return res;
+}
+
 static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 {
 	struct yt921x_reg_mdio *mdio = context;
@@ -2225,6 +2320,13 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 	u32 val;
 	int res;
 
+	res = yt921x_reg_mdio_reset(priv->reg_ctx);
+	if (res) {
+		dev_err(dev, "Failed to realign SMI state machine: %i\n",
+			res);
+		return res;
+	}
+
 	res = yt921x_chip_detect(priv);
 	if (res)
 		return res;
-- 
2.53.0

