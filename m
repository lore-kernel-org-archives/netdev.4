Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844938;
	b=dZs3pYvuHt6BDOL6YzSr/AEtU8AYRXiCOk39Vuf6KIjyrRNbd4hLyerpkcV5WZkGqfT8
	 MD5gL6xNqVrbsjNw7GbyOKAfzIyEz+ZzAxwdwaMAwstchwitwmDn0LhfJmfam4Sv0+vVs
	 akQ2C4YWENfPuWMdHd6uQlznrPTLOFTKIt9g/jK9ZJyNWOeu7lll1Xmhcb6+zsHPvFx3K
	 Zq9oZEK6IPlgSofGW3s8BDBTxNh9bLQNv1zJwUX3iRyT9L86+NH4MWPXWA/pQzkyj5nnF
	 +pTtMH2jM7NNb1kWpa9AffZCfRmmHInVWlRJ5dVQ/w+1fX6LCz8k4AGj5k/qlJFIVWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
	b=Kj+I6l7nY/fV9e72KUn7SmhX14Frq3bFkcvYQS7cgX+KurO886kQrySoUj+NnPYpb93D
	 Li8i2TqSl6pvz2TJWCLwfOOKYOc4jHFw09/PJVGbkgiehbUaoykfS0/kdq/B5Tpr1G7SE
	 7kdM1Sm5MVb266k16gUzXbf1Pl+TfBbZ0feFQ5e9kM0YMThb/bcJVwKY0DHsnTA5+1BwQ
	 0x3+MBhJX4zU2cxjQTn2q5KC4hmMgf3zNE7is2wWRuiF/LitKroaPB+zoho/synxBzWMQ
	 OLo2TOPHjfopkPawrwVvU6WbLSU2kp/uwhOGlZbf/Ja9Eaa96Zl5IY2eKaldZ7E668Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCMg0oFL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A928606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A928606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCMg0oFL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so2377669a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844937; x=1795449737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
        b=rCMg0oFLYD+Cb9s9qnzPYOipIruzESFhq/mI+AFSTaPwc2TY3yyTpxNHo9y0Mj2p5l
         woaxxw+l2ER8qbmCxQ16+0u4UWQHHFDhnTSIaaOtX/kFQDk40rtemWBH+tFd/ZD++9i2
         o6SpPiNgQPYFG6WuBZ4id0XSMF/2UArohjIcb8rjQYBmJtdx4erElZZhNItctvqQSZFI
         VMTwcD+erFGdErugmixg4SgUhV0bKLvhXiywfqUZZaXnnI5wLZt6/UVC8D8nUOLjeTdl
         nEvE1Ob98XvbPnSqX9F+yjKYR4nK5GUj4Xf0y8hbqr6t9XgohkU3wC/gFJfkOKwjxFYg
         t4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844937; x=1795449737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
        b=Yez9e4w0otIgQHxH+k7ilx76omQXgkLvspmgUDAN6121zh1DZZks2i3EyYgc4L2oQD
         G/6QzmTiql/+b1LOWZWVzCyneAlTnfja2uMgN31T+XXOjugRb6YklOoKcOzikjs8r+HG
         KlbV/J5ma1le4pWKUjvG+pboiAgNIblsZyv/M/am5JJVm4914xg/ly+WjXGBf+7eVdHL
         O8XbLzLIi5gCrXwLsgQAzq7Aqv5I3HeCw+hXXBH5vY0ERItcyqx/gFCWRuQ1iOb0o4V0
         B7Y67qXt31aH8fl6NWzjmUz1X+yJVdUj1CNpf4Qmt/5ZxuC//0SxASgsrbtmcz9tNa1T
         ntdA==
X-Gm-Message-State: APuU4Z/Cu4rEdoZAOZDl5rmexpdunZ5F4ya5rB+SpNlKw+GBx3Hq3XFy
	jzG1SL2U/03k0L+Jg+xBE/bitYTvQ1Q6HOY4/mYsSUJjwLfJgBsyNTi4olCa0g==
X-Gm-Gg: AZFdTZcbBAc5zraX303aZDCgwSIRXRRc4J0tuy45daLHbOkc93BGEpdij2mm0yccS9q
	F8N09hPVJ/08+mbhlbLmriXanWXVcu3N5j068TzdaSfuZiwSG6FYtPewppYwfompK9FkQ5FfuJF
	M0ZEGxa7nD6ihB0dWfZeRvhyMrVEn6glgQyyv0GxMu2W+gOumdmUu2TePRcM0WJ3nbe2NMrRZaU
	BKZMBdFcdyqghwsvw4a/SsBUYbNBHBfw93HfbaeTyYdrzsbDlPADenmCIpclEX1eK5S4NwGAx0s
	grmsRBpZdJxcTULgIy7MiGgtBsf0D6XoolZ4xaTnOWcPnnAFF5ezIbhbSoSCTRuNIpNKQJyJPdF
	Kg2f0SiyE5WP2ipMUep7EDk38Exwrce6np5PJeTiuw/OgZcM7hM+LaFc2hHTWJfvofMXTNYCHEV
	YJwtFPieLREMhL7l2dmpMDXinFd0LqAgSzis+EzWk73LE2OitnMZ6kIV5LftDX86pTyGsmAp34m
	LE7ZtgG3Ne21BgZ68Upmf2huRJnKislPwq82zZ+TQbw8tgFsLv+jFZkbKk09PRsRMOf7Mhbxrwq
	KqhYTycjHojFWJGE3suwsjDVCcQOBjvWTRzcWiAL/Ov57An/AUOD9A==
X-Received: by 2002:a17:90a:d010:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b1b0a26a0emr10188177a91.27.1794844937249;
        Mon, 16 Nov 2026 08:02:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:16 -0800 (PST)
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
Subject: [PATCH net v2 4/4] net: dsa: motorcomm: Use VID 0 as the unaware PVID
Date: Tue, 17 Nov 2026 00:01:04 +0800
Message-ID: <20261116160107.1351198-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

The hardware classifies untagged and priority-tagged frames to the
port's PVID before the VLAN table lookup, and the FDB lookup key equals
the classified VID (measured on YT9215S).

The driver assigned PVID 4095 to the VLAN-unaware ports, while switchdev
reports the bridge's FDB entries with VID 0. These entries were then
installed under FID 0 and could never be hit by the hardware lookups.
Dynamic entries learnt under VID 4095, if any, took effect instead.

Lift the restriction on VLAN 0. Keep VLAN 0 out of the generic VLAN
add/delete paths, otherwise 8021q's automatic VLAN 0 filtering would
leave a stray CPU port bit behind.

Use VLAN 0 as the PVID of the VLAN-unaware ports. Program the PVID when
a port joins a VLAN-unaware bridge since DSA does not necessarily call
.port_vlan_filtering().

The standalone default of 4095 stays, so mislearnt entries, if any,
would not pollute the bridge FDB.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 44 +++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d84d863080ce..aa4d6a0c930c 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -79,7 +79,7 @@ static const struct yt921x_info yt921x_infos[] = {
 	{}
 };
 
-#define YT921X_VID_UNWARE	4095
+#define YT921X_VID_STANDALONE	4095
 
 struct yt921x_reg_mdio {
 	struct mii_bus *bus;
@@ -960,8 +960,10 @@ yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 
 	brport = dsa_port_to_bridge_port(dp);
 
-	if (!brport || !vlan_filtering)
-		pvid = YT921X_VID_UNWARE;
+	if (!brport)
+		pvid = YT921X_VID_STANDALONE;
+	else if (!vlan_filtering)
+		pvid = 0;
 	else
 		br_vlan_get_pvid(brport, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
@@ -1029,8 +1031,7 @@ yt921x_pvid_clear(struct yt921x_priv *priv, int port)
 
 	vlan_filtering = dsa_port_is_vlan_filtering(dp);
 
-	res = yt921x_port_set_pvid(priv, port,
-				   vlan_filtering ? 0 : YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, 0);
 	if (res)
 		return res;
 
@@ -1098,6 +1099,8 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
 
 	if (dsa_is_cpu_port(ds, port))
 		return 0;
+	if (!vid)
+		return 0;
 
 	mutex_lock(&priv->reg_lock);
 	do {
@@ -1135,6 +1138,11 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	 */
 	if (dsa_is_cpu_port(ds, port))
 		return 0;
+	/* VID 0 is the VLAN-unaware bridges' FDB domain; nothing to program,
+	 * keep the entry at reset defaults
+	 */
+	if (!vid)
+		return 0;
 
 	mutex_lock(&priv->reg_lock);
 	do {
@@ -1187,7 +1195,7 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	/* Unrelated since learning is off and all packets are trapped;
 	 * set it anyway
 	 */
-	res = yt921x_port_set_pvid(priv, port, YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, YT921X_VID_STANDALONE);
 	if (res)
 		return res;
 
@@ -1285,7 +1293,8 @@ static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 }
 
 static int
-yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
+yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask,
+		   bool vlan_filtering)
 {
 	int res;
 
@@ -1297,6 +1306,14 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
 	if (res)
 		return res;
 
+	if (!vlan_filtering) {
+		/* DSA may shortcut .port_vlan_filtering(), leaving stale PVID
+		 */
+		res = yt921x_port_set_pvid(priv, port, 0);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
@@ -1427,7 +1444,8 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	pp->isolated = br_port_flag_is_set(brport_dev, BR_ISOLATED);
 	pp->hairpin = br_port_flag_is_set(brport_dev, BR_HAIRPIN_MODE);
-	res = yt921x_bridge_join(priv, port, ports_mask);
+	res = yt921x_bridge_join(priv, port, ports_mask,
+				 br_vlan_enabled(bridge.dev));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
@@ -2277,7 +2295,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
 	unsigned long cpu_ports_mask;
-	u32 ctrls[2];
 	u32 ctrl;
 	int port;
 	int res;
@@ -2335,15 +2352,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	/* Tagged VID 0 should be treated as untagged, which confuses the
-	 * hardware a lot
-	 */
-	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
-	ctrls[1] = 0;
-	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
-	if (res)
-		return res;
-
 	return 0;
 }
 
-- 
2.53.0

