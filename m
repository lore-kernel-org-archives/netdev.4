Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631869;
	b=XmPbr8EWGF3NtbuUQLelS9+NbKONhWCVpDVxmz6OrvTBTKiI7nHg6CiUDMDJWz6TstU4
	 jJ3KfDyXfK6TyE7bGqeL7VnrAoU9hVMZcFVg/RZGQwq9D0xJtiI8Q3ORXhWbtqyCkZU8N
	 C7P6+rz5tqSzYDSD6YIT3ffPMR/OORmZpyYrOdEf93htIdA8P9L6jAoTfUG8YAWB0QWz8
	 Z7ioAL65pLYOEo+B3vonmlUaZRZI+56IumbSBRB6RPRjB+tvnXz56fcveRtaBz8Z1rlkK
	 U9Wl24nGxJ3XAsFjyLnSCFnP1LM/zVqgHkQeB7koXINogF+Zb8R+aJSN5h5Q/xxXt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
	b=du/YM3DFcOteUZ47G8W07IrldaW/I8Tc6Ie8/NBFdp/WPohW+l1ZrYi98jMo6hrD6fLS
	 7AL7WKN/9dTTj90h7TRfV8Sx8acvBL9O1Fky20hpjr/RS/wnWatLcR6TXLO+NrhDagxG7
	 BAUfEWn14lGFKACCOUIuJSRznKI6CFabS5v87HUqCf3h2Yq+jRjMTx+n6BXpjzwVmbrQm
	 d9uJ4ar4HTOgC2ltg7b85Bk0rOuMFvA9mn9NOXzcjpVDiQGRMWvLsIpiJYj7Ny/IWRsyg
	 2MOD2s0tafVNYUKQszcZukqE+akqL7k2P/YPJ8IFD/IxfpbbZA8CK7xxH0d/A5eqjVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91357606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91357606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ace304021eso59275061fa.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631867; x=1796236667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=PB5MIJGFsSGsLnz/41wkgUtlP2knNJBhBc4t3c30++a/pzxcSozvH6zFtS0WbcTzx4
         miR6zzP9eKDqvOGNPLKqMKyhsXIyF7PtfEVS61tELJ9fWv7+oY4VZdoxOtYQsocOkzhC
         tCD6DhrsCOJf+c69+3iDF3O2awLsxADq9iwbqzk1p91A8GTqp20mI9zYjJMLAT27JQv/
         W9LJkUpvQ/mRfWRIlNkzfa/xWdFU6rbNk9m+xOzh6OuKLqXlJk/ibOEnOVmmpdhQYYMp
         ts6X2S/KulVHQhGtaBNcmudaglk9aHsSDxlVBSw8r2wJNH5ODXb6sFZ51+YDB7NiGAsi
         scCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631867; x=1796236667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=QcYwhQah8rRLR1fScc7FLHBdvP4tB6PwH3xtj8qvaodFq2ydD2+9ufs/x134aITGOI
         yd2NQO2tRHPbXnmBDPaOGy5Gmj8iHtNcWdmVIZotJ+Kpz6xJULv/pJZ1XUnhwSCD4T4y
         S++H18txeHLJZVDqyntoBcqiOX3IV3VtFejEBaPgt1Z7Fc0BA8yYscA5ZNX9CuhOQb+1
         pToGHB6BovS0UX5A1SpQLq2dLNoi4J0vV0ZkAjqnPybqVgSOyBoC73eANGiLo8qMCDRA
         x0d5d1pFc1RCqpLLxG2S2Zu4wr3uZgpBtZ3uXh0Vo1xvRNY4xkgyvydDqYiAIEzeaxO+
         jPDA==
X-Forwarded-Encrypted: i=1; AL+hErFgCNC60UJZnZhQjuF7DbzFOgG3E3XmF326qXxPqVVYa2uT6DmlGoRUFUyjdTZ3sDA+04LQ2M8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cKPDO9b8RvKyPsE34JnMu+m4EDyniG4zuKwAM1ezu+NeRF4VP
	vTlbCsBXnzUMWzmy1v2Poyb8Nj/BVFyghM2g3+3kBVoPHN6yrwMTkbTf
X-Gm-Gg: AZFdTZccLhmJWy6ViB8lrSJ5g/TBYx4x3OnzQ44sVP/BU02uGBMFPuRIAOZKY3igaon
	oK4YRMg6XgMtd8FNUnjzt9MwEkDAew3L3c6M+59x4aoZNZQB1le5rLmqa2hg/Dkpg17x2DuXyRy
	YHbs5z4eEdCzWEDFpMRi43ttP8f+xdiimym8HLzA+JFs4fZtteO3hhRQOmTAaTGntXqDT05bzmQ
	08LhWA416NUygh+E9us0Q2oe+7zkWyKfjizuvCtr0VKY8Ihn+o8Bml32R56SI0I7nv4rG5KXh+J
	npYjwBzzxbVaMWvcop9NMM+Ml8S7AMF8NNtqiNfuz7XNikpS3084uUBf5q4lgwjHCyZJ5gfukN9
	W9fu03SEPWmfoh2I8x4KHAqgC5e4Q7FjclAClg5GAiDEgf0ZN89UZszPonbM7tI83N0JJ23mkN9
	eyGLhI9gG3e2Ro6JW37ydIxUONffc0KcuazUoY0Z+NUwbVSXbAGtQwo/grL1+aiuYlkaIBbrVOO
	XK8cK8ahPKfILt3NE0pl+pj/5xyLI0jqQAr6QLpmFJ/xFJ41sd302G/h+xZ6sVApYpM3MWSeLE+
	ScNzbCKz4U4SOJoBgzeUXtlL4YfXYGmha2sEdJ5TE6vzw5Y=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id 2adb3069b0e04-5c1bc690966mr5240993e87.1.1795631866318;
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 0/3] net: phy: dap8211r: add LED control support
Date: Wed, 25 Nov 2026 21:37:35 +0300
Message-ID: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This series adds support for LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch fixes mistakes in function comments about locking mdio.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA and implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dptel,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dptel,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo netdev > /sys/class/leds/stmmac-1:01:green:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ echo none > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/brightness

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

--
Best regards,
artem

ChangeLog:
  v6:
    - Return -EOPNOTSUPP in dap8211r_led_hw_control_get() if DAP8211R_LED_ACT_BLINK
    does not match the presence of DAP8211R_LED_RX or DAP8211R_LED_TX,
    preventing incomplete rule reporting and register clobbering.
  v5:
    - Drop redundant $ref to common.yaml and inner unevaluatedProperties: false
    from the led@[0-2] subnode, as they are already inherited from
    ethernet-phy.yaml.
    - Move write of LED_x_CON first and clear FORCE_EN afterwards in
    dap8211r_led_hw_control_set().
    - Report TRIGGER_NETDEV_LINK instead of individual speed flags in
    dap8211r_led_hw_control_get() when all three link speed bits are set, as
    netdev trigger rejects reporting them together. Based on [1].
    - Add checking of DAP8211R_LED_ACT_BLINK alongside TX/RX bits in
    dap8211r_led_hw_control_get().
    - Add -EOPNOTSUPP in dap8211r_led_hw_control_get() if unsupported
    hardware bits are set in LED_x_CON.
    - Link: [1] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-September/1172246.html
    - Link: https://lore.kernel.org/all/179560033613.3135.13122318439070700886@kernel.org/T/#u
  v4:
    - squash extended register write helper into the LED control patch to
    fix netdev/build_32bit, netdev/build_allmodconfig_warn, netdev/build_clang
    fails (patchwork.kernel.org)
    - add andrew+netdev@lunn.ch to Cc of dt-bindings patch to fix
    netdev/cc_maintainers warning (patchwork.kernel.org)
  v3:
    - fix kernel-doc comment for DAP8211R_LED_FORCE_MODE_ON and
    DAP8211R_LED_FORCE_MODE_MASK
    - use FIELD_PREP() for DAP8211R_LED_FORCE_MODE_ON 
    - Link: https://lore.kernel.org/all/20261120081106.2919010-1-a.shimko.dev@gmail.com/T/#t
  v2:
    - add a commit fixing kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
    - move LED child node down below tx-internal-delay-ps in dptel,dap8211r.yaml
    - add blank lines in dptel,dap8211r.yaml
    - restrict LED reg index to 0..2 and fix schema properties in dptel,dap8211r.yaml
    - fix kernel-doc comment for dap8211r_write_ext()
    - add LED brightness (force mode) support to driver
    - remove rules == 0 statement
    - add TRIGGER_NETDEV_LINK to DAP8211R_LED_SUPPORTED_TRG for dap8211r_led_hw_is_supported()
    - clean up switch (index) statements
    - Link: https://lore.kernel.org/all/CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com/T/#u
  v1:
    - Link: https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (3):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  41 +++
 drivers/net/phy/dap8211r.c                    | 265 +++++++++++++++++-
 2 files changed, 304 insertions(+), 2 deletions(-)

-- 
2.43.0

