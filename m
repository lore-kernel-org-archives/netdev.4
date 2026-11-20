Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151854;
	b=FetiuMrlUcjYv4qXJt19GZ9rd/261sp9atGjsNAVoPtznR2M5505hK36IQ1Lc7DraR79
	 cYW+wS2nRqJI0WdNzuD49ER0t6eNVgR+5E6azlQQE7+ReLnskdqJu5lxt0SQ5MG69Slzf
	 4a4j+wahOnYgkDFsKPK9CCEBgTDoBpouqQXFtRua9UR8FMjvXQWSlMaMiU8YPsrbYVoh1
	 YndT85KPEaEykSfXin4fVAhQImd5YlcQiDGVCKH1gN4v/ww1jf4CtCxshOuJeBTovJOkD
	 yjdklTwtTbhstsSWH4+lsKPw1hspFltRz7tsFmn/QHBVoO4vagq7fsYof2wXNMzorUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151854;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
	b=KPXaAISxC5skBUwWw3KSAUXKIOFb/WGS0AJWRPEhpbkkn9jmKoLpuJu6LEsEQCUDzAiS
	 TEyFrF9SPg7ltFXf3DYBmoW5yUh2VGvdJ6MuCS95mZZELyaioQfu7/FXGHlBygLmDgmdJ
	 mEHhnbKUB6z0/dWMtyy9nldctRgcrFjLF7BGv9AiDP+Atb86saembhZ7tp1TrEKbDfjk/
	 dn5v6dx/L0pKsjoqKQyVbjipM1RFe7SAHF5fyWSUKKaateladRhbidVT83A2T/Cx1DvnA
	 YZdhEqCcEmzI9X8RktmXJwzb065uvGorBZbsikY6C8QR7W23v7cgLaCacpzNJNc+YBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LFwlnMt4;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73190606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73190606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LFwlnMt4
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-382f4710a17so800931eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151853; x=1795756653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=liG0mdlfQe0keLR2XK6y75UJW+LOS3tbHOTCa/MA1KzAYiNuDEJGmTT4JIzP7AWwox
         0jmid72224BiUMayPrf9CS0YFkSO8yjU585SG1b7MhkkIS872zY99d+OKHm8pY5T+mCw
         r4lFH0UVUthWeT/vbDew8GAhfp+fMcRhvvSJV76wkFOmHV36GPRmjHAYZSQgFTGRKI/0
         d0dQN1FxPmGXHneqXWbL+XgmQubcniR9QMp+SVQzjcQVDMgwZsPSlaq7AXDZSi55lwpu
         t293L2zqjVuao9HQdlVXQbTEcrb3U9Men5wx6Ew3guv5ahMlUtKWDwc0W/4KWmTMFTqm
         9SnQ==
X-Gm-Message-State: APuU4Z/q6VpqaViN9IjL1m3WROjr20+YAXz18qgv1YgA9cxkdPkJY2No
	plNJDm91zVT88ZVfYD4sx1KZ8JS5wpZmKzBFdVZ50xITYnWqF2+b8b0JibpQlNI6KsnQTy4u4JG
	jfaEc+b/p/wVmjNoEHlg3hO5ps59Cbrn/r2GO4/l4lp2GP6REpzPK31gJVJS0mxXVkg2muuHdlo
	2DR362Qf3BZBon5oEnEBxlb8t1YosdocaWDnMQZCxw+koy+QrqQlmhNk/DL7CXF2MxBC1y4Oxw7
	HwIntATZXF58kg9
X-Gm-Gg: AZFdTZdjb6kF4pDJgJS1JZk9KfbaqiT+fYxvIzxhe/Uf1kUQzaz3nh82NK8SZGE/JPK
	ttGroV7JBfe6hJiuZmMCy56++W1e/EB6D8AfJQAdJMZRrtIBu4IOfZYc5XD89elf2PxmGfCpFJh
	vJl1szwRfLODMZA7FNffNGhIMr8HrEWEoJwQvvWyuozlLF2sL7zi0Dfgx3j9G4kXPmT1liIFUu6
	D6JIV1mJ1h9EVIExKir35oKcFQVeSib82TUL1iJqIu7YSjWaoQpGkzWpNv38k5pM3+URullHdRb
	PA+lum68p9yfBFJAWuLP9MZPjhLXna+zeJTLvY1NgGWxHYW2j28qv7cVPGig6oP15Ga1GuIoup3
	aLWcXmQ0c+sSdPJ3BDbDWl7Rmtt/VlUW/rvqR54pe+Dgmld4p9ZWmoyozR4LS0n7ncqVIjLzni1
	yLqFd9nJzhKzCCN7Bqnieec3tfxJf9Kp86bhsLoZO+YpE=
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr1581950eec.28.1795151852745;
        Thu, 19 Nov 2026 21:17:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567caf176sm152371eec.25.2026.11.19.21.17.31
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55b9c13273dso9795971cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151851; x=1795756651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=LFwlnMt4ZCjyfNo9qi78roBUqjDuSkvpLh/asc0zO1RnvMAM1TwthUOAs7OaF0Xtan
         13X60a7NfwkaB/k4o+Vfedy+8sNpGrBpdExzI3qsGcDgvekUjaRDTsjBs1NFE2uBoKiv
         esBR6/ZgDCOyLWAUFwuOsj+vQitOHB3ESY5q4=
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr297723185a.81.1795151850735;
        Thu, 19 Nov 2026 21:17:30 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr297720085a.81.1795151850228;
        Thu, 19 Nov 2026 21:17:30 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:29 -0800 (PST)
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
Date: Thu, 19 Nov 2026 21:16:49 -0800
Message-Id: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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

