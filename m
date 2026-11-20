Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203815;
	b=S1FMpqshZ+x2oiFlLjc+VN83RdoEsY6MkVunbr92oBCOmlM8lvFqzxRm7Y+Pozo4d1jr
	 No/mqSm1w15Zb+1VlUgulZpB28dFhJNDLCWopEYt2Y8xHoy4Et1+RzKYkkH2D9Y2y/X3R
	 0cn5cpkabWjiWs3J+pNgb6QQ54Xptr/RFZuhsdRGgqOSrkcWT36g66RY6Ehu4l7vOZFIG
	 3orgR9AsuLXIRQZYNRd/ca8jkjZi2Aeyfuca1ydTStC/F5skhiryW6oN5sw+itbYsuomV
	 D2pF0zE5521rWs7T+/2V3BzkiwuI3Pwzh3pSVUI7ZY7yQhwHeE6sELmauLWiNL6/OVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203815;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bqfxo02cv7XdOidoPvshJk+rCtgTOdkCm1Lgkb3y+RQ=;
	b=UPIPcJLfh1QyZ22Ujxlv9dNXNTVY1FRmCkqJNvHZoFng1UfzoWuuVHKlK4AGcQ2aSM5B
	 hBu5Pyn2GpPdXiKI/8XVoxMOJimZ0HhKQ00OlvvjrAAgyq70mlovanPwjutLt5vYy1mSw
	 HTlgbL81rzOVh6fZ53qoXVD5gMRkiILGWybbbKxKzEUaLwKgGaPjWFsyIYg2KuJAsfUSj
	 aIgaJas9gCvaP2D4arXEWOPa6PotZ9ax2e4XNgg/feiAf3pcxjjzHzwDEaN/zJotK97NN
	 qJY7N8KV/XHHc6i+4BgLPufiW3dmZcwTU/X7ZYgXmxXGBjDXg+p7nBrHVGcyhpamalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXZl8cYv;
	arc=none smtp.remote-ip=209.85.217.98
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277C606A6F7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6277C606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXZl8cYv
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so390520137.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203807; x=1795808607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bqfxo02cv7XdOidoPvshJk+rCtgTOdkCm1Lgkb3y+RQ=;
        b=QQJMp7aisKOmN04rxlaOQnUcRtdQX70IJkGmKVnMdFn6BWD65V0pNKVOTQeA4GSpEM
         gLOJaf81MwPYYf5wnT1isqXEfEy8CZAsCRS5RAQmRaWsHxuPUyAI7HInLvrUE0tEWvjW
         iOWIGIhwjapkyyelKXO8XQ4SN3xnLj+AImwr7ivS++gcSlk46l6PLuEhtwcOOnUvIpET
         3xgEXs92qsRYoiTidcxrkOP44ck3P15YWU1rhqyUiWpBKRXb3Po/nD5OP09PIYOb3olg
         R6Uv/FvUk976onKrq2ZP/p5TQ1bAbddyNmf+z6wzSfmQQymBUtqJUSZO8ui4ZBhI7FwK
         /fcQ==
X-Gm-Message-State: APuU4Z9rTtICJFKI2fai/NhIOdn1N6rajw3lk3qm82JGBRyiQg3FAsOV
	UlatUOts9suK1xn8tjaNRDutlUZr0h0ZwFLwbOWVgo+/ps4F0AahgZ9cygRteBgaorfPXApVJED
	snRmvPya+dnXM4D05T43h6iNPADNkKdviPdxh/MiHs8zbKlWfL+Fo3qhLDg7oVMqof6z3q02950
	3Fp351QrtlfvjT7Df99ztDs7uYZukvwIzkXC5tH6TbDHU+lW92qBJJ6W0SfTZEmDLMqdbUNS/Gw
	MT+nzD2u0OZUDbJ
X-Gm-Gg: AZFdTZf8+CIHHx52LN1kEp6bY+9S/AjRTHpjJbaNQh69z0eHg5WyoxBaORISH79czdH
	eVTnDQes3KTFFeSyxECq56ybZ25d134kt+hglMkceXFbug3tOELWGLSGxDfrWo5idwvCdnpNp7C
	ccHs2mhtYBWFwIwzI5rlqWaZ5mF27J/cY3ETcpxYqkLy21+O0Q5SmCU5r6Ru0JbEo4w27KvFowR
	fyEe9O/TedhMni00w6KP9uc4LzTdC3GLtIX9rDY2w+sGk2AUT8uDA/1/KYUeqffHHdVlYeDyFnI
	x84Ik0iOdXl89B9MTBhhGUIdNeQVwLAuVBP4ywlAvqZkHYQkPrG/Q4PFWru9HwFiGy6lARVQaa/
	TmQVQw3zNX8mVjhpiDg6yTS2ICuQN0BMYhnLrlnZex/89mfzD1mBVoa84ZkGbyj4GlQaQmvbZK6
	AO9iEP0aqVZ/DPNNIjSG9JV1rWQItbOfH2Y2CLTtdQ
X-Received: by 2002:a05:6102:e14:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d7395922b0mr1992085137.19.1795203807221;
        Fri, 20 Nov 2026 11:43:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d6e7f48cf6sm34331137.7.2026.11.20.11.43.26
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso25748596d6.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203806; x=1795808606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqfxo02cv7XdOidoPvshJk+rCtgTOdkCm1Lgkb3y+RQ=;
        b=WXZl8cYvpFG8cHc/xUx0t/1emScPnxYc00xEMCYEFq9BLWlV5KG62i+7ZMDa/G6tIK
         lzBvbLllUfE3Tb+DvEMTzKJqo0Owfykcqy/C9hORWDK3IzOmQ/z5gVmkVAOg4feAGmbf
         S79sFD+la3wjTDGuHYXzANkGurNEkv4XbXd0s=
X-Received: by 2002:a05:6214:80db:10b0:921:33f4:2d97 with SMTP id 6a1803df08f44-92134b3ffe9mr57108496d6.36.1795203806461;
        Fri, 20 Nov 2026 11:43:26 -0800 (PST)
X-Received: by 2002:a05:6214:80db:10b0:921:33f4:2d97 with SMTP id 6a1803df08f44-92134b3ffe9mr57108106d6.36.1795203805843;
        Fri, 20 Nov 2026 11:43:25 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:25 -0800 (PST)
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
Subject: [PATCH net-next v5 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Fri, 20 Nov 2026 11:43:14 -0800
Message-Id: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
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

