Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998472;
	b=oO0r4rqYbMVSbE8bWPLuadPqB9Am55h1WUVVQFI6tRYqJdJULxpD1fa0lVgyITQqAZQb
	 vwn93b86K4FH+UONECiUbO77DCHV8HaZhLeAio0Y7ah9vLGNFhsmqOaO0XnVoamdROg5q
	 u86YxRQCawNrNlElPanPwOq1Sp3/Vt1GWs+Gm9n3TOY+NSeOVQyVIExR2J8F/aJqARoJZ
	 JeUT669lqfYscOdQU1M7IK2kNdEMfmL1kV4MJjPAIO5ZfKjly01JyryZ0VCjxQ7XOZwCd
	 QxAPN8UvBZcme/NYp2iF8+rrIzLG2zf+J1tj4Oc5knr3cJJcWCtPhMjScuWqUY9A10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
	b=UetkI2qxroTbT/OPiQTTpYK7NnwgHg7nA5ADq7XQBYFGbO9cUT5/Bvj2BPQUi8i8fZVm
	 wTd5uB2UrS5J4EP8oy8OeypMhju8eHJs8a7trGfHhW/VttCG+iOyZgL7JSc/ky0MkP4BC
	 jD7MdXaJZGHtYet7ypm2CQguuQvJEsn8BIIMXP63kTsSLJkkPH3uS7oiYIkcq/qlP3P5r
	 9Q55IpSgg5P4uafcMCPqLOFW9hd3rlt4yIIZpJLewMMtfOJnUMg2tPODN4I2wHH/0Gr4D
	 UhXS3q/fQmw6AOUKBFKqZ8Vpb1cSlPabnB9EDwJ0+jdRAf1ewz8qVq8I+AbDi1UzOEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIvpowlr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0194860A260F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0194860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIvpowlr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7774035e9.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998470; x=1795603270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=oIvpowlrmooNMKWq/mZkSPqWvL9uzz1vnsyyr5doG2oMHeMO6AX3ikNRncihc/6cdA
         kgLRjDT/nGmkqD+0sS5eyMYQslA+hHrdSXK1KL+ZDknDa0x/zJ6mphC5Nz0L0uZDhcr3
         gHgdumzf59Cq/IWQgqw3GrP6grXfCFog5sDxkfdX+uEbUzIhFef5TkckbXq1j8A6opKL
         HezxX9EVtYYBYu82KCNy01Izq8pRo3mGtBP7Gsw+q6CNIMNNl3kzqeC+QaMV1HcZPEB/
         hVfZCY2h5NFfbLFzakMksZWwz0syEnNBH/OLKwyKAwmbSkRXOBjdLx2DXPV4uzerGNIy
         XP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998470; x=1795603270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=IND7rhIT3++kJnqGWkqTRuvcK/GEqc59I1ArCmBCB8F0l0BgU4HeAcRFjAzV1RuCVN
         KeGJihR/6cjPAt1jSNFUkGGv8SLHaRn2Q4TWA0ZiJOnzf/FIsaeXFyVjgOA/phPE5nrG
         XF+/vLpyg0ZcosVHrevxCq8KSeY0AoUASIJdGA0zCYcA9cb63aGrpMZ4V2Ve3itUJ6r6
         xkN1Oo2xH7WQx1kwI+dpqkrb/vVSAf7wBig0DxpZgxkqvHawhOKrRskts2wnJDPIBAP8
         pfvMkTplR8F6PBm7W0uoaRpdMgsXBH/HPLD1+oNHaA06z2QxC1oqR6C1OmARrGyCJU/a
         jJhg==
X-Forwarded-Encrypted: i=1; AL+hErGavTsVLKUXE9Leu0YnNcHGSsiKTtSLMYDHuvoXH+rTg6ZhNDlCdntLIGPerUfSzCUurUpbuUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qX4ckEnx5DEhzAoWEgoNPl1vWghBRiZ77VJAKqZEux7rOG1GP
	X/aIdln9xzVZvpoi74ob7IDlsmxhjF3mnxrbNTmR9BWogdG98ICN/4s5
X-Gm-Gg: AYBFou12NVFhPZzFukNDwSk5qZyZdYAbNcv+2LAJnh716cq2prSLPmNJ6j6B23HLyY5
	ZkSfeBPVTRXr8qdZQx0uEBK+k4o5inHpMcq8w0fw7+yRj7xMd3TZD4MVSkQ4GG3apPnv2clTGIC
	uUdra9+OWnG7fdJ4znh+JJ5cvLWuIvGAmT1rDe/4cATAkmW5uHVaU0HsABJ7S+1rL2Mixi/NlWO
	PzY5jCaNf8mYFxT+5qs1f28coI7zrVYfUrX8i1t44s5dmcVo2JFa3NdHTpxhwPiHYAbqzio3cDI
	kKx8ML+D/b/FmATB2hTSzQVUGYgTL1hWxbPtYVk0EZWSJnniuvUL8fLP2atzwESsz8qQqEMBEke
	k5K49HKZiprwAWQmiavl5sfblPnKEFNwkIcUeUCPkUBIgaKSR2DxdbcYnCfFztZIVfPZpK1MjN6
	AWbf4YfoWClWQbVM4ORMJ1EYrOJMnhMAwIaae9V+IsocKRewqoT+ZG6/dgnfCYOvt4MnVcJlymX
	ibfOqsPqQ4/0YBimWxJqIEu/6xjV/z4/Blh8yy83YWLCNPUkCzHMcSMa9xOxLq9Sc7/g0ylN0nM
	QSTJhIktT3CpNLV67d8Hf8+sSdOt/SsdBeFGzgXBR/8YOESY0ErDGt5G8uM0Eor63STlXtGEL4r
	AnAU8S9RCXrba8/k=
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb7da25928mr35500835e9.18.1794998470179;
        Wed, 18 Nov 2026 02:41:10 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:09 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/4] net: dsa: qca8k: drop MIB autocast frames once the request is over
Date: Wed, 18 Nov 2026 11:41:02 +0100
Message-ID: <20261118104104.26684-3-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca8k_get_ethtool_stats_eth() points mib_eth_data at the caller's
ethtool buffer, asks the switch for an autocast and waits 5 ms for the
frames. On a timeout it returns with the request still published, and
the caller falls back to register reads; ethtool_get_stats() then frees
the buffer. The autocast handler runs from the conduit's receive path
without the request's mutex, so a frame that arrives late still writes
the requested port's counters through mib_eth_data->data into freed
memory, and frames beyond the seven expected ones underflow port_parsed.
ETHTOOL_GSTATS does not need CAP_NET_ADMIN.

Protect the request with a spinlock that the handler takes, retire it
on the way out, and let the handler retire it when the last frame
completes it, so that frames arriving after that are dropped without
touching data.

An autocast frame carries no identity of the request it answers. Once a
request has timed out and the next one is published, the switch may
still be sending the earlier autocast, and its frames count for the
new request. Wait for MIB_BUSY to clear before asking for the next
autocast, as qca8k_mib_init() does after a flush, so that at most the
frames already on their way to the host can be taken for the new
request, and track the ports seen as a bitmap instead of a countdown,
so that a second frame of a port cannot complete the request before
the other ports have reported. The requested port's counters then come
from the newest frame of that port, which is at most one autocast
behind - the same as a register read racing the hardware.

An LLM assistant (Claude, claude-fable-5-1) helped analyse the race
and write the change and this description; I reviewed both. Built with
W=1 on arm64; tested on a QCA8337 behind an IPQ5018
(GL.iNet GL-B3000) with tag_qca, with the request timeout forced to 0
to exercise the late frame path.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 47 ++++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k-common.c |  2 +-
 drivers/net/dsa/qca/qca8k.h        |  6 ++--
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 3c8044a4d1..4de7da9c8e 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1676,10 +1676,18 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	mib_eth_data = &priv->mib_eth_data;
 
+	spin_lock(&mib_eth_data->lock);
+
+	/* A late frame of a request that has already returned */
+	if (!mib_eth_data->data)
+		goto unlock;
+
 	/* The switch autocast every port. Ignore other packet and
 	 * parse only the requested one.
 	 */
 	port = FIELD_GET(QCA_HDR_RECV_SOURCE_PORT, ntohs(mib_ethhdr->hdr));
+	if (port >= QCA8K_NUM_PORTS)
+		goto unlock;
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
@@ -1704,9 +1712,17 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	}
 
 exit:
-	/* Complete on receiving all the mib packet */
-	if (refcount_dec_and_test(&mib_eth_data->port_parsed))
+	/* Complete once a frame of every port has arrived. A second frame
+	 * of a port, left over from an earlier autocast, cannot end the
+	 * request early.
+	 */
+	mib_eth_data->ports_seen |= BIT(port);
+	if (mib_eth_data->ports_seen == GENMASK(QCA8K_NUM_PORTS - 1, 0)) {
+		mib_eth_data->data = NULL;
 		complete(&mib_eth_data->rw_done);
+	}
+unlock:
+	spin_unlock(&mib_eth_data->lock);
 }
 
 static int
@@ -1721,13 +1737,25 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 
 	mutex_lock(&mib_eth_data->mutex);
 
+	mutex_lock(&priv->reg_mutex);
+
+	/* A request that timed out may have left the switch still sending
+	 * its autocast. Let it finish before asking for another one, so
+	 * that as few of its frames as possible are taken for ours.
+	 */
+	ret = qca8k_busy_wait(priv, QCA8K_REG_MIB, QCA8K_MIB_BUSY);
+	if (ret) {
+		mutex_unlock(&priv->reg_mutex);
+		goto out;
+	}
+
 	reinit_completion(&mib_eth_data->rw_done);
 
+	spin_lock_bh(&mib_eth_data->lock);
 	mib_eth_data->req_port = dp->index;
 	mib_eth_data->data = data;
-	refcount_set(&mib_eth_data->port_parsed, QCA8K_NUM_PORTS);
-
-	mutex_lock(&priv->reg_mutex);
+	mib_eth_data->ports_seen = 0;
+	spin_unlock_bh(&mib_eth_data->lock);
 
 	/* Send mib autocast request */
 	ret = regmap_update_bits(priv->regmap, QCA8K_REG_MIB,
@@ -1743,6 +1771,14 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	ret = wait_for_completion_timeout(&mib_eth_data->rw_done, QCA8K_ETHERNET_TIMEOUT);
 
 exit:
+	/* On a timeout the frames can still arrive after the caller has
+	 * freed data: retire the request so that the handler drops them.
+	 */
+	spin_lock_bh(&mib_eth_data->lock);
+	mib_eth_data->data = NULL;
+	spin_unlock_bh(&mib_eth_data->lock);
+
+out:
 	mutex_unlock(&mib_eth_data->mutex);
 
 	return ret;
@@ -2120,6 +2156,7 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 	init_completion(&priv->mgmt_eth_data.rw_done);
 
 	mutex_init(&priv->mib_eth_data.mutex);
+	spin_lock_init(&priv->mib_eth_data.lock);
 	init_completion(&priv->mib_eth_data.rw_done);
 
 	priv->ds->dev = &mdiodev->dev;
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index ab978cc836..f1e7e86f47 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -101,7 +101,7 @@ const struct regmap_access_table qca8k_readable_table = {
 	.n_yes_ranges = ARRAY_SIZE(qca8k_readable_ranges),
 };
 
-static int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
+int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
 {
 	u32 val;
 
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 9563388930..79754755f1 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -402,9 +402,10 @@ struct qca8k_mgmt_eth_data {
 struct qca8k_mib_eth_data {
 	struct completion rw_done;
 	struct mutex mutex; /* Process one command at time */
-	refcount_t port_parsed; /* Counter to track parsed port */
+	spinlock_t lock; /* Protects the request against the rx handler */
+	unsigned long ports_seen; /* Ports whose frame arrived, under lock */
 	u8 req_port;
-	u64 *data; /* pointer to ethtool data */
+	u64 *data; /* pointer to ethtool data, NULL with no request pending */
 };
 
 struct qca8k_ports_config {
@@ -501,6 +502,7 @@ static inline u32 qca8k_port_to_phy(int port)
 /* Common setup function */
 extern const struct qca8k_mib_desc ar8327_mib[];
 extern const struct regmap_access_table qca8k_readable_table;
+int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask);
 int qca8k_mib_init(struct qca8k_priv *priv);
 void qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable);
 int qca8k_read_switch_id(struct qca8k_priv *priv);
-- 
2.43.0

