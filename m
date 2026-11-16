Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846200;
	b=DAx1mTSFRI4KZDdzmZy6EY+ajTOhbKl7WsCmCGa8SZxIHWAHVYJw4swqO70uVlwtUJzl
	 jYU8gPohAEHzI4R7E2Ihm1Dll3VLw1i+1BavJPxGHcUaoUg4/Hogp6svk9jYb4RJ4WMAW
	 vF6CrBwfNzhZHNC23S3I0aCQ6Z9y5giGwjDjPCYEzXvN71BN9IG3awFUH2TjgeY6IULqx
	 nlDtfz+7zaB6VggzTQhjUy7VpAHYCfMG8wtptLL/1q6UuOtFhKG9GwgmT5POpGmybG7xO
	 pYN8yUZEkTLc/gi/m8PTtohOpJ3TDmJhlu+3Kqgv/SQS2K5FMpVbSYnHNexvGZIebDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
	b=X50fGFFTFlS4J/OQe8ZZoBQg3Q7RQFbuHptGRpr+12XKiXwQq7Pyn71datGyp4qOJ+gL
	 E+6zE7EnTQ4K4eniosD76GzQaR0hfzrSrNR1uwjNoMDt//pBjzrbVNX4jQYcT1k5oJaoZ
	 QVxtwOT0qTamuxPKAmqBTdne22nqD9fNJpI+W2sPEE5NATlHyRJtb7dLSSzdq5C6EYoZ3
	 YcBJoTmDP9pvRchjl91TETKMsi1OVVDy7V6sgLNigrVEqzBlNlO6XAZnghgoVd4RCEqGq
	 9yJ7NVN5Wg6SwSSAAuxbbwO/sadgxW4Cru1PmzmVnbm1g+boBYxxmhSB/3cj8w6eiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZkBJbft;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79736606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79736606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZkBJbft
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b904d10882so1449260b3a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846200; x=1795451000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
        b=nZkBJbftcYhGeAUaJJQG9CM7N3cgcUvM5jD44V3Q2I9KiE73lmbPeys+Q1uy/eyUxU
         veGafFmO63CH3IgGisZpyEK0KcM4rj/nkRYo0QbjGKB60EjuAMtYH0uuUZtDBjGWuxf1
         O4Dq8M5IhOR0phT09SlxyNIJg4BCEBwxbAIlkY4XhgbuZPf2R/7zKSI9eTmhbEXjeomc
         ZnrsEEPzVhEpQ5XOpjaGfAb37dndfxFHrROnrtpOdCLbayIOSQCBgyrKKq8/aeCoNGWl
         52WimKzNUGlv0B2zmknVgvq8T1tx/g/Y2IIGDCVSn0hTeQWAq/yl0DofRAcH2pOg2CNv
         YiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846200; x=1795451000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
        b=eKVlVnDUptJvm/D0+UwcWfnOxtokbziFo4VrRM6Y5ixAmfhwK3TwZ3pAsndzrVMew+
         U3maX/uaOWJUBLfs1rX9Dslrg6dBkGRd+0/Lp9lhDWrIZ0xcRP5m03/Y/ZIK5xhtuf8Z
         GRBb0D2eQJkisIpSrMTuKBdRgKpIvHVmijfCYF9t46idRhCi+9l9AxJeG776nJncAp9E
         0NpSXDVezyCrsxtbkKclq7VpnRJXqyuE0sVHMtpWQc1oyd57nnF7JX8Z3hx9Ic6vmelM
         Tu/Ay1VSdzVFCAmbdx0+scPCHQT3P7HcDfZ7SrgQMYJpsKsl1mQOJLSb/7CSex9MhoPH
         P23Q==
X-Gm-Message-State: APuU4Z/E1wl7tnr9s1cc2wdgue6pvgqRrGiPudQ+1AwBXYTTTSD4h/OJ
	/BxOefaHXvvCQDviULMYVaxgjfFaw3GVyimkEefLEsgbzzMYglvNZB4Mb9qLoQ==
X-Gm-Gg: AYBFou1JBkqWJu52h1hjqz/6PPx2/jv8WM48ijI15Abj2ZZFzkcN+Mhg2ZlwwEItzh9
	rurqpBNqbrcW91tg04djo45QFTaiMYCv2aFlIW1ZldpKr+ddrnSTmWm4YzhsliusAMZmEJDbkND
	KPY824QXiR6mzBt1zza6mV1V705Yi/udw9Z1uohEjAEvdj+y1v9KAiLLL38nM6eB/WC4ik45Zi3
	7Tt0CkTZxhSkrZCZuxg16ngswZvLKhsecsMgNoRP+fF6zx7KVgwQ8eRARuXI29+rbqG0taCe1RA
	tiAGwsmwfXslHJObLA/8XcDeQlKxbupMkNQCHoQMz4GNcpodocErgDDWoZZBDlDeP1E1EUfyitt
	iJbDaUGQ8YTO7SVgvnz+4IM9Wf9GmjE5bBCWGT8bcD6enVF8aDUg64xD8TRcS/9Cg8iaVPYsStN
	bV5tnF4qhTWWQHaOUsxqKWP09UyaXMH2UO8bLUyEA6bQs5i32adJCEVE85P2GzuutqpRb+ZF+EG
	8IzqV7BwazbC1c4ky96vsPFuSFvbxCoyUtVFsivM7yBcKEuSD25cWqX+ZWvrVVPd32M3/+eVvUn
	R8yq2YStN1MEMhAV8Uic0SXiXuK6XbKXyrtxa9CpmV84zaFu9nACjAM=
X-Received: by 2002:a05:6a20:a11c:b0:3e2:729c:9bcb with SMTP id adf61e73a8af0-3f7a8cd7b2dmr11277756637.65.1794846199588;
        Mon, 16 Nov 2026 08:23:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18cabc9sm4580926a12.30.2026.11.16.08.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:18 -0800 (PST)
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
Subject: [PATCH net-next v2] net: dsa: motorcomm: Resync SMI slave before register access
Date: Tue, 17 Nov 2026 00:23:00 +0800
Message-ID: <20261116162303.1368472-1-mmyangfl@gmail.com>
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
---
v2:
 - only reset once at setup
v1: https://lore.kernel.org/r/20261111163954.1132921-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 35e70b322608..5d6390abd7cb 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -98,6 +98,103 @@ struct yt921x_reg_mdio {
 
 /* TODO: SPI/I2C */
 
+/* Realign the SMI state machine _on a best-effort basis_ - see below.
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
+ * ALw   awr   ALw  ignored
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
+ * as a heuristic sanity check. The `0xdead` sentinel cannot distinguish between
+ * AH, AL, or D?w, but when this happens, it should be classified as a model or
+ * hardware error - in either case, there is no use to do more check.
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
+
+	/* Heuristic sanity check: expect AH + dr -> AH `0xdead` sentinel. */
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
@@ -2225,6 +2322,10 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 	u32 val;
 	int res;
 
+	res = yt921x_reg_mdio_reset(priv->reg_ctx);
+	if (res)
+		return res;
+
 	res = yt921x_chip_detect(priv);
 	if (res)
 		return res;
-- 
2.53.0

