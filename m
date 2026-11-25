Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598256;
	b=e1Dc5sPAS9cyiAfh6YTn7fr2lim/EmjUkk1mtq5qzyEoDQt1wbN/57rnAKiP8KlMGSpU
	 15nfUdhVriepk2yD4DMco/VGxMv6l20cao6NPL+f7BgnNSYHSB8tBpWiwAxLpKfJVbJwQ
	 UgFuR4FbBnDT2EghfXjlL5LBhr1JkjUPLM3sbq6vLMo4PvnhCWLXmnUDvOnz8mUJuD74F
	 ohyRSdCev5cK7SymUqp5sckBSIMy/5Et+a43k2ySs1IbKYojdGnyfgmQtPQ6TC57+2uai
	 YF3oNHKzsOWAcTVdNzbWV64tJ8vgk9ZnIDK3Kcf8bz1SPIHWPKQ4o9zqXqtUA2MN0Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598256;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=hliRKX8zoIGstLXpicFYA1Ddk8Ts9p/5d3C0zw57QnY=;
	b=E3u2C7r1fdU4+gGcL4F0OIkv0EQv6pfUwf4RdXFb+HnXRBAwaLrLob3uMfZ6spUOOlw7
	 zkdN4/kuLqLDmeTczIom/oMHehA1iFeCkoZbg5QPXqO/Y7J7ixrqEwuclYmB7XgO1Q8mD
	 uwXLQOLX4bHv3S44ZDud+T/4IC1cqkmNXFSBFDgXeMPa5ozetpbXapfRbxb4HuLmid20j
	 5hFSbE/WiLdXPdMmDvHfbRQE7iLI/HXP0enlNjokH2JQ5zlBug16jcikq2Cgc3xWOeYco
	 Z4zGYolzH1Z869bDxGOsJJGWVVKvPWDzt6jRahP/XHwXahIiDz2Nep0ljtowjKIVYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GuccS2Bc;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A92606A684
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A92606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GuccS2Bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hl
	iRKX8zoIGstLXpicFYA1Ddk8Ts9p/5d3C0zw57QnY=; b=GuccS2BcW6GP/d+NJl
	W1wbQ+TfEQTWeJB0ZgVjhESDCh4pH6J5uNKbnFshdVjvFhvYeiPpvsulRrUK6TrW
	yOTzby/YzXPtZ2mQmNKY7H4Mnxl8BAYfxf0UYHa39535ktwDHcjCwKZm4KU8H1FK
	dtK2utysVgKl0ra3BLkBrxPwc=
Received: from ck.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAnBhJ2pwZr3Vt1KA--.4721S3;
	Wed, 25 Nov 2026 17:16:39 +0800 (CST)
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
Subject: [PATCH v2 2/2] net: phy: motorcomm: add downshift tunable support for YT8531S
Date: Wed, 25 Nov 2026 17:16:38 +0800
Message-ID: <20261125091638.1847020-2-mjkchengke@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125091638.1847020-1-mjkchengke@163.com>
References: <20261125085509.1844883-1-mjkchengke@163.com>
 <20261125091638.1847020-1-mjkchengke@163.com>
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
X-CM-TRANSID:_____wAnBhJ2pwZr3Vt1KA--.4721S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFW8Wr18Xr4ftFWfur48WFg_yoW7tr1Dpr
	WfJF92yrZFqF47Kr4ftw4kAFWF9r4SkayUur9rG34Yva4YgF97ta1rtr1DtF97CrWkWFW3
	Gr47XFWDu3W3ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMVbyUUUUUU=
X-CM-SenderInfo: ppmnux5hqjyvi6rwjhhfrp/xtbC1BdjsWsGp3coVAAA3Q

The YT8531S supports Ethernet Line Speed Auto Downgrade: when
autonegotiation fails to establish a link after a configurable number
of attempts, the PHY downgrades to a lower speed and retries. The
number of attempts before downgrading is configured through the Speed
Auto Downgrade Control Register (0x14), bits 4:2, and the feature is
enabled through bit 5 of the same register.

Expose this as the ETHTOOL_PHY_DOWNSHIFT tunable for the YT8531S,
following the semantics used by other drivers: the tunable value is
the number of autonegotiation attempts before downgrading (range
2-9), 0 disables the feature, and DOWNSHIFT_DEV_DEFAULT_COUNT restores
the power-on default of 5 attempts.

The retry-limit field stores (attempts - 2) and only takes effect
after a software reset of the UTP register space. genphy_soft_reset()
resets the BMCR of the currently selected register space only, and
the YT8531S powers up with the fiber space selected, so use the
existing yt8521_modify_bmcr_paged() helper to reset the UTP space
explicitly. This also relies on the previous fix, which makes the
helper report a timeout instead of a stale positive BMCR value.

Hardware-validated on a Phytium D2000 board with a YT8531S: setting
8 and 2 attempts, restoring the default, and disabling all commit
correctly to register 0x14; out-of-range values are rejected with
-ERANGE.

Signed-off-by: chengke <mjkchengke@163.com>
---
Changes in v2:
- Attach the tunable ops to the YT8531S entry only: YT8531 has no
  .read_page/.write_page, so paged helpers would WARN_ONCE and fail
  with -EOPNOTSUPP on it (found in self-review).
- Drop the forward declaration by moving the new functions below
  yt8521_modify_bmcr_paged().
- Reuse the existing YTPHY_SADCR_SPEED_RETRY_LIMIT macro for the
  default value instead of a magic number.
- Use kernel-style multi-line comments.
 drivers/net/phy/motorcomm.c | 96 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index ba3421ca4d..8de87897bc 100644
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
 
@@ -1595,13 +1598,102 @@ static int yt8521_modify_bmcr_paged(struct phy_device *phydev, int page,
 			if (!(ret & BMCR_RESET))
 				return phy_restore_page(phydev, old_page, 0);
 		}
-		ret = -ETIMEDOUT;
 	}
 
 err_restore_page:
 	return phy_restore_page(phydev, old_page, ret);
 }
 
+static int yt8531s_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val, cnt, enable;
+
+	val = phy_read_paged(phydev, YT8521_RSSR_UTP_SPACE,
+			     YTPHY_SPEED_AUTO_DOWNGRADE_CONTROL_REG);
+	if (val < 0)
+		return val;
+
+	enable = FIELD_GET(YTPHY_SADCR_SPEED_DOWNGRADE_EN, val);
+	/*
+	 * The retry limit field stores (attempts - 2): the default 0x3
+	 * means 5 attempts before downgrading.
+	 */
+	cnt = FIELD_GET(YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK, val) + 2;
+
+	*data = enable ? cnt : DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int yt8531s_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	u16 mask, set;
+	int err;
+
+	if (cnt == DOWNSHIFT_DEV_DEFAULT_COUNT) {
+		/* Restore the power-on default: enabled, 5 attempts */
+		mask = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		       YTPHY_SADCR_SPEED_RETRY_LIMIT_MASK;
+		set = YTPHY_SADCR_SPEED_DOWNGRADE_EN |
+		      YTPHY_SADCR_SPEED_RETRY_LIMIT;
+	} else if (!cnt) {
+		mask = YTPHY_SADCR_SPEED_DOWNGRADE_EN;
+		set = 0;
+	} else {
+		/*
+		 * The tunable value is the number of autoneg attempts
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
+	/*
+	 * The SADCR change is only committed by a UTP-space software reset.
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
+static int yt8531s_get_tunable(struct phy_device *phydev,
+			       struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return yt8531s_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int yt8531s_set_tunable(struct phy_device *phydev,
+			       struct ethtool_tunable *tuna,
+			       const void *data)
+{
+	if (tuna->id != ETHTOOL_PHY_DOWNSHIFT ||
+	    tuna->len != sizeof(u8))
+		return -EOPNOTSUPP;
+
+	return yt8531s_set_downshift(phydev, *(const u8 *)data);
+}
+
 /**
  * yt8521_modify_utp_fiber_bmcr - bits modify a PHY's BMCR register
  * @phydev: the phy_device struct
@@ -3295,6 +3387,8 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8531S),
+		.get_tunable	= yt8531s_get_tunable,
+		.set_tunable	= yt8531s_set_tunable,
 		.name		= "YT8531S Gigabit Ethernet",
 		.get_features	= yt8521_get_features,
 		.probe		= yt8521_probe,
-- 
2.43.0

