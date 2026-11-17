Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915880;
	b=PBDSK7PlxLV2+FSBFC1UKGjQ2iPketzLfwQ8wa7r2szR5LFyI7pzKyxXgrtNjlVsyOCo
	 qE1vD9eekeEvn9rz+/eAViSF1R1VHhpqT53suUucDvq1iziCR5mwH9bAYLTlZgVkNtf3w
	 b2uLAc2sLpb63BUH1RxvVUTSVfP6VZ4S3Z0PtHodJkt2Key2HuN24TVY1jgcSd5Fuur/m
	 GsMLm5UenlMceTWTYx+2XXYPXglQl+MT5NjUW1D9+Cn0UNKXaFQw0TfIZ2cETtSMBSa76
	 2iy9DheBOHlriSEMTv/lxqlldLN3nlynl3HhjjP9KrrO/S7tfMqYRyKGNAnMNGaoIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
	b=h3NZygP8CHBp5IweocGN1Xzg1ddZBmY9x4NC7NfH27mse+e+vVrf+2h2O1aWIDqztFWX
	 3xxjdErPpHSOJBXC291bRc6qvKuMBlH6Cy7m1XznKNkTqCDaSzlvTCpJB+zSSI0dkL9+u
	 bd72RPWZTwqvpJ/iQ5XNvZZ7lfwYzoJ0GJfFf7lINyX/92GS8Wq/A9D/9ZIh5ea/VbXor
	 mO65Y3kcTZJnFPN+YbLRjG0d8415KqAOcJqBZKW85R2uvD4E0SqtIhgy9CNdkJI3jENMt
	 JnxO0rwDzhXnE0X3zTyved395ASYnoE6WejxGRyCsuhvG/69JL7THEAJd8174HbJuOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DA606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso39992931fa.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915878; x=1795520678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=Bb9NC1x5OLMj6GYojtlvhpg2bGM9QkVVZ/Nuze7fFvnPSyiL3TFFk2hjQ5LFSo5/oS
         AnE+Y2WaF5Sg2oRLyvYJldA7T1yXNiUO70MnKqvfH9EXdNc1QGOKS0nRLWyihPRCBmB+
         hHBuPTBFHDRVRVywd9qEV8hRwZPZKWPctrsmSgAxE2nIA6aODanvekNhMQIbqhlV6oBI
         8U3LzEZePp10oSkctiV/9ScXs2dMTD7t6Zj6S3UOcHWbe7R8qOOmrCG8KMM7qCOZt6qm
         lhZBvxEg4WRGMbBij0PyRjtLXnQk3X58KtvjIT4fMLMdyP7EB6dbcqw3BDBVP1zEVeMn
         B2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915878; x=1795520678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=r+urpagNEB6D1Rfyf/A7qxlj0sTlg2o+LzRp8kFjGgNJvLRQ5hQ6sQuFOe9iKIhKbE
         EojoNooAflIMH3hbpm57CqnMFTRYMIyjV4mtX5npmnRC9H7Tfl2tqpwBNs0DB8KF46gh
         bbiN7kA4tPZekJcb+lNqbUb+OQjL69/WCrwzLh8lJnzYKT0gFYAxlPkUSx0cKa1xFy+l
         jlvzMOo4qHheaw393p8VeNQsUtC7pnD1vhKpwC8E2WOOkjwxej9aG8LFbhtwSVC3az5t
         w8dFfiyCboCKybxerGAAAK85w71Ru3oYsKSNzCFOWpsIw/iN0JiDvCSOHrTExdPWeb+s
         dMfw==
X-Forwarded-Encrypted: i=1; AL+hErGtR2xsftMiJJOgPFYX8z+3bhIjCFj/i6r+fQE9jWXFq9SVhkm+VXdvQXf/mmadYQBCozIoGns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wgAJSljhtL+a0TuCNkiT+jbUrqtkscNyeuIGV/GfEwWP4t4Lu
	kCUACyzqy9HSPYydGIsJMApvhWwxUqB9jKnL1iqIlPoh2Ef/Oz9NpLNp
X-Gm-Gg: AYBFou0LuL6GV9jx7XI5z5lIGrVDncLsSMYSe7nTOKwABCm1ecjDzZGaEOBfGjcu4Af
	0IzwAUNTe/M/mZ0uvOgeM8Ks+vfwgTWArVvSy2Epzh0f3PSs8aPqPrWuGJMfp94zpITljd26w6E
	Qy13itD9fAKN+hFhQsCGvNK1gItGGWxe6KMQRPfgHCVp2w3ByZFaggiOplUP7OzLpiJUj4uUJl8
	ebC8J8y5/fjQwZJpmsmKN3W1u7r5gAyAAy9cpDB/zpCYvAuGekonMh/eES8ZgXC5waHUlWwaGug
	rr0UlgcdSjoHFlAs58oKDfmJtE66iQTxrDDVv7Y15UNhpiPu1auiz/CLDrDw9FV2wb8jnH0u4XK
	UAOSAxz6k06VGaoHrEJLTjsF5QDYdAKPB1HmCE8RjOIAkx2tDuCblDFp07HZ9rsmZUtKKNLhPfb
	IQaGbUDiyuD+Q0KrhDsqOuhPhOCwy/Sr2BWxu2rn/ZvRwltAmPPr8iQi6JVBt1hyZBji5aRQSyL
	f+hLWx1/8wbe30jwIjlwBfOLqIGco+ptlzPHnhXy5QjoqYHyC+ZqJDrB/ulg82VcRG7yLZfVbDi
	M3fYX04J3DACK903MwHaNNDrNSoslVACSXEVMepFUS1n9fY=
X-Received: by 2002:a2e:a105:0:b0:3ae:68:d07b with SMTP id 38308e7fff4ca-3ae2b5399b8mr37245611fa.11.1794915877954;
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
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
Subject: [PATCH net-next v2 0/4] net: phy: dap8211r: add LED control support
Date: Tue, 17 Nov 2026 14:44:26 +0300
Message-ID: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The first patch fixes mistakes in kernel-doc comments regarding MDIO
locking.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. 
The fourth patch implements the LED callbacks
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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

ChangeLog:
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
  v1:
    - https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (4):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 243 +++++++++++++++++-
 2 files changed, 291 insertions(+), 2 deletions(-)

-- 
2.43.0

