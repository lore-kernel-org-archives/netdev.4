Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.80.171.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015130;
	b=VUsi9BJA4e9QP6cAq+PckZu+xNq7/4Pn7vmF/+tGF5edTiBKseH740Yv7DhFsulVlGri
	 6kyoSP+uPftrBEuaDVEaUkTCEOxfoF7gG+9mDJSBfcMZYJo8/kydSEH8mU8PrgMmcVLEK
	 UajSAoW21dlmrk9bqP8X90a/yjSbatF9vbcXE1D6USQchCqudXTUmJ+H0udOIdMyKmEdI
	 9H7WKhKSRZYh8XJNlOBKVcA5nuXJn+1Z2dlRW5mLNH4M/vyVPpBwOdXaWKitu/VOtfeGd
	 v0tOVPYnVXPa5aw4Kkdx4HU3qvubFsBGiR1Ucriai3o8c/dRNmYqd6gfVzZiN5Pvukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015130;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=87/G7NYhRL2kitGkKd0g1i85DRo2vK/WQx+jWKZEx+U=;
	b=rWwyEv0MhNiua3JBzZN1CUnKLKGnidz9zXXdb6Gh/YEntMgBlDUs4DHzEJS1OghVLBL6
	 A6NYTilh4LjhG4ueu5UKtzXfWuNRGSSBUKceQaonIe/pWqw8NO9FPydshrXzfeS8miNYG
	 PSFnLZWIvY2lzUKna1iJEt7AjqJ2qtKuQonX8wNy+ot2fLim3wKxgxgnfb67qx27YXTfL
	 tj8P3OfoLmChfGO6bQVLhdWUombLESQn9H+8g+j+qQIMukwK+HypJnV+anKq82fL6MNBa
	 t3s3b+y2u61BWyAo7nhZnzXK0EJioNPpdjzWFyMudixzYYC7zl7In7yExq8eAI+bOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=letteboer.com;
	spf=pass smtp.mailfrom=letteboer.com;
	dkim=pass header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=IZ9dJUB8;
	arc=none smtp.remote-ip=45.80.171.131
Received: from albissimus.dikhoed.net (albissimus.dikhoed.net [45.80.171.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B05460A2622
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B05460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=letteboer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=letteboer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=letteboer.com header.i=@letteboer.com header.a=rsa-sha256 header.s=dkim header.b=IZ9dJUB8
Received: from [45.80.171.134] (unknown [45.80.171.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by albissimus.dikhoed.net (Postfix) with ESMTPSA id 20AFFD2938C;
	Wed, 18 Nov 2026 16:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=letteboer.com;
	s=dkim; t=1795015121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=87/G7NYhRL2kitGkKd0g1i85DRo2vK/WQx+jWKZEx+U=;
	b=IZ9dJUB8g/r4OrhcG19Tgt7H3Ih25VbsAVNcascUYTaDd7CUDdY5RIrBOLB3LjOt8C/7o6
	DIlboQW6MNY0pJm8wT+EmKv2ywzp/JKCdyeNqYfvn0boaOj5zM+fPq4vDKFq/SSBNQ/eqU
	D0Gd6U6jA5fh84dVHcOBvedQ5CQP/gQ=
Message-ID: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
Date: Wed, 18 Nov 2026 16:18:41 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: hkallweit1@gmail.com
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, andrew@lunn.ch,
 rmk+kernel@armlinux.org.uk
From: Frits Letteboer <frits@letteboer.com>
Subject: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come up in
 7.4-rc3 (inband/10gbase-r)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Heiner,

Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
stopped establishing a link and generating interrupts under r8169.

Hardware details:
- NIC: Realtek RTL8127 10GbE Controller (rev 08), XID 6c9
- Transceiver: Intel FTLX8571D3BCV-IT (10GBASE-SR SFP+)

On Linux 7.3, r8169 attached the "Realtek SFP PHY Mode" driver and
brought up the 10Gbps link normally. On 7.4-rc3, r8169 configures
"inband/10gbase-r link mode" via phylink, after which "Link detected"
remains "no", no link state transitions are logged, and zero IRQs fire.

Tested workarounds on 7.4-rc3:
- pci=nomsix, iommu=pt, amd_iommu=off: no effect
- Realtek out-of-tree r8127 driver (11.017.02) on 7.4-rc3: works
   properly and brings the 10G link up immediately.

--- dmesg on Linux 7.3 (working) ---
[    3.777598] r8169 0000:0a:00.0 eth1: RTL8127A, 8c:a6:82:71:89:12, XID 
6c9, IRQ 152
[    3.777601] r8169 0000:0a:00.0 eth1: jumbo features [frames: 16362 
bytes, tx checksumming: ko]
[   13.540664] r8169 0000:0a:00.0 re0: renamed from eth1
[   34.179244] Realtek SFP PHY Mode r8169-0-a00:00: attached PHY driver 
(mii_bus:phy_addr=r8169-0-a00:0, irq=MAC)
[   34.871337] r8169 0000:0a:00.0 re0: Link is Down
[   35.053740] r8169 0000:0a:00.0 re0: Link is Up - 10Gbps/Full - flow 
control off

--- dmesg on Linux 7.4-rc3 (broken) ---
[    3.806559] r8169 0000:0a:00.0 eth1: RTL8127A, 8c:a6:82:71:89:12, XID 
6c9, IRQ 152 (32 total)
[    3.806562] r8169 0000:0a:00.0 eth1: jumbo features [frames: 16362 
bytes, tx checksumming: ko]
[   14.285134] r8169 0000:0a:00.0 re0: renamed from eth1
[   34.926923] r8169 0000:0a:00.0 re0: configuring for inband/10gbase-r 
link mode
[   40.505158] r8169 0000:0a:00.0: invalid VPD tag 0x00 (size 0) at 
offset 0; assume missing optional EEPROM

--- ethtool re0 on Linux 7.4-rc3 ---
Settings for re0:
     Supported ports: [ MII ]
     Supported link modes:   10000baseT/Full
                             10000baseKX4/Full
                             10000baseKR/Full
                             10000baseR_FEC
                             10000baseCR/Full
                             10000baseSR/Full
                             10000baseLR/Full
                             10000baseLRM/Full
                             10000baseER/Full
     Supported pause frame use: No
     Supports auto-negotiation: Yes
     Supported FEC modes: Not reported
     Advertised link modes:  10000baseT/Full
                             10000baseKX4/Full
                             10000baseKR/Full
                             10000baseR_FEC
                             10000baseCR/Full
                             10000baseSR/Full
                             10000baseLR/Full
                             10000baseLRM/Full
                             10000baseER/Full
     Advertised pause frame use: No
     Advertised auto-negotiation: Yes
     Advertised FEC modes: Not reported
     Speed: 10000Mb/s
     Duplex: Full
     Auto-negotiation: on
     Port: MII
     PHYAD: 0
     Transceiver: internal
     Supports Wake-on: pumbg
     Wake-on: d
     Link detected: no

I am happy to test any diagnostic patches on this hardware.

Thanks!

