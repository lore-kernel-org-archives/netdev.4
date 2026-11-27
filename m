Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761433;
	b=Fd3QRvG+SlVDr8hrxGy9IsH2BvUGKKWJsK0BnVuVegP1Fn91/EZcyQL0ZJ8zxA2GADNE
	 OYCq/MwQ5hdSTKtQz6Cbn85hHA4sgjQlVL9s+QD+Plx5yJ2PeQTnn7MRR3dRxsTOqc1ow
	 IVXvoEUElGdUVLd5qDFTuYoDyVB55VeeLWQMxe3EjVrE86lgUbUkQz0+tl0pjHd/2lyIf
	 aD/wem+sIorPVuKPhGCnSEq6gv9GLx6oSx17GRDGXQGEuqHbaXS+ar5lZFd/cZSZprk7b
	 GZY+/5/I5u9h++DKTeghcIdba8oaCm1w+Q1uciBVsTCjMSYa9j1L+ik+hSgDc8E+dLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
	b=r0KSzSqkjjxFmM/1n8cDZA/LURz+i3ME+4tB9WzY0qedS1vqE/w2S3SdRvnDTYNiMvMV
	 TgtHJOXhcxLT4BbwpYM2n0fMhNzxB55z7+ixdSzZbqcaFMfOUvcTAmEDzbPht2e/O5LfP
	 XTVpHybC4I5v+bIwE4PNs2IVBNNiRHWvaaDSs9PB61DFaCDyc4MqUD7B/WL6/vqkONTMI
	 fw1nGRexgI4K3lPJdkq0yKP0/PC+yddjuCcy6gJacUYLcsdvV7FnXghnzQhxugjP7ux8J
	 PUWGBxt75wkWFx+s71Oqb3mbMNGTLPavyOi3lD8DL6nF5JaDBKXGXVudJzoAx/lqJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoaSDGvG;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96258606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96258606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoaSDGvG
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2603267e87.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761431; x=1796366231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
        b=xoaSDGvGqXCDqg5ZBljB93k5S98112kC/0LcjC6NxoD4BK12F2WWjDmWHNjLyTbDmz
         DS+au+RiTIeiCrtE43m35ZEWD5gKDwss/1IiA1OhITOIAU4WbfrSSx7kfFFq5hwe5634
         w0neZwy4RC8jUAio8z4QoOjNrTdFXaSbm/VEX65skcJtyU8uyJGLwub4srPDuTS0fxYE
         JtWUPZnitwgRDMG3YXxbKT2G9F1y6lNRi+98Zee+KClbdgCGChdS3/yhGA+iSPtnjMwF
         B/HhblIKwfF7dq1m0gpyUSaLRSa6hVaUvEcbkn4KsmBsmYXzUW6ECKtCssAI7AaMsMaf
         fZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761431; x=1796366231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
        b=2knVCLbaILi7IM9E0ND7IN5XPgqWeGUjbgrxpau7AdzUd9ZSO3pWLnNl/V5UGiXTQP
         hv8hoyf+9lMByqwlJkZMlNkpenP202Ra9+XCANlrYliEhPGnkTXHVVKoQGi1PmZ4S7oi
         juWebM8SLxcghaI8QVcWOLC0NjF/6/z3nPpKzAsYCwBQk1vo5IgSGjc9X9A1ot+ug9K2
         foA9kCRPv2p1/owX6hx70+gSnXd5oCu8f2ud/VoZqMWS/0Mm+u9jMALSL4TP3ImUcai/
         Eb+wHZyJApB+MkdIcIX/mxQoPS8VZvjBFiSzv0anZRPk0S+NwgxXoT+zrxpw0x6KCeyN
         etWA==
X-Forwarded-Encrypted: i=1; AL+hErGd6/gtXItST0U0u6Od4jx4tBlt8UfXomhgpiBcs7lmuyqjKao85Fq1cQ+es5jTAbXGkDpTve8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tSsCtBOqkUJ5EUp6/jTXTDtbI+L8AJJZHGM1KsI43Yq4NaKaA
	7kZDuwwPLrRIwTquzs768d3xbOaJnxZOao7zEDD2Qi0lHLXTXOxbB+rB
X-Gm-Gg: AZFdTZdCdtRbesZ1JkAXN+1OzISkHQ4WRESU2XQAWu9jtppuZCHZjYDUvkBU3NO/p4Z
	lSe947UF86OugjWVTQ8tQIxxl5z1NRo77v7i6aa4Z0ox7b/CnP/uUYlAe8KJ7dO8rey4er67ccC
	52sF2WWrCGvVWDWwU8B1tgwa/CWxwMFFanlNPfbaPFbz5EmFCfv8qPETRgvt/+yDBC5G8EYnE+D
	zCkMZ8eECR+irIW56os+D/X9OCGJRqboyWURLKX3GD4dwS6CJrOlwec/ihP4PyYuXwwHS3dN+eg
	CfMwJnyvhXc9t23sOT2j/ygF9sMpYJOs80jwH9NPRleiEdBQeDMMj7bPwfoZNmX/n99Ed4gGr1v
	sn/OvRCYu/WoY6U56iUaPlHn3eK8ejiB+Jc4e0bGJuTSq8wDjTP8us0c0e8UyESfb/890I4lGsJ
	HaNkf9SivYdgpVhRZp6jRbkS3yqynpDLHtgxTyoFIjn3/q47vsjul4uEescr4ChgtRCb/55W1Kc
	tnC0DVN/xGv5JYGHnyT9mSuBGIjlegzrKowGO6g5iA52jSBM0qMDFPpXRO4b2743XGJ41tUOU11
	xHZDmx8yUtrHKiG5fzZmshEltTrA9A==
X-Received: by 2002:a05:6512:1081:b0:5c1:44ea:cfa6 with SMTP id 2adb3069b0e04-5c1bc7bcc56mr7286636e87.18.1795761430529;
        Thu, 26 Nov 2026 22:37:10 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:10 -0800 (PST)
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
Subject: [PATCH net-next v7 0/3] net: phy: dap8211r: add LED control support
Date: Fri, 27 Nov 2026 09:37:02 +0300
Message-ID: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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
  v7:
    - Add clear LED_x_CON in the dap8211r_led_brightness_set() function so
    that stale settings do not interfere with clearing the FORCE_EN bit in
    hw_control_set() when switching back to the netdev trigger.
  v6:
    - Return -EOPNOTSUPP in dap8211r_led_hw_control_get() if DAP8211R_LED_ACT_BLINK
    does not match the presence of DAP8211R_LED_RX or DAP8211R_LED_TX,
    preventing incomplete rule reporting and register clobbering.
    - Link: https://lore.kernel.org/all/CAOPX747OUSNbg2vqba3LL8r0chrTdpz6hOg1yf-n_wMX+fpQag@mail.gmail.com/T/#u
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
 drivers/net/phy/dap8211r.c                    | 272 +++++++++++++++++-
 2 files changed, 311 insertions(+), 2 deletions(-)

-- 
2.43.0

