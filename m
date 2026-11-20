Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155628;
	b=27KUGVs9AC/773f3Tfk7cM78htVXUHm9Cg0/AcnlpSUdIYStwvXYWAYtPnafLuLuqKEo
	 i9K3DaGUaBFkZX5/mWLZYCpj0SdUqazoHYHH/fa49HodWM2pf1ZQ2N0AtekxNcH4b0MX9
	 0AWrKFmoeEvMAqBLnRciW1uq3B9Ie4WGpT8o79+peus0rQBUkDLGfeU8gw2DHmNxuJRwg
	 aLuZ6FPoNQsMVdT9sXpvlNNWXX+XG7YWLSKJm4CoWbQ027WmmA8hNb5GyMfREzWF8TAFJ
	 9hqTCHKbCdF0g02gHJOeGh9IJtN7INph51Opr3ZUUQsKYveaQwBetphWbj0E6+2ePUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
	b=uWNZeBKIoj6kMDr7krwB3E1hY2Zf7WdEoErotu15HGtbBGvlCZhv8sr116LfZYLZYE+0
	 Uoilkb1ITD147zWLRK02nHDNj7kNLcZdxIrd3khywbOFmRv4eKZtbKTBaSZ/p+SKqyrfr
	 5HEvgF2MhmTXHo7+fUvMroMrvtsttTs7KavpqXzUMTZr2cayYlHf44BdL3leDpHDABX5S
	 xTAu3t6FOuAvroRYtuAphOxaz9T/20z+TRmqvv0Ja4gM1GwUTqquUbxzkc0/w4g+SQ0qX
	 kE1JM72x3obISRKwEUIwKQEcRSmJhdM+lZ9FGqE/AkDUhO/UHWgKlUvIHLxYbGjDzSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PncEarci;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3765F606A50A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3765F606A50A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PncEarci
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so862103eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795155626; x=1795760426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
        b=PncEarciuvlhtNkKI7kdDXieIM1JkCT0+mCHiLspX4FhLZl0oNFcY8lctmD1TanzBw
         Ns5mvnbGFgGHq+vEWpgMupEtPp4j8s5suBJeddc7pWy9mlnf4KvdRMucju44eI6o8P91
         K3R+UauadWVMYMgxZTTZ1L9+QxrOjp2Qg4K7aIxEjdXMmgEjGcLhOp2kJbDXDYnNWFL2
         sqcsLW8dMQKbnp+YRco03AI4gcNFhCGrXZJpko+OSlKK6xwAdV672RpNd6AxOGa1fj3h
         ZSLcUUqLf3T0Rm3ALYubcjcCpTIAepE4CPuvsZuROt8O7zeXPqOqAd+x7uFTpxWsW1nH
         +pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795155626; x=1795760426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
        b=OR6uShhD1B+poSxx6eFM3VDgUZq/z1v669MMIPvoQ/mLrH4m72o0KKTh/WBeVpWDGE
         HuETHX460Rlbx6QUxPNXl6w/JKmVcx3QJvKPfvMf+kywrAjgJSjSCBdOR5ZxNPmU6ZMH
         ozmtaYvf4RD2mV2YZ4kwT8dJhc62PJBDszs9SEZk4j7ryW2YnDIMotYmCjrJZ+l/CWx5
         36N+hsGMp77nuou+7mqJNxX0lqIQSHG0gCiIky6tJinma/38asMnP6z01JS1fsST/d1x
         aJ1jj7r81k1zDp4I+dOSQ5ZKwRVpPJz0TF5eegVS6L9ItSPC3S0MWoqQi5UjngEzHL+1
         4AHA==
X-Forwarded-Encrypted: i=1; AL+hErEF9GGAgdIl1ebhi8AYmrigMp53V2K4LmX++Ke7C5iRwIlYVSv+H5jb9toqonbzJLKXMETH79M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xCYktSYch++nsXr30GVCfdsEk69oVYqZw/EWhU3/IiaxmCCGH
	H2Y4fXtNYr0ejOl8bKKlPT4ZKjQ/+MYpzzWpsiWEK92HSXDkr1A6IDvL
X-Gm-Gg: AZFdTZf4QUUjTszde7mBkveDIM5X+N0nxhXQSDTe70BlfNhM4t8abOC5kzvAyP9YOW8
	9Qw5v8u4C0QYyWHYITkb8Q8NJItgdoFWAhRd3KYkh9nNQE0JbDtKhSN1mslWTESo++u7VjNnPm8
	oxqyKEHLaKobEjvGV6Qs3+UUZTmBt6EbBQv2RsmrpGmaKHuDFSmJd/BuP31CiC43rdA/E11zhMK
	Y0pr0lZUh8sxfbvp3SV0eC2ZxLxSir7XTZo/Q+3IPQSJbrIaHToVzlHFOLiD0EYfzXHekKJxVlr
	+PF5sCfCdPqEajvC47LDmdKGkJ75lhiBFGYi+Wcz/lfEOxWhnEIaE3B4p0CMAsv5E/iNucH4Zy5
	UPNQ1KcZk33NecdLGI3qaD/Lcfk1liYQW9Y87FQWvlKyqqT9KE4h7YVL/rZFLztKrf7XSj4ybM9
	l7lGvUxjGFZCp03usfQySDIWfRKycACCqw989z0RZBIrTLjizjfZPFurkAzRJBeKfEm/jGSJSEC
	ndJvHMmx8Wwl9DKbYg3WSH8yOMnhDqFE8/tUNaGM0BSHt8ru+49M3ad2LZX3r1B6j5z4sDiyGxv
	tLEs4x64pXyvX1lf8IyoQUK/QbfgW0DQiO54kpPKGwel3giaZgdURWg=
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr2512258eec.5.1795155626034;
        Thu, 19 Nov 2026 22:20:26 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:84c0:a687:3d35:47b0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm2920863eec.24.2026.11.19.22.20.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 22:20:25 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register read errors
Date: Fri, 20 Nov 2026 14:20:01 +0800
Message-ID: <20261120062001.38233-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

an8811hb_check_crc() ignores the return value of its PBUS reads. When
the status read fails, the loop tests a stale or uninitialized
pbus_value and can stop waiting before the check has finished. When the
result read fails, the PASS or FAIL message tests the status value.

en8811h_print_fw_version() also ignores a failed read, which leaves
priv->firmware_version at 0 on the first firmware load, or when the
bootloader's running firmware is kept. en8811h_read_status() then
handles it as firmware older than 24011202 and guesses the link
partner's 2.5GBASE-T ability from the link speed.

Return the error from each of these reads. A failed version read now
fails the firmware load or the probe, as the other PBUS errors there
do.

Found by an AI code review agent; not triggered. Compile-tested with W=1.

Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
v2:
  - retarget to net-next, drop the Fixes: and Cc: stable tags (Andrew Lunn)
  - also check the version read in en8811h_use_running_fw(), added in
    net-next by 89f0fb60afdb
v1: https://lore.kernel.org/netdev/20261118182436.32455-1-enderaoelyther@gmail.com/

No new W=1, sparse or smatch warnings.

 drivers/net/phy/air_en8811h.c | 36 ++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index ef20b41ed5cb..c48ada43ab6b 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -378,18 +378,25 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 					  AN8811HB_CRC_RD_EN);
 	if (ret < 0)
 		return ret;
-	air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	if (ret < 0)
+		return ret;
 
 	do {
 		msleep(300);
-		air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		ret = air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		if (ret < 0)
+			return ret;
 
 		/* We do not know what errors this check is supposed
 		 * catch or what to do about a failure. So print the
 		 * result and continue like the vendor driver does.
 		 */
 		if (pbus_value & AN8811HB_CRC_ST) {
-			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
+			ret = air_phy_buckpbus_reg_read(phydev, mon3,
+							&pbus_value);
+			if (ret < 0)
+				return ret;
 			phydev_dbg(phydev, "CRC Check %s!\n",
 				   pbus_value & AN8811HB_CRC_CHECK_PASS ?
 					"PASS" : "FAIL");
@@ -403,14 +410,20 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 	return -ENODEV;
 }
 
-static void en8811h_print_fw_version(struct phy_device *phydev)
+static int en8811h_print_fw_version(struct phy_device *phydev)
 {
 	struct en8811h_priv *priv = phydev->priv;
+	int ret;
+
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
+					&priv->firmware_version);
+	if (ret < 0)
+		return ret;
 
-	air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
-				  &priv->firmware_version);
 	phydev_info(phydev, "MD32 firmware version: %08x\n",
 		    priv->firmware_version);
+
+	return 0;
 }
 
 static int an8811hb_load_file(struct phy_device *phydev, const char *name,
@@ -527,7 +540,10 @@ static int en8811h_use_running_fw(struct phy_device *phydev, int err)
 	if (status != EN8811H_PHY_READY)
 		return err;
 
-	en8811h_print_fw_version(phydev);
+	status = en8811h_print_fw_version(phydev);
+	if (status < 0)
+		return status;
+
 	return 1;
 }
 
@@ -575,7 +591,7 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
 
 en8811h_load_firmware_out:
 	release_firmware(fw2);
@@ -1179,7 +1195,9 @@ static int an8811hb_probe(struct phy_device *phydev)
 		goto err_dev_create;
 	}
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
+	if (ret < 0)
+		goto err_dev_create;
 
 	/* mcu has just restarted after firmware load */
 	priv->mcu_needs_restart = false;

base-commit: 0742ef27cd72f155e6d355d13c49133116f19c89
-- 
2.56.1

