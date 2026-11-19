Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049997;
	b=goGjfMXhpogWO5KyhLSLy8GMg6sEzj8J6OWk5Wh2v96jEPdZG6IrNl0ZX13JZEa+MBBC
	 X2TFLitIXy9zoIIkURCxklEOEpmNsVbjpG6OxWWVe15hq29CtSfjjRADMsYoYYfGDJ+/l
	 0bnAU4hdZgLkKc/UDxer6F5+T8Sysvd2+656K70BtGGSu9A5TKdsX2kkeCFdn9z6MgawO
	 Ab9OUc2OIJVBuZVZB7zdT5l63MTqwvNGTpiJrr+RKFoe76+SFFIOTlzSJbNbRPvDTkLWx
	 Ta7Un8KclpInD+4kZDCNL8tkxyGvfCvhjK4ZgyemA64SKW6irvD/+9cnWCG1OezgsDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049997;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
	b=BaxhMY2SHlLUmbpOE9NkU5+rbIRAjT8/djKLnYzTdAlPq+6Rb+/eXGDYbmdJK9icKCWS
	 /Mo1smZ2EfOu/9XFtPqe9aRLvvSOfRtdyMwuQUDnSmcy7ZoKBbklCF0QFefrv7C15gr+h
	 +htFOrQE8ZU3qgLLSMoheyUwbnKBdBZBFA5OJoiZ5lLVfOCw7Ah9Wm1YzvpvIPyQttFS3
	 VN6/8DzcuLCxewWC1/UkhY7wTUgkDs7T1gNs+JT4ydiOa1TGAHpLPOGeGGubd5w711g1C
	 6CQiGMbHMLmNpJMdJN4R5+GwXt8aQ0667mLZo4xrEJOFtYRZ5hngfZ2C4rXvZdiTo5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbFBHqj1;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D81606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D81606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbFBHqj1
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1115576a12.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049996; x=1795654796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=Wt1O0W+frprihvnfSVjjkmsMNHDnev+iHmiVPBQYNYkZQw496gJXhWNJBW3asSN3zB
         ZoEOZLkPiw3Ff/ly/2Z+WqKMre/9EhNSLyv0O23ZTtj1mBid9Eo88rq4fxu9nfllLLnZ
         CVzdLQMoeZ0H98ua/0C9qFRRpvVuFDCx/ad/HXX0LWl2Um69lUtUVgNt8FAlT1seoUJa
         6a3z7JP6zevrsIdpmK6J5G0Gfp/zHKvW97sIYFGLdOAjavNzOeSjttCaYNsd/CO5aI2G
         SmeUhiisVKPDaYWSinTCqQq10Oz0Wu1b2WjLrlYprzPR02AurpI1/M7qi25G2lQw904O
         gXMA==
X-Gm-Message-State: APuU4Z9JqEMPLZLNSW7NsxnfHyX/eZSq9b4mLIH0VtCOQ28c1G08cvxU
	9d7GtT77oN9khVu6o8Mvc3HL3lwSuqx+75BnucwNaQcgnXrm6cH3iC8qtWbUxPl6FvZlxCapTOO
	xzS3AC1ZKF0551VO44aaYVxwMhUUUYUOGUt+Dz92kOZOA+Zgnka6sDZ2E2T/M09t5djkyt7OFZk
	Us4h7q/Ed/Hjzk1KVr6QacNhxRvlt/xDzgWQ5vIUZRDT9BzygsDfrJR4DH50EwPEbKVI+oyd3xJ
	4xyGijE2knlmKTR
X-Gm-Gg: AZFdTZcXI9/grEyct91PnjZNp2eZe/zUlPpK3bhDnAGkzXAJo+AJ4SmwQ95Pgv1+4+g
	BzMaARd5tONVL4/JFLa1jvDlCna8j1ZD0MytGT3NRYpTaR/piXuIamlGpLBefcufBhF4NNyzw6b
	iOXeYUsCFd6SR62Kq/xc4oPl4QSDTihUSI9DdvX5Oky95n0z047bFS7isI7vwZ3oYZhqQGDVkOB
	G4qhQIcOFQl3Gm9Jzu1jFRSPWLi5I1/L35uzbDZog0+AUJyvksAqAFJeT/chKseU5PYE4w1nWY6
	mAhz0gnA9/5L5TS+vFKK7opx0eqsMid/Hu9KiBJHcbhGwsRBQmMPy0oyS/zt1id9Xf36eO6fn8q
	lIgncKMShphA56XbjZLSQvvJmxb836h0hQLv/TsoM+lp0K2CqIODZV73F9ToaAyC+mkUe3+X0Ty
	84QiA73Xw4/FmHMSPiLXWUI3m98M+m+TgMVX8rYj29d2Y=
X-Received: by 2002:a17:90a:ec8d:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b3d07b911dmr3860547a91.28.1795049995946;
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3fdedd8a0sm398781a91.1.2026.11.18.16.59.55
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-921273a6cacso3179136d6.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049995; x=1795654795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=BbFBHqj1fnu9hg25Usrhd6sqPdrJGhOTfVfSdJIH+qMpHZlJrUqSX4w/brIS7zs/AC
         63MA1JD9huK+1PDQW5EqgUAVyuySQs4o1YIBd0UKmQHA1hzVqof3Z7ebmKffeeTd5wZd
         kNaob2bczsy58tqw4UBpwpFj8W2sBfnnzE0VA=
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr70727796d6.46.1795049994649;
        Wed, 18 Nov 2026 16:59:54 -0800 (PST)
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr70727286d6.46.1795049993735;
        Wed, 18 Nov 2026 16:59:53 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:53 -0800 (PST)
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
Subject: [PATCH net-next v4 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Wed, 18 Nov 2026 16:59:39 -0800
Message-Id: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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

Changes in v4:

- patch 1:
  - when the read of the devices in package registers of an MMD fails with
    -EIO or -ENODEV, treat it like an all Fs reply and probe MMD 0 instead
    of returning -ENODEV right away, so that PHYs that only respond on
    MMD 0 (e.g.: Cortina CS4315/CS4340) are still found on controllers
    that report a bus error for an MMD that does not answer. The remaining
    MMDs are not probed, to keep the cost of scanning an empty address
    bounded. -ENODEV is only returned if MMD 0 does not answer either
  - add a Fixes: tag
  - update the kernel-doc of get_phy_c45_ids() and phy_get_c45_ids()
  - the code changed since Nicolai's Reviewed-by tag was given, which was
    kept, please let me know if it should be dropped
- patch 2: no changes
- patch 3: reword the comments about the poll timeout, which applies to each
  frame, a C45 access waits once for each of its two frames
- patch 4: no code changes, the commit message now mentions that the C45
  scan also runs for the platform device GENET registers without a
  Device Tree node (e.g.: ACPI), since it does not mask any address

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

 drivers/net/mdio/mdio-bcm-unimac.c | 151 ++++++++++++++++++++++++++---
 drivers/net/phy/phy_device.c       |  48 +++++++--
 2 files changed, 173 insertions(+), 26 deletions(-)

-- 
2.34.1

