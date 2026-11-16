Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853249;
	b=vVXsiEORSuQ1W8oyv5g4A6YXQd2sXHExAaUStd1ewU8TLx/0gBiR/bjoFZGwMB+5w6He
	 J6DPkIJtVlR7+mGJS7JOizEByn2+Eh3yftT7+JflWqeppkfs4RHMYdiMX5HZvF89rJMNU
	 BnFIzMM8Us0rX8/n35YIxmgdL5SpXd0dMBMI1XYWxFtuKEH/p6/R6MuaOTaE1lnojFmj9
	 ARoqqp0HNwaOp0IHXXty0+7dwqvcIQ8Y6mif5tZCa6uwi4DNvdNobBFKSvYssKM29NsCM
	 UOQtTHgN3FRNvSwMPVnAixwzmI00DrMXedfWX9IO3Y162/bg7/qwJmA4q/v7a4P5iQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
	b=1O7WuMNYclUFC0Kjm0/hxIdcwrfgDbG/3KMxnpNPR0qhDRFWnQLzscitthn5RKPT2AVq
	 2EnML4Y/88a6V70QvQOwMx/QAPDKPfCOX4MnWrl5fBePMENSVmXi4edtbhWAQGk55EHro
	 cMWeZqfwO0KbkGlzH6ZPvwbOiywOBFt+YnQNJSTgEeKC5oYsTFn/6daGgCv2QmEvnRqKG
	 WIeqNfYAJ25WQLQplNCMl/yZkxnPmrZ/wFYepkyuN5VX7vElonR09q4FXoipGY/Por73P
	 EL1spaHi8EEIKOYyvDoUMfJPGtai7lQU26PuIVjLu8q1rXs2hZbd5LPeHjFiG4gAStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eqpuz/BN";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F075606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F075606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqpuz/BN
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3575537b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853248; x=1795458048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=eqpuz/BNRewwnqPR7Lwmmdgpfh+V3P3GN1xkaOj9TGIfVxlvvUaeb+b61A4lFcZakD
         HKNV7dYJ5vMNhJg2Jtbs+B/yB+qpMSvukXDC7F3N2y0KoPs7/Y2DMUDHjToOQFC0fBAL
         1F3WSIjqXrRakyePJsE5t1QMuZKR/a/3H2nsMYW3k+MBDY+ry39LkA5DOakoRD0blMH+
         UWilVCKHWpXJjoyXUTyAaA94q1v22loBGudWyAzccXQGLvpgst0Jk3lXv2X7lCgf5XTq
         fQG8FEsdOvc+d50IF/heXA51aqJrZ3ReT2LM4/3aaH00qUJSwsxvMTXEuVGJP6gKVyvS
         e8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853248; x=1795458048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=TjFg935FvQfp1jaJzrJoqJbF0KYNvZpDzHsghJQoUs3d4cPGaMKCpZLz8aZIq78mDF
         XutctBiPg11jS44TTAEqYlnA/OJXzPRK2rhLzxiN+FR/BfMtrfIGwUsU/U/pH4xfXs7m
         Ix8s2/pT67Y25HLrmTMeOHLhY7B7bfknNvxM1bVfTUHqKtjelhv3Ir2mWSKWmK6kb2gF
         u9QeH91u2v/mrlQGO8tlBzICPkhhpvp9z2MG7v5YHgvUlX0VUwhTKnDL3GTWlcIOfaNF
         afadEburndjM1MOYSivYCe2miOxLtlaQ1bBFFvPkmXQtGCF7qhANLVmVXR81lw80wMmk
         2sVQ==
X-Gm-Message-State: APuU4Z/rmBOUwnSvOj4vsbRgOPfango0od+28O3ZswovAmvNQPYMQqiL
	gnLuM8XnA5/OiK+1K/Ou+qv3AE1K19hUO8R5tkXy0C34yqxwoFmBj4biXWBdWmOU
X-Gm-Gg: AYBFou0q0TRVE2Qd2IEwiOj8f0XjyW6OWBkwiNp64kqDt5YNaA4W/HHuCIgKhgKXPcR
	7YwIpvAr+xRe/6xMnIoK3TGaazuwU0cr4ReJYwDke/zScjVJOL3/nECQe7nTFXN3Cbcl+gbhT8L
	AgWFbQk1vkjiOjT7t+9M22JdpVtVBW6Gn7h8/xYplqa2aJ+Ry0qUYFgRHLukNPQDKP14UQY9ZuG
	Jbo/dndE31/50dZOKzPdkwmWNmy06QeyhBaYDi6fN4a6W29AqnGsmSf7swcyg/SWH0hfollABtK
	mUoi8Y+xgchLUVyjaxjjC5VcGTq0U+Qyp5TvtIirrZsHunUXkrXotV75t/ACU45wtxN1vasgKQZ
	Syl3m36c9AaLqe5hVZsMWpugmkCfV1RC5692Viy34+iePLaQf9cLX8mrDcEaZL8yxNUs78oLr5O
	8cRZZPMgXe7dVOWxgoHPLQIjeM8iIOu2N6n7tUhl74cbCLXBkPx9a76uDIS7XTPFhwOGUo/cw+O
	lVMf2MqWpTWLRo5SdsHOOomcWOdB+wUUtE8H2nk68exXErWJhBxzc2i68HUh2L6Al7RIHXkVb9u
	8p4bG7N8N55gSzm5y9Cse32ifABJfHRMY/zpgABMtLONLACavSOkfDz6jK/wfas8QGcrX/GhBvc
	yavA98uqbNiv7vLpZoAjK0nfKW7gTAvj3158uqf33ymOei9iC1xOFjeakzw==
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:827b:2b7e with SMTP id adf61e73a8af0-3f7a6ea143cmr11038256637.28.1794853247994;
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm4235466b3a.6.2026.11.16.10.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH net-next v3 0/3] ptp: ocp: support the WiWi production Time Card
Date: Mon, 16 Nov 2026 10:20:44 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The WiWi Time Card (2163:1008, subsystem 10ee:0007) presents its timing
peripherals behind a LitePCIe interface that requires aligned word MMIO.
Add an opt-in access mode for XIIC, test both access modes, and support
the revision 02 PCI interface in ptp_ocp. Patch 3 consumes patch 1.
Could the I2C maintainers review patches 1 and 2 for an Ack to take
them through net-next?

Changes since v2:
 - 1/3: Identify patch 3's WiWi XIIC child as the first user.
 - 2/3: Restrict the RAM-backed test to direct x86-64 MMIO. Exclude
   UML and indirect I/O; do not restrict the driver.
 - 3/3: Match the board by its PCI IDs, validate revision and geometry
   separately, and select typed XIIC data from the static board match.
   Do not expose the SPI flash through MTD or devlink. Omit unsupported
   GNSS2 interfaces, preserve external PPS2, and clarify firmware build
   reporting. Refuse timing enables until the interrupt gate is open.
   Distinguish WiWi's PCI interface from legacy Celestica.

The driver objects build for x86-64 allmodconfig with W=1. All four
XIIC KUnit cases passed on x86-64 QEMU with the same two I2C patches.
An earlier revision of the driver on a revision 02 card confirmed
64 MSI-X vectors and an advancing PHC. The new board policy and timing
guard have not been run on that card. No claim of PPS lock, UTC accuracy
or masked-event replay is made.

Codex assisted with implementation, tests and changelogs using the
board evidence, vendor revision rule and mailing-list feedback.

v2: https://lore.kernel.org/netdev/20261112163333.12523-1-ahmadexp@gmail.com/
v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  47 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  15 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++
 drivers/ptp/ptp_ocp.c                        | 242 +++++++++++++++++--
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 422 insertions(+), 37 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
