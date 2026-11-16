Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864901;
	b=LmZLr5xPk7AQ+bIZz9asQQyl1A05QuvgJU/ruLP5TCDfh4x08JR461XBuXBgyNlb7fb3
	 V1Aypoo0J69nLkfBksNVWw8xilpe/cbGHYrD+wxe9bluqy52i0VdLoN122bh8pZqwpFlM
	 i83/BQvkQPGTiqF5mbtI+bariXZrkmkQpkiq8LkanPGq0xW+2sxuZ29pgaGUwv/P+THs5
	 v4NtnvHRbd/RIP3NBeIwzgN8KVXwRfb2GK1jTKa34N5x1AUm8iGF4bfihPJEpIS6ZSHCg
	 Pj2UW8rDmmHw7uNjg+Yk7OggWa1xPfYVVKQtC28jb/hjxrumRYKlRoSREU1mOgKI5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864901;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
	b=ngMfn3ch6pAddh0SvXKvB35IA3hUOV3MWZGvPhPrgsYDAP4otux+n7ppXIHPohfPQPir
	 G4F40TgPwnc9t+EZu/ogY/m8A+LSsXq5QBVEMxCIZeHpB+xf+5KhmKgetRFJcfgkWt40a
	 GZQotd/mcEltmvxfgDTD0ozFf1lTvtOxw9QNPsDPpPpwiGmGS6hu1vTP0kaD8ZJKfRb7E
	 YdQdXCwpiAQM5R05IHcuHz0X1IOGp3Nx51+R1caMwYZ3XTSHvP+pkkcXuee0PRP6VL6kV
	 DpIt2CC3rIHznWo/mOkEiTpsNsiY7kDPBSyNTcNwK6NOMQD7yoQP2MZAk0KNnbEMLsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=heV8i5ar;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE666606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE666606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=heV8i5ar
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd69954c755so3318945a12.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864900; x=1795469700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
        b=dN9aw34cqMBpt7Bcpm0S5n+HDWfouA65pAFzpiYLltADFczLzhptHuo+kXM1qSkU2D
         VumyXqywnPuxWAze/A81mP2Iw1s3BKSLEdtRfz2swrxo2Gw/Ug05NLbK3NMJaIztQOyP
         rcTMDZeWmwexUoRF0+n2dUA68NtAsWQMkBQl+cstdQHIHv9sqG+ZmEYegiXEHlz2UwrP
         alnEFFH08Xf7lsVfDC0mixaBDg6f9N+G18bXtCZ/WcpvQKMiWtdCE0zPKhR3WRFovkFn
         GNCgb7lw2tcmTJzubRTifMjrn0AOqrkTv96gTyqsUWkor1JnJPEGvI9Iosm/qMXW6Tdf
         H1GQ==
X-Gm-Message-State: APuU4Z97qs2DyFyNlZgkoSY1RmW6nlPbh9VCMyHJpaBQEDz9f2/ICEeY
	XYokrAqWxiRZbsP3ZcuG3zlXIQV81kRG2BM9+vUDoRz+nE5DHyDkaE7xToK7rOIUwXHEIcGU11N
	2ogJs3FXF2q+anSNKjzPWf2U/KrFQIfA31W/s2BpAUwg8YpOlFb2kGlCCO8a0rjHaZOpGdKM6pw
	XA4tUtFSL8mh3WoKa2I1GqNUX6W6+sn5j87fBgSpeqSy1HEBN9lF3zDpp6iKgAoCPonbmlfpjXo
	mVoVJ6SAIV6/dnd
X-Gm-Gg: AZFdTZfGKSBErXbyM4TZJK19DqilCyjqMTNxDnj9UD0Z30pdH/6vqsLbcZAQ/PosDjE
	A70B6SPw2g8arDKwqp9eRb0P3de1ug0m2WCggKTJn1mqGW2nUsk1r7zwSjMHkexOBnze2vF2E5W
	xDNo5WduyC++BbQG1NLa4NNR0VJMfL/Gw7dbqNOl4Ef9YPxNgTmVAenHp7A1LexZ1dJwjWHYgwy
	DkycqpiJgzcha40jRd+qYxF+DNLFeylZPtz5S1IUISQUc3sMh/L/KVT1ZzeiuUc8ZamMVvPt2UF
	3REFCTkGRZmTBZsfZuaWl6g4ULngI9+qLhh0JYJwnLaoGtkXMxbVPAHHNcLz1HsHwXFcdEb87Wb
	PGQag82PbE1WRSMK3Io6a+o3+bL7ONiZOI6haj6D8pbh2e+OVJWO1NtB2d8iNT+Hytpx0E50ktu
	+CaShZjhz9ms23HouKzXu4zYDlIfmsDp+93KAOXBIfrIA=
X-Received: by 2002:a17:90b:5548:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b1b09fcbd0mr11335517a91.27.1794864899915;
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm383968a91.7.2026.11.16.13.34.58
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c5cbc838aso71109521cf.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864898; x=1795469698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
        b=heV8i5arYbt1Rp9l+apnCzyyxgTnN4dzI4tQR7q8Egvw7FFeSYmUgKXCLuaCrAF2IF
         Zu/eDCEF7nEK9ZSpsr1JxzQ6oIaAONgBWt4p+sCA19RiTnlZI8C8oTE6qQjK8ZaPP/I4
         4Yc/IT/PvU6qUW3lSNcu4YFbX9pTQKQ0sdk6g=
X-Received: by 2002:a05:622a:5b90:b0:536:5663:5558 with SMTP id d75a77b69052e-55ac47982bamr181486151cf.7.1794864897813;
        Mon, 16 Nov 2026 13:34:57 -0800 (PST)
X-Received: by 2002:a05:622a:5b90:b0:536:5663:5558 with SMTP id d75a77b69052e-55ac47982bamr181485641cf.7.1794864897168;
        Mon, 16 Nov 2026 13:34:57 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:56 -0800 (PST)
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
Subject: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 16 Nov 2026 13:34:45 -0800
Message-Id: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

 drivers/net/mdio/mdio-bcm-unimac.c | 130 +++++++++++++++++++++++++----
 drivers/net/phy/phy_device.c       |  24 ++++--
 2 files changed, 134 insertions(+), 20 deletions(-)

-- 
2.34.1

