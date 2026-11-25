Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597001;
	b=HHob9D+Pu73H3RMuMdiUZ6BSzwHXj7mh5ABJA37NcnOCAxDSkzlPL2tgIWuqA4B2KxQ5
	 NoXYlFSVb4vq4lk54YQCYxXOPVXQmXz3AX1MU1fDB1cicsMDlAqzODSHEjzUUBc+KW+2L
	 G6Voj97uiNk2IaNthFT6c0RmdMMa5LvOArQrvlJUoKdSqIYFquCCINsM+fBnwyJZ0d0gF
	 1getLXsgehcCkvxtj5/NpgnuWsjxdyC0kXsZBseGpps1DgHg4wcKq3aSnxLfwv62Ft+66
	 lp8CU6bHyCca/cqzUgcvPrzGvb9IZP/ut6dTEr2nEQdWEePxtSB6kgtH+C09h88K+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597001;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=lWEEw8es/PxWuYSJtZRURjIYAkL2SeCqThvJh8/iqHQ=;
	b=dzjv4424+tQ6h1iBofb4xn+Y/PBzr15CVfjOUzPqw7sjqNZ1lyzpWAquD/bV8d/zQIWI
	 aoULLOlhrA6gvQKWfgXrUqNBfHOJt93iKNep1jr5K+zIs+SkJ6bEgb4B4SI+sM5E5YDPi
	 wFHNBhKPikVk28zxtpd1OWu6toc8Rmgi4pD0/5djjwxJ8R1s1Gwza6Xp8b/Qxlz3ef3pj
	 yCHNenQew/WPRnQy/4CYoENift1SJLWrPGxrdBwaKKx1zQaLUHZKDD4sA/kUHSNz5H/ZE
	 jdHRbzC5ABAIYehzY+eKVtZ7ZenXN44llwsgZkEAWA4HzkCaD+hr5tITl3sphwU5Y4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LTdVtyKl;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DF606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LTdVtyKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lW
	EEw8es/PxWuYSJtZRURjIYAkL2SeCqThvJh8/iqHQ=; b=LTdVtyKlZiKCEPLjDW
	qbcHHhOC0zex+UUkxyoHrV/AO8wasTiPh2wQXEkNXdaOdj8oFDw8Vt5AxKcNwlQp
	axnfGr3qbQE3WillcbHagRT2V8Sos+bz4CxcEkxXkv2Bk3ckm0W60VqCoDSYfh39
	DMyBqudRyQwViOxPgK0B/zJ/c=
Received: from ck.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgB3paRtogZrdEsbIA--.7371S2;
	Wed, 25 Nov 2026 16:55:12 +0800 (CST)
From: ck <mjkchengke@163.com>
To: Frank.Sae@motor-comm.com,
	netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mjkchengke@163.com
Subject: [PATCH] net: phy: motorcomm: add downshift tunable support for YT8531/YT8531S
Date: Wed, 25 Nov 2026 16:55:09 +0800
Message-ID: <20261125085509.1844883-1-mjkchengke@163.com>
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
X-CM-TRANSID:QCgvCgB3paRtogZrdEsbIA--.7371S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFW8Wr1UAw45GFWUtw1UJrb_yoW7Aw47pr
	WfJF97ZrZFqFsrGr4ftw4kJFWY9r4FkayUCr9rCw1Yva4YqFn3ta1rtr1UtF97CrWkWFW3
	Wr47XFWDua47XrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-CM-SenderInfo: ppmnux5hqjyvi6rwjhhfrp/xtbC9hAhb2sGonCDrgAA36

The YT8531 and YT8531S support Ethernet Line Speed Auto Downgrade:
when autonegotiation fails to establish a link after a configurable
number of attempts, the PHY downgrades to a lower speed and retries.
The number of attempts before downgrading is configured through the
Speed Auto Downgrade Control Register (0x14), bits 4:2, and the
feature is enabled through bit 5 of the same register.

Expose this as the ETHTOOL_PHY_DOWNSHIFT tunable, following the
semantics used by other drivers: the tunable value is the number of
autonegotiation attempts before downgrading (range 2-9), 0 disables
the feature, and DOWNSHIFT_DEV_DEFAULT_COUNT restores the power-on
default of 5 attempts.

The retry-limit field stores (attempts - 2) and only takes effect
after a software reset of the UTP register space. genphy_soft_reset()
resets the BMCR of the currently selected register space only, and
the YT8531S powers up with the fiber space selected, so use the
existing yt8521_modify_bmcr_paged() helper to reset the UTP space
explicitly.

Hardware-validated on a Phytium D2000 board with a YT8531S: setting
8 and 2 attempts, restoring the default, and disabling all commit
correctly to register 0x14; out-of-range values are rejected with
-ERANGE.

Signed-off-by: chengke <mjkchengke@163.com>
---
 drivers/net/phy/motorcomm.c | 97 +++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index a87e83fdf5..08bf8441fb 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -97,6 +97,9 @@
  */
 #define YTPHY_SADCR_SPEED_RETRY_LIMIT		(0x3 << 2)
 
+#define YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK		GENMASK(4, 2)
+#define YTPHY_SADCR_DOWNSHIFT_ATTEMPTS_MIN		2
+#define YTPHY_SADCR_DOWNSHIFT_ATTEMPTS_MAX		9
 /* Rx Error Counter Register */
 #define YTPHY_RX_ERROR_COUNTER_REG		0x15
 
@@ -1205,6 +1208,96 @@ static int yt8521_probe(struct phy_device *phydev)
 					  val);
 }
 
+static int yt8521_modify_bmcr_paged(struct phy_device *phydev, int page,
+				    u16 mask, u16 set);
+
+static int yt8531_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val, cnt, enable;
+
+	val = phy_read_paged(phydev, YT8521_RSSR_UTP_SPACE,
+			     YTPHY_SPEED_AUTO_DOWNGRADE_CONTROL_REG);
+	if (val < 0)
+		return val;
+
+	enable = FIELD_GET(YTPHY_SADCR_SPEED_DOWNGRADE_EN, val);
+	/* The retry limit field stores (attempts - 2): the default 0x3
+	 * means 5 attempts before downgrading.
+	 */
+	cnt = FIELD_GET(YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK, val) + 2;
+
+	*data = enable ? cnt : DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int yt8531_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	u16 mask, set;
+	int err;
+
+	if (cnt == DOWNSHIFT_DEV_DEFAULT_COUNT) {
+		/* Restore the power-on default: enabled, 5 attempts */
+		mask = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		       YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK;
+		set = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		      FIELD_PREP(YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK, 3);
+	} else if (!cnt) {
+		mask = YTPHY_SADCR_SPEED_DOWNGRADE_EN;
+		set = 0;
+	} else {
+		/* The tunable value is the number of autoneg attempts
+		 * before downgrading, in range [2, 9]. The register
+		 * field stores (cnt - 2).
+		 */
+		if (cnt < YTPHY_SADCR_DOWNSHIFT_ATTEMPTS_MIN ||
+		    cnt > YTPHY_SADCR_DOWNSHIFT_ATTEMPTS_MAX)
+			return -ERANGE;
+
+		mask = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		       YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK;
+		set = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		      FIELD_PREP(YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK, cnt - 2);
+	}
+
+	/* The SADCR change is only committed by a UTP-space software reset.
+	 * genphy_soft_reset() resets the BMCR of the currently selected
+	 * register space only, and YT8531S powers up with the fiber space
+	 * selected, so reset the UTP space explicitly. Both helpers manage
+	 * their own paged access window.
+	 */
+	err = phy_modify_paged(phydev, YT8521_RSSR_UTP_SPACE,
+			       YTPHY_SPEED_AUTO_DOWNGRADE_CONTROL_REG,
+			       mask, set);
+	if (err < 0)
+		return err;
+
+	return yt8521_modify_bmcr_paged(phydev, YT8521_RSSR_UTP_SPACE,
+					0, BMCR_RESET);
+}
+
+static int yt8531_get_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return yt8531_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int yt8531_set_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna,
+			      const void *data)
+{
+	if (tuna->id != ETHTOOL_PHY_DOWNSHIFT ||
+	    tuna->len != sizeof(u8))
+		return -EOPNOTSUPP;
+
+	return yt8531_set_downshift(phydev, *(const u8 *)data);
+}
+
 static int yt8531_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -3280,6 +3373,8 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8531),
+		.get_tunable	= yt8531_get_tunable,
+		.set_tunable	= yt8531_set_tunable,
 		.name		= "YT8531 Gigabit Ethernet",
 		.probe		= yt8531_probe,
 		.config_init	= yt8531_config_init,
@@ -3294,6 +3389,8 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8531S),
+		.get_tunable	= yt8531_get_tunable,
+		.set_tunable	= yt8531_set_tunable,
 		.name		= "YT8531S Gigabit Ethernet",
 		.get_features	= yt8521_get_features,
 		.probe		= yt8521_probe,
-- 
2.43.0

