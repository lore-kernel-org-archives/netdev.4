Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864905;
	b=HZQezi4BVVk3/NHxbntiFimPj7hpY1CfDFdvQondNOtgAIsaB2DD5e3ITa1JqousNIiB
	 EiZ/NFauIZFXHlzLmNG1ZYKPHLnYrc8ks5gcNM9aEQiutG+KBCQfGjLuemNHrMg3T3fFP
	 12QfA7NMvuAte8FF4lkZbvFviS08vWxTLTnWssFeXNV89jMZTuuh7o3Iu+BGQVhnImw95
	 1KA/OO9WSDTi/Kxbr1b34q6wZzEPtVR9ym6EXNgMyG0GQj650m2YiX35EBuFc1iDmfvn+
	 pNb7Nr8vBB+PeRs+H9Lt3VivPLS/+eLSQFyiYVQYNfPFsbjUtnpd7D43TI04tUF3kMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=n6fa17e2ZSOmnYdCgfLs0Det1Yb8ZLh2mhqLVqMrans++quz4jsl0/UdMoNG1yIHuYkg
	 dkmwdNv26RB80+xsz7YpYq+ilvjQC00t7jizARXp7AyY/blHtEYo70p+g2xxJA5l98EZA
	 H19/DqOnN05bejFf9cYJ8C/FiO9/WD3Mur4id1sJCcUN+Jv7Mx9lGzrzPCA5u2rqQH5Is
	 mU+UtJouUE8ZkT0UHNRO8daxtXfrhuzvE5q/X+p4rZUoipW7jubNOs3dFuzROoDPuBQDF
	 DFe0zW58m8W7nQGVbBlNIlLxR/gW2fVR3dfw1C6J/FOEc0F2UGU0HadE0O6Ijrxg9/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="ZDpWBF/c";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1F606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D1F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZDpWBF/c
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3a6c5c81bso470567a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864904; x=1795469704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=nbGJz7o06M2PbjMcg3dgaU/mYpg1KMdi6VnmVAUTh5J/Q/pLIEuDygetWacJWJ0riK
         pF7Z6g6U6BLqDFHOl8vnLaJMvs/m+dNzM7QbqjR6rePN1HQ+LRefXJY8G/mUk0RGa1KT
         9509wbkJidFn6LWCHOgzbuRxdtVXKr14xZb8wVorNAYFajXAkIMfPxgRuLl5FgaK5m6e
         w9HfPAW5bZhxPDANc1lFTU3VrVykiWwLOfq4JPkjcq53vTfXQZyblB2dScal/uWsRd6J
         1niuhkeDPJBfN/nWhTkGOL8jm4ACUUeT3r8Ex8aDRbrO1/Rhip+hEhBp5v9mW7Y+Gcbl
         KDNg==
X-Gm-Message-State: APuU4Z/MGO2X2M52MEWXK8nGUO11UUoil4uIgLdAyRbFhtzCSsNM6X4A
	XwVbcLgpFT3MBtNyB6aoVfI9+qb8654GJz3CIh86NVzTOYVURTPfG8RhDnP6DY9ltTNwz3S9K25
	XG8u9QAa58+je0Yec4KEj9oaCCgBQdE78MFMF0fSFjy1OhMd5vRoiu94arkHTDJjjTU3auiA3sU
	+/os8vUzG5sn0X41Z1JlUV3gQcPPNpfhhZJqRhgNIKPHMyv7jpN9j2b1hj5sbB6WZkXAPkjfUia
	O5tHEmshphWTPvy
X-Gm-Gg: AZFdTZetVOfxksTmkFq2hokz6T5D+66AocHWDMbFDZPlHpM6RA5CwSaW+5CwDt00xJc
	FD/Xwzn5jEeaTA2vf+HDF/BgTdF/CjHuGhVRAlj1wAifmuNEfz3C6gtBiQMID8Trp5UtCwgIvjc
	Z+JcvRU3S+NVpqCvGMTn+H1AMR1ouWSPbMVHvXRIipQYVcw8xG/vU8+mSI74pu7U1CpDvKT7wby
	wuOcjl/QvYO1Q5VMOyqYvMLLq/9FTwpNmY8VZV4gR5iAps8TZu8BhT0PKVWL7lsyXjSq066Yiap
	m0apOuaBZ4isQt0s9nSxla4UVTej2CNtErp6L2Y8rBcG1MlhobupPdn+W1yfRBzzYS+QDj2lOFx
	gFLUV/tTV+DcHdVdXuutCe1Zgl1mpByZHDONXfcjF4FL1u23sTCJZRdNZGmUg4I7UhJVGuniK9Z
	+h+dp9Sas0ipBUwwZQW/VgGIHrX/yyBpR/cIr9xoHhtXY=
X-Received: by 2002:a17:90a:c88b:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3b1b0a3d990mr9808820a91.30.1794864903936;
        Mon, 16 Nov 2026 13:35:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24cf7ecsm6268820a91.2.2026.11.16.13.35.03
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c950b47ffso45388761cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864902; x=1795469702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=ZDpWBF/cqUiwhR26SXrcFT+w+GT4hZahWFMx8CZY80BveoqRHMpmee/pzAQvGvazrz
         149iajNcnLJdyvcTSNGrC5IjXvXoZpktBIV8SMBLUi7oOAuGKAggLmXLkEeDta5+zxVV
         4vHIjq9ybAEVt8kpJ2Z3q1F1NmpVMjBMeOqfU=
X-Received: by 2002:ac8:5ac2:0:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-55ac667dfbamr194352491cf.15.1794864902603;
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-55ac667dfbamr194352011cf.15.1794864902027;
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:01 -0800 (PST)
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
Subject: [PATCH net-next v2 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Mon, 16 Nov 2026 13:34:47 -0800
Message-Id: <20261116213449.1682731-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

