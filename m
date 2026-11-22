Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353545;
	b=GWqjs/U8QkvL72LUeMmiWt35JnZSKRsZLbmf59hwz5mCVEO4Vua7YgXd6Xk1T2/tWdQu
	 qxzd59XZ7jcEvAJPzYNF8qrTODfKw4hZ+9qeUDAQoRrXYaFmM6Gi7Prs4rB9LCRMPVf50
	 qmuZ7rFjd77IBVH7jiSix0axtItyOc3VxYIUkAbYDtr3rum6KYc+UeiljF8dRPca6tMwp
	 M6DD+zxQN8MScz5O1MfbFtIpbMPte+fplictUHDWwu8QknY6Zz72FewNbrB+2LpHU5Fzi
	 veGwiL3S4LAMqkQHliTl5fBc/2KzAhoOnS9gEeyHH8sSDaPw15dwOU1AgG7QFWQ8FYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
	b=2e3x6J/5csdY/rU7p2CsFhsWtv1HIP4H6y7hi1V9zhn/J3U7FhQCc2+AlRXBrqMvEF4S
	 aRlgadOCFoZRSNUPNRom3x9wC8QMTmsj1kWJdfgcftqV6hoAhCVqzPug6B1NJQ7tMeO99
	 SWmLBxXEqeqrFPTyK91xbT2h9g/xgi3MjssKMex98PdBHvyaDDIJs+QcWlMg+/V3wdmt7
	 nEcep4bL9OUlcWg5LPdBMa+jND0MFYMZanYV/WSs1rwBw67KU3YGkD3cAwS7Z+zFStSbm
	 X5N4gZUw/fT7BxVlHpolbijtJj1SsRmYqyOIgaJxOwpJ/siGHg8Xh9YK83gLCAGFAHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEBB606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEBB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3acd523a802so21810241fa.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353544; x=1795958344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=hVFVMHWLqX2IuGxnGPcTUcFvQXc3u3gzVUOHyRT6+uRwgnf+jlUlLRwhgwWNp33WZJ
         6ysfD6E0T6yGrY2xD0yhKSsPmTXQC2Muctoz41l7NxF2uUeOpJe5JduAul5xDvZ8f9t3
         jLNSHhH7x4AxrdnD+wUIyl1KCVSpyNp5HFVlZkPLaB3iIAteX0h1EbEIlPaJqnAp1OUq
         IIYAIPEE8uNeO9L8PIY55hTwMA2XKue7pEUkATtjvuFwfYSn5w4kNtW5CzDjEBClop9M
         IIhsdBxB/wLodKoJN7c5Kh4o2QywpbnAKpVEknheasWeEgteqhnqe8V4UE4PlmaprHnd
         qJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353544; x=1795958344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=r8LovGfsyqmh2RE7UbH5P53VtPpAc/Bs5um5kH7Jb3CxjOXkmoFyUWugvKhUtpY1aE
         y0WUCViVuRAgJZClh7l01Xpzrkki7CO7COabTOQ7vX2EgN4SK1yjY8VasMchW3DsLJXI
         rHlxT3833mjqoknp70/dpC8xTkXuoKogC065EfYIpLhherXyU0asS2xlgLe7q1L1+g4n
         30L7RwCsB9vf0JMm3GSm181YqJ/eLbyObtyx3A45Vxr/3qvXcJVbxlTkeLhQmv8JmcPK
         9Ah6G5s64bIr3MbLsmAm9iHL0IS0/idvtvuPLP5+r5LAZ8YnRzfuVYaLlBEN7JmX+L7z
         3XZg==
X-Forwarded-Encrypted: i=1; AL+hErGREGRJTI612l950yP6dg/yNk2sV5OpxPMxDZ+68rF3o5pBBOn4dN116SLPRifd3quMPxJ4M8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MoNfwqZUqlxO0ffTQDgo/FxBAUXI3vL9LzBerpVg2TyDccYa8
	2opraKeJeFTPkNe1Ioo1Gne0nWNWeVizisSEh4zs46gVg4PlhCQ3IC6Z
X-Gm-Gg: AZFdTZdBUmmIfsojOWXAvjXIrMDOUM6ZAQ1WpSM8swWG2fN5/QwI+2tP1c933EoW2gX
	zTefdBmvLPbkIdMx584dg8BuAELr4mEaflukHuRrVKQZiiCo+TD73uD0SC2NslcGSDHuJSeLdYK
	hc2+IclAUgl4MSWSu1Y2EL+tweqkXQL6Xm+H36qcYPUZeh7JB2t8pSagba39P4q74jOfCz4M3UV
	ca0NsUGPyfC98fLpiJJD7WAlZU7lW+q5IPuRtYS55eHtJ431Z+bMjaIIkodAutVTxPCekNvdnu5
	6nQeUuUuWjsrgJXdsOhmTSG3+BTJicdTirRJ+dZrrwr6U/HkZQNLK7/1uRDeQt8feV8xSjurXMd
	pZtjjizonVcEh98cAEjNu/9EC4DJeC+u53A7mXr364kUrb8XZf/DjPKtM7Tqq39J6WgW0QJ1bbV
	sH7MW8no/OLeQzyfZKJYIeglrywBLSlrZNGcaZlKnHc7iORCX0o/qCtwIDPxPqi73y0uoU7Z4wp
	08qV/I6dkV45ahCwZShF/UowrbbCMOpSNpE4cy0Ba8zm02CJDGI8viLMahWiJ93h4zp8hMEj0/M
	GSQZnubj4LttDOoTUjzNBdQDFdmwZg==
X-Received: by 2002:a05:651c:19a3:b0:3ac:e5ef:1b8c with SMTP id 38308e7fff4ca-3ae7f9de88bmr24914911fa.11.1795353543336;
        Sun, 22 Nov 2026 05:19:03 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:02 -0800 (PST)
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
Subject: [PATCH net-next v4 0/3] net: phy: dap8211r: add LED control support
Date: Sun, 22 Nov 2026 16:18:53 +0300
Message-ID: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 242 +++++++++++++++++-
 2 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.43.0

