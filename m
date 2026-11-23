Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452527;
	b=yikASchDnDb9xnCqfsfbAQU/Rba30IpgtM+NGAPL/2g8fH0JkQGFNQjhZA/Ifim2N9b6
	 CXuRPQAWNIMIC24ZXL15IoF1dbIJcqkkmDGSoMgACHuIMgFW72DLoKFKFQ5AeOrjwdRF2
	 09+WpYmtBlHdiNT+gGIoWQsfIcIL1D6FBmSHhKVYyPgscr4Vmm7zPKoI8eNO1PLRceTuN
	 QfeDzyLW1cLWH3AXpdtm8L70ZRBNKttcFNDNf+E5ZFY9a9gAAbOakX/k5vLShLXsZjo7e
	 SnkIA2wm2t10MtNZn+Vi6slK5Z9hynuyn7D/F/WaD4fb0l5HeC7IqhGpgXfwh6i1A8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452527;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
	b=KhKbcP2pqgn71AUdRYoEVE3jzUM5KBJERQm0T02KvahosONhG1N/LbUk0LuJkfTrRPac
	 Knh7GEV99l+J4OTHcFISY9x6lsf6i7xkI5eFMuuy2kWwtSSNVOUahL+g8p4CeqIk0jJhT
	 MzrBaC7Q2rLZJtVTm61KfRzTZ1w667dce4IEcqFRKkUrLtiC5Uq+PYgRkOD+rZv53mIMu
	 cLsxJrEIEG+hbN2ppTTOe2J8nn3byFjqlZf+SVshpv09eJKERVrzwJx+ZXAVyL1/1Zv3l
	 AocS+5nA89JQYi+ZvTesweGx4c056SzkQQai+fntdHM5Av3ptw2IWU90GZvLGoufEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C+ywZtvZ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D8606A33E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2D8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C+ywZtvZ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso2230592a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452525; x=1796057325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
        b=wB57ccGKwAR0wd6ZuOGqWfTL+P9mWtRytByFhGjzGVsWOm82B6AFcpRjVKxFbMVV10
         QjpY2VgOuL+PzA3Bz67muot/gq/u5e0k+RT6mNALvA5zADp02lKfKrUSCIucPbgYTAwg
         XU3+XtD5jgb1EGkVbGkWMw9KvUmoL4PlggP2dV6UyPEPvB/uE1JGR+JCqzvOnxXM/S/J
         OKQqQg+u1N6J3KCdqqycVz6escrZHrx4hZLby5dOMwxRPk0Hq27EcvTvQWuwZrIC4ArW
         GUJceVRiTNCfWoj4Oozg2AyiEbuPLcF2SD7mC8j34zqAx8sg90B5vl6R/JTV+w/5q5qq
         T3GA==
X-Gm-Message-State: APuU4Z+5uVh5ufsXtk6R/NXGjmsZIFrbQ1S3VaQnyXNKZK9PgfyAFBXg
	WdZ8vLDqGyQCZ5u01KpToy5pBUK/jyQqKiw/yRmEQrouBaWlhZsBmimZT7ApEhU53wdqCHeERB1
	DdaLWqXob1g8cgjZ79XUQzMQmu1oZEC8FLSsD5a4Uh66Jbt3peKif0a+9CRuZCHU3ynuSoZeXLn
	6B+k19VfSG/cGciLzwjyqV/dW4cSpWJ1/xFYG0E657Pgfk0UMfF3hfZym9QRLbPuAvhJabtoiCf
	nb/QoVvOwQ3xgGf
X-Gm-Gg: AZFdTZf9SYdnbTqSLvQbmBz9WV3DBi0H6aLgXwKp17C7dpsTttEVry6tmV83gsmit9N
	nmrZhruDK8nnhmvmL/aTLpdvrwpzqUVCxIbIt5FW5ozwlcMWHPcvYBydg00vbCCoAdBrecNw163
	n24nnzp537MR/IERCQTBdDO3UDei8d02ceAcZrC7biQxdyTiy7nPt2P5iq0zWgH8rvzp6kHSfOH
	Z0C4F21CisaEYr0x8gL0QSzbkBAJYwbo6Q+Oc/GRZu4ak/NARXx6AHGBsirq3hGRh8Z4tXz0bth
	U+KDGU4RV0kaZwtLJtJ5xhdHV27OEXnCoc9xdf7xBK48wAnPgDPbT7x07KojBut140+zKqIyjto
	sIx8Jz/oc70k10i+RywcgcdXA+oRNboSLGdHaf8YOe/wjbT1bgAr9jGAsNe9M6WGjnCocKFuyGu
	T72qCEs76CywPYQisiGMGpLXqSyxKivjrNYck83qwz
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr10557338a91.14.1795452524792;
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm4608712a91.2.2026.11.23.08.48.44
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so660688485a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452523; x=1796057323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
        b=C+ywZtvZ5p4RymCz54dQEFEerz3mTqIEG+VrPmmv+SayACV8XAPFIBObdc+ugTiKuX
         r77pA2JI2Q//yj7Wm1rqtvw9SnCrkjsEqNvmv6+3FB+HuN99gbxr9Qdm/pHfgMVwz9/o
         bfKL9AC4MoqfJ25THzGj63RUY2MtvaIVhtLvw=
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2032506585a.42.1795452523144;
        Mon, 23 Nov 2026 08:48:43 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2032500785a.42.1795452522527;
        Mon, 23 Nov 2026 08:48:42 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:41 -0800 (PST)
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
Subject: [PATCH net-next v6 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 23 Nov 2026 08:48:31 -0800
Message-Id: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

Changes in v6:

- patches 1 to 3: no changes
- patch 4: collect Reviewed-by tag from Nicolai Buchwitz, no code changes

Changes in v5:

- patch 1:
  - the commit message now says that mdio-bcm-unimac only provides
    read_c45() with patch 4, which enables the UniMAC case, so that a
    standalone backport knows about that dependency
  - the commit message now lists the callers other than the bus scan that
    see -ENODEV instead of -EIO (of_mdio, sfp, mxl-gpy), which is what C22
    callers already get
  - the vendor MMD presence check done while reading the identifiers and the
    reads of the per-MMD identifiers are intentionally not mapped, since
    they only happen once a device has answered; say so in the commit
    message and reword the kernel-doc of get_phy_c45_ids() and
    phy_get_c45_ids() to document "a negative error code" rather than -EIO
    as the only alternative to -ENODEV
- patches 2 and 3: no changes
- patch 4:
  - check that the controller is idle after every cycle (the C45 ADDR and
    data cycles as well as the C22 ones) instead of only after the ADDR
    cycle, since a wait_func() such as bcmgenet_mii_wait() returns 0 even
    when it timed out with START_BUSY still set, which could return the
    command bits instead of the read data or switch MDIO_CFG in the middle
    of a frame
  - the commit message says that unimac_mdio_resume() waiting for the bus
    lock means that resume may wait for an in-flight MDIO access
  - the commit message says that the C45 scan is slower than the C22 one on
    the platform device GENET registers without a Device Tree node (e.g.:
    ACPI) because bcmgenet_mii_wait() sleeps per frame until GENET's
    interrupt is registered. This is not worked around in this series;
    making bcmgenet_mii_wait() poll in that window would be a separate
    GENET change

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

 drivers/net/mdio/mdio-bcm-unimac.c | 162 +++++++++++++++++++++++++----
 drivers/net/phy/phy_device.c       |  50 +++++++--
 2 files changed, 184 insertions(+), 28 deletions(-)

-- 
2.34.1

