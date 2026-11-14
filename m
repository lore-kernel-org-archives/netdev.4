Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663404;
	b=tVk6uIGJqGll6yjTm8wqv2hWsZr+qubu1B2wFjUn5jSKZoy8UciEbSJDeqp8ivJBzXZ+
	 pthvbwZFXdOX+fChRp4BA25h1NStUqHnJ3vBYvhJ3Iu2k8rwmrQ+zHqsa5PKMnG3vmeuE
	 ZD+hTijvnf5eG0QOX/5SvAxz3RrKqeWkETIT1XHCQF7cbb/U3LLG8Vh0lT6Yz8RckbYLY
	 fuxgJuTDjpCpsT/mjBL3xKtxMMiTFHI7j5xJ9FmyFQcUlOB6V/h25xBYIjcNL267c4Umi
	 lGcMOp4oOaX3s10fh6EIgG+nw2N9MVjW0IbSVYeYDyjyYFLmFq21VcZt2b5k42BTfPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ViFElE6h94s8HoQw18njViets9yDg/OZ/UPZz5/1zOs=;
	b=MGkZHHjAhb1pMXj6zC5fzLWPn33vxS5SMBNGs79AaEf0PN4bwVlbCcseq9MnuBe9/f3+
	 X4dOfquIYUXFdITsACIxxrifyZsvmqm2gCNkcERI7c3TXmvEamvm2Mtx+fzID3jHDWUNA
	 Bodt8vy8Ta+VuvWarYMi1M7i9VjfkZYobui5GxeDNjvcyb1bGPpdhxz9FDZQWswKeQbq5
	 eHJkT6XcXy+F/YfKfLgHsZzhgujHgEaM/JARnGHj6T7UjDDNSY+qMCnpsmmKzEcC0rjLu
	 Ibvw2nkRyKNHdcWkQmHz68J5D4pa5P0p4SBeXCK0K2uyWq4uzSM5XasQXIf/4GKuhqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=hl4cow0m;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A51606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=hl4cow0m
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4922523d1afso913331f8f.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663402; x=1795268202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViFElE6h94s8HoQw18njViets9yDg/OZ/UPZz5/1zOs=;
        b=hl4cow0mSFUSJXAnI7ybCYZAnRkDLdLj994HFR0loT9AqVtKqCVPzifHr0z2MwSb7N
         P5M1hUE7GWS+mn30Re6+AQqT6YU9cBHVAmrWhG0B3rLqKhlIVcJGLUsK/ZB1K6eNhE+7
         opjo8c192nDkycJoFM1Fes58QtzbhFEmBwL/fj79N/4FYHyBXg4Vfa1gLy7OtX1eCfmk
         FAjKbL7Iz6s51tcAW4dsldYS0gWuVFn2sfEu+6LJBvUs22H/S+4NdDDITjpPILWE3ePe
         /+9J5Jg6rni+LAu5AIf1lW/TnbXt9n22Q7saGtM8SVY2TirsF2c/DBr+wRbYO7laRaCT
         wcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663402; x=1795268202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViFElE6h94s8HoQw18njViets9yDg/OZ/UPZz5/1zOs=;
        b=D5TWO6Htyh6jqeS8IkzrKez/Y3rY0Nk+0Wrp1liU/HnRiacYNe4v1iXHxnuMuuiQ4h
         0+aopv8zHwyfEEHj06dqCZeMA6M+zAD1B55m+ViXJeSsgsWSqqEDEvYXmyKc2eGy+GZ3
         43rksr5U9KPPWuCCMvuxQJMMI2LbYktfLlMg/ClBf4Db2DQTGXGiPL8ZlTjfGosZEvpq
         8Z6vKzFAV2jnPBaAaLtl+YQQj4pnkWR3NeOptu0U31tNYBUixBYKD2WI9/X2csNnNevO
         ctrD/IAc0fDP/B+PAHQzH/jLHGWjCSs6U1NpEf+3imCalGrswFEMZMdltcxFwHPGCn1z
         LhUQ==
X-Gm-Message-State: APuU4Z92cJToC0cNZOZeO8tQrOKQnQOvIMg5LtnOaBRxWhClrOLNSrd9
	G557ViQBWJxbpxyR0bvC5FdhrV5qwkpVa0NtmeL+nSP88ndq5wqCJJrgo/LHB+NgPNPeCT3uqi8
	U5kFHOKCBMg==
X-Gm-Gg: AYBFou3WG8CJzP/58Z8U2wtIlAXCdd6bQZ0OdbfFBCban6jhjahTPI+w/4W2IorMosW
	bqW0Ho2q8ahIt+jzUnIppQSQKOukhV4margcHn2RLCBQ+YlI6qmUV4jrPurBkWyeKPvQCh6RoC+
	VRckZgGY3y3hPzDCIXB44u+nL0WgYmLlz/ePdhLm1e9dcXgVNrV4YXiPPVuuL4IcFs6DNguo21J
	paqiGCO0grrzjpi6YbPfMKuujVjNV+Lb5fwIxGgKIOCN00xlzswjQnqAzDe1C6DLyWEc+LOPPeH
	Vk65unWxAl0j5Ygj0DWc0rhIOOucXlFav95j+LtyzXAQRqCcnBN8Gv35+t6HVqhKv/ImSknzKM3
	EWrVJcK8Fyla2yodvmzta3aLVAgNAKqSQYe/QAlMGZEOsPdnNycJxh68PcjaCxoHFpGg2u4yPyL
	fljxkoJd5+KFl85WxeCioMVAZTCEQbuOT5ghqucS1SbNJWXZgSBBDRYDvvv8cxIJUP5YFZVfCYv
	T1ynFCKreZz1JbcpgS9BXqNmk4fB7TJtXb6IaS2H44gE5isi6e6s1UHLApKlK+uaKy2LpwEcUIF
	8zo8Jet50n2W24azhJdI3BA9ER1KBVcVpU7Nw7S49fpR3w0=
X-Received: by 2002:a05:6000:469c:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-49c73ce5e97mr8197050f8f.35.1794663402282;
        Sat, 14 Nov 2026 05:36:42 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:41 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH net v3 0/3] net: stmmac: deliver frames with Rx checksum errors to the stack
Date: Sat, 14 Nov 2026 14:36:36 +0100
Message-ID: <20261114133640.3285413-1-opensource@grische.xyz>
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

On dwmac1000 the MAC drops every frame that fails Rx checksum validation
before the driver sees it. The enhanced descriptor parser would discard
such a frame even if the MAC delivered it. As a result, a VXLAN tunnel
over IPv6 with zero UDP checksums receives nothing while Rx checksum
offload is on, and neither rx_dropped nor rx_errors shows the loss.
Patches 2 and 3 deliver these frames with CHECKSUM_NONE instead, as
commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from dropping
checksum-error packets") did for dwmac4.

Patch 1 makes the AF_XDP zero-copy Rx path honour the checksum error
status. That path already receives such frames on dwmac4, and patches
2 and 3 make them reach it on dwmac1000 as well. Patch 3 depends on
patches 1 and 2.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) on the net tree, with
and without the series.

Not tested:

- Patch 1 was only compile-tested, as an AF_XDP zero-copy setup was not
  available.
- dwmac-loongson, which also uses dwmac1000_dma_ops.
- Cores with normal descriptors, such as Rockchip RK3288, RK3328 and
  RK3399.

Changes in v3:

- Move code comment of DMA_CONTROL_DT on the line of the define, similar
  to the original version in commit 47dd7a540b8a ("net: add support for
  STMicroelectronics Ethernet controllers.").

Changes in v2:

- Rebase on net, where commit 834ec9530832 ("net: stmmac: drop split
  frames on AF_XDP zero-copy RX") fixed the multi-buffer issue that
  Sashiko raised in the v1 review.
- Drop RDES0_LENGTH_ERROR from the Error Summary mask in patch 2, as
  the bit does not contribute to Error Summary and the length check
  further down discards such a frame anyway.
- Explain in the commit message of patch 2 why RDES0 bit 7 is not
  treated as an L2 error.
- Set DMA_CONTROL_DT in patch 3 only with enhanced descriptors, as
  the normal descriptor parser does not report a checksum-only error.

v2: https://lore.kernel.org/netdev/20261104151914.2651241-1-opensource@grische.xyz/
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/

Christian Schmidbauer (3):
  net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
  net: stmmac: dwmac1000: don't discard frames with only a checksum
    error
  net: stmmac: dwmac1000: stop hardware from dropping checksum-error
    packets

 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c      | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 8 +++++---
 4 files changed, 18 insertions(+), 8 deletions(-)


base-commit: 241dec6f9ab74d8c3ef246764f3611666b96b9e1
-- 
2.54.0

