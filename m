Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126291;
	b=cZp5GcpnItK95QQyXZpSh7XOfE6mAOWXNRA8rUQV6LQfa5jFwf2S3pNzDdmWGaIMgLM4
	 huAzlCAWlIhr9wo+5jorHa+Ur07lVOs9Dy7xtDKR8ESiIyhN5vdwYIwbjQnXriMrV9voq
	 +KPEt6BNaSkfVSgcEten5HSWIkCkaJ5TXIj6WlW2Br8n+fnsGRYNcNddJeXoo3sTAcALN
	 BWz1hMANF3RQAiYr6A4TGmrfpmQSJQTd7u+pnSy+UneYtttkDpxNloVslz7sodAvuYs3G
	 t9egnJH9KwdBgNy9Aih/ldtihU2EMB2sDZAFI2q5R+S2wpEkmCg9YqL28exjnX1RARQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gGW7ZdN7gX0aV1cRU/LLC9Q+zZEpF3SDhxZ/As6s7po=;
	b=YSL1rdhdVrTcdjx38vInjbjd+NHlhk8AOqUTuiX8bGhHSJJWf/7iKX4ND7v746sKiTJD
	 i1DSVZ64+8vVvtWbqdRjI2aFP1zq7NBge2q6kRJbRAWk1b1jRnDPm3BpZN3CuaHTc2bG7
	 oe9xVkQKn7qbXOqUejUmmzDh9uYN2ltbjrohooYXN2p/zjcDfWa6v/3v6ym18GHpKUyhP
	 AbtBOVM1AT165Dlb48+N6shjxZkJGLLgcQ4oy+PmkO+ClIBfoF979ykCncdqWV/VNgdas
	 ZpdWJXCEhdbnZ7jgInsoOBBTbdYFKy6E076E+C8WCGW4pEcBsLEWPCEUQ/TVJ1YYKBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itpa9brw;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2268606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2268606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itpa9brw
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so187839a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126289; x=1795731089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGW7ZdN7gX0aV1cRU/LLC9Q+zZEpF3SDhxZ/As6s7po=;
        b=itpa9brwOYLyhWte/7DAwD9zL8AeCwwmJRbolHfuUEQlmz4jVgFD9UpIv/lK2K5F2s
         L+5WDVJNALVueHhFX3yv4tITTIrlok5IjTVeOLli2NnvKjMNmUY9vdLmStboddUHMAx1
         qSac6dTzezmnaOF391Wwyx2f/ScjohSEOZAt98TXzMXzPgC840/HwfS6j1jK+upQhxor
         zpsET/EKpAgLqBPyV45HzgLL8yNqKFXe9i5sjYdOPKgSEsTgVAVV550ADBWBPYYeUN5C
         U1YmC2dBbyYQJblPPw+/4TxpJd6uxAxsGPCg2V5xraPpVQgS1f91WB2sYn5XrpRrRZ2P
         NDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126289; x=1795731089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGW7ZdN7gX0aV1cRU/LLC9Q+zZEpF3SDhxZ/As6s7po=;
        b=1TxBn72R7rIutjw5YXfhCTVx9z2OvP+W0fwIOzgVZtHh2mV3s7ZgUbXhIxAjI6U7nW
         W7ZeeqAwHHMcWk9djammcGAa19B35NYztfRw91sqTSUJnwznk0UWlUCPhHkK/0VmnRqJ
         Qz2Ey19fGnHErP22AXGeveHOd2O3TTOEXx44X1P2cENwHwX+dGmj0q0mIIqFoJOTc8fD
         DhRMrb3nmiYrlC7IoVR5rIXmOen+N2DwQXTGOfpDgmL+l2n6tCP2JWhLxZzCe8iB6QMf
         b+xcwaSEcQgX9yAYHWoNSXzweObHMte+x7H6yRdfDOwVDEOS5N7RTREzZ0mB+W4Kj76x
         /stw==
X-Gm-Message-State: APuU4Z+O9CO/G+a9ARrLmVBVXQA/LLD+xd7D/84yN+8s4ijas/LZX8r3
	fBCV7pkGB94aI1oxwGfScXenuiopfrIGV+0bcaSOg9wIekdJ7NFTqsbbnWkguANy
X-Gm-Gg: AZFdTZc5aPMTu4Al3/W0qfQeQ1//B7ws4swBu7479YxYsO6GmN2VkYKyofdW5RqapP4
	auOZcc82uYzDyitkGL1HVN9vagKFN8DVWfAesRE0n+Y+4gvl/J6nKBQX8QJxM0OOoVcIuD5ABUc
	eGgcoA6oD53/iBGyi9IV0my1Yx0yM/+u0nZxWzPbDmq+ZzLh6iPD2hUJZF/Dyr1U4TyL3KS3bCD
	pu6YuIuxYG1AClMkUoM9HfrwTbBp2gUH6TC1VTqpBjWVOwA4XRYpHaJA9gJ0CuTpuzDK88V5EeL
	r4KfLXYosdUHRm8d4dAnJLwA20i+FRByhb2khNxJLYTrtzTsZzJTmMUdho0kXz3X7EPyzzy6yKz
	cTMkr5TanVI4Yt44NJjoQk2NR71gZsPc8PVkmX9kUlqeiPeujaVqKmHxS6OxOsqyEty5Lku1FsK
	Xzw+GHX9BYoB43/cu1HQKI8kQ4OiX1DSDwfYW8KwsZJeNSVX1A0eUIJXascZ8BBx2OhYYVoliYK
	YZdD68Mh6Zipifu8LER9wzHURVlaiGutuZDGxuM8DKuP0dj3UET5teRLFSj+gtjv+2GDftOd3n+
	2WgMIv8/ZqIFjOyxQnN/h+VEAjSd/5YX5JnfHYwOszI6ZV0W5xDh
X-Received: by 2002:a17:90b:288e:b0:3b3:ab75:c94f with SMTP id 98e67ed59e1d1-3b41c92a098mr635758a91.31.1795126289178;
        Thu, 19 Nov 2026 14:11:29 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm369348a91.3.2026.11.19.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:11:28 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net v3 3/3] net: dsa: motorcomm: Rewrite FDB entry on port migration
Date: Fri, 20 Nov 2026 06:10:43 +0800
Message-ID: <20261119221110.1123578-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119221110.1123578-1-mmyangfl@gmail.com>
References: <20261119221110.1123578-1-mmyangfl@gmail.com>
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

When unicast addresses move between ports, DSA calls .port_fdb_add()
without a prior .port_fdb_del() call, making the new port directly OR
into the existing entries. The old port mask then loses track in DSA and
can never be deleted.

Fuse FDB join/leave into one change function, and rewrite the whole
entry on add with the bridge port mask as the leave mask, so that ports
left behind by the migration are dropped from the entry.

Note the commit only covers single bridge usage correctly. Host
subscriptions should be mutually exclusive with multiple bridges, which
may be addressed in a separate commit later.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 94 ++++++++++++++++----------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 5bfdac18c012..e9f01aeb9d3e 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -729,13 +729,14 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 }
 
 static int
-yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
-		 u16 vid, u16 ports_mask)
+yt921x_fdb_update(struct yt921x_priv *priv, const unsigned char *addr,
+		  u16 vid, u16 leave_ports_mask, u16 join_ports_mask)
 {
 	u16 index;
 	u32 ctrl1;
 	u32 ctrl2;
 	u32 ctrl;
+	u32 val1;
 	u32 val2;
 	u32 val;
 	int res;
@@ -744,69 +745,63 @@ yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
 		return res;
-	if (index >= YT921X_FDB_NUM)
-		return 0;
+	if (index >= YT921X_FDB_NUM) {
+		if (!join_ports_mask)
+			return 0;
+
+		return yt921x_fdb_add(priv, addr, vid, join_ports_mask);
+	}
 
 	/* Check if action required */
 	res = yt921x_reg_read(priv, YT921X_FDB_OUT2, &val2);
 	if (res)
 		return res;
 
-	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(ports_mask);
-	if (ctrl2 == val2)
-		return 0;
-	if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
-		ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
-		res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
-		if (res)
-			return res;
+	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(leave_ports_mask);
+	if (!join_ports_mask) {
+		if (ctrl2 == val2)
+			return 0;
+
+		if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
+			ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
+			res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+			if (res)
+				return res;
 
-		return yt921x_fdb_wait(priv, &val);
+			return yt921x_fdb_wait(priv, &val);
+		}
 	}
 
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &ctrl1);
+	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val1);
 	if (res)
 		return res;
 
+	ctrl1 = val1;
+	if (join_ports_mask) {
+		ctrl1 &= ~YT921X_FDB_IO1_STATUS_M;
+		ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
+		if (ctrl1 != val1)
+			ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	}
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(join_ports_mask);
+	if (ctrl1 == val1 && ctrl2 == val2)
+		return 0;
+
 	return yt921x_fdb_add_index_in12(priv, index, ctrl1, ctrl2);
 }
 
+static int
+yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
+		 u16 vid, u16 ports_mask)
+{
+	return yt921x_fdb_update(priv, addr, vid, ports_mask, 0);
+}
+
 static int
 yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 		u16 ports_mask)
 {
-	u16 index;
-	u32 ctrl1;
-	u32 ctrl2;
-	u32 val1;
-	u32 val2;
-	int res;
-
-	/* Check for presence */
-	res = yt921x_fdb_has(priv, addr, vid, &index);
-	if (res)
-		return res;
-	if (index >= YT921X_FDB_NUM)
-		return yt921x_fdb_add(priv, addr, vid, ports_mask);
-
-	/* Check if action required */
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val1);
-	if (res)
-		return res;
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT2, &val2);
-	if (res)
-		return res;
-
-	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
-	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2;
-	if (ctrl1 != val1)
-		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
-	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
-	if (ctrl1 == val1 && ctrl2 == val2)
-		return 0;
-
-	return yt921x_fdb_add_index_in12(priv, index, ctrl1, ctrl2);
+	return yt921x_fdb_update(priv, addr, vid, 0, ports_mask);
 }
 
 static int
@@ -880,6 +875,7 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 			const unsigned char *addr, u16 vid, struct dsa_db db)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	u32 leave_ports_mask = 0;
 	int res;
 
 	/* The software bridge never forwards according to an FDB entry with a
@@ -888,8 +884,12 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 	if (is_multicast_ether_addr(addr))
 		return 0;
 
+	if (db.type == DSA_DB_BRIDGE)
+		leave_ports_mask = dsa_bridge_ports(ds, db.bridge.dev);
+
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
+	res = yt921x_fdb_update(priv, addr, vid, leave_ports_mask,
+				BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0

