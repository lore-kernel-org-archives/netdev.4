Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635412;
	b=QihGJ1MG45qGRJlrjYLzhpz34qdqM24MFllCnz4yZuIubrTKRFjJr922BFyW7DpPA5Tx
	 LpBoP5HaXMwbJp4CkmAyYimvU7wTGFIGt3rQMJ9MJvAHApY2vGdxHu+QL+JUQ2b183E9c
	 vq8ytk5YcJi5ZePqu/zAQ8kkAi11P2+2cjPDgwOKwtOsnNBb2FC8K3HGBezuB/OTpbY4f
	 TKrqbAYfoNSRWsZCOHLMskElnH+vmYa4S5P8WMlZZ6cObyhQNp8BMpXniCyI6+pFlaA6H
	 v/68u9oKpwnJmnKYRf4UBAH0aceCn1T9xNk+2t98lTdDLiO0XzDKat63y1VRH9V9sAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
	b=QJE9mjBLRopTE+j8tOyl/6IEhBPIcRsgtmGc7y8i+9FltzGox2RBTVhK04mc4sH/zk8T
	 W+aJ7bRgM68R4emVGdN5txwgO+ht1F609yO+hWgnOno/ZXKA3qMzM10UhNZdU0Qpu9XDA
	 3K1qdfDNjibzuyrj4x1+JOuI+f5pXz09bdTR0H9sDTLZOQoiicAdJeI7VkCaq6GbMQ9re
	 JyxG5CBqv8v+m8EiLHWvNyle72h8QesF7IcZ/+rIITefM2a8KwvcBlkduQuFa9mNA/edo
	 ffpyVI/pzJ7vPJ06fjvo0F0dmrGlJIhJxqVdoOt0oDmIW1BQpoM/u9P9L/hipUXS9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237C606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2237C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3647381f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635410; x=1796240210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=aoR5T6p5un41DLJj8bVcpqBNPTQbYrGbWu4Ev/PsYHk7rJpNI5jNAWntAarThZJGVF
         B4k74T1hyoxU+baAFqCkmlPuBIsZtA6tTBndCvufKl2ASm+xAD/pRZN/8MtmOY2UHFzf
         OwKfXj/9uww3JzaYnbAyc988hyiVYIdDzrxoTwUiFm7nRLKdywEvJmPv7cA4cumbjFCE
         9uQ/zusUdpSY5hwjPX/lCvRqoiE+uOknsx1eGnr6hm4OEableV8COUWEpzyhO3uzS6Q6
         tI+oSUjJqvq3Y8Lup03ffkzA46/KApZDKOZU7SwrK7NYbCcJIsvWO3KjYiTVuJ/GahUI
         YBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635410; x=1796240210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=YxVjrUzeM2UrXpepIqTMHC6ugkAH5jGKaZivBG/lCBW3aRHcYAXw3C9Hjy5hqNJBCx
         gtjrYXWHrOQdGp+ZdNi1yyvf9EiTfhezAtE1grqtutE1ntaqFcDwmtyytN8mUXQub3F9
         eZ62JfwGvaTRK967lW1NUcgrefVVCRXyT4XQMp2qMzRmaHFKAZId2SwxnEcZ26Wxbq4N
         or5l+4FKV23eHPSEn5AmbCtAkz0PEawumjYGWdJ53s2HltnjxqTPd7yj03naKSIXyO4w
         qETPbRzV3vccxTMb44JL0Iv6g6UBekalzsQnb8SMmQUeGGujkvBmbH0rfQH1zzZo7DlP
         OShQ==
X-Forwarded-Encrypted: i=1; AL+hErErZncWDlc4JKSe7dltO01INP8SWzlSODLJcUsExeIQBoMv3Gxl+3cTNqzB2K8bKtXfmrdzkFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JvFLLfxyKyTjLq+u9x3quJMPT8EqKtVeZzwUXyeUZXe6oL+4e
	c4lk+jTD/wn2OyTJ3X0tsi6Z1AMA8e5B3i55bHZfaYrhp4F4vLNnYngZIpe51sLNFBg=
X-Gm-Gg: AZFdTZd+XaJSf8EnapC29xLS10Me6tVLz/7NTnL+AkY0xzLrF8cFb6nqx5csICVjCjO
	Nvxs2H1VDoFsVGAnIs37dzdiDZB1Pz14Bb9Owb9Y3jB3QfINWlmjl/AaHZPRYHK3FPJeIGZgVTd
	0LY3lvTh4fAsUIzQ9SDji7ViMGwendk6bOfltRsyReEkrAWDYYfjcHEmQKhqCBymOEhPE8nkgh9
	CvARqVM8VlP4e23g63aZInLT5pHgQ6uEgGgsVTu0rmGN2KcTTxFMyiWfZ5JvKfA3v+3Sb3JCI4Z
	y2lK+Uo/ahzkSIG4TIEDCNbHllfhQkT1Jqc2/4Xpi+e8FAakVpfsv0qAOvd1LSU0pIrcPUss+MW
	/DnqEUhX7YrlPaRtlIwyJ2oP4exuM9Wp78omRfuzGzAuyzPf81xD7vYL48H0qn5o/8ghooDmzN3
	Hic5Ne+oiICEUqmbxG/mRQJqEGrQLMXSirj7WiIAU7K5ITlGpTAu4T7hJZ0Xh1srmziLY9NTpqW
	qdtZgLlcxU8WOzNElGTCk6wNVKfLIKI8yY1tbDJXqXAr76dIKz3hXKLvo5WEUPElsCL1/6+PEPg
	aEI0foTW3bM6ADAxsZ1V9WddvAgDtlW9YF25uDNdJM2CrEYv2dnSU+YBQW1xh6zjyd7JxYkxCIm
	MKoZEbE1fvg==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr24341175f8f.38.1795635410326;
        Wed, 25 Nov 2026 11:36:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:49 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 0/5] net: Derive stable MAC addresses from a unique
 device ID
Date: Wed, 25 Nov 2026 23:36:37 +0400
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNy27DIBQE0F+JWJcI7gU/usp/RF1guDT0YSNwr
 FaR/72QSFWq1upypJkzF5YpBcrscXdhiZaQwzSWoB92zJ7M+Ew8uJIZCGhELyRPr6jbhk9z5Da
 eg+PvxnK0vQCFTnSdYmUaE/nwcWWPT7ecz8ML2blatXEKeZ7S5/V3kbX3z8UiueBkeokaWuEtH
 PxbiJHSfqSZ1ZMF7hnYYKAyamg9gRkk+t8MfjNSAm4wWBglbKsbZz02fzDqnlEbjCqMUwKHzoC
 WEn8y67p+Ab0IaeKhAQAA
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5804; i=alchark@flipper.net;
 h=from:subject:message-id; bh=i85cUXhyWb7m3a6ui+zF4b9HUAnpfV7UPHIO1a7Igto=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5y19/A21y7VXBHY2fcuT1DMuHaewckTewWz88TyO
 W4mG+l2TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX3njMyrF9XWXL25prW7JVf2c0qD+Ql25xfV8fvPMng3/aTB6K3/GRk+PBaRrW
 QQ/Kyc0jP60UlW0IV5zNPfRXnsrzoC6Pc+VIufgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Derive the addresses in of_get_mac_address() instead, as the last resort
after any stored address, from a "unique-id" NVMEM cell referenced by
the Ethernet controller, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v5 moves the derivation out of the OTP driver following Andrew's review
of v4. The CPU ID cell keeps returning the raw CPU ID to everyone, and
the Ethernet controller references it as its unique ID rather than as
its MAC address. The derivation is picked by the compatible of the
referenced cell, as the algorithms differ between vendors: Allwinner and
Amlogic bootloaders also derive addresses from chip IDs, each in their
own way. The addresses are indexed by the controller's "ethernetN"
alias, which is how the bootloaders assign them to interfaces. Doing it
in of_net.c lets any controller with a device tree node use it,
including PCIe ones, and needs no changes to NVMEM or to the handling of
"mac-address" cells.

On the Rockchip side, the existing CPU ID cell gets a "rockchip,cpuid"
compatible. Its location comes from the cell's reg property, so no
per-SoC data is needed, and other SoCs only need the compatible on their
CPU ID cell plus the references from their Ethernet controllers.
Controllers without an "ethernetN" alias keep getting random addresses,
as they would with the bootloaders.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived from the CPU ID, and both GMACs get them
when the kernel is booted without U-Boot proper at all (via Falcon
mode). The raw CPU ID cell remains readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Moved the derivation from the rockchip-otp driver into
  of_get_mac_address(), with the Ethernet controller referencing the CPU
  ID as a "unique-id" NVMEM cell (Andrew)
- Indexed the addresses by the controller's "ethernetN" alias instead of
  a cell argument, matching how the bootloaders assign them
- Added "unique-id" to the ethernet-controller binding
- Dropped #nvmem-cell-cells from the "rockchip,cpuid" cell
- Dropped the net change accepting longer "mac-address" cells and the
  OTP post-processor
- Did not carry over Ryan's Tested-by from v4, as the implementation
  changed
- Link to v4: https://patch.msgid.link/20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net

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
      dt-bindings: net: ethernet-controller: Allow a unique ID NVMEM cell
      net: of_net: Derive MAC addresses from a unique device ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/net/ethernet-controller.yaml          |  11 ++-
 .../bindings/nvmem/layouts/fixed-cell.yaml         |  24 +++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   5 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 110 +++++++++++----------
 net/core/of_net.c                                  | 105 +++++++++++++++++++-
 5 files changed, 200 insertions(+), 55 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

