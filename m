Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203822;
	b=k2egmeUez2HMBSMktnqgIZpK/Idz9x7pRSBj/saOuMZTp/KkZX9G4ms9IHc7d3BvVcaq
	 bX6z8wBt8R6fLzLJM8SJeJQFASXRpQkQGyDzGyESFt0CIipDf5ML8HU/v8kQSAAKG6TED
	 ZRgWgk5RavC+fLCFvQ6RMKHdLpnTsJrKDhKvknNSIE/5HY/N78g5xHJSNw0GOriWhNhUC
	 VUHHG/Q2xM3Rqeo5TX6X9xaF11HfJjM/erpTpuBYHq3mvh0tfnY5/SZbDiu/25boIaOQf
	 97Av3dUoRmfvyRfxmHEeKqsJX26dVsivXHrRmYkF/LjhPVngaPGoa/lcCnRTsB742nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203822;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=qPJ828xIVjMOYgMt0bQuRMDFa1ldviy6FGsrN6LS/ktJWbr0HFjUQW9zgpsk9CrHKKwz
	 8QgdayKQCw50hqFGdH6EazwDNxZvy2Ol0xWy7YD53GzK+qFobFuwoucbcukRCLdIiR6bS
	 vvteV0aA7mRUBd60ROl2XjR2ZZJ7pCPLgJVWfIy9n/Clus0pY+zpVFxKAiFlD/IHCuxMg
	 vXlXPlZFuEvYoNqEndwet7S6C1AS9pAA0NB9eLvVeMXHyKexHYL+3c2ZXf3Z7EOTCc4fA
	 SipS5gtq9Z5UamvGBmujWzOD5DG1cP/yVkfmxOzd/C0rkCwjXfwI4krSk38HmW9zVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mqs+jacr;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D20606A6D6
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D20606A6D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mqs+jacr
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-67da3d03263so1493658d50.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203812; x=1795808612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=uGG7cqRrKsL3L0GqWW0tyWJgsPFuFSCZo4ZDp/hWeT8vZZAFowRItSXmaDDU06uIgc
         RjrCvswcQ+7mevPSIeEhZj9G4iX+TvZs8VfR/uXEmUtKt4NgYPmyTbcdvt5X/dgpNgD5
         ymyLaZuNvwZFJdE86KwMQAapbf5FuctSP91e6537bX8kMoBbdoeCzdFRZ1PIaCSxEk7z
         EYontpxf56E/lS9EmOt0QcKYECSI2sJpkmsZ04TeRIdMYz+XVT9oaDMTso/+L9ZiaCrD
         RlRpPv+EbagB5luJihK+lnFv5LCzUFSi+DlzwQvvaLZ99ZUcIGw16aHnT2QXymdV7akL
         bV4A==
X-Gm-Message-State: APuU4Z+VSRrqZcAVetFQG4cKiZAvPfOsRUcI7pBXVwb4YIwUk86XI6G2
	+akTpKRJegoVe+HJWiqyB8U2fuCTTH1dJupIJJcjCM4ykyud+Tr84GAczwtSe82a6JfrsZNFrQ+
	OXklFaNjpP7koAus1oCuduj4lrY3+2E3BV2myG9UCa3sVgs1usjAvJ2XXZainC45qt6UJqlIT2i
	Ao/M5SUlJ0kwunxK+pxGpOy1iSxyTktNoPgWqemkmeSsvK6AhsS9VEmjJ3IIXsL1mplx+2CfBXr
	+KiQCqfiIwO1zvq
X-Gm-Gg: AZFdTZeICtTu/k77BN/kx+Myj04wlao5UIavvnv+JmeEiQ5l8FWuccOOW48qROUe/7u
	mYxdwinQ1CTaIkVboSOq3ue3zkSsmJqJG2tcy5S3VtcAAgsSVYgjJ0NpjJepodMXb+uadhT9EUy
	w8J2qRR6kHPTjqxKtST6V5HXcAg5CQqEbZrlnV1vqeeYoXpIgaSYWodY+g3d1MvoUAeKWUeVgHo
	Aym8N1OfpFxSMLjOgEjmlBEV1v+DuAkw7Oiz7LiNBsLKZZWI5J7DGQF7JNxd6tlS+lXB644SBvb
	xc5vKxXe5ZJzs6vatC0aEdJ5adnF7DUI+nfRKZE4d5T0llcY7CczIdQ0fd2COq14ex03eVUHEhT
	jl+GbSc881BapS5zyJjxog7eBG+fKsn7K3Ebyh7cTcipo6/Tz3E0EJy/cw3KfGR0+i7ywfkKkx/
	UDf5COyEKhz7QjiC80MPxyN9dhC6lbu2qnzcpRXfJB
X-Received: by 2002:a05:690e:12c6:b0:672:99e0:ebf2 with SMTP id 956f58d0204a3-67df44b9cbemr1649558d50.138.1795203812445;
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67df333ca32sm41998d50.11.2026.11.20.11.43.31
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dd37so30433256d6.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203811; x=1795808611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Mqs+jacrMiJxgeQL9ab6M16kCpUuVttz6QXvpjX0DorUfwVdVLAoKUv9mWrukxL4dp
         BE7UU9PjEKUSAZyyIaC4lPk7GNaKRiVQeP2j3nLvs4E9jfjfHIObJlhF7a8HC7pacilF
         4JR93lo8QC+UIwvnk70Q9nxjezB4S0DX90uVs=
X-Received: by 2002:a05:6214:5541:b0:921:31cb:5af with SMTP id 6a1803df08f44-92134b7c46amr70632416d6.47.1795203811325;
        Fri, 20 Nov 2026 11:43:31 -0800 (PST)
X-Received: by 2002:a05:6214:5541:b0:921:31cb:5af with SMTP id 6a1803df08f44-92134b7c46amr70631936d6.47.1795203810762;
        Fri, 20 Nov 2026 11:43:30 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:29 -0800 (PST)
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
Subject: [PATCH net-next v5 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Fri, 20 Nov 2026 11:43:16 -0800
Message-Id: <20261120194318.3952487-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
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

