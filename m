Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521886;
	b=OAvv8a71TeYzv6KUz5WUecM+j1S4xpdopPN+oUMH/8sOZgtvFPbpwptWsWmjeTKrx45y
	 uf2Pmh56b6X9wFg6q8DzVLGJ7m1pWUgjELFVJ+LSGN1xjKKRFpUVEpKPF5yG9jg0OS6ZM
	 38PJa0FmxDHz2PleqbFT261hEfdUmkfvEgow9vbtY4SjXhy4ZGQkHLdxjecnm/KI5EPOB
	 hj7pFmhfuj1yRZjZ6eQHKe0XCz1sJp/1sMBlMZdGQ4QOp48hJpUWufWJmY6rbMkK2u0zL
	 Ys4BPnak7xL2zgmTMh6MU95NLB96hTDHOA7D9FF672c90dUU6ebu9ikIqtRgzBkrmrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
	b=s3d0TmtzuddfhTrcwe0+EIIL9He8QbHn3pF2UaaxGkkAW/SqMTkIS4J8+gUSaSQDKp6Z
	 e6tZYSimhpE9b0g88ZqVYJFWV14CTTczAvsxiPuH8PUi8LXBNgrvWHE7S+r1IV6D4hCow
	 SuamhturVMOhS2BWfBrdj5y5XlhmNLa44IZ9L/2vW1SQwwrjDCWtD1a10lnbJdv3D6QzW
	 B4C9KzM0eqaEVM9X8HbLbUms67gf3GqlM9zD85yRDcZG59zmvoOpJa2cTpDBQ9a6cSjIH
	 xV2QoWW7GvCizJbOUTIp9nC6t5BUSST0nVNFK2I6BQcmeLkv0kAm+pmeY52GmmURqfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=NF2+m6Vb;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E88606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E88606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=NF2+m6Vb
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so38620475e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521884; x=1796126684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
        b=NF2+m6Vbb/Ug1D+a/ldFU9EQGrXiELlo04rpwApnkiLu34GxvYjjUJtg65ZsFVR/Je
         7/3dShdyOoU6ak2tO+N9w69t86DyVwHDDAX4OBJzDB8f/5FvJoJhgWCpD46lbz20xHih
         lkJhpFh7Z0hMCBakdekVjudlCH5rTq+ftQdfBVGWYQbEsQzEousqGBHFRfPUNTZha96y
         T/TXdNZSMgEEVwP4DPMkoQrfKEuqRkfSAgdlyBB59ihd4bW8iDKnpegjI35ia9tpygkd
         Btv6hdUQnZzWwQ4Kq+wsosWvFCBYgpUneznIPI9qCJMwqztYAq6EqDdZPkuGkk6AjJWI
         O/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521884; x=1796126684;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
        b=HQ4Y8eHqu6aeJz+v9JKvXIPC03NbksK4hwS2s1wSNrXfSMVXn+o/oVmep8K9tBmOpP
         6wUYrbXcdougYF/8r2VfYe3Iyr0+TPRk45aWwZgVkb3aHTkxqtHRoRr/Fhj2nlwowqp9
         DG8swP1nwGeo6589KYQkptxMrjiWs9qA3LPci8nMJ4m+nq1ZZPw2KFwpHhsWCUTBeA20
         YsV5Xt7z/FgHpDesYZLfA47ZvKXDS+1T0E7sjl8bP8qXlaVSrF1yNHksUYO1EwAODgHw
         8HCKxKB2QdIaeGFNNOZj1MEEEaqwn6dWD5L5YlJwu8gtYHSayKuRiDMfAIPhIsry1SLI
         1KIQ==
X-Forwarded-Encrypted: i=1; AL+hErGzoSLZJxIRTC8C1a3FeX7zuC6sWk9LNhePy98oaMtPlmP6uhh6X3+7V4g5sYvQTvgOa2Kzics=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b4Bt6MmxRDUh7n0qrT+03ANRZRD3LXurAxpmIkPTrMzZhaYpS
	jIAgUiFe6lUvarG3q7NItIWidu6RlScJbXFX2cbBjGt22c02hB/vAzDB/CRV7s2NoV4=
X-Gm-Gg: AZFdTZdw4DGEUjnqRXYrNjkZG032OmOxJgqqXeifW5B4ERII3V9KMC0j0XRkDc2AVDV
	NQ7KBlrEcSLiu0MMFTmpOBcSJ/F55fxuhoekY71Rb3go1jS8M5vBYhZO2YIttDy6rGqAP4G2ABd
	IBpF5PgAJYAGxifn6sL6JhPPs69xpBCw5s3e5MGy6Tl9RzuHpFU0Wfr8AIxUeYFY7gzacvxwPYS
	QGS6V7ceztcl/Gpv/irweYvXNy/APoKvbe5cd7s7oNOamRcp5As4Euw2ffZKWvjr+SdmUYUyxQo
	hQNLcqLGp2z2gXl+zl9sFmJZIKc4+4AAvqxuPnDRJg0JW1RiHQrnniaWe8qBJ9husZyYRrjdT3M
	Gim2xysqdhNoXtDLgaSJoDyKcK1mBhEVQreYpADZxYPaQaC/eNBHRHdrFbLU7TbNdfd/oUotudM
	zWtZF++dFEPytu6nezD/nK8zT3zG86qQfcGn0J6sjHJTuBtj+5W150AV+1zFLIJXCZeLgiJlZRN
	+XP2DW2nkvtPzZtDvlE4nu6lx4q18qzqrx3Clm3IaClGZEzkC9UNf366cMMVFQ5ZyGswTYSZijl
	/h5ZUMXgA9s3mDX4877llEpwVXSCzunYKSfVc9GjY5Mhs1rqv4AjHJUo+bY4XdDIPRXry80rrTb
	6g/Dnh59G92IDOwxcVdEZQe2VGT0gbA==
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr298164705e9.33.1795521884259;
        Tue, 24 Nov 2026 04:04:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:43 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v4 0/5] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Date: Tue, 24 Nov 2026 16:04:30 +0400
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNzQ6CMBAE4FcxPVvT7hYQT76H8QBlq/UHmhaIh
 vDuUkyM0RiPk8x8M7BA3lJgm8XAPPU22KaegloumD4W9YG4rabMQEAqciG5P2OSpbxpHdeusxW
 /FpqjzgUorMR6rdg0dZ6Mvc3sbv/MoStPpNtoxcbRhrbx9/m3l7H356KXXHAqcokJZMJo2JqLd
 Y78qqaWxZMe3hn4wUBkVJkZgqKUaL4ZfDFSAv5gcGKU0FmSVtpg+sGM4/gAX0gYqVoBAAA=
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5166; i=alchark@flipper.net;
 h=from:subject:message-id; bh=RZAI1HlQZY9Dqv3pbjTGomGAzes5x9527TWoirzpG/0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gbN4XpVs6iYU77HOaej5VG1CHOgc5/j27I5l9Lfz
 Q6Jjf7cMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTHfWH4Z110punTySyFR9LZkiW50ScMGTYLXMs0WMd9weJ2FMvy34wMk8IiDQz
 ebzNwuM1rF3F8+9O9XIcyrf3OFC73yt1b1HqSDwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and implement it in the
Rockchip OTP driver, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v3 is a redesign following the v2 discussion. Instead of a separate
SoC-specific NVMEM layout, which could not coexist with the fixed layouts
already used by RK3528, RK3562 and RK356x, the existing CPU ID cell gets
a "rockchip,cpuid" compatible. Referencing it as a "mac-address" cell
selects the derived address, while any other reference keeps getting the
raw CPU ID. The CPU ID location comes from the cell's reg property, so
no per-SoC data is needed, and other SoCs only need the compatible on
their CPU ID cell plus the GMAC references. This is similar to the
behavior already present upstream in drivers/nvmem/imx-ocotp.c.

Plain "mac-base" does not fit here: its argument is an offset added to
the base address, whereas the existing Rockchip derivation used by the
bootloaders XORs the index into the last octet.

Patch 2 lets the generic NVMEM MAC address helpers accept a cell longer
than six bytes and use its first six. NVMEM cells have a fixed size, so
the OTP driver writes the derived address into the start of the 16-byte
CPU ID cell for MAC address consumers, while the cell keeps its full
size for everyone else.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode). The raw CPU ID cell remains
readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v4:
- Dropped the NVMEM core change letting post-processing shorten the
  output, as cells have a fixed size (Srinivas)
- Added a net change letting the NVMEM MAC address helpers take the
  first six bytes of a longer cell instead
- Made the OTP post-processor write the address into the first six
  bytes of the CPU ID cell, keeping its size
- Link to v3: https://patch.msgid.link/20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net

Changes in v3:
- Dropped the OTP read serialization patch, applied separately
- Replaced the SoC-specific NVMEM layout with a "rockchip,cpuid"
  compatible on the existing CPU ID fixed cell, so that it works
  alongside other fixed cells (Ricardo) and needs no per-SoC table (Ryan)
- Moved the derivation into the rockchip-otp driver's cell fixup hook,
  which also makes the layout module unload issue moot (Sashiko)
- Made #nvmem-cell-cells required for the new compatible (Sashiko)
- Dropped the dead match data and address validity checks (Srinivas)
- Allowed MAC address indices up to 255 rather than just 0 and 1
- Added an NVMEM core change letting post-processing shorten the output
- Moved the RK3576 OTP cells into a fixed layout
- Dropped Miquel's Reviewed-by from the driver patch, as the code moved
- Link to v2: https://patch.msgid.link/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net

Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (5):
      dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
      net: Accept MAC addresses from longer NVMEM cells
      nvmem: rockchip-otp: Derive MAC addresses from the CPU ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  33 ++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   6 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 111 +++++++++++----------
 drivers/nvmem/Kconfig                              |   4 +-
 drivers/nvmem/rockchip-otp.c                       |  48 +++++++++
 net/core/of_net.c                                  |   4 +-
 net/ethernet/eth.c                                 |   5 +-
 7 files changed, 155 insertions(+), 56 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

