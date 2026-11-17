Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958338;
	b=2VMQ6kN72h78ejQVDInkJuIT/82A0HTFk6EzMLAJllfzCkFuTSO39LVHfD7kLweFGnyR
	 Ferebl2JB7hAS7sz0+jeWqaCOH6SRXWo1cY0D+DHIh5SRtFi70KR3GSFE29WxRZ2lUqb+
	 0sfCasspvQJxF5n4Lu1MHQZdR3jkxcxoMRDkO22EV17uWd8MBqPd1L1Q1oJ4/Mf1p/Vt0
	 UZmFvcSu7nNNA7uGNs8MZQWBQSlaufIDnw89s/OOxU1zBZcR4SR8jhIhNuCsQmTsRniKm
	 buIX6FJU9Ok9uBP5yDKunJLbjj1pwgHS8vlf72qYJc6YXaI8mBIGK3O2DyrASwHtxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958338;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
	b=nAlRL44aAEw9o42wdWQfIrl8d7vbnl+otXE+ARtH1iKrOV45oQy/pBGfQK9gLImyVjmD
	 uFIXPr3U6Tb93qte2BDUbVNpZ2MJFln0WfGElNqaCDekkUuS1JDcZzoCYl4BidK3htmHI
	 LNledEH02V4ziqUsh10iTBLWF3Q+A09cgGeGr/KZunU5pY3a3mQu5USkfPJsulZKNJP/K
	 nF4Cnl6CKFo+AE3xEuA5g9BDXEwN2z4Jiw3V7+6TTmkIs3hrG2QqC3j+2Bj/PomhGCK6D
	 AxGlxWCy1nNKMDYACrCQSYUkR2GmlNXMsZlZEpUXWVqjAmCEMr/WaSDWWK2lMPKyQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CFDc5Imz;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20502606A335
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20502606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CFDc5Imz
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so143925a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958337; x=1795563137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
        b=mAwYfH5LhZ+LGASzcC0iI2NIY5PyIvwG4yf9snY+UV34lXWyvv5eKtO8rD42tlPUlD
         +gfc2NDAk/wyO1C0jub5T5UkoO6tDoXHuZ8bS1PeoR/H25bucX0DlOK3kr9bw9iBTcsd
         iCmZn+NQWMx9fohWHKeaaVXJTxOHUrRvdUQBco/2EjL3vQXT2Q4JDKiHmLt37ANtvaBQ
         N7q84rP+EZXTzffc+VDpC9llKD/aU8k+i/M52WzwNwrzDUC5fLpIQ1FweDU3ej1pFmHn
         VmZZjPeGLVe7NpEAVDb5kxw4jOwFT6ExLHFP0sZzW2o72Sk+38om/XwDmm1pIjcHLHNc
         x1XQ==
X-Gm-Message-State: APuU4Z++8BdoqPjaa/SE9o1M3etHtmHGoZWpvtr0jGbxM3SuRBWBlruh
	byXap7CLCk366RbCcyug6pv6KWhKOZ70I+L/VHebH/0Bpl+r/spXEHctYDtmmAJXQ1XDD/I102L
	mKrBtAREwEZKS4Uw3D9G0dcP7t7YKJ42jxAhnlZzrxdQ+kfXHtxTotKi8POhdkcDAeNGd/t/9bM
	Yaq/jzUG7++Zr4AlejZjlgFnW+BdpD6f0HvfufMK23jQid8kTdsD0kkU2dsibol6AMA/37ZXl/a
	+/j1aay5O3MczXw
X-Gm-Gg: AZFdTZd63enrYl9ruXFIYNYPmfW2+35bctz0jvSC5huJ85UTrK0qECsJlWTHZ5jrTVe
	BVeRsRvvo88hjP3les0n5xUK09RWkBtG6oqi3V53WENzBbZf1HgvK3g/YOmZlQ3OM9tD1H0sCbc
	H2jycmJT2Od6q6fvLMwkHEWbC//Zj5oWjEYhgIz4tpkWYngKBnnnRM8M8FXuCM37vzlX+832WZn
	ck3rvmFAAqrfawHyqm2b8cks1ZQQe9Ox9xp6HDq7RB2oFaT6ZL4NKOSC/gQB+28Gf+PD7Ueb4Qk
	u8Nxt/CvhEgtU9UBI4XgYYIddJtyqrHmlpT+MBG81RYRXad5FeyMsDFQae/g3zPZ9ETInuS7+2l
	fG0LzIkVc+5zZyobizCnB9eD3zO0FRGYC3Q6TiCjLyIuOlJsPx85N1Ke0k1AvvfytdHjCF3YLKB
	Pi96DDyVHGUDpmtlRq7zad3vsm95Xv3ejDxVm8zwyD
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr861415a91.60.1794958337331;
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4373b48sm167057a91.4.2026.11.17.15.32.16
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so512909eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958336; x=1795563136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
        b=CFDc5ImzGM01C7N0flF2kgHS4eb3h6KCKcydz5nNFbfA/v+e6Soq5RGlFIrg3ikcqf
         SBtAXjUdWxTVxW8YDQsZvwPyvaBx7IUmwgstP4d8N8C8yCHKtLHQvqyBXD9aKAvbtlhj
         Hs2ZTcegxbJIY2IPxH1iUNh8WxZxq2S4PuY3g=
X-Received: by 2002:a05:7023:d0a:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1b543cb4d86mr1035970c88.9.1794958335570;
        Tue, 17 Nov 2026 15:32:15 -0800 (PST)
X-Received: by 2002:a05:7023:d0a:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1b543cb4d86mr1035934c88.9.1794958334545;
        Tue, 17 Nov 2026 15:32:14 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v3 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Tue, 17 Nov 2026 15:31:45 -0800
Message-Id: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

This patch series adds support for Clause 45 MDIO operations within the
mdio-bcm-unimac driver. The series breaks things up in this way:

- make the C45 bus scan done by the MDIO core carry on when nothing
  answers at an address, as the C22 scan already does
- scope the existing defines to make it clear what is C22 vs. C45
  specific
- rework the polling completion loop to be a tighter loop
- add support for clause 45 operations

Changes in v3:

- patch 1: collect Reviewed-by tag from Nicolai Buchwitz, no code changes
- patches 2 and 3: no changes
- patch 4:
  - after the ADDR cycle, make sure the controller is idle before starting
    the READ/WRITE cycle, since a wait_func() such as bcmgenet_mii_wait()
    returns 0 even when it timed out with START_BUSY still set
  - take bus->mdio_lock in unimac_mdio_resume() around
    unimac_mdio_clk_set(), such that its read-modify-write of MDIO_CFG
    cannot race with the C22/C45 clause switch done by the accessors

Changes in v2:

- add patch 1, since providing read_c45/write_c45 makes the MDIO core scan
  for C45 PHYs on all addresses that are not masked. On a bus registered
  without a device tree node (e.g.: GENET with ACPI) a read from an empty
  address fails with -EIO, which get_phy_c45_ids() passed up instead of
  mapping it to -ENODEV, and made the whole bus registration fail. Reported
  by Nicolai Buchwitz.
- patches 2 and 3: collect Reviewed-by tags from Andrew Lunn and Nicolai
  Buchwitz, no code changes
- patch 4: no code changes

Florian Fainelli (4):
  net: phy: Map C45 probe read errors to -ENODEV during bus scan
  net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
  net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
  net: mdio: mdio-bcm-unimac: Add Clause 45 support

 drivers/net/mdio/mdio-bcm-unimac.c | 150 ++++++++++++++++++++++++++---
 drivers/net/phy/phy_device.c       |  24 ++++-
 2 files changed, 153 insertions(+), 21 deletions(-)

-- 
2.34.1

