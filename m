Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958343;
	b=R6a65MPq+sXi+yo34AdViaOQ/4TMi4ClLixlf/JU3JZwLimKBtVW6FpU/7+o9vWNFOKD
	 EepkRPibI3NroGQUu+DRnXzr+8QrMRoGDLCSsEvjrANrf1ofLpYuesc84ZzgQeXIcySbd
	 COiYINheES7DTrYqdL3vw2raCdi9cSaR8xS8e7TNGhrK6J0VWSPfGhzhmmb+cYtWOZr8e
	 bNK1HNros7KChrxQIVrL5BQG8/zdihlX8XxPSHAtE5h1YnfzirsKB8psEBpIu1bVW1ucD
	 W+qcAAO/5KWgqJTFmiIpZKyvhFkwGm6ymDaD0S5J/ZMNnbksOQHlflf/89YxpaRE7HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958343;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=wE5MwElYsrUF6bUSbZ6WD+4C+4KVg1UHB2JCAqzU9lTBqXv1AfhG5tFy7uIZWV9Bg58g
	 aUHe3f3C9acNqghNmKyChPiJF4KMHyidNEM/qcKQ32R+rmtKmyftpgr44dSRCMNL/RFdN
	 EH3rvFHWBBw1mSYyfzYIiv63FcR7wE/qG+wwraqcDSHacUac24z5+5DDbIaRenOna1SWR
	 0qEhCguNny11EAsokWtg8u4J9wT4NtFdeBQPoA1n+qTAjE4MvdbAup+kFWJbBFJvfNc/2
	 I4Gxwg4RxkV0jiEudfcvPu4BQviJQ0pPe5dpsu4jKw2DmM1aoUieYomzLCf0q5ntcaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E8RPwI6J;
	arc=none smtp.remote-ip=209.85.222.97
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0380606A33B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0380606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E8RPwI6J
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso115796241.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958341; x=1795563141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=s66Nc74FSbWyF/FahjbKQKGK7DxcfgEXpkN0zQCkviC7iIeSyHh3N6SBMUCPbIdepb
         QZZPS9on9htBI9y6bbpGEdNXx+BKNyriqNSRV3rX/iPTDVFiUtmVdhYzWWg8sV0Y4jIC
         VrdBLhmtgBWJmGAOknpZvsM+38l88Vudvz7/pEOMYFIBA2fOt5QVU9K8P2byG03iw+Ns
         LmlYYGLa9Gtqi0rEnG5yZz/GuUuBW8zkDtPY1x8sfnT7RMx9u8CgninSzcR0ol6VNgNo
         DATawc2Sv7yxiii7hAC/KAsymP2+2u/dP8wLAcb2pm53SzmIDNjxJKi7H5IBWvON61C7
         dYdw==
X-Gm-Message-State: APuU4Z+WAKpfVnXQHwE4TNsYoHf/mL3ZVwiJzVv8QeRGBYGD7N+VFOw0
	CTszm0mY9+iFCBvR3TY8gDgA9kv8Xi7u+7JPVErL5imo8WLEDygvZC8tl/KgLwVdzKIc9NliRBb
	VOQtq0szalbwFKJNdHNFEzQHXpP15Scrx3O7UQwc4CMNFe9FNPADCWvUkoAtEOXLo2E7U6q2e/N
	BW8VK4EYHwFgyyPKtPeHZfwXcpAosH2IMfhO0u+qHqLdTY23io+TOW/NODjCkzykefdSTYGb6KX
	moTO5w8EnjZdxNP
X-Gm-Gg: AYBFou1Fd/fq1EXhzMXRPBbPRGIgVM/kfCfWmvzaJEoYH2/zG3GopXZbAQTR6fue/OK
	69CceMySpx16xBvZoBzUfmFFFoCT/HbI+lObkBCyoVzTD9g6aat5fkzqpKuHrnI5xbYLYwgWSUI
	mcb9chWfTML5+kzw9oQOcgPsrs7tjIy1tgQ/yYTm8VMCuNrS06SSvAwlvYZf1ZlsBGYRph4vydr
	xxWUDSHjepOUHK62Ki/6mFdnTCwJHp/6E4K9aVHtP+LhcL4GGL0F/hY3aj0PCHRvXnREGOnwJyD
	uibiUGlv+9lcwwixpOXGVvlM5nzDs/biDnALzNXNk+dZhce4jES2EHtge53zOYy4vXl2cxr6YUn
	w+l1IGaTJsY17kCRn/DrDmR31htH4LyNjUyuKsk0KnSj4ror258y7l2wwoY8ldSvuixRzQK2eeT
	acAErnpcwEdOtHJfzUuDwMqm2MKFw+yzOdzIq/r2um
X-Received: by 2002:a05:6102:41a6:b0:7cc:828b:41f4 with SMTP id ada2fe7eead31-7d6ba4ecccbmr210791137.35.1794958341391;
        Tue, 17 Nov 2026 15:32:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e4a6253f0sm95621241.18.2026.11.17.15.32.20
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so628897c88.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958340; x=1795563140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=E8RPwI6JUlQoJPX5Bmn5WiA/1nsGDi2nEkalKJTIPqBsxqADMkTwaPIc2eA3ifNAvG
         NskD2gspWn2I6NxVSGgl/T3EQHYqmx/ODeWudb62Kh9E9TJG/Djfare4/M0lYrFqON6B
         e8DJ9IiGwsAdwmZXtFt5qjQaqG3Ll4vq5lULQ=
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr966112c88.9.1794958339806;
        Tue, 17 Nov 2026 15:32:19 -0800 (PST)
X-Received: by 2002:a05:701a:ccde:20b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b543ce5e34mr966079c88.9.1794958338991;
        Tue, 17 Nov 2026 15:32:18 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v3 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Tue, 17 Nov 2026 15:31:47 -0800
Message-Id: <20261117233149.1693881-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 80fb3b5b52ab..5f79f31220f2 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

